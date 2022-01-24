#!/bin/bash

: '
This script will merge a new entry to the bibm database 
and move the .bib file itself to bibfiles/. If a newname
argument is supplied, it will rename the .bib file to
the newname + ".bib". This is, of course, potentially
unnecessary, but I dont like to delete stuff as personal
preference, and I dont want .bib files cluttering up
my downloads folder.
--------------------
          \
           \
               .--.
              |o_o |
              |:_/ |
             //   \ \
            (|     | )
           /`\_   _/`\
           \___)=(___/
'

bibfile="$1"
newname="$2"

if [ -z $newname ] ; then
    echo "Adding the contents of $bibfile to the bibm database."
    bibm merge $bibfile ask
    echo "Moving $bibfile to ~/.bibmanager/bibfiles/"
    mv $bibfile ~/.bibmanager/bibfiles/$bibfile
else
    echo "Adding the contents of $bibfile to the bibm database."
    bibm merge $bibfile ask
    echo "Moving $bibfile to ~/.bibmanager/bibfiles/$newname.bib"
    mv $bibfile ~/.bibmanager/bibfiles/$newname.bib
fi
