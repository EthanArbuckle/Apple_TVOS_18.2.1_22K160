@interface MSCMSContentTypeAttribute
+ (id)contentTypeAttributeWithOID:(id)a3;
- (MSCMSContentTypeAttribute)initWithAttribute:(id)a3 error:(id *)a4;
- (MSCMSContentTypeAttribute)initWithOID:(id)a3;
- (MSOID)attributeType;
- (MSOID)contentType;
- (id)encodeAttributeWithError:(id *)a3;
- (void)setContentType:(id)a3;
@end

@implementation MSCMSContentTypeAttribute

- (MSOID)attributeType
{
  return +[MSOID OIDWithString:error:](&OBJC_CLASS___MSOID, "OIDWithString:error:", @"1.2.840.113549.1.9.3", 0LL);
}

- (MSCMSContentTypeAttribute)initWithAttribute:(id)a3 error:(id *)a4
{
  id v6 = a3;
  [v6 attributeType];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  char v8 = [v7 isEqualToString:@"1.2.840.113549.1.9.3"];

  if ((v8 & 1) == 0)
  {
    if (!a4) {
      goto LABEL_12;
    }
    v14 = MSErrorCMSDomain[0];
    id v16 = *a4;
    v17 = @"Not a ContentType attribute according to AttributeType";
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
    v17 = @"ContentType attribute contains more than one value";
    goto LABEL_10;
  }

  [v6 attributeValues];
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 objectAtIndex:0];
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  int v13 = nsheim_decode_ContentType(v12);

  if (v13)
  {
    if (a4)
    {
      v14 = MSErrorASN1Domain[0];
      uint64_t v15 = v13;
      id v16 = *a4;
      v17 = @"unable to decode ContentType";
LABEL_11:
      +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  v14,  v15,  v16,  v17);
      v18 = 0LL;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }

- (id)encodeAttributeWithError:(id *)a3
{
  v22[1] = *MEMORY[0x1895F89C0];
  -[MSOID Asn1OID](self->_contentType, "Asn1OID");
  uint64_t v4 = length_ContentType();
  [MEMORY[0x189603FB8] dataWithLength:v4];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    uint64_t v9 = 12LL;
    if (!a3) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }

  id v6 = v5;
  [v6 mutableBytes];
  int v7 = encode_ContentType();
  if (v7)
  {
    int v8 = v7;

    uint64_t v9 = v8;
    if (!a3)
    {
LABEL_5:
      id v6 = 0LL;
      goto LABEL_9;
    }

- (MSCMSContentTypeAttribute)initWithOID:(id)a3
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if (initWithOID__onceToken != -1) {
    dispatch_once(&initWithOID__onceToken, &__block_literal_global_4);
  }
  uint64_t v5 = initWithOID__sKnownContentTypes;
  [v4 OIDString];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = [(id)v5 containsObject:v6];

  if ((v5 & 1) != 0)
  {
    v14.receiver = self;
    v14.super_class = (Class)&OBJC_CLASS___MSCMSContentTypeAttribute;
    int v7 = -[MSCMSContentTypeAttribute init](&v14, sel_init);
    int v8 = v7;
    if (v7) {
      -[MSCMSContentTypeAttribute setContentType:](v7, "setContentType:", v4);
    }
    self = v8;
    uint64_t v9 = self;
  }

  else
  {
    if (MS_DEFAULT_LOG_BLOCK != -1) {
      dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_130);
    }
    uint64_t v10 = (void *)MS_DEFAULT_LOG_INTERNAL;
    if (os_log_type_enabled((os_log_t)MS_DEFAULT_LOG_INTERNAL, OS_LOG_TYPE_ERROR))
    {
      v11 = v10;
      [v4 OIDString];
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      id v16 = v12;
      _os_log_impl(&dword_1810EE000, v11, OS_LOG_TYPE_ERROR, "Found unknown content type: %@", buf, 0xCu);
    }

    uint64_t v9 = 0LL;
  }

  return v9;
}

void __41__MSCMSContentTypeAttribute_initWithOID___block_invoke()
{
  v4[9] = *MEMORY[0x1895F89C0];
  v0 = (void *)MEMORY[0x189604010];
  v4[0] = @"1.2.840.113549.1.7.1";
  v4[1] = @"1.2.840.113549.1.7.2";
  v4[2] = @"1.2.840.113549.1.7.3";
  v4[3] = @"1.2.840.113549.1.7.5";
  v4[4] = @"1.2.840.113549.1.7.6";
  v4[5] = @"1.2.840.113549.1.9.16.1.2";
  v4[6] = @"1.2.840.113549.1.9.16.1.23";
  v4[7] = @"1.2.840.113549.1.9.16.1.9";
  v4[8] = @"1.2.840.113549.1.9.16.1.4";
  [MEMORY[0x189603F18] arrayWithObjects:v4 count:9];
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [v0 setWithArray:v1];
  v3 = (void *)initWithOID__sKnownContentTypes;
  initWithOID__sKnownContentTypes = v2;
}

void __41__MSCMSContentTypeAttribute_initWithOID___block_invoke_2()
{
  os_log_t v0 = os_log_create("com.apple.MessageSecurity", "default");
  v1 = (void *)MS_DEFAULT_LOG_INTERNAL;
  MS_DEFAULT_LOG_INTERNAL = (uint64_t)v0;
}

+ (id)contentTypeAttributeWithOID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)[objc_alloc((Class)a1) initWithOID:v4];

  return v5;
}

- (MSOID)contentType
{
  return (MSOID *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setContentType:(id)a3
{
}

- (void).cxx_destruct
{
}

@end