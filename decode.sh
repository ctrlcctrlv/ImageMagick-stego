#!/bin/bash
source vars.sh
PAD=`echo "$INP" | sed 's/\.png$//; s/.*_\([0-9]\+\)$/\1/g'`
$IM $RESIZE 25% $INP $DEPTHT:"$TEMPFILE"
truncate $TEMPFILE -s -$PAD
source output.sh
