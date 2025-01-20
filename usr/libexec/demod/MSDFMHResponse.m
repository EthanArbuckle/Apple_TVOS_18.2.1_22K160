@interface MSDFMHResponse
- (NSDictionary)fmhDict;
- (NSNumber)retryAfter;
- (void)setFmhDict:(id)a3;
- (void)setRetryAfter:(id)a3;
@end

@implementation MSDFMHResponse

- (NSNumber)retryAfter
{
  return (NSNumber *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setRetryAfter:(id)a3
{
}

- (NSDictionary)fmhDict
{
  return (NSDictionary *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setFmhDict:(id)a3
{
}

- (void).cxx_destruct
{
}

@end