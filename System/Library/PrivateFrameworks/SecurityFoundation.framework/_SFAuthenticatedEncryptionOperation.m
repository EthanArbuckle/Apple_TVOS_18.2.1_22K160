@interface _SFAuthenticatedEncryptionOperation
+ (BOOL)supportsSecureCoding;
+ (id)_defaultEncryptionOperation;
+ (int64_t)_defaultAuthenticationMode;
- (_SFAESKeySpecifier)encryptionKeySpecifier;
- (_SFAuthenticatedEncryptionOperation)init;
- (_SFAuthenticatedEncryptionOperation)initWithCoder:(id)a3;
- (_SFAuthenticatedEncryptionOperation)initWithKeySpecifier:(id)a3;
- (_SFAuthenticatedEncryptionOperation)initWithKeySpecifier:(id)a3 authenticationMode:(int64_t)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)decrypt:(id)a3 withKey:(id)a4 additionalAuthenticatedData:(id)a5 error:(id *)a6;
- (id)decrypt:(id)a3 withKey:(id)a4 error:(id *)a5;
- (id)encrypt:(id)a3 withKey:(id)a4 additionalAuthenticatedData:(id)a5 error:(id *)a6;
- (id)encrypt:(id)a3 withKey:(id)a4 additionalAuthenticatedData:(id)a5 ivGenerator:(id)a6 error:(id *)a7;
- (id)encrypt:(id)a3 withKey:(id)a4 error:(id *)a5;
- (id)encrypt:(id)a3 withKey:(id)a4 ivGenerator:(id)a5 error:(id *)a6;
- (int64_t)authenticationCodeLength;
- (int64_t)authenticationMode;
- (void)setAuthenticationCodeLength:(int64_t)a3;
- (void)setAuthenticationMode:(int64_t)a3;
- (void)setEncryptionKeySpecifier:(id)a3;
@end

@implementation _SFAuthenticatedEncryptionOperation

+ (int64_t)_defaultAuthenticationMode
{
  return 1LL;
}

+ (id)_defaultEncryptionOperation
{
  return objc_alloc_init((Class)objc_opt_class());
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_SFAuthenticatedEncryptionOperation)init
{
  v3 = -[_SFAESKeySpecifier initWithBitSize:](objc_alloc(&OBJC_CLASS____SFAESKeySpecifier), "initWithBitSize:", 2LL);
  v4 = -[_SFAuthenticatedEncryptionOperation initWithKeySpecifier:](self, "initWithKeySpecifier:", v3);

  return v4;
}

- (_SFAuthenticatedEncryptionOperation)initWithKeySpecifier:(id)a3
{
  id v4 = a3;
  v5 = -[_SFAuthenticatedEncryptionOperation initWithKeySpecifier:authenticationMode:]( self,  "initWithKeySpecifier:authenticationMode:",  v4,  [(id)objc_opt_class() _defaultAuthenticationMode]);

  return v5;
}

- (_SFAuthenticatedEncryptionOperation)initWithKeySpecifier:(id)a3 authenticationMode:(int64_t)a4
{
  id v8 = a3;
  if (!v8)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 handleFailureInMethod:a2, self, @"SFEncryptionOperation.m", 636, @"Invalid parameter not satisfying: %@", @"keySpecifier" object file lineNumber description];
  }

  if (a4 != 1)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 handleFailureInMethod:a2 object:self file:@"SFEncryptionOperation.m" lineNumber:637 description:@"unsupported authentication mode - at present only SFAuthenticatedEncryptionModeGCM is supported"];
  }

  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS____SFAuthenticatedEncryptionOperation;
  v9 = -[_SFAuthenticatedEncryptionOperation init](&v15, sel_init);
  if (v9)
  {
    v10 = objc_alloc_init(&OBJC_CLASS___SFAuthenticatedEncryptionOperation_Ivars);
    id authenticatedEncryptionOperationInternal = v9->_authenticatedEncryptionOperationInternal;
    v9->_id authenticatedEncryptionOperationInternal = v10;

    objc_storeStrong((id *)v9->_authenticatedEncryptionOperationInternal + 1, a3);
    *((void *)v9->_authenticatedEncryptionOperationInternal + 2) = a4;
    *((void *)v9->_authenticatedEncryptionOperationInternal + 3) = [v8 blockSize];
  }

  return v9;
}

- (_SFAuthenticatedEncryptionOperation)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS____SFAuthenticatedEncryptionOperation;
  return -[_SFAuthenticatedEncryptionOperation init](&v4, sel_init, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)[objc_alloc((Class)objc_opt_class()) initWithKeySpecifier:*((void *)self->_authenticatedEncryptionOperationInternal + 1) authenticationMode:*((void *)self->_authenticatedEncryptionOperationInternal + 2)];
  *(void *)(*((void *)result + 1) + 24LL) = *((void *)self->_authenticatedEncryptionOperationInternal + 3);
  return result;
}

- (id)encrypt:(id)a3 withKey:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = objc_alloc_init(&OBJC_CLASS___SFIncrementingIVGenerator);
  v11 = -[_SFAuthenticatedEncryptionOperation encrypt:withKey:additionalAuthenticatedData:ivGenerator:error:]( self,  "encrypt:withKey:additionalAuthenticatedData:ivGenerator:error:",  v9,  v8,  0LL,  v10,  a5);
  return v11;
}

- (id)encrypt:(id)a3 withKey:(id)a4 additionalAuthenticatedData:(id)a5 error:(id *)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = objc_alloc_init(&OBJC_CLASS___SFIncrementingIVGenerator);
  v14 = -[_SFAuthenticatedEncryptionOperation encrypt:withKey:additionalAuthenticatedData:ivGenerator:error:]( self,  "encrypt:withKey:additionalAuthenticatedData:ivGenerator:error:",  v12,  v11,  v10,  v13,  a6);
  return v14;
}

- (id)encrypt:(id)a3 withKey:(id)a4 ivGenerator:(id)a5 error:(id *)a6
{
  return -[_SFAuthenticatedEncryptionOperation encrypt:withKey:additionalAuthenticatedData:ivGenerator:error:]( self,  "encrypt:withKey:additionalAuthenticatedData:ivGenerator:error:",  a3,  a4,  0LL,  a5,  a6);
}

- (id)encrypt:(id)a3 withKey:(id)a4 additionalAuthenticatedData:(id)a5 ivGenerator:(id)a6 error:(id *)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    [v32 handleFailureInMethod:a2 object:self file:@"SFEncryptionOperation.m" lineNumber:687 description:@"currently only AES keys are supported for SFAuthenticatedEncryptionOperation"];
  }

  [v14 keyData];
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "generateIVWithLength:error:", objc_msgSend(v17, "length"), a7);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    if (!a7)
    {
      v27 = 0LL;
      goto LABEL_14;
    }

    [MEMORY[0x189607870] errorWithDomain:@"SFCryptoServicesErrorDomain" code:4 userInfo:0];
    id v28 = (id)objc_claimAutoreleasedReturnValue();
    v27 = 0LL;
    goto LABEL_12;
  }

  id v37 = v14;
  size_t v19 = [v13 length];
  v20 = v18;
  v34 = malloc(v19);
  size_t v21 = *((void *)self->_authenticatedEncryptionOperationInternal + 3);
  v22 = malloc(v21);
  size_t v39 = v21;
  [v17 bytes];
  v35 = v20;
  id v23 = v20;
  [v23 bytes];
  [v23 length];
  id v36 = v15;
  id v24 = v15;
  [v24 bytes];
  [v24 length];
  id v38 = v13;
  v25 = v13;
  v26 = v34;
  uint64_t v33 = [v25 bytes];
  if (CCCryptorGCM())
  {
    v27 = 0LL;
  }

  else
  {
    objc_msgSend(MEMORY[0x189603F48], "dataWithBytes:length:", v34, v19, v33, v19, v34, v22, &v39);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189603F48] dataWithBytes:v22 length:v39];
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = -[_SFAuthenticatedCiphertext initWithCiphertext:authenticationCode:initializationVector:]( objc_alloc(&OBJC_CLASS____SFAuthenticatedCiphertext),  "initWithCiphertext:authenticationCode:initializationVector:",  v29,  v30,  v23);

    v26 = v34;
  }

  free(v26);
  free(v22);
  id v14 = v37;
  id v13 = v38;
  id v15 = v36;
  v18 = v35;
  if (a7 && !v27)
  {
    [MEMORY[0x189607870] errorWithDomain:@"SFCryptoServicesErrorDomain" code:2 userInfo:0];
    id v28 = (id)objc_claimAutoreleasedReturnValue();
LABEL_12:
    *a7 = v28;
  }

- (id)decrypt:(id)a3 withKey:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    -[_SFAuthenticatedEncryptionOperation decrypt:withKey:additionalAuthenticatedData:error:]( self,  "decrypt:withKey:additionalAuthenticatedData:error:",  v8,  v9,  0LL,  a5);
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else if (a5)
  {
    [MEMORY[0x189607870] errorWithDomain:@"SFCryptoServicesErrorDomain" code:9 userInfo:0];
    id v10 = 0LL;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v10 = 0LL;
  }

  return v10;
}

- (id)decrypt:(id)a3 withKey:(id)a4 additionalAuthenticatedData:(id)a5 error:(id *)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    [v40 handleFailureInMethod:a2 object:self file:@"SFEncryptionOperation.m" lineNumber:739 description:@"currently only AES keys are supported for SFAuthenticatedEncryptionOperation"];
  }

  id v14 = v12;
  [v11 authenticationCode];
  id v15 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v16 = [v15 length];
  uint64_t v17 = *((void *)self->_authenticatedEncryptionOperationInternal + 3);

  if (v16 == v17)
  {
    v48 = a6;
    id v45 = v14;
    [v14 keyData];
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v18 length];
    [v11 initializationVector];
    size_t v19 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 ciphertext];
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    size_t v21 = v11;
    size_t v22 = [v20 length];

    id v23 = malloc(v22);
    size_t v24 = *((void *)self->_authenticatedEncryptionOperationInternal + 3);
    v25 = malloc(v24);
    size_t v51 = v24;
    id v47 = v18;
    [v47 bytes];
    id v26 = v19;
    [v26 bytes];
    id v46 = v26;
    [v26 length];
    id v49 = v13;
    id v27 = v13;
    [v27 bytes];
    [v27 length];
    v50 = v21;
    id v28 = [v21 ciphertext];
    v29 = v25;
    v44 = v23;
    size_t v42 = v22;
    v43 = v23;
    size_t v30 = v22;
    uint64_t v41 = [v28 bytes];
    LODWORD(v19) = CCCryptorGCM();

    if ((_DWORD)v19)
    {
      v31 = 0LL;
      v32 = v48;
      id v13 = v49;
      v34 = v26;
      uint64_t v33 = v47;
      v35 = v44;
      id v14 = v45;
      id v11 = v50;
    }

    else
    {
      id v11 = v50;
      id v36 = objc_msgSend(v50, "authenticationCode", v41, v42, v43, v25, &v51);
      id v37 = (const void *)[v36 bytes];
      int v38 = timingsafe_bcmp(v25, v37, v51);

      if (v38)
      {
        v31 = 0LL;
        v32 = v48;
        id v13 = v49;
        uint64_t v33 = v47;
        v35 = v44;
      }

      else
      {
        v35 = v44;
        [MEMORY[0x189603F48] dataWithBytes:v44 length:v30];
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = v48;
        id v13 = v49;
        uint64_t v33 = v47;
      }

      id v14 = v45;
      v34 = v46;
    }

    free(v35);
    free(v29);
    if (v32 && !v31)
    {
      [MEMORY[0x189607870] errorWithDomain:@"SFCryptoServicesErrorDomain" code:3 userInfo:0];
      id *v32 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  else if (a6)
  {
    [MEMORY[0x189607870] errorWithDomain:@"SFCryptoServicesErrorDomain" code:5 userInfo:0];
    v31 = 0LL;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v31 = 0LL;
  }

  return v31;
}

- (_SFAESKeySpecifier)encryptionKeySpecifier
{
  return (_SFAESKeySpecifier *)objc_retainAutoreleaseReturnValue(*((id *)self->_authenticatedEncryptionOperationInternal
                                                                 + 1));
}

- (void)setEncryptionKeySpecifier:(id)a3
{
  uint64_t v4 = [a3 copy];
  id authenticatedEncryptionOperationInternal = self->_authenticatedEncryptionOperationInternal;
  v6 = (void *)authenticatedEncryptionOperationInternal[1];
  authenticatedEncryptionOperationInternal[1] = v4;
}

- (int64_t)authenticationMode
{
  return *((void *)self->_authenticatedEncryptionOperationInternal + 2);
}

- (void)setAuthenticationMode:(int64_t)a3
{
  if (a3 != 1)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 handleFailureInMethod:a2 object:self file:@"SFEncryptionOperation.m" lineNumber:793 description:@"unsupported authentication mode - at present only SFAuthenticatedEncryptionModeGCM is supported"];
  }

  *((void *)self->_authenticatedEncryptionOperationInternal + 2) = a3;
}

- (int64_t)authenticationCodeLength
{
  return *((void *)self->_authenticatedEncryptionOperationInternal + 3);
}

- (void)setAuthenticationCodeLength:(int64_t)a3
{
  *((void *)self->_authenticatedEncryptionOperationInternal + 3) = a3;
}

- (void).cxx_destruct
{
}

@end