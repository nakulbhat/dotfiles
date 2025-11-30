{ config, pkgs, ... }:
{
    environment.systemPackages = with pkgs; [
        iwgtk
        gh
        rclone
        pavucontrol
        alsa-utils
        yazi
        pympress
        zathura
        inkscape
        zotero
        typst
        texlive.combined.scheme-full
        vlc
        youtube-music
    ];
    nixpkgs.config.allowUnfree = true;
    programs.firefox.enable = true;

    services.printing.enable = true;

    services.desktopManager.plasma6.enable = true;

    programs.thunar.enable = true;
    programs.xfconf.enable = true; # persist settings for Thunar
    programs.thunar.plugins = with pkgs.xfce; [
        thunar-archive-plugin
        thunar-volman
    ];

    services.pipewire = {
        enable = true;        
        alsa.enable = false;  
        pulse.enable = false;
    };
    hardware.pulseaudio.enable = true;
    hardware.pulseaudio.support32Bit = true; 
}

