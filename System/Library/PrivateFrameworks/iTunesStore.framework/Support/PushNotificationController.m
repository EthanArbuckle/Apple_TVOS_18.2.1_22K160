@interface PushNotificationController
+ (BOOL)_amsHandleNotification:(id)a3 urlBag:(id)a4;
+ (id)_newPushHandlerWithURLBag:(id)a3;
+ (id)sharedInstance;
+ (id)soundFilesDirectoryPath;
- (BOOL)_isPushEnabled;
- (BOOL)_isValidEnvironment:(id)a3;
- (BOOL)_shouldAggressivelySendToken;
- (PushNotificationController)init;
- (id)_bag;
- (id)_clientForIdentifier:(id)a3 createIfNeeded:(BOOL)a4 inContext:(id)a5;
- (id)_enabledTopics;
- (id)_environmentForName:(id)a3 createIfNeeded:(BOOL)a4 inContext:(id)a5;
- (id)_environmentNameForConnection:(id)a3;
- (id)_newAPSConnectionWithEnvironment:(id)a3;
- (id)_newPostTokenOperationForEnvironment:(id)a3 account:(id)a4;
- (id)_portNameForEnvironmentName:(id)a3;
- (int64_t)_numberOfClientsInContext:(id)a3;
- (void)_accountStoreChangedNotification:(id)a3;
- (void)_addNotificationWithUserInfo:(id)a3 client:(id)a4 context:(id)a5;
- (void)_closeEnvironment:(id)a3 inContext:(id)a4;
- (void)_deviceNameChanged;
- (void)_fireRegisterBlocksAfterOperation:(id)a3;
- (void)_handleMessage:(id)a3 connection:(id)a4 usingBlock:(id)a5;
- (void)_loadConnectionsInContext:(id)a3;
- (void)_networkTypeChanged:(id)a3;
- (void)_openConnectionForEnvironment:(id)a3;
- (void)_postNotificationsAvailableForClient:(id)a3 inContext:(id)a4;
- (void)_postTokenForEnvironment:(id)a3;
- (void)_postTokensIfNecessaryInContext:(id)a3;
- (void)_postTokensInContext:(id)a3 force:(BOOL)a4;
- (void)_reloadActiveEnvironmentInContext:(id)a3;
- (void)_reloadDaemonClientInContext:(id)a3;
- (void)_reloadPushStateInContext:(id)a3;
- (void)_resetLastRegisterAttemptTime;
- (void)_setShouldAggressivelySendToken:(BOOL)a3;
- (void)_storeFrontChangedNotification:(id)a3;
- (void)_updateEnvironmentAfterTokenPost:(id)a3;
- (void)_updatePushEnabledState;
- (void)_urlBagDidLoadNotification:(id)a3;
- (void)connection:(id)a3 didReceiveMessageForTopic:(id)a4 userInfo:(id)a5;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
- (void)dealloc;
- (void)observeXPCServer:(id)a3;
- (void)popRemoteNotificationWithMessage:(id)a3 connection:(id)a4;
- (void)postClientNotificationWithUserInfo:(id)a3;
- (void)postPushTokens;
- (void)registerNotificationClientWithMessage:(id)a3 connection:(id)a4;
- (void)registerTokenForEnvironmentName:(id)a3 accountIdentifier:(id)a4 completionBlock:(id)a5;
- (void)showLocalNotificationWithMessage:(id)a3 connection:(id)a4;
- (void)unregisterNotificationClientWithMessage:(id)a3 connection:(id)a4;
@end

@implementation PushNotificationController

- (PushNotificationController)init
{
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___PushNotificationController;
  v2 = -[PushNotificationController init](&v25, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    connections = v2->_connections;
    v2->_connections = v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.itunesstored.PushNotificationController", 0LL);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v5;

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.itunesstored.PushNotificationController.notify", 0LL);
    notificationQueue = v2->_notificationQueue;
    v2->_notificationQueue = (OS_dispatch_queue *)v7;

    v9 = (dispatch_object_s *)v2->_notificationQueue;
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    dispatch_set_target_queue(v9, v11);

    -[PushNotificationController _resetLastRegisterAttemptTime](v2, "_resetLastRegisterAttemptTime");
    v12 = objc_alloc_init(&OBJC_CLASS___ISOperationQueue);
    operationQueue = v2->_operationQueue;
    v2->_operationQueue = v12;

    -[ISOperationQueue setAdjustsMaxConcurrentOperationCount:]( v2->_operationQueue,  "setAdjustsMaxConcurrentOperationCount:",  0LL);
    -[ISOperationQueue setMaxConcurrentOperationCount:](v2->_operationQueue, "setMaxConcurrentOperationCount:", 1LL);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[Daemon daemon](&OBJC_CLASS___Daemon, "daemon"));
    [v14 addKeepAliveOperationQueue:v2->_operationQueue];

    v15 = (dispatch_queue_s *)v2->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100074334;
    block[3] = &unk_10034AC30;
    v16 = v2;
    v24 = v16;
    dispatch_async(v15, block);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v17 addObserver:v16 selector:"_networkTypeChanged:" name:ISNetworkTypeChangedNotification object:0];
    [v17 addObserver:v16 selector:"_urlBagDidLoadNotification:" name:ISURLBagDidLoadNotification object:0];
    [v17 addObserver:v16 selector:"_accountStoreChangedNotification:" name:SSAccountStoreChangedNotification object:0];
    [v17 addObserver:v16 selector:"_storeFrontChangedNotification:" name:SSDeviceStoreFrontChangedNotification object:0];
    objc_initWeak(&location, v16);
    v26 = @"UserAssignedDeviceName";
    v18 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v26, 1LL);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_100074398;
    v20[3] = &unk_10034C858;
    objc_copyWeak(&v21, &location);
    v16->_deviceNameChangedToken = (MGNotificationTokenStruct *)MGRegisterForUpdates(v18, 0LL, 0LL, v20);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }

  return v2;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self name:ISNetworkTypeChangedNotification object:0];
  [v3 removeObserver:self name:ISURLBagDidLoadNotification object:0];
  [v3 removeObserver:self name:SSAccountStoreChangedNotification object:0];
  [v3 removeObserver:self name:SSDeviceStoreFrontChangedNotification object:0];
  MGCancelNotifications(self->_deviceNameChangedToken);
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  v4 = self->_connections;
  id v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)i);
        [v9 setDelegate:0];
        [v9 removeFromRunLoop];
      }

      id v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
    }

    while (v6);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[Daemon daemon](&OBJC_CLASS___Daemon, "daemon"));
  [v10 removeKeepAliveOperationQueue:self->_operationQueue];

  -[NSMutableArray makeObjectsPerformSelector:withObject:]( self->_tokenOperations,  "makeObjectsPerformSelector:withObject:",  "setCompletionBlock:",  0LL);
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___PushNotificationController;
  -[PushNotificationController dealloc](&v11, "dealloc");
}

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100074618;
  block[3] = &unk_10034AC90;
  void block[4] = a1;
  if (qword_1003A32C0 != -1) {
    dispatch_once(&qword_1003A32C0, block);
  }
  return (id)qword_1003A32B8;
}

+ (id)soundFilesDirectoryPath
{
  v2 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 lastObject]);

  id v5 = -[NSArray initWithObjects:]( objc_alloc(&OBJC_CLASS___NSArray),  "initWithObjects:",  v4,  @"com.apple.itunesstored",  @"APNS_Sounds",  0LL);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString pathWithComponents:](&OBJC_CLASS___NSString, "pathWithComponents:", v5));

  return v6;
}

- (void)postClientNotificationWithUserInfo:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100074760;
  v7[3] = &unk_10034AD58;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)postPushTokens
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100074CCC;
  block[3] = &unk_10034AC30;
  void block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)registerTokenForEnvironmentName:(id)a3 accountIdentifier:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100074F40;
  v15[3] = &unk_10034C880;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(dispatchQueue, v15);
}

- (void)observeXPCServer:(id)a3
{
  id v4 = a3;
  [v4 addObserver:self selector:"popRemoteNotificationWithMessage:connection:" forMessage:79];
  [v4 addObserver:self selector:"registerNotificationClientWithMessage:connection:" forMessage:80];
  [v4 addObserver:self selector:"showLocalNotificationWithMessage:connection:" forMessage:78];
  [v4 addObserver:self selector:"unregisterNotificationClientWithMessage:connection:" forMessage:81];
}

- (void)popRemoteNotificationWithMessage:(id)a3 connection:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100075304;
  v7[3] = &unk_10034C8A8;
  id v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  -[PushNotificationController _handleMessage:connection:usingBlock:]( v8,  "_handleMessage:connection:usingBlock:",  v6,  v5,  v7);
}

- (void)registerNotificationClientWithMessage:(id)a3 connection:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000755F0;
  v7[3] = &unk_10034C8A8;
  id v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  -[PushNotificationController _handleMessage:connection:usingBlock:]( v8,  "_handleMessage:connection:usingBlock:",  v6,  v5,  v7);
}

- (void)showLocalNotificationWithMessage:(id)a3 connection:(id)a4
{
  id v9 = a3;
  if (SSXPCConnectionHasEntitlement(a4, kSSITunesStorePrivateEntitlement))
  {
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    uint64_t v7 = (void *)SSXPCDictionaryCopyObjectWithClass(v9, "1", v6);
    id v8 = -[PushNotificationDisplayOperation initWithNotificationUserInfo:]( objc_alloc(&OBJC_CLASS___PushNotificationDisplayOperation),  "initWithNotificationUserInfo:",  v7);
    -[ISOperationQueue addOperation:](self->_operationQueue, "addOperation:", v8);
  }
}

- (void)unregisterNotificationClientWithMessage:(id)a3 connection:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100075978;
  v7[3] = &unk_10034C8A8;
  id v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  -[PushNotificationController _handleMessage:connection:usingBlock:]( v8,  "_handleMessage:connection:usingBlock:",  v6,  v5,  v7);
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100075D90;
  block[3] = &unk_10034BCE8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

- (void)connection:(id)a3 didReceiveMessageForTopic:(id)a4 userInfo:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000760A8;
  block[3] = &unk_10034BCE8;
  void block[4] = self;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(dispatchQueue, block);
}

- (void)_accountStoreChangedNotification:(id)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100076768;
  block[3] = &unk_10034AC30;
  void block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_deviceNameChanged
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100076820;
  block[3] = &unk_10034AC30;
  void block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_networkTypeChanged:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[ISNetworkObserver sharedInstance](&OBJC_CLASS___ISNetworkObserver, "sharedInstance", a3));
  id v5 = [v4 networkType];

  if (v5)
  {
    dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100076A58;
    block[3] = &unk_10034AC30;
    void block[4] = self;
    dispatch_async(dispatchQueue, block);
  }

- (void)_storeFrontChangedNotification:(id)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100076B30;
  block[3] = &unk_10034AC30;
  void block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_urlBagDidLoadNotification:(id)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100076C24;
  block[3] = &unk_10034AC30;
  void block[4] = self;
  dispatch_async(dispatchQueue, block);
  id v4 = objc_alloc_init(&OBJC_CLASS___PushNotificationSoundsSyncOperation);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[ISOperationQueue mainQueue](&OBJC_CLASS___ISOperationQueue, "mainQueue"));
  [v5 addOperation:v4];
}

- (void)_addNotificationWithUserInfo:(id)a3 client:(id)a4 context:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v12 = (id)objc_claimAutoreleasedReturnValue(+[PushNotification entityFromContext:](&OBJC_CLASS___PushNotification, "entityFromContext:", v7));
  id v10 = -[PushNotification initWithEntity:insertIntoManagedObjectContext:]( objc_alloc(&OBJC_CLASS___PushNotification),  "initWithEntity:insertIntoManagedObjectContext:",  v12,  v7);

  -[PushNotification setClient:](v10, "setClient:", v8);
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v9,  200LL,  0LL,  0LL));

  -[PushNotification setUserInfo:](v10, "setUserInfo:", v11);
}

+ (BOOL)_amsHandleNotification:(id)a3 urlBag:(id)a4
{
  id v6 = a3;
  if (!a4)
  {
    a4 = (id)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!a4) {
      a4 = (id)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v8 = [a4 shouldLog];
    else {
      unsigned int v9 = v8;
    }
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([a4 OSLogObject]);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v11 = v9;
    }
    else {
      uint64_t v11 = v9 & 2;
    }
    if ((_DWORD)v11)
    {
      int v14 = 138412290;
      id v15 = a1;
      id v12 = (void *)_os_log_send_and_compose_impl( v11,  0LL,  0LL,  0LL,  &_mh_execute_header,  v10,  0LL,  "%@: Notification not handled by AMSPushHandler: Bag is nil",  &v14,  12);

      if (!v12)
      {
LABEL_17:

        LOBYTE(a4) = 0;
        goto LABEL_18;
      }

      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v12,  4LL));
      free(v12);
      SSFileLog(a4, @"%@");
    }

    goto LABEL_17;
  }

  id v7 = [a1 _newPushHandlerWithURLBag:a4];
  LODWORD(a4) = [v7 shouldHandleNotification:v6];
  if ((_DWORD)a4) {
    [v7 handleNotification:v6];
  }

LABEL_18:
  return (char)a4;
}

- (id)_bag
{
  v2 = objc_alloc(&OBJC_CLASS___ISLoadURLBagOperation);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SSURLBagContext contextWithBagType:](&OBJC_CLASS___SSURLBagContext, "contextWithBagType:", 0LL));
  id v4 = -[ISLoadURLBagOperation initWithBagContext:](v2, "initWithBagContext:", v3);

  -[ISLoadURLBagOperation run](v4, "run");
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ISLoadURLBagOperation URLBag](v4, "URLBag"));

  return v5;
}

- (id)_clientForIdentifier:(id)a3 createIfNeeded:(BOOL)a4 inContext:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[PushNotificationClient entityFromContext:]( &OBJC_CLASS___PushNotificationClient,  "entityFromContext:",  v9));
  uint64_t v11 = objc_alloc_init(&OBJC_CLASS___NSFetchRequest);
  -[NSFetchRequest setEntity:](v11, "setEntity:", v10);
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"clientIdentifier=%@",  v8));
  -[NSFetchRequest setPredicate:](v11, "setPredicate:", v12);

  id v38 = 0LL;
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v9 executeFetchRequest:v11 error:&v38]);
  id v14 = v38;
  id v15 = v14;
  if (!v13)
  {
    id v32 = v8;
    id v17 = v14;
    id v18 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v18) {
      id v18 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v19 = [v18 shouldLog];
    else {
      unsigned int v20 = v19;
    }
    id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue([v18 OSLogObject]);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v22 = v20;
    }
    else {
      uint64_t v22 = v20 & 2;
    }
    if ((_DWORD)v22)
    {
      v23 = (void *)objc_opt_class(self);
      int v40 = 138412546;
      v41 = v23;
      __int16 v42 = 2112;
      id v43 = v17;
      id v24 = v23;
      objc_super v25 = (void *)_os_log_send_and_compose_impl( v22,  0LL,  0LL,  0LL,  &_mh_execute_header,  v21,  0LL,  "%@: Could not fetch clients: %@",  &v40,  22);

      id v15 = v17;
      id v8 = v32;
      if (!v25)
      {
LABEL_28:

        id v16 = 0LL;
        goto LABEL_29;
      }

      id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v25,  4LL));
      free(v25);
      SSFileLog(v18, @"%@");
    }

    else
    {
      id v15 = v17;
      id v8 = v32;
    }

    goto LABEL_28;
  }

  if ([v13 count] == (id)1)
  {
    id v16 = (PushNotificationClient *)objc_claimAutoreleasedReturnValue([v13 objectAtIndex:0]);
  }

  else
  {
    v33 = v15;
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    id v26 = v13;
    id v27 = [v26 countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v27)
    {
      id v28 = v27;
      uint64_t v29 = *(void *)v35;
      do
      {
        for (i = 0LL; i != v28; i = (char *)i + 1)
        {
          if (*(void *)v35 != v29) {
            objc_enumerationMutation(v26);
          }
          [v9 deleteObject:*(void *)(*((void *)&v34 + 1) + 8 * (void)i)];
        }

        id v28 = [v26 countByEnumeratingWithState:&v34 objects:v39 count:16];
      }

      while (v28);
    }

    if (v6)
    {
      id v16 = -[PushNotificationClient initWithEntity:insertIntoManagedObjectContext:]( objc_alloc(&OBJC_CLASS___PushNotificationClient),  "initWithEntity:insertIntoManagedObjectContext:",  v10,  v9);
      -[PushNotificationClient setClientIdentifier:](v16, "setClientIdentifier:", v8);
    }

    else
    {
      id v16 = 0LL;
    }

    id v15 = v33;
    sub_10003E244(v9);
  }

- (void)_closeEnvironment:(id)a3 inContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 environmentName]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v9) {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v10 = [v9 shouldLog];
  else {
    LODWORD(v11) = v10;
  }
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 OSLogObject]);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO)) {
    uint64_t v11 = v11;
  }
  else {
    v11 &= 2u;
  }
  if ((_DWORD)v11)
  {
    int v25 = 138412546;
    id v26 = (id)objc_opt_class(self);
    __int16 v27 = 2112;
    id v28 = v6;
    id v13 = v26;
    id v14 = (void *)_os_log_send_and_compose_impl( v11,  0LL,  0LL,  0LL,  &_mh_execute_header,  v12,  1LL,  "%@: Deleting environment: %@",  &v25,  22);

    if (!v14) {
      goto LABEL_13;
    }
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v14,  4LL));
    free(v14);
    v23 = v12;
    SSFileLog(v9, @"%@");
  }

LABEL_13:
  [v7 deleteObject:v6];

  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_connections, "objectForKey:", v8));
  if (v15)
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v16) {
      id v16 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v17 = objc_msgSend(v16, "shouldLog", v23);
    else {
      LODWORD(v18) = v17;
    }
    unsigned int v19 = (os_log_s *)objc_claimAutoreleasedReturnValue([v16 OSLogObject]);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO)) {
      uint64_t v18 = v18;
    }
    else {
      v18 &= 2u;
    }
    if ((_DWORD)v18)
    {
      unsigned int v20 = (void *)objc_opt_class(self);
      int v25 = 138412546;
      id v26 = v20;
      __int16 v27 = 2112;
      id v28 = v8;
      id v21 = v20;
      LODWORD(v24) = 22;
      uint64_t v22 = (void *)_os_log_send_and_compose_impl( v18,  0LL,  0LL,  0LL,  &_mh_execute_header,  v19,  1LL,  "%@: Destroying connection for %@",  &v25,  v24);

      if (!v22)
      {
LABEL_26:

        [v15 setDelegate:0];
        [v15 setEnabledTopics:0];
        [v15 removeFromRunLoop];
        -[NSMutableDictionary removeObjectForKey:](self->_connections, "removeObjectForKey:", v8);
        goto LABEL_27;
      }

      unsigned int v19 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v22,  4LL));
      free(v22);
      SSFileLog(v16, @"%@");
    }

    goto LABEL_26;
  }

- (id)_enabledTopics
{
  if (-[PushNotificationController _isPushEnabled](self, "_isPushEnabled")) {
    v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObject:]( &OBJC_CLASS___NSArray,  "arrayWithObject:",  @"com.apple.itunesstored"));
  }
  else {
    v2 = 0LL;
  }
  return v2;
}

- (id)_environmentForName:(id)a3 createIfNeeded:(BOOL)a4 inContext:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue( +[PushNotificationEnvironment entityFromContext:]( &OBJC_CLASS___PushNotificationEnvironment,  "entityFromContext:",  v9));
  uint64_t v11 = objc_alloc_init(&OBJC_CLASS___NSFetchRequest);
  -[NSFetchRequest setEntity:](v11, "setEntity:", v10);
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"environmentName = %@",  v8));
  -[NSFetchRequest setPredicate:](v11, "setPredicate:", v12);

  id v39 = 0LL;
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v9 executeFetchRequest:v11 error:&v39]);
  id v14 = v39;
  id v15 = v14;
  if (!v13)
  {
    id v33 = v8;
    id v17 = v14;
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v18) {
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v19 = [v18 shouldLog];
    else {
      unsigned int v20 = v19;
    }
    id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue([v18 OSLogObject]);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v22 = v20;
    }
    else {
      uint64_t v22 = v20 & 2;
    }
    if ((_DWORD)v22)
    {
      v23 = (void *)objc_opt_class(self);
      int v41 = 138412546;
      __int16 v42 = v23;
      __int16 v43 = 2112;
      id v44 = v17;
      id v24 = v23;
      int v25 = (void *)_os_log_send_and_compose_impl( v22,  0LL,  0LL,  0LL,  &_mh_execute_header,  v21,  0LL,  "%@: Could not fetch environments: %@",  &v41,  22);

      id v15 = v17;
      id v8 = v33;
      if (!v25)
      {
LABEL_28:

        id v16 = 0LL;
        goto LABEL_29;
      }

      id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v25,  4LL));
      free(v25);
      SSFileLog(v18, @"%@");
    }

    else
    {
      id v15 = v17;
      id v8 = v33;
    }

    goto LABEL_28;
  }

  if ([v13 count] == (id)1)
  {
    id v16 = (PushNotificationEnvironment *)objc_claimAutoreleasedReturnValue([v13 objectAtIndex:0]);
  }

  else
  {
    __int128 v34 = v15;
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    id v26 = v13;
    id v27 = [v26 countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (v27)
    {
      id v28 = v27;
      uint64_t v29 = *(void *)v36;
      do
      {
        for (i = 0LL; i != v28; i = (char *)i + 1)
        {
          if (*(void *)v36 != v29) {
            objc_enumerationMutation(v26);
          }
          [v9 deleteObject:*(void *)(*((void *)&v35 + 1) + 8 * (void)i)];
        }

        id v28 = [v26 countByEnumeratingWithState:&v35 objects:v40 count:16];
      }

      while (v28);
    }

    if (v6)
    {
      id v16 = -[PushNotificationEnvironment initWithEntity:insertIntoManagedObjectContext:]( objc_alloc(&OBJC_CLASS___PushNotificationEnvironment),  "initWithEntity:insertIntoManagedObjectContext:",  v10,  v9);
      -[PushNotificationEnvironment setEnvironmentName:](v16, "setEnvironmentName:", v8);
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 0LL));
      -[PushNotificationEnvironment setLastAccountIdentifier:](v16, "setLastAccountIdentifier:", v31);
    }

    else
    {
      id v16 = 0LL;
    }

    sub_10003E244(v9);
    id v15 = v34;
  }

- (id)_environmentNameForConnection:(id)a3
{
  id v4 = a3;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v5 = self->_connections;
  id v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        unsigned int v10 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        id v11 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_connections, "objectForKey:", v10, (void)v14));

        if (v11 == v4)
        {
          id v12 = v10;
          goto LABEL_11;
        }
      }

      id v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
      if (v7) {
        continue;
      }
      break;
    }
  }

  id v12 = 0LL;
LABEL_11:

  return v12;
}

- (void)_fireRegisterBlocksAfterOperation:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 authenticationContext]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 requiredUniqueIdentifier]);

  int v25 = v4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 environmentName]);
  uint64_t v9 = (uint64_t)-[NSMutableArray count](self->_registerBlocks, "count");
  if (v9 >= 1)
  {
    unint64_t v10 = v9 + 1;
    do
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_registerBlocks, "objectAtIndex:", v10 - 2));
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 accountIdentifier]);
      if ([v12 isEqualToNumber:v7])
      {
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 environmentName]);
        unsigned int v14 = [v13 isEqualToString:v8];

        if (v14)
        {
          __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v11 block]);
          -[NSMutableArray insertObject:atIndex:](v5, "insertObject:atIndex:", v15, 0LL);

          -[NSMutableArray removeObjectAtIndex:](self->_registerBlocks, "removeObjectAtIndex:", v10 - 2);
        }
      }

      else
      {
      }

      --v10;
    }

    while (v10 > 1);
  }

  if (-[NSMutableArray count](v5, "count"))
  {
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v16) {
      __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v17 = [v16 shouldLog];
    else {
      unsigned int v18 = v17;
    }
    unsigned int v19 = (os_log_s *)objc_claimAutoreleasedReturnValue([v16 OSLogObject]);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO)) {
      uint64_t v20 = v18;
    }
    else {
      uint64_t v20 = v18 & 2;
    }
    if ((_DWORD)v20)
    {
      id v21 = (void *)objc_opt_class(self);
      id v22 = v21;
      int v28 = 138412546;
      uint64_t v29 = v21;
      __int16 v30 = 2048;
      id v31 = -[NSMutableArray count](v5, "count");
      v23 = (void *)_os_log_send_and_compose_impl( v20,  0LL,  0LL,  0LL,  &_mh_execute_header,  v19,  1LL,  "%@: Firing %ld register blocks",  &v28,  22);

      if (!v23)
      {
LABEL_21:

        notificationQueue = (dispatch_queue_s *)self->_notificationQueue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_100077E48;
        block[3] = &unk_10034AC30;
        id v27 = v5;
        dispatch_async(notificationQueue, block);

        goto LABEL_22;
      }

      unsigned int v19 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v23,  4LL));
      free(v23);
      SSFileLog(v16, @"%@");
    }

    goto LABEL_21;
  }

- (void)_handleMessage:(id)a3 connection:(id)a4 usingBlock:(id)a5
{
  id v8 = a3;
  uint64_t v9 = (_xpc_connection_s *)a4;
  id v10 = a5;
  id v11 = -[XPCClient initWithInputConnection:](objc_alloc(&OBJC_CLASS___XPCClient), "initWithInputConnection:", v9);
  if (-[XPCClient hasEntitlements](v11, "hasEntitlements"))
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[Daemon daemon](&OBJC_CLASS___Daemon, "daemon"));
    [v12 takeKeepAliveAssertion:@"com.apple.itunesstore.PushNotificationController"];

    dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100078058;
    v15[3] = &unk_10034C8D0;
    id v17 = v10;
    __int128 v16 = v11;
    dispatch_async(dispatchQueue, v15);
  }

  else
  {
    xpc_object_t reply = xpc_dictionary_create_reply(v8);
    xpc_connection_send_message(v9, reply);
  }
}

- (BOOL)_isPushEnabled
{
  return self->_pushEnabledState != 0;
}

- (BOOL)_isValidEnvironment:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {
    else {
      unsigned __int8 v5 = [v3 isEqualToString:APSEnvironmentDevelopment];
    }
  }

  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (void)_loadConnectionsInContext:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v5) {
    unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v6 = [v5 shouldLog];
  else {
    LODWORD(v7) = v6;
  }
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 OSLogObject]);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO)) {
    uint64_t v7 = v7;
  }
  else {
    v7 &= 2u;
  }
  if ((_DWORD)v7)
  {
    *(_DWORD *)v57 = 138412290;
    *(void *)&v57[4] = objc_opt_class(self);
    id v9 = *(id *)&v57[4];
    id v10 = (void *)_os_log_send_and_compose_impl( v7,  0LL,  0LL,  0LL,  &_mh_execute_header,  v8,  1LL,  "%@: Reloading APS connections",  v57,  12);

    if (!v10) {
      goto LABEL_13;
    }
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v10,  4LL));
    free(v10);
    v47 = v8;
    SSFileLog(v5, @"%@");
  }

LABEL_13:
  id v11 = objc_alloc_init(&OBJC_CLASS___NSFetchRequest);
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[PushNotificationEnvironment entityFromContext:]( &OBJC_CLASS___PushNotificationEnvironment,  "entityFromContext:",  v4));
  -[NSFetchRequest setEntity:](v11, "setEntity:", v12);

  id v55 = 0LL;
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v4 executeFetchRequest:v11 error:&v55]);
  id v14 = v55;
  uint64_t v15 = objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  __int128 v16 = (void *)v15;
  v50 = v14;
  if (!v13)
  {
    if (!v15) {
      __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v30 = objc_msgSend(v16, "shouldLog", v47);
    else {
      unsigned int v31 = v30;
    }
    id v32 = (os_log_s *)objc_claimAutoreleasedReturnValue([v16 OSLogObject]);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v33 = v31;
    }
    else {
      uint64_t v33 = v31 & 2;
    }
    if ((_DWORD)v33)
    {
      __int128 v34 = (void *)objc_opt_class(self);
      *(_DWORD *)v57 = 138412546;
      *(void *)&v57[4] = v34;
      *(_WORD *)&v57[12] = 2112;
      *(void *)&v57[14] = v14;
      id v35 = v34;
      LODWORD(v49) = 22;
      __int128 v36 = (void *)_os_log_send_and_compose_impl( v33,  0LL,  0LL,  0LL,  &_mh_execute_header,  v32,  0LL,  "%@: Could not fetch environment entities: %@",  v57,  v49);

      if (!v36)
      {
LABEL_46:

        goto LABEL_47;
      }

      id v32 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v36,  4LL));
      free(v36);
      v48 = v32;
      SSFileLog(v16, @"%@");
    }

    goto LABEL_46;
  }

  if (!v15) {
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v17 = objc_msgSend(v16, "shouldLog", v47);
  else {
    unsigned int v18 = v17;
  }
  unsigned int v19 = (os_log_s *)objc_claimAutoreleasedReturnValue([v16 OSLogObject]);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO)) {
    uint64_t v20 = v18;
  }
  else {
    uint64_t v20 = v18 & 2;
  }
  if (!(_DWORD)v20) {
    goto LABEL_25;
  }
  id v21 = (void *)objc_opt_class(self);
  id v22 = v21;
  id v23 = [v13 count];
  *(_DWORD *)v57 = 138412546;
  *(void *)&v57[4] = v21;
  *(_WORD *)&v57[12] = 2048;
  *(void *)&v57[14] = v23;
  LODWORD(v49) = 22;
  id v24 = (void *)_os_log_send_and_compose_impl( v20,  0LL,  0LL,  0LL,  &_mh_execute_header,  v19,  1LL,  "%@: Reloading APS connections for %lu environments",  v57,  v49);

  if (v24)
  {
    unsigned int v19 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v24,  4LL));
    free(v24);
    v48 = v19;
    SSFileLog(v16, @"%@");
LABEL_25:
  }

  __int128 v53 = 0u;
  __int128 v54 = 0u;
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  id v25 = v13;
  id v26 = [v25 countByEnumeratingWithState:&v51 objects:v56 count:16];
  if (v26)
  {
    id v27 = v26;
    uint64_t v28 = *(void *)v52;
    do
    {
      for (i = 0LL; i != v27; i = (char *)i + 1)
      {
        if (*(void *)v52 != v28) {
          objc_enumerationMutation(v25);
        }
        -[PushNotificationController _openConnectionForEnvironment:]( self,  "_openConnectionForEnvironment:",  *(void *)(*((void *)&v51 + 1) + 8LL * (void)i),  v48);
      }

      id v27 = [v25 countByEnumeratingWithState:&v51 objects:v56 count:16];
    }

    while (v27);
  }

  sub_10003E244(v4);
LABEL_47:
  *(void *)v57 = APSEnvironmentProduction;
  id v37 = APSEnvironmentDevelopment;
  uint64_t v38 = 0LL;
  *(void *)&v57[8] = v37;
  char v39 = 1;
  do
  {
    char v40 = v39;
    uint64_t v41 = *(void *)&v57[8 * v38];
    __int16 v42 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_connections, "objectForKey:", v41, v48));

    if (!v42)
    {
      id v43 = objc_alloc(&OBJC_CLASS___APSConnection);
      id v44 = (void *)objc_claimAutoreleasedReturnValue( -[PushNotificationController _portNameForEnvironmentName:]( self,  "_portNameForEnvironmentName:",  v41));
      id v45 = [v43 initWithEnvironmentName:v41 namedDelegatePort:v44];

      [v45 setEnabledTopics:0];
    }

    char v39 = 0;
    uint64_t v38 = 1LL;
  }

  while ((v40 & 1) != 0);
  for (uint64_t j = 8LL; j != -8; j -= 8LL)
}

- (id)_newAPSConnectionWithEnvironment:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(&OBJC_CLASS___APSConnection);
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(-[PushNotificationController _portNameForEnvironmentName:](self, "_portNameForEnvironmentName:", v4));
  id v7 = [v5 initWithEnvironmentName:v4 namedDelegatePort:v6];

  [v7 setDelegate:self];
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PushNotificationController _enabledTopics](self, "_enabledTopics"));
  [v7 setEnabledTopics:v8];

  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](&OBJC_CLASS___NSRunLoop, "mainRunLoop"));
  [v7 scheduleInRunLoop:v9];

  return v7;
}

- (id)_newPostTokenOperationForEnvironment:(id)a3 account:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc(&OBJC_CLASS___PostPushNotificationTokenOperation);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 environmentName]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 tokenData]);

  id v10 = -[PostPushNotificationTokenOperation initWithEnvironmentName:tokenData:]( v7,  "initWithEnvironmentName:tokenData:",  v8,  v9);
  id v11 = -[SSAuthenticationContext initWithAccount:]( objc_alloc(&OBJC_CLASS___SSAuthenticationContext),  "initWithAccount:",  v5);

  -[PostPushNotificationTokenOperation setAuthenticationContext:](v10, "setAuthenticationContext:", v11);
  return v10;
}

+ (id)_newPushHandlerWithURLBag:(id)a3
{
  id v10 = @"4";
  id v11 = @"22";
  id v12 = @"25";
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v10, 3LL));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v4, v10, v11, v12));

  id v6 = [[AMSPushConfiguration alloc] initWithEnabledActionTypes:v5];
  [v6 setUserNotificationExtensionId:@"mst-notification-category"];
  id v7 = [[ISAMSBagShim alloc] initWithURLBag:v3];

  id v8 = [[AMSPushHandler alloc] initWithConfiguration:v6 bag:v7];
  return v8;
}

- (int64_t)_numberOfClientsInContext:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___NSFetchRequest);
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[PushNotificationClient entityFromContext:]( &OBJC_CLASS___PushNotificationClient,  "entityFromContext:",  v3));
  -[NSFetchRequest setEntity:](v4, "setEntity:", v5);

  id v6 = [v3 countForFetchRequest:v4 error:0];
  return (int64_t)v6;
}

- (void)_openConnectionForEnvironment:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 environmentName]);
  if (!-[PushNotificationController _isValidEnvironment:](self, "_isValidEnvironment:", v5)) {
    goto LABEL_19;
  }
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_connections, "objectForKey:", v5));
  if (!v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v7) {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v8 = [v7 shouldLog];
    else {
      LODWORD(v9) = v8;
    }
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 OSLogObject]);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
      uint64_t v9 = v9;
    }
    else {
      v9 &= 2u;
    }
    if ((_DWORD)v9)
    {
      int v19 = 138412546;
      id v20 = (id)objc_opt_class(self);
      __int16 v21 = 2112;
      id v22 = v4;
      id v11 = v20;
      id v12 = (void *)_os_log_send_and_compose_impl( v9,  0LL,  0LL,  0LL,  &_mh_execute_header,  v10,  1LL,  "%@: Creating connection for environment: %@",  &v19,  22);

      if (!v12)
      {
LABEL_15:

        id v6 = -[PushNotificationController _newAPSConnectionWithEnvironment:]( self,  "_newAPSConnectionWithEnvironment:",  v5);
        -[NSMutableDictionary setObject:forKey:](self->_connections, "setObject:forKey:", v6, v5);
        goto LABEL_16;
      }

      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v12,  4LL));
      free(v12);
      unsigned int v18 = v10;
      SSFileLog(v7, @"%@");
    }

    goto LABEL_15;
  }

- (id)_portNameForEnvironmentName:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:APSEnvironmentProduction])
  {
    id v4 = @"com.apple.itunesstored.aps";
  }

  else if ([v3 isEqualToString:APSEnvironmentDevelopment])
  {
    id v4 = @"com.apple.itunesstored.aps.dev";
  }

  else
  {
    id v4 = 0LL;
  }

  return (id)v4;
}

- (void)_postNotificationsAvailableForClient:(id)a3 inContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = objc_alloc_init(&OBJC_CLASS___NSFetchRequest);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[PushNotification entityFromContext:](&OBJC_CLASS___PushNotification, "entityFromContext:", v7));
  -[NSFetchRequest setEntity:](v8, "setEntity:", v9);

  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"client=%@",  v6));
  -[NSFetchRequest setPredicate:](v8, "setPredicate:", v10);

  uint64_t v11 = (uint64_t)[v7 countForFetchRequest:v8 error:0];
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v12) {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v13 = [v12 shouldLog];
  else {
    LODWORD(v14) = v13;
  }
  unsigned __int8 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue([v12 OSLogObject]);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO)) {
    uint64_t v14 = v14;
  }
  else {
    v14 &= 2u;
  }
  if ((_DWORD)v14)
  {
    __int128 v16 = (void *)objc_opt_class(self);
    id v17 = v16;
    unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue([v6 clientIdentifier]);
    int v20 = 138412802;
    __int16 v21 = v16;
    __int16 v22 = 2048;
    uint64_t v23 = v11;
    __int16 v24 = 2112;
    id v25 = v18;
    int v19 = (void *)_os_log_send_and_compose_impl( v14,  0LL,  0LL,  0LL,  &_mh_execute_header,  v15,  1LL,  "%@: Client has %ld pending notifications: %@",  &v20,  32);

    if (!v19) {
      goto LABEL_13;
    }
    unsigned __int8 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v19,  4LL));
    free(v19);
    SSFileLog(v12, @"%@");
  }

LABEL_13:
  if (v11 >= 1) {
    notify_post(kSSNotificationReceivedPushNotification);
  }
}

- (void)_postTokenForEnvironment:(id)a3
{
  id v4 = a3;
  if (-[PushNotificationController _isPushEnabled](self, "_isPushEnabled"))
  {
    -[PushNotificationController _setShouldAggressivelySendToken:](self, "_setShouldAggressivelySendToken:", 1LL);
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 environmentName]);
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    id v6 = self->_tokenOperations;
    id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v31,  v38,  16LL);
    if (v7)
    {
      uint64_t v8 = *(void *)v32;
LABEL_4:
      uint64_t v9 = 0LL;
      while (1)
      {
        if (*(void *)v32 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v31 + 1) + 8 * v9);
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 environmentName]);
        unsigned __int8 v12 = [v11 isEqualToString:v5];

        if ((v12 & 1) != 0) {
          break;
        }
        if (v7 == (id)++v9)
        {
          id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v31,  v38,  16LL);
          if (v7) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }

      id v21 = v10;

      if (v21) {
        goto LABEL_26;
      }
    }

    else
    {
LABEL_10:
    }

    __int16 v22 = (void *)objc_claimAutoreleasedReturnValue(+[SSAccountStore defaultStore](&OBJC_CLASS___SSAccountStore, "defaultStore"));
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v22 activeAccount]);
    id v21 = -[PushNotificationController _newPostTokenOperationForEnvironment:account:]( self,  "_newPostTokenOperationForEnvironment:account:",  v4,  v23);

    objc_initWeak((id *)location, v21);
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472LL;
    v29[2] = sub_100079344;
    v29[3] = &unk_10034C920;
    v29[4] = self;
    objc_copyWeak(&v30, (id *)location);
    [v21 setCompletionBlock:v29];
    tokenOperations = self->_tokenOperations;
    if (!tokenOperations)
    {
      id v25 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      id v27 = self->_tokenOperations;
      p_tokenOperations = &self->_tokenOperations;
      *p_tokenOperations = v25;

      tokenOperations = *p_tokenOperations;
    }

    -[NSMutableArray addObject:](tokenOperations, "addObject:", v21);
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(+[ISOperationQueue mainQueue](&OBJC_CLASS___ISOperationQueue, "mainQueue"));
    [v28 addOperation:v21];

    objc_destroyWeak(&v30);
    objc_destroyWeak((id *)location);
LABEL_26:
  }

  else
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v5) {
      id v5 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v13 = [v5 shouldLog];
    else {
      LODWORD(v14) = v13;
    }
    unsigned __int8 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 OSLogObject]);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      uint64_t v14 = v14;
    }
    else {
      v14 &= 2u;
    }
    if ((_DWORD)v14)
    {
      __int128 v16 = (void *)objc_opt_class(self);
      int64_t pushEnabledState = self->_pushEnabledState;
      *(_DWORD *)id location = 138543618;
      *(void *)&location[4] = v16;
      __int16 v36 = 2048;
      int64_t v37 = pushEnabledState;
      id v18 = v16;
      int v19 = (void *)_os_log_send_and_compose_impl( v14,  0LL,  0LL,  0LL,  &_mh_execute_header,  v15,  16LL,  "%{public}@: Unable to post token because push is not enabled (%ld)",  location,  22);

      if (v19)
      {
        int v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v19,  4LL));
        free(v19);
        SSFileLog(v5, @"%@");
      }
    }

    else
    {
    }
  }
}

- (void)_postTokensIfNecessaryInContext:(id)a3
{
}

- (void)_postTokensInContext:(id)a3 force:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (-[PushNotificationController _shouldAggressivelySendToken](self, "_shouldAggressivelySendToken"))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v7) {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v8 = [v7 shouldLog];
    else {
      LODWORD(v9) = v8;
    }
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 OSLogObject]);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v9 = v9;
    }
    else {
      v9 &= 2u;
    }
    if ((_DWORD)v9)
    {
      int v60 = 138543362;
      id v61 = (id)objc_opt_class(self);
      id v11 = v61;
      unsigned __int8 v12 = (void *)_os_log_send_and_compose_impl( v9,  0LL,  0LL,  0LL,  &_mh_execute_header,  v10,  0LL,  "%{public}@: Forcing the token request due to stored value",  &v60,  12);

      if (!v12)
      {
LABEL_14:

        BOOL v4 = 1;
        goto LABEL_15;
      }

      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v12,  4LL));
      free(v12);
      uint64_t v49 = v10;
      SSFileLog(v7, @"%@");
    }

    goto LABEL_14;
  }

- (void)_reloadActiveEnvironmentInContext:(id)a3
{
  id v4 = a3;
  int64_t pushEnabledState = self->_pushEnabledState;
  if (pushEnabledState != -1)
  {
    if (pushEnabledState == 1)
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PushNotificationController _bag](self, "_bag"));
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 valueForKey:@"push-notifications"]);
      unsigned int v8 = (__CFString *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"environment"]);
      if (!-[PushNotificationController _isValidEnvironment:](self, "_isValidEnvironment:", v8))
      {
        uint64_t v9 = (__CFString *)APSEnvironmentProduction;

        unsigned int v8 = v9;
      }
    }

    else
    {
      unsigned int v8 = 0LL;
    }

    if (!-[PushNotificationController _numberOfClientsInContext:](self, "_numberOfClientsInContext:", v4))
    {

      unsigned int v8 = 0LL;
    }

    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v10) {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v11 = [v10 shouldLog];
    else {
      LODWORD(v12) = v11;
    }
    unsigned int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 OSLogObject]);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO)) {
      uint64_t v12 = v12;
    }
    else {
      v12 &= 2u;
    }
    if ((_DWORD)v12)
    {
      uint64_t v14 = (void *)objc_opt_class(self);
      int v49 = 138412546;
      v50 = v14;
      __int16 v51 = 2112;
      id v52 = v8;
      id v15 = v14;
      __int128 v16 = (void *)_os_log_send_and_compose_impl( v12,  0LL,  0LL,  0LL,  &_mh_execute_header,  v13,  1LL,  "%@: Environment is now %@",  &v49,  22);

      if (!v16) {
        goto LABEL_21;
      }
      unsigned int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v16,  4LL));
      free(v16);
      SSFileLog(v10, @"%@");
    }

LABEL_21:
    id v17 = objc_alloc_init(&OBJC_CLASS___NSFetchRequest);
    id v18 = (void *)objc_claimAutoreleasedReturnValue( +[PushNotificationEnvironment entityFromContext:]( &OBJC_CLASS___PushNotificationEnvironment,  "entityFromContext:",  v4));
    -[NSFetchRequest setEntity:](v17, "setEntity:", v18);

    int v19 = @"nil";
    if (v8) {
      int v19 = v8;
    }
    id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"environmentName != %@",  v19));
    -[NSFetchRequest setPredicate:](v17, "setPredicate:", v20);

    id v47 = 0LL;
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v4 executeFetchRequest:v17 error:&v47]);
    id v22 = (__CFString *)v47;
    if (v21)
    {
      __int128 v45 = 0u;
      __int128 v46 = 0u;
      __int128 v43 = 0u;
      __int128 v44 = 0u;
      id v23 = v21;
      id v24 = [v23 countByEnumeratingWithState:&v43 objects:v48 count:16];
      if (v24)
      {
        id v25 = v24;
        uint64_t v26 = *(void *)v44;
        do
        {
          for (i = 0LL; i != v25; i = (char *)i + 1)
          {
            if (*(void *)v44 != v26) {
              objc_enumerationMutation(v23);
            }
            -[PushNotificationController _closeEnvironment:inContext:]( self,  "_closeEnvironment:inContext:",  *(void *)(*((void *)&v43 + 1) + 8LL * (void)i),  v4);
          }

          id v25 = [v23 countByEnumeratingWithState:&v43 objects:v48 count:16];
        }

        while (v25);
      }

- (void)_reloadDaemonClientInContext:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PushNotificationController _bag](self, "_bag"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForKey:@"automatic-downloads2"]);
  if (!v6) {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForKey:@"automatic-downloads"]);
  }
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"downloads-url"]);

  if (!v7)
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue( -[PushNotificationController _clientForIdentifier:createIfNeeded:inContext:]( self,  "_clientForIdentifier:createIfNeeded:inContext:",  @"com.apple.itunesstored",  0LL,  v4));
    if (!v15)
    {
LABEL_31:

      goto LABEL_32;
    }

    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v16) {
      __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v17 = [v16 shouldLog];
    else {
      LODWORD(v18) = v17;
    }
    int v19 = (os_log_s *)objc_claimAutoreleasedReturnValue([v16 OSLogObject]);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO)) {
      uint64_t v18 = v18;
    }
    else {
      v18 &= 2u;
    }
    if ((_DWORD)v18)
    {
      int v22 = 138412290;
      id v23 = (id)objc_opt_class(self);
      id v20 = v23;
      uint64_t v21 = (void *)_os_log_send_and_compose_impl( v18,  0LL,  0LL,  0LL,  &_mh_execute_header,  v19,  1LL,  "%@: Removing APS client for itunesstored",  &v22,  12);

      if (!v21)
      {
LABEL_30:

        [v4 deleteObject:v15];
        goto LABEL_31;
      }

      int v19 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v21,  4LL));
      free(v21);
      SSFileLog(v16, @"%@");
    }

    goto LABEL_30;
  }

  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v8) {
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v9 = [v8 shouldLog];
  else {
    LODWORD(v10) = v9;
  }
  unsigned int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 OSLogObject]);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO)) {
    uint64_t v10 = v10;
  }
  else {
    v10 &= 2u;
  }
  if (!(_DWORD)v10) {
    goto LABEL_15;
  }
  int v22 = 138412290;
  id v23 = (id)objc_opt_class(self);
  id v12 = v23;
  unsigned int v13 = (void *)_os_log_send_and_compose_impl( v10,  0LL,  0LL,  0LL,  &_mh_execute_header,  v11,  1LL,  "%@: Adding APS client for itunesstored",  &v22,  12);

  if (v13)
  {
    unsigned int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v13,  4LL));
    free(v13);
    SSFileLog(v8, @"%@");
LABEL_15:
  }

  id v14 =  -[PushNotificationController _clientForIdentifier:createIfNeeded:inContext:]( self,  "_clientForIdentifier:createIfNeeded:inContext:",  @"com.apple.itunesstored",  1LL,  v4);
LABEL_32:
}

- (void)_reloadPushStateInContext:(id)a3
{
  id v4 = a3;
  unsigned int v5 = -[PushNotificationController _isPushEnabled](self, "_isPushEnabled");
  -[PushNotificationController _updatePushEnabledState](self, "_updatePushEnabledState");
  -[PushNotificationController _reloadDaemonClientInContext:](self, "_reloadDaemonClientInContext:", v4);
  -[PushNotificationController _reloadActiveEnvironmentInContext:](self, "_reloadActiveEnvironmentInContext:", v4);
  unsigned int v6 = -[PushNotificationController _isPushEnabled](self, "_isPushEnabled");
  if (v5 == v6) {
    goto LABEL_32;
  }
  unsigned int v7 = v6;
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v8) {
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v9 = [v8 shouldLog];
  else {
    LODWORD(v10) = v9;
  }
  unsigned int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 OSLogObject]);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO)) {
    uint64_t v10 = v10;
  }
  else {
    v10 &= 2u;
  }
  if (!(_DWORD)v10) {
    goto LABEL_13;
  }
  id v12 = (void *)objc_opt_class(self);
  int64_t pushEnabledState = self->_pushEnabledState;
  int v43 = 138412546;
  __int128 v44 = v12;
  __int16 v45 = 2048;
  int64_t v46 = pushEnabledState;
  id v14 = v12;
  id v15 = (void *)_os_log_send_and_compose_impl( v10,  0LL,  0LL,  0LL,  &_mh_execute_header,  v11,  1LL,  "%@: Push enabledness changed: %ld",  &v43,  22);

  if (v15)
  {
    unsigned int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v15,  4LL));
    free(v15);
    id v32 = v11;
    SSFileLog(v8, @"%@");
LABEL_13:
  }

  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(-[PushNotificationController _enabledTopics](self, "_enabledTopics"));
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  unsigned int v17 = self->_connections;
  id v18 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v17,  "countByEnumeratingWithState:objects:count:",  &v37,  v42,  16LL);
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v38;
    do
    {
      for (i = 0LL; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v38 != v20) {
          objc_enumerationMutation(v17);
        }
        int v22 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_connections,  "objectForKey:",  *(void *)(*((void *)&v37 + 1) + 8LL * (void)i),  v32));
        [v22 setEnabledTopics:v16];
      }

      id v19 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v17,  "countByEnumeratingWithState:objects:count:",  &v37,  v42,  16LL);
    }

    while (v19);
  }

  if (v7)
  {
    -[PushNotificationController _postTokensIfNecessaryInContext:](self, "_postTokensIfNecessaryInContext:", v4);
  }

  else
  {
    id v23 = objc_alloc_init(&OBJC_CLASS___NSFetchRequest);
    id v24 = (void *)objc_claimAutoreleasedReturnValue( +[PushNotificationEnvironment entityFromContext:]( &OBJC_CLASS___PushNotificationEnvironment,  "entityFromContext:",  v4));
    -[NSFetchRequest setEntity:](v23, "setEntity:", v24);

    id v25 = (void *)objc_claimAutoreleasedReturnValue([v4 executeFetchRequest:v23 error:0]);
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    id v26 = [v25 countByEnumeratingWithState:&v33 objects:v41 count:16];
    if (v26)
    {
      id v27 = v26;
      uint64_t v28 = *(void *)v34;
      do
      {
        for (uint64_t j = 0LL; j != v27; uint64_t j = (char *)j + 1)
        {
          if (*(void *)v34 != v28) {
            objc_enumerationMutation(v25);
          }
          id v30 = *(void **)(*((void *)&v33 + 1) + 8LL * (void)j);
          unsigned int v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 0LL, v32));
          [v30 setLastAccountIdentifier:v31];
        }

        id v27 = [v25 countByEnumeratingWithState:&v33 objects:v41 count:16];
      }

      while (v27);
    }
  }

LABEL_32:
}

- (void)_resetLastRegisterAttemptTime
{
  self->_lastRegisterAttemptTime = CFAbsoluteTimeGetCurrent() + -3600.0;
}

- (void)_setShouldAggressivelySendToken:(BOOL)a3
{
  id v3 = (CFPropertyListRef *)&kCFBooleanTrue;
  if (!a3) {
    id v3 = (CFPropertyListRef *)&kCFBooleanFalse;
  }
  id v4 = (const __CFString *)kSSUserDefaultsIdentifier;
  CFPreferencesSetAppValue(@"ShouldForcePushTokenRequest", *v3, kSSUserDefaultsIdentifier);
  CFPreferencesAppSynchronize(v4);
}

- (BOOL)_shouldAggressivelySendToken
{
  return CFPreferencesGetAppBooleanValue(@"ShouldForcePushTokenRequest", kSSUserDefaultsIdentifier, 0LL) != 0;
}

- (void)_updateEnvironmentAfterTokenPost:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSThread beginPrivateManagedContextSession]( &OBJC_CLASS___NSThread,  "beginPrivateManagedContextSession"));
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v4 environmentName]);
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue( -[PushNotificationController _environmentForName:createIfNeeded:inContext:]( self,  "_environmentForName:createIfNeeded:inContext:",  v6,  0LL,  v5));

  if (v7)
  {
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v4 authenticationContext]);
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v8 requiredUniqueIdentifier]);

    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v10) {
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v11 = [v10 shouldLog];
    else {
      LODWORD(v12) = v11;
    }
    unsigned int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 OSLogObject]);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO)) {
      uint64_t v12 = v12;
    }
    else {
      v12 &= 2u;
    }
    if ((_DWORD)v12)
    {
      id v14 = (void *)objc_opt_class(self);
      id v15 = v14;
      __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v4 environmentName]);
      int v19 = 138412802;
      uint64_t v20 = v14;
      __int16 v21 = 2112;
      int v22 = v16;
      __int16 v23 = 2112;
      id v24 = v9;
      unsigned int v17 = (void *)_os_log_send_and_compose_impl( v12,  0LL,  0LL,  0LL,  &_mh_execute_header,  v13,  1LL,  "%@: Posted token for %@ for account %@",  &v19,  32);

      if (!v17)
      {
LABEL_14:

        [v7 setLastAccountIdentifier:v9];
        sub_10003E244(v5);

        goto LABEL_15;
      }

      unsigned int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v17,  4LL));
      free(v17);
      id v18 = v13;
      SSFileLog(v10, @"%@");
    }

    goto LABEL_14;
  }

- (void)_updatePushEnabledState
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[PushNotificationController _bag](self, "_bag"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[SSAccountStore defaultStore](&OBJC_CLASS___SSAccountStore, "defaultStore"));
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 activeAccount]);

  if (v5)
  {
    if (v3)
    {
      unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForKey:@"push-notifications"]);

      if (v6)
      {
        self->_int64_t pushEnabledState = 1LL;
        unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
        if (!v7) {
          unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
        }
        unsigned int v8 = [v7 shouldLog];
        else {
          LODWORD(v9) = v8;
        }
        uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 OSLogObject]);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
          uint64_t v9 = v9;
        }
        else {
          v9 &= 2u;
        }
        if (!(_DWORD)v9) {
          goto LABEL_46;
        }
      }

      else
      {
        self->_int64_t pushEnabledState = 0LL;
        unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
        if (!v7) {
          unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
        }
        unsigned int v21 = [v7 shouldLog];
        else {
          LODWORD(v9) = v21;
        }
        uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 OSLogObject]);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
          uint64_t v9 = v9;
        }
        else {
          v9 &= 2u;
        }
        if (!(_DWORD)v9) {
          goto LABEL_46;
        }
      }

      int v22 = (void *)objc_opt_class(self);
      int64_t pushEnabledState = self->_pushEnabledState;
      *(_DWORD *)id v25 = 138543618;
      *(void *)&v25[4] = v22;
      *(_WORD *)&v25[12] = 2048;
      *(void *)&v25[14] = pushEnabledState;
      id v15 = v22;
      uint64_t v16 = _os_log_send_and_compose_impl( v9,  0LL,  0LL,  0LL,  &_mh_execute_header,  v10,  1LL,  "%{public}@: Updated push state to %ld",  v25,  22,  *(_OWORD *)v25,  *(void *)&v25[16]);
    }

    else
    {
      self->_int64_t pushEnabledState = -1LL;
      unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
      if (!v7) {
        unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
      }
      unsigned int v17 = [v7 shouldLog];
      else {
        LODWORD(v18) = v17;
      }
      uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 OSLogObject]);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
        uint64_t v18 = v18;
      }
      else {
        v18 &= 2u;
      }
      if (!(_DWORD)v18) {
        goto LABEL_46;
      }
      int v19 = (void *)objc_opt_class(self);
      int64_t v20 = self->_pushEnabledState;
      *(_DWORD *)id v25 = 138543618;
      *(void *)&v25[4] = v19;
      *(_WORD *)&v25[12] = 2048;
      *(void *)&v25[14] = v20;
      id v15 = v19;
      uint64_t v16 = _os_log_send_and_compose_impl( v18,  0LL,  0LL,  0LL,  &_mh_execute_header,  v10,  1LL,  "%{public}@: Updated push state to %ld -- no production bag",  v25,  22,  *(_OWORD *)v25,  *(void *)&v25[16]);
    }
  }

  else
  {
    self->_int64_t pushEnabledState = 0LL;
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v7) {
      unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v11 = [v7 shouldLog];
    else {
      LODWORD(v12) = v11;
    }
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 OSLogObject]);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
      uint64_t v12 = v12;
    }
    else {
      v12 &= 2u;
    }
    if (!(_DWORD)v12) {
      goto LABEL_46;
    }
    unsigned int v13 = (void *)objc_opt_class(self);
    int64_t v14 = self->_pushEnabledState;
    *(_DWORD *)id v25 = 138543618;
    *(void *)&v25[4] = v13;
    *(_WORD *)&v25[12] = 2048;
    *(void *)&v25[14] = v14;
    id v15 = v13;
    uint64_t v16 = _os_log_send_and_compose_impl( v12,  0LL,  0LL,  0LL,  &_mh_execute_header,  v10,  1LL,  "%{public}@: Updated push state to %ld -- no active account",  v25,  22,  *(_OWORD *)v25,  *(void *)&v25[16]);
  }

  id v24 = (void *)v16;

  if (v24)
  {
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v24,  4LL));
    free(v24);
    SSFileLog(v7, @"%@");
LABEL_46:
  }
}

- (void).cxx_destruct
{
}

@end