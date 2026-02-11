{ config, lib, pkgs, ... }:
{
    environment.systemPackages = with pkgs; [
        wl-clipboard
        oh-my-posh
        gcalcli
        unzip
        zip
        poppler-utils
        rip2
        ripgrep
        zoxide
        pandoc
        curl
        entr
        power-profiles-daemon
        yazi
        zathura
        wget
        lxqt.lxqt-policykit
        font-awesome
        bat
        gnumake
        fzf
        fd
        tmux
        pinentry-curses
        gnupg
        jq
        tmux-sessionizer
    ];
    programs.gnupg.agent = {
        enable = true;
    };
    programs.zsh.enable = true;
    programs.zsh.syntaxHighlighting.enable = true;
    programs.zsh.autosuggestions.enable = true;
    users.defaultUserShell = pkgs.zsh;
    environment.sessionVariables = {
        SHELL = lib.getExe pkgs.zsh;
    };
    nix.settings = {
        substituters = [
            "https://cache.nixos-cuda.org"
        ];
        trusted-public-keys = [
            "cache.nixos-cuda.org:74DUi4Ye579gUqzH4ziL9IyiJBlDpMRn9MBN8oNan9M="
        ];
    };
}
