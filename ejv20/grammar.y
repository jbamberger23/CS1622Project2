%{
#include  "proj2.h"
#include  <stdio.h>

  tree type_record, type_method, argtype, bractemp;/* globals used to store treenode pointers */

%}

%token <intg>  PROGRAMnum IDnum SEMInum CLASSnum  DECLARATIONSnum  ENDDECLARATIONSnum
%token <intg>  COMMAnum EQUALnum LBRACEnum RBRACEnum LBRACnum RBRACnum LPARENnum RPARENnum VOIDnum
%token <intg>  INTnum METHODnum VALnum DOTnum ASSGNnum RETURNnum IFnum ELSEnum WHILEnum
%token <intg>  LTnum LEnum EQnum NEnum GEnum GTnum PLUSnum MINUSnum ORnum TIMESnum DIVIDEnum ANDnum
%token <intg>  NOTnum ICONSTnum SCONSTnum

%type  <tptr>  Program ClassDecl_rec ClassDecl 


%%/* yacc specification*/
Program          :      PROGRAMnum IDnum SEMInum ClassDecl_rec
                        {  
                          $$ = MakeTree(ProgramOp, $4, MakeLeaf(IDNode, $2)); 
                          printtree($$, 0);
                        }
                 ;
ClassDecl_rec    :      ClassDecl                        /* 1 or More of ClassDecl */
                          {  $$ = MakeTree(ClassOp, NullExp(), $1); } 
                 |      ClassDecl_rec ClassDecl
			  {  $$ = MakeTree(ClassOp, $1, $2); }
                 ;
ClassDecl        :      CLASSnum IDnum /*ClassBody */ /* you need to define ClassBody and more rules*/
                          { /* $$ = MakeTree(ClassDefOp, $3, MakeLeaf(IDNode, $2));*/ 
			     $$=  MakeLeaf(IDNode, $2);	
                          }
                 ;

%%

int yycolumn, yyline;

FILE *treelst;

main()
{
  treelst = stdout;
  yyparse();
}

yyerror(char *str)
{
  printf("yyerror: %s at line %d\n", str, yyline);
}

#include "lex.yy.c"

