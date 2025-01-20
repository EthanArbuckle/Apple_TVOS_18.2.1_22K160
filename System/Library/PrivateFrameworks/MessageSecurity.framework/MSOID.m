@interface MSOID
+ (id)ECSignatureOIDWithDigestAlgorithm:(id)a3 error:(id *)a4;
+ (id)OIDWithAsn1OID:(heim_oid *)a3 error:(id *)a4;
+ (id)OIDWithData:(id)a3 error:(id *)a4;
+ (id)OIDWithString:(id)a3 error:(id *)a4;
+ (id)RSASignatureOIDWithDigestAlgorithm:(id)a3 error:(id *)a4;
+ (id)digestOIDWithSignatureAlgorithm:(id)a3 error:(id *)a4;
+ (id)signatureAlgorithmOIDWithSecKeyAlgorithm:(__CFString *)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToString:(id)a3;
- (BOOL)setAsn1OidFromOIDString:(id)a3 error:(id *)a4;
- (MSOID)initWithAsn1OID:(heim_oid *)a3 error:(id *)a4;
- (MSOID)initWithData:(id)a3 error:(id *)a4;
- (MSOID)initWithString:(id)a3 error:(id *)a4;
- (NSData)OIDBytes;
- (NSString)OIDString;
- (__CFString)secKeyAlgorithm;
- (const)ccdigest;
- (heim_oid)Asn1OID;
- (id)initDigestOIDWithSignatureAlgorithm:(id)a3 error:(id *)a4;
- (id)initECSignatureOIDWithDigestAlgorithm:(id)a3 error:(id *)a4;
- (id)initRSASignatureOIDWithDigestAlgorithm:(id)a3 error:(id *)a4;
- (id)initSignatureOIDWithSecKeyAlgorithm:(__CFString *)a3 error:(id *)a4;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation MSOID

- (BOOL)setAsn1OidFromOIDString:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = v6;
  if (v6)
  {
    if ((unint64_t)[v6 length] >= 3)
    {
      [MEMORY[0x189607810] characterSetWithCharactersInString:@"0123456789."];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      [v8 invertedSet];
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v10 = [v7 rangeOfCharacterFromSet:v9];
      uint64_t v12 = v11;

      objc_msgSend(v7, "getCharacters:range:", v21, 0, 2);
      if (v21[1] == 46 && v21[0] - 51 > 0xFFFFFFFC && v10 == 0x7FFFFFFFFFFFFFFFLL && !v12)
      {
        [v7 componentsSeparatedByString:@"."];
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (v13 && [v13 count])
        {
          v15 = (unsigned int *)malloc(4 * [v14 count]);
          if (v15)
          {
            v16 = v15;
            v20[0] = MEMORY[0x1895F87A8];
            v20[1] = 3221225472LL;
            v20[2] = __39__MSOID_setAsn1OidFromOIDString_error___block_invoke;
            v20[3] = &__block_descriptor_40_e15_v32__0_8Q16_B24l;
            v20[4] = v15;
            [v14 enumerateObjectsUsingBlock:v20];
            self->_Asn1OID.length = [v14 count];
            self->_Asn1OID.components = v16;
            BOOL v17 = 1;
LABEL_20:

            goto LABEL_14;
          }

          +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  MSErrorAllocationDomain[0],  -108LL,  *a4,  @"could allocate OID components",  v19);
        }

        else
        {
          if (!a4)
          {
            BOOL v17 = 0;
            goto LABEL_20;
          }

          +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  MSErrorAllocationDomain[0],  -108LL,  *a4,  @"could not parse OID into parts %@",  v7);
        }

        BOOL v17 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_20;
      }
    }
  }

  if (a4)
  {
    +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  MSErrorASN1Domain[0],  -50LL,  *a4,  @"missing or invalid OID string %@",  v7);
    BOOL v17 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    BOOL v17 = 0;
  }

void __39__MSOID_setAsn1OidFromOIDString_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7 = a2;
  uint64_t v8 = *(void *)(a1 + 32);
  id v14 = v7;
  if (![v14 length])
  {

    goto LABEL_13;
  }

  [MEMORY[0x189607810] decimalDigitCharacterSet];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 invertedSet];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v13 = [v14 rangeOfCharacterFromSet:v10] == 0x7FFFFFFFFFFFFFFFLL && v11 == 0;

  if (!v8 || !v13)
  {

    if (v13) {
      goto LABEL_14;
    }
LABEL_13:
    *a4 = 1;
    goto LABEL_14;
  }

  *(_DWORD *)(v8 + 4 * a3) = [v14 intValue];

LABEL_14:
}

+ (id)OIDWithString:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)[objc_alloc((Class)a1) initWithString:v6 error:a4];

  return v7;
}

+ (id)OIDWithData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)[objc_alloc((Class)a1) initWithData:v6 error:a4];

  return v7;
}

+ (id)digestOIDWithSignatureAlgorithm:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)[objc_alloc((Class)a1) initDigestOIDWithSignatureAlgorithm:v6 error:a4];

  return v7;
}

+ (id)signatureAlgorithmOIDWithSecKeyAlgorithm:(__CFString *)a3 error:(id *)a4
{
  return (id)[objc_alloc((Class)a1) initSignatureOIDWithSecKeyAlgorithm:a3 error:a4];
}

+ (id)OIDWithAsn1OID:(heim_oid *)a3 error:(id *)a4
{
  return (id)[objc_alloc((Class)a1) initWithAsn1OID:a3 error:a4];
}

+ (id)RSASignatureOIDWithDigestAlgorithm:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)[objc_alloc((Class)a1) initRSASignatureOIDWithDigestAlgorithm:v6 error:a4];

  return v7;
}

+ (id)ECSignatureOIDWithDigestAlgorithm:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)[objc_alloc((Class)a1) initECSignatureOIDWithDigestAlgorithm:v6 error:a4];

  return v7;
}

- (MSOID)initWithString:(id)a3 error:(id *)a4
{
  id v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___MSOID;
  uint64_t v8 = -[MSOID init](&v14, sel_init);
  v9 = v8;
  if (!v8
    || (objc_storeStrong((id *)&v8->_OIDString, a3),
        -[MSOID setAsn1OidFromOIDString:error:](v9, "setAsn1OidFromOIDString:error:", v7, a4))
    && (NSDataFromIntegerArray(v9->_Asn1OID.components, v9->_Asn1OID.length),
        uint64_t v10 = objc_claimAutoreleasedReturnValue(),
        OIDBytes = v9->_OIDBytes,
        v9->_OIDBytes = (NSData *)v10,
        OIDBytes,
        v9->_OIDBytes))
  {
    uint64_t v12 = v9;
  }

  else
  {
    uint64_t v12 = 0LL;
  }

  return v12;
}

- (MSOID)initWithData:(id)a3 error:(id *)a4
{
  id v7 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___MSOID;
  uint64_t v8 = -[MSOID init](&v15, sel_init);
  v9 = v8;
  if (!v8) {
    goto LABEL_4;
  }
  objc_storeStrong((id *)&v8->_OIDBytes, a3);
  uint64_t v10 = NSStringFromOIDData(v7);
  OIDString = v9->_OIDString;
  v9->_OIDString = (NSString *)v10;

  uint64_t v12 = v9->_OIDString;
  if (!v12)
  {
    if (a4)
    {
      +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  MSErrorAllocationDomain[0],  -108LL,  *a4,  @"could not parse OID into string");
      BOOL v13 = 0LL;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }

- (id)initDigestOIDWithSignatureAlgorithm:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (initDigestOIDWithSignatureAlgorithm_error__onceToken != -1) {
    dispatch_once(&initDigestOIDWithSignatureAlgorithm_error__onceToken, &__block_literal_global_1);
  }
  id v7 = (void *)initDigestOIDWithSignatureAlgorithm_error__sSigAlgToDigAlg;
  [v6 OIDString];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 objectForKeyedSubscript:v8];
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    +[MSOID OIDWithString:error:](&OBJC_CLASS___MSOID, "OIDWithString:error:", v9, a4);
    a4 = (id *)objc_claimAutoreleasedReturnValue();
  }

  else if (a4)
  {
    uint64_t v10 = MSErrorCryptoDomain[0];
    id v11 = *a4;
    [v6 OIDString];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  v10,  -50LL,  v11,  @"MSOID %@ does not indicate a digest algorithm",  v12);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    a4 = 0LL;
  }

  return a4;
}

void __51__MSOID_initDigestOIDWithSignatureAlgorithm_error___block_invoke()
{
  v3[11] = *MEMORY[0x1895F89C0];
  v2[0] = @"1.2.840.113549.1.1.4";
  v2[1] = @"1.2.840.113549.1.1.5";
  v3[0] = @"1.2.840.113549.2.5";
  v3[1] = @"1.3.14.3.2.26";
  v2[2] = @"1.2.840.10045.4.1";
  v2[3] = @"1.2.840.113549.1.1.14";
  v3[2] = @"1.3.14.3.2.26";
  v3[3] = @"2.16.840.1.101.3.4.2.4";
  v2[4] = @"1.2.840.10045.4.3.1";
  v2[5] = @"1.2.840.113549.1.1.11";
  v3[4] = @"2.16.840.1.101.3.4.2.4";
  v3[5] = @"2.16.840.1.101.3.4.2.1";
  v2[6] = @"1.2.840.10045.4.3.2";
  v2[7] = @"1.2.840.113549.1.1.12";
  v3[6] = @"2.16.840.1.101.3.4.2.1";
  v3[7] = @"2.16.840.1.101.3.4.2.2";
  v2[8] = @"1.2.840.10045.4.3.3";
  v2[9] = @"1.2.840.113549.1.1.13";
  v3[8] = @"2.16.840.1.101.3.4.2.2";
  v3[9] = @"2.16.840.1.101.3.4.2.3";
  v2[10] = @"1.2.840.10045.4.3.4";
  v3[10] = @"2.16.840.1.101.3.4.2.3";
  uint64_t v0 = [MEMORY[0x189603F68] dictionaryWithObjects:v3 forKeys:v2 count:11];
  v1 = (void *)initDigestOIDWithSignatureAlgorithm_error__sSigAlgToDigAlg;
  initDigestOIDWithSignatureAlgorithm_error__sSigAlgToDigAlg = v0;
}

- (id)initRSASignatureOIDWithDigestAlgorithm:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (initRSASignatureOIDWithDigestAlgorithm_error__onceToken != -1) {
    dispatch_once(&initRSASignatureOIDWithDigestAlgorithm_error__onceToken, &__block_literal_global_119);
  }
  id v7 = (void *)initRSASignatureOIDWithDigestAlgorithm_error__sDigAlgToSigAlg;
  [v6 OIDString];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 objectForKeyedSubscript:v8];
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    +[MSOID OIDWithString:error:](&OBJC_CLASS___MSOID, "OIDWithString:error:", v9, a4);
    a4 = (id *)objc_claimAutoreleasedReturnValue();
  }

  else if (a4)
  {
    uint64_t v10 = MSErrorCryptoDomain[0];
    id v11 = *a4;
    [v6 OIDString];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  v10,  -50LL,  v11,  @"MSOID %@ does not indicate a signature algorithm",  v12);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    a4 = 0LL;
  }

  return a4;
}

void __54__MSOID_initRSASignatureOIDWithDigestAlgorithm_error___block_invoke()
{
  v3[6] = *MEMORY[0x1895F89C0];
  v2[0] = @"1.2.840.113549.2.5";
  v2[1] = @"1.3.14.3.2.26";
  v3[0] = @"1.2.840.113549.1.1.4";
  v3[1] = @"1.2.840.113549.1.1.5";
  v2[2] = @"2.16.840.1.101.3.4.2.4";
  v2[3] = @"2.16.840.1.101.3.4.2.1";
  v3[2] = @"1.2.840.113549.1.1.14";
  v3[3] = @"1.2.840.113549.1.1.11";
  v2[4] = @"2.16.840.1.101.3.4.2.2";
  v2[5] = @"2.16.840.1.101.3.4.2.3";
  v3[4] = @"1.2.840.113549.1.1.12";
  v3[5] = @"1.2.840.113549.1.1.13";
  uint64_t v0 = [MEMORY[0x189603F68] dictionaryWithObjects:v3 forKeys:v2 count:6];
  v1 = (void *)initRSASignatureOIDWithDigestAlgorithm_error__sDigAlgToSigAlg;
  initRSASignatureOIDWithDigestAlgorithm_error__sDigAlgToSigAlg = v0;
}

- (id)initECSignatureOIDWithDigestAlgorithm:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (initECSignatureOIDWithDigestAlgorithm_error__onceToken != -1) {
    dispatch_once(&initECSignatureOIDWithDigestAlgorithm_error__onceToken, &__block_literal_global_122);
  }
  id v7 = (void *)initECSignatureOIDWithDigestAlgorithm_error__sDigAlgToSigAlg;
  [v6 OIDString];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 objectForKeyedSubscript:v8];
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    +[MSOID OIDWithString:error:](&OBJC_CLASS___MSOID, "OIDWithString:error:", v9, a4);
    a4 = (id *)objc_claimAutoreleasedReturnValue();
  }

  else if (a4)
  {
    uint64_t v10 = MSErrorCryptoDomain[0];
    id v11 = *a4;
    [v6 OIDString];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  v10,  -50LL,  v11,  @"MSOID %@ does not indicate a signature algorithm",  v12);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    a4 = 0LL;
  }

  return a4;
}

void __53__MSOID_initECSignatureOIDWithDigestAlgorithm_error___block_invoke()
{
  v3[5] = *MEMORY[0x1895F89C0];
  v2[0] = @"1.3.14.3.2.26";
  v2[1] = @"2.16.840.1.101.3.4.2.4";
  v3[0] = @"1.2.840.10045.4.1";
  v3[1] = @"1.2.840.10045.4.3.1";
  v2[2] = @"2.16.840.1.101.3.4.2.1";
  v2[3] = @"2.16.840.1.101.3.4.2.2";
  v3[2] = @"1.2.840.10045.4.3.2";
  v3[3] = @"1.2.840.10045.4.3.3";
  v2[4] = @"2.16.840.1.101.3.4.2.3";
  v3[4] = @"1.2.840.10045.4.3.4";
  uint64_t v0 = [MEMORY[0x189603F68] dictionaryWithObjects:v3 forKeys:v2 count:5];
  v1 = (void *)initECSignatureOIDWithDigestAlgorithm_error__sDigAlgToSigAlg;
  initECSignatureOIDWithDigestAlgorithm_error__sDigAlgToSigAlg = v0;
}

- (id)initSignatureOIDWithSecKeyAlgorithm:(__CFString *)a3 error:(id *)a4
{
  if (initSignatureOIDWithSecKeyAlgorithm_error__onceToken != -1) {
    dispatch_once(&initSignatureOIDWithSecKeyAlgorithm_error__onceToken, &__block_literal_global_123);
  }
  [(id)initSignatureOIDWithSecKeyAlgorithm_error__sKeyAlgorithmToSignatureAlgorithm objectForKeyedSubscript:a3];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    +[MSOID OIDWithString:error:](&OBJC_CLASS___MSOID, "OIDWithString:error:", v7, a4);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else if (a4)
  {
    +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  MSErrorCryptoDomain[0],  -50LL,  *a4,  @"SecKeyAlgorithm %@ does not indicate a signature algorithm",  a3);
    uint64_t v8 = 0LL;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v8 = 0LL;
  }

  return v8;
}

void __51__MSOID_initSignatureOIDWithSecKeyAlgorithm_error___block_invoke()
{
  v14[22] = *MEMORY[0x1895F89C0];
  uint64_t v0 = *MEMORY[0x18960BD00];
  v13[0] = *MEMORY[0x18960BCD0];
  v13[1] = v0;
  v14[0] = @"1.2.840.113549.1.1.4";
  v14[1] = @"1.2.840.113549.1.1.4";
  uint64_t v1 = *MEMORY[0x18960BD08];
  v13[2] = *MEMORY[0x18960BCD8];
  v13[3] = v1;
  v14[2] = @"1.2.840.113549.1.1.5";
  v14[3] = @"1.2.840.113549.1.1.5";
  uint64_t v2 = *MEMORY[0x18960BC70];
  v13[4] = *MEMORY[0x18960BC30];
  v13[5] = v2;
  v14[4] = @"1.2.840.10045.4.1";
  v14[5] = @"1.2.840.10045.4.1";
  uint64_t v3 = *MEMORY[0x18960BD10];
  v13[6] = *MEMORY[0x18960BCE0];
  v13[7] = v3;
  v14[6] = @"1.2.840.113549.1.1.14";
  v14[7] = @"1.2.840.113549.1.1.14";
  uint64_t v4 = *MEMORY[0x18960BC78];
  v13[8] = *MEMORY[0x18960BC38];
  v13[9] = v4;
  v14[8] = @"1.2.840.10045.4.3.1";
  v14[9] = @"1.2.840.10045.4.3.1";
  uint64_t v5 = *MEMORY[0x18960BD18];
  v13[10] = *MEMORY[0x18960BCE8];
  v13[11] = v5;
  v14[10] = @"1.2.840.113549.1.1.11";
  v14[11] = @"1.2.840.113549.1.1.11";
  uint64_t v6 = *MEMORY[0x18960BC80];
  v13[12] = *MEMORY[0x18960BC40];
  v13[13] = v6;
  v14[12] = @"1.2.840.10045.4.3.2";
  v14[13] = @"1.2.840.10045.4.3.2";
  uint64_t v7 = *MEMORY[0x18960BD20];
  v13[14] = *MEMORY[0x18960BCF0];
  v13[15] = v7;
  v14[14] = @"1.2.840.113549.1.1.12";
  v14[15] = @"1.2.840.113549.1.1.12";
  uint64_t v8 = *MEMORY[0x18960BC88];
  v13[16] = *MEMORY[0x18960BC48];
  v13[17] = v8;
  v14[16] = @"1.2.840.10045.4.3.3";
  v14[17] = @"1.2.840.10045.4.3.3";
  uint64_t v9 = *MEMORY[0x18960BD28];
  v13[18] = *MEMORY[0x18960BCF8];
  v13[19] = v9;
  v14[18] = @"1.2.840.113549.1.1.13";
  v14[19] = @"1.2.840.113549.1.1.13";
  uint64_t v10 = *MEMORY[0x18960BC90];
  v13[20] = *MEMORY[0x18960BC50];
  v13[21] = v10;
  v14[20] = @"1.2.840.10045.4.3.4";
  v14[21] = @"1.2.840.10045.4.3.4";
  uint64_t v11 = [MEMORY[0x189603F68] dictionaryWithObjects:v14 forKeys:v13 count:22];
  uint64_t v12 = (void *)initSignatureOIDWithSecKeyAlgorithm_error__sKeyAlgorithmToSignatureAlgorithm;
  initSignatureOIDWithSecKeyAlgorithm_error__sKeyAlgorithmToSignatureAlgorithm = v11;
}

- (__CFString)secKeyAlgorithm
{
  if (secKeyAlgorithm_onceToken != -1) {
    dispatch_once(&secKeyAlgorithm_onceToken, &__block_literal_global_126);
  }
  [(id)secKeyAlgorithm_sAlgorithmOIDToKeyAlgorithm objectForKeyedSubscript:self->_OIDString];
  uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __24__MSOID_secKeyAlgorithm__block_invoke()
{
  v13[11] = *MEMORY[0x1895F89C0];
  uint64_t v0 = *MEMORY[0x18960BCD0];
  v12[0] = @"1.2.840.113549.1.1.4";
  v12[1] = @"1.2.840.113549.1.1.5";
  uint64_t v1 = *MEMORY[0x18960BCD8];
  v13[0] = v0;
  v13[1] = v1;
  uint64_t v2 = *MEMORY[0x18960BCE0];
  v12[2] = @"1.2.840.113549.1.1.14";
  v12[3] = @"1.2.840.113549.1.1.11";
  uint64_t v3 = *MEMORY[0x18960BCE8];
  v13[2] = v2;
  v13[3] = v3;
  uint64_t v4 = *MEMORY[0x18960BCF0];
  v12[4] = @"1.2.840.113549.1.1.12";
  v12[5] = @"1.2.840.113549.1.1.13";
  uint64_t v5 = *MEMORY[0x18960BCF8];
  v13[4] = v4;
  v13[5] = v5;
  uint64_t v6 = *MEMORY[0x18960BC30];
  v12[6] = @"1.2.840.10045.4.1";
  v12[7] = @"1.2.840.10045.4.3.1";
  uint64_t v7 = *MEMORY[0x18960BC38];
  v13[6] = v6;
  v13[7] = v7;
  uint64_t v8 = *MEMORY[0x18960BC40];
  v12[8] = @"1.2.840.10045.4.3.2";
  v12[9] = @"1.2.840.10045.4.3.3";
  uint64_t v9 = *MEMORY[0x18960BC48];
  v13[8] = v8;
  v13[9] = v9;
  v12[10] = @"1.2.840.10045.4.3.4";
  v13[10] = *MEMORY[0x18960BC50];
  uint64_t v10 = [MEMORY[0x189603F68] dictionaryWithObjects:v13 forKeys:v12 count:11];
  uint64_t v11 = (void *)secKeyAlgorithm_sAlgorithmOIDToKeyAlgorithm;
  secKeyAlgorithm_sAlgorithmOIDToKeyAlgorithm = v10;
}

- (const)ccdigest
{
  return 0LL;
}

- (MSOID)initWithAsn1OID:(heim_oid *)a3 error:(id *)a4
{
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___MSOID;
  uint64_t v6 = -[MSOID init](&v19, sel_init);
  if (!v6) {
    goto LABEL_7;
  }
  int v7 = der_copy_oid();
  if (v7)
  {
    if (a4)
    {
      uint64_t v8 = MSErrorASN1Domain[0];
      uint64_t v9 = v7;
      id v10 = *a4;
      uint64_t v11 = @"unable to copy OID";
LABEL_13:
      +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  v8,  v9,  v10,  v11);
      BOOL v17 = 0LL;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    [v4 OIDString];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v5 isEqualToString:self->_OIDString])
    {
      [v4 OIDBytes];
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
      char v7 = [v6 isEqualToData:self->_OIDBytes];
    }

    else
    {
      char v7 = 0;
    }
  }

  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqualToString:(id)a3
{
  return -[NSString isEqualToString:](self->_OIDString, "isEqualToString:", a3);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MSOID;
  -[MSOID dealloc](&v3, sel_dealloc);
}

- (NSData)OIDBytes
{
  return (NSData *)objc_getProperty(self, a2, 8LL, 1);
}

- (NSString)OIDString
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (heim_oid)Asn1OID
{
  unint64_t v2 = v4[0];
  objc_super v3 = (unsigned int *)v4[1];
  result.components = v3;
  result.length = v2;
  return result;
}

- (void).cxx_destruct
{
}

@end