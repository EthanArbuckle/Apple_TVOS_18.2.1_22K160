@interface _SFEC_X962SigningOperation
+ (BOOL)supportsSecureCoding;
- (SFDigestOperation)digestOperation;
- (_SFECKeySpecifier)signingKeySpecifier;
- (_SFEC_X962SigningOperation)init;
- (_SFEC_X962SigningOperation)initWithCoder:(id)a3;
- (_SFEC_X962SigningOperation)initWithKeySpecifier:(id)a3;
- (_SFEC_X962SigningOperation)initWithKeySpecifier:(id)a3 digestOperation:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)sign:(id)a3 withKey:(id)a4 error:(id *)a5;
- (id)verify:(id)a3 withKey:(id)a4 error:(id *)a5;
- (void)setDigestOperation:(id)a3;
- (void)setSigningKeySpecifier:(id)a3;
@end

@implementation _SFEC_X962SigningOperation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_SFEC_X962SigningOperation)init
{
  v3 = -[_SFECKeySpecifier initWithCurve:](objc_alloc(&OBJC_CLASS____SFECKeySpecifier), "initWithCurve:", 2LL);
  v4 = -[_SFEC_X962SigningOperation initWithKeySpecifier:](self, "initWithKeySpecifier:", v3);

  return v4;
}

- (_SFEC_X962SigningOperation)initWithKeySpecifier:(id)a3
{
  id v4 = a3;
  _defaultDigestOperation();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[_SFEC_X962SigningOperation initWithKeySpecifier:digestOperation:]( self,  "initWithKeySpecifier:digestOperation:",  v4,  v5);

  return v6;
}

- (_SFEC_X962SigningOperation)initWithKeySpecifier:(id)a3 digestOperation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS____SFEC_X962SigningOperation;
  v8 = -[_SFEC_X962SigningOperation init](&v18, sel_init);
  if (v8)
  {
    v9 = objc_alloc_init(&OBJC_CLASS___SFEC_X962SigningOperation_Ivars);
    id x962SigningOperationInternal = v8->_x962SigningOperationInternal;
    v8->_id x962SigningOperationInternal = v9;

    uint64_t v11 = [v6 copy];
    v12 = v8->_x962SigningOperationInternal;
    v13 = (void *)v12[1];
    v12[1] = v11;

    uint64_t v14 = [v7 copyWithZone:0];
    v15 = v8->_x962SigningOperationInternal;
    v16 = (void *)v15[2];
    v15[2] = v14;
  }

  return v8;
}

- (_SFEC_X962SigningOperation)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS____SFEC_X962SigningOperation;
  return -[_SFEC_X962SigningOperation init](&v4, sel_init, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)[objc_alloc((Class)objc_opt_class()) initWithKeySpecifier:*((void *)self->_x962SigningOperationInternal + 1)];
}

- (id)sign:(id)a3 withKey:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    CFErrorRef error = 0LL;
    v10 = (__SecKey *)[v9 _secKey];
    uint64_t v11 = (const __CFString *)[*((id *)self->_x962SigningOperationInternal + 2) _secKeyECDSAAlgorithm];
    v12 = (const __CFData *)[(id)objc_opt_class() digest:v8];
    CFDataRef v13 = SecKeyCreateSignature(v10, v11, v12, &error);
    uint64_t v14 = error;
    if (error)
    {
      if (!a5)
      {
        CFRelease(error);
        v15 = 0LL;
        CFErrorRef error = 0LL;
        goto LABEL_11;
      }
    }

    else
    {
      if (v13)
      {
        v15 = -[_SFSignedData initWithData:signature:]( objc_alloc(&OBJC_CLASS____SFSignedData),  "initWithData:signature:",  v8,  v13);
        goto LABEL_11;
      }

      if (!a5)
      {
        v15 = 0LL;
        goto LABEL_11;
      }

      [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607670] code:-67688 userInfo:0];
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    }

    v15 = 0LL;
    *a5 = v14;
LABEL_11:

    goto LABEL_12;
  }

  if (a5)
  {
    [MEMORY[0x189607870] errorWithDomain:@"SFCryptoServicesErrorDomain" code:9 userInfo:0];
    v15 = 0LL;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v15 = 0LL;
  }

- (id)verify:(id)a3 withKey:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    CFErrorRef error = 0LL;
    v10 = (__SecKey *)[v9 _secKey];
    uint64_t v11 = (const __CFString *)[*((id *)self->_x962SigningOperationInternal + 2) _secKeyECDSAAlgorithm];
    v12 = (void *)objc_opt_class();
    [v8 data];
    CFDataRef v13 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = (const __CFData *)[v12 digest:v13];
    [v8 signature];
    v15 = (const __CFData *)objc_claimAutoreleasedReturnValue();
    LODWORD(v14) = SecKeyVerifySignature(v10, v11, v14, v15, &error);

    v16 = error;
    if ((_DWORD)v14) {
      BOOL v17 = error == 0LL;
    }
    else {
      BOOL v17 = 0;
    }
    if (v17)
    {
      [v8 data];
      objc_super v18 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }

    if (!a5)
    {
      CFRelease(error);
LABEL_11:
      objc_super v18 = 0LL;
      goto LABEL_13;
    }
  }

  else
  {
    if (!a5) {
      goto LABEL_11;
    }
    [MEMORY[0x189607870] errorWithDomain:@"SFCryptoServicesErrorDomain" code:9 userInfo:0];
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_super v18 = 0LL;
  *a5 = v16;
LABEL_13:

  return v18;
}

- (_SFECKeySpecifier)signingKeySpecifier
{
  return (_SFECKeySpecifier *)(id)[*((id *)self->_x962SigningOperationInternal + 1) copy];
}

- (void)setSigningKeySpecifier:(id)a3
{
  uint64_t v4 = [a3 copy];
  id x962SigningOperationInternal = self->_x962SigningOperationInternal;
  id v6 = (void *)x962SigningOperationInternal[1];
  x962SigningOperationInternal[1] = v4;
}

- (SFDigestOperation)digestOperation
{
  return (SFDigestOperation *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setDigestOperation:(id)a3
{
}

- (void).cxx_destruct
{
}

@end