#!/bin/bash
Output="converted_"
C_Charset="nullable"
Convert="nullable"
if [ -n "$1" ] #&& [ -n "$2" ]; 
then 
     echo "[++] Get of type entity ..."
      C_Charset=$(file -i $1 | cut -d'=' -f2)
    	if [ $C_Charset = "binary" ]; 
    	then 
    	      echo "Skip binary file. Abort ..."
    	    exit 0
    	else
    	   echo "[++] Text File detected"
    	     echo "[++] Converting $1 "
    	       cat $1 | iconv -t latin1 | iconv -f cp1251 -t utf-8 >> ~/$Output$1
    	       #iconv -f $C_Charset $1 -t $2 -o ~/$Output$1 
    	   echo 'New file locate in' ~/$Output$1
    	fi 
else
     echo 'Incorrect argument. You must entry filename'
       echo 'Format to usage: ./encoder.sh /directory/filename'
     echo 'For example: ./encoder.sh /tmp/example.txt'
   exit 0 
fi
