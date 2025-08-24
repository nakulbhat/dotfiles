{ config, pkgs, ... }:
{
        environment.systemPackages = with pkgs; [
                wl-clipboard
                neovim
                git
                tmux
                vscodium
                pinentry-curses
                gnupg
                jq
                gcc
                gdb
                gnumake
                ltex-ls-plus
                clang-tools
                pyright
                lua-language-server
                oh-my-posh
                (python3.withPackages (python-pkgs: with python-pkgs; [
                        pandas
                        jupyter
                        notebook
                        nbclassic
                        jupyter-console
                        scikit-learn
                        numpy
                        rdkit
                        requests
                ]))  
        ];
        programs.zsh.enable = true;
        programs.zsh.syntaxHighlighting.enable = true;
        programs.zsh.autosuggestions.enable = true;
        users.defaultUserShell = pkgs.zsh;

}
