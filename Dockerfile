# base python + venv
FROM python:3.12-slim AS base

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
ENV PIP_NO_CACHE_DIR=1
ENV PIP_DISABLE_PIP_VERSION_CHECK=1
ENV VENV_PATH=/opt/venv
ENV PATH="/opt/venv/bin:${PATH}"

RUN python -m venv "${VENV_PATH}" \
    && pip install --upgrade pip

# dépendances Python
FROM base AS deps
# Attendu: requirements.txt à la racine
COPY requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt

# runtime minimal
FROM base AS runtime
WORKDIR /app

RUN groupadd -g 10001 app \
    && useradd -u 10000 -g app -m app

COPY --from=deps /opt/venv /opt/venv
COPY . /app
RUN chown -R app:app /app

USER app
EXPOSE 8000

# lancement uvicorn
# Attendu: module python "app.main:app"
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]