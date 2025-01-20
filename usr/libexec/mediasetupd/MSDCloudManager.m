@interface MSDCloudManager
+ (BOOL)shouldEnablePushTopic;
+ (NSString)pushTopic;
+ (id)sharedManager;
+ (void)handlePushNotification:(id)a3;
- (CKAccountInfo)accountInfo;
- (MSDCloudManager)init;
- (OS_dispatch_queue)serialQueue;
- (void)_checkAccountStatus;
- (void)_handleAccountStatusUnsupported;
- (void)_handleCKAccountStatusChanged:(id)a3;
- (void)_handleDeviceSupportsEncryption:(id)a3;
- (void)_withAccountCheckLock:(id)a3;
- (void)addSubscriptionForDatabase:(id)a3;
- (void)dealloc;
- (void)isCloudKitAccessAvailable:(id)a3;
- (void)setAccountInfo:(id)a3;
- (void)setSerialQueue:(id)a3;
@end

@implementation MSDCloudManager

- (MSDCloudManager)init
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___MSDCloudManager;
  v2 = -[MSDCloudManager init](&v12, "init");
  v3 = v2;
  if (v2)
  {
    accountInfo = v2->_accountInfo;
    v2->_accountInfo = 0LL;

    v3->_subscriptionFailure = 0LL;
    v3->_isAccountCheckInProgress = 0;
    v3->_accountCheckLock._os_unfair_lock_opaque = 0;
    dispatch_queue_attr_t v5 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_USER_INTERACTIVE, 0);
    v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v5);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.mediasetupd.CloudManager", v6);
    serialQueue = v3->_serialQueue;
    v3->_serialQueue = (OS_dispatch_queue *)v7;

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v9 addObserver:v3 selector:"_handleCKAccountStatusChanged:" name:CKAccountChangedNotification object:0];

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v10 addObserver:v3 selector:"_handleCKAccountStatusChanged:" name:CKIdentityUpdateNotification object:0];
  }

  return v3;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self name:CKAccountChangedNotification object:0];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v4 removeObserver:self name:CKIdentityUpdateNotification object:0];

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MSDCloudManager;
  -[MSDCloudManager dealloc](&v5, "dealloc");
}

+ (id)sharedManager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002EEA4;
  block[3] = &unk_100060A90;
  block[4] = a1;
  if (qword_1000707E8 != -1) {
    dispatch_once(&qword_1000707E8, block);
  }
  return (id)qword_1000707E0;
}

- (void)addSubscriptionForDatabase:(id)a3
{
  id v4 = a3;
  id v5 = [v4 databaseScope];
  if (v5 == (id)2)
  {
    v6 = @"com.apple.msd.privateDatabaseSubscription";
    goto LABEL_5;
  }

  if (v5 == (id)3)
  {
    v6 = @"com.apple.msd.sharedDatabaseSubscription";
LABEL_5:
    objc_initWeak(&location, self);
    objc_initWeak(&from, v4);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10002F044;
    v11[3] = &unk_100062460;
    objc_copyWeak(&v12, &location);
    objc_copyWeak(&v13, &from);
    [v4 addSubscriptionForDatabaseWithIdentifier:v6 completion:v11];
    objc_destroyWeak(&v13);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
    goto LABEL_11;
  }

  id v7 = sub_10003E9DC();
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    sub_1000303A4();
  }

  id v9 = sub_10003E9DC();
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    sub_10003031C(v4, v10);
  }

LABEL_11:
}

- (void)isCloudKitAccessAvailable:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[CKContainer MSDCloudKitContainer](&OBJC_CLASS___CKContainer, "MSDCloudKitContainer"));
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_10002F4BC;
    v7[3] = &unk_100062488;
    v8 = (os_log_s *)v3;
    [v4 accountInfoWithCompletionHandler:v7];

    id v5 = v8;
  }

  else
  {
    id v6 = sub_10003E9DC();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v10 = "-[MSDCloudManager isCloudKitAccessAvailable:]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s, nil completion handler", buf, 0xCu);
    }
  }
}

+ (NSString)pushTopic
{
  return (NSString *)[@"com.apple.icloud-container." stringByAppendingString:@"com.apple.mediasetupd"];
}

+ (void)handlePushNotification:(id)a3
{
  id v3 = a3;
  id v4 = sub_10003E9DC();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v23) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Handling a CloudKit push notification",  (uint8_t *)&v23,  2u);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 userInfo]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[CKNotification notificationFromRemoteNotificationDictionary:]( &OBJC_CLASS___CKNotification,  "notificationFromRemoteNotificationDictionary:",  v6));

  if (v7)
  {
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___CKDatabaseNotification);
    id v9 = v7;
    if ((objc_opt_isKindOfClass(v9, v8) & 1) != 0) {
      v10 = v9;
    }
    else {
      v10 = 0LL;
    }
    id v11 = v10;

    id v12 = sub_10003E9DC();
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    v14 = v13;
    if (!v11)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_1000304B4();
      }
      goto LABEL_22;
    }

    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = CKDatabaseScopeString([v11 databaseScope]);
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      int v23 = 138412290;
      v24 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "A CloudKit database changed in DatabaseScope = %@",  (uint8_t *)&v23,  0xCu);
    }

    id v17 = [v11 databaseScope];
    if (v17 == (id)1)
    {
      id v22 = sub_10003E9DC();
      v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_1000304E0();
      }
      goto LABEL_22;
    }

    if (v17 == (id)3)
    {
      v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[CKContainer MSDCloudKitContainer](&OBJC_CLASS___CKContainer, "MSDCloudKitContainer"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s sharedCloudDatabase](v14, "sharedCloudDatabase"));
      v19 = v18;
      v20 = &stru_1000624C8;
      goto LABEL_21;
    }

    if (v17 == (id)2)
    {
      v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[CKContainer MSDCloudKitContainer](&OBJC_CLASS___CKContainer, "MSDCloudKitContainer"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s privateCloudDatabase](v14, "privateCloudDatabase"));
      v19 = v18;
      v20 = &stru_1000624A8;
LABEL_21:
      [v18 refreshDatabase:0 completion:v20];

LABEL_22:
    }
  }

  else
  {
    id v21 = sub_10003E9DC();
    id v11 = (id)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_ERROR)) {
      sub_100030434(v3, (os_log_s *)v11);
    }
  }
}

+ (BOOL)shouldEnablePushTopic
{
  return +[MSDeviceInfo deviceCanManageMultiUser]( &OBJC_CLASS___MSDeviceInfo,  "deviceCanManageMultiUser");
}

- (void)_checkAccountStatus
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CKContainer MSDCloudKitContainer](&OBJC_CLASS___CKContainer, "MSDCloudKitContainer"));
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10002FA4C;
  v3[3] = &unk_100062518;
  objc_copyWeak(&v4, &location);
  [v2 accountInfoWithCompletionHandler:v3];

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)_handleAccountStatusUnsupported
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](&OBJC_CLASS___MSDDefaultsManager, "sharedManager"));
  [v2 setObject:&__kCFBooleanFalse forDefault:@"CKAccountSupportsManatee"];

  id v3 = (id)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](&OBJC_CLASS___MSDDefaultsManager, "sharedManager"));
  [v3 clearPrivateAndSharedLocalData];
}

- (void)_handleDeviceSupportsEncryption:(id)a3
{
  id v4 = a3;
  if (-[CKAccountInfo isEqual:](self->_accountInfo, "isEqual:", v4))
  {
    id v5 = sub_10003E9DC();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v16 = 0;
      id v7 = "AccountInfo is the same, skipping update";
      uint64_t v8 = (uint8_t *)&v16;
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v7, v8, 2u);
    }
  }

  else if ([v4 hasValidCredentials])
  {
    -[MSDCloudManager setAccountInfo:](self, "setAccountInfo:", v4);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](&OBJC_CLASS___MSDDefaultsManager, "sharedManager"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForDefault:@"CKAccountSupportsManatee"]);
    unsigned int v11 = [v10 BOOLValue];

    if (!v11)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](&OBJC_CLASS___MSDDefaultsManager, "sharedManager"));
      [v14 setObject:&__kCFBooleanTrue forDefault:@"CKAccountSupportsManatee"];

      id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[MSDDataController sharedInstance](&OBJC_CLASS___MSDDataController, "sharedInstance"));
      -[os_log_s refreshDataForReason:completion:](v6, "refreshDataForReason:completion:", 6LL, &stru_100062538);
      goto LABEL_12;
    }

    id v12 = sub_10003E9DC();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v15 = 0;
      id v7 = "Manatee enabled on device, skipping data refresh";
      uint64_t v8 = (uint8_t *)&v15;
      goto LABEL_8;
    }
  }

  else
  {
    id v13 = sub_10003E9DC();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100030690();
    }
  }

- (void)_handleCKAccountStatusChanged:(id)a3
{
  id v4 = a3;
  id v5 = sub_10003E9DC();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
    *(_DWORD *)buf = 138412290;
    id v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Received notification %@", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100030154;
  block[3] = &unk_1000619C8;
  objc_copyWeak(&v10, (id *)buf);
  dispatch_async(serialQueue, block);
  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
}

- (void)_withAccountCheckLock:(id)a3
{
  p_accountCheckLock = &self->_accountCheckLock;
  id v4 = (void (**)(void))a3;
  os_unfair_lock_lock(p_accountCheckLock);
  v4[2](v4);

  os_unfair_lock_unlock(p_accountCheckLock);
}

- (CKAccountInfo)accountInfo
{
  return self->_accountInfo;
}

- (void)setAccountInfo:(id)a3
{
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

  ;
}

@end