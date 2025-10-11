{ config, pkgs, ... }:

{
        imports =
                [ 
                        ./hardware-configuration.nix
                        ./modules/apps.nix
                        ./modules/dev-utils.nix
                        ./modules/hyprland.nix
                        ./modules/neovim.nix
                        ./modules/python-environment.nix
                        ./modules/shell.nix
                        ./modules/users.nix
                ];

        boot.loader.systemd-boot.enable = true;
        boot.loader.efi.canTouchEfiVariables = true;

        networking.hostName = "nixos"; 
        networking.wireless.iwd.enable = true;

        time.timeZone = "Asia/Kolkata";

        nix.settings.experimental-features = [ "nix-command" "flakes" ];
        system.stateVersion = "25.05"; 

}
