@interface SANPSkipToNextItem
- (void)_ad_performWithMediaRemoteService:(id)a3 replyHandler:(id)a4;
@end

@implementation SANPSkipToNextItem

- (void)_ad_performWithMediaRemoteService:(id)a3 replyHandler:(id)a4
{
  id v6 = a4;
  id v7 = (id)objc_claimAutoreleasedReturnValue([a3 targetQueue]);
  sub_10019054C(4LL, self, 0LL, v7, v6);
}

@end