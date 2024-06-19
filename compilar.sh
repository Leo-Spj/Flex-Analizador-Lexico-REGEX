#!/bin/bash
dir=$1

file=$(find $dir -type f -name "*.l")

if [ -z "$file" ]; then
    echo "Archivo '.l' no encontrado"
    exit 1
fi

cd $(dirname $file)

echo "flex $(basename $file)"
flex $(basename $file) 

echo "gcc lex.yy.c"
gcc lex.yy.c 

echo "a.exe"
./a.exe
