unit IdOpenSSLHeaders_srtp;

interface

// Headers for OpenSSL 1.1.1
// srtp.h

{$i IdCompilerDefines.inc}

uses
  IdCTypes,
  IdGlobal,
  IdOpenSSLHeaders_ossl_typ,
  IdOpenSSLHeaders_ssl;

const
  SRTP_AES128_CM_SHA1_80 = $0001;
  SRTP_AES128_CM_SHA1_32 = $0002;
  SRTP_AES128_F8_SHA1_80 = $0003;
  SRTP_AES128_F8_SHA1_32 = $0004;
  SRTP_NULL_SHA1_80      = $0005;
  SRTP_NULL_SHA1_32      = $0006;

  (* AEAD SRTP protection profiles from RFC 7714 *)
  SRTP_AEAD_AES_128_GCM = $0007;
  SRTP_AEAD_AES_256_GCM = $0008;

var
  function SSL_CTX_set_tlsext_use_srtp(ctx: PSSL_CTX; const profiles: PIdAnsiChar): TIdC_INT;
  function SSL_set_tlsext_use_srtp(ctx: PSSL_CTX; const profiles: PIdAnsiChar): TIdC_INT;

  //function SSL_get_srtp_profiles(s: PSSL): PSTACK_OF_SRTP_PROTECTION_PROFILE;
  function SSL_get_selected_srtp_profile(s: PSSL): PSRTP_PROTECTION_PROFILE;

implementation

end.
