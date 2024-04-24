/* Design a DF in lex code which accepts string containing even number of 'a' and even no. of 'b' over input alphbet[a,b]
*/

%{
    #include<stdio.h>
%}

%s A B C DEAD

%%

<INITIAL> a BEGIN A;
<INITIAL> b BEGIN B;
<INITIAL> \n BEGIN INITIAL;  printf("Accepted");
<INITIAL> [^ab\n] BEGIN DEAD;

<A> a BEGIN INITIAL;
<A> b BEGIN C;
<A> \n BEGIN INITIAL;  printf("Rejected");
<A> [^ab\n] BEGIN DEAD;

<B> a BEGIN C;
<B> b BEGIN INITIAL;
<B> \n BEGIN INITIAL;  printf("Rejected");
<B> [^ab\n] BEGIN DEAD;

<C> a BEGIN B;
<C> b BEGIN A;
<C> \n BEGIN INITIAL;  printf("Rejected");
<C> [^ab\n] BEGIN DEAD;

<DEAD> [^\n] BEGIN DEAD;
<DEAD> \n BEGIN INITIAL; printf("Invalid input");

%%

int yywrap(){
    return 1;
}

int main(){
    yylex();
    return 0;
}
