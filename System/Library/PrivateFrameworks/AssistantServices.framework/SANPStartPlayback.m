@interface SANPStartPlayback
- (void)_ad_performWithMediaRemoteService:(id)a3 replyHandler:(id)a4;
@end

@implementation SANPStartPlayback

- (void)_ad_performWithMediaRemoteService:(id)a3 replyHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v33 = "-[SANPStartPlayback(ADMediaRemote) _ad_performWithMediaRemoteService:replyHandler:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SANPStartPlayback _ad_mediaRemoteOptions](self, "_ad_mediaRemoteOptions"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SANPStartPlayback hashedRouteUIDs](self, "hashedRouteUIDs"));
  if ([v11 count]) {
    uint64_t v12 = 2LL;
  }
  else {
    uint64_t v12 = 1LL;
  }

  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = sub_10018FDB0;
  v28[3] = &unk_1004F4358;
  uint64_t v31 = v12;
  id v13 = v10;
  id v29 = v13;
  id v14 = v7;
  id v30 = v14;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_10018FFDC;
  v20[3] = &unk_1004F4308;
  v26 = objc_retainBlock(v28);
  uint64_t v27 = v12;
  id v21 = v13;
  v22 = self;
  id v23 = v9;
  id v24 = v6;
  id v25 = v14;
  v15 = v26;
  id v16 = v6;
  id v17 = v9;
  id v18 = v14;
  id v19 = v13;
  [v19 prepareForStartPlaybackWithDestination:v12 intent:0 completion:v20];
}

@end