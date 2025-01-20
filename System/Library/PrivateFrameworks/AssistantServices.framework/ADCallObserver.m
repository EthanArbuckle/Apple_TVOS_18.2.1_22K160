@interface ADCallObserver
- (ADCallObserver)init;
- (BOOL)isDropInCall;
- (BOOL)isOnSpeaker;
- (unint64_t)currentCallState;
- (void)_callStateChanged:(id)a3;
- (void)_handleCallStateDidChangeTo:(unint64_t)a3 isDropInCallDidChange:(BOOL)a4;
- (void)_handleOnSpeakerDidChangeTo:(BOOL)a3;
- (void)_registerForDropInCallbacks;
- (void)notifyObserver:(id)a3 didReceiveNotificationWithToken:(int)a4;
- (void)routesChangedForRouteController:(id)a3;
- (void)startObservingCallStateWithDelegate:(id)a3;
- (void)stopObservingCallStateWithCompletion:(id)a3;
@end

@implementation ADCallObserver

- (ADCallObserver)init
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___ADCallObserver;
  v2 = -[ADCallObserver init](&v12, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("Call Observer Queue", v4);

    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v5;

    v2->_currentCallState = 0LL;
    *(_WORD *)&v2->_onSpeaker = 0;
    v7 = objc_alloc(&OBJC_CLASS___AFNotifyObserver);
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "com.apple.telephonyutilities.callservicesdaemon.connectionrequest"));
    v9 = -[AFNotifyObserver initWithName:options:queue:delegate:]( v7,  "initWithName:options:queue:delegate:",  v8,  0LL,  v2->_serialQueue,  v2);
    csdConnectionObserver = v2->_csdConnectionObserver;
    v2->_csdConnectionObserver = v9;
  }

  return v2;
}

- (void)_callStateChanged:(id)a3
{
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000E7274;
  block[3] = &unk_1004FD940;
  block[4] = self;
  dispatch_async(serialQueue, block);
}

- (void)startObservingCallStateWithDelegate:(id)a3
{
  id v4 = a3;
  char v5 = AFHasCellularTelephony();
  if (AFCanProxyTelephony())
  {
    v6 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v11 = "-[ADCallObserver startObservingCallStateWithDelegate:]";
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "%s Device can receive incoming calls by proxy",  buf,  0xCu);
    }

    goto LABEL_5;
  }

  if ((v5 & 1) != 0)
  {
LABEL_5:
    objc_storeWeak((id *)&self->_delegate, v4);
    if (!self->_isObserving)
    {
      self->_isObserving = 1;
      serialQueue = (dispatch_queue_s *)self->_serialQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1000E7060;
      block[3] = &unk_1004FD940;
      block[4] = self;
      dispatch_async(serialQueue, block);
    }

    goto LABEL_9;
  }

  v8 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "-[ADCallObserver startObservingCallStateWithDelegate:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s Not observing call state", buf, 0xCu);
  }

- (void)_registerForDropInCallbacks
{
  conversationProviderManager = self->_conversationProviderManager;
  if (!conversationProviderManager)
  {
    id v4 = objc_alloc_init(&OBJC_CLASS___TUConversationProviderManager);
    char v5 = self->_conversationProviderManager;
    self->_conversationProviderManager = v4;

    conversationProviderManager = self->_conversationProviderManager;
  }

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000E6F2C;
  v6[3] = &unk_1004FBD90;
  v6[4] = self;
  -[TUConversationProviderManager registerForCallbacksForProvider:completionHandler:]( conversationProviderManager,  "registerForCallbacksForProvider:completionHandler:",  @"com.apple.private.alloy.dropin.communication",  v6);
}

- (void)stopObservingCallStateWithCompletion:(id)a3
{
  id v4 = (void (**)(void))a3;
  char v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v10 = "-[ADCallObserver stopObservingCallStateWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  objc_storeWeak((id *)&self->_delegate, 0LL);
  if (self->_isObserving)
  {
    self->_isObserving = 0;
    serialQueue = (dispatch_queue_s *)self->_serialQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000E6E28;
    block[3] = &unk_1004FD940;
    block[4] = self;
    dispatch_async(serialQueue, block);
  }

  -[AFNotifyObserver invalidate](self->_csdConnectionObserver, "invalidate");
  csdConnectionObserver = self->_csdConnectionObserver;
  self->_csdConnectionObserver = 0LL;

  if (v4) {
    v4[2](v4);
  }
}

- (void)_handleCallStateDidChangeTo:(unint64_t)a3 isDropInCallDidChange:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t Names = AFCallStateGetNames(a3, a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue(Names);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 componentsJoinedByString:@"|"]);

  uint64_t v11 = AFCallStateGetNames(self->_currentCallState, v10);
  objc_super v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 componentsJoinedByString:@"|"]);

  v14 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v32 = 136315650;
    v33 = "-[ADCallObserver _handleCallStateDidChangeTo:isDropInCallDidChange:]";
    __int16 v34 = 2112;
    v35 = v9;
    __int16 v36 = 2112;
    v37 = v13;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEBUG,  "%s #callstate _handleCallStateDidChangeTo: %@ from: %@",  (uint8_t *)&v32,  0x20u);
  }

  if (self->_currentCallState != a3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v16 = objc_opt_respondsToSelector(WeakRetained, "callObserver:callStateDidChangeFrom:to:isDropInCallDidChangeTo:");

    if ((v16 & 1) != 0)
    {
      id v17 = objc_loadWeakRetained((id *)&self->_delegate);
      [v17 callObserver:self callStateDidChangeFrom:self->_currentCallState to:a3 isDropInCallDidChangeTo:v4];
    }

    self->_isDropInCall = v4;
    id v18 = objc_loadWeakRetained((id *)&self->_delegate);
    char v19 = objc_opt_respondsToSelector(v18, "callObserver:callStateDidChangeFrom:to:");

    if ((v19 & 1) != 0)
    {
      id v20 = objc_loadWeakRetained((id *)&self->_delegate);
      [v20 callObserver:self callStateDidChangeFrom:self->_currentCallState to:a3];
    }

    id v21 = objc_loadWeakRetained((id *)&self->_delegate);
    char v22 = objc_opt_respondsToSelector(v21, "adCallStateChangedCallInProcess:");

    if ((v22 & 1) != 0)
    {
      int v25 = AFIsHorseman(v23, v24);
      uint64_t v26 = 7LL;
      if (v25) {
        uint64_t v26 = 3LL;
      }
      BOOL v27 = (v26 & a3) != 0;
      id v28 = objc_loadWeakRetained((id *)&self->_delegate);
      [v28 adCallStateChangedCallInProcess:v27];
    }

    id v29 = objc_loadWeakRetained((id *)&self->_delegate);
    char v30 = objc_opt_respondsToSelector(v29, "adCallStateChangedCallIncoming:");

    if ((v30 & 1) != 0)
    {
      id v31 = objc_loadWeakRetained((id *)&self->_delegate);
      [v31 adCallStateChangedCallIncoming:(a3 >> 2) & 1];
    }

    self->_currentCallState = a3;
  }
}

- (BOOL)isOnSpeaker
{
  return self->_onSpeaker;
}

- (unint64_t)currentCallState
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  uint64_t v9 = 0LL;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000E6E14;
  v5[3] = &unk_1004FCDB0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isDropInCall
{
  return self->_isDropInCall;
}

- (void)_handleOnSpeakerDidChangeTo:(BOOL)a3
{
  BOOL v3 = a3;
  char v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 136315394;
    uint64_t v10 = "-[ADCallObserver _handleOnSpeakerDidChangeTo:]";
    __int16 v11 = 1024;
    BOOL v12 = v3;
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s %d", (uint8_t *)&v9, 0x12u);
  }

  if (self->_onSpeaker != v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v7 = objc_opt_respondsToSelector(WeakRetained, "callObserver:onSpeakerDidChange:");

    if ((v7 & 1) != 0)
    {
      id v8 = objc_loadWeakRetained((id *)&self->_delegate);
      [v8 callObserver:self onSpeakerDidChange:v3];
    }

    self->_onSpeaker = v3;
  }

- (void)routesChangedForRouteController:(id)a3
{
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([a3 pickedRoute]);
  id v5 = [v4 isSpeaker];

  if (self->_onSpeaker != (_DWORD)v5)
  {
    uint64_t v6 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v7 = 136315394;
      id v8 = "-[ADCallObserver routesChangedForRouteController:]";
      __int16 v9 = 1024;
      int v10 = (int)v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s onSpeaker: %d", (uint8_t *)&v7, 0x12u);
    }

    -[ADCallObserver _handleOnSpeakerDidChangeTo:](self, "_handleOnSpeakerDidChangeTo:", v5);
  }

- (void)notifyObserver:(id)a3 didReceiveNotificationWithToken:(int)a4
{
  id v5 = (AFNotifyObserver *)a3;
  if (self->_csdConnectionObserver == v5)
  {
    uint64_t v6 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      int v7 = 136315138;
      id v8 = "-[ADCallObserver notifyObserver:didReceiveNotificationWithToken:]";
      _os_log_debug_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "%s Received CSD XPC connection notification. Re-registering for drop-in calls",  (uint8_t *)&v7,  0xCu);
    }

    -[ADCallObserver _registerForDropInCallbacks](self, "_registerForDropInCallbacks");
  }
}

- (void).cxx_destruct
{
}

@end