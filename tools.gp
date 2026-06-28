%{
#include<string.h>
#include "yacc.h"
extern int toolgp_keyword_code(const char*str, unsigned len);
%}

struct toolgp_keyword{const char*name;int tokenType;};

%%
module,K_MODULE
input,K_IP
output,K_OP
assign,K_ASSIGN
reg,K_REG
wire,K_WIRE
always,K_ALWAYS
begin,K_BEGIN
end,K_END
if,K_IF
else,K_ELSE
posedge,K_POSEDGE
negedge,K_NEGEDGE
endmodule,K_ENDMODULE
%%

int toolgp_keyword_code(const char*str,unsigned nstr)
{
	const struct toolgp_keyword*tc=check_identifier(str,nstr);
	if(tc==0)
		return IDENTIFIER;
	else
		return tc->tokenType;
}



