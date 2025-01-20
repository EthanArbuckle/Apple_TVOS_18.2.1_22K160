@interface MSCMSMultipleSignaturesAttribute
- (MSAlgorithmIdentifier)bodyHashAlgorithm;
- (MSAlgorithmIdentifier)signatureAlgorithm;
- (MSAlgorithmIdentifier)signedAttrsHashAlgorithm;
- (MSCMSMultipleSignaturesAttribute)init;
- (MSCMSMultipleSignaturesAttribute)initWithAttribute:(id)a3 error:(id *)a4;
- (MSCMSSignerInfo)containingSignerInfo;
- (MSOID)attributeType;
- (NSData)signedAttrsHash;
- (id)encodeAttributeWithError:(id *)a3;
- (void)setBodyHashAlgorithm:(id)a3;
- (void)setContainingSignerInfo:(id)a3;
- (void)setSignatureAlgorithm:(id)a3;
- (void)setSignedAttrsHash:(id)a3;
- (void)setSignedAttrsHashAlgorithm:(id)a3;
@end

@implementation MSCMSMultipleSignaturesAttribute

- (void)setBodyHashAlgorithm:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_bodyHashAlgorithm, a3);
    id v5 = v6;
  }
}

- (void)setSignatureAlgorithm:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_signatureAlgorithm, a3);
    id v5 = v6;
  }
}

- (void)setSignedAttrsHashAlgorithm:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_signedAttrsHashAlgorithm, a3);
    id v5 = v6;
  }
}

- (MSCMSMultipleSignaturesAttribute)init
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___MSCMSMultipleSignaturesAttribute;
  v2 = -[MSCMSMultipleSignaturesAttribute init](&v13, sel_init);
  v3 = +[MSOID OIDWithString:error:](&OBJC_CLASS___MSOID, "OIDWithString:error:", @"2.16.840.1.101.3.4.2.1", 0LL);
  uint64_t v4 = +[MSAlgorithmIdentifier algorithmIdentifierWithOID:]( &OBJC_CLASS___MSAlgorithmIdentifier,  "algorithmIdentifierWithOID:",  v3);
  bodyHashAlgorithm = v2->_bodyHashAlgorithm;
  v2->_bodyHashAlgorithm = (MSAlgorithmIdentifier *)v4;

  +[MSOID OIDWithString:error:](&OBJC_CLASS___MSOID, "OIDWithString:error:", @"1.2.840.10045.4.3.2", 0LL);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = +[MSAlgorithmIdentifier algorithmIdentifierWithOID:]( &OBJC_CLASS___MSAlgorithmIdentifier,  "algorithmIdentifierWithOID:",  v6);
  signatureAlgorithm = v2->_signatureAlgorithm;
  v2->_signatureAlgorithm = (MSAlgorithmIdentifier *)v7;
  v9 = +[MSOID OIDWithString:error:](&OBJC_CLASS___MSOID, "OIDWithString:error:", @"2.16.840.1.101.3.4.2.1", 0LL);
  uint64_t v10 = +[MSAlgorithmIdentifier algorithmIdentifierWithOID:]( &OBJC_CLASS___MSAlgorithmIdentifier,  "algorithmIdentifierWithOID:",  v9);
  signedAttrsHashAlgorithm = v2->_signedAttrsHashAlgorithm;
  v2->_signedAttrsHashAlgorithm = (MSAlgorithmIdentifier *)v10;

  objc_storeWeak((id *)&v2->_signedAttrsHash, 0LL);
  return v2;
}

- (MSOID)attributeType
{
  return +[MSOID OIDWithString:error:]( &OBJC_CLASS___MSOID,  "OIDWithString:error:",  @"1.2.840.113549.1.9.2.51",  0LL);
}

- (id)encodeAttributeWithError:(id *)a3
{
  v28[1] = *MEMORY[0x1895F89C0];
  -[MSAlgorithmIdentifier asn1AlgId](self->_bodyHashAlgorithm, "asn1AlgId");
  -[MSAlgorithmIdentifier asn1AlgId](self->_signatureAlgorithm, "asn1AlgId");
  -[MSAlgorithmIdentifier asn1AlgId](self->_signedAttrsHashAlgorithm, "asn1AlgId");
  p_signedAttrsHash = &self->_signedAttrsHash;
  id WeakRetained = objc_loadWeakRetained((id *)p_signedAttrsHash);

  if (WeakRetained)
  {
    id v7 = objc_loadWeakRetained((id *)p_signedAttrsHash);
    [v7 length];

    id v8 = objc_loadWeakRetained((id *)p_signedAttrsHash);
    [v8 bytes];
  }

  uint64_t v9 = length_MultipleSignatures();
  [MEMORY[0x189603FB8] dataWithLength:v9];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    uint64_t v14 = 12LL;
    if (!a3) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }

  id v11 = v10;
  [v11 mutableBytes];
  int v12 = encode_MultipleSignatures();
  if (v12)
  {
    int v13 = v12;

    uint64_t v14 = v13;
    if (!a3)
    {
LABEL_7:
      id v11 = 0LL;
LABEL_11:
      v17 = objc_alloc(&OBJC_CLASS___MSCMSAttribute);
      v18 = +[MSOID OIDWithString:error:](&OBJC_CLASS___MSOID, "OIDWithString:error:", @"1.2.840.113549.1.9.2.51", a3);
      [MEMORY[0x189603F18] arrayWithObject:v11];
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = -[MSCMSAttribute initWithAttributeType:values:](v17, "initWithAttributeType:values:", v18, v19);

      return v20;
    }

- (MSCMSMultipleSignaturesAttribute)initWithAttribute:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v35.receiver = self;
  v35.super_class = (Class)&OBJC_CLASS___MSCMSMultipleSignaturesAttribute;
  id v7 = -[MSCMSMultipleSignaturesAttribute init](&v35, sel_init);
  [v6 attributeType];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  char v9 = [v8 isEqualToString:@"1.2.840.113549.1.9.2.51"];

  if ((v9 & 1) == 0)
  {
    if (a4)
    {
      v15 = MSErrorCMSDomain[0];
      id v17 = *a4;
      v18 = @"Not a Multiple Signatures attribute according to AttributeType";
      uint64_t v16 = -26275LL;
      goto LABEL_10;
    }

- (MSCMSSignerInfo)containingSignerInfo
{
  return (MSCMSSignerInfo *)objc_loadWeakRetained((id *)&self->_containingSignerInfo);
}

- (void)setContainingSignerInfo:(id)a3
{
}

- (MSAlgorithmIdentifier)bodyHashAlgorithm
{
  return self->_bodyHashAlgorithm;
}

- (MSAlgorithmIdentifier)signatureAlgorithm
{
  return self->_signatureAlgorithm;
}

- (MSAlgorithmIdentifier)signedAttrsHashAlgorithm
{
  return self->_signedAttrsHashAlgorithm;
}

- (NSData)signedAttrsHash
{
  return (NSData *)objc_loadWeakRetained((id *)&self->_signedAttrsHash);
}

- (void)setSignedAttrsHash:(id)a3
{
}

- (void).cxx_destruct
{
}

@end