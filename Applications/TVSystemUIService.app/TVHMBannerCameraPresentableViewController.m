@interface TVHMBannerCameraPresentableViewController
- (BOOL)providesTemplateContent;
- (int64_t)presentableBehavior;
@end

@implementation TVHMBannerCameraPresentableViewController

- (BOOL)providesTemplateContent
{
  return 1;
}

- (int64_t)presentableBehavior
{
  return 0LL;
}

@end