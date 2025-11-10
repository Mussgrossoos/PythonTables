.PHONY: help install install-dev test lint format clean build dist

help:
	@echo "Verfügbare Befehle:"
	@echo "  make install      - Installiert die Bibliothek"
	@echo "  make install-dev  - Installiert mit Dev-Dependencies"
	@echo "  make test         - Führt Tests aus"
	@echo "  make lint         - Führt Linting aus"
	@echo "  make format       - Formatiert Code mit Black"
	@echo "  make clean        - Entfernt Build-Artefakte"
	@echo "  make build        - Baut das Package"
	@echo "  make dist         - Erstellt Distribution"

install:
	pip install -e .

install-dev:
	pip install -e ".[dev]"

test:
	pytest tests/ -v

lint:
	flake8 console_table tests

format:
	black console_table tests examples

clean:
	rm -rf build/
	rm -rf dist/
	rm -rf *.egg-info
	rm -rf __pycache__
	rm -rf .pytest_cache
	rm -rf .coverage
	find . -type d -name __pycache__ -exec rm -r {} +
	find . -type f -name "*.pyc" -delete

build:
	python setup.py sdist bdist_wheel

dist: clean build

