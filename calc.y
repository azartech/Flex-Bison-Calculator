%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#define YYSTYPE double
int yylex(void);
void yyerror(char*);


%}

%token T_FLOAT T_INT
%right OP_EQL
%token EOL
%token SYM_PRNL SYM_PRNR SYM_COMMA
%token FUNC_L FUNC_R
%token FUNC_ABS FUNC_SIN FUNC_COS FUNC_SQRT FUNC_EXP FUNC_COSH FUNC_SINH
%token CMD_EXT
%token T_IDEN
%left OP_ADD OP_SUB
%left OP_MUL OP_DIV
%left OP_POW


%%

strt: strt stmt EOL { printf("= %lf\n", $2); }
	| strt EOL { printf("\n"); }
	| strt CMD_EXT { printf(">> Bye!\n"); exit(0); }
	|
;


stmt: T_IDEN OP_EQL expr           { $$ = $3; $1 = $3; }
    | expr                         { $$ = $1; }
;


expr: expr OP_ADD term          { $$ = $1 + $3; }
    | expr OP_SUB term         { $$ = $1 - $3; }
    | term  { $$ = $1; }
;

term: term OP_MUL unary     { $$ = $1 * $3; }
    | term OP_DIV unary       { $$ = $1 / $3; }
    | unary                     { $$ = $1; }
;

unary: OP_SUB unary            { $$ = $2 * -1; }
    | pow                       { $$ = $1; }
;

pow: factor OP_POW pow           { $$ = pow($1,$3); }
    | factor                    { $$ = $1; }
;

factor: T_IDEN                                      { $$ = $1; }
    | T_INT                                         { $$ = $1; }
    | T_FLOAT                                       { $$ = $1; }
    | SYM_PRNL expr SYM_PRNR                        { $$ = ($2); }
    | FUNC_SIN SYM_PRNL expr SYM_PRNR               { $$ = sin($3); }
    | FUNC_COS SYM_PRNL expr SYM_PRNR               { $$ = cos($3); }
    | FUNC_SQRT SYM_PRNL expr SYM_PRNR              { $$ = sqrt($3); }
    | FUNC_ABS SYM_PRNL expr SYM_PRNR               { $$ = fabs($3); }
    | FUNC_EXP SYM_PRNL expr SYM_PRNR               { $$ = exp($3); }
    | FUNC_SINH SYM_PRNL expr SYM_PRNR              { $$ = sinh($3); }
    | FUNC_COSH SYM_PRNL expr SYM_PRNR              { $$ = cosh($3); }
;


%%
void yyerror(char *s)
{
	fprintf(stderr, ">> %s\n", s);
}
int main()
{
	yyparse();
	return 0;
}
