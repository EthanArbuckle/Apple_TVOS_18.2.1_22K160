@interface DMDRestartDeviceOperation
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
- (void)runWithRequest:(id)a3;
@end

@implementation DMDRestartDeviceOperation

+ (id)whitelistedClassesForRequest
{
  return +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  objc_opt_class(&OBJC_CLASS___DMFRestartDeviceRequest));
}

+ (id)requiredEntitlements
{
  return &off_1000A5B20;
}

- (void)runWithRequest:(id)a3
{
  id v4 = [[FBSShutdownOptions alloc] initWithReason:@"dmd restart device"];
  [v4 setRebootType:1];
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[FBSSystemService sharedService](&OBJC_CLASS___FBSSystemService, "sharedService"));
  [v3 shutdownWithOptions:v4];
}

@end