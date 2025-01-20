@interface SANPSetVolumeLevel
- (int64_t)_ad_volumeAction;
- (void)_ad_performWithMediaRemoteService:(id)a3 replyHandler:(id)a4;
@end

@implementation SANPSetVolumeLevel

- (int64_t)_ad_volumeAction
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SANPSetVolumeLevel actionType](self, "actionType"));
  if ([SANPVolumeLevelActionTypeSETValue isEqualToString:v2])
  {
    int64_t v3 = 2LL;
  }

  else if ([SANPVolumeLevelActionTypeINCREASEValue isEqualToString:v2])
  {
    int64_t v3 = 3LL;
  }

  else if ([SANPVolumeLevelActionTypeDECREASEValue isEqualToString:v2])
  {
    int64_t v3 = 4LL;
  }

  else
  {
    v4 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136315394;
      v7 = "-[SANPSetVolumeLevel(ADMediaRemote) _ad_volumeAction]";
      __int16 v8 = 2112;
      v9 = v2;
      _os_log_error_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_ERROR,  "%s Unknown actionType %@",  (uint8_t *)&v6,  0x16u);
    }

    int64_t v3 = 0LL;
  }

  return v3;
}

- (void)_ad_performWithMediaRemoteService:(id)a3 replyHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int16 v8 = (void *)objc_claimAutoreleasedReturnValue(-[SANPSetVolumeLevel volumeValue](self, "volumeValue"));
  [v8 floatValue];
  float v10 = v9;

  v11 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    v12 = v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SANPSetVolumeLevel actionType](self, "actionType"));
    *(_DWORD *)buf = 136315650;
    v25 = "-[SANPSetVolumeLevel(ADMediaRemote) _ad_performWithMediaRemoteService:replyHandler:]";
    __int16 v26 = 2112;
    v27 = v13;
    __int16 v28 = 2048;
    double v29 = v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s %@ %f", buf, 0x20u);
  }

  id v14 = -[SANPSetVolumeLevel acknowledgedExceedingVolumeLimit](self, "acknowledgedExceedingVolumeLimit");
  int64_t v15 = -[SANPSetVolumeLevel _ad_volumeAction](self, "_ad_volumeAction");
  uint64_t v16 = mach_absolute_time();
  v17 = (void *)objc_claimAutoreleasedReturnValue([v6 targetQueue]);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_100190A90;
  v20[3] = &unk_1004F4358;
  id v21 = v6;
  id v22 = v7;
  uint64_t v23 = v16;
  id v18 = v6;
  id v19 = v7;
  AFPerformDeviceVolumeAction(v15, v14, v17, v20, v10);

  +[AFAggregator logSiriMediaVolumeAction:](&OBJC_CLASS___AFAggregator, "logSiriMediaVolumeAction:", v15);
}

@end