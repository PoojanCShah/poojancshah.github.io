serve:
	bundle exec jekyll serve --watch

writing-pdfs:
	./scripts/build-writing-pdfs.sh

build:
	bundle exec jekyll build

deploy:
	git add .
	git commit -m "Update site"
	git push origin main
