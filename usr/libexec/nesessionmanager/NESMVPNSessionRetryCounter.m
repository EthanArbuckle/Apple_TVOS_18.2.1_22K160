@interface NESMVPNSessionRetryCounter
- (NESMVPNSessionRetryCounter)init;
@end

@implementation NESMVPNSessionRetryCounter

- (NESMVPNSessionRetryCounter)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NESMVPNSessionRetryCounter;
  result = -[NESMVPNSessionRetryCounter init](&v3, "init");
  if (result)
  {
    result->_interval = 0LL;
    result->_retryCount = 0LL;
  }

  return result;
}

@end