/*Design a LEX Code to identify and print valid Identifier of C/C++ in given Input
pattern.*/

%{
#include <stdio.h>
%}

ID [a-zA-Z_][a-zA-Z0-9_]*
%%
{ID} {
    printf("Valid Identifier: %s\n", yytext);
}
.|\n
%%

int main() {
    yylex();
    return 0;
}
