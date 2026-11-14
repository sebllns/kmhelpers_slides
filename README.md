# kmhelpers slides

Presentation of kmhelpers, automated management of kmindex genomic indexes.
Built with [Quarto](https://quarto.org) from `slides.qmd` (talk) and `tuto.qmd` (tutorial).

## Links

- Slides (HTML): https://sebllns.github.io/kmhelpers_slides/
- PDF: https://sebllns.github.io/kmhelpers_slides/slides.pdf
- PPTX: https://sebllns.github.io/kmhelpers_slides/slides.pptx
- Tutorial (HTML): https://sebllns.github.io/kmhelpers_slides/tuto.html
- Tutorial PDF: https://sebllns.github.io/kmhelpers_slides/tuto.pdf
- Tutorial PPTX: https://sebllns.github.io/kmhelpers_slides/tuto.pptx
- All formats (zip): https://sebllns.github.io/kmhelpers_slides/slides.zip

## Setup

```
conda env create -f environment.yml
conda activate quarto-slides
```

The PDF output also needs a LaTeX distribution:

```
quarto install tinytex
```

## Build

HTML (reveal.js):

```
quarto render slides.qmd --to revealjs
```

Live preview, rebuilt on every change:

```
quarto preview slides.qmd --to revealjs
```

PDF (Beamer) and PPTX:

```
quarto render slides.qmd --to beamer
quarto render slides.qmd --to pptx
```

`quarto render slides.qmd` without `--to` builds all three formats.
Replace `slides.qmd` with `tuto.qmd` to build the tutorial.

## Layout

- `slides.qmd`: slide source and format options
- `tuto.qmd`: tutorial slides, same format options
- `references.bib`: bibliography
- `images/`: figures and logo
- `assets/theme-toggle.html`: dark mode button for the HTML slides
- `.github/workflows/render.yml`: renders all formats on push and deploys them to GitHub Pages
