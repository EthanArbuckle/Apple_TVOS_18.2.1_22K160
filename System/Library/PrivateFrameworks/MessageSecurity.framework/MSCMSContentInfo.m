@interface MSCMSContentInfo
+ (id)decodeMessageSecurityObject:(id)a3 options:(id)a4 error:(id *)a5;
- (MSCMSContentInfo)initWithDataContent:(id)a3;
- (MSCMSContentInfo)initWithEmbeddedContent:(id)a3;
- (MSCMSMessage)embeddedContent;
- (MSOID)contentType;
- (NSData)content;
- (id)encodeMessageSecurityObject:(id *)a3;
- (void)setContent:(id)a3;
- (void)setContentType:(id)a3;
- (void)setEmbeddedContent:(id)a3;
@end

@implementation MSCMSContentInfo

- (id)encodeMessageSecurityObject:(id *)a3
{
  v46[1] = *MEMORY[0x1895F89C0];
  if (a3 && *a3) {
    v5 = (void *)[*a3 copy];
  }
  else {
    v5 = 0LL;
  }
  contentType = self->_contentType;
  if (!contentType) {
    goto LABEL_35;
  }
  embeddedContent = self->_embeddedContent;
  p_content = &self->_content;
  if (!self->_content)
  {
    if (embeddedContent)
    {
      uint64_t v40 = 0LL;
      uint64_t v41 = 0LL;
      v42 = v39;
LABEL_14:
      id v38 = v5;
      -[MSCMSMessage encodeMessageSecurityObject:](embeddedContent, "encodeMessageSecurityObject:", &v38);
      v15 = (NSData *)objc_claimAutoreleasedReturnValue();
      id v16 = v38;

      if (v15)
      {
        objc_storeStrong((id *)&self->_content, v15);
        goto LABEL_25;
      }

+ (id)decodeMessageSecurityObject:(id)a3 options:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  if (a5 && *a5) {
    uint64_t v9 = (void *)[*a5 copy];
  }
  else {
    uint64_t v9 = 0LL;
  }
  v28[0] = 0LL;
  v28[1] = 0LL;
  uint64_t v29 = 0LL;
  int v10 = nsheim_decode_ContentInfo(v7);
  if (v10)
  {
    id v11 = MSErrorASN1Domain[0];
    uint64_t v12 = v10;
    if (v7) {
      uint64_t v13 = [v7 length];
    }
    else {
      uint64_t v13 = -1LL;
    }
    +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  v11,  v12,  v9,  @"unable to decode content info (%ld bytes)",  v13);
    id v18 = (id)objc_claimAutoreleasedReturnValue();

    dumpNSData("ContentInfo", v7);
    v19 = 0LL;
    uint64_t v14 = 0LL;
    id v16 = 0LL;
LABEL_14:
    uint64_t v20 = 0LL;
    if (!a5) {
      goto LABEL_25;
    }
    goto LABEL_23;
  }

  id v27 = v9;
  +[MSOID OIDWithAsn1OID:error:](&OBJC_CLASS___MSOID, "OIDWithAsn1OID:error:", v28, &v27);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  id v15 = v27;

  NSDataFromAny(v29);
  id v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    if ([v14 isEqualToString:@"1.2.840.113549.1.7.1"])
    {
      int v17 = nsheim_decode_DataContent(v16);
      if (v17)
      {
        +[MSError MSErrorWithDomain:code:underlyingError:description:]( MSError,  "MSErrorWithDomain:code:underlyingError:description:",  MSErrorASN1Domain[0],  v17,  v15,  @"unable to decode data content (%ld bytes)",  [v16 length]);
        id v18 = (id)objc_claimAutoreleasedReturnValue();

        dumpNSData("DataContent", v16);
        v19 = 0LL;
        goto LABEL_14;
      }

      uint64_t v21 = [MEMORY[0x189603F48] dataWithBytes:v25 length:v24];

      free_DataContent();
      uint64_t v20 = 0LL;
      id v16 = (void *)v21;
    }

    else
    {
      id v26 = v15;
      decodeEmbeddedCMSContent(v14, v16, v8, (uint64_t)&v26);
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
      id v18 = v26;

      if (!v20)
      {
        v19 = 0LL;
        if (!a5) {
          goto LABEL_25;
        }
        goto LABEL_23;
      }

      id v15 = v18;
    }
  }

  else
  {
    uint64_t v20 = 0LL;
  }

  v19 = objc_alloc(&OBJC_CLASS___MSCMSContentInfo);
  -[MSCMSContentInfo setContentType:](v19, "setContentType:", v14);
  -[MSCMSContentInfo setContent:](v19, "setContent:", v16);
  if (v20) {
    -[MSCMSContentInfo setEmbeddedContent:](v19, "setEmbeddedContent:", v20);
  }
  id v18 = v15;
  if (a5)
  {
LABEL_23:
    if (v18) {
      *a5 = v18;
    }
  }

- (MSCMSContentInfo)initWithEmbeddedContent:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___MSCMSContentInfo;
  v6 = -[MSCMSContentInfo init](&v11, sel_init);
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_embeddedContent, a3);
    uint64_t v8 = [v5 type];
    contentType = v7->_contentType;
    v7->_contentType = (MSOID *)v8;
  }

  return v7;
}

- (MSCMSContentInfo)initWithDataContent:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___MSCMSContentInfo;
  v6 = -[MSCMSContentInfo init](&v11, sel_init);
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_content, a3);
    uint64_t v8 = +[MSOID OIDWithString:error:](&OBJC_CLASS___MSOID, "OIDWithString:error:", @"1.2.840.113549.1.7.1", 0LL);
    contentType = v7->_contentType;
    v7->_contentType = (MSOID *)v8;
  }

  return v7;
}

- (NSData)content
{
  return (NSData *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setContent:(id)a3
{
}

- (MSCMSMessage)embeddedContent
{
  return (MSCMSMessage *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setEmbeddedContent:(id)a3
{
}

- (MSOID)contentType
{
  return (MSOID *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setContentType:(id)a3
{
}

- (void).cxx_destruct
{
}

@end