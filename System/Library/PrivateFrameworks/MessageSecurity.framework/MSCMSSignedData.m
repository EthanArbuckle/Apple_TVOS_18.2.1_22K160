@interface MSCMSSignedData
+ (BOOL)isImplementedInObjectiveC;
+ (id)decodeMessageSecurityObject:(id)a3 options:(id)a4 error:(id *)a5;
- (BOOL)addCertificatesForSigner:(id)a3 mode:(unint64_t)a4 error:(id *)a5;
- (BOOL)addSigner:(id)a3 withChainMode:(unint64_t)a4 error:(id *)a5;
- (BOOL)checkSignedPerRFC5652:(id *)a3;
- (BOOL)contentChanged;
- (BOOL)detached;
- (BOOL)verifySignatures:(id *)a3;
- (BOOL)verifySignaturesAndSignersWithPolicies:(id)a3 verifyTime:(id)a4 anchorCertificates:(id)a5 error:(id *)a6;
- (BOOL)verifySignaturesAndSignersWithPolicies:(id)a3 verifyTime:(id)a4 error:(id *)a5;
- (MSCMSMessage)embeddedContent;
- (MSCMSSignedData)initWithDataContent:(id)a3 isDetached:(BOOL)a4 signer:(id)a5 additionalCertificates:(id)a6 error:(id *)a7;
- (MSCMSSignedData)initWithDataContent:(id)a3 isDetached:(BOOL)a4 signer:(id)a5 error:(id *)a6;
- (MSCMSSignedData)initWithDataContent:(id)a3 isDetached:(BOOL)a4 signer:(id)a5 signerChainMode:(unint64_t)a6 error:(id *)a7;
- (MSCMSSignedData)initWithEmbeddedContent:(id)a3 signer:(id)a4 additionalCertificates:(id)a5 error:(id *)a6;
- (MSCMSSignedData)initWithEmbeddedContent:(id)a3 signer:(id)a4 error:(id *)a5;
- (MSCMSSignedData)initWithEmbeddedContent:(id)a3 signer:(id)a4 signerChainMode:(unint64_t)a5 error:(id *)a6;
- (MSDecodeOptions)options;
- (MSOID)contentType;
- (MSOID)type;
- (NSArray)signers;
- (NSData)dataContent;
- (NSMutableSet)certificates;
- (NSNumber)version;
- (NSSet)digestAlgorithms;
- (__SecCertificate)getSignerCertificate:(unint64_t)a3 error:(id *)a4;
- (id)calculateContentDigestWithAlgorithm:(id)a3 error:(id *)a4;
- (id)encodeMessageSecurityObject:(id *)a3;
- (id)initCertsOnlyWithCertificates:(id)a3 error:(id *)a4;
- (void)addCounterSignerCertificates:(id)a3 mode:(unint64_t)a4 error:(id *)a5;
- (void)addDigestAlgorithmFromSigner:(id)a3;
- (void)addSigner:(id)a3;
- (void)addSigner:(id)a3 withCertificates:(id)a4;
- (void)removeSignerCertificatesWithIndexes:(id)a3;
- (void)removeSignersWithCertificate:(__SecCertificate *)a3 error:(id *)a4;
- (void)removeSignersWithEmailAddress:(id)a3 error:(id *)a4;
- (void)removeSignersWithIdentity:(__SecIdentity *)a3 error:(id *)a4;
- (void)removeSignersWithIndexes:(id)a3 error:(id *)a4;
- (void)setCertificates:(id)a3;
- (void)setContentChanged:(BOOL)a3;
- (void)setContentType:(id)a3;
- (void)setDataContent:(id)a3;
- (void)setDetached:(BOOL)a3;
- (void)setDigestAlgorithms:(id)a3;
- (void)setEmbeddedContent:(id)a3;
- (void)setOptions:(id)a3;
- (void)setSigners:(id)a3;
- (void)setVersion:(id)a3;
@end

@implementation MSCMSSignedData

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

- (void)addCounterSignerCertificates:(id)a3 mode:(unint64_t)a4 error:(id *)a5
{
  uint64_t v41 = *MEMORY[0x1895F89C0];
  [a3 unprotectedAttributes];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = +[MSOID OIDWithString:error:](&OBJC_CLASS___MSOID, "OIDWithString:error:", @"1.2.840.113549.1.9.6", 0LL);
  [v8 getAttributesWithType:v9];
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    v27 = v10;
    id obj = v10;
    uint64_t v11 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (!v11) {
      goto LABEL_25;
    }
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v36;
    unint64_t v14 = 0x189B49000uLL;
    uint64_t v28 = *(void *)v36;
    while (1)
    {
      uint64_t v15 = 0LL;
      uint64_t v29 = v12;
      do
      {
        if (*(void *)v36 != v13) {
          objc_enumerationMutation(obj);
        }
        v16 = *(void **)(*((void *)&v35 + 1) + 8 * v15);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          id v17 = (id)[objc_alloc(*(Class *)(v14 + 2872)) initWithAttribute:v16 certificates:0 LAContext:0 containingSignerInfo:0 error:0];
        }

        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_23;
          }
          id v17 = v16;
        }

        v18 = v17;
        if (v17)
        {
          __int128 v33 = 0u;
          __int128 v34 = 0u;
          __int128 v31 = 0u;
          __int128 v32 = 0u;
          [v17 signers];
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v20 = [v19 countByEnumeratingWithState:&v31 objects:v39 count:16];
          if (v20)
          {
            uint64_t v21 = v20;
            uint64_t v22 = *(void *)v32;
            do
            {
              for (uint64_t i = 0LL; i != v21; ++i)
              {
                if (*(void *)v32 != v22) {
                  objc_enumerationMutation(v19);
                }
                uint64_t v24 = *(void *)(*((void *)&v31 + 1) + 8 * i);
                unint64_t v25 = objc_msgSend(v18, "chainMode", v27);
                if (v25 <= a4) {
                  unint64_t v26 = a4;
                }
                else {
                  unint64_t v26 = v25;
                }
                -[MSCMSSignedData addCertificatesForSigner:mode:error:]( self,  "addCertificatesForSigner:mode:error:",  v24,  v26,  a5);
              }

              uint64_t v21 = [v19 countByEnumeratingWithState:&v31 objects:v39 count:16];
            }

            while (v21);
          }

          uint64_t v13 = v28;
          uint64_t v12 = v29;
          unint64_t v14 = 0x189B49000LL;
        }

- (BOOL)addCertificatesForSigner:(id)a3 mode:(unint64_t)a4 error:(id *)a5
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  if (a5 && *a5) {
    v9 = (void *)[*a5 copy];
  }
  else {
    v9 = 0LL;
  }
  if (a4 - 2 < 2)
  {
    if (v8 && [v8 signerCertificate])
    {
      id v27 = v9;
      v10 = MSSecTrustCreateWithError([v8 signerCertificate], 0, 0, 0, &v27);
      id v12 = v27;

      if (v10)
      {
        CFErrorRef err = 0LL;
        if (!SecTrustEvaluateWithError(v10, &err))
        {
          if (err) {
            CFStringRef v13 = CFErrorCopyDescription(err);
          }
          else {
            CFStringRef v13 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x189604DB0], "Error Unavailable", 0x8000100u);
          }
          CFStringRef v14 = v13;
          if (MS_DEFAULT_LOG_BLOCK != -1) {
            dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_3);
          }
          uint64_t v15 = (os_log_s *)MS_DEFAULT_LOG_INTERNAL;
          if (os_log_type_enabled((os_log_t)MS_DEFAULT_LOG_INTERNAL, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            CFStringRef v29 = v14;
            _os_log_impl( &dword_1810EE000,  v15,  OS_LOG_TYPE_DEFAULT,  "MSCMSChainMode with chain specified, but no trusted chain found (%@), continuing with untrusted chain",  buf,  0xCu);
          }

          CFErrorRef v16 = err;
          if (err)
          {
            CFErrorRef err = 0LL;
            CFRelease(v16);
          }
        }

        CFArrayRef v17 = SecTrustCopyCertificateChain(v10);
        v18 = (void *)-[__CFArray mutableCopy](v17, "mutableCopy");

        unint64_t v19 = [v18 count];
        unint64_t v20 = v19 - 1;
        if (v19 <= 1)
        {
          if (MS_DEFAULT_LOG_BLOCK != -1) {
            dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_13);
          }
          uint64_t v21 = (os_log_s *)MS_DEFAULT_LOG_INTERNAL;
          if (os_log_type_enabled((os_log_t)MS_DEFAULT_LOG_INTERNAL, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( &dword_1810EE000,  v21,  OS_LOG_TYPE_DEFAULT,  "MSCMSChainMode with chain specified, but could not build chain beyond leaf, continuing with single certificate",  buf,  2u);
          }
        }

        if (a4 == 2)
        {
          [v18 objectAtIndexedSubscript:v20];

          buf[0] = 0;
          if (!SecCertificateIsSelfSigned())
          {
            if (buf[0]) {
              [v18 removeLastObject];
            }
          }
        }

        -[NSMutableSet addObjectsFromArray:](self->_certificates, "addObjectsFromArray:", v18);

        BOOL v11 = 1;
      }

      else
      {
        uint64_t v25 = +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  MSErrorTrustDomain,  -25245LL,  v12,  @"unable to build chain according to mode could not evaluate trust");;

        BOOL v11 = 0;
        id v12 = (id)v25;
      }

      goto LABEL_37;
    }

    v23 = MSErrorCMSDomain[0];
    uint64_t v24 = @"unable to build chain according to mode; missing signer info or signer certificate missing from signer info";
  }

  else
  {
    if (!a4)
    {
      BOOL v11 = 1;
      goto LABEL_43;
    }

    if (a4 != 1)
    {
      v10 = 0LL;
      BOOL v11 = 0;
      goto LABEL_19;
    }

    if (v8 && [v8 signerCertificate])
    {
      -[NSMutableSet addObject:](self->_certificates, "addObject:", [v8 signerCertificate]);
      v10 = 0LL;
      BOOL v11 = 1;
LABEL_19:
      id v12 = v9;
      goto LABEL_37;
    }

    v23 = MSErrorCMSDomain[0];
    uint64_t v24 = @"unable to add signer cert to certificates; missing signer info or signer certificate missing from signer info";
  }

  +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  v23,  -50LL,  v9,  v24);
  id v12 = (id)objc_claimAutoreleasedReturnValue();

  v10 = 0LL;
  BOOL v11 = 0;
LABEL_37:
  if (a5 && v12) {
    *a5 = v12;
  }
  if (v10) {
    CFRelease(v10);
  }
  v9 = v12;
LABEL_43:

  return v11;
}

void __55__MSCMSSignedData_addCertificatesForSigner_mode_error___block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.MessageSecurity", "default");
  v1 = (void *)MS_DEFAULT_LOG_INTERNAL;
  MS_DEFAULT_LOG_INTERNAL = (uint64_t)v0;
}

void __55__MSCMSSignedData_addCertificatesForSigner_mode_error___block_invoke_12()
{
  os_log_t v0 = os_log_create("com.apple.MessageSecurity", "default");
  v1 = (void *)MS_DEFAULT_LOG_INTERNAL;
  MS_DEFAULT_LOG_INTERNAL = (uint64_t)v0;
}

- (MSCMSSignedData)initWithDataContent:(id)a3 isDetached:(BOOL)a4 signer:(id)a5 error:(id *)a6
{
  id v11 = a3;
  id v12 = a5;
  v30.receiver = self;
  v30.super_class = (Class)&OBJC_CLASS___MSCMSSignedData;
  CFStringRef v13 = -[MSCMSSignedData init](&v30, sel_init);
  if (v13)
  {
    [v12 signatureAlgorithm];
    CFStringRef v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 algorithm];
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[MSOID digestOIDWithSignatureAlgorithm:error:]( &OBJC_CLASS___MSOID,  "digestOIDWithSignatureAlgorithm:error:",  v15,  a6);
    CFErrorRef v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16) {
      goto LABEL_6;
    }
    CFArrayRef v17 = (void *)MEMORY[0x189604010];
    v18 = +[MSAlgorithmIdentifier algorithmIdentifierWithOID:]( &OBJC_CLASS___MSAlgorithmIdentifier,  "algorithmIdentifierWithOID:",  v16);
    uint64_t v19 = [v17 setWithObject:v18];
    digestAlgorithms = v13->_digestAlgorithms;
    v13->_digestAlgorithms = (NSSet *)v19;

    objc_storeStrong((id *)&v13->_dataContent, a3);
    v13->_contentChanged = 1;
    embeddedContent = v13->_embeddedContent;
    v13->_embeddedContent = 0LL;

    v13->_detached = a4;
    uint64_t v22 = [MEMORY[0x189603F18] arrayWithObject:v12];
    signers = v13->_signers;
    v13->_signers = (NSArray *)v22;

    [v12 setContainingSignedData:v13];
    uint64_t v24 = +[MSOID OIDWithString:error:](&OBJC_CLASS___MSOID, "OIDWithString:error:", @"1.2.840.113549.1.7.1", a6);
    contentType = v13->_contentType;
    v13->_contentType = (MSOID *)v24;

    if (![v12 signerCertificate])
    {
LABEL_6:

      uint64_t v28 = 0LL;
      goto LABEL_7;
    }

    uint64_t v26 = objc_msgSend(MEMORY[0x189603FE0], "setWithObject:", objc_msgSend(v12, "signerCertificate"));
    certificates = v13->_certificates;
    v13->_certificates = (NSMutableSet *)v26;

    -[MSCMSSignedData addCounterSignerCertificates:mode:error:]( v13,  "addCounterSignerCertificates:mode:error:",  v12,  1LL,  0LL);
  }

  uint64_t v28 = v13;
LABEL_7:

  return v28;
}

- (MSCMSSignedData)initWithDataContent:(id)a3 isDetached:(BOOL)a4 signer:(id)a5 additionalCertificates:(id)a6 error:(id *)a7
{
  BOOL v9 = a4;
  id v12 = a6;
  CFStringRef v13 = -[MSCMSSignedData initWithDataContent:isDetached:signer:error:]( self,  "initWithDataContent:isDetached:signer:error:",  a3,  v9,  a5,  a7);
  CFStringRef v14 = v13;
  if (v12 && v13) {
    -[NSMutableSet addObjectsFromArray:](v13->_certificates, "addObjectsFromArray:", v12);
  }

  return v14;
}

- (MSCMSSignedData)initWithDataContent:(id)a3 isDetached:(BOOL)a4 signer:(id)a5 signerChainMode:(unint64_t)a6 error:(id *)a7
{
  BOOL v9 = a4;
  id v12 = a5;
  CFStringRef v13 = -[MSCMSSignedData initWithDataContent:isDetached:signer:error:]( self,  "initWithDataContent:isDetached:signer:error:",  a3,  v9,  v12,  a7);
  CFStringRef v14 = v13;
  if (!v13) {
    goto LABEL_7;
  }
  if (!a6)
  {
    -[NSMutableSet removeAllObjects](v13->_certificates, "removeAllObjects");
    goto LABEL_6;
  }

  if (-[MSCMSSignedData addCertificatesForSigner:mode:error:](v13, "addCertificatesForSigner:mode:error:", v12, a6, a7))
  {
LABEL_6:
    -[MSCMSSignedData addCounterSignerCertificates:mode:error:]( v14,  "addCounterSignerCertificates:mode:error:",  v12,  a6,  0LL);
LABEL_7:
    uint64_t v15 = v14;
    goto LABEL_8;
  }

  uint64_t v15 = 0LL;
LABEL_8:

  return v15;
}

- (MSCMSSignedData)initWithEmbeddedContent:(id)a3 signer:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___MSCMSSignedData;
  id v11 = -[MSCMSSignedData init](&v27, sel_init);
  if (!v11) {
    goto LABEL_4;
  }
  [v10 signatureAlgorithm];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 algorithm];
  CFStringRef v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[MSOID digestOIDWithSignatureAlgorithm:error:]( &OBJC_CLASS___MSOID,  "digestOIDWithSignatureAlgorithm:error:",  v13,  a5);
  CFStringRef v14 = (MSCMSSignedData *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    uint64_t v15 = (void *)MEMORY[0x189604010];
    +[MSAlgorithmIdentifier algorithmIdentifierWithOID:]( &OBJC_CLASS___MSAlgorithmIdentifier,  "algorithmIdentifierWithOID:",  v14);
    CFErrorRef v16 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v17 = [v15 setWithObject:v16];
    digestAlgorithms = v11->_digestAlgorithms;
    v11->_digestAlgorithms = (NSSet *)v17;

    dataContent = v11->_dataContent;
    v11->_dataContent = 0LL;

    objc_storeStrong((id *)&v11->_embeddedContent, a3);
    v11->_detached = 0;
    uint64_t v20 = [MEMORY[0x189603F18] arrayWithObject:v10];
    signers = v11->_signers;
    v11->_signers = (NSArray *)v20;

    [v10 setContainingSignedData:v11];
    uint64_t v22 = [v9 type];
    contentType = v11->_contentType;
    v11->_contentType = (MSOID *)v22;

    uint64_t v24 = objc_msgSend(MEMORY[0x189603FE0], "setWithObject:", objc_msgSend(v10, "signerCertificate"));
    certificates = v11->_certificates;
    v11->_certificates = (NSMutableSet *)v24;

    -[MSCMSSignedData addCounterSignerCertificates:mode:error:]( v11,  "addCounterSignerCertificates:mode:error:",  v10,  1LL,  0LL);
LABEL_4:
    CFStringRef v14 = v11;
  }

  return v14;
}

- (MSCMSSignedData)initWithEmbeddedContent:(id)a3 signer:(id)a4 additionalCertificates:(id)a5 error:(id *)a6
{
  id v10 = a5;
  id v11 = -[MSCMSSignedData initWithEmbeddedContent:signer:error:]( self,  "initWithEmbeddedContent:signer:error:",  a3,  a4,  a6);
  id v12 = v11;
  if (v10 && v11) {
    -[NSMutableSet addObjectsFromArray:](v11->_certificates, "addObjectsFromArray:", v10);
  }

  return v12;
}

- (MSCMSSignedData)initWithEmbeddedContent:(id)a3 signer:(id)a4 signerChainMode:(unint64_t)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = -[MSCMSSignedData initWithEmbeddedContent:signer:error:]( self,  "initWithEmbeddedContent:signer:error:",  a3,  v10,  a6);
  id v12 = v11;
  if (!v11) {
    goto LABEL_7;
  }
  if (!a5)
  {
    -[NSMutableSet removeAllObjects](v11->_certificates, "removeAllObjects");
    goto LABEL_6;
  }

  if (-[MSCMSSignedData addCertificatesForSigner:mode:error:](v11, "addCertificatesForSigner:mode:error:", v10, a5, a6))
  {
LABEL_6:
    -[MSCMSSignedData addCounterSignerCertificates:mode:error:]( v12,  "addCounterSignerCertificates:mode:error:",  v10,  a5,  0LL);
LABEL_7:
    CFStringRef v13 = v12;
    goto LABEL_8;
  }

  CFStringRef v13 = 0LL;
LABEL_8:

  return v13;
}

- (id)initCertsOnlyWithCertificates:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___MSCMSSignedData;
  v7 = -[MSCMSSignedData init](&v20, sel_init);
  if (v7)
  {
    uint64_t v8 = [MEMORY[0x189604010] set];
    digestAlgorithms = v7->_digestAlgorithms;
    v7->_digestAlgorithms = (NSSet *)v8;

    dataContent = v7->_dataContent;
    v7->_dataContent = 0LL;

    embeddedContent = v7->_embeddedContent;
    v7->_embeddedContent = 0LL;

    v7->_detached = 1;
    uint64_t v12 = [MEMORY[0x189603F18] array];
    signers = v7->_signers;
    v7->_signers = (NSArray *)v12;

    uint64_t v14 = +[MSOID OIDWithString:error:](&OBJC_CLASS___MSOID, "OIDWithString:error:", @"1.2.840.113549.1.7.1", a4);
    contentType = v7->_contentType;
    v7->_contentType = (MSOID *)v14;

    if (!v7->_contentType)
    {
      v18 = 0LL;
      goto LABEL_6;
    }

    uint64_t v16 = [MEMORY[0x189603FE0] setWithArray:v6];
    certificates = v7->_certificates;
    v7->_certificates = (NSMutableSet *)v16;
  }

  v18 = v7;
LABEL_6:

  return v18;
}

- (void)addSigner:(id)a3
{
  if (a3)
  {
    v4 = (void *)MEMORY[0x189603FA8];
    signers = self->_signers;
    id v8 = a3;
    [v4 arrayWithArray:signers];
    id v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v6, "addObject:", v8);
    -[MSCMSSignedData addDigestAlgorithmFromSigner:](self, "addDigestAlgorithmFromSigner:", v8);
    -[NSMutableSet addObject:](self->_certificates, "addObject:", [v8 signerCertificate]);
    v7 = self->_signers;
    self->_signers = v6;

    [v8 setContainingSignedData:self];
    -[MSCMSSignedData addCounterSignerCertificates:mode:error:]( self,  "addCounterSignerCertificates:mode:error:",  v8,  1LL,  0LL);
  }

- (void)addSigner:(id)a3 withCertificates:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if (v7)
  {
    -[MSCMSSignedData addSigner:](self, "addSigner:", v7);
    if (v6) {
      -[NSMutableSet addObjectsFromArray:](self->_certificates, "addObjectsFromArray:", v6);
    }
    -[MSCMSSignedData addCounterSignerCertificates:mode:error:]( self,  "addCounterSignerCertificates:mode:error:",  v7,  1LL,  0LL);
  }
}

- (BOOL)addSigner:(id)a3 withChainMode:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  if (v8)
  {
    [MEMORY[0x189603FA8] arrayWithArray:self->_signers];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 addObject:v8];
    -[MSCMSSignedData addDigestAlgorithmFromSigner:](self, "addDigestAlgorithmFromSigner:", v8);
    BOOL v10 = -[MSCMSSignedData addCertificatesForSigner:mode:error:]( self,  "addCertificatesForSigner:mode:error:",  v8,  a4,  a5);
    if (v10)
    {
      -[MSCMSSignedData addCounterSignerCertificates:mode:error:]( self,  "addCounterSignerCertificates:mode:error:",  v8,  a4,  0LL);
      objc_storeStrong((id *)&self->_signers, v9);
      [v8 setContainingSignedData:self];
    }
  }

  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (void)removeSignerCertificatesWithIndexes:(id)a3
{
  signers = self->_signers;
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __55__MSCMSSignedData_removeSignerCertificatesWithIndexes___block_invoke;
  v4[3] = &unk_189B4A860;
  v4[4] = self;
  -[NSArray enumerateObjectsAtIndexes:options:usingBlock:]( signers,  "enumerateObjectsAtIndexes:options:usingBlock:",  a3,  0LL,  v4);
}

uint64_t __55__MSCMSSignedData_removeSignerCertificatesWithIndexes___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setContainingSignedData:0];
  v4 = *(void **)(*(void *)(a1 + 32) + 56LL);
  uint64_t v5 = [v3 signerCertificate];

  return [v4 removeObject:v5];
}

- (void)removeSignersWithIndexes:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([v6 count])
  {
    [MEMORY[0x189603FA8] arrayWithArray:self->_signers];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 removeObjectsAtIndexes:v6];
    -[MSCMSSignedData removeSignerCertificatesWithIndexes:](self, "removeSignerCertificatesWithIndexes:", v6);
    objc_storeStrong((id *)&self->_signers, v7);
    uint64_t v12 = 0LL;
    CFStringRef v13 = &v12;
    uint64_t v14 = 0x3032000000LL;
    uint64_t v15 = __Block_byref_object_copy__0;
    uint64_t v16 = __Block_byref_object_dispose__0;
    [MEMORY[0x189603FE0] set];
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    signers = self->_signers;
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 3221225472LL;
    v11[2] = __50__MSCMSSignedData_removeSignersWithIndexes_error___block_invoke;
    v11[3] = &unk_189B4A888;
    v11[4] = &v12;
    -[NSArray enumerateObjectsUsingBlock:](signers, "enumerateObjectsUsingBlock:", v11);
    objc_storeStrong((id *)&self->_digestAlgorithms, (id)v13[5]);
    _Block_object_dispose(&v12, 8);
  }

  else
  {
    if (a4 && *a4) {
      id v9 = (void *)[*a4 copy];
    }
    else {
      id v9 = 0LL;
    }
    +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  MSErrorCMSDomain[0],  -50LL,  v9,  @"no signer with input certificate hash");
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (a4 && v10) {
      *a4 = v10;
    }
  }
}

void __50__MSCMSSignedData_removeSignersWithIndexes_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v3];
    id v3 = v4;
  }
}

- (void)removeSignersWithCertificate:(__SecCertificate *)a3 error:(id *)a4
{
  uint64_t v9 = 0LL;
  BOOL v10 = &v9;
  uint64_t v11 = 0x3032000000LL;
  uint64_t v12 = __Block_byref_object_copy__0;
  CFStringRef v13 = __Block_byref_object_dispose__0;
  [MEMORY[0x189607938] indexSet];
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  signers = self->_signers;
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __54__MSCMSSignedData_removeSignersWithCertificate_error___block_invoke;
  v8[3] = &unk_189B4A8B0;
  v8[4] = &v9;
  v8[5] = a3;
  -[NSArray enumerateObjectsUsingBlock:](signers, "enumerateObjectsUsingBlock:", v8);
  -[MSCMSSignedData removeSignersWithIndexes:error:](self, "removeSignersWithIndexes:error:", v10[5], a4);
  _Block_object_dispose(&v9, 8);
}

uint64_t __54__MSCMSSignedData_removeSignersWithCertificate_error___block_invoke( uint64_t a1,  void *a2,  uint64_t a3)
{
  uint64_t result = CFEqual(*(CFTypeRef *)(a1 + 40), (CFTypeRef)[a2 signerCertificate]);
  if ((_DWORD)result) {
    return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addIndex:a3];
  }
  return result;
}

- (void)removeSignersWithEmailAddress:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v15 = 0LL;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  v18 = __Block_byref_object_copy__0;
  uint64_t v19 = __Block_byref_object_dispose__0;
  [MEMORY[0x189607938] indexSet];
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  signers = self->_signers;
  uint64_t v9 = MEMORY[0x1895F87A8];
  uint64_t v10 = 3221225472LL;
  uint64_t v11 = __55__MSCMSSignedData_removeSignersWithEmailAddress_error___block_invoke;
  uint64_t v12 = &unk_189B4A900;
  id v8 = v6;
  id v13 = v8;
  id v14 = &v15;
  -[NSArray enumerateObjectsUsingBlock:](signers, "enumerateObjectsUsingBlock:", &v9);
  -[MSCMSSignedData removeSignersWithIndexes:error:]( self,  "removeSignersWithIndexes:error:",  v16[5],  a4,  v9,  v10,  v11,  v12);

  _Block_object_dispose(&v15, 8);
}

void __55__MSCMSSignedData_removeSignersWithEmailAddress_error___block_invoke( uint64_t a1,  void *a2,  uint64_t a3)
{
  id v7 = (id)SecCertificateCopyRFC822Names();
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __55__MSCMSSignedData_removeSignersWithEmailAddress_error___block_invoke_2;
  v8[3] = &unk_189B4A8D8;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v9 = v5;
  uint64_t v10 = v6;
  uint64_t v11 = a3;
  [v7 enumerateObjectsUsingBlock:v8];
}

uint64_t __55__MSCMSSignedData_removeSignersWithEmailAddress_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) caseInsensitiveCompare:a2];
  if (!result) {
    return [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addIndex:*(void *)(a1 + 48)];
  }
  return result;
}

- (void)removeSignersWithIdentity:(__SecIdentity *)a3 error:(id *)a4
{
  if (a4 && *a4) {
    id v7 = (void *)[*a4 copy];
  }
  else {
    id v7 = 0LL;
  }
  id v12 = v7;
  SecCertificateRef v8 = MSSecIdentityCopyCertificateWithError(a3, &v12);
  id v9 = v12;

  if (v8)
  {
    id v11 = v9;
    -[MSCMSSignedData removeSignersWithCertificate:error:](self, "removeSignersWithCertificate:error:", v8, &v11);
    id v10 = v11;

    id v9 = v10;
  }

  if (a4 && v9) {
    *a4 = v9;
  }
  if (v8) {
    CFRelease(v8);
  }
}

- (__SecCertificate)getSignerCertificate:(unint64_t)a3 error:(id *)a4
{
  if (-[NSArray count](self->_signers, "count") - 1 >= a3)
  {
    -[NSArray objectAtIndex:](self->_signers, "objectAtIndex:", a3);
    SecCertificateRef v8 = (void *)objc_claimAutoreleasedReturnValue();
    id v9 = (__SecCertificate *)[v8 signerCertificate];

    return v9;
  }

  else
  {
    if (a4)
    {
      +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  MSErrorCMSDomain[0],  -50LL,  *a4,  @"signer index, %lu, out of range of signer count, %lu",  a3,  -[NSArray count](self->_signers, "count"));
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

    return 0LL;
  }

- (BOOL)verifySignatures:(id *)a3
{
  uint64_t v20 = 0LL;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000LL;
  char v23 = 0;
  uint64_t v14 = 0LL;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000LL;
  uint64_t v17 = __Block_byref_object_copy__0;
  v18 = __Block_byref_object_dispose__0;
  if (a3)
  {
    id v5 = *a3;
    if (*a3) {
      id v5 = (id)[v5 copy];
    }
  }

  else
  {
    id v5 = 0LL;
  }

  id v19 = v5;
  uint64_t v6 = MEMORY[0x1895F87A8];
  signers = self->_signers;
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __36__MSCMSSignedData_verifySignatures___block_invoke;
  v13[3] = &unk_189B4A860;
  v13[4] = self;
  -[NSArray enumerateObjectsUsingBlock:](signers, "enumerateObjectsUsingBlock:", v13);
  SecCertificateRef v8 = self->_signers;
  v12[0] = v6;
  v12[1] = 3221225472LL;
  v12[2] = __36__MSCMSSignedData_verifySignatures___block_invoke_3;
  v12[3] = &unk_189B4A950;
  v12[4] = &v14;
  v12[5] = &v20;
  v12[6] = a3;
  -[NSArray enumerateObjectsUsingBlock:](v8, "enumerateObjectsUsingBlock:", v12);
  if (a3)
  {
    id v9 = (void *)v15[5];
    if (v9) {
      *a3 = v9;
    }
  }

  BOOL v10 = *((_BYTE *)v21 + 24) == 0;
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  return v10;
}

void __36__MSCMSSignedData_verifySignatures___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 protectedAttributes];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MSOID OIDWithString:error:](&OBJC_CLASS___MSOID, "OIDWithString:error:", @"1.2.840.113549.1.9.2.51", 0LL);
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 getAttributesWithType:v5];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = 0LL;
  v14[1] = v14;
  v14[2] = 0x2020000000LL;
  v14[3] = [v6 count];
  id v7 = *(void **)(*(void *)(a1 + 32) + 40LL);
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __36__MSCMSSignedData_verifySignatures___block_invoke_2;
  v10[3] = &unk_189B4A928;
  id v8 = v3;
  id v11 = v8;
  id v13 = v14;
  id v9 = v6;
  id v12 = v9;
  [v7 enumerateObjectsUsingBlock:v10];

  _Block_object_dispose(v14, 8);
}

void __36__MSCMSSignedData_verifySignatures___block_invoke_2(void *a1, void *a2)
{
  id v3 = a2;
  if ((id)a1[4] != v3)
  {
    uint64_t v4 = *(void *)(a1[6] + 8LL);
    uint64_t v5 = *(void *)(v4 + 24);
    if (v5)
    {
      id v9 = v3;
      uint64_t v6 = (void *)a1[5];
      *(void *)(v4 + 24) = v5 - 1;
      objc_msgSend(v6, "objectAtIndex:");
      id v7 = (void *)objc_claimAutoreleasedReturnValue();
      [v9 calculateSignedAttributesDigest:0];
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 setSignedAttrsHash:v8];

      id v3 = v9;
    }
  }
}

void __36__MSCMSSignedData_verifySignatures___block_invoke_3(void *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v16 = a2;
  if (([v16 verifySignature:a1[6]] & 1) == 0)
  {
    uint64_t v7 = +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  MSErrorCMSDomain[0],  -67808LL,  *(void *)(*(void *)(a1[4] + 8LL) + 40LL),  @"signature verification failed for signer %lu",  a3);
    uint64_t v8 = *(void *)(a1[4] + 8LL);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    *a4 = 1;
    *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = 1;
  }

  if (!*(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL))
  {
    if (([v16 verifyCountersignatures:a1[6]] & 1) == 0)
    {
      uint64_t v10 = +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  MSErrorCMSDomain[0],  -67808LL,  *(void *)(*(void *)(a1[4] + 8LL) + 40LL),  @"countersignature verification failed for signer %lu",  a3);
      uint64_t v11 = *(void *)(a1[4] + 8LL);
      id v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v10;

      *a4 = 1;
      *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = 1;
    }

    if (!*(_BYTE *)(*(void *)(a1[5] + 8) + 24) && ([v16 verifyTimestamps:a1[6]] & 1) == 0)
    {
      uint64_t v13 = +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  MSErrorCMSDomain[0],  -67808LL,  *(void *)(*(void *)(a1[4] + 8LL) + 40LL),  @"timestamp verification failed for signer %lu",  a3);
      uint64_t v14 = *(void *)(a1[4] + 8LL);
      uint64_t v15 = *(void **)(v14 + 40);
      *(void *)(v14 + 40) = v13;

      *a4 = 1;
      *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = 1;
    }
  }
}

- (BOOL)verifySignaturesAndSignersWithPolicies:(id)a3 verifyTime:(id)a4 anchorCertificates:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v34 = 0LL;
  __int128 v35 = &v34;
  uint64_t v36 = 0x2020000000LL;
  char v37 = 0;
  uint64_t v28 = 0LL;
  CFStringRef v29 = &v28;
  uint64_t v30 = 0x3032000000LL;
  __int128 v31 = __Block_byref_object_copy__0;
  __int128 v32 = __Block_byref_object_dispose__0;
  if (a6)
  {
    id v13 = *a6;
    if (*a6) {
      id v13 = (id)[v13 copy];
    }
  }

  else
  {
    id v13 = 0LL;
  }

  id v33 = v13;
  signers = self->_signers;
  v21[0] = MEMORY[0x1895F87A8];
  v21[1] = 3221225472LL;
  v21[2] = __94__MSCMSSignedData_verifySignaturesAndSignersWithPolicies_verifyTime_anchorCertificates_error___block_invoke;
  v21[3] = &unk_189B4A978;
  id v15 = v10;
  id v22 = v15;
  id v16 = v11;
  id v23 = v16;
  id v17 = v12;
  id v24 = v17;
  uint64_t v25 = &v28;
  uint64_t v26 = &v34;
  objc_super v27 = a6;
  -[NSArray enumerateObjectsUsingBlock:](signers, "enumerateObjectsUsingBlock:", v21);
  if (a6)
  {
    v18 = (void *)v29[5];
    if (v18) {
      *a6 = v18;
    }
  }

  BOOL v19 = *((_BYTE *)v35 + 24) == 0;

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v34, 8);

  return v19;
}

void __94__MSCMSSignedData_verifySignaturesAndSignersWithPolicies_verifyTime_anchorCertificates_error___block_invoke( void *a1,  void *a2,  uint64_t a3,  _BYTE *a4)
{
  id v16 = a2;
  if (([v16 verifySignatureAndSignerWithPolicies:a1[4] verifyTime:a1[5] anchorCertificates:a1[6] error:a1[9]] & 1) == 0)
  {
    uint64_t v7 = +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  MSErrorCMSDomain[0],  -67808LL,  *(void *)(*(void *)(a1[7] + 8LL) + 40LL),  @"signer verification failed for signer %lu",  a3);
    uint64_t v8 = *(void *)(a1[7] + 8LL);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    *a4 = 1;
    *(_BYTE *)(*(void *)(a1[8] + 8LL) + 24LL) = 1;
  }

  if (!*(_BYTE *)(*(void *)(a1[8] + 8LL) + 24LL))
  {
    if (([v16 verifyCountersignaturesAndCountersignersWithPolicies:a1[4] verifyTime:a1[5] anchorCertificates:a1[6] error:a1[9]] & 1) == 0)
    {
      uint64_t v10 = +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  MSErrorCMSDomain[0],  -67808LL,  *(void *)(*(void *)(a1[7] + 8LL) + 40LL),  @"countersigner verification failed for signer %lu",  a3);
      uint64_t v11 = *(void *)(a1[7] + 8LL);
      id v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v10;

      *a4 = 1;
      *(_BYTE *)(*(void *)(a1[8] + 8LL) + 24LL) = 1;
    }

    if (!*(_BYTE *)(*(void *)(a1[8] + 8) + 24) && ([v16 verifyTimestamps:a1[9]] & 1) == 0)
    {
      uint64_t v13 = +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  MSErrorCMSDomain[0],  -67808LL,  *(void *)(*(void *)(a1[7] + 8LL) + 40LL),  @"countersignature verification failed for signer %lu",  a3);
      uint64_t v14 = *(void *)(a1[7] + 8LL);
      id v15 = *(void **)(v14 + 40);
      *(void *)(v14 + 40) = v13;

      *a4 = 1;
      *(_BYTE *)(*(void *)(a1[8] + 8LL) + 24LL) = 1;
    }
  }
}

- (BOOL)verifySignaturesAndSignersWithPolicies:(id)a3 verifyTime:(id)a4 error:(id *)a5
{
  return -[MSCMSSignedData verifySignaturesAndSignersWithPolicies:verifyTime:anchorCertificates:error:]( self,  "verifySignaturesAndSignersWithPolicies:verifyTime:anchorCertificates:error:",  a3,  a4,  0LL,  a5);
}

- (BOOL)checkSignedPerRFC5652:(id *)a3
{
  if (a3 && *a3) {
    uint64_t v5 = (void *)[*a3 copy];
  }
  else {
    uint64_t v5 = 0LL;
  }
  if (!-[NSArray count](self->_signers, "count")
    && (!-[MSOID isEqualToString:](self->_contentType, "isEqualToString:", @"1.2.840.113549.1.7.1")
     || (dataContent = self->_dataContent) != 0LL && -[NSData length](dataContent, "length")))
  {
    uint64_t v9 = +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  MSErrorCMSDomain[0],  -26275LL,  v5,  @"signedData contains content but has no signers");

    BOOL v7 = 0;
    uint64_t v5 = (void *)v9;
    if (!a3) {
      goto LABEL_14;
    }
    goto LABEL_12;
  }

  if (!-[MSOID isEqualToString:](self->_contentType, "isEqualToString:", @"1.2.840.113549.1.7.1")) {
    -[NSArray enumerateObjectsUsingBlock:](self->_signers, "enumerateObjectsUsingBlock:", &__block_literal_global_38);
  }
  BOOL v7 = 1;
  if (a3)
  {
LABEL_12:
    if (v5) {
      *a3 = v5;
    }
  }

void __41__MSCMSSignedData_checkSignedPerRFC5652___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  [a2 protectedAttributes];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 count];

  if (!v5)
  {
    if (MS_DEFAULT_LOG_BLOCK != -1) {
      dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_39);
    }
    uint64_t v6 = (os_log_s *)MS_DEFAULT_LOG_INTERNAL;
    if (os_log_type_enabled((os_log_t)MS_DEFAULT_LOG_INTERNAL, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 134217984;
      uint64_t v8 = a3;
      _os_log_impl( &dword_1810EE000,  v6,  OS_LOG_TYPE_DEFAULT,  "signedData contains embedded content but signer %lu does not have signed attributes.",  (uint8_t *)&v7,  0xCu);
    }
  }

void __41__MSCMSSignedData_checkSignedPerRFC5652___block_invoke_2()
{
  os_log_t v0 = os_log_create("com.apple.MessageSecurity", "default");
  v1 = (void *)MS_DEFAULT_LOG_INTERNAL;
  MS_DEFAULT_LOG_INTERNAL = (uint64_t)v0;
}

- (void)addDigestAlgorithmFromSigner:(id)a3
{
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    uint64_t v4 = (void *)MEMORY[0x189603FE0];
    -[MSCMSSignedData digestAlgorithms](self, "digestAlgorithms");
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setWithSet:v5];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

    [v6 addObject:v7];
    -[MSCMSSignedData setDigestAlgorithms:](self, "setDigestAlgorithms:", v6);
  }
}

- (id)calculateContentDigestWithAlgorithm:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)[v6 ccdigest];
  if (v7)
  {
    [MEMORY[0x189603FB8] dataWithLength:*v7];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSData length](self->_dataContent, "length");
    -[NSData bytes](self->_dataContent, "bytes");
    a4 = v8;
    [a4 mutableBytes];
    ccdigest();
  }

  else if (a4)
  {
    uint64_t v9 = MSErrorCryptoDomain[0];
    id v10 = *a4;
    [v6 OIDString];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  v9,  -4LL,  v10,  @"%@ is not a supported digest algorithm",  v11);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    a4 = 0LL;
  }

  return a4;
}

- (id)encodeMessageSecurityObject:(id *)a3
{
  v97[1] = *MEMORY[0x1895F89C0];
  uint64_t v90 = 0LL;
  v91 = (id *)&v90;
  uint64_t v92 = 0x3032000000LL;
  v93 = __Block_byref_object_copy__0;
  v94 = __Block_byref_object_dispose__0;
  v70 = a3;
  if (a3)
  {
    id v4 = *a3;
    if (*a3) {
      id v4 = (id)[v4 copy];
    }
  }

  else
  {
    id v4 = 0LL;
  }

  id v95 = v4;
  uint64_t v78 = 0LL;
  v79 = &v78;
  uint64_t v80 = 0x2020000000LL;
  char v81 = 0;
  v77[0] = 0LL;
  v77[1] = v77;
  v77[2] = 0x2020000000LL;
  v77[3] = 0LL;
  digestAlgorithms = self->_digestAlgorithms;
  if (!digestAlgorithms)
  {
    uint64_t v54 = +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  MSErrorCMSDomain[0],  -50LL,  v91[5],  @"Unable to encode signedData: missing digest algorithms");
    id v55 = v91[5];
    v91[5] = (id)v54;

    goto LABEL_70;
  }

  uint64_t v6 = -[NSSet count](digestAlgorithms, "count");
  uint64_t v7 = MEMORY[0x1895F87A8];
  if (v6)
  {
    unsigned int v8 = -[NSSet count](self->_digestAlgorithms, "count");
    uint64_t v9 = malloc(24 * -[NSSet count](self->_digestAlgorithms, "count"));
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = self->_digestAlgorithms;
      v76[0] = v7;
      v76[1] = 3221225472LL;
      v76[2] = __47__MSCMSSignedData_encodeMessageSecurityObject___block_invoke;
      v76[3] = &unk_189B4AA00;
      v76[4] = v77;
      v76[5] = v10;
      -[NSSet enumerateObjectsUsingBlock:](v11, "enumerateObjectsUsingBlock:", v76);
      goto LABEL_13;
    }

    uint64_t v58 = +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  MSErrorAllocationDomain[0],  -67672LL,  v91[5],  @"Unable to encode signedData: unable to allocate digest algorithm array");
    id v59 = v91[5];
    v91[5] = (id)v58;

LABEL_70:
    id v10 = 0LL;
    goto LABEL_71;
  }

  if (-[NSArray count](self->_signers, "count") || self->_dataContent || self->_embeddedContent)
  {
    uint64_t v50 = +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  MSErrorCMSDomain[0],  -50LL,  v91[5],  @"Unable to encode signedData: missing digest algorithm and not certs-only message",  v70);
    id v51 = v91[5];
    v91[5] = (id)v50;

    goto LABEL_70;
  }

  id v10 = 0LL;
  unsigned int v8 = 0;
LABEL_13:
  contentType = self->_contentType;
  if (!contentType)
  {
    uint64_t v56 = +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  MSErrorCMSDomain[0],  -50LL,  v91[5],  @"Unable to encode signedData: missing content type");
    id v57 = v91[5];
    v91[5] = (id)v56;

    goto LABEL_71;
  }

  if (!self->_detached && !self->_dataContent && !self->_embeddedContent)
  {
    uint64_t v66 = +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  MSErrorCMSDomain[0],  -50LL,  v91[5],  @"Unable to encode signedData: content is not detached and no content specified");
    id v67 = v91[5];
    v91[5] = (id)v66;

    goto LABEL_71;
  }

  uint64_t v13 = -[MSOID Asn1OID](contentType, "Asn1OID", v70);
  uint64_t v15 = v14;
  if (self->_detached)
  {
    id v16 = 0LL;
  }

  else
  {
    if (-[MSOID isEqualToString:](self->_contentType, "isEqualToString:", @"1.2.840.113549.1.7.1"))
    {
      dataContent = self->_dataContent;
      if (!dataContent)
      {
        uint64_t v18 = +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  MSErrorCMSDomain[0],  -50LL,  v91[5],  @"Unable to encode signedData: id-data content type and no data content");
        id v19 = v91[5];
        v91[5] = (id)v18;

        goto LABEL_71;
      }
    }

    else if (self->_contentType)
    {
      embeddedContent = self->_embeddedContent;
      if (!embeddedContent)
      {
        uint64_t v68 = +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  MSErrorCMSDomain[0],  -50LL,  v91[5],  @"Unable to encode signedData: embedded content type specified and no embedded content");
        id v69 = v91[5];
        v91[5] = (id)v68;

        goto LABEL_71;
      }

      uint64_t v21 = v91;
      id obj = v91[5];
      -[MSCMSMessage encodeMessageSecurityObject:](embeddedContent, "encodeMessageSecurityObject:", &obj);
      id v22 = (NSData *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong(v21 + 5, obj);
      id v23 = self->_dataContent;
      self->_dataContent = v22;

      self->_contentChanged = 1;
      dataContent = self->_dataContent;
      if (!dataContent) {
        goto LABEL_71;
      }
    }

    else
    {
      dataContent = self->_dataContent;
    }

    v84[1] = -[NSData bytes](dataContent, "bytes");
    v84[0] = -[NSData length](self->_dataContent, "length");
    id v16 = v84;
  }

  certificates = self->_certificates;
  if (certificates)
  {
    certificates = (NSMutableSet *)-[NSMutableSet count](certificates, "count");
    if (certificates)
    {
      uint64_t v25 = malloc(24 * -[NSMutableSet count](self->_certificates, "count"));
      if (v25)
      {
        uint64_t v26 = v25;
        -[NSMutableSet allObjects](self->_certificates, "allObjects");
        objc_super v27 = (void *)objc_claimAutoreleasedReturnValue();
        v74[0] = v7;
        v74[1] = 3221225472LL;
        v74[2] = __47__MSCMSSignedData_encodeMessageSecurityObject___block_invoke_2;
        v74[3] = &__block_descriptor_40_e15_v32__0_8Q16_B24l;
        v74[4] = v26;
        [v27 enumerateObjectsUsingBlock:v74];

        LODWORD(certificates) = -[NSMutableSet count](self->_certificates, "count");
        goto LABEL_33;
      }

      uint64_t v64 = +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  MSErrorAllocationDomain[0],  -67672LL,  v91[5],  @"Unable to encode signedData: unable to allocate certificates array");
      id v65 = v91[5];
      v91[5] = (id)v64;

LABEL_71:
      uint64_t v26 = 0LL;
LABEL_72:
      CFStringRef v29 = 0LL;
      goto LABEL_73;
    }
  }

  uint64_t v26 = 0LL;
LABEL_33:
  int v82 = (int)certificates;
  v83 = v26;
  if (!-[NSArray count](self->_signers, "count"))
  {
    if (!-[NSSet count](self->_digestAlgorithms, "count") && !self->_embeddedContent && !self->_dataContent)
    {
      unsigned int v32 = 0;
      CFStringRef v29 = 0LL;
      goto LABEL_41;
    }

    uint64_t v52 = +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  MSErrorCMSDomain[0],  -50LL,  v91[5],  @"Unable to encode signedData: no signers and not certs-only message");
    id v53 = v91[5];
    v91[5] = (id)v52;

    goto LABEL_72;
  }

  uint64_t v28 = (char *)malloc(104 * -[NSArray count](self->_signers, "count"));
  if (!v28)
  {
    uint64_t v60 = +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  MSErrorAllocationDomain[0],  -67672LL,  v91[5],  @"Unable to encode signedData: unable to allocate signerInfos array");
    id v61 = v91[5];
    v91[5] = (id)v60;

    goto LABEL_72;
  }

  CFStringRef v29 = v28;
  signers = self->_signers;
  v73[0] = v7;
  v73[1] = 3221225472LL;
  v73[2] = __47__MSCMSSignedData_encodeMessageSecurityObject___block_invoke_3;
  v73[3] = &unk_189B4A860;
  v73[4] = self;
  -[NSArray enumerateObjectsUsingBlock:](signers, "enumerateObjectsUsingBlock:", v73);
  __int128 v31 = self->_signers;
  v72[0] = v7;
  v72[1] = 3221225472LL;
  v72[2] = __47__MSCMSSignedData_encodeMessageSecurityObject___block_invoke_5;
  v72[3] = &unk_189B4A950;
  v72[4] = &v90;
  v72[5] = &v78;
  v72[6] = v29;
  -[NSArray enumerateObjectsUsingBlock:](v31, "enumerateObjectsUsingBlock:", v72);
  if (!*((_BYTE *)v79 + 24))
  {
    unsigned int v32 = -[NSArray count](self->_signers, "count");
LABEL_41:
    __int128 v88 = 0u;
    __int128 v89 = 0u;
    __int128 v86 = 0u;
    __int128 v87 = 0u;
    __int128 v85 = 0u;
    if (-[NSArray indexOfObjectPassingTest:](self->_signers, "indexOfObjectPassingTest:", &__block_literal_global_67) == 0x7FFFFFFFFFFFFFFFLL
      && -[MSOID isEqualToString:](self->_contentType, "isEqualToString:", @"1.2.840.113549.1.7.1"))
    {
      LODWORD(v85) = 1;
      [MEMORY[0x189607968] numberWithInteger:1];
      id v33 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      LODWORD(v85) = 3;
      [MEMORY[0x189607968] numberWithInteger:3];
      id v33 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    }

    version = self->_version;
    self->_version = v33;

    *((void *)&v85 + 1) = v8;
    *(void *)&__int128 v86 = v10;
    *((void *)&v86 + 1) = v13;
    *(void *)&__int128 v87 = v15;
    *((void *)&v87 + 1) = v16;
    *(void *)&__int128 v88 = &v82;
    *(void *)&__int128 v89 = v32;
    *((void *)&v89 + 1) = v29;
    uint64_t v35 = length_CMSSignedData();
    [MEMORY[0x189603FB8] dataWithLength:v35];
    uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (v36)
    {
      id v37 = v36;
      [v37 mutableBytes];
      int v38 = encode_CMSSignedData();
      if (!v38)
      {
        if (v35 != v71)
        {
          id result = (id)asn1_abort();
          __break(1u);
          return result;
        }

        goto LABEL_51;
      }

      uint64_t v39 = v38;
    }

    else
    {
      uint64_t v39 = 12LL;
    }

    v40 = (void *)MEMORY[0x189607870];
    uint64_t v96 = *MEMORY[0x1896075E0];
    v97[0] = @"Failed encoding type CMSSignedData";
    [MEMORY[0x189603F68] dictionaryWithObjects:v97 forKeys:&v96 count:1];
    uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v42 = [v40 errorWithDomain:@"com.apple.HeimASN1" code:v39 userInfo:v41];
    id v43 = v91[5];
    v91[5] = (id)v42;

    id v37 = 0LL;
LABEL_51:
    self->_contentChanged = 0;
    goto LABEL_52;
  }

  uint64_t v62 = +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  MSErrorCMSDomain[0],  -50LL,  v91[5],  @"Unable to encode signedData: failed to encode a SignerInfo");
  id v63 = v91[5];
  v91[5] = (id)v62;

LABEL_73:
  id v37 = 0LL;
LABEL_52:
  if (v70)
  {
    id v44 = v91[5];
    if (v44) {
      id *v70 = v44;
    }
  }

  if (v10) {
    free(v10);
  }
  if (v26) {
    free(v26);
  }
  if (v29)
  {
    unint64_t v45 = 0LL;
    for (uint64_t i = v29; ; i += 104)
    {
      v47 = -[MSCMSSignedData signers](self, "signers", v70);
      BOOL v48 = v45 < [v47 count];

      if (!v48) {
        break;
      }
      free_SignerInfo();
      ++v45;
    }

    free(v29);
  }

  _Block_object_dispose(v77, 8);
  _Block_object_dispose(&v78, 8);
  _Block_object_dispose(&v90, 8);

  return v37;
}

__n128 __47__MSCMSSignedData_encodeMessageSecurityObject___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (__n128 *)(*(void *)(a1 + 40) + 24LL * *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL));
  id v4 = (__n128 *)[a2 asn1AlgId];
  __n128 result = *v4;
  v3[1].n128_u64[0] = v4[1].n128_u64[0];
  *id v3 = result;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  return result;
}

void __47__MSCMSSignedData_encodeMessageSecurityObject___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = 3 * a3;
  *(_DWORD *)(*(void *)(a1 + 32) + 24 * a3) = 1;
  id v5 = a2;
  *(void *)(*(void *)(a1 + 32) + 8 * v4 + 16) = SecCertificateGetBytePtr();
  uint64_t Length = SecCertificateGetLength();

  *(void *)(*(void *)(a1 + 32) + 8 * v4 + 8) = Length;
}

void __47__MSCMSSignedData_encodeMessageSecurityObject___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 protectedAttributes];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MSOID OIDWithString:error:](&OBJC_CLASS___MSOID, "OIDWithString:error:", @"1.2.840.113549.1.9.2.51", 0LL);
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 getAttributesWithType:v5];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = 0LL;
  v14[1] = v14;
  v14[2] = 0x2020000000LL;
  v14[3] = [v6 count];
  uint64_t v7 = *(void **)(*(void *)(a1 + 32) + 40LL);
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __47__MSCMSSignedData_encodeMessageSecurityObject___block_invoke_4;
  v10[3] = &unk_189B4A928;
  id v8 = v3;
  id v11 = v8;
  uint64_t v13 = v14;
  id v9 = v6;
  id v12 = v9;
  [v7 enumerateObjectsUsingBlock:v10];

  _Block_object_dispose(v14, 8);
}

void __47__MSCMSSignedData_encodeMessageSecurityObject___block_invoke_4(void *a1, void *a2)
{
  id v3 = a2;
  if ((id)a1[4] != v3)
  {
    uint64_t v4 = *(void *)(a1[6] + 8LL);
    uint64_t v5 = *(void *)(v4 + 24);
    if (v5)
    {
      id v9 = v3;
      uint64_t v6 = (void *)a1[5];
      *(void *)(v4 + 24) = v5 - 1;
      objc_msgSend(v6, "objectAtIndex:");
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
      [v9 calculateSignedAttributesDigest:0];
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 setSignedAttrsHash:v8];

      id v3 = v9;
    }
  }
}

void __47__MSCMSSignedData_encodeMessageSecurityObject___block_invoke_5( void *a1,  void *a2,  uint64_t a3,  _BYTE *a4)
{
  uint64_t v6 = a1[6] + 104 * a3;
  uint64_t v7 = *(void *)(a1[4] + 8LL);
  id obj = *(id *)(v7 + 40);
  char v8 = [a2 encodeSignerInfo:v6 error:&obj];
  objc_storeStrong((id *)(v7 + 40), obj);
  if ((v8 & 1) == 0)
  {
    *a4 = 1;
    *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = 1;
  }

BOOL __47__MSCMSSignedData_encodeMessageSecurityObject___block_invoke_6(uint64_t a1, void *a2)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v3 = [v2 integerValue] > 1;

  return v3;
}

+ (id)decodeMessageSecurityObject:(id)a3 options:(id)a4 error:(id *)a5
{
  uint64_t v81 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v62 = a4;
  id v57 = a5;
  if (a5 && *a5) {
    char v8 = (void *)[*a5 copy];
  }
  else {
    char v8 = 0LL;
  }
  id v9 = objc_alloc(&OBJC_CLASS___MSCMSSignedData);
  __int128 v71 = 0u;
  __int128 v72 = 0u;
  __int128 v73 = 0u;
  __int128 v74 = 0u;
  __int128 v75 = 0u;
  id v59 = v7;
  int v10 = nsheim_decode_CMSSignedData(v7);
  if (v10)
  {
    id v11 = MSErrorASN1Domain[0];
    if (v7) {
      uint64_t v12 = [v7 length];
    }
    else {
      uint64_t v12 = -1LL;
    }
    +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  v11,  v10,  v8,  @"unable to decode signedData (%ld bytes)",  v12);
    id v19 = (id)objc_claimAutoreleasedReturnValue();

    dumpNSData("CMSSignedData", v7);
    uint64_t v20 = 0LL;
    uint64_t v60 = 0LL;
    id v61 = 0LL;
    goto LABEL_16;
  }

  [MEMORY[0x189607968] numberWithInt:v71];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSCMSSignedData setVersion:](v9, "setVersion:", v13);

  [MEMORY[0x189603FE0] setWithCapacity:DWORD2(v71)];
  uint64_t v60 = (void *)objc_claimAutoreleasedReturnValue();
  if (DWORD2(v71))
  {
    uint64_t v14 = 0LL;
    unint64_t v15 = 0LL;
    do
    {
      uint64_t v16 = *(void *)(v72 + v14 + 16);
      *(_OWORD *)buf = *(_OWORD *)(v72 + v14);
      uint64_t v77 = v16;
      id v70 = v8;
      +[MSAlgorithmIdentifier algorithmIdentifierWithAsn1AlgId:error:]( &OBJC_CLASS___MSAlgorithmIdentifier,  "algorithmIdentifierWithAsn1AlgId:error:",  buf,  &v70);
      id v17 = (void *)objc_claimAutoreleasedReturnValue();
      id v18 = v70;

      if (v17) {
        [v60 addObject:v17];
      }

      ++v15;
      v14 += 24LL;
      char v8 = v18;
    }

    while (v15 < DWORD2(v71));
  }

  else
  {
    id v18 = v8;
  }

  -[MSCMSSignedData setDigestAlgorithms:](v9, "setDigestAlgorithms:", v60);
  id v69 = v18;
  +[MSOID OIDWithAsn1OID:error:](&OBJC_CLASS___MSOID, "OIDWithAsn1OID:error:", (char *)&v72 + 8, &v69);
  uint64_t v58 = (void *)objc_claimAutoreleasedReturnValue();
  id v23 = v69;

  if (!v58)
  {
    +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  MSErrorCMSDomain[0],  -26275LL,  v23,  @"unable to get contentType from signedData");
    id v19 = (id)objc_claimAutoreleasedReturnValue();

    uint64_t v20 = 0LL;
    id v61 = 0LL;
LABEL_16:
    uint64_t v56 = 0LL;
    uint64_t v58 = 0LL;
LABEL_17:
    id v9 = 0LL;
    goto LABEL_18;
  }

  -[MSCMSSignedData setContentType:](v9, "setContentType:");
  uint64_t v24 = *((void *)&v73 + 1);
  if (*((void *)&v73 + 1))
  {
    NSDataFromAny(*((void **)&v73 + 1));
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSCMSSignedData setDataContent:](v9, "setDataContent:", v25);
  }

  -[MSCMSSignedData setDetached:](v9, "setDetached:", v24 == 0);
  if ([v58 isEqualToString:@"1.2.840.113549.1.7.1"])
  {
    uint64_t v56 = 0LL;
  }

  else
  {
    -[MSCMSSignedData dataContent](v9, "dataContent");
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
    id v68 = v23;
    decodeEmbeddedCMSContent(v58, v26, v62, (uint64_t)&v68);
    uint64_t v56 = (void *)objc_claimAutoreleasedReturnValue();
    id v27 = v68;

    if (v56) {
      -[MSCMSSignedData setEmbeddedContent:](v9, "setEmbeddedContent:");
    }
    else {
      uint64_t v56 = 0LL;
    }
    id v23 = v27;
  }

  -[MSCMSSignedData setContentChanged:](v9, "setContentChanged:", 0LL);
  if ((void)v74)
  {
    [MEMORY[0x189603FE0] setWithCapacity:*(unsigned int *)v74];
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v28 = v74;
    if (*(_DWORD *)v74)
    {
      uint64_t v29 = 0LL;
      unint64_t v30 = 0LL;
      while (*(_DWORD *)(*(void *)(v28 + 8) + v29) == 1)
      {
        __int128 v31 = (void *)SecCertificateCreateWithBytes();
        if (!v31)
        {
          if (MS_DEFAULT_LOG_BLOCK != -1) {
            dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_84);
          }
          uint64_t v35 = MS_DEFAULT_LOG_INTERNAL;
          if (!os_log_type_enabled((os_log_t)MS_DEFAULT_LOG_INTERNAL, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_47;
          }
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&uint8_t buf[4] = v30;
          id v33 = (os_log_s *)v35;
          uint64_t v34 = "unable to parse certificate at %u";
          goto LABEL_46;
        }

        [v20 addObject:v31];

LABEL_47:
        ++v30;
        uint64_t v28 = v74;
        v29 += 24LL;
      }

      if (MS_DEFAULT_LOG_BLOCK != -1) {
        dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_82);
      }
      uint64_t v32 = MS_DEFAULT_LOG_INTERNAL;
      if (!os_log_type_enabled((os_log_t)MS_DEFAULT_LOG_INTERNAL, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_47;
      }
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v30;
      id v33 = (os_log_s *)v32;
      uint64_t v34 = "skipping non-certificate CertificateChoice at %u";
LABEL_46:
      _os_log_impl(&dword_1810EE000, v33, OS_LOG_TYPE_DEFAULT, v34, buf, 8u);
      goto LABEL_47;
    }
  }

  else
  {
    if (MS_DEFAULT_LOG_BLOCK != -1) {
      dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_86);
    }
    uint64_t v36 = (os_log_s *)MS_DEFAULT_LOG_INTERNAL;
    if (os_log_type_enabled((os_log_t)MS_DEFAULT_LOG_INTERNAL, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1810EE000, v36, OS_LOG_TYPE_INFO, "No certificates in SignedData", buf, 2u);
    }

    [MEMORY[0x189603FE0] set];
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
  }

void __61__MSCMSSignedData_decodeMessageSecurityObject_options_error___block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.MessageSecurity", "default");
  v1 = (void *)MS_DEFAULT_LOG_INTERNAL;
  MS_DEFAULT_LOG_INTERNAL = (uint64_t)v0;
}

void __61__MSCMSSignedData_decodeMessageSecurityObject_options_error___block_invoke_83()
{
  os_log_t v0 = os_log_create("com.apple.MessageSecurity", "default");
  v1 = (void *)MS_DEFAULT_LOG_INTERNAL;
  MS_DEFAULT_LOG_INTERNAL = (uint64_t)v0;
}

void __61__MSCMSSignedData_decodeMessageSecurityObject_options_error___block_invoke_85()
{
  os_log_t v0 = os_log_create("com.apple.MessageSecurity", "default");
  v1 = (void *)MS_DEFAULT_LOG_INTERNAL;
  MS_DEFAULT_LOG_INTERNAL = (uint64_t)v0;
}

void __61__MSCMSSignedData_decodeMessageSecurityObject_options_error___block_invoke_96( uint64_t a1,  void *a2,  uint64_t a3,  _BYTE *a4)
{
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8LL);
  id obj = *(id *)(v5 + 40);
  char v6 = [a2 verifyTimestamps:1 error:&obj];
  objc_storeStrong((id *)(v5 + 40), obj);
  if ((v6 & 1) == 0) {
    *a4 = 1;
  }
}

- (MSOID)type
{
  return +[MSOID OIDWithString:error:](&OBJC_CLASS___MSOID, "OIDWithString:error:", @"1.2.840.113549.1.7.2", 0LL);
}

+ (BOOL)isImplementedInObjectiveC
{
  return 1;
}

- (NSData)dataContent
{
  return self->_dataContent;
}

- (MSCMSMessage)embeddedContent
{
  return (MSCMSMessage *)objc_getProperty(self, a2, 24LL, 1);
}

- (MSOID)contentType
{
  return (MSOID *)objc_getProperty(self, a2, 32LL, 1);
}

- (NSArray)signers
{
  return (NSArray *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setSigners:(id)a3
{
}

- (BOOL)detached
{
  return self->_detached;
}

- (void)setDetached:(BOOL)a3
{
  self->_detached = a3;
}

- (NSSet)digestAlgorithms
{
  return (NSSet *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setDigestAlgorithms:(id)a3
{
}

- (NSMutableSet)certificates
{
  return (NSMutableSet *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setCertificates:(id)a3
{
}

- (NSNumber)version
{
  return (NSNumber *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setVersion:(id)a3
{
}

- (MSDecodeOptions)options
{
  return (MSDecodeOptions *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setOptions:(id)a3
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

- (void).cxx_destruct
{
}

@end