@interface _SFIESOperation
+ (BOOL)supportsSecureCoding;
+ (void)initialize;
- (SFDigestOperation)digestOperation;
- (_SFAuthenticatedEncryptionOperation)encryptionOperation;
- (_SFECDHOperation)diffieHellmanOperation;
- (_SFIESOperation)init;
- (_SFIESOperation)initWithCoder:(id)a3;
- (_SFIESOperation)initWithCurve:(int64_t)a3;
- (_SFIESOperation)initWithCurve:(int64_t)a3 diffieHellmanOperation:(id)a4 encryptionOperation:(id)a5 digestOperation:(id)a6;
- (_SFKeySpecifier)encryptionKeySpecifier;
- (const)_ccDigestInfoWithError:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)decrypt:(id)a3 withKey:(id)a4 error:(id *)a5;
- (id)encrypt:(id)a3 withKey:(id)a4 error:(id *)a5;
- (int64_t)curve;
- (void)setCurve:(int64_t)a3;
- (void)setDiffieHellmanOperation:(id)a3;
- (void)setDigestOperation:(id)a3;
- (void)setEncryptionOperation:(id)a3;
@end

@implementation _SFIESOperation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    ccrng_system_init();
  }
}

- (_SFIESOperation)init
{
  return -[_SFIESOperation initWithCurve:](self, "initWithCurve:", 2LL);
}

- (_SFIESOperation)initWithCurve:(int64_t)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[_SFAuthenticatedEncryptionOperation _defaultEncryptionOperation]( &OBJC_CLASS____SFAuthenticatedEncryptionOperation,  "_defaultEncryptionOperation");
  _defaultDigestOperation();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[_SFIESOperation initWithCurve:diffieHellmanOperation:encryptionOperation:digestOperation:]( self,  "initWithCurve:diffieHellmanOperation:encryptionOperation:digestOperation:",  a3,  v5,  v6,  v7);

  return v8;
}

- (_SFIESOperation)initWithCurve:(int64_t)a3 diffieHellmanOperation:(id)a4 encryptionOperation:(id)a5 digestOperation:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS____SFIESOperation;
  v14 = -[_SFIESOperation init](&v18, sel_init);
  if (v14)
  {
    v15 = objc_alloc_init(&OBJC_CLASS___SFIESOperation_Ivars);
    id iesOperationInternal = v14->_iesOperationInternal;
    v14->_id iesOperationInternal = v15;

    *((void *)v14->_iesOperationInternal + 1) = a3;
    objc_storeStrong((id *)v14->_iesOperationInternal + 2, a4);
    objc_storeStrong((id *)v14->_iesOperationInternal + 3, a5);
    objc_storeStrong((id *)v14->_iesOperationInternal + 4, a6);
  }

  return v14;
}

- (_SFIESOperation)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS____SFIESOperation;
  return -[_SFIESOperation init](&v4, sel_init, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)[objc_alloc((Class)objc_opt_class()) initWithCurve:*((void *)self->_iesOperationInternal + 1) diffieHellmanOperation:*((void *)self->_iesOperationInternal + 2) encryptionOperation:*((void *)self->_iesOperationInternal + 3) digestOperation:*((void *)self->_iesOperationInternal + 4)];
}

- (const)_ccDigestInfoWithError:(id *)a3
{
  v10[1] = *MEMORY[0x1895F89C0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 && (objc_opt_respondsToSelector() & 1) != 0) {
      return (const ccdigest_info *)[*((id *)self->_iesOperationInternal + 4) _ccDigestInfo];
    }
  }

  v6 = (void *)MEMORY[0x189607870];
  uint64_t v7 = *((void *)self->_iesOperationInternal + 4);
  v9 = @"SFCryptoServicesErrorDigest";
  v10[0] = v7;
  [MEMORY[0x189603F68] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 errorWithDomain:@"SFCryptoServicesErrorDomain" code:1 userInfo:v8];
  *a3 = (id)objc_claimAutoreleasedReturnValue();

  return 0LL;
}

- (id)encrypt:(id)a3 withKey:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = v10;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }

  else
  {
    [MEMORY[0x1896077D8] currentHandler];
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v16 handleFailureInMethod:a2, self, @"SFEncryptionOperation.m", 1092, @"Invalid parameter not satisfying: %@", @"plaintext" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }

  [MEMORY[0x1896077D8] currentHandler];
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v17 handleFailureInMethod:a2, self, @"SFEncryptionOperation.m", 1093, @"Invalid parameter not satisfying: %@", @"key2" object file lineNumber description];

LABEL_3:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    id v12 = v11;
    uint64_t v22 = 0LL;
    v23 = &v22;
    uint64_t v24 = 0x3032000000LL;
    v25 = __Block_byref_object_copy__0;
    v26 = __Block_byref_object_dispose__0;
    id v27 = 0LL;
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = __41___SFIESOperation_encrypt_withKey_error___block_invoke;
    v18[3] = &unk_18A0543E0;
    v21 = &v22;
    v18[4] = self;
    id v19 = v9;
    id v13 = v12;
    id v20 = v13;
    [v13 performWithCCKey:v18];
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (a5) {
      *a5 = (id) v23[5];
    }

    _Block_object_dispose(&v22, 8);
  }

  else if (a5)
  {
    [MEMORY[0x189607870] errorWithDomain:@"SFCryptoServicesErrorDomain" code:9 userInfo:0];
    v14 = 0LL;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v14 = 0LL;
  }

  return v14;
}

- (id)decrypt:(id)a3 withKey:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = v10;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }

  else
  {
    [MEMORY[0x1896077D8] currentHandler];
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v16 handleFailureInMethod:a2, self, @"SFEncryptionOperation.m", 1152, @"Invalid parameter not satisfying: %@", @"ciphertext2" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }

  [MEMORY[0x1896077D8] currentHandler];
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v17 handleFailureInMethod:a2, self, @"SFEncryptionOperation.m", 1153, @"Invalid parameter not satisfying: %@", @"key2" object file lineNumber description];

LABEL_3:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    id v12 = v9;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      id v13 = v11;
      uint64_t v21 = 0LL;
      uint64_t v22 = &v21;
      uint64_t v23 = 0x3032000000LL;
      uint64_t v24 = __Block_byref_object_copy__0;
      v25 = __Block_byref_object_dispose__0;
      id v26 = 0LL;
      v18[0] = MEMORY[0x1895F87A8];
      v18[1] = 3221225472LL;
      v18[2] = __41___SFIESOperation_decrypt_withKey_error___block_invoke;
      v18[3] = &unk_18A054408;
      id v20 = &v21;
      v18[4] = self;
      id v19 = v12;
      [v13 performWithCCKey:v18];
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (a5) {
        *a5 = (id) v22[5];
      }

      _Block_object_dispose(&v21, 8);
    }

    else if (a5)
    {
      [MEMORY[0x189607870] errorWithDomain:@"SFCryptoServicesErrorDomain" code:9 userInfo:0];
      v14 = 0LL;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      v14 = 0LL;
    }
  }

  else if (a5)
  {
    [MEMORY[0x189607870] errorWithDomain:@"SFCryptoServicesErrorDomain" code:9 userInfo:0];
    v14 = 0LL;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v14 = 0LL;
  }

  return v14;
}

- (_SFKeySpecifier)encryptionKeySpecifier
{
  return 0LL;
}

- (_SFECDHOperation)diffieHellmanOperation
{
  return (_SFECDHOperation *)(id)[*((id *)self->_iesOperationInternal + 2) copy];
}

- (void)setDiffieHellmanOperation:(id)a3
{
  uint64_t v4 = [a3 copy];
  id iesOperationInternal = self->_iesOperationInternal;
  v6 = (void *)iesOperationInternal[2];
  iesOperationInternal[2] = v4;
}

- (_SFAuthenticatedEncryptionOperation)encryptionOperation
{
  return (_SFAuthenticatedEncryptionOperation *)(id)[*((id *)self->_iesOperationInternal + 3) copy];
}

- (void)setEncryptionOperation:(id)a3
{
  uint64_t v4 = [a3 copy];
  id iesOperationInternal = self->_iesOperationInternal;
  v6 = (void *)iesOperationInternal[3];
  iesOperationInternal[3] = v4;
}

- (SFDigestOperation)digestOperation
{
  return (SFDigestOperation *)(id)[*((id *)self->_iesOperationInternal + 4) copyWithZone:0];
}

- (void)setDigestOperation:(id)a3
{
  uint64_t v4 = [a3 copyWithZone:0];
  id iesOperationInternal = self->_iesOperationInternal;
  v6 = (void *)iesOperationInternal[4];
  iesOperationInternal[4] = v4;
}

- (int64_t)curve
{
  return self->_curve;
}

- (void)setCurve:(int64_t)a3
{
  self->_curve = a3;
}

- (void).cxx_destruct
{
}

@end