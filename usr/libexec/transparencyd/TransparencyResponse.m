@interface TransparencyResponse
- (NSData)data;
- (NSDictionary)metadata;
- (TransparencyNetworkRequest)request;
- (TransparencyResponse)initWithRequest:(id)a3 responseData:(id)a4 metadata:(id)a5;
- (id)serverHint;
- (void)setData:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setRequest:(id)a3;
@end

@implementation TransparencyResponse

- (TransparencyResponse)initWithRequest:(id)a3 responseData:(id)a4 metadata:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___TransparencyResponse;
  v11 = -[TransparencyResponse init](&v14, "init");
  v12 = v11;
  if (v11)
  {
    -[TransparencyResponse setRequest:](v11, "setRequest:", v8);
    -[TransparencyResponse setData:](v12, "setData:", v9);
    -[TransparencyResponse setMetadata:](v12, "setMetadata:", v10);
  }

  return v12;
}

- (id)serverHint
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyResponse metadata](self, "metadata"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyResponse metadata](self, "metadata"));
    v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:kTransparencyResponseMetadataKeyServerHint]);
  }

  else
  {
    v5 = 0LL;
  }

  return v5;
}

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setData:(id)a3
{
}

- (NSDictionary)metadata
{
  return (NSDictionary *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setMetadata:(id)a3
{
}

- (TransparencyNetworkRequest)request
{
  return (TransparencyNetworkRequest *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setRequest:(id)a3
{
}

- (void).cxx_destruct
{
}

@end