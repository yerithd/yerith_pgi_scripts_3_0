
FOLDER_BASENAME="${1}"
 
cd "${FOLDER_BASENAME}"

MYFILE=".allFiles_reduce_pdf_size__git_status.bak"

rm -f "$MYFILE"

git status . | awk '/.pdf/{print $2}' >> "$MYFILE"

a_prefix="./"

n=0
	
while read LINE; do
		
	ls -alh --file-type "${LINE}"
	printf "  $n) yerithx-REDUCE_PDF_size.sh ${LINE}\n"
	
	yerithx-REDUCE_PDF_size.sh ${LINE}
	
	ls -alh --file-type "${LINE}"
	printf "\n"

		
	n=$((n+1))
done < "$MYFILE"


echo "|> $(basename $0) | modified reduced size of $n PDF documents"

