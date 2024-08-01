<!-- [![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/Martin Schobben/big_eo_models/main) -->

# Regression Models for Big Earth Observation Datasets 

This is a notebook on multiple regression modelling on big eo datasets.

# Generate Jupyter Conda environment and Jupyter Kernel from `yml`

To re-create the environment as a Jupyter kernel for execution of the notebooks, do the following:

- Open a Terminal from the same level as this Markdown README file.
- An type the following into the terminal.

```
make kernel
```

Select the kernel with the equivalent name as the `.ipynb` notebook to execute the notebook. For example, `01_lecture.ipynb` requires the kernel `01_lecture` for execution of the code blocks.

# Clean-up

To remove Jupyter checkpoints run:

```
make clean
```

In order to remove the Conda environments and Jupyter kernels runL

```
make teardown
```
