@interface SASEndpointStatus
- (int64_t)resultCallbackCode;
@end

@implementation SASEndpointStatus

- (int64_t)resultCallbackCode
{
  return -[SASEndpointStatus confirmed](self, "confirmed") - 1LL;
}

@end