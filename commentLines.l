/* Lex program to count the number of comment lines in the given c program. */

%{
    #include<stdio.h>
    int nc=0;
%}

%%
"/*"[a-zA-Z0-9 \t\n]*"*/"  {nc++;}
"//"[a-zA-Z0-9 \t]"\n" {nc++;}
%%

int yywrap(){
    return 1;
}

int main(int argc, char* argv[]){
    if(argc==2){
        yyin = fopen(argv[1],"r");
    }else{
        printf("enter input \n");
        yyin = stdin;
    }
    yylex();
    printf("no. of comment lines are : %d \n",nc);
}