@interface ODRSimulatedDownloadsManager
+ (void)initialize;
@end

@implementation ODRSimulatedDownloadsManager

+ (void)initialize
{
  if ((id)objc_opt_class(&OBJC_CLASS___ODRSimulatedDownloadsManager, a2) == a1)
  {
    id v2 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    [v2 registerDefaults:&off_10040E178];
  }

@end