@interface SACFProviderCompleted
- (int64_t)resultCallbackCode;
@end

@implementation SACFProviderCompleted

- (int64_t)resultCallbackCode
{
  int64_t result = (int64_t)-[SACFProviderCompleted status](self, "status");
  if (result == SACFSuccessErrorCode) {
    return 0LL;
  }
  return result;
}

@end