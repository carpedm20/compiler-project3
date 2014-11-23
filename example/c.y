%{
#include <stdio.h>
#include <string.h>
//#define YYDEBUG 1
//extern int yydebug;
%}
%token NAME NUMBER
%%
statement:    NAME '=' expression
            | expression  { printf("= %d\n", $1); }
            ;
expression:   expression '+' NUMBER { $$ = $1 + $3; }
            |   expression '-' NUMBER { $$ = $1 - $3; }
            |   NUMBER  { $$ = $1; }
            ;
