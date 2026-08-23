.PHONY: serve writing-pdfs cv build deploy

serve:
	bundle exec jekyll serve --watch

writing-pdfs:
	./scripts/build-writing-pdfs.sh

cv:
	$(MAKE) -C cv
	cp cv/poojan-shah-cv.pdf poojan-shah-cv.pdf

build:
	bundle exec jekyll build

deploy:
	git add .
	git commit -m "Update site"
	git push origin main
