%{
#include <stdio.h>
#include <string.h>
void yyerror(const char *str)
{
fprintf(stderr,"error: %s\n",str);
}
int yywrap()
{
return 1;
}
int main()
{
yyparse();
return 0;
}
%}

%token PROGRAM

%%

prog:
    PROGRAM
    {
        $$ = $1;
        printf("found program %s", $1);
    }
    ;