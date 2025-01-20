@interface CloudPushNotificationController
- (AMSPushHandler)amsPushHandler;
- (APSConnection)connection;
- (BOOL)_isSupportedJaliscoMediaKind:(id)a3;
- (BOOL)sagaEnabledOnDevice;
- (CloudPushNotificationController)initWithAccountManager:(id)a3;
- (CloudUserNotificationControllerProtocol)userNotificationController;
- (ICDAccountManaging)accountManager;
- (ICMediaUserStateCenterServerProtocol)mediaUserStateCenterServer;
- (ICPlaybackPositionService)playbackPositionServer;
- (NSString)pushEnvironment;
- (id)_supportedJaliscoMediaKinds;
- (id)_supportedJaliscoMediaKindsWithSagaEnabled;
- (void)_activeConfigurationsWithCompletion:(id)a3;
- (void)_createAPNSConnectionWithCompletion:(id)a3;
- (void)_handleITunesStorePushMessage:(id)a3 withCompletionHandler:(id)a4;
- (void)_handleInAppMessagesUpdatedPushMessage:(id)a3;
- (void)_handleJaliscoPushMessage:(id)a3 withCompletionHandler:(id)a4;
- (void)_handleSagaPushMessage:(id)a3 withCompletionHandler:(id)a4;
- (void)_handleStoreBookkeeperPushMessage:(id)a3 withCompletionHandler:(id)a4;
- (void)_handleUserIdentityStoreDidChangeNotification:(id)a3;
- (void)_registerAPNSToken:(id)a3 usingRequestContext:(id)a4 withCompletion:(id)a5;
- (void)_registerMediaKinds:(id)a3 usingRequestContext:(id)a4 withCompletion:(id)a5;
- (void)_updatePushNotificationsRegistration;
- (void)_updateRegistrationForConfiguration:(id)a3 completion:(id)a4;
- (void)connection:(id)a3 didReceiveMessageForTopic:(id)a4 userInfo:(id)a5;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
- (void)dealloc;
- (void)environmentMonitorDidChangeNetworkReachability:(id)a3;
- (void)pushPayload:(id)a3 withBadgeRequest:(id)a4;
- (void)setAccountManager:(id)a3;
- (void)setAmsPushHandler:(id)a3;
- (void)setConnection:(id)a3;
- (void)setMediaUserStateCenterServer:(id)a3;
- (void)setPlaybackPositionServer:(id)a3;
- (void)setPushEnvironment:(id)a3;
- (void)setSagaEnabledOnDevice:(BOOL)a3;
- (void)setUserNotificationController:(id)a3;
@end

@implementation CloudPushNotificationController

- (CloudPushNotificationController)initWithAccountManager:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___CloudPushNotificationController;
  v5 = -[CloudPushNotificationController init](&v26, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_accountManager, v4);
    v7 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
    operationQueue = v6->_operationQueue;
    v6->_operationQueue = v7;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v6->_operationQueue, "setMaxConcurrentOperationCount:", 1LL);
    -[NSOperationQueue setQualityOfService:](v6->_operationQueue, "setQualityOfService:", 17LL);
    -[NSOperationQueue setName:]( v6->_operationQueue,  "setName:",  @"com.apple.itunescloudd.NSOperationQueue.CloudPushNotificationController.operationQueue");
    dispatch_queue_t v9 = dispatch_queue_create( "com.apple.itunescloudd.NSOperationQueue.CloudPushNotificationController.updatePushNotificationsOperationSyncQueue",  0LL);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v9;

    v11 = objc_alloc(&OBJC_CLASS___ICDCloudPushNotificationRegistrationState);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[ICDefaults standardDefaults](&OBJC_CLASS___ICDefaults, "standardDefaults"));
    v13 = (void *)objc_claimAutoreleasedReturnValue([v12 pushNotificationState]);
    v14 = -[ICDCloudPushNotificationRegistrationState initWithDictionaryRepresentation:]( v11,  "initWithDictionaryRepresentation:",  v13);
    currentRegistrationState = v6->_currentRegistrationState;
    v6->_currentRegistrationState = v14;

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[ICEnvironmentMonitor sharedMonitor](&OBJC_CLASS___ICEnvironmentMonitor, "sharedMonitor"));
    [v16 registerObserver:v6];

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[ICEnvironmentMonitor sharedMonitor](&OBJC_CLASS___ICEnvironmentMonitor, "sharedMonitor"));
    if ([v17 isRemoteServerLikelyReachable])
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[ICEnvironmentMonitor sharedMonitor](&OBJC_CLASS___ICEnvironmentMonitor, "sharedMonitor"));
      unsigned int v19 = [v18 isCurrentNetworkLinkHighQuality];

      if (v19) {
        -[CloudPushNotificationController _updatePushNotificationsRegistration]( v6,  "_updatePushNotificationsRegistration");
      }
    }

    else
    {
    }

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v20 addObserver:v6 selector:"_handleUserIdentityStoreDidChangeNotification:" name:ICUserIdentityStoreDidChangeNotification object:0];

    id v21 = objc_alloc_init(&OBJC_CLASS___AMSPushConfiguration);
    [v21 setUserNotificationExtensionId:@"music-notification-default"];
    [v21 setEngagementPushTopic:@"com.apple.music.engagement"];
    v22 = (void *)objc_claimAutoreleasedReturnValue( +[AMSBag bagForProfile:profileVersion:]( &OBJC_CLASS___AMSBag,  "bagForProfile:profileVersion:",  @"Music",  @"1"));
    v23 = -[AMSPushHandler initWithConfiguration:bag:]( objc_alloc(&OBJC_CLASS___AMSPushHandler),  "initWithConfiguration:bag:",  v21,  v22);
    amsPushHandler = v6->_amsPushHandler;
    v6->_amsPushHandler = v23;

    -[AMSPushHandler setDelegate:](v6->_amsPushHandler, "setDelegate:", v6);
  }

  return v6;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[ICEnvironmentMonitor sharedMonitor](&OBJC_CLASS___ICEnvironmentMonitor, "sharedMonitor"));
  [v3 unregisterObserver:self];

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CloudPushNotificationController connection](self, "connection"));
  [v4 setDelegate:0];

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CloudPushNotificationController;
  -[CloudPushNotificationController dealloc](&v5, "dealloc");
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  objc_super v5 = (NSData *)a4;
  v6 = os_log_create("com.apple.amp.itunescloudd", "Push");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543618;
    dispatch_queue_t v9 = self;
    __int16 v10 = 2114;
    v11 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%{public}@ received new token '%{public}@'",  (uint8_t *)&v8,  0x16u);
  }

  currentAPNSToken = self->_currentAPNSToken;
  self->_currentAPNSToken = v5;

  -[CloudPushNotificationController _updatePushNotificationsRegistration](self, "_updatePushNotificationsRegistration");
}

- (void)connection:(id)a3 didReceiveMessageForTopic:(id)a4 userInfo:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = os_log_create("com.apple.amp.itunescloudd", "Push");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v26 = v9;
    __int16 v27 = 2114;
    id v28 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Received push notification on topic %{public}@: %{public}@",  buf,  0x16u);
  }

  id v12 = objc_alloc(&OBJC_CLASS___ICAsyncBlockOperation);
  v17 = _NSConcreteStackBlock;
  uint64_t v18 = 3221225472LL;
  unsigned int v19 = sub_1000EC5E0;
  v20 = &unk_1001A5ED8;
  id v21 = v8;
  v22 = self;
  id v23 = v9;
  id v24 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  id v16 = [v12 initWithStartHandler:&v17];
  -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v16, v17, v18, v19, v20);
}

- (void)environmentMonitorDidChangeNetworkReachability:(id)a3
{
  id v4 = a3;
  if ([v4 isRemoteServerLikelyReachable]
    && [v4 isCurrentNetworkLinkHighQuality])
  {
    objc_super v5 = os_log_create("com.apple.amp.itunescloudd", "Push");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138543362;
      v7 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Network reachability changed to available - updating push registration if needed",  (uint8_t *)&v6,  0xCu);
    }

    -[CloudPushNotificationController _updatePushNotificationsRegistration]( self,  "_updatePushNotificationsRegistration");
  }
}

- (void)_updatePushNotificationsRegistration
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000EBE84;
  block[3] = &unk_1001A6B90;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_activeConfigurationsWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void *, void))a3;
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[CloudPushNotificationController accountManager](self, "accountManager"));
  int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 supportedConfigurations]);

  if (v6)
  {
    v4[2](v4, v6, 0LL);
  }

  else
  {
    v7 = objc_alloc(&OBJC_CLASS___ICConnectionConfiguration);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[ICUserIdentity activeAccount](&OBJC_CLASS___ICUserIdentity, "activeAccount"));
    id v9 = -[ICConnectionConfiguration initWithUserIdentity:](v7, "initWithUserIdentity:", v8);

    v11 = v9;
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v11, 1LL));
    v4[2](v4, v10, 0LL);
  }
}

- (void)_createAPNSConnectionWithCompletion:(id)a3
{
  id v4 = a3;
  objc_super v5 = objc_alloc(&OBJC_CLASS___ICStoreRequestContext);
  int v6 = (void *)objc_claimAutoreleasedReturnValue(+[ICUserIdentity activeAccount](&OBJC_CLASS___ICUserIdentity, "activeAccount"));
  v7 = -[ICStoreRequestContext initWithIdentity:](v5, "initWithIdentity:", v6);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[ICURLBagProvider sharedBagProvider](&OBJC_CLASS___ICURLBagProvider, "sharedBagProvider"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000EB8C8;
  v10[3] = &unk_1001A5F50;
  v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  [v8 getBagForRequestContext:v7 withCompletionHandler:v10];
}

- (void)_updateRegistrationForConfiguration:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = os_log_create("com.apple.amp.itunescloudd", "Push");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v17 = self;
    __int16 v18 = 2114;
    id v19 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Updating push registration for configuration %{public}@",  buf,  0x16u);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 userIdentityStore]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 userIdentity]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000EAE60;
  v13[3] = &unk_1001A5FF0;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v11 = v7;
  id v12 = v6;
  [v9 getPropertiesForUserIdentity:v10 completionHandler:v13];
}

- (void)_registerAPNSToken:(id)a3 usingRequestContext:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = os_log_create("com.apple.amp.itunescloudd", "Push");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    __int16 v18 = self;
    __int16 v19 = 2114;
    id v20 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Registering updated push token %{public}@",  buf,  0x16u);
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[ICDeviceInfo currentDeviceInfo](&OBJC_CLASS___ICDeviceInfo, "currentDeviceInfo"));
  unsigned int v13 = [v12 isWatch];

  if (v13)
  {
    id v14 = [[ICPushNotificationsRegisterAPNSTokenRequest alloc] initWithRequestContext:v9 token:v8];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_1000EAD00;
    v15[3] = &unk_1001A6018;
    v15[4] = self;
    id v16 = v10;
    [v14 performRequestWithResponseHandler:v15];
  }

  else if (v10)
  {
    (*((void (**)(id, void))v10 + 2))(v10, 0LL);
  }
}

- (void)_registerMediaKinds:(id)a3 usingRequestContext:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void))a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[ICDeviceInfo currentDeviceInfo](&OBJC_CLASS___ICDeviceInfo, "currentDeviceInfo"));
  unsigned __int8 v12 = [v11 isMac];

  if ((v12 & 1) != 0)
  {
    v10[2](v10, 0LL);
  }

  else
  {
    unsigned int v13 = os_log_create("com.apple.amp.itunescloudd", "Push");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v22 = self;
      __int16 v23 = 2114;
      id v24 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Registering updated media types: %{public}@",  buf,  0x16u);
    }

    __int16 v19 = @"media-kinds";
    id v20 = v8;
    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v20,  &v19,  1LL));
    id v15 = objc_alloc(&OBJC_CLASS___ICPushNotificationsEnableTypesRequest);
    id v16 = [v15 initWithRequestContext:v9 notificationType:ICPushNotificationTypePurchase notificationParameters:v14];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_1000EABA0;
    v17[3] = &unk_1001A6018;
    v17[4] = self;
    __int16 v18 = v10;
    [v16 performRequestWithResponseHandler:v17];
  }
}

- (void)_handleUserIdentityStoreDidChangeNotification:(id)a3
{
  id v4 = os_log_create("com.apple.amp.itunescloudd", "Push");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%{public}@ received accounts changed notification - updating push notifications",  (uint8_t *)&v5,  0xCu);
  }

  -[CloudPushNotificationController _updatePushNotificationsRegistration](self, "_updatePushNotificationsRegistration");
}

- (void)_handleSagaPushMessage:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  id v8 = [v6 accountDSID];
  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v8));
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[ICUserIdentity specificAccountWithDSID:]( &OBJC_CLASS___ICUserIdentity,  "specificAccountWithDSID:",  v9));
  }

  else
  {
    id v11 = os_log_create("com.apple.amp.itunescloudd", "Push");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue([v6 userInfo]);
      *(_DWORD *)buf = 138543618;
      id v20 = self;
      __int16 v21 = 2114;
      v22 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Received saga push notification with no DSID - using active account. userInfo=%{public}@",  buf,  0x16u);
    }

    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[ICUserIdentity activeAccount](&OBJC_CLASS___ICUserIdentity, "activeAccount"));
  }

  unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(+[ICUserIdentityStore defaultIdentityStore](&OBJC_CLASS___ICUserIdentityStore, "defaultIdentityStore"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1000EA7A4;
  v16[3] = &unk_1001A6068;
  v16[4] = self;
  id v17 = v6;
  id v18 = v10;
  id v14 = v10;
  id v15 = v6;
  [v13 getPropertiesForUserIdentity:v14 completionHandler:v16];

  v7[2](v7, 0LL);
}

- (void)_handleJaliscoPushMessage:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  id v8 = [v6 accountDSID];
  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v8));
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[ICUserIdentity specificAccountWithDSID:]( &OBJC_CLASS___ICUserIdentity,  "specificAccountWithDSID:",  v9));
  }

  else
  {
    id v11 = os_log_create("com.apple.amp.itunescloudd", "Push");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue([v6 userInfo]);
      *(_DWORD *)buf = 138543618;
      id v20 = self;
      __int16 v21 = 2114;
      v22 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Received jalisco push notification with no DSID - using active account. userInfo=%{public}@",  buf,  0x16u);
    }

    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[ICUserIdentity activeAccount](&OBJC_CLASS___ICUserIdentity, "activeAccount"));
  }

  unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(+[ICUserIdentityStore defaultIdentityStore](&OBJC_CLASS___ICUserIdentityStore, "defaultIdentityStore"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1000EA3F0;
  v16[3] = &unk_1001A6068;
  v16[4] = self;
  id v17 = v6;
  id v18 = v10;
  id v14 = v10;
  id v15 = v6;
  [v13 getPropertiesForUserIdentity:v14 completionHandler:v16];

  v7[2](v7, 0LL);
}

- (void)_handleITunesStorePushMessage:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[ICDeviceInfo currentDeviceInfo](&OBJC_CLASS___ICDeviceInfo, "currentDeviceInfo"));
  unsigned int v10 = [v9 isMac];

  id v11 = [v6 actionType];
  if (!v10)
  {
    switch((unint64_t)v11)
    {
      case 0xCuLL:
        id v24 = os_log_create("com.apple.amp.itunescloudd", "Push");
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "[Lease] - Posting darwin notification for lease end'",  buf,  2u);
        }

        v25 = @"com.apple.itunesstored.PlaybackLeaseDidEnd";
        goto LABEL_27;
      case 0xDuLL:
      case 0x10uLL:
      case 0x11uLL:
      case 0x12uLL:
      case 0x13uLL:
      case 0x15uLL:
      case 0x16uLL:
      case 0x17uLL:
      case 0x18uLL:
      case 0x1AuLL:
        goto LABEL_18;
      case 0xEuLL:
        os_log_t v12 = (os_log_t)objc_claimAutoreleasedReturnValue( +[ICMusicSubscriptionStatusController sharedStatusController]( &OBJC_CLASS___ICMusicSubscriptionStatusController,  "sharedStatusController"));
        -[os_log_s invalidateCachedSubscriptionStatusWithCompletionHandler:]( v12,  "invalidateCachedSubscriptionStatusWithCompletionHandler:",  &stru_1001A6108);
        unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(+[ICUserIdentity activeAccount](&OBJC_CLASS___ICUserIdentity, "activeAccount"));
        id v14 = &stru_1001A6128;
        goto LABEL_4;
      case 0xFuLL:
        os_log_t v12 = (os_log_t)objc_claimAutoreleasedReturnValue( +[CloudContentTasteUpdateRequestListener sharedContentTasteRequestListener]( &OBJC_CLASS___CloudContentTasteUpdateRequestListener,  "sharedContentTasteRequestListener"));
        -[os_log_s handleContentTasteChangedNotification](v12, "handleContentTasteChangedNotification");
        goto LABEL_5;
      case 0x14uLL:
        id v26 = [v6 moduleIdentifier];
        if (v26 != (id)1)
        {
          int v28 = (int)v26;
          os_log_t v12 = os_log_create("com.apple.amp.itunescloudd", "Push");
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v31) = v28;
            _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Unknown for-you module identifier %d",  buf,  8u);
          }

          goto LABEL_5;
        }

        v25 = (const __CFString *)ICRecentlyPlayedDidChangeNotification;
LABEL_27:
        CFNotificationCenterPostNotification(DarwinNotifyCenter, v25, 0LL, 0LL, 1u);
        goto LABEL_13;
      case 0x19uLL:
      case 0x1BuLL:
      case 0x1CuLL:
        -[CloudPushNotificationController _handleInAppMessagesUpdatedPushMessage:]( self,  "_handleInAppMessagesUpdatedPushMessage:",  v6);
        goto LABEL_13;
      default:
        if (v11 == (id)40)
        {
          WeakRetained = (os_log_s *)objc_loadWeakRetained((id *)&self->_mediaUserStateCenterServer);
          os_log_t v15 = WeakRetained;
          if (WeakRetained
            && -[os_log_s conformsToProtocol:]( WeakRetained,  "conformsToProtocol:",  &OBJC_PROTOCOL___ICMediaUserStateCenterServerProtocol))
          {
            v29[0] = _NSConcreteStackBlock;
            v29[1] = 3221225472LL;
            v29[2] = sub_1000EA2B0;
            v29[3] = &unk_1001A6150;
            v29[4] = self;
            -[os_log_s refreshSocialProfilesWithReply:](v15, "refreshSocialProfilesWithReply:", v29);
            goto LABEL_12;
          }

          id v16 = os_log_create("com.apple.amp.itunescloudd", "Push");
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v31 = self;
            id v17 = "%{public}@ Dropping MusicSocialProfileUpdate push notification. _mediaUserStateCenterServer=nil";
            id v18 = v16;
            uint32_t v19 = 12;
            goto LABEL_10;
          }
        }

        else
        {
LABEL_18:
          os_log_t v15 = (os_log_t)objc_claimAutoreleasedReturnValue(-[CloudPushNotificationController amsPushHandler](self, "amsPushHandler"));
          __int16 v21 = (void *)objc_claimAutoreleasedReturnValue([v6 userInfo]);
          unsigned int v22 = -[os_log_s shouldHandleNotification:](v15, "shouldHandleNotification:", v21);

          if (v22)
          {
            __int16 v23 = (void *)objc_claimAutoreleasedReturnValue([v6 userInfo]);
            -[os_log_s handleNotification:](v15, "handleNotification:", v23);

            goto LABEL_12;
          }

          id v16 = os_log_create("com.apple.amp.itunescloudd", "Push");
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v27 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 userInfo]);
            *(_DWORD *)buf = 138543618;
            v31 = self;
            __int16 v32 = 2114;
            v33 = v27;
            _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Received unsupported store push notification - ignoring. userInfo=%{public}@",  buf,  0x16u);
          }
        }

        break;
    }

    goto LABEL_11;
  }

  if (v11 != (id)14)
  {
    os_log_t v15 = os_log_create("com.apple.amp.itunescloudd", "Push");
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
LABEL_12:

      goto LABEL_13;
    }

    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 userInfo]);
    *(_DWORD *)buf = 138543618;
    v31 = self;
    __int16 v32 = 2114;
    v33 = v16;
    id v17 = "%{public}@ Received unsupported store push notification - ignoring. userInfo=%{public}@";
    id v18 = v15;
    uint32_t v19 = 22;
LABEL_10:
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, v17, buf, v19);
LABEL_11:

    goto LABEL_12;
  }

  os_log_t v12 = (os_log_t)objc_claimAutoreleasedReturnValue( +[ICMusicSubscriptionStatusController sharedStatusController]( &OBJC_CLASS___ICMusicSubscriptionStatusController,  "sharedStatusController"));
  -[os_log_s invalidateCachedSubscriptionStatusWithCompletionHandler:]( v12,  "invalidateCachedSubscriptionStatusWithCompletionHandler:",  &stru_1001A60A8);
  unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(+[ICUserIdentity activeAccount](&OBJC_CLASS___ICUserIdentity, "activeAccount"));
  id v14 = &stru_1001A60E8;
LABEL_4:
  -[os_log_s getSubscriptionStatusForUserIdentity:bypassingCache:withCompletionHandler:]( v12,  "getSubscriptionStatusForUserIdentity:bypassingCache:withCompletionHandler:",  v13,  1LL,  v14);

LABEL_5:
LABEL_13:
  v7[2](v7, 0LL);
}

- (void)_handleStoreBookkeeperPushMessage:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  id v8 = os_log_create("com.apple.amp.itunescloudd", "Push");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 userInfo]);
    *(_DWORD *)buf = 138543619;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2113;
    *(void *)&buf[14] = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%{public}@ _handleStoreBookkeeperPushMessage: %{private}@",  buf,  0x16u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_playbackPositionServer);
  id v11 = WeakRetained;
  if (WeakRetained
    && [WeakRetained conformsToProtocol:&OBJC_PROTOCOL___ICPlaybackPositionService])
  {
    os_log_t v12 = (void *)objc_claimAutoreleasedReturnValue([v6 userInfo]);
    unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"3"]);

    id v14 = (void *)objc_claimAutoreleasedReturnValue([v6 userInfo]);
    os_log_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:@"1"]);

    if (!v13 || !v15)
    {
      __int16 v27 = os_log_create("com.apple.amp.itunescloudd", "Push");
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = self;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_ERROR,  "%{public}@ Received invalid Playback Position message %{public}@",  buf,  0x16u);
      }

      id v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  ICErrorDomain,  -7101LL,  0LL));
      goto LABEL_34;
    }

    id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v6 accountDSID]));
    id v17 = (id)objc_claimAutoreleasedReturnValue( +[ICUserIdentity specificAccountWithDSID:]( &OBJC_CLASS___ICUserIdentity,  "specificAccountWithDSID:",  v16));

    if (v17)
    {
      if ((MSVDeviceSupportsMultipleLibraries(v18) & 1) == 0)
      {
        id v19 = (id)objc_claimAutoreleasedReturnValue(+[ICUserIdentity activeAccount](&OBJC_CLASS___ICUserIdentity, "activeAccount"));
        if (v17 == v19)
        {
        }

        else
        {
          id v20 = v19;
          unsigned __int8 v21 = [v17 isEqual:v19];

          if ((v21 & 1) == 0)
          {
            os_log_t v22 = sub_1000DD8B4();
            __int16 v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              id v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v6 accountDSID]));
              *(_DWORD *)buf = 138543619;
              *(void *)&uint8_t buf[4] = self;
              *(_WORD *)&buf[12] = 2113;
              *(void *)&buf[14] = v24;
              _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_ERROR,  "%{public}@ _handleStoreBookkeeperPushMessage: Ignoring update for non-active dsid=%{private}@",  buf,  0x16u);
            }

            uint64_t v25 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  ICErrorDomain,  -7101LL,  0LL));
LABEL_21:
            id v26 = (void *)v25;
LABEL_33:

LABEL_34:
            goto LABEL_35;
          }
        }
      }

      uint64_t v35 = 0LL;
      v36 = &v35;
      uint64_t v37 = 0x2050000000LL;
      v30 = (void *)qword_1001DB818;
      uint64_t v38 = qword_1001DB818;
      if (!qword_1001DB818)
      {
        *(void *)buf = _NSConcreteStackBlock;
        *(void *)&buf[8] = 3221225472LL;
        *(void *)&buf[16] = sub_1000EA114;
        v40 = &unk_1001A6978;
        v41 = &v35;
        sub_1000EA114((uint64_t)buf);
        v30 = (void *)v36[3];
      }

      id v31 = v30;
      _Block_object_dispose(&v35, 8);
      __int16 v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "musicLibraryForUserAccount:", v17, v35));
      if (v32)
      {
        if (![v13 intValue])
        {
          v33 = (void *)objc_claimAutoreleasedReturnValue([v32 libraryUID]);
          [v11 synchronizePlaybackPositionsForLibraryWithIdentifier:v33 forDomain:v15 isCheckpoint:1];
        }

        id v26 = 0LL;
      }

      else
      {
        v34 = os_log_create("com.apple.amp.itunescloudd", "Push");
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          *(void *)&uint8_t buf[4] = self;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v6;
          _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_ERROR,  "%{public}@ Failed to find user library for message %{public}@",  buf,  0x16u);
        }

        id v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  ICErrorDomain,  0LL,  0LL));
      }

      goto LABEL_33;
    }

    int v28 = os_log_create("com.apple.amp.itunescloudd", "Push");
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v6 accountDSID]));
      *(_DWORD *)buf = 138543619;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2113;
      *(void *)&buf[14] = v29;
      _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_ERROR,  "%{public}@ _handleStoreBookkeeperPushMessage: Could not find userIdentity with dsid=%{private}@",  buf,  0x16u);
    }

    uint64_t v25 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  ICErrorDomain,  -7401LL,  0LL));
    goto LABEL_21;
  }

  id v26 = 0LL;
LABEL_35:
  v7[2](v7, v26);
}

- (void)_handleInAppMessagesUpdatedPushMessage:(id)a3
{
  id v4 = a3;
  int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 apsPayload]);
  id v6 = v5;
  if (v5)
  {
    unint64_t v7 = (int)objc_msgSend(v5, "ic_intValueForKey:", @"payloadVersion");
    if (v7 >= 2)
    {
      if (v7 == 2)
      {
        id v11 = os_log_create("com.apple.amp.itunescloudd", "Push");
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          os_log_t v15 = self;
          _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%{public}@Received inApp messages push - syncing now",  buf,  0xCu);
        }

        os_log_t v8 = (os_log_t)objc_claimAutoreleasedReturnValue(+[ICInAppMessageManager sharedManager](&OBJC_CLASS___ICInAppMessageManager, "sharedManager"));
        v13[0] = _NSConcreteStackBlock;
        v13[1] = 3221225472LL;
        v13[2] = sub_1000EA040;
        v13[3] = &unk_1001A6398;
        v13[4] = self;
        -[os_log_s syncMessagesWithCompletion:](v8, "syncMessagesWithCompletion:", v13);
      }

      else
      {
        os_log_t v8 = os_log_create("com.apple.amp.itunescloudd", "Push");
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
          *(_DWORD *)buf = 138543618;
          os_log_t v15 = self;
          __int16 v16 = 2114;
          id v17 = v9;
          unsigned int v10 = "%{public}@Received unsupported in-app sync payload version - ignoring push %{public}@";
          goto LABEL_14;
        }
      }
    }

    else
    {
      os_log_t v8 = os_log_create("com.apple.amp.itunescloudd", "Push");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
        *(_DWORD *)buf = 138543618;
        os_log_t v15 = self;
        __int16 v16 = 2114;
        id v17 = v9;
        unsigned int v10 = "%{public}@Received legacy banner sync payload version - ignoring push %{public}@";
LABEL_14:
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v10, buf, 0x16u);
      }
    }
  }

  else
  {
    os_log_t v8 = os_log_create("com.apple.amp.itunescloudd", "Push");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
      *(_DWORD *)buf = 138543618;
      os_log_t v15 = self;
      __int16 v16 = 2114;
      id v17 = v9;
      unsigned int v10 = "%{public}@ No aps payload - ignoring push %{public}@";
      goto LABEL_14;
    }
  }
}

- (BOOL)_isSupportedJaliscoMediaKind:(id)a3
{
  id v4 = a3;
  int v5 = (void *)objc_claimAutoreleasedReturnValue(-[CloudPushNotificationController _supportedJaliscoMediaKinds](self, "_supportedJaliscoMediaKinds"));
  unsigned __int8 v6 = [v5 containsObject:v4];

  return v6;
}

- (id)_supportedJaliscoMediaKinds
{
  if (qword_1001DB800 != -1) {
    dispatch_once(&qword_1001DB800, &stru_1001A6170);
  }
  return (id)qword_1001DB7F8;
}

- (id)_supportedJaliscoMediaKindsWithSagaEnabled
{
  if (qword_1001DB810 != -1) {
    dispatch_once(&qword_1001DB810, &stru_1001A6190);
  }
  return (id)qword_1001DB808;
}

- (void)pushPayload:(id)a3 withBadgeRequest:(id)a4
{
  id v5 = a4;
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(-[CloudPushNotificationController userNotificationController](self, "userNotificationController"));
  if (!v6)
  {
    id v9 = os_log_create("com.apple.amp.itunescloudd", "Push");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      __int16 v13 = 0;
      unsigned int v10 = "Received a badge request but no user notification center to badge.";
      id v11 = (uint8_t *)&v13;
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, v10, v11, 2u);
    }

- (ICMediaUserStateCenterServerProtocol)mediaUserStateCenterServer
{
  return (ICMediaUserStateCenterServerProtocol *)objc_loadWeakRetained((id *)&self->_mediaUserStateCenterServer);
}

- (void)setMediaUserStateCenterServer:(id)a3
{
}

- (ICPlaybackPositionService)playbackPositionServer
{
  return (ICPlaybackPositionService *)objc_loadWeakRetained((id *)&self->_playbackPositionServer);
}

- (void)setPlaybackPositionServer:(id)a3
{
}

- (CloudUserNotificationControllerProtocol)userNotificationController
{
  return (CloudUserNotificationControllerProtocol *)objc_loadWeakRetained((id *)&self->_userNotificationController);
}

- (void)setUserNotificationController:(id)a3
{
}

- (ICDAccountManaging)accountManager
{
  return (ICDAccountManaging *)objc_loadWeakRetained((id *)&self->_accountManager);
}

- (void)setAccountManager:(id)a3
{
}

- (BOOL)sagaEnabledOnDevice
{
  return self->_sagaEnabledOnDevice;
}

- (void)setSagaEnabledOnDevice:(BOOL)a3
{
  self->_sagaEnabledOnDevice = a3;
}

- (NSString)pushEnvironment
{
  return self->_pushEnvironment;
}

- (void)setPushEnvironment:(id)a3
{
}

- (APSConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (AMSPushHandler)amsPushHandler
{
  return self->_amsPushHandler;
}

- (void)setAmsPushHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end