#!/usr/bin/env bash
# Generate article-style PDFs from every Jekyll post.
set -euo pipefail

repository_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$repository_root"

for command in pandoc xelatex; do
  if ! command -v "$command" >/dev/null 2>&1; then
    echo "Missing required command: $command" >&2
    exit 1
  fi
done

output_directory="assets/writing/pdfs"
mkdir -p "$output_directory"

for source in _posts/*.md; do
  [ -e "$source" ] || continue

  filename="${source##*/}"
  slug="${filename#????-??-??-}"
  slug="${slug%.md}"
  output="$output_directory/$slug.pdf"

  echo "Generating $output"
  pandoc "$source" \
    --standalone \
    --pdf-engine=xelatex \
    --include-in-header=scripts/writing-pdf-header.tex \
    --resource-path='.:assets' \
    --metadata=author:'Poojan Shah' \
    --metadata=date: \
    --variable=geometry:margin=1in \
    --variable=colorlinks=true \
    --variable=linkcolor:[HTML]{163A59} \
    --variable=urlcolor:[HTML]{163A59} \
    --output="$output"
done
