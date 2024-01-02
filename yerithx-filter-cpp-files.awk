# @author: PROF. DIPL.-INF. DR. XAVIER NOUNDOU
#
# This awk script gets strings containing file names
# from the bash script 'yerithx-grep-return-only-filenames.sh'.
#
# The task of this script is to find the index of
# the first double colon in each line, and then remove
# the rest of the line so to get only the file name
# (e.g. src/windows/yerith-erp-main-window.cpp).

BEGIN {
}

//{
  # Variable i contains the first index of
  # a double colon (':') in the current line
  
  i = index($0, ":")

  # fileName contains all the string characters
  # from the begining of the line (index 0) till
  #the index 'i-1'.

  fileName = substr($0, 0, i-1)

  print fileName 
}

END{
}
