%{
    #include<stdio.h>
%}

reg (aa|bb)(a|b)*

%%

{reg} printf("%s Accepted",yytext);
.*  printf("%s NOT Accepted",yytext);

%%

int yywrap(){
    return 1;
}

int main(){
    yylex();
    return 0;
}
