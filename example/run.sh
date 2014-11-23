#!/bin/sh
lex -d c.l
yacc -dv -o y.tab.c c.y
cc lex.yy.c y.tab.c -ll -o testt
#gcc lex.yy.o y.tab.c -o proj3
#gcc -o proj3 y.tab.h lex.yy.o -lfl
gcc -o proj3 y.tab.c lex.yy.c -lfl
./testt
