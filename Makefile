help:
	@echo "make init - install virtual environment(required for the other targets)"
	@echo "make -s install - install packages"
	@echo "make -s test - run unit tests"
	@echo "make -s run - run the main script"
	@echo "-s option hides the Make invocation command."

venv:
	test -d venv || virtualenv venv
	@echo "Activate your virtual environment by running:"
	@echo "source venv/bin/activate"

init: venv

install:
	pip install -Ur requirements.txt

test:
	@python -m doctest main.py -v
# 	@python -m doctest main.py
# 	@py.test tests

testWithCoverage:
	@python -m coverage run -m doctest main.py

coverageTerminal: .coverage
	python -m coverage report

coverageHtml: .coverage
	python -m coverage html
	open htmlcov/index.html

clean:
	test -f .coverage && rm .coverage || true
	test -d htmlcov && rm -rf htmlcov || true
	@echo ".coverage and htmlcov deleted"

run:
	@python main.py

.PHONY: help venv init clean install test run
