# syntax=docker/dockerfile:1
FROM alpine:3.15
FROM python:3.10.5-alpine3.15

RUN apk add --no-cache gcc musl-dev linux-headers libffi-dev
RUN pip install poetry

WORKDIR /code
COPY poetry.lock pyproject.toml /code/

RUN poetry config virtualenvs.create false
RUN poetry install --no-interaction --no-ansi

COPY . /code

CMD ["poetry", "run",  "python3",  "-m",  "test"]
