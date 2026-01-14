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

# Quick deploy (add, commit, push)
make deploy
```

## Architecture

### Styling System
- `css/pixyll.scss` - Main entry point that imports all SCSS partials
- `_sass/_variables.scss` - Design tokens: colors, typography, spacing
- Custom academic components: `_profile.scss`, `_publications.scss`, `_news.scss`, `_research.scss`
  - These style the homepage sections (profile header, publication items with venue/links, news timeline)
  - Publication links use colored badges defined in `_publications.scss` (arxiv=brick red, conf=steel blue, code=purple, etc.)

### Layout System
- `_layouts/default.html` - Base template (includes head, header, footer)
- `_layouts/page.html` - Standard page layout (used by homepage)
- `_layouts/post.html` - Blog post template with reading time, date, sharing options
- `_layouts/center.html` - Centered content layout

### Includes
- `header.html`, `footer.html` - Site chrome
- `navigation.html` - Nav menu (controlled by `header_pages` in config)
- `social_links.html` - Social media icons
- `head.html` - Meta tags, CSS, MathJax loading, Google Fonts (Merriweather, Lato)

## Content

- `index.markdown` - Homepage with profile photo, about, news, publications, talks, teaching
- `_posts/` - Blog posts (YYYY-MM-DD-title.md naming)
- `blog.md` - Personal blog index (filters posts by category: "personal")
- `research-blog.md` - Research blog index (filters posts by category: "research")

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

Available button classes: `btn-arxiv` (brick red), `btn-conf` (steel blue), `btn-code` (purple), `btn-poster` (teal), `btn-slides` (gray), `btn-pdf` (pink), `btn-video` (light red), `btn-blog` (teal).

### Adding Blog Posts

Create files in `_posts/` with naming: `YYYY-MM-DD-title.md`

Front matter:
```yaml
---
layout: post
title: "Post Title"
date: YYYY-MM-DD
category: personal  # or "research" for research blog
---
```

Posts with `category: personal` appear on `/blog`, posts with `category: research` appear on `/research-blog`.

## Configuration (_config.yml)

Key settings:
- `enable_mathjax: true` - LaTeX support: inline `\( \)`, display `$$ $$`
- `animated: true` - Page fade-in animations
- `header_pages` - Navigation menu items (blog.md, research-blog.md, calendar.md)
- `extended_fonts: true` - Extended Google Font character sets

## Deployment

Push to `main` branch triggers automatic GitHub Pages deployment.
