
astyle \
	--indent-preprocessor \
	"${1}"

astyle \
	--attach-inlines \
	"${1}"

astyle \
	--unpad-paren \
	"${1}"

astyle \
	--indent-continuation=4 \
	--close-templates \
	--max-continuation-indent=120 \
	--indent=spaces=4 \
	--style=break \
	--attach-return-type \
	--attach-return-type-decl \
	--pad-header \
	--align-pointer=name \
	--align-reference=name \
	"${1}"
