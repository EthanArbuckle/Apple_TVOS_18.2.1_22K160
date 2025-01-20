@interface CSDCallDirectoryManager
+ (CSDCallDirectoryManager)sharedInstance;
+ (id)sharedInstanceWithQueue:(id)a3;
- (BOOL)fetchLiveBlockingInfoForHandle:(id)a3;
- (CSDCallDirectoryManager)initWithQueue:(id)a3;
- (CSDDeviceLockStateObserver)deviceLockObserver;
- (CSDSharedConversationServerBag)serverBag;
- (CXCallDirectoryManager)manager;
- (CXCallDirectoryNSExtensionManager)nsExtensionManager;
- (OS_dispatch_queue)queue;
- (TUFeatureFlags)featureFlags;
- (id)firstEnabledLiveBlockingExtensionIdentifierForPhoneNumber:(id)a3;
- (unint64_t)countOfNotificationsReceived;
- (void)beginDailyMaintenanceWithActivity:(id)a3;
- (void)callDirectoryNSExtensionManager:(id)a3 extensionsChanged:(id)a4;
- (void)setCountOfNotificationsReceived:(unint64_t)a3;
- (void)setManager:(id)a3;
@end

@implementation CSDCallDirectoryManager

+ (CSDCallDirectoryManager)sharedInstance
{
  return (CSDCallDirectoryManager *)+[CSDCallDirectoryManager sharedInstanceWithQueue:]( &OBJC_CLASS___CSDCallDirectoryManager,  "sharedInstanceWithQueue:",  &_dispatch_main_q);
}

+ (id)sharedInstanceWithQueue:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10006BBCC;
  block[3] = &unk_1003D7730;
  id v8 = a3;
  uint64_t v3 = qword_10044CF18;
  id v4 = v8;
  if (v3 != -1) {
    dispatch_once(&qword_10044CF18, block);
  }
  id v5 = (id)qword_10044CF10;

  return v5;
}

- (CSDCallDirectoryManager)initWithQueue:(id)a3
{
  id v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___CSDCallDirectoryManager;
  v6 = -[CSDCallDirectoryManager init](&v23, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    id v8 = -[CSDDeviceLockStateObserver initWithQueue:]( objc_alloc(&OBJC_CLASS___CSDDeviceLockStateObserver),  "initWithQueue:",  v7->_queue);
    deviceLockObserver = v7->_deviceLockObserver;
    v7->_deviceLockObserver = v8;

    objc_initWeak(&location, v7);
    v10 = v7->_deviceLockObserver;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_10006BDE0;
    v20[3] = &unk_1003D7DF0;
    objc_copyWeak(&v21, &location);
    -[CSDDeviceLockStateObserver performBlockAfterFirstUnlock:](v10, "performBlockAfterFirstUnlock:", v20);
    v11 = objc_alloc_init(&OBJC_CLASS___CXCallDirectoryNSExtensionManager);
    nsExtensionManager = v7->_nsExtensionManager;
    v7->_nsExtensionManager = v11;

    -[CXCallDirectoryNSExtensionManager setDelegate:queue:]( v7->_nsExtensionManager,  "setDelegate:queue:",  v7,  v7->_queue);
    -[CXCallDirectoryNSExtensionManager beginMatchingExtensions](v7->_nsExtensionManager, "beginMatchingExtensions");
    v13 = objc_alloc_init(&OBJC_CLASS___TUFeatureFlags);
    featureFlags = v7->_featureFlags;
    v7->_featureFlags = v13;

    v15 = objc_alloc_init(&OBJC_CLASS___CSDSharedConversationServerBag);
    serverBag = v7->_serverBag;
    v7->_serverBag = v15;

    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_10006BE74;
    handler[3] = &unk_1003D85D8;
    v19 = v7;
    xpc_activity_register( "com.apple.telephonyutilities.callservicesd.calldirectorymaintenance.daily",  XPC_ACTIVITY_CHECK_IN,  handler);

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }

  return v7;
}

- (BOOL)fetchLiveBlockingInfoForHandle:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallDirectoryManager featureFlags](self, "featureFlags"));
  unsigned int v6 = [v5 liveIDLookupEnabled];

  if (v6)
  {
    id v7 = sub_1001704C4();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412290;
      id v18 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "fetchLiveBlockingInfoForHandle handle=%@",  (uint8_t *)&v17,  0xCu);
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallDirectoryManager manager](self, "manager"));
    unsigned int v10 = 0;
    if (v4 && v9)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallDirectoryManager manager](self, "manager"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallDirectoryManager serverBag](self, "serverBag"));
      [v12 liveLookupTimeoutSeconds];
      unsigned int v10 = objc_msgSend(v11, "fetchLiveBlockingInfoForHandle:timeout:", v4);
    }

    id v13 = sub_1001704C4();
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = @"NO";
      if (v10) {
        v15 = @"YES";
      }
      int v17 = 138412546;
      id v18 = v4;
      __int16 v19 = 2112;
      v20 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "fetchLiveBlockingInfoForHandle handle=%@ block=%@",  (uint8_t *)&v17,  0x16u);
    }
  }

  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (id)firstEnabledLiveBlockingExtensionIdentifierForPhoneNumber:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallDirectoryManager featureFlags](self, "featureFlags"));
  unsigned int v6 = [v5 liveIDLookupEnabled];

  if (v6)
  {
    id v7 = sub_1001704C4();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412290;
      id v17 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "firstEnabledLiveBlockingExtensionIdentifierForPhoneNumber handle=%@",  (uint8_t *)&v16,  0xCu);
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallDirectoryManager manager](self, "manager"));
    if (v9)
    {
      unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallDirectoryManager manager](self, "manager"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallDirectoryManager serverBag](self, "serverBag"));
      [v11 liveLookupTimeoutSeconds];
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "firstEnabledLiveBlockingExtensionIdentifierForPhoneNumber:timeout:", v4));
    }

    else
    {
      v12 = 0LL;
    }

    id v13 = sub_1001704C4();
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412546;
      id v17 = v4;
      __int16 v18 = 2112;
      __int16 v19 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "firstEnabledLiveBlockingExtensionIdentifierForPhoneNumber handle=%@ blockedByExtension=%@",  (uint8_t *)&v16,  0x16u);
    }
  }

  else
  {
    v12 = 0LL;
  }

  return v12;
}

- (void)beginDailyMaintenanceWithActivity:(id)a3
{
  id v4 = (_xpc_activity_s *)a3;
  id v5 = sub_1001704C4();
  unsigned int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Setting activity state to XPC_ACTIVITY_STATE_CONTINUE",  buf,  2u);
  }

  if (!xpc_activity_set_state(v4, 4LL))
  {
    id v7 = sub_1001704C4();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1002B3898(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }

  int v16 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallDirectoryManager queue](self, "queue"));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_10006C3B8;
  v18[3] = &unk_1003D7758;
  v18[4] = self;
  __int16 v19 = v4;
  id v17 = v4;
  dispatch_async(v16, v18);
}

- (void)callDirectoryNSExtensionManager:(id)a3 extensionsChanged:(id)a4
{
  id v5 = a3;
  unsigned int v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallDirectoryManager queue](self, "queue"));
  dispatch_assert_queue_V2(v6);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallDirectoryManager manager](self, "manager"));
  if (v7)
  {
    -[CSDCallDirectoryManager setCountOfNotificationsReceived:]( self,  "setCountOfNotificationsReceived:",  (char *)-[CSDCallDirectoryManager countOfNotificationsReceived](self, "countOfNotificationsReceived") + 1);
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"extensionsChangedForCallDirectoryExtensionManager-%lu",  -[CSDCallDirectoryManager countOfNotificationsReceived](self, "countOfNotificationsReceived")));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[CSDTransactionManager sharedInstance](&OBJC_CLASS___CSDTransactionManager, "sharedInstance"));
    [v9 beginTransactionIfNecessaryForObject:v8 withReason:@"CXCallDirectoryNSExtensionManagerDelegate"];

    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallDirectoryManager manager](self, "manager"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_10006C8C0;
    v13[3] = &unk_1003D7B70;
    v13[4] = self;
    id v14 = v8;
    uint64_t v11 = v8;
    [v10 synchronizeExtensionsWithCompletionHandler:v13];
  }

  else
  {
    id v12 = sub_1001704C4();
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1002B39B8();
    }
  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (CSDDeviceLockStateObserver)deviceLockObserver
{
  return self->_deviceLockObserver;
}

- (CXCallDirectoryManager)manager
{
  return self->_manager;
}

- (void)setManager:(id)a3
{
}

- (CXCallDirectoryNSExtensionManager)nsExtensionManager
{
  return self->_nsExtensionManager;
}

- (unint64_t)countOfNotificationsReceived
{
  return self->_countOfNotificationsReceived;
}

- (void)setCountOfNotificationsReceived:(unint64_t)a3
{
  self->_countOfNotificationsReceived = a3;
}

- (TUFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (CSDSharedConversationServerBag)serverBag
{
  return self->_serverBag;
}

- (void).cxx_destruct
{
}

@end