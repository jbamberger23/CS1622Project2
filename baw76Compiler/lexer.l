%{

#include <stdlib.h>
#include <string.h>
#include "token.h"

#define LIMIT1 500
extern int yycolumn, yylength, yyline, yylval;

void stringTable(char* string);
void ReportError(char* message, int line, int column);
char* toLowerCase(char* string);
int searchTable(char* string);
int insertString(char* string);
void updateLineCol();
%}

letter [a-zA-Z]
digit [0-9]
IntegerConstant {digit}{digit}*
newline \n
StringConstant \"[^"\r\n]*\"
NonTerminatingString \"[^"\r\n]*
ErrorString \"[^"\r\n]*(\"|\n|\r)[^"\r\n]*\"
Identifier ({letter}|"_")({letter}|{digit}|"_")*
ErrorIdentifier {IntegerConstant}{Identifier}
Whitespace [ \t][ \t]*
LineComment "//"[^\r\n]*[\r\n]
ErrorLineComment "//"[^\r\n]*
MultiLineComment "/*"[^*\n]"*/"
ErrorMultiLineComment "/*"[^*\n]"*"\n

%%

{newline} {updateLineCol();}
{Whitespace} {updateLineCol();}
{LineComment} {updateLineCol();}
MultiLineComment {updateLineCol();}
"&&" {updateLineCol(); return(ANDnum);}
":=" {updateLineCol(); return(ASSGNnum);}
"declarations" {updateLineCol(); return(DECLARATIONSnum);}
"." {updateLineCol(); return(DOTnum);}
"enddeclarations" {updateLineCol(); return(ENDDECLARATIONSnum);}
"=" {updateLineCol(); return(EQUALnum);}
">" {updateLineCol(); return(GTnum);}
"int" {updateLineCol(); return(INTnum);}
"[" {updateLineCol(); return(LBRACnum);}
"(" {updateLineCol(); return(LPARENnum);}
"method" {updateLineCol(); return(METHODnum);}
"!=" {updateLineCol(); return(NEnum);}
"||" {updateLineCol(); return(ORnum);}
"program" {updateLineCol(); return(PROGRAMnum);}
"]" {updateLineCol(); return(RBRACnum);}
")" {updateLineCol(); return(RPARENnum);}
";" {updateLineCol(); return(SEMInum);}
"val" {updateLineCol(); return(VALnum);}
"while" {updateLineCol(); return(WHILEnum);}
"class" {updateLineCol(); return(CLASSnum);}
"," {updateLineCol(); return(COMMAnum);}
"/" {updateLineCol(); return(DIVIDEnum);}
"else" {updateLineCol(); return(ELSEnum);}
"==" {updateLineCol(); return(EQnum);}
">=" {updateLineCol(); return(GEnum);}
"if" {updateLineCol(); return(IFnum);}
"{" {updateLineCol(); return(LBRACEnum);}
"<=" {updateLineCol(); return(LEnum);}
"<" {updateLineCol(); return(LTnum);} 
"-" {updateLineCol(); return(MINUSnum);}
"!" {updateLineCol(); return(NOTnum);}
"+" {updateLineCol(); return(PLUSnum);}
"}" {updateLineCol(); return(RBRACEnum);}
"return" {updateLineCol(); return(RETURNnum);}
"*" {updateLineCol(); return(TIMESnum);}
"void" {updateLineCol(); return(VOIDnum);}
{Identifier} {updateLineCol(); stringTable(yytext); return(IDnum);}
{IntegerConstant} {updateLineCol(); yylval = atoi(yytext); return(ICONSTnum);}
{StringConstant} {updateLineCol(); stringTable(yytext); return(SCONSTnum);}
<<EOF>> {updateLineCol(); return(EOFnum);}
{ErrorIdentifier} {updateLineCol(); ReportError("Identifier starting with integer.\n", yyline, yycolumn);}
{ErrorLineComment} {updateLineCol(); ReportError("Non-ending line comment.\n", yyline, yycolumn);}
{ErrorString} {updateLineCol(); ReportError("Incorrect string format.\n", yyline, yycolumn);}
{NonTerminatingString} {updateLineCol(); ReportError("Non-terminating string.\n", yyline, yycolumn);}
{ErrorMultiLineComment} {updateLineCol(); ReportError("Non-terminating multi-line comment\n", yyline, yycolumn);}

%%

int tableIndex = 0;
char symbolTable[LIMIT1 + 1];
int yyline = 1;
int yycolumn = 1;
int yylval = 0;

void ReportError(char* message, int line, int column)
{
	printf("Error: %s. Reported at line column:.\n", message, line, column);
}

int yywrap(void)
{
	return 1;
}

//I wanted to make the updating easier instead of doing operations in the expressions
void updateLineCol()
{
	if(yytext[0] == '\n')
	{
		yyline++;
		yycolumn = 0;
	}
	else
	{
		int i;
		for(i = 0; yytext[i] != '\0'; i++)
		{
			if(yytext[i] == '\t')
			{
				yycolumn += 4 - (yycolumn % 4);
			}
			else 
			{
				yycolumn++;
			}
		}
	}
}

void stringTable(char* string)
{
	int i = searchTable(string);
	if(i == -1)
	{
		string = toLowerCase(string);
		yylval = insertString(string);
	}
	else
	{
		yylval = i;
	}
}

int searchTable(char* string)
{
	int i = 0;
	char word[LIMIT1];
	symbolTable[LIMIT1] = '\0';
	
	while(i < LIMIT1)
	{
		strcpy(&word[0], &(symbolTable[i]));
		
		if(!strcasecmp(word, string))
		{
			return i;
		}
		else
		{
			i = i + strlen(word);
		}
		i++;
	}
	return -1;
}

int insertString(char* string)
{
	if(strlen(string) + tableIndex >= LIMIT1)
	{
		return -1;
	}
	
	strcpy(&(symbolTable[tableIndex]), string);
	
	int oldIndex = tableIndex;
	tableIndex += strlen(string) + 1;
	return oldIndex;
}

char* toLowerCase(char* string)
{
	int i;
	for(i = 0; i < yyleng; i++)
	{
		if('A' <= string[i] && string[i] <= 'Z')
		{
			string[i] = string[i] - 'A' + 'a';
		}
	}
	return string;
}



















