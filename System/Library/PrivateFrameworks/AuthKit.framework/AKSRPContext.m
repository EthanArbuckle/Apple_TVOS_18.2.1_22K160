@interface AKSRPContext
- (AKMasterToken)masterToken;
- (NSDictionary)configurationParameters;
- (NSDictionary)serverProvidedData;
- (NSDictionary)status;
- (__AppleIDAuthSupportData)underlyingContext;
- (id)configureWithParameters:(id)a3;
- (void)dealloc;
@end

@implementation AKSRPContext

- (void)dealloc
{
  underlyingContext = self->_underlyingContext;
  if (underlyingContext)
  {
    CFRelease(underlyingContext);
    self->_underlyingContext = 0LL;
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___AKSRPContext;
  -[AKSRPContext dealloc](&v4, "dealloc");
}

- (id)configureWithParameters:(id)a3
{
  id v10 = 0LL;
  id v4 = a3;
  v5 = (NSDictionary *)[v4 copy];
  configurationParameters = self->_configurationParameters;
  self->_configurationParameters = v5;

  v7 = (__AppleIDAuthSupportData *)AppleIDAuthSupportCreate(0LL, v4, &v10);
  id v8 = 0LL;
  self->_underlyingContext = v7;
  if (!v7) {
    id v8 = v10;
  }
  return v8;
}

- (NSDictionary)serverProvidedData
{
  underlyingContext = self->_underlyingContext;
  if (underlyingContext) {
    underlyingContext = (__AppleIDAuthSupportData *)AppleIDAuthSupportCopyProvidedData(underlyingContext, 1LL);
  }
  return (NSDictionary *)underlyingContext;
}

- (AKMasterToken)masterToken
{
  underlyingContext = self->_underlyingContext;
  if (underlyingContext && (uint64_t v4 = AppleIDAuthSupportCopyToken(underlyingContext, a2)) != 0)
  {
    v5 = (const void *)v4;
    v6 = (void *)AppleIDAuthSupportTokenCopyExternalizedVersion();
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[AKSRPContext serverProvidedData](self, "serverProvidedData"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"duration"]);
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[AKMasterToken tokenWithExternalizedVersion:lifetime:]( &OBJC_CLASS___AKMasterToken,  "tokenWithExternalizedVersion:lifetime:",  v6,  v8));

    CFRelease(v5);
  }

  else
  {
    v9 = 0LL;
  }

  return (AKMasterToken *)v9;
}

- (NSDictionary)status
{
  underlyingContext = self->_underlyingContext;
  if (underlyingContext)
  {
    uint64_t Status = AppleIDAuthSupportGetStatus(underlyingContext, a2);
    underlyingContext = (__AppleIDAuthSupportData *)objc_claimAutoreleasedReturnValue(Status);
  }

  return (NSDictionary *)underlyingContext;
}

- (__AppleIDAuthSupportData)underlyingContext
{
  return self->_underlyingContext;
}

- (NSDictionary)configurationParameters
{
  return self->_configurationParameters;
}

- (void).cxx_destruct
{
}

@end