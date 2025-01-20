@interface CPLCloudKitCoordinator
+ (BOOL)enableTurboMode;
+ (BOOL)networkBehaviorShouldBeDiscretionaryForForegroundOperation:(BOOL)a3 upload:(BOOL)a4 metadata:(BOOL)a5;
+ (BOOL)shouldRegisterClient;
+ (BOOL)usesSandboxEnvironment;
+ (CPLCloudKitCoordinator)sharedCoordinator;
+ (NSString)executionIdentifier;
+ (id)_container;
+ (id)_containerOptionsIsZoneish:(BOOL)a3;
+ (id)_zoneishContainer;
+ (id)containerIsZoneish:(BOOL)a3;
+ (id)newOperationConfiguration;
+ (void)setEnableTurboMode:(BOOL)a3;
+ (void)setExecutionIdentifier:(id)a3;
+ (void)setShouldRegisterClient:(BOOL)a3;
- (CKContainer)container;
- (CKContainer)zoneishContainer;
- (CKDatabase)database;
- (CKDatabase)sharedDatabase;
- (CPLCloudKitCoordinator)init;
- (CPLCloudKitPushNotificationCenter)pushNotificationCenter;
- (id)_bestClientToReceivePushNotification:(id)a3;
- (id)_clientsInterestedToReceiveAPushNotificationForZoneID:(id)a3;
- (id)_defaultClient;
- (id)createGroupAllowsCellular:(BOOL)a3 allowsExpensiveNetwork:(BOOL)a4 foreground:(BOOL)a5 upload:(BOOL)a6 metadata:(BOOL)a7 forClient:(id)a8;
- (id)databaseForOperationType:(int64_t)a3 relativeToOperationType:(int64_t)a4 forClient:(id)a5;
- (id)newOperationConfiguration;
- (void)_addClient:(id)a3 interestedInZoneIDs:(id)a4;
- (void)_addClientInterestedInAllZones:(id)a3;
- (void)_addClientToInterestingZones:(id)a3;
- (void)_askNextClient:(id)a3 toProvideCKAssetWithRecordID:(id)a4 fieldName:(id)a5 recordType:(id)a6 signature:(id)a7 bestResponseYet:(unint64_t)a8 completionHandler:(id)a9;
- (void)_coordinatorWillBeUsed;
- (void)_coordinatorWontBeUsed;
- (void)_removeClient:(id)a3 interestedInSomeZones:(id)a4;
- (void)_removeClientFromInterestingZones:(id)a3;
- (void)_startWaitingForPushNotifications;
- (void)_stopWaitingForPushNotifications;
- (void)_waitForClients;
- (void)_waitForClientsIfNecessaryLocked;
- (void)associateMetric:(id)a3 forClient:(id)a4;
- (void)center:(id)a3 didReceivePushNotification:(id)a4;
- (void)coordinatorWontBeUsed;
- (void)fetchAccountInfoWithCompletionHandler:(id)a3;
- (void)getLastClientServedWithAPushNotificationWithCompletionHandler:(id)a3;
- (void)getStatusForClient:(id)a3 completionHandler:(id)a4;
- (void)launchOperation:(id)a3 type:(int64_t)a4 forClient:(id)a5;
- (void)noteClient:(id)a3 isIgnoringChangeInZoneID:(id)a4;
- (void)noteClient:(id)a3 isInForeground:(BOOL)a4;
- (void)provideCKAssetWithRecordID:(id)a3 fieldName:(id)a4 recordType:(id)a5 signature:(id)a6 completionHandler:(id)a7;
- (void)registerClient:(id)a3;
- (void)setPushNotificationCenter:(id)a3;
- (void)unregisterClient:(id)a3;
@end

@implementation CPLCloudKitCoordinator

+ (CPLCloudKitCoordinator)sharedCoordinator
{
  if (qword_100296168 != -1) {
    dispatch_once(&qword_100296168, &stru_100240428);
  }
  return (CPLCloudKitCoordinator *)(id)qword_100296160;
}

- (CPLCloudKitCoordinator)init
{
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___CPLCloudKitCoordinator;
  v2 = -[CPLCloudKitCoordinator init](&v23, "init");
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = CPLCopyDefaultSerialQueueAttributes(v2);
    v5 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v4);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.cpl.cloudkit.coordinator", v5);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v6;

    id v8 = [(id)objc_opt_class(v3) _container];
    uint64_t v9 = objc_claimAutoreleasedReturnValue(v8);
    container = v3->_container;
    v3->_container = (CKContainer *)v9;

    id v11 = [(id)objc_opt_class(v3) _zoneishContainer];
    uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
    zoneishContainer = v3->_zoneishContainer;
    v3->_zoneishContainer = (CKContainer *)v12;

    uint64_t v14 = objc_claimAutoreleasedReturnValue(-[CKContainer privateCloudDatabase](v3->_container, "privateCloudDatabase"));
    database = v3->_database;
    v3->_database = (CKDatabase *)v14;

    uint64_t v16 = objc_claimAutoreleasedReturnValue(-[CKContainer sharedCloudDatabase](v3->_container, "sharedCloudDatabase"));
    sharedDatabase = v3->_sharedDatabase;
    v3->_sharedDatabase = (CKDatabase *)v16;

    v18 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    clients = v3->_clients;
    v3->_clients = v18;

    v20 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    foregroundClients = v3->_foregroundClients;
    v3->_foregroundClients = v20;

    v3->_shouldForceDroppingPushNotifications = 1;
    -[CPLCloudKitCoordinator _waitForClients](v3, "_waitForClients");
  }

  return v3;
}

- (void)setPushNotificationCenter:(id)a3
{
  id v6 = a3;
  if (v6)
  {
    if (self->_pushNotificationCenter) {
      sub_100191E2C((uint64_t)a2, (uint64_t)self);
    }
    id v7 = v6;
    objc_storeStrong((id *)&self->_pushNotificationCenter, a3);
    -[CPLCloudKitPushNotificationCenter setDelegate:](self->_pushNotificationCenter, "setDelegate:", self);
    -[CPLCloudKitPushNotificationCenter setQueue:](self->_pushNotificationCenter, "setQueue:", self->_queue);
    id v6 = v7;
  }
}

+ (BOOL)usesSandboxEnvironment
{
  if (qword_100296178 != -1) {
    dispatch_once(&qword_100296178, &stru_100240448);
  }
  return byte_100296170;
}

+ (id)_containerOptionsIsZoneish:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___CKContainerOptions);
  [v4 setUseZoneWidePCS:v3];
  [v4 setMmcsEncryptionSupport:3];
  [v4 setApplicationBundleIdentifierOverrideForContainerAccess:@"com.apple.photos.cloud"];
  [v4 setApplicationBundleIdentifierOverrideForNetworkAttribution:@"com.apple.photos.cloud"];
  [v4 setApplicationBundleIdentifierOverrideForPushTopicGeneration:@"com.apple.photos.cloud"];
  CPLCloudKitConfigurePhotosCapabilitiesOnContainerOptions(v4);
  return v4;
}

+ (id)containerIsZoneish:(BOOL)a3
{
  BOOL v3 = a3;
  else {
    uint64_t v5 = 1LL;
  }
  id v6 = [[CKContainerID alloc] initWithContainerIdentifier:@"com.apple.photos.cloud" environment:v5];
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _containerOptionsIsZoneish:v3]);
  id v8 = -[CKContainer initWithContainerID:options:]( objc_alloc(&OBJC_CLASS___CKContainer),  "initWithContainerID:options:",  v6,  v7);

  return v8;
}

+ (id)_container
{
  return _[a1 containerIsZoneish:0];
}

+ (id)_zoneishContainer
{
  return _[a1 containerIsZoneish:1];
}

- (void)_coordinatorWontBeUsed
{
  if (!_CPLSilentLogging)
  {
    id v3 = sub_100054E18();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Unregistering coordinator from system activities and notifications",  buf,  2u);
    }
  }

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitCoordinator container](self, "container"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100054E58;
  v7[3] = &unk_10023DC70;
  v7[4] = self;
  +[CPLCallObserver observeSyncCallOn:selector:block:]( &OBJC_CLASS___CPLCallObserver,  "observeSyncCallOn:selector:block:",  v5,  "unregisterFromUploadRequestsWithMachServiceName:",  v7);

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100054E90;
  v6[3] = &unk_10023DC70;
  v6[4] = self;
  +[CPLCallObserver observeSyncCallOn:selector:block:]( &OBJC_CLASS___CPLCallObserver,  "observeSyncCallOn:selector:block:",  self,  "_stopWaitingForPushNotifications",  v6);
}

- (void)_coordinatorWillBeUsed
{
  if (!self->_hasActivatedCoordinator)
  {
    self->_hasActivatedCoordinator = 1;
    if (!_CPLSilentLogging)
    {
      id v3 = sub_100054E18();
      id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Registering coordinator for system activities and notifications",  buf,  2u);
      }
    }

    objc_initWeak(&location, self);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1000550F8;
    v13[3] = &unk_100240498;
    objc_copyWeak(&v14, &location);
    uint64_t v5 = objc_retainBlock(v13);
    if (!_CPLSilentLogging)
    {
      id v6 = sub_100054E18();
      id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v17 = @"com.apple.aps.photos.cloud.datarepair";
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Registering for Asset upload requests with port %@",  buf,  0xCu);
      }
    }

    container = self->_container;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_100055294;
    v11[3] = &unk_10023E058;
    v11[4] = self;
    uint64_t v9 = v5;
    id v12 = v9;
    +[CPLCallObserver observeSyncCallOn:selector:block:]( &OBJC_CLASS___CPLCallObserver,  "observeSyncCallOn:selector:block:",  container,  "registerForAssetUploadRequests:machServiceName:",  v11);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_1000552A8;
    v10[3] = &unk_10023DC70;
    v10[4] = self;
    +[CPLCallObserver observeSyncCallOn:selector:block:]( &OBJC_CLASS___CPLCallObserver,  "observeSyncCallOn:selector:block:",  self,  "_startWaitingForPushNotifications",  v10);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

- (void)_waitForClientsIfNecessaryLocked
{
  if (!-[NSMutableSet count](self->_clients, "count"))
  {
    unint64_t v3 = self->_waitingForClientsGeneration + 1;
    self->_waitingForClientsGeneration = v3;
    dispatch_time_t v4 = dispatch_time(0LL, 10000000000LL);
    queue = self->_queue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_100055340;
    v6[3] = &unk_10023DC98;
    v6[4] = self;
    void v6[5] = v3;
    dispatch_after(v4, (dispatch_queue_t)queue, v6);
  }

- (void)_waitForClients
{
  queue = self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100055494;
  v6[3] = &unk_10023DC70;
  v6[4] = self;
  unint64_t v3 = v6;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100057DCC;
  block[3] = &unk_10023DBC8;
  id v8 = v3;
  dispatch_time_t v4 = queue;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v4, v5);
}

- (void)coordinatorWontBeUsed
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000554F4;
  block[3] = &unk_10023DC70;
  void block[4] = self;
  dispatch_sync((dispatch_queue_t)queue, block);
}

- (id)_defaultClient
{
  if ((unint64_t)-[NSMutableSet count](self->_clients, "count") >= 2)
  {
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    unint64_t v3 = self->_clientsInterestedInAllZones;
    id v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v17;
      uint64_t v7 = CPLLibraryIdentifierSystemLibrary;
      while (2)
      {
        for (i = 0LL; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v17 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v9 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "cloudKitClientIdentifier", (void)v16));
          unint64_t v11 = (unint64_t)v10;
          if (v10) {
            BOOL v12 = v7 == 0;
          }
          else {
            BOOL v12 = 1;
          }
          if (v12)
          {

            if (!(v11 | v7)) {
              goto LABEL_19;
            }
          }

          else
          {
            unsigned __int8 v13 = [v10 isEqual:v7];

            if ((v13 & 1) != 0)
            {
LABEL_19:
              id v15 = v9;

              return v15;
            }
          }
        }

        id v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
        if (v5) {
          continue;
        }
        break;
      }
    }
  }

  return (id)objc_claimAutoreleasedReturnValue( -[NSMutableSet anyObject]( self->_clientsInterestedInAllZones,  "anyObject",  (void)v16));
}

- (void)_addClientInterestedInAllZones:(id)a3
{
  id v4 = a3;
  clientsInterestedInAllZones = self->_clientsInterestedInAllZones;
  id v8 = v4;
  if (!clientsInterestedInAllZones)
  {
    uint64_t v6 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    uint64_t v7 = self->_clientsInterestedInAllZones;
    self->_clientsInterestedInAllZones = v6;

    id v4 = v8;
    clientsInterestedInAllZones = self->_clientsInterestedInAllZones;
  }

  -[NSMutableSet addObject:](clientsInterestedInAllZones, "addObject:", v4);
}

- (void)_addClient:(id)a3 interestedInZoneIDs:(id)a4
{
  id v6 = a3;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id obj = a4;
  id v7 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v24;
    p_clientsInterestedInSomeSharedZones = &self->_clientsInterestedInSomeSharedZones;
    p_clientsInterestedInSomePrivateZones = &self->_clientsInterestedInSomePrivateZones;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(obj);
        }
        unsigned __int8 v13 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)i);
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 ownerName]);
        unsigned int v15 = [v14 isEqualToString:CKCurrentUserDefaultName];

        if (v15)
        {
          __int128 v16 = *p_clientsInterestedInSomePrivateZones;
          __int128 v17 = (void **)p_clientsInterestedInSomePrivateZones;
          if (*p_clientsInterestedInSomePrivateZones) {
            goto LABEL_11;
          }
        }

        else
        {
          __int128 v16 = *p_clientsInterestedInSomeSharedZones;
          __int128 v17 = (void **)p_clientsInterestedInSomeSharedZones;
          if (*p_clientsInterestedInSomeSharedZones) {
            goto LABEL_11;
          }
        }

        __int128 v18 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        __int128 v19 = *v17;
        CFStringRef v17 = v18;

        __int128 v16 = *v17;
LABEL_11:
        id v20 = v16;
        v21 = (NSMutableSet *)objc_claimAutoreleasedReturnValue([v20 objectForKeyedSubscript:v13]);
        if (!v21)
        {
          v21 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
          [v20 setObject:v21 forKeyedSubscript:v13];
        }

        -[NSMutableSet addObject:](v21, "addObject:", v6);
      }

      id v8 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }

    while (v8);
  }
}

- (void)_removeClient:(id)a3 interestedInSomeZones:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_100055A58;
    v18[3] = &unk_1002404C0;
    id v19 = v5;
    id v8 = v7;
    id v20 = v8;
    [v6 enumerateKeysAndObjectsUsingBlock:v18];
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    uint64_t v9 = v8;
    id v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v14,  v21,  16LL);
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v15;
      do
      {
        unsigned __int8 v13 = 0LL;
        do
        {
          if (*(void *)v15 != v12) {
            objc_enumerationMutation(v9);
          }
          objc_msgSend(v6, "removeObjectForKey:", *(void *)(*((void *)&v14 + 1) + 8 * (void)v13), (void)v14);
          unsigned __int8 v13 = (char *)v13 + 1;
        }

        while (v11 != v13);
        id v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v14,  v21,  16LL);
      }

      while (v11);
    }
  }
}

- (void)_removeClientFromInterestingZones:(id)a3
{
  clientsInterestedInAllZones = self->_clientsInterestedInAllZones;
  id v5 = a3;
  -[NSMutableSet removeObject:](clientsInterestedInAllZones, "removeObject:", v5);
  -[CPLCloudKitCoordinator _removeClient:interestedInSomeZones:]( self,  "_removeClient:interestedInSomeZones:",  v5,  self->_clientsInterestedInSomePrivateZones);
  -[CPLCloudKitCoordinator _removeClient:interestedInSomeZones:]( self,  "_removeClient:interestedInSomeZones:",  v5,  self->_clientsInterestedInSomeSharedZones);
}

- (void)_addClientToInterestingZones:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_claimAutoreleasedReturnValue([v4 interestingZoneIDsForCoordinator:self]);
  id v6 = (id)v5;
  if (v5) {
    -[CPLCloudKitCoordinator _addClient:interestedInZoneIDs:](self, "_addClient:interestedInZoneIDs:", v4, v5);
  }
  else {
    -[CPLCloudKitCoordinator _addClientInterestedInAllZones:](self, "_addClientInterestedInAllZones:", v4);
  }
}

- (void)registerClient:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100055C80;
  v10[3] = &unk_10023DDE8;
  v10[4] = self;
  id v11 = v4;
  id v6 = v10;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100057DCC;
  block[3] = &unk_10023DBC8;
  id v13 = v6;
  id v7 = queue;
  id v8 = v4;
  dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v9);
}

- (void)unregisterClient:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100055DB0;
  v10[3] = &unk_10023DDE8;
  v10[4] = self;
  id v11 = v4;
  id v6 = v10;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100057DCC;
  block[3] = &unk_10023DBC8;
  id v13 = v6;
  id v7 = queue;
  id v8 = v4;
  dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v9);
}

- (void)noteClient:(id)a3 isInForeground:(BOOL)a4
{
  id v6 = a3;
  queue = self->_queue;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100055F80;
  v12[3] = &unk_10023F530;
  v12[4] = self;
  id v13 = v6;
  BOOL v14 = a4;
  id v8 = v12;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100057DCC;
  block[3] = &unk_10023DBC8;
  id v16 = v8;
  dispatch_block_t v9 = queue;
  id v10 = v6;
  dispatch_block_t v11 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v9, v11);
}

+ (NSString)executionIdentifier
{
  return (NSString *)(id)qword_100296180;
}

+ (void)setExecutionIdentifier:(id)a3
{
  id v3 = [a3 copy];
  id v4 = (void *)qword_100296180;
  qword_100296180 = (uint64_t)v3;
}

+ (id)newOperationConfiguration
{
  v2 = objc_alloc_init(&OBJC_CLASS___CKOperationConfiguration);
  if (qword_100296180)
  {
    uint64_t v5 = @"X-APPLE-CPL-EXECUTION";
    uint64_t v6 = qword_100296180;
    id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v6,  &v5,  1LL));
    -[CKOperationConfiguration setAdditionalRequestHTTPHeaders:](v2, "setAdditionalRequestHTTPHeaders:", v3);
  }

  return v2;
}

- (id)newOperationConfiguration
{
  return +[CPLCloudKitCoordinator newOperationConfiguration]( &OBJC_CLASS___CPLCloudKitCoordinator,  "newOperationConfiguration");
}

- (void)launchOperation:(id)a3 type:(int64_t)a4 forClient:(id)a5
{
  id v19 = a3;
  id v9 = a5;
  switch(a4)
  {
    case 0LL:
      uint64_t v10 = objc_opt_class(&OBJC_CLASS___CKDatabaseOperation);
      if ((objc_opt_isKindOfClass(v19, v10) & 1) != 0) {
        sub_100191EF8(v19, (uint64_t)a2, (uint64_t)self);
      }
      dispatch_block_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitCoordinator container](self, "container"));
      goto LABEL_8;
    case 1LL:
      uint64_t v12 = objc_opt_class(&OBJC_CLASS___CKDatabaseOperation);
      if ((objc_opt_isKindOfClass(v19, v12) & 1) == 0) {
        sub_100191FFC(v19, (uint64_t)a2, (uint64_t)self);
      }
      dispatch_block_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitCoordinator database](self, "database"));
      goto LABEL_8;
    case 2LL:
      uint64_t v13 = objc_opt_class(&OBJC_CLASS___CKDatabaseOperation);
      if ((objc_opt_isKindOfClass(v19, v13) & 1) == 0) {
        sub_100192100(v19, (uint64_t)a2, (uint64_t)self);
      }
      dispatch_block_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitCoordinator sharedDatabase](self, "sharedDatabase"));
LABEL_8:
      BOOL v14 = v11;
      [v11 addOperation:v19];
      goto LABEL_14;
    case 3LL:
      uint64_t v15 = objc_opt_class(&OBJC_CLASS___CKDatabaseOperation);
      if ((objc_opt_isKindOfClass(v19, v15) & 1) == 0) {
        sub_100192308(v19, (uint64_t)a2, (uint64_t)self);
      }
      BOOL v14 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitCoordinator zoneishContainer](self, "zoneishContainer"));
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v14 privateCloudDatabase]);
      goto LABEL_13;
    case 4LL:
      uint64_t v17 = objc_opt_class(&OBJC_CLASS___CKDatabaseOperation);
      if ((objc_opt_isKindOfClass(v19, v17) & 1) == 0) {
        sub_100192204(v19, (uint64_t)a2, (uint64_t)self);
      }
      BOOL v14 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitCoordinator zoneishContainer](self, "zoneishContainer"));
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v14 sharedCloudDatabase]);
LABEL_13:
      __int128 v18 = v16;
      [v16 addOperation:v19];

LABEL_14:
      break;
    default:
      break;
  }
}

- (void)associateMetric:(id)a3 forClient:(id)a4
{
  id v5 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[CPLCloudKitCoordinator container](self, "container"));
  [v5 setContainer:v6];
}

+ (BOOL)enableTurboMode
{
  if ((byte_100296188 & 1) == 0)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    byte_100296189 = [v2 BOOLForKey:@"CPLTurboMode"];

    byte_100296188 = 1;
  }

  return byte_100296189;
}

+ (void)setEnableTurboMode:(BOOL)a3
{
  byte_100296189 = a3;
  byte_100296188 = 1;
}

+ (BOOL)shouldRegisterClient
{
  if (byte_10029618A == 1) {
    return byte_10029618B != 0;
  }
  BOOL result = 1;
  byte_10029618B = 1;
  byte_10029618A = 1;
  return result;
}

+ (void)setShouldRegisterClient:(BOOL)a3
{
  byte_10029618B = a3;
  byte_10029618A = 1;
}

+ (BOOL)networkBehaviorShouldBeDiscretionaryForForegroundOperation:(BOOL)a3 upload:(BOOL)a4 metadata:(BOOL)a5
{
  if (a3) {
    return 0;
  }
  else {
    return objc_msgSend(a1, "enableTurboMode", v5, v6) ^ 1;
  }
}

- (id)createGroupAllowsCellular:(BOOL)a3 allowsExpensiveNetwork:(BOOL)a4 foreground:(BOOL)a5 upload:(BOOL)a6 metadata:(BOOL)a7 forClient:(id)a8
{
  BOOL v8 = a7;
  BOOL v9 = a6;
  BOOL v10 = a5;
  BOOL v11 = a4;
  BOOL v12 = a3;
  id v14 = a8;
  uint64_t v15 = objc_alloc_init(&OBJC_CLASS___CKOperationGroup);
  id v16 = -[CPLCloudKitCoordinator newOperationConfiguration](self, "newOperationConfiguration");
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitCoordinator container](self, "container"));
  [v16 setContainer:v17];

  [v16 setAllowsCellularAccess:v12];
  if (!v12) {
    [v16 setAllowsExpensiveNetworkAccess:v11];
  }
  objc_msgSend( v16,  "setCPLDiscretionary:",  objc_msgSend( (id)objc_opt_class(self),  "networkBehaviorShouldBeDiscretionaryForForegroundOperation:upload:metadata:",  v10,  v9,  v8));
  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v14 defaultSourceBundleIdentifier]);

  [v16 setApplicationBundleIdentifierOverrideForNetworkAttribution:v18];
  -[CKOperationGroup setDefaultConfiguration:](v15, "setDefaultConfiguration:", v16);

  return v15;
}

- (id)databaseForOperationType:(int64_t)a3 relativeToOperationType:(int64_t)a4 forClient:(id)a5
{
  id v9 = a5;
  if (a3 == 1 || a3 == 3)
  {
    uint64_t v10 = 1LL;
  }

  else
  {
    if (!a3) {
      sub_100192480((uint64_t)a2, (uint64_t)self);
    }
    uint64_t v10 = 0LL;
  }

  if ((unint64_t)(a4 - 1) < 2)
  {
    if ((v10 & 1) != 0) {
      uint64_t v14 = objc_claimAutoreleasedReturnValue(-[CPLCloudKitCoordinator database](self, "database"));
    }
    else {
      uint64_t v14 = objc_claimAutoreleasedReturnValue(-[CPLCloudKitCoordinator sharedDatabase](self, "sharedDatabase"));
    }
    uint64_t v10 = v14;
  }

  else if ((unint64_t)(a4 - 3) >= 2)
  {
    if (!a4) {
      sub_10019240C((uint64_t)a2, (uint64_t)self);
    }
  }

  else
  {
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitCoordinator zoneishContainer](self, "zoneishContainer"));
    BOOL v12 = v11;
    if ((v10 & 1) != 0) {
      uint64_t v13 = objc_claimAutoreleasedReturnValue([v11 privateCloudDatabase]);
    }
    else {
      uint64_t v13 = objc_claimAutoreleasedReturnValue([v11 sharedCloudDatabase]);
    }
    uint64_t v10 = v13;
  }

  return (id)v10;
}

- (void)getStatusForClient:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100056700;
  v14[3] = &unk_10023DB10;
  v14[4] = self;
  id v15 = v6;
  id v16 = v7;
  id v9 = v14;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100057DCC;
  block[3] = &unk_10023DBC8;
  id v18 = v9;
  uint64_t v10 = queue;
  id v11 = v7;
  id v12 = v6;
  dispatch_block_t v13 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v10, v13);
}

- (void)getLastClientServedWithAPushNotificationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100056900;
  v10[3] = &unk_10023DFE0;
  v10[4] = self;
  id v11 = v4;
  id v6 = v10;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100057DCC;
  block[3] = &unk_10023DBC8;
  id v13 = v6;
  id v7 = queue;
  id v8 = v4;
  dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v9);
}

- (void)_askNextClient:(id)a3 toProvideCKAssetWithRecordID:(id)a4 fieldName:(id)a5 recordType:(id)a6 signature:(id)a7 bestResponseYet:(unint64_t)a8 completionHandler:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a9;
  v21 = (void *)objc_claimAutoreleasedReturnValue([v15 nextObject]);
  if (v21)
  {
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472LL;
    v28[2] = sub_100056AC0;
    v28[3] = &unk_1002404E8;
    unint64_t v35 = a8;
    id v34 = v20;
    v28[4] = self;
    id v29 = v15;
    id v30 = v16;
    id v31 = v17;
    id v22 = v18;
    id v27 = v18;
    id v23 = v17;
    id v24 = v16;
    id v25 = v22;
    id v32 = v22;
    id v33 = v19;
    id v26 = v25;
    id v16 = v24;
    id v17 = v23;
    id v18 = v27;
    [v21 coordinator:self provideCKAssetWithRecordID:v30 fieldName:v31 recordType:v26 signature:v33 completionHandler:v28];
  }

  else
  {
    (*((void (**)(id, void, unint64_t))v20 + 2))(v20, 0LL, a8);
  }
}

- (void)provideCKAssetWithRecordID:(id)a3 fieldName:(id)a4 recordType:(id)a5 signature:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  queue = self->_queue;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_100056CB4;
  v26[3] = &unk_100240510;
  v26[4] = self;
  id v27 = v12;
  id v28 = v13;
  id v29 = v14;
  id v30 = v15;
  id v31 = v16;
  id v18 = v26;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100057DCC;
  block[3] = &unk_10023DBC8;
  id v33 = v18;
  id v19 = queue;
  id v20 = v16;
  id v21 = v15;
  id v22 = v14;
  id v23 = v13;
  id v24 = v12;
  dispatch_block_t v25 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v19, v25);
}

- (id)_clientsInterestedToReceiveAPushNotificationForZoneID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 ownerName]);
  unsigned int v6 = [v5 isEqualToString:CKCurrentUserDefaultName];

  uint64_t v7 = 6LL;
  if (v6) {
    uint64_t v7 = 7LL;
  }
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class objectForKeyedSubscript:]((&self->super.isa)[v7], "objectForKeyedSubscript:", v4));

  return v8;
}

- (id)_bestClientToReceivePushNotification:(id)a3
{
  id v4 = a3;
  if ((objc_opt_respondsToSelector(v4, "recordZoneID") & 1) != 0
    && (uint64_t v5 = objc_claimAutoreleasedReturnValue([v4 recordZoneID])) != 0)
  {
    unsigned int v6 = (void *)v5;
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( -[CPLCloudKitCoordinator _clientsInterestedToReceiveAPushNotificationForZoneID:]( self,  "_clientsInterestedToReceiveAPushNotificationForZoneID:",  v5));
    id v8 = (id)objc_claimAutoreleasedReturnValue([v7 anyObject]);

    if (!v8)
    {
      __int128 v32 = 0u;
      __int128 v33 = 0u;
      __int128 v30 = 0u;
      __int128 v31 = 0u;
      dispatch_block_t v9 = self->_clientsInterestedInAllZones;
      id v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v30,  v34,  16LL);
      if (!v10)
      {

LABEL_31:
        id v8 = (id)objc_claimAutoreleasedReturnValue(-[CPLCloudKitCoordinator _defaultClient](self, "_defaultClient"));
        goto LABEL_32;
      }

      id v11 = v10;
      id v29 = v4;
      id v12 = 0LL;
      uint64_t v13 = *(void *)v31;
      uint64_t v14 = CPLLibraryIdentifierSystemLibrary;
      do
      {
        for (i = 0LL; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v31 != v13) {
            objc_enumerationMutation(v9);
          }
          id v16 = *(void **)(*((void *)&v30 + 1) + 8LL * (void)i);
          if ([v16 isInterestedInZoneID:v6 forCoordinator:self])
          {
            id v8 = v16;

            uint64_t v17 = objc_claimAutoreleasedReturnValue([v8 cloudKitClientIdentifier]);
            id v18 = (void *)v17;
            if (v17) {
              BOOL v19 = v14 == 0;
            }
            else {
              BOOL v19 = 1;
            }
            if (v19)
            {
              uint64_t v20 = v17 | v14;

              id v12 = v8;
              if (!v20) {
                goto LABEL_20;
              }
            }

            else
            {
              unsigned __int8 v21 = [(id)v17 isEqual:v14];

              id v12 = v8;
              if ((v21 & 1) != 0) {
                goto LABEL_20;
              }
            }
          }
        }

        id v11 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v30,  v34,  16LL);
        id v8 = v12;
      }

      while (v11);
LABEL_20:

      id v4 = v29;
      if (!v8) {
        goto LABEL_31;
      }
    }
  }

  else
  {
    char v22 = objc_opt_respondsToSelector(v4, "databaseScope");
    uint64_t v23 = objc_claimAutoreleasedReturnValue(-[CPLCloudKitCoordinator _defaultClient](self, "_defaultClient"));
    id v8 = (id)v23;
    unsigned int v6 = 0LL;
    if ((v22 & 1) != 0 && !v23)
    {
      id v24 = [v4 databaseScope];
      if (v24 == (id)3)
      {
        clientsInterestedInSomeSharedZones = self->_clientsInterestedInSomeSharedZones;
      }

      else
      {
        if (v24 != (id)2)
        {
          unsigned int v6 = 0LL;
          id v8 = 0LL;
          goto LABEL_32;
        }

        clientsInterestedInSomeSharedZones = self->_clientsInterestedInSomePrivateZones;
      }

      id v26 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](clientsInterestedInSomeSharedZones, "allValues"));
      id v27 = (void *)objc_claimAutoreleasedReturnValue([v26 firstObject]);
      id v8 = (id)objc_claimAutoreleasedReturnValue([v27 anyObject]);

      unsigned int v6 = 0LL;
    }
  }

- (void)_startWaitingForPushNotifications
{
  if (!-[CPLCloudKitPushNotificationCenter clientIsForeground](self->_pushNotificationCenter, "clientIsForeground")) {
    -[CPLCloudKitPushNotificationCenter setClientIsForeground:]( self->_pushNotificationCenter,  "setClientIsForeground:",  1LL);
  }
}

- (void)_stopWaitingForPushNotifications
{
  pushNotificationCenter = self->_pushNotificationCenter;
  if (self->_shouldForceDroppingPushNotifications) {
    -[CPLCloudKitPushNotificationCenter unregisterFromPushNotifications]( pushNotificationCenter,  "unregisterFromPushNotifications");
  }
  else {
    -[CPLCloudKitPushNotificationCenter stopWaitingForPushNotifications]( pushNotificationCenter,  "stopWaitingForPushNotifications");
  }
}

- (void)noteClient:(id)a3 isIgnoringChangeInZoneID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1000571E4;
  v14[3] = &unk_10023DE80;
  id v15 = v6;
  id v16 = self;
  id v17 = v7;
  dispatch_block_t v9 = v14;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100057DCC;
  block[3] = &unk_10023DBC8;
  id v19 = v9;
  id v10 = queue;
  id v11 = v7;
  id v12 = v6;
  dispatch_block_t v13 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v10, v13);
}

- (void)center:(id)a3 didReceivePushNotification:(id)a4
{
  id v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (-[NSMutableSet count](self->_clients, "count") == (id)1)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet anyObject](self->_clients, "anyObject"));
    if (!_CPLSilentLogging)
    {
      id v7 = sub_100054E18();
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        dispatch_block_t v9 = (void *)objc_claimAutoreleasedReturnValue([v6 cloudKitClientIdentifier]);
        int v15 = 138543618;
        id v16 = v9;
        __int16 v17 = 2112;
        id v18 = v5;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Serving push notification to only client %{public}@: %@",  (uint8_t *)&v15,  0x16u);
      }
    }

- (void)fetchAccountInfoWithCompletionHandler:(id)a3
{
  id v4 = a3;
  container = self->_container;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10005765C;
  v7[3] = &unk_1002405B0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  +[CPLCallObserver observeAsyncCallOn:selector:block:]( &OBJC_CLASS___CPLCallObserver,  "observeAsyncCallOn:selector:block:",  container,  "accountStatusWithCompletionHandler:",  v7);
}

- (CPLCloudKitPushNotificationCenter)pushNotificationCenter
{
  return self->_pushNotificationCenter;
}

- (CKDatabase)database
{
  return self->_database;
}

- (CKDatabase)sharedDatabase
{
  return self->_sharedDatabase;
}

- (CKContainer)container
{
  return self->_container;
}

- (CKContainer)zoneishContainer
{
  return self->_zoneishContainer;
}

- (void).cxx_destruct
{
}

@end