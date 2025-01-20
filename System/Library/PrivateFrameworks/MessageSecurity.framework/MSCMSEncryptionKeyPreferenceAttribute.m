@interface MSCMSEncryptionKeyPreferenceAttribute
- (BOOL)legacyASN1Encoding;
- (MSCMSEncryptionKeyPreferenceAttribute)initWithAttribute:(id)a3 certificates:(id)a4 LAContext:(id)a5 error:(id *)a6;
- (MSCMSEncryptionKeyPreferenceAttribute)initWithAttribute:(id)a3 error:(id *)a4;
- (MSCMSEncryptionKeyPreferenceAttribute)initWithCertificate:(__SecCertificate *)a3;
- (MSCMSEncryptionKeyPreferenceAttribute)initWithEmailAddress:(id)a3;
- (MSCMSEncryptionKeyPreferenceAttribute)initWithIdentity:(__SecIdentity *)a3;
- (MSOID)attributeType;
- (__SecCertificate)encryptionCertificate;
- (id)encodeAttributeWithError:(id *)a3;
- (void)dealloc;
- (void)setLegacyASN1Encoding:(BOOL)a3;
@end

@implementation MSCMSEncryptionKeyPreferenceAttribute

- (MSOID)attributeType
{
  return +[MSOID OIDWithString:error:]( &OBJC_CLASS___MSOID,  "OIDWithString:error:",  @"1.2.840.113549.1.9.16.2.11",  0LL);
}

- (MSCMSEncryptionKeyPreferenceAttribute)initWithAttribute:(id)a3 error:(id *)a4
{
  return -[MSCMSEncryptionKeyPreferenceAttribute initWithAttribute:certificates:LAContext:error:]( self,  "initWithAttribute:certificates:LAContext:error:",  a3,  0LL,  0LL,  a4);
}

- (MSCMSEncryptionKeyPreferenceAttribute)initWithAttribute:(id)a3 certificates:(id)a4 LAContext:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v35.receiver = self;
  v35.super_class = (Class)&OBJC_CLASS___MSCMSEncryptionKeyPreferenceAttribute;
  v13 = -[MSCMSEncryptionKeyPreferenceAttribute init](&v35, sel_init);
  [v10 attributeType];
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  char v15 = [v14 isEqualToString:@"1.2.840.113549.1.9.16.2.11"];

  if ((v15 & 1) == 0)
  {
    v27 = MSErrorCMSDomain[0];
    v28 = @"Not an Encryption Key Preference attribute according to AttributeType";
    uint64_t v29 = -26275LL;
    goto LABEL_15;
  }

  [v10 attributeValues];
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v17 = [v16 count];

  if (v17 != 1)
  {
    v27 = MSErrorCMSDomain[0];
    v28 = @"Encryption Key Preference Attribute should only have one value";
    uint64_t v29 = -50LL;
    goto LABEL_15;
  }

  [v10 attributeValues];
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  [v18 objectAtIndex:0];
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)nsheim_decode_SMIMEEncryptionKeyPreference(v19);

  if ((_DWORD)v20)
  {
    [v10 attributeValues];
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    [v21 objectAtIndex:0];
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    int v23 = nsheim_decode_SecCMS_SMIMEEncryptionKeyPreference(v22);

    if (v23)
    {
      id v32 = 0LL;
      asn1ErrorToNSError(v20, &v32);
      id v24 = v32;
      +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  MSErrorASN1Domain[0],  (int)v20,  v24,  @"unable to decode Encryption Key Preference Attribute");
      id v25 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_16;
    }
  }

  if (v33 == 3 || v33 == 2)
  {
    uint64_t CertificateBySubjectKeyID = findCertificateBySubjectKeyID(v34, v11, v12, a6);
    goto LABEL_11;
  }

  if (v33 == 1)
  {
    uint64_t CertificateBySubjectKeyID = findCertificateByIssuerAndSerialNumber(v34, v11, v12, a6);
LABEL_11:
    if (CertificateBySubjectKeyID)
    {
      v13->_encryptionCertificate = (__SecCertificate *)CertificateBySubjectKeyID;
      free_SMIMEEncryptionKeyPreference();
LABEL_19:
      v30 = v13;
      id v25 = 0LL;
      goto LABEL_20;
    }

    v27 = MSErrorASN1Domain[0];
    v28 = @"the Encryption Key Preference Attribute did not match any certificates";
    goto LABEL_14;
  }

  v27 = MSErrorASN1Domain[0];
  v28 = @"unknown type for Encryption Key Preference Attribute";
LABEL_14:
  uint64_t v29 = 0LL;
LABEL_15:
  +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  v27,  v29,  0LL,  v28);
  id v25 = (id)objc_claimAutoreleasedReturnValue();
LABEL_16:
  free_SMIMEEncryptionKeyPreference();
  if (!v25) {
    goto LABEL_19;
  }
  if (a6)
  {
    id v25 = v25;
    v30 = 0LL;
    *a6 = v25;
  }

  else
  {
    v30 = 0LL;
  }

- (MSCMSEncryptionKeyPreferenceAttribute)initWithCertificate:(__SecCertificate *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MSCMSEncryptionKeyPreferenceAttribute;
  v4 = -[MSCMSEncryptionKeyPreferenceAttribute init](&v6, sel_init);
  if (v4)
  {
    if (a3) {
      CFRetain(a3);
    }
    v4->_encryptionCertificate = a3;
  }

  return v4;
}

- (MSCMSEncryptionKeyPreferenceAttribute)initWithIdentity:(__SecIdentity *)a3
{
  SecCertificateRef certificateRef = 0LL;
  if (!SecIdentityCopyCertificate(a3, &certificateRef)) {
    self = -[MSCMSEncryptionKeyPreferenceAttribute initWithCertificate:](self, "initWithCertificate:", certificateRef);
  }
  if (certificateRef) {
    CFRelease(certificateRef);
  }
  return self;
}

- (MSCMSEncryptionKeyPreferenceAttribute)initWithEmailAddress:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4 && (CertificateByEmailAddress = (__SecCertificate *)findCertificateByEmailAddress(v4, 0LL, 0LL)) != 0LL)
  {
    self->_encryptionCertificate = CertificateByEmailAddress;
    v7 = self;
  }

  else
  {
    v7 = 0LL;
  }

  return v7;
}

- (id)encodeAttributeWithError:(id *)a3
{
  v34[1] = *MEMORY[0x1895F89C0];
  encryptionCertificate = self->_encryptionCertificate;
  if (!encryptionCertificate) {
    return 0LL;
  }
  CFDataRef v6 = SecCertificateCopyNormalizedIssuerSequence(encryptionCertificate);
  CFDataRef v7 = SecCertificateCopySerialNumberData(self->_encryptionCertificate, &error);
  CFDataRef v8 = v7;
  if (v6) {
    BOOL v9 = v7 == 0LL;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    id v10 = 0LL;
    if (a3) {
      *a3 = error;
    }
    goto LABEL_32;
  }

  -[__CFData length](v6, "length");
  -[__CFData bytes](v6, "bytes");
  -[__CFData length](v8, "length");
  -[__CFData bytes](v8, "bytes");
  if (!-[MSCMSEncryptionKeyPreferenceAttribute legacyASN1Encoding](self, "legacyASN1Encoding"))
  {
    uint64_t v12 = length_SMIMEEncryptionKeyPreference();
    [MEMORY[0x189603FB8] dataWithLength:v12];
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      id v14 = v18;
      [v14 mutableBytes];
      int v19 = encode_SMIMEEncryptionKeyPreference();
      if (!v19) {
        goto LABEL_20;
      }
      int v20 = v19;

      uint64_t v17 = v20;
      if (!a3) {
        goto LABEL_27;
      }
    }

    else
    {
      uint64_t v17 = 12LL;
      if (!a3) {
        goto LABEL_27;
      }
    }

    v21 = (void *)MEMORY[0x189607870];
    uint64_t v31 = *MEMORY[0x1896075E0];
    id v32 = @"Failed encoding type SMIMEEncryptionKeyPreference";
    v22 = (void *)MEMORY[0x189603F68];
    int v23 = &v32;
    id v24 = &v31;
    goto LABEL_26;
  }

  uint64_t v12 = length_SecCMS_SMIMEEncryptionKeyPreference();
  [MEMORY[0x189603FB8] dataWithLength:v12];
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13) {
    goto LABEL_22;
  }
  id v14 = v13;
  [v14 mutableBytes];
  int v15 = encode_SecCMS_SMIMEEncryptionKeyPreference();
  if (v15)
  {
    int v16 = v15;

    uint64_t v17 = v16;
    if (!a3) {
      goto LABEL_27;
    }
    goto LABEL_23;
  }

- (void)dealloc
{
  encryptionCertificate = self->_encryptionCertificate;
  if (encryptionCertificate) {
    CFRelease(encryptionCertificate);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MSCMSEncryptionKeyPreferenceAttribute;
  -[MSCMSEncryptionKeyPreferenceAttribute dealloc](&v4, sel_dealloc);
}

- (__SecCertificate)encryptionCertificate
{
  return self->_encryptionCertificate;
}

- (BOOL)legacyASN1Encoding
{
  return self->_legacyASN1Encoding;
}

- (void)setLegacyASN1Encoding:(BOOL)a3
{
  self->_legacyASN1Encoding = a3;
}

@end