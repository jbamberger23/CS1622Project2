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

%type  <tptr>  Program ClassDecl_rec ClassDecl ClassBody Decls_rec Decls FieldDecl_rec FieldDecl VariableDeclId
%type  <tptr>  VariableInitializer ArrayInitializer ArrayCreationExpression MethodDecl_rec MethodDecl
%type  <tptr>  FormalParameterList Block Type StatementList Statement AssignmentStatement MethodCallStatement
%type  <tptr>  ReturnStatement IfStatement WhileStatement Expression SimpleExpression Term Factor
%type  <tptr>  UnsignedConstant Variable


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
ClassDecl        :      CLASSnum IDnum ClassBody /* you need to define ClassBody and more rules*/
                          { /* $$ = MakeTree(ClassDefOp, $3, MakeLeaf(IDNode, $2));*/ 
			     $$=  MakeLeaf(IDNode, $2);	
                          }
                 ;
				 
ClassBody        :      LBRACEnum Decls_rec MethodDecl_rec RBRACEnum
                          { /* $$ = MakeTree(ClassDefOp, $3, MakeLeaf(IDNode, $2));*/ 
			     $$=  MakeLeaf(IDNode, $2);	
                          }
                 ;
				 
				 
Decls_rec       :      Decls 
                          {  $$ = MakeTree(DeclOp, NullExp(), $1); } 
                 |      Decls_rec Decls
			  {  $$ = MakeTree(DeclOp, $1, $2); }
                 ;
				 
				 
Decls            :      DECLARATIONSnum FieldDecl_rec ENDDECLARATIONSnum 
                          { /* $$ = MakeTree(ClassDefOp, $3, MakeLeaf(IDNode, $2));*/ 
			     $$=  MakeLeaf(IDNode, $2);	
                          }
                 ;
				 

FieldDecl_rec    :      DECLARATIONSnum FieldDecl ENDDECLARATIONSnum 
                          { /* $$ = MakeTree(ClassDefOp, $3, MakeLeaf(IDNode, $2));*/ 
			     $$=  MakeLeaf(IDNode, $2);	
                          }
                 ;
				 
FieldDecl        :      DECLARATIONSnum FieldDecl ENDDECLARATIONSnum 
                          { /* $$ = MakeTree(ClassDefOp, $3, MakeLeaf(IDNode, $2));*/ 
			     $$=  MakeLeaf(IDNode, $2);	
                          }
                 ;
				 
				 
VariableDeclId   :      LBRACEnum 
                          { /* $$ = MakeTree(ClassDefOp, $3, MakeLeaf(IDNode, $2));*/ 
			     $$=  MakeLeaf(IDNode, $2);	
                          }
                 ;	
				 
ArrayInitializer :      LBRACEnum 
                          { /* $$ = MakeTree(ClassDefOp, $3, MakeLeaf(IDNode, $2));*/ 
			     $$=  MakeLeaf(IDNode, $2);	
                          }
                 ;
				 
ArrayCreationExpression :       
                          { /* $$ = MakeTree(ClassDefOp, $3, MakeLeaf(IDNode, $2));*/ 
			     $$=  MakeLeaf(IDNode, $2);	
                          }
                 ;
				 
MethodDecl_rec	 :       
                          { /* $$ = MakeTree(ClassDefOp, $3, MakeLeaf(IDNode, $2));*/ 
			     $$=  MakeLeaf(IDNode, $2);	
                          }
                 ;
				 
MethodDecl		 :       
                          { /* $$ = MakeTree(ClassDefOp, $3, MakeLeaf(IDNode, $2));*/ 
			     $$=  MakeLeaf(IDNode, $2);	
                          }
                 ;
				 
FormalParameterList :       
                          { /* $$ = MakeTree(ClassDefOp, $3, MakeLeaf(IDNode, $2));*/ 
			     $$=  MakeLeaf(IDNode, $2);	
                          }
                 ;
				 
Block			 :   
                          { /* $$ = MakeTree(ClassDefOp, $3, MakeLeaf(IDNode, $2));*/ 
			     $$=  MakeLeaf(IDNode, $2);	
                          }
                 ;
				 
				 
Type 			 :       
                          { /* $$ = MakeTree(ClassDefOp, $3, MakeLeaf(IDNode, $2));*/ 
			     $$=  MakeLeaf(IDNode, $2);	
                          }
                 ;
				 
				 
StatementList	 :       
                          { /* $$ = MakeTree(ClassDefOp, $3, MakeLeaf(IDNode, $2));*/ 
			     $$=  MakeLeaf(IDNode, $2);	
                          }
                 ;
				 
Statement		 :       
                          { /* $$ = MakeTree(ClassDefOp, $3, MakeLeaf(IDNode, $2));*/ 
			     $$=  MakeLeaf(IDNode, $2);	
                          }
                 ;
				 
AssignmentStatement :       
                          { /* $$ = MakeTree(ClassDefOp, $3, MakeLeaf(IDNode, $2));*/ 
			     $$=  MakeLeaf(IDNode, $2);	
                          }
                 ;
				 
MethodCallStatement :       
                          { /* $$ = MakeTree(ClassDefOp, $3, MakeLeaf(IDNode, $2));*/ 
			     $$=  MakeLeaf(IDNode, $2);	
                          }
                 ;
				 
ReturnStatement	 :       
                          { /* $$ = MakeTree(ClassDefOp, $3, MakeLeaf(IDNode, $2));*/ 
			     $$=  MakeLeaf(IDNode, $2);	
                          }
                 ;
				
IfStatement		 :       
                          { /* $$ = MakeTree(ClassDefOp, $3, MakeLeaf(IDNode, $2));*/ 
			     $$=  MakeLeaf(IDNode, $2);	
                          }
                 ;
				 
				 
WhileStatement	 :       
                          { /* $$ = MakeTree(ClassDefOp, $3, MakeLeaf(IDNode, $2));*/ 
			     $$=  MakeLeaf(IDNode, $2);	
                          }
                 ;
				 
Expression		 :       
                          { /* $$ = MakeTree(ClassDefOp, $3, MakeLeaf(IDNode, $2));*/ 
			     $$=  MakeLeaf(IDNode, $2);	
                          }
                 ;
				 
SimpleExpression :       
                          { /* $$ = MakeTree(ClassDefOp, $3, MakeLeaf(IDNode, $2));*/ 
			     $$=  MakeLeaf(IDNode, $2);	
                          }
                 ;
				 
Term			 :       
                          { /* $$ = MakeTree(ClassDefOp, $3, MakeLeaf(IDNode, $2));*/ 
			     $$=  MakeLeaf(IDNode, $2);	
                          }
                 ;
				 
Factor			 :       
                          { /* $$ = MakeTree(ClassDefOp, $3, MakeLeaf(IDNode, $2));*/ 
			     $$=  MakeLeaf(IDNode, $2);	
                          }
                 ;
				 
UnsignedConstant :       
                          { /* $$ = MakeTree(ClassDefOp, $3, MakeLeaf(IDNode, $2));*/ 
			     $$=  MakeLeaf(IDNode, $2);	
                          }
                 ;
				 
Variable		 :       
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

