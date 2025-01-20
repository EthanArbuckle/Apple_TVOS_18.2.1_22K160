@interface TKTokenKeychainCertificate
- (NSData)data;
- (NSData)issuer;
- (NSData)publicKeyHash;
- (NSData)serialNumber;
- (NSData)subject;
- (NSData)subjectKeyID;
- (NSNumber)certificateEncoding;
- (NSNumber)certificateType;
- (TKTokenKeychainCertificate)initWithCertificate:(SecCertificateRef)certificateRef objectID:(TKTokenObjectID)objectID;
- (TKTokenKeychainCertificate)initWithItemInfo:(id)a3;
- (id)encodedObjectID;
- (id)keychainAttributes;
- (void)setCertificateEncoding:(id)a3;
- (void)setCertificateType:(id)a3;
- (void)setIssuer:(id)a3;
- (void)setPublicKeyHash:(id)a3;
- (void)setSerialNumber:(id)a3;
- (void)setSubject:(id)a3;
- (void)setSubjectKeyID:(id)a3;
@end

@implementation TKTokenKeychainCertificate

- (TKTokenKeychainCertificate)initWithCertificate:(SecCertificateRef)certificateRef objectID:(TKTokenObjectID)objectID
{
  v32[1] = *MEMORY[0x1895F89C0];
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___TKTokenKeychainCertificate;
  v5 = -[TKTokenKeychainItem initWithObjectID:](&v28, sel_initWithObjectID_, objectID);
  if (v5)
  {
    CFDataRef v6 = SecCertificateCopyData(certificateRef);
    data = v5->_data;
    v5->_data = (NSData *)v6;

    v8 = (__CFString *)SecCertificateCopySubjectSummary(certificateRef);
    -[TKTokenKeychainItem setLabel:](v5, "setLabel:", v8);

    v31 = &unk_189F98600;
    v32[0] = MEMORY[0x189604A88];
    [MEMORY[0x189603F68] dictionaryWithObjects:v32 forKeys:&v31 count:1];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TKTokenKeychainItem setConstraints:](v5, "setConstraints:", v9);

    v10 = (void *)SecCertificateCopyAttributeDictionary();
    v11 = v10;
    if (v10)
    {
      uint64_t v12 = [v10 objectForKey:*MEMORY[0x18960B8F8]];
      certificateType = v5->_certificateType;
      v5->_certificateType = (NSNumber *)v12;

      uint64_t v14 = [v11 objectForKey:*MEMORY[0x18960B8F0]];
      certificateEncoding = v5->_certificateEncoding;
      v5->_certificateEncoding = (NSNumber *)v14;

      uint64_t v16 = [v11 objectForKey:*MEMORY[0x18960BA90]];
      subject = v5->_subject;
      v5->_subject = (NSData *)v16;

      uint64_t v18 = [v11 objectForKey:*MEMORY[0x18960B958]];
      issuer = v5->_issuer;
      v5->_issuer = (NSData *)v18;

      uint64_t v20 = [v11 objectForKey:*MEMORY[0x18960BA78]];
      serialNumber = v5->_serialNumber;
      v5->_serialNumber = (NSData *)v20;

      uint64_t v22 = [v11 objectForKey:*MEMORY[0x18960BA98]];
      subjectKeyID = v5->_subjectKeyID;
      v5->_subjectKeyID = (NSData *)v22;

      uint64_t v24 = [v11 objectForKey:*MEMORY[0x18960BA68]];
      publicKeyHash = v5->_publicKeyHash;
      v5->_publicKeyHash = (NSData *)v24;
    }

    else
    {
      TK_LOG_token_2();
      v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        SecCertificateRef v30 = certificateRef;
        _os_log_impl( &dword_186E58000,  v26,  OS_LOG_TYPE_DEFAULT,  "Failed to get attributes from certificate %{public}@",  buf,  0xCu);
      }

      publicKeyHash = v5;
      v5 = 0LL;
    }
  }

  return v5;
}

- (id)encodedObjectID
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[TKTokenID encodedCertificateID:](&OBJC_CLASS___TKTokenID, "encodedCertificateID:", v2);
  return v3;
}

- (TKTokenKeychainCertificate)initWithItemInfo:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___TKTokenKeychainCertificate;
  v5 = -[TKTokenKeychainItem initWithItemInfo:](&v23, sel_initWithItemInfo_, v4);
  if (v5)
  {
    uint64_t v6 = [v4 objectForKey:*MEMORY[0x18960BE78]];
    data = v5->_data;
    v5->_data = (NSData *)v6;

    uint64_t v8 = [v4 objectForKey:*MEMORY[0x18960B8F8]];
    certificateType = v5->_certificateType;
    v5->_certificateType = (NSNumber *)v8;

    uint64_t v10 = [v4 objectForKey:*MEMORY[0x18960B8F0]];
    certificateEncoding = v5->_certificateEncoding;
    v5->_certificateEncoding = (NSNumber *)v10;

    uint64_t v12 = [v4 objectForKey:*MEMORY[0x18960BA90]];
    subject = v5->_subject;
    v5->_subject = (NSData *)v12;

    uint64_t v14 = [v4 objectForKey:*MEMORY[0x18960B958]];
    issuer = v5->_issuer;
    v5->_issuer = (NSData *)v14;

    uint64_t v16 = [v4 objectForKey:*MEMORY[0x18960BA78]];
    serialNumber = v5->_serialNumber;
    v5->_serialNumber = (NSData *)v16;

    uint64_t v18 = [v4 objectForKey:*MEMORY[0x18960BA98]];
    subjectKeyID = v5->_subjectKeyID;
    v5->_subjectKeyID = (NSData *)v18;

    uint64_t v20 = [v4 objectForKey:*MEMORY[0x18960BA68]];
    publicKeyHash = v5->_publicKeyHash;
    v5->_publicKeyHash = (NSData *)v20;
  }

  return v5;
}

- (id)keychainAttributes
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___TKTokenKeychainCertificate;
  v3 = -[TKTokenKeychainItem keychainAttributes](&v13, sel_keychainAttributes);
  [v3 setObject:*MEMORY[0x18960BB40] forKeyedSubscript:*MEMORY[0x18960BB38]];
  -[TKTokenKeychainCertificate data](self, "data");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v4 forKeyedSubscript:*MEMORY[0x18960BE78]];
  v5 = -[TKTokenKeychainCertificate subject](self, "subject");
  [v3 setObject:v5 forKeyedSubscript:*MEMORY[0x18960BA90]];

  -[TKTokenKeychainCertificate issuer](self, "issuer");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v6 forKeyedSubscript:*MEMORY[0x18960B958]];
  v7 = -[TKTokenKeychainCertificate serialNumber](self, "serialNumber");
  [v3 setObject:v7 forKeyedSubscript:*MEMORY[0x18960BA78]];

  -[TKTokenKeychainCertificate subjectKeyID](self, "subjectKeyID");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v8 forKeyedSubscript:*MEMORY[0x18960BA98]];
  v9 = -[TKTokenKeychainCertificate publicKeyHash](self, "publicKeyHash");
  [v3 setObject:v9 forKeyedSubscript:*MEMORY[0x18960BA68]];

  -[TKTokenKeychainCertificate certificateType](self, "certificateType");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v10 forKeyedSubscript:*MEMORY[0x18960B8F8]];
  v11 = -[TKTokenKeychainCertificate certificateEncoding](self, "certificateEncoding");
  [v3 setObject:v11 forKeyedSubscript:*MEMORY[0x18960B8F0]];

  return v3;
}

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 48LL, 1);
}

- (NSData)subject
{
  return (NSData *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setSubject:(id)a3
{
}

- (NSData)issuer
{
  return (NSData *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setIssuer:(id)a3
{
}

- (NSData)serialNumber
{
  return (NSData *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setSerialNumber:(id)a3
{
}

- (NSData)subjectKeyID
{
  return (NSData *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setSubjectKeyID:(id)a3
{
}

- (NSData)publicKeyHash
{
  return (NSData *)objc_getProperty(self, a2, 88LL, 1);
}

- (void)setPublicKeyHash:(id)a3
{
}

- (NSNumber)certificateType
{
  return (NSNumber *)objc_getProperty(self, a2, 96LL, 1);
}

- (void)setCertificateType:(id)a3
{
}

- (NSNumber)certificateEncoding
{
  return (NSNumber *)objc_getProperty(self, a2, 104LL, 1);
}

- (void)setCertificateEncoding:(id)a3
{
}

- (void).cxx_destruct
{
}

@end