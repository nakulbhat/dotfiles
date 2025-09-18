{ config, pkgs, ... }:
{
        environment.systemPackages = with pkgs; [
                (python3.withPackages (python-pkgs: with python-pkgs; [
                        pandas
                        jupyter
                        notebook
                        matplotlib
                        opencv-python
                        pyspark
                        virtualenv
                        nbclassic
                        jupyter-console
                        scikit-learn
                        numpy
                        rdkit
                        requests
                ]))  
        ];
}
