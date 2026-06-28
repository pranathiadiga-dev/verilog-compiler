%option yylineno
%{
#include <stdio.h>
#include "yacc.h"
extern int toolgp_keyword_code(const char*str, unsigned len);
extern void yyerror (char *s);
%}

%%
[ \t]+      ;
\n          ;
[0-9]+ {
	return NUMBER;
	}
[a-zA-Z_][a-zA-Z0-9_]* {
    			int tc=toolgp_keyword_code(yytext,yyleng);
			return tc;
			}
"<="			{return NBASSIGN_OP;}
\*			{return STAR;}
@			{return AT_OP;}
=			{return ASSIGN_OP;}
,			{return COMMA;}
;			{return SEMI;}
\(			{return LPRINTH;}
\)			{return RPRINTH;}
&			{return AND_OP;}
\|			{return OR_OP;}
\^			{return XOR_OP;}
~			{return NOT_OP;}
%%

int yywrap()
{
    return 1;
}
