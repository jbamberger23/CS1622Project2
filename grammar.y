/*
	baw76 CS1622 Project 2
	Fall 2018
*/

%{
#include "proj2.h"
#include "proj2.c"
#include <stdio.h>
%}
%token <intg> ANDnum ASSGNnum DECLARATIONSnum DOTnum ENDDECLARATIONSnum EQUALnum GTnum IDnum INTnum LBRACnum LPARENnum METHODnum NEnum ORnum PROGRAMnum RBRACnum RPARENnum SEMInum VALnum WHILEnum CLASSnum COMMAnum DIVIDEnum ELSEnum EQnum GEnum ICONSTnum IFnum LBRACEnum LEnum LTnum MINUSnum NOTnum PLUSnum RBRACEnum RETURNnum SCONSTnum TIMESnum VOIDnum EOFnum
%type <tptr> Program ClassDecl ClassBody Decls FieldDecl VariableDeclId VariableInitializer ArrayInitializer ArrayCreateExp MethodDecl FormalParamList Block Type StatementList Statement AssignmentStatement MethodCallStatement Return If While Expression SimpleExpression Term Factor UnsignedConstant Variable
%%
Program : PROGRAMnum IDnum SEMInum ClassDecl
	{}
%%
int yycolumn, yyline;
FILE *treelst;
main() { treelst = stdout; yyparse();}
yyerror(char *str) {printf("yyerror: %s at line %d\n", str, yyline);}
#include "lex.yy.c"