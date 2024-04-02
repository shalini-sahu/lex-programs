/* Lex program to recognize whether a given sentence is simple or compound */

%{
    #include<stdio.h>
    int flag = 0;
%}

%%
and|or|but|if|then|nevertheless {flag=1;}
. ;
\n {return 0;}
%%

int yywrap(){
    return 1;
}

int main(){
    printf("enter string \n");
    yylex();
    if(flag==0){
        printf("simple");
    }else{
        printf("compound");
    }
}