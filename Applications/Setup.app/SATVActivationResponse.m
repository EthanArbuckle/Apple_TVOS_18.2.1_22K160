@interface SATVActivationResponse
- (NSData)data;
- (NSDictionary)headers;
- (NSURL)baseURL;
- (void)setBaseURL:(id)a3;
- (void)setData:(id)a3;
- (void)setHeaders:(id)a3;
@end

@implementation SATVActivationResponse

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setData:(id)a3
{
}

- (NSDictionary)headers
{
  return (NSDictionary *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setHeaders:(id)a3
{
}

- (NSURL)baseURL
{
  return (NSURL *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setBaseURL:(id)a3
{
}

- (void).cxx_destruct
{
}

@end