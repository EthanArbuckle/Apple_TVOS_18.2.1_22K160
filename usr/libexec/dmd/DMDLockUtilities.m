@interface DMDLockUtilities
+ (void)lockDevice;
@end

@implementation DMDLockUtilities

+ (void)lockDevice
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  [v2 lockDeviceImmediately:1];
}

@end