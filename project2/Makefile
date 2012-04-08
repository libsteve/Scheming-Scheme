# ********************************************************************************************
# File:		$Id: Makefile,v 1.1 2012/03/27 22:01:55 rkr Exp rkr $
# Author:	Rajendra K. Raj
# Description:	A simple Makefile for building the calculator using flex, bison and gcc
# Revision History:
# 	$Log: Makefile,v $
# 	Revision 1.1  2012/03/27 22:01:55  rkr
# 	Initial revision
#
# 
# ********************************************************************************************

TARGET = regitcod
LEX  = flex
YACC = bison
CC   = gcc
CFLAGS = -g

all:	${TARGET}

# Rules to build the ${TARGET} program
${TARGET}: 	${TARGET}.o lex.yy.o
	$(CC) ${TARGET}.o lex.yy.o -lm -lfl -o $@

lex.yy.c ${TARGET}.y: 	${TARGET}.l
		$(LEX) -d ${TARGET}.l 

${TARGET}.c:	${TARGET}.y
		$(YACC) -d -t -o ${TARGET}.c ${TARGET}.y

# dependency rules
${TARGET}.o: 	${TARGET}.c 
lex.yy.o: 	lex.yy.c

# make clean will remove all of the automatically generated files
clean:
	rm -rf lex.yy.[c,o] ${TARGET}.[output,h,c,o] ${TARGET}

# make submit will clean and submit the required files
submit:	clean
	zip lab2.zip ${TARGET}.l ${TARGET}.y Makefile

