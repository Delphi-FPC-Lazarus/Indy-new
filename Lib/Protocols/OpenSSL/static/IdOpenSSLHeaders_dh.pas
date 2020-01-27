unit IdOpenSSLHeaders_dh;

// This File is generated!
// Any modification should be in the respone unit in the 
// responding unit in the "intermediate" folder! 

// Generation date: 27.01.2020 13:25:53

interface

// Headers for OpenSSL 1.1.1
// dh.h

{$i IdCompilerDefines.inc}

uses
  IdCTypes,
  IdGlobal,
  IdOpenSSLHeaders_ossl_typ,
  IdOpenSSLHeaders_evp;

const
  OPENSSL_DH_MAX_MODULUS_BITS      = 10000;
  OPENSSL_DH_FIPS_MIN_MODULUS_BITS =  1024;

  DH_FLAG_CACHE_MONT_P   =   $01;
  DH_FLAG_FIPS_METHOD    = $0400;
  DH_FLAG_NON_FIPS_ALLOW = $0400;

  DH_GENERATOR_2 = 2;
  DH_GENERATOR_5 = 5;

  DH_CHECK_P_NOT_PRIME         = $01;
  DH_CHECK_P_NOT_SAFE_PRIME    = $02;
  DH_UNABLE_TO_CHECK_GENERATOR = $04;
  DH_NOT_SUITABLE_GENERATOR    = $08;
  DH_CHECK_Q_NOT_PRIME         = $10;
  DH_CHECK_INVALID_Q_VALUE     = $20;
  DH_CHECK_INVALID_J_VALUE     = $40;
  DH_CHECK_PUBKEY_TOO_SMALL    = $01;
  DH_CHECK_PUBKEY_TOO_LARGE    = $02;
  DH_CHECK_PUBKEY_INVALID      = $04;
  DH_CHECK_P_NOT_STRONG_PRIME  = DH_CHECK_P_NOT_SAFE_PRIME;

  EVP_PKEY_DH_KDF_NONE  = 1;
  EVP_PKEY_DH_KDF_X9_42 = 2;

  EVP_PKEY_CTRL_DH_PARAMGEN_PRIME_LEN    = (EVP_PKEY_ALG_CTRL + 1);
  EVP_PKEY_CTRL_DH_PARAMGEN_GENERATOR    = (EVP_PKEY_ALG_CTRL + 2);
  EVP_PKEY_CTRL_DH_RFC5114               = (EVP_PKEY_ALG_CTRL + 3);
  EVP_PKEY_CTRL_DH_PARAMGEN_SUBPRIME_LEN = (EVP_PKEY_ALG_CTRL + 4);
  EVP_PKEY_CTRL_DH_PARAMGEN_TYPE         = (EVP_PKEY_ALG_CTRL + 5);
  EVP_PKEY_CTRL_DH_KDF_TYPE              = (EVP_PKEY_ALG_CTRL + 6);
  EVP_PKEY_CTRL_DH_KDF_MD                = (EVP_PKEY_ALG_CTRL + 7);
  EVP_PKEY_CTRL_GET_DH_KDF_MD            = (EVP_PKEY_ALG_CTRL + 8);
  EVP_PKEY_CTRL_DH_KDF_OUTLEN            = (EVP_PKEY_ALG_CTRL + 9);
  EVP_PKEY_CTRL_GET_DH_KDF_OUTLEN        = (EVP_PKEY_ALG_CTRL + 10);
  EVP_PKEY_CTRL_DH_KDF_UKM               = (EVP_PKEY_ALG_CTRL + 11);
  EVP_PKEY_CTRL_GET_DH_KDF_UKM           = (EVP_PKEY_ALG_CTRL + 12);
  EVP_PKEY_CTRL_DH_KDF_OID               = (EVP_PKEY_ALG_CTRL + 13);
  EVP_PKEY_CTRL_GET_DH_KDF_OID           = (EVP_PKEY_ALG_CTRL + 14);
  EVP_PKEY_CTRL_DH_NID                   = (EVP_PKEY_ALG_CTRL + 15);
  EVP_PKEY_CTRL_DH_PAD                   = (EVP_PKEY_ALG_CTRL + 16);

type
  DH_meth_generate_key_cb = function(dh: PDH): TIdC_INT;
  DH_meth_compute_key_cb = function(key: PByte; const pub_key: PBIGNUM; dh: PDH): TIdC_INT;
  DH_meth_bn_mod_exp_cb = function(
    const dh: PDH; r: PBIGNUM; const a: PBIGNUM;
    const p: PBIGNUM; const m: PBIGNUM;
    ctx: PBN_CTX; m_ctx: PBN_MONT_CTX): TIdC_INT;
  DH_meth_init_cb = function(dh: PDH): TIdC_INT;
  DH_meth_finish_cb = function(dh: PDH): TIdC_INT;
  DH_meth_generate_params_cb = function(dh: PDH; prime_len: TIdC_INT; generator: TIdC_INT; cb: PBN_GENCB): TIdC_INT;

{
  # define DH_CHECK_P_NOT_STRONG_PRIME     DH_CHECK_P_NOT_SAFE_PRIME

  # define d2i_DHparams_fp(fp,x) \
      (DH *)ASN1_d2i_fp((char *(*)())DH_new, \
                        (char *(*)())d2i_DHparams, \
                        (fp), \
                        (unsigned char **)(x))
  # define i2d_DHparams_fp(fp,x) \
      ASN1_i2d_fp(i2d_DHparams,(fp), (unsigned char *)(x))
  # define d2i_DHparams_bio(bp,x) \
      ASN1_d2i_bio_of(DH, DH_new, d2i_DHparams, bp, x)
  # define i2d_DHparams_bio(bp,x) \
      ASN1_i2d_bio_of_const(DH,i2d_DHparams,bp,x)

  # define d2i_DHxparams_fp(fp,x) \
      (DH *)ASN1_d2i_fp((char *(*)())DH_new, \
                        (char *(*)())d2i_DHxparams, \
                        (fp), \
                        (unsigned char **)(x))
  # define i2d_DHxparams_fp(fp,x) \
      ASN1_i2d_fp(i2d_DHxparams,(fp), (unsigned char *)(x))
  # define d2i_DHxparams_bio(bp,x) \
      ASN1_d2i_bio_of(DH, DH_new, d2i_DHxparams, bp, x)
  # define i2d_DHxparams_bio(bp,x) \
      ASN1_i2d_bio_of_const(DH, i2d_DHxparams, bp, x)
}

  function DHparams_dup(dh: PDH): PDH cdecl; external 'libcrypto-1_1.dll';

  function DH_OpenSSL: PDH_Method cdecl; external 'libcrypto-1_1.dll';

  procedure DH_set_default_method(const meth: PDH_Method) cdecl; external 'libcrypto-1_1.dll';
  function DH_get_default_method: PDH_Method cdecl; external 'libcrypto-1_1.dll';
  function DH_set_method(dh: PDH; const meth: PDH_Method): TIdC_INT cdecl; external 'libcrypto-1_1.dll';
  function DH_new_method(engine: PENGINE): PDH cdecl; external 'libcrypto-1_1.dll';

  function DH_new: PDH cdecl; external 'libcrypto-1_1.dll';
  procedure DH_free(dh: PDH) cdecl; external 'libcrypto-1_1.dll';
  function DH_up_ref(dh: PDH): TIdC_INT cdecl; external 'libcrypto-1_1.dll';
  function DH_bits(const dh: PDH): TIdC_INT cdecl; external 'libcrypto-1_1.dll';
  function DH_size(const dh: PDH): TIdC_INT cdecl; external 'libcrypto-1_1.dll';
  function DH_security_bits(const dh: PDH): TIdC_INT cdecl; external 'libcrypto-1_1.dll';
  function DH_set_ex_data(d: PDH; idx: TIdC_INT; arg: Pointer): TIdC_INT cdecl; external 'libcrypto-1_1.dll';
  function DH_get_ex_data(d: PDH; idx: TIdC_INT): Pointer cdecl; external 'libcrypto-1_1.dll';

  function DH_generate_parameters_ex(dh: PDH; prime_len: TIdC_INT; generator: TIdC_INT; cb: PBN_GENCB): TIdC_INT cdecl; external 'libcrypto-1_1.dll';

  function DH_check_params_ex(const dh: PDH): TIdC_INT cdecl; external 'libcrypto-1_1.dll';
  function DH_check_ex(const dh: PDH): TIdC_INT cdecl; external 'libcrypto-1_1.dll';
  function DH_check_pub_key_ex(const dh: PDH; const pub_key: PBIGNUM): TIdC_INT cdecl; external 'libcrypto-1_1.dll';
  function DH_check_params(const dh: PDH; ret: PIdC_INT): TIdC_INT cdecl; external 'libcrypto-1_1.dll';
  function DH_check(const dh: PDH; codes: PIdC_INT): TIdC_INT cdecl; external 'libcrypto-1_1.dll';
  function DH_check_pub_key(const dh: PDH; const pub_key: PBIGNUM; codes: PIdC_INT): TIdC_INT cdecl; external 'libcrypto-1_1.dll';
  function DH_generate_key(dh: PDH): TIdC_INT cdecl; external 'libcrypto-1_1.dll';
  function DH_compute_key(key: PByte; const pub_key: PBIGNUM; dh: PDH): TIdC_INT cdecl; external 'libcrypto-1_1.dll';
  function DH_compute_key_padded(key: PByte; const pub_key: PBIGNUM; dh: PDH): TIdC_INT cdecl; external 'libcrypto-1_1.dll';
  function d2i_DHparams(a: PPDH; const pp: PPByte; length: TIdC_LONG): PDH cdecl; external 'libcrypto-1_1.dll';
  function i2d_DHparams(const a: PDH; pp: PPByte): TIdC_INT cdecl; external 'libcrypto-1_1.dll';
  function d2i_DHxparams(a: PPDH; const pp: PPByte; length: TIdC_LONG): PDH cdecl; external 'libcrypto-1_1.dll';
  function i2d_DHxparams(const a: PDH; pp: PPByte): TIdC_INT cdecl; external 'libcrypto-1_1.dll';
  function DHparams_print(bp: PBIO; const x: PDH): TIdC_INT cdecl; external 'libcrypto-1_1.dll';

  function DH_get_1024_160: PDH cdecl; external 'libcrypto-1_1.dll';
  function DH_get_2048_224: PDH cdecl; external 'libcrypto-1_1.dll';
  function DH_get_2048_256: PDH cdecl; external 'libcrypto-1_1.dll';

  function DH_new_by_nid(nid: TIdC_INT): PDH cdecl; external 'libcrypto-1_1.dll';
  function DH_get_nid(const dh: PDH): TIdC_INT cdecl; external 'libcrypto-1_1.dll';

  function DH_KDF_X9_42( &out: PByte; outlen: size_t; const Z: PByte; Zlen: size_t; key_oid: PASN1_OBJECT; const ukm: PByte; ukmlen: size_t; const md: PEVP_MD): TIdC_INT cdecl; external 'libcrypto-1_1.dll';

  procedure DH_get0_pqg(const dh: PDH; const p: PPBIGNUM; const q: PPBIGNUM; const g: PPBIGNUM) cdecl; external 'libcrypto-1_1.dll';
  function DH_set0_pqg(dh: PDH; p: PBIGNUM; q: PBIGNUM; g: PBIGNUM): TIdC_INT cdecl; external 'libcrypto-1_1.dll';
  procedure DH_get0_key(const dh: PDH; const pub_key: PPBIGNUM; const priv_key: PPBIGNUM) cdecl; external 'libcrypto-1_1.dll';
  function DH_set0_key(dh: PDH; pub_key: PBIGNUM; priv_key: PBIGNUM): TIdC_INT cdecl; external 'libcrypto-1_1.dll';
  function DH_get0_p(const dh: PDH): PBIGNUM cdecl; external 'libcrypto-1_1.dll';
  function DH_get0_q(const dh: PDH): PBIGNUM cdecl; external 'libcrypto-1_1.dll';
  function DH_get0_g(const dh: PDH): PBIGNUM cdecl; external 'libcrypto-1_1.dll';
  function DH_get0_priv_key(const dh: PDH): PBIGNUM cdecl; external 'libcrypto-1_1.dll';
  function DH_get0_pub_key(const dh: PDH): PBIGNUM cdecl; external 'libcrypto-1_1.dll';
  procedure DH_clear_flags(dh: PDH; flags: TIdC_INT) cdecl; external 'libcrypto-1_1.dll';
  function DH_test_flags(const dh: PDH; flags: TIdC_INT): TIdC_INT cdecl; external 'libcrypto-1_1.dll';
  procedure DH_set_flags(dh: PDH; flags: TIdC_INT) cdecl; external 'libcrypto-1_1.dll';
  function DH_get0_engine(d: PDH): PENGINE cdecl; external 'libcrypto-1_1.dll';
  function DH_get_length(const dh: PDH): TIdC_LONG cdecl; external 'libcrypto-1_1.dll';
  function DH_set_length(dh: PDH; length: TIdC_LONG): TIdC_INT cdecl; external 'libcrypto-1_1.dll';

  function DH_meth_new(const name: PIdAnsiChar; flags: TIdC_INT): PDH_Method cdecl; external 'libcrypto-1_1.dll';
  procedure DH_meth_free(dhm: PDH_Method) cdecl; external 'libcrypto-1_1.dll';
  function DH_meth_dup(const dhm: PDH_Method): PDH_Method cdecl; external 'libcrypto-1_1.dll';
  function DH_meth_get0_name(const dhm: PDH_Method): PIdAnsiChar cdecl; external 'libcrypto-1_1.dll';
  function DH_meth_set1_name(dhm: PDH_Method; const name: PIdAnsiChar): TIdC_INT cdecl; external 'libcrypto-1_1.dll';
  function DH_meth_get_flags(const dhm: PDH_Method): TIdC_INT cdecl; external 'libcrypto-1_1.dll';
  function DH_meth_set_flags(const dhm: PDH_Method; flags: TIdC_INT): TIdC_INT cdecl; external 'libcrypto-1_1.dll';
  function DH_meth_get0_app_data(const dhm: PDH_Method): Pointer cdecl; external 'libcrypto-1_1.dll';
  function DH_meth_set0_app_data(const dhm: PDH_Method; app_data: Pointer): TIdC_INT cdecl; external 'libcrypto-1_1.dll';

  function DH_meth_get_generate_key(const dhm: PDH_Method): DH_meth_generate_key_cb cdecl; external 'libcrypto-1_1.dll';
  function DH_meth_set_generate_key(const dhm: PDH_Method; generate_key: DH_meth_generate_key_cb): TIdC_INT cdecl; external 'libcrypto-1_1.dll';

  function DH_meth_get_compute_key(const dhm: PDH_Method): DH_meth_compute_key_cb cdecl; external 'libcrypto-1_1.dll';
  function DH_meth_set_compute_key(const dhm: PDH_Method; compute_key: DH_meth_compute_key_cb): TIdC_INT cdecl; external 'libcrypto-1_1.dll';

  function DH_meth_get_bn_mod_exp(const dhm: PDH_Method): DH_meth_bn_mod_exp_cb cdecl; external 'libcrypto-1_1.dll';
  function DH_meth_set_bn_mod_exp(const dhm: PDH_Method; bn_mod_expr: DH_meth_bn_mod_exp_cb): TIdC_INT cdecl; external 'libcrypto-1_1.dll';

  function DH_meth_get_init(const dhm: PDH_Method): DH_meth_init_cb cdecl; external 'libcrypto-1_1.dll';
  function DH_meth_set_init(const dhm: PDH_Method; init: DH_meth_init_cb): TIdC_INT cdecl; external 'libcrypto-1_1.dll';

  function DH_meth_get_finish(const dhm: PDH_Method): DH_meth_finish_cb cdecl; external 'libcrypto-1_1.dll';
  function DH_meth_set_finish(const dhm: PDH_Method; finish: DH_meth_finish_cb): TIdC_INT cdecl; external 'libcrypto-1_1.dll';

  function DH_meth_get_generate_params(const dhm: PDH_Method): DH_meth_generate_params_cb cdecl; external 'libcrypto-1_1.dll';
  function DH_meth_set_generate_params(const dhm: PDH_Method; generate_params: DH_meth_generate_params_cb): TIdC_INT cdecl; external 'libcrypto-1_1.dll';

{
# define EVP_PKEY_CTX_set_dh_paramgen_prime_len(ctx, len) \
        EVP_PKEY_CTX_ctrl(ctx, EVP_PKEY_DH, EVP_PKEY_OP_PARAMGEN, \
                        EVP_PKEY_CTRL_DH_PARAMGEN_PRIME_LEN, len, NULL)

# define EVP_PKEY_CTX_set_dh_paramgen_subprime_len(ctx, len) \
        EVP_PKEY_CTX_ctrl(ctx, EVP_PKEY_DH, EVP_PKEY_OP_PARAMGEN, \
                        EVP_PKEY_CTRL_DH_PARAMGEN_SUBPRIME_LEN, len, NULL)

# define EVP_PKEY_CTX_set_dh_paramgen_type(ctx, typ) \
        EVP_PKEY_CTX_ctrl(ctx, EVP_PKEY_DH, EVP_PKEY_OP_PARAMGEN, \
                        EVP_PKEY_CTRL_DH_PARAMGEN_TYPE, typ, NULL)

# define EVP_PKEY_CTX_set_dh_paramgen_generator(ctx, gen) \
        EVP_PKEY_CTX_ctrl(ctx, EVP_PKEY_DH, EVP_PKEY_OP_PARAMGEN, \
                        EVP_PKEY_CTRL_DH_PARAMGEN_GENERATOR, gen, NULL)

# define EVP_PKEY_CTX_set_dh_rfc5114(ctx, gen) \
        EVP_PKEY_CTX_ctrl(ctx, EVP_PKEY_DHX, EVP_PKEY_OP_PARAMGEN, \
                        EVP_PKEY_CTRL_DH_RFC5114, gen, NULL)

# define EVP_PKEY_CTX_set_dhx_rfc5114(ctx, gen) \
        EVP_PKEY_CTX_ctrl(ctx, EVP_PKEY_DHX, EVP_PKEY_OP_PARAMGEN, \
                        EVP_PKEY_CTRL_DH_RFC5114, gen, NULL)

# define EVP_PKEY_CTX_set_dh_nid(ctx, nid) \
        EVP_PKEY_CTX_ctrl(ctx, EVP_PKEY_DH, \
                        EVP_PKEY_OP_PARAMGEN | EVP_PKEY_OP_KEYGEN, \
                        EVP_PKEY_CTRL_DH_NID, nid, NULL)

# define EVP_PKEY_CTX_set_dh_pad(ctx, pad) \
        EVP_PKEY_CTX_ctrl(ctx, EVP_PKEY_DH, EVP_PKEY_OP_DERIVE, \
                          EVP_PKEY_CTRL_DH_PAD, pad, NULL)

# define EVP_PKEY_CTX_set_dh_kdf_type(ctx, kdf) \
        EVP_PKEY_CTX_ctrl(ctx, EVP_PKEY_DHX, \
                                EVP_PKEY_OP_DERIVE, \
                                EVP_PKEY_CTRL_DH_KDF_TYPE, kdf, NULL)

# define EVP_PKEY_CTX_get_dh_kdf_type(ctx) \
        EVP_PKEY_CTX_ctrl(ctx, EVP_PKEY_DHX, \
                                EVP_PKEY_OP_DERIVE, \
                                EVP_PKEY_CTRL_DH_KDF_TYPE, -2, NULL)

# define EVP_PKEY_CTX_set0_dh_kdf_oid(ctx, oid) \
        EVP_PKEY_CTX_ctrl(ctx, EVP_PKEY_DHX, \
                                EVP_PKEY_OP_DERIVE, \
                                EVP_PKEY_CTRL_DH_KDF_OID, 0, (void *)(oid))

# define EVP_PKEY_CTX_get0_dh_kdf_oid(ctx, poid) \
        EVP_PKEY_CTX_ctrl(ctx, EVP_PKEY_DHX, \
                                EVP_PKEY_OP_DERIVE, \
                                EVP_PKEY_CTRL_GET_DH_KDF_OID, 0, (void *)(poid))

# define EVP_PKEY_CTX_set_dh_kdf_md(ctx, md) \
        EVP_PKEY_CTX_ctrl(ctx, EVP_PKEY_DHX, \
                                EVP_PKEY_OP_DERIVE, \
                                EVP_PKEY_CTRL_DH_KDF_MD, 0, (void *)(md))

# define EVP_PKEY_CTX_get_dh_kdf_md(ctx, pmd) \
        EVP_PKEY_CTX_ctrl(ctx, EVP_PKEY_DHX, \
                                EVP_PKEY_OP_DERIVE, \
                                EVP_PKEY_CTRL_GET_DH_KDF_MD, 0, (void *)(pmd))

# define EVP_PKEY_CTX_set_dh_kdf_outlen(ctx, len) \
        EVP_PKEY_CTX_ctrl(ctx, EVP_PKEY_DHX, \
                                EVP_PKEY_OP_DERIVE, \
                                EVP_PKEY_CTRL_DH_KDF_OUTLEN, len, NULL)

# define EVP_PKEY_CTX_get_dh_kdf_outlen(ctx, plen) \
        EVP_PKEY_CTX_ctrl(ctx, EVP_PKEY_DHX, \
                                EVP_PKEY_OP_DERIVE, \
                        EVP_PKEY_CTRL_GET_DH_KDF_OUTLEN, 0, (void *)(plen))

# define EVP_PKEY_CTX_set0_dh_kdf_ukm(ctx, p, plen) \
        EVP_PKEY_CTX_ctrl(ctx, EVP_PKEY_DHX, \
                                EVP_PKEY_OP_DERIVE, \
                                EVP_PKEY_CTRL_DH_KDF_UKM, plen, (void *)(p))

# define EVP_PKEY_CTX_get0_dh_kdf_ukm(ctx, p) \
        EVP_PKEY_CTX_ctrl(ctx, EVP_PKEY_DHX, \
                                EVP_PKEY_OP_DERIVE, \
                                EVP_PKEY_CTRL_GET_DH_KDF_UKM, 0, (void *)(p))
}

implementation

end.
