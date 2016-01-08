/*********************************
 * memory allocation operations  *
 * Ameer Abdelhadi (C) June 2011 *
 *********************************/

#include <stdio.h>
#include <stdlib.h>
#include "allocation.h"

/* safe memory allocation   */
void *safeMalloc(unsigned int memSize) {
	void *mem=(void*)malloc(memSize);
	if (!mem) {
		printf("-E- memory allocation %u failed! Exiting...\n",memSize);
		exit(-1);
	}
	return mem;
}

/* safe memory reallocation */
void *safeRealloc(void *memBlk, unsigned int memSize) {
	void *mem=(void*)realloc(memBlk, memSize);
	if (!mem) {
		printf("-E- memory reallocation %u failed! Exiting...\n",memSize);
		exit(-1);
	}
	return mem;
}

/* safe memory freeing      */
void safeFree(void *memBlk) {
	if (memBlk != NULL) free(memBlk);
	else if(gVerbose) printf("-W- An attempt to free NULL pointer has been ignored\n");
}
