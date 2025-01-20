@interface SANPSkipTimeInterval
- (void)_ad_performWithMediaRemoteService:(id)a3 replyHandler:(id)a4;
@end

@implementation SANPSkipTimeInterval

- (void)_ad_performWithMediaRemoteService:(id)a3 replyHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SANPSkipTimeInterval adjustmentInMilliseconds](self, "adjustmentInMilliseconds"));
  uint64_t v9 = (uint64_t)[v8 integerValue];

  if (v9 >= 0) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = -v9;
  }
  if (v9 >= 0) {
    uint64_t v11 = 17LL;
  }
  else {
    uint64_t v11 = 18LL;
  }
  uint64_t v15 = kMRMediaRemoteOptionSkipInterval;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", (double)v10 / 1000.0));
  v16 = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v16,  &v15,  1LL));

  v14 = (void *)objc_claimAutoreleasedReturnValue([v7 targetQueue]);
  sub_10019054C(v11, self, v13, v14, v6);
}

@end