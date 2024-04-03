/*Design a LEX Code to identify and print integer and float value in given Input
pattern.*/

%{
#include <stdio.h>
%}

DIGIT [0-9]
%%
{DIGIT}+"."{DIGIT}* |
{DIGIT}+    { printf("Integer: %s\n", yytext); }
{DIGIT}+"."{DIGIT}+ { printf("Float: %s\n", yytext); }
.|\n
%%

int main() {
    yylex();
    return 0;
}

