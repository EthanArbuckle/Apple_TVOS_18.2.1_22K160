@interface ADDeviceSyncTimerConsumer
- (NSString)type;
- (int64_t)preferredPullingModeForDeviceWithIdentifier:(id)a3 fromGeneration:(unint64_t)a4 toGeneration:(unint64_t)a5;
- (void)applyIncrementalChanges:(id)a3 fromDeviceWithIdentifier:(id)a4;
- (void)applySnapshot:(id)a3 fromDeviceWithIdentifier:(id)a4;
- (void)finalizeForDeviceWithIdentifier:(id)a3;
- (void)getGenerationForDeviceWithIdentifier:(id)a3 completion:(id)a4;
- (void)prepareForDeviceWithIdentifier:(id)a3;
@end

@implementation ADDeviceSyncTimerConsumer

- (NSString)type
{
  v2 = @"com.apple.assistant.device-sync.data-type.timer";
  return (NSString *)@"com.apple.assistant.device-sync.data-type.timer";
}

- (void)prepareForDeviceWithIdentifier:(id)a3
{
  id v3 = a3;
  v4 = (os_log_s *)AFSiriLogContextDeviceSync;
  if (os_log_type_enabled(AFSiriLogContextDeviceSync, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315394;
    v8 = "-[ADDeviceSyncTimerConsumer prepareForDeviceWithIdentifier:]";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s deviceIdentifier = %@", (uint8_t *)&v7, 0x16u);
  }

  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[ADClockService sharedService](&OBJC_CLASS___ADClockService, "sharedService"));
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 remoteTimerManager]);
    [v6 prepareStorageForDeviceWithIdentifier:v3];
  }
}

- (void)finalizeForDeviceWithIdentifier:(id)a3
{
  id v3 = a3;
  v4 = (os_log_s *)AFSiriLogContextDeviceSync;
  if (os_log_type_enabled(AFSiriLogContextDeviceSync, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315394;
    v8 = "-[ADDeviceSyncTimerConsumer finalizeForDeviceWithIdentifier:]";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s deviceIdentifier = %@", (uint8_t *)&v7, 0x16u);
  }

  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[ADClockService sharedService](&OBJC_CLASS___ADClockService, "sharedService"));
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 remoteTimerManager]);
    [v6 finalizeStorageForDeviceWithIdentifier:v3];
  }
}

- (int64_t)preferredPullingModeForDeviceWithIdentifier:(id)a3 fromGeneration:(unint64_t)a4 toGeneration:(unint64_t)a5
{
  id v7 = a3;
  v8 = (os_log_s *)AFSiriLogContextDeviceSync;
  if (os_log_type_enabled(AFSiriLogContextDeviceSync, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315906;
    v11 = "-[ADDeviceSyncTimerConsumer preferredPullingModeForDeviceWithIdentifier:fromGeneration:toGeneration:]";
    __int16 v12 = 2112;
    id v13 = v7;
    __int16 v14 = 2048;
    unint64_t v15 = a4;
    __int16 v16 = 2048;
    unint64_t v17 = a5;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "%s deviceIdentifier = %@, fromGeneration = %llu, toGeneration = %llu",  (uint8_t *)&v10,  0x2Au);
  }

  return 2LL * (v7 != 0LL);
}

- (void)getGenerationForDeviceWithIdentifier:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (os_log_s *)AFSiriLogContextDeviceSync;
  if (os_log_type_enabled(AFSiriLogContextDeviceSync, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    unint64_t v15 = "-[ADDeviceSyncTimerConsumer getGenerationForDeviceWithIdentifier:completion:]";
    __int16 v16 = 2112;
    id v17 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s deviceIdentifier = %@", buf, 0x16u);
  }

  if (v5 && v6)
  {
    v8 = (os_log_s *)AFSiriLogContextDeviceSync;
    if (os_log_type_enabled(AFSiriLogContextDeviceSync, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      unint64_t v15 = "-[ADDeviceSyncTimerConsumer getGenerationForDeviceWithIdentifier:completion:]";
      __int16 v16 = 2112;
      id v17 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "%s Loading synced timer generation for device %@...",  buf,  0x16u);
    }

    __int16 v9 = (void *)objc_claimAutoreleasedReturnValue(+[ADClockService sharedService](&OBJC_CLASS___ADClockService, "sharedService"));
    int v10 = (void *)objc_claimAutoreleasedReturnValue([v9 remoteTimerManager]);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1002D5864;
    v11[3] = &unk_1004FA890;
    id v12 = v5;
    id v13 = v6;
    [v10 accessStorageForDeviceWithIdentifier:v12 usingBlock:v11];
  }
}

- (void)applyIncrementalChanges:(id)a3 fromDeviceWithIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (os_log_s *)AFSiriLogContextDeviceSync;
  if (os_log_type_enabled(AFSiriLogContextDeviceSync, OS_LOG_TYPE_INFO))
  {
    int v13 = 136315650;
    __int16 v14 = "-[ADDeviceSyncTimerConsumer applyIncrementalChanges:fromDeviceWithIdentifier:]";
    __int16 v15 = 2112;
    id v16 = v7;
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "%s deviceIdentifier = %@, incrementalChanges = %@",  (uint8_t *)&v13,  0x20u);
  }

  id v9 = [v6 count];
  if (v7)
  {
    if (v9)
    {
      int v10 = (void *)AFSiriLogContextDeviceSync;
      if (os_log_type_enabled(AFSiriLogContextDeviceSync, OS_LOG_TYPE_ERROR))
      {
        v11 = v10;
        id v12 = (void *)objc_claimAutoreleasedReturnValue(-[ADDeviceSyncTimerConsumer type](self, "type"));
        int v13 = 136315394;
        __int16 v14 = "-[ADDeviceSyncTimerConsumer applyIncrementalChanges:fromDeviceWithIdentifier:]";
        __int16 v15 = 2112;
        id v16 = v12;
        _os_log_error_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "%s Applying incremental changes is not supported for type %@.",  (uint8_t *)&v13,  0x16u);
      }
    }
  }
}

- (void)applySnapshot:(id)a3 fromDeviceWithIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (os_log_s *)AFSiriLogContextDeviceSync;
  if (os_log_type_enabled(AFSiriLogContextDeviceSync, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v15 = "-[ADDeviceSyncTimerConsumer applySnapshot:fromDeviceWithIdentifier:]";
    __int16 v16 = 2112;
    id v17 = v6;
    __int16 v18 = 2112;
    id v19 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%s deviceIdentifier = %@, snapshot = %@",  buf,  0x20u);
  }

  if (v5 && v6)
  {
    v8 = (os_log_s *)AFSiriLogContextDeviceSync;
    if (os_log_type_enabled(AFSiriLogContextDeviceSync, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v15 = "-[ADDeviceSyncTimerConsumer applySnapshot:fromDeviceWithIdentifier:]";
      __int16 v16 = 2112;
      id v17 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "%s Loading synced timer storage for device %@...",  buf,  0x16u);
    }

    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[ADClockService sharedService](&OBJC_CLASS___ADClockService, "sharedService"));
    int v10 = (void *)objc_claimAutoreleasedReturnValue([v9 remoteTimerManager]);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1002D54D8;
    v11[3] = &unk_1004FA8B8;
    id v12 = v6;
    id v13 = v5;
    [v10 accessStorageForDeviceWithIdentifier:v12 usingBlock:v11];
  }
}

@end