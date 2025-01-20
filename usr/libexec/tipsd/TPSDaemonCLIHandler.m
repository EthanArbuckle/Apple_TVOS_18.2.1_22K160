@interface TPSDaemonCLIHandler
+ (BOOL)run;
@end

@implementation TPSDaemonCLIHandler

+ (BOOL)run
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 stringForKey:@"listKVS"]);
  id v4 = [v3 length];
  BOOL v5 = v4 != 0LL;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[TPSCloudController sharedInstance](&OBJC_CLASS___TPSCloudController, "sharedInstance"));
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 _listDisplayContentIDs]);
    NSLog(@"%@", v7);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue([v2 stringForKey:@"clearKVS"]);

  if ([v8 length])
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[TPSCloudController sharedInstance](&OBJC_CLASS___TPSCloudController, "sharedInstance"));
    [v9 _clearDisplayedContentIDs];

    BOOL v5 = 1;
  }

  return v5;
}

@end