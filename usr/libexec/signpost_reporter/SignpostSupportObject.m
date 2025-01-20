@interface SignpostSupportObject
- (BOOL)canGenerateCoreAnalyticsPayload;
- (id)coreAnalyticsPayload;
@end

@implementation SignpostSupportObject

- (id)coreAnalyticsPayload
{
  return 0LL;
}

- (BOOL)canGenerateCoreAnalyticsPayload
{
  return 0;
}

@end