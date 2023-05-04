#!/bin/bash

key=$1
PDF=$2

fixit(){
    echo "Fix that ish, yo!"
}
if [ -z ${key} ] ; then
	echo "Usage: addPDF \$key \$pdf"
	fixit
	exit
fi

if [ -f $PDF ] ; then
    if [ -f /home/bob/.bibmanager/bibfiles/$key.bib ] ; then
        if [ -f /home/bob/.bibmanager/bibfiles/$key.org ] ; then
   
            bibm pdf $key $PDF $key.pdf
            sed -i "4i [[../pdf/$key.pdf]]" /home/bob/.bibmanager/bibfiles/$key.org
    	    sed -i "5i [[file:../pdf/$key.pdf]]" /home/bob/.bibmanager/bibfiles/$key.org
        else

            echo "There's no note for $key -- $key.md"
            fixit
            exit

        fi
    else

        echo "There's no bibfile for $key"
        fixit
        exit

    fi
else

    echo "PDF file -- $PDF -- doesn't exist"
    fixit
    exit

fi



