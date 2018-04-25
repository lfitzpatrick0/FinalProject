%{
#include <stdio.h>
%}

VAR|BEGIN|PRINT|END {printf( "A keyword: %s\n", yytext );}

space [ \t]
emptyline [\n ' ']
semicolon [;]

%%
"(*"([a-z]|[0-9]|[A-Z]|[:]|" "|"\n")*(-)*"*)"   {printf("\n");}

{space}+ printf("\n");

{emptyline}+ printf(" ");

{semicolon}+ printf(";\n");
. ECHO;

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