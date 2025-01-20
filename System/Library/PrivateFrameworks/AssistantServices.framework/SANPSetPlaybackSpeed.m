@interface SANPSetPlaybackSpeed
- (void)_ad_performWithMediaRemoteService:(id)a3 replyHandler:(id)a4;
@end

@implementation SANPSetPlaybackSpeed

- (void)_ad_performWithMediaRemoteService:(id)a3 replyHandler:(id)a4
{
  uint64_t v11 = kMRMediaRemoteOptionPlaybackRate;
  id v6 = a4;
  id v7 = a3;
  -[SANPSetPlaybackSpeed scalingFactor](self, "scalingFactor");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  v12 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v12,  &v11,  1LL));

  v10 = (void *)objc_claimAutoreleasedReturnValue([v7 targetQueue]);
  sub_10019054C(19LL, self, v9, v10, v6);
}

@end