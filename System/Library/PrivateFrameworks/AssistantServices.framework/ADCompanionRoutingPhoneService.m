@interface ADCompanionRoutingPhoneService
+ (id)_contactForCall:(id)a3;
+ (id)_incomingCallTypeForService:(int)a3;
+ (id)_personAttributeForCall:(id)a3;
+ (id)_personForCall:(id)a3;
- (ADCompanionRoutingPhoneService)init;
- (BOOL)implementsCommand:(id)a3 forDomain:(id)a4;
- (id)_hangUpCurrentCall;
- (id)commandsForDomain:(id)a3;
- (id)domains;
- (void)_addTimer:(id)a3;
- (void)_answerHandler:(id)a3 completion:(id)a4;
- (void)_handleMessage:(id)a3 messageType:(id)a4 fromDeviceWithIdentifier:(id)a5 completion:(id)a6;
- (void)_hangUpHandler:(id)a3 completion:(id)a4;
- (void)_incomingCallSearchHandler:(id)a3 completion:(id)a4;
- (void)_removeTimer:(id)a3;
- (void)_unhandledCommand:(id)a3 completion:(id)a4;
- (void)handleCommand:(id)a3 forDomain:(id)a4 executionContext:(id)a5 reply:(id)a6;
- (void)handleMessage:(id)a3 messageType:(id)a4 fromDeviceWithIdentifier:(id)a5 completion:(id)a6;
@end

@implementation ADCompanionRoutingPhoneService

- (ADCompanionRoutingPhoneService)init
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___ADCompanionRoutingPhoneService;
  v2 = -[ADCompanionRoutingPhoneService init](&v12, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("Local Phone Service Queue", v4);

    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v5;

    v7 = (objc_class *)objc_opt_class(v2);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    -[ADService setIdentifier:](v2, "setIdentifier:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[ADCompanionService sharedInstance](&OBJC_CLASS___ADCompanionService, "sharedInstance"));
    [v10 setMessageHandler:v2 forMessageType:@"phone"];
  }

  return v2;
}

- (id)domains
{
  uint64_t v3 = SAPhoneGroupIdentifier;
  return (id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v3,  1LL));
}

- (id)commandsForDomain:(id)a3
{
  if ([a3 isEqualToString:SAPhoneGroupIdentifier])
  {
    v5[0] = SAPhoneAnswerClassIdentifier;
    v5[1] = SAPhoneHangUpClassIdentifier;
    v5[2] = SAPhoneIncomingCallSearchClassIdentifier;
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v5, 3LL));
  }

  else
  {
    uint64_t v3 = 0LL;
  }

  return v3;
}

- (BOOL)implementsCommand:(id)a3 forDomain:(id)a4
{
  return 1;
}

- (void)handleCommand:(id)a3 forDomain:(id)a4 executionContext:(id)a5 reply:(id)a6
{
  id v8 = a3;
  id v9 = a6;
  v10 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    v11 = v10;
    objc_super v12 = (void *)objc_claimAutoreleasedReturnValue([v8 encodedClassName]);
    v13 = (void *)objc_claimAutoreleasedReturnValue([v8 groupIdentifier]);
    *(_DWORD *)buf = 136315650;
    v22 = "-[ADCompanionRoutingPhoneService handleCommand:forDomain:executionContext:reply:]";
    __int16 v23 = 2112;
    v24 = v12;
    __int16 v25 = 2112;
    v26 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "%s Handling command (%@) for domain (%@)",  buf,  0x20u);
  }

  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10021F53C;
  block[3] = &unk_1004FD9E0;
  id v18 = v8;
  v19 = self;
  id v20 = v9;
  id v15 = v9;
  id v16 = v8;
  dispatch_async(serialQueue, block);
}

- (void)_answerHandler:(id)a3 completion:(id)a4
{
  dispatch_queue_t v5 = (void (**)(id, SACommandSucceeded *, void))a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[TUCallCenter callCenterWithQueue:]( &OBJC_CLASS___TUCallCenter,  "callCenterWithQueue:",  self->_serialQueue));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 incomingCall]);
  if (v7)
  {
    id v8 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v12 = 136315138;
      v13 = "-[ADCompanionRoutingPhoneService _answerHandler:completion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "%s An incoming call exists. Answering it and returning success",  (uint8_t *)&v12,  0xCu);
    }

    [v6 answerCall:v7];
    id v9 = objc_alloc_init(&OBJC_CLASS___SACommandSucceeded);
    if (v5) {
      goto LABEL_5;
    }
  }

  else
  {
    id v9 = objc_alloc_init(&OBJC_CLASS___SACommandFailed);
    v10 = (void *)objc_claimAutoreleasedReturnValue([v6 incomingVideoCall]);

    if (v10)
    {
      -[SACommandSucceeded setErrorCode:](v9, "setErrorCode:", SAPhoneAnswerVideoCallErrorCode);
      v11 = @"Unable to answer video calls";
    }

    else
    {
      v11 = @"No call to answer";
    }

    -[SACommandSucceeded setReason:](v9, "setReason:", v11);
    if (v5) {
LABEL_5:
    }
      v5[2](v5, v9, 0LL);
  }
}

- (void)_hangUpHandler:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[ADCompanionRoutingPhoneService _hangUpCurrentCall](self, "_hangUpCurrentCall"));
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___SACommandFailed);
  if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
  {
    v10 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "-[ADCompanionRoutingPhoneService _hangUpHandler:completion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%s Attempting to message Stereo Partner...",  (uint8_t *)&buf,  0xCu);
    }

    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v32 = 0x3042000000LL;
    v33 = sub_10021F0BC;
    v34 = sub_10021F0C8;
    id v35 = 0LL;
    v11 = objc_alloc(&OBJC_CLASS___AFWatchdogTimer);
    serialQueue = self->_serialQueue;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_10021F0D0;
    v23[3] = &unk_1004F6D58;
    id v24 = v6;
    __int16 v25 = self;
    p___int128 buf = &buf;
    id v13 = v7;
    id v27 = v13;
    id v14 = v8;
    id v26 = v14;
    id v15 = -[AFWatchdogTimer initWithTimeoutInterval:onQueue:timeoutHandler:]( v11,  "initWithTimeoutInterval:onQueue:timeoutHandler:",  serialQueue,  v23,  10.0);
    objc_storeWeak((id *)(*((void *)&buf + 1) + 40LL), v15);
    -[ADCompanionRoutingPhoneService _addTimer:](self, "_addTimer:", v15);
    -[AFWatchdogTimer start](v15, "start");
    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[ADCompanionService sharedInstance](&OBJC_CLASS___ADCompanionService, "sharedInstance"));
    v29 = @"cmd";
    v30 = @"hangup";
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v30,  &v29,  1LL));
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_10021F1D4;
    v19[3] = &unk_1004F7220;
    v19[4] = self;
    id v18 = v15;
    id v20 = v18;
    id v21 = v14;
    id v22 = v13;
    [v16 sendStereoPartnerMessage:v17 messageType:@"phone" completion:v19];

    _Block_object_dispose(&buf, 8);
    objc_destroyWeak(&v35);
  }

  else if (v7)
  {
    (*((void (**)(id, void *, void))v7 + 2))(v7, v8, 0LL);
  }
}

- (id)_hangUpCurrentCall
{
  uint64_t v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315138;
    v37 = "-[ADCompanionRoutingPhoneService _hangUpCurrentCall]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue( +[TUCallCenter callCenterWithQueue:]( &OBJC_CLASS___TUCallCenter,  "callCenterWithQueue:",  self->_serialQueue));
  dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 audioOrVideoCallWithStatus:3]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 audioAndVideoCallsWithStatus:4]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 audioAndVideoCallsWithStatus:1]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 audioAndVideoCallsWithStatus:2]);
  if (v5)
  {
    [v4 disconnectCurrentCallAndActivateHeld];
    uint64_t v9 = objc_alloc_init(&OBJC_CLASS___SAPhoneHangUpResponse);
    -[SACommandFailed setPhoneHangUpCallType:](v9, "setPhoneHangUpCallType:", SAPhoneHangUpCallTypeOUTGOINGValue);
    v10 = (void *)objc_claimAutoreleasedReturnValue([v4 callsWithStatus:1]);
    -[SACommandFailed setActiveCallRemaining:](v9, "setActiveCallRemaining:", [v10 count] != 0);

    v11 = (void *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v12 = v11;
      unsigned int v13 = -[SACommandFailed activeCallRemaining](v9, "activeCallRemaining");
      *(_DWORD *)__int128 buf = 136315394;
      v37 = "-[ADCompanionRoutingPhoneService _hangUpCurrentCall]";
      __int16 v38 = 1024;
      unsigned int v39 = v13;
      id v14 = "%s Outgoing call hung up. Active call remains: %d";
LABEL_22:
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, v14, buf, 0x12u);
    }
  }

  else if ([v6 count])
  {
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    id v15 = v6;
    id v16 = [v15 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v32;
      do
      {
        for (i = 0LL; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v32 != v18) {
            objc_enumerationMutation(v15);
          }
          objc_msgSend( v4,  "disconnectCall:withReason:",  *(void *)(*((void *)&v31 + 1) + 8 * (void)i),  2,  (void)v31);
        }

        id v17 = [v15 countByEnumeratingWithState:&v31 objects:v35 count:16];
      }

      while (v17);
    }

    uint64_t v9 = objc_alloc_init(&OBJC_CLASS___SAPhoneHangUpResponse);
    -[SACommandFailed setPhoneHangUpCallType:](v9, "setPhoneHangUpCallType:", SAPhoneHangUpCallTypeINCOMINGValue);
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v4 callsWithStatus:1]);
    -[SACommandFailed setActiveCallRemaining:](v9, "setActiveCallRemaining:", [v20 count] != 0);

    id v21 = (void *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v12 = v21;
      unsigned int v22 = -[SACommandFailed activeCallRemaining](v9, "activeCallRemaining");
      *(_DWORD *)__int128 buf = 136315394;
      v37 = "-[ADCompanionRoutingPhoneService _hangUpCurrentCall]";
      __int16 v38 = 1024;
      unsigned int v39 = v22;
      id v14 = "%s Outgoing call hung up. Active call remains: %d";
      goto LABEL_22;
    }
  }

  else if ([v7 count])
  {
    [v4 disconnectCurrentCallAndActivateHeld];
    uint64_t v9 = objc_alloc_init(&OBJC_CLASS___SAPhoneHangUpResponse);
    -[SACommandFailed setPhoneHangUpCallType:](v9, "setPhoneHangUpCallType:", SAPhoneHangUpCallTypeACTIVEValue);
    __int16 v23 = (void *)objc_claimAutoreleasedReturnValue([v4 callsWithStatus:1]);
    -[SACommandFailed setActiveCallRemaining:](v9, "setActiveCallRemaining:", [v23 count] != 0);

    id v24 = (void *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v12 = v24;
      unsigned int v25 = -[SACommandFailed activeCallRemaining](v9, "activeCallRemaining");
      *(_DWORD *)__int128 buf = 136315394;
      v37 = "-[ADCompanionRoutingPhoneService _hangUpCurrentCall]";
      __int16 v38 = 1024;
      unsigned int v39 = v25;
      id v14 = "%s Active call hung up. Active call remains: %d";
      goto LABEL_22;
    }
  }

  else if ([v8 count])
  {
    [v4 disconnectCurrentCallAndActivateHeld];
    uint64_t v9 = objc_alloc_init(&OBJC_CLASS___SAPhoneHangUpResponse);
    -[SACommandFailed setPhoneHangUpCallType:](v9, "setPhoneHangUpCallType:", SAPhoneHangUpCallTypeHELDValue);
    id v26 = (void *)objc_claimAutoreleasedReturnValue([v4 callsWithStatus:1]);
    -[SACommandFailed setActiveCallRemaining:](v9, "setActiveCallRemaining:", [v26 count] != 0);

    id v27 = (void *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v12 = v27;
      unsigned int v28 = -[SACommandFailed activeCallRemaining](v9, "activeCallRemaining");
      *(_DWORD *)__int128 buf = 136315394;
      v37 = "-[ADCompanionRoutingPhoneService _hangUpCurrentCall]";
      __int16 v38 = 1024;
      unsigned int v39 = v28;
      id v14 = "%s Held call hung up. Active call remains: %d";
      goto LABEL_22;
    }
  }

  else
  {
    v30 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 136315138;
      v37 = "-[ADCompanionRoutingPhoneService _hangUpCurrentCall]";
      _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_INFO,  "%s No calls exist. Returning failure",  buf,  0xCu);
    }

    uint64_t v9 = -[SACommandFailed initWithReason:]( objc_alloc(&OBJC_CLASS___SACommandFailed),  "initWithReason:",  @"No call to hang up");
  }

  return v9;
}

- (void)_incomingCallSearchHandler:(id)a3 completion:(id)a4
{
  id v27 = (void (**)(id, id, void))a4;
  id v26 = objc_alloc_init(&OBJC_CLASS___SAPhoneIncomingCallSearchCompleted);
  unsigned int v25 = (void *)objc_claimAutoreleasedReturnValue( +[TUCallCenter callCenterWithQueue:]( &OBJC_CLASS___TUCallCenter,  "callCenterWithQueue:",  self->_serialQueue));
  dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue([v25 audioAndVideoCallsWithStatus:4]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  id obj = v5;
  id v7 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
  unsigned int v28 = v6;
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v31;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v31 != v9) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v30 + 1) + 8LL * (void)i);
        id v12 = objc_alloc_init(&OBJC_CLASS___SAPhoneIncomingCallSearchResult);
        id v13 = objc_msgSend((id)objc_opt_class(self), "_incomingCallTypeForService:", objc_msgSend(v11, "service"));
        id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
        [v12 setIncomingCallType:v14];

        id v15 = [(id)objc_opt_class(self) _personAttributeForCall:v11];
        id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
        id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 object]);
        uint64_t v18 = v17;
        if (v17)
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue([v17 phones]);
          id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 firstObject]);

          if (v20)
          {
            id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 number]);
            [v16 setData:v21];

            [v16 setTypedData:v20];
          }

          else
          {
            unsigned int v22 = (void *)objc_claimAutoreleasedReturnValue([v18 emails]);
            __int16 v23 = (void *)objc_claimAutoreleasedReturnValue([v22 firstObject]);

            if (v23)
            {
              id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 emailAddress]);
              [v16 setData:v24];

              [v16 setTypedData:v23];
            }

            id v6 = v28;
          }
        }

        [v12 setCaller:v16];
        [v6 addObject:v12];
      }

      id v8 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    }

    while (v8);
  }

  -[SAPhoneIncomingCallSearchCompleted setIncomingCallSearchResults:](v26, "setIncomingCallSearchResults:", v6);
  if (v27) {
    v27[2](v27, v26, 0LL);
  }
}

- (void)_unhandledCommand:(id)a3 completion:(id)a4
{
  if (a4)
  {
    id v5 = a4;
    id v6 = -[SACommandFailed initWithReason:]( objc_alloc(&OBJC_CLASS___SACommandFailed),  "initWithReason:",  @"Command not supported");
    (*((void (**)(id, SACommandFailed *, void))a4 + 2))(v5, v6, 0LL);
  }

- (void)handleMessage:(id)a3 messageType:(id)a4 fromDeviceWithIdentifier:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10021F0A8;
  block[3] = &unk_1004FCBB0;
  void block[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v23 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  dispatch_async(serialQueue, block);
}

- (void)_handleMessage:(id)a3 messageType:(id)a4 fromDeviceWithIdentifier:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, void, void *))a6;
  id v14 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315650;
    __int128 v30 = "-[ADCompanionRoutingPhoneService _handleMessage:messageType:fromDeviceWithIdentifier:completion:]";
    __int16 v31 = 2112;
    id v32 = v12;
    __int16 v33 = 2112;
    id v34 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "%s deviceIdentifier = %@, messageType = %@",  buf,  0x20u);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if ([v11 isEqualToString:@"phone"])
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"cmd"]);
    uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSString);
    char isKindOfClass = objc_opt_isKindOfClass(v15, v16);
    id v18 = (os_log_s *)AFSiriLogContextDaemon;
    BOOL v19 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR);
    if ((isKindOfClass & 1) == 0)
    {
      if (v19)
      {
        *(_DWORD *)__int128 buf = 136315138;
        __int128 v30 = "-[ADCompanionRoutingPhoneService _handleMessage:messageType:fromDeviceWithIdentifier:completion:]";
        _os_log_error_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "%s Received message with malformed command",  buf,  0xCu);
        if (!v13) {
          goto LABEL_21;
        }
      }

      else if (!v13)
      {
        goto LABEL_21;
      }

      uint64_t v25 = 11LL;
LABEL_19:
      id v21 = (void *)objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", v25));
      v13[2](v13, 0LL, v21);
LABEL_20:

      goto LABEL_21;
    }

    if (v19)
    {
      *(_DWORD *)__int128 buf = 136315394;
      __int128 v30 = "-[ADCompanionRoutingPhoneService _handleMessage:messageType:fromDeviceWithIdentifier:completion:]";
      __int16 v31 = 2112;
      id v32 = v15;
      _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%s Received command: %@", buf, 0x16u);
    }

    if ([v15 isEqualToString:@"hangup"])
    {
      id v20 = (void *)objc_claimAutoreleasedReturnValue(-[ADCompanionRoutingPhoneService _hangUpCurrentCall](self, "_hangUpCurrentCall"));
      id v21 = v20;
      if (v13)
      {
        id v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "dictionary", @"response"));
        unsigned int v28 = v22;
        id v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v28,  &v27,  1LL));
        ((void (**)(id, void *, void *))v13)[2](v13, v23, 0LL);
      }

      goto LABEL_20;
    }

    id v26 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 136315138;
      __int128 v30 = "-[ADCompanionRoutingPhoneService _handleMessage:messageType:fromDeviceWithIdentifier:completion:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_ERROR,  "%s Received message with unrecognized command",  buf,  0xCu);
      if (!v13) {
        goto LABEL_21;
      }
      goto LABEL_18;
    }

    if (v13)
    {
LABEL_18:
      uint64_t v25 = 1004LL;
      goto LABEL_19;
    }

- (void)_addTimer:(id)a3
{
  id v8 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  v4 = v8;
  if (v8)
  {
    watchdogTimers = self->_watchdogTimers;
    if (!watchdogTimers)
    {
      id v6 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
      id v7 = self->_watchdogTimers;
      self->_watchdogTimers = v6;

      watchdogTimers = self->_watchdogTimers;
    }

    -[NSMutableSet addObject:](watchdogTimers, "addObject:", v8);
    v4 = v8;
  }
}

- (void)_removeTimer:(id)a3
{
  id v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  v4 = v7;
  if (v7)
  {
    -[NSMutableSet removeObject:](self->_watchdogTimers, "removeObject:", v7);
    id v5 = -[NSMutableSet count](self->_watchdogTimers, "count");
    v4 = v7;
    if (!v5)
    {
      watchdogTimers = self->_watchdogTimers;
      self->_watchdogTimers = 0LL;

      v4 = v7;
    }
  }
}

- (void).cxx_destruct
{
}

+ (id)_incomingCallTypeForService:(int)a3
{
  else {
    uint64_t v3 = (id *)*(&off_1004F6D78 + (a3 - 1));
  }
  return *v3;
}

+ (id)_personAttributeForCall:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = objc_alloc_init(&OBJC_CLASS___SAPersonAttribute);
    id v6 = [(id)objc_opt_class(a1) _personForCall:v4];
    id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    [v5 setObject:v7];
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 displayContext]);

    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 name]);
    [v5 setDisplayText:v9];
  }

  else
  {
    id v5 = 0LL;
  }

  return v5;
}

+ (id)_personForCall:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 contactIdentifier]);
    id v7 = [v6 length];

    if (v7)
    {
      id v8 = objc_alloc_init(&OBJC_CLASS___SAPerson);
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v5 contactIdentifier]);
      -[SAPerson setInternalGUID:](v8, "setInternalGUID:", v9);

      id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 displayContext]);
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 personNameComponents]);

      id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 namePrefix]);
      -[SAPerson setPrefix:](v8, "setPrefix:", v12);

      id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 givenName]);
      -[SAPerson setFirstName:](v8, "setFirstName:", v13);

      id v14 = (void *)objc_claimAutoreleasedReturnValue([v11 middleName]);
      -[SAPerson setMiddleName:](v8, "setMiddleName:", v14);

      id v15 = (void *)objc_claimAutoreleasedReturnValue([v11 familyName]);
      -[SAPerson setLastName:](v8, "setLastName:", v15);

      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v11 nameSuffix]);
      -[SAPerson setSuffix:](v8, "setSuffix:", v16);

      id v17 = (void *)objc_claimAutoreleasedReturnValue([v11 nickname]);
      -[SAPerson setNickName:](v8, "setNickName:", v17);

      id v18 = (void *)objc_claimAutoreleasedReturnValue([v11 phoneticRepresentation]);
      BOOL v19 = (void *)objc_claimAutoreleasedReturnValue([v18 givenName]);
      -[SAPerson setFirstNamePhonetic:](v8, "setFirstNamePhonetic:", v19);

      id v20 = (void *)objc_claimAutoreleasedReturnValue([v18 familyName]);
      -[SAPerson setLastNamePhonetic:](v8, "setLastNamePhonetic:", v20);

      id v21 = (void *)objc_claimAutoreleasedReturnValue([v5 displayContext]);
      id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 companyName]);
      -[SAPerson setCompany:](v8, "setCompany:", v22);

      id v23 = (void *)objc_claimAutoreleasedReturnValue([a1 _contactForCall:v5]);
      if (v23)
      {
        id v24 = (void *)objc_claimAutoreleasedReturnValue( +[CNContactFormatter stringFromContact:style:]( &OBJC_CLASS___CNContactFormatter,  "stringFromContact:style:",  v23,  0LL));
        -[SAPerson setFullName:](v8, "setFullName:", v24);
      }
    }

    else
    {
      id v8 = 0LL;
    }

    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v5 handle]);
    unint64_t v26 = (unint64_t)[v25 type];
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v25 value]);
    if (![v27 length] || (v26 & 0xFFFFFFFFFFFFFFFELL) != 2) {
      goto LABEL_17;
    }
    if (!v8) {
      id v8 = objc_alloc_init(&OBJC_CLASS___SAPerson);
    }
    if (v26 == 3)
    {
      id v28 = objc_alloc_init(&OBJC_CLASS___SAEmail);
      [v28 setEmailAddress:v27];
      id v31 = v28;
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v31, 1LL));
      -[SAPerson setEmails:](v8, "setEmails:", v29);
    }

    else
    {
      if (v26 != 2)
      {
LABEL_17:

        goto LABEL_18;
      }

      id v28 = objc_alloc_init(&OBJC_CLASS___SAPhone);
      [v28 setNumber:v27];
      id v32 = v28;
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v32, 1LL));
      -[SAPerson setPhones:](v8, "setPhones:", v29);
    }

    goto LABEL_17;
  }

  id v8 = 0LL;
LABEL_18:

  return v8;
}

+ (id)_contactForCall:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 displayContext]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 personNameComponents]);

    if (v6)
    {
      id v7 = objc_alloc_init(&OBJC_CLASS___CNMutableContact);
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 namePrefix]);
      -[CNMutableContact setNamePrefix:](v7, "setNamePrefix:", v8);

      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v6 givenName]);
      -[CNMutableContact setGivenName:](v7, "setGivenName:", v9);

      id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 middleName]);
      -[CNMutableContact setMiddleName:](v7, "setMiddleName:", v10);

      id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 familyName]);
      -[CNMutableContact setFamilyName:](v7, "setFamilyName:", v11);

      id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 nameSuffix]);
      -[CNMutableContact setNameSuffix:](v7, "setNameSuffix:", v12);

      id v13 = (void *)objc_claimAutoreleasedReturnValue([v6 nickname]);
      -[CNMutableContact setNickname:](v7, "setNickname:", v13);

      id v14 = (void *)objc_claimAutoreleasedReturnValue([v6 phoneticRepresentation]);
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 givenName]);
      -[CNMutableContact setPhoneticGivenName:](v7, "setPhoneticGivenName:", v15);

      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v14 middleName]);
      -[CNMutableContact setPhoneticMiddleName:](v7, "setPhoneticMiddleName:", v16);

      id v17 = (void *)objc_claimAutoreleasedReturnValue([v14 familyName]);
      -[CNMutableContact setPhoneticFamilyName:](v7, "setPhoneticFamilyName:", v17);
    }

    else
    {
      id v7 = 0LL;
    }

    id v18 = (void *)objc_claimAutoreleasedReturnValue([v4 displayContext]);
    BOOL v19 = (void *)objc_claimAutoreleasedReturnValue([v18 companyName]);

    if ([v19 length])
    {
      if (!v7) {
        id v7 = objc_alloc_init(&OBJC_CLASS___CNMutableContact);
      }
      -[CNMutableContact setOrganizationName:](v7, "setOrganizationName:", v19);
    }
  }

  else
  {
    id v7 = 0LL;
  }

  return v7;
}

@end