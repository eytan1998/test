CC=gcc
AR=ar
OBJECTS_MAIN=main.o
OBJECTS_LIB=mylib.o
CFLAGS= -Wall -g

LOOP = advancedClassificationLoop
REQ = advancedClassificationRecursion
BASIC = basicClassification

.PHONY: clean all

all: libclassloops.a libclassloops.so libclassreq.so libclassreq.a mains loops loopd  recursives recursived maindloop maindrec


mains: libclassreq.a main.o
	${CC} ${CFLAG} -L. main.o -lclassreq -o $@

maindloop: libclassloops.so main.o
	${CC} ${CFLAG} -L. main.o -lclassloops -o $@

maindrec: libclassreq.so main.o
	${CC} ${CFLAG} -L. main.o -lclassreq -o $@


loops: $(OBJECTS_MAIN) libclassloops.a
	$(CC) $(FLAGS) -o $@ $(OBJECTS_MAIN) libclassloops.a

loopd: $(OBJECTS_MAIN) libclassloops.so
	$(CC) $(FLAGS) -o $@ $(OBJECTS_MAIN) ./libclassloops.so

recursives: $(OBJECTS_MAIN) libclassreq.a
	$(CC) $(FLAGS) -o $@ $(OBJECTS_MAIN) libclassreq.a

recursived: libclassreq.so
	$(CC) $(FLAGS) -o $@ $(OBJECTS_MAIN) ./libclassreq.so


libclassloops.a : basicClassification.o advancedClassificationLoop.o
		$(AR) -rcs libclassloops.a basicClassification.o advancedClassificationLoop.o

libclassloops.so : basicClassification.o advancedClassificationLoop.o
		${CC} -shared -o libclassloops.so basicClassification.o advancedClassificationLoop.o -L.

libclassreq.a : basicClassification.o advancedClassificationRecursion.o
		$(AR) -rcs libclassreq.a basicClassification.o advancedClassificationRecursion.o

libclassreq.so : basicClassification.o advancedClassificationRecursion.o
		${CC} -shared -o libclassreq.so basicClassification.o advancedClassificationRecursion.o -L.



main.o: main.c NumClass.h
	${CC} ${CFLAG} -c main.c

clean:
	rm  -f  *.o *.so *.a  mains loops loopd  recursives recursived maindloop maindrec

