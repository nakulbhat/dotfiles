{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    wl-clipboard
      neovim
      git
      vscodium
      pinentry-curses
      gnupg
      jq
      gnumake


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
}
