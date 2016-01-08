/**************************
 * Generate  permutations *
 * Ameer Abdelhadi - 2011 *
 * ameer@ece.ubc.ca       *
 **************************/

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

#define UINTBITSN (32)
#define GETBIT(num,bitIndex         )   (((num     )>>(bitIndex)) & 1  )
#define SETBIT(num,bitIndex,bitValue)   (((bitValue)<<(bitIndex)) | num)

#define PWR2(x) (1<<(x))
#define LOG2(x) ((log(x))/(log(2)))

unsigned int gVerbose = 1;

unsigned int factorial(unsigned int n){
  unsigned int i, fact=1;
  for (i=2;i<=n;i++) fact *= i;
  return fact;
}

int decimal2factorial(unsigned int decimalNumber, unsigned int *factorialNumber, unsigned int digitsN){
  unsigned int i, factoriali;
  if (decimalNumber>=factorial(digitsN)) {
    if (gVerbose) printf("-W- decimal2factorial can't fit decimal into factorial number\n");
    return(1);
  }
  for(i=digitsN;i>0;i--){
    factoriali           = factorial(i-1);
    factorialNumber[i-1] = decimalNumber / factoriali;
    decimalNumber        = decimalNumber - factorialNumber[i-1]*factoriali;
  }
  return(0);
}

void factorial2permutation(unsigned int *factorialNumber, unsigned int *permutation, unsigned int digitsN){
  unsigned int i;
  unsigned int *indexes = arrayAllocation(digitsN);
  for(i=0;i<digitsN;i++) indexes[i]=i;
  for(i=digitsN;i>0;i--){
    permutation[digitsN-i] = indexes[factorialNumber[i-1]];
    arrayDeleteShift(factorialNumber[i-1],indexes,digitsN);
  }
  safeFree(indexes);
}

void permutation2lehmer(unsigned int *permutation, unsigned int *lehmer, unsigned int digitsN){
  unsigned int i,j;
  for(i=0;i<digitsN;i++) lehmer[i]=0;
  for(i=0;i<(digitsN-1);i++) {
    for(j=i+1;j<digitsN;j++) {
      if (permutation[i]>permutation[j]) lehmer[i]++;
    }
  }
}

unsigned int lehmer2enum(unsigned int *lehmer, unsigned int kLUT) {
   unsigned int enmr=0;
   switch (kLUT) {
     case 2:
       enmr = SETBIT(enmr,0,GETBIT(lehmer[0],0));
       break;
     case 3:
       enmr = SETBIT(enmr, 0, GETBIT(lehmer[0],0));
       enmr = SETBIT(enmr, 1, GETBIT(lehmer[1],0));
       break;
     case 4:
       enmr = SETBIT(enmr, 0, GETBIT(lehmer[0],1));
       enmr = SETBIT(enmr, 1, GETBIT(lehmer[0],0));
       enmr = SETBIT(enmr, 2, GETBIT(lehmer[1],0));
       enmr = SETBIT(enmr, 3, GETBIT(lehmer[2],0));
       break;
     case 5:
       enmr = SETBIT(enmr,0 , GETBIT(lehmer[0],1));
       enmr = SETBIT(enmr,1 , GETBIT(lehmer[0],0));
       enmr = SETBIT(enmr,2 , GETBIT(lehmer[1],1));
       enmr = SETBIT(enmr,3 , GETBIT(lehmer[1],0));
       enmr = SETBIT(enmr,4 , GETBIT(lehmer[2],0));
       enmr = SETBIT(enmr,5 , GETBIT(lehmer[3],0));
       break;
     case 6:
       enmr = SETBIT(enmr,0 ,(GETBIT(lehmer[0],2) & GETBIT(lehmer[3],0)) | GETBIT(lehmer[0],1));
       enmr = SETBIT(enmr,1 , GETBIT(lehmer[0],0));
       enmr = SETBIT(enmr,2 , GETBIT(lehmer[1],1));
       enmr = SETBIT(enmr,3 , GETBIT(lehmer[1],0));
       enmr = SETBIT(enmr,4 , GETBIT(lehmer[2],1));
       enmr = SETBIT(enmr,5 , GETBIT(lehmer[2],0));
       enmr = SETBIT(enmr,6 , GETBIT(lehmer[3],1) | GETBIT(lehmer[0],2));
       enmr = SETBIT(enmr,7 , GETBIT(lehmer[3],0) | GETBIT(lehmer[0],2));
       enmr = SETBIT(enmr,8 , GETBIT(lehmer[4],0));
       break;
     case 7:
       enmr = SETBIT(enmr,0 , GETBIT(lehmer[0],2) | GETBIT(lehmer[2],2));
       enmr = SETBIT(enmr,1 , GETBIT(lehmer[0],1) | GETBIT(lehmer[2],2));
       enmr = SETBIT(enmr,2 , GETBIT(lehmer[0],0) | GETBIT(lehmer[2],2));
       enmr = SETBIT(enmr,3 ,(GETBIT(lehmer[1],2) & GETBIT(lehmer[4],0)) | GETBIT(lehmer[1],1));
       enmr = SETBIT(enmr,4 , GETBIT(lehmer[1],0));
       enmr = SETBIT(enmr,5 ,(GETBIT(lehmer[2],2) & GETBIT(lehmer[0],1)) | GETBIT(lehmer[2],1));
       enmr = SETBIT(enmr,6 ,(GETBIT(lehmer[2],2) & GETBIT(lehmer[0],0)) | GETBIT(lehmer[2],0));
       enmr = SETBIT(enmr,7 , GETBIT(lehmer[3],1));
       enmr = SETBIT(enmr,8 , GETBIT(lehmer[3],0));
       enmr = SETBIT(enmr,9 , GETBIT(lehmer[4],1) | GETBIT(lehmer[1],2));
       enmr = SETBIT(enmr,10, GETBIT(lehmer[4],0) | GETBIT(lehmer[1],2));
       enmr = SETBIT(enmr,11, GETBIT(lehmer[5],0));
       break;
     case 8:
       enmr = SETBIT(enmr,0 , GETBIT(lehmer[0],2));
       enmr = SETBIT(enmr,1 , GETBIT(lehmer[0],1));
       enmr = SETBIT(enmr,2 , GETBIT(lehmer[0],0));
       enmr = SETBIT(enmr,3 , GETBIT(lehmer[1],2) | GETBIT(lehmer[3],2));
       enmr = SETBIT(enmr,4 , GETBIT(lehmer[1],1) | GETBIT(lehmer[3],2));
       enmr = SETBIT(enmr,5 , GETBIT(lehmer[1],0) | GETBIT(lehmer[3],2));
       enmr = SETBIT(enmr,6 ,(GETBIT(lehmer[2],2) & GETBIT(lehmer[5],0)) | GETBIT(lehmer[2],1));
       enmr = SETBIT(enmr,7 , GETBIT(lehmer[2],0));
       enmr = SETBIT(enmr,8 ,(GETBIT(lehmer[3],2) & GETBIT(lehmer[1],1)) | GETBIT(lehmer[3],1));
       enmr = SETBIT(enmr,9 ,(GETBIT(lehmer[3],2) & GETBIT(lehmer[1],0)) | GETBIT(lehmer[3],0));
       enmr = SETBIT(enmr,10, GETBIT(lehmer[4],1));
       enmr = SETBIT(enmr,11, GETBIT(lehmer[4],0));
       enmr = SETBIT(enmr,12, GETBIT(lehmer[5],1) | GETBIT(lehmer[2],2));
       enmr = SETBIT(enmr,13, GETBIT(lehmer[5],0) | GETBIT(lehmer[2],2));
       enmr = SETBIT(enmr,14, GETBIT(lehmer[6],0));
       break;
     default:
       printf("-E- k-LUT of only k=2..8 are covered\n");
       exit(-1);
   }
   return enmr;
}

void uint2bitsArray(unsigned int uint, unsigned int* bitsArray, unsigned int bitsArraySize) {
  unsigned int i;
  for(i=0;i<bitsArraySize;i++) bitsArray[i] = GETBIT(uint,i);
}

unsigned int bitsArray2uint(unsigned int* bitsArray, unsigned int bitsArraySize) {
  unsigned int i;
  unsigned int uint = 0;
  for(i=0;i<bitsArraySize;i++) uint = SETBIT(uint,i,bitsArray[i]);
  return uint;
}


int main(int argc, char *argv[]) {
  unsigned int i;
  unsigned int kLUT;
  unsigned int dec;
  unsigned int *fact;
  unsigned int *perm;
  unsigned int *lehm;
  unsigned int  enmr;
  unsigned int *covered;
  unsigned int *mapping;
  unsigned int enumBitsN;
  unsigned int *enumBitsArray;
  unsigned int isCovered = 1;
  char         mapFileN[16];
  FILE *mapFileP;

  if (argc != 2) {
    printf("-E- permute should be followed by on integer k=2..8 (k-LUT). Exiting...\n");
    exit(-1);
  }
  sscanf(argv[1],"%u",&kLUT);
  if ((kLUT<2)||(kLUT>8)) {
    printf("-E- permute should be followed by on integer k=2..8 (k-LUT). Exiting...\n");
    exit(-1);
  }

  sprintf(mapFileN,"%uLUT.map",kLUT);
  mapFileP=fopen(mapFileN,"w");

  fact = arrayAllocation(kLUT);
  perm = arrayAllocation(kLUT);
  lehm = arrayAllocation(kLUT);

  enumBitsN = LOG2(factorial(kLUT));
  printf("-- %u --\n",enumBitsN);
  enumBitsArray = arrayAllocation(enumBitsN);
  mapping = arrayAllocation(PWR2(enumBitsN));
  covered = arrayAllocation(PWR2(enumBitsN));
  arrayInitialize(covered,PWR2(enumBitsN),0);

  for (dec=0;dec<factorial(kLUT);dec++) {
    decimal2factorial(dec,fact,kLUT);
    factorial2permutation(fact,perm,kLUT);
    permutation2lehmer(perm,lehm,kLUT);
    enmr = lehmer2enum(lehm,kLUT);
    uint2bitsArray(enmr,enumBitsArray,enumBitsN);

    printf("dec=%-6u ",dec);
    arrayPrint(stdout,perm,kLUT,"pre:prm=[+post:] +delim:,+ascii");
    arrayPrint(stdout,lehm,kLUT,"pre:lhm=[+post:] +delim:,");
    arrayPrint(stdout,enumBitsArray,enumBitsN,"pre:enm=[+post:]=+delim:,+reverse");
    printf("%u\n",enmr);

    if (!covered[enmr]) mapping[enmr]=dec;
    covered[enmr]=1;
  }

  printf("\n");

  for(i=0;i<PWR2(enumBitsN);i++) {

    decimal2factorial(mapping[i],fact,kLUT);
    factorial2permutation(fact,perm,kLUT);
    permutation2lehmer(perm,lehm,kLUT);
    uint2bitsArray(i,enumBitsArray,enumBitsN);

    arrayPrint(mapFileP,perm,kLUT,"post: // +reverse+hex");
    arrayPrint(mapFileP,enumBitsArray,enumBitsN,"pre:[+post:] -> +delim:,+reverse");
    arrayPrint(mapFileP,perm,kLUT,"pre:[+post:]\n+delim:,+ascii");

    
    if (!(covered[i])) {
      arrayPrint(stdout,enumBitsArray,enumBitsN,"pre:* [+post:]=+delim:,+reverse");
      printf("%u is not covered!\n",i);
      isCovered = 0;
    }
  }

  if (isCovered) printf("* All LUT possibilities have been covered!\n");

  printf("\n");

  fclose(mapFileP);
  safeFree(fact);
  safeFree(perm);
  safeFree(lehm);
  safeFree(covered);

  return 0;
}


