serve:
	bundle exec jekyll serve --watch

build:
	bundle exec jekyll build

deploy:
	git add .
	git commit -m "Update site"
	git push origin main
