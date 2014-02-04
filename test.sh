#!/bin/sh
r=2
p=0
if ./check_nexml_roundtrip.sh otu.xml -o
then
    p=$(expr 1 + $p)
fi
if ./check_nexson_roundtrip.sh otu.json -o
then
    p=$(expr 1 + $p)
fi
if test $r -eq $p
then
    echo "Passed all ($r) tests."
else
    echo "Passed only $p / $r tests."
fi