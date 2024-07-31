.ONESHELL:
SHELL = /bin/bash
.PHONY: help clean environment kernel post-render data
YML = $(wildcard *.yml)
REQ = $(basename $(notdir $(YML)))
CONDA_ENV_DIR := $(foreach i,$(REQ),$(shell conda info --base)/envs/$(i))
KERNEL_DIR := $(foreach i,$(REQ),$(shell jupyter --data-dir)/kernels/$(i))
CONDA_ACTIVATE = source $$(conda info --base)/etc/profile.d/conda.sh ; conda activate ; conda activate

GIT_REPO = https://github.com/martinschobben/big_eo_models.git
GIT_BRANCH = main
REPO_NAME = big_eo_models

help:
	@echo "Makefile for setting up environment, kernel, and pulling notebooks"
	@echo ""
	@echo "Usage:"
	@echo "  make notebooks    - Pull the notebooks from the Git repository"
	@echo "  make environment  - Create Conda environments"
	@echo "  make kernel       - Create Jupyter kernels"
	@echo "  make all          - Run all the above tasks"
	@echo "  "
	@echo "  make teardown     - Remove the environment and kernel"
	@echo "  make delete       - Deletes the cloned Repository and removes kernel and environment"
	@echo "  make remove       - Deletes only the cloned Repository"
	@echo "  make clean        - Removes ipynb_checkpoints"
	@echo "  make help         - Display this help message"

notebooks: 
	@echo "Cloning the Git repository..."
	git clone $(GIT_REPO) -b $(GIT_BRANCH) ~/$(REPO_NAME)
	@echo "Repository cloned."

$(CONDA_ENV_DIR):
	for i in $(YML); do conda env create -f $$i; done

environment: $(CONDA_ENV_DIR)
	@echo -e "conda environments are ready."

$(KERNEL_DIR): $(CONDA_ENV_DIR)
	pip install --upgrade pip
	pip install jupyter
	for i in $(REQ); do $(CONDA_ACTIVATE) $$i ; python -m ipykernel install --user --name $$i --display-name $$i ; conda deactivate; done

kernel: $(KERNEL_DIR)
	@echo -e "conda jupyter kernel is ready."

delete: teardown
	@echo "Deleting all files in $(REPO_NAME)..."
	rm -rf $(REPO_NAME)
	@echo "$(REPO_NAME) has been deleted."

clean:
	rm --force --recursive .ipynb_checkpoints/

teardown:
	for i in $(REQ); do conda remove -n $$i --all -y ; jupyter kernelspec uninstall -y $$i ; done
