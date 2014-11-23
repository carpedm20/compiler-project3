%{
#include <stdio.h>
#include  "y.tab.h"

static void comment(void);
%}

O   [0-7]
H   [a-fA-F0-9]
D   [0-9]
NZ  [1-9]

L   [a-zA-Z_]
A   [a-zA-Z_0-9]

E   ([Ee][+-]?{D}+)
FS  (f|F|l|L)
IS  (u|U|l|L)*

SP  (u8|u|U|L)
ES  (\\(['"\?\\abfnrtv]|[0-7]{1,3}|x[a-fA-F0-9]+))

WS  [ \t\v\n\f]

%option yylineno

%%
"/*"             { comment(); }
"//".*           { /* consume //-comment */ }

"const"          { return CONST; }
"extern"         { return EXTERN; }
"static"         { return STATIC; }
"volatile"       { return VOLATILE; }

"continue"       { return CONTINUE; }
"break"          { return BREAK; }

"if"             { return IF; }
"then"           { return THEN; }
"else"           { return ELSE; }
"endif"          { return ENDIF; }
"for"            { return FOR; }
"endfor"         { return ENDFOR; }
"while"          { return WHILE; }
"endwhile"       { return ENDWHILE; }

"sizeof"         { return SIZEOF; }

"unsigned"       { return UNSIGNED; }
"signed"         { return SIGNED; }

"char"           { return CHAR; }
"half"           { return HALF; }
"int"            { return INT; }
"long"           { return LONG; }
"double"         { return DOUBLE; }
"float"          { return FLOAT; }
"void"           { return VOID; }
"bool"           { return BOOL; }
"return"           { return RETURN; }

{L}{A}*         { yylval.string=yytext; return IDENTIFIER; }

0[xX]{H}+{IS}?   { yylval.string=yytext; return CONSTANT; }
0{D}+{IS}?       { yylval.string=yytext; return CONSTANT; }
{D}+{IS}?        { yylval.string=yytext; return CONSTANT; }

{D}+{E}{FS}?             { yylval.string=yytext; return CONSTANT; }
{D}*"."{D}+({E})?{FS}?   { yylval.string=yytext; return CONSTANT; }
{D}+"."{D}*({E})?{FS}?   { yylval.string=yytext; return CONSTANT; }

({SP}?\"([^"\\\n]|{ES})*\"{WS}*)+ { yylval.string=yytext; return STRING_LITERAL; }

"+="          { return ADD_ASSIGN; }
"-="          { return SUB_ASSIGN; }
"*="          { return MUL_ASSIGN; }
"/="          { return DIV_ASSIGN; }
"%="          { return MOD_ASSIGN; }
"&="          { return AND_ASSIGN; }
"^="          { return XOR_ASSIGN; }
"|="          { return OR_ASSIGN; }

">>="         { return RIGHT_ASSIGN; }
"<<="         { return LEFT_ASSIGN; }
">>"          { return RIGHT_OP; }
"<<"          { return LEFT_OP; }
"->"          { return PTR_OP; }

"<="          { return LE_OP; }
">="          { return GE_OP; }
"=="          { return EQ_OP; }
"!="          { return NE_OP; }

"++"          { return INC_OP; }
"--"          { return DEC_OP; }
"&&"          { return AND_OP; }
"||"          { return OR_OP; }

";"           { return ';'; }
("{"|"<%")    { return '{'; }
("}"|"%>")    { return '}'; }
","         { return ','; }
":"         { return ':'; }
"="         { return '='; }
"("         { return '('; }
")"         { return ')'; }
("["|"<:")        { return '['; }
("]"|":>")        { return ']'; }
"."         { return '.'; }
"&"         { return '&'; }
"!"         { return '!'; }
"~"         { return '~'; }
"-"         { return '-'; }
"+"         { return '+'; }
"*"         { return '*'; }
"/"         { return '/'; }
"%"         { return '%'; }
"<"         { return '<'; }
">"         { return '>'; }
"^"         { return '^'; }
"|"         { return '|'; }
"?"         { return '?'; }

{WS}        { /* whitespace separates tokens */ }
.           { /* discard bad characters */ }

%%

/*int main(void)
{
    //extern int yydebug;
    //yydebug=1;
    yyparse();
    return 0;
}*/

int yywrap(void)
{
    return 0;
}

void yyerror(char *s)
{
  extern int yylineno;  // defined and maintained in lex
  extern char *yytext;  // defined and maintained in lex
  fprintf(stderr, "ERROR: %s at symbol '%s' on line %d\n", s,
  yytext, yylineno);
}

static void comment(void)
{
    int c;

    while ((c = input()) != 0)
        if (c == '*')
        {
            while ((c = input()) == '*')
                ;

            if (c == '/')
                return;

            if (c == 0)
                break;
        }
    printf("unterminated comment");
}
