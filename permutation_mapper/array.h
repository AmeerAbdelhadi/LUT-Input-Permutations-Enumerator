#ifndef __ARRAY_HEADER__
#define __ARRAY_HEADER__

extern unsigned int gVerbose;

unsigned int* arrayAllocation(unsigned int arraySize);
void arrayInitialize(unsigned int *array, unsigned int arraySize, unsigned int initializeValue);
unsigned int arraySameValue(unsigned int *array, unsigned int arraySize);
void arrayPrint(FILE *fileP, unsigned int *array, unsigned int arraySize, const char *control);
void arrayDeleteShift(unsigned int elementIndex, unsigned int *array, unsigned int arraySize);
void arrayCopy(unsigned int *sourceArray, unsigned int *targetArray,unsigned int arraySize)  ;
void arrayReverse(unsigned int *array, unsigned int arraySize);

#endif /* __ARRAY_HEADER__ */
