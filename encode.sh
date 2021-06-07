#!/bin/bash
FILESIZE=`stat --format=%s "$1"`
INT=$(echo sqrt\($FILESIZE.0\) | bc -l | perl -pE 'use POSIX;$_=ceil($_)')
INT2=$(echo $INT*$INT|bc -l)
PAD=$(echo $INT2-$FILESIZE|bc -l)
TEMPFILE=`mktemp`

>&2 echo "Debug: Filesize: $FILESIZE; Sqrt: $INT, Sqrt*2: $INT2, so pad $PAD. $TEMPFILE"

cp "$1" "$TEMPFILE" && \
chmod 666 "$TEMPFILE" && \
truncate -s +$PAD "$TEMPFILE" && \
convert -size ${INT}x${INT} -depth 8 gray:"$TEMPFILE" -filter point -resize 400% "${TEMPFILE}_$PAD.png" && \
echo ${TEMPFILE}_$PAD.png
