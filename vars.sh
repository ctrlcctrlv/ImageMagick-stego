shopt -s expand_aliases
IM=convert
INP=$1
OUT=$2
DEPTH=$3
if [ -z $DEPTH ]; then DEPTH=1; fi
TYPE=("nil" "gray" "nil" "rgb" "rgba")
DEPTHT="-depth 8 ${TYPE[DEPTH]}"
if [[ "$DEPTHT" =~ "nil" ]]; then exit 1; fi
if [ -z "$INP" ]; then exit 126; fi
alias ceil='perl -pE '\''use POSIX;$_=ceil($_)'\'
TEMPFILE=`mktemp`
TEMPOUT=$TEMPFILE
FILESIZE=`stat --format=%s "$INP"`
RESIZE='-filter point -resize'
