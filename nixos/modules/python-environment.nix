{ config, pkgs, ... }:
{
        environment.systemPackages = with pkgs; [
                (python3.withPackages (python-pkgs: with python-pkgs; [
                        pandas
                        flask
                        cairosvg
                        jupyter
                        flask-limiter
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
