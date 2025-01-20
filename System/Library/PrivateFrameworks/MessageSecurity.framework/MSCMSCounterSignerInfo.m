@interface MSCMSCounterSignerInfo
- (BOOL)createRequiredAttributes:(id *)a3;
- (BOOL)verifyContentTypeAttribute:(id *)a3;
- (MSCMSSignerInfo)containingSignerInfo;
- (id)calculateSignerInfoDigest:(id *)a3;
- (id)certificates;
- (void)setContainingSignerInfo:(id)a3;
@end

@implementation MSCMSCounterSignerInfo

- (id)certificates
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = -[MSCMSCounterSignerInfo containingSignerInfo](self, "containingSignerInfo");
    [v4 certificates];
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v5 = 0LL;
  }

  return v5;
}

- (void)setContainingSignerInfo:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containingSignerInfo);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_containingSignerInfo, 0LL);
    objc_storeWeak((id *)&self->_containingSignerInfo, obj);
    -[MSCMSSignerInfo setContentChanged:](self, "setContentChanged:", 1LL);
  }
}

- (id)calculateSignerInfoDigest:(id *)a3
{
  if (a3 && *a3) {
    v5 = (void *)[*a3 copy];
  }
  else {
    v5 = 0LL;
  }
  uint64_t v6 = -[MSCMSCounterSignerInfo containingSignerInfo](self, "containingSignerInfo");
  if (!v6) {
    goto LABEL_18;
  }
  v7 = (void *)v6;
  v8 = -[MSCMSCounterSignerInfo containingSignerInfo](self, "containingSignerInfo");
  [v8 signature];
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
LABEL_18:
    v27 = MSErrorCMSDomain[0];
    v28 = @"counter signer has no reference to a signer with a signature";
LABEL_19:
    +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  v27,  -50LL,  v5,  v28);
    id v20 = (id)objc_claimAutoreleasedReturnValue();

    id v19 = 0LL;
    goto LABEL_20;
  }
  v10 = -[MSCMSSignerInfo digestAlgorithm](self, "digestAlgorithm");
  if (!v10)
  {
    v11 = -[MSCMSSignerInfo signatureAlgorithm](self, "signatureAlgorithm");
    if (!v11)
    {
      v27 = MSErrorCMSDomain[0];
      v28 = @"signer has no signature algorithm";
      goto LABEL_19;
    }
    v12 = -[MSCMSSignerInfo signatureAlgorithm](self, "signatureAlgorithm");
    id v34 = v5;
    v13 = +[MSAlgorithmIdentifier digestAlgorithmWithSignatureAlgorithm:error:]( &OBJC_CLASS___MSAlgorithmIdentifier,  "digestAlgorithmWithSignatureAlgorithm:error:",  v12,  &v34);
    id v14 = v34;

    -[MSCMSSignerInfo setDigestAlgorithm:](self, "setDigestAlgorithm:", v13);
    v5 = v14;
  }
  v15 = -[MSCMSSignerInfo digestAlgorithm](self, "digestAlgorithm");
  if (!v15)
  {
    v27 = MSErrorCMSDomain[0];
    v28 = @"No digest algorithm specified";
    goto LABEL_19;
  }
  v16 = -[MSCMSCounterSignerInfo containingSignerInfo](self, "containingSignerInfo");
  v17 = -[MSCMSSignerInfo digestAlgorithm](self, "digestAlgorithm");
  [v17 algorithm];
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  id v33 = v5;
  [v16 calculateSignatureDigestWithAlgorithm:v18 error:&v33];
  id v19 = (id)objc_claimAutoreleasedReturnValue();
  id v20 = v33;

  if (v19)
  {
    v21 = -[MSCMSSignerInfo protectedAttributes](self, "protectedAttributes");
    uint64_t v22 = [v21 count];

    if (!v22)
    {
      id v19 = v19;
      v26 = v19;
      if (!a3) {
        goto LABEL_25;
      }
      goto LABEL_23;
    }

    id v32 = v20;
    BOOL v23 = -[MSCMSCounterSignerInfo verifyContentTypeAttribute:](self, "verifyContentTypeAttribute:", &v32);
    id v24 = v32;

    if (!v23)
    {
      v26 = 0LL;
LABEL_16:
      id v20 = v24;
      if (!a3) {
        goto LABEL_25;
      }
      goto LABEL_23;
    }

    id v31 = v24;
    BOOL v25 = -[MSCMSSignerInfo verifyMessageDigestAttribute:error:](self, "verifyMessageDigestAttribute:error:", v19, &v31);
    id v20 = v31;

    if (v25)
    {
      id v30 = v20;
      v26 = -[MSCMSSignerInfo calculateSignedAttributesDigest:](self, "calculateSignedAttributesDigest:", &v30);
      id v24 = v30;

      goto LABEL_16;
    }
  }

- (BOOL)verifyContentTypeAttribute:(id *)a3
{
  if (a3 && *a3) {
    v5 = (void *)[*a3 copy];
  }
  else {
    v5 = 0LL;
  }
  id v12 = v5;
  +[MSOID OIDWithString:error:](&OBJC_CLASS___MSOID, "OIDWithString:error:", @"1.2.840.113549.1.9.3", &v12);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  id v7 = v12;
  v8 = -[MSCMSSignerInfo getAttributesWithType:](self, "getAttributesWithType:", v6);
  if (v8 && [v8 count])
  {
    uint64_t v11 = +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  MSErrorCMSDomain[0],  -26275LL,  v7,  @"Content-type attribute must not be present in Countersignature");

    BOOL v9 = 0;
    id v7 = (id)v11;
    if (!a3) {
      goto LABEL_10;
    }
  }

  else
  {
    BOOL v9 = 1;
    if (!a3) {
      goto LABEL_10;
    }
  }

  if (v7) {
    *a3 = v7;
  }
LABEL_10:

  return v9;
}

- (BOOL)createRequiredAttributes:(id *)a3
{
  uint64_t v5 = -[MSCMSSignerInfo protectedAttributes](self, "protectedAttributes");
  if (!v5
    || (uint64_t v6 = (void *)v5,
        -[MSCMSSignerInfo protectedAttributes](self, "protectedAttributes"),
        id v7 = (void *)objc_claimAutoreleasedReturnValue(),
        uint64_t v8 = [v7 count],
        v7,
        v6,
        !v8))
  {
    id v13 = 0LL;
    BOOL v22 = 1;
    goto LABEL_12;
  }

  -[MSCMSCounterSignerInfo containingSignerInfo](self, "containingSignerInfo");
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[MSCMSSignerInfo digestAlgorithm](self, "digestAlgorithm");
  [v10 algorithm];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  id v26 = 0LL;
  [v9 calculateSignatureDigestWithAlgorithm:v11 error:&v26];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  id v13 = v26;

  if (!-[MSCMSCounterSignerInfo verifyContentTypeAttribute:](self, "verifyContentTypeAttribute:", 0LL)
    || !-[MSCMSSignerInfo verifyMessageDigestAttribute:error:](self, "verifyMessageDigestAttribute:error:", v12, 0LL))
  {
    -[MSCMSSignerInfo protectedAttributes](self, "protectedAttributes");
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    id v25 = v13;
    v15 = +[MSOID OIDWithString:error:](&OBJC_CLASS___MSOID, "OIDWithString:error:", @"1.2.840.113549.1.9.3", &v25);
    id v16 = v25;

    [v14 removeAttributes:v15];
    v17 = -[MSCMSSignerInfo protectedAttributes](self, "protectedAttributes");
    id v24 = v16;
    v18 = +[MSOID OIDWithString:error:](&OBJC_CLASS___MSOID, "OIDWithString:error:", @"1.2.840.113549.1.9.4", &v24);
    id v13 = v24;

    [v17 removeAttributes:v18];
    uint64_t v19 = +[MSCMSMessageDigestAttribute messageDigestAttributeWithDigest:]( &OBJC_CLASS___MSCMSMessageDigestAttribute,  "messageDigestAttributeWithDigest:",  v12);
    if (!v19)
    {
      BOOL v22 = 0;
      goto LABEL_8;
    }

    id v20 = (void *)v19;
    v21 = -[MSCMSSignerInfo protectedAttributes](self, "protectedAttributes");
    [v21 addObject:v20];
  }

  BOOL v22 = 1;
LABEL_8:

  if (a3 && v13)
  {
    id v13 = v13;
    *a3 = v13;
  }

- (MSCMSSignerInfo)containingSignerInfo
{
  return (MSCMSSignerInfo *)objc_loadWeakRetained((id *)&self->_containingSignerInfo);
}

- (void).cxx_destruct
{
}

@end