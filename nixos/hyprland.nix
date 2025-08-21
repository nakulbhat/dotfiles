{ config, pkgs, ... }:
{
# Display Manager Config
    services.displayManager.ly.enable = true;
    services.displayManager.ly.settings = {
        bigclock = "true";
        animation = "matrix";
    };

    programs.nm-applet.enable = true;
    environment.systemPackages = with pkgs; [
        mako
            tofi
            networkmanagerapplet
            waybar
            hyprpaper
            pamixer
            brightnessctl
            kitty
            libnotify
            grim 
            slurp
    ];

    services.dbus.enable = true;

    programs.hyprland = {
        enable = true;
        xwayland.enable = true;
    };

    environment.sessionVariables = {
        WLR_NO_HARDWARE_CURSORS = "1";
        NIXOS_OZONE_WL = "1";
    };

    hardware = {
        opengl.enable = true;
        nvidia.modesetting.enable = true;
    };

# Select internationalisation properties.
    i18n.defaultLocale = "en_IN";

    i18n.extraLocaleSettings = {
        LC_ADDRESS = "en_IN";
        LC_IDENTIFICATION = "en_IN";
        LC_MEASUREMENT = "en_IN";
        LC_MONETARY = "en_IN";
        LC_NAME = "en_IN";
        LC_NUMERIC = "en_IN";
        LC_PAPER = "en_IN";
        LC_TELEPHONE = "en_IN";
        LC_TIME = "en_IN";
    };

}
