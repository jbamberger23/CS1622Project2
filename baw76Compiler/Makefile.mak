driver: lex.yy.c token.h lexer.l driver.c
	gcc driver.c -o driver

lex.yy.c: lexer.l token.h
	flex lexer.l
	
clean: rm *.o *.exe