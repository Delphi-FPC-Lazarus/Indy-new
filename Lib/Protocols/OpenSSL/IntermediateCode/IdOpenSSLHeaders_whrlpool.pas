unit IdOpenSSLHeaders_whrlpool;

interface

// Headers for OpenSSL 1.1.1
// whrlpool.h

{$i IdCompilerDefines.inc}

uses
  IdCTypes;

const
  WHIRLPOOL_DIGEST_LENGTH = 512 div 8;
  WHIRLPOOL_BBLOCK = 512;
  WHIRLPOOL_COUNTER = 256 div 8;

type
  WHIRLPOOL_CTX_union = record
    case Byte of
      0: (c: array[0 .. WHIRLPOOL_DIGEST_LENGTH -1] of Byte);
      (* double q is here to ensure 64-bit alignment *)
      1: (q: array[0 .. (WHIRLPOOL_DIGEST_LENGTH div SizeOf(TIdC_DOUBLE)) -1] of TIdC_DOUBLE);
  end;
  WHIRLPOOL_CTX = record
    H: WHIRLPOOL_CTX_union;
    data: array[0 .. (WHIRLPOOL_BBLOCK div 8) -1] of Byte;
    bitoff: TIdC_UINT;
    bitlen: array[0 .. (WHIRLPOOL_COUNTER div SizeOf(size_t)) -1] of size_t;
  end;
  PWHIRLPOOL_CTX = ^WHIRLPOOL_CTX;

var
  function WHIRLPOOL_Init(c: PWHIRLPOOL_CTX): TIdC_INT;
  function WHIRLPOOL_Update(c: PWHIRLPOOL_CTX; inp: Pointer; bytes: Size_t): TIdC_INT;
  procedure WHIRLPOOL_BitUpdate(c: PWHIRLPOOL_CTX; inp: Pointer; bits: Size_t);
  function WHIRLPOOL_Final(md: PByte; c: PWHIRLPOOL_CTX): TIdC_INT;
  function WHIRLPOOL(inp: Pointer; bytes: Size_t; md: PByte): PByte;

implementation

end.
