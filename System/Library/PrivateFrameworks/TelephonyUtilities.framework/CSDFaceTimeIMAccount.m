@interface CSDFaceTimeIMAccount
+ (CSDFaceTimeIMAccount)sharedInstance;
- (BOOL)isIMDaemonConnected;
- (CSDDeviceLockStateObserver)lockStateObserver;
- (CSDFaceTimeIMAccount)init;
- (CSDKeychainPasswordItem)keychainItem;
- (NSString)callerID;
- (OS_dispatch_queue)queue;
- (id)faceTimeIMAccount;
- (void)_initializeLastKnownCallerID;
- (void)_saveLastKnownFaceTimeCallerID;
- (void)account:(id)a3 aliasesChanged:(id)a4;
- (void)displayNameChanged:(id)a3;
- (void)imDaemonDidConnect:(id)a3;
- (void)preferredAccountChanged:(id)a3;
- (void)removeCallerIDFromPreferences;
- (void)setCallerID:(id)a3;
- (void)setIMDaemonConnected:(BOOL)a3;
- (void)setQueue:(id)a3;
- (void)updateCallerID:(id)a3;
- (void)updateState;
@end

@implementation CSDFaceTimeIMAccount

+ (CSDFaceTimeIMAccount)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100171C78;
  block[3] = &unk_1003D7F10;
  block[4] = a1;
  if (qword_10044D130 != -1) {
    dispatch_once(&qword_10044D130, block);
  }
  return (CSDFaceTimeIMAccount *)(id)qword_10044D128;
}

- (CSDFaceTimeIMAccount)init
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___CSDFaceTimeIMAccount;
  v2 = -[CSDFaceTimeIMAccount init](&v12, "init");
  if (v2)
  {
    id v3 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"com.apple.telephonyutilities.callservicesd.facetimeimaccount"));
    dispatch_queue_t v4 = dispatch_queue_create((const char *)[v3 UTF8String], 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v6 addObserver:v2 selector:"imDaemonDidConnect:" name:IMDaemonDidConnectNotification object:0];

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[IMDaemonController sharedInstance](&OBJC_CLASS___IMDaemonController, "sharedInstance"));
    [v7 connectToDaemon];

    v8 = (dispatch_queue_s *)v2->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100171DC0;
    block[3] = &unk_1003D7730;
    v11 = v2;
    dispatch_async(v8, block);
  }

  return v2;
}

- (NSString)callerID
{
  uint64_t v7 = 0LL;
  v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  v10 = sub_100172018;
  v11 = sub_100172028;
  id v12 = 0LL;
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeIMAccount queue](self, "queue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100172030;
  v6[3] = &unk_1003D7850;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSString *)v4;
}

- (void)updateCallerID:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1001720C0;
  v4[3] = &unk_1003D7758;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  dispatch_async(&_dispatch_main_q, v4);
}

- (void)imDaemonDidConnect:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Received IMDaemon connected notification: %@",  (uint8_t *)&v9,  0xCu);
  }

  dispatch_assert_queue_V2(&_dispatch_main_q);
  -[CSDFaceTimeIMAccount setIMDaemonConnected:](self, "setIMDaemonConnected:", 1LL);
  -[CSDFaceTimeIMAccount updateState](self, "updateState");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v7 addObserver:self selector:"preferredAccountChanged:" name:IMPreferredAccountForServiceChangedNotification object:0];

  IMRegisterForPreferredAccountChangeNotifications();
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v8 addObserver:self selector:"displayNameChanged:" name:IMAccountDisplayNameChangedNotification object:0];
}

- (void)preferredAccountChanged:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Received preferred account changed notification: %@",  (uint8_t *)&v7,  0xCu);
  }

  -[CSDFaceTimeIMAccount updateState](self, "updateState");
}

- (void)displayNameChanged:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Received display name changed notification: %@",  (uint8_t *)&v7,  0xCu);
  }

  -[CSDFaceTimeIMAccount updateState](self, "updateState");
}

- (void)_initializeLastKnownCallerID
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeIMAccount queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeIMAccount keychainItem](self, "keychainItem"));
  id v19 = 0LL;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 readPasswordAndReturnError:&v19]);
  id v6 = v19;

  id v7 = [v5 length];
  id v8 = sub_1001704C4();
  int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v10)
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Loaded last known FaceTime caller ID as %@",  buf,  0xCu);
    }

    v11 = v5;
LABEL_13:
    v14 = v11;
    callerID = self->_callerID;
    self->_callerID = v11;
    goto LABEL_14;
  }

  if (v10)
  {
    *(_DWORD *)buf = 138412290;
    id v21 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "[WARN] Could not find lastKnownFaceTimeCallerID in keychain, error: %@",  buf,  0xCu);
  }

  id v12 = sub_1001704C4();
  v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Querying Preferences to see if it exists",  buf,  2u);
  }

  v14 = (void *)CFPreferencesCopyAppValue( @"lastKnownFaceTimeCallerID",  TUBundleIdentifierTelephonyUtilitiesFramework);
  id v15 = [v14 length];
  id v16 = sub_1001704C4();
  callerID = (NSString *)objc_claimAutoreleasedReturnValue(v16);
  BOOL v18 = os_log_type_enabled((os_log_t)callerID, OS_LOG_TYPE_DEFAULT);
  if (v15)
  {
    if (v18)
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)callerID,  OS_LOG_TYPE_DEFAULT,  "Found lastKnownFaceTimeCallerID: %@ in Preferences",  buf,  0xCu);
    }

    v11 = v14;
    goto LABEL_13;
  }

  if (v18)
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)callerID,  OS_LOG_TYPE_DEFAULT,  "[WARN] lastKnownFaceTimeCallerID not found in Preferences either",  buf,  2u);
  }

- (void)removeCallerIDFromPreferences
{
  v2 = (const __CFString *)TUBundleIdentifierTelephonyUtilitiesFramework;
  id v3 = (void *)CFPreferencesCopyAppValue( @"lastKnownFaceTimeCallerID",  TUBundleIdentifierTelephonyUtilitiesFramework);
  if (v3)
  {
    id v4 = sub_1001704C4();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Removing callerID Preferences value", v6, 2u);
    }

    CFPreferencesSetAppValue(@"lastKnownFaceTimeCallerID", 0LL, v2);
    CFPreferencesAppSynchronize(v2);
  }
}

- (void)_saveLastKnownFaceTimeCallerID
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeIMAccount queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  id v4 = sub_1001704C4();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    callerID = self->_callerID;
    *(_DWORD *)buf = 138412290;
    v14 = callerID;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Saving last known FaceTime caller ID as %@",  buf,  0xCu);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeIMAccount keychainItem](self, "keychainItem"));
  id v8 = self->_callerID;
  id v12 = 0LL;
  [v7 savePassword:v8 error:&v12];
  id v9 = v12;

  if (v9)
  {
    id v10 = sub_1001704C4();
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1002B945C((uint64_t)v9, v11);
    }
  }
}

- (id)faceTimeIMAccount
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[IMService facetimeService](&OBJC_CLASS___IMService, "facetimeService"));
  uint64_t v3 = IMPreferredAccountForService();
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  return v4;
}

- (void)updateState
{
  if (-[CSDFaceTimeIMAccount isIMDaemonConnected](self, "isIMDaemonConnected"))
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeIMAccount faceTimeIMAccount](self, "faceTimeIMAccount"));
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 displayName]);

    id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeIMAccount queue](self, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100172A9C;
    block[3] = &unk_1003D7758;
    void block[4] = self;
    id v10 = v4;
    id v6 = v4;
    dispatch_async(v5, block);
  }

  else
  {
    id v7 = sub_1001704C4();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Deferring FaceTime caller ID refresh until connected to IMDaemon",  v8,  2u);
    }
  }
}

- (void)account:(id)a3 aliasesChanged:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_1001704C4();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v12 = self;
    __int16 v13 = 2112;
    id v14 = v6;
    __int16 v15 = 2112;
    id v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@ account %@ aliases changed %@", buf, 0x20u);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100172D00;
  block[3] = &unk_1003D7730;
  void block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)setCallerID:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (BOOL)isIMDaemonConnected
{
  return self->_IMDaemonConnected;
}

- (void)setIMDaemonConnected:(BOOL)a3
{
  self->_IMDaemonConnected = a3;
}

- (CSDKeychainPasswordItem)keychainItem
{
  return self->_keychainItem;
}

- (CSDDeviceLockStateObserver)lockStateObserver
{
  return self->_lockStateObserver;
}

- (void).cxx_destruct
{
}

@end