#!/bin/bash
Output="converted_"
C_Charset="nullable"
if [ -n "$1" ] && [ -n "$2" ] && [ -n "$3" ] && [ -n "$4" ]; 
then 
     if test -f ~/$Output$1 ; then 
     	  echo "Delete previous file version" 
     	rm ~/$Output$1
     fi
     	echo "[++] Get of type entity ..."
      	  C_Charset=$(file -i $1 | cut -d'=' -f2)
    	     if [ $C_Charset = "binary" ]; 
    	     then 
    	      	 echo "Skip binary file. Abort ..."
    	     exit 0
    	     else
    	      echo "[++] Text File detected"
    	      	echo "[++] Converting $1 "
    	               cat $1 | iconv -t $2 | iconv -f $3 -t $4 >> ~/$Output$1
    	             echo "Encode result:"
    	             echo 
    	               cat -n ~/$Output$1
    	          echo
    	      echo "Sucessfull... Bye"
    	   fi 
else
    echo 'Incorrect argument: '
        echo 'Reason: You must entry path to filename and set charsets for encoding text '
        echo 'Format string: ./encode.sh /directory/filename charset_1 charset_2 charset_3'
    echo 'For example: ./encode.sh /tmp/example.txt'
   exit 0 
fi

