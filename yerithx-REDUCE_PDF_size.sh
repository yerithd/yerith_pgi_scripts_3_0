#!/bin/bash

INPUT_PDF_FILE="$1"

OUTPUT_PDF_FILE="${INPUT_PDF_FILE}_YRI_reduced_size.pdf"

ps2pdf -dPDFSETTINGS=/ebook "${INPUT_PDF_FILE}" "${OUTPUT_PDF_FILE}"; \
  mv "${OUTPUT_PDF_FILE}" "${INPUT_PDF_FILE}"

