# poojancshah.github.io
PoojanCShah's personal website

## Writing PDFs

Posts in `_posts/` remain the single source of truth. Generate a PDF for every
post with:

```bash
make writing-pdfs
```

The command uses Pandoc and XeLaTeX and writes publishable files to
`assets/writing/pdfs/`; the Writing page links to each file automatically. Run
it after changing or adding a post, review the PDFs, then commit both the post
and its generated PDF. New posts use Jekyll's normal
`YYYY-MM-DD-title.md` filename pattern and YAML front matter. Pandoc supports
standard Markdown, tables, images, citations, fenced code blocks, and LaTeX
math. It requires `pandoc` and XeLaTeX (included with MacTeX or TeX Live). Raw
LaTeX can be included when a post needs a feature Markdown does not express.
