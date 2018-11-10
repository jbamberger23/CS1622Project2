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
<<<<<<< HEAD
Program : PROGRAMnum IDnum SEMInum ClassDecl_rec
          {  
			$$ = MakeTree(ProgramOp, $4, MakeLeaf(IDNode, $2)); 
            printtree($$, 0);
          }
        ;
		
ClassDecl_rec : ClassDecl /* 1 or More of ClassDecl */
                {  $$ = MakeTree(ClassOp, NullExp(), $1); } 
              | ClassDecl_rec ClassDecl
				{  $$ = MakeTree(ClassOp, $1, $2); }
              ;
			  
ClassDecl : CLASSnum IDnum ClassBody /* you need to define ClassBody and more rules*/
            { /* $$ = MakeTree(ClassDefOp, $3, MakeLeaf(IDNode, $2));*/ 
				$$=  MakeLeaf(IDNode, $2);	
            }
          ;
				 
ClassBody : LBRACEnum Decls_rec MethodDecl_rec RBRACEnum
            { /* $$ = MakeTree(ClassDefOp, $3, MakeLeaf(IDNode, $2));*/ 
				$$=  MakeLeaf(IDNode, $2);	
            }
          ;
				 
				 
/*Decls_rec : Decls 
              {  $$ = MakeTree(DeclOp, NullExp(), $1); } 
            | Decls_rec Decls
			  {
				
			  }
			;*/
				 
Decls : DECLARATIONSnum FieldDecl_rec ENDDECLARATIONSnum 
        { /* $$ = MakeTree(ClassDefOp, $3, MakeLeaf(IDNode, $2));*/ 
			$$=  MakeLeaf(IDNode, $2);	
        }
        ;
				 
FieldDecl_rec : FieldDecl 
                { /* $$ = MakeTree(ClassDefOp, $3, MakeLeaf(IDNode, $2));*/ 
					$$=  MakeLeaf(IDNode, $2);	
                }
			  | FieldDecl_rec FieldDecl
				{
							
				}
              ;
				 
FieldDecl : Type FieldDecl_2
            { /* $$ = MakeTree(ClassDefOp, $3, MakeLeaf(IDNode, $2));*/ 
				$$=  MakeLeaf(IDNode, $2);	
            }
          ;
				
FieldDecl_2 : VariableDeclId EQUALnum VariableInitializer SEMInum /* Handles multiple defs in same line*/
			  {
							
			  }
			| VariableDeclId EQUALnum VariableInitializer COMMAnum FieldDecl_2
			  {
							
			  }
			| VariableDeclId COMMAnum FieldDecl_2	
			  {
				
			  }
			| VariableDeclId SEMInum
			  {
				
			  }
			;	 
				 
VariableDeclId : IDnum 
                 { 
					
                 }
				| IDnum LBRACnum RBRACnum
				{
					
				}
               ;

VariableInitializer_rec : VariableInitializer COMMAnum
						  {
						  
						  }
						| VariableInitializer_rec VariableInitializer COMMAnum
						  {
						  
						  }
						;
						
VariableInitializer : Expression
					  {
						
					  }
					| ArrayInitializer
					  {
						
					  }
					| ArrayCreationExpression
					  {
					  
					  }
					;
				 
ArrayInitializer : LBRACEnum VariableInitializer RBRACEnum
                   { 
						
                   }
				 | LBRACEnum VariableInitializer_rec VariableInitializer RBRACEnum
				   {
				   
				   }
                 ;
				 
ArrayCreationExpression : INTnum ArrayCreationExpression_2
                        { /* $$ = MakeTree(ClassDefOp, $3, MakeLeaf(IDNode, $2));*/ 
							$$=  MakeLeaf(IDNode, $2);	
                        }
                 ;
				 
ArrayCreationExpression_2 : LBRACnum Expression RBRACnum
							{
								
							}
						  | LBRACnum Expression RBRACnum ArrayCreationExpression_2
						    {
								
							}
						  ;
				 
MethodDecl_rec : MethodDecl
                 { /* $$ = MakeTree(ClassDefOp, $3, MakeLeaf(IDNode, $2));*/ 
					$$=  MakeLeaf(IDNode, $2);	
                 }
			   | MethodDecl_rec MethodDecl
				 {
					
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
<<<<<<< HEAD
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
<<<<<<< HEAD
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

