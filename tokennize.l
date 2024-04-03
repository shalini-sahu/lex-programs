/*Design a LEX Code for Tokenizing (Identify and print OPERATORS,
SEPERATORS, KEYWORDS, IDENTIFERS) the following C-fragment*/

%{
#include <stdio.h>
#include <string.h>
%}

%%

"auto"|"break"|"case"|"char"|"const"|"continue"|"default"|"do"|"double"|"else"|"enum"|"extern"|"float"|"for"|"goto"|"if"|"int"|"long"|"register"|"return"|"short"|"signed"|"sizeof"|"static"|"struct"|"switch"|"typedef"|"union"|"unsigned"|"void"|"volatile"|"while"   { printf("Keyword: %s\n", yytext); }
[(){}\[\],.;]   { printf("Separator: %s\n", yytext); }
"="|"=="|"!="|"<"|">"|"<="|">="|"+"|"-"|"*"|"/"|"++"|"--"|"+="|"-="|"*="|"/="|"&"|"&="|"|"|"|="|"&&"|"||"|"<<"|">>"|"<<="|">>="|"~"|"%"|"%="|"!"|"^"|"^="|"?"|":"|","|";"|".*"|"->*"|"->"   { printf("Operator: %s\n", yytext); }
[a-zA-Z_][a-zA-Z0-9_]*   { printf("Identifier: %s\n", yytext); }

%%

int main() {
    yylex();
    return 0;
}
