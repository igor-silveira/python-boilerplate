VENV_NAME?=venv
PYTHON=${VENV_NAME}/bin/python3
PRECOMMIT=${VENV_NAME}/bin/pre-commit

_virtualenv:
	python3 -m venv venv
	venv/bin/pip install --upgrade pip
	venv/bin/pip install --upgrade setuptools
	venv/bin/pip install --upgrade wheel

requirements: _virtualenv
	venv/bin/pip install -r requirements.txt

linter:
	git init
	${PRECOMMIT} install

init: requirements linter