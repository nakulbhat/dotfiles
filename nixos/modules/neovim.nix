{ config, pkgs, ... }:
{
        environment.systemPackages = with pkgs; [
                emmet-ls
                basedpyright
                neovim
                black
                isort
                stylua
                ltex-ls-plus
                clang-tools
                tree-sitter
                pyright
                lua-language-server
        ];
}

