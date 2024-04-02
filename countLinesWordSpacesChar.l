/* Lex program to count the numbers of lines, word, spaces and characters in the given sentence */

%{
    #include<stdio.h>
    int lc=0, sc=0, wc=0, cc=0;
%}

%%
[\n]  {lc++; cc+=yyleng;}
[ \t]  {sc++; cc+=yyleng;}
[^\t\n ]+ {wc++; cc+=yyleng;}
%%

int yywrap(){
    return 1;
}

int main(){
    printf("enter string \n");
    yylex();
    printf("words are : %d \n",wc);
    printf("char are : %d \n",cc);
    printf("space are : %d \n",sc);
    printf("new lines are : %d \n",lc);
}