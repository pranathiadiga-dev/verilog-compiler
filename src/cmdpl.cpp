include<stdio.h>
#include<string.h>
extern int yyparse();
extern FILE *yyin;
int main(int argc,char *argv[])
{
	int status=0;
	yyin=fopen(argv[1],"r");
	status=yyparse();
	if (status==0)
		printf("the file ran successfully\n");
	return status;
}

