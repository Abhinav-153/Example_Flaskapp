FROM python:3.10-slim-buster

WORKDIR /app


ENV PATH="/root/.local/bin:${PATH}"

RUN apt-get update && apt upgrade -y && apt-get install -y curl

RUN POETRY_VERSION=1.1.13 \
    && curl -sSL https://install.python-poetry.org   | python - 
 


            

COPY poetry.lock pyproject.toml ./

RUN poetry install 

COPY example_flaskapp /app

#RUN source $(poetry env info --path)/bin/activate
#RUN poetry shell

CMD ["poetry","run","python","app.py"]






