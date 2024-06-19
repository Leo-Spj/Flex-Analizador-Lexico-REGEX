#!/bin/bash
proyecto=$1

if [ -z $proyecto ]; then
	echo "Falta el nombre del proyecto"
	exit 1
fi

if [ -d $proyecto ]; then
	echo "El proyecto ya existe"
	exit 1
fi

mkdir $proyecto
cd $proyecto
touch $proyecto.l

codigo=$(cat <<-EOF
%option noyywrap
%{
	#include<stdio.h>
%}


%%


%%

int main()
{
	yyin=stdin;
	yylex();
	return 0;
}
EOF
)
echo "$codigo" > $proyecto.l