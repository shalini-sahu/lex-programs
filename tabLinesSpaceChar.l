/*Design a LEX Code to count the number of lines, space, tab-meta character and
rest of characters in a given Input pattern.*/

%{
int line_count = 0;
int space_count = 0;
int tab_meta_count = 0;
int rest_count = 0;
%}

%%
\n  { line_count++; }
[ \t] { space_count++; }
[^\n \t] { rest_count++; }
.    { tab_meta_count++; }
%%

int main() {
    yylex();
    printf("Lines: %d\nSpaces: %d\nTabs/Meta Characters: %d\nRest of Characters: %d\n",
           line_count, space_count, tab_meta_count, rest_count);
    return 0;
}
