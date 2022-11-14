CC = gcc
CFLAG = -Wall
LOOP = advancedClassificationLoop
REQ = advancedClassificationRecursion
BASIC = basicClassification

loops:	basicClassification.o advancedClassificationLoop.o
	ar rcs libclassloops.a ${BASIC}.o ${LOOP}.o

loopd: basicClassification.o advancedClassificationLoop.o
	${CC} -fPIC -c ${BASIC}.c
	${CC} -fPIC -c ${LOOP}.c
	${CC} -shared -o libclassloops.so ${BASIC}.o ${LOOP}.o
recursives: basicClassification.o advancedClassificationRecursion.o
	ar rcs libclassreq.a ${BASIC}.o ${REQ}.o
recursived: basicClassification.o advancedClassificationRecursion.o
	${CC} -fPIC -c ${BASIC}.c
	${CC} -fPIC -c ${REQ}.c
	${CC} -shared -o libclassreq.so ${BASIC}.o ${REQ}.o
mains: recursives
	${CC} main.c -l classreq -L. -o $@
maindloop: loopd
	${CC} main.c -L. -l classloops -o $@
maindrec: recursived main.o
	${CC} main.o -L. -l classreq -o $@
all: main.o loops loopd mains recursived maindloop maindrec
	${CC} -c main.c basicClassification.c advancedClassificationLoop.c advancedClassificationRecursion.c

clean:
	rm  -f  *.o *.so *.a *.out mains maindrec maindloop

main.o: main.c NumClass.h
	${CC} -c ${CFLAG} main.c
