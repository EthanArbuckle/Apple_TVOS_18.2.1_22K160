@interface ODRDevtoolsListener
- (id)odrEntitlementName;
- (id)odrServiceName;
- (void)configureClientWithConnection:(id)a3;
@end

@implementation ODRDevtoolsListener

- (void)configureClientWithConnection:(id)a3
{
  id v3 = a3;
  id v4 = sub_100260290(objc_alloc(&OBJC_CLASS___ODRDeveloperToolsClient), v3);
}

- (id)odrEntitlementName
{
  return @"com.apple.odr.devtools";
}

- (id)odrServiceName
{
  return @"Developer Tools";
}

@end