@interface TKTokenKeychainKey
+ (BOOL)canDecrypt:(unsigned __int8)a3;
+ (BOOL)canPerformKeyExchange:(unsigned __int8)a3;
+ (BOOL)canSign:(unsigned __int8)a3;
- (BOOL)canDecrypt;
- (BOOL)canPerformKeyExchange;
- (BOOL)canSign;
- (BOOL)isSuitableForLogin;
- (BOOL)satisfiesKeyUsage:(unint64_t)a3;
- (BOOL)setupWithPublicKey:(__SecKey *)a3 label:(id)a4;
- (NSData)applicationTag;
- (NSData)publicKeyData;
- (NSData)publicKeyHash;
- (NSInteger)keySizeInBits;
- (NSString)keyType;
- (TKTokenKeychainKey)initWithCertificate:(SecCertificateRef)certificateRef objectID:(TKTokenObjectID)objectID;
- (TKTokenKeychainKey)initWithItemInfo:(id)a3;
- (TKTokenKeychainKey)initWithPublicKey:(__SecKey *)a3 label:(id)a4 objectID:(id)a5 canSign:(BOOL)a6 canDecrypt:(BOOL)a7 canPerformKeyExchange:(BOOL)a8;
- (id)encodedObjectID;
- (id)keychainAttributes;
- (unint64_t)keyUsage;
- (void)setApplicationTag:(NSData *)applicationTag;
- (void)setCanDecrypt:(BOOL)canDecrypt;
- (void)setCanPerformKeyExchange:(BOOL)canPerformKeyExchange;
- (void)setCanSign:(BOOL)canSign;
- (void)setKeySizeInBits:(NSInteger)keySizeInBits;
- (void)setKeyType:(NSString *)keyType;
- (void)setPublicKeyData:(NSData *)publicKeyData;
- (void)setPublicKeyHash:(NSData *)publicKeyHash;
- (void)setSuitableForLogin:(BOOL)suitableForLogin;
@end

@implementation TKTokenKeychainKey

- (TKTokenKeychainKey)initWithCertificate:(SecCertificateRef)certificateRef objectID:(TKTokenObjectID)objectID
{
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___TKTokenKeychainKey;
  v5 = -[TKTokenKeychainItem initWithObjectID:](&v21, sel_initWithObjectID_, objectID);
  v6 = v5;
  if (certificateRef && v5)
  {
    v7 = (__CFString *)SecCertificateCopySubjectSummary(certificateRef);
    SecKeyRef v8 = SecCertificateCopyKey(certificateRef);
    if (v8)
    {
      [MEMORY[0x189607968] numberWithUnsignedInt:SecCertificateGetKeyUsage()];
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v10 = [v9 unsignedCharValue];

      -[TKTokenKeychainKey setCanSign:]( v6,  "setCanSign:",  +[TKTokenKeychainKey canSign:](&OBJC_CLASS___TKTokenKeychainKey, "canSign:", v10));
      -[TKTokenKeychainKey setCanDecrypt:]( v6,  "setCanDecrypt:",  +[TKTokenKeychainKey canDecrypt:](&OBJC_CLASS___TKTokenKeychainKey, "canDecrypt:", v10));
      -[TKTokenKeychainKey setCanPerformKeyExchange:]( v6,  "setCanPerformKeyExchange:",  +[TKTokenKeychainKey canPerformKeyExchange:](&OBJC_CLASS___TKTokenKeychainKey, "canPerformKeyExchange:", v10));
      -[TKTokenKeychainKey setSuitableForLogin:]( v6,  "setSuitableForLogin:",  -[TKTokenKeychainKey canSign](v6, "canSign"));
      if (-[TKTokenKeychainKey setupWithPublicKey:label:](v6, "setupWithPublicKey:label:", v8, v7))
      {
        v11 = v6;
LABEL_11:

        goto LABEL_12;
      }
    }

    else
    {
      TK_LOG_token_2();
      v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[TKTokenKeychainKey initWithCertificate:objectID:].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);
      }
    }

    v11 = 0LL;
    goto LABEL_11;
  }

  v11 = v5;
LABEL_12:

  return v11;
}

- (TKTokenKeychainKey)initWithPublicKey:(__SecKey *)a3 label:(id)a4 objectID:(id)a5 canSign:(BOOL)a6 canDecrypt:(BOOL)a7 canPerformKeyExchange:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a7;
  BOOL v10 = a6;
  id v14 = a4;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___TKTokenKeychainKey;
  uint64_t v15 = -[TKTokenKeychainItem initWithObjectID:](&v19, sel_initWithObjectID_, a5);
  uint64_t v16 = v15;
  if (v15
    && (-[TKTokenKeychainKey setCanSign:](v15, "setCanSign:", v10),
        -[TKTokenKeychainKey setCanDecrypt:](v16, "setCanDecrypt:", v9),
        -[TKTokenKeychainKey setCanPerformKeyExchange:](v16, "setCanPerformKeyExchange:", v8),
        -[TKTokenKeychainKey setSuitableForLogin:]( v16,  "setSuitableForLogin:",  -[TKTokenKeychainKey canSign](v16, "canSign")),  -[TKTokenKeychainKey setupWithPublicKey:label:](v16, "setupWithPublicKey:label:", a3, v14)))
  {
    uint64_t v17 = v16;
  }

  else
  {
    uint64_t v17 = 0LL;
  }

  return v17;
}

- (BOOL)setupWithPublicKey:(__SecKey *)a3 label:(id)a4
{
  CFDictionaryRef v6 = SecKeyCopyAttributes(a3);
  -[__CFDictionary objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", *MEMORY[0x18960BE78]);
  v7 = (NSData *)objc_claimAutoreleasedReturnValue();
  publicKeyData = self->_publicKeyData;
  self->_publicKeyData = v7;

  BOOL v9 = self->_publicKeyData;
  if (v9)
  {
    -[__CFDictionary objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", *MEMORY[0x18960B998]);
    BOOL v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    keyType = self->_keyType;
    self->_keyType = v10;
    v12 = -[__CFDictionary objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", *MEMORY[0x18960B988]);
    self->_keySizeInBits = [v12 integerValue];

    -[__CFDictionary objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", *MEMORY[0x18960B878]);
    uint64_t v13 = (NSData *)objc_claimAutoreleasedReturnValue();
    publicKeyHash = self->_publicKeyHash;
    self->_publicKeyHash = v13;

    uint64_t v15 = (void *)[MEMORY[0x189604A60] mutableCopy];
    if (-[TKTokenKeychainKey canSign](self, "canSign")) {
      [v15 setObject:MEMORY[0x189604A88] forKeyedSubscript:&unk_189F98618];
    }
    if (-[TKTokenKeychainKey canDecrypt](self, "canDecrypt")) {
      [v15 setObject:MEMORY[0x189604A88] forKeyedSubscript:&unk_189F98630];
    }
    if (-[TKTokenKeychainKey canPerformKeyExchange](self, "canPerformKeyExchange")) {
      [v15 setObject:MEMORY[0x189604A88] forKeyedSubscript:&unk_189F98648];
    }
    uint64_t v16 = (void *)[v15 copy];
    -[TKTokenKeychainItem setConstraints:](self, "setConstraints:", v16);
  }

  else
  {
    TK_LOG_token_2();
    uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[TKTokenKeychainKey setupWithPublicKey:label:].cold.1(v17, v18, v19, v20, v21, v22, v23, v24);
    }
  }

  return v9 != 0LL;
}

- (id)keychainAttributes
{
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___TKTokenKeychainKey;
  v3 = -[TKTokenKeychainItem keychainAttributes](&v18, sel_keychainAttributes);
  [v3 setObject:*MEMORY[0x18960BB60] forKeyedSubscript:*MEMORY[0x18960BB38]];
  [v3 setObject:*MEMORY[0x18960B970] forKeyedSubscript:*MEMORY[0x18960B968]];
  [v3 setObject:MEMORY[0x189604A88] forKeyedSubscript:*MEMORY[0x18960B950]];
  v4 = -[TKTokenKeychainKey keyType](self, "keyType");
  [v3 setObject:v4 forKeyedSubscript:*MEMORY[0x18960B998]];

  objc_msgSend(MEMORY[0x189607968], "numberWithInteger:", -[TKTokenKeychainKey keySizeInBits](self, "keySizeInBits"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v5 forKeyedSubscript:*MEMORY[0x18960B988]];

  objc_msgSend(MEMORY[0x189607968], "numberWithBool:", -[TKTokenKeychainKey canDecrypt](self, "canDecrypt"));
  CFDictionaryRef v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v6 forKeyedSubscript:*MEMORY[0x18960B8B8]];

  objc_msgSend(MEMORY[0x189607968], "numberWithBool:", -[TKTokenKeychainKey canSign](self, "canSign"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v7 forKeyedSubscript:*MEMORY[0x18960B8D0]];

  objc_msgSend(MEMORY[0x189607968], "numberWithBool:", -[TKTokenKeychainKey canDecrypt](self, "canDecrypt"));
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v8 forKeyedSubscript:*MEMORY[0x18960B8D8]];

  objc_msgSend( MEMORY[0x189607968],  "numberWithBool:",  -[TKTokenKeychainKey canPerformKeyExchange](self, "canPerformKeyExchange"));
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v9 forKeyedSubscript:*MEMORY[0x18960B8C0]];

  -[TKTokenKeychainKey applicationTag](self, "applicationTag");
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = -[TKTokenKeychainKey applicationTag](self, "applicationTag");
    [v3 setObject:v11 forKeyedSubscript:*MEMORY[0x18960B880]];
  }
  v12 = -[TKTokenKeychainKey publicKeyHash](self, "publicKeyHash");
  if (v12)
  {
    -[TKTokenKeychainKey publicKeyHash](self, "publicKeyHash");
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v13 forKeyedSubscript:*MEMORY[0x18960B878]];
  }

  -[TKTokenKeychainKey publicKeyData](self, "publicKeyData");
  id v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[TKTokenKeychainKey publicKeyData](self, "publicKeyData");
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v15 forKeyedSubscript:@"pubk"];
  }

  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:", -[TKTokenKeychainKey keyUsage](self, "keyUsage"));
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v16 forKeyedSubscript:@"keyUsage"];

  return v3;
}

- (id)encodedObjectID
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[TKTokenID encodedKeyID:](&OBJC_CLASS___TKTokenID, "encodedKeyID:", v2);
  return v3;
}

- (TKTokenKeychainKey)initWithItemInfo:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___TKTokenKeychainKey;
  v5 = -[TKTokenKeychainItem initWithItemInfo:](&v21, sel_initWithItemInfo_, v4);
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:*MEMORY[0x18960BE78]];
    publicKeyData = v5->_publicKeyData;
    v5->_publicKeyData = (NSData *)v6;

    uint64_t v8 = [v4 objectForKeyedSubscript:*MEMORY[0x18960B998]];
    keyType = v5->_keyType;
    v5->_keyType = (NSString *)v8;

    [v4 objectForKeyedSubscript:*MEMORY[0x18960B988]];
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_keySizeInBits = [v10 integerValue];

    uint64_t v11 = [v4 objectForKeyedSubscript:*MEMORY[0x18960B878]];
    publicKeyHash = v5->_publicKeyHash;
    v5->_publicKeyHash = (NSData *)v11;

    uint64_t v13 = [v4 objectForKeyedSubscript:@"pubk"];
    id v14 = v5->_publicKeyData;
    v5->_publicKeyData = (NSData *)v13;

    [v4 objectForKeyedSubscript:*MEMORY[0x18960B8B8]];
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_canDecrypt = [v15 BOOLValue];

    [v4 objectForKeyedSubscript:*MEMORY[0x18960B8D0]];
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_canSign = [v16 BOOLValue];

    [v4 objectForKeyedSubscript:*MEMORY[0x18960B8D8]];
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_canDecrypt = [v17 BOOLValue];

    [v4 objectForKeyedSubscript:*MEMORY[0x18960B8C0]];
    objc_super v18 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_canPerformKeyExchange = [v18 BOOLValue];

    [v4 objectForKeyedSubscript:@"keyUsage"];
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_suitableForLogin = [v19 integerValue] & 1;
  }

  return v5;
}

+ (BOOL)canSign:(unsigned __int8)a3
{
  return (a3 & 0x63) != 0;
}

+ (BOOL)canDecrypt:(unsigned __int8)a3
{
  return (a3 & 0x1C) != 0;
}

+ (BOOL)canPerformKeyExchange:(unsigned __int8)a3
{
  return (a3 >> 4) & 1;
}

- (unint64_t)keyUsage
{
  unint64_t v3 = -[TKTokenKeychainKey isSuitableForLogin](self, "isSuitableForLogin");
  if (-[TKTokenKeychainKey canSign](self, "canSign")) {
    v3 |= 8uLL;
  }
  if (-[TKTokenKeychainKey canDecrypt](self, "canDecrypt")) {
    v3 |= 2uLL;
  }
  if (-[TKTokenKeychainKey canPerformKeyExchange](self, "canPerformKeyExchange")) {
    return v3 | 4;
  }
  else {
    return v3;
  }
}

- (BOOL)satisfiesKeyUsage:(unint64_t)a3
{
  return !a3 || (-[TKTokenKeychainKey keyUsage](self, "keyUsage") & a3) != 0;
}

- (NSString)keyType
{
  return (NSString *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setKeyType:(NSString *)keyType
{
}

- (NSData)applicationTag
{
  return (NSData *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setApplicationTag:(NSData *)applicationTag
{
}

- (NSInteger)keySizeInBits
{
  return self->_keySizeInBits;
}

- (void)setKeySizeInBits:(NSInteger)keySizeInBits
{
  self->_keySizeInBits = keySizeInBits;
}

- (NSData)publicKeyData
{
  return (NSData *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setPublicKeyData:(NSData *)publicKeyData
{
}

- (NSData)publicKeyHash
{
  return (NSData *)objc_getProperty(self, a2, 88LL, 1);
}

- (void)setPublicKeyHash:(NSData *)publicKeyHash
{
}

- (BOOL)canDecrypt
{
  return self->_canDecrypt;
}

- (void)setCanDecrypt:(BOOL)canDecrypt
{
  self->_canDecrypt = canDecrypt;
}

- (BOOL)canSign
{
  return self->_canSign;
}

- (void)setCanSign:(BOOL)canSign
{
  self->_canSign = canSign;
}

- (BOOL)canPerformKeyExchange
{
  return self->_canPerformKeyExchange;
}

- (void)setCanPerformKeyExchange:(BOOL)canPerformKeyExchange
{
  self->_canPerformKeyExchange = canPerformKeyExchange;
}

- (BOOL)isSuitableForLogin
{
  return self->_suitableForLogin;
}

- (void)setSuitableForLogin:(BOOL)suitableForLogin
{
  self->_suitableForLogin = suitableForLogin;
}

- (void).cxx_destruct
{
}

- (void)initWithCertificate:(uint64_t)a3 objectID:(uint64_t)a4 .cold.1( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)setupWithPublicKey:(uint64_t)a3 label:(uint64_t)a4 .cold.1( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

@end