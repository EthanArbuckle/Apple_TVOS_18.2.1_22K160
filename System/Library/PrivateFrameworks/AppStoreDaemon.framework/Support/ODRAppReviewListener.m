@interface ODRAppReviewListener
- (id)odrEntitlementName;
- (id)odrServiceName;
- (void)configureClientWithConnection:(id)a3;
@end

@implementation ODRAppReviewListener

- (void)configureClientWithConnection:(id)a3
{
  id v3 = a3;
  id v4 = sub_10020D614(objc_alloc(&OBJC_CLASS___ODRAppReviewClient), v3);
}

- (id)odrEntitlementName
{
  return @"com.apple.odr.appreview";
}

- (id)odrServiceName
{
  return @"App Review";
}

@end