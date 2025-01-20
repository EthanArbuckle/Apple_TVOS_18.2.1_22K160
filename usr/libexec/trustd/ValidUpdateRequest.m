@interface ValidUpdateRequest
- (id)validUpdateConfiguration:(BOOL)a3;
@end

@implementation ValidUpdateRequest

- (id)validUpdateConfiguration:(BOOL)a3
{
  if (a3)
  {
    v3 = (const __CFBoolean *)CFPreferencesCopyValue( @"ValidUpdateWiFiOnly",  @"com.apple.security",  kCFPreferencesAnyUser,  kCFPreferencesCurrentHost);
    if (v3)
    {
      v4 = v3;
      CFTypeID v5 = CFGetTypeID(v3);
      BOOL v6 = v5 == CFBooleanGetTypeID() && CFBooleanGetValue(v4) == 0;
      CFRelease(v4);
    }

    else
    {
      BOOL v6 = 0LL;
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:]( &OBJC_CLASS___NSURLSessionConfiguration,  "backgroundSessionConfigurationWithIdentifier:",  @"com.apple.trustd.networking.background"));
    [v7 setNetworkServiceType:3];
    [v7 setDiscretionary:1];
    objc_msgSend(v7, "set_requiresPowerPluggedIn:", 1);
    [v7 setAllowsCellularAccess:v6];
  }

  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLSessionConfiguration ephemeralSessionConfiguration]( &OBJC_CLASS___NSURLSessionConfiguration,  "ephemeralSessionConfiguration"));
    [v7 setNetworkServiceType:0];
    [v7 setDiscretionary:0];
  }

  v10[0] = @"User-Agent";
  v10[1] = @"Accept";
  v11[0] = @"com.apple.trustd/3.0";
@end