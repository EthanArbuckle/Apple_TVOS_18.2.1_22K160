@interface CKNCloudKitManager
+ (id)getApplicationIdentifierFromEntitlements;
+ (id)sharedManager;
- (BOOL)_shouldSync;
- (CKNCloudKitManager)init;
- (id)_createCloudKitContainer;
- (id)_createDictionaryFromRecords:(id)a3;
- (id)_createKeysForRecordsIDs:(id)a3;
- (id)_createRecordsIDsForKeys:(id)a3;
- (id)_createRecordsWithDictionary:(id)a3;
- (id)_underlyingErrorForError:(id)a3 zoneID:(id)a4;
- (void)_cancelRecordZoneSetupTimer;
- (void)_cancelSubscriptionSetupTimer;
- (void)_cleanUpRecordZoneSubscriptionsTimers;
- (void)_cleanUpRecordZonesAndSubscriptions;
- (void)_cloudKitAccountStatusChanged:(id)a3;
- (void)_cloudSyncPreferenceDidChange;
- (void)_createRecordZoneWithID:(id)a3 completion:(id)a4;
- (void)_deleteRecordZoneWithID:(id)a3 qualityOfService:(int64_t)a4 completion:(id)a5;
- (void)_disablePush;
- (void)_disableSyncAndDeleteCloudDataWithCompletionHandler:(id)a3;
- (void)_enablePush;
- (void)_fetchChanges;
- (void)_fetchChangesFrom:(id)a3 completion:(id)a4;
- (void)_fetchChangesWithRetryCount:(unint64_t)a3;
- (void)_handleAccountStatusChange:(id)a3;
- (void)_handleCloudKitNotification:(id)a3;
- (void)_initializeZone;
- (void)_resetZone;
- (void)_saveRecords:(id)a3 recordIDsToDelete:(id)a4 savePolicy:(int64_t)a5 completion:(id)a6;
- (void)_setupAccount;
- (void)_setupAccountState;
- (void)_setupRecordZone;
- (void)_setupRecordZoneSubscription;
- (void)_setupRecordZoneSubscriptionWithRetryInterval:(double)a3;
- (void)_setupRecordZoneWithRetryInterval:(double)a3;
- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6;
- (void)dealloc;
- (void)disablePushNotifications;
- (void)disableSyncAndDeleteCloudDataWithCompletionHandler:(id)a3;
- (void)enablePushNotifications;
- (void)fetchAllChangesWithCompletion:(id)a3;
- (void)fetchChangesWithCompletion:(id)a3;
- (void)removeValuesForKeys:(id)a3 completion:(id)a4;
- (void)saveRecords:(id)a3 deleteRecordIDs:(id)a4 completion:(id)a5;
- (void)saveRecordsWithDictionary:(id)a3 completion:(id)a4;
@end

@implementation CKNCloudKitManager

- (CKNCloudKitManager)init
{
  v39.receiver = self;
  v39.super_class = (Class)&OBJC_CLASS___CKNCloudKitManager;
  v2 = -[CKNCloudKitManager init](&v39, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue( +[CKKnowledgeStore userDefaultsKnowledgeStore]( &OBJC_CLASS___CKKnowledgeStore,  "userDefaultsKnowledgeStore"));
    v4 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForKey:@"ServerChangeToken"]);
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSData);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0) {
      v6 = v4;
    }
    else {
      v6 = 0LL;
    }
    v7 = v6;
    if (v7)
    {
      id v38 = 0LL;
      v8 = -[NSKeyedUnarchiver initForReadingFromData:error:]( objc_alloc(&OBJC_CLASS___NSKeyedUnarchiver),  "initForReadingFromData:error:",  v7,  &v38);
      id v9 = v38;
      if (v9)
      {
        v10 = (os_log_s *)CKLogContextDaemon;
        if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v41 = "-[CKNCloudKitManager init]";
          __int16 v42 = 2112;
          v43 = v7;
          _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "%s error unarchiving server change token %@",  buf,  0x16u);
        }

        v11 = 0LL;
      }

      else
      {
        uint64_t v12 = objc_opt_self(&OBJC_CLASS___CKServerChangeToken);
        v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
        v11 = (void *)objc_claimAutoreleasedReturnValue( -[NSKeyedUnarchiver decodeObjectOfClass:forKey:]( v8,  "decodeObjectOfClass:forKey:",  v13,  NSKeyedArchiveRootObjectKey));

        -[NSKeyedUnarchiver finishDecoding](v8, "finishDecoding");
        uint64_t v14 = objc_opt_class(&OBJC_CLASS___CKServerChangeToken);
        if ((objc_opt_isKindOfClass(v11, v14) & 1) != 0) {
          objc_storeStrong((id *)&v2->_serverChangeToken, v11);
        }
      }
    }

    else
    {
      v11 = 0LL;
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForKey:@"HasSetUpRecordZoneSubscription"]);
    uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSNumber);
    if ((objc_opt_isKindOfClass(v15, v16) & 1) != 0) {
      v17 = v15;
    }
    else {
      v17 = 0LL;
    }
    v2->_hasSetUpRecordZoneSubscription = [v17 BOOLValue];
    -[CKAccountInfo setAccountStatus:](v2->_accountInfo, "setAccountStatus:", 0LL);
    -[CKAccountInfo setSupportsDeviceToDeviceEncryption:](v2->_accountInfo, "setSupportsDeviceToDeviceEncryption:", 0LL);
    -[CKAccountInfo setAccountPartition:](v2->_accountInfo, "setAccountPartition:", 1LL);
    id v18 = [(id)objc_opt_class(v2) getApplicationIdentifierFromEntitlements];
    uint64_t v19 = objc_claimAutoreleasedReturnValue(v18);
    applicationIdentifier = v2->_applicationIdentifier;
    v2->_applicationIdentifier = (NSString *)v19;

    objc_storeStrong((id *)&v2->_supportedRecordType, @"SiriKnowledgeKeyValueRecord");
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
    v2->_cloudSyncEnabled = [v21 cloudSyncEnabled];

    v22 = (os_log_s *)CKLogContextDaemon;
    if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      v23 = @"enabled";
      if (!v2->_cloudSyncEnabled) {
        v23 = @"disabled";
      }
      *(_DWORD *)buf = 136315394;
      v41 = "-[CKNCloudKitManager init]";
      __int16 v42 = 2112;
      v43 = v23;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "%s Cloud sync is %@", buf, 0x16u);
    }

    dispatch_queue_t v24 = dispatch_queue_create("CKNCloudKitManager.Serial", 0LL);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v24;

    uint64_t v26 = objc_claimAutoreleasedReturnValue(-[CKNCloudKitManager _createCloudKitContainer](v2, "_createCloudKitContainer"));
    container = v2->_container;
    v2->_container = (CKContainer *)v26;

    v28 = (dispatch_queue_s *)v2->_serialQueue;
    v33 = _NSConcreteStackBlock;
    uint64_t v34 = 3221225472LL;
    v35 = sub_10000A748;
    v36 = &unk_100018A58;
    v29 = v2;
    v37 = v29;
    dispatch_async(v28, &v33);
    v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSNotificationCenter defaultCenter]( &OBJC_CLASS___NSNotificationCenter,  "defaultCenter",  v33,  v34,  v35,  v36));
    [v30 addObserver:v29 selector:"_cloudKitAccountStatusChanged:" name:CKAccountChangedNotification object:0];
    [v30 addObserver:v29 selector:"_cloudKitAccountStatusChanged:" name:CKIdentityUpdateNotification object:0];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver( DarwinNotifyCenter,  v29,  (CFNotificationCallback)sub_10000A78C,  kAFCloudSyncPreferenceDidChangeDarwinNotification,  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
  }

  return v2;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self name:CKAccountChangedNotification object:0];
  [v3 removeObserver:self name:CKIdentityUpdateNotification object:0];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, kAFCloudSyncPreferenceDidChangeDarwinNotification, 0LL);

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CKNCloudKitManager;
  -[CKNCloudKitManager dealloc](&v5, "dealloc");
}

- (void)enablePushNotifications
{
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000A740;
  block[3] = &unk_100018A58;
  block[4] = self;
  dispatch_async((dispatch_queue_t)serialQueue, block);
}

- (void)disablePushNotifications
{
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000A738;
  block[3] = &unk_100018A58;
  block[4] = self;
  dispatch_async((dispatch_queue_t)serialQueue, block);
}

- (void)_enablePush
{
  v3 = self->_applicationIdentifier;
  v4 = (void *)objc_claimAutoreleasedReturnValue([@"com.apple.icloud-container." stringByAppendingString:v3]);

  v8 = v4;
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v8, 1LL));
  v6 = sub_10000A62C(self);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  [v7 _setEnabledTopics:v5];
}

- (void)_disablePush
{
  v3 = sub_10000A62C(self);
  id v4 = (id)objc_claimAutoreleasedReturnValue(v3);
  [v4 _setEnabledTopics:0];
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (os_log_s *)CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315650;
    id v9 = "-[CKNCloudKitManager connection:didReceivePublicToken:]";
    __int16 v10 = 2112;
    id v11 = v6;
    __int16 v12 = 2112;
    id v13 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%s Received public token (%@) on connection %@",  (uint8_t *)&v8,  0x20u);
  }
}

- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = (os_log_s *)CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v14 = 136316162;
    v15 = "-[CKNCloudKitManager connection:didReceiveToken:forTopic:identifier:]";
    __int16 v16 = 2112;
    id v17 = v10;
    __int16 v18 = 2112;
    id v19 = v11;
    __int16 v20 = 2112;
    id v21 = v12;
    __int16 v22 = 2112;
    id v23 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "%s Received per-topic push token (%@) for topic (%@) identifier (%@) on connection (%@)",  (uint8_t *)&v14,  0x34u);
  }
}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = (void *)objc_claimAutoreleasedReturnValue([v7 userInfo]);
  id v9 = (void *)CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    id v10 = v9;
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 topic]);
    int v17 = 136315650;
    __int16 v18 = "-[CKNCloudKitManager connection:didReceiveIncomingMessage:]";
    __int16 v19 = 2112;
    __int16 v20 = v11;
    __int16 v21 = 2112;
    id v22 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%s APS message received for topic (%@) on connection (%@)",  (uint8_t *)&v17,  0x20u);
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 topic]);
  if (self) {
    applicationIdentifier = self->_applicationIdentifier;
  }
  else {
    applicationIdentifier = 0LL;
  }
  int v14 = (void *)objc_claimAutoreleasedReturnValue([@"com.apple.icloud-container." stringByAppendingString:applicationIdentifier]);
  unsigned int v15 = [v12 isEqualToString:v14];

  if (v15)
  {
    __int16 v16 = (void *)objc_claimAutoreleasedReturnValue( +[CKNotification notificationFromRemoteNotificationDictionary:]( &OBJC_CLASS___CKNotification,  "notificationFromRemoteNotificationDictionary:",  v8));
    -[CKNCloudKitManager _handleCloudKitNotification:](self, "_handleCloudKitNotification:", v16);
  }
}

- (void)_handleCloudKitNotification:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (-[CKNCloudKitManager _shouldSync](self, "_shouldSync"))
  {
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___CKRecordZoneNotification);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      id v6 = v4;
      id v7 = (os_log_s *)CKLogContextDaemon;
      if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        int v14 = 136315394;
        unsigned int v15 = "-[CKNCloudKitManager _handleCloudKitNotification:]";
        __int16 v16 = 2112;
        id v17 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%s Received record zone notification: (%@)",  (uint8_t *)&v14,  0x16u);
      }

      if ([v6 databaseScope] == (id)2)
      {
        int v8 = (void *)objc_claimAutoreleasedReturnValue([v6 recordZoneID]);
        id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 zoneName]);
        if (v9)
        {
          id v10 = v9;
          if ([v9 isEqualToString:@"com.apple.siri.knowledge"])
          {
            -[CKNCloudKitManager _fetchChanges](self, "_fetchChanges");
          }

          else
          {
            id v13 = (os_log_s *)CKLogContextDaemon;
            if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_INFO))
            {
              int v14 = 136315394;
              unsigned int v15 = "-[CKNCloudKitManager _handleCloudKitNotification:]";
              __int16 v16 = 2112;
              id v17 = v8;
              _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "%s Unrecognized record zone notification zone name: (%@)",  (uint8_t *)&v14,  0x16u);
            }
          }
        }

        else
        {
          id v12 = (os_log_s *)CKLogContextDaemon;
          if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_ERROR))
          {
            int v14 = 136315138;
            unsigned int v15 = "-[CKNCloudKitManager _handleCloudKitNotification:]";
            _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "%s Record zone notification contains no zone name",  (uint8_t *)&v14,  0xCu);
          }
        }
      }
    }
  }

  else
  {
    id v11 = (os_log_s *)CKLogContextDaemon;
    if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v14 = 136315138;
      unsigned int v15 = "-[CKNCloudKitManager _handleCloudKitNotification:]";
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "%s iCloud sync is disabled. Ignoring notification",  (uint8_t *)&v14,  0xCu);
    }
  }
}

- (void)_cloudKitAccountStatusChanged:(id)a3
{
  id v4 = (os_log_s *)CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    int v8 = "-[CKNCloudKitManager _cloudKitAccountStatusChanged:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000A624;
  block[3] = &unk_100018A58;
  block[4] = self;
  dispatch_async((dispatch_queue_t)serialQueue, block);
}

- (void)_cloudSyncPreferenceDidChange
{
  v3 = (os_log_s *)CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v7 = "-[CKNCloudKitManager _cloudSyncPreferenceDidChange]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s CloudKit preferences changed", buf, 0xCu);
  }

  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000A4F4;
  block[3] = &unk_100018A58;
  block[4] = self;
  dispatch_async((dispatch_queue_t)serialQueue, block);
}

- (void)_setupAccount
{
  container = self->_container;
  if (!container)
  {
    id v4 = (CKContainer *)objc_claimAutoreleasedReturnValue(-[CKNCloudKitManager _createCloudKitContainer](self, "_createCloudKitContainer"));
    uint64_t v5 = self->_container;
    self->_container = v4;

    container = self->_container;
  }

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10000A280;
  v6[3] = &unk_100018680;
  v6[4] = self;
  -[CKContainer accountInfoWithCompletionHandler:](container, "accountInfoWithCompletionHandler:", v6);
}

- (void)_handleAccountStatusChange:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  unsigned int v6 = -[CKAccountInfo isEqual:](self->_accountInfo, "isEqual:", v5);
  id v7 = (os_log_s *)CKLogContextDaemon;
  BOOL v8 = os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_INFO);
  if (v6)
  {
    if (v8)
    {
      int v14 = 136315138;
      unsigned int v15 = "-[CKNCloudKitManager _handleAccountStatusChange:]";
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%s CloudKit account status is unchanged",  (uint8_t *)&v14,  0xCu);
    }
  }

  else
  {
    if (v8)
    {
      id v9 = v7;
      uint64_t v10 = CKStringFromAccountStatus([v5 accountStatus]);
      id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      unsigned int v12 = [v5 supportsDeviceToDeviceEncryption];
      id v13 = @"Disabled";
      unsigned int v15 = "-[CKNCloudKitManager _handleAccountStatusChange:]";
      int v14 = 136315650;
      __int16 v16 = 2112;
      id v17 = v11;
      if (v12) {
        id v13 = @"Enabled";
      }
      __int16 v18 = 2112;
      __int16 v19 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "%s CloudKit account status: (%@) encryption is: %@",  (uint8_t *)&v14,  0x20u);
    }

    objc_storeStrong((id *)&self->_accountInfo, a3);
    -[CKNCloudKitManager _setupAccountState](self, "_setupAccountState");
  }
}

- (void)_setupAccountState
{
  if (-[CKAccountInfo supportsDeviceToDeviceEncryption]( self->_accountInfo,  "supportsDeviceToDeviceEncryption")
    && -[CKAccountInfo accountStatus](self->_accountInfo, "accountStatus") == (id)1)
  {
    -[CKNCloudKitManager _cleanUpRecordZoneSubscriptionsTimers](self, "_cleanUpRecordZoneSubscriptionsTimers");
    if (self->_cloudSyncEnabled) {
      -[CKNCloudKitManager _setupRecordZone](self, "_setupRecordZone");
    }
  }

  else
  {
    -[CKNCloudKitManager _cleanUpRecordZonesAndSubscriptions](self, "_cleanUpRecordZonesAndSubscriptions");
  }

- (BOOL)_shouldSync
{
  if (self->_cloudSyncEnabled)
  {
    unsigned int v2 = -[CKAccountInfo supportsDeviceToDeviceEncryption]( self->_accountInfo,  "supportsDeviceToDeviceEncryption");
    if (v2) {
      LOBYTE(v2) = AFIsHorseman() ^ 1;
    }
  }

  else
  {
    LOBYTE(v2) = 0;
  }

  return v2;
}

- (id)_underlyingErrorForError:(id)a3 zoneID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 code] == (id)2)
  {
    if (v6)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 userInfo]);
      BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:CKPartialErrorsByItemIDKey]);

      id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:v6]);
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 userInfo]);
      id v11 = (id)objc_claimAutoreleasedReturnValue([v10 objectForKey:NSUnderlyingErrorKey]);
    }

    else
    {
      id v11 = 0LL;
    }
  }

  else
  {
    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v5 userInfo]);
    id v11 = (id)objc_claimAutoreleasedReturnValue([v12 objectForKey:NSUnderlyingErrorKey]);

    if (!v11) {
      id v11 = v5;
    }
  }

  return v11;
}

- (void)_fetchChangesFrom:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (-[CKNCloudKitManager _shouldSync](self, "_shouldSync"))
  {
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKContainer privateCloudDatabase](self->_container, "privateCloudDatabase"));
    if (v8)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecordZone zoneID](self->_recordZone, "zoneID"));

      if (v9)
      {
        uint64_t v10 = (void *)CKLogContextDaemon;
        if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          recordZone = self->_recordZone;
          unsigned int v12 = v10;
          id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecordZone zoneID](recordZone, "zoneID"));
          int v14 = (void *)objc_claimAutoreleasedReturnValue([v13 zoneName]);
          uint64_t v15 = CKDatabaseScopeString([v8 databaseScope]);
          __int16 v16 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue(v15);
          *(_DWORD *)buf = 136315650;
          *(void *)&uint8_t buf[4] = "-[CKNCloudKitManager _fetchChangesFrom:completion:]";
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v14;
          *(_WORD *)&buf[22] = 2112;
          v48 = v16;
          _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "%s Fetching changes in record zone (%@) in database (%@)",  buf,  0x20u);
        }

        id v17 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecordZone zoneID](self->_recordZone, "zoneID"));
        v53 = v17;
        v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v53, 1LL));

        __int16 v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
        __int16 v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
        __int16 v20 = objc_alloc_init(&OBJC_CLASS___CKFetchRecordZoneChangesConfiguration);
        -[CKFetchRecordZoneChangesConfiguration setPreviousServerChangeToken:](v20, "setPreviousServerChangeToken:", v6);
        __int16 v21 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecordZone zoneID](self->_recordZone, "zoneID"));
        v51 = v21;
        v52 = v20;
        v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v52,  &v51,  1LL));

        *(void *)buf = 0LL;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x3032000000LL;
        v48 = sub_100009C58;
        v49 = sub_100009C68;
        id v50 = 0LL;
        id v22 = -[CKFetchRecordZoneChangesOperation initWithRecordZoneIDs:configurationsByRecordZoneID:]( objc_alloc(&OBJC_CLASS___CKFetchRecordZoneChangesOperation),  "initWithRecordZoneIDs:configurationsByRecordZoneID:",  v32,  v31);
        -[CKFetchRecordZoneChangesOperation setFetchAllChanges:](v22, "setFetchAllChanges:", 1LL);
        v45[0] = _NSConcreteStackBlock;
        v45[1] = 3221225472LL;
        v45[2] = sub_100009C70;
        v45[3] = &unk_1000186A8;
        id v23 = v18;
        id v46 = v23;
        -[CKFetchRecordZoneChangesOperation setRecordChangedBlock:](v22, "setRecordChangedBlock:", v45);
        v43[0] = _NSConcreteStackBlock;
        v43[1] = 3221225472LL;
        v43[2] = sub_100009C7C;
        v43[3] = &unk_1000186D0;
        id v24 = v19;
        id v44 = v24;
        -[CKFetchRecordZoneChangesOperation setRecordWithIDWasDeletedBlock:]( v22,  "setRecordWithIDWasDeletedBlock:",  v43);
        v42[0] = _NSConcreteStackBlock;
        v42[1] = 3221225472LL;
        v42[2] = sub_100009C88;
        v42[3] = &unk_1000186F8;
        v42[4] = buf;
        -[CKFetchRecordZoneChangesOperation setRecordZoneChangeTokensUpdatedBlock:]( v22,  "setRecordZoneChangeTokensUpdatedBlock:",  v42);
        v41[0] = _NSConcreteStackBlock;
        v41[1] = 3221225472LL;
        v41[2] = sub_100009C9C;
        v41[3] = &unk_100018720;
        v41[4] = buf;
        -[CKFetchRecordZoneChangesOperation setRecordZoneFetchCompletionBlock:]( v22,  "setRecordZoneFetchCompletionBlock:",  v41);
        v33[0] = _NSConcreteStackBlock;
        v33[1] = 3221225472LL;
        v33[2] = sub_100009F44;
        v33[3] = &unk_100018798;
        id v25 = v8;
        id v34 = v25;
        id v26 = v23;
        id v35 = v26;
        v36 = self;
        id v38 = v7;
        id v27 = v24;
        BOOL v40 = v6 == 0LL;
        id v37 = v27;
        objc_super v39 = buf;
        -[CKFetchRecordZoneChangesOperation setFetchRecordZoneChangesCompletionBlock:]( v22,  "setFetchRecordZoneChangesCompletionBlock:",  v33);
        -[CKFetchRecordZoneChangesOperation setQualityOfService:](v22, "setQualityOfService:", 17LL);
        [v25 addOperation:v22];

        _Block_object_dispose(buf, 8);
        goto LABEL_13;
      }

      if (v7)
      {
        uint64_t v29 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  CKErrorDomain,  26LL,  0LL));
        goto LABEL_12;
      }
    }

    else if (v7)
    {
      uint64_t v29 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  CKErrorDomain,  24LL,  0LL));
LABEL_12:
      v30 = (void *)v29;
      (*((void (**)(id, uint64_t, void, void, void, void))v7 + 2))(v7, v29, 0LL, 0LL, 0LL, 0LL);
    }

- (void)_fetchChanges
{
}

- (void)_fetchChangesWithRetryCount:(unint64_t)a3
{
  if (a3 < 2)
  {
    serverChangeToken = self->_serverChangeToken;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_10000962C;
    v7[3] = &unk_100018810;
    v7[4] = self;
    v7[5] = a3;
    -[CKNCloudKitManager _fetchChangesFrom:completion:](self, "_fetchChangesFrom:completion:", serverChangeToken, v7);
  }

  else
  {
    id v5 = (os_log_s *)CKLogContextDaemon;
    if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      id v9 = "-[CKNCloudKitManager _fetchChangesWithRetryCount:]";
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "%s Exceeded fetch retry attempts for zone",  buf,  0xCu);
    }
  }

- (void)fetchChangesWithCompletion:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000093D8;
  v7[3] = &unk_100018860;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)serialQueue, v7);
}

- (void)fetchAllChangesWithCompletion:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100009258;
  v7[3] = &unk_100018860;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)serialQueue, v7);
}

- (id)_createCloudKitContainer
{
  unsigned int v2 = (void *)objc_claimAutoreleasedReturnValue( +[CKContainer containerWithIdentifier:]( &OBJC_CLASS___CKContainer,  "containerWithIdentifier:",  @"com.apple.siri.knowledge"));
  v3 = (void *)objc_opt_new(&OBJC_CLASS___CKContainerOptions);
  [v3 setUseZoneWidePCS:1];
  id v4 = objc_alloc(&OBJC_CLASS___CKContainer);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v2 containerID]);
  id v6 = -[CKContainer initWithContainerID:options:](v4, "initWithContainerID:options:", v5, v3);

  return v6;
}

- (void)_initializeZone
{
  id v11 = -[CKRecordZoneID initWithZoneName:ownerName:]( objc_alloc(&OBJC_CLASS___CKRecordZoneID),  "initWithZoneName:ownerName:",  @"com.apple.siri.knowledge",  CKCurrentUserDefaultName);
  if (v11)
  {
    v3 = -[CKRecordZone initWithZoneID:](objc_alloc(&OBJC_CLASS___CKRecordZone), "initWithZoneID:", v11);
    p_recordZone = &self->_recordZone;
    recordZone = self->_recordZone;
    self->_recordZone = v3;
  }

  else
  {
    p_recordZone = &self->_recordZone;
    recordZone = self->_recordZone;
    self->_recordZone = 0LL;
  }

  if (*p_recordZone)
  {
    id v6 = (CKRecordZoneSubscription *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%@",  @"com.apple.siri.knowledge.subscription",  self->_supportedRecordType));
    id v7 = objc_alloc(&OBJC_CLASS___CKRecordZoneSubscription);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecordZone zoneID](self->_recordZone, "zoneID"));
    id v9 = -[CKRecordZoneSubscription initWithZoneID:subscriptionID:](v7, "initWithZoneID:subscriptionID:", v8, v6);

    -[CKRecordZoneSubscription setRecordType:](v9, "setRecordType:", self->_supportedRecordType);
    subscription = self->_subscription;
    self->_subscription = v9;
  }

  else
  {
    id v6 = self->_subscription;
    self->_subscription = 0LL;
  }
}

- (void)_resetZone
{
  recordZone = self->_recordZone;
  self->_recordZone = 0LL;

  subscription = self->_subscription;
  self->_subscription = 0LL;

  sub_100007960((uint64_t)self, 0);
  sub_100008E80((uint64_t)self, 0LL);
  -[CKNCloudKitManager _setupRecordZone](self, "_setupRecordZone");
}

- (void)_setupRecordZone
{
  if (-[CKNCloudKitManager _shouldSync](self, "_shouldSync"))
  {
    if (self->_recordZone)
    {
      if (self->_subscription && self->_hasSetUpRecordZoneSubscription) {
        -[CKNCloudKitManager _fetchChanges](self, "_fetchChanges");
      }
      else {
        -[CKNCloudKitManager _setupRecordZoneSubscription](self, "_setupRecordZoneSubscription");
      }
    }

    else
    {
      -[CKNCloudKitManager _setupRecordZoneWithRetryInterval:](self, "_setupRecordZoneWithRetryInterval:", 120.0);
    }
  }

- (void)_setupRecordZoneWithRetryInterval:(double)a3
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100008A7C;
  v6[3] = &unk_100018950;
  v6[4] = self;
  id v7 = -[CKRecordZoneID initWithZoneName:ownerName:]( objc_alloc(&OBJC_CLASS___CKRecordZoneID),  "initWithZoneName:ownerName:",  @"com.apple.siri.knowledge",  CKCurrentUserDefaultName);
  double v8 = a3;
  id v5 = v7;
  -[CKNCloudKitManager _createRecordZoneWithID:completion:](self, "_createRecordZoneWithID:completion:", v5, v6);
}

- (void)_cancelRecordZoneSetupTimer
{
  recordZoneSetupTimer = self->_recordZoneSetupTimer;
  p_recordZoneSetupTimer = &self->_recordZoneSetupTimer;
  v3 = (dispatch_source_s *)recordZoneSetupTimer;
  if (recordZoneSetupTimer)
  {
    dispatch_source_cancel(v3);
    objc_storeStrong((id *)p_recordZoneSetupTimer, 0LL);
  }

- (void)_createRecordZoneWithID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, CKRecordZone *, void))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  unsigned __int8 v8 = -[CKNCloudKitManager _shouldSync](self, "_shouldSync");
  id v9 = (void *)CKLogContextDaemon;
  if ((v8 & 1) == 0)
  {
    if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      __int16 v19 = v9;
      __int16 v20 = (void *)objc_claimAutoreleasedReturnValue([v6 zoneName]);
      *(_DWORD *)buf = 136315394;
      id v26 = "-[CKNCloudKitManager _createRecordZoneWithID:completion:]";
      __int16 v27 = 2112;
      v28 = v20;
      _os_log_error_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "%s iCloud sync is disabled. Unable to create zone: (%@)",  buf,  0x16u);

      if (!v7) {
        goto LABEL_13;
      }
    }

    else if (!v7)
    {
      goto LABEL_13;
    }

    id v17 = CKErrorDomain;
    uint64_t v18 = 6LL;
LABEL_11:
    unsigned int v12 = (CKRecordZone *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v17,  v18,  0LL));
    v7[2](v7, v12, 0LL);
    goto LABEL_12;
  }

  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = v9;
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 zoneName]);
    *(_DWORD *)buf = 136315394;
    id v26 = "-[CKNCloudKitManager _createRecordZoneWithID:completion:]";
    __int16 v27 = 2112;
    v28 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s Creating zone: (%@)", buf, 0x16u);
  }

  if (self->_container)
  {
    unsigned int v12 = -[CKRecordZone initWithZoneID:](objc_alloc(&OBJC_CLASS___CKRecordZone), "initWithZoneID:", v6);
    -[CKRecordZone setCapabilities:](v12, "setCapabilities:", 3LL);
    id v13 = objc_alloc(&OBJC_CLASS___CKModifyRecordZonesOperation);
    id v24 = v12;
    int v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v24, 1LL));
    uint64_t v15 = -[CKModifyRecordZonesOperation initWithRecordZonesToSave:recordZoneIDsToDelete:]( v13,  "initWithRecordZonesToSave:recordZoneIDsToDelete:",  v14,  0LL);

    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_100008928;
    v21[3] = &unk_100018978;
    id v22 = v6;
    id v23 = v7;
    -[CKModifyRecordZonesOperation setModifyRecordZonesCompletionBlock:]( v15,  "setModifyRecordZonesCompletionBlock:",  v21);
    -[CKModifyRecordZonesOperation setQualityOfService:](v15, "setQualityOfService:", 17LL);
    __int16 v16 = (void *)objc_claimAutoreleasedReturnValue(-[CKContainer privateCloudDatabase](self->_container, "privateCloudDatabase"));
    [v16 addOperation:v15];

LABEL_12:
    goto LABEL_13;
  }

  if (v7)
  {
    id v17 = CKErrorDomain;
    uint64_t v18 = 5LL;
    goto LABEL_11;
  }

- (void)_deleteRecordZoneWithID:(id)a3 qualityOfService:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  uint64_t v10 = (void *)CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    id v11 = v10;
    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v8 zoneName]);
    *(_DWORD *)buf = 136315394;
    id v22 = "-[CKNCloudKitManager _deleteRecordZoneWithID:qualityOfService:completion:]";
    __int16 v23 = 2112;
    id v24 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s Deleting zone: (%@)", buf, 0x16u);
  }

  if (self->_container)
  {
    id v13 = objc_alloc(&OBJC_CLASS___CKModifyRecordZonesOperation);
    id v20 = v8;
    int v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v20, 1LL));
    uint64_t v15 = -[CKModifyRecordZonesOperation initWithRecordZonesToSave:recordZoneIDsToDelete:]( v13,  "initWithRecordZonesToSave:recordZoneIDsToDelete:",  0LL,  v14);

    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_1000087F0;
    v17[3] = &unk_100018978;
    id v18 = v8;
    id v19 = v9;
    -[CKModifyRecordZonesOperation setModifyRecordZonesCompletionBlock:]( v15,  "setModifyRecordZonesCompletionBlock:",  v17);
    -[CKModifyRecordZonesOperation setQualityOfService:](v15, "setQualityOfService:", a4);
    __int16 v16 = (void *)objc_claimAutoreleasedReturnValue(-[CKContainer privateCloudDatabase](self->_container, "privateCloudDatabase"));
    [v16 addOperation:v15];

LABEL_7:
    goto LABEL_8;
  }

  if (v9)
  {
    uint64_t v15 = (CKModifyRecordZonesOperation *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  CKErrorDomain,  5LL,  0LL));
    (*((void (**)(id, CKModifyRecordZonesOperation *))v9 + 2))(v9, v15);
    goto LABEL_7;
  }

- (void)_cleanUpRecordZoneSubscriptionsTimers
{
}

- (void)_cleanUpRecordZonesAndSubscriptions
{
  recordZone = self->_recordZone;
  self->_recordZone = 0LL;

  subscription = self->_subscription;
  self->_subscription = 0LL;
}

- (id)_createRecordsWithDictionary:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if ([v4 count]
    && (id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecordZone zoneID](self->_recordZone, "zoneID")),
        v5,
        v5))
  {
    id v24 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v4 count]);
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    id v22 = v4;
    id v6 = v4;
    id v7 = [v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v23 = *(void *)v26;
      do
      {
        id v9 = 0LL;
        do
        {
          if (*(void *)v26 != v23) {
            objc_enumerationMutation(v6);
          }
          uint64_t v10 = *(void *)(*((void *)&v25 + 1) + 8LL * (void)v9);
          id v11 = objc_alloc(&OBJC_CLASS___CKRecordID);
          unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecordZone zoneID](self->_recordZone, "zoneID"));
          id v13 = -[CKRecordID initWithRecordName:zoneID:](v11, "initWithRecordName:zoneID:", v10, v12);

          int v14 = -[CKRecord initWithRecordType:recordID:]( objc_alloc(&OBJC_CLASS___CKRecord),  "initWithRecordType:recordID:",  self->_supportedRecordType,  v13);
          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:v10]);
          __int16 v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
          unsigned int v17 = [v15 isEqual:v16];

          if (v17)
          {

            uint64_t v15 = 0LL;
          }

          id v18 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord encryptedValuesByKey](v14, "encryptedValuesByKey"));
          id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  1LL));
          [v18 setObject:v19 forKey:@"version"];

          id v20 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord encryptedValuesByKey](v14, "encryptedValuesByKey"));
          [v20 setObject:v10 forKey:@"key"];

          -[CKRecord setData:](v14, "setData:", v15);
          -[NSMutableArray addObject:](v24, "addObject:", v14);

          id v9 = (char *)v9 + 1;
        }

        while (v8 != v9);
        id v8 = [v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }

      while (v8);
    }

    id v4 = v22;
  }

  else
  {
    id v24 = 0LL;
  }

  return v24;
}

- (id)_createDictionaryFromRecords:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    id v17 = v4;
    id v6 = v4;
    id v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v19;
      do
      {
        for (i = 0LL; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v19 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
          unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v11 data]);
          id v13 = v12;
          if (!v12)
          {
            v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
            id v13 = v3;
          }

          int v14 = (void *)objc_claimAutoreleasedReturnValue([v11 recordID]);
          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 recordName]);
          -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v13, v15);

          if (!v12) {
        }
          }

        id v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }

      while (v8);
    }

    id v4 = v17;
  }

  else
  {
    id v5 = 0LL;
  }

  return v5;
}

- (id)_createRecordsIDsForKeys:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if ([v4 count])
  {
    id v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(-[CKRecordZone zoneID](self->_recordZone, "zoneID"));

    if (v5)
    {
      id v5 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v4 count]);
      __int128 v17 = 0u;
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      __int128 v20 = 0u;
      id v16 = v4;
      id v6 = v4;
      id v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v7)
      {
        id v8 = v7;
        uint64_t v9 = *(void *)v18;
        do
        {
          uint64_t v10 = 0LL;
          do
          {
            if (*(void *)v18 != v9) {
              objc_enumerationMutation(v6);
            }
            uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8LL * (void)v10);
            unsigned int v12 = objc_alloc(&OBJC_CLASS___CKRecordID);
            id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecordZone zoneID](self->_recordZone, "zoneID"));
            int v14 = -[CKRecordID initWithRecordName:zoneID:](v12, "initWithRecordName:zoneID:", v11, v13);

            -[NSMutableArray addObject:](v5, "addObject:", v14);
            uint64_t v10 = (char *)v10 + 1;
          }

          while (v8 != v10);
          id v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
        }

        while (v8);
      }

      id v4 = v16;
    }
  }

  else
  {
    id v5 = 0LL;
  }

  return v5;
}

- (id)_createKeysForRecordsIDs:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    id v4 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v3 count]);
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    id v5 = v3;
    id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        uint64_t v9 = 0LL;
        do
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * (void)v9), "recordName", (void)v12));
          -[NSMutableArray addObject:](v4, "addObject:", v10);

          uint64_t v9 = (char *)v9 + 1;
        }

        while (v7 != v9);
        id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }

      while (v7);
    }
  }

  else
  {
    id v4 = 0LL;
  }

  return v4;
}

- (void)_saveRecords:(id)a3 recordIDsToDelete:(id)a4 savePolicy:(int64_t)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (-[CKNCloudKitManager _shouldSync](self, "_shouldSync"))
  {
    if ([v10 count] || objc_msgSend(v11, "count"))
    {
      __int128 v13 = -[CKModifyRecordsOperation initWithRecordsToSave:recordIDsToDelete:]( objc_alloc(&OBJC_CLASS___CKModifyRecordsOperation),  "initWithRecordsToSave:recordIDsToDelete:",  v10,  v11);
      -[CKModifyRecordsOperation setAtomic:](v13, "setAtomic:", 1LL);
      -[CKModifyRecordsOperation setSavePolicy:](v13, "setSavePolicy:", a5);
      __int128 v20 = _NSConcreteStackBlock;
      uint64_t v21 = 3221225472LL;
      id v22 = sub_100008310;
      uint64_t v23 = &unk_100018978;
      id v24 = self;
      id v25 = v12;
      -[CKModifyRecordsOperation setModifyRecordsCompletionBlock:](v13, "setModifyRecordsCompletionBlock:", &v20);
      -[CKModifyRecordsOperation setQualityOfService:](v13, "setQualityOfService:", 17LL, v20, v21, v22, v23, v24);
      __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(-[CKContainer privateCloudDatabase](self->_container, "privateCloudDatabase"));
      [v14 addOperation:v13];
    }

    else if (v12)
    {
      (*((void (**)(id, void, void, void))v12 + 2))(v12, 0LL, 0LL, 0LL);
    }
  }

  else
  {
    __int128 v15 = (void *)CKLogContextDaemon;
    if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      id v16 = v15;
      int v17 = AFIsHorseman();
      __int128 v18 = "NO";
      if (v17) {
        __int128 v18 = "YES";
      }
      *(_DWORD *)buf = 136315394;
      __int128 v27 = "-[CKNCloudKitManager _saveRecords:recordIDsToDelete:savePolicy:completion:]";
      __int16 v28 = 2080;
      uint64_t v29 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "%s iCloud sync is disabled. Unable to modify records. On HomePod: %s",  buf,  0x16u);
    }

    if (v12)
    {
      __int128 v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  CKErrorDomain,  6LL,  0LL));
      (*((void (**)(id, void *, void, void))v12 + 2))(v12, v19, 0LL, 0LL);
    }
  }
}

- (void)saveRecords:(id)a3 deleteRecordIDs:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  serialQueue = self->_serialQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000082FC;
  v15[3] = &unk_100018B08;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async((dispatch_queue_t)serialQueue, v15);
}

- (void)saveRecordsWithDictionary:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100008164;
  block[3] = &unk_100018AE0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)serialQueue, block);
}

- (void)removeValuesForKeys:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100007FCC;
  block[3] = &unk_100018AE0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)serialQueue, block);
}

- (void)_setupRecordZoneSubscription
{
}

- (void)_setupRecordZoneSubscriptionWithRetryInterval:(double)a3
{
  if (-[CKNCloudKitManager _shouldSync](self, "_shouldSync"))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecordZone zoneID](self->_recordZone, "zoneID"));

    if (v5)
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%@",  @"com.apple.siri.knowledge.subscription",  self->_supportedRecordType));
      id v7 = objc_alloc(&OBJC_CLASS___CKRecordZoneSubscription);
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecordZone zoneID](self->_recordZone, "zoneID"));
      id v9 = -[CKRecordZoneSubscription initWithZoneID:subscriptionID:](v7, "initWithZoneID:subscriptionID:", v8, v6);

      -[CKRecordZoneSubscription setRecordType:](v9, "setRecordType:", self->_supportedRecordType);
      id v10 = objc_alloc_init(&OBJC_CLASS___CKNotificationInfo);
      -[CKNotificationInfo setShouldSendContentAvailable:](v10, "setShouldSendContentAvailable:", 1LL);
      -[CKRecordZoneSubscription setNotificationInfo:](v9, "setNotificationInfo:", v10);
      id v11 = objc_alloc(&OBJC_CLASS___CKModifySubscriptionsOperation);
      uint64_t v21 = v9;
      id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v21, 1LL));
      id v13 = -[CKModifySubscriptionsOperation initWithSubscriptionsToSave:subscriptionIDsToDelete:]( v11,  "initWithSubscriptionsToSave:subscriptionIDsToDelete:",  v12,  0LL);

      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472LL;
      v18[2] = sub_100007A10;
      v18[3] = &unk_1000189C8;
      v18[4] = self;
      __int128 v19 = v9;
      double v20 = a3;
      id v14 = v9;
      -[CKModifySubscriptionsOperation setModifySubscriptionsCompletionBlock:]( v13,  "setModifySubscriptionsCompletionBlock:",  v18);
      -[CKModifySubscriptionsOperation setQualityOfService:](v13, "setQualityOfService:", 17LL);
      __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(-[CKContainer privateCloudDatabase](self->_container, "privateCloudDatabase"));
      [v15 addOperation:v13];

      return;
    }

    id v17 = (os_log_s *)CKLogContextDaemon;
    if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v23 = "-[CKNCloudKitManager _setupRecordZoneSubscriptionWithRetryInterval:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "%s Unable to create zone subscription without a record zone",  buf,  0xCu);
    }
  }

  else
  {
    id v16 = (os_log_s *)CKLogContextDaemon;
    if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v23 = "-[CKNCloudKitManager _setupRecordZoneSubscriptionWithRetryInterval:]";
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "%s iCloud sync is disabled. Unable to create zone subscription",  buf,  0xCu);
    }
  }

  -[CKNCloudKitManager _cancelSubscriptionSetupTimer](self, "_cancelSubscriptionSetupTimer");
}

- (void)_cancelSubscriptionSetupTimer
{
  subscriptionSetupTimer = self->_subscriptionSetupTimer;
  if (subscriptionSetupTimer)
  {
    dispatch_source_cancel((dispatch_source_t)subscriptionSetupTimer);
    id v4 = self->_subscriptionSetupTimer;
    self->_subscriptionSetupTimer = 0LL;
  }

- (void)disableSyncAndDeleteCloudDataWithCompletionHandler:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100007A04;
  v7[3] = &unk_100018860;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)serialQueue, v7);
}

- (void)_disableSyncAndDeleteCloudDataWithCompletionHandler:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (self->_cloudSyncEnabled)
  {
    self->_cloudSyncEnabled = 0;
    -[CKNCloudKitManager _cleanUpRecordZonesAndSubscriptions](self, "_cleanUpRecordZonesAndSubscriptions");
  }

  sub_100007960((uint64_t)self, 0);
  id v5 = -[CKRecordZoneID initWithZoneName:ownerName:]( objc_alloc(&OBJC_CLASS___CKRecordZoneID),  "initWithZoneName:ownerName:",  @"com.apple.siri.knowledge",  CKCurrentUserDefaultName);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000079F0;
  v7[3] = &unk_1000189F0;
  id v8 = v4;
  id v6 = v4;
  -[CKNCloudKitManager _deleteRecordZoneWithID:qualityOfService:completion:]( self,  "_deleteRecordZoneWithID:qualityOfService:completion:",  v5,  33LL,  v7);
}

- (void).cxx_destruct
{
}

+ (id)sharedManager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000A92C;
  block[3] = &unk_100018630;
  block[4] = a1;
  if (qword_10001DE40 != -1) {
    dispatch_once(&qword_10001DE40, block);
  }
  return (id)qword_10001DE48;
}

+ (id)getApplicationIdentifierFromEntitlements
{
  unsigned int v2 = (void *)xpc_copy_entitlement_for_self([@"application-identifier" UTF8String]);
  id v3 = v2;
  if (v2 && xpc_get_type(v2) == (xpc_type_t)&_xpc_type_string)
  {
    id v5 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  xpc_string_get_string_ptr(v3));
    id v4 = (void *)objc_claimAutoreleasedReturnValue(v5);
  }

  else
  {
    id v4 = 0LL;
  }

  return v4;
}

@end