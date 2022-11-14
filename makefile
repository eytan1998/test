CC = gcc
CFLAG = -Wall
LOOP = advancedClassificationLoop
REQ = advancedClassificationRecursion
BASIC = basicClassification

loops:	basicClassification.o advancedClassificationLoop.o
	ar rcs libclassloops.a ${BASIC}.o ${LOOP}.o

loopd: basicClassification.o advancedClassificationLoop.o
	${CC} ${CFLAG} -fpic -c ${BASIC}.c
	${CC} ${CFLAG} -fpic -c ${LOOP}.c
	${CC} -shared -o libclassloops.so basicClassification.o advancedClassificationLoop.o
recursives: basicClassification.o advancedClassificationRecursion.o
	ar rcs libclassreq.a basicClassification.o advancedClassificationRecursion.o
recursived: basicClassification.o advancedClassificationRecursion.o
	${CC} -fPIC -c ${BASIC}.c
	${CC} -fPIC -c ${REQ}.c
	${CC} -shared -o libclassreq.so ${BASIC}.o ${REQ}.o
mains: recursives main.o
	${CC} main.o -L. -lclassreq -o $@
maindloop: loopd
	${CC} ${CFLAG} -L. main.c -lclassloops -o $@
maindrec: recursived main.o
	${CC} ${CFLAG} -L. main.c -lclassreq -o $@
all: main.o loops loopd mains recursived maindloop maindrec
	${CC} -c main.c basicClassification.c advancedClassificationLoop.c advancedClassificationRecursion.c

clean:
	rm  -f  *.o *.so *.a *.out mains maindrec maindloop

main.o: main.c NumClass.h
	${CC} ${CFLAG} -c main.c
