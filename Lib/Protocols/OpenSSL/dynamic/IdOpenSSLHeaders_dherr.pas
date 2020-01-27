unit IdOpenSSLHeaders_dherr;

// This File is generated!
// Any modification should be in the respone unit in the 
// responding unit in the "intermediate" folder! 

// Generation date: 27.01.2020 13:25:51

interface

// Headers for OpenSSL 1.1.1
// dherr.h

{$i IdCompilerDefines.inc}

uses
  IdCTypes;

const
  // DH function codes
  DH_F_COMPUTE_KEY               = 102;
  DH_F_DHPARAMS_PRINT_FP         = 101;
  DH_F_DH_BUILTIN_GENPARAMS      = 106;
  DH_F_DH_CHECK_EX               = 121;
  DH_F_DH_CHECK_PARAMS_EX        = 122;
  DH_F_DH_CHECK_PUB_KEY_EX       = 123;
  DH_F_DH_CMS_DECRYPT            = 114;
  DH_F_DH_CMS_SET_PEERKEY        = 115;
  DH_F_DH_CMS_SET_SHARED_INFO    = 116;
  DH_F_DH_METH_DUP               = 117;
  DH_F_DH_METH_NEW               = 118;
  DH_F_DH_METH_SET1_NAME         = 119;
  DH_F_DH_NEW_BY_NID             = 104;
  DH_F_DH_NEW_METHOD             = 105;
  DH_F_DH_PARAM_DECODE           = 107;
  DH_F_DH_PKEY_PUBLIC_CHECK      = 124;
  DH_F_DH_PRIV_DECODE            = 110;
  DH_F_DH_PRIV_ENCODE            = 111;
  DH_F_DH_PUB_DECODE             = 108;
  DH_F_DH_PUB_ENCODE             = 109;
  DH_F_DO_DH_PRINT               = 100;
  DH_F_GENERATE_KEY              = 103;
  DH_F_PKEY_DH_CTRL_STR          = 120;
  DH_F_PKEY_DH_DERIVE            = 112;
  DH_F_PKEY_DH_INIT              = 125;
  DH_F_PKEY_DH_KEYGEN            = 113;

  // DH reason codes
  DH_R_BAD_GENERATOR             = 101;
  DH_R_BN_DECODE_ERROR           = 109;
  DH_R_BN_ERROR                  = 106;
  DH_R_CHECK_INVALID_J_VALUE     = 115;
  DH_R_CHECK_INVALID_Q_VALUE     = 116;
  DH_R_CHECK_PUBKEY_INVALID      = 122;
  DH_R_CHECK_PUBKEY_TOO_LARGE    = 123;
  DH_R_CHECK_PUBKEY_TOO_SMALL    = 124;
  DH_R_CHECK_P_NOT_PRIME         = 117;
  DH_R_CHECK_P_NOT_SAFE_PRIME    = 118;
  DH_R_CHECK_Q_NOT_PRIME         = 119;
  DH_R_DECODE_ERROR              = 104;
  DH_R_INVALID_PARAMETER_NAME    = 110;
  DH_R_INVALID_PARAMETER_NID     = 114;
  DH_R_INVALID_PUBKEY            = 102;
  DH_R_KDF_PARAMETER_ERROR       = 112;
  DH_R_KEYS_NOT_SET              = 108;
  DH_R_MISSING_PUBKEY            = 125;
  DH_R_MODULUS_TOO_LARGE         = 103;
  DH_R_NOT_SUITABLE_GENERATOR    = 120;
  DH_R_NO_PARAMETERS_SET         = 107;
  DH_R_NO_PRIVATE_VALUE          = 100;
  DH_R_PARAMETER_ENCODING_ERROR  = 105;
  DH_R_PEER_KEY_ERROR            = 111;
  DH_R_SHARED_INFO_ERROR         = 113;
  DH_R_UNABLE_TO_CHECK_GENERATOR = 121;

{$REGION 'Generated loading and unloading methods'}
function Load(const ADllHandle: THandle): TArray<string>;
procedure UnLoad;
{$ENDREGION}

var
  ERR_load_DH_strings: function: TIdC_INT cdecl = nil;

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
    ERR_load_DH_strings := LoadFunction('ERR_load_DH_strings', LFailed);
    Result := LFailed.ToStringArray();
  finally
    LFailed.Free();
  end;
end;

procedure UnLoad;
begin
  ERR_load_DH_strings := nil;
end;
{$ENDREGION}

end.
