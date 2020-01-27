﻿unit IdOpenSSLHeaders_aes;

interface

// Headers for OpenSSL 1.1.1
// aes.h

{$i IdCompilerDefines.inc}

uses
  IdCTypes,
  IdGlobal;

const
// Added '_CONST' to avoid name clashes
  AES_ENCRYPT_CONST = 1;
// Added '_CONST' to avoid name clashes
  AES_DECRYPT_CONST = 0;
  AES_MAXNR = 14;
  AES_BLOCK_SIZE = 16;

type
  aes_key_st = record
  // in old IdSSLOpenSSLHeaders.pas it was also TIdC_UINT ¯\_(ツ)_/¯
//    {$IFDEF AES_LONG}
//    rd_key: array[0..(4 * (AES_MAXNR + 1))] of TIdC_ULONG;
//    {$ELSE}
    rd_key: array[0..(4 * (AES_MAXNR + 1))] of TIdC_UINT;
//    {$ENDIF}
    rounds: TIdC_INT;
  end;
  AES_KEY = aes_key_st;
  PAES_KEY = ^AES_KEY;

var
  function AES_options: PIdAnsiChar;

  function AES_set_encrypt_key(const userKey: PByte; const bits: TIdC_INT; const key: PAES_KEY): TIdC_INT;
  function AES_set_decrypt_key(const userKey: PByte; const bits: TIdC_INT; const key: PAES_KEY): TIdC_INT;

  procedure AES_encrypt(const &in: PByte; &out: PByte; const key: PAES_KEY);
  procedure AES_decrypt(const &in: PByte; &out: PByte; const key: PAES_KEY);

  procedure AES_ecb_encrypt(const &in: PByte; &out: PByte; const key: PAES_KEY; const enc: TIdC_INT);
  procedure AES_cbc_encrypt(const &in: PByte; &out: PByte; length: size_t; const key: PAES_KEY; ivec: PByte; const enc: TIdC_INT);
  procedure AES_cfb128_encrypt(const &in: PByte; &out: PByte; length: size_T; const key: PAES_KEY; ivec: PByte; num: PIdC_INT; const enc: TIdC_INT);
  procedure AES_cfb1_encrypt(const &in: PByte; &out: PByte; length: size_T; const key: PAES_KEY; ivec: PByte; num: PIdC_INT; const enc: TIdC_INT);
  procedure AES_cfb8_encrypt(const &in: PByte; &out: PByte; length: size_T; const key: PAES_KEY; ivec: PByte; num: PIdC_INT; const enc: TIdC_INT);
  procedure AES_ofb128_encrypt(const &in: PByte; &out: PByte; length: size_T; const key: PAES_KEY; ivec: PByte; num: PIdC_INT);
  (* NB: the IV is _two_ blocks long *)
  procedure AES_ige_encrypt(const &in: PByte; &out: PByte; length: size_T; const key: PAES_KEY; ivec: PByte; const enc: TIdC_INT);
  (* NB: the IV is _four_ blocks long *)
  procedure AES_bi_ige_encrypt(const &in: PByte; &out: PByte; length: size_T; const key: PAES_KEY; const key2: PAES_KEY; ivec: PByte; const enc: TIdC_INT);

  function AES_wrap_key(key: PAES_KEY; const iv: PByte; &out: PByte; const &in: PByte; inlen: TIdC_UINT): TIdC_INT;
  function AES_unwrap_key(key: PAES_KEY; const iv: PByte; &out: PByte; const &in: PByte; inlen: TIdC_UINT): TIdC_INT;

implementation

end.
