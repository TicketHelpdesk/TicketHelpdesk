version := $(shell cat openhelpdesk/__init__.py | cut -d= -f 2 | tr -d ' ' | tr -d "'")
db_name := test_openhelpdesk_$(UID)
.PHONY: clean-pyc clean-build docs

help:
	@echo "clean-build - remove build artifacts"
	@echo "clean-pyc - remove Python file artifacts"
	@echo "lint - check style with flake8"
	@echo "test - run tests quickly with the default Python"
	@echo "testall - run tests on every Python version with tox"
	@echo "coverage - check code coverage quickly with the default Python"
	@echo "docs - generate Sphinx HTML documentation, including API docs"
	@echo "release - package and upload a release"
	@echo "sdist - package"

clean: clean-build clean-pyc
	rm -fr htmlcov/

clean-build:
	rm -fr build/

	rm -fr dist/
	rm -fr *.egg-info

clean-pyc:
	find . -name '*.pyc' -exec rm -f {} +
	find . -name '*.pyo' -exec rm -f {} +
	find . -name '*~' -exec rm -f {} +

postgres-db:
	dropdb $(db_name); createdb $(db_name)

lint:
	flake8 --exclude=migrations,urls.py openhelpdesk tests

test:
	py.test

test-live:
	py.test -m livetest --livetest

test-all:
	tox

coverage:
	which py.test
	py.test --cov-report term-missing --cov openhelpdesk -n 2

coverage-live:
	which py.test
	py.test --livetest --cov-report term-missing --cov openhelpdesk

coverage-html:
	py.test --cov-report html --cov openhelpdesk
	open htmlcov/index.html

coverage-live-html:
	py.test --livetest --cov-report term-missing --cov openhelpdesk
	open htmlcov/index.html

docs:
	rm -f docs/open-helpdesk.rst
	rm -f docs/modules.rst
	$(MAKE) -C docs clean
	$(MAKE) -C docs html
	open docs/_build/html/index.html

release: clean
	python setup.py sdist upload
	python setup.py bdist_wheel upload
	@echo "\n\nYou probably want to also tag the version now:"
	@echo "    git tag -a v$(version) -m 'version v$(version)'"
	@echo "    git push --tags"

sdist: clean
	python setup.py sdist
	python setup.py bdist_wheel
	ls -l dist
