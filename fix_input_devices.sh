#!/bin/bash

SWITCH_AUDIO_SOURCE="/opt/homebrew/bin/SwitchAudioSource"

if [ -z "$1" ]; then
    echo "Usage: $0 \"Device Name\""
    exit 1
fi

MICROPHONE="$1"

while true; do
    CURRENT_INPUT=$($SWITCH_AUDIO_SOURCE -t input -c)

    if [ "$CURRENT_INPUT" != "$MICROPHONE" ]; then
        $SWITCH_AUDIO_SOURCE -t input -s "$MICROPHONE"
    fi

    sleep 5
done
