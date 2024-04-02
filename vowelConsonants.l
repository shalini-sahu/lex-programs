/* Lex program to count the number of vowels and consonants from the given input string.*/

%{
    #include<stdio.h>
    int v=0, c=0;
%}

%%
[ \t\n]+ ;
[aeiouAEIOU] {v++;}
[^aeiouAEIOU] {c++;}
%%

int yywrap(){
    return 1;
}

int main(){
    printf("enter the string \n");
    yylex();
    printf("%d vowel \n %d consonants",v,c);
}