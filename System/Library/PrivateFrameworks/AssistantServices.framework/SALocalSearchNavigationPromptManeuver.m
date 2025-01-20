@interface SALocalSearchNavigationPromptManeuver
- (id)_ad_transformedMapsRequest;
- (id)_ad_transformedMapsSuccessResponse;
@end

@implementation SALocalSearchNavigationPromptManeuver

- (id)_ad_transformedMapsRequest
{
  return objc_alloc_init(&OBJC_CLASS___STPromptManeuverRequest);
}

- (id)_ad_transformedMapsSuccessResponse
{
  return objc_alloc_init(&OBJC_CLASS___SALocalSearchNavigationPromptManeuverCompleted);
}

@end