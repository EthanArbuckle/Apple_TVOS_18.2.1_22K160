@interface SADomainCommand
- (void)_ad_performAudioPausingCommand:(unsigned int)a3 mediaRemoteService:(id)a4 replyHandler:(id)a5;
@end

@implementation SADomainCommand

- (void)_ad_performAudioPausingCommand:(unsigned int)a3 mediaRemoteService:(id)a4 replyHandler:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  id v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SADomainCommand _ad_mediaRemoteOptions](self, "_ad_mediaRemoteOptions"));
  int v11 = AFPauseCommandsInterruptAudio();
  char v12 = v11;
  if (v11)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
    [v13 setSuppressAudioInterruptionEndedNotifications:1];
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue([v8 targetQueue]);
  v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472LL;
  v18 = sub_100191A68;
  v19 = &unk_1004F42B8;
  int v21 = v6;
  id v20 = v9;
  char v22 = v12;
  id v15 = v9;
  AFMediaRemoteSendCommandWithOptions(v6, v10, v14, &v16);

  +[AFAggregator logSiriPausedMedia](&OBJC_CLASS___AFAggregator, "logSiriPausedMedia", v16, v17, v18, v19);
}

@end