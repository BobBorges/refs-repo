#!/bin/bash

key=$1
PDF=$2

fixit(){
    echo "Fix that ish, yo!"
}

if [ -f $PDF ] ; then
    if [ -f /home/bob/.bibmanager/bibfiles/$key.bib ] ; then
        if [ -f /home/bob/.bibmanager/bibfiles/$key.md ] ; then
   
            bibm pdf $key $PDF $key.pdf
            sed -i "4i [[/pdf/$key.pdf]]" /home/bob/.bibmanager/bibfiles/$key.md
    
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



