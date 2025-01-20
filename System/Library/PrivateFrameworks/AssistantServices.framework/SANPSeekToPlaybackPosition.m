@interface SANPSeekToPlaybackPosition
- (void)_ad_performWithMediaRemoteService:(id)a3 replyHandler:(id)a4;
@end

@implementation SANPSeekToPlaybackPosition

- (void)_ad_performWithMediaRemoteService:(id)a3 replyHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v12 = (id)objc_claimAutoreleasedReturnValue(-[SANPSeekToPlaybackPosition _ad_mediaRemoteOptions](self, "_ad_mediaRemoteOptions"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SANPSeekToPlaybackPosition positionInMilliseconds](self, "positionInMilliseconds"));
  id v9 = [v8 integerValue];

  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  (double)(uint64_t)v9 / 1000.0));
  [v12 setValue:v10 forKey:kMRMediaRemoteOptionPlaybackPosition];

  v11 = (void *)objc_claimAutoreleasedReturnValue([v7 targetQueue]);
  AFMediaRemoteSendCommandWithOptions(24LL, v12, v11, v6);
}

@end