@interface MSCMSSignerInfo
+ (id)decodeSignerInfo:(SignerInfo *)a3 certificates:(id)a4 LAContext:(id)a5 error:(id *)a6;
- (BOOL)contentChanged;
- (BOOL)createRequiredAttributes:(id *)a3;
- (BOOL)encodeSignerInfo:(SignerInfo *)a3 error:(id *)a4;
- (BOOL)sign:(id *)a3;
- (BOOL)signatureCalculated;
- (BOOL)useIssuerAndSerialNumber;
- (BOOL)verifyContentTypeAttribute:(id *)a3;
- (BOOL)verifyCountersignatures:(id *)a3;
- (BOOL)verifyCountersignaturesAndCountersignersWithPolicies:(id)a3 verifyTime:(id)a4 anchorCertificates:(id)a5 error:(id *)a6;
- (BOOL)verifyMessageDigestAttribute:(id)a3 error:(id *)a4;
- (BOOL)verifySignature:(id *)a3;
- (BOOL)verifySignatureAndSignerWithPolicies:(id)a3 verifyTime:(id)a4 anchorCertificates:(id)a5 error:(id *)a6;
- (BOOL)verifyTimestamps:(BOOL)a3 error:(id *)a4;
- (BOOL)verifyTimestamps:(id *)a3;
- (MSAlgorithmIdentifier)digestAlgorithm;
- (MSAlgorithmIdentifier)signatureAlgorithm;
- (MSCMSMutableAttributeArray)protectedAttributes;
- (MSCMSMutableAttributeArray)unprotectedAttributes;
- (MSCMSSignedData)containingSignedData;
- (MSCMSSignerInfo)initWithCertificate:(__SecCertificate *)a3 error:(id *)a4;
- (MSCMSSignerInfo)initWithCertificate:(__SecCertificate *)a3 recipientsAlgorithmCapabilities:(id)a4 error:(id *)a5;
- (MSCMSSignerInfo)initWithCertificate:(__SecCertificate *)a3 signatureAlgorithm:(id)a4 error:(id *)a5;
- (MSCMSSignerInfo)initWithCertificate:(__SecCertificate *)a3 signatureAlgorithm:(id)a4 useIssuerAndSerialNumber:(BOOL)a5 error:(id *)a6;
- (MSCMSSignerInfo)initWithEmail:(id)a3 LAContext:(id)a4 error:(id *)a5;
- (MSCMSSignerInfo)initWithEmail:(id)a3 recipientsAlgorithmCapabilities:(id)a4 LAContext:(id)a5 error:(id *)a6;
- (MSCMSSignerInfo)initWithEmail:(id)a3 signatureAlgorithm:(id)a4 LAContext:(id)a5 error:(id *)a6;
- (MSCMSSignerInfo)initWithIdentity:(__SecIdentity *)a3 error:(id *)a4;
- (MSCMSSignerInfo)initWithIdentity:(__SecIdentity *)a3 recipientsAlgorithmCapabilities:(id)a4 error:(id *)a5;
- (MSCMSSignerInfo)initWithIdentity:(__SecIdentity *)a3 signatureAlgorithm:(id)a4 error:(id *)a5;
- (MSCMSSignerInfo)initWithIdentity:(__SecIdentity *)a3 signatureAlgorithm:(id)a4 useIssuerAndSerialNumber:(BOOL)a5 error:(id *)a6;
- (NSArray)certificates;
- (NSData)LAContext;
- (NSData)identifierData;
- (NSData)signature;
- (NSData)signedAttrsData;
- (NSData)unsignedAttrsData;
- (NSNumber)version;
- (SignerInfo)encodedSignerInfo;
- (__SecCertificate)signerCertificate;
- (__SecKey)signerPrivKey;
- (__SecTrust)createTrustObjectWithPolicies:(id)a3 error:(id *)a4;
- (__SecTrust)createTrustObjectWithPolicies:(id)a3 verifyTime:(id)a4 anchorCertificates:(id)a5 error:(id *)a6;
- (id)calculateSignatureDigestWithAlgorithm:(id)a3 error:(id *)a4;
- (id)calculateSignedAttributesDigest:(id *)a3;
- (id)calculateSignerInfoDigest:(id *)a3;
- (id)getAttributesWithType:(id)a3;
- (id)getAttributesWithType:(id)a3 protectedAttributes:(BOOL)a4;
- (id)verifyTime:(id)a3;
- (void)addCounterSignerAttribute:(id)a3;
- (void)addMultipleSignaturesAttribute;
- (void)addProtectedAttribute:(id)a3;
- (void)addSMIMECapabilitiesAttribute:(id)a3;
- (void)addSMIMEEncryptionKeyPreferenceAttribute:(id)a3;
- (void)dealloc;
- (void)setContainingSignedData:(id)a3;
- (void)setContentChanged:(BOOL)a3;
- (void)setDigestAlgorithm:(id)a3;
- (void)setEncodedSignerInfo:(SignerInfo *)a3;
- (void)setIdentifierData:(id)a3;
- (void)setLAContext:(id)a3;
- (void)setProtectedAttributes:(id)a3;
- (void)setSignature:(id)a3;
- (void)setSignatureAlgorithm:(id)a3;
- (void)setSignedAttrsData:(id)a3;
- (void)setSignerCertificate:(__SecCertificate *)a3;
- (void)setSignerPrivKey:(__SecKey *)a3;
- (void)setUnprotectedAttributes:(id)a3;
- (void)setUnsignedAttrsData:(id)a3;
- (void)setUseIssuerAndSerialNumber:(BOOL)a3;
- (void)setVersion:(id)a3;
@end

@implementation MSCMSSignerInfo

- (MSCMSSignerInfo)initWithCertificate:(__SecCertificate *)a3 error:(id *)a4
{
  return -[MSCMSSignerInfo initWithCertificate:signatureAlgorithm:error:]( self,  "initWithCertificate:signatureAlgorithm:error:",  a3,  0LL,  a4);
}

- (MSCMSSignerInfo)initWithIdentity:(__SecIdentity *)a3 error:(id *)a4
{
  return -[MSCMSSignerInfo initWithIdentity:signatureAlgorithm:error:]( self,  "initWithIdentity:signatureAlgorithm:error:",  a3,  0LL,  a4);
}

- (MSCMSSignerInfo)initWithEmail:(id)a3 LAContext:(id)a4 error:(id *)a5
{
  return -[MSCMSSignerInfo initWithEmail:signatureAlgorithm:LAContext:error:]( self,  "initWithEmail:signatureAlgorithm:LAContext:error:",  a3,  0LL,  a4,  a5);
}

- (MSCMSSignerInfo)initWithCertificate:(__SecCertificate *)a3 signatureAlgorithm:(id)a4 error:(id *)a5
{
  uint64_t v37 = *MEMORY[0x1895F89C0];
  id v7 = a4;
  v32.receiver = self;
  v32.super_class = (Class)&OBJC_CLASS___MSCMSSignerInfo;
  v8 = -[MSCMSSignerInfo init](&v32, sel_init);
  if (!v8) {
    goto LABEL_24;
  }
  if (a3) {
    CFRetain(a3);
  }
  v8->_signerCertificate = a3;
  uint64_t v9 = +[MSCMSMutableAttributeArray array](&OBJC_CLASS___MSCMSMutableAttributeArray, "array");
  protectedAttributes = v8->_protectedAttributes;
  v8->_protectedAttributes = (MSCMSMutableAttributeArray *)v9;

  uint64_t v11 = +[MSCMSMutableAttributeArray array](&OBJC_CLASS___MSCMSMutableAttributeArray, "array");
  unprotectedAttributes = v8->_unprotectedAttributes;
  v8->_unprotectedAttributes = (MSCMSMutableAttributeArray *)v11;

  signature = v8->_signature;
  v8->_signature = 0LL;

  v8->_signatureCalculated = 0;
  v8->_signerPrivKey = 0LL;
  v8->_encodedSignerInfo = 0LL;
  if (!v7)
  {
    p_signatureAlgorithm = (void **)&v8->_signatureAlgorithm;
    goto LABEL_21;
  }

  uint64_t KeyTypeForCertificate = getKeyTypeForCertificate(a3);
  if (KeyTypeForCertificate == 3)
  {
    if (initWithCertificate_signatureAlgorithm_error__onceToken_4 != -1) {
      dispatch_once(&initWithCertificate_signatureAlgorithm_error__onceToken_4, &__block_literal_global_5_1);
    }
    v15 = (void *)initWithCertificate_signatureAlgorithm_error__sAllowedECSigAlgs;
    goto LABEL_14;
  }

  if (KeyTypeForCertificate == 1)
  {
    if (initWithCertificate_signatureAlgorithm_error__onceToken != -1) {
      dispatch_once(&initWithCertificate_signatureAlgorithm_error__onceToken, &__block_literal_global_8);
    }
    v15 = (void *)initWithCertificate_signatureAlgorithm_error__sAllowedRSASigAlgs;
LABEL_14:
    [v7 OIDString];
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    int v18 = [v15 containsObject:v17];

    if (v18)
    {
      uint64_t v19 = +[MSAlgorithmIdentifier algorithmIdentifierWithOID:]( &OBJC_CLASS___MSAlgorithmIdentifier,  "algorithmIdentifierWithOID:",  v7);
      signatureAlgorithm = v8->_signatureAlgorithm;
      v8->_signatureAlgorithm = (MSAlgorithmIdentifier *)v19;
    }
  }

  p_signatureAlgorithm = (void **)&v8->_signatureAlgorithm;
  if (v8->_signatureAlgorithm) {
    goto LABEL_23;
  }
  if (MS_DEFAULT_LOG_BLOCK != -1) {
    dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_6_0);
  }
  v21 = (void *)MS_DEFAULT_LOG_INTERNAL;
  if (os_log_type_enabled((os_log_t)MS_DEFAULT_LOG_INTERNAL, OS_LOG_TYPE_DEFAULT))
  {
    v22 = v21;
    [v7 OIDString];
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v24 = getKeyTypeForCertificate(a3);
    *(_DWORD *)buf = 138412546;
    v34 = v23;
    __int16 v35 = 2048;
    uint64_t v36 = v24;
    _os_log_impl( &dword_1810EE000,  v22,  OS_LOG_TYPE_DEFAULT,  "MSCMSSignerInfo init signature aglorithm %@ not permitted for certificate key type %ld",  buf,  0x16u);
  }

void __64__MSCMSSignerInfo_initWithCertificate_signatureAlgorithm_error___block_invoke()
{
  v4[6] = *MEMORY[0x1895F89C0];
  v0 = (void *)MEMORY[0x189604010];
  v4[0] = @"1.2.840.113549.1.1.4";
  v4[1] = @"1.2.840.113549.1.1.5";
  v4[2] = @"1.2.840.113549.1.1.14";
  v4[3] = @"1.2.840.113549.1.1.11";
  v4[4] = @"1.2.840.113549.1.1.12";
  v4[5] = @"1.2.840.113549.1.1.13";
  [MEMORY[0x189603F18] arrayWithObjects:v4 count:6];
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [v0 setWithArray:v1];
  v3 = (void *)initWithCertificate_signatureAlgorithm_error__sAllowedRSASigAlgs;
  initWithCertificate_signatureAlgorithm_error__sAllowedRSASigAlgs = v2;
}

void __64__MSCMSSignerInfo_initWithCertificate_signatureAlgorithm_error___block_invoke_2()
{
  v4[5] = *MEMORY[0x1895F89C0];
  v0 = (void *)MEMORY[0x189604010];
  v4[0] = @"1.2.840.10045.4.1";
  v4[1] = @"1.2.840.10045.4.3.1";
  v4[2] = @"1.2.840.10045.4.3.2";
  v4[3] = @"1.2.840.10045.4.3.3";
  v4[4] = @"1.2.840.10045.4.3.4";
  [MEMORY[0x189603F18] arrayWithObjects:v4 count:5];
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [v0 setWithArray:v1];
  v3 = (void *)initWithCertificate_signatureAlgorithm_error__sAllowedECSigAlgs;
  initWithCertificate_signatureAlgorithm_error__sAllowedECSigAlgs = v2;
}

void __64__MSCMSSignerInfo_initWithCertificate_signatureAlgorithm_error___block_invoke_3()
{
  os_log_t v0 = os_log_create("com.apple.MessageSecurity", "default");
  v1 = (void *)MS_DEFAULT_LOG_INTERNAL;
  MS_DEFAULT_LOG_INTERNAL = (uint64_t)v0;
}

- (MSCMSSignerInfo)initWithCertificate:(__SecCertificate *)a3 signatureAlgorithm:(id)a4 useIssuerAndSerialNumber:(BOOL)a5 error:(id *)a6
{
  BOOL v6 = a5;
  id v7 =  -[MSCMSSignerInfo initWithCertificate:signatureAlgorithm:error:]( self,  "initWithCertificate:signatureAlgorithm:error:",  a3,  a4,  a6);
  v8 = v7;
  if (v7) {
    -[MSCMSSignerInfo setUseIssuerAndSerialNumber:](v7, "setUseIssuerAndSerialNumber:", v6);
  }

  return v8;
}

- (MSCMSSignerInfo)initWithIdentity:(__SecIdentity *)a3 signatureAlgorithm:(id)a4 useIssuerAndSerialNumber:(BOOL)a5 error:(id *)a6
{
  BOOL v6 = a5;
  id v7 =  -[MSCMSSignerInfo initWithIdentity:signatureAlgorithm:error:]( self,  "initWithIdentity:signatureAlgorithm:error:",  a3,  a4,  a6);
  v8 = v7;
  if (v7) {
    -[MSCMSSignerInfo setUseIssuerAndSerialNumber:](v7, "setUseIssuerAndSerialNumber:", v6);
  }

  return v8;
}

- (MSCMSSignerInfo)initWithIdentity:(__SecIdentity *)a3 signatureAlgorithm:(id)a4 error:(id *)a5
{
  id v8 = a4;
  if (a5 && *a5) {
    uint64_t v9 = (void *)[*a5 copy];
  }
  else {
    uint64_t v9 = 0LL;
  }
  id v17 = v9;
  SecCertificateRef v10 = MSSecIdentityCopyCertificateWithError(a3, &v17);
  id v11 = v17;

  if (!v10)
  {
    SecKeyRef v13 = 0LL;
    if (!a5) {
      goto LABEL_14;
    }
    goto LABEL_12;
  }

  id v16 = v11;
  self = -[MSCMSSignerInfo initWithCertificate:signatureAlgorithm:error:]( self,  "initWithCertificate:signatureAlgorithm:error:",  v10,  v8,  &v16);
  id v12 = v16;

  if (!self)
  {
    SecKeyRef v13 = 0LL;
    id v11 = v12;
    if (!a5) {
      goto LABEL_14;
    }
    goto LABEL_12;
  }

  id v15 = v12;
  SecKeyRef v13 = MSSecIdentityCopyKeyWithError(a3, &v15);
  id v11 = v15;

  if (v13) {
    CFRetain(v13);
  }
  self->_signerPrivKey = v13;
  if (a5)
  {
LABEL_12:
    if (v11) {
      *a5 = v11;
    }
  }

- (MSCMSSignerInfo)initWithEmail:(id)a3 signatureAlgorithm:(id)a4 LAContext:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (a6 && *a6) {
    SecKeyRef v13 = (void *)[*a6 copy];
  }
  else {
    SecKeyRef v13 = 0LL;
  }
  uint64_t v19 = v13;
  IdentityByEmailAddress = (const void *)findIdentityByEmailAddress(v10, v12, &v19);
  id v15 = v19;

  if (IdentityByEmailAddress)
  {
    id v18 = v15;
    self = -[MSCMSSignerInfo initWithIdentity:signatureAlgorithm:error:]( self,  "initWithIdentity:signatureAlgorithm:error:",  IdentityByEmailAddress,  v11,  &v18);
    id v16 = v18;

    -[MSCMSSignerInfo setLAContext:](self, "setLAContext:", v12);
    if (!a6) {
      goto LABEL_11;
    }
  }

  else
  {
    +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  MSErrorKeychainDomain[0],  -25300LL,  v15,  @"unable to find identity matching %@",  v10);
    id v16 = (id)objc_claimAutoreleasedReturnValue();

    if (!a6) {
      goto LABEL_11;
    }
  }

  if (v16) {
    *a6 = v16;
  }
LABEL_11:
  if (IdentityByEmailAddress) {
    CFRelease(IdentityByEmailAddress);
  }

  return self;
}

- (MSCMSSignerInfo)initWithCertificate:(__SecCertificate *)a3 recipientsAlgorithmCapabilities:(id)a4 error:(id *)a5
{
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = -[MSCMSSignerInfo initWithCertificate:signatureAlgorithm:error:]( self,  "initWithCertificate:signatureAlgorithm:error:",  a3,  v8,  a5);

  return v9;
}

- (MSCMSSignerInfo)initWithIdentity:(__SecIdentity *)a3 recipientsAlgorithmCapabilities:(id)a4 error:(id *)a5
{
  id v8 = a4;
  if (a5 && *a5) {
    uint64_t v9 = (void *)[*a5 copy];
  }
  else {
    uint64_t v9 = 0LL;
  }
  id v18 = v9;
  id v10 = MSSecIdentityCopyCertificateWithError(a3, &v18);
  id v11 = v18;

  if (!v10)
  {
    SecKeyRef v14 = 0LL;
    id v12 = 0LL;
    if (!a5) {
      goto LABEL_14;
    }
    goto LABEL_12;
  }

  findBestMutuallySupportedSignatureAlgorithm(v10, v8);
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  id v17 = v11;
  self = -[MSCMSSignerInfo initWithCertificate:signatureAlgorithm:error:]( self,  "initWithCertificate:signatureAlgorithm:error:",  v10,  v12,  &v17);
  id v13 = v17;

  if (!self)
  {
    SecKeyRef v14 = 0LL;
    id v11 = v13;
    if (!a5) {
      goto LABEL_14;
    }
    goto LABEL_12;
  }

  id v16 = v13;
  SecKeyRef v14 = MSSecIdentityCopyKeyWithError(a3, &v16);
  id v11 = v16;

  if (v14) {
    CFRetain(v14);
  }
  self->_signerPrivKey = v14;
  if (a5)
  {
LABEL_12:
    if (v11) {
      *a5 = v11;
    }
  }

- (MSCMSSignerInfo)initWithEmail:(id)a3 recipientsAlgorithmCapabilities:(id)a4 LAContext:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (a6 && *a6) {
    id v13 = (void *)[*a6 copy];
  }
  else {
    id v13 = 0LL;
  }
  IdentityByEmailAddress = (const void *)findIdentityByEmailAddress(v10, v12, a6);
  if (IdentityByEmailAddress)
  {
    id v17 = v13;
    self = -[MSCMSSignerInfo initWithIdentity:recipientsAlgorithmCapabilities:error:]( self,  "initWithIdentity:recipientsAlgorithmCapabilities:error:",  IdentityByEmailAddress,  v11,  &v17);
    id v15 = v17;

    -[MSCMSSignerInfo setLAContext:](self, "setLAContext:", v12);
    if (!a6) {
      goto LABEL_11;
    }
  }

  else
  {
    +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  MSErrorKeychainDomain[0],  -25300LL,  v13,  @"unable to find identity matching %@",  v10);
    id v15 = (id)objc_claimAutoreleasedReturnValue();

    if (!a6) {
      goto LABEL_11;
    }
  }

  if (v15) {
    *a6 = v15;
  }
LABEL_11:
  if (IdentityByEmailAddress) {
    CFRelease(IdentityByEmailAddress);
  }

  return self;
}

- (void)dealloc
{
  signerCertificate = self->_signerCertificate;
  if (signerCertificate)
  {
    self->_signerCertificate = 0LL;
    CFRelease(signerCertificate);
  }

  signerPrivKey = self->_signerPrivKey;
  if (signerPrivKey)
  {
    self->_signerPrivKey = 0LL;
    CFRelease(signerPrivKey);
  }

  if (self->_encodedSignerInfo)
  {
    free_SignerInfo();
    free(self->_encodedSignerInfo);
    self->_encodedSignerInfo = 0LL;
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MSCMSSignerInfo;
  -[MSCMSSignerInfo dealloc](&v5, sel_dealloc);
}

- (NSArray)certificates
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = -[MSCMSSignerInfo containingSignedData](self, "containingSignedData");
    [v4 certificates];
    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 allObjects];
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    BOOL v6 = 0LL;
  }

  return (NSArray *)v6;
}

- (void)addCounterSignerAttribute:(id)a3
{
  id v11 = a3;
  if (v11)
  {
    v4 = -[MSCMSSignerInfo unprotectedAttributes](self, "unprotectedAttributes");
    [v4 addObject:v11];

    [v11 setContainingSignerInfo:self];
    -[MSCMSSignerInfo containingSignedData](self, "containingSignedData");
    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[MSCMSSignerInfo containingSignedData](self, "containingSignedData");
      BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addCounterSignerCertificates:mode:error:", self, objc_msgSend(v11, "chainMode"), 0);

      [v11 additionalCertificates];
      id v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        -[MSCMSSignerInfo containingSignedData](self, "containingSignedData");
        id v8 = (void *)objc_claimAutoreleasedReturnValue();
        [v8 certificates];
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
        [v11 additionalCertificates];
        id v10 = (void *)objc_claimAutoreleasedReturnValue();
        [v9 addObjectsFromArray:v10];
      }
    }
  }
}

- (void)addMultipleSignaturesAttribute
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = +[MSCMSMutableAttributeArray array](&OBJC_CLASS___MSCMSMutableAttributeArray, "array");
    -[MSCMSSignerInfo protectedAttributes](self, "protectedAttributes");
    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 3221225472LL;
    v12[2] = __49__MSCMSSignerInfo_addMultipleSignaturesAttribute__block_invoke;
    v12[3] = &unk_189B4B1A0;
    id v11 = v4;
    id v13 = v11;
    [v5 enumerateObjectsUsingBlock:v12];

    -[MSCMSSignerInfo setProtectedAttributes:](self, "setProtectedAttributes:", v11);
    -[MSCMSSignerInfo containingSignedData](self, "containingSignedData");
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 signers];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();

    if ([v7 count] != 1)
    {
      unint64_t v8 = 0LL;
      do
      {
        uint64_t v9 = objc_alloc(&OBJC_CLASS___MSCMSMultipleSignaturesAttribute);
        -[MSCMSMultipleSignaturesAttribute setSignedAttrsHashAlgorithm:]( v9,  "setSignedAttrsHashAlgorithm:",  self->_digestAlgorithm);
        -[MSCMSSignerInfo protectedAttributes](self, "protectedAttributes");
        id v10 = (void *)objc_claimAutoreleasedReturnValue();
        [v10 addObject:v9];

        ++v8;
      }

      while (v8 < [v7 count] - 1);
    }
  }

void __49__MSCMSSignerInfo_addMultipleSignaturesAttribute__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  [v5 attributeType];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  char v4 = [v3 isEqualToString:@"1.2.840.113549.1.9.2.51"];

  if ((v4 & 1) == 0) {
    [*(id *)(a1 + 32) addObject:v5];
  }
}

- (void)addSMIMECapabilitiesAttribute:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    +[MSCMSMutableAttributeArray array](&OBJC_CLASS___MSCMSMutableAttributeArray, "array");
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSCMSSignerInfo protectedAttributes](self, "protectedAttributes");
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1895F87A8];
    v8[1] = 3221225472LL;
    v8[2] = __49__MSCMSSignerInfo_addSMIMECapabilitiesAttribute___block_invoke;
    v8[3] = &unk_189B4B1A0;
    id v9 = v5;
    id v7 = v5;
    [v6 enumerateObjectsUsingBlock:v8];

    [v7 addObject:v4];
    -[MSCMSSignerInfo setProtectedAttributes:](self, "setProtectedAttributes:", v7);
  }

void __49__MSCMSSignerInfo_addSMIMECapabilitiesAttribute___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  [v5 attributeType];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  char v4 = [v3 isEqualToString:@"1.2.840.113549.1.9.15"];

  if ((v4 & 1) == 0) {
    [*(id *)(a1 + 32) addObject:v5];
  }
}

- (void)addSMIMEEncryptionKeyPreferenceAttribute:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    +[MSCMSMutableAttributeArray array](&OBJC_CLASS___MSCMSMutableAttributeArray, "array");
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSCMSSignerInfo protectedAttributes](self, "protectedAttributes");
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1895F87A8];
    v8[1] = 3221225472LL;
    v8[2] = __60__MSCMSSignerInfo_addSMIMEEncryptionKeyPreferenceAttribute___block_invoke;
    v8[3] = &unk_189B4B1A0;
    id v9 = v5;
    id v7 = v5;
    [v6 enumerateObjectsUsingBlock:v8];

    [v7 addObject:v4];
    -[MSCMSSignerInfo setProtectedAttributes:](self, "setProtectedAttributes:", v7);
  }

void __60__MSCMSSignerInfo_addSMIMEEncryptionKeyPreferenceAttribute___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  [v5 attributeType];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  char v4 = [v3 isEqualToString:@"1.2.840.113549.1.9.16.2.11"];

  if ((v4 & 1) == 0) {
    [*(id *)(a1 + 32) addObject:v5];
  }
}

- (void)addProtectedAttribute:(id)a3
{
  id v4 = a3;
  -[MSCMSSignerInfo protectedAttributes](self, "protectedAttributes");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 addObject:v4];

  -[MSCMSSignerInfo createRequiredAttributes:](self, "createRequiredAttributes:", 0LL);
}

- (id)calculateSignedAttributesDigest:(id *)a3
{
  if (a3 && *a3) {
    id v5 = (void *)[*a3 copy];
  }
  else {
    id v5 = 0LL;
  }
  if (self->_digestAlgorithm)
  {
LABEL_9:
    -[MSCMSMutableAttributeArray calculateAttributesWithDigest:error:]( self->_protectedAttributes,  "calculateAttributesWithDigest:error:",  v5);
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    id v11 = v13;

    if (!a3) {
      goto LABEL_12;
    }
    goto LABEL_10;
  }

  signatureAlgorithm = self->_signatureAlgorithm;
  if (signatureAlgorithm)
  {
    id v14 = v5;
    +[MSAlgorithmIdentifier digestAlgorithmWithSignatureAlgorithm:error:]( &OBJC_CLASS___MSAlgorithmIdentifier,  "digestAlgorithmWithSignatureAlgorithm:error:",  signatureAlgorithm,  &v14);
    id v7 = (MSAlgorithmIdentifier *)objc_claimAutoreleasedReturnValue();
    id v8 = v14;

    digestAlgorithm = self->_digestAlgorithm;
    self->_digestAlgorithm = v7;

    if (self->_digestAlgorithm)
    {
      id v5 = v8;
      goto LABEL_9;
    }

    +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  MSErrorCMSDomain[0],  -50LL,  v8,  @"No digest algorithm specified");
    id v11 = (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  MSErrorCMSDomain[0],  -50LL,  v5,  @"signer has no signature algorithm");
    id v11 = (id)objc_claimAutoreleasedReturnValue();
  }

  id v10 = 0LL;
  if (!a3) {
    goto LABEL_12;
  }
LABEL_10:
  if (v11) {
    *a3 = v11;
  }
LABEL_12:

  return v10;
}

- (BOOL)verifyContentTypeAttribute:(id *)a3
{
  if (a3 && *a3) {
    id v5 = (void *)[*a3 copy];
  }
  else {
    id v5 = 0LL;
  }
  id v27 = v5;
  +[MSOID OIDWithString:error:](&OBJC_CLASS___MSOID, "OIDWithString:error:", @"1.2.840.113549.1.9.3", &v27);
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();
  id v7 = v27;

  -[MSCMSSignerInfo getAttributesWithType:](self, "getAttributesWithType:", v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8 || [v8 count] != 1)
  {
    v22 = MSErrorCMSDomain[0];
    v23 = @"Missing or too many content-type attribute(s)";
    goto LABEL_16;
  }

  [v8 objectAtIndex:0];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    id v11 = objc_alloc(&OBJC_CLASS___MSCMSContentTypeAttribute);
    [v8 objectAtIndex:0];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    id v26 = v7;
    id v13 = -[MSCMSContentTypeAttribute initWithAttribute:error:](v11, "initWithAttribute:error:", v12, &v26);
    id v14 = v26;

    id v7 = v14;
    if (!v13)
    {
LABEL_15:
      v22 = MSErrorCMSDomain[0];
      v23 = @"Could not decode content-type attribute";
LABEL_16:
      uint64_t v24 = +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  v22,  -26275LL,  v7,  v23);
      id v13 = 0LL;
      goto LABEL_17;
    }
  }

  else
  {
    [v8 objectAtIndex:0];
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    char v16 = objc_opt_isKindOfClass();

    if ((v16 & 1) == 0) {
      goto LABEL_15;
    }
    [v8 objectAtIndex:0];
    id v13 = (MSCMSContentTypeAttribute *)objc_claimAutoreleasedReturnValue();
    if (!v13) {
      goto LABEL_15;
    }
  }

  -[MSCMSContentTypeAttribute contentType](v13, "contentType");
  id v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSCMSSignerInfo containingSignedData](self, "containingSignedData");
  id v18 = (void *)objc_claimAutoreleasedReturnValue();
  [v18 contentType];
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
  char v20 = [v17 isEqual:v19];

  if ((v20 & 1) == 0)
  {
    uint64_t v24 = +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  MSErrorCMSDomain[0],  -67808LL,  v7,  @"Signed content-type attribute does not match content-type in signedData");
LABEL_17:

    BOOL v21 = 0;
    id v7 = (id)v24;
    if (!a3) {
      goto LABEL_20;
    }
    goto LABEL_18;
  }

  BOOL v21 = 1;
  if (!a3) {
    goto LABEL_20;
  }
LABEL_18:
  if (v7) {
    *a3 = v7;
  }
LABEL_20:

  return v21;
}

- (BOOL)verifyMessageDigestAttribute:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (a4 && *a4) {
    id v7 = (void *)[*a4 copy];
  }
  else {
    id v7 = 0LL;
  }
  id v27 = v7;
  +[MSOID OIDWithString:error:](&OBJC_CLASS___MSOID, "OIDWithString:error:", @"1.2.840.113549.1.9.4", &v27);
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  id v9 = v27;

  -[MSCMSSignerInfo getAttributesWithType:](self, "getAttributesWithType:", v8);
  id v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10 || [v10 count] != 1)
  {
    v22 = MSErrorCMSDomain[0];
    v23 = @"Missing or too many message-digest attribute(s)";
    goto LABEL_16;
  }

  [v10 objectAtIndex:0];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    id v13 = objc_alloc(&OBJC_CLASS___MSCMSMessageDigestAttribute);
    [v10 objectAtIndex:0];
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    id v26 = v9;
    id v15 = -[MSCMSMessageDigestAttribute initWithAttribute:error:](v13, "initWithAttribute:error:", v14, &v26);
    id v16 = v26;

    id v9 = v16;
    if (!v15)
    {
LABEL_15:
      v22 = MSErrorCMSDomain[0];
      v23 = @"Could not decode message-digest attribute";
LABEL_16:
      uint64_t v24 = +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  v22,  -26275LL,  v9,  v23);
      id v15 = 0LL;
      goto LABEL_17;
    }
  }

  else
  {
    [v10 objectAtIndex:0];
    id v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    char v18 = objc_opt_isKindOfClass();

    if ((v18 & 1) == 0) {
      goto LABEL_15;
    }
    [v10 objectAtIndex:0];
    id v15 = (MSCMSMessageDigestAttribute *)objc_claimAutoreleasedReturnValue();
    if (!v15) {
      goto LABEL_15;
    }
  }

  -[MSCMSMessageDigestAttribute messageDigest](v15, "messageDigest");
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
  char v20 = [v19 isEqual:v6];

  if ((v20 & 1) == 0)
  {
    uint64_t v24 = +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  MSErrorCMSDomain[0],  -67808LL,  v9,  @"Message-digest attribute failed to verify");
LABEL_17:

    BOOL v21 = 0;
    id v9 = (id)v24;
    if (!a4) {
      goto LABEL_20;
    }
    goto LABEL_18;
  }

  BOOL v21 = 1;
  if (!a4) {
    goto LABEL_20;
  }
LABEL_18:
  if (v9) {
    *a4 = v9;
  }
LABEL_20:

  return v21;
}

- (id)calculateSignerInfoDigest:(id *)a3
{
  if (a3 && *a3) {
    id v5 = (void *)[*a3 copy];
  }
  else {
    id v5 = 0LL;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containingSignedData);
  if (!WeakRetained
    || (id v7 = WeakRetained,
        id v8 = objc_loadWeakRetained((id *)&self->_containingSignedData),
        [v8 dataContent],
        id v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v9,
        v8,
        v7,
        !v9))
  {
    v22 = MSErrorCMSDomain[0];
    v23 = @"signer has no reference to a signedData with content";
LABEL_19:
    +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  v22,  -50LL,  v5,  v23);
    id v17 = (id)objc_claimAutoreleasedReturnValue();

LABEL_20:
    id v16 = 0LL;
    goto LABEL_21;
  }

  if (self->_digestAlgorithm) {
    goto LABEL_11;
  }
  signatureAlgorithm = self->_signatureAlgorithm;
  if (!signatureAlgorithm)
  {
    v22 = MSErrorCMSDomain[0];
    v23 = @"signer has no signature algorithm";
    goto LABEL_19;
  }

  id v29 = v5;
  +[MSAlgorithmIdentifier digestAlgorithmWithSignatureAlgorithm:error:]( &OBJC_CLASS___MSAlgorithmIdentifier,  "digestAlgorithmWithSignatureAlgorithm:error:",  signatureAlgorithm,  &v29);
  id v11 = (MSAlgorithmIdentifier *)objc_claimAutoreleasedReturnValue();
  id v12 = v29;

  digestAlgorithm = self->_digestAlgorithm;
  self->_digestAlgorithm = v11;

  if (!self->_digestAlgorithm)
  {
    +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  MSErrorCMSDomain[0],  -50LL,  v12,  @"No digest algorithm specified");
    id v17 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_20;
  }

  id v5 = v12;
LABEL_11:
  id v14 = objc_loadWeakRetained((id *)&self->_containingSignedData);
  -[MSAlgorithmIdentifier algorithm](self->_digestAlgorithm, "algorithm");
  id v15 = (void *)objc_claimAutoreleasedReturnValue();
  id v28 = v5;
  [v14 calculateContentDigestWithAlgorithm:v15 error:&v28];
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  id v17 = v28;

  if (v16)
  {
    if (!-[MSCMSMutableAttributeArray count](self->_protectedAttributes, "count"))
    {
      id v16 = v16;
      BOOL v21 = v16;
      if (!a3) {
        goto LABEL_26;
      }
      goto LABEL_24;
    }

    id v27 = v17;
    BOOL v18 = -[MSCMSSignerInfo verifyContentTypeAttribute:](self, "verifyContentTypeAttribute:", &v27);
    id v19 = v27;

    if (!v18)
    {
      BOOL v21 = 0LL;
LABEL_16:
      id v17 = v19;
      if (!a3) {
        goto LABEL_26;
      }
      goto LABEL_24;
    }

    id v26 = v19;
    BOOL v20 = -[MSCMSSignerInfo verifyMessageDigestAttribute:error:](self, "verifyMessageDigestAttribute:error:", v16, &v26);
    id v17 = v26;

    if (v20)
    {
      id v25 = v17;
      -[MSCMSSignerInfo calculateSignedAttributesDigest:](self, "calculateSignedAttributesDigest:", &v25);
      BOOL v21 = (void *)objc_claimAutoreleasedReturnValue();
      id v19 = v25;

      goto LABEL_16;
    }
  }

- (BOOL)verifySignature:(id *)a3
{
  uint64_t v45 = *MEMORY[0x1895F89C0];
  if (a3 && *a3) {
    id v5 = (void *)[*a3 copy];
  }
  else {
    id v5 = 0LL;
  }
  id v37 = v5;
  CFTypeRef cf = 0LL;
  -[MSCMSSignerInfo calculateSignerInfoDigest:](self, "calculateSignerInfoDigest:", &v37);
  id v6 = (const __CFData *)objc_claimAutoreleasedReturnValue();
  id v7 = v37;

  if (!v6)
  {
    uint64_t v25 = +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  MSErrorCryptoDomain[0],  -26276LL,  v7,  @"unable to compute digest for signature");
    id v8 = 0LL;
    goto LABEL_27;
  }

  id v8 = SecCertificateCopyKey(-[MSCMSSignerInfo signerCertificate](self, "signerCertificate"));
  if (!v8)
  {
    id v29 = MSErrorCryptoDomain[0];
    v30 = @"failed to get public key from certificate";
    uint64_t v31 = -26275LL;
LABEL_37:
    uint64_t v25 = +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  v29,  v31,  v7,  v30);
    goto LABEL_27;
  }

  -[MSCMSSignerInfo signature](self, "signature");
  id v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    id v29 = MSErrorCMSDomain[0];
    v30 = @"signer is missing signature";
    uint64_t v31 = -50LL;
    goto LABEL_37;
  }

  -[MSAlgorithmIdentifier algorithm](self->_signatureAlgorithm, "algorithm");
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  id v11 = (const __CFString *)[v10 secKeyAlgorithm];

  if (!v11)
  {
    if (MS_DEFAULT_LOG_BLOCK != -1) {
      dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_43);
    }
    id v12 = (void *)MS_DEFAULT_LOG_INTERNAL;
    if (os_log_type_enabled((os_log_t)MS_DEFAULT_LOG_INTERNAL, OS_LOG_TYPE_INFO))
    {
      signatureAlgorithm = self->_signatureAlgorithm;
      log = v12;
      -[MSAlgorithmIdentifier algorithm](signatureAlgorithm, "algorithm");
      __int16 v35 = (void *)objc_claimAutoreleasedReturnValue();
      [v35 OIDString];
      objc_super v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = -[MSAlgorithmIdentifier algorithm](self->_signatureAlgorithm, "algorithm");
      [v33 OIDString];
      id v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[MSCMSSignerInfo digestAlgorithm](self, "digestAlgorithm");
      id v15 = (void *)objc_claimAutoreleasedReturnValue();
      [v15 algorithm];
      id v16 = (void *)objc_claimAutoreleasedReturnValue();
      [v16 OIDString];
      id v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      CFTypeRef v40 = v32;
      __int16 v41 = 2112;
      v42 = v14;
      __int16 v43 = 2112;
      v44 = v17;
      _os_log_impl( &dword_1810EE000,  log,  OS_LOG_TYPE_INFO,  "Bad signature algorithm %@. Trying to compose signature algorithm from %@ and digest %@",  buf,  0x20u);
    }

    BOOL v18 = self->_signatureAlgorithm;
    digestAlgorithm = self->_digestAlgorithm;
    id v36 = v7;
    -[MSAlgorithmIdentifier signatureAlgorithmWithDigestAlgorithm:error:]( v18,  "signatureAlgorithmWithDigestAlgorithm:error:",  digestAlgorithm,  &v36);
    BOOL v20 = (void *)objc_claimAutoreleasedReturnValue();
    id v21 = v36;

    id v11 = (const __CFString *)[v20 secKeyAlgorithm];
    if (v11)
    {
      id v7 = v21;
      goto LABEL_15;
    }

    id v26 = MSErrorCryptoDomain[0];
    -[MSAlgorithmIdentifier algorithm](self->_signatureAlgorithm, "algorithm");
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    [v7 OIDString];
    id v27 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v25 = +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  v26,  -4LL,  v21,  @"%@ is not a supported signature algorithm",  v27);

LABEL_27:
    BOOL v24 = 0;
    goto LABEL_28;
  }

void __35__MSCMSSignerInfo_verifySignature___block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.MessageSecurity", "default");
  v1 = (void *)MS_DEFAULT_LOG_INTERNAL;
  MS_DEFAULT_LOG_INTERNAL = (uint64_t)v0;
}

void __35__MSCMSSignerInfo_verifySignature___block_invoke_46()
{
  os_log_t v0 = os_log_create("com.apple.MessageSecurity", "default");
  v1 = (void *)MS_DEFAULT_LOG_INTERNAL;
  MS_DEFAULT_LOG_INTERNAL = (uint64_t)v0;
}

- (id)verifyTime:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!v4)
  {
    +[MSOID OIDWithString:error:](&OBJC_CLASS___MSOID, "OIDWithString:error:", @"1.2.840.113549.1.9.16.2.14", 0LL);
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSCMSSignerInfo getAttributesWithType:](self, "getAttributesWithType:", v7);
    id v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
LABEL_12:
      [MEMORY[0x189603F50] date];
      id v6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }

    [v8 objectAtIndex:0];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      id v11 = objc_alloc(&OBJC_CLASS___MSCMSTimestampAttribute);
      [v8 objectAtIndex:0];
      id v12 = (void *)objc_claimAutoreleasedReturnValue();
      id v13 = -[MSCMSTimestampAttribute initWithAttribute:error:](v11, "initWithAttribute:error:", v12, 0LL);

      if (!v13)
      {
LABEL_11:

        goto LABEL_12;
      }
    }

    else
    {
      [v8 objectAtIndex:0];
      id v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      char v15 = objc_opt_isKindOfClass();

      id v13 = 0LL;
      if ((v15 & 1) == 0) {
        goto LABEL_11;
      }
      [v8 objectAtIndex:0];
      id v13 = (MSCMSTimestampAttribute *)objc_claimAutoreleasedReturnValue();
      if (!v13) {
        goto LABEL_11;
      }
    }

    -[MSCMSTimestampAttribute timestampTime](v13, "timestampTime");
    id v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      -[MSCMSTimestampAttribute timestampTime](v13, "timestampTime");
      id v6 = (id)objc_claimAutoreleasedReturnValue();

LABEL_13:
      goto LABEL_14;
    }

    goto LABEL_11;
  }

  id v6 = v4;
LABEL_14:

  return v6;
}

- (BOOL)verifySignatureAndSignerWithPolicies:(id)a3 verifyTime:(id)a4 anchorCertificates:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (a6 && *a6) {
    id v13 = (void *)[*a6 copy];
  }
  else {
    id v13 = 0LL;
  }
  id v26 = v13;
  CFErrorRef error = 0LL;
  BOOL v14 = -[MSCMSSignerInfo verifySignature:](self, "verifySignature:", &v26);
  CFErrorRef v15 = (CFErrorRef)v26;

  if (!v14)
  {
    id v17 = 0LL;
    goto LABEL_18;
  }

  -[MSCMSSignerInfo verifyTime:](self, "verifyTime:", v11);
  id v16 = (void *)objc_claimAutoreleasedReturnValue();
  id v17 = -[MSCMSSignerInfo createTrustObjectWithPolicies:verifyTime:anchorCertificates:error:]( self,  "createTrustObjectWithPolicies:verifyTime:anchorCertificates:error:",  v10,  v16,  v12,  a6);

  if (!v17)
  {
LABEL_18:
    BOOL v20 = 0;
    goto LABEL_11;
  }

  if (SecTrustEvaluateWithError(v17, &error))
  {
    CFErrorRef v25 = v15;
    BOOL v18 = -[MSCMSSignerInfo verifyCountersignaturesAndCountersignersWithPolicies:verifyTime:anchorCertificates:error:]( self,  "verifyCountersignaturesAndCountersignersWithPolicies:verifyTime:anchorCertificates:error:",  v10,  v11,  v12,  &v25);
    CFErrorRef v19 = v25;

    if (!v18)
    {
      BOOL v20 = 0;
      CFErrorRef v15 = v19;
      goto LABEL_11;
    }

    CFErrorRef v24 = v19;
    BOOL v20 = -[MSCMSSignerInfo verifyTimestamps:](self, "verifyTimestamps:", &v24);
    id v21 = v24;
  }

  else
  {
    if (error)
    {
      CFIndex Code = CFErrorGetCode(error);
      CFErrorRef v19 = error;
    }

    else
    {
      CFErrorRef v19 = 0LL;
      CFIndex Code = -1LL;
    }

    +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  *MEMORY[0x189607670],  Code,  v19,  @"trust evaluation of signer failed");
    id v21 = (__CFError *)objc_claimAutoreleasedReturnValue();

    BOOL v20 = 0;
  }

  CFErrorRef v15 = v21;
LABEL_11:
  if (a6 && v15) {
    *a6 = v15;
  }
  if (v17) {
    CFRelease(v17);
  }

  return v20;
}

- (id)calculateSignatureDigestWithAlgorithm:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)[v6 ccdigest];
  if (v7)
  {
    [MEMORY[0x189603FB8] dataWithLength:*v7];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSCMSSignerInfo signature](self, "signature");
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 length];
    id v10 = -[MSCMSSignerInfo signature](self, "signature");
    [v10 bytes];
    id v11 = v8;
    [v11 mutableBytes];
    ccdigest();
  }

  else
  {
    if (!a4)
    {
      id v11 = 0LL;
      goto LABEL_6;
    }

    id v12 = MSErrorCryptoDomain[0];
    id v13 = *a4;
    [v6 OIDString];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  v12,  -4LL,  v13,  @"%@ is not a supported digest algorithm",  v9);
    id v11 = 0LL;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_6:
  return v11;
}

- (BOOL)verifyCountersignatures:(id *)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[MSOID OIDWithString:error:](&OBJC_CLASS___MSOID, "OIDWithString:error:", @"1.2.840.113549.1.9.6", 0LL);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 getAttributesWithType:v6];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    uint64_t v20 = 0LL;
    id v21 = &v20;
    uint64_t v22 = 0x2020000000LL;
    char v23 = 0;
    *(void *)buf = 0LL;
    CFErrorRef v15 = buf;
    uint64_t v16 = 0x3032000000LL;
    id v17 = __Block_byref_object_copy__4;
    BOOL v18 = __Block_byref_object_dispose__4;
    if (a3)
    {
      id v8 = *a3;
      if (*a3) {
        id v8 = (id)[v8 copy];
      }
    }

    else
    {
      id v8 = 0LL;
    }

    id v19 = v8;
    v13[0] = MEMORY[0x1895F87A8];
    v13[1] = 3221225472LL;
    v13[2] = __43__MSCMSSignerInfo_verifyCountersignatures___block_invoke_56;
    v13[3] = &unk_189B4B228;
    v13[4] = self;
    v13[5] = buf;
    v13[6] = &v20;
    [v7 enumerateObjectsUsingBlock:v13];
    if (a3)
    {
      id v11 = (void *)*((void *)v15 + 5);
      if (v11) {
        *a3 = v11;
      }
    }

    BOOL v10 = *((_BYTE *)v21 + 24) == 0;
    _Block_object_dispose(buf, 8);

    _Block_object_dispose(&v20, 8);
  }

  else
  {
    if (MS_DEFAULT_LOG_BLOCK != -1) {
      dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_55);
    }
    id v9 = (os_log_s *)MS_DEFAULT_LOG_INTERNAL;
    BOOL v10 = 1;
    if (os_log_type_enabled((os_log_t)MS_DEFAULT_LOG_INTERNAL, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( &dword_1810EE000,  v9,  OS_LOG_TYPE_INFO,  "no countersignatures, returning successful verification",  buf,  2u);
    }
  }

  return v10;
}

void __43__MSCMSSignerInfo_verifyCountersignatures___block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.MessageSecurity", "default");
  v1 = (void *)MS_DEFAULT_LOG_INTERNAL;
  MS_DEFAULT_LOG_INTERNAL = (uint64_t)v0;
}

void __43__MSCMSSignerInfo_verifyCountersignatures___block_invoke_56( void *a1,  void *a2,  uint64_t a3,  _BYTE *a4)
{
  id v7 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    id v8 = objc_alloc(&OBJC_CLASS___MSCMSCountersignatureAttribute);
    id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 112LL));
    [WeakRetained certificates];
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 allObjects];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = a1[4];
    uint64_t v13 = *(void *)(v12 + 56);
    uint64_t v14 = *(void *)(a1[5] + 8LL);
    id obj = *(id *)(v14 + 40);
    CFErrorRef v15 = -[MSCMSCountersignatureAttribute initWithAttribute:certificates:LAContext:containingSignerInfo:error:]( v8,  "initWithAttribute:certificates:LAContext:containingSignerInfo:error:",  v7,  v11,  v13,  v12,  &obj);
    objc_storeStrong((id *)(v14 + 40), obj);

    if (!v15)
    {
LABEL_8:
      uint64_t v19 = +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  MSErrorCMSDomain[0],  -108LL,  *(void *)(*(void *)(a1[5] + 8LL) + 40LL),  @"unable to create countersignature attribute for countersigner %lu",  a3);
      CFErrorRef v15 = 0LL;
      goto LABEL_9;
    }
  }

  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_8;
    }
    CFErrorRef v15 = (MSCMSCountersignatureAttribute *)v7;
    if (!v15) {
      goto LABEL_8;
    }
  }

  uint64_t v16 = *(void *)(a1[4] + 40LL);
  uint64_t v17 = *(void *)(a1[5] + 8LL);
  id v22 = *(id *)(v17 + 40);
  BOOL v18 = -[MSCMSCountersignatureAttribute verifyCountersignatures:error:]( v15,  "verifyCountersignatures:error:",  v16,  &v22);
  objc_storeStrong((id *)(v17 + 40), v22);
  if (!v18)
  {
    uint64_t v19 = +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  MSErrorCMSDomain[0],  -67808LL,  *(void *)(*(void *)(a1[5] + 8LL) + 40LL),  @"unable to verify countersignature(s) for countersigner %lu",  a3);
LABEL_9:
    uint64_t v20 = *(void *)(a1[5] + 8LL);
    id v21 = *(void **)(v20 + 40);
    *(void *)(v20 + 40) = v19;

    *a4 = 1;
    *(_BYTE *)(*(void *)(a1[6] + 8LL) + 24LL) = 1;
  }
}

- (BOOL)verifyCountersignaturesAndCountersignersWithPolicies:(id)a3 verifyTime:(id)a4 anchorCertificates:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  -[MSCMSSignerInfo unprotectedAttributes](self, "unprotectedAttributes");
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[MSOID OIDWithString:error:](&OBJC_CLASS___MSOID, "OIDWithString:error:", @"1.2.840.113549.1.9.6", 0LL);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 getAttributesWithType:v14];
  CFErrorRef v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    uint64_t v33 = 0LL;
    v34 = &v33;
    uint64_t v35 = 0x2020000000LL;
    char v36 = 0;
    *(void *)buf = 0LL;
    id v28 = buf;
    uint64_t v29 = 0x3032000000LL;
    v30 = __Block_byref_object_copy__4;
    uint64_t v31 = __Block_byref_object_dispose__4;
    if (a6)
    {
      id v16 = *a6;
      if (*a6) {
        id v16 = (id)[v16 copy];
      }
    }

    else
    {
      id v16 = 0LL;
    }

    id v32 = v16;
    v21[0] = MEMORY[0x1895F87A8];
    v21[1] = 3221225472LL;
    v21[2] = __108__MSCMSSignerInfo_verifyCountersignaturesAndCountersignersWithPolicies_verifyTime_anchorCertificates_error___block_invoke_63;
    v21[3] = &unk_189B4B270;
    v21[4] = self;
    CFErrorRef v25 = buf;
    id v22 = v10;
    id v23 = v11;
    id v24 = v12;
    id v26 = &v33;
    [v15 enumerateObjectsUsingBlock:v21];
    if (a6)
    {
      uint64_t v19 = (void *)*((void *)v28 + 5);
      if (v19) {
        *a6 = v19;
      }
    }

    BOOL v18 = *((_BYTE *)v34 + 24) == 0;

    _Block_object_dispose(buf, 8);
    _Block_object_dispose(&v33, 8);
  }

  else
  {
    if (MS_DEFAULT_LOG_BLOCK != -1) {
      dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_62);
    }
    uint64_t v17 = (os_log_s *)MS_DEFAULT_LOG_INTERNAL;
    BOOL v18 = 1;
    if (os_log_type_enabled((os_log_t)MS_DEFAULT_LOG_INTERNAL, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( &dword_1810EE000,  v17,  OS_LOG_TYPE_INFO,  "no countersignatures, returning successful verification",  buf,  2u);
    }
  }

  return v18;
}

void __108__MSCMSSignerInfo_verifyCountersignaturesAndCountersignersWithPolicies_verifyTime_anchorCertificates_error___block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.MessageSecurity", "default");
  v1 = (void *)MS_DEFAULT_LOG_INTERNAL;
  MS_DEFAULT_LOG_INTERNAL = (uint64_t)v0;
}

void __108__MSCMSSignerInfo_verifyCountersignaturesAndCountersignersWithPolicies_verifyTime_anchorCertificates_error___block_invoke_63( uint64_t *a1,  void *a2,  uint64_t a3,  _BYTE *a4)
{
  id v7 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    id v8 = objc_alloc(&OBJC_CLASS___MSCMSCountersignatureAttribute);
    id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 112));
    [WeakRetained certificates];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 allObjects];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = a1[4];
    uint64_t v13 = *(void *)(v12 + 56);
    uint64_t v14 = *(void *)(a1[8] + 8);
    id obj = *(id *)(v14 + 40);
    CFErrorRef v15 = -[MSCMSCountersignatureAttribute initWithAttribute:certificates:LAContext:containingSignerInfo:error:]( v8,  "initWithAttribute:certificates:LAContext:containingSignerInfo:error:",  v7,  v11,  v13,  v12,  &obj);
    objc_storeStrong((id *)(v14 + 40), obj);

    if (!v15)
    {
LABEL_8:
      uint64_t v21 = +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  MSErrorCMSDomain[0],  -108LL,  *(void *)(*(void *)(a1[8] + 8) + 40LL),  @"unable to create countersignature attribute for countersigner %lu",  a3);
      CFErrorRef v15 = 0LL;
      goto LABEL_9;
    }
  }

  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_8;
    }
    CFErrorRef v15 = (MSCMSCountersignatureAttribute *)v7;
    if (!v15) {
      goto LABEL_8;
    }
  }

  uint64_t v16 = a1[5];
  [(id)a1[4] verifyTime:a1[6]];
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v18 = *(void *)(a1[4] + 40);
  uint64_t v19 = a1[7];
  uint64_t v20 = *(void *)(a1[8] + 8);
  id v24 = *(id *)(v20 + 40);
  LOBYTE(v16) = -[MSCMSCountersignatureAttribute verifyCountersignaturesAndCountersignersWithPolicies:verifyTime:anchorCertificates:signature:error:]( v15,  "verifyCountersignaturesAndCountersignersWithPolicies:verifyTime:anchorCertificates:signature:error:",  v16,  v17,  v19,  v18,  &v24);
  objc_storeStrong((id *)(v20 + 40), v24);

  if ((v16 & 1) == 0)
  {
    uint64_t v21 = +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  MSErrorCMSDomain[0],  -67808LL,  *(void *)(*(void *)(a1[8] + 8) + 40LL),  @"unable to verify countersigner %lu",  a3);
LABEL_9:
    uint64_t v22 = *(void *)(a1[8] + 8);
    id v23 = *(void **)(v22 + 40);
    *(void *)(v22 + 40) = v21;

    *a4 = 1;
    *(_BYTE *)(*(void *)(a1[9] + 8) + 24LL) = 1;
  }
}

- (BOOL)verifyTimestamps:(BOOL)a3 error:(id *)a4
{
  v27[0] = 0LL;
  v27[1] = v27;
  v27[2] = 0x3032000000LL;
  v27[3] = __Block_byref_object_copy__4;
  v27[4] = __Block_byref_object_dispose__4;
  id v28 = 0LL;
  uint64_t v21 = 0LL;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000LL;
  id v24 = __Block_byref_object_copy__4;
  CFErrorRef v25 = __Block_byref_object_dispose__4;
  if (a4)
  {
    id v7 = *a4;
    if (*a4) {
      id v7 = (id)[v7 copy];
    }
  }

  else
  {
    id v7 = 0LL;
  }

  id v26 = v7;
  +[MSOID OIDWithString:error:](&OBJC_CLASS___MSOID, "OIDWithString:error:", @"1.2.840.113549.1.9.16.2.14", 0LL);
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSCMSSignerInfo getAttributesWithType:](self, "getAttributesWithType:", v8);
  id v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9) {
    goto LABEL_8;
  }
  if (a3)
  {
    uint64_t v10 = +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  MSErrorCMSDomain[0],  -67808LL,  v22[5],  @"unable to verify timestamp signature because there are no timestamps");
    id v11 = (void *)v22[5];
    v22[5] = v10;

LABEL_8:
    *(void *)buf = 0LL;
    uint64_t v18 = buf;
    uint64_t v19 = 0x2020000000LL;
    char v20 = 0;
    v16[0] = MEMORY[0x1895F87A8];
    v16[1] = 3221225472LL;
    v16[2] = __42__MSCMSSignerInfo_verifyTimestamps_error___block_invoke_69;
    v16[3] = &unk_189B4B2B8;
    v16[4] = self;
    v16[5] = &v21;
    v16[6] = v27;
    v16[7] = buf;
    [v9 enumerateObjectsUsingBlock:v16];
    if (a4)
    {
      uint64_t v12 = (void *)v22[5];
      if (v12) {
        *a4 = v12;
      }
    }

    BOOL v13 = v18[24] == 0;
    _Block_object_dispose(buf, 8);
    goto LABEL_12;
  }

  if (MS_DEFAULT_LOG_BLOCK != -1) {
    dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_66);
  }
  CFErrorRef v15 = (os_log_s *)MS_DEFAULT_LOG_INTERNAL;
  BOOL v13 = 1;
  if (os_log_type_enabled((os_log_t)MS_DEFAULT_LOG_INTERNAL, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1810EE000, v15, OS_LOG_TYPE_INFO, "no timestamps, returning successful verification", buf, 2u);
  }

void __42__MSCMSSignerInfo_verifyTimestamps_error___block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.MessageSecurity", "default");
  v1 = (void *)MS_DEFAULT_LOG_INTERNAL;
  MS_DEFAULT_LOG_INTERNAL = (uint64_t)v0;
}

void __42__MSCMSSignerInfo_verifyTimestamps_error___block_invoke_69( void *a1,  void *a2,  uint64_t a3,  _BYTE *a4)
{
  id v7 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    id v8 = objc_alloc(&OBJC_CLASS___MSCMSTimestampAttribute);
    uint64_t v9 = *(void *)(a1[5] + 8LL);
    id obj = *(id *)(v9 + 40);
    uint64_t v10 = -[MSCMSTimestampAttribute initWithAttribute:error:](v8, "initWithAttribute:error:", v7, &obj);
    objc_storeStrong((id *)(v9 + 40), obj);
    if (!v10)
    {
LABEL_8:
      uint64_t v18 = +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  MSErrorCMSDomain[0],  -108LL,  *(void *)(*(void *)(a1[5] + 8LL) + 40LL),  @"unable to create timestamp attribute for timestamp %lu",  a3);
      uint64_t v10 = 0LL;
      goto LABEL_9;
    }
  }

  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_8;
    }
    uint64_t v10 = (MSCMSTimestampAttribute *)v7;
    if (!v10) {
      goto LABEL_8;
    }
  }

  id v11 = (id *)a1[4];
  uint64_t v12 = [v11[15] algorithm];
  uint64_t v13 = [v11 calculateSignatureDigestWithAlgorithm:v12 error:0];
  uint64_t v14 = *(void *)(a1[6] + 8LL);
  CFErrorRef v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v13;

  uint64_t v16 = *(void *)(*(void *)(a1[6] + 8LL) + 40LL);
  uint64_t v17 = *(void *)(a1[5] + 8LL);
  id v21 = *(id *)(v17 + 40);
  LOBYTE(v12) = -[MSCMSTimestampAttribute verifyTimestamps:error:](v10, "verifyTimestamps:error:", v16, &v21);
  objc_storeStrong((id *)(v17 + 40), v21);
  if ((v12 & 1) == 0)
  {
    uint64_t v18 = +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  MSErrorCMSDomain[0],  -67808LL,  *(void *)(*(void *)(a1[5] + 8LL) + 40LL),  @"unable to verify timestamp signature for timestamp %lu",  a3);
LABEL_9:
    uint64_t v19 = *(void *)(a1[5] + 8LL);
    char v20 = *(void **)(v19 + 40);
    *(void *)(v19 + 40) = v18;

    *a4 = 1;
    *(_BYTE *)(*(void *)(a1[7] + 8LL) + 24LL) = 1;
  }
}

- (BOOL)verifyTimestamps:(id *)a3
{
  return -[MSCMSSignerInfo verifyTimestamps:error:](self, "verifyTimestamps:error:", 0LL, a3);
}

- (id)getAttributesWithType:(id)a3
{
  id v4 = a3;
  -[MSCMSSignerInfo getAttributesWithType:protectedAttributes:]( self,  "getAttributesWithType:protectedAttributes:",  v4,  1LL);
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    [MEMORY[0x189603FA8] arrayWithArray:v5];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v6 = 0LL;
  }

  -[MSCMSSignerInfo getAttributesWithType:protectedAttributes:]( self,  "getAttributesWithType:protectedAttributes:",  v4,  0LL);
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (v6)
    {
      [v6 addObjectsFromArray:v7];
    }

    else
    {
      [MEMORY[0x189603FA8] arrayWithArray:v7];
      id v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v6;
}

- (id)getAttributesWithType:(id)a3 protectedAttributes:(BOOL)a4
{
  id v6 = a3;
  id v7 = self->_protectedAttributes;
  if (!a4)
  {
    id v8 = self->_unprotectedAttributes;

    id v7 = v8;
  }

  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __61__MSCMSSignerInfo_getAttributesWithType_protectedAttributes___block_invoke;
  v15[3] = &unk_189B4B2E0;
  id v9 = v6;
  id v16 = v9;
  -[MSCMSMutableAttributeArray indexesOfObjectsPassingTest:](v7, "indexesOfObjectsPassingTest:", v15);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v10 count])
  {
    id v11 = (void *)MEMORY[0x189603FA8];
    -[MSCMSMutableAttributeArray objectsAtIndexes:](v7, "objectsAtIndexes:", v10);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 arrayWithArray:v12];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v13 = 0LL;
  }

  return v13;
}

uint64_t __61__MSCMSSignerInfo_getAttributesWithType_protectedAttributes___block_invoke(uint64_t a1, void *a2)
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 attributeType];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 isEqual:*(void *)(a1 + 32)];

  return v5;
}

- (__SecTrust)createTrustObjectWithPolicies:(id)a3 error:(id *)a4
{
  return -[MSCMSSignerInfo createTrustObjectWithPolicies:verifyTime:anchorCertificates:error:]( self,  "createTrustObjectWithPolicies:verifyTime:anchorCertificates:error:",  a3,  0LL,  0LL,  a4);
}

- (__SecTrust)createTrustObjectWithPolicies:(id)a3 verifyTime:(id)a4 anchorCertificates:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = (const __CFDate *)a4;
  uint64_t v12 = (const __CFArray *)a5;
  uint64_t v13 = (void *)MEMORY[0x189603FA8];
  -[MSCMSSignerInfo certificates](self, "certificates");
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 arrayWithArray:v14];
  CFErrorRef v15 = (void *)objc_claimAutoreleasedReturnValue();

  SecTrustRef trust = 0LL;
  if (a6 && *a6) {
    id v16 = (void *)[*a6 copy];
  }
  else {
    id v16 = 0LL;
  }
  if (-[MSCMSSignerInfo signerCertificate](self, "signerCertificate"))
  {
    [v15 insertObject:self->_signerCertificate atIndex:0];
    OSStatus v17 = SecTrustCreateWithCertificates(v15, v10, &trust);
    if (v17)
    {
      uint64_t v25 = +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  *MEMORY[0x189607670],  v17,  v16,  @"unable to create trust object due to security error");

      SecTrustRef trust = 0LL;
      goto LABEL_20;
    }

    if (v11 && (OSStatus v18 = SecTrustSetVerifyDate(trust, v11)) != 0)
    {
      uint64_t v22 = (__CFString *)*MEMORY[0x189607670];
      uint64_t v24 = v18;
      uint64_t v23 = @"failed to set verification time";
    }

    else
    {
      if (!v12 || (OSStatus v19 = SecTrustSetAnchorCertificates(trust, v12)) == 0)
      {
        if (!a6) {
          goto LABEL_14;
        }
        goto LABEL_12;
      }

      uint64_t v22 = (__CFString *)*MEMORY[0x189607670];
      uint64_t v24 = v19;
      uint64_t v23 = @"failed to set anchor certificates";
    }
  }

  else
  {
    uint64_t v22 = MSErrorCMSDomain[0];
    uint64_t v23 = @"no certificates found in signerInfo for trust evaluation";
    uint64_t v24 = -50LL;
  }

  uint64_t v25 = +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  v22,  v24,  v16,  v23);

LABEL_20:
  id v16 = (void *)v25;
  if (!a6) {
    goto LABEL_14;
  }
LABEL_12:
  if (v16) {
    *a6 = v16;
  }
LABEL_14:
  char v20 = trust;

  return v20;
}

- (BOOL)sign:(id *)a3
{
  uint64_t v39 = *MEMORY[0x1895F89C0];
  if (a3 && *a3) {
    uint64_t v5 = (void *)[*a3 copy];
  }
  else {
    uint64_t v5 = 0LL;
  }
  CFTypeRef cf = 0LL;
  if (!self->_signature || !-[MSCMSSignerInfo verifySignature:](self, "verifySignature:", 0LL))
  {
    if (!self->_signatureAlgorithm)
    {
      uint64_t v29 = +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  MSErrorCMSDomain[0],  -50LL,  v5,  @"Could not sign data: no signature algorithm");

      BOOL v6 = 0;
      uint64_t v5 = (void *)v29;
      if (a3)
      {
LABEL_31:
        if (v5) {
          *a3 = v5;
        }
      }

void __24__MSCMSSignerInfo_sign___block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.MessageSecurity", "default");
  v1 = (void *)MS_DEFAULT_LOG_INTERNAL;
  MS_DEFAULT_LOG_INTERNAL = (uint64_t)v0;
}

- (BOOL)createRequiredAttributes:(id *)a3
{
  protectedAttributes = self->_protectedAttributes;
  if (!protectedAttributes || !-[MSCMSMutableAttributeArray count](protectedAttributes, "count"))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_containingSignedData);
    if (!WeakRetained) {
      goto LABEL_5;
    }
    id v7 = WeakRetained;
    id v8 = objc_loadWeakRetained((id *)&self->_containingSignedData);
    [v8 contentType];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    char v10 = [v9 isEqualToString:@"1.2.840.113549.1.7.1"];

    if ((v10 & 1) != 0)
    {
LABEL_5:
      id v11 = 0LL;
      BOOL v12 = 1;
      goto LABEL_25;
    }
  }

  id v13 = objc_loadWeakRetained((id *)&self->_containingSignedData);
  if (v13
    && (uint64_t v14 = v13,
        id v15 = objc_loadWeakRetained((id *)&self->_containingSignedData),
        [v15 contentType],
        id v16 = (void *)objc_claimAutoreleasedReturnValue(),
        v16,
        v15,
        v14,
        v16))
  {
    uint64_t v39 = a3;
    id v17 = objc_loadWeakRetained((id *)&self->_containingSignedData);
    -[MSAlgorithmIdentifier algorithm](self->_digestAlgorithm, "algorithm");
    OSStatus v18 = (void *)objc_claimAutoreleasedReturnValue();
    id v45 = 0LL;
    uint64_t v19 = [v17 calculateContentDigestWithAlgorithm:v18 error:&v45];
    id v20 = v45;

    id v44 = v20;
    +[MSOID OIDWithString:error:](&OBJC_CLASS___MSOID, "OIDWithString:error:", @"1.2.840.113549.1.9.3", &v44);
    id v21 = (void *)objc_claimAutoreleasedReturnValue();
    id v22 = v44;

    -[MSCMSSignerInfo getAttributesWithType:](self, "getAttributesWithType:", v21);
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();

    id v43 = v22;
    +[MSOID OIDWithString:error:](&OBJC_CLASS___MSOID, "OIDWithString:error:", @"1.2.840.113549.1.9.4", &v43);
    CFTypeRef v24 = (void *)objc_claimAutoreleasedReturnValue();
    id v11 = v43;

    -[MSCMSSignerInfo getAttributesWithType:](self, "getAttributesWithType:", v24);
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();

    id v26 = (void *)v19;
    if (v23 && v25)
    {
      id v27 = objc_loadWeakRetained((id *)&self->_containingSignedData);
      if (([v27 contentChanged] & 1) != 0
        || -[MSCMSSignerInfo contentChanged](self, "contentChanged")
        || !-[MSCMSSignerInfo verifyContentTypeAttribute:](self, "verifyContentTypeAttribute:", 0LL))
      {
      }

      else
      {
        BOOL v28 = -[MSCMSSignerInfo verifyMessageDigestAttribute:error:]( self,  "verifyMessageDigestAttribute:error:",  v19,  0LL);

        if (v28)
        {
          a3 = v39;
          goto LABEL_22;
        }
      }
    }

    uint64_t v29 = self->_protectedAttributes;
    id v42 = v11;
    v30 = +[MSOID OIDWithString:error:](&OBJC_CLASS___MSOID, "OIDWithString:error:", @"1.2.840.113549.1.9.3", &v42, v39);
    id v31 = v42;

    -[MSCMSMutableAttributeArray removeAttributes:](v29, "removeAttributes:", v30);
    uint64_t v32 = self->_protectedAttributes;
    id v41 = v31;
    +[MSOID OIDWithString:error:](&OBJC_CLASS___MSOID, "OIDWithString:error:", @"1.2.840.113549.1.9.4", &v41);
    id v33 = (void *)objc_claimAutoreleasedReturnValue();
    id v11 = v41;

    -[MSCMSMutableAttributeArray removeAttributes:](v32, "removeAttributes:", v33);
    id v34 = objc_loadWeakRetained((id *)&self->_containingSignedData);
    [v34 contentType];
    id v35 = (void *)objc_claimAutoreleasedReturnValue();
    +[MSCMSContentTypeAttribute contentTypeAttributeWithOID:]( &OBJC_CLASS___MSCMSContentTypeAttribute,  "contentTypeAttributeWithOID:",  v35);
    char v36 = (void *)objc_claimAutoreleasedReturnValue();

    +[MSCMSMessageDigestAttribute messageDigestAttributeWithDigest:]( &OBJC_CLASS___MSCMSMessageDigestAttribute,  "messageDigestAttributeWithDigest:",  v19);
    id v37 = (void *)objc_claimAutoreleasedReturnValue();
    a3 = v40;
    if (v36)
    {
      -[MSCMSMutableAttributeArray addObject:](self->_protectedAttributes, "addObject:", v36);
      if (v37)
      {
        -[MSCMSMutableAttributeArray addObject:](self->_protectedAttributes, "addObject:", v37);

LABEL_22:
        BOOL v12 = 1;
        if (!a3) {
          goto LABEL_25;
        }
        goto LABEL_23;
      }
    }
  }

  else
  {
    +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  MSErrorCMSDomain[0],  -50LL,  0LL,  @"Cannot encode signed attributes: no SignedData");
    id v11 = (id)objc_claimAutoreleasedReturnValue();
  }

  BOOL v12 = 0;
  if (!a3) {
    goto LABEL_25;
  }
LABEL_23:
  if (v11)
  {
    id v11 = v11;
    *a3 = v11;
  }

- (BOOL)encodeSignerInfo:(SignerInfo *)a3 error:(id *)a4
{
  if (a4 && *a4) {
    id v7 = (id)[*a4 copy];
  }
  else {
    id v7 = 0LL;
  }
  if (!a3)
  {
    id v43 = MSErrorAllocationDomain[0];
    id v44 = @"Unable to encode SignerInfo: missing destination address";
LABEL_46:
    uint64_t v45 = +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  v43,  -50LL,  v7,  v44);

    LOBYTE(v36) = 0;
    id v9 = 0LL;
    BOOL v12 = 0LL;
    id v7 = (id)v45;
    goto LABEL_37;
  }

  a3->var6 = 0LL;
  *(_OWORD *)&a3->var4.var0.components = 0u;
  a3->var5 = 0u;
  *(_OWORD *)&a3->var2.var0.components = 0u;
  *(_OWORD *)&a3->var3 = 0u;
  *(_OWORD *)&a3->var0 = 0u;
  *(_OWORD *)&a3->var1.var1 = 0u;
  if (self->_encodedSignerInfo
    && !copy_SignerInfo()
    && -[MSCMSSignerInfo verifySignature:](self, "verifySignature:", 0LL))
  {
    if (!self->_encodedSignerInfo->var6)
    {
      -[MSCMSSignerInfo unprotectedAttributes](self, "unprotectedAttributes");
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      id v9 = (MSCMSIdentifier *)[v8 count];

      if (!v9) {
        goto LABEL_14;
      }
    }

    -[MSCMSSignerInfo unprotectedAttributes](self, "unprotectedAttributes");
    char v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 encodeImplicitAttributesWithError:0];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11 && [v11 length] == self->_encodedSignerInfo->var6->var0)
    {

      id v9 = 0LL;
LABEL_14:
      BOOL v12 = 0LL;
      goto LABEL_41;
    }
  }

  free_SignerInfo();
  if (!self->_signerCertificate)
  {
    id v43 = MSErrorCMSDomain[0];
    id v44 = @"Unable to encode SignerInfo: missing signer certificate";
    goto LABEL_46;
  }

  SecCertificateGetSubjectKeyID();
  BOOL v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12 && !-[MSCMSSignerInfo useIssuerAndSerialNumber](self, "useIssuerAndSerialNumber"))
  {
    a3->var0 = 3;
    [MEMORY[0x189607968] numberWithInteger:3];
    id v17 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    version = self->_version;
    self->_version = v17;

    id v9 = -[MSCMSIdentifier initWithSkid:](objc_alloc(&OBJC_CLASS___MSCMSIdentifier), "initWithSkid:", v12);
  }

  else
  {
    a3->var0 = 1;
    [MEMORY[0x189607968] numberWithInteger:1];
    id v13 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = self->_version;
    self->_version = v13;

    CFDataRef v15 = SecCertificateCopySerialNumberData(self->_signerCertificate, 0LL);
    id v16 = (void *)SecCertificateCopyIssuerSequence();
    id v9 = -[MSCMSIdentifier initWithIssuerName:serialNumber:]( objc_alloc(&OBJC_CLASS___MSCMSIdentifier),  "initWithIssuerName:serialNumber:",  v16,  v15);
  }

  id v55 = v7;
  -[MSCMSIdentifier encodeMessageSecurityObject:](v9, "encodeMessageSecurityObject:", &v55);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
  id v20 = v55;

  -[MSCMSSignerInfo setIdentifierData:](self, "setIdentifierData:", v19);
  -[MSCMSSignerInfo identifierData](self, "identifierData");
  id v21 = (void *)objc_claimAutoreleasedReturnValue();
  v54[1] = (id)[v21 length];
  id v22 = -[MSCMSSignerInfo identifierData](self, "identifierData");
  v54[2] = (id)[v22 bytes];

  copy_SignerIdentifier();
  signatureAlgorithm = self->_signatureAlgorithm;
  if (!signatureAlgorithm)
  {
    v46 = MSErrorCMSDomain[0];
    v47 = @"Signer has no signature algorithm";
LABEL_50:
    +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  v46,  -50LL,  v20,  v47);
    id v7 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_51;
  }

  -[MSAlgorithmIdentifier asn1AlgId](signatureAlgorithm, "asn1AlgId");
  copy_AlgorithmIdentifier();
  digestAlgorithm = self->_digestAlgorithm;
  if (digestAlgorithm) {
    goto LABEL_26;
  }
  uint64_t v25 = self->_signatureAlgorithm;
  if (!v25)
  {
    v46 = MSErrorCMSDomain[0];
    v47 = @"signer has no signature algorithm";
    goto LABEL_50;
  }

  v54[0] = v20;
  +[MSAlgorithmIdentifier digestAlgorithmWithSignatureAlgorithm:error:]( &OBJC_CLASS___MSAlgorithmIdentifier,  "digestAlgorithmWithSignatureAlgorithm:error:",  v25,  v54);
  id v26 = (MSAlgorithmIdentifier *)objc_claimAutoreleasedReturnValue();
  id v27 = v54[0];

  BOOL v28 = self->_digestAlgorithm;
  self->_digestAlgorithm = v26;

  digestAlgorithm = self->_digestAlgorithm;
  if (!digestAlgorithm)
  {
    +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  MSErrorCMSDomain[0],  -50LL,  v27,  @"No digest algorithm specified");
    id v7 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_51;
  }

  id v20 = v27;
LABEL_26:
  -[MSAlgorithmIdentifier asn1AlgId](digestAlgorithm, "asn1AlgId");
  copy_AlgorithmIdentifier();
  id v53 = v20;
  BOOL v29 = -[MSCMSSignerInfo createRequiredAttributes:](self, "createRequiredAttributes:", &v53);
  id v7 = v53;

  if (!v29)
  {
LABEL_51:
    LOBYTE(v36) = 0;
    goto LABEL_37;
  }

  protectedAttributes = self->_protectedAttributes;
  if (protectedAttributes && -[MSCMSMutableAttributeArray count](protectedAttributes, "count"))
  {
    a3->var3 = (heim_base_data *)malloc(0x10uLL);
    id v31 = self->_protectedAttributes;
    id v52 = v7;
    -[MSCMSMutableAttributeArray encodeImplicitAttributesWithError:](v31, "encodeImplicitAttributesWithError:", &v52);
    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
    id v33 = v52;

    -[MSCMSSignerInfo setSignedAttrsData:](self, "setSignedAttrsData:", v32);
    uint64_t v50 = [v32 length];
    id v34 = v32;
    uint64_t v51 = [v34 bytes];
    MEMORY[0x186E066C0](&v50, a3->var3);

    id v7 = v33;
  }

  id v35 = v7;
  id v49 = v7;
  LODWORD(v36) = -[MSCMSSignerInfo sign:](self, "sign:", &v49);
  id v7 = v49;

  if ((_DWORD)v36)
  {
    v48[1] = (id)-[NSData length](self->_signature, "length");
    v48[2] = (id)-[NSData bytes](self->_signature, "bytes");
    copy_SignatureValue();
    unprotectedAttributes = self->_unprotectedAttributes;
    if (unprotectedAttributes && -[MSCMSMutableAttributeArray count](unprotectedAttributes, "count"))
    {
      a3->var6 = (heim_base_data *)malloc(0x10uLL);
      CFTypeRef v38 = self->_unprotectedAttributes;
      v48[0] = v7;
      uint64_t v36 = -[MSCMSMutableAttributeArray encodeImplicitAttributesWithError:](v38, "encodeImplicitAttributesWithError:", v48);
      id v39 = v48[0];

      -[MSCMSSignerInfo setUnsignedAttrsData:](self, "setUnsignedAttrsData:", v36);
      uint64_t v50 = [(id)v36 length];
      id v40 = (id) v36;
      uint64_t v51 = [v40 bytes];
      MEMORY[0x186E066C0](&v50, a3->var6);

      LOBYTE(v36) = 1;
      id v7 = v39;
    }

    else
    {
      if (a3->var6) {
        a3->var6 = 0LL;
      }
      LOBYTE(v36) = 1;
    }
  }

+ (id)decodeSignerInfo:(SignerInfo *)a3 certificates:(id)a4 LAContext:(id)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = a5;
  if (a6 && *a6) {
    id v12 = (id)[*a6 copy];
  }
  else {
    id v12 = 0LL;
  }
  [MEMORY[0x189607968] numberWithInt:a3->var0];
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[MSCMSIdentifier decodeIdentifier:error:](&OBJC_CLASS___MSCMSIdentifier, "decodeIdentifier:error:", &a3->var1, a6);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  CFDataRef v15 = v14;
  BOOL v41 = v13;
  id v42 = v11;
  if (v14)
  {
    int v16 = [v14 type];
    if (v16 == 1)
    {
      if ([v13 intValue] == 1)
      {
LABEL_9:
        id v47 = v12;
        CertificateForIdentifier = (void *)findCertificateForIdentifier((uint64_t)&a3->var1, v10, v11, &v47);
        id v18 = v47;

        if (CertificateForIdentifier)
        {
          id v39 = v10;
          id v19 = objc_alloc((Class)a1);
          [v19 setSignerCertificate:CertificateForIdentifier];
          unint64_t v20 = 0x189B49000uLL;
          id v46 = v18;
          +[MSAlgorithmIdentifier algorithmIdentifierWithAsn1AlgId:error:]( &OBJC_CLASS___MSAlgorithmIdentifier,  "algorithmIdentifierWithAsn1AlgId:error:",  &a3->var2,  &v46);
          id v40 = (void *)objc_claimAutoreleasedReturnValue();
          id v21 = v46;

          var3 = a3->var3;
          if (var3)
          {
            id v45 = v21;
            +[MSCMSMutableAttributeArray createAttributeArrayFromAttributeSetRaw:error:]( &OBJC_CLASS___MSCMSMutableAttributeArray,  "createAttributeArrayFromAttributeSetRaw:error:",  var3,  &v45);
            uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
            id v12 = v45;

            if (v23)
            {
              +[MSOID OIDWithString:error:]( &OBJC_CLASS___MSOID,  "OIDWithString:error:",  @"1.2.840.113549.1.9.15",  0LL);
              CFTypeRef v24 = (void *)objc_claimAutoreleasedReturnValue();
              [v23 getAttributesWithType:v24];
              uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();

              if ((unint64_t)[v25 count] >= 2)
              {
              }

              else
              {
                +[MSOID OIDWithString:error:]( &OBJC_CLASS___MSOID,  "OIDWithString:error:",  @"1.2.840.113549.1.9.16.2.11",  0LL);
                id v26 = (void *)objc_claimAutoreleasedReturnValue();
                [v23 getAttributesWithType:v26];
                id v27 = (void *)objc_claimAutoreleasedReturnValue();

                if ((unint64_t)[v27 count] <= 1)
                {

                  id v21 = v12;
                  unint64_t v20 = 0x189B49000LL;
                  goto LABEL_19;
                }
              }
            }

            else
            {
            }

            v30 = 0LL;
            id v31 = 0LL;
            CertificateForIdentifier = 0LL;
            id v19 = 0LL;
            goto LABEL_27;
          }

          uint64_t v23 = 0LL;
LABEL_19:
          uint64_t v32 = *(void **)(v20 + 2832);
          id v44 = v21;
          [v32 algorithmIdentifierWithAsn1AlgId:&a3->var4 error:&v44];
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          id v12 = v44;

          NSDataFromOctetString(&a3->var5.var0);
          id v31 = (void *)objc_claimAutoreleasedReturnValue();
          var6 = a3->var6;
          if (var6)
          {
            id v43 = v12;
            CertificateForIdentifier = +[MSCMSMutableAttributeArray createAttributeArrayFromAttributeSetRaw:error:]( &OBJC_CLASS___MSCMSMutableAttributeArray,  "createAttributeArrayFromAttributeSetRaw:error:",  var6,  &v43);
            id v34 = v43;

            if (!CertificateForIdentifier)
            {

              id v19 = 0LL;
              id v12 = v34;
              goto LABEL_27;
            }

            id v12 = v34;
          }

          else
          {
            CertificateForIdentifier = 0LL;
          }

          [v19 setVersion:v41];
          [v19 setDigestAlgorithm:v40];
          [v19 setProtectedAttributes:v23];
          [v19 setSignatureAlgorithm:v30];
          [v19 setUnprotectedAttributes:CertificateForIdentifier];
          [v19 setSignature:v31];
          [v19 setLAContext:v42];
          id v35 = malloc(0x68uLL);
          if (v35)
          {
            uint64_t v36 = v35;
            v35[12] = 0LL;
            *((_OWORD *)v35 + 4) = 0u;
            *((_OWORD *)v35 + 5) = 0u;
            *((_OWORD *)v35 + 2) = 0u;
            *((_OWORD *)v35 + 3) = 0u;
            *(_OWORD *)id v35 = 0u;
            *((_OWORD *)v35 + 1) = 0u;
            copy_SignerInfo();
            if ([v19 encodedSignerInfo])
            {
              [v19 encodedSignerInfo];
              free_SignerInfo();
              free((void *)[v19 encodedSignerInfo]);
              [v19 setEncodedSignerInfo:0];
            }

            [v19 setEncodedSignerInfo:v36];
          }

- (void)setSignature:(id)a3
{
  self->_signatureCalculated = 0;
}

- (MSAlgorithmIdentifier)signatureAlgorithm
{
  return (MSAlgorithmIdentifier *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setSignatureAlgorithm:(id)a3
{
}

- (__SecCertificate)signerCertificate
{
  return self->_signerCertificate;
}

- (void)setSignerCertificate:(__SecCertificate *)a3
{
  self->_signerCertificate = a3;
}

- (MSCMSMutableAttributeArray)protectedAttributes
{
  return (MSCMSMutableAttributeArray *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setProtectedAttributes:(id)a3
{
}

- (NSData)signature
{
  return self->_signature;
}

- (MSCMSMutableAttributeArray)unprotectedAttributes
{
  return (MSCMSMutableAttributeArray *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setUnprotectedAttributes:(id)a3
{
}

- (NSData)LAContext
{
  return (NSData *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setLAContext:(id)a3
{
}

- (__SecKey)signerPrivKey
{
  return self->_signerPrivKey;
}

- (void)setSignerPrivKey:(__SecKey *)a3
{
  self->_signerPrivKey = a3;
}

- (SignerInfo)encodedSignerInfo
{
  return self->_encodedSignerInfo;
}

- (void)setEncodedSignerInfo:(SignerInfo *)a3
{
  self->_encodedSignerInfo = a3;
}

- (BOOL)useIssuerAndSerialNumber
{
  return self->_useIssuerAndSerialNumber;
}

- (void)setUseIssuerAndSerialNumber:(BOOL)a3
{
  self->_useIssuerAndSerialNumber = a3;
}

- (NSData)signedAttrsData
{
  return (NSData *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setSignedAttrsData:(id)a3
{
}

- (NSData)unsignedAttrsData
{
  return (NSData *)objc_getProperty(self, a2, 88LL, 1);
}

- (void)setUnsignedAttrsData:(id)a3
{
}

- (NSData)identifierData
{
  return (NSData *)objc_getProperty(self, a2, 96LL, 1);
}

- (void)setIdentifierData:(id)a3
{
}

- (NSNumber)version
{
  return (NSNumber *)objc_getProperty(self, a2, 104LL, 1);
}

- (void)setVersion:(id)a3
{
}

- (MSCMSSignedData)containingSignedData
{
  return (MSCMSSignedData *)objc_loadWeakRetained((id *)&self->_containingSignedData);
}

- (void)setContainingSignedData:(id)a3
{
}

- (MSAlgorithmIdentifier)digestAlgorithm
{
  return (MSAlgorithmIdentifier *)objc_getProperty(self, a2, 120LL, 1);
}

- (void)setDigestAlgorithm:(id)a3
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

- (BOOL)signatureCalculated
{
  return self->_signatureCalculated;
}

- (void).cxx_destruct
{
}

@end