{ config, pkgs, ... }:
{
    environment.systemPackages = with pkgs; [
        iwgtk
        rclone
        yazi
        zathura
        krusader
        inkscape
        zotero
        texlive.combined.scheme-full
        vlc
        youtube-music
    ];
    nixpkgs.config.allowUnfree = true;
    programs.firefox.enable = true;

    services.printing.enable = true;

    services.desktopManager.plasma6.enable = true;


    # Either disable PipeWire completely or just audio
    services.pipewire = {
        enable = true;        # if you want PipeWire for video or MIDI
        alsa.enable = false;  # disable PipeWire ALSA
        pulse.enable = false; # disable PipeWire PulseAudio replacement
    };
    hardware.pulseaudio.enable = true;
    hardware.pulseaudio.support32Bit = true; 
}

