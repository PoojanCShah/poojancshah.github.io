# WORKFLOW.md

Reference for common tasks on this site. Deploy is automatic: push to `main` and GitHub Pages rebuilds in about a minute. Preview locally with `make serve` (live at `http://localhost:4000`).

## Homepage changes (publications, honours, talks)

1. Edit `index.markdown`. One `pub-item` div block per entry.
2. Preview: `make serve` and check the browser.
3. Commit with a descriptive message, push to `main`.

New publication template (copy an existing block and edit):

```html
<div class="pub-item">
<div class="pub-title">Paper Title</div>
<div class="pub-authors">Author Names</div>
<div class="pub-venue"><strong>Venue</strong> — Full Conference Name</div>
<div class="pub-links">
<details class="pub-abstract">
<summary><span class="pub-abstract-label">commentary</span>
<a href="https://arxiv.org/abs/XXXX.XXXXX" class="btn-arxiv">arXiv</a></summary>
<div class="abstract-text">Collapsible commentary. MathJax works: \(O(n \log k)\).</div>
</details>
</div>
</div>
```

- Link classes: `btn-arxiv` (blue), `btn-conf` (red), `btn-pdf` (red), `btn-code` (green), `btn-poster` (green), `btn-slides` (purple), `btn-video` (purple), `btn-blog` (purple). Keep colors semantically consistent.
- Poster PNGs go in `assets/images/`.

## Adding a post (writing)

1. Create `_posts/YYYY-MM-DD-title.md`:

```yaml
---
layout: post
title: "Post Title"
date: YYYY-MM-DD
description: "One-line summary shown in the index."
---
```

2. Write in Markdown. Raw LaTeX is fine when Markdown can't express something; MathJax is enabled site-wide: inline `\( ... \)`, display `$$ ... $$`.
3. Regenerate its PDF: `make writing-pdfs` (requires pandoc + XeLaTeX/MacTeX). Output goes to `assets/writing/pdfs/<slug>.pdf`; `/writing/` links it automatically by slug.
4. Review the generated PDF.
5. Commit the post and its PDF together, push.

Note: the slug drives the PDF filename. Renaming a post orphans its old PDF — rerun `make writing-pdfs` and remove the stale PDF.

## Updating the CV

1. Edit `cv/cv.tex`.
2. Run `make cv` — latexmk builds in `cv/build/`, writes `cv/poojan-shah-cv.pdf`, and copies it to the root `poojan-shah-cv.pdf` that `index.markdown` links.
3. Commit `cv/cv.tex` and both PDFs together, push.

## Adding a news item

Edit `news.md` — prepend an `<li>` at the top of the list (newest first):

```html
<li><span class="news-date">Month YYYY</span><span>Update text with <a href="...">links</a>.</span></li>
```

## Day-to-day rhythm

```
edit → make serve (check in browser) → git add + commit → git push origin main
```

- Always preview locally before pushing — `make serve` catches Liquid/SCSS errors that would otherwise hit production.
- Commit manually with descriptive messages. Avoid `make deploy` (it commits everything with a generic "Update site" message).

## One-time setup

- `bundle install` — Jekyll via the `github-pages` gem, which pins all plugin versions to match GitHub's build environment. Upgrade with `bundle update github-pages`.
- pandoc + XeLaTeX (MacTeX) — only needed for `make writing-pdfs` and `make cv`.

## Quick reference

| Task | Files | Command |
|---|---|---|
| Preview site | — | `make serve` |
| New publication | `index.markdown`, poster in `assets/images/` | — |
| New post | `_posts/YYYY-MM-DD-title.md` | `make writing-pdfs` |
| CV update | `cv/cv.tex` | `make cv` |
| News item | `news.md` | — |
| Full build check | — | `make build` |
