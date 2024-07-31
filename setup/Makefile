.ONESHELL:
SHELL = /bin/bash
.PHONY: help

GIT_REPO = https://github.com/martinschobben/big_eo_models.git
GIT_BRANCH = public
REPO_NAME = big_eo_models
ROOT = ~/$(REPO_NAME)


help:
	@echo "Makefile for setting up environment, kernel, and pulling notebooks"
	@echo ""
	@echo "Usage:"
	@echo "  make notebooks    - Clone notebooks to JupyterLab, install Conda environments and Jupyter kernels"
	@echo "  "
	@echo "  make teardown     - Remove Conda environments and Jupyter kernels"
	@echo "  make delete       - Remove Jupyter notebooks"
	@echo "  make help         - Display this help message"

notebooks:
	git clone $(GIT_REPO) -b $(GIT_BRANCH) $(ROOT)
	cd $(ROOT) && make kernel
	@echo "Repository cloned and Jupyter kernels installed."

delete:
	@echo "Deleting all files in $(ROOT)..."
	rm -rf $(ROOT)
	@echo "$(ROOT) has been deleted."

teardown:
	cd $(ROOT) && make teardown