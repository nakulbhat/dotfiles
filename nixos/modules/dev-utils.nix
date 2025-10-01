{ config, pkgs, ... }:
{
        environment.systemPackages = with pkgs; [
                git
                go
                hugo
                hadoop
                lazygit
                jdk11
                spark
                gcc
                gdb
                gnumake
                nodejs_24
        ];
}
