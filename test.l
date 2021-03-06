%{
    #include <stdio.h>
%}

EMPTYLINE [\n]
START PROGRAM
KEY VAR|BEGIN
SPACE [ |\t]
EMPTY [ \n]
EOL [;]
SEP [,]
OPS [+|\-|*|/]
PARENS [()]

%%
"(*"([a-z]|[0-9]|[A-Z]|[:]|" "|"\n")*(-)*"*)"   {printf("");}
{START}+ {printf("%s ", yytext);}

{KEY}+ {printf("%s\n", yytext);}
{SPACE} {;}
{EMPTY}+ {printf("");}
{EOL}+ {printf(";\n");}
{SEP}+ {printf(", ");}
{OPS}+ {printf(" %s ", yytext);}
{PARENS} {printf("%s", yytext);}
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