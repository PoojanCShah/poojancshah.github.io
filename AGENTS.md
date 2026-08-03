# AGENTS.md

This file provides guidance to Codex (Codex.ai/code) when working with code in this repository.

## Project Overview

Jekyll-based personal academic website using the Pixyll theme, deployed via GitHub Pages.

## Build Commands

```bash
# Install dependencies
bundle install

# Start development server with live reload
make serve
# Or: bundle exec jekyll serve --watch

# If port 4000 is in use, run on a different port
bundle exec jekyll serve --watch --port 4001

# Build static site to _site/
make build

# Quick deploy (add, commit, push with generic "Update site" message)
# Prefer manual git commits with descriptive messages instead
make deploy
```

## Architecture

### Styling System
- `css/pixyll.scss` - Main entry point that imports all SCSS partials
- `_sass/_variables.scss` - Design tokens: site-wide CMU Typewriter typography, Prussian palette, and spacing
- `_sass/_fonts.scss` - Self-hosted CMU Typewriter Text faces; licensed files live in `assets/fonts/cmu-typewriter/`
- Custom academic components: `_profile.scss`, `_publications.scss`, `_news.scss`
  - These style the homepage sections (profile header, publication items with venue/links, news timeline)
  - Publication link classes use direct semantic colors: blue for conference records, red for papers/PDFs, green for code/posters/blogs, and purple for slides/video.
- `_sass/_mir.scss` - Last import (highest specificity); applies the European-monograph treatment to `§` headings, rules, blockquotes, code, and tables.

### Layout System
- `_layouts/default.html` - Base template (includes the shared head and header)
- `_layouts/page.html` - Standard page layout (used by homepage)
- `_layouts/post.html` - Writing template with reading time and date

### Includes
- `header.html` - Site header and navigation wrapper
- `navigation.html` - Nav menu (controlled by `header_pages` in config)
- `head.html` - Meta tags, CSS, and MathJax loading; site fonts are self-hosted through `_fonts.scss`

## Content

- `index.markdown` - Homepage with profile photo, about, news, publications, talks, teaching
- `writing.md` - Writing index page; lists every post in `_posts/`
- `book-collection.md` - Static list of recommended books (plain markdown list)
- `_posts/` - Markdown files rendered into individual writing pages

### Adding Publications

Publications in `index.markdown` use this HTML structure:
```html
<div class="pub-item">
<div class="pub-title"><span class="pub-number">[1]</span> Paper Title</div>
<div class="pub-authors">Author Names</div>
<div class="pub-venue">Venue — Full Conference Name</div>
<div class="pub-links">
<a href="..." class="btn-arxiv">arXiv</a>
<a href="..." class="btn-conf">OpenReview</a>
<a href="..." class="btn-code">Code</a>
</div>
</div>
```

To add a collapsible abstract inside `pub-links`, use:
```html
<details class="pub-abstract"><summary>short description</summary><div class="abstract-text">Abstract text here. MathJax works: \(O(n \log k)\).</div></details>
```

Available semantic classes: `btn-arxiv`, `btn-conf`, `btn-code`, `btn-poster`, `btn-slides`, `btn-pdf`, `btn-video`, and `btn-blog`. Keep their color meanings consistent when adding links.

### Adding Writing

Create files in `_posts/` with the naming pattern `YYYY-MM-DD-title.md`. Every post appears on `/writing/`.

Front matter:
```yaml
---
layout: post
title: "Post Title"
date: YYYY-MM-DD
description: "One-line summary shown in the index."
---
```

## Configuration (_config.yml)

Key settings:
- `enable_mathjax: true` - LaTeX support: inline `\( \)`, display `$$ $$`
- `animated: true` - Page fade-in animation
- `header_pages` - Navigation menu items (currently: writing.md, book-collection.md)

## Deployment

Push to `main` branch triggers automatic GitHub Pages deployment.

## Notes

- `AGENTS.md` is in the `_config.yml` exclude list, so it won't appear in the built site.
- The site uses `github-pages` gem (not standalone Jekyll), which pins Jekyll and plugin versions. Run `bundle update github-pages` to upgrade.
- Images (profile photo, logos) are stored at the repo root (`me.JPEG`, `menew.jpeg`) and in `logos/`.
- `poojan-shah-cv.pdf` lives at the repo root and is linked directly from `index.markdown`. Replace it in-place to update the CV.
- Poster PDFs/PNGs (e.g. `ICLR2025Poster.png`) are also stored at the repo root and linked via `btn-poster` buttons in publication entries.
- `CNAME` at the repo root sets the custom domain for GitHub Pages. Edit it to change the domain.
