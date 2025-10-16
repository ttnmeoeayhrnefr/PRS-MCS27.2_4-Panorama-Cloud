import subprocess
import sys

if len(sys.argv) < 2:
    print("Usage: python3 mon_script.py <nom_du_repo>")
    sys.exit(1)

nom_repo = sys.argv[1]

subprocess.run(["terraform", "init"], check=True)

subprocess.run([
    "terraform", 
    "apply", 
    "-auto-approve",
    f"-var=nom_du_repo={nom_repo}"
], check=True)