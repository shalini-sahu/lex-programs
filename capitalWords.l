/* Lex program to identify the capital words from the given input strings */

%{
  #include<stdio.h>
%}

%%
[A-Z]+[ \t\n] {printf("%s \n", yytext);}
. ;
%%

int yywrap(){
    return 1;
}

int main(){
    printf("enter the string \n");
    yylex();
}