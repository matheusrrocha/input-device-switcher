#!/bin/bash

SWITCH_AUDIO_SOURCE="/opt/homebrew/bin/SwitchAudioSource"

if [ -z "$1" ]; then
    echo "Usage: $0 \"Device Name\""
    exit 1
fi

MICROPHONE="$1"

while true; do
    CURRENT_INPUT=$($SWITCH_AUDIO_SOURCE -t input -c)
    AVAILABLE_DEVICES=$($SWITCH_AUDIO_SOURCE -t input -a)

    # Check if the desired microphone is available
    if echo "$AVAILABLE_DEVICES" | grep -q "$MICROPHONE"; then
        if [ "$CURRENT_INPUT" != "$MICROPHONE" ]; then
            $SWITCH_AUDIO_SOURCE -t input -s "$MICROPHONE"
        fi
    else
        echo "Device '$MICROPHONE' not available. Skipping change."
    fi

    sleep 5
done
