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
        services.pulseaudio.enable = false;
        security.rtkit.enable = true;
        services.pipewire = {
                enable = true;
                alsa.enable = true;
                alsa.support32Bit = true;
                pulse.enable = true;
        };
}

