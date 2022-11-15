CC = gcc
CFLAG = -Wall
LOOP = advancedClassificationLoop
REQ = advancedClassificationRecursion
BASIC = basicClassification

main.o: main.c NumClass.h
	${CC} ${CFLAG} -c main.c

libclassloops.a : basicClassification.o advancedClassificationLoop.o
		ar rcs libclassloops.a basicClassification.o advancedClassificationLoop.o

libclassloops.so : basicClassification.o advancedClassificationLoop.o

		${CC} -shared -o libclassloops.so basicClassification.o advancedClassificationLoop.o -L.

libclassreq.a : basicClassification.o advancedClassificationRecursion.o
		ar rcs libclassreq.a basicClassification.o advancedClassificationRecursion.o
libclassreq.so : basicClassification.o advancedClassificationRecursion.o

		${CC} -shared -o libclassreq.so basicClassification.o advancedClassificationRecursion.o -L.

.PHONY: loops
loops: libclassloops.a

.PHONY: loopd
loopd: libclassloops.so

.PHONY: recursives
recursives: libclassreq.a

.PHONY: recursived
recursived: libclassreq.so


mains: libclassreq.a main.o
	${CC} ${CFLAG} -L. main.o -lclassreq -o $@

maindloop: libclassloops.so main.o
	${CC} ${CFLAG} -L. main.o -lclassloops -o $@

maindrec: libclassreq.so main.o
	${CC} ${CFLAG} -L. main.o -lclassreq -o $@

.PHONY:all
all: mains maindloop maindrec


.PHONY: clean
clean:
	rm  -f  *.o *.so *.a *.out mains maindrec maindloop

