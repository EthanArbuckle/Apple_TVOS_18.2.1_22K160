@interface _LSDispatchWithTimeoutResult
- (NSError)error;
- (id)result;
- (void)setError:(id)a3;
- (void)setResult:(id)a3;
@end

@implementation _LSDispatchWithTimeoutResult

- (id)result
{
  return objc_getProperty(self, a2, 8LL, 1);
}

- (void)setResult:(id)a3
{
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
}

@end