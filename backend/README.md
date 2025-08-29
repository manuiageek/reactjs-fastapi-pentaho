# VENV Python
python -m venv .venv
.\.venv\Scripts\Activate.ps1

# Requirements
pip install -r requirements.txt

# Lancer le uvicorn
uvicorn src.app:app --reload