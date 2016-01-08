// CLB architecture-specific parameters
`define CLB_N 15 // Number of BLE's in a CLB
`define CLB_M 48 // Number of inputs it a CLB (also referred by I)
`define CLB_K 8  // Number of LUT inputs (K-LUT)

// verbose test-bench
`define TBVERBOSE 1

// uncomment the following line to enable "count ones" DW implementation
//`define countones_DW

// uncomment the following line to enable "compare greater than" DW implementation
//`define cmpgrt_DW

// pack 2-D array into 1-D
`define PKARRAY(PKWID,PKLEN,PKSRC,PKDST) \
          genvar pki; generate for(pki=0;pki<(PKLEN);pki=pki+1) begin:PKARRi; \
            assign PKDST[((PKWID)*pki+((PKWID)-1)):((PKWID)*pki)] = PKSRC[pki][((PKWID)-1):0]; \
          end; endgenerate

// pack 1-D array into 2-D
`define UPARRAY(PKWID,PKLEN,PKSRC,PKDST) \
          genvar upi; generate for(upi=0;upi<(PKLEN);upi=upi+1) begin:UPARRi; \
            assign PKDST[upi][((PKWID)-1):0] = PKSRC[((PKWID)*upi+((PKWID)-1)):((PKWID)*upi)]; \
          end; endgenerate

// factorial (n!)
`define fact(n)  ( ( ((n) >= 2      ) ? 2  : 1) * \
                   ( ((n) >= 3      ) ? 3  : 1) * \
                   ( ((n) >= 4      ) ? 4  : 1) * \
                   ( ((n) >= 5      ) ? 5  : 1) * \
                   ( ((n) >= 6      ) ? 6  : 1) * \
                   ( ((n) >= 7      ) ? 7  : 1) * \
                   ( ((n) >= 8      ) ? 8  : 1) * \
                   ( ((n) >= 9      ) ? 9  : 1) * \
                   ( ((n) >= 10     ) ? 10 : 1)   )

// ceiling of log2
`define log2(x)  ( ( ((x) >  1      ) ? 1  : 0) + \
                   ( ((x) >  2      ) ? 1  : 0) + \
                   ( ((x) >  4      ) ? 1  : 0) + \
                   ( ((x) >  8      ) ? 1  : 0) + \
                   ( ((x) >  16     ) ? 1  : 0) + \
                   ( ((x) >  32     ) ? 1  : 0) + \
                   ( ((x) >  64     ) ? 1  : 0) + \
                   ( ((x) >  128    ) ? 1  : 0) + \
                   ( ((x) >  256    ) ? 1  : 0) + \
                   ( ((x) >  512    ) ? 1  : 0) + \
                   ( ((x) >  1024   ) ? 1  : 0) + \
                   ( ((x) >  2048   ) ? 1  : 0) + \
                   ( ((x) >  4096   ) ? 1  : 0) + \
                   ( ((x) >  8192   ) ? 1  : 0) + \
                   ( ((x) >  16384  ) ? 1  : 0) + \
                   ( ((x) >  32768  ) ? 1  : 0) + \
                   ( ((x) >  65536  ) ? 1  : 0) + \
                   ( ((x) >  131072 ) ? 1  : 0) + \
                   ( ((x) >  262144 ) ? 1  : 0) + \
                   ( ((x) >  524288 ) ? 1  : 0) + \
                   ( ((x) >  1048576) ? 1  : 0) + \
                   ( ((x) >  2097152) ? 1  : 0) + \
                   ( ((x) >  4194304) ? 1  : 0)   )

// floor of log2
`define log2f(x) ( ( ((x) >= 2      ) ? 1  : 0) + \
                   ( ((x) >= 4      ) ? 1  : 0) + \
                   ( ((x) >= 8      ) ? 1  : 0) + \
                   ( ((x) >= 16     ) ? 1  : 0) + \
                   ( ((x) >= 32     ) ? 1  : 0) + \
                   ( ((x) >= 64     ) ? 1  : 0) + \
                   ( ((x) >= 128    ) ? 1  : 0) + \
                   ( ((x) >= 256    ) ? 1  : 0) + \
                   ( ((x) >= 512    ) ? 1  : 0) + \
                   ( ((x) >= 1024   ) ? 1  : 0) + \
                   ( ((x) >= 2048   ) ? 1  : 0) + \
                   ( ((x) >= 4096   ) ? 1  : 0) + \
                   ( ((x) >= 8192   ) ? 1  : 0) + \
                   ( ((x) >= 16384  ) ? 1  : 0) + \
                   ( ((x) >= 32768  ) ? 1  : 0) + \
                   ( ((x) >= 65536  ) ? 1  : 0) + \
                   ( ((x) >= 131072 ) ? 1  : 0) + \
                   ( ((x) >= 262144 ) ? 1  : 0) + \
                   ( ((x) >= 524288 ) ? 1  : 0) + \
                   ( ((x) >= 1048576) ? 1  : 0) + \
                   ( ((x) >= 2097152) ? 1  : 0) + \
                   ( ((x) >= 4194304) ? 1  : 0)   )

