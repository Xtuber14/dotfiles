#!/bin/sh

# Get the current input method from Fcitx5 via DBus
INPUT=$(qdbus6 org.fcitx.Fcitx5 /controller org.fcitx.Fcitx.Controller1.CurrentInputMethod)

if [[ "$INPUT" == "mozc" ]]; then
    echo "日本語"
elif [[ "$INPUT" == "kbd-it" ]] || [[ "$INPUT" == "it" ]]; then
    echo "IT"
elif [[ "$INPUT" == "" ]]; then
    echo "NONE"
else
    # Fallback to show the raw ID if it's something else
    echo "$INPUT"
fi
