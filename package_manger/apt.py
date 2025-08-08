from utilities import check_if_installed, check_sudo_privileges, add_to_env_path
import subprocess, os
from pathlib import Path
import yaml
from pathlib import Path

__YAML_FILE= Path(__file__).parent/'dependencies.yml'
with open(__YAML_FILE) as f:
    __DEPENDENCIES = yaml.safe_load(f)


def _apt_update():
    check_sudo_privileges()
    update_command = ["sudo", "apt", "update"]
    subprocess.run(update_command)
            
def apt_install(*args):
    _apt_update()
    _install_command = ['sudo', 'apt', 'install', '-y']
    subprocess.run(_install_command+list(args))

