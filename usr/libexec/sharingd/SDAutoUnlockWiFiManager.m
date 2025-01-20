@interface SDAutoUnlockWiFiManager
+ (id)sharedManager;
- (BOOL)_addWiFiRequest:(id)a3;
- (BOOL)awdlStartFailed;
- (BOOL)awdlStarting;
- (BOOL)awdlTimerFired;
- (NISession)niSession;
- (NSMutableArray)wifiRequestQueue;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)awdlTimer;
- (SDAutoUnlockWiFiManager)init;
- (SDAutoUnlockWiFiRequest)currentRequest;
- (id)awdlNetwork;
- (void)__handleAWDLDisabledIfNeededForRequest:(id)a3;
- (void)_cancelWiFiRequest:(id)a3;
- (void)_createNISession;
- (void)_disableRangeableNI;
- (void)_enableRangeableIfNeededNI;
- (void)_handleAWDLTimerFired;
- (void)_handleNetworkStarted:(id)a3 request:(id)a4 error:(int64_t)a5;
- (void)_handleNetworkStoppedWithError:(id)a3 error:(int64_t)a4;
- (void)_invalidateAWDLTimer;
- (void)_invalidateCurrentRequest;
- (void)_invalidateWiFiRequest:(id)a3;
- (void)_processRequestQueue;
- (void)_resetManagerState;
- (void)_restartAWDLTimer;
- (void)_startAWDLWithInfo:(id)a3;
- (void)_startRangingWithNI;
- (void)_stopAWDL;
- (void)cancelWiFiRequest:(id)a3;
- (void)handleNetworkStarted:(id)a3 request:(id)a4 error:(int64_t)a5;
- (void)handleNetworkStoppedWithError:(id)a3 error:(int64_t)a4;
- (void)scheduleWiFiRequest:(id)a3;
- (void)session:(id)a3 didFailWithError:(id)a4;
- (void)session:(id)a3 didInvalidateWithError:(id)a4;
- (void)session:(id)a3 didReceiveRangingAuthRecommendation:(BOOL)a4 forObject:(id)a5;
- (void)setAwdlNetwork:(id)a3;
- (void)setAwdlStartFailed:(BOOL)a3;
- (void)setAwdlStarting:(BOOL)a3;
- (void)setAwdlTimer:(id)a3;
- (void)setAwdlTimerFired:(BOOL)a3;
- (void)setCurrentRequest:(id)a3;
- (void)setNiSession:(id)a3;
- (void)setQueue:(id)a3;
- (void)setWifiRequestQueue:(id)a3;
- (void)start;
- (void)updateWiFiRequest:(id)a3 setRangingPeer:(id)a4;
@end

@implementation SDAutoUnlockWiFiManager

+ (id)sharedManager
{
  if (qword_100657158 != -1) {
    dispatch_once(&qword_100657158, &stru_1005CE918);
  }
  return (id)qword_100657150;
}

- (SDAutoUnlockWiFiManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SDAutoUnlockWiFiManager;
  v2 = -[SDAutoUnlockWiFiManager init](&v8, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.sharing.SDAutoUnlockWiFiManager", 0LL);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    wifiRequestQueue = v2->_wifiRequestQueue;
    v2->_wifiRequestQueue = v5;
  }

  return v2;
}

- (void)start
{
  dispatch_queue_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10010EE90;
  block[3] = &unk_1005CB2F8;
  block[4] = self;
  dispatch_async(v3, block);

  -[SDAutoUnlockWiFiManager _createNISession](self, "_createNISession");
}

- (void)_createNISession
{
  uint64_t v3 = SFMainQueue(self, a2);
  v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v3);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10010EF24;
  block[3] = &unk_1005CB2F8;
  block[4] = self;
  dispatch_async(v4, block);
}

- (BOOL)_addWiFiRequest:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  uint64_t v7 = auto_unlock_log(v6);
  objc_super v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
    int v14 = 136315650;
    v15 = "-[SDAutoUnlockWiFiManager _addWiFiRequest:]";
    __int16 v16 = 2112;
    id v17 = v4;
    __int16 v18 = 2112;
    v19 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s request: %@ identifier: %@",  (uint8_t *)&v14,  0x20u);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager wifiRequestQueue](self, "wifiRequestQueue"));
  unsigned __int8 v11 = [v10 containsObject:v4];

  if ((v11 & 1) == 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager wifiRequestQueue](self, "wifiRequestQueue"));
    [v12 addObject:v4];

    -[SDAutoUnlockWiFiManager _processRequestQueue](self, "_processRequestQueue");
  }

  return 1;
}

- (void)_invalidateWiFiRequest:(id)a3
{
  id v4 = (__CFString *)a3;
  uint64_t v5 = auto_unlock_log(v4);
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString identifier](v4, "identifier"));
    *(_DWORD *)buf = 136315650;
    v33 = "-[SDAutoUnlockWiFiManager _invalidateWiFiRequest:]";
    __int16 v34 = 2112;
    v35 = v4;
    __int16 v36 = 2112;
    v37 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s request: %@ identifier: %@", buf, 0x20u);
  }

  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager currentRequest](self, "currentRequest"));
  unsigned __int8 v9 = [v8 isEqual:v4];

  if ((v9 & 1) != 0)
  {
    if (!-[SDAutoUnlockWiFiManager awdlStarting](self, "awdlStarting"))
    {
LABEL_8:
      -[SDAutoUnlockWiFiManager _disableRangeableNI](self, "_disableRangeableNI");
      -[SDAutoUnlockWiFiManager _stopAWDL](self, "_stopAWDL");
      -[SDAutoUnlockWiFiManager setCurrentRequest:](self, "setCurrentRequest:", 0LL);
      goto LABEL_16;
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager awdlNetwork](self, "awdlNetwork"));
    if (v10 || -[SDAutoUnlockWiFiManager awdlStartFailed](self, "awdlStartFailed"))
    {

      goto LABEL_8;
    }

    BOOL v23 = -[SDAutoUnlockWiFiManager awdlTimerFired](self, "awdlTimerFired");
    if (v23) {
      goto LABEL_8;
    }
    uint64_t v24 = auto_unlock_log(v23);
    v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      if (-[SDAutoUnlockWiFiManager awdlStarting](self, "awdlStarting")) {
        v26 = @"YES";
      }
      else {
        v26 = @"NO";
      }
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager awdlNetwork](self, "awdlNetwork"));
      if (-[SDAutoUnlockWiFiManager awdlStartFailed](self, "awdlStartFailed")) {
        v28 = @"YES";
      }
      else {
        v28 = @"NO";
      }
      unsigned int v29 = -[SDAutoUnlockWiFiManager awdlTimerFired](self, "awdlTimerFired");
      *(_DWORD *)buf = 136316162;
      v33 = "-[SDAutoUnlockWiFiManager _invalidateWiFiRequest:]";
      if (v29) {
        v30 = @"YES";
      }
      else {
        v30 = @"NO";
      }
      __int16 v34 = 2112;
      v35 = v26;
      __int16 v36 = 2112;
      v37 = v27;
      __int16 v38 = 2112;
      v39 = v28;
      __int16 v40 = 2112;
      v41 = v30;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "%s Waiting for network before disable. awdlStarting: %@, awdlNetwork: %@, awdlStartFailed: %@, awdlTimerFired: %@",  buf,  0x34u);
    }

    v31 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager currentRequest](self, "currentRequest"));
    [v31 setWaitingForNetworkToDisable:1];
  }

  else
  {
    unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString identifier](v4, "identifier"));
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"identifier == %@",  v11));

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager wifiRequestQueue](self, "wifiRequestQueue"));
    int v14 = (void *)objc_claimAutoreleasedReturnValue([v13 filteredArrayUsingPredicate:v12]);
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue([v14 firstObject]);

    uint64_t v17 = auto_unlock_log(v16);
    __int16 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
    if (v15)
    {
      if (v19)
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString identifier](v15, "identifier"));
        unsigned int v21 = -[__CFString waitingForNetworkToDisable](v15, "waitingForNetworkToDisable");
        *(_DWORD *)buf = 136315906;
        v33 = "-[SDAutoUnlockWiFiManager _invalidateWiFiRequest:]";
        __int16 v34 = 2112;
        v35 = v15;
        __int16 v36 = 2112;
        v37 = v20;
        __int16 v38 = 1024;
        LODWORD(v39) = v21;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "%s removing  non current request: %@ identifier: %@ waitingForNetworkToDisable: %d",  buf,  0x26u);
      }

      __int16 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager wifiRequestQueue](self, "wifiRequestQueue"));
      -[os_log_s removeObject:](v18, "removeObject:", v15);
    }

    else if (v19)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString identifier](v4, "identifier"));
      *(_DWORD *)buf = 136315650;
      v33 = "-[SDAutoUnlockWiFiManager _invalidateWiFiRequest:]";
      __int16 v34 = 2112;
      v35 = v4;
      __int16 v36 = 2112;
      v37 = v22;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "%s request(%@) not found !! identifier: %@",  buf,  0x20u);
    }
  }

- (void)scheduleWiFiRequest:(id)a3
{
  id v5 = a3;
  uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10010F664;
  block[3] = &unk_1005CBF30;
  v10 = self;
  SEL v11 = a2;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, block);
}

- (void)cancelWiFiRequest:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager queue](self, "queue"));
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_10010F854;
    v6[3] = &unk_1005CB480;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(v5, v6);
  }
}

- (void)updateWiFiRequest:(id)a3 setRangingPeer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager queue](self, "queue"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10010F918;
  v11[3] = &unk_1005CB480;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, v11);
}

- (void)_processRequestQueue
{
  uint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager currentRequest](self, "currentRequest"));
  if (v4)
  {
    uint64_t v6 = auto_unlock_log(v5);
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager currentRequest](self, "currentRequest"));
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager currentRequest](self, "currentRequest"));
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
      *(_DWORD *)buf = 136315906;
      *(void *)&uint8_t buf[4] = "-[SDAutoUnlockWiFiManager _processRequestQueue]";
      __int16 v25 = 1024;
      *(_DWORD *)v26 = 323;
      *(_WORD *)&v26[4] = 2112;
      *(void *)&v26[6] = v8;
      __int16 v27 = 2112;
      v28 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s: %d Already processing request: %@ identifier: %@",  buf,  0x26u);
    }
  }

  else
  {
    SEL v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager wifiRequestQueue](self, "wifiRequestQueue"));
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([v11 firstObject]);

    if (v7)
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager wifiRequestQueue](self, "wifiRequestQueue"));
      [v12 removeObjectAtIndex:0];

      -[SDAutoUnlockWiFiManager setCurrentRequest:](self, "setCurrentRequest:", v7);
      id v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager currentRequest](self, "currentRequest"));
      int v14 = (void *)objc_claimAutoreleasedReturnValue([v13 queueAvailableHandler]);

      if (v14)
      {
        *(void *)buf = 0LL;
        objc_initWeak((id *)buf, self);
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager currentRequest](self, "currentRequest"));
        uint64_t v17 = (void (**)(void, void))objc_claimAutoreleasedReturnValue([v16 queueAvailableHandler]);
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472LL;
        v21[2] = sub_10010FC30;
        v21[3] = &unk_1005CE968;
        v21[4] = self;
        id v7 = v7;
        v22 = v7;
        objc_copyWeak(&v23, (id *)buf);
        ((void (**)(void, void *))v17)[2](v17, v21);

        objc_destroyWeak(&v23);
        objc_destroyWeak((id *)buf);
      }

      else
      {
        uint64_t v18 = auto_unlock_log(v15);
        BOOL v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager currentRequest](self, "currentRequest"));
          *(_DWORD *)buf = 136315394;
          *(void *)&uint8_t buf[4] = "-[SDAutoUnlockWiFiManager _processRequestQueue]";
          __int16 v25 = 2112;
          *(void *)v26 = v20;
          _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "%s no queueAvailableHandler. Invalidating current request %@",  buf,  0x16u);
        }

        -[SDAutoUnlockWiFiManager _invalidateCurrentRequest](self, "_invalidateCurrentRequest");
      }
    }
  }
}

- (void)_cancelWiFiRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  uint64_t v7 = auto_unlock_log(v6);
  objc_super v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315394;
    SEL v11 = "-[SDAutoUnlockWiFiManager _cancelWiFiRequest:]";
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v10, 0x16u);
  }

  if (v4)
  {
    [v4 setInvalidationHandler:0];
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockWiFiManager sharedManager](&OBJC_CLASS___SDAutoUnlockWiFiManager, "sharedManager"));
    [v9 _invalidateWiFiRequest:v4];

    if (([v4 invalidateCalled] & 1) == 0)
    {
      [v4 setInvalidateCalled:1];
      [v4 _invalidate];
    }
  }
}

- (void)_resetManagerState
{
  uint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  uint64_t v5 = auto_unlock_log(v4);
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    objc_super v8 = "-[SDAutoUnlockWiFiManager _resetManagerState]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v7, 0xCu);
  }

  -[SDAutoUnlockWiFiManager setAwdlStartFailed:](self, "setAwdlStartFailed:", 0LL);
  -[SDAutoUnlockWiFiManager setAwdlStarting:](self, "setAwdlStarting:", 0LL);
  -[SDAutoUnlockWiFiManager setAwdlTimerFired:](self, "setAwdlTimerFired:", 0LL);
}

- (void)_invalidateCurrentRequest
{
  uint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  uint64_t v5 = auto_unlock_log(v4);
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager currentRequest](self, "currentRequest"));
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager currentRequest](self, "currentRequest"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
    int v11 = 136315650;
    __int16 v12 = "-[SDAutoUnlockWiFiManager _invalidateCurrentRequest]";
    __int16 v13 = 2112;
    int v14 = v7;
    __int16 v15 = 2112;
    uint64_t v16 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s current Request: %@ identifier: %@",  (uint8_t *)&v11,  0x20u);
  }

  -[SDAutoUnlockWiFiManager _resetManagerState](self, "_resetManagerState");
  int v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager currentRequest](self, "currentRequest"));
  -[SDAutoUnlockWiFiManager _cancelWiFiRequest:](self, "_cancelWiFiRequest:", v10);

  -[SDAutoUnlockWiFiManager setCurrentRequest:](self, "setCurrentRequest:", 0LL);
  -[SDAutoUnlockWiFiManager _processRequestQueue](self, "_processRequestQueue");
}

- (void)_startRangingWithNI
{
  uint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager currentRequest](self, "currentRequest"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 rangingPeer]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 niRangingPeer]);
  __int16 v27 = v6;
  int v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v27, 1LL));

  uint64_t v9 = auto_unlock_log(v8);
  int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager niSession](self, "niSession"));
    __int16 v12 = @"YES";
    v22 = "-[SDAutoUnlockWiFiManager _startRangingWithNI]";
    int v21 = 136315650;
    if (!v11) {
      __int16 v12 = @"NO";
    }
    __int16 v23 = 2112;
    uint64_t v24 = v12;
    __int16 v25 = 2112;
    v26 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%s Starting ranging (manager: %@, peers: %@)",  (uint8_t *)&v21,  0x20u);
  }

  __int16 v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager currentRequest](self, "currentRequest"));
  [v13 rangingTimeout];

  id v14 = objc_alloc(&OBJC_CLASS___NIRangingAuthConfiguration);
  __int16 v15 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndexedSubscript:0]);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 macAddress]);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndexedSubscript:0]);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 secureRangingKeyID]);
  id v19 = [v14 initAsResponder:0 macAddress:v16 key:v18];

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager niSession](self, "niSession"));
  [v20 runWithConfiguration:v19];

  kdebug_trace(725286952LL, 0LL, 0LL, 0LL, 0LL);
}

- (void)_enableRangeableIfNeededNI
{
  uint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager currentRequest](self, "currentRequest"));
  unsigned __int8 v5 = [v4 isRangingInitiator];

  if ((v5 & 1) == 0)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager currentRequest](self, "currentRequest"));
    int v7 = (void *)objc_claimAutoreleasedReturnValue([v6 rangingPeer]);

    if (v7)
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager currentRequest](self, "currentRequest"));
      int v10 = (void *)objc_claimAutoreleasedReturnValue([v9 rangingPeer]);
      int v11 = (void *)objc_claimAutoreleasedReturnValue([v10 niRangingPeer]);

      if (v11)
      {
        __int16 v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager currentRequest](self, "currentRequest"));
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 rangingPeer]);
        __int16 v15 = (void *)objc_claimAutoreleasedReturnValue([v14 niRangingPeer]);
        __int16 v38 = v15;
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v38, 1LL));

        uint64_t v18 = auto_unlock_log(v17);
        id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager niSession](self, "niSession"));
          int v21 = @"YES";
          v33 = "-[SDAutoUnlockWiFiManager _enableRangeableIfNeededNI]";
          int v32 = 136315650;
          if (!v20) {
            int v21 = @"NO";
          }
          __int16 v34 = 2112;
          v35 = v21;
          __int16 v36 = 2112;
          v37 = v16;
          _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "%s startRangingFromPeers (manager: %@, peers: %@)",  (uint8_t *)&v32,  0x20u);
        }

        id v22 = objc_alloc(&OBJC_CLASS___NIRangingAuthConfiguration);
        __int16 v23 = (void *)objc_claimAutoreleasedReturnValue([v16 objectAtIndexedSubscript:0]);
        uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v23 macAddress]);
        __int16 v25 = (void *)objc_claimAutoreleasedReturnValue([v16 objectAtIndexedSubscript:0]);
        v26 = (void *)objc_claimAutoreleasedReturnValue([v25 secureRangingKeyID]);
        id v27 = [v22 initAsResponder:1 macAddress:v24 key:v26];

        v28 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager niSession](self, "niSession"));
        [v28 runWithConfiguration:v27];

        unsigned int v29 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager currentRequest](self, "currentRequest"));
        [v29 setRangeable:1];
      }

      else
      {
        uint64_t v31 = auto_unlock_log(v12);
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v31);
        if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_FAULT)) {
          sub_100112194();
        }
      }
    }

    else
    {
      uint64_t v30 = auto_unlock_log(v8);
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_FAULT)) {
        sub_100112168();
      }
    }
  }

- (void)_disableRangeableNI
{
  uint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager currentRequest](self, "currentRequest"));
  unsigned int v5 = [v4 rangeable];

  if (v5)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager currentRequest](self, "currentRequest"));
    int v7 = (void *)objc_claimAutoreleasedReturnValue([v6 rangingPeer]);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 niRangingPeer]);
    id v22 = v8;
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v22, 1LL));

    uint64_t v11 = auto_unlock_log(v10);
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager niSession](self, "niSession"));
      id v14 = @"YES";
      uint64_t v17 = "-[SDAutoUnlockWiFiManager _disableRangeableNI]";
      int v16 = 136315650;
      if (!v13) {
        id v14 = @"NO";
      }
      __int16 v18 = 2112;
      id v19 = v14;
      __int16 v20 = 2112;
      int v21 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%s stopRangingFromPeers (manager: %@, peers: %@)",  (uint8_t *)&v16,  0x20u);
    }

    __int16 v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager niSession](self, "niSession"));
    [v15 invalidate];

    -[SDAutoUnlockWiFiManager _createNISession](self, "_createNISession");
  }

- (void)session:(id)a3 didReceiveRangingAuthRecommendation:(BOOL)a4 forObject:(id)a5
{
  BOOL v5 = a4;
  uint64_t v7 = auto_unlock_log(self);
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if (v5) {
      uint64_t v9 = @"YES";
    }
    else {
      uint64_t v9 = @"NO";
    }
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager currentRequest](self, "currentRequest"));
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 rangingPeer]);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 niRangingPeer]);
    *(_DWORD *)buf = 136315650;
    __int16 v23 = "-[SDAutoUnlockWiFiManager session:didReceiveRangingAuthRecommendation:forObject:]";
    __int16 v24 = 2112;
    __int16 v25 = v9;
    __int16 v26 = 2112;
    id v27 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s should authenticate: %@, peer: %@",  buf,  0x20u);
  }

  __int16 v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager currentRequest](self, "currentRequest"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 rangingPeer]);
  __int16 v15 = (void *)objc_claimAutoreleasedReturnValue([v14 niRangingPeer]);

  if (v15)
  {
    uint64_t v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager queue](self, "queue"));
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_100110988;
    v20[3] = &unk_1005CC3A8;
    v20[4] = self;
    BOOL v21 = v5;
    dispatch_async(v17, v20);
  }

  else
  {
    uint64_t v18 = auto_unlock_log(v16);
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
      sub_1001121C0();
    }
  }

- (void)session:(id)a3 didFailWithError:(id)a4
{
  id v5 = a4;
  uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager queue](self, "queue"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100110B68;
  v8[3] = &unk_1005CB480;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

- (void)session:(id)a3 didInvalidateWithError:(id)a4
{
  id v5 = a4;
  uint64_t v6 = auto_unlock_log(v5);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "NI session invalidated, restarting session",  buf,  2u);
  }

  -[SDAutoUnlockWiFiManager _createNISession](self, "_createNISession");
  if ([v5 code] == (id)-10008)
  {
    uint64_t v8 = auto_unlock_log(-10008LL);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "NI session is invalidated after completing the one-shot ranging, so ignoring the completed error",  buf,  2u);
    }
  }

  else
  {
    uint64_t v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager queue](self, "queue"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_100110D44;
    v11[3] = &unk_1005CB480;
    void v11[4] = self;
    id v12 = v5;
    dispatch_async(v10, v11);
  }
}

- (void)_startAWDLWithInfo:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 awdlInfo]);
  uint64_t v7 = auto_unlock_log(v6);
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
    int v22 = 136315906;
    __int16 v23 = "-[SDAutoUnlockWiFiManager _startAWDLWithInfo:]";
    __int16 v24 = 2112;
    id v25 = v4;
    __int16 v26 = 2112;
    id v27 = v9;
    __int16 v28 = 2112;
    unsigned int v29 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s Starting AWDL request: %@ identifier: %@ info: %@",  (uint8_t *)&v22,  0x2Au);
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
  id v11 = [v10 awdlDevice];

  if (!v11)
  {
    uint64_t v21 = auto_unlock_log(v12);
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_1001121EC(v4, v19);
    }
    goto LABEL_11;
  }

  uint64_t started = WiFiDeviceClientStartNetwork( v11,  4LL,  v6,  sub_100111044,  -[SDAutoUnlockWiFiManagerContext initWithRequest:wiFiManager:]( objc_alloc(&OBJC_CLASS___SDAutoUnlockWiFiManagerContext),  "initWithRequest:wiFiManager:",  v4,  self));
  if (!(_DWORD)started)
  {
    -[SDAutoUnlockWiFiManager _enableRangeableIfNeededNI](self, "_enableRangeableIfNeededNI");
    -[SDAutoUnlockWiFiManager _restartAWDLTimer](self, "_restartAWDLTimer");
    goto LABEL_13;
  }

  int v14 = started;
  uint64_t v15 = auto_unlock_log(started);
  uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    sub_10011229C(v4, v14, v16);
  }

  -[SDAutoUnlockWiFiManager setAwdlStartFailed:](self, "setAwdlStartFailed:", 1LL);
  -[SDAutoUnlockWiFiManager setAwdlStarting:](self, "setAwdlStarting:", 0LL);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager currentRequest](self, "currentRequest"));
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 awdlStartedHandler]);

  if (v18)
  {
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager currentRequest](self, "currentRequest"));
    __int16 v20 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue(-[os_log_s awdlStartedHandler](v19, "awdlStartedHandler"));
    v20[2](v20, 0LL, v14);

LABEL_11:
  }

- (void)_stopAWDL
{
  uint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager awdlNetwork](self, "awdlNetwork"));
  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
    id v6 = [v5 awdlDevice];

    uint64_t v7 = objc_alloc(&OBJC_CLASS___SDAutoUnlockWiFiManagerContext);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager currentRequest](self, "currentRequest"));
    id v9 = -[SDAutoUnlockWiFiManagerContext initWithRequest:wiFiManager:](v7, "initWithRequest:wiFiManager:", v8, self);

    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager awdlNetwork](self, "awdlNetwork"));
    int v11 = WiFiDeviceClientStopNetwork(v6, v10, sub_10011136C, v9);

    uint64_t v13 = auto_unlock_log(v12);
    int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager currentRequest](self, "currentRequest"));
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager awdlNetwork](self, "awdlNetwork"));
      int v17 = 136315906;
      uint64_t v18 = "-[SDAutoUnlockWiFiManager _stopAWDL]";
      __int16 v19 = 2112;
      __int16 v20 = v15;
      __int16 v21 = 2112;
      int v22 = v16;
      __int16 v23 = 1024;
      int v24 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%s Stopping AWDL currentRequest: %@ network %@, error %d",  (uint8_t *)&v17,  0x26u);
    }

    -[SDAutoUnlockWiFiManager setAwdlNetwork:](self, "setAwdlNetwork:", 0LL);
  }

  -[SDAutoUnlockWiFiManager _resetManagerState](self, "_resetManagerState");
}

- (void)__handleAWDLDisabledIfNeededForRequest:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  -[SDAutoUnlockWiFiManager _invalidateAWDLTimer](self, "_invalidateAWDLTimer");
  uint64_t v6 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager currentRequest](self, "currentRequest"));
  if (v6)
  {
    uint64_t v7 = (void *)v6;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager currentRequest](self, "currentRequest"));
    unsigned int v9 = [v4 isEqual:v8];

    if (v9)
    {
      uint64_t v11 = auto_unlock_log(v10);
      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
        int v14 = 136315650;
        uint64_t v15 = "-[SDAutoUnlockWiFiManager __handleAWDLDisabledIfNeededForRequest:]";
        __int16 v16 = 2112;
        id v17 = v4;
        __int16 v18 = 2112;
        __int16 v19 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%s AWDL went down. Invalidating current request: %@ identifier: %@",  (uint8_t *)&v14,  0x20u);
      }

      -[SDAutoUnlockWiFiManager _invalidateCurrentRequest](self, "_invalidateCurrentRequest");
    }
  }
}

- (void)_restartAWDLTimer
{
  uint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  uint64_t v5 = auto_unlock_log(v4);
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&uint8_t buf[4] = "-[SDAutoUnlockWiFiManager _restartAWDLTimer]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s Restarting AWDL bring up timer", buf, 0xCu);
  }

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager awdlTimer](self, "awdlTimer"));
  BOOL v8 = v7 == 0LL;

  if (v8)
  {
    *(void *)buf = 0LL;
    objc_initWeak((id *)buf, self);
    unsigned int v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager queue](self, "queue"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_1001117E4;
    v15[3] = &unk_1005CB220;
    objc_copyWeak(&v16, (id *)buf);
    uint64_t v10 = sub_100114598(0, v9, v15);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    -[SDAutoUnlockWiFiManager setAwdlTimer:](self, "setAwdlTimer:", v11);

    uint64_t v12 = (dispatch_object_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager awdlTimer](self, "awdlTimer"));
    dispatch_resume(v12);

    objc_destroyWeak(&v16);
    objc_destroyWeak((id *)buf);
  }

  uint64_t v13 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager awdlTimer](self, "awdlTimer"));
  dispatch_time_t v14 = sub_100114580(30.0);
  sub_100114638(v13, v14);
}

- (void)_invalidateAWDLTimer
{
  uint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager awdlTimer](self, "awdlTimer"));
  if (v4)
  {
    uint64_t v6 = auto_unlock_log(v5);
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315138;
      uint64_t v10 = "-[SDAutoUnlockWiFiManager _invalidateAWDLTimer]";
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s Invalidating AWDL bring up timer",  (uint8_t *)&v9,  0xCu);
    }

    BOOL v8 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager awdlTimer](self, "awdlTimer"));
    dispatch_source_cancel(v8);

    -[SDAutoUnlockWiFiManager setAwdlTimer:](self, "setAwdlTimer:", 0LL);
  }

- (void)_handleAWDLTimerFired
{
  uint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  uint64_t v5 = auto_unlock_log(v4);
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315138;
    uint64_t v13 = "-[SDAutoUnlockWiFiManager _handleAWDLTimerFired]";
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s AWDL bring up timer fired",  (uint8_t *)&v12,  0xCu);
  }

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager currentRequest](self, "currentRequest"));
  unsigned int v8 = [v7 waitingForNetworkToDisable];

  if (v8)
  {
    uint64_t v10 = auto_unlock_log(v9);
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315138;
      uint64_t v13 = "-[SDAutoUnlockWiFiManager _handleAWDLTimerFired]";
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%s Disabling ranging and awdl for timer",  (uint8_t *)&v12,  0xCu);
    }

    -[SDAutoUnlockWiFiManager _invalidateCurrentRequest](self, "_invalidateCurrentRequest");
  }

  else
  {
    -[SDAutoUnlockWiFiManager setAwdlTimerFired:](self, "setAwdlTimerFired:", 1LL);
  }

- (void)handleNetworkStarted:(id)a3 request:(id)a4 error:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager queue](self, "queue"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100111B24;
  v13[3] = &unk_1005CE990;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  int64_t v16 = a5;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

- (void)_handleNetworkStarted:(id)a3 request:(id)a4 error:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager queue](self, "queue"));
  dispatch_assert_queue_V2(v10);

  uint64_t v12 = auto_unlock_log(v11);
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
    int v27 = 136315650;
    __int16 v28 = "-[SDAutoUnlockWiFiManager _handleNetworkStarted:request:error:]";
    __int16 v29 = 2112;
    id v30 = v9;
    __int16 v31 = 2112;
    int v32 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%s request: %@ identifier: %@",  (uint8_t *)&v27,  0x20u);
  }

  -[SDAutoUnlockWiFiManager _invalidateAWDLTimer](self, "_invalidateAWDLTimer");
  id v15 = (id)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager currentRequest](self, "currentRequest"));

  if (v15 == v9)
  {
    -[SDAutoUnlockWiFiManager setAwdlNetwork:](self, "setAwdlNetwork:", v8);
    -[SDAutoUnlockWiFiManager setAwdlStarting:](self, "setAwdlStarting:", 0LL);
    int64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager currentRequest](self, "currentRequest"));
    unsigned int v17 = [v16 waitingForNetworkToDisable];

    if (v17)
    {
      -[SDAutoUnlockWiFiManager _invalidateCurrentRequest](self, "_invalidateCurrentRequest");
    }

    else
    {
      __int16 v18 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager currentRequest](self, "currentRequest"));
      int v19 = [v18 calledAWDLStarted];

      if ((v19 & 1) == 0)
      {
        if (a5)
        {
          uint64_t v20 = auto_unlock_log(-[SDAutoUnlockWiFiManager setAwdlStartFailed:](self, "setAwdlStartFailed:", 1LL));
          __int16 v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
            sub_10011235C(a5, v21);
          }
        }

        int v22 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager currentRequest](self, "currentRequest"));
        [v22 setCalledAWDLStarted:1];

        __int16 v23 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager currentRequest](self, "currentRequest"));
        int v24 = (void *)objc_claimAutoreleasedReturnValue([v23 awdlStartedHandler]);

        if (v24)
        {
          id v25 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager currentRequest](self, "currentRequest"));
          __int16 v26 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue([v25 awdlStartedHandler]);
          v26[2](v26, 0LL, a5);
        }
      }
    }
  }
}

- (void)handleNetworkStoppedWithError:(id)a3 error:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100111E28;
  block[3] = &unk_1005CBF30;
  void block[4] = self;
  id v10 = v6;
  int64_t v11 = a4;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (void)_handleNetworkStoppedWithError:(id)a3 error:(int64_t)a4
{
  id v5 = a3;
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager queue](self, "queue"));
  dispatch_assert_queue_V2(v6);

  uint64_t v8 = auto_unlock_log(v7);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager currentRequest](self, "currentRequest"));
    int v11 = 136315650;
    uint64_t v12 = "-[SDAutoUnlockWiFiManager _handleNetworkStoppedWithError:error:]";
    __int16 v13 = 2112;
    id v14 = v5;
    __int16 v15 = 2112;
    int64_t v16 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s AWDL disabled request: %@ currentRequest: %@",  (uint8_t *)&v11,  0x20u);
  }

  -[SDAutoUnlockWiFiManager __handleAWDLDisabledIfNeededForRequest:]( self,  "__handleAWDLDisabledIfNeededForRequest:",  v5);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_source)awdlTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setAwdlTimer:(id)a3
{
}

- (id)awdlNetwork
{
  return objc_getProperty(self, a2, 32LL, 1);
}

- (void)setAwdlNetwork:(id)a3
{
}

- (BOOL)awdlStartFailed
{
  return self->_awdlStartFailed;
}

- (void)setAwdlStartFailed:(BOOL)a3
{
  self->_awdlStartFailed = a3;
}

- (BOOL)awdlStarting
{
  return self->_awdlStarting;
}

- (void)setAwdlStarting:(BOOL)a3
{
  self->_awdlStarting = a3;
}

- (BOOL)awdlTimerFired
{
  return self->_awdlTimerFired;
}

- (void)setAwdlTimerFired:(BOOL)a3
{
  self->_awdlTimerFired = a3;
}

- (SDAutoUnlockWiFiRequest)currentRequest
{
  return (SDAutoUnlockWiFiRequest *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setCurrentRequest:(id)a3
{
}

- (NISession)niSession
{
  return self->_niSession;
}

- (void)setNiSession:(id)a3
{
}

- (NSMutableArray)wifiRequestQueue
{
  return self->_wifiRequestQueue;
}

- (void)setWifiRequestQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end