%{
#include <stdio.h>
int var=0,meth=0;
%}

%token BYTE SHORT INT LONG FLOAT DOUBLE CHAR METHOD


%%

bc : project|bc project ;
project:
	BYTE	 { printf(" Variable - %s \r\n",$1); char c[100]; strcpy(c,$1); if(c[5]!='\0')var++; for(int i=5;c[i]!='\0';i++) if(c[i]==',')var++; }
	| SHORT	 { printf(" Variable - %s \r\n",$1); char c[100]; strcpy(c,$1); if(c[6]!='\0')var++; for(int i=6;c[i]!='\0';i++) if(c[i]==',')var++;  }
	| INT 	 { printf(" Variable - %s \r\n",$1); char c[100]; strcpy(c,$1); if(c[4]!='\0')var++; for(int i=4;c[i]!='\0';i++) if(c[i]==',')var++; }
	| LONG 	 { printf(" Variable - %s \r\n",$1); char c[100]; strcpy(c,$1); if(c[5]!='\0')var++; for(int i=5;c[i]!='\0';i++) if(c[i]==',')var++;  }
	| FLOAT { printf(" Variable - %s \r\n",$1); char c[100]; strcpy(c,$1); if(c[6]!='\0')var++; for(int i=6;c[i]!='\0';i++) if(c[i]==',')var++;  }
	| DOUBLE  { printf(" Variable - %s \r\n",$1); char c[100]; strcpy(c,$1); if(c[7]!='\0')var++; for(int i=7;c[i]!='\0';i++) if(c[i]==',')var++;  }
	| CHAR  { printf(" Variable - %s \r\n",$1); char c[100]; strcpy(c,$1); if(c[5]!='\0')var++; for(int i=5;c[i]!='\0';i++) if(c[i]==',')var++;  }
	| METHOD  { printf(" Method - %s \r\n",$1); meth++; }
	;
%%

void yyerror(char *s)
{
	printf(" Bhai, aapse galti ho gayi. LOL = %s ",s);
	exit(-1);
}

extern FILE *yyin;

main()
{
	
	yyin=fopen("input.txt","r");
	
	yyparse();	
	
	printf("\r\n NUMBER OF VARIABLES :\t %d \r\n",var);
	printf(" NUMBER OF METHODS :\t %d \r\n",meth);
	
}
