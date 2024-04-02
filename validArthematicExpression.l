/* Program to recognize a valid arithematic expression and to recognize the identifiers only numbers and operators only + and * present. print the separately. */

%{
    #include<stdio.h>
    #include<string.h>
    int i=0, o=0, k, flag=0;
    char id[10][10], op[10][10];
%}

%%
[0-9]+  {flag++; strcpy(id[i], yytext); i++;}
[+*]  {flag--; strcpy(op[o], yytext); o++;}
.|\n {return 0;}
%%

int yywrap(){
    return 1;
}

int main(){
    printf("enter expression \n");
    yylex();
    if(flag!=1){
        printf("\ninvalid expression\n");
    }else{
        printf("\nvalid expression\n");
        printf("\nOperators are:\n");
        for(k=0;k<o;k++){
            printf("%s\t",op[k]);
        }
        printf("\nidentifiers are:\n");
        for(k=0;k<i;k++){
            printf("%s\t",id[k]);
        }
    }
}