CC = gcc
CFLAG = -Wall
LOOP = advancedClassificationLoop
REQ = advancedClassificationRecursion
BASIC = basicClassification

main.o: main.c NumClass.h
	${CC} ${CFLAG} -c main.c

libclassloops.a : basicClassification.o advancedClassificationLoop.o
		ar rcs libclassloops.a ${BASIC}.o ${LOOP}.o

libclassloops.so : basicClassification.o advancedClassificationLoop.o
		${CC} ${CFLAG} -fpic -c ${BASIC}.c
		${CC} ${CFLAG} -fpic -c ${LOOP}.c
		${CC} -shared -o libclassloops.so basicClassification.o advancedClassificationLoop.o

libclassreq.a : basicClassification.o advancedClassificationRecursion.o
		ar rcs libclassreq.a basicClassification.o advancedClassificationRecursion.o
libclassreq.so : basicClassification.o advancedClassificationRecursion.o
		${CC} ${CFLAG} -fPIC -c ${BASIC}.c
		${CC}  ${CFLAG} -fPIC -c ${REQ}.c
		${CC} -shared -o libclassreq.so ${BASIC}.o ${REQ}.o

.PHONY: loops
loops: libclassloops.a

.PHONY: loopd
loopd: libclassloops.so

.PHONY: recursives
recursives: libclassreq.a

.PHONY: recursived
recursived: libclassreq.so


mains: libclassreq.a main.o
	${CC} ${CFLAG} main.o -L. -lclassreq -o $@

maindloop: libclassloops.so main.o
	${CC} ${CFLAG} -L. main.c -lclassloops -o $@

maindrec: libclassreq.so main.o
	${CC} ${CFLAG} -L. main.c -lclassreq -o $@

.PHONY:all
all: loops loopd recursives recursived mains maindloop maindrec


.PHONY: clean
clean:
	rm  -f  *.o *.so *.a *.out mains maindrec maindloop

