/*Design a LEX Code to remove the comments from any C-Program given at run-time
and store into ‘out.c’ file.*/

%{
#include <stdio.h>
%}

%%
"/*"    {   int c;
            while ((c = input()) != EOF) {
                if (c == '*') {
                    if ((c = input()) == '/') break;
                }
            }
        }
"//"    {   int c;
            while ((c = input()) != '\n' && c != EOF);
        }
.       {   putchar(yytext[0]); }
%%

int main(int argc, char *argv[]) {
    if (argc != 2) {
        fprintf(stderr, "Usage: %s input_file\n", argv[0]);
        return 1;
    }

    FILE *input_file = fopen(argv[1], "r");
    if (input_file == NULL) {
        fprintf(stderr, "Error: Unable to open input file.\n");
        return 1;
    }

    FILE *output_file = fopen("out.c", "w");
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
