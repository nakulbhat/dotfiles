{ config, pkgs, ... }:
{
        environment.systemPackages = with pkgs; [
                wl-clipboard
                oh-my-posh
                rip2
                ripgrep
                zoxide
                pandoc
                curl
                power-profiles-daemon
                yazi
                zathura
                wget
                lxqt.lxqt-policykit
                font-awesome
                nerd-fonts.jetbrains-mono
                bat
                gnumake
                fzf
                fd
                tmux
                pinentry-curses
                gnupg
                jq
        ];
        programs.gnupg.agent = {
                enable = true;
        };
        programs.zsh.enable = true;
        programs.zsh.syntaxHighlighting.enable = true;
        programs.zsh.autosuggestions.enable = true;
        users.defaultUserShell = pkgs.zsh;
}
