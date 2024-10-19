#!/usr/bin/env python3
import gi

gi.require_version("Playerctl", "2.0")
from gi.repository import Playerctl, GLib
import argparse
import logging
import sys
import signal
import json
import random

logger = logging.getLogger(__name__)
quote_timer_id = None  # Global variable to keep track of the quote timer

def get_random_quote():
    quotes = [
        "This too shall pass.",
        "I use Arch, btw.",
        "Criticism comes easier than craftsmanship.",
        "I owe the public nothing.",
        "Call on God, but row away from the rocks.",
        "Something unpleasant is coming when men are anxious to tell the truth.",
        "No good deed comes unpunished.",
        "All laws are simulations of reality.",
        "Violence is a sword that has no handle -- you have to hold the blade.",
        "If you refuse to accept anything but the best you very often get it.",
        "Keep going, you're doing great!.",
        "Believe in yourself.",
        "Success starts with the first step.",
        "Stay positive, work hard, make it happen.",
        "Dream big, work hard.",
        "Every day is a fresh start.",
        "Small progress is still progress.",
        "Make today count.",
        "Embrace the journey.",
        "Do the hard work, especially when you don't want to.",
    ]
    random_quote = random.choice(quotes)

    output = {
        "text": f"<b>{random_quote}</b>",
        "class": "no-player",
        "alt": "No Player",
    }
    sys.stdout.write(json.dumps(output) + "\n")
    sys.stdout.flush()

    return True


def write_output(track, artist, playing, player):
    logger.info("Writing output")

    output = "" if playing else "  "

    if len(track) + len(artist) > 100:
        track = f"{track[:60]}..."

    if track and not artist:
        output = f"{output}  <b>{track}</b>"
    elif track and artist:
        output = f"{output}  <i>{artist}</i> - <b>{track}</b>"
    else:
        output = "<b>Nothing playing</b>"

    output = {
        "text": output,
        "class": "custom-" + player.props.player_name,
        "alt": player.props.player_name,
    }

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
        stop_quote_timer()  # Stop quotes when a player appears
        init_player(manager, player)
    else:
        logger.debug("New player appeared, but it's not the selected player, skipping")


def on_player_vanished(manager, player, loop):
    logger.info("Player has vanished")
    get_random_quote()
    start_quote_timer(loop)

def start_quote_timer(loop):
    global quote_timer_id
    # Every 10 minutes
    quote_timer_id = GLib.timeout_add_seconds(600, get_random_quote, priority=GLib.PRIORITY_DEFAULT)

def stop_quote_timer():
    global quote_timer_id
    if quote_timer_id:
        GLib.source_remove(quote_timer_id)
        quote_timer_id = None

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
        get_random_quote()
        start_quote_timer(loop)

    loop.run()


if __name__ == "__main__":
    main()
