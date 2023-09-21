PATH_REPO?=$(shell pwd)
PATH_VIRTUALENV?=$(PATH_REPO)/env
PORT?=4444


help:
	@echo "Make targets:"
	@echo "  build           install dependencies and prepare environment"
	@echo "  clean           remove *.pyc files, __pycache__ directory, and env"
	@echo "  freeze          persist installed packaged to requirements.txt"
	@echo "  run             run jupyter lab (default port $(PORT))"
	@echo "Check the Makefile for details."


build:
	virtualenv $(PATH_VIRTUALENV); \
	source $(PATH_VIRTUALENV)/bin/activate; \
	pip install --upgrade pip; \
	pip install -r requirements.txt;

clean:
	find . -name '*.pyc' -delete
	find . -name '__pycache__' -type d | xargs rm -fr
	find . -name '*.egg-info' -type d | xargs rm -fr
	find . -name '.ipynb_checkpoints' -type d | xargs rm -fr
	rm -rf $(PATH_VIRTUALENV)

freeze:
	source $(PATH_VIRTUALENV)/bin/activate; \
	pip freeze > requirements.txt

run:
	source $(PATH_VIRTUALENV)/bin/activate; \
	jupyter lab --no-browser --port=$(PORT)

