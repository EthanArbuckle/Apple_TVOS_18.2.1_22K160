@interface MSCMSRecipientInfo
+ (id)decodeKeyAgreeRecipientInfo:(RecipientInfo *)a3 certificates:(id)a4 LAContext:(id)a5 error:(id *)a6;
+ (id)decodeKeyTransRecipientInfo:(RecipientInfo *)a3 certificates:(id)a4 LAContext:(id)a5 error:(id *)a6;
+ (id)decodeRecipientInfo:(RecipientInfo *)a3 certificates:(id)a4 LAContext:(id)a5 error:(id *)a6;
- (BOOL)encodeKeyAgreeRecipientInfo:(id)a3 recipientInfo:(RecipientInfo *)a4 error:(id *)a5;
- (BOOL)encodeKeyTransRecipientInfo:(id)a3 recipientInfo:(RecipientInfo *)a4 error:(id *)a5;
- (BOOL)encodeRecipientInfo:(id)a3 recipientInfo:(RecipientInfo *)a4 error:(id *)a5;
- (MSAlgorithmIdentifier)keyEncryptionAlgorithm;
- (MSCMSRecipientInfo)initWithCertificate:(__SecCertificate *)a3;
- (MSCMSRecipientInfo)initWithCertificate:(__SecCertificate *)a3 algorithmCapabilities:(id)a4;
- (MSCMSRecipientInfo)initWithCertificate:(__SecCertificate *)a3 keyEncryptionAlgorithm:(id)a4 keyWrapAlgorithm:(id)a5;
- (MSCMSRecipientInfo)initWithCertificate:(__SecCertificate *)a3 legacyKeyWrapAlgorithm:(BOOL)a4;
- (MSCMSRecipientInfo)initWithEmail:(id)a3;
- (MSCMSRecipientInfo)initWithEmail:(id)a3 algorithmCapabilities:(id)a4;
- (MSCMSRecipientInfo)initWithEmail:(id)a3 keyEncryptionAlgorithm:(id)a4;
- (NSArray)algorithmCapabilities;
- (NSArray)encryptedKeys;
- (NSArray)recipientCertificates;
- (NSData)originatorPubKey;
- (NSData)userKeyingMaterial;
- (NSNumber)version;
- (__CFData)createSecCMSSharedInfo:(id)a3;
- (__CFData)createSharedInfo:(id)a3;
- (__CFData)keyEncryptionKey:(id)a3 forEncryption:(BOOL)a4 secCMSCompatibility:(BOOL)a5;
- (__SecCertificate)originator;
- (__SecCertificate)recipientCertificate;
- (__SecIdentity)originatorIdentity;
- (id)decryptWrappedKey:(id)a3 kek:(id)a4 iv:(heim_base_data *)a5;
- (id)encryptBulkKey:(id)a3;
- (id)key;
- (id)key:(BOOL)a3;
- (void)dealloc;
- (void)freeKeyTransRecipientInfo:(const RecipientInfo *)a3;
- (void)freeRecipientInfo:(const RecipientInfo *)a3;
- (void)setAlgorithmCapabilities:(id)a3;
- (void)setEncryptedKeys:(id)a3;
- (void)setKeyEncryptionAlgorithm:(id)a3;
- (void)setOriginator:(__SecCertificate *)a3;
- (void)setOriginatorIdentity:(__SecIdentity *)a3;
- (void)setOriginatorPubKey:(id)a3;
- (void)setRecipientCertificate:(__SecCertificate *)a3;
- (void)setRecipientCertificates:(id)a3;
- (void)setUserKeyingMaterial:(id)a3;
- (void)setVersion:(id)a3;
@end

@implementation MSCMSRecipientInfo

- (void)setOriginator:(__SecCertificate *)a3
{
  if (a3) {
    CFRetain(a3);
  }
  self->_originator = a3;
}

- (void)setOriginatorIdentity:(__SecIdentity *)a3
{
  if (a3) {
    CFRetain(a3);
  }
  self->_originatorIdentity = a3;
}

- (MSCMSRecipientInfo)initWithCertificate:(__SecCertificate *)a3
{
  return -[MSCMSRecipientInfo initWithCertificate:keyEncryptionAlgorithm:keyWrapAlgorithm:]( self,  "initWithCertificate:keyEncryptionAlgorithm:keyWrapAlgorithm:",  a3,  0LL,  0LL);
}

- (MSCMSRecipientInfo)initWithCertificate:(__SecCertificate *)a3 legacyKeyWrapAlgorithm:(BOOL)a4
{
  if (a4)
  {
    v6 = +[MSOID OIDWithString:error:](&OBJC_CLASS___MSOID, "OIDWithString:error:", @"2.16.840.1.101.3.4.1.42", 0LL);
  }

  else
  {
    v6 = 0LL;
  }

  v7 = -[MSCMSRecipientInfo initWithCertificate:keyEncryptionAlgorithm:keyWrapAlgorithm:]( self,  "initWithCertificate:keyEncryptionAlgorithm:keyWrapAlgorithm:",  a3,  0LL,  v6);

  return v7;
}

- (MSCMSRecipientInfo)initWithCertificate:(__SecCertificate *)a3 algorithmCapabilities:(id)a4
{
  id v6 = a4;
  findBestMutuallySupportedKeyEncryptionAlgorithm(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 =  -[MSCMSRecipientInfo initWithCertificate:keyEncryptionAlgorithm:keyWrapAlgorithm:]( self,  "initWithCertificate:keyEncryptionAlgorithm:keyWrapAlgorithm:",  a3,  0LL,  v7);
  v9 = v8;
  if (v8) {
    -[MSCMSRecipientInfo setAlgorithmCapabilities:](v8, "setAlgorithmCapabilities:", v6);
  }

  return v9;
}

- (MSCMSRecipientInfo)initWithCertificate:(__SecCertificate *)a3 keyEncryptionAlgorithm:(id)a4 keyWrapAlgorithm:(id)a5
{
  uint64_t v66 = *MEMORY[0x1895F89C0];
  id v8 = a4;
  id v9 = a5;
  v60.receiver = self;
  v60.super_class = (Class)&OBJC_CLASS___MSCMSRecipientInfo;
  v10 = -[MSCMSRecipientInfo init](&v60, sel_init);
  v11 = v10;
  v12 = 0LL;
  if (!a3 || !v10) {
    goto LABEL_54;
  }
  id v13 = objc_alloc_init(MEMORY[0x189603FA8]);
  [v13 addObject:a3];
  objc_storeStrong((id *)&v11->_recipientCertificates, v13);
  uint64_t KeyTypeForCertificate = getKeyTypeForCertificate(a3);
  if (KeyTypeForCertificate != 3)
  {
    if (KeyTypeForCertificate != 1)
    {
      if (MS_DEFAULT_LOG_BLOCK != -1) {
        dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_23);
      }
      v21 = (os_log_s *)MS_DEFAULT_LOG_INTERNAL;
      if (os_log_type_enabled((os_log_t)MS_DEFAULT_LOG_INTERNAL, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        *(void *)&buf[4] = "-[MSCMSRecipientInfo initWithCertificate:keyEncryptionAlgorithm:keyWrapAlgorithm:]";
        _os_log_impl( &dword_1810EE000,  v21,  OS_LOG_TYPE_ERROR,  "MSCMSRecipientInfo %s: Unsupported certificate key type",  buf,  0xCu);
      }

      v12 = 0LL;
      goto LABEL_53;
    }

    if (initWithCertificate_keyEncryptionAlgorithm_keyWrapAlgorithm__onceToken != -1) {
      dispatch_once(&initWithCertificate_keyEncryptionAlgorithm_keyWrapAlgorithm__onceToken, &__block_literal_global_0);
    }
    if (v8)
    {
      v15 = (void *)initWithCertificate_keyEncryptionAlgorithm_keyWrapAlgorithm__sAllowedRSAEncAlgs;
      [v8 OIDString];
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v15) = [v15 containsObject:v16];

      if ((_DWORD)v15)
      {
        uint64_t v17 = +[MSAlgorithmIdentifier algorithmIdentifierWithOID:]( &OBJC_CLASS___MSAlgorithmIdentifier,  "algorithmIdentifierWithOID:",  v8);
        keyEncryptionAlgorithm = (MSOID *)v11->_keyEncryptionAlgorithm;
        v11->_keyEncryptionAlgorithm = (MSAlgorithmIdentifier *)v17;
LABEL_52:

        v12 = v11;
LABEL_53:

LABEL_54:
        return v12;
      }

      if (MS_DEFAULT_LOG_BLOCK != -1) {
        dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_5);
      }
      v22 = (void *)MS_DEFAULT_LOG_INTERNAL;
      if (os_log_type_enabled((os_log_t)MS_DEFAULT_LOG_INTERNAL, OS_LOG_TYPE_DEFAULT))
      {
        v23 = v22;
        [v8 OIDString];
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v24;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = 1LL;
        _os_log_impl( &dword_1810EE000,  v23,  OS_LOG_TYPE_DEFAULT,  "MSCMSRecipientInfo init encryption algorithm %@ not permitted for certificate key type %ld",  buf,  0x16u);
      }
    }

    [(id)initWithCertificate_keyEncryptionAlgorithm_keyWrapAlgorithm__sAllowedRSAEncAlgs allObjects];
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    [v25 objectAtIndex:0];
    keyEncryptionAlgorithm = (MSOID *)objc_claimAutoreleasedReturnValue();

    v26 = -[MSOID initWithString:error:]( objc_alloc(&OBJC_CLASS___MSOID),  "initWithString:error:",  keyEncryptionAlgorithm,  0LL);
    uint64_t v27 = +[MSAlgorithmIdentifier algorithmIdentifierWithOID:]( &OBJC_CLASS___MSAlgorithmIdentifier,  "algorithmIdentifierWithOID:",  v26);
    v28 = v11->_keyEncryptionAlgorithm;
    v11->_keyEncryptionAlgorithm = (MSAlgorithmIdentifier *)v27;

LABEL_51:
    goto LABEL_52;
  }

  if (initWithCertificate_keyEncryptionAlgorithm_keyWrapAlgorithm__onceToken_8 != -1) {
    dispatch_once( &initWithCertificate_keyEncryptionAlgorithm_keyWrapAlgorithm__onceToken_8,  &__block_literal_global_10_0);
  }
  if (v8)
  {
    v19 = (void *)initWithCertificate_keyEncryptionAlgorithm_keyWrapAlgorithm__sAllowedECEncAlgs;
    [v8 OIDString];
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v19) = [v19 containsObject:v20];

    if ((_DWORD)v19)
    {
      keyEncryptionAlgorithm = (MSOID *)v8;
      if (!v9) {
        goto LABEL_31;
      }
      goto LABEL_32;
    }

    if (MS_DEFAULT_LOG_BLOCK != -1) {
      dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_12);
    }
    v29 = (void *)MS_DEFAULT_LOG_INTERNAL;
    if (os_log_type_enabled((os_log_t)MS_DEFAULT_LOG_INTERNAL, OS_LOG_TYPE_DEFAULT))
    {
      v30 = v29;
      [v8 OIDString];
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v31;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = 3LL;
      _os_log_impl( &dword_1810EE000,  v30,  OS_LOG_TYPE_DEFAULT,  "MSCMSRecipientInfo init encryption algorithm %@ not permitted for certificate key type %ld",  buf,  0x16u);
    }
  }

  [(id)initWithCertificate_keyEncryptionAlgorithm_keyWrapAlgorithm__sAllowedECEncAlgs allObjects];
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  [v32 objectAtIndex:0];
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  keyEncryptionAlgorithm = -[MSOID initWithString:error:]( objc_alloc(&OBJC_CLASS___MSOID),  "initWithString:error:",  v33,  0LL);
  if (!v9)
  {
LABEL_31:
    +[MSOID OIDWithString:error:](&OBJC_CLASS___MSOID, "OIDWithString:error:", @"2.16.840.1.101.3.4.1.45", 0LL);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }

void __82__MSCMSRecipientInfo_initWithCertificate_keyEncryptionAlgorithm_keyWrapAlgorithm___block_invoke()
{
  v4[1] = *MEMORY[0x1895F89C0];
  v0 = (void *)MEMORY[0x189604010];
  v4[0] = @"1.2.840.113549.1.1.1";
  [MEMORY[0x189603F18] arrayWithObjects:v4 count:1];
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [v0 setWithArray:v1];
  v3 = (void *)initWithCertificate_keyEncryptionAlgorithm_keyWrapAlgorithm__sAllowedRSAEncAlgs;
  initWithCertificate_keyEncryptionAlgorithm_keyWrapAlgorithm__sAllowedRSAEncAlgs = v2;
}

void __82__MSCMSRecipientInfo_initWithCertificate_keyEncryptionAlgorithm_keyWrapAlgorithm___block_invoke_2()
{
  os_log_t v0 = os_log_create("com.apple.MessageSecurity", "default");
  v1 = (void *)MS_DEFAULT_LOG_INTERNAL;
  MS_DEFAULT_LOG_INTERNAL = (uint64_t)v0;
}

void __82__MSCMSRecipientInfo_initWithCertificate_keyEncryptionAlgorithm_keyWrapAlgorithm___block_invoke_9()
{
  v4[1] = *MEMORY[0x1895F89C0];
  os_log_t v0 = (void *)MEMORY[0x189604010];
  v4[0] = @"1.3.133.16.840.63.0.2";
  [MEMORY[0x189603F18] arrayWithObjects:v4 count:1];
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [v0 setWithArray:v1];
  v3 = (void *)initWithCertificate_keyEncryptionAlgorithm_keyWrapAlgorithm__sAllowedECEncAlgs;
  initWithCertificate_keyEncryptionAlgorithm_keyWrapAlgorithm__sAllowedECEncAlgs = v2;
}

void __82__MSCMSRecipientInfo_initWithCertificate_keyEncryptionAlgorithm_keyWrapAlgorithm___block_invoke_2_11()
{
  os_log_t v0 = os_log_create("com.apple.MessageSecurity", "default");
  v1 = (void *)MS_DEFAULT_LOG_INTERNAL;
  MS_DEFAULT_LOG_INTERNAL = (uint64_t)v0;
}

void __82__MSCMSRecipientInfo_initWithCertificate_keyEncryptionAlgorithm_keyWrapAlgorithm___block_invoke_22()
{
  os_log_t v0 = os_log_create("com.apple.MessageSecurity", "default");
  v1 = (void *)MS_DEFAULT_LOG_INTERNAL;
  MS_DEFAULT_LOG_INTERNAL = (uint64_t)v0;
}

- (MSCMSRecipientInfo)initWithEmail:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MSCMSRecipientInfo;
  v5 = -[MSCMSRecipientInfo init](&v7, sel_init);
  if (v5) {
    v5 = -[MSCMSRecipientInfo initWithCertificate:]( v5,  "initWithCertificate:",  findCertificateByEmailAddress(v4, 0LL, 0LL));
  }

  return v5;
}

- (MSCMSRecipientInfo)initWithEmail:(id)a3 algorithmCapabilities:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  findBestMutuallySupportedKeyEncryptionAlgorithm(v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  id v9 = -[MSCMSRecipientInfo initWithEmail:keyEncryptionAlgorithm:]( self,  "initWithEmail:keyEncryptionAlgorithm:",  v7,  v8);

  v10 = v9;
  v11 = v10;
  if (v10) {
    -[MSCMSRecipientInfo setAlgorithmCapabilities:](v10, "setAlgorithmCapabilities:", v6);
  }

  return v11;
}

- (MSCMSRecipientInfo)initWithEmail:(id)a3 keyEncryptionAlgorithm:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MSCMSRecipientInfo;

  return 0LL;
}

- (BOOL)encodeKeyTransRecipientInfo:(id)a3 recipientInfo:(RecipientInfo *)a4 error:(id *)a5
{
  id v8 = a3;
  if (a5 && *a5) {
    id v9 = (id)[*a5 copy];
  }
  else {
    id v9 = 0LL;
  }
  v10 = -[MSAlgorithmIdentifier algorithm](self->_keyEncryptionAlgorithm, "algorithm");
  int v11 = [v10 isEqualToString:@"1.2.840.113549.1.1.1"];

  if (!v11)
  {
    id v19 = 0LL;
    v15 = 0LL;
    v18 = 0LL;
    BOOL v12 = 0;
    goto LABEL_14;
  }

  BOOL v12 = a4 != 0LL;
  if (!a4)
  {
    uint64_t v30 = +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  MSErrorAllocationDomain[0],  -50LL,  v9,  @"Unable to encode RecipientInfo: missing destination address");

    id v19 = 0LL;
    v15 = 0LL;
    v18 = 0LL;
    id v9 = (id)v30;
    if (!a5) {
      goto LABEL_14;
    }
    goto LABEL_12;
  }

  *(_OWORD *)&a4->var1.var1.var3.var0.components = 0u;
  a4->var1.var1.var4 = 0u;
  a4->var1.var1.var1.var1.var2.unint64_t var1 = 0u;
  *(_OWORD *)&a4->var1.var1.var2 = 0u;
  *(_OWORD *)&a4->var1.var1.var1.var0 = 0u;
  *(_OWORD *)&a4->var1.var1.var1.var1.var2.var0.var0.components = 0u;
  *(_OWORD *)&a4->var0 = 0u;
  a4->var0 = 1;
  id v13 = -[NSArray objectAtIndex:](self->_recipientCertificates, "objectAtIndex:", 0LL);
  v14 = objc_alloc(&OBJC_CLASS___MSCMSIdentifier);
  SecCertificateGetSubjectKeyID();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    a4->var1.var0.var0 = 2;
    [MEMORY[0x189607968] numberWithInteger:2];
    v16 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    version = self->_version;
    self->_version = v16;

    v18 = -[MSCMSIdentifier initWithSkid:](objc_alloc(&OBJC_CLASS___MSCMSIdentifier), "initWithSkid:", v15);
  }

  else
  {
    a4->var1.var0.var0 = 0;
    [MEMORY[0x189607968] numberWithInteger:0];
    v20 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v21 = self->_version;
    self->_version = v20;

    id v31 = v8;
    CFDataRef v22 = SecCertificateCopySerialNumberData(v13, 0LL);
    v23 = (void *)SecCertificateCopyIssuerSequence();
    v18 = -[MSCMSIdentifier initWithIssuerName:serialNumber:]( objc_alloc(&OBJC_CLASS___MSCMSIdentifier),  "initWithIssuerName:serialNumber:",  v23,  v22);

    v14 = (MSCMSIdentifier *)v22;
    id v8 = v31;
  }

  id v32 = v9;
  v24 = -[MSCMSIdentifier encodeMessageSecurityObject:](v18, "encodeMessageSecurityObject:", &v32);
  id v25 = v32;

  v26 = -[MSAlgorithmIdentifier asn1AlgId](self->_keyEncryptionAlgorithm, "asn1AlgId");
  unint64_t var1 = (unint64_t)v26->var1;
  *(heim_oid *)&a4->var1.var1.var1.var1.var2.var0.var0.components = v26->var0;
  a4->var1.var1.var1.var1.var2.var1.var0 = var1;
  id v28 = v8;
  a4->var1.var0.var3.unint64_t var1 = (void *)[v28 bytes];
  a4->var1.var0.var3.var0 = [v28 length];
  id v19 = v24;
  a4->var1.var1.var1.var1.var0.var0.var0 = [v19 bytes];
  a4->var1.var0.var1.var0 = [v19 length];
  id v9 = v25;
  if (a5)
  {
LABEL_12:
    if (v9)
    {
      id v9 = v9;
      *a5 = v9;
    }
  }

- (BOOL)encodeKeyAgreeRecipientInfo:(id)a3 recipientInfo:(RecipientInfo *)a4 error:(id *)a5
{
  id v8 = a3;
  if (a5 && *a5) {
    id v9 = (id)[*a5 copy];
  }
  else {
    id v9 = 0LL;
  }
  v10 = -[MSAlgorithmIdentifier algorithm](self->_keyEncryptionAlgorithm, "algorithm");
  int v11 = [v10 isEqualToString:@"1.3.133.16.840.63.0.2"];

  if (!v11)
  {
    uint64_t v17 = 0LL;
    id v18 = 0LL;
    CFDataRef v19 = 0LL;
    v20 = 0LL;
    a4 = 0LL;
    v16 = 0LL;
    BOOL v21 = 0;
    goto LABEL_20;
  }

  BOOL v31 = a4 != 0LL;
  id v32 = v8;
  if (a4)
  {
    *(_OWORD *)&a4->var1.var1.var3.var0.components = 0u;
    a4->var1.var1.var4 = 0u;
    a4->var1.var1.var1.var1.var2.unint64_t var1 = 0u;
    *(_OWORD *)&a4->var1.var1.var2 = 0u;
    *(_OWORD *)&a4->var1.var1.var1.var0 = 0u;
    *(_OWORD *)&a4->var1.var1.var1.var1.var2.var0.var0.components = 0u;
    *(_OWORD *)&a4->var0 = 0u;
    a4->var0 = 2;
    a4->var1.var0.var0 = 3;
    originator = self->_originator;
    originatorIdentity = self->_originatorIdentity;
    if (originatorIdentity)
    {
      if (originator)
      {
        self->_originator = 0LL;
        CFRelease(originator);
        originatorIdentity = self->_originatorIdentity;
      }

      id v34 = v9;
      originator = MSSecIdentityCopyCertificateWithError(originatorIdentity, &v34);
      id v14 = v34;

      self->_originator = originator;
      id v9 = v14;
    }

    if (originator)
    {
      a4->var1.var1.var1.var0 = 1;
      v15 = (void *)SecCertificateCopyIssuerSequence();
      a4->var1.var1.var1.var1.var0.var0.var0 = [v15 length];
      uint64_t v30 = v15;
      a4->var1.var0.var2.var0.length = -[RecipientInfo bytes](v30, "bytes");
      v16 = SecCertificateCopySerialNumberData(self->_originator, 0LL);
      a4->var1.var1.var1.var1.var2.var1.var0 = -[__CFData bytes](v16, "bytes");
      a4->var1.var1.var1.var1.var0.var1.var0 = -[__CFData length](v16, "length");
      a4->var1.var1.var1.var1.var0.var1.var2 = 0;
    }

    else
    {
      uint64_t v30 = 0LL;
      v16 = 0LL;
    }

    a4->var1.var0.var3.unint64_t var1 = malloc(0x10uLL);
    *(void *)a4->var1.var0.var3.unint64_t var1 = -[NSData length](self->_userKeyingMaterial, "length");
    *((void *)a4->var1.var0.var3.var1 + 1) = -[NSData bytes](self->_userKeyingMaterial, "bytes");
    CFDataRef v22 = -[MSAlgorithmIdentifier asn1AlgId](self->_keyEncryptionAlgorithm, "asn1AlgId");
    unint64_t var1 = v22->var1;
    a4->var1.var1.var3.var0 = v22->var0;
    a4->var1.var1.var3.unint64_t var1 = var1;
    a4->var1.var1.var4.var0 = 1;
    v24 = (RecipientEncryptedKey *)malloc(0x20uLL);
    CFDataRef v19 = SecCertificateCopySerialNumberData( (SecCertificateRef)-[NSArray objectAtIndex:](self->_recipientCertificates, "objectAtIndex:", 0LL),  0LL);
    uint64_t v17 = (void *)SecCertificateCopyIssuerSequence();
    v20 = -[MSCMSIdentifier initWithIssuerName:serialNumber:]( objc_alloc(&OBJC_CLASS___MSCMSIdentifier),  "initWithIssuerName:serialNumber:",  v17,  v19);
    id v33 = v9;
    -[MSCMSIdentifier encodeMessageSecurityObject:](v20, "encodeMessageSecurityObject:", &v33);
    id v25 = (void *)objc_claimAutoreleasedReturnValue();
    id v26 = v33;

    id v18 = v25;
    *((void *)v24 + 1) = [v18 bytes];
    *(void *)v24 = [v18 length];
    id v27 = v32;
    *((void *)v24 + 3) = [v27 bytes];
    *((void *)v24 + 2) = [v27 length];
    a4->var1.var1.var4.unint64_t var1 = v24;
    id v9 = v26;
    a4 = v30;
    if (a5) {
      goto LABEL_16;
    }
LABEL_19:
    id v8 = v32;
    BOOL v21 = v31;
    goto LABEL_20;
  }

  uint64_t v28 = +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  MSErrorAllocationDomain[0],  -50LL,  v9,  @"Unable to encode RecipientInfo: missing destination address");

  uint64_t v17 = 0LL;
  id v18 = 0LL;
  CFDataRef v19 = 0LL;
  v20 = 0LL;
  v16 = 0LL;
  id v9 = (id)v28;
  if (!a5) {
    goto LABEL_19;
  }
LABEL_16:
  id v8 = v32;
  BOOL v21 = v31;
  if (v9)
  {
    id v9 = v9;
    *a5 = v9;
  }

- (void)freeKeyTransRecipientInfo:(const RecipientInfo *)a3
{
}

- (BOOL)encodeRecipientInfo:(id)a3 recipientInfo:(RecipientInfo *)a4 error:(id *)a5
{
  id v8 = a3;
  -[MSAlgorithmIdentifier algorithm](self->_keyEncryptionAlgorithm, "algorithm");
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  int v10 = [v9 isEqualToString:@"1.2.840.113549.1.1.1"];

  if (v10)
  {
    BOOL v11 = -[MSCMSRecipientInfo encodeKeyTransRecipientInfo:recipientInfo:error:]( self,  "encodeKeyTransRecipientInfo:recipientInfo:error:",  v8,  a4,  a5);
  }

  else
  {
    -[MSAlgorithmIdentifier algorithm](self->_keyEncryptionAlgorithm, "algorithm");
    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue();
    int v13 = [v12 isEqualToString:@"1.3.133.16.840.63.0.2"];

    if (!v13)
    {
      BOOL v14 = 0;
      goto LABEL_7;
    }

    BOOL v11 = -[MSCMSRecipientInfo encodeKeyAgreeRecipientInfo:recipientInfo:error:]( self,  "encodeKeyAgreeRecipientInfo:recipientInfo:error:",  v8,  a4,  a5);
  }

  BOOL v14 = v11;
LABEL_7:

  return v14;
}

- (void)freeRecipientInfo:(const RecipientInfo *)a3
{
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue();
  int v6 = [v5 isEqualToString:@"1.3.133.16.840.63.0.2"];

  if (v6) {
    -[MSCMSRecipientInfo freeKeyTransRecipientInfo:](self, "freeKeyTransRecipientInfo:", a3);
  }
}

- (id)encryptBulkKey:(id)a3
{
  id v4 = (const __CFData *)a3;
  uint64_t v52 = 0LL;
  iv = 0LL;
  CCCryptorRef cryptorRef = 0LL;
  -[MSAlgorithmIdentifier algorithm](self->_keyEncryptionAlgorithm, "algorithm");
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue();
  int v6 = [v5 isEqualToString:@"1.2.840.113549.1.1.1"];

  if (v6)
  {
    recipientCertificates = self->_recipientCertificates;
    if (recipientCertificates)
    {
      if (-[NSArray count](recipientCertificates, "count"))
      {
        id v8 = SecCertificateCopyKey((SecCertificateRef)-[NSArray objectAtIndex:]( self->_recipientCertificates,  "objectAtIndex:",  0LL));
        if (v8)
        {
          CFDataRef EncryptedData = SecKeyCreateEncryptedData(v8, (SecKeyAlgorithm)*MEMORY[0x18960BCC8], v4, 0LL);
          int v10 = 0LL;
          goto LABEL_22;
        }
      }
    }

    goto LABEL_20;
  }

  -[MSAlgorithmIdentifier algorithm](self->_keyEncryptionAlgorithm, "algorithm");
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue();
  int v12 = [v11 isEqualToString:@"1.3.133.16.840.63.0.2"];

  if (!v12
    || (int v13 = objc_alloc(&OBJC_CLASS___MSAlgorithmIdentifier),
        -[MSAlgorithmIdentifier parameters](self->_keyEncryptionAlgorithm, "parameters"),
        BOOL v14 = (void *)objc_claimAutoreleasedReturnValue(),
        -[MSAlgorithmIdentifier decode:error:](v13, "decode:error:", v14, 0LL),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        v14,
        v13,
        !v15))
  {
LABEL_20:
    int v10 = 0LL;
    goto LABEL_21;
  }

  [v15 parameters];
  id v16 = (id)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    [v15 parameters];
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    id v16 = v17;
    if (!v17
      || ![v17 length]
      || (size_t dataOutMoved = 0LL,
          id v16 = v16,
          [v16 bytes],
          [v16 length],
          der_get_octet_string_ber(),
          [v16 length]))
    {
      int v10 = 0LL;
LABEL_36:
      id v18 = 0LL;
LABEL_37:
      CFDataRef EncryptedData = 0LL;
      goto LABEL_34;
    }

    int v10 = 0LL;
    id v18 = 0LL;
    if (v52 != [v15 blockSize:0])
    {
LABEL_19:

LABEL_21:
      CFDataRef EncryptedData = 0LL;
      goto LABEL_22;
    }
  }

  int v10 = -[MSCMSRecipientInfo keyEncryptionKey:forEncryption:secCMSCompatibility:]( self,  "keyEncryptionKey:forEncryption:secCMSCompatibility:",  v15,  1LL,  0LL);
  if (!v10) {
    goto LABEL_36;
  }
  [v15 algorithm];
  CFDataRef v19 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v19 isEqualToString:@"2.16.840.1.101.3.4.1.5"])
  {
LABEL_17:

    goto LABEL_18;
  }

  [v15 algorithm];
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v20 isEqualToString:@"2.16.840.1.101.3.4.1.25"])
  {

    goto LABEL_17;
  }

  [v15 algorithm];
  id v33 = (void *)objc_claimAutoreleasedReturnValue();
  char v34 = [v33 isEqualToString:@"2.16.840.1.101.3.4.1.45"];

  if ((v34 & 1) != 0)
  {
LABEL_18:
    objc_msgSend( MEMORY[0x189603FB8],  "dataWithLength:",  CCSymmetricWrappedSize(objc_msgSend(v15, "ccAlgorithm:", 0), -[__CFData length](v4, "length")));
    BOOL v21 = (void *)objc_claimAutoreleasedReturnValue();
    size_t dataOutMoved = [v21 length];
    CCWrappingAlgorithm algorithm = [v15 ccAlgorithm:0];
    v47 = (const uint8_t *)*MEMORY[0x1895F8330];
    size_t v46 = *MEMORY[0x1895F8338];
    CFDataRef v22 = v15;
    BytePtr = CFDataGetBytePtr(v10);
    id v24 = v16;
    CFIndex Length = CFDataGetLength(v10);
    id v26 = v4;
    id v27 = (const uint8_t *)-[__CFData bytes](v26, "bytes");
    size_t v28 = -[__CFData length](v26, "length");
    id v18 = v21;
    v29 = (uint8_t *)[v18 mutableBytes];
    uint64_t v30 = BytePtr;
    v15 = v22;
    size_t v31 = Length;
    id v16 = v24;
    LODWORD(v28) = CCSymmetricKeyWrap(algorithm, v47, v46, v30, v31, v27, v28, v29, &dataOutMoved);
    [v18 setLength:dataOutMoved];
    if ((_DWORD)v28) {
      goto LABEL_19;
    }
    goto LABEL_33;
  }

  CCAlgorithm v35 = [v15 ccAlgorithm:0];
  v36 = CFDataGetBytePtr(v10);
  size_t v37 = CFDataGetLength(v10);
  if (CCCryptorCreate(0, v35, 1u, v36, v37, iv, &cryptorRef)) {
    goto LABEL_36;
  }
  id v38 = v16;
  int v39 = v4;
  OutputCFIndex Length = CCCryptorGetOutputLength(cryptorRef, -[__CFData length](v39, "length"), 1);
  [MEMORY[0x189603FB8] dataWithLength:OutputLength];
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  if (!v18
    || (size_t dataOutMoved = 0LL,
        uint64_t v41 = cryptorRef,
        int v39 = v39,
        v42 = (const void *)-[__CFData bytes](v39, "bytes"),
        size_t v43 = -[__CFData length](v39, "length"),
        id v18 = v18,
        CCCryptorUpdate(v41, v42, v43, (void *)[v18 mutableBytes], OutputLength, &dataOutMoved)))
  {

    CFDataRef EncryptedData = 0LL;
    id v16 = v38;
    goto LABEL_34;
  }

  size_t v49 = 0LL;
  v44 = cryptorRef;
  id v18 = v18;
  uint64_t v45 = [v18 mutableBytes];
  id v16 = v38;
  if (CCCryptorFinal(v44, (void *)(v45 + dataOutMoved), OutputLength - dataOutMoved, &v49))
  {

    goto LABEL_37;
  }

  [v18 setLength:v49 + dataOutMoved];

LABEL_33:
  id v18 = v18;
  CFDataRef EncryptedData = (CFDataRef)v18;
LABEL_34:

LABEL_22:
  der_free_octet_string();
  if (cryptorRef) {
    CCCryptorRelease(cryptorRef);
  }
  if (v10) {
    CFRelease(v10);
  }

  return EncryptedData;
}

+ (id)decodeKeyTransRecipientInfo:(RecipientInfo *)a3 certificates:(id)a4 LAContext:(id)a5 error:(id *)a6
{
  id v9 = a4;
  id v10 = a5;
  if (a6 && *a6) {
    id v11 = (id)[*a6 copy];
  }
  else {
    id v11 = 0LL;
  }
  if (a3->var0 != 1)
  {
    id v24 = 0LL;
    goto LABEL_29;
  }

  id v31 = v11;
  +[MSCMSIdentifier decodeIdentifier:error:]( &OBJC_CLASS___MSCMSIdentifier,  "decodeIdentifier:error:",  &a3->var1.var1.var1,  &v31);
  int v12 = (void *)objc_claimAutoreleasedReturnValue();
  id v13 = v31;

  id v26 = v10;
  id v27 = v9;
  if (v12)
  {
    [MEMORY[0x189607968] numberWithInt:a3->var1.var0.var0];
    BOOL v14 = (void *)objc_claimAutoreleasedReturnValue();
    int v15 = [v12 type];
    if (v15 == 1)
    {
      if (![v14 intValue])
      {
LABEL_10:
        id v30 = v13;
        CertificateForIdentifier = (__SecCertificate *)findCertificateForIdentifier( (uint64_t)&a3->var1.var0.var1,  v9,  v10,  &v30);
        id v17 = v30;

        if (CertificateForIdentifier)
        {
          if ([v12 type] == 1
            && SecCertificateVersion() == 3
            && getKeyTypeForCertificate(CertificateForIdentifier) == 1
            && (SecCertificateGetKeyUsage() & 4) == 0)
          {
            if (MS_DEFAULT_LOG_BLOCK != -1) {
              dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_33);
            }
            id v18 = (os_log_s *)MS_DEFAULT_LOG_INTERNAL;
            if (os_log_type_enabled((os_log_t)MS_DEFAULT_LOG_INTERNAL, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl( &dword_1810EE000,  v18,  OS_LOG_TYPE_DEFAULT,  "recipientInfo violates RFC 5652 (key usage)",  buf,  2u);
            }
          }

          id v28 = v17;
          +[MSAlgorithmIdentifier algorithmIdentifierWithAsn1AlgId:error:]( &OBJC_CLASS___MSAlgorithmIdentifier,  "algorithmIdentifierWithAsn1AlgId:error:",  &a3->var1.var1.var1.var1.var2.var0.var0.components,  &v28);
          CFDataRef v19 = (void *)objc_claimAutoreleasedReturnValue();
          id v11 = v28;

          NSDataFromOctetString(&a3->var1.var0.var3.var0);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          BOOL v21 = objc_alloc(&OBJC_CLASS___MSCMSRecipientInfo);
          CFDataRef v22 = v21;
          if (v21)
          {
            -[MSCMSRecipientInfo setVersion:](v21, "setVersion:", v14);
            id v23 = objc_alloc_init(MEMORY[0x189603FA8]);
            [v23 addObject:CertificateForIdentifier];

            -[MSCMSRecipientInfo setRecipientCertificates:](v22, "setRecipientCertificates:", v23);
            -[MSCMSRecipientInfo setKeyEncryptionAlgorithm:](v22, "setKeyEncryptionAlgorithm:", v19);
            CertificateForIdentifier = (__SecCertificate *)objc_alloc_init(MEMORY[0x189603FA8]);
            -[__SecCertificate addObject:](CertificateForIdentifier, "addObject:", v20);
            -[MSCMSRecipientInfo setEncryptedKeys:](v22, "setEncryptedKeys:", CertificateForIdentifier);
          }

          else
          {
            id v23 = 0LL;
            CertificateForIdentifier = 0LL;
          }

          goto LABEL_25;
        }

        +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  MSErrorCMSDomain[0],  -26275LL,  v17,  @"unable to find a certificate matching the recipient");
        id v11 = (id)objc_claimAutoreleasedReturnValue();

        id v23 = 0LL;
        CFDataRef v19 = 0LL;
        v20 = 0LL;
        goto LABEL_24;
      }
    }

    else if (v15 == 2 && [v14 intValue] == 2)
    {
      goto LABEL_10;
    }

    +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  MSErrorCMSDomain[0],  -26275LL,  v13,  @"decode failed for recipientInfo due to RFC 5652 violation (version)");
    id v11 = (id)objc_claimAutoreleasedReturnValue();

    id v23 = 0LL;
    CFDataRef v19 = 0LL;
    v20 = 0LL;
    CertificateForIdentifier = 0LL;
LABEL_24:
    CFDataRef v22 = 0LL;
    goto LABEL_25;
  }

  BOOL v14 = 0LL;
  id v23 = 0LL;
  CFDataRef v19 = 0LL;
  v20 = 0LL;
  CertificateForIdentifier = 0LL;
  CFDataRef v22 = 0LL;
  id v11 = v13;
LABEL_25:
  if (a6 && v11) {
    *a6 = v11;
  }
  id v24 = v22;

  id v10 = v26;
  id v9 = v27;
LABEL_29:

  return v24;
}

void __79__MSCMSRecipientInfo_decodeKeyTransRecipientInfo_certificates_LAContext_error___block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.MessageSecurity", "default");
  v1 = (void *)MS_DEFAULT_LOG_INTERNAL;
  MS_DEFAULT_LOG_INTERNAL = (uint64_t)v0;
}

+ (id)decodeKeyAgreeRecipientInfo:(RecipientInfo *)a3 certificates:(id)a4 LAContext:(id)a5 error:(id *)a6
{
  id v53 = a4;
  id v9 = a5;
  if (a6 && *a6) {
    id v10 = (id)[*a6 copy];
  }
  else {
    id v10 = 0LL;
  }
  if (a3->var0 == 2)
  {
    __int128 v11 = *(_OWORD *)&a3->var1.var0.var0;
    __int128 v12 = *(_OWORD *)&a3->var1.var1.var1.var1.var2.var1.var1;
    __int128 v13 = *(_OWORD *)&a3->var1.var1.var3.var1;
    heim_oid var0 = a3->var1.var1.var3.var0;
    __int128 v64 = v13;
    unint64_t var1 = a3->var1.var1.var4.var1;
    heim_base_data v14 = a3->var1.var1.var1.var1.var0.var0;
    __int128 v59 = v11;
    heim_base_data v60 = v14;
    __int128 v61 = *(_OWORD *)&a3->var1.var1.var1.var1.var2.var0.var1;
    __int128 v62 = v12;
    if ((_DWORD)v11 != 3)
    {
      uint64_t v41 = +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  MSErrorCMSDomain[0],  -26275LL,  v10,  @"decode failed for recipientInfo due to RFC 5652 violation (version)");

      id v38 = 0LL;
      id v33 = 0LL;
      id v30 = 0LL;
      v29 = 0LL;
      uint64_t v52 = 0LL;
      BOOL v21 = 0LL;
      int v15 = 0LL;
      id v10 = (id)v41;
      id v26 = 0LL;
      if (!a6) {
        goto LABEL_39;
      }
      goto LABEL_37;
    }

    [MEMORY[0x189607968] numberWithInt:3];
    int v15 = (void *)objc_claimAutoreleasedReturnValue();
    switch(DWORD2(v59))
    {
      case 3:
        uint64_t v22 = NSDataFromBitString((void *)&v61 + 1);
        id v56 = v10;
        +[MSOID OIDWithAsn1OID:error:](&OBJC_CLASS___MSOID, "OIDWithAsn1OID:error:", &v60, &v56);
        id v23 = (void *)objc_claimAutoreleasedReturnValue();
        id v20 = v56;

        if (v22 && v23)
        {
          [v23 OIDString];
          id v24 = (void *)objc_claimAutoreleasedReturnValue();
          char v25 = [v24 isEqualToString:@"1.2.840.10045.2.1"];

          if ((v25 & 1) != 0)
          {
            CFDataRef v19 = 0LL;
            BOOL v21 = (void *)v22;
LABEL_18:
            NSDataFromOctetString(*((void **)&v62 + 1));
            id v26 = (void *)objc_claimAutoreleasedReturnValue();
            id v55 = v20;
            uint64_t v27 = +[MSAlgorithmIdentifier algorithmIdentifierWithAsn1AlgId:error:]( &OBJC_CLASS___MSAlgorithmIdentifier,  "algorithmIdentifierWithAsn1AlgId:error:",  &var0,  &v55);
            id v10 = v55;

            CFTypeRef cf = v19;
            uint64_t v52 = (void *)v27;
            if (v27)
            {
              id v28 = objc_alloc(&OBJC_CLASS___MSCMSRecipientInfo);
              v29 = v28;
              if (v28)
              {
                id v48 = v15;
                size_t v49 = a6;
                -[MSCMSRecipientInfo setVersion:](v28, "setVersion:", v15);
                -[MSCMSRecipientInfo setOriginator:](v29, "setOriginator:", v19);
                v47 = v21;
                -[MSCMSRecipientInfo setOriginatorPubKey:](v29, "setOriginatorPubKey:", v21);
                int v50 = v26;
                -[MSCMSRecipientInfo setUserKeyingMaterial:](v29, "setUserKeyingMaterial:", v26);
                size_t v46 = v29;
                -[MSCMSRecipientInfo setKeyEncryptionAlgorithm:](v29, "setKeyEncryptionAlgorithm:", v27);
                v29 = (MSCMSRecipientInfo *)objc_alloc_init(MEMORY[0x189603FA8]);
                id v30 = objc_alloc_init(MEMORY[0x189603FA8]);
                if (DWORD2(v64))
                {
                  uint64_t v31 = 0LL;
                  unint64_t v32 = 0LL;
                  id v33 = 0LL;
                  char v34 = v10;
                  do
                  {
                    CCAlgorithm v35 = (char *)var1 + v31;
                    id v54 = v34;
                    CertificateForIdentifier = (void *)findCertificateForIdentifier((uint64_t)var1 + v31, v53, v9, &v54);
                    id v10 = v54;

                    if (CertificateForIdentifier)
                    {
                      -[MSCMSRecipientInfo addObject:](v29, "addObject:", CertificateForIdentifier);

                      uint64_t v37 = NSDataFromOctetString((void *)v35 + 2);

                      [v30 addObject:v37];
                      id v33 = (void *)v37;
                    }

                    ++v32;
                    v31 += 32LL;
                    char v34 = v10;
                  }

                  while (v32 < DWORD2(v64));
                }

                else
                {
                  id v33 = 0LL;
                }

                if (-[MSCMSRecipientInfo count](v29, "count"))
                {
                  id v38 = v46;
                  -[MSCMSRecipientInfo setRecipientCertificates:](v46, "setRecipientCertificates:", v29);
                  uint64_t v39 = -[MSCMSRecipientInfo count](v29, "count");
                  int v15 = v48;
                  a6 = v49;
                  BOOL v21 = v47;
                  if (v39 == [v30 count])
                  {
                    -[MSCMSRecipientInfo setEncryptedKeys:](v46, "setEncryptedKeys:", v30);
                  }

                  else
                  {
                    uint64_t v45 = +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  MSErrorCMSDomain[0],  -26275LL,  v10,  @"decode failed for recipientInfo (rid vs encryptedKey count)");

                    id v10 = (id)v45;
                  }
                }

                else
                {
                  uint64_t v44 = +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  MSErrorCMSDomain[0],  -26275LL,  v10,  @"decode failed for recipientInfo (rid)");

                  id v10 = (id)v44;
                  int v15 = v48;
                  a6 = v49;
                  id v38 = v46;
                  BOOL v21 = v47;
                }

                id v26 = v50;
LABEL_31:
                if (cf)
                {
                  CFRelease(cf);
                  if (!a6) {
                    goto LABEL_39;
                  }
                  goto LABEL_37;
                }

+ (id)decodeRecipientInfo:(RecipientInfo *)a3 certificates:(id)a4 LAContext:(id)a5 error:(id *)a6
{
  id v9 = a4;
  id v10 = a5;
  if (a3->var0 == 2)
  {
    uint64_t v11 = +[MSCMSRecipientInfo decodeKeyAgreeRecipientInfo:certificates:LAContext:error:]( &OBJC_CLASS___MSCMSRecipientInfo,  "decodeKeyAgreeRecipientInfo:certificates:LAContext:error:",  a3,  v9,  v10,  a6);
  }

  else
  {
    if (a3->var0 != 1)
    {
      __int128 v12 = 0LL;
      goto LABEL_7;
    }

    uint64_t v11 = +[MSCMSRecipientInfo decodeKeyTransRecipientInfo:certificates:LAContext:error:]( &OBJC_CLASS___MSCMSRecipientInfo,  "decodeKeyTransRecipientInfo:certificates:LAContext:error:",  a3,  v9,  v10,  a6);
  }

  __int128 v12 = (void *)v11;
LABEL_7:

  return v12;
}

- (__SecCertificate)recipientCertificate
{
  result = -[NSArray count](self->_recipientCertificates, "count");
  if (result) {
    return (__SecCertificate *)-[NSArray objectAtIndex:](self->_recipientCertificates, "objectAtIndex:", 0LL);
  }
  return result;
}

- (__CFData)createSecCMSSharedInfo:(id)a3
{
  uint64_t v13 = 4LL;
  heim_base_data v14 = v11;
  v10[0] = -[NSData length](self->_userKeyingMaterial, "length");
  v10[1] = -[NSData bytes](self->_userKeyingMaterial, "bytes");
  __int128 v12 = v10;
  [MEMORY[0x189603FB8] dataWithLength:length_SecCMS_ECC_CMS_SharedInfo()];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_super v5 = v4;
  if (!v4
    || (id v6 = v4, [v6 bytes], encode_SecCMS_ECC_CMS_SharedInfo()))
  {
    id v8 = 0LL;
  }

  else
  {
    id v7 = v6;
    id v8 = CFDataCreate(0, (const UInt8 *)[v7 bytes], objc_msgSend(v7, "length"));
  }

  return v8;
}

- (__CFData)createSharedInfo:(id)a3
{
  CFDataRef v19 = 0LL;
  NSUInteger v15 = 0LL;
  id v16 = 0LL;
  id v4 = a3;
  uint64_t v5 = [v4 asn1AlgId];
  uint64_t v6 = *(void *)(v5 + 16);
  __int128 v17 = *(_OWORD *)v5;
  uint64_t v18 = v6;
  int v7 = [v4 keySize:0];

  uint32ToNetworkByteOrder((8 * v7), (uint64_t)v14, 4LL);
  uint64_t v20 = 4LL;
  BOOL v21 = v14;
  if (-[NSData length](self->_userKeyingMaterial, "length"))
  {
    NSUInteger v15 = -[NSData length](self->_userKeyingMaterial, "length");
    id v16 = -[NSData bytes](self->_userKeyingMaterial, "bytes");
    CFDataRef v19 = &v15;
  }

  [MEMORY[0x189603FB8] dataWithLength:length_ECC_CMS_SharedInfo()];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  id v9 = v8;
  if (!v8
    || (id v10 = v8, objc_msgSend(v10, "bytes", 0), encode_ECC_CMS_SharedInfo()))
  {
    __int128 v12 = 0LL;
  }

  else
  {
    id v11 = v10;
    __int128 v12 = CFDataCreate(0, (const UInt8 *)[v11 bytes], objc_msgSend(v11, "length"));
  }

  return v12;
}

- (__CFData)keyEncryptionKey:(id)a3 forEncryption:(BOOL)a4 secCMSCompatibility:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  keys[3] = *(void **)MEMORY[0x1895F89C0];
  id v8 = a3;
  SecKeyRef privateKeyRef = 0LL;
  if (!v6)
  {
    recipientCertificates = self->_recipientCertificates;
    if (!recipientCertificates || !-[NSArray count](recipientCertificates, "count")) {
      goto LABEL_58;
    }
    IdentityByCertificate = (__SecIdentity *)findIdentityByCertificate( (__SecCertificate *)-[NSArray objectAtIndex:]( self->_recipientCertificates,  "objectAtIndex:",  0LL),  0LL,  0LL);
    originatorPubKey = self->_originatorPubKey;
    if (!originatorPubKey)
    {
LABEL_55:
      CFNumberRef v16 = 0LL;
      goto LABEL_56;
    }

    uint64_t v13 = -[NSData length](originatorPubKey, "length");
    CFIndex v14 = v13;
    uint64_t valuePtr = 8 * v13;
    if (v13 > 382)
    {
    }

    else if (((unint64_t)(v13 - 223) > 0x21 || ((1LL << (v13 + 33)) & 0x300000003LL) == 0) {
           && (unint64_t)(v13 - 191) >= 2)
    }
    {
LABEL_16:
      CFNumberRef v15 = CFNumberCreate(0LL, kCFNumberSInt64Type, &valuePtr);
      CFNumberRef v16 = v15;
      if (v15)
      {
        __int128 v17 = (void *)*MEMORY[0x18960B968];
        keys[0] = *(void **)MEMORY[0x18960B998];
        keys[1] = v17;
        keys[2] = *(void **)MEMORY[0x18960B988];
        uint64_t v18 = (void *)*MEMORY[0x18960B980];
        values[0] = *(void **)MEMORY[0x18960B9B0];
        values[1] = v18;
        values[2] = v15;
        CFDictionaryRef v19 = CFDictionaryCreate( 0LL,  (const void **)keys,  (const void **)values,  3LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
        if (v19)
        {
          uint64_t v20 = v19;
          BOOL v21 = CFDataCreate(0LL, (const UInt8 *)-[NSData bytes](self->_originatorPubKey, "bytes"), v14);
          uint64_t v22 = SecKeyCreateWithData(v21, v20, 0LL);
          goto LABEL_24;
        }
      }

- (id)decryptWrappedKey:(id)a3 kek:(id)a4 iv:(heim_base_data *)a5
{
  id v8 = a3;
  id v9 = a4;
  -[NSArray objectAtIndex:](self->_encryptedKeys, "objectAtIndex:", 0LL);
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  CCCryptorRef cryptorRef = 0LL;
  [v8 algorithm];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v11 isEqualToString:@"2.16.840.1.101.3.4.1.5"]) {
    goto LABEL_4;
  }
  [v8 algorithm];
  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v12 isEqualToString:@"2.16.840.1.101.3.4.1.25"])
  {

LABEL_4:
LABEL_5:
    size_t dataOutMoved = CCSymmetricUnwrappedSize([v8 ccAlgorithm:0], objc_msgSend(v10, "length"));
    [MEMORY[0x189603FB8] dataWithLength:dataOutMoved];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    id v41 = v8;
    CCWrappingAlgorithm v14 = [v8 ccAlgorithm:0];
    CFNumberRef v15 = (const uint8_t *)*MEMORY[0x1895F8330];
    size_t v16 = *MEMORY[0x1895F8338];
    id v17 = v9;
    id v18 = v9;
    CFDictionaryRef v19 = (const uint8_t *)[v18 bytes];
    size_t v20 = [v18 length];
    BOOL v21 = v10;
    id v22 = v10;
    id v23 = (const uint8_t *)[v22 bytes];
    size_t v24 = [v22 length];
    id v25 = v13;
    if (!CCSymmetricKeyUnwrap( v14,  v15,  v16,  v19,  v20,  v23,  v24,  (uint8_t *)[v25 mutableBytes],  &dataOutMoved))
    {
      [v25 setLength:dataOutMoved];
      id v9 = v17;
      id v10 = v21;
      id v8 = v41;
LABEL_7:
      [MEMORY[0x189603F48] dataWithData:v25];
      id v26 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }

    id v26 = 0LL;
    id v9 = v17;
    id v10 = v21;
    id v8 = v41;
    goto LABEL_8;
  }

  [v8 algorithm];
  CFNumberRef v28 = (void *)objc_claimAutoreleasedReturnValue();
  char v29 = [v28 isEqualToString:@"2.16.840.1.101.3.4.1.45"];

  if ((v29 & 1) != 0) {
    goto LABEL_5;
  }
  id v43 = 0LL;
  CCAlgorithm v30 = [v8 ccAlgorithm:&v43];
  id v31 = v43;
  if (v31
    || (id v32 = v9,
        CCCryptorCreate( 1u,  v30,  1u,  (const void *)[v32 bytes],  objc_msgSend(v32, "length"),  a5->var1,  &cryptorRef)))
  {

    id v26 = 0LL;
    id v25 = 0LL;
  }

  else
  {
    OutputCFIndex Length = CCCryptorGetOutputLength(cryptorRef, [v10 length], 1);
    [MEMORY[0x189603FB8] dataWithLength:OutputLength];
    char v34 = (void *)objc_claimAutoreleasedReturnValue();
    size_t dataOutMoved = 0LL;
    CCAlgorithm v35 = cryptorRef;
    id v36 = v10;
    uint64_t v37 = (const void *)[v36 bytes];
    size_t v38 = [v36 length];
    id v25 = v34;
    if (!CCCryptorUpdate(v35, v37, v38, (void *)[v25 mutableBytes], OutputLength, &dataOutMoved))
    {
      size_t v42 = 0LL;
      uint64_t v39 = cryptorRef;
      id v25 = v25;
      uint64_t v40 = [v25 mutableBytes];
      if (!CCCryptorFinal(v39, (void *)(v40 + dataOutMoved), OutputLength - dataOutMoved, &v42))
      {
        [v25 setLength:v42 + dataOutMoved];
        goto LABEL_7;
      }
    }

    id v26 = 0LL;
  }

- (id)key
{
  return -[MSCMSRecipientInfo key:](self, "key:", 0LL);
}

- (id)key:(BOOL)a3
{
  v26[1] = 0LL;
  SecKeyRef privateKeyRef = 0LL;
  v26[0] = 0LL;
  recipientCertificates = self->_recipientCertificates;
  if (!recipientCertificates
    || (BOOL v5 = a3, !-[NSArray count](recipientCertificates, "count"))
    || (IdentityByCertificate = (__SecIdentity *)findIdentityByCertificate( (__SecCertificate *)-[NSArray objectAtIndex:]( self->_recipientCertificates,  "objectAtIndex:",  0LL),  0LL,  0LL)) == 0LL)
  {
    der_free_octet_string();
    return 0LL;
  }

  int v7 = IdentityByCertificate;
  if (SecIdentityCopyPrivateKey(IdentityByCertificate, &privateKeyRef)) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = privateKeyRef == 0LL;
  }
  if (v8) {
    goto LABEL_23;
  }
  -[MSAlgorithmIdentifier algorithm](self->_keyEncryptionAlgorithm, "algorithm");
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  int v10 = [v9 isEqualToString:@"1.2.840.113549.1.1.1"];

  if (!v10)
  {
    -[MSAlgorithmIdentifier algorithm](self->_keyEncryptionAlgorithm, "algorithm");
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    int v14 = [v13 isEqualToString:@"1.3.133.16.840.63.0.2"];

    if (v14)
    {
      CFNumberRef v15 = objc_alloc(&OBJC_CLASS___MSAlgorithmIdentifier);
      -[MSAlgorithmIdentifier parameters](self->_keyEncryptionAlgorithm, "parameters");
      size_t v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[MSAlgorithmIdentifier decode:error:](v15, "decode:error:", v16, 0LL);
      id v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        [v17 parameters];
        id v18 = (id)objc_claimAutoreleasedReturnValue();
        if (!v18) {
          goto LABEL_19;
        }
        [v17 parameters];
        CFDictionaryRef v19 = (void *)objc_claimAutoreleasedReturnValue();
        [MEMORY[0x189603F48] dataWithBytes:&key__asn1NULL length:2];
        size_t v20 = (void *)objc_claimAutoreleasedReturnValue();
        char v21 = [v19 isEqual:v20];

        if ((v21 & 1) != 0)
        {
          id v18 = 0LL;
          goto LABEL_19;
        }

        [v17 parameters];
        id v22 = (void *)objc_claimAutoreleasedReturnValue();
        id v18 = v22;
        if (!v22
          || ![v22 length]
          || (uint64_t v25 = 0LL,
              id v18 = v18,
              [v18 bytes],
              [v18 length],
              der_get_octet_string_ber(),
              [v18 length]))
        {
          __int128 v12 = 0LL;
          goto LABEL_32;
        }

        if (v26[0] == [v17 blockSize:0])
        {
LABEL_19:
          __int128 v12 = -[MSCMSRecipientInfo keyEncryptionKey:forEncryption:secCMSCompatibility:]( self,  "keyEncryptionKey:forEncryption:secCMSCompatibility:",  v17,  0LL,  v5,  v25);
          if (v12)
          {
            DecryptedData = -[MSCMSRecipientInfo decryptWrappedKey:kek:iv:](self, "decryptWrappedKey:kek:iv:", v17, v12, v26);
LABEL_21:

            goto LABEL_24;
          }

- (void)dealloc
{
  originator = self->_originator;
  if (originator)
  {
    self->_originator = 0LL;
    CFRelease(originator);
  }

  originatorIdentity = self->_originatorIdentity;
  if (originatorIdentity)
  {
    self->_originatorIdentity = 0LL;
    CFRelease(originatorIdentity);
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MSCMSRecipientInfo;
  -[MSCMSRecipientInfo dealloc](&v5, sel_dealloc);
}

- (NSArray)algorithmCapabilities
{
  return (NSArray *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setAlgorithmCapabilities:(id)a3
{
}

- (MSAlgorithmIdentifier)keyEncryptionAlgorithm
{
  return (MSAlgorithmIdentifier *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setKeyEncryptionAlgorithm:(id)a3
{
}

- (void)setRecipientCertificate:(__SecCertificate *)a3
{
  self->_recipientCertificate = a3;
}

- (NSArray)recipientCertificates
{
  return (NSArray *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setRecipientCertificates:(id)a3
{
}

- (__SecCertificate)originator
{
  return self->_originator;
}

- (__SecIdentity)originatorIdentity
{
  return self->_originatorIdentity;
}

- (NSData)originatorPubKey
{
  return (NSData *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setOriginatorPubKey:(id)a3
{
}

- (NSNumber)version
{
  return (NSNumber *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setVersion:(id)a3
{
}

- (NSArray)encryptedKeys
{
  return (NSArray *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setEncryptedKeys:(id)a3
{
}

- (NSData)userKeyingMaterial
{
  return (NSData *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setUserKeyingMaterial:(id)a3
{
}

- (void).cxx_destruct
{
}

@end