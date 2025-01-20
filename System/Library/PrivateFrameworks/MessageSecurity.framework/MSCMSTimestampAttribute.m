@interface MSCMSTimestampAttribute
- (BOOL)certChainRequested;
- (BOOL)verifyTimestamps:(id)a3 error:(id *)a4;
- (MSCMSSignerInfo)singerInfo;
- (MSCMSTimestampAttribute)initWithAttribute:(id)a3 error:(id *)a4;
- (MSCMSTimestampAttribute)initWithServerURL:(id)a3;
- (MSCMSTimestampAttribute)initWithServerURL:(id)a3 chainRequested:(BOOL)a4;
- (MSCMSTimestampAttribute)initWithTimestampToken:(id)a3;
- (MSCMSTimestampAttributeInternal)timestampAttribute;
- (MSOID)attributeType;
- (MSOID)digestAlgorithm;
- (NSArray)certificates;
- (NSDate)timestampTime;
- (NSURL)serverURL;
- (id)encodeAttributeWithError:(id *)a3;
- (void)setCertChainRequested:(BOOL)a3;
- (void)setServerURL:(id)a3;
- (void)setTimestampAttribute:(id)a3;
@end

@implementation MSCMSTimestampAttribute

- (MSOID)attributeType
{
  return +[MSOID OIDWithString:error:]( &OBJC_CLASS___MSOID,  "OIDWithString:error:",  @"1.2.840.113549.1.9.16.2.14",  0LL);
}

- (MSCMSTimestampAttribute)initWithAttribute:(id)a3 error:(id *)a4
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___MSCMSTimestampAttribute;
  id v5 = a3;
  v6 = -[MSCMSTimestampAttribute init](&v11, sel_init);
  v7 = objc_alloc(&OBJC_CLASS___MSCMSTimestampAttributeInternal);
  v8 = -[MSCMSTimestampAttributeInternal initWithAttribute:error:]( v7,  "initWithAttribute:error:",  v5,  a4,  v11.receiver,  v11.super_class);

  -[MSCMSTimestampAttribute setTimestampAttribute:](v6, "setTimestampAttribute:", v8);
  -[MSCMSTimestampAttribute timestampAttribute](v6, "timestampAttribute");
  v9 = (MSCMSTimestampAttribute *)objc_claimAutoreleasedReturnValue();

  if (v9) {
    v9 = v6;
  }

  return v9;
}

- (MSCMSTimestampAttribute)initWithServerURL:(id)a3 chainRequested:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___MSCMSTimestampAttribute;
  v8 = -[MSCMSTimestampAttribute init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_serverURL, a3);
    v9->_certChainRequested = a4;
  }

  return v9;
}

- (MSCMSTimestampAttribute)initWithServerURL:(id)a3
{
  return -[MSCMSTimestampAttribute initWithServerURL:chainRequested:]( self,  "initWithServerURL:chainRequested:",  a3,  0LL);
}

- (MSCMSTimestampAttribute)initWithTimestampToken:(id)a3
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___MSCMSTimestampAttribute;
  id v3 = a3;
  v4 = -[MSCMSTimestampAttribute init](&v12, sel_init);
  id v11 = 0LL;
  id v5 = -[MSCMSTimestampAttributeInternal initWithTimestampToken:error:]( objc_alloc(&OBJC_CLASS___MSCMSTimestampAttributeInternal),  "initWithTimestampToken:error:",  v3,  &v11);

  id v6 = v11;
  -[MSCMSTimestampAttribute setTimestampAttribute:](v4, "setTimestampAttribute:", v5);

  -[MSCMSTimestampAttribute timestampAttribute](v4, "timestampAttribute");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = v4;
  }

  else
  {
    if (MS_DEFAULT_LOG_BLOCK != -1) {
      dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_292);
    }
    v9 = (os_log_s *)MS_DEFAULT_LOG_INTERNAL;
    if (os_log_type_enabled((os_log_t)MS_DEFAULT_LOG_INTERNAL, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "-[MSCMSTimestampAttribute initWithTimestampToken:]";
      __int16 v15 = 2112;
      id v16 = v6;
      _os_log_impl(&dword_1810EE000, v9, OS_LOG_TYPE_ERROR, "%s failed with %@", buf, 0x16u);
    }

    v8 = 0LL;
  }

  return v8;
}

void __50__MSCMSTimestampAttribute_initWithTimestampToken___block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.MessageSecurity", "default");
  v1 = (void *)MS_DEFAULT_LOG_INTERNAL;
  MS_DEFAULT_LOG_INTERNAL = (uint64_t)v0;
}

- (BOOL)verifyTimestamps:(id)a3 error:(id *)a4
{
  id v6 = a3;
  -[MSCMSTimestampAttribute timestampAttribute](self, "timestampAttribute");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = [v7 verifyTimestamp:v6 error:a4];

  return (char)a4;
}

- (id)encodeAttributeWithError:(id *)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeAttributeWithError:a3];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSDate)timestampTime
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 timestampToken];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (MSCMSTimestampAttributeInternal)timestampAttribute
{
  return (MSCMSTimestampAttributeInternal *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setTimestampAttribute:(id)a3
{
}

- (NSURL)serverURL
{
  return (NSURL *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setServerURL:(id)a3
{
}

- (BOOL)certChainRequested
{
  return self->_certChainRequested;
}

- (void)setCertChainRequested:(BOOL)a3
{
  self->_certChainRequested = a3;
}

- (MSCMSSignerInfo)singerInfo
{
  return (MSCMSSignerInfo *)objc_getProperty(self, a2, 32LL, 1);
}

- (NSArray)certificates
{
  return (NSArray *)objc_getProperty(self, a2, 40LL, 1);
}

- (MSOID)digestAlgorithm
{
  return (MSOID *)objc_getProperty(self, a2, 48LL, 1);
}

- (void).cxx_destruct
{
}

@end