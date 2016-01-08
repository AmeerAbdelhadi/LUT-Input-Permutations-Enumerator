/**************************************************************************
 * text printing module                                                   *
 * Ameer Abdelhadi (C) April 2011                                         *
 **************************************************************************/

#ifndef __TEXT_HEADER__
#define __TEXT_HEADER__

#include <stdio.h>
#include <stdlib.h>

/**************************************************************************/
/* printf attributes and colors macros                                    */
/**************************************************************************/
/* foreground colors enumeration                                          */
enum fgColor { fgBlack=30, fgRed    , fgGreen, fgYellow                    ,
               fgBlue    , fgMagenta, fgCyan , fgWhite                    };
/* background colors enumeration                                          */
enum bgColor { bgBlack=40, bgRed    , bgGreen, bgYellow                    ,
               bgBlue    , bgMagenta, bgCyan , bgWhite                    };
/* text attributes enumeration                                            */
enum txtAttr { txtOff =0 ,txtBold   , txtUnderscore                        ,
               txtBlink  ,txtReverse, txtConceal                          };
/**************************************************************************/

/**************************************************************************/
/* macros to set print attributes and colors                              */
/**************************************************************************/
/* set text attributes, foreground color, and background color            */
#define prntSet(txa,fgc,bgc) (printf("%c[%d;%d;%dm",0x1B,(txa),(fgc),(bgc)))
/* reset arreibutes and colors                                            */
#define prntRst              (printf("%c[%dm"      ,0x1B,0)                )
/* print in bold                                                          */
#define prntBld              (printf("%c[%dm"      ,0x1B,1)                )
/* print in red (not bold)                                                */
#define prntRed              (printf("%c[%d;%dm"   ,0x1B,0,fgRed)          )
/* print new line                                                         */
#define prntNln              (printf("\n")                                 )
/**************************************************************************/

#endif /* __TEXT_HEADER__                                                       */
