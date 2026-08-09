.PHONY: all clean

BUILD_DIR := build
TARGET := poojan-shah-cv.pdf

all: $(TARGET)

$(TARGET): cv.tex Makefile
	mkdir -p $(BUILD_DIR)
	latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir=$(BUILD_DIR) cv.tex
	cp $(BUILD_DIR)/cv.pdf $(TARGET)

clean:
	latexmk -C -outdir=$(BUILD_DIR) cv.tex
	rm -f $(TARGET)
