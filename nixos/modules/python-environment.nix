{ config, pkgs, ... }:
{
        environment.systemPackages = with pkgs; [
                (python3.withPackages (python-pkgs: with python-pkgs; [
                        pandas
                        notebook
                        matplotlib
                        virtualenv
                        numpy
                        requests
                ]))  
        ];
}
