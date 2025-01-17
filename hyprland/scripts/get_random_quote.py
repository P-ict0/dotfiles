#!/usr/bin/env python3
import json
import random
import sys


def get_random_quote():
    quotes = [
        "This too shall pass.",
        "If you refuse to accept anything but the best you very often get it.",
        "Trust the proccess.",
        "Make it happen.",
        "Make it count.",
        "Do the hard work, especially when you don't want to.",
        "Take what you have and do the best you can with that.",
        "Focus on the future, attention on the present.",
    ]
    random_quote = random.choice(quotes)

    output = {
        "text": f"<b>{random_quote}</b>",
        "class": "quotes",
        "alt": "random-quote",
    }
    sys.stdout.write(json.dumps(output) + "\n")
    sys.stdout.flush()

    return True


if __name__ == "__main__":
    get_random_quote()
