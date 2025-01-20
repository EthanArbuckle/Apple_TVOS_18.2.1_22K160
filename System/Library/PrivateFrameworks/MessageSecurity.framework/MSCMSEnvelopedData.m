@interface MSCMSEnvelopedData
+ (id)decodeMessageSecurityObject:(id)a3 options:(id)a4 error:(id *)a5;
+ (id)encodeOriginatorInfoCertificates:(id)a3 error:(id *)a4;
- (BOOL)addRecipient:(id)a3 error:(id *)a4;
- (BOOL)checkDecryptionResult:(id)a3;
- (BOOL)contentChanged;
- (BOOL)encodeEncryptionParameters:(id *)a3;
- (BOOL)legacyASN1Encoding;
- (MSAlgorithmIdentifier)encryptionAlgorithm;
- (MSCMSEnvelopedData)initWithDataContent:(id)a3 recipient:(id)a4;
- (MSCMSEnvelopedData)initWithDataContent:(id)a3 recipient:(id)a4 encryptionAlgorithm:(id)a5;
- (MSCMSEnvelopedData)initWithEmbeddedContent:(id)a3 recipient:(id)a4;
- (MSCMSEnvelopedData)initWithEmbeddedContent:(id)a3 recipient:(id)a4 encryptionAlgorithm:(id)a5;
- (MSCMSMessage)embeddedContent;
- (MSOID)contentType;
- (MSOID)type;
- (NSArray)recipients;
- (NSData)dataContent;
- (NSData)encryptedContent;
- (NSData)encryptionKey;
- (NSMutableArray)originatorCertificates;
- (NSMutableArray)unprotectedAttributes;
- (NSNumber)version;
- (id)bulkEncryptDecrypt:(unsigned int)a3 algorithm:(unsigned int)a4 mode:(unsigned int)a5 key:(id)a6 iv:(id)a7 error:(id *)a8;
- (id)decryptContent:(id)a3 error:(id *)a4;
- (id)encodeMessageSecurityObject:(id *)a3;
- (id)encryptContent:(id *)a3;
- (id)encryptDecryptContent:(id)a3 ccOperation:(unsigned int)a4 error:(id *)a5;
- (id)findBestEncryptionAlgorithmForNewRecipient:(id)a3;
- (id)generateEncryptionKey:(id *)a3;
- (id)getRecipients;
- (void)addRecipient:(id)a3;
- (void)setContentChanged:(BOOL)a3;
- (void)setContentType:(id)a3;
- (void)setDataContent:(id)a3;
- (void)setEmbeddedContent:(id)a3;
- (void)setEncryptedContent:(id)a3;
- (void)setEncryptionAlgorithm:(id)a3;
- (void)setEncryptionKey:(id)a3;
- (void)setLegacyASN1Encoding:(BOOL)a3;
- (void)setOriginatorCertificates:(id)a3;
- (void)setRecipients:(id)a3;
- (void)setUnprotectedAttributes:(id)a3;
- (void)setVersion:(id)a3;
@end

@implementation MSCMSEnvelopedData

- (void)setDataContent:(id)a3
{
  v5 = (NSData *)a3;
  dataContent = self->_dataContent;
  if (dataContent != v5)
  {
    self->_dataContent = 0LL;
    v7 = v5;

    objc_storeStrong((id *)&self->_dataContent, a3);
    v5 = v7;
    self->_contentChanged = 1;
  }
}

- (void)setEmbeddedContent:(id)a3
{
  v5 = (MSCMSMessage *)a3;
  embeddedContent = self->_embeddedContent;
  if (embeddedContent != v5)
  {
    self->_embeddedContent = 0LL;
    v7 = v5;

    objc_storeStrong((id *)&self->_embeddedContent, a3);
    v5 = v7;
    self->_contentChanged = 1;
  }
}

- (void)setContentType:(id)a3
{
  v5 = (MSOID *)a3;
  contentType = self->_contentType;
  if (contentType != v5)
  {
    self->_contentType = 0LL;
    v7 = v5;

    objc_storeStrong((id *)&self->_contentType, a3);
    v5 = v7;
    self->_contentChanged = 1;
  }
}

- (id)getRecipients
{
  return self->_recipients;
}

- (void)setVersion:(id)a3
{
}

- (MSCMSEnvelopedData)initWithDataContent:(id)a3 recipient:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = -[MSCMSEnvelopedData findBestEncryptionAlgorithmForNewRecipient:]( self,  "findBestEncryptionAlgorithmForNewRecipient:",  v6);
  [v8 algorithm];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[MSCMSEnvelopedData initWithDataContent:recipient:encryptionAlgorithm:]( self,  "initWithDataContent:recipient:encryptionAlgorithm:",  v7,  v6,  v9);

  return v10;
}

- (MSCMSEnvelopedData)initWithDataContent:(id)a3 recipient:(id)a4 encryptionAlgorithm:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v9)
  {
    -[MSCMSEnvelopedData setDataContent:](self, "setDataContent:", v8);
    v11 = -[MSOID initWithString:error:]( objc_alloc(&OBJC_CLASS___MSOID),  "initWithString:error:",  @"1.2.840.113549.1.7.1",  0LL);
    -[MSCMSEnvelopedData setContentType:](self, "setContentType:", v11);

    -[MSCMSEnvelopedData addRecipient:](self, "addRecipient:", v9);
    -[MSCMSEnvelopedData recipients](self, "recipients");
    v12 = (MSCMSEnvelopedData *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = -[MSAlgorithmIdentifier initWithOID:](objc_alloc(&OBJC_CLASS___MSAlgorithmIdentifier), "initWithOID:", v10);
      -[MSCMSEnvelopedData setEncryptionAlgorithm:](self, "setEncryptionAlgorithm:", v13);

      v12 = self;
    }
  }

  else
  {
    v12 = 0LL;
  }

  return v12;
}

- (MSCMSEnvelopedData)initWithEmbeddedContent:(id)a3 recipient:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  -[MSCMSEnvelopedData findBestEncryptionAlgorithmForNewRecipient:]( self,  "findBestEncryptionAlgorithmForNewRecipient:",  v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 algorithm];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  id v10 = -[MSCMSEnvelopedData initWithEmbeddedContent:recipient:encryptionAlgorithm:]( self,  "initWithEmbeddedContent:recipient:encryptionAlgorithm:",  v7,  v6,  v9);

  return v10;
}

- (MSCMSEnvelopedData)initWithEmbeddedContent:(id)a3 recipient:(id)a4 encryptionAlgorithm:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v9)
  {
    -[MSCMSEnvelopedData setEmbeddedContent:](self, "setEmbeddedContent:", v8);
    [v8 type];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSCMSEnvelopedData setContentType:](self, "setContentType:", v11);

    -[MSCMSEnvelopedData addRecipient:](self, "addRecipient:", v9);
    -[MSCMSEnvelopedData recipients](self, "recipients");
    v12 = (MSCMSEnvelopedData *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = -[MSAlgorithmIdentifier initWithOID:](objc_alloc(&OBJC_CLASS___MSAlgorithmIdentifier), "initWithOID:", v10);
      -[MSCMSEnvelopedData setEncryptionAlgorithm:](self, "setEncryptionAlgorithm:", v13);

      v12 = self;
    }
  }

  else
  {
    v12 = 0LL;
  }

  return v12;
}

- (id)findBestEncryptionAlgorithmForNewRecipient:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x189603FA8]);
  id v6 = v5;
  recipients = self->_recipients;
  if (recipients)
  {
    v19[0] = MEMORY[0x1895F87A8];
    v19[1] = 3221225472LL;
    v19[2] = __65__MSCMSEnvelopedData_findBestEncryptionAlgorithmForNewRecipient___block_invoke;
    v19[3] = &unk_189B4B0D8;
    id v20 = v5;
    -[NSArray enumerateObjectsUsingBlock:](recipients, "enumerateObjectsUsingBlock:", v19);
  }

  if (v4)
  {
    [v4 algorithmCapabilities];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      [v4 algorithmCapabilities];
      id v9 = (void *)objc_claimAutoreleasedReturnValue();
      [v9 objectAtIndex:0];
      id v10 = (void *)objc_claimAutoreleasedReturnValue();
      [v6 addObject:v10];
    }
  }

  findBestMutuallySupportedEncryptionAlgorithm(v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    if (!v4) {
      goto LABEL_10;
    }
    uint64_t v12 = [v4 algorithmCapabilities];
    if (!v12) {
      goto LABEL_10;
    }
    v13 = (void *)v12;
    [v4 algorithmCapabilities];
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 objectAtIndex:0];
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    int v16 = [v15 containsObject:v11];

    v17 = 0LL;
    if (v16) {
LABEL_10:
    }
      v17 = -[MSAlgorithmIdentifier initWithOID:](objc_alloc(&OBJC_CLASS___MSAlgorithmIdentifier), "initWithOID:", v11);
  }

  else
  {
    v17 = 0LL;
  }

  return v17;
}

void __65__MSCMSEnvelopedData_findBestEncryptionAlgorithmForNewRecipient___block_invoke( uint64_t a1,  void *a2)
{
  id v7 = a2;
  [v7 algorithmCapabilities];
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    id v4 = *(void **)(a1 + 32);
    [v7 algorithmCapabilities];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 objectAtIndex:0];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 addObject:v6];
  }
}

- (BOOL)addRecipient:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (a4 && *a4) {
    id v7 = (void *)[*a4 copy];
  }
  else {
    id v7 = 0LL;
  }
  -[MSCMSEnvelopedData recipients](self, "recipients");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[MSCMSEnvelopedData recipients](self, "recipients");
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = [v9 count];

    uint64_t v11 = v10 + 1;
  }

  else
  {
    uint64_t v11 = 1LL;
  }

  -[MSCMSEnvelopedData addRecipient:](self, "addRecipient:", v6);
  -[MSCMSEnvelopedData recipients](self, "recipients");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = [v12 count];

  if (a4 && v13 != v11)
  {
    +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  MSErrorCMSDomain[0],  -1LL,  v7,  @"unable to add recipient");
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v13 == v11;
}

- (void)addRecipient:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    recipients = self->_recipients;
    if (recipients) {
      id v6 = (id)-[NSArray mutableCopy](recipients, "mutableCopy");
    }
    else {
      id v6 = objc_alloc_init(MEMORY[0x189603FA8]);
    }
    id v7 = v6;
    if (v6)
    {
      uint64_t v8 = -[MSCMSEnvelopedData findBestEncryptionAlgorithmForNewRecipient:]( self,  "findBestEncryptionAlgorithmForNewRecipient:",  v4);
      if (v8)
      {
        id v9 = (MSAlgorithmIdentifier *)v8;
        [v7 addObject:v4];
        objc_storeStrong((id *)&self->_recipients, v7);
        encryptionAlgorithm = self->_encryptionAlgorithm;
        self->_encryptionAlgorithm = v9;
        uint64_t v11 = v9;

        goto LABEL_8;
      }
    }
  }

  else
  {
    id v7 = 0LL;
  }

  if (MS_DEFAULT_LOG_BLOCK != -1) {
    dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_7);
  }
  uint64_t v12 = (os_log_s *)MS_DEFAULT_LOG_INTERNAL;
  if (os_log_type_enabled((os_log_t)MS_DEFAULT_LOG_INTERNAL, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl( &dword_1810EE000,  v12,  OS_LOG_TYPE_ERROR,  "failed to add recipient. No shared encryption algorithm with the rest of the recipients",  v13,  2u);
  }

void __35__MSCMSEnvelopedData_addRecipient___block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.MessageSecurity", "default");
  v1 = (void *)MS_DEFAULT_LOG_INTERNAL;
  MS_DEFAULT_LOG_INTERNAL = (uint64_t)v0;
}

- (id)encodeMessageSecurityObject:(id *)a3
{
  id v4 = -[MSCMSEnvelopedDataInternal initWithEnvelopedData:]( objc_alloc(&OBJC_CLASS___MSCMSEnvelopedDataInternal),  "initWithEnvelopedData:",  self);
  -[MSCMSEnvelopedDataInternal encodeMessageSecurityObject:](v4, "encodeMessageSecurityObject:", a3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)generateEncryptionKey:(id *)a3
{
  if (a3 && *a3) {
    id v5 = (void *)[*a3 copy];
  }
  else {
    id v5 = 0LL;
  }
  encryptionAlgorithm = self->_encryptionAlgorithm;
  id v15 = 0LL;
  size_t v7 = -[MSAlgorithmIdentifier keySize:](encryptionAlgorithm, "keySize:", &v15);
  id v8 = v15;
  if (v8)
  {
    uint64_t v14 = +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  MSErrorCMSDomain[0],  -26275LL,  v5,  @"unable to encrypt/decrypt the content");

    uint64_t v11 = 0LL;
    id v5 = (void *)v14;
  }

  else
  {
    id v9 = malloc(v7);
    if (v9)
    {
      uint64_t v10 = v9;
      if (SecRandomCopyBytes((SecRandomRef)*MEMORY[0x18960BE08], v7, v9))
      {
        uint64_t v11 = 0LL;
      }

      else
      {
        uint64_t v11 = (void *)[objc_alloc(MEMORY[0x189603F48]) initWithBytes:v10 length:v7];
        objc_storeStrong((id *)&self->_encryptionKey, v11);
      }

      bzero(v10, v7);
      free(v10);
    }

    else
    {
      uint64_t v11 = 0LL;
    }
  }

  if (a3 && v5) {
    *a3 = v5;
  }
  id v12 = v11;

  return v12;
}

- (BOOL)encodeEncryptionParameters:(id *)a3
{
  v39[1] = *MEMORY[0x1895F89C0];
  if (a3 && *a3) {
    id v5 = (void *)[*a3 copy];
  }
  else {
    id v5 = 0LL;
  }
  encryptionAlgorithm = self->_encryptionAlgorithm;
  id v35 = 0LL;
  size_t v7 = -[MSAlgorithmIdentifier blockSize:](encryptionAlgorithm, "blockSize:", &v35);
  id v8 = v35;
  if (v8)
  {
    uint64_t v32 = +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  MSErrorCMSDomain[0],  -26275LL,  v5,  @"unable to encrypt/decrypt the content");
    BOOL v31 = 0;
LABEL_26:

    id v5 = (void *)v32;
    if (!a3) {
      goto LABEL_29;
    }
    goto LABEL_27;
  }

  id v9 = malloc(v7);
  if (v9)
  {
    uint64_t v10 = v9;
    if (SecRandomCopyBytes((SecRandomRef)*MEMORY[0x18960BE08], v7, v9))
    {
      id v13 = 0LL;
      goto LABEL_34;
    }

    if (-[MSAlgorithmIdentifier ccAlgorithm:](self->_encryptionAlgorithm, "ccAlgorithm:", 0LL) == 5)
    {
      uint64_t v11 = length_CMSRC2CBCParameter();
      [MEMORY[0x189603FB8] dataWithLength:v11];
      id v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v12)
      {
LABEL_17:
        uint64_t v16 = 12LL;
        goto LABEL_18;
      }

      id v13 = v12;
      [v13 mutableBytes];
      int v14 = encode_CMSRC2CBCParameter();
      if (v14)
      {
        int v15 = v14;

        uint64_t v16 = v15;
LABEL_18:
        id v20 = (void *)MEMORY[0x189607870];
        uint64_t v38 = *MEMORY[0x1896075E0];
        v39[0] = @"Failed encoding type CMSRC2CBCParameter";
        v21 = (void *)MEMORY[0x189603F68];
        v22 = (const __CFString **)v39;
        v23 = &v38;
LABEL_21:
        [v21 dictionaryWithObjects:v22 forKeys:v23 count:1];
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v25 = [v20 errorWithDomain:@"com.apple.HeimASN1" code:v16 userInfo:v24];

        id v13 = 0LL;
        id v5 = (void *)v25;
        goto LABEL_22;
      }

- (id)bulkEncryptDecrypt:(unsigned int)a3 algorithm:(unsigned int)a4 mode:(unsigned int)a5 key:(id)a6 iv:(id)a7 error:(id *)a8
{
  id v35 = a6;
  id v14 = a7;
  if (a8 && *a8) {
    int v15 = (void *)[*a8 copy];
  }
  else {
    int v15 = 0LL;
  }
  CCCryptorRef cryptorRef = 0LL;
  unsigned int v16 = -[MSAlgorithmIdentifier ccAlgorithm:](self->_encryptionAlgorithm, "ccAlgorithm:", 0LL);
  v17 = -[MSAlgorithmIdentifier parameters](self->_encryptionAlgorithm, "parameters");
  int v18 = v17;
  if (v16 == 5)
  {
    int v19 = nsheim_decode_CMSRC2CBCParameter(v17);

    if (!v19)
    {
      NSDataFromOctetString(&v39);
      id v20 = (void *)objc_claimAutoreleasedReturnValue();

      free_CMSRC2CBCParameter();
      goto LABEL_10;
    }

- (BOOL)checkDecryptionResult:(id)a3
{
  v14[1] = *MEMORY[0x1895F89C0];
  id v3 = a3;
  id v4 = v3;
  if (v3 && [v3 length])
  {
    uint64_t v13 = *MEMORY[0x1896076F8];
    v14[0] = MEMORY[0x189604A80];
    BOOL v5 = 1;
    [MEMORY[0x189603F68] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    char v12 = 0;
    uint64_t v11 = 0LL;
    if ([NSString stringEncodingForData:v4 encodingOptions:v6 convertedString:&v11 usedLossyConversion:&v12])
    {
      BOOL v7 = v11 == 0;
    }

    else
    {
      BOOL v7 = 1;
    }

    if (v7 || v12 != 0)
    {
      id v9 = v4;
      [v9 bytes];
      [v9 length];
      BOOL v5 = 0;
    }
  }

  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)encryptDecryptContent:(id)a3 ccOperation:(unsigned int)a4 error:(id *)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  if (a5 && *a5) {
    id v9 = (void *)[*a5 copy];
  }
  else {
    id v9 = 0LL;
  }
  encryptionAlgorithm = self->_encryptionAlgorithm;
  id v36 = 0LL;
  uint64_t v11 = -[MSAlgorithmIdentifier ccAlgorithm:](encryptionAlgorithm, "ccAlgorithm:", &v36);
  id v12 = v36;
  if (v12)
  {
    id v23 = v12;
    +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  MSErrorCMSDomain[0],  -26275LL,  v9,  @"unable to encrypt/decrypt the content");
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = 0LL;
    goto LABEL_28;
  }

  if ((_DWORD)v6)
  {
    [v8 key:0];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13) {
      goto LABEL_8;
    }
    goto LABEL_17;
  }

  id v35 = v9;
  -[MSCMSEnvelopedData generateEncryptionKey:](self, "generateEncryptionKey:", &v35);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  id v24 = v35;

  id v9 = v24;
  if (!v13)
  {
LABEL_17:
    +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  MSErrorCMSDomain[0],  -26275LL,  v9,  @"unable to access the content encryption key");
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    id v23 = 0LL;
LABEL_28:
    int v19 = 0LL;
LABEL_23:

    if (!a5) {
      goto LABEL_26;
    }
    goto LABEL_24;
  }

- (id)encryptContent:(id *)a3
{
  return -[MSCMSEnvelopedData encryptDecryptContent:ccOperation:error:]( self,  "encryptDecryptContent:ccOperation:error:",  0LL,  0LL,  a3);
}

- (id)decryptContent:(id)a3 error:(id *)a4
{
  return -[MSCMSEnvelopedData encryptDecryptContent:ccOperation:error:]( self,  "encryptDecryptContent:ccOperation:error:",  a3,  1LL,  a4);
}

+ (id)decodeMessageSecurityObject:(id)a3 options:(id)a4 error:(id *)a5
{
  uint64_t v99 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  if (a5 && *a5) {
    id v9 = (id)[*a5 copy];
  }
  else {
    id v9 = 0LL;
  }
  v95 = 0LL;
  __int128 v93 = 0u;
  __int128 v94 = 0u;
  __int128 v91 = 0u;
  __int128 v92 = 0u;
  __int128 v90 = 0u;
  int v10 = nsheim_decode_EnvelopedData(v7);
  if (v10)
  {
    int v11 = v10;
    if (nsheim_decode_SecCMS_EnvelopedData(v7))
    {
      id v12 = MSErrorASN1Domain[0];
      if (v7) {
        uint64_t v13 = [v7 length];
      }
      else {
        uint64_t v13 = -1LL;
      }
      +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  v12,  v11,  v9,  @"unable to decode envelopedData (%ld bytes)",  v13);
      id v17 = (id)objc_claimAutoreleasedReturnValue();

      dumpNSData("EnvelopedData", v7);
      id v28 = 0LL;
      v50 = 0LL;
      v74 = 0LL;
      v75 = 0LL;
      id v53 = 0LL;
      v40 = 0LL;
      v76 = 0LL;
      goto LABEL_53;
    }
  }

  id v14 = objc_alloc(&OBJC_CLASS___MSCMSEnvelopedData);
  if (!v14)
  {
    id v28 = 0LL;
    v50 = 0LL;
    v74 = 0LL;
    v75 = 0LL;
    id v53 = 0LL;
    v40 = 0LL;
    v76 = 0LL;
    goto LABEL_68;
  }

  [MEMORY[0x189607968] numberWithInt:v90];
  int v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSCMSEnvelopedData setVersion:](v14, "setVersion:", v15);

  v72 = a5;
  v73 = v8;
  if (*((void *)&v90 + 1))
  {
    id v16 = objc_alloc_init(MEMORY[0x189603FA8]);
    id v17 = v9;
    NSDataFromAny(*((void **)&v90 + 1));
    id v18 = (void *)objc_claimAutoreleasedReturnValue();
    int v19 = nsheim_decode_OriginatorInfo(v18);

    v76 = v16;
    if (v19)
    {
      +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  MSErrorASN1Domain[0],  v19,  v17,  @"unable to decode envelopedData.originatorInfo");
      id v20 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      id v20 = v17;
      if (v16)
      {
        id v20 = v17;
        if ((void)v83)
        {
          id v20 = v17;
          if (*(_DWORD *)v83)
          {
            uint64_t v21 = 0LL;
            unint64_t v22 = 0LL;
            do
            {
              if (*(_DWORD *)(*(void *)(v83 + 8) + v21) == 1)
              {
                uint64_t v23 = SecCertificateCreateWithBytes();
                if (v23)
                {
                  id v24 = (void *)v23;
                  [v16 addObject:v23];
                }
              }

              ++v22;
              v21 += 24LL;
            }

            while (v22 < *(unsigned int *)v83);
            id v20 = v17;
            a5 = v72;
          }
        }
      }
    }

    free_OriginatorInfo();

    if (v19)
    {

      id v28 = 0LL;
      v50 = 0LL;
      v74 = 0LL;
      v75 = 0LL;
      id v53 = 0LL;
      v40 = 0LL;
LABEL_53:
      id v14 = 0LL;
      id v9 = v17;
      goto LABEL_68;
    }

    id v25 = v16;
  }

  else
  {
    id v25 = 0LL;
  }

  id v71 = v7;
  v76 = v25;
  -[MSCMSEnvelopedData setOriginatorCertificates:](v14, "setOriginatorCertificates:");
  if ((_DWORD)v91)
  {
    uint64_t v26 = 0LL;
    unint64_t v27 = 0LL;
    id v28 = 0LL;
    do
    {
      size_t v29 = v28;
      v30 = v9;
      __int128 v32 = *(_OWORD *)(*((void *)&v91 + 1) + v26 + 16);
      __int128 v31 = *(_OWORD *)(*((void *)&v91 + 1) + v26 + 32);
      __int128 v83 = *(_OWORD *)(*((void *)&v91 + 1) + v26);
      __int128 v84 = v32;
      __int128 v85 = v31;
      __int128 v33 = *(_OWORD *)(*((void *)&v91 + 1) + v26 + 96);
      __int128 v35 = *(_OWORD *)(*((void *)&v91 + 1) + v26 + 48);
      __int128 v34 = *(_OWORD *)(*((void *)&v91 + 1) + v26 + 64);
      __int128 v88 = *(_OWORD *)(*((void *)&v91 + 1) + v26 + 80);
      __int128 v89 = v33;
      __int128 v86 = v35;
      __int128 v87 = v34;
      id v82 = v9;
      +[MSCMSRecipientInfo decodeRecipientInfo:certificates:LAContext:error:]( &OBJC_CLASS___MSCMSRecipientInfo,  "decodeRecipientInfo:certificates:LAContext:error:",  &v83,  v76,  0LL,  &v82);
      id v28 = (void *)objc_claimAutoreleasedReturnValue();
      id v9 = v82;

      if (v28)
      {
        if (v76 && [v76 count])
        {
          *(void *)buf = 0LL;
          SecKeyRef v36 = SecCertificateCopyKey((SecCertificateRef)[v76 objectAtIndex:0]);
          SecKeyCopyPublicBytes();
          if (v36) {
            CFRelease(v36);
          }
          v37 = *(void **)buf;
          [v28 setOriginatorPubKey:*(void *)buf];
        }

        -[MSCMSEnvelopedData addRecipient:](v14, "addRecipient:", v28);
      }

      else
      {
        if (MS_DEFAULT_LOG_BLOCK != -1) {
          dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_31);
        }
        uint64_t v38 = (os_log_s *)MS_DEFAULT_LOG_INTERNAL;
        if (os_log_type_enabled((os_log_t)MS_DEFAULT_LOG_INTERNAL, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)&buf[4] = v27;
          __int16 v97 = 2112;
          id v98 = v9;
          _os_log_impl(&dword_1810EE000, v38, OS_LOG_TYPE_ERROR, "failed to decode recipient %u: %@", buf, 0x12u);
        }
      }

      ++v27;
      v26 += 112LL;
    }

    while (v27 < v91);
  }

  else
  {
    id v28 = 0LL;
  }

  -[MSCMSEnvelopedData recipients](v14, "recipients");
  uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = (void *)[v39 count];

  if (!v40)
  {
    uint64_t v69 = +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  MSErrorASN1Domain[0],  0LL,  v9,  @"unable to decode envelopedData.recipientInfos");

    v50 = 0LL;
    v74 = 0LL;
    v75 = 0LL;
    id v53 = 0LL;
    id v14 = 0LL;
    id v9 = (id)v69;
    id v7 = v71;
    a5 = v72;
    id v8 = v73;
    goto LABEL_68;
  }

  NSDataFromOctetString(*((void **)&v94 + 1));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSCMSEnvelopedData setEncryptedContent:](v14, "setEncryptedContent:", v41);

  id v81 = v9;
  uint64_t v42 = +[MSAlgorithmIdentifier algorithmIdentifierWithAsn1AlgId:error:]( &OBJC_CLASS___MSAlgorithmIdentifier,  "algorithmIdentifierWithAsn1AlgId:error:",  &v93,  &v81);
  id v43 = v81;

  v70 = (void *)v42;
  -[MSCMSEnvelopedData setEncryptionAlgorithm:](v14, "setEncryptionAlgorithm:", v42);
  v44 = -[MSCMSEnvelopedData recipients](v14, "recipients");
  uint64_t v45 = [v44 count];

  id v7 = v71;
  if (!v45)
  {
LABEL_45:

    v50 = 0LL;
LABEL_46:
    v74 = 0LL;
    v75 = 0LL;
    id v53 = 0LL;
    id v14 = 0LL;
    id v9 = v43;
    goto LABEL_47;
  }

  unint64_t v46 = 0LL;
  while (1)
  {
    v47 = v28;
    v48 = v43;
    v49 = -[MSCMSEnvelopedData recipients](v14, "recipients");
    [v49 objectAtIndex:v46];
    id v28 = (void *)objc_claimAutoreleasedReturnValue();

    id v80 = v48;
    v50 = -[MSCMSEnvelopedData decryptContent:error:](v14, "decryptContent:error:", v28, &v80);
    id v43 = v80;

    if (v50) {
      break;
    }
    ++v46;
    v51 = -[MSCMSEnvelopedData recipients](v14, "recipients");
    unint64_t v52 = [v51 count];

    if (v46 >= v52) {
      goto LABEL_45;
    }
  }

  id v79 = v43;
  uint64_t v54 = +[MSOID OIDWithAsn1OID:error:](&OBJC_CLASS___MSOID, "OIDWithAsn1OID:error:", &v92, &v79);
  id v9 = v79;

  if (!v54)
  {
    +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  MSErrorCMSDomain[0],  -26275LL,  v9,  @"unable to get contentType from envelopedData.encryptedContentnInfo");
    id v43 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_46;
  }

  v75 = (void *)v54;
  -[MSCMSEnvelopedData setContentType:](v14, "setContentType:", v54);
  v55 = -[MSCMSEnvelopedData contentType](v14, "contentType");
  char v56 = [v55 isEqualToString:@"1.2.840.113549.1.7.1"];

  id v8 = v73;
  if ((v56 & 1) != 0)
  {
    -[MSCMSEnvelopedData setDataContent:](v14, "setDataContent:", v50);
    v74 = 0LL;
  }

  else
  {
    v57 = -[MSCMSEnvelopedData contentType](v14, "contentType");
    id v78 = v9;
    uint64_t v58 = decodeEmbeddedCMSContent(v57, v50, v73, (uint64_t)&v78);
    id v59 = v78;

    v74 = (void *)v58;
    -[MSCMSEnvelopedData setEmbeddedContent:](v14, "setEmbeddedContent:", v58);
    id v9 = v59;
  }

  a5 = v72;
  v40 = v70;
  if (!v95)
  {
    id v53 = 0LL;
    goto LABEL_67;
  }

  id v53 = objc_alloc_init(MEMORY[0x189603FA8]);
  if (v53 && (v60 = v95, *v95))
  {
    uint64_t v61 = 0LL;
    unint64_t v62 = 0LL;
    do
    {
      v63 = (__int128 *)(*((void *)v60 + 1) + v61);
      __int128 v64 = v63[1];
      __int128 v83 = *v63;
      __int128 v84 = v64;
      id v77 = v9;
      v65 = +[MSCMSAttribute decodeAttribute:error:](&OBJC_CLASS___MSCMSAttribute, "decodeAttribute:error:", &v83, &v77);
      id v66 = v77;

      if (v65) {
        [v53 addObject:v65];
      }

      ++v62;
      v60 = v95;
      v61 += 32LL;
      id v9 = v66;
    }

    while (v62 < *v95);
  }

  else
  {
    id v66 = v9;
  }

  if ([v53 count])
  {
    id v9 = v66;
    id v7 = v71;
    a5 = v72;
    id v8 = v73;
    v40 = v70;
LABEL_67:
    -[MSCMSEnvelopedData setUnprotectedAttributes:](v14, "setUnprotectedAttributes:", v53);
    goto LABEL_68;
  }

  +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  MSErrorASN1Domain[0],  0LL,  v66,  @"unable to decode envelopedData.unprotectedAttrs");
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  id v14 = 0LL;
  id v7 = v71;
LABEL_47:
  a5 = v72;
  id v8 = v73;
  v40 = v70;
LABEL_68:
  free_EnvelopedData();
  if (a5 && v9) {
    *a5 = v9;
  }
  v67 = v14;

  return v67;
}

void __64__MSCMSEnvelopedData_decodeMessageSecurityObject_options_error___block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.MessageSecurity", "default");
  v1 = (void *)MS_DEFAULT_LOG_INTERNAL;
  MS_DEFAULT_LOG_INTERNAL = (uint64_t)v0;
}

+ (id)encodeOriginatorInfoCertificates:(id)a3 error:(id *)a4
{
  uint64_t v46 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  if (!a4 || !*a4)
  {
    uint64_t v6 = 0LL;
    if (!v5) {
      goto LABEL_4;
    }
LABEL_6:
    __int128 v33 = v6;
    unsigned int v39 = objc_msgSend(v5, "count", a4);
    id v8 = (char *)malloc(24LL * v39);
    v40 = v8;
    id v9 = objc_alloc_init(MEMORY[0x189603FA8]);
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    id v32 = v5;
    id v10 = v5;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v35 objects:v45 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      int v13 = 0;
      uint64_t v14 = *(void *)v36;
      do
      {
        for (uint64_t i = 0LL; i != v12; ++i)
        {
          if (*(void *)v36 != v14) {
            objc_enumerationMutation(v10);
          }
          CFDataRef v16 = SecCertificateCopyData(*(SecCertificateRef *)(*((void *)&v35 + 1) + 8 * i));
          if (v16)
          {
            [v9 addObject:v16];
            id v17 = &v8[24 * v13];
            *(_DWORD *)id v17 = 1;
            *((void *)v17 + 1) = -[__CFData length](v16, "length");
            uint64_t v18 = -[__CFData bytes](v16, "bytes");
            id v8 = (char *)v40;
            *((void *)v40 + 3 * v13++ + 2) = v18;
          }
        }

        uint64_t v12 = [v10 countByEnumeratingWithState:&v35 objects:v45 count:16];
      }

      while (v12);
    }

    v41 = &v39;
    uint64_t v42 = 0LL;
    uint64_t v19 = length_OriginatorInfo();
    [MEMORY[0x189603FB8] dataWithLength:v19];
    id v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      id v21 = v20;
      [v21 mutableBytes];
      int v22 = encode_OriginatorInfo();
      if (!v22)
      {
        BOOL v27 = v19 == v34;
        uint64_t v6 = v33;
        if (!v27)
        {
          id v28 = (MSCMSEnvelopedData *)asn1_abort();
          return -[MSCMSEnvelopedData type](v28, v29);
        }

        goto LABEL_22;
      }

      int v23 = v22;

      uint64_t v24 = v23;
    }

    else
    {
      uint64_t v24 = 12LL;
    }

    id v25 = (void *)MEMORY[0x189607870];
    uint64_t v43 = *MEMORY[0x1896075E0];
    v44 = @"Failed encoding type OriginatorInfo";
    [MEMORY[0x189603F68] dictionaryWithObjects:&v44 forKeys:&v43 count:1];
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
    [v25 errorWithDomain:@"com.apple.HeimASN1" code:v24 userInfo:v26];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

    id v21 = 0LL;
LABEL_22:
    free(v40);
    if (v31)
    {
      if (v6) {
        *__int128 v31 = v6;
      }
    }

    id v7 = v21;

    id v5 = v32;
    goto LABEL_26;
  }

  uint64_t v6 = (void *)[*a4 copy];
  if (v5) {
    goto LABEL_6;
  }
LABEL_4:
  id v7 = 0LL;
LABEL_26:

  return v7;
}

- (MSOID)type
{
  return +[MSOID OIDWithString:error:](&OBJC_CLASS___MSOID, "OIDWithString:error:", @"1.2.840.113549.1.7.3", 0LL);
}

- (NSData)dataContent
{
  return self->_dataContent;
}

- (MSCMSMessage)embeddedContent
{
  return (MSCMSMessage *)objc_getProperty(self, a2, 32LL, 1);
}

- (MSOID)contentType
{
  return (MSOID *)objc_getProperty(self, a2, 40LL, 1);
}

- (NSArray)recipients
{
  return (NSArray *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setRecipients:(id)a3
{
}

- (MSAlgorithmIdentifier)encryptionAlgorithm
{
  return (MSAlgorithmIdentifier *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setEncryptionAlgorithm:(id)a3
{
}

- (NSData)encryptionKey
{
  return (NSData *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setEncryptionKey:(id)a3
{
}

- (NSMutableArray)unprotectedAttributes
{
  return (NSMutableArray *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setUnprotectedAttributes:(id)a3
{
}

- (NSMutableArray)originatorCertificates
{
  return (NSMutableArray *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setOriginatorCertificates:(id)a3
{
}

- (BOOL)legacyASN1Encoding
{
  return self->_legacyASN1Encoding;
}

- (void)setLegacyASN1Encoding:(BOOL)a3
{
  self->_legacyASN1Encoding = a3;
}

- (NSData)encryptedContent
{
  return (NSData *)objc_getProperty(self, a2, 88LL, 1);
}

- (void)setEncryptedContent:(id)a3
{
}

- (BOOL)contentChanged
{
  return self->_contentChanged;
}

- (void)setContentChanged:(BOOL)a3
{
  self->_contentChanged = a3;
}

- (NSNumber)version
{
  return (NSNumber *)objc_getProperty(self, a2, 96LL, 1);
}

- (void).cxx_destruct
{
}

@end