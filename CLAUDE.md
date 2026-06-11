# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

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

# Compile essays: LaTeX → HTML + PDF (run after editing any .tex file)
make essays

# Quick deploy (add, commit, push with generic "Update site" message)
# Prefer manual git commits with descriptive messages instead
make deploy
```

## Architecture

### Styling System
- `css/pixyll.scss` - Main entry point that imports all SCSS partials
- `_sass/_variables.scss` - Design tokens: colors, typography, spacing
- Custom academic components: `_profile.scss`, `_publications.scss`, `_news.scss`, `_research.scss`, `_experience.scss`
  - These style the homepage sections (profile header, publication items with venue/links, news timeline)
  - Publication links use colored badges defined in `_publications.scss` (arxiv=brick red, conf=steel blue, code=purple, etc.)
  - `_experience.scss` provides `.experience-timeline` / `.exp-item` classes for a vertical timeline with a red accent line (unused currently, available for adding an experience section)
- `_sass/_mir.scss` - Last import (highest specificity); applies a "Mir Publishers" textbook aesthetic: dark ink body color `#1c1008`, deep red `#8b1a1a` accents on `h2` borders/`§` prefix, `hr`, blockquotes, code blocks, and tables. Edit here when overriding base theme colors or typographic rules globally.

### Layout System
- `_layouts/default.html` - Base template (includes head, header, footer)
- `_layouts/page.html` - Standard page layout (used by homepage)
- `_layouts/post.html` - Blog post template with reading time, date, sharing options
- `_layouts/center.html` - Centered content layout

### Includes
- `header.html`, `footer.html` - Site chrome
- `navigation.html` - Nav menu (controlled by `header_pages` in config)
- `social_links.html` - Social media icons
- `head.html` - Meta tags, CSS, MathJax loading, Google Fonts (EB Garamond)

## Content

- `index.markdown` - Homepage with profile photo, about, news, publications, talks, teaching
- `essays.md` - Essay index page (lists all essays from the `_essays/` collection)
- `book-collection.md` - Static list of recommended books (plain markdown list)
- `calendar.md` - Embeds Google Calendar via iframe
- `expository-writings.md` - Index of expository writings; lists posts from `_posts/` that have `expository: true` in their front matter
- `_posts/` - Post files; only those with `expository: true` appear on the expository writings page

### Adding Essays

Essays are written in LaTeX and compiled to HTML + PDF with a single command. The workflow:

1. Create `essays/src/my-essay.tex` (add `% date: YYYY-MM-DD` and `% description: ...` comments at the top)
2. Run `make essays` — this calls `scripts/build-essays.sh`, which:
   - Extracts metadata from the `.tex` file
   - Runs `pandoc` to produce `_essays/my-essay.html` (Jekyll collection file with front matter)
   - Runs `pdflatex` twice to produce `essays/pdf/my-essay.pdf`
3. Commit `_essays/` and `essays/pdf/` alongside the source `.tex` — GitHub Pages cannot run Pandoc, so generated files must be committed

**Metadata in `.tex` files:**
```latex
% date: 2026-05-01
% description: One-line summary shown in the essay index.
\title{Essay Title Here}
```

The `_layouts/essay.html` layout provides the e-reader UI: sticky back/PDF bar, reading column (700px, EB Garamond), section headings with `§` prefix and red border. The `_sass/_essay_reader.scss` file styles both the reader and the index listing; it is imported just before `_mir.scss` so Mir overrides still apply globally.

### Adding Publications

Publications in `index.markdown` use this HTML structure:
```html
<div class="pub-item">
<div class="pub-title"><span class="pub-number">1.</span> Paper Title</div>
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

Available button classes: `btn-arxiv` (brick red), `btn-conf` (steel blue), `btn-code` (purple), `btn-poster` (teal), `btn-slides` (gray), `btn-pdf` (pink), `btn-video` (light red), `btn-blog` (teal).

### Adding Expository Writings

Create files in `_posts/` with naming: `YYYY-MM-DD-title.md`. Add `expository: true` to make a post appear on the `/expository-writings/` index page.

Front matter:
```yaml
---
layout: post
title: "Post Title"
date: YYYY-MM-DD
description: "One-line summary shown in the index."
expository: true
---
```

## Configuration (_config.yml)

Key settings:
- `enable_mathjax: true` - LaTeX support: inline `\( \)`, display `$$ $$`
- `animated: true` - Page fade-in animations
- `header_pages` - Navigation menu items (currently: essays.md, expository-writings.md, book-collection.md, calendar.md)
- `extended_fonts: true` - Extended Google Font character sets

## Deployment

Push to `main` branch triggers automatic GitHub Pages deployment.

## Notes

- `CLAUDE.md` is in the `_config.yml` exclude list, so it won't appear in the built site.
- The site uses `github-pages` gem (not standalone Jekyll), which pins Jekyll and plugin versions. Run `bundle update github-pages` to upgrade.
- Images (profile photo, logos) are stored at the repo root (`me.JPEG`, `menew.jpeg`) and in `logos/`.
