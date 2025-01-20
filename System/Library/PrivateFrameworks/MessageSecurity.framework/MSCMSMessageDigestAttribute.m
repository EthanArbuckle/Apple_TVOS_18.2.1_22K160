@interface MSCMSMessageDigestAttribute
+ (id)messageDigestAttributeWithDigest:(id)a3;
- (MSCMSMessageDigestAttribute)initWithAttribute:(id)a3 error:(id *)a4;
- (MSCMSMessageDigestAttribute)initWithDigest:(id)a3;
- (MSOID)attributeType;
- (NSData)messageDigest;
- (id)encodeAttributeWithError:(id *)a3;
- (void)setMessageDigest:(id)a3;
@end

@implementation MSCMSMessageDigestAttribute

- (MSOID)attributeType
{
  return +[MSOID OIDWithString:error:](&OBJC_CLASS___MSOID, "OIDWithString:error:", @"1.2.840.113549.1.9.4", 0LL);
}

- (MSCMSMessageDigestAttribute)initWithAttribute:(id)a3 error:(id *)a4
{
  id v6 = a3;
  [v6 attributeType];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  char v8 = [v7 isEqualToString:@"1.2.840.113549.1.9.4"];

  if ((v8 & 1) == 0)
  {
    if (!a4) {
      goto LABEL_12;
    }
    v14 = MSErrorCMSDomain[0];
    id v16 = *a4;
    v17 = @"Not a MessageDigest attribute according to AttributeType";
LABEL_10:
    uint64_t v15 = -26275LL;
    goto LABEL_11;
  }

  [v6 attributeValues];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = [v9 count];

  if (v10 != 1)
  {
    if (!a4) {
      goto LABEL_12;
    }
    v14 = MSErrorCMSDomain[0];
    id v16 = *a4;
    v17 = @"MessageDigest attribute contains more than one value";
    goto LABEL_10;
  }

  [v6 attributeValues];
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 objectAtIndex:0];
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  int v13 = nsheim_decode_MessageDigest(v12);

  if (v13)
  {
    if (a4)
    {
      v14 = MSErrorASN1Domain[0];
      uint64_t v15 = v13;
      id v16 = *a4;
      v17 = @"unable to decode MessageDigest";
LABEL_11:
      +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  v14,  v15,  v16,  v17);
      v18 = 0LL;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }

- (id)encodeAttributeWithError:(id *)a3
{
  v23[1] = *MEMORY[0x1895F89C0];
  -[NSData length](self->_messageDigest, "length");
  -[NSData bytes](self->_messageDigest, "bytes");
  uint64_t v5 = length_MessageDigest();
  [MEMORY[0x189603FB8] dataWithLength:v5];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    uint64_t v10 = 12LL;
    if (!a3) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }

  id v7 = v6;
  [v7 mutableBytes];
  int v8 = encode_MessageDigest();
  if (v8)
  {
    int v9 = v8;

    uint64_t v10 = v9;
    if (!a3)
    {
LABEL_5:
      id v7 = 0LL;
      goto LABEL_9;
    }

- (MSCMSMessageDigestAttribute)initWithDigest:(id)a3
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if ([v4 length] == 16
    || [v4 length] == 20
    || [v4 length] == 28
    || [v4 length] == 32
    || [v4 length] == 48
    || [v4 length] == 64)
  {
    v11.receiver = self;
    v11.super_class = (Class)&OBJC_CLASS___MSCMSMessageDigestAttribute;
    uint64_t v5 = -[MSCMSMessageDigestAttribute init](&v11, sel_init);
    id v6 = v5;
    if (v5) {
      -[MSCMSMessageDigestAttribute setMessageDigest:](v5, "setMessageDigest:", v4);
    }
    self = v6;
    id v7 = self;
  }

  else
  {
    if (MS_DEFAULT_LOG_BLOCK != -1) {
      dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_153);
    }
    int v9 = (void *)MS_DEFAULT_LOG_INTERNAL;
    if (os_log_type_enabled((os_log_t)MS_DEFAULT_LOG_INTERNAL, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = v9;
      *(_DWORD *)buf = 134217984;
      uint64_t v13 = [v4 length];
      _os_log_impl(&dword_1810EE000, v10, OS_LOG_TYPE_ERROR, "Digest length %lu is not a supported length", buf, 0xCu);
    }

    id v7 = 0LL;
  }

  return v7;
}

void __46__MSCMSMessageDigestAttribute_initWithDigest___block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.MessageSecurity", "default");
  v1 = (void *)MS_DEFAULT_LOG_INTERNAL;
  MS_DEFAULT_LOG_INTERNAL = (uint64_t)v0;
}

+ (id)messageDigestAttributeWithDigest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)[objc_alloc((Class)a1) initWithDigest:v4];

  return v5;
}

- (NSData)messageDigest
{
  return (NSData *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setMessageDigest:(id)a3
{
}

- (void).cxx_destruct
{
}

@end