%{
#include <stdio.h>
#include  "y.tab.h"
extern int  yylval;
%}
%option yylineno

%%
[0-9]+ { return NUMBER;  }
[\t ]+ ;
\n return 0;
. return  yytext[0];
%%

int main(void)
{
    //extern int yydebug;
    //yydebug=1;

    yyparse();
    return 0;
}

int yywrap(void)
{
    return 0;
}

void yyerror(char *s)
{
  extern char *yytext;  // defined and maintained in lex
  fprintf(stderr, "ERROR: %s at symbol '%s' on line %d\n", s,
  yytext, yylineno);
}
