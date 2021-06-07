#!/bin/bash
source vars.sh
INT=$(echo sqrt\($FILESIZE.0/$DEPTH.0\)|bc -l|ceil)
while [ $(((INT*INT)%DEPTH)) -ne 0 ]; do INT=$((INT+1)); done
INT2=$(echo "($INT*$INT)"|bc -l)
PAD=$(echo "($INT2-($FILESIZE/$DEPTH.0))*$DEPTH.0"|bc -l|ceil)

>&2 echo "Filesize: $FILESIZE, Sqrt: $INT, Sqrt*2: $INT2, so pad $PAD. $TEMPFILE"

cp "$1" "$TEMPFILE" && \
truncate -s +$PAD "$TEMPFILE" && \
TEMPFILE=${TEMPFILE}_$PAD.png
$IM -size ${INT}x${INT} $DEPTHT:"$TEMPOUT" $RESIZE 400% "$TEMPFILE" && \
source output.sh
