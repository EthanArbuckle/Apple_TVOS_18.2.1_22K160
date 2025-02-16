@interface SACFFlowCompleted
- (int64_t)ad_getNetworkActivityTracingLabel;
- (int64_t)resultCallbackCode;
@end

@implementation SACFFlowCompleted

- (int64_t)resultCallbackCode
{
  int64_t result = (int64_t)-[SACFFlowCompleted status](self, "status");
  if (result == SACFSuccessErrorCode) {
    return 0LL;
  }
  return result;
}

- (int64_t)ad_getNetworkActivityTracingLabel
{
  return 8LL;
}

@end