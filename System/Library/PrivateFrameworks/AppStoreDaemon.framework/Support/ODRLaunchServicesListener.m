@interface ODRLaunchServicesListener
- (id)odrEntitlementName;
- (id)odrServiceName;
- (void)configureClientWithConnection:(id)a3;
@end

@implementation ODRLaunchServicesListener

- (void)configureClientWithConnection:(id)a3
{
  id v3 = a3;
  id v4 = sub_1002D6A48(objc_alloc(&OBJC_CLASS___ODRLaunchServicesClient), v3);
}

- (id)odrEntitlementName
{
  return @"com.apple.ondemandd.LaunchServices";
}

- (id)odrServiceName
{
  return @"Launch Services";
}

@end