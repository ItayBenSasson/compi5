%{
#include "Node.hpp"
#include "parser.tab.hpp"
#include "hw3_output.hpp"
#include "Node.hpp"

%}


%option yylineno
%option noyywrap


%%
int 		{yylval = new Node(yylineno); return INT;}
byte 		{yylval = new Node(yylineno); return BYTE;}
b 			{yylval = new Node(yylineno); return B;}
bool 		{yylval = new Node(yylineno); return BOOL;}
and 		{yylval = new Node(yylineno); return AND;}
or 			{yylval = new Node(yylineno); return OR;}
not 		{yylval = new Node(yylineno); return NOT;}
true 		{yylval = new Node(yylineno); return TRUE;}
false 		{yylval = new Node(yylineno); return FALSE;}
return 		{yylval = new Node(yylineno); return RETURN;}
if 			{yylval = new Node(yylineno); return IF;}
else 		{yylval = new Node(yylineno); return ELSE;}
while 		{yylval = new Node(yylineno); return WHILE;}
break 		{yylval = new Node(yylineno); return BREAK;}
continue 	{yylval = new Node(yylineno); return CONTINUE;}
; 			{yylval = new Node(yylineno); return SC;}
\(			{yylval = new Node(yylineno); return LPAREN;}
\) 			{yylval = new Node(yylineno); return RPAREN;}
\{ 			{yylval = new Node(yylineno); return LBRACE;}
\}			{yylval = new Node(yylineno); return RBRACE;}
=			{yylval = new Node(yylineno); return ASSIGN;}
\<|>|<=|>=   {yylval = new Node(yylineno); return RELOP;}
==|!= 		{yylval = new Node(yylineno); return EQ;}
\*|\/ 		{yylval = new Node(yylineno); return MULOP;}
\+|\- 		{yylval = new Node(yylineno); return ADDOP;}

[a-zA-Z][a-zA-Z0-9]* {yylval = new IdNode(yylineno, yytext) ;return ID;}
\/\/[^\r\n]*[\r\n]*		; 
0|[1-9][0-9]* {yylval = new IntNode(yylineno, yytext);return NUM;} 
\"([^\n\r\"\\]|\\[rnt"\\])+\" {yylval = new StringNode(yylineno, yytext) ;return STRING;}
[[:space:]] ;
.            {
                output::errorLex(yylineno);
                exit(0);
            }
%%