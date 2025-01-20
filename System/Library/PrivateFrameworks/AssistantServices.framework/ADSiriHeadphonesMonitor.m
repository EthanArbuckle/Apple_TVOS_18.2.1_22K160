@interface ADSiriHeadphonesMonitor
- (id)_headGestureConfigurationForRoute:(id)a3;
- (id)headGestureConfiguration;
- (void)_audioRouteDidChange:(id)a3;
- (void)_fetchInEarDetectionStateAndStartObservingFromSourceForBTAddress:(id)a3 withCompletion:(id)a4;
- (void)_fetchWirelessSplitterSessionInfoAndStartObservingFromSourceWithCompletion:(id)a3;
- (void)_stopObservingInEarDetectionStateFromSource;
@end

@implementation ADSiriHeadphonesMonitor

- (void)_fetchWirelessSplitterSessionInfoAndStartObservingFromSourceWithCompletion:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[ADBluetoothManager sharedInstance](&OBJC_CLASS___ADBluetoothManager, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 wirelessSplitterSession]);

  if (v5)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100313D20;
    v8[3] = &unk_1004FC990;
    id v9 = v3;
    [v5 getSessionInfo:v8];
  }

  else if (v3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kAFAssistantErrorDomain,  1800LL,  0LL));
    (*((void (**)(id, void, void *))v3 + 2))(v3, 0LL, v6);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue( +[ADBluetoothWirelessSplitterSessionObserver sharedWirelessSplitterSessionObserver]( &OBJC_CLASS___ADBluetoothWirelessSplitterSessionObserver,  "sharedWirelessSplitterSessionObserver"));
  [v7 startObserving];
}

- (void)_fetchInEarDetectionStateAndStartObservingFromSourceForBTAddress:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[ADBluetoothManager sharedInstance](&OBJC_CLASS___ADBluetoothManager, "sharedInstance"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 deviceWithAddress:v6]);

  if (v9)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100313D08;
    v15[3] = &unk_1004FBB88;
    id v16 = v7;
    [v9 getHeadphoneInEarDetectionState:v15];
  }

  else if (v7)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kAFAssistantErrorDomain,  1803LL,  0LL));
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0LL, v10);
  }

  v11 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    v13 = v11;
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[AFSiriHeadphonesMonitor _observerID](self, "_observerID")));
    *(_DWORD *)buf = 136315650;
    v18 = "-[ADSiriHeadphonesMonitor _fetchInEarDetectionStateAndStartObservingFromSourceForBTAddress:withCompletion:]";
    __int16 v19 = 2112;
    id v20 = v6;
    __int16 v21 = 2112;
    v22 = v14;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "%s Start observing IED States for %@ for observerID: %@",  buf,  0x20u);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue( +[ADBluetoothInEarDetectionStateObserver sharedObserver]( &OBJC_CLASS___ADBluetoothInEarDetectionStateObserver,  "sharedObserver"));
  objc_msgSend( v12,  "startObservingForBTAddress:forObserverID:",  v6,  -[AFSiriHeadphonesMonitor _observerID](self, "_observerID"));
}

- (void)_stopObservingInEarDetectionStateFromSource
{
  id v3 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    v5 = v3;
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[AFSiriHeadphonesMonitor _observerID](self, "_observerID")));
    int v7 = 136315394;
    v8 = "-[ADSiriHeadphonesMonitor _stopObservingInEarDetectionStateFromSource]";
    __int16 v9 = 2112;
    v10 = v6;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "%s Stop observing IED States for observerID: %@",  (uint8_t *)&v7,  0x16u);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue( +[ADBluetoothInEarDetectionStateObserver sharedObserver]( &OBJC_CLASS___ADBluetoothInEarDetectionStateObserver,  "sharedObserver"));
  objc_msgSend(v4, "stopObservingForObserverID:", -[AFSiriHeadphonesMonitor _observerID](self, "_observerID"));
}

- (void)_audioRouteDidChange:(id)a3
{
  id v8 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v8 btAddress]);

  v5 = v8;
  if (v4)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue( -[ADSiriHeadphonesMonitor _headGestureConfigurationForRoute:]( self,  "_headGestureConfigurationForRoute:",  v8));
    if ([v6 isSupported])
    {
      int v7 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
      [v7 setStoredHeadGestureConfigurationForDevice:v6];
    }

    v5 = v8;
  }
}

- (id)_headGestureConfigurationForRoute:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[ADBluetoothManager sharedInstance](&OBJC_CLASS___ADBluetoothManager, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 btAddress]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 headGestureConfigurationForBTAddress:v5]);
  int v7 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315394;
    v10 = "-[ADSiriHeadphonesMonitor _headGestureConfigurationForRoute:]";
    __int16 v11 = 2112;
    v12 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%s Bobble Configuration: %@",  (uint8_t *)&v9,  0x16u);
  }

  return v6;
}

- (id)headGestureConfiguration
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[AFSiriHeadphonesMonitor currentAudioRoute](self, "currentAudioRoute"));
  v4 = (void *)objc_claimAutoreleasedReturnValue( -[ADSiriHeadphonesMonitor _headGestureConfigurationForRoute:]( self,  "_headGestureConfigurationForRoute:",  v3));

  return v4;
}

@end