# latex-action [![GitHub Actions Status](https://github.com/matsavage/latex-action/workflows/Test%20Github%20Action/badge.svg)](https://github.com/matsavage/latex-action/actions)

> GitHub Action to compile LaTeX documents.

This actions runs on docker using a [maximal TeXLive environment](https://hub.docker.com/r/danteev/texlive/) and the [DnD 5e LaTeX Template](https://github.com/rpgtex/DND-5e-LaTeX-Template/) installed.

## Inputs

* `root_file`

    The root LaTeX file to be compiled. If unset, will run on all .tex files in the working_directory.

* `working_directory`

    The working directory for the latex compiler to be invoked.

* `compiler`

    The LaTeX engine to be used. By default, [`latexmk`](https://ctan.org/pkg/latexmk) is used, which automates the process of generating LaTeX documents by issuing the appropriate sequence of commands to be run.

* `args`

    The extra arguments to be passed to the compiler. By default, it is `-pdf -latexoption=-file-line-error -latexoption=-interaction=nonstopmode`. This tells `latexmk` to use `pdflatex`. Refer to [`latexmk` document](http://texdoc.net/texmf-dist/doc/support/latexmk/latexmk.pdf) for more information.

* `extra_system_packages`

    The extra packages to be installed by [`apt-get`](https://en.wikipedia.org/wiki/APT_(Package_Manager)) separated by space.

* `runs`

    Number of times to run the compilation.

## Example

```yaml
name: Build LaTeX document
on: [push]
jobs:
  build_latex:
    runs-on: ubuntu-latest
    steps:
      - name: Set up Git repository
        uses: actions/checkout@v1
      - name: Compile LaTeX document
        uses: dante-ev/latex-action@master
        with:
          root_file: main.tex
```

## FAQs

### How to use XeLaTeX or LuaLaTeX instead of pdfLaTeX?

By default, this action uses pdfLaTeX. If you want to use XeLaTeX or LuaLaTeX, you can set the `args` to `-xelatex -latexoption=-file-line-error -latexoption=-interaction=nonstopmode` or `-lualatex -latexoption=-file-line-error -latexoption=-interaction=nonstopmode` respectively. Alternatively, you could create a `.latexmkrc` file. Refer to the [`latexmk` document](http://texdoc.net/texmf-dist/doc/support/latexmk/latexmk.pdf) for more information.

### How to enable `--shell-escape`?

To enable `--shell-escape`, you should add it to `args`. For example, set `args` to `-pdf -latexoption=-file-line-error -latexoption=-interaction=nonstopmode -latexoption=-shell-escape` when using pdfLaTeX.

### Where does the initial code come from?

The initial code is from [xu-cheng/latex-action](https://github.com/xu-cheng/latex-action).
The idea there is to initially provide all packages instead of using [texliveonfly](https://ctan.org/pkg/texliveonfly).
Using a full installation, this action also offers to use packages such as [pax](https://ctan.org/pkg/pax), which require other tooling such as perl.
More reasoning is given in [ADR-0002](https://github.com/dante-ev/docker-texlive/blob/master/docs/adr/0002-provide-all-packages.md#provide-all-packages).

## License

MIT
