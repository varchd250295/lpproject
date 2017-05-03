%option noyywrap
%{
#include <stdio.h>
#include "project.tab.h"
%}

letter	[A-Za-z]
digit	[0-9]

%%
{letter}({letter}|{digit})*"("(.)*")"      {yylval=yytext;return METHOD;} 
"byte "(.)*[^;] 		{yylval=yytext;return BYTE;}
"short "(.)*[^;]   {yylval=yytext;return SHORT;}
"int "(.)*[^;]   {yylval=yytext;return INT;}
"long "(.)*[^;]  {yylval=yytext;return LONG;}
"float "(.)*[^;]   {yylval=yytext;return FLOAT;}
"double "(.)*[^;]   {yylval=yytext;return DOUBLE;}
"char "(.)*[^;]   {yylval=yytext;return CHAR;}
.|\n	;
%%