##  Makefile:
##  18 Abril 2006, Leon, Gto. Mex. 14:46 hrs
##  OSGRUP
##  CIO
ECHO=@echo
smear	:smear.o
	ifort -o smear smear.o

smear.o	:smear.f90
	ifort -c smear.f90 


help	:
	$(ECHO) "   make               - compila and link       "
	$(ECHO) "   make help          - display this info      "
	$(ECHO) "   make clean         - clean all: *.o, *~     "
	$(ECHO) "   make note          - about the program .. "

clean	:
	$(ECHO) "Cleaning files trash..."
	 rm -f *.o
	 rm -f *~
	 rm -f fort.*
	 rm -f *.mod
note	:
	$(ECHO) "You can implement this program for to smear a data "
	$(ECHO) "this read a file with two columns and smear the  "
	$(ECHO) "second one, is like a low pass filter...      "
	$(ECHO) "for more info read README  "
	$(ECHO) "you mus has a compiler ifort  in your path   "
	$(ECHO) "for medusa some as:  /opt/intel/fc/9.0/bin/  "	
