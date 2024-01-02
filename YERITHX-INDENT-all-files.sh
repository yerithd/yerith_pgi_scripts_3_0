
FOLDER_BASENAME="${1}"
 
cd "${FOLDER_BASENAME}"

MYFILE=".allFiles_astyle.bak"

find . -name '*.h' > "$MYFILE"
find . -name '*.hpp' >> "$MYFILE"
find . -name '*.hxx' >> "$MYFILE"
find . -name '*.c' >> "$MYFILE"
find . -name '*.cxx' >> "$MYFILE"
find . -name '*.cpp' >> "$MYFILE"

a_prefix="./"

n=1
	
while read LINE; do
	LINE_PREFIX=${LINE##${a_prefix}}
		
	echo "${INDENT} "${LINE_PREFIX}""
		
	YERITHX-INDENT-with-astyle.sh "${LINE_PREFIX}"
		
	rm -f "${LINE_PREFIX}.orig"
		
	n=$((n+1))
done < "$MYFILE"

