from fastapi import FastAPI
from starlette.responses import PlainTextResponse

# app FastAPI
app = FastAPI()

# endpoint racine
@app.get("/", response_class=PlainTextResponse)
def read_root() -> str:
    return "hello"