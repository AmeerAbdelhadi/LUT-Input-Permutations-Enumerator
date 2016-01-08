##########################################
#      KLUT permutation generator        #
#               make file                #
#                                        #
# source: permute.c allocation.c array.c #
# header: text.h    allocation.h array.h #
# execu.: permute                        #
#                                        #
# invoke 'make' to generate binary       # 
# invoke 'make clean' to clean objects   #
#                                        #
#    Ameer Abdelhadi (C) June 2011       #
##########################################

CC  = gcc
LIB = -lm
FLG = -Wall -O2

EXE = permute
OBJ = permute.o allocation.o array.o
SRC = permute.c allocation.c array.c
HDR = text.h    allocation.h array.h

$(EXE)         : $(OBJ)			
	$(CC) $(FLG) $(OBJ) -o $(EXE) $(LIB)

allocation.o   :  allocation.c   $(HDR)
	$(CC) -c $(FLG) allocation.c
uarray.o       :  array.c        $(HDR)
	$(CC) -c $(FLG) array.c
permute.o :       permute.c $(HDR)
	$(CC) -c $(FLG) permute.c

.PHONY: clean
clean:
	-rm -f $(OBJ) *.map

.PHONY: clean~
clean~:
	-rm -f *~
