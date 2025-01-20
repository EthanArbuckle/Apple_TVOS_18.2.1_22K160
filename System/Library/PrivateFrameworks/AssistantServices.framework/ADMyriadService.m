@interface ADMyriadService
+ (id)sharedService;
- (ADMyriadService)init;
- (void)_handleLastWinRequest:(id)a3 completion:(id)a4;
- (void)_handleMessage:(id)a3 messageType:(id)a4 fromDeviceWithIdentifier:(id)a5 completion:(id)a6;
- (void)_handleRequest:(id)a3 fromDeviceWithIdentifier:(id)a4 completion:(id)a5;
- (void)_setLastMyriadWin:(id)a3;
- (void)_setLastTimeStereoPartnerWon:(id)a3;
- (void)_setStereoPartnerIdentifier:(id)a3;
- (void)_stereoConfigurationDidChangeNotification:(id)a3;
- (void)_syncLastWinWithStereoPartner;
- (void)handleMessage:(id)a3 messageType:(id)a4 fromDeviceWithIdentifier:(id)a5 completion:(id)a6;
- (void)lastMyriadWinForStereoPartner:(id)a3;
- (void)setMyriadDecisionResult:(BOOL)a3;
@end

@implementation ADMyriadService

- (ADMyriadService)init
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___ADMyriadService;
  v2 = -[ADMyriadService init](&v13, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("Myriad Service Queue", v4);

    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v5;

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[ADCompanionService sharedInstance](&OBJC_CLASS___ADCompanionService, "sharedInstance"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1002A5448;
    v11[3] = &unk_1004F9878;
    v8 = v2;
    v12 = v8;
    [v7 getStereoPartnerIdentifierWithCompletion:v11];
    [v7 setMessageHandler:v8 forMessageType:@"myriad"];
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v9 addObserver:v8 selector:"_stereoConfigurationDidChangeNotification:" name:@"ADCompanionServiceStereoConfigurationDidChangeNotification" object:0];
  }

  return v2;
}

- (void)setMyriadDecisionResult:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_queue_t v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v9 = "-[ADMyriadService setMyriadDecisionResult:]";
    __int16 v10 = 1024;
    BOOL v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s %d", buf, 0x12u);
  }

  if (v3)
  {
    serialQueue = (dispatch_queue_s *)self->_serialQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1002A5400;
    block[3] = &unk_1004FD940;
    block[4] = self;
    dispatch_async(serialQueue, block);
  }

- (void)_setLastMyriadWin:(id)a3
{
  v8 = (NSDate *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  dispatch_queue_t v5 = v8;
  lastTimeWon = self->_lastTimeWon;
  if (lastTimeWon != v8)
  {
    unsigned __int8 v7 = -[NSDate isEqual:](lastTimeWon, "isEqual:", v8);
    dispatch_queue_t v5 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_lastTimeWon, a3);
      dispatch_queue_t v5 = v8;
      if (self->_stereoPartnerIdentifier)
      {
        -[ADMyriadService _syncLastWinWithStereoPartner](self, "_syncLastWinWithStereoPartner");
        dispatch_queue_t v5 = v8;
      }
    }
  }
}

- (void)lastMyriadWinForStereoPartner:(id)a3
{
  id v4 = a3;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1002A5384;
  v7[3] = &unk_1004FD990;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(serialQueue, v7);
}

- (void)_setStereoPartnerIdentifier:(id)a3
{
  id v4 = (NSString *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  stereoPartnerIdentifier = self->_stereoPartnerIdentifier;
  if (stereoPartnerIdentifier != v4 && !-[NSString isEqualToString:](stereoPartnerIdentifier, "isEqualToString:", v4))
  {
    id v6 = (NSString *)-[NSString copy](v4, "copy");
    unsigned __int8 v7 = self->_stereoPartnerIdentifier;
    self->_stereoPartnerIdentifier = v6;

    id v8 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      v9 = self->_stereoPartnerIdentifier;
      int v10 = 136315394;
      BOOL v11 = "-[ADMyriadService _setStereoPartnerIdentifier:]";
      __int16 v12 = 2112;
      objc_super v13 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "%s stereo partner changed to: %@",  (uint8_t *)&v10,  0x16u);
    }

    if (self->_stereoPartnerIdentifier) {
      -[ADMyriadService _syncLastWinWithStereoPartner](self, "_syncLastWinWithStereoPartner");
    }
    else {
      -[ADMyriadService _setLastTimeStereoPartnerWon:](self, "_setLastTimeStereoPartnerWon:", 0LL);
    }
  }
}

- (void)_setLastTimeStereoPartnerWon:(id)a3
{
  dispatch_queue_t v5 = (NSDate *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  lastTimeStereoPartnerWon = self->_lastTimeStereoPartnerWon;
  p_lastTimeStereoPartnerWon = &self->_lastTimeStereoPartnerWon;
  id v6 = lastTimeStereoPartnerWon;
  if (lastTimeStereoPartnerWon != v5 && (-[NSDate isEqual:](v6, "isEqual:", v5) & 1) == 0)
  {
    objc_storeStrong((id *)p_lastTimeStereoPartnerWon, a3);
    v9 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v10 = *p_lastTimeStereoPartnerWon;
      int v12 = 136315394;
      objc_super v13 = "-[ADMyriadService _setLastTimeStereoPartnerWon:]";
      __int16 v14 = 2112;
      v15 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "%s lastWin changed to: %@",  (uint8_t *)&v12,  0x16u);
    }

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification( DarwinNotifyCenter,  kAFStereoPartnerMyriadDataDidChangeDarwinNotification,  0LL,  0LL,  1u);
  }
}

- (void)_syncLastWinWithStereoPartner
{
  BOOL v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[ADMyriadService _syncLastWinWithStereoPartner]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (self->_stereoPartnerIdentifier)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithObjectsAndKeys:",  &off_100513738,  @"methodType",  @"lastWin",  @"methodName",  0LL));
    dispatch_queue_t v5 = v4;
    lastTimeWon = self->_lastTimeWon;
    if (lastTimeWon) {
      [v4 setObject:lastTimeWon forKey:@"lastWin"];
    }
    unsigned __int8 v7 = self->_stereoPartnerIdentifier;
    objc_initWeak((id *)buf, self);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[ADCompanionService sharedInstance](&OBJC_CLASS___ADCompanionService, "sharedInstance"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1002A50A0;
    v11[3] = &unk_1004F98C8;
    void v11[4] = self;
    objc_copyWeak(&v13, (id *)buf);
    v9 = v7;
    int v12 = v9;
    [v8 sendStereoPartnerMessage:v5 messageType:@"myriad" completion:v11];

    objc_destroyWeak(&v13);
    objc_destroyWeak((id *)buf);
  }

  else
  {
    int v10 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v15 = "-[ADMyriadService _syncLastWinWithStereoPartner]";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s No stereo partner", buf, 0xCu);
    }
  }

- (void)_stereoConfigurationDidChangeNotification:(id)a3
{
  id v4 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v8 = "-[ADMyriadService _stereoConfigurationDidChangeNotification:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[ADCompanionService sharedInstance](&OBJC_CLASS___ADCompanionService, "sharedInstance"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1002A5014;
  v6[3] = &unk_1004F9878;
  v6[4] = self;
  [v5 getStereoPartnerIdentifierWithCompletion:v6];
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
  block[2] = sub_1002A5000;
  block[3] = &unk_1004FCBB0;
  block[4] = self;
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
  __int16 v14 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)id v20 = 136315650;
    *(void *)&v20[4] = "-[ADMyriadService _handleMessage:messageType:fromDeviceWithIdentifier:completion:]";
    *(_WORD *)&v20[12] = 2112;
    *(void *)&v20[14] = v11;
    *(_WORD *)&v20[22] = 2112;
    id v21 = v12;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s %@ %@", v20, 0x20u);
  }

  if (([v11 isEqualToString:@"myriad"] & 1) == 0)
  {
    id v17 = (os_log_s *)AFSiriLogContextDaemon;
    if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
LABEL_9:
      v19 = (void *)objc_claimAutoreleasedReturnValue( +[AFError errorWithCode:]( &OBJC_CLASS___AFError,  "errorWithCode:",  1004LL,  *(_OWORD *)v20,  *(void *)&v20[16]));
      v13[2](v13, 0LL, v19);

      goto LABEL_10;
    }

    *(_DWORD *)id v20 = 136315394;
    *(void *)&v20[4] = "-[ADMyriadService _handleMessage:messageType:fromDeviceWithIdentifier:completion:]";
    *(_WORD *)&v20[12] = 2112;
    *(void *)&v20[14] = v11;
    id v18 = "%s Received message from unknown message type: %@";
LABEL_12:
    _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, v18, v20, 0x16u);
    goto LABEL_9;
  }

  id v15 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"methodType"]);
  id v16 = [v15 integerValue];

  if (v16 != (id)2)
  {
    id v17 = (os_log_s *)AFSiriLogContextDaemon;
    if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    *(_DWORD *)id v20 = 136315394;
    *(void *)&v20[4] = "-[ADMyriadService _handleMessage:messageType:fromDeviceWithIdentifier:completion:]";
    *(_WORD *)&v20[12] = 2048;
    *(void *)&v20[14] = v16;
    id v18 = "%s Received message with unhandled method type: %ld";
    goto LABEL_12;
  }

  -[ADMyriadService _handleRequest:fromDeviceWithIdentifier:completion:]( self,  "_handleRequest:fromDeviceWithIdentifier:completion:",  v10,  v12,  v13);
LABEL_10:
}

- (void)_handleRequest:(id)a3 fromDeviceWithIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, void *))a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"methodName"]);
  id v12 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v17 = 136315394;
    id v18 = "-[ADMyriadService _handleRequest:fromDeviceWithIdentifier:completion:]";
    __int16 v19 = 2112;
    id v20 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v17, 0x16u);
  }

  if (!-[NSString isEqualToString:](self->_stereoPartnerIdentifier, "isEqualToString:", v9))
  {
    id v13 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v17 = 136315394;
      id v18 = "-[ADMyriadService _handleRequest:fromDeviceWithIdentifier:completion:]";
      __int16 v19 = 2112;
      id v20 = v9;
      _os_log_error_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "%s Received message from device not in stereo pair: %@",  (uint8_t *)&v17,  0x16u);
    }

    uint64_t v14 = 1005LL;
    goto LABEL_12;
  }

  if (![v11 isEqualToString:@"lastWin"])
  {
    id v15 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v17 = 136315394;
      id v18 = "-[ADMyriadService _handleRequest:fromDeviceWithIdentifier:completion:]";
      __int16 v19 = 2112;
      id v20 = v11;
      _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "%s Received message with unknown method name: %@",  (uint8_t *)&v17,  0x16u);
    }

    uint64_t v14 = 1004LL;
LABEL_12:
    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", v14));
    v10[2](v10, 0LL, v16);

    goto LABEL_13;
  }

  -[ADMyriadService _handleLastWinRequest:completion:](self, "_handleLastWinRequest:completion:", v8, v10);
LABEL_13:
}

- (void)_handleLastWinRequest:(id)a3 completion:(id)a4
{
  id v6 = (void (**)(id, void, void *))a4;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  id v8 = a3;
  dispatch_assert_queue_V2(serialQueue);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"lastWin"]);

  if (v9)
  {
    uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSDate);
    if ((objc_opt_isKindOfClass(v9, v10) & 1) == 0)
    {
      id v13 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        int v17 = "-[ADMyriadService _handleLastWinRequest:completion:]";
        _os_log_error_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "%s Received malformed lastWin data",  buf,  0xCu);
      }

      id v12 = (void *)objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", 11LL));
      v6[2](v6, 0LL, v12);
      goto LABEL_11;
    }
  }

  -[ADMyriadService _setLastTimeStereoPartnerWon:](self, "_setLastTimeStereoPartnerWon:", v9);
  if (v6)
  {
    lastTimeWon = self->_lastTimeWon;
    if (lastTimeWon)
    {
      uint64_t v14 = @"lastWin";
      id v15 = lastTimeWon;
      id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v15,  &v14,  1LL));
    }

    else
    {
      id v12 = 0LL;
    }

    ((void (**)(id, void *, void *))v6)[2](v6, v12, 0LL);
LABEL_11:
  }
}

- (void).cxx_destruct
{
}

+ (id)sharedService
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002A5558;
  block[3] = &unk_1004FCFF8;
  block[4] = a1;
  if (qword_1005783C0 != -1) {
    dispatch_once(&qword_1005783C0, block);
  }
  return (id)qword_1005783C8;
}

@end