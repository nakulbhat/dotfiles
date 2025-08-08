import getpass, subprocess

def _gain_sudo_privileges():
    password = getpass.getpass("sudo password:")
    _command = ['sudo', '-S', 'echo']
    subprocess.run(_command, check=True, input=f'{password}'.encode())

def check_sudo_privileges():
    subprocess.run(['sudo', '-S', 'echo'], input='\n\n\n'.encode(), check=True)
