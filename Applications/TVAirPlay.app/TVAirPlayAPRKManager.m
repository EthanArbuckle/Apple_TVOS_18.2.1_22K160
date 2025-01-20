@interface TVAirPlayAPRKManager
- (APRKStreamRenderer)activeRenderer;
- (APRKStreamRenderingManager)streamRenderingManager;
- (BOOL)started;
- (OS_dispatch_queue)delegateSerialQueue;
- (TVAirPlayAPRKManager)init;
- (TVAirPlayAPRKManager)initWithSessionManager:(id)a3 streamRenderingManager:(id)a4 legacyReceiverDelegate:(id)a5;
- (TVAirPlayAPRKManagerDelegate)managerDelegate;
- (TVAirPlayLegacyReceiverDelegate)legacyReceiverDelegate;
- (TVAirPlaySessionManager)sessionManager;
- (unint64_t)lastKnownRendererMode;
- (void)_deregisterActiveVideoSessionIfRequired;
- (void)_enqueueAsyncDelegateSerialQueueBlock:(id)a3;
- (void)_onMainQueue_deregisterGlobalPinSession;
- (void)_onMainQueue_deregisterSession:(id)a3;
- (void)_onMainQueue_registerGlobalPinSession:(id)a3 clientName:(id)a4;
- (void)_onMainQueue_registerSession:(id)a3 withCompletionHandler:(id)a4;
- (void)_performSessionManagerWorkOnMainQueueWithBlock:(id)a3;
- (void)_registerActiveVideoSessionIfRequiredForRenderer:(id)a3;
- (void)_stopAndClearActiveRenderer;
- (void)airPlayReceiverDelegate:(id)a3 postEvent:(id)a4 withInfo:(id)a5;
- (void)didChangeStreamRendererModeTo:(unint64_t)a3 forRenderer:(id)a4;
- (void)didStartStreamingWithRenderer:(id)a3;
- (void)didStopStreamingWithRenderer:(id)a3;
- (void)sessionDidReceiveUserStop:(id)a3;
- (void)setActiveRenderer:(id)a3;
- (void)setDelegateSerialQueue:(id)a3;
- (void)setLastKnownRendererMode:(unint64_t)a3;
- (void)setLegacyReceiverDelegate:(id)a3;
- (void)setManagerDelegate:(id)a3;
- (void)setSessionManager:(id)a3;
- (void)setStarted:(BOOL)a3;
- (void)setStreamRenderingManager:(id)a3;
- (void)shouldHideGlobalPasscode;
- (void)shouldShowGlobalPasscodeWithString:(id)a3 withClientName:(id)a4;
- (void)startReceiverServer;
- (void)stopReceiverServer;
@end

@implementation TVAirPlayAPRKManager

- (TVAirPlayAPRKManager)init
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[TVAirPlaySessionManager sharedInstance](&OBJC_CLASS___TVAirPlaySessionManager, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[APRKStreamRenderingManager sharedInstance]( &OBJC_CLASS___APRKStreamRenderingManager,  "sharedInstance"));
  v5 = objc_alloc_init(&OBJC_CLASS___TVAirPlayLegacyReceiverDelegate);
  v6 = -[TVAirPlayAPRKManager initWithSessionManager:streamRenderingManager:legacyReceiverDelegate:]( self,  "initWithSessionManager:streamRenderingManager:legacyReceiverDelegate:",  v3,  v4,  v5);

  return v6;
}

- (TVAirPlayAPRKManager)initWithSessionManager:(id)a3 streamRenderingManager:(id)a4 legacyReceiverDelegate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___TVAirPlayAPRKManager;
  v12 = -[TVAirPlayAPRKManager init](&v17, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_sessionManager, a3);
    dispatch_queue_t v14 = dispatch_queue_create("com.apple.tvairplay.aprkmanagerdelegate", 0LL);
    delegateSerialQueue = v13->_delegateSerialQueue;
    v13->_delegateSerialQueue = (OS_dispatch_queue *)v14;

    objc_storeStrong((id *)&v13->_legacyReceiverDelegate, a5);
    -[TVAirPlayLegacyReceiverDelegate setEventSink:](v13->_legacyReceiverDelegate, "setEventSink:", v13);
    objc_storeStrong((id *)&v13->_streamRenderingManager, a4);
    [v10 setUsesHomeKitIntegration:1];
    [v10 setOptimizeAudioRenderingLatency:1];
    [v10 setDelegateQueue:v13->_delegateSerialQueue];
    [v10 setDelegate:v13];
    [v10 setSupportRemoteControl:1];
  }

  return v13;
}

- (void)startReceiverServer
{
  if (-[TVAirPlayAPRKManager started](self, "started"))
  {
    id v3 = sub_100004480();
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315138;
      id v11 = "-[TVAirPlayAPRKManager startReceiverServer]";
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%s: APRKStreamRenderingManager has already been started",  (uint8_t *)&v10,  0xCu);
    }
  }

  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVAirPlayAPRKManager streamRenderingManager](self, "streamRenderingManager"));
    int v6 = [v5 startReceiverServer];

    id v7 = sub_100004480();
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    id v9 = v8;
    if (v6)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_10001BB2C(v6, v9);
      }
    }

    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 136315138;
        id v11 = "-[TVAirPlayAPRKManager startReceiverServer]";
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s: APRKStreamRenderingManager successfully started",  (uint8_t *)&v10,  0xCu);
      }

      -[TVAirPlayAPRKManager setStarted:](self, "setStarted:", 1LL);
    }
  }

- (void)stopReceiverServer
{
  if (-[TVAirPlayAPRKManager started](self, "started"))
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVAirPlayAPRKManager streamRenderingManager](self, "streamRenderingManager"));
    [v3 stopReceiverServer];

    -[TVAirPlayAPRKManager setStarted:](self, "setStarted:", 0LL);
    id v4 = sub_100004480();
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315138;
      id v9 = "-[TVAirPlayAPRKManager stopReceiverServer]";
      int v6 = "%s: APRKStreamRenderingManager has been stopped";
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v8, 0xCu);
    }
  }

  else
  {
    id v7 = sub_100004480();
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315138;
      id v9 = "-[TVAirPlayAPRKManager stopReceiverServer]";
      int v6 = "%s: APRKStreamRenderingManager was never started";
      goto LABEL_6;
    }
  }
}

- (void)airPlayReceiverDelegate:(id)a3 postEvent:(id)a4 withInfo:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if (!+[NSThread isMainThread](&OBJC_CLASS___NSThread, "isMainThread"))
  {
    id v9 = sub_100004480();
    int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      sub_10001BBB8(v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_10000E1E0;
  v20[3] = &unk_100030D70;
  id v21 = v7;
  id v22 = v8;
  id v18 = v8;
  id v19 = v7;
  -[TVAirPlayAPRKManager _enqueueAsyncDelegateSerialQueueBlock:](self, "_enqueueAsyncDelegateSerialQueueBlock:", v20);
}

- (void)didStartStreamingWithRenderer:(id)a3
{
  id v4 = a3;
  id v5 = sub_100004480();
  int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v24 = 136315650;
    v25 = "-[TVAirPlayAPRKManager didStartStreamingWithRenderer:]";
    __int16 v26 = 2048;
    id v27 = v4;
    __int16 v28 = 2114;
    id v29 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s: Renderer streaming has started. {renderer_ptr=%p} {renderer=%{public}@}",  (uint8_t *)&v24,  0x20u);
  }

  if (v4)
  {
    [v4 setDelegate:self];
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    if ([v7 BOOLForKey:@"UseAPRKURLFlinging"])
    {
    }

    else
    {
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
      id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKey:@"UseAPRKURLFlinging"]);

      if (v18)
      {
        id v19 = sub_100004480();
        v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v24) = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Using TVAirPlay URL Flinging, setting Video V1 delegate",  (uint8_t *)&v24,  2u);
        }

        id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[TVAirPlayAPRKManager legacyReceiverDelegate](self, "legacyReceiverDelegate"));
        id v22 = (void *)objc_claimAutoreleasedReturnValue(-[TVAirPlayAPRKManager delegateSerialQueue](self, "delegateSerialQueue"));
        [v4 setVideoV1Delegate:v21 withDelegateQueue:v22];

        goto LABEL_15;
      }
    }

    id v23 = sub_100004480();
    id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v24) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Using APRK URL Flinging, skipping setting Video V1 Delegate",  (uint8_t *)&v24,  2u);
    }

- (void)didStopStreamingWithRenderer:(id)a3
{
  id v4 = a3;
  id v5 = sub_100004480();
  int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 136315650;
    v20 = "-[TVAirPlayAPRKManager didStopStreamingWithRenderer:]";
    __int16 v21 = 2048;
    id v22 = v4;
    __int16 v23 = 2114;
    id v24 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s: Renderer streaming has stopped. {renderer_ptr=%p} {renderer=%{public}@}",  (uint8_t *)&v19,  0x20u);
  }

  if (v4)
  {
    id v7 = (id)objc_claimAutoreleasedReturnValue(-[TVAirPlayAPRKManager activeRenderer](self, "activeRenderer"));

    if (v7 == v4)
    {
      id v8 = sub_100004480();
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = 136315138;
        v20 = "-[TVAirPlayAPRKManager didStopStreamingWithRenderer:]";
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s: The active renderer has been stopped. Will reset the renderer and deregister any active video session",  (uint8_t *)&v19,  0xCu);
      }

      -[TVAirPlayAPRKManager _deregisterActiveVideoSessionIfRequired](self, "_deregisterActiveVideoSessionIfRequired");
      -[TVAirPlayAPRKManager setActiveRenderer:](self, "setActiveRenderer:", 0LL);
    }

    [v4 setDelegate:0];
  }

  else
  {
    id v10 = sub_100004480();
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10001BC98(v11, v12, v13, v14, v15, v16, v17, v18);
    }
  }
}

- (void)shouldShowGlobalPasscodeWithString:(id)a3 withClientName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_100004480();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v17 = "-[TVAirPlayAPRKManager shouldShowGlobalPasscodeWithString:withClientName:]";
    __int16 v18 = 2114;
    id v19 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s: Received request to show global passcode. {clientName=%{public}@}",  buf,  0x16u);
  }

  id v10 = [v6 length];
  if (v7 && v10)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_10000E7AC;
    v13[3] = &unk_100030D98;
    uint64_t v14 = (os_log_s *)v7;
    id v15 = v6;
    -[TVAirPlayAPRKManager _performSessionManagerWorkOnMainQueueWithBlock:]( self,  "_performSessionManagerWorkOnMainQueueWithBlock:",  v13);

    uint64_t v11 = v14;
  }

  else
  {
    id v12 = sub_100004480();
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10001BD08(v6, (uint64_t)v7, v11);
    }
  }
}

- (void)shouldHideGlobalPasscode
{
  id v3 = sub_100004480();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "-[TVAirPlayAPRKManager shouldHideGlobalPasscode]";
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%s: Received request to hide global passcode",  (uint8_t *)&v5,  0xCu);
  }

  -[TVAirPlayAPRKManager _performSessionManagerWorkOnMainQueueWithBlock:]( self,  "_performSessionManagerWorkOnMainQueueWithBlock:",  &stru_100030DD8);
}

- (void)didChangeStreamRendererModeTo:(unint64_t)a3 forRenderer:(id)a4
{
  id v6 = a4;
  id v7 = sub_100004480();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    __int16 v23 = "-[TVAirPlayAPRKManager didChangeStreamRendererModeTo:forRenderer:]";
    __int16 v24 = 2048;
    unint64_t v25 = a3;
    __int16 v26 = 2048;
    id v27 = v6;
    __int16 v28 = 2114;
    id v29 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s: Renderer stream mode has changed. {mode=%lu} {renderer_ptr=%p} {renderer=%{public}@}",  buf,  0x2Au);
  }

  if (v6)
  {
    id v9 = (id)objc_claimAutoreleasedReturnValue(-[TVAirPlayAPRKManager activeRenderer](self, "activeRenderer"));

    if (v9 == v6)
    {
      -[TVAirPlayAPRKManager _deregisterActiveVideoSessionIfRequired](self, "_deregisterActiveVideoSessionIfRequired");
      -[TVAirPlayAPRKManager _updateNowPlayingForRenderer:](self, "_updateNowPlayingForRenderer:", v6);
      if (a3) {
        -[TVAirPlayAPRKManager setLastKnownRendererMode:](self, "setLastKnownRendererMode:", a3);
      }
      -[TVAirPlayAPRKManager _registerActiveVideoSessionIfRequiredForRenderer:]( self,  "_registerActiveVideoSessionIfRequiredForRenderer:",  v6);
      objc_initWeak((id *)buf, self);
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472LL;
      v19[2] = sub_10000EBAC;
      v19[3] = &unk_100030E00;
      objc_copyWeak(&v21, (id *)buf);
      id v20 = v6;
      dispatch_sync(&_dispatch_main_q, v19);

      objc_destroyWeak(&v21);
      objc_destroyWeak((id *)buf);
    }
  }

  else
  {
    id v10 = sub_100004480();
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10001BE54(v11, v12, v13, v14, v15, v16, v17, v18);
    }
  }
}

- (void)sessionDidReceiveUserStop:(id)a3
{
  id v4 = a3;
  if (!+[NSThread isMainThread](&OBJC_CLASS___NSThread, "isMainThread"))
  {
    id v5 = sub_100004480();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      sub_10001BEC4(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }

  -[TVAirPlayAPRKManager _onMainQueue_deregisterSession:](self, "_onMainQueue_deregisterSession:", v4);
}

- (void)setActiveRenderer:(id)a3
{
  id v5 = (APRKStreamRenderer *)a3;
  if (self->_activeRenderer != v5)
  {
    objc_storeStrong((id *)&self->_activeRenderer, a3);
    self->_lastKnownRendererMode = (unint64_t)-[APRKStreamRenderer streamRendererMode](v5, "streamRendererMode");
    objc_initWeak(&location, self);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10000ED48;
    block[3] = &unk_100030E00;
    objc_copyWeak(&v8, &location);
    uint64_t v7 = v5;
    dispatch_sync(&_dispatch_main_q, block);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

- (void)_performSessionManagerWorkOnMainQueueWithBlock:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000EE44;
  block[3] = &unk_100030E28;
  objc_copyWeak(&v8, &location);
  id v7 = v4;
  id v5 = v4;
  dispatch_sync(&_dispatch_main_q, block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_enqueueAsyncDelegateSerialQueueBlock:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[TVAirPlayAPRKManager delegateSerialQueue](self, "delegateSerialQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000EF80;
  block[3] = &unk_100030E28;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_stopAndClearActiveRenderer
{
  if (self->_activeRenderer)
  {
    id v3 = sub_100004480();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      activeRenderer = self->_activeRenderer;
      int v7 = 136315394;
      id v8 = "-[TVAirPlayAPRKManager _stopAndClearActiveRenderer]";
      __int16 v9 = 2114;
      uint64_t v10 = activeRenderer;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%s: Stopping and clearing active renderer: %{public}@",  (uint8_t *)&v7,  0x16u);
    }

    -[APRKStreamRenderer stop](self->_activeRenderer, "stop");
    id v6 = self->_activeRenderer;
    self->_activeRenderer = 0LL;
  }

- (void)_registerActiveVideoSessionIfRequiredForRenderer:(id)a3
{
  id v4 = a3;
  id v5 = sub_100004480();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = (void *)objc_claimAutoreleasedReturnValue([v4 managedClientName]);
    *(_DWORD *)buf = 136315906;
    id v19 = "-[TVAirPlayAPRKManager _registerActiveVideoSessionIfRequiredForRenderer:]";
    __int16 v20 = 2048;
    id v21 = v4;
    __int16 v22 = 2114;
    id v23 = v4;
    __int16 v24 = 2114;
    unint64_t v25 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s: Attempting to register a video session {renderer_ptr=%p} {renderer=%{public}@} {clientName=%{public}@}",  buf,  0x2Au);
  }

  if (objc_msgSend(v4, "tvap_requiresVideoSession"))
  {
    id v8 = -[TVAirPlayAPRKVideoSession initWithStreamRenderer:]( objc_alloc(&OBJC_CLASS___TVAirPlayAPRKVideoSession),  "initWithStreamRenderer:",  v4);
    -[TVAirPlayAPRKVideoSession setDelegate:](v8, "setDelegate:", self);
    id v9 = sub_100004480();
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v4 managedClientName]);
      *(_DWORD *)buf = 136316162;
      id v19 = "-[TVAirPlayAPRKManager _registerActiveVideoSessionIfRequiredForRenderer:]";
      __int16 v20 = 2048;
      id v21 = v4;
      __int16 v22 = 2114;
      id v23 = v4;
      __int16 v24 = 2114;
      unint64_t v25 = v11;
      __int16 v26 = 2114;
      id v27 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%s: Registering a video session for renderer {renderer_ptr=%p} {renderer=%{public}@} {clientName=%{public}@} {se ssion=%{public}@}",  buf,  0x34u);
    }

    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_10000F340;
    v15[3] = &unk_100030D98;
    uint64_t v16 = v8;
    id v17 = v4;
    uint64_t v12 = v8;
    -[TVAirPlayAPRKManager _performSessionManagerWorkOnMainQueueWithBlock:]( self,  "_performSessionManagerWorkOnMainQueueWithBlock:",  v15);
  }

  else
  {
    id v13 = sub_100004480();
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v4 managedClientName]);
      *(_DWORD *)buf = 136315906;
      id v19 = "-[TVAirPlayAPRKManager _registerActiveVideoSessionIfRequiredForRenderer:]";
      __int16 v20 = 2048;
      id v21 = v4;
      __int16 v22 = 2114;
      id v23 = v4;
      __int16 v24 = 2114;
      unint64_t v25 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%s: Render does not require a video session {renderer_ptr=%p} {renderer=%{public}@} {clientName=%{public}@}",  buf,  0x2Au);
    }
  }
}

- (void)_deregisterActiveVideoSessionIfRequired
{
}

- (void)_onMainQueue_registerGlobalPinSession:(id)a3 clientName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_100004480();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    id v17 = "-[TVAirPlayAPRKManager _onMainQueue_registerGlobalPinSession:clientName:]";
    __int16 v18 = 2114;
    id v19 = v7;
    __int16 v20 = 2114;
    id v21 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s: Registering global pin session {clientName=%{public}@} {session=%{public}@}",  buf,  0x20u);
  }

  objc_initWeak((id *)buf, self);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10000F7A0;
  v12[3] = &unk_100030E98;
  objc_copyWeak(&v15, (id *)buf);
  id v10 = v7;
  id v13 = v10;
  id v11 = v6;
  id v14 = v11;
  -[TVAirPlayAPRKManager _onMainQueue_registerSession:withCompletionHandler:]( self,  "_onMainQueue_registerSession:withCompletionHandler:",  v11,  v12);

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);
}

- (void)_onMainQueue_deregisterGlobalPinSession
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVAirPlayAPRKManager sessionManager](self, "sessionManager"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 APRKPinSession]);

  if (v4)
  {
    id v5 = sub_100004480();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315394;
      id v8 = "-[TVAirPlayAPRKManager _onMainQueue_deregisterGlobalPinSession]";
      __int16 v9 = 2114;
      id v10 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s: Deregistering global pin session: %{public}@",  (uint8_t *)&v7,  0x16u);
    }

    -[TVAirPlayAPRKManager _onMainQueue_deregisterSession:](self, "_onMainQueue_deregisterSession:", v4);
  }
}

- (void)_onMainQueue_registerSession:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [v7 setDelegate:self];
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[TVAirPlayAPRKManager sessionManager](self, "sessionManager"));
  [v8 registerSession:v7 withCompletionHandler:v6];
}

- (void)_onMainQueue_deregisterSession:(id)a3
{
  id v4 = a3;
  [v4 setDelegate:0];
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVAirPlayAPRKManager sessionManager](self, "sessionManager"));
  [v5 deregisterSession:v4 options:0];
}

- (BOOL)started
{
  return self->_started;
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (APRKStreamRenderer)activeRenderer
{
  return self->_activeRenderer;
}

- (OS_dispatch_queue)delegateSerialQueue
{
  return self->_delegateSerialQueue;
}

- (void)setDelegateSerialQueue:(id)a3
{
}

- (APRKStreamRenderingManager)streamRenderingManager
{
  return self->_streamRenderingManager;
}

- (void)setStreamRenderingManager:(id)a3
{
}

- (TVAirPlaySessionManager)sessionManager
{
  return self->_sessionManager;
}

- (void)setSessionManager:(id)a3
{
}

- (TVAirPlayLegacyReceiverDelegate)legacyReceiverDelegate
{
  return self->_legacyReceiverDelegate;
}

- (void)setLegacyReceiverDelegate:(id)a3
{
}

- (unint64_t)lastKnownRendererMode
{
  return self->_lastKnownRendererMode;
}

- (void)setLastKnownRendererMode:(unint64_t)a3
{
  self->_lastKnownRendererMode = a3;
}

- (TVAirPlayAPRKManagerDelegate)managerDelegate
{
  return (TVAirPlayAPRKManagerDelegate *)objc_loadWeakRetained((id *)&self->_managerDelegate);
}

- (void)setManagerDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end