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

    hardware.graphics.enable = true;
    services.xserver.videoDrivers = [ "nvidia" ];
    hardware.nvidia.open = true;  # see the note above
nix.settings = {
  substituters = [ "https://cache.nixos-cuda.org" ];
  trusted-public-keys = [ "cache.nixos-cuda.org:74DUi4Ye579gUqzH4ziL9IyiJBlDpMRn9MBN8oNan9M=" ];
};
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    # These are *minimum* for Python + PyTorch CPU
    stdenv.cc.cc
    zlib
    glib
    openssl
    bzip2
    xz
    libffi
    ncurses
    readline
    sqlite
  ];

    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    system.stateVersion = "25.05"; 

}
