@interface NSPProxyAnalytics
- (id)analyticsDict;
- (id)eventName;
- (void)sendAnalytics;
@end

@implementation NSPProxyAnalytics

- (id)eventName
{
  return @"com.apple.nsp";
}

- (id)analyticsDict
{
  return 0LL;
}

- (void)sendAnalytics
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyAnalytics eventName](self, "eventName"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100051D98;
  v4[3] = &unk_1000F9F08;
  v4[4] = self;
  AnalyticsSendEventLazy(v3, v4);
}

@end