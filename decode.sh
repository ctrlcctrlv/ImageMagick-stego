#!/bin/bash
INP=$1
OUT=$2
if [ -z $INP ]; then exit 1; fi
PAD=`echo "$1" | sed 's/\.png$//; s/.*_\([0-9]\+\)$/\1/g'`
TEMPFILE=`mktemp`
convert -filter point -resize 25% $INP gray:"$TEMPFILE"
truncate $TEMPFILE -s -$PAD
if [ -z $OUT ]; then echo $TEMPFILE;
else mv $TEMPFILE $OUT; fi
