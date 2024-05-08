.ONESHELL:

# GLOBALS 
SHELL=/bin/zsh
CONDA_ACTIVATE = source $$(conda info --base)/etc/profile.d/conda.sh ; conda activate ; conda activate
PROJECT_DIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
PROJECT_NAME=$(shell basename $(PROJECT_DIR))

create-environment: # create mamba environment
	mamba env create --force --name $(PROJECT_NAME) -f env.yml

update-environment: # update mamba environment
	$(CONDA_ACTIVATE) $(PROJECT_NAME)
	mamba env update -f env.yml --prune

remove-environment: # remove mamba environment
	conda remove --name $(PROJECT_NAME) --all -y