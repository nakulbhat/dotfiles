{ config, pkgs, ... }:
{
        users.users.nakul = {
                isNormalUser = true;
                description = "nakul";
                extraGroups = [ "networkmanager" "wheel" ];
                packages = with pkgs; [
                        kdePackages.kate
                        #  thunderbird
                ];
        };
}
