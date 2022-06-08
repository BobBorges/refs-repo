#!/bin/bash


key=$1
PDF=$2

fixit(){
    echo "Fix that ish, yo!"
}

if [ -f $PDF ] ; then
    if [ -f /home/bob/.bibmanager/bibfiles/$key.bib ] ; then
        if [ -f /home/bob/.bibmanager/bibfiles/$key.md ] ; then

            mv $PDF /home/bob/.bibmanager/pdf/
            ln -sr /home/bob/.bibmanager/pdf/$PDF /home/bob/.bibmanager/pdf/$key.pdf
            bibm pdf $key /home/bob/.bibmanager/pdf/$key.pdf
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
