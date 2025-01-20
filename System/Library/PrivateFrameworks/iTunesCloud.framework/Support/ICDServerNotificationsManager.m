@interface ICDServerNotificationsManager
- (ICDServerNotificationsManager)initWithDelegate:(id)a3;
- (ICDServerNotificationsManagerDelegate)delegate;
- (void)_didReceiveDarwinNotification:(id)a3;
- (void)_didReceiveDistributedNotification:(id)a3 withStreamEvent:(id)a4;
- (void)_didReceiveTelephonyCenterNotification:(id)a3;
- (void)_handleActiveUserIdentityDidChangeNotification:(id)a3;
- (void)_handleAllowsExplicitContentChangedNotification:(id)a3;
- (void)_handleAllowsMusicVideosChangedNotification:(id)a3;
- (void)_handleApplicationRegistration:(BOOL)a3 notificationName:(id)a4 streamEvent:(id)a5;
- (void)_handleCloudAuthenticationDidChangeNotification;
- (void)_handleFamilyCircleChangedNotification;
- (void)_handleFamilyContentDeletionNotification:(id)a3 streamEvent:(id)a4;
- (void)_handleFirstUnlockNotification:(id)a3;
- (void)_handleHandlerCoordinatorDidFinishInitialization:(id)a3;
- (void)_handleLibraryAuthServiceTokenDidChangeNotification:(id)a3;
- (void)_handleMusicSettingsChangedNotification;
- (void)_handleMusicSubscriptionStatusDidChangeNotification:(id)a3;
- (void)_handlePlayActivityFlushInternalTestRequestNotification;
- (void)_handleUserIdentityStoreDidChangeNotification:(id)a3;
- (void)_setupNotifications;
- (void)_tearDownNotifications;
- (void)dealloc;
@end

@implementation ICDServerNotificationsManager

- (ICDServerNotificationsManager)initWithDelegate:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___ICDServerNotificationsManager;
  v5 = -[ICDServerNotificationsManager init](&v12, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    dispatch_queue_attr_t v7 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_USER_INITIATED, 0);
    v8 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v7);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.itunescloudd.ICDServerNotificationsManager", v8);
    xpcStreamHandlerQueue = v6->_xpcStreamHandlerQueue;
    v6->_xpcStreamHandlerQueue = (OS_dispatch_queue *)v9;

    -[ICDServerNotificationsManager _setupNotifications](v6, "_setupNotifications");
  }

  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___ICDServerNotificationsManager;
  -[ICDServerNotificationsManager dealloc](&v3, "dealloc");
}

- (void)_setupNotifications
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 addObserver:self selector:"_handleFirstUnlockNotification:" name:ICSecurityInfoFirstUnlockNotification object:0];

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v4 addObserver:self selector:"_handleMusicSubscriptionStatusDidChangeNotification:" name:ICMusicSubscriptionStatusDidChangeNotification object:0];

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v5 addObserver:self selector:"_handleLibraryAuthServiceTokenDidChangeNotification:" name:ICLibraryAuthServiceClientTokenDidChangeNotification object:0];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver( DarwinNotifyCenter,  self,  (CFNotificationCallback)sub_1000310E0,  ICCloudClientIsAuthenticatedDidChangeNotification,  0LL,  (CFNotificationSuspensionBehavior)0LL);
  dispatch_queue_attr_t v7 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver( v7,  self,  (CFNotificationCallback)sub_1000310E8,  @"com.apple.mobileipod-prefsChanged",  0LL,  CFNotificationSuspensionBehaviorDrop);
  v8 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver( v8,  self,  (CFNotificationCallback)sub_1000310F0,  @"com.apple.family.family_updated",  0LL,  CFNotificationSuspensionBehaviorDrop);
  sub_1000310F8();
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    sub_1000310F8();
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    [v11 addObserver:self selector:"_handleAllowsExplicitContentChangedNotification:" name:v13 object:0];
  }

  v36 = 0LL;
  uint64_t v37 = (uint64_t)&v36;
  uint64_t v38 = 0x2020000000LL;
  v14 = (id *)qword_1001DB640;
  v39 = (void *)qword_1001DB640;
  if (!qword_1001DB640)
  {
    v15 = sub_1000311EC();
    v14 = (id *)dlsym(v15, "MPRestrictionsMonitorAllowsMusicVideosDidChangeNotification");
    *(void *)(v37 + 24) = v14;
    qword_1001DB640 = (uint64_t)v14;
  }

  _Block_object_dispose(&v36, 8);
  if (v14)
  {
    id v16 = *v14;
    if (v16)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      [v17 addObserver:self selector:"_handleAllowsMusicVideosChangedNotification:" name:v16 object:0];
    }

    sub_1000312F0();
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    if (v19)
    {
      uint64_t v41 = 0LL;
      v42 = &v41;
      uint64_t v43 = 0x2050000000LL;
      v20 = (void *)qword_1001DB650;
      uint64_t v44 = qword_1001DB650;
      if (!qword_1001DB650)
      {
        v36 = _NSConcreteStackBlock;
        uint64_t v37 = 3221225472LL;
        uint64_t v38 = (uint64_t)sub_1000313E4;
        v39 = &unk_1001A6978;
        v40 = &v41;
        sub_1000313E4((uint64_t)&v36);
        v20 = (void *)v42[3];
      }

      id v21 = v20;
      _Block_object_dispose(&v41, 8);
      if ([v21 isCurrentDeviceValidHomeAccessory])
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
        sub_1000312F0();
        v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
        [v22 addObserver:self selector:"_handleAllowsExplicitContentChangedNotification:" name:v24 object:0];
      }
    }

    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v25 addObserver:self selector:"_handleActiveUserIdentityDidChangeNotification:" name:ICActiveUserIdentityDidChangeNotification object:0];

    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v26 addObserver:self selector:"_handleUserIdentityStoreDidChangeNotification:" name:ICUserIdentityStoreDidChangeNotification object:0];

    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v27 addObserver:self selector:"_handleHandlerCoordinatorDidFinishInitialization:" name:@"ICDHandlerCoordinatorDidFinishInitializationNotificationName" object:0];

    xpcStreamHandlerQueue = (dispatch_queue_s *)self->_xpcStreamHandlerQueue;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_1000314A8;
    handler[3] = &unk_1001A4880;
    handler[4] = self;
    xpc_set_event_stream_handler("com.apple.distnoted.matching", xpcStreamHandlerQueue, handler);
    v29 = (dispatch_queue_s *)self->_xpcStreamHandlerQueue;
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472LL;
    v34[2] = sub_100031524;
    v34[3] = &unk_1001A4880;
    v34[4] = self;
    xpc_set_event_stream_handler("com.apple.notifyd.matching", v29, v34);
    v30 = (dispatch_queue_s *)self->_xpcStreamHandlerQueue;
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472LL;
    v33[2] = sub_10003158C;
    v33[3] = &unk_1001A4880;
    v33[4] = self;
    xpc_set_event_stream_handler("com.apple.CTTelephonyCenter", v30, v33);
  }

  else
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "NSString *getMPRestrictionsMonitorAllowsMusicVideosDidChangeNotification(void)"));
    objc_msgSend( v31,  "handleFailureInFunction:file:lineNumber:description:",  v32,  @"ICDServerNotificationsManager.m",  42,  @"%s",  dlerror());

    __break(1u);
  }

- (void)_tearDownNotifications
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v4 removeObserver:self];
}

- (void)_didReceiveDistributedNotification:(id)a3 withStreamEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138543362;
    id v12 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Received distributed notification: %{public}@",  (uint8_t *)&v11,  0xCu);
  }

  if ([v6 isEqualToString:AMSFamilyContentDeletionNotification])
  {
    -[ICDServerNotificationsManager _handleFamilyContentDeletionNotification:streamEvent:]( self,  "_handleFamilyContentDeletionNotification:streamEvent:",  v6,  v7);
    goto LABEL_10;
  }

  if ([v6 isEqualToString:@"com.apple.LaunchServices.applicationRegistered"])
  {
    uint64_t v9 = self;
    uint64_t v10 = 1LL;
LABEL_9:
    -[ICDServerNotificationsManager _handleApplicationRegistration:notificationName:streamEvent:]( v9,  "_handleApplicationRegistration:notificationName:streamEvent:",  v10,  v6,  v7);
    goto LABEL_10;
  }

  if ([v6 isEqualToString:@"com.apple.LaunchServices.applicationUnregistered"])
  {
    uint64_t v9 = self;
    uint64_t v10 = 0LL;
    goto LABEL_9;
  }

  if ([v6 isEqualToString:@"com.apple.itunescloud.ICPlayActivityFlushInternalTestRequestNotification"]) {
    -[ICDServerNotificationsManager _handlePlayActivityFlushInternalTestRequestNotification]( self,  "_handlePlayActivityFlushInternalTestRequestNotification");
  }
LABEL_10:
}

- (void)_didReceiveDarwinNotification:(id)a3
{
  id v4 = a3;
  v5 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    id v9 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Received darwin notification %{public}@",  (uint8_t *)&v8,  0xCu);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICDServerNotificationsManager delegate](self, "delegate"));
  if ([v4 isEqualToString:@"com.apple.mobileipod.libraryimportdidfinish"])
  {
    [v6 notificationsManagerDidReceiveLibraryImportDidFinishDarwinNotification:self];
  }

  else if ([v4 isEqualToString:@"com.apple.itunesstored.autodownloaddefaultschange"])
  {
    [v6 notificationsManagerDidReceiveCellularDataRestrictionDidChangeDarwinNotification:self];
  }

  else if ([v4 isEqualToString:@"com.apple.purplebuddy.setupdone"])
  {
    [v6 notificationsManagerDidReceiveBuddySetupDoneDarwinNotification:self];
  }

  else if ([v4 isEqualToString:@"com.apple.family.family_updated"])
  {
    -[ICDServerNotificationsManager _handleFamilyCircleChangedNotification]( self,  "_handleFamilyCircleChangedNotification");
  }

  else
  {
    id v7 = os_log_create("com.apple.amp.itunescloudd", "XPC");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138543362;
      id v9 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "Received unsupported darwin notification %{public}@",  (uint8_t *)&v8,  0xCu);
    }
  }
}

- (void)_didReceiveTelephonyCenterNotification:(id)a3
{
  id v4 = a3;
  v5 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543362;
    id v10 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Received telephony center notification %{public}@",  (uint8_t *)&v9,  0xCu);
  }

  if ([v4 isEqualToString:kCTSettingPhoneNumberChangedNotification])
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[ICDeviceInfo currentDeviceInfo](&OBJC_CLASS___ICDeviceInfo, "currentDeviceInfo"));
    unsigned int v7 = [v6 isPhoneNumberAccessRestricted];

    if (v7)
    {
      int v8 = os_log_create("com.apple.amp.itunescloudd", "XPC");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 138543362;
        id v10 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Ignoring telephony center notification %{public}@ because phone number access is restricted.",  (uint8_t *)&v9,  0xCu);
      }
    }

    else
    {
      int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[ICDServerNotificationsManager delegate](self, "delegate"));
      -[os_log_s notificationsManagerDidReceivePhoneNumberChangedNotification:]( v8,  "notificationsManagerDidReceivePhoneNumberChangedNotification:",  self);
    }
  }
}

- (void)_handleFirstUnlockNotification:(id)a3
{
  id v4 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "First unlock has occured", v6, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICDServerNotificationsManager delegate](self, "delegate"));
  [v5 notificationsManagerDidReceiveFirstUnlockNotification:self];
}

- (void)_handleMusicSubscriptionStatusDidChangeNotification:(id)a3
{
  id v4 = a3;
  v5 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v7 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Subscription status has changed - updating client status",  v7,  2u);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICDServerNotificationsManager delegate](self, "delegate"));
  [v6 notificationsManager:self didReceiveSubscriptionStatusDidChangeNotification:v4];
}

- (void)_handleActiveUserIdentityDidChangeNotification:(id)a3
{
  id v4 = a3;
  v5 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Active user identity has changed.", v7, 2u);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICDServerNotificationsManager delegate](self, "delegate"));
  [v6 notificationsManager:self didReceiveActiveUserIdentityDidChangeNotification:v4];
}

- (void)_handleUserIdentityStoreDidChangeNotification:(id)a3
{
  id v4 = a3;
  v5 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "User identity store has changed.", v7, 2u);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICDServerNotificationsManager delegate](self, "delegate"));
  [v6 notificationsManager:self didReceiveUserIdentityStoreDidChangeNotification:v4];
}

- (void)_handleHandlerCoordinatorDidFinishInitialization:(id)a3
{
  id v4 = a3;
  v5 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v7 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Handler Coordinator did finish initialization.",  v7,  2u);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICDServerNotificationsManager delegate](self, "delegate"));
  [v6 notificationsManager:self didReceiveHandlerCoordinatorFinishedInitializationNotification:v4];
}

- (void)_handleAllowsExplicitContentChangedNotification:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[ICDServerNotificationsManager delegate](self, "delegate"));
  [v5 notificationsManager:self didReceiveAllowsExplicitContentDidChangeNotification:v4];
}

- (void)_handleAllowsMusicVideosChangedNotification:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[ICDServerNotificationsManager delegate](self, "delegate"));
  [v5 notificationsManager:self didReceiveAllowsMusicVideosDidChangeNotification:v4];
}

- (void)_handleLibraryAuthServiceTokenDidChangeNotification:(id)a3
{
  id v4 = a3;
  id v5 = os_log_create("com.apple.amp.itunescloudd", "Accounts");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v7 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "handleLibraryAuthServiceTokenDidChangeNotification - posting dynamite state change",  v7,  2u);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICDServerNotificationsManager delegate](self, "delegate"));
  [v6 notificationsManager:self didReceiveAuthServiceTokenDidChangeNotification:v4];
}

- (void)_handleCloudAuthenticationDidChangeNotification
{
  objc_super v3 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Cloud authentication status has changed - updating client status",  v5,  2u);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICDServerNotificationsManager delegate](self, "delegate"));
  [v4 notificationsManagerDidReceiveCloudAuthenticationDidChangeDarwinNotification:self];
}

- (void)_handleApplicationRegistration:(BOOL)a3 notificationName:(id)a4 streamEvent:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  xpc_object_t value = xpc_dictionary_get_value(v9, "UserInfo");
  id v12 = (void *)objc_claimAutoreleasedReturnValue(value);
  if (v12 && !xpc_dictionary_get_BOOL(v12, (const char *)[@"isPlaceholder" UTF8String]))
  {
    xpc_object_t array = xpc_dictionary_get_array(v12, (const char *)[@"bundleIDs" UTF8String]);
    v14 = (void *)objc_claimAutoreleasedReturnValue(array);
    v15 = v14;
    if (v14)
    {
      size_t count = xpc_array_get_count(v14);
      if (count)
      {
        size_t v17 = count;
        for (size_t i = 0LL; i != v17; ++i)
        {
          string = xpc_array_get_string(v15, i);
          if (string)
          {
            v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", string));
            if (v20) {
              -[NSMutableSet addObject:](v10, "addObject:", v20);
            }
          }
        }
      }
    }
  }

  if (-[NSMutableSet count](v10, "count"))
  {
    if (v6) {
      id v21 = &off_1001B3B08;
    }
    else {
      id v21 = &off_1001B3B20;
    }
    v26[0] = @"ICDServerNotificationsManagerIsApplicationRegistrationKey";
    v26[1] = @"ICDServerNotificationsManagerApplicationRegistrationBundleIDsKey";
    v27[0] = v21;
    id v22 = -[NSMutableSet copy](v10, "copy");
    v27[1] = v22;
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v27,  v26,  2LL));
    v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSNotification notificationWithName:object:userInfo:]( &OBJC_CLASS___NSNotification,  "notificationWithName:object:userInfo:",  v8,  0LL,  v23));

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[ICDServerNotificationsManager delegate](self, "delegate"));
    [v25 notificationsManager:self didReceiveApplicationInstallationNotification:v24];
  }
}

- (void)_handleFamilyContentDeletionNotification:(id)a3 streamEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7 && xpc_get_type(v7) == (xpc_type_t)&_xpc_type_dictionary)
  {
    id v9 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    xpc_object_t value = xpc_dictionary_get_value(v8, "UserInfo");
    int v11 = (void *)objc_claimAutoreleasedReturnValue(value);
    id v12 = v11;
    if (v11 && xpc_get_type(v11) == (xpc_type_t)&_xpc_type_dictionary)
    {
      xpc_object_t v13 = xpc_dictionary_get_value(v12, "pairs");
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      v15 = v14;
      if (v14 && xpc_get_type(v14) == (xpc_type_t)&_xpc_type_dictionary)
      {
        v19 = _NSConcreteStackBlock;
        uint64_t v20 = 3221225472LL;
        id v21 = sub_100030F90;
        id v22 = &unk_1001A2458;
        uint64_t v23 = v9;
        xpc_array_apply(v15, &v19);
      }
    }

    v24 = @"ICDServerNotificationsManagerFamilyEventKey";
    v25 = v9;
    id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v25,  &v24,  1LL,  v19,  v20,  v21,  v22));
    size_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSNotification notificationWithName:object:userInfo:]( &OBJC_CLASS___NSNotification,  "notificationWithName:object:userInfo:",  v6,  0LL,  v16));

    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[ICDServerNotificationsManager delegate](self, "delegate"));
    [v18 notificationsManager:self didReceiveFamilyDeletionEventNotification:v17];
  }
}

- (void)_handlePlayActivityFlushInternalTestRequestNotification
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[ICDServerNotificationsManager delegate](self, "delegate"));
  [v3 notificationsManagerDidRecieveICPlayActivityFlushInternalTestRequestNotification:self];
}

- (void)_handleMusicSettingsChangedNotification
{
  id v3 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Received music settings changed notification",  v5,  2u);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICDServerNotificationsManager delegate](self, "delegate"));
  [v4 notificationsManagerDidReceiveMusicSettingsChangedNotification:self];
}

- (void)_handleFamilyCircleChangedNotification
{
  id v3 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Received family circle changed notification",  v5,  2u);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICDServerNotificationsManager delegate](self, "delegate"));
  [v4 notificationsManagerDidReceiveFamilyCircleChangedNotification:self];
}

- (ICDServerNotificationsManagerDelegate)delegate
{
  return (ICDServerNotificationsManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
}

@end