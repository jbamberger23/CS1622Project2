#include <stdlib.h>
#include <stdio.h>
#include "token.h"
#include "lex.yy.c"

extern int yylex();

int main()
{
	printf("Results will output in the format:\n");
	printf("Line:, Column:, Token:, Index: \n");
	
	int lexReturn;
    do {
       lexReturn = yylex(); 

      if(lexReturn == ANDnum)
	  {
		  printf("Line: %d, Column: %d, Token: ANDnum, Index:\n", yyline, yycolumn);
	  }
	  else if(lexReturn == ASSGNnum)
	  {
		  printf("Line: %d, Column: %d, Token: ASSGNnum, Index:\n", yyline, yycolumn);
	  }
	  else if(lexReturn == DECLARATIONSnum)
	  {
		  printf("Line: %d, Column: %d, Token: DECLARATIONSnum, Index:\n", yyline, yycolumn);
	  }
	    else if(lexReturn == DOTnum)
	  {
		  printf("Line: %d, Column: %d, Token: DOTnum, Index:\n", yyline, yycolumn);
	  }
	    else if(lexReturn == ENDDECLARATIONSnum)
	  {
		  printf("Line: %d, Column: %d, Token: ENDDECLARATIONSnum, Index:\n", yyline, yycolumn);
	  }
	    else if(lexReturn == EQUALnum)
	  {
		  printf("Line: %d, Column: %d, Token: EQUALnum, Index:\n", yyline, yycolumn);
	  }
	    else if(lexReturn == GTnum)
	  {
		  printf("Line: %d, Column: %d, Token: GTnum, Index:\n", yyline, yycolumn);
	  }
	    else if(lexReturn == IDnum)
	  {
		  printf("Line: %d, Column: %d, Token: IDnum, Index: %d\n", yyline, yycolumn, yylval);
	  }
	    else if(lexReturn == INTnum)
	  {
		  printf("Line: %d, Column: %d, Token: INTnum, Index:\n", yyline, yycolumn);
	  }
	    else if(lexReturn == LBRACnum)
	  {
		  printf("Line: %d, Column: %d, Token: LBRACnum, Index:\n", yyline, yycolumn);
	  }
	    else if(lexReturn == LPARENnum)
	  {
		  printf("Line: %d, Column: %d, Token: LPARENnum, Index:\n", yyline, yycolumn);
	  }
	    else if(lexReturn == METHODnum)
	  {
		  printf("Line: %d, Column: %d, Token: METHODnum, Index:\n", yyline, yycolumn);
	  }
	    else if(lexReturn == NEnum)
	  {
		  printf("Line: %d, Column: %d, Token: NEnum, Index:\n", yyline, yycolumn);
	  }
	    else if(lexReturn == ORnum)
	  {
		  printf("Line: %d, Column: %d, Token: ORnum, Index:\n", yyline, yycolumn);
	  }
	    else if(lexReturn == PROGRAMnum)
	  {
		  printf("Line: %d, Column: %d, Token: PROGRAMnum, Index:\n", yyline, yycolumn);
	  }
	    else if(lexReturn == RBRACnum)
	  {
		  printf("Line: %d, Column: %d, Token: RBRACEnum, Index:\n", yyline, yycolumn);
	  }
	    else if(lexReturn == RPARENnum)
	  {
		  printf("Line: %d, Column: %d, Token: RPARENnum, Index:\n", yyline, yycolumn);
	  }
	    else if(lexReturn == SEMInum)
	  {
		  printf("Line: %d, Column: %d, Token: SEMInum, Index:\n", yyline, yycolumn);
	  }
	    else if(lexReturn == VALnum)
	  {
		  printf("Line: %d, Column: %d, Token: VALnum, Index:\n", yyline, yycolumn);
	  }
	    else if(lexReturn == WHILEnum)
	  {
		  printf("Line: %d, Column: %d, Token: WHILEnum, Index:\n", yyline, yycolumn);
	  }  
	  else if(lexReturn == CLASSnum)
	  {
		  printf("Line: %d, Column: %d, Token: CLASSnum, Index:\n", yyline, yycolumn);
	  }  
	  else if(lexReturn == COMMAnum)
	  {
		  printf("Line: %d, Column: %d, Token: COMMAnum, Index:\n", yyline, yycolumn);
	  }
	    else if(lexReturn == DIVIDEnum)
	  {
		  printf("Line: %d, Column: %d, Token: DIVIDEnum, Index:\n", yyline, yycolumn);
	  }
	    else if(lexReturn == ELSEnum)
	  {
		  printf("Line: %d, Column: %d, Token: ELSEnum, Index:\n", yyline, yycolumn);
	  }
	    else if(lexReturn == EQnum)
	  {
		  printf("Line: %d, Column: %d, Token: EQnum, Index:\n", yyline, yycolumn);
	  }
	    else if(lexReturn == GEnum)
	  {
		  printf("Line: %d, Column: %d, Token: GEnum, Index:\n", yyline, yycolumn);
	  }
	  else if(lexReturn == ICONSTnum)
	  {
		  printf("Line: %d, Column: %d, Token: ICONSTnum, Index: %d\n", yyline, yycolumn, yylval);
	  }
	    else if(lexReturn == IFnum)
	  {
		  printf("Line: %d, Column: %d, Token: IFnum, Index:\n", yyline, yycolumn);
	  }
	    else if(lexReturn == LBRACEnum)
	  {
		  printf("Line: %d, Column: %d, Token: LBRACEnum, Index:\n", yyline, yycolumn);
	  }
	    else if(lexReturn == LEnum)
	  {
		  printf("Line: %d, Column: %d, Token: LEnum, Index:\n", yyline, yycolumn);
	  }
	    else if(lexReturn == LTnum)
	  {
		  printf("Line: %d, Column: %d, Token: LTnum, Index:\n", yyline, yycolumn);
	  }
	    else if(lexReturn == MINUSnum)
	  {
		  printf("Line: %d, Column: %d, Token: MINUSnum, Index:\n", yyline, yycolumn);
	  }
	    else if(lexReturn == NOTnum)
	  {
		  printf("Line: %d, Column: %d, Token: NOTnum, Index:\n", yyline, yycolumn);
	  }
	    else if(lexReturn == PLUSnum)
	  {
		  printf("Line: %d, Column: %d, Token: PLUSnum, Index:\n", yyline, yycolumn);
	  }
	    else if(lexReturn == RBRACEnum)
	  {
		  printf("Line: %d, Column: %d, Token: RBRACEnum, Index:\n", yyline, yycolumn);
	  }
	    else if(lexReturn == RETURNnum)
	  {
		  printf("Line: %d, Column: %d, Token: RETURNnum, Index:\n", yyline, yycolumn);
	  }
	    else if(lexReturn == SCONSTnum)
	  {
		  printf("Line: %d, Column: %d, Token: SCONSTnum, Index: %d\n", yyline, yycolumn);
	  }
	    else if(lexReturn == TIMESnum)
	  {
		  printf("Line: %d, Column: %d, Token: TIMESnum, Index:\n", yyline, yycolumn);
	  }
	    else if(lexReturn == VOIDnum)
	  {
		  printf("Line: %d, Column: %d, Token: , Index:\n", yyline, yycolumn);
	  }
	   else if(lexReturn == EOFnum)
	  {
		  printf("Line: %d, Column: %d, Token: EOFnum, Index:\n", yyline, yycolumn);
		  printf("End Of File Reached\n");
		  return(0);
	  }
	   else
	  {
		  printf("ERROR: Unrecognized token from lexer.\n");
		  return 0;
	  }

    } while (lexReturn != 0);
	
	return 0;
}