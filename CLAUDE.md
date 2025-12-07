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

# Build static site to _site/
make build
```

## Architecture

### Styling System
- `css/pixyll.scss` - Main entry point that imports all SCSS partials
- `_sass/_variables.scss` - Design tokens: colors, typography, spacing
- Custom academic components: `_profile.scss`, `_publications.scss`, `_news.scss`, `_research.scss`
  - These style the homepage sections (profile header, publication items with venue/links, news timeline)

### Layout System
- `_layouts/default.html` - Base template (includes head, header, footer)
- `_layouts/page.html` - Standard page layout (used by homepage)
- `_layouts/post.html` - Blog post template
- `_layouts/center.html` - Centered content layout

### Includes
- `header.html`, `footer.html` - Site chrome
- `navigation.html` - Nav menu (controlled by `header_pages` in config)
- `social_links.html` - Social media icons
- `head.html` - Meta tags, CSS, MathJax loading

## Content

- `index.markdown` - Homepage with profile photo, about, news, publications, talks, teaching
- `_posts/` - Blog posts (YYYY-MM-DD-title.md naming)
- `/blog` - Blog index page (referenced from homepage)

## Configuration (_config.yml)

```yaml
enable_mathjax: true   # LaTeX support: inline \( \), display $$ $$
animated: true         # Page fade-in animations
header_pages: []       # Navigation menu items (currently empty)
```

## Deployment

Push to `main` branch triggers automatic GitHub Pages deployment.
