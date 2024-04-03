/*Design a LEX Code to extract all html tags in the given HTML file at run time and
store into Text file given at run time.*/

%{
#include <stdio.h>
%}

%%

"<"[^>]*>    { fprintf(yyout, "%s\n", yytext); }
.|\n         { }

%%

int main(int argc, char *argv[]) {
    if (argc != 3) {
        fprintf(stderr, "Usage: %s input_file output_file\n", argv[0]);
        return 1;
    }

    FILE *input_file = fopen(argv[1], "r");
    if (input_file == NULL) {
        fprintf(stderr, "Error: Unable to open input file.\n");
        return 1;
    }

    FILE *output_file = fopen(argv[2], "w");
    if (output_file == NULL) {
        fprintf(stderr, "Error: Unable to open output file.\n");
        fclose(input_file);
        return 1;
    }

    yyin = input_file;
    yyout = output_file;
    yylex();

    fclose(input_file);
    fclose(output_file);

    return 0;
}
