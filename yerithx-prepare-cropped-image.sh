#!/bin/sh
IMAGE_IN_PNG_FORMAT="$1"
IMAGE_FINAL_PREFIX_NAME_WITH_NO_DOT_ENDING="${IMAGE_IN_PNG_FORMAT%.png}"
convert ${IMAGE_IN_PNG_FORMAT} "${IMAGE_FINAL_PREFIX_NAME_WITH_NO_DOT_ENDING}.pdf"
pdfcrop "${IMAGE_FINAL_PREFIX_NAME_WITH_NO_DOT_ENDING}.pdf"
mv "${IMAGE_FINAL_PREFIX_NAME_WITH_NO_DOT_ENDING}-crop.pdf" "${IMAGE_FINAL_PREFIX_NAME_WITH_NO_DOT_ENDING}.pdf"
