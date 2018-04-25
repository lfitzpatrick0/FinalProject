%{
#include <stdio.h>
%}

EMPTYLINE [\n]
START PROGRAM
KEY VAR|BEGIN
SPACE [ \t]
EMPTY [ \n]
EOL [;]
SEP [,]

%%
"(*"([a-z]|[0-9]|[A-Z]|[:]|" "|"\n")*(-)*"*)"   {printf("");}
{START}+ {printf("%s ", yytext);}

{KEY}+ {printf("%s\n", yytext);}
{SPACE}+ {printf("");}
{EMPTY}+ {printf("");}
{EOL}+ {printf(";\n");}
{SEP}+ {printf(", ");}
[*=*] {printf(" = ");}
[*:*] {printf(": ");}
%%
int main()
{
    yyin = fopen("final.txt","r");
    yylex();
    return 0;
}
int yywrap()
{
    return 1;
}