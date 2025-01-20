@interface HUDRenderServer
+ (id)sharedInstance;
- (id)_init;
- (void)clearHUDWithCompletion:(id)a3;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
- (void)prepareHUDContextIfNeeded;
- (void)receiveHangHUDInfo:(id)a3 completion:(id)a4;
- (void)receiveHudConfiguration:(id)a3 completion:(id)a4;
- (void)receiveMonitoredStates:(id)a3 completion:(id)a4;
- (void)receiveProcExitRecord:(id)a3 completion:(id)a4;
- (void)removeStaleHangData:(id)a3;
- (void)start;
- (void)turnOffProcessTerminationMonitoring;
- (void)turnOnProcessTerminationMonitoring;
@end

@implementation HUDRenderServer

+ (id)sharedInstance
{
  if (qword_1000364D8 != -1) {
    dispatch_once(&qword_1000364D8, &stru_1000288F8);
  }
  return (id)qword_1000364D0;
}

- (id)_init
{
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___HUDRenderServer;
  v2 = -[HUDRenderServer init](&v20, "init");
  v3 = v2;
  if (v2)
  {
    hudContext = v2->_hudContext;
    v2->_hudContext = 0LL;

    v5 = objc_alloc_init(&OBJC_CLASS___AssertionManager);
    assertionManager = v3->_assertionManager;
    v3->_assertionManager = v5;

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[HUDContextUpdater sharedInstance](&OBJC_CLASS___HUDContextUpdater, "sharedInstance"));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_1000045E4;
    v18[3] = &unk_100028980;
    v8 = v3;
    v19 = v8;
    [v7 setHudUpdateHandler:v18];

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[ProcessExitFetcher sharedInstance](&OBJC_CLASS___ProcessExitFetcher, "sharedInstance"));
    [v9 setProcessExitHandler:&stru_1000289C0];

    dispatch_queue_t v10 = dispatch_queue_create("com.apple.HangHUD.prefs", 0LL);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
    [v11 setupPrefsWithQueue:v10];

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_100004B5C;
    v16[3] = &unk_1000289E8;
    v12 = v8;
    v17 = v12;
    uint64_t v13 = objc_claimAutoreleasedReturnValue( +[BSServiceConnectionListener listenerWithConfigurator:]( &OBJC_CLASS___BSServiceConnectionListener,  "listenerWithConfigurator:",  v16));
    listener = v12->_listener;
    v12->_listener = (BSServiceConnectionListener *)v13;
  }

  return v3;
}

- (void)prepareHUDContextIfNeeded
{
  hudContext = self->_hudContext;
  if (!hudContext || -[HUDContext hasHudRenderContextInvalidated](hudContext, "hasHudRenderContextInvalidated"))
  {
    v4 = objc_autoreleasePoolPush();
    id v5 = sub_1000047A8();
    v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v5);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100004C8C;
    block[3] = &unk_1000286E0;
    block[4] = self;
    dispatch_sync(v6, block);

    objc_autoreleasePoolPop(v4);
  }

- (void)start
{
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[HangHUDServiceSpecification clientContextIdentifierKey]( &OBJC_CLASS___HangHUDServiceSpecification,  "clientContextIdentifierKey"));
  dispatch_queue_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 decodeStringForKey:v9]);

  v11 = (void *)objc_claimAutoreleasedReturnValue([v7 remoteProcess]);
  id v12 = sub_10000A4EC();
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    id v23 = v7;
    __int16 v24 = 2112;
    v25 = v10;
    __int16 v26 = 2112;
    v27 = v11;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "received connection %p with identifier %@ from %@",  buf,  0x20u);
  }

  if ([v11 hasEntitlement:@"com.apple.HangHUD"])
  {
    v16 = _NSConcreteStackBlock;
    uint64_t v17 = 3221225472LL;
    v18 = sub_100004EF8;
    v19 = &unk_100028A38;
    id v20 = v10;
    v21 = self;
    [v7 configureConnection:&v16];
    objc_msgSend(v7, "activate", v16, v17, v18, v19);
  }

  else
  {
    id v14 = sub_10000A4EC();
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_100015A04();
    }

    [v7 invalidate];
  }
}

- (void)receiveHangHUDInfo:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  id v8 = sub_10000A4EC();
  v9 = (char *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEBUG)) {
    sub_100015BAC(v6, v9);
  }

  if (!sub_1000149E0())
  {
    id v12 = [v6 mutableCopy];
    -[HUDRenderServer removeStaleHangData:](self, "removeStaleHangData:", v12);
    if ([v6 count])
    {
      if ([v12 count])
      {
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[HUDContextUpdater sharedInstance](&OBJC_CLASS___HUDContextUpdater, "sharedInstance"));
        [v13 addHUDContents:v12];
      }

      if (self->_areProcessTerminationsMonitored) {
        goto LABEL_18;
      }
    }

    else
    {
      id v14 = sub_10000A4EC();
      v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        sub_100015B38(v15, v16, v17);
      }

      v18 = (void *)objc_claimAutoreleasedReturnValue(+[HUDContextUpdater sharedInstance](&OBJC_CLASS___HUDContextUpdater, "sharedInstance"));
      [v18 saveClearHUDRequest];
    }

    id v19 = sub_10000A4EC();
    id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      sub_100015B08(v20, v21, v22, v23, v24, v25, v26, v27);
    }

    v28 = (void *)objc_claimAutoreleasedReturnValue(+[HUDContextUpdater sharedInstance](&OBJC_CLASS___HUDContextUpdater, "sharedInstance"));
    [v28 forceUpdate];

LABEL_18:
    v7[2](v7, 0LL);

    goto LABEL_19;
  }

  id v10 = sub_10000A4EC();
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_100015A70(v11);
  }

  v7[2](v7, 0LL);
LABEL_19:
}

- (void)receiveProcExitRecord:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  id v8 = sub_10000A4EC();
  v9 = (char *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEBUG)) {
    sub_100015C50(v6, v9);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[HUDContextUpdater sharedInstance](&OBJC_CLASS___HUDContextUpdater, "sharedInstance"));
  [v10 addHUDContents:v6];

  if (!self->_areProcessTerminationsMonitored)
  {
    id v11 = sub_10000A4EC();
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      sub_100015C20(v12, v13, v14, v15, v16, v17, v18, v19);
    }

    id v20 = (void *)objc_claimAutoreleasedReturnValue(+[HUDContextUpdater sharedInstance](&OBJC_CLASS___HUDContextUpdater, "sharedInstance"));
    [v20 forceUpdate];
  }

  v7[2](v7, 0LL);
}

- (void)removeStaleHangData:(id)a3
{
  id v3 = a3;
  uint64_t v4 = mach_absolute_time();
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 allKeys]);
  id v6 = [v5 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v6)
  {
    id v8 = v6;
    uint64_t v9 = *(void *)v24;
    *(void *)&__int128 v7 = 138412546LL;
    __int128 v21 = v7;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v23 + 1) + 8LL * (void)i);
        id v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", v11, v21));
        id v13 = [v12 receivedTimestamp];

        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:v11]);
        id v15 = [v14 hangEndTime];

        if (v15 != (id)0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:v11]);
          id v13 = [v16 hangEndTime];
        }

        if (sub_100014AF4(v4 - (void)v13) >= 5000.0)
        {
          unsigned __int8 v17 = -[HUDContext hangHasPendingAnimation:](self->_hudContext, "hangHasPendingAnimation:", v11);
          id v18 = sub_10000A4EC();
          uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
          BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG);
          if ((v17 & 1) != 0)
          {
            if (v20)
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v28 = v11;
              _os_log_debug_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEBUG,  "Not removing hang since an animation is in progress %@",  buf,  0xCu);
            }
          }

          else
          {
            if (v20)
            {
              *(_DWORD *)buf = v21;
              uint64_t v28 = v11;
              __int16 v29 = 2112;
              id v30 = v3;
              _os_log_debug_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEBUG,  "removing object for key %@ from dict : %@",  buf,  0x16u);
            }

            [v3 removeObjectForKey:v11];
          }
        }
      }

      id v8 = [v5 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }

    while (v8);
  }
}

- (void)receiveHudConfiguration:(id)a3 completion:(id)a4
{
  id v6 = a3;
  __int128 v7 = (void (**)(id, void))a4;
  id v8 = sub_10000A4EC();
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_100015D54(v9, v10, v11);
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[HUDConfiguration sharedInstance](&OBJC_CLASS___HUDConfiguration, "sharedInstance"));
  [v12 updateWithHUDConfiguration:v6];

  self->_areProcessTerminationsMonitored = [v6 areProcessTerminationsMonitored];
  id v13 = sub_1000031C4();
  uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    sub_100015CC4(v6, v14);
  }

  else {
    -[HUDRenderServer turnOffProcessTerminationMonitoring](self, "turnOffProcessTerminationMonitoring");
  }
  v7[2](v7, 0LL);
}

- (void)receiveMonitoredStates:(id)a3 completion:(id)a4
{
  id v6 = (void (**)(id, void))a4;
  id v7 = a3;
  id v8 = sub_10000A4EC();
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_100015DC8(v9, v10, v11);
  }

  -[HUDContext setRenderParametersFromMonitoredStates:]( self->_hudContext,  "setRenderParametersFromMonitoredStates:",  v7);
  v6[2](v6, 0LL);
}

- (void)turnOnProcessTerminationMonitoring
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[HUDContextUpdater sharedInstance](&OBJC_CLASS___HUDContextUpdater, "sharedInstance"));
  [v3 kickOffUpdater];

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[ProcessExitFetcher sharedInstance](&OBJC_CLASS___ProcessExitFetcher, "sharedInstance"));
  [v4 kickOffFetchTimer];

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[HUDContextUpdater sharedInstance](&OBJC_CLASS___HUDContextUpdater, "sharedInstance"));
  unsigned int v6 = [v5 isNoTaskPending];

  if (v6) {
    id v7 = -[AssertionManager acquireKeepAliveAssertion](self->_assertionManager, "acquireKeepAliveAssertion");
  }
}

- (void)turnOffProcessTerminationMonitoring
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[ProcessExitFetcher sharedInstance](&OBJC_CLASS___ProcessExitFetcher, "sharedInstance"));
  [v3 stopFetchTimer];

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[HUDContextUpdater sharedInstance](&OBJC_CLASS___HUDContextUpdater, "sharedInstance"));
  unsigned int v5 = [v4 isNoTaskPending];

  if (v5)
  {
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(+[HUDContextUpdater sharedInstance](&OBJC_CLASS___HUDContextUpdater, "sharedInstance"));
    [v6 stopUpdater];

    -[AssertionManager invalidateKeepAliveAssertion](self->_assertionManager, "invalidateKeepAliveAssertion");
  }

- (void)clearHUDWithCompletion:(id)a3
{
  uint64_t v4 = (void (**)(id, void))a3;
  id v5 = sub_1000031C4();
  unsigned int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_100015E3C(v6, v7, v8);
  }

  id v9 = sub_1000047A8();
  uint64_t v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v9);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000058A4;
  block[3] = &unk_1000286E0;
  block[4] = self;
  dispatch_sync(v10, block);

  v4[2](v4, 0LL);
}

- (void).cxx_destruct
{
}

@end