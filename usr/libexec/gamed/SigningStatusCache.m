@interface SigningStatusCache
+ (id)getValue:(id)a3;
+ (id)sharedInstance;
+ (void)reset;
@end

@implementation SigningStatusCache

+ (id)sharedInstance
{
  if (qword_1002BB740 != -1) {
    dispatch_once(&qword_1002BB740, &stru_100272F20);
  }
  return (id)qword_1002BB738;
}

+ (id)getValue:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SigningStatusCache sharedInstance](&OBJC_CLASS___SigningStatusCache, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 getValueForKey:v3]);

  return v5;
}

+ (void)reset
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[SigningStatusCache sharedInstance](&OBJC_CLASS___SigningStatusCache, "sharedInstance"));
  [v2 clear];
}

@end