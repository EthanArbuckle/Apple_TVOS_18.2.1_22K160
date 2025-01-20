@interface TVMusicAppDelegate
+ (BOOL)isAppActive;
+ (TVMusicAppDelegateProtocol)theApp;
@end

@implementation TVMusicAppDelegate

+ (TVMusicAppDelegateProtocol)theApp
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 delegate]);

  return (TVMusicAppDelegateProtocol *)v3;
}

+ (BOOL)isAppActive
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
  BOOL v3 = [v2 applicationState] == 0;

  return v3;
}

@end