#!/bin/bash

mk_note() {
    note=bibfiles/$1.md
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

for bib in bibfiles/*.bib ; do
    bibbase=$(basename ${bib%%.*})
    echo $bib $bibbase
    if [ ! -f bibfiles/$bibbase.md ] ; then
        echo "  ~ no note file ~~~ Making note now...";
        mk_note $bibbase $bib
    else
        echo "  ----------------> Note already exists!"
        #mk_note $bibbase $bib
    fi
done
