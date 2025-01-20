@interface MSAlgorithmIdentifier
+ (MSAlgorithmIdentifier)algorithmIdentifierWithAsn1AlgId:(AlgorithmIdentifier *)a3 error:(id *)a4;
+ (MSAlgorithmIdentifier)algorithmIdentifierWithOID:(id)a3;
+ (id)digestAlgorithmWithSignatureAlgorithm:(id)a3 error:(id *)a4;
- (AlgorithmIdentifier)asn1AlgId;
- (AlgorithmIdentifier)encode;
- (BOOL)isEqual:(id)a3;
- (MSAlgorithmIdentifier)initWithAsn1AlgId:(AlgorithmIdentifier *)a3 error:(id *)a4;
- (MSAlgorithmIdentifier)initWithOID:(id)a3;
- (MSAlgorithmIdentifier)initWithOID:(id)a3 parameters:(id)a4;
- (MSOID)algorithm;
- (NSData)parameters;
- (id)decode:(id)a3 error:(id *)a4;
- (id)initDigestAlgorithmWithSignatureAlgorithm:(id)a3 error:(id *)a4;
- (id)signatureAlgorithmWithDigestAlgorithm:(id)a3 error:(id *)a4;
- (unint64_t)blockSize:(id *)a3;
- (unint64_t)hash;
- (unint64_t)keySize:(id *)a3;
- (unsigned)ccAlgorithm:(id *)a3;
- (unsigned)ccMode:(id *)a3;
- (void)dealloc;
@end

@implementation MSAlgorithmIdentifier

- (AlgorithmIdentifier)encode
{
  v3 = (AlgorithmIdentifier *)malloc(0x18uLL);
  if (v3)
  {
    v4 = -[MSAlgorithmIdentifier algorithm](self, "algorithm");
    uint64_t v14 = [v4 Asn1OID];
    uint64_t v15 = v5;

    der_copy_oid();
    v6 = -[MSAlgorithmIdentifier parameters](self, "parameters");
    if (v6)
    {
      v3->var1 = (heim_base_data *)malloc(0x10uLL);
      v7 = -[MSAlgorithmIdentifier parameters](self, "parameters");
      uint64_t v8 = [v7 length];

      if (v8)
      {
        v9 = -[MSAlgorithmIdentifier parameters](self, "parameters");
        uint64_t v12 = [v9 length];

        id v10 = -[MSAlgorithmIdentifier parameters](self, "parameters", v12);
        v13 = (void *)[v10 bytes];
      }

      else
      {
        uint64_t v12 = 2LL;
        v13 = &asn1NULL;
      }

      MEMORY[0x186E066B4](&v12, v3->var1);
    }

    else
    {
      v3->var1 = 0LL;
    }
  }

  return v3;
}

+ (MSAlgorithmIdentifier)algorithmIdentifierWithOID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)[objc_alloc((Class)a1) initWithOID:v4];

  return (MSAlgorithmIdentifier *)v5;
}

+ (MSAlgorithmIdentifier)algorithmIdentifierWithAsn1AlgId:(AlgorithmIdentifier *)a3 error:(id *)a4
{
  return (MSAlgorithmIdentifier *)(id)[objc_alloc((Class)a1) initWithAsn1AlgId:a3 error:a4];
}

+ (id)digestAlgorithmWithSignatureAlgorithm:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)[objc_alloc((Class)a1) initDigestAlgorithmWithSignatureAlgorithm:v6 error:a4];

  return v7;
}

- (MSAlgorithmIdentifier)initWithOID:(id)a3
{
  id v4 = a3;
  [MEMORY[0x189603F48] data];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (algorithmOIDToParameters_onceToken != -1) {
    dispatch_once(&algorithmOIDToParameters_onceToken, &__block_literal_global_68);
  }
  [v4 OIDString];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [(id)algorithmOIDToParameters_sAlgorithmOIDStringIsAbsentParameters objectForKeyedSubscript:v6];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  char v8 = [v7 BOOLValue];

  if ((v8 & 1) != 0) {
    id v9 = 0LL;
  }
  else {
    id v9 = v5;
  }

  id v10 = -[MSAlgorithmIdentifier initWithOID:parameters:](self, "initWithOID:parameters:", v4, v9);
  return v10;
}

- (MSAlgorithmIdentifier)initWithOID:(id)a3 parameters:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___MSAlgorithmIdentifier;
  id v9 = -[MSAlgorithmIdentifier init](&v12, sel_init);
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_algorithm, a3);
    objc_storeStrong((id *)&v10->_parameters, a4);
    v10->_asn1AlgId = -[MSAlgorithmIdentifier encode](v10, "encode");
  }

  return v10;
}

- (id)decode:(id)a3 error:(id *)a4
{
  if (nsheim_decode_AlgorithmIdentifier(a3))
  {
    if (a4)
    {
      +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  MSErrorASN1Domain[0],  -26275LL,  *a4,  @"unable to decode Algorithm Identifier");
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

    return 0LL;
  }

  else
  {
    id v7 = -[MSAlgorithmIdentifier initWithAsn1AlgId:error:](self, "initWithAsn1AlgId:error:", v8, a4);
    free_AlgorithmIdentifier();
    return v7;
  }

- (id)initDigestAlgorithmWithSignatureAlgorithm:(id)a3 error:(id *)a4
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[MSOID digestOIDWithSignatureAlgorithm:error:](&OBJC_CLASS___MSOID, "digestOIDWithSignatureAlgorithm:error:", v6, a4);
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    self = -[MSAlgorithmIdentifier initWithOID:](self, "initWithOID:", v7);
    id v8 = self;
  }

  else
  {
    id v8 = 0LL;
  }

  return v8;
}

- (MSAlgorithmIdentifier)initWithAsn1AlgId:(AlgorithmIdentifier *)a3 error:(id *)a4
{
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___MSAlgorithmIdentifier;
  id v6 = -[MSAlgorithmIdentifier init](&v17, sel_init);
  if (!v6)
  {
LABEL_14:
    id v9 = v6;
    goto LABEL_16;
  }

  id v7 = (AlgorithmIdentifier *)malloc(0x18uLL);
  v6->_asn1AlgId = v7;
  if (!v7)
  {
    if (a4)
    {
      +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  MSErrorASN1Domain[0],  -108LL,  *a4,  @"unable to allocate Algorithm Identifier");
      id v9 = 0LL;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }

    goto LABEL_15;
  }

  int v8 = copy_AlgorithmIdentifier();
  if (!v8)
  {
    uint64_t v10 = +[MSOID OIDWithAsn1OID:error:](&OBJC_CLASS___MSOID, "OIDWithAsn1OID:error:", v6->_asn1AlgId, a4);
    algorithm = v6->_algorithm;
    v6->_algorithm = (MSOID *)v10;

    if (v6->_algorithm)
    {
      var1 = v6->_asn1AlgId->var1;
      if (var1)
      {
        if (var1->var0)
        {
          v13 = var1->var1;
          if (v13)
          {
            uint64_t v14 = [MEMORY[0x189603F48] dataWithBytes:v13 length:a3->var1->var0];
            parameters = v6->_parameters;
            v6->_parameters = (NSData *)v14;
          }
        }
      }

      goto LABEL_14;
    }

- (id)signatureAlgorithmWithDigestAlgorithm:(id)a3 error:(id *)a4
{
  id v6 = a3;
  -[MSAlgorithmIdentifier algorithm](self, "algorithm");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  int v8 = [v7 isEqualToString:@"1.2.840.113549.1.1.1"];

  if (v8)
  {
    [v6 algorithm];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[MSOID RSASignatureOIDWithDigestAlgorithm:error:]( &OBJC_CLASS___MSOID,  "RSASignatureOIDWithDigestAlgorithm:error:",  v9,  a4);
    uint64_t v10 = (id *)objc_claimAutoreleasedReturnValue();
LABEL_5:
    a4 = v10;
    goto LABEL_6;
  }
  v11 = -[MSAlgorithmIdentifier algorithm](self, "algorithm");
  int v12 = [v11 isEqualToString:@"1.2.840.10045.2.1"];

  if (v12)
  {
    [v6 algorithm];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[MSOID ECSignatureOIDWithDigestAlgorithm:error:]( &OBJC_CLASS___MSOID,  "ECSignatureOIDWithDigestAlgorithm:error:",  v9,  a4);
    uint64_t v10 = (id *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }

  if (!a4) {
    goto LABEL_7;
  }
  uint64_t v14 = MSErrorCryptoDomain[0];
  id v15 = *a4;
  -[MSAlgorithmIdentifier algorithm](self, "algorithm");
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 OIDString];
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  v14,  -50LL,  v15,  @"Algorithm Identifier %@ does not indicate a public key algorithm",  v16);
  *a4 = (id)objc_claimAutoreleasedReturnValue();

  a4 = 0LL;
LABEL_6:

LABEL_7:
  return a4;
}

- (unint64_t)hash
{
  parameters = self->_parameters;
  -[MSAlgorithmIdentifier algorithm](self, "algorithm");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v5 = [v4 hash];
  if (parameters)
  {
    -[MSAlgorithmIdentifier parameters](self, "parameters");
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 += [v6 hash];
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    [v5 algorithm];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (![v6 isEqual:self->_algorithm])
    {
      char v11 = 0;
      goto LABEL_16;
    }

    parameters = self->_parameters;
    if (parameters)
    {
LABEL_4:
      uint64_t v8 = [v5 parameters];
      if (v8)
      {
        id v9 = (void *)v8;
        [v5 parameters];
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
        char v11 = [v10 isEqualToData:self->_parameters];

        if (!parameters) {
          goto LABEL_15;
        }
      }

      else
      {
        char v11 = 0;
        if (!parameters) {
          goto LABEL_15;
        }
      }

- (unsigned)ccAlgorithm:(id *)a3
{
  if (a3 && *a3) {
    id v5 = (void *)[*a3 copy];
  }
  else {
    id v5 = 0LL;
  }
  if (ccAlgorithm__onceToken != -1) {
    dispatch_once(&ccAlgorithm__onceToken, &__block_literal_global_2);
  }
  -[MSAlgorithmIdentifier algorithm](self, "algorithm");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 OIDString];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v8 = (void *)ccAlgorithm__knownEncryptionAlgs;
  -[MSAlgorithmIdentifier algorithm](self, "algorithm");
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 OIDString];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 objectForKeyedSubscript:v10];
  char v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    unsigned int v12 = [v11 unsignedIntValue];
    if (!a3) {
      goto LABEL_13;
    }
  }

  else
  {
    uint64_t v13 = +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  MSErrorCMSDomain[0],  -26275LL,  v5,  @"unknown ccAlg -- unexpected encryption algorithm: %@",  v7);

    unsigned int v12 = 0;
    id v5 = (void *)v13;
    if (!a3) {
      goto LABEL_13;
    }
  }

  if (v5) {
    *a3 = v5;
  }
LABEL_13:

  return v12;
}

void __37__MSAlgorithmIdentifier_ccAlgorithm___block_invoke()
{
  v22[19] = *MEMORY[0x1895F89C0];
  v21[0] = @"1.3.14.3.2.6";
  [MEMORY[0x189607968] numberWithUnsignedInt:1];
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v20;
  v21[1] = @"1.3.14.3.2.7";
  [MEMORY[0x189607968] numberWithUnsignedInt:1];
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v19;
  v21[2] = @"1.2.840.113549.3.7";
  [MEMORY[0x189607968] numberWithUnsignedInt:2];
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v18;
  v21[3] = @"1.2.840.113549.3.2";
  [MEMORY[0x189607968] numberWithUnsignedInt:5];
  objc_super v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v17;
  v21[4] = @"2.16.840.1.101.3.4.1.1";
  [MEMORY[0x189607968] numberWithUnsignedInt:0];
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[4] = v16;
  v21[5] = @"2.16.840.1.101.3.4.1.2";
  [MEMORY[0x189607968] numberWithUnsignedInt:0];
  id v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[5] = v15;
  v21[6] = @"2.16.840.1.101.3.4.1.21";
  [MEMORY[0x189607968] numberWithUnsignedInt:0];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22[6] = v14;
  v21[7] = @"2.16.840.1.101.3.4.1.22";
  [MEMORY[0x189607968] numberWithUnsignedInt:0];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  v22[7] = v13;
  v21[8] = @"2.16.840.1.101.3.4.1.41";
  [MEMORY[0x189607968] numberWithUnsignedInt:0];
  unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue();
  v22[8] = v12;
  v21[9] = @"2.16.840.1.101.3.4.1.42";
  [MEMORY[0x189607968] numberWithUnsignedInt:0];
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v22[9] = v0;
  v21[10] = @"2.16.840.1.101.3.4.1.7";
  [MEMORY[0x189607968] numberWithUnsignedInt:0];
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v22[10] = v1;
  v21[11] = @"2.16.840.1.101.3.4.1.6";
  [MEMORY[0x189607968] numberWithUnsignedInt:0];
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v22[11] = v2;
  v21[12] = @"2.16.840.1.101.3.4.1.47";
  [MEMORY[0x189607968] numberWithUnsignedInt:0];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v22[12] = v3;
  v21[13] = @"2.16.840.1.101.3.4.1.46";
  [MEMORY[0x189607968] numberWithUnsignedInt:0];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  v22[13] = v4;
  v21[14] = @"2.16.840.1.101.3.4.1.27";
  [MEMORY[0x189607968] numberWithUnsignedInt:0];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22[14] = v5;
  v21[15] = @"2.16.840.1.101.3.4.1.26";
  [MEMORY[0x189607968] numberWithUnsignedInt:0];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22[15] = v6;
  v21[16] = @"2.16.840.1.101.3.4.1.5";
  [MEMORY[0x189607968] numberWithUnsignedInt:1];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22[16] = v7;
  v21[17] = @"2.16.840.1.101.3.4.1.25";
  [MEMORY[0x189607968] numberWithUnsignedInt:1];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22[17] = v8;
  v21[18] = @"2.16.840.1.101.3.4.1.45";
  [MEMORY[0x189607968] numberWithUnsignedInt:1];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22[18] = v9;
  uint64_t v10 = [MEMORY[0x189603F68] dictionaryWithObjects:v22 forKeys:v21 count:19];
  char v11 = (void *)ccAlgorithm__knownEncryptionAlgs;
  ccAlgorithm__knownEncryptionAlgs = v10;
}

- (unsigned)ccMode:(id *)a3
{
  if (a3 && *a3) {
    id v5 = (void *)[*a3 copy];
  }
  else {
    id v5 = 0LL;
  }
  if (ccMode__onceToken != -1) {
    dispatch_once(&ccMode__onceToken, &__block_literal_global_15);
  }
  -[MSAlgorithmIdentifier algorithm](self, "algorithm");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 OIDString];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  [(id)ccMode__knownEncryptionAlgs objectForKeyedSubscript:v7];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  id v9 = v8;
  if (v8)
  {
    unsigned int v10 = [v8 unsignedIntValue];
    if (!a3) {
      goto LABEL_13;
    }
  }

  else
  {
    uint64_t v11 = +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  MSErrorCMSDomain[0],  -26275LL,  v5,  @"unknown ccMode -- unexpected encryption algorithm: %@",  v7);

    unsigned int v10 = 0;
    id v5 = (void *)v11;
    if (!a3) {
      goto LABEL_13;
    }
  }

  if (v5) {
    *a3 = v5;
  }
LABEL_13:

  return v10;
}

void __32__MSAlgorithmIdentifier_ccMode___block_invoke()
{
  v19[16] = *MEMORY[0x1895F89C0];
  v18[0] = @"1.3.14.3.2.6";
  [MEMORY[0x189607968] numberWithUnsignedInt:1];
  objc_super v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v17;
  v18[1] = @"1.3.14.3.2.7";
  [MEMORY[0x189607968] numberWithUnsignedInt:2];
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v16;
  v18[2] = @"1.2.840.113549.3.7";
  [MEMORY[0x189607968] numberWithUnsignedInt:2];
  id v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v15;
  v18[3] = @"1.2.840.113549.3.2";
  [MEMORY[0x189607968] numberWithUnsignedInt:2];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[3] = v14;
  v18[4] = @"2.16.840.1.101.3.4.1.1";
  [MEMORY[0x189607968] numberWithUnsignedInt:1];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[4] = v13;
  v18[5] = @"2.16.840.1.101.3.4.1.2";
  [MEMORY[0x189607968] numberWithUnsignedInt:2];
  unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19[5] = v12;
  v18[6] = @"2.16.840.1.101.3.4.1.21";
  [MEMORY[0x189607968] numberWithUnsignedInt:1];
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v19[6] = v0;
  v18[7] = @"2.16.840.1.101.3.4.1.22";
  [MEMORY[0x189607968] numberWithUnsignedInt:2];
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v19[7] = v1;
  v18[8] = @"2.16.840.1.101.3.4.1.41";
  [MEMORY[0x189607968] numberWithUnsignedInt:1];
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v19[8] = v2;
  v18[9] = @"2.16.840.1.101.3.4.1.42";
  [MEMORY[0x189607968] numberWithUnsignedInt:2];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v19[9] = v3;
  v18[10] = @"2.16.840.1.101.3.4.1.7";
  [MEMORY[0x189607968] numberWithUnsignedInt:12];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19[10] = v4;
  v18[11] = @"2.16.840.1.101.3.4.1.6";
  [MEMORY[0x189607968] numberWithUnsignedInt:11];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19[11] = v5;
  v18[12] = @"2.16.840.1.101.3.4.1.47";
  [MEMORY[0x189607968] numberWithUnsignedInt:12];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19[12] = v6;
  v18[13] = @"2.16.840.1.101.3.4.1.46";
  [MEMORY[0x189607968] numberWithUnsignedInt:11];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19[13] = v7;
  v18[14] = @"2.16.840.1.101.3.4.1.27";
  [MEMORY[0x189607968] numberWithUnsignedInt:12];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19[14] = v8;
  v18[15] = @"2.16.840.1.101.3.4.1.26";
  [MEMORY[0x189607968] numberWithUnsignedInt:11];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19[15] = v9;
  uint64_t v10 = [MEMORY[0x189603F68] dictionaryWithObjects:v19 forKeys:v18 count:16];
  uint64_t v11 = (void *)ccMode__knownEncryptionAlgs;
  ccMode__knownEncryptionAlgs = v10;
}

- (unint64_t)blockSize:(id *)a3
{
  if (a3 && *a3) {
    id v5 = (void *)[*a3 copy];
  }
  else {
    id v5 = 0LL;
  }
  if (blockSize__onceToken != -1) {
    dispatch_once(&blockSize__onceToken, &__block_literal_global_18);
  }
  -[MSAlgorithmIdentifier algorithm](self, "algorithm");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 OIDString];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  [(id)blockSize__knownEncryptionAlgs objectForKeyedSubscript:v7];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  id v9 = v8;
  if (v8)
  {
    unint64_t v10 = [v8 unsignedIntValue];
    if (!a3) {
      goto LABEL_13;
    }
  }

  else
  {
    uint64_t v11 = +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  MSErrorCMSDomain[0],  -26275LL,  v5,  @"unknown blockSize -- unexpected encryption algorithm: %@",  v7);

    unint64_t v10 = 0LL;
    id v5 = (void *)v11;
    if (!a3) {
      goto LABEL_13;
    }
  }

  if (v5) {
    *a3 = v5;
  }
LABEL_13:

  return v10;
}

void __35__MSAlgorithmIdentifier_blockSize___block_invoke()
{
  v22[19] = *MEMORY[0x1895F89C0];
  v21[0] = @"1.3.14.3.2.6";
  [MEMORY[0x189607968] numberWithUnsignedInt:8];
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v20;
  v21[1] = @"1.3.14.3.2.7";
  [MEMORY[0x189607968] numberWithUnsignedInt:8];
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v19;
  v21[2] = @"1.2.840.113549.3.7";
  [MEMORY[0x189607968] numberWithUnsignedInt:8];
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v18;
  v21[3] = @"1.2.840.113549.3.2";
  [MEMORY[0x189607968] numberWithUnsignedInt:8];
  objc_super v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v17;
  v21[4] = @"2.16.840.1.101.3.4.1.1";
  [MEMORY[0x189607968] numberWithUnsignedInt:16];
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[4] = v16;
  v21[5] = @"2.16.840.1.101.3.4.1.2";
  [MEMORY[0x189607968] numberWithUnsignedInt:16];
  id v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[5] = v15;
  v21[6] = @"2.16.840.1.101.3.4.1.21";
  [MEMORY[0x189607968] numberWithUnsignedInt:16];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22[6] = v14;
  v21[7] = @"2.16.840.1.101.3.4.1.22";
  [MEMORY[0x189607968] numberWithUnsignedInt:16];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  v22[7] = v13;
  v21[8] = @"2.16.840.1.101.3.4.1.41";
  [MEMORY[0x189607968] numberWithUnsignedInt:16];
  unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue();
  v22[8] = v12;
  v21[9] = @"2.16.840.1.101.3.4.1.42";
  [MEMORY[0x189607968] numberWithUnsignedInt:16];
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v22[9] = v0;
  v21[10] = @"2.16.840.1.101.3.4.1.7";
  [MEMORY[0x189607968] numberWithUnsignedInt:16];
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v22[10] = v1;
  v21[11] = @"2.16.840.1.101.3.4.1.6";
  [MEMORY[0x189607968] numberWithUnsignedInt:16];
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v22[11] = v2;
  v21[12] = @"2.16.840.1.101.3.4.1.47";
  [MEMORY[0x189607968] numberWithUnsignedInt:16];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v22[12] = v3;
  v21[13] = @"2.16.840.1.101.3.4.1.46";
  [MEMORY[0x189607968] numberWithUnsignedInt:16];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  v22[13] = v4;
  v21[14] = @"2.16.840.1.101.3.4.1.27";
  [MEMORY[0x189607968] numberWithUnsignedInt:16];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22[14] = v5;
  v21[15] = @"2.16.840.1.101.3.4.1.26";
  [MEMORY[0x189607968] numberWithUnsignedInt:16];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22[15] = v6;
  v21[16] = @"2.16.840.1.101.3.4.1.5";
  [MEMORY[0x189607968] numberWithUnsignedInt:16];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22[16] = v7;
  v21[17] = @"2.16.840.1.101.3.4.1.25";
  [MEMORY[0x189607968] numberWithUnsignedInt:16];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22[17] = v8;
  v21[18] = @"2.16.840.1.101.3.4.1.45";
  [MEMORY[0x189607968] numberWithUnsignedInt:16];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22[18] = v9;
  uint64_t v10 = [MEMORY[0x189603F68] dictionaryWithObjects:v22 forKeys:v21 count:19];
  uint64_t v11 = (void *)blockSize__knownEncryptionAlgs;
  blockSize__knownEncryptionAlgs = v10;
}

- (unint64_t)keySize:(id *)a3
{
  if (a3 && *a3) {
    id v5 = (void *)[*a3 copy];
  }
  else {
    id v5 = 0LL;
  }
  if (keySize__onceToken != -1) {
    dispatch_once(&keySize__onceToken, &__block_literal_global_21);
  }
  -[MSAlgorithmIdentifier algorithm](self, "algorithm");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 OIDString];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  [(id)keySize__knownEncryptionAlgs objectForKeyedSubscript:v7];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  id v9 = v8;
  if (v8)
  {
    unint64_t v10 = [v8 unsignedIntValue];
    if (!a3) {
      goto LABEL_13;
    }
  }

  else
  {
    uint64_t v11 = +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  MSErrorCMSDomain[0],  -26275LL,  v5,  @"unknown keySize -- unexpected encryption algorithm: %@",  v7);

    unint64_t v10 = 0LL;
    id v5 = (void *)v11;
    if (!a3) {
      goto LABEL_13;
    }
  }

  if (v5) {
    *a3 = v5;
  }
LABEL_13:

  return v10;
}

void __33__MSAlgorithmIdentifier_keySize___block_invoke()
{
  v22[19] = *MEMORY[0x1895F89C0];
  v21[0] = @"1.3.14.3.2.6";
  [MEMORY[0x189607968] numberWithUnsignedInt:8];
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v20;
  v21[1] = @"1.3.14.3.2.7";
  [MEMORY[0x189607968] numberWithUnsignedInt:8];
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v19;
  v21[2] = @"1.2.840.113549.3.7";
  [MEMORY[0x189607968] numberWithUnsignedInt:24];
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v18;
  v21[3] = @"1.2.840.113549.3.2";
  [MEMORY[0x189607968] numberWithUnsignedInt:128];
  objc_super v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v17;
  v21[4] = @"2.16.840.1.101.3.4.1.1";
  [MEMORY[0x189607968] numberWithUnsignedInt:16];
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[4] = v16;
  v21[5] = @"2.16.840.1.101.3.4.1.2";
  [MEMORY[0x189607968] numberWithUnsignedInt:16];
  id v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[5] = v15;
  v21[6] = @"2.16.840.1.101.3.4.1.21";
  [MEMORY[0x189607968] numberWithUnsignedInt:24];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22[6] = v14;
  v21[7] = @"2.16.840.1.101.3.4.1.22";
  [MEMORY[0x189607968] numberWithUnsignedInt:24];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  v22[7] = v13;
  v21[8] = @"2.16.840.1.101.3.4.1.41";
  [MEMORY[0x189607968] numberWithUnsignedInt:32];
  unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue();
  v22[8] = v12;
  v21[9] = @"2.16.840.1.101.3.4.1.42";
  [MEMORY[0x189607968] numberWithUnsignedInt:32];
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v22[9] = v0;
  v21[10] = @"2.16.840.1.101.3.4.1.7";
  [MEMORY[0x189607968] numberWithUnsignedInt:16];
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v22[10] = v1;
  v21[11] = @"2.16.840.1.101.3.4.1.6";
  [MEMORY[0x189607968] numberWithUnsignedInt:16];
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v22[11] = v2;
  v21[12] = @"2.16.840.1.101.3.4.1.47";
  [MEMORY[0x189607968] numberWithUnsignedInt:32];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v22[12] = v3;
  v21[13] = @"2.16.840.1.101.3.4.1.46";
  [MEMORY[0x189607968] numberWithUnsignedInt:32];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  v22[13] = v4;
  v21[14] = @"2.16.840.1.101.3.4.1.27";
  [MEMORY[0x189607968] numberWithUnsignedInt:24];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22[14] = v5;
  v21[15] = @"2.16.840.1.101.3.4.1.26";
  [MEMORY[0x189607968] numberWithUnsignedInt:24];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22[15] = v6;
  v21[16] = @"2.16.840.1.101.3.4.1.5";
  [MEMORY[0x189607968] numberWithUnsignedInt:16];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22[16] = v7;
  v21[17] = @"2.16.840.1.101.3.4.1.25";
  [MEMORY[0x189607968] numberWithUnsignedInt:24];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22[17] = v8;
  v21[18] = @"2.16.840.1.101.3.4.1.45";
  [MEMORY[0x189607968] numberWithUnsignedInt:32];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22[18] = v9;
  uint64_t v10 = [MEMORY[0x189603F68] dictionaryWithObjects:v22 forKeys:v21 count:19];
  uint64_t v11 = (void *)keySize__knownEncryptionAlgs;
  keySize__knownEncryptionAlgs = v10;
}

- (void)dealloc
{
  if (self->_asn1AlgId)
  {
    free_AlgorithmIdentifier();
    free(self->_asn1AlgId);
    self->_asn1AlgId = 0LL;
  }

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MSAlgorithmIdentifier;
  -[MSAlgorithmIdentifier dealloc](&v3, sel_dealloc);
}

- (MSOID)algorithm
{
  return (MSOID *)objc_getProperty(self, a2, 8LL, 1);
}

- (NSData)parameters
{
  return (NSData *)objc_getProperty(self, a2, 16LL, 1);
}

- (AlgorithmIdentifier)asn1AlgId
{
  return self->_asn1AlgId;
}

- (void).cxx_destruct
{
}

@end