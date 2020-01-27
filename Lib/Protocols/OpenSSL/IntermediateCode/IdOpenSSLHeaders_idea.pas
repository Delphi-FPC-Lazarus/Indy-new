unit IdOpenSSLHeaders_idea;

interface

// Headers for OpenSSL 1.1.1
// idea.h

{$i IdCompilerDefines.inc}

uses
  IdCTypes,
  IdGlobal;

const
  // Added '_CONST' to avoid name clashes
  IDEA_ENCRYPT_CONST = 1;
  // Added '_CONST' to avoid name clashes
  IDEA_DECRYPT_CONST = 0;

  IDEA_BLOCK      = 8;
  IDEA_KEY_LENGTH = 16;

type
  IDEA_INT = type TIdC_INT;

  idea_key_st = record
    data: array[0..8, 0..5] of IDEA_INT;
  end;
  IDEA_KEY_SCHEDULE = idea_key_st;
  PIDEA_KEY_SCHEDULE = ^IDEA_KEY_SCHEDULE;

var
  function IDEA_options: PIdAnsiChar;
  procedure IDEA_ecb_encrypt(const &in: PByte; &out: PByte; ks: PIDEA_KEY_SCHEDULE);
  procedure IDEA_set_encrypt_key(const key: PByte; ks: PIDEA_KEY_SCHEDULE);
  procedure IDEA_set_decrypt_key(ek: PIDEA_KEY_SCHEDULE; dk: PIDEA_KEY_SCHEDULE);
  procedure IDEA_cbc_encrypt(const &in: PByte; &out: PByte; length: TIdC_LONG; ks: PIDEA_KEY_SCHEDULE; iv: PByte; enc: TIdC_INT);
  procedure IDEA_cfb64_encrypt(const &in: PByte; &out: PByte; length: TIdC_LONG; ks: PIDEA_KEY_SCHEDULE; iv: PByte; num: PIdC_INT; enc: TIdC_INT);
  procedure IDEA_ofb64_encrypt(const &in: PByte; &out: PByte; length: TIdC_LONG; ks: PIDEA_KEY_SCHEDULE; iv: PByte; num: PIdC_INT);
  procedure IDEA_encrypt(&in: PIdC_LONG; ks: PIDEA_KEY_SCHEDULE);

implementation

end.
