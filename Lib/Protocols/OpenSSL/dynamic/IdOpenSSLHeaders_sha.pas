unit IdOpenSSLHeaders_sha;

// This File is generated!
// Any modification should be in the respone unit in the 
// responding unit in the "intermediate" folder! 

// Generation date: 27.01.2020 13:25:51

interface

// Headers for OpenSSL 1.1.1
// sha.h

{$i IdCompilerDefines.inc}

uses
  IdCTypes;

const
  SHA_LBLOCK = 16;
  SHA_CBLOCK = SHA_LBLOCK * 4;

  SHA_LAST_BLOCK = SHA_CBLOCK - 8;
  SHA_DIGEST_LENGTH = 20;

  SHA256_CBLOCK = SHA_LBLOCK * 4;

  SHA224_DIGEST_LENGTH = 28;
  SHA256_DIGEST_LENGTH = 32;
  SHA384_DIGEST_LENGTH = 48;
  SHA512_DIGEST_LENGTH = 64;

  SHA512_CBLOCK = SHA_LBLOCK * 8;

type
  SHA_LONG = TIdC_UINT;

  SHAstate_sf = record
    h0, h1, h2, h3, h4: SHA_LONG;
    Nl, Nh: SHA_LONG;
    data: array[0 .. SHA_LAST_BLOCK - 1] of SHA_LONG;
    num: TIdC_UINT;
  end;
  SHA_CTX = SHAstate_sf;
  PSHA_CTX = ^SHA_CTX;

  SHAstate256_sf = record
    h: array[0..7] of SHA_LONG;
    Nl, Nh: SHA_LONG;
    data: array[0 .. SHA_LAST_BLOCK - 1] of SHA_LONG;
    num, md_len: TIdC_UINT;
  end;
  SHA256_CTX = SHAstate256_sf;
  PSHA256_CTX = ^SHA256_CTX;

  SHA_LONG64 = TIdC_UINT64;

  SHA512state_st_u = record
    case Integer of
    0: (d: array[0 .. SHA_LBLOCK - 1] of SHA_LONG64);
    1: (p: array[0 .. SHA512_CBLOCK - 1] of Byte);
  end;

  SHA512state_st = record
    h: array[0..7] of SHA_LONG64;
    Nl, Nh: SHA_LONG64;
    u: SHA512state_st_u;
    num, md_len: TIdC_UINT;
  end;
  SHA512_CTX = SHA512state_st;
  PSHA512_CTX = ^SHA512_CTX;

{$REGION 'Generated loading and unloading methods'}
function Load(const ADllHandle: THandle): TArray<string>;
procedure UnLoad;
{$ENDREGION}

var
  SHA1_Init: function(c: PSHA_CTX): TIdC_INT cdecl = nil;
  SHA1_Update: function(c: PSHA_CTX; const data: Pointer; len: size_t): TIdC_INT cdecl = nil;
  SHA1_Final: function(md: PByte; c: PSHA_CTX): TIdC_INT cdecl = nil;
  SHA1: function(const d: PByte; n: size_t; md: PByte): PByte cdecl = nil;
  SHA1_Transform: procedure(c: PSHA_CTX; const data: PByte) cdecl = nil;

  SHA224_Init: function(c: PSHA256_CTX): TIdC_INT cdecl = nil;
  SHA224_Update: function(c: PSHA256_CTX; const data: Pointer; len: size_t): TIdC_INT cdecl = nil;
  SHA224_Final: function(md: PByte; c: PSHA256_CTX): TIdC_INT cdecl = nil;
  SHA224: function(const d: PByte; n: size_t; md: PByte): PByte cdecl = nil;

  SHA256_Init: function(c: PSHA256_CTX): TIdC_INT cdecl = nil;
  SHA256_Update: function(c: PSHA256_CTX; const data: Pointer; len: size_t): TIdC_INT cdecl = nil;
  SHA256_Final: function(md: PByte; c: PSHA256_CTX): TIdC_INT cdecl = nil;
  SHA256: function(const d: PByte; n: size_t; md: PByte): PByte cdecl = nil;
  SHA256_Transform: procedure(c: PSHA256_CTX; const data: PByte) cdecl = nil;

  SHA384_Init: function(c: PSHA512_CTX): TIdC_INT cdecl = nil;
  SHA384_Update: function(c: PSHA512_CTX; const data: Pointer; len: size_t): TIdC_INT cdecl = nil;
  SHA384_Final: function(md: PByte; c: PSHA512_CTX): TIdC_INT cdecl = nil;
  SHA384: function(const d: PByte; n: size_t; md: PByte): PByte cdecl = nil;

  SHA512_Init: function(c: PSHA512_CTX): TIdC_INT cdecl = nil;
  SHA512_Update: function(c: PSHA512_CTX; const data: Pointer; len: size_t): TIdC_INT cdecl = nil;
  SHA512_Final: function(md: PByte; c: PSHA512_CTX): TIdC_INT cdecl = nil;
  SHA512: function(const d: PByte; n: size_t; md: PByte): PByte cdecl = nil;
  SHA512_Transform: procedure(c: PSHA512_CTX; const data: PByte) cdecl = nil;

implementation

uses
  System.Classes,
  Winapi.Windows;

{$REGION 'Generated loading and unloading methods'}
function Load(const ADllHandle: THandle): TArray<string>;

  function LoadFunction(const AMethodName: string; const AFailed: TStringList): Pointer;
  begin
    Result := GetProcAddress(ADllHandle, PChar(AMethodName));
    if not Assigned(Result) then
      AFailed.Add(AMethodName);
  end;

var
  LFailed: TStringList;
begin
  LFailed := TStringList.Create();
  try
    SHA1_Init := LoadFunction('SHA1_Init', LFailed);
    SHA1_Update := LoadFunction('SHA1_Update', LFailed);
    SHA1_Final := LoadFunction('SHA1_Final', LFailed);
    SHA1 := LoadFunction('SHA1', LFailed);
    SHA1_Transform := LoadFunction('SHA1_Transform', LFailed);
    SHA224_Init := LoadFunction('SHA224_Init', LFailed);
    SHA224_Update := LoadFunction('SHA224_Update', LFailed);
    SHA224_Final := LoadFunction('SHA224_Final', LFailed);
    SHA224 := LoadFunction('SHA224', LFailed);
    SHA256_Init := LoadFunction('SHA256_Init', LFailed);
    SHA256_Update := LoadFunction('SHA256_Update', LFailed);
    SHA256_Final := LoadFunction('SHA256_Final', LFailed);
    SHA256 := LoadFunction('SHA256', LFailed);
    SHA256_Transform := LoadFunction('SHA256_Transform', LFailed);
    SHA384_Init := LoadFunction('SHA384_Init', LFailed);
    SHA384_Update := LoadFunction('SHA384_Update', LFailed);
    SHA384_Final := LoadFunction('SHA384_Final', LFailed);
    SHA384 := LoadFunction('SHA384', LFailed);
    SHA512_Init := LoadFunction('SHA512_Init', LFailed);
    SHA512_Update := LoadFunction('SHA512_Update', LFailed);
    SHA512_Final := LoadFunction('SHA512_Final', LFailed);
    SHA512 := LoadFunction('SHA512', LFailed);
    SHA512_Transform := LoadFunction('SHA512_Transform', LFailed);
    Result := LFailed.ToStringArray();
  finally
    LFailed.Free();
  end;
end;

procedure UnLoad;
begin
  SHA1_Init := nil;
  SHA1_Update := nil;
  SHA1_Final := nil;
  SHA1 := nil;
  SHA1_Transform := nil;
  SHA224_Init := nil;
  SHA224_Update := nil;
  SHA224_Final := nil;
  SHA224 := nil;
  SHA256_Init := nil;
  SHA256_Update := nil;
  SHA256_Final := nil;
  SHA256 := nil;
  SHA256_Transform := nil;
  SHA384_Init := nil;
  SHA384_Update := nil;
  SHA384_Final := nil;
  SHA384 := nil;
  SHA512_Init := nil;
  SHA512_Update := nil;
  SHA512_Final := nil;
  SHA512 := nil;
  SHA512_Transform := nil;
end;
{$ENDREGION}

end.
