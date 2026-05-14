#!/usr/bin/env bash
set -e

REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
SRC_DIR="$REPO_ROOT/essays/src"
PDF_DIR="$REPO_ROOT/essays/pdf"
ESSAYS_DIR="$REPO_ROOT/_essays"

mkdir -p "$SRC_DIR" "$PDF_DIR" "$ESSAYS_DIR"

shopt -s nullglob
tex_files=("$SRC_DIR"/*.tex)

if [ ${#tex_files[@]} -eq 0 ]; then
    echo "No .tex files found in essays/src/"
    exit 0
fi

for tex in "${tex_files[@]}"; do
    slug=$(basename "$tex" .tex)
    echo "Building: $slug"

    # Extract metadata from LaTeX comments at top of file
    title=$(grep -m1 '^\\title{' "$tex" | sed 's/^\\title{//;s/}.*//' | sed 's/\\\\//' || true)
    [ -z "$title" ] && title="$slug"

    date_str=$(grep -m1 '^% date:' "$tex" | sed 's/^% date: *//' || true)
    desc=$(grep -m1 '^% description:' "$tex" | sed 's/^% description: *//' || true)

    # Write Jekyll front matter
    out="$ESSAYS_DIR/${slug}.html"
    {
        echo "---"
        echo "layout: essay"
        printf 'title: "%s"\n' "$title"
        [ -n "$date_str" ] && printf 'date: %s\n' "$date_str"
        [ -n "$desc"     ] && printf 'description: "%s"\n' "$desc"
        printf 'pdf: /essays/pdf/%s.pdf\n' "$slug"
        echo "---"
    } > "$out"

    # Pandoc: LaTeX → HTML body (MathJax handles math)
    pandoc "$tex" -f latex -t html5 --mathjax --no-highlight >> "$out"
    echo "  ✓ HTML → _essays/${slug}.html"

    # Compile PDF in a temp dir to keep source tree clean
    tmpdir=$(mktemp -d)
    cp "$tex" "$tmpdir/"
    if cd "$tmpdir" && pdflatex -interaction=nonstopmode "${slug}.tex" > /dev/null 2>&1 \
                               && pdflatex -interaction=nonstopmode "${slug}.tex" > /dev/null 2>&1; then
        mv "${slug}.pdf" "$PDF_DIR/"
        echo "  ✓ PDF → essays/pdf/${slug}.pdf"
    else
        echo "  ⚠  PDF compilation failed — check LaTeX errors"
    fi
    cd "$REPO_ROOT"
    rm -rf "$tmpdir"
done

echo ""
echo "Done. Commit _essays/ and essays/pdf/, then run 'make serve' to preview."
