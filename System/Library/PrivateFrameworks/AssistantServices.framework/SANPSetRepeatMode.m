@interface SANPSetRepeatMode
- (void)_ad_performWithMediaRemoteService:(id)a3 replyHandler:(id)a4;
@end

@implementation SANPSetRepeatMode

- (void)_ad_performWithMediaRemoteService:(id)a3 replyHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SANPSetRepeatMode repeatMode](self, "repeatMode"));
  unsigned __int8 v9 = [v8 isEqualToString:SANPRepeatModeNoneValue];

  if ((v9 & 1) != 0)
  {
    uint64_t v10 = 1LL;
  }

  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SANPSetRepeatMode repeatMode](self, "repeatMode"));
    unsigned __int8 v12 = [v11 isEqualToString:SANPRepeatModeOneValue];

    if ((v12 & 1) != 0)
    {
      uint64_t v10 = 2LL;
    }

    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[SANPSetRepeatMode repeatMode](self, "repeatMode"));
      unsigned int v14 = [v13 isEqualToString:SANPRepeatModeAllValue];

      if (v14) {
        uint64_t v10 = 3LL;
      }
      else {
        uint64_t v10 = 0LL;
      }
    }
  }

  uint64_t v18 = kMRMediaRemoteOptionRepeatMode;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v10));
  v19 = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v19,  &v18,  1LL));

  v17 = (void *)objc_claimAutoreleasedReturnValue([v7 targetQueue]);
  sub_10019054C(25LL, self, v16, v17, v6);
}

@end