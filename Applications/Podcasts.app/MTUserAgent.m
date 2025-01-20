@interface MTUserAgent
+ (id)userAgent;
@end

@implementation MTUserAgent

+ (id)userAgent
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 infoDictionary]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"CFBundleShortVersionString"]);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 infoDictionary]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:kCFBundleNameKey]);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@/%@", v7, v4));
  return v8;
}

@end