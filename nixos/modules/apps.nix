{ config, pkgs, ... }:
{
        environment.systemPackages = with pkgs; [
                yazi
                zathura
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

