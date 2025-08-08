from .apt import apt_install
import subprocess

def install_zsh():
    apt_install('zsh')
    
    subprocess.run("""\
          sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
          """, shell=True)