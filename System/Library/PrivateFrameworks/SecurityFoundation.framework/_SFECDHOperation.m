@interface _SFECDHOperation
+ (BOOL)supportsSecureCoding;
+ (id)_defaultOperation;
+ (int64_t)_defaultMode;
+ (int64_t)keySource;
- (_SFECDHOperation)init;
- (_SFECDHOperation)initWithCoder:(id)a3;
- (_SFECDHOperation)initWithMode:(int64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)deriveKeyWithSpecifier:(id)a3 fromKeySource:(id)a4 error:(id *)a5;
- (int64_t)mode;
- (void)setMode:(int64_t)a3;
@end

@implementation _SFECDHOperation

+ (int64_t)keySource
{
  return 1LL;
}

+ (int64_t)_defaultMode
{
  return 0LL;
}

+ (id)_defaultOperation
{
  return (id)objc_msgSend( objc_alloc((Class)a1),  "initWithMode:",  objc_msgSend(a1, "_defaultMode"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_SFECDHOperation)init
{
  return -[_SFECDHOperation initWithMode:](self, "initWithMode:", [(id)objc_opt_class() _defaultMode]);
}

- (_SFECDHOperation)initWithMode:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS____SFECDHOperation;
  v4 = -[_SFECDHOperation init](&v8, sel_init);
  if (v4)
  {
    v5 = objc_alloc_init(&OBJC_CLASS___SFECDHOperation_Ivars);
    id ecdhOperationInternal = v4->_ecdhOperationInternal;
    v4->_id ecdhOperationInternal = v5;

    *((void *)v4->_ecdhOperationInternal + 1) = a3;
  }

  return v4;
}

- (_SFECDHOperation)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS____SFECDHOperation;
  return -[_SFECDHOperation init](&v4, sel_init, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)[objc_alloc((Class)objc_opt_class()) initWithMode:*((void *)self->_ecdhOperationInternal + 1)];
}

- (id)deriveKeyWithSpecifier:(id)a3 fromKeySource:(id)a4 error:(id *)a5
{
  v25[1] = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    id v10 = v9;
    unint64_t v11 = [v8 keyLengthInBytes];
    if (*((void *)self->_ecdhOperationInternal + 1)) {
      v12 = (const __CFString **)MEMORY[0x18960BC08];
    }
    else {
      v12 = (const __CFString **)MEMORY[0x18960BC10];
    }
    v13 = *v12;
    uint64_t v24 = *MEMORY[0x18960BD78];
    [MEMORY[0x189607968] numberWithUnsignedInteger:v11];
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v14;
    [MEMORY[0x189603F68] dictionaryWithObjects:v25 forKeys:&v24 count:1];
    v15 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

    [v10 localKeyPair];
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (__SecKey *)[v16 _secKey];
    [v10 remotePublicKey];
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    CFDataRef v19 = SecKeyCopyKeyExchangeResult(v17, v13, (SecKeyRef)[v18 _secKey], v15, (CFErrorRef *)a5);

    if (-[__CFData length](v19, "length") >= v11)
    {
      id v21 = objc_alloc((Class)[(id)objc_opt_class() keyClass]);
      v22 = -[__CFData subdataWithRange:](v19, "subdataWithRange:", 0LL, v11);
      v20 = (void *)[v21 initWithData:v22 specifier:v8 error:a5];
    }

    else
    {
      v20 = 0LL;
    }
  }

  else if (a5)
  {
    [MEMORY[0x189607870] errorWithDomain:@"SFCryptoServicesErrorDomain" code:4 userInfo:0];
    v20 = 0LL;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v20 = 0LL;
  }

  return v20;
}

- (int64_t)mode
{
  return *((void *)self->_ecdhOperationInternal + 1);
}

- (void)setMode:(int64_t)a3
{
  *((void *)self->_ecdhOperationInternal + 1) = a3;
}

- (void).cxx_destruct
{
}

@end