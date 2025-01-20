@interface NSUserDefaults
+ (id)mad_daemonUserDefaults;
@end

@implementation NSUserDefaults

+ (id)mad_daemonUserDefaults
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 bundleIdentifier]);
  uint64_t v4 = MediaAnalysisDaemonDomain;
  unsigned int v5 = [v3 isEqualToString:MediaAnalysisDaemonDomain];

  if (v5) {
    v6 = (NSUserDefaults *)objc_claimAutoreleasedReturnValue( +[NSUserDefaults standardUserDefaults]( &OBJC_CLASS___NSUserDefaults,  "standardUserDefaults"));
  }
  else {
    v6 = -[NSUserDefaults initWithSuiteName:](objc_alloc(&OBJC_CLASS___NSUserDefaults), "initWithSuiteName:", v4);
  }
  return v6;
}

@end