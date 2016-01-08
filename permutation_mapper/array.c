#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>
#include <errno.h>
#include <time.h>
#include <limits.h>
#include <float.h>
#include <ctype.h>
#include "array.h"
#include "allocation.h"

/* return memory allocate unsigned int array; 'arraySize' size */
unsigned int* arrayAllocation(unsigned int arraySize) {
  return (unsigned int*)safeMalloc(sizeof(unsigned int)*arraySize);
}

/* initialize all array elements to initVal value */
void arrayInitialize(unsigned int *array, unsigned int arraySize, unsigned int initializeValue) {
  unsigned int i;
  for (i=0;i<arraySize;i++) array[i]=initializeValue; /* init all arr elements to initVal */
}

/* if all array element are equal, return that value, else return UINT_MAX */
unsigned int arraySameValue(unsigned int *array, unsigned int arraySize) {
  unsigned int i;
  if (arraySize == 0) return UINT_MAX;
  if (arraySize == 1) return array[0] ;
  for(i=1;i<arraySize;i++)
    if (array[i] != array[0]) return UINT_MAX;
  return array[0];
}


void arrayPrint(FILE *fileP, unsigned int *array, unsigned int arraySize, const char *control) {
  unsigned int i,j             ;
  char         ctrl[64]        ; /* chars array holds control string */
  char         delims[] = ":+" ; /* token delimiters: space,tap,& newline */
  char        *strToken = NULL ; /* string token from control string */
  char        *pre      = ""   ;
  char        *post     = ""   ;
  char        *delim    = ""   ;
  unsigned int reverse  = 0    ;
  unsigned int ascii    = 0    ;
  unsigned int hex      = 0    ;

  if (!array) {
    if (gVerbose) printf("-W- arrayPrint received NULL array\n");
    return;
  }

  strcpy(ctrl,control);
  strToken = strtok( ctrl, delims );     /* read token from line */
  while(strToken != NULL) {              /* read all tokens */
    if (!strcmp(strToken,"pre"    )) pre     = strtok(NULL,delims);
    if (!strcmp(strToken,"post"   )) post    = strtok(NULL,delims);
    if (!strcmp(strToken,"delim"  )) delim   = strtok(NULL,delims);
    if (!strcmp(strToken,"reverse")) reverse = 1;
    if (!strcmp(strToken,"ascii"  )) ascii   = 1;
    if (!strcmp(strToken,"hex"    )) hex     = 1;
    strToken = strtok(NULL,delims); /* next token */
  }
  fprintf(fileP,"%s",pre);
  for(i=0;i<arraySize;i++) {
    j = reverse ? arraySize-i-1 : i;
    if (ascii)            fprintf(fileP,"%c",array[j]+97);
    else if (hex)         fprintf(fileP,"%x",array[j]   );
    else                  fprintf(fileP,"%u",array[j]   );
    if (i != arraySize-1) fprintf(fileP,"%s",delim      );
  }
  fprintf(fileP,"%s",post);
}

void arrayDeleteShift(unsigned int elementIndex, unsigned int *array, unsigned int arraySize){
  unsigned int i;
  if (!array) {
    if (gVerbose) printf("-W- arrayDeleteShift received NULL array\n");
    return;
  }
  if (elementIndex>=arraySize) {
    if (gVerbose) printf("-W arrayDeleteShift recevied elementIndex larger than arraySize\n");
    return;
  }
  for (i=elementIndex;i<arraySize-1;i++) array[i]=array[i+1];
}

void arrayCopy(unsigned int *sourceArray, unsigned int *targetArray,unsigned int arraySize)  {
  unsigned int i;
  if (!sourceArray) {
    if (gVerbose) printf("-W- arrayCopy received NULL sourceArray\n");
    return;
  }
  if (!targetArray) {
    if (gVerbose) printf("-W- arrayCopy received NULL targetArray\n");
    return;
  }
  for (i=0;i<arraySize;i++) targetArray[i]=sourceArray[i]; /* copy source to target element */
}

void arrayReverse(unsigned int *array, unsigned int arraySize){
  unsigned int i;
  unsigned int *reversed;
  if (!array) {
    if (gVerbose) printf("-W- arrayReverse received NULL array\n");
    return;
  }
  reversed = (unsigned int*)malloc(arraySize*sizeof(unsigned int));
  for (i=0;i<arraySize;i++) reversed[i] = array[arraySize-i-1];
  arrayCopy(reversed,array,arraySize);
  free(reversed);
}

