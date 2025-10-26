#!/usr/bin/env bash

CARD="alsa_card.pci-0000_00_1f.3-platform-skl_hda_dsp_generic"
PROFILE="HiFi (HDMI1, HDMI2, HDMI3, Headphones, Mic1, Mic2)"
SINK="alsa_output.pci-0000_00_1f.3-platform-skl_hda_dsp_generic.HiFi__Headphones__sink"

# Set card profile to headphones
pactl set-card-profile "$CARD" "$PROFILE"

# Move all current audio streams to the headphones sink
for INPUT in $(pactl list short sink-inputs | awk '{print $1}'); do
    pactl move-sink-input "$INPUT" "$SINK"
done

# Unmute and set volume
pactl set-sink-mute "$SINK" 0
pactl set-sink-volume "$SINK" 100%
