# Mixed Models in Julia

This repository contains [`Jupyter`](https://jupyter.org) notebooks of chapters in a book called *Mixed-effects models in Julia*.  Well, at least that's the plan.  I'm better at starting books than I am at finishing them so maybe this will just end up being a series of notebooks.

At present the order of the chapters is
1. SimpleLMM
2. MultipleTerms

Other notebooks in the parent directory and in the `CaseStudies` directory may become appendices or may be incorporated in later chapters.

The plan is that the notebooks can be run on [`JuliaBox`](https://juliabox.com).  Log in to the site using one of the available login methods and create a copy of this repository under the `Sync` tab.  Some of the Julia packages used in a notebook may need to be installed.  Check with
```jl
Pkg.update()
Pkg.status("MixedModels")
```
If `Pkg.status` does not return a version number, add the package with
```jl
Pkg.add("MixedModels")
```

Because of dependencies, `MixedModels` will also cause `DataFrames`, `GLM`, and `Distributions` to be installed.

At present `R` is available on JuliaBox for the Julia `RCall` package but the `lme4` package for `R` is not.  It can be installed with the Julia command sequence
```jl
Pkg.add("RCall")
using RCall
R"""
install.packages("lme4", repos="https://cloud.r-project.org")
"""
```
but this takes a bit of time and the `lme4` package will not persist between JuliaBox sessions.  In other words, this must be done for each fresh JuliaBox session.

An alternative is to clone this repository, install `Julia` (see the [downloads page](https://julialang.org/downloads), and [`R`](http://r-project.org), start `julia` and execute
```jl
Pkg.update()
Pkg.add("IJulia")  # this takes a while the first time it is run
Pkg.add("MixedModels")
Pkg.add("RCall")
using RCall
R"""
install.packages("lme4", repos="https://cloud.r-project.org")
"""
using IJulia
notebook()
```

This will open a browser window.  Navigate to the clone of this repository and click on the first notebook.  See the `Help` tab for instructions on how to use a notebook.
