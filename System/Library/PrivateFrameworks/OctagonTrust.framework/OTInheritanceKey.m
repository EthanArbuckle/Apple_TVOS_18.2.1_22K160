@interface OTInheritanceKey
+ (BOOL)supportsSecureCoding;
+ (id)base32:(const char *)a3 len:(unint64_t)a4;
+ (id)parseBase32:(id)a3 checksumSize:(unint64_t)a4 error:(id *)a5;
+ (id)printableWithData:(id)a3 checksumSize:(unint64_t)a4 error:(id *)a5;
+ (id)unbase32:(const char *)a3 len:(unint64_t)a4;
- (BOOL)generateWrappingWithError:(id *)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToOTInheritanceKey:(id)a3;
- (BOOL)isKeyEquals:(id)a3;
- (BOOL)isRecoveryKeyEqual:(id)a3;
- (BOOL)unwrapWithError:(id *)a3;
- (BOOL)wrapWithWrappingKey:(id)a3 error:(id *)a4;
- (NSData)claimTokenData;
- (NSData)recoveryKeyData;
- (NSData)wrappedKeyData;
- (NSData)wrappingKeyData;
- (NSString)claimTokenString;
- (NSString)wrappedKeyString;
- (NSString)wrappingKeyString;
- (NSUUID)uuid;
- (OTInheritanceKey)initWithCoder:(id)a3;
- (OTInheritanceKey)initWithUUID:(id)a3 claimTokenData:(id)a4 wrappingKeyData:(id)a5 error:(id *)a6;
- (OTInheritanceKey)initWithUUID:(id)a3 error:(id *)a4;
- (OTInheritanceKey)initWithUUID:(id)a3 oldIK:(id)a4 error:(id *)a5;
- (OTInheritanceKey)initWithWrappedKeyData:(id)a3 wrappingKeyData:(id)a4 claimTokenData:(id)a5 uuid:(id)a6 error:(id *)a7;
- (OTInheritanceKey)initWithWrappedKeyData:(id)a3 wrappingKeyData:(id)a4 uuid:(id)a5 error:(id *)a6;
- (OTInheritanceKey)initWithWrappedKeyData:(id)a3 wrappingKeyString:(id)a4 uuid:(id)a5 error:(id *)a6;
- (OTInheritanceKey)initWithWrappedKeyString:(id)a3 wrappingKeyData:(id)a4 uuid:(id)a5 error:(id *)a6;
- (id)dictionary;
- (void)encodeWithCoder:(id)a3;
@end

@implementation OTInheritanceKey

- (BOOL)generateWrappingWithError:(id *)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void (**)(uint64_t, uint64_t, uint64_t))ccrng();
  uint64_t v7 = ccrng();
  uint64_t v8 = [v5 length];
  id v9 = v5;
  v6(v7, v8, [v9 mutableBytes]);
  LOBYTE(a3) = -[OTInheritanceKey wrapWithWrappingKey:error:](self, "wrapWithWrappingKey:error:", v9, a3);

  return (char)a3;
}

- (BOOL)wrapWithWrappingKey:(id)a3 error:(id *)a4
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  -[NSData length](self->_recoveryKeyData, "length");
  uint64_t v7 = ccwrap_wrapped_size();
  objc_msgSend(MEMORY[0x189603FB8], "dataWithLength:", v7, v7, v27);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v9 = *(void *)ccaes_ecb_encrypt_mode() + 15LL;
  unint64_t v10 = v9 & 0xFFFFFFFFFFFFFFF0LL;
  if (v9 >= 0x10)
  {
    v11 = (uint64_t *)((char *)&v26 - (v9 & 0xFFFFFFFFFFFFFFF0LL));
    do
    {
      void *v11 = 0xAAAAAAAAAAAAAAAALL;
      v11[1] = 0xAAAAAAAAAAAAAAAALL;
      v11 += 2;
      v10 -= 16LL;
    }

    while (v10);
  }

  [v6 length];
  id v12 = v6;
  [v12 bytes];
  uint64_t v13 = ccecb_init();
  if ((_DWORD)v13)
  {
    if (a4)
    {
      v14 = (void *)MEMORY[0x189607870];
      objc_msgSend(NSString, "stringWithFormat:", @"ccecb_init failed: %d", v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v14;
      uint64_t v17 = 9LL;
LABEL_10:
      [v16 errorWithDomain:@"com.apple.security.OctagonTrust.OTInheritanceKey" code:v17 description:v15];
      *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_11:
      LOBYTE(a4) = 0;
    }
  }

  else
  {
    -[NSData length](self->_recoveryKeyData, "length");
    -[NSData bytes](self->_recoveryKeyData, "bytes");
    id v18 = v8;
    [v18 mutableBytes];
    uint64_t v19 = ccwrap_auth_encrypt();
    cc_clear();
    if (!(_DWORD)v19)
    {
      objc_storeStrong((id *)&self->_wrappingKeyData, v12);
      +[OTInheritanceKey printableWithData:checksumSize:error:]( &OBJC_CLASS___OTInheritanceKey,  "printableWithData:checksumSize:error:",  self->_wrappingKeyData,  3LL,  a4);
      v22 = (NSString *)objc_claimAutoreleasedReturnValue();
      wrappingKeyString = self->_wrappingKeyString;
      self->_wrappingKeyString = v22;

      if (self->_wrappingKeyString)
      {
        objc_storeStrong((id *)&self->_wrappedKeyData, v18);
        +[OTInheritanceKey printableWithData:checksumSize:error:]( &OBJC_CLASS___OTInheritanceKey,  "printableWithData:checksumSize:error:",  self->_wrappedKeyData,  3LL,  a4);
        v24 = (NSString *)objc_claimAutoreleasedReturnValue();
        wrappedKeyString = self->_wrappedKeyString;
        self->_wrappedKeyString = v24;

        LOBYTE(a4) = self->_wrappedKeyString != 0LL;
        goto LABEL_12;
      }

      goto LABEL_11;
    }

    if (a4)
    {
      v20 = (void *)MEMORY[0x189607870];
      objc_msgSend(NSString, "stringWithFormat:", @"ccwrap_auth_encrypt: %d", v19);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v20;
      uint64_t v17 = 4LL;
      goto LABEL_10;
    }
  }

- (OTInheritanceKey)initWithUUID:(id)a3 error:(id *)a4
{
  bytes[2] = *MEMORY[0x1895F89C0];
  id v7 = a3;
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___OTInheritanceKey;
  uint64_t v8 = -[OTInheritanceKey init](&v28, sel_init);
  unint64_t v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_uuid, a3);
    bytes[0] = 0xAAAAAAAAAAAAAAAALL;
    bytes[1] = 0xAAAAAAAAAAAAAAAALL;
    unint64_t v10 = (const __SecRandom *)*MEMORY[0x18960BE08];
    uint64_t v11 = SecRandomCopyBytes((SecRandomRef)*MEMORY[0x18960BE08], 0x10uLL, bytes);
    if ((_DWORD)v11)
    {
      uint64_t v12 = v11;
      memset_s(bytes, 0x10uLL, 0, 0x10uLL);
      if (a4)
      {
        uint64_t v13 = (void *)MEMORY[0x189607870];
        objc_msgSend(NSString, "stringWithFormat:", @"SecRandomCopyBytes: %d", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        [v13 errorWithDomain:@"com.apple.security.OctagonTrust.OTInheritanceKey" code:7 description:v14];
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }

      goto LABEL_11;
    }

    uint64_t v15 = [MEMORY[0x189603F48] dataWithBytes:bytes length:16];
    claimTokenData = v9->_claimTokenData;
    v9->_claimTokenData = (NSData *)v15;

    memset_s(bytes, 0x10uLL, 0, 0x10uLL);
    uint64_t v17 = +[OTInheritanceKey printableWithData:checksumSize:error:]( &OBJC_CLASS___OTInheritanceKey,  "printableWithData:checksumSize:error:",  v9->_claimTokenData,  4LL,  a4);
    claimTokenString = v9->_claimTokenString;
    v9->_claimTokenString = (NSString *)v17;

    if (!v9->_claimTokenString) {
      goto LABEL_11;
    }
    *(void *)&__int128 v19 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v19 + 1) = 0xAAAAAAAAAAAAAAAALL;
    __s[2] = v19;
    __s[3] = v19;
    __s[0] = v19;
    __s[1] = v19;
    uint64_t v20 = SecRandomCopyBytes(v10, 0x40uLL, __s);
    if ((_DWORD)v20)
    {
      uint64_t v21 = v20;
      memset_s(__s, 0x40uLL, 0, 0x40uLL);
      if (a4)
      {
        v22 = (void *)MEMORY[0x189607870];
        objc_msgSend(NSString, "stringWithFormat:", @"SecRandomCopyBytes: %d", v21);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        [v22 errorWithDomain:@"com.apple.security.OctagonTrust.OTInheritanceKey" code:7 description:v23];
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }

      goto LABEL_11;
    }

    uint64_t v24 = [MEMORY[0x189603F48] dataWithBytes:__s length:64];
    recoveryKeyData = v9->_recoveryKeyData;
    v9->_recoveryKeyData = (NSData *)v24;

    memset_s(__s, 0x40uLL, 0, 0x40uLL);
    if (!-[OTInheritanceKey generateWrappingWithError:](v9, "generateWrappingWithError:", a4))
    {
LABEL_11:
      uint64_t v26 = 0LL;
      goto LABEL_12;
    }
  }

  uint64_t v26 = v9;
LABEL_12:

  return v26;
}

- (BOOL)unwrapWithError:(id *)a3
{
  v26[1] = *MEMORY[0x1895F89C0];
  if (-[NSData length](self->_wrappingKeyData, "length") == 32)
  {
    if (-[NSData length](self->_wrappedKeyData, "length") == 72)
    {
      -[NSData length](self->_wrappedKeyData, "length");
      uint64_t v5 = ccwrap_unwrapped_size();
      objc_msgSend(MEMORY[0x189603FB8], "dataWithLength:", v5, v5);
      id v6 = (void *)objc_claimAutoreleasedReturnValue();
      unint64_t v7 = *(void *)ccaes_ecb_decrypt_mode() + 15LL;
      unint64_t v8 = v7 & 0xFFFFFFFFFFFFFFF0LL;
      if (v7 >= 0x10)
      {
        unint64_t v9 = (void *)((char *)v26 - (v7 & 0xFFFFFFFFFFFFFFF0LL));
        do
        {
          *unint64_t v9 = 0xAAAAAAAAAAAAAAAALL;
          v9[1] = 0xAAAAAAAAAAAAAAAALL;
          v9 += 2;
          v8 -= 16LL;
        }

        while (v8);
      }

      -[NSData length](self->_wrappingKeyData, "length");
      -[NSData bytes](self->_wrappingKeyData, "bytes");
      uint64_t v10 = ccecb_init();
      if ((_DWORD)v10)
      {
        if (a3)
        {
          uint64_t v11 = (void *)MEMORY[0x189607870];
          objc_msgSend(NSString, "stringWithFormat:", @"ccecb_init failed: %d", v10);
          recoveryKeyData = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v13 = v11;
          uint64_t v14 = 9LL;
LABEL_18:
          [v13 errorWithDomain:@"com.apple.security.OctagonTrust.OTInheritanceKey" code:v14 description:recoveryKeyData];
          BOOL v20 = 0;
          *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_21:

          goto LABEL_22;
        }
      }

      else
      {
        -[NSData length](self->_wrappedKeyData, "length");
        -[NSData bytes](self->_wrappedKeyData, "bytes");
        id v21 = v6;
        [v21 mutableBytes];
        uint64_t v22 = ccwrap_auth_decrypt();
        cc_clear();
        if (!(_DWORD)v22)
        {
          uint64_t v24 = (NSData *)v21;
          recoveryKeyData = self->_recoveryKeyData;
          self->_recoveryKeyData = v24;
          BOOL v20 = 1;
          goto LABEL_21;
        }

        if (a3)
        {
          v23 = (void *)MEMORY[0x189607870];
          objc_msgSend(NSString, "stringWithFormat:", @"ccwrap_auth_decrypt: %d", v22);
          recoveryKeyData = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v13 = v23;
          uint64_t v14 = 5LL;
          goto LABEL_18;
        }
      }

      BOOL v20 = 0;
LABEL_22:

      return v20;
    }

    if (a3)
    {
      __int128 v19 = (void *)MEMORY[0x189607870];
      objc_msgSend( NSString,  "stringWithFormat:",  @"wrong wrapped key length: %u",  -[NSData length](self->_wrappedKeyData, "length"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v17 = v19;
      uint64_t v18 = 10LL;
      goto LABEL_13;
    }
  }

  else if (a3)
  {
    uint64_t v15 = (void *)MEMORY[0x189607870];
    objc_msgSend( NSString,  "stringWithFormat:",  @"wrong wrapping key length: %u",  -[NSData length](self->_wrappingKeyData, "length"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v17 = v15;
    uint64_t v18 = 8LL;
LABEL_13:
    [v17 errorWithDomain:@"com.apple.security.OctagonTrust.OTInheritanceKey" code:v18 description:v16];
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return 0;
}

- (OTInheritanceKey)initWithWrappedKeyData:(id)a3 wrappingKeyData:(id)a4 claimTokenData:(id)a5 uuid:(id)a6 error:(id *)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___OTInheritanceKey;
  uint64_t v17 = -[OTInheritanceKey init](&v28, sel_init);
  uint64_t v18 = v17;
  if (!v17) {
    goto LABEL_9;
  }
  objc_storeStrong((id *)&v17->_uuid, a6);
  objc_storeStrong((id *)&v18->_wrappedKeyData, a3);
  objc_storeStrong((id *)&v18->_wrappingKeyData, a4);
  if (!-[OTInheritanceKey unwrapWithError:](v18, "unwrapWithError:", a7)) {
    goto LABEL_7;
  }
  uint64_t v19 = +[OTInheritanceKey printableWithData:checksumSize:error:]( &OBJC_CLASS___OTInheritanceKey,  "printableWithData:checksumSize:error:",  v18->_wrappingKeyData,  3LL,  a7);
  wrappingKeyString = v18->_wrappingKeyString;
  v18->_wrappingKeyString = (NSString *)v19;

  if (!v18->_wrappingKeyString) {
    goto LABEL_7;
  }
  uint64_t v21 = +[OTInheritanceKey printableWithData:checksumSize:error:]( &OBJC_CLASS___OTInheritanceKey,  "printableWithData:checksumSize:error:",  v18->_wrappedKeyData,  3LL,  a7);
  wrappedKeyString = v18->_wrappedKeyString;
  v18->_wrappedKeyString = (NSString *)v21;

  if (!v18->_wrappedKeyString) {
    goto LABEL_7;
  }
  objc_storeStrong((id *)&v18->_claimTokenData, a5);
  if (!v15)
  {
    claimTokenString = v18->_claimTokenString;
    v18->_claimTokenString = 0LL;

    goto LABEL_9;
  }

  uint64_t v23 = +[OTInheritanceKey printableWithData:checksumSize:error:]( &OBJC_CLASS___OTInheritanceKey,  "printableWithData:checksumSize:error:",  v18->_claimTokenData,  4LL,  a7);
  uint64_t v24 = v18->_claimTokenString;
  v18->_claimTokenString = (NSString *)v23;

  if (v18->_claimTokenString)
  {
LABEL_9:
    v25 = v18;
    goto LABEL_10;
  }

- (OTInheritanceKey)initWithWrappedKeyData:(id)a3 wrappingKeyData:(id)a4 uuid:(id)a5 error:(id *)a6
{
  return -[OTInheritanceKey initWithWrappedKeyData:wrappingKeyData:claimTokenData:uuid:error:]( self,  "initWithWrappedKeyData:wrappingKeyData:claimTokenData:uuid:error:",  a3,  a4,  0LL,  a5,  a6);
}

- (OTInheritanceKey)initWithWrappedKeyData:(id)a3 wrappingKeyString:(id)a4 uuid:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  +[OTInheritanceKey parseBase32:checksumSize:error:]( &OBJC_CLASS___OTInheritanceKey,  "parseBase32:checksumSize:error:",  a4,  3LL,  a6);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    self =  -[OTInheritanceKey initWithWrappedKeyData:wrappingKeyData:uuid:error:]( self,  "initWithWrappedKeyData:wrappingKeyData:uuid:error:",  v10,  v12,  v11,  a6);
    id v13 = self;
  }

  else
  {
    id v13 = 0LL;
  }

  return v13;
}

- (OTInheritanceKey)initWithWrappedKeyString:(id)a3 wrappingKeyData:(id)a4 uuid:(id)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = a5;
  +[OTInheritanceKey parseBase32:checksumSize:error:]( &OBJC_CLASS___OTInheritanceKey,  "parseBase32:checksumSize:error:",  a3,  3LL,  a6);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    self =  -[OTInheritanceKey initWithWrappedKeyData:wrappingKeyData:uuid:error:]( self,  "initWithWrappedKeyData:wrappingKeyData:uuid:error:",  v12,  v10,  v11,  a6);
    id v13 = self;
  }

  else
  {
    id v13 = 0LL;
  }

  return v13;
}

- (OTInheritanceKey)initWithUUID:(id)a3 oldIK:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  v30.receiver = self;
  v30.super_class = (Class)&OBJC_CLASS___OTInheritanceKey;
  id v11 = -[OTInheritanceKey init](&v30, sel_init);
  if (!v11) {
    goto LABEL_6;
  }
  [v10 uuid];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  int v13 = [v9 isEqual:v12];

  if (!v13)
  {
    objc_storeStrong((id *)&v11->_uuid, a3);
    uint64_t v15 = [v10 wrappingKeyData];
    wrappingKeyData = v11->_wrappingKeyData;
    v11->_wrappingKeyData = (NSData *)v15;

    uint64_t v17 = [v10 wrappingKeyString];
    wrappingKeyString = v11->_wrappingKeyString;
    v11->_wrappingKeyString = (NSString *)v17;

    uint64_t v19 = [v10 wrappedKeyData];
    wrappedKeyData = v11->_wrappedKeyData;
    v11->_wrappedKeyData = (NSData *)v19;

    uint64_t v21 = [v10 wrappedKeyString];
    wrappedKeyString = v11->_wrappedKeyString;
    v11->_wrappedKeyString = (NSString *)v21;

    uint64_t v23 = [v10 claimTokenData];
    claimTokenData = v11->_claimTokenData;
    v11->_claimTokenData = (NSData *)v23;

    uint64_t v25 = [v10 claimTokenString];
    claimTokenString = v11->_claimTokenString;
    v11->_claimTokenString = (NSString *)v25;

    uint64_t v27 = [v10 recoveryKeyData];
    recoveryKeyData = v11->_recoveryKeyData;
    v11->_recoveryKeyData = (NSData *)v27;

LABEL_6:
    id v14 = v11;
    goto LABEL_7;
  }

  if (a5)
  {
    [MEMORY[0x189607870] errorWithDomain:@"com.apple.security.OctagonTrust.OTInheritanceKey" code:11 description:@"recreate needs a different UUID"];
    id v14 = 0LL;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v14 = 0LL;
  }

- (OTInheritanceKey)initWithUUID:(id)a3 claimTokenData:(id)a4 wrappingKeyData:(id)a5 error:(id *)a6
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___OTInheritanceKey;
  id v14 = -[OTInheritanceKey init](&v27, sel_init);
  uint64_t v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_uuid, a3);
    objc_storeStrong((id *)&v15->_claimTokenData, a4);
    uint64_t v16 = +[OTInheritanceKey printableWithData:checksumSize:error:]( &OBJC_CLASS___OTInheritanceKey,  "printableWithData:checksumSize:error:",  v15->_claimTokenData,  4LL,  a6);
    claimTokenString = v15->_claimTokenString;
    v15->_claimTokenString = (NSString *)v16;

    if (!v15->_claimTokenString) {
      goto LABEL_8;
    }
    *(void *)&__int128 v18 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v18 + 1) = 0xAAAAAAAAAAAAAAAALL;
    bytes[2] = v18;
    void bytes[3] = v18;
    bytes[0] = v18;
    bytes[1] = v18;
    uint64_t v19 = SecRandomCopyBytes((SecRandomRef)*MEMORY[0x18960BE08], 0x40uLL, bytes);
    if ((_DWORD)v19)
    {
      uint64_t v20 = v19;
      memset_s(bytes, 0x40uLL, 0, 0x40uLL);
      if (a6)
      {
        uint64_t v21 = (void *)MEMORY[0x189607870];
        objc_msgSend(NSString, "stringWithFormat:", @"SecRandomCopyBytes: %d", v20);
        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
        [v21 errorWithDomain:@"com.apple.security.OctagonTrust.OTInheritanceKey" code:7 description:v22];
        *a6 = (id)objc_claimAutoreleasedReturnValue();
      }

      goto LABEL_8;
    }

    uint64_t v23 = [MEMORY[0x189603F48] dataWithBytes:bytes length:64];
    recoveryKeyData = v15->_recoveryKeyData;
    v15->_recoveryKeyData = (NSData *)v23;

    memset_s(bytes, 0x40uLL, 0, 0x40uLL);
    if (!-[OTInheritanceKey wrapWithWrappingKey:error:](v15, "wrapWithWrappingKey:error:", v13, a6))
    {
LABEL_8:
      uint64_t v25 = 0LL;
      goto LABEL_9;
    }
  }

  uint64_t v25 = v15;
LABEL_9:

  return v25;
}

- (BOOL)isEqualToOTInheritanceKey:(id)a3
{
  v4 = (OTInheritanceKey *)a3;
  if (self == v4)
  {
    char v17 = 1;
  }

  else
  {
    -[OTInheritanceKey uuid](self, "uuid");
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTInheritanceKey uuid](v4, "uuid");
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v5 isEqual:v6])
    {
      -[OTInheritanceKey wrappingKeyData](self, "wrappingKeyData");
      unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[OTInheritanceKey wrappingKeyData](v4, "wrappingKeyData");
      unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ([v7 isEqualToData:v8])
      {
        -[OTInheritanceKey wrappingKeyString](self, "wrappingKeyString");
        id v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[OTInheritanceKey wrappingKeyString](v4, "wrappingKeyString");
        id v10 = (void *)objc_claimAutoreleasedReturnValue();
        if ([v9 isEqualToString:v10])
        {
          -[OTInheritanceKey wrappedKeyData](self, "wrappedKeyData");
          id v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[OTInheritanceKey wrappedKeyData](v4, "wrappedKeyData");
          id v12 = (void *)objc_claimAutoreleasedReturnValue();
          if ([v11 isEqualToData:v12])
          {
            uint64_t v25 = v11;
            -[OTInheritanceKey wrappedKeyString](self, "wrappedKeyString");
            id v13 = (void *)objc_claimAutoreleasedReturnValue();
            -[OTInheritanceKey wrappedKeyString](v4, "wrappedKeyString");
            uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_super v27 = v13;
            if (objc_msgSend(v13, "isEqualToString:"))
            {
              -[OTInheritanceKey claimTokenData](self, "claimTokenData");
              id v14 = (void *)objc_claimAutoreleasedReturnValue();
              -[OTInheritanceKey claimTokenData](v4, "claimTokenData");
              uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
              uint64_t v24 = v14;
              if (objc_msgSend(v14, "isEqualToData:"))
              {
                -[OTInheritanceKey claimTokenString](self, "claimTokenString");
                uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
                -[OTInheritanceKey claimTokenString](v4, "claimTokenString");
                uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
                uint64_t v22 = v15;
                int v16 = objc_msgSend(v15, "isEqualToString:");
                id v11 = v25;
                if (v16)
                {
                  -[OTInheritanceKey recoveryKeyData](self, "recoveryKeyData");
                  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
                  -[OTInheritanceKey recoveryKeyData](v4, "recoveryKeyData");
                  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
                  char v17 = [v20 isEqualToData:v19];
                }

                else
                {
                  char v17 = 0;
                }
              }

              else
              {
                char v17 = 0;
                id v11 = v25;
              }
            }

            else
            {
              char v17 = 0;
              id v11 = v25;
            }
          }

          else
          {
            char v17 = 0;
          }
        }

        else
        {
          char v17 = 0;
        }
      }

      else
      {
        char v17 = 0;
      }
    }

    else
    {
      char v17 = 0;
    }
  }

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (OTInheritanceKey *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }

  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[OTInheritanceKey isEqualToOTInheritanceKey:](self, "isEqualToOTInheritanceKey:", v4);
  }

  return v5;
}

- (BOOL)isRecoveryKeyEqual:(id)a3
{
  v4 = (OTInheritanceKey *)a3;
  if (self == v4)
  {
    char v17 = 1;
  }

  else
  {
    -[OTInheritanceKey uuid](self, "uuid");
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTInheritanceKey uuid](v4, "uuid");
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v5 isEqual:v6])
    {
      -[OTInheritanceKey wrappingKeyData](self, "wrappingKeyData");
      unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[OTInheritanceKey wrappingKeyData](v4, "wrappingKeyData");
      unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ([v7 isEqualToData:v8])
      {
        -[OTInheritanceKey wrappingKeyString](self, "wrappingKeyString");
        id v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[OTInheritanceKey wrappingKeyString](v4, "wrappingKeyString");
        id v10 = (void *)objc_claimAutoreleasedReturnValue();
        if ([v9 isEqualToString:v10])
        {
          -[OTInheritanceKey wrappedKeyData](self, "wrappedKeyData");
          id v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[OTInheritanceKey wrappedKeyData](v4, "wrappedKeyData");
          id v12 = (void *)objc_claimAutoreleasedReturnValue();
          if ([v11 isEqualToData:v12])
          {
            uint64_t v21 = v11;
            uint64_t v13 = -[OTInheritanceKey wrappedKeyString](self, "wrappedKeyString");
            uint64_t v14 = -[OTInheritanceKey wrappedKeyString](v4, "wrappedKeyString");
            uint64_t v22 = (void *)v13;
            uint64_t v15 = (void *)v13;
            int v16 = (void *)v14;
            if ([v15 isEqualToString:v14])
            {
              -[OTInheritanceKey recoveryKeyData](self, "recoveryKeyData");
              uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
              -[OTInheritanceKey recoveryKeyData](v4, "recoveryKeyData");
              uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
              char v17 = [v20 isEqualToData:v19];
            }

            else
            {
              char v17 = 0;
            }

            id v11 = v21;
          }

          else
          {
            char v17 = 0;
          }
        }

        else
        {
          char v17 = 0;
        }
      }

      else
      {
        char v17 = 0;
      }
    }

    else
    {
      char v17 = 0;
    }
  }

  return v17;
}

- (BOOL)isKeyEquals:(id)a3
{
  v4 = (OTInheritanceKey *)a3;
  if (self == v4)
  {
    char v16 = 1;
  }

  else
  {
    -[OTInheritanceKey wrappingKeyData](self, "wrappingKeyData");
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTInheritanceKey wrappingKeyData](v4, "wrappingKeyData");
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v5 isEqualToData:v6])
    {
      -[OTInheritanceKey wrappingKeyString](self, "wrappingKeyString");
      unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[OTInheritanceKey wrappingKeyString](v4, "wrappingKeyString");
      unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ([v7 isEqualToString:v8])
      {
        -[OTInheritanceKey wrappedKeyData](self, "wrappedKeyData");
        id v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[OTInheritanceKey wrappedKeyData](v4, "wrappedKeyData");
        id v10 = (void *)objc_claimAutoreleasedReturnValue();
        if ([v9 isEqualToData:v10])
        {
          -[OTInheritanceKey wrappedKeyString](self, "wrappedKeyString");
          id v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[OTInheritanceKey wrappedKeyString](v4, "wrappedKeyString");
          id v12 = (void *)objc_claimAutoreleasedReturnValue();
          if ([v11 isEqualToString:v12])
          {
            uint64_t v23 = v11;
            -[OTInheritanceKey claimTokenData](self, "claimTokenData");
            uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
            -[OTInheritanceKey claimTokenData](v4, "claimTokenData");
            uint64_t v24 = v13;
            uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v13, "isEqualToData:"))
            {
              -[OTInheritanceKey claimTokenString](self, "claimTokenString");
              uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
              -[OTInheritanceKey claimTokenString](v4, "claimTokenString");
              uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
              uint64_t v21 = v14;
              int v15 = objc_msgSend(v14, "isEqualToString:");
              id v11 = v23;
              if (v15)
              {
                -[OTInheritanceKey recoveryKeyData](self, "recoveryKeyData");
                uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
                -[OTInheritanceKey recoveryKeyData](v4, "recoveryKeyData");
                __int128 v18 = (void *)objc_claimAutoreleasedReturnValue();
                char v16 = [v19 isEqualToData:v18];
              }

              else
              {
                char v16 = 0;
              }
            }

            else
            {
              char v16 = 0;
              id v11 = v23;
            }
          }

          else
          {
            char v16 = 0;
          }
        }

        else
        {
          char v16 = 0;
        }
      }

      else
      {
        char v16 = 0;
      }
    }

    else
    {
      char v16 = 0;
    }
  }

  return v16;
}

- (id)dictionary
{
  v20[6] = *MEMORY[0x1895F89C0];
  v19[0] = @"uuid";
  -[OTInheritanceKey uuid](self, "uuid");
  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue();
  [v18 description];
  char v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v17;
  v19[1] = @"wrappingKeyData";
  -[OTInheritanceKey wrappingKeyData](self, "wrappingKeyData");
  char v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v16 base64EncodedStringWithOptions:0];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v3;
  v19[2] = @"wrappingKeyString";
  v4 = -[OTInheritanceKey wrappingKeyString](self, "wrappingKeyString");
  v20[2] = v4;
  v19[3] = @"wrappedKeyData";
  -[OTInheritanceKey wrappedKeyData](self, "wrappedKeyData");
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 base64EncodedStringWithOptions:0];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20[3] = v6;
  v19[4] = @"wrappedKeyString";
  -[OTInheritanceKey wrappedKeyString](self, "wrappedKeyString");
  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20[4] = v7;
  v19[5] = @"recoveryKeyData";
  -[OTInheritanceKey recoveryKeyData](self, "recoveryKeyData");
  unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 base64EncodedStringWithOptions:0];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20[5] = v9;
  [MEMORY[0x189603F68] dictionaryWithObjects:v20 forKeys:v19 count:6];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  id v11 = (void *)[v10 mutableCopy];

  -[OTInheritanceKey claimTokenData](self, "claimTokenData");
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 base64EncodedStringWithOptions:0];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 setObject:v13 forKeyedSubscript:@"claimTokenData"];

  -[OTInheritanceKey claimTokenString](self, "claimTokenString");
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 setObject:v14 forKeyedSubscript:@"claimTokenString"];

  return v11;
}

- (OTInheritanceKey)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___OTInheritanceKey;
  BOOL v5 = -[OTInheritanceKey init](&v23, sel_init);
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uuid"];
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"wrappingKeyData"];
    wrappingKeyData = v5->_wrappingKeyData;
    v5->_wrappingKeyData = (NSData *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"wrappedKeyData"];
    wrappedKeyData = v5->_wrappedKeyData;
    v5->_wrappedKeyData = (NSData *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"wrappingKeyString"];
    wrappingKeyString = v5->_wrappingKeyString;
    v5->_wrappingKeyString = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"wrappedKeyString"];
    wrappedKeyString = v5->_wrappedKeyString;
    v5->_wrappedKeyString = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"claimTokenData"];
    claimTokenData = v5->_claimTokenData;
    v5->_claimTokenData = (NSData *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"claimTokenString"];
    claimTokenString = v5->_claimTokenString;
    v5->_claimTokenString = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"recoveryKeyData"];
    recoveryKeyData = v5->_recoveryKeyData;
    v5->_recoveryKeyData = (NSData *)v20;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uuid = self->_uuid;
  id v5 = a3;
  [v5 encodeObject:uuid forKey:@"uuid"];
  [v5 encodeObject:self->_wrappingKeyData forKey:@"wrappingKeyData"];
  [v5 encodeObject:self->_wrappedKeyData forKey:@"wrappedKeyData"];
  [v5 encodeObject:self->_wrappingKeyString forKey:@"wrappingKeyString"];
  [v5 encodeObject:self->_wrappedKeyString forKey:@"wrappedKeyString"];
  [v5 encodeObject:self->_claimTokenData forKey:@"claimTokenData"];
  [v5 encodeObject:self->_claimTokenString forKey:@"claimTokenString"];
  [v5 encodeObject:self->_recoveryKeyData forKey:@"recoveryKeyData"];
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (NSData)wrappingKeyData
{
  return self->_wrappingKeyData;
}

- (NSString)wrappingKeyString
{
  return self->_wrappingKeyString;
}

- (NSData)wrappedKeyData
{
  return self->_wrappedKeyData;
}

- (NSString)wrappedKeyString
{
  return self->_wrappedKeyString;
}

- (NSData)claimTokenData
{
  return self->_claimTokenData;
}

- (NSString)claimTokenString
{
  return self->_claimTokenString;
}

- (NSData)recoveryKeyData
{
  return self->_recoveryKeyData;
}

- (void).cxx_destruct
{
}

+ (id)base32:(const char *)a3 len:(unint64_t)a4
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  memset(v14, 170, sizeof(v14));
  if (!a4) {
    return 0LL;
  }
  unint64_t v4 = *(unsigned __int8 *)a3;
  char v13 = printableChars[v4 >> 3];
  unint64_t v5 = 4 * (v4 & 7);
  if (a4 != 1)
  {
    unint64_t v8 = *((unsigned __int8 *)a3 + 1);
    v14[0] = printableChars[v5 | (v8 >> 6)];
    v14[1] = printableChars[(v8 >> 1) & 0x1F];
    unint64_t v5 = 16 * (v8 & 1);
    if (a4 == 2)
    {
      uint64_t v6 = &v14[2];
      uint64_t v7 = 4LL;
      goto LABEL_13;
    }

    unint64_t v9 = *((unsigned __int8 *)a3 + 2);
    v14[2] = printableChars[v5 | (v9 >> 4)];
    uint64_t v10 = 2 * (v9 & 0xF);
    if (a4 == 3)
    {
      uint64_t v6 = &v14[3];
      uint64_t v7 = 5LL;
      LODWORD(v5) = v10;
      goto LABEL_13;
    }

    unint64_t v5 = *((unsigned __int8 *)a3 + 3);
    v14[3] = printableChars[v10 | (v5 >> 7)];
    v14[4] = printableChars[(v5 >> 2) & 0x1F];
    if (a4 == 5)
    {
      uint64_t v6 = &v14[6];
      unsigned int v12 = *((unsigned __int8 *)a3 + 4);
      v14[5] = printableChars[(v12 >> 5) & 0xFFFFFFE7 | (8 * (v5 & 3))];
      LODWORD(v5) = v12 & 0x1F;
      uint64_t v7 = 8LL;
      goto LABEL_13;
    }

    if (a4 == 4)
    {
      uint64_t v6 = &v14[5];
      LODWORD(v5) = 8 * (v5 & 3);
      uint64_t v7 = 7LL;
      goto LABEL_13;
    }

    return 0LL;
  }

  uint64_t v6 = v14;
  uint64_t v7 = 2LL;
LABEL_13:
  *uint64_t v6 = printableChars[v5];
  return (id)[objc_alloc(NSString) initWithBytes:&v13 length:v7 encoding:4];
}

+ (id)unbase32:(const char *)a3 len:(unint64_t)a4
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  int v15 = -1431655766;
  unint64_t v4 = a4 - 2;
  if (a4 - 2 <= 6 && ((0x6Du >> v4) & 1) != 0)
  {
    uint64_t v9 = 0LL;
    uint64_t v10 = qword_18746E8C0[v4];
    *(void *)&__int128 v11 = -1LL;
    *((void *)&v11 + 1) = -1LL;
    __int128 v18 = v11;
    __int128 v19 = v11;
    __int128 v16 = v11;
    __int128 v17 = v11;
    while (1)
    {
      unsigned int v12 = memchr("ABCDEFGHJKLMNPQRSTUVWXYZ23456789", a3[v9], 0x21uLL);
      uint64_t v13 = v12 - "ABCDEFGHJKLMNPQRSTUVWXYZ23456789";
      if (!v12) {
        uint64_t v13 = -1LL;
      }
      *((void *)&v16 + v9) = v13;
      if (v13 < 0) {
        break;
      }
      if (a4 == ++v9)
      {
        char v14 = (DWORD2(v16) >> 2) | (8 * v16);
        if (a4 >= 4)
        {
          LOBYTE(v15) = (2 * v17) | (BYTE8(v16) << 6) | (DWORD2(v17) >> 4);
          if (a4 != 4)
          {
            BYTE1(v15) = (v18 >> 1) | (16 * BYTE8(v17));
            if (a4 >= 7)
            {
              BYTE2(v15) = (4 * BYTE8(v18)) | ((_BYTE)v18 << 7) | (v19 >> 3);
              if (a4 == 8) {
                HIBYTE(v15) = BYTE8(v19) | (32 * v19);
              }
            }
          }
        }

        [MEMORY[0x189603F48] dataWithBytes:&v14 length:v10];
        unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
        return v5;
      }
    }
  }

  unint64_t v5 = 0LL;
  return v5;
}

+ (id)printableWithData:(id)a3 checksumSize:(unint64_t)a4 error:(id *)a5
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  objc_msgSend(MEMORY[0x189603FB8], "dataWithCapacity:", objc_msgSend(v7, "length") + a4);
  unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  *(void *)&__int128 v9 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v29[0] = v9;
  v29[1] = v9;
  ccsha256_di();
  [v7 length];
  id v10 = v7;
  [v10 bytes];
  ccdigest();
  [v8 appendData:v10];
  if (a4 < 0x21)
  {
    [MEMORY[0x189603F48] dataWithBytes:v29 length:a4];
    char v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 appendData:v14];

    id v15 = v8;
    uint64_t v16 = [v15 bytes];
    unint64_t v17 = [v15 length];
    [MEMORY[0x189607940] stringWithCapacity:0];
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      unint64_t v18 = v17 - 5;
      if (v17 >= 5) {
        uint64_t v19 = 5LL;
      }
      else {
        uint64_t v19 = v17;
      }
      uint64_t v20 = +[OTInheritanceKey base32:len:](&OBJC_CLASS___OTInheritanceKey, "base32:len:", v16, v19);
      if (!v20)
      {
LABEL_19:
        if (a5)
        {
          uint64_t v25 = (void *)MEMORY[0x189607870];
          objc_msgSend(NSString, "stringWithFormat:", @"bad chunkLen (%zu)", v19);
          uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
          [v25 errorWithDomain:@"com.apple.security.OctagonTrust.OTInheritanceKey" code:6 description:v26];
          *a5 = (id)objc_claimAutoreleasedReturnValue();
        }

        uint64_t v13 = 0LL;
        goto LABEL_25;
      }

      uint64_t v21 = (void *)v20;
      id v28 = v10;
      unint64_t v22 = 5LL;
      while (1)
      {
        if ((unint64_t)[v21 length] < 5)
        {
          [v12 appendString:v21];
        }

        else
        {
          [v21 substringToIndex:4];
          objc_super v23 = (void *)objc_claimAutoreleasedReturnValue();
          [v12 appendString:v23];

          [v12 appendString:@"-"];
          [v21 substringFromIndex:4];
          uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
          [v12 appendString:v24];
        }

        if (v22 >= v17) {
          break;
        }
        [v12 appendString:@"-"];

        if (v18 >= 5) {
          uint64_t v19 = 5LL;
        }
        else {
          uint64_t v19 = v18;
        }
        +[OTInheritanceKey base32:len:](&OBJC_CLASS___OTInheritanceKey, "base32:len:", v16 + v22, v19);
        uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 += 5LL;
        v18 -= 5LL;
        if (!v21)
        {
          id v10 = v28;
          goto LABEL_19;
        }
      }

      id v10 = v28;
    }

    id v12 = v12;
    uint64_t v13 = v12;
LABEL_25:

    goto LABEL_26;
  }

  if (a5)
  {
    __int128 v11 = (void *)MEMORY[0x189607870];
    objc_msgSend(NSString, "stringWithFormat:", @"checksumSize (%zu) too large (%zu)", a4, 32);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    [v11 errorWithDomain:@"com.apple.security.OctagonTrust.OTInheritanceKey" code:3 description:v12];
    uint64_t v13 = 0LL;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_25;
  }

  uint64_t v13 = 0LL;
LABEL_26:

  return v13;
}

+ (id)parseBase32:(id)a3 checksumSize:(unint64_t)a4 error:(id *)a5
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  [a3 stringByReplacingOccurrencesOfString:@"-" withString:&stru_18A04F9E0];
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v6 = [v5 length];
  [MEMORY[0x189603FB8] dataWithLength:0];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v31 = v5;
  uint64_t v8 = [v31 UTF8String];
  if (v6)
  {
    uint64_t v9 = v8;
    unint64_t v10 = 0LL;
    unint64_t v11 = v6;
    while (1)
    {
      unint64_t v12 = v11 - 8;
      uint64_t v13 = v11 >= 8 ? 8LL : v11;
      uint64_t v14 = +[OTInheritanceKey unbase32:len:](&OBJC_CLASS___OTInheritanceKey, "unbase32:len:", v9 + v10, v13);
      if (!v14) {
        break;
      }
      id v15 = (void *)v14;
      [v7 appendData:v14];

      v10 += 8LL;
      unint64_t v11 = v12;
      if (v10 >= v6) {
        goto LABEL_8;
      }
    }

    uint64_t v16 = a5;
    if (!a5) {
      goto LABEL_21;
    }
    unint64_t v22 = (void *)MEMORY[0x189607870];
    objc_msgSend(NSString, "stringWithFormat:", @"Cannot parse %.*s", v13, v9 + v10);
    objc_super v23 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v24 = v22;
    uint64_t v25 = 1LL;
    goto LABEL_20;
  }

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end