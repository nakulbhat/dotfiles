{ config, pkgs, ... }:
{
        environment.systemPackages = with pkgs; [
                wl-clipboard
                ripgrep
                neovim
                black
                isort
                git
                tmux
                vscodium
                pinentry-curses
                gnupg
                jq
                gcc
                gdb
                gnumake
                nodejs_24
                stylua
                ltex-ls
                clang-tools
                tree-sitter
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
