#!/bin/sh
fn="$1"
dir=$(dirname "$0")
"${dir}/nexson_nexml.py" -m jj "$fn" -o .1.json || exit
diff "${fn}" .1.json || exit
"${dir}/nexson_nexml.py" -m jx "$fn" -o .1.xml || exit
"${dir}/nexson_nexml.py" -m xj .1.xml -o .3.json || exit
diff "${fn}" .3.json || exit
"${dir}/nexson_nexml.py" -m jb "$fn" -o .1.bf.json || exit
"${dir}/nexson_nexml.py" -m xx .1.xml -o .2.xml || exit
diff .1.xml .2.xml || exit
"${dir}/nexson_nexml.py" -m bb .1.bf.json -o .2.bf.json || exit
diff .1.bf.json .2.bf.json || exit
"${dir}/nexson_nexml.py" -m xb .1.xml -o .3.bf.json || exit
diff .2.bf.json .3.bf.json || exit
"${dir}/nexson_nexml.py" -m xj .1.xml -o .3.json || exit
diff "${fn}" .3.json || exit
"${dir}/nexson_nexml.py" -m bj .1.bf.json -o .4.json || exit
diff "${fn}" .4.json || exit
"${dir}/nexson_nexml.py" -m bx .1.bf.json -o .3.xml || exit
diff .1.xml .3.xml || exit
rm .1.bf.json .2.bf.json .3.bf.json .3.json .3.xml .4.json
echo "${fn} passed tour test"