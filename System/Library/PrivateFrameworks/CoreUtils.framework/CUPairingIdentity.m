@interface CUPairingIdentity
+ (BOOL)supportsSecureCoding;
- (BOOL)signDataPtr:(const void *)a3 dataLen:(unint64_t)a4 signatureBytes:(unsigned __int8)a5[64] error:(id *)a6;
- (BOOL)verifySignature:(id)a3 data:(id)a4 error:(id *)a5;
- (BOOL)verifySignaturePtr:(const void *)a3 signatureLen:(unint64_t)a4 dataPtr:(const void *)a5 dataLen:(unint64_t)a6 error:(id *)a7;
- (CUPairingIdentity)initWithCoder:(id)a3;
- (NSData)altIRK;
- (NSData)publicKey;
- (NSData)secretKey;
- (NSUUID)identifier;
- (id)description;
- (id)signData:(id)a3 error:(id *)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setAltIRK:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setPublicKey:(id)a3;
- (void)setRandomKeyPair;
- (void)setSecretKey:(id)a3;
@end

@implementation CUPairingIdentity

- (CUPairingIdentity)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___CUPairingIdentity;
  v5 = -[CUPairingIdentity init](&v16, sel_init);
  if (v5)
  {
    id v6 = v4;
    uint64_t v7 = objc_opt_class();
    NSDecodeObjectIfPresent(v6, @"altIRK", v7, (void **)&v5->_altIRK);

    id v8 = v6;
    uint64_t v9 = objc_opt_class();
    NSDecodeObjectIfPresent(v8, @"ident", v9, (void **)&v5->_identifier);

    id v10 = v8;
    uint64_t v11 = objc_opt_class();
    NSDecodeObjectIfPresent(v10, @"pk", v11, (void **)&v5->_publicKey);

    id v12 = v10;
    uint64_t v13 = objc_opt_class();
    NSDecodeObjectIfPresent(v12, @"sk", v13, (void **)&v5->_secretKey);

    v14 = v5;
  }

  return v5;
}

- (void)setRandomKeyPair
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  cced25519_make_key_pair_compat();
  v3 = (NSData *)[objc_alloc(MEMORY[0x189603F48]) initWithBytes:v8 length:32];
  publicKey = self->_publicKey;
  self->_publicKey = v3;

  v5 = (NSData *)[objc_alloc(MEMORY[0x189603F48]) initWithBytes:v7 length:32];
  secretKey = self->_secretKey;
  self->_secretKey = v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  altIRK = self->_altIRK;
  id v9 = v4;
  if (altIRK)
  {
    [v4 encodeObject:altIRK forKey:@"altIRK"];
    id v4 = v9;
  }

  identifier = self->_identifier;
  if (identifier)
  {
    [v9 encodeObject:identifier forKey:@"ident"];
    id v4 = v9;
  }

  publicKey = self->_publicKey;
  if (publicKey)
  {
    [v9 encodeObject:publicKey forKey:@"pk"];
    id v4 = v9;
  }

  secretKey = self->_secretKey;
  if (secretKey)
  {
    [v9 encodeObject:secretKey forKey:@"sk"];
    id v4 = v9;
  }
}

- (id)description
{
  CFMutableStringRef v15 = 0LL;
  NSAppendPrintF(&v15);
  v3 = v15;
  id v4 = v3;
  if (self->_identifier)
  {
    CFMutableStringRef v14 = v3;
    NSAppendPrintF(&v14);
    v5 = v14;

    id v4 = v5;
  }

  if (self->_publicKey)
  {
    CFMutableStringRef v13 = v4;
    NSAppendPrintF(&v13);
    id v6 = v13;

    id v4 = v6;
  }

  secretKey = self->_secretKey;
  if (secretKey)
  {
    CFMutableStringRef v12 = v4;
    -[NSData length](secretKey, "length");
    NSAppendPrintF(&v12);
    id v8 = v12;

    id v4 = v8;
  }

  if (self->_altIRK)
  {
    CFMutableStringRef v11 = v4;
    NSAppendPrintF(&v11);
    id v9 = v11;

    id v4 = v9;
  }

  return v4;
}

- (id)signData:(id)a3 error:(id *)a4
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  uint64_t v7 = [v6 bytes];
  uint64_t v8 = [v6 length];

  if (-[CUPairingIdentity signDataPtr:dataLen:signatureBytes:error:]( self,  "signDataPtr:dataLen:signatureBytes:error:",  v7,  v8,  v10,  a4))
  {
    return (id)[objc_alloc(MEMORY[0x189603F48]) initWithBytes:v10 length:64];
  }

  else
  {
    return 0LL;
  }

- (BOOL)signDataPtr:(const void *)a3 dataLen:(unint64_t)a4 signatureBytes:(unsigned __int8)a5[64] error:(id *)a6
{
  uint64_t v8 = self->_publicKey;
  if (-[NSData length](v8, "length") == 32)
  {
    id v9 = self->_secretKey;
    uint64_t v10 = -[NSData length](v9, "length");
    BOOL v11 = v10 == 32;
    if (v10 == 32)
    {
      -[NSData bytes](v8, "bytes");
      -[NSData bytes](v9, "bytes");
      ccsha512_di();
      cced25519_sign();
    }

    else if (a6)
    {
      NSErrorF_safe((void *)*MEMORY[0x189607670], (const char *)0xFFFEEA0ELL);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  else if (a6)
  {
    NSErrorF_safe((void *)*MEMORY[0x189607670], (const char *)0xFFFEEA0DLL);
    BOOL v11 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)verifySignature:(id)a3 data:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = v8;
  uint64_t v11 = [v10 bytes];
  uint64_t v12 = [v10 length];

  id v13 = v9;
  uint64_t v14 = [v13 bytes];
  uint64_t v15 = [v13 length];

  return -[CUPairingIdentity verifySignaturePtr:signatureLen:dataPtr:dataLen:error:]( self,  "verifySignaturePtr:signatureLen:dataPtr:dataLen:error:",  v11,  v12,  v14,  v15,  a5);
}

- (BOOL)verifySignaturePtr:(const void *)a3 signatureLen:(unint64_t)a4 dataPtr:(const void *)a5 dataLen:(unint64_t)a6 error:(id *)a7
{
  if (a4 == 64)
  {
    id v8 = self->_publicKey;
    if (-[NSData length](v8, "length") == 32)
    {
      -[NSData bytes](v8, "bytes");
      ccsha512_di();
      int v9 = cced25519_verify();
      BOOL v10 = v9 == 0;
      if (!a7 || !v9) {
        goto LABEL_13;
      }
      uint64_t v11 = (void *)*MEMORY[0x189607670];
      uint64_t v12 = 4294960542LL;
    }

    else
    {
      if (!a7)
      {
        BOOL v10 = 0;
        goto LABEL_13;
      }

      uint64_t v11 = (void *)*MEMORY[0x189607670];
      uint64_t v12 = 4294896141LL;
    }

    NSErrorF_safe(v11, (const char *)v12);
    BOOL v10 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:

    return v10;
  }

  if (!a7) {
    return 0;
  }
  NSErrorF_safe((void *)*MEMORY[0x189607670], (const char *)0xFFFFE5C4LL);
  BOOL v10 = 0;
  *a7 = (id)objc_claimAutoreleasedReturnValue();
  return v10;
}

- (NSData)altIRK
{
  return self->_altIRK;
}

- (void)setAltIRK:(id)a3
{
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSData)publicKey
{
  return self->_publicKey;
}

- (void)setPublicKey:(id)a3
{
}

- (NSData)secretKey
{
  return self->_secretKey;
}

- (void)setSecretKey:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end