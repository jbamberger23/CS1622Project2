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
				 
MethodDecl : METHODnum Type IDnum LPARENnum RPARENnum Block
             { /* $$ = MakeTree(ClassDefOp, $3, MakeLeaf(IDNode, $2));*/ 
				$$=  MakeLeaf(IDNode, $2);	
             }
		   | METHODnum VOIDnum IDnum LPARENnum RPARENnum Block
			 {
				
			 }
		   | METHODnum Type IDnum LPARENnum FormalParameterList RPARENnum Block
		     {
				
			 }
		   | METHODnum VOIDnum IDnum LPARENnum FormalParameterList RPARENnum Block
			 {
				
			 }
           ;

IDList : IDnum COMMAnum
		 {
			
		 }
	   | IDList IDnum COMMAnum
	     {
			
		 }
	   ;
FormalParameter : VALnum INTnum IDnum
				  {
					
				  }
				| VALnum INTnum IDList IDnum
				  {
					
				  }
				| INTnum IDnum
				  {
					
				  }
				| INTnum IDList IDnum
				  {
					
				  }
				;
				 
FormalParameterList : FormalParameter
                      {	
						
                      }
					| FormalParameterList SEMInum FormalParameter
					  {
						
					  }
                    ;
				 
Block : Decls StatementList
        { /* $$ = MakeTree(ClassDefOp, $3, MakeLeaf(IDNode, $2));*/ 
			$$=  MakeLeaf(IDNode, $2);	
        }
      ;
				 
				 
Type : IDnum 
       { /* $$ = MakeTree(ClassDefOp, $3, MakeLeaf(IDNode, $2));*/ 
		 $$=  MakeLeaf(IDNode, $2);	
       }
	 | INTnum 
	   {
		 
	   }
	 | IDnum Type_2
	   {
		 
	   }
	 | INTnum Type_2
     ;
	
Type_2 : LBRACnum RBRACnum
		 {
			
		 }
	   | Type_2 LBRACnum RBRACnum
	     {
			
		 }
	   ;
				 
StatementList : LBRACEnum Statement RBRACEnum
                { /* $$ = MakeTree(ClassDefOp, $3, MakeLeaf(IDNode, $2));*/ 
					$$=  MakeLeaf(IDNode, $2);	
                }
			  | LBRACEnum Statement_2 Statement RBRACEnum
				{
					
				}
			  | LBRACEnum RBRACEnum
			    {
					
				}
              ;
				 
Statement : AssignmentStatement
            { /* $$ = MakeTree(ClassDefOp, $3, MakeLeaf(IDNode, $2));*/ 
				$$=  MakeLeaf(IDNode, $2);	
            }
	      | MethodCallStatement
			{
				
			}
		  | ReturnStatement
		    {
				
			}
		  | IfStatement
		    {
				
			}
		  | WhileStatement
		    {
				
			}
          ;
				 
AssignmentStatement : Variable SEMInum EQUALnum Expression
                      { /* $$ = MakeTree(ClassDefOp, $3, MakeLeaf(IDNode, $2));*/ 
						$$=  MakeLeaf(IDNode, $2);	
                      }
                    ;
				 
MethodCallStatement : Variable LPARENnum RPARENnum
                      { /* $$ = MakeTree(ClassDefOp, $3, MakeLeaf(IDNode, $2));*/ 
						$$=  MakeLeaf(IDNode, $2);	
                      }
					| Variable LPARENnum Expression RPARENnum
					  {
						
					  }
					| Variable LPARENnum Expression_2 Expression RPARENnum
					  {
						
					  }
                    ;
				 
ReturnStatement : RETURNnum
                  { /* $$ = MakeTree(ClassDefOp, $3, MakeLeaf(IDNode, $2));*/ 
					$$=  MakeLeaf(IDNode, $2);	
                  }
				| RETURNnum Expression
				  {
					
				  }
                ;
				
IfStatement : IFnum Expression StatementList
              { /* $$ = MakeTree(ClassDefOp, $3, MakeLeaf(IDNode, $2));*/ 
				$$=  MakeLeaf(IDNode, $2);	
              }
			| IFnum Expression StatementList ELSEnum StatementList
			  {
				
			  }
			| IFnum Expression StatementList ELSEnum IfStatement
			  {
				
			  }
            ;
				 
				 
WhileStatement : WHILEnum Expression StatementList
                 { /* $$ = MakeTree(ClassDefOp, $3, MakeLeaf(IDNode, $2));*/ 
					$$=  MakeLeaf(IDNode, $2);	
                 }
               ;
				 
Expression : SimpleExpression LTnum SimpleExpression
             { /* $$ = MakeTree(ClassDefOp, $3, MakeLeaf(IDNode, $2));*/ 
				$$=  MakeLeaf(IDNode, $2);	
             }
		   | SimpleExpression LEnum SimpleExpression
		     {
				
			 }
		   | SimpleExpression EQnum SimpleExpression
		     {
				
			 }
		   | SimpleExpression NEnum SimpleExpression
		     {
				
			 }
		   | SimpleExpression GEnum SimpleExpression
		     {
				
			 }
		   | SimpleExpression GTnum SimpleExpression
			 {
				
			 }
           ;
		   
Expression_2 : Expression COMMAnum
			   {
				 
			   }
			 | Expression_2 Expression COMMAnum
			   {
				 
			   }
			 ;
				 
SimpleExpression : Term
                   { /* $$ = MakeTree(ClassDefOp, $3, MakeLeaf(IDNode, $2));*/ 
				       $$=  MakeLeaf(IDNode, $2);	
                   }
				 | SimpleExpression_1 Term
				   {
					 
				   }
				 | Term SimpleExpression_2_rec
				   {
					 
				   }
				 | SimpleExpression_1 Term SimpleExpression_2_rec
				   {
				     
				   }
                 ;
				 
SimpleExpression_1 : PLUSnum 
					 {
						
					 }
				   | MINUSnum 
				     {
						
					 }
				   ;
				   
SimpleExpression_2_rec : SimpleExpression_2
						 {
							
						 }
					   | SimpleExpression_2_rec SimpleExpression_2
					     {
							
						 }
					   ;
				   
SimpleExpression_2 : PLUSnum Term
				     {
						
					 }
				   | MINUSnum Term
				     {
						
					 }
				   | ORnum Term
				     {
						
					 }
				   ;
				 
Term : Factor 
       { /* $$ = MakeTree(ClassDefOp, $3, MakeLeaf(IDNode, $2));*/ 
			$$=  MakeLeaf(IDNode, $2);	
       }
	 | Factor Term_2_rec
	   {
		 
	   }
     ;
	 
Term_2_rec : Term_2
			 {
				
			 }
		   | Term_2_rec Term_2
		     {
				
			 }
		   ;
		   
Term_2 : TIMESnum Factor
		 {
			
		 }
	   | DIVIDEnum Factor
	     {
			
		 }
	   | ANDnum Factor
	     {
			
		 }
	   ;
				 
Factor : UnsignedConstant
         { /* $$ = MakeTree(ClassDefOp, $3, MakeLeaf(IDNode, $2));*/ 
			$$=  MakeLeaf(IDNode, $2);	
         }
	   | Variable 
		 {
			
		 }
	   | MethodCallStatement
	     {
			
		 }
	   | LPARENnum Expression RPARENnum
	     {
			
		 }
	   | NOTnum Factor 
		 {
			
		 }
       ;
				 
UnsignedConstant : ICONSTnum
                   { /* $$ = MakeTree(ClassDefOp, $3, MakeLeaf(IDNode, $2));*/ 
						$$=  MakeLeaf(IDNode, $2);	
                   }
				 | SCONSTnum
				   {
					 
				   }
                 ;
				 
Variable : IDnum 
           { /* $$ = MakeTree(ClassDefOp, $3, MakeLeaf(IDNode, $2));*/ 
			$$=  MakeLeaf(IDNode, $2);	
           }
		 | IDnum Variable_2
		   {
		     
		   }
         ;
		 
Variable_2 : LBRACnum Expression RBRACnum
			 {
				
			 }
		   | LBRACnum Expression_2 Expression RBRACnum
		     {
				
			 }
		   | DOTnum IDnum
		     {
				
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

