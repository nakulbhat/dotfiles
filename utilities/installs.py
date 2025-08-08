import subprocess
import os

def check_if_installed(list_of_dependencies=None):
    """Check if a program is installed with _check_command"""
    _check_command = 'which'
    print(f"checking if {list_of_dependencies} are installed")
    for _program in list_of_dependencies:
        install_path = subprocess.run([_check_command, _program], capture_output=True).stdout.decode()
        if not install_path:
            raise RuntimeError(_program + " installation not found")
        else:
            print(_program, " found")


def add_to_env_path(*args):
    """
    Adds one or more paths to the current process's PATH environment variable.
    
    TODO: add a way to append to bash or zsh rcs
    """
    for path in args:
        # Check if the path is not already in the PATH to avoid duplicates
        if path not in os.environ.get('PATH', '').split(os.pathsep):
            # Prepend the new path to the existing PATH
            os.environ['PATH'] = f"{path}{os.pathsep}{os.environ.get('PATH', '')}"
            print(f"Added '{path}' to PATH.")
        else:
            print(f"Path '{path}' is already in PATH. Skipping.")
    
