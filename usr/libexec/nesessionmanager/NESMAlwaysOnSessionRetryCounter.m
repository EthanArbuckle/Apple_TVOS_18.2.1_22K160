@interface NESMAlwaysOnSessionRetryCounter
- (NESMAlwaysOnSessionRetryCounter)init;
@end

@implementation NESMAlwaysOnSessionRetryCounter

- (NESMAlwaysOnSessionRetryCounter)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NESMAlwaysOnSessionRetryCounter;
  result = -[NESMAlwaysOnSessionRetryCounter init](&v3, "init");
  if (result)
  {
    result->_interval = 0LL;
    result->_retryCount = 0LL;
  }

  return result;
}

@end