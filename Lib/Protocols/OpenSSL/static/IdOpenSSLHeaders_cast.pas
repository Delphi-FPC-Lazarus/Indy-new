{******************************************************************************}
{                                                                              }
{            Indy (Internet Direct) - Internet Protocols Simplified            }
{                                                                              }
{            https://www.indyproject.org/                                      }
{            https://gitter.im/IndySockets/Indy                                }
{                                                                              }
{******************************************************************************}
{                                                                              }
{  This file is part of the Indy (Internet Direct) project, and is offered     }
{  under the dual-licensing agreement described on the Indy website.           }
{  (https://www.indyproject.org/license/)                                      }
{                                                                              }
{  Copyright:                                                                  }
{   (c) 1993-2020, Chad Z. Hower and the Indy Pit Crew. All rights reserved.   }
{                                                                              }
{******************************************************************************}
{                                                                              }
{        Originally written by: Fabian S. Biehn                                }
{                               fbiehn@aagon.com (German & English)            }
{                                                                              }
{        Contributers:                                                         }
{                               Here could be your name                        }
{                                                                              }
{******************************************************************************}

// This File is generated!
// Any modification should be in the respone unit in the 
// responding unit in the "intermediate" folder! 

// Generation date: 31.03.2020 10:11:54

unit IdOpenSSLHeaders_cast;

interface

// Headers for OpenSSL 1.1.1
// cast.h

{$i IdCompilerDefines.inc}

uses
  IdCTypes;

const
  CAST_ENCRYPT_CONST =  1;
  CAST_DECRYPT_CONST =  0;
  CAST_BLOCK =  8;
  CAST_KEY_LENGTH = 16;

type
  CAST_LONG = type TIdC_UINT;
  PCAST_LONG = ^CAST_LONG;

  cast_key_st = record
    data: array of CAST_LONG;
    short_key: TIdC_INT;              //* Use reduced rounds for short key */
  end;

  CAST_KEY = cast_key_st;
  PCAST_KEY = ^CAST_KEY;

  procedure CAST_set_key(key: PCast_Key; len: TIdC_INT; const data: PByte) cdecl; external 'libcrypto-1_1.dll';
  procedure CAST_ecb_encrypt(const &in: PByte; &out: PByte; const key: PCast_Key; enc: TIdC_INT) cdecl; external 'libcrypto-1_1.dll';
  procedure CAST_encrypt(data: PCAST_LONG; const key: PCast_Key) cdecl; external 'libcrypto-1_1.dll';
  procedure CAST_decrypt(data: PCAST_LONG; const key: PCast_Key) cdecl; external 'libcrypto-1_1.dll';
  procedure CAST_cbc_encrypt(const &in: PByte; &out: PByte; length: TIdC_LONG; const ks: PCast_Key; iv: PByte; enc: TIdC_INT) cdecl; external 'libcrypto-1_1.dll';
  procedure CAST_cfb64_encrypt(const &in: PByte; &out: PByte; length: TIdC_LONG; const schedule: PCast_Key; ivec: PByte; num: PIdC_INT; enc: TIdC_INT) cdecl; external 'libcrypto-1_1.dll';
  procedure CAST_ofb64_encrypt(const &in: PByte; &out: PByte; length: TIdC_LONG; const schedule: PCast_Key; ivec: PByte; num: PIdC_INT) cdecl; external 'libcrypto-1_1.dll';

implementation

end.
