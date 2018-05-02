%{
    #include <stdio.h>
    #include "y.tab.h"
    extern int yylval;
%}

%%
PROGRAM return PROGRAM;

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