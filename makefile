CC = gcc
CFLAG = -Wall
LOOP = advancedClassificationLoop
REQ = advancedClassificationRecursion
BASIC = basicClassification

main.o: main.c NumClass.h
	${CC} ${CFLAG} -c main.c

libclassreq.a:
	make recursives
libclassreq.so:
	make recursived
libclassloops.a:
	make loops
libclassloops.so:
	make loopd
loops: basicClassification.o advancedClassificationLoop.o
	ar rcs libclassloops.a ${BASIC}.o ${LOOP}.o

loopd:
	${CC} ${CFLAG} -fpic -c ${BASIC}.c
	${CC} ${CFLAG} -fpic -c ${LOOP}.c
	${CC} -shared -o libclassloops.so basicClassification.o advancedClassificationLoop.o
recursives: basicClassification.o advancedClassificationRecursion.o
	ar rcs libclassreq.a basicClassification.o advancedClassificationRecursion.o
recursived:
	${CC} ${CFLAG} -fPIC -c ${BASIC}.c
	${CC}  ${CFLAG} -fPIC -c ${REQ}.c
	${CC} -shared -o libclassreq.so ${BASIC}.o ${REQ}.o
mains: libclassreq.a main.o
	${CC} ${CFLAG} main.o -L. -lclassreq -o $@
maindloop: libclassloops.so main.o
	${CC} ${CFLAG} -L. main.c -lclassloops -o $@
maindrec: libclassreq.so main.o
	${CC} ${CFLAG} -L. main.c -lclassreq -o $@
all: main.o loops mains  maindloop maindrec
	${CC} ${CFLAG} -c main.c basicClassification.c advancedClassificationLoop.c advancedClassificationRecursion.c

clean:
	rm  -f  *.o *.so *.a *.out mains maindrec maindloop

