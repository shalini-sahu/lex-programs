/* Lex program to recognise and display keywords, numbers and words in a give statement */

%{
    #include<stdio.h>
%}

%%
if | else | for {printf("\n %s is a keyword", yytext);}
[0-9]+  {printf("\n %s is a number", yytext);}
[a-zA-Z]+  {printf("\n %s is a word", yytext);}
.|\n {ECHO;}
%%

int main(){
    printf("enter the string");
    yylex();
}

int yywrap(){
    return 1;
}