#!/bin/sh
#@author: PROF. DIPL.-INF. DR. XAVIER NOUNDOU


YERITH_FILES_SYNC="yerith_pgi_scripts_3_0.git yerith-erp-3-0.git yerith-erp-3-0-system-daemon.git"

YERITH_REMOTE_FOLDER_RELATIVE_PREFIX_SYNC="/media/${USER}/JEOVAH-NISSI-1/yerith_local_git_repositories"

YERITH_GIT_LOCAL_REPOSITORIES="${HOME}/YERITH_GIT_LOCAL_REPOSITORIES"

if [ ! -e "${YERITH_REMOTE_FOLDER_RELATIVE_PREFIX_SYNC}" ]; then
	#echo "mkdir -p ${YERITH_REMOTE_FOLDER_RELATIVE_PREFIX_SYNC}"		
	mkdir -p "${YERITH_REMOTE_FOLDER_RELATIVE_PREFIX_SYNC}"
fi
	
for yerith_git_folder_project in $YERITH_FILES_SYNC; do
	FILE="${YERITH_GIT_LOCAL_REPOSITORIES}/${yerith_git_folder_project}"

	echo "$(basename $0):	SYNCING ${FILE}"
	
	#echo "rsync -av ${FILE} ${YERITH_REMOTE_FOLDER_RELATIVE_PREFIX_SYNC}"	
	rsync -av "${FILE}" "${YERITH_REMOTE_FOLDER_RELATIVE_PREFIX_SYNC}"	
done
