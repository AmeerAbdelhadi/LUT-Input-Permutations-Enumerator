/****************************************************
 * memory allocation operations                     *
 * Ameer Abdelhadi (C) June 2011                    *
 ****************************************************/

#ifndef                          __ALLOCATION_HEADER__
#define                          __ALLOCATION_HEADER__

extern unsigned int gVerbose                         ;

/* safe memory allocation                           */
void *safeMalloc(unsigned int memSize               ); 

/* safe memory reallocation                         */
void *safeRealloc(void *memBlk, unsigned int memSize);

/* safe memory freeing                              */
void  safeFree(void *memBlk                         );

#endif /* __ALLOCATION_HEADER__                     */
