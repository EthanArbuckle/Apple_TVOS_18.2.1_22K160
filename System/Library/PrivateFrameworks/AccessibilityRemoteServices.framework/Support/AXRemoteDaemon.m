@interface AXRemoteDaemon
+ (id)sharedInstance;
- (AXDispatchTimer)transactionTimeoutTimer;
- (AXRDeviceRemoteScrollAccumulator)scrollAccumulator;
- (AXRemoteReceiver)receiver;
- (NSNumber)previousVoiceOverEnabledState;
- (OS_os_transaction)transaction;
- (id)_init;
- (id)remoteReceiver:(id)a3 connectingDevice:(id)a4 setupConnection:(BOOL)a5 withOptions:(id)a6;
- (void)_cancelTransactionIfNecessary;
- (void)_notifyUserEventOccured;
- (void)_resetTransactionTimer;
- (void)_sendScrollEventWithScrollAmount:(int64_t)a3;
- (void)remoteReceiver:(id)a3 didActivateWithError:(id)a4;
- (void)remoteReceiver:(id)a3 didReceivePayload:(id)a4 withOptions:(id)a5;
- (void)remoteReceiverDidDisconnect:(id)a3;
- (void)run;
- (void)scrollAccumulator:(id)a3 didAccumulateScrollInDirection:(int64_t)a4;
- (void)setPreviousVoiceOverEnabledState:(id)a3;
- (void)setReceiver:(id)a3;
- (void)setScrollAccumulator:(id)a3;
- (void)setTransaction:(id)a3;
- (void)setTransactionTimeoutTimer:(id)a3;
- (void)startXPCService;
@end

@implementation AXRemoteDaemon

+ (id)sharedInstance
{
  if (qword_10000CCE0 != -1) {
    dispatch_once(&qword_10000CCE0, &stru_100008598);
  }
  return (id)qword_10000CCD8;
}

- (id)_init
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___AXRemoteDaemon;
  v2 = -[AXRemoteDaemon init](&v16, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_attr_t v5 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_USER_INTERACTIVE, 0);
    v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v5);

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.accessibility.axremoted.eventReceiverQueue", v6);
    receiverQueue = v2->_receiverQueue;
    v2->_receiverQueue = (OS_dispatch_queue *)v7;

    v9 = objc_alloc(&OBJC_CLASS___AXRemoteReceiver);
    v10 = -[AXRemoteReceiver initWithEventID:delegate:](v9, "initWithEventID:delegate:", AXDefaultRemoteEventID, v2);
    -[AXRemoteDaemon setReceiver:](v2, "setReceiver:", v10);

    v11 = -[AXDispatchTimer initWithTargetSerialQueue:]( objc_alloc(&OBJC_CLASS___AXDispatchTimer),  "initWithTargetSerialQueue:",  &_dispatch_main_q);
    -[AXRemoteDaemon setTransactionTimeoutTimer:](v2, "setTransactionTimeoutTimer:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[AXRemoteDaemon transactionTimeoutTimer](v2, "transactionTimeoutTimer"));
    [v12 setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:1];

    v13 = objc_opt_new(&OBJC_CLASS___AXRDeviceRemoteScrollAccumulator);
    -[AXRemoteDaemon setScrollAccumulator:](v2, "setScrollAccumulator:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[AXRemoteDaemon scrollAccumulator](v2, "scrollAccumulator"));
    [v14 setDelegate:v2];
  }

  return v2;
}

- (void)run
{
  uint64_t v3 = ax_remote_daemon_log(self, a2);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)dispatch_queue_attr_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Running AXRemoteDaemon", v5, 2u);
  }

  -[AXRemoteDaemon startXPCService](self, "startXPCService");
}

- (void)startXPCService
{
  uint64_t v3 = ax_remote_daemon_log(self, a2);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Starting up Rapport XPC event listener",  buf,  2u);
  }

  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_100002E50;
  handler[3] = &unk_1000085C0;
  handler[4] = self;
  xpc_set_event_stream_handler("com.apple.rapport.matching", &_dispatch_main_q, handler);
}

- (void)_resetTransactionTimer
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_100002F64;
  v2[3] = &unk_100008610;
  v2[4] = self;
  AXPerformBlockOnMainThread(v2, a2);
}

- (void)_cancelTransactionIfNecessary
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[AXRemoteDaemon transaction](self, "transaction"));

  if (v3)
  {
    uint64_t v6 = ax_remote_daemon_log(v4, v5);
    dispatch_queue_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "clearing os_transaction", buf, 2u);
    }

    -[AXRemoteDaemon setTransaction:](self, "setTransaction:", 0LL);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[AXRemoteDaemon previousVoiceOverEnabledState](self, "previousVoiceOverEnabledState"));

  if (v8)
  {
    uint64_t v11 = ax_remote_daemon_log(v9, v10);
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "resetting VoiceOver state", v14, 2u);
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[AXRemoteDaemon previousVoiceOverEnabledState](self, "previousVoiceOverEnabledState"));
    _AXSVoiceOverTouchSetEnabled([v13 BOOLValue]);

    -[AXRemoteDaemon setPreviousVoiceOverEnabledState:](self, "setPreviousVoiceOverEnabledState:", 0LL);
  }

- (void)_notifyUserEventOccured
{
  if ((AXDeviceIsAudioAccessory(self, a2) & 1) == 0)
  {
    id v2 = (id)objc_claimAutoreleasedReturnValue(+[AXUserEventTimer sharedInstance](&OBJC_CLASS___AXUserEventTimer, "sharedInstance"));
    [v2 userEventOccurred];
  }

- (void)_sendScrollEventWithScrollAmount:(int64_t)a3
{
  id v5 = objc_alloc_init(&OBJC_CLASS___AXEventRepresentation);
  [v5 setType:1100];
  [v5 setScrollAmount:a3];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[AXEventTapManager sharedManager](&OBJC_CLASS___AXEventTapManager, "sharedManager"));
  [v4 sendHIDSystemEvent:v5 senderID:0x8000000817319384];
}

- (void)scrollAccumulator:(id)a3 didAccumulateScrollInDirection:(int64_t)a4
{
  id v6 = a3;
  if (a4 == 2)
  {
    id v12 = v6;
    if (AXDeviceIsTV())
    {
      dispatch_queue_t v7 = self;
      uint64_t v8 = -1LL;
      goto LABEL_7;
    }

    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[AXRDeviceRemoteActionHelper sharedInstance]( &OBJC_CLASS___AXRDeviceRemoteActionHelper,  "sharedInstance"));
    uint64_t v10 = v9;
    uint64_t v11 = &AXRDeviceRemoteActionMediaVolumeDown;
LABEL_10:
    [v9 performAction:*v11];

    goto LABEL_11;
  }

  if (a4 == 1)
  {
    id v12 = v6;
    if (AXDeviceIsTV())
    {
      dispatch_queue_t v7 = self;
      uint64_t v8 = 1LL;
LABEL_7:
      -[AXRemoteDaemon _sendScrollEventWithScrollAmount:](v7, "_sendScrollEventWithScrollAmount:", v8);
LABEL_11:
      id v6 = v12;
      goto LABEL_12;
    }

    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[AXRDeviceRemoteActionHelper sharedInstance]( &OBJC_CLASS___AXRDeviceRemoteActionHelper,  "sharedInstance"));
    uint64_t v10 = v9;
    uint64_t v11 = &AXRDeviceRemoteActionMediaVolumeUp;
    goto LABEL_10;
  }

- (void)remoteReceiver:(id)a3 didActivateWithError:(id)a4
{
  id v5 = a4;
  uint64_t v7 = ax_remote_daemon_log(v5, v6);
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v9 = 138412290;
    id v10 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "remote receiver did activate with error: %@",  (uint8_t *)&v9,  0xCu);
  }

  -[AXRemoteDaemon _resetTransactionTimer](self, "_resetTransactionTimer");
}

- (id)remoteReceiver:(id)a3 connectingDevice:(id)a4 setupConnection:(BOOL)a5 withOptions:(id)a6
{
  BOOL v6 = a5;
  id v9 = a6;
  id v10 = a4;
  if (v6)
  {
    uint64_t v11 = AXRLocalizedStringForKey(@"REMOTE_DEVICE_CONNECTED");
    id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:AXRDeviceRequestsVoiceOverEnabledKey]);
    unsigned int v14 = [v13 BOOLValue];

    if (v14)
    {
      uint64_t v15 = _AXSVoiceOverTouchEnabled();
      if (!(_DWORD)v15)
      {
        uint64_t v17 = ax_remote_daemon_log(v15, v16);
        v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "enabling VoiceOver due to remote request",  buf,  2u);
        }

        v19 = +[NSNumber numberWithUnsignedChar:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedChar:",  _AXSVoiceOverTouchEnabled());
        v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
        -[AXRemoteDaemon setPreviousVoiceOverEnabledState:](self, "setPreviousVoiceOverEnabledState:", v20);

        _AXSVoiceOverTouchSetEnabled(1LL);
        _AXSVoiceOverTouchSetUsageConfirmed(1LL);
        uint64_t v21 = AXRLocalizedStringForKey(@"REMOTE_DEVICE_CONNECTED_WITH_VOICEOVER");
        uint64_t v22 = objc_claimAutoreleasedReturnValue(v21);

        id v12 = (void *)v22;
      }
    }

    else {
      uint64_t v23 = 2LL * (_AXSAssistiveTouchScannerEnabled() != 0);
    }
    v39[0] = AXRDeviceRemoteActionsPayloadKey;
    uint64_t v27 = AXRDeviceRemoteActionsPayloadForCurrentDevice();
    v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    v40[0] = v28;
    v39[1] = AXRDeviceRemoteActionsDeviceTypeKey;
    v29 = +[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", AXDeviceGetType(v28));
    v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
    v40[1] = v30;
    v39[2] = AXRDeviceContextTypeKey;
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v23));
    v40[2] = v31;
    v39[3] = AXRHandGestureCustomizedActionsKey;
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    v33 = (void *)objc_claimAutoreleasedReturnValue([v32 remoteHandGestureCustomizedActions]);
    v40[3] = v33;
    v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v40,  v39,  4LL));

    v34 = (void *)objc_claimAutoreleasedReturnValue(+[AXSystemAppServer server](&OBJC_CLASS___AXSystemAppServer, "server"));
    [v34 wakeUpDeviceIfNecessary];

    -[AXRemoteDaemon _notifyUserEventOccured](self, "_notifyUserEventOccured");
  }

  else
  {
    uint64_t v24 = AXRLocalizedStringForKey(@"REMOTE_DEVICE_DISCONNECTED");
    id v12 = (void *)objc_claimAutoreleasedReturnValue(v24);
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472LL;
    v37[2] = sub_100003794;
    v37[3] = &unk_100008610;
    v37[4] = self;
    AXPerformBlockOnMainThread(v37, v25);
    v26 = 0LL;
  }

  v35 = (void *)objc_claimAutoreleasedReturnValue(+[AXBannerServices sharedInstance](&OBJC_CLASS___AXBannerServices, "sharedInstance"));
  [v35 presentBannerWithTitle:v10 message:v12 duration:3.0];

  return v26;
}

- (void)remoteReceiverDidDisconnect:(id)a3
{
  uint64_t v4 = ax_remote_daemon_log(self, a2);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "remote receiver did disconnect", buf, 2u);
  }

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10000383C;
  v7[3] = &unk_100008610;
  v7[4] = self;
  AXPerformBlockOnMainThread(v7, v6);
}

- (void)remoteReceiver:(id)a3 didReceivePayload:(id)a4 withOptions:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v10 = ax_remote_daemon_log(v8, v9);
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_10000538C((uint64_t)v7, (uint64_t)v8, v11);
  }

  receiverQueue = (dispatch_queue_s *)self->_receiverQueue;
  unsigned int v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472LL;
  uint64_t v16 = sub_100003914;
  uint64_t v17 = &unk_100008658;
  id v18 = v7;
  v19 = self;
  id v13 = v7;
  dispatch_async(receiverQueue, &v14);
  -[AXRemoteDaemon _resetTransactionTimer](self, "_resetTransactionTimer", v14, v15, v16, v17);
}

- (NSNumber)previousVoiceOverEnabledState
{
  return self->_previousVoiceOverEnabledState;
}

- (void)setPreviousVoiceOverEnabledState:(id)a3
{
}

- (AXRemoteReceiver)receiver
{
  return self->_receiver;
}

- (void)setReceiver:(id)a3
{
}

- (AXRDeviceRemoteScrollAccumulator)scrollAccumulator
{
  return self->_scrollAccumulator;
}

- (void)setScrollAccumulator:(id)a3
{
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
}

- (AXDispatchTimer)transactionTimeoutTimer
{
  return self->_transactionTimeoutTimer;
}

- (void)setTransactionTimeoutTimer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end