@interface SANPSkipToPreviousItem
- (void)_ad_performWithMediaRemoteService:(id)a3 replyHandler:(id)a4;
@end

@implementation SANPSkipToPreviousItem

- (void)_ad_performWithMediaRemoteService:(id)a3 replyHandler:(id)a4
{
  uint64_t v10 = kMRMediaRemoteOptionRequestDefermentToPlaybackQueuePosition;
  v11 = &__kCFBooleanTrue;
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v11,  &v10,  1LL));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v7 targetQueue]);

  sub_10019054C(5LL, self, v8, v9, v6);
}

@end