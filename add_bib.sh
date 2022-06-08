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

mk_note() {
    note=~/.bibmanager/bibfiles/$1.md
    tick='`'
    touch $note 
    echo "# $1" > $note
    echo "" >> $note
    echo "" >> $note
    echo "" >> $note
    echo "" >> $note
    echo "$tick$tick$tick" >> $note
    echo "" >> $note
    cat $2 >> $note
    echo "" >> $note
    echo "$tick$tick$tick" >> $note
    echo "" >> $note
    echo "" >> $note
    echo "" >> $note
    echo "" >> $note
    echo "## Notes" >> $note
    echo "" >> $note
}

if [ -z $newname ] ; then
    bibbase=$(basename ${bibfile%%.*})
    echo "Adding the contents of $bibfile to the bibm database."
    bibm merge $bibfile ask
    echo "Moving $bibfile to ~/.bibmanager/bibfiles/"
    mv $bibfile ~/.bibmanager/bibfiles/$bibfile
    mk_note $bibbase ~/.bibmanager/bibfiles/$bibfile
else
    echo "Adding the contents of $bibfile to the bibm database."
    bibm merge $bibfile ask
    echo "Moving $bibfile to ~/.bibmanager/bibfiles/$newname.bib"
    mv $bibfile ~/.bibmanager/bibfiles/$newname.bib
    mk_note $newname ~/.bibmanager/bibfiles/$newname.bib
fi
