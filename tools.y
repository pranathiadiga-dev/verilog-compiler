%{
#include <stdio.h>
extern int yylineno;
extern int yylex();
extern void yyerror(char *s);
extern char *yytext;
%}
%token udp_description
%token LPRINTH RPRINTH COMMA SEMI IDENTIFIER 
%token ASSIGN_OP AND_OP OR_OP XOR_OP NOT_OP NUMBER AT_OP STAR NBASSIGN_OP
%token K_IP K_OP K_MODULE K_ENDMODULE K_REG K_WIRE K_ASSIGN K_ALWAYS K_BEGIN K_END K_IF K_ELSE K_POSEDGE K_NEGEDGE
%%
start:design_descr
     |
;
design_descr:module_description
	    |udp_description
;
module_description:K_MODULE IDENTIFIER LPRINTH port_list_opt RPRINTH SEMI module_items_opt K_ENDMODULE
;
identifier_list:identifier_list COMMA IDENTIFIER
	       | IDENTIFIER
;
port_dec1:K_IP identifier_list
	 |K_OP identifier_list
	 |K_OP K_REG identifier_list 
;
port_decl:K_IP IDENTIFIER
	 |K_OP IDENTIFIER
	 
;
port_list_opt:port_list
	     | 
;
port_list:port_list COMMA port_decl
	 | port_decl
	 |port_list COMMA IDENTIFIER
	 |IDENTIFIER
;
module_items_opt:module_items
		|
;
expr:
      IDENTIFIER
    |NUMBER
    | NOT_OP IDENTIFIER
    | IDENTIFIER AND_OP IDENTIFIER
    | IDENTIFIER OR_OP IDENTIFIER
    | IDENTIFIER XOR_OP IDENTIFIER
    | LPRINTH expr RPRINTH
;
reg_decl:K_REG identifier_list SEMI;

wire_decl:K_WIRE identifier_list SEMI;

assign_stmt:K_ASSIGN IDENTIFIER ASSIGN_OP expr SEMI;

behavioral_stmt:IDENTIFIER ASSIGN_OP expr SEMI
	       |IDENTIFIER NBASSIGN_OP expr SEMI
;
if_stmt:K_IF LPRINTH expr RPRINTH behavioral_stmt
       |K_IF LPRINTH expr RPRINTH behavioral_stmt 
	K_ELSE behavioral_stmt
;

stmt_list:stmt_list stmt
	 |stmt
;
stmt:behavioral_stmt
    |if_stmt
;
senst_list:identifier_list
	  |STAR
	  |K_POSEDGE IDENTIFIER
	  |K_NEGEDGE IDENTIFIER
;

always_bl:K_ALWAYS AT_OP LPRINTH senst_list RPRINTH K_BEGIN stmt_list K_END;

module_items:module_items module_item
	    |module_item
;
module_item:port_dec1 SEMI
	    |assign_stmt
	    |reg_decl
	    |wire_decl
	    |always_bl
	    |behavioral_stmt
;
%%
void yyerror(char *s)
{
printf("%s near '%s' at line %d\n",s,yytext, yylineno);
}
