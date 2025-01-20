@interface SALocalSearchNavigationEnd
- (id)_ad_transformedMapsRequest;
- (id)_ad_transformedMapsSuccessResponse;
@end

@implementation SALocalSearchNavigationEnd

- (id)_ad_transformedMapsRequest
{
  return objc_alloc_init(&OBJC_CLASS___STStopNavigationRequest);
}

- (id)_ad_transformedMapsSuccessResponse
{
  return objc_alloc_init(&OBJC_CLASS___SALocalSearchNavigationEndCompleted);
}

@end