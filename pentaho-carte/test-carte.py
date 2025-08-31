#!/usr/bin/env python3
# test minimal: /kettle/status avec saisie interactive

import sys
import requests
from requests.auth import HTTPBasicAuth
from getpass import getpass

# cible à adapter si besoin
BASE = "http://localhost:8080"
TIMEOUT = 5

# saisie utilisateur
user = input("Utilisateur: ").strip()
password = getpass("Mot de passe: ")

# requête status
try:
    r = requests.get(f"{BASE}/kettle/status/", params={"xml": "Y"}, auth=HTTPBasicAuth(user, password), timeout=TIMEOUT)
    if r.ok:
        print("OK")
    print(f"HTTP {r.status_code} {r.reason}")
    sys.exit(1)
except Exception as e:
    print(f"ERREUR: {e}")
    sys.exit(2)