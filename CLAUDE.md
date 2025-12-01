# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Jekyll-based personal academic website for Poojan Shah (IIT Delhi).

## Build Commands

```bash
# Install dependencies (first time only)
bundle install

# Start development server with live reload
make serve
# Or directly:
bundle exec jekyll serve --watch

# Build static site
make build

# Preview with draft posts visible
rake preview
```

## Content Management

```bash
# Create new blog post (auto-dated)
rake post['Post Title']

# Create draft (no date prefix)
rake draft['Draft Title']

# Publish draft with today's date
rake undraft['draft-file.md']
```

## Directory Structure

- `_posts/` - Blog posts with `YYYY-MM-DD-title.md` naming
- `_drafts/` - Unpublished drafts
- `_layouts/` - HTML templates (default, post, page, center)
- `_includes/` - Reusable components (header, footer, navigation, social_links)
- `_sass/` - SCSS stylesheets; `_variables.scss` has colors/fonts
- `css/pixyll.scss` - Main stylesheet that imports all SCSS

## Key Pages

- `index.markdown` - Homepage with profile, research, publications
- `research.md` - Research interests with collapsible sections
- `projects.md`, `essays.md`, `affiliations.md` - Navigation pages

## Front Matter

Posts:
```yaml
---
layout: post
title: "Post Title"
date: YYYY-MM-DD HH:MM
categories:
---
```

Pages:
```yaml
---
layout: page
---
```

## Configuration (_config.yml)

Key settings:
- `enable_mathjax: true` - LaTeX math support
- `animated: true` - Page fade-in animations
- `header_pages:` - Navigation menu items

## LaTeX/MathJax

Inline: `\\( ... \\)` | Display: `$$ ... $$`

## Deployment

Site deploys automatically via GitHub Pages when pushing to `main`. After reorganization, update GitHub Pages settings to deploy from root directory (not `docs/`).

```bash
make deploy
```
