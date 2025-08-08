from utilities import check_if_installed, check_sudo_privileges, add_to_env_path
import subprocess, os
from pathlib import Path
from .apt import __DEPENDENCIES

__TEX_TEMPORARY_PATH = Path(__file__).parent/'tex_live_install_files'
    
def install_texlive(): 
    check_if_installed(__DEPENDENCIES['tex-live'])
    
    if not os.path.exists(__TEX_TEMPORARY_PATH):
        os.makedirs(__TEX_TEMPORARY_PATH)
        
    tex_installer_file_name = __TEX_TEMPORARY_PATH / "install-tl-unx.tar.gz"
    tex_installer_remote = "https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz"
    subprocess.run(['curl', '-L', '-o', tex_installer_file_name, tex_installer_remote])
    
    subprocess.run(f'tar xf {tex_installer_file_name} -C {__TEX_TEMPORARY_PATH}', shell=True, check=True)
    installer_dir = next(__TEX_TEMPORARY_PATH.glob('install-tl-*'))
    installer_script = installer_dir / 'install-tl'
    subprocess.run([installer_script], cwd=installer_dir, check=True)
    
    tl_year = installer_dir.name.split('-')[-1][:4]
    add_to_env_path(f"/usr/local/texlive/{tl_year}/bin/x86_64-linux")
    

