@interface MSDServerResponse
- (MSDServerResponse)initWithError:(id)a3;
- (NSData)data;
- (NSError)error;
- (NSString)getName;
- (void)setData:(id)a3;
- (void)setError:(id)a3;
@end

@implementation MSDServerResponse

- (MSDServerResponse)initWithError:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MSDServerResponse;
  v5 = -[MSDServerResponse init](&v9, "init");
  v6 = v5;
  if (v5)
  {
    -[MSDServerResponse setError:](v5, "setError:", v4);
    -[MSDServerResponse setData:](v6, "setData:", 0LL);
    v7 = v6;
  }

  return v6;
}

- (NSString)getName
{
  v2 = (objc_class *)objc_opt_class(self, a2);
  return NSStringFromClass(v2);
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setError:(id)a3
{
}

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end