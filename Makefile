serve:
	bundle exec jekyll serve --watch

build:
	bundle exec jekyll build

essays:
	@bash scripts/build-essays.sh

deploy:
	git add .
	git commit -m "Update site"
	git push origin main
