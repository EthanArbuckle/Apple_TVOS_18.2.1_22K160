@interface SAMPGetState
- (void)_ad_performWithMediaRemoteService:(id)a3 replyHandler:(id)a4;
@end

@implementation SAMPGetState

- (void)_ad_performWithMediaRemoteService:(id)a3 replyHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue([v6 targetQueue]);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_100191844;
    v14[3] = &unk_1004F4380;
    id v15 = v7;
    AFGetNowPlayingQueueState(v8, 0LL, v14);
  }

  else
  {
    v9 = (void *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      v10 = v9;
      v11 = (void *)objc_opt_class(self);
      id v12 = v11;
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[SAMPGetState aceId](self, "aceId"));
      *(_DWORD *)buf = 136315650;
      v17 = "-[SAMPGetState(ADMediaRemote) _ad_performWithMediaRemoteService:replyHandler:]";
      __int16 v18 = 2112;
      v19 = v11;
      __int16 v20 = 2112;
      v21 = v13;
      _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "%s Ignoring %@ with aceId %@ because there is no completion handler. This command should only read state, and have no effect.",  buf,  0x20u);
    }
  }
}

@end