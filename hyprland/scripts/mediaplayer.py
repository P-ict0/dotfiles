#!/usr/bin/env python3
import gi

gi.require_version("Playerctl", "2.0")
from gi.repository import Playerctl, GLib
import argparse
import logging
import sys
import signal
import json

logger = logging.getLogger(__name__)
quote_timer_id = None  # Global variable to keep track of the quote timer


def write_output(track, artist, playing, player):
    logger.info("Writing output")

    output = "" if playing else "  "
    max_length = 70  # Maximum combined length of track + artist

    # Calculate the total length and truncate track if necessary
    total_length = len(track) + len(artist)
    if total_length > max_length:
        available_length = max(0, max_length - len(artist))
        track = (
            f"{track[:available_length]}..." if len(track) > available_length else track
        )

    # Generate the output based on the presence of track and artist
    if track and not artist:
        output = f"{output}  <b>{track}</b>"
    elif track and artist:
        output = f"{output}  <i>{artist}</i> ~ <b>{track}</b>"
    else:
        output = "<b>Nothing playing</b>"

    # Prepare the output dictionary
    output = {
        "text": output,
        "class": "custom-" + player.props.player_name,
        "alt": player.props.player_name,
    }

    # Write the output as JSON to stdout
    sys.stdout.write(json.dumps(output) + "\n")
    sys.stdout.flush()


def on_play(player, status, manager):
    logger.info("Received new playback status")
    on_metadata(player, player.props.metadata, manager)


def on_metadata(player, metadata, manager):
    logger.info("Received new metadata")
    track = ""
    artist = ""
    playing = False

    if player.get_artist() != "" and player.get_title() != "":
        track = f"{player.get_title()}"
        artist = f"{player.get_artist()}"
    else:
        track = player.get_title()

    if track and player.props.status == "Playing":
        playing = True

    write_output(track, artist, playing, player)


def on_player_appeared(manager, player, selected_player=None):
    global quote_timer_id
    if player is not None and (
        selected_player is None or player.name == selected_player
    ):
        init_player(manager, player)
    else:
        logger.debug("New player appeared, but it's not the selected player, skipping")


def on_player_vanished(manager, player, loop):
    logger.info("Player has vanished")
    output = {
        "text": "  Spotify",
        "class": "custom-nothing-playing",
        "alt": "spotify-closed",
    }

    sys.stdout.write(json.dumps(output) + "\n")
    sys.stdout.flush()


def init_player(manager, name):
    logger.debug("Initialize player: {player}".format(player=name.name))
    player = Playerctl.Player.new_from_name(name)
    player.connect("playback-status", on_play, manager)
    player.connect("metadata", on_metadata, manager)
    manager.manage_player(player)
    on_metadata(player, player.props.metadata, manager)


def signal_handler(sig, frame):
    logger.debug("Received signal to stop, exiting")
    sys.stdout.write("\n")
    sys.stdout.flush()
    # loop.quit()
    sys.exit(0)


def parse_arguments():
    parser = argparse.ArgumentParser()

    # Increase verbosity with every occurrence of -v
    parser.add_argument("-v", "--verbose", action="count", default=0)

    # Define for which player we're listening
    parser.add_argument("--player")

    return parser.parse_args()


def main():
    arguments = parse_arguments()
    player_found = False

    # Initialize logging
    logging.basicConfig(
        stream=sys.stdout,
        level=logging.DEBUG,
        format="%(name)s %(levelname)s %(message)s",
    )

    # Logging is set by default to WARN and higher.
    # With every occurrence of -v it's lowered by one
    logger.setLevel(max((3 - arguments.verbose) * 10, 0))

    # Log the sent command line arguments
    logger.debug("Arguments received {}".format(vars(arguments)))

    manager = Playerctl.PlayerManager()
    loop = GLib.MainLoop()

    manager.connect(
        "name-appeared", lambda *args: on_player_appeared(*args, arguments.player)
    )
    manager.connect("player-vanished", lambda *args: on_player_vanished(*args, loop))

    signal.signal(signal.SIGINT, signal_handler)
    signal.signal(signal.SIGTERM, signal_handler)
    signal.signal(signal.SIGPIPE, signal.SIG_DFL)

    for player in manager.props.player_names:
        if arguments.player is not None and arguments.player != player.name:
            logger.debug(
                "{player} is not the filtered player, skipping it".format(
                    player=player.name
                )
            )
            continue

        init_player(manager, player)
        player_found = True

    # If no player is found, generate a random string and display it
    if not player_found:
        output = {
            "text": "  Spotify",
            "class": "custom-nothing-playing",
            "alt": "spotify-closed",
        }

        sys.stdout.write(json.dumps(output) + "\n")
        sys.stdout.flush()

    loop.run()


if __name__ == "__main__":
    main()
