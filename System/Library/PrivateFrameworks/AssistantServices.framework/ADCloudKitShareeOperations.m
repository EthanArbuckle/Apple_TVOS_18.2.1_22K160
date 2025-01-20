@interface ADCloudKitShareeOperations
- (ADCloudKitShareeOperations)initWithQueue:(id)a3 container:(id)a4 instanceContext:(id)a5;
- (id)serverChangeToken;
- (void)_fetchSharedZonesIfAny;
- (void)_setupMultiUserSharedZone:(id)a3;
- (void)_setupSharedDatabase;
- (void)_setupSharedDatabaseView;
- (void)_synchronizeSharedZones;
- (void)dealloc;
- (void)deleteShareForUser:(id)a3 markForReinvitation:(BOOL)a4 completion:(id)a5;
- (void)deleteZones:(id)a3;
- (void)fetchSharedZones;
- (void)fetchZones:(id)a3;
- (void)reset;
- (void)setServerChangeToken:(id)a3;
- (void)synchronizeSharedZones;
@end

@implementation ADCloudKitShareeOperations

- (ADCloudKitShareeOperations)initWithQueue:(id)a3 container:(id)a4 instanceContext:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (AFSupportsMultiUser(v11, v12))
  {
    v19.receiver = self;
    v19.super_class = (Class)&OBJC_CLASS___ADCloudKitShareeOperations;
    v13 = -[ADCloudKitShareeOperations init](&v19, "init");
    v14 = v13;
    if (v13)
    {
      objc_storeStrong((id *)&v13->_queue, a3);
      objc_storeStrong((id *)&v14->_container, a4);
      if (v11) {
        v15 = (AFInstanceContext *)v11;
      }
      else {
        v15 = (AFInstanceContext *)objc_claimAutoreleasedReturnValue( +[AFInstanceContext defaultContext]( &OBJC_CLASS___AFInstanceContext,  "defaultContext"));
      }
      instanceContext = v14->_instanceContext;
      v14->_instanceContext = v15;

      -[ADCloudKitShareeOperations _setupSharedDatabase](v14, "_setupSharedDatabase");
    }

    self = v14;
    v16 = self;
  }

  else
  {
    v16 = 0LL;
  }

  return v16;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___ADCloudKitShareeOperations;
  -[ADCloudKitShareeOperations dealloc](&v4, "dealloc");
}

- (void)_setupSharedDatabase
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10012B214;
  block[3] = &unk_1004FD940;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_setupSharedDatabaseView
{
  v3 = -[CKDatabaseSubscription initWithSubscriptionID:]( objc_alloc(&OBJC_CLASS___CKDatabaseSubscription),  "initWithSubscriptionID:",  @"sharedZoneSubscription");
  objc_super v4 = objc_alloc_init(&OBJC_CLASS___CKNotificationInfo);
  -[CKNotificationInfo setShouldSendContentAvailable:](v4, "setShouldSendContentAvailable:", 1LL);
  -[CKDatabaseSubscription setNotificationInfo:](v3, "setNotificationInfo:", v4);
  v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v13 = "-[ADCloudKitShareeOperations _setupSharedDatabaseView]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  v6 = objc_alloc(&OBJC_CLASS___CKModifySubscriptionsOperation);
  id v11 = v3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v11, 1LL));
  v8 = -[CKModifySubscriptionsOperation initWithSubscriptionsToSave:subscriptionIDsToDelete:]( v6,  "initWithSubscriptionsToSave:subscriptionIDsToDelete:",  v7,  0LL);

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10012B0BC;
  v10[3] = &unk_1004F23F0;
  v10[4] = self;
  -[CKModifySubscriptionsOperation setModifySubscriptionsCompletionBlock:]( v8,  "setModifySubscriptionsCompletionBlock:",  v10);
  -[CKModifySubscriptionsOperation setQualityOfService:](v8, "setQualityOfService:", 17LL);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CKContainer sharedCloudDatabase](self->_container, "sharedCloudDatabase"));
  [v9 addOperation:v8];
}

- (void)fetchSharedZones
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10012B080;
  block[3] = &unk_1004FD940;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_fetchSharedZonesIfAny
{
  v3 = -[CKFetchDatabaseChangesOperation initWithPreviousServerChangeToken:]( objc_alloc(&OBJC_CLASS___CKFetchDatabaseChangesOperation),  "initWithPreviousServerChangeToken:",  0LL);
  -[CKFetchDatabaseChangesOperation setFetchAllChanges:](v3, "setFetchAllChanges:", 1LL);
  objc_initWeak(&location, v3);
  v13[0] = 0LL;
  v13[1] = v13;
  v13[2] = 0x3032000000LL;
  v13[3] = sub_10012AC24;
  v13[4] = sub_10012AC34;
  id v14 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v11[0] = 0LL;
  v11[1] = v11;
  v11[2] = 0x3032000000LL;
  v11[3] = sub_10012AC24;
  v11[4] = sub_10012AC34;
  id v12 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10012AC3C;
  v9[3] = &unk_1004F2418;
  objc_copyWeak(&v10, &location);
  v9[4] = v13;
  -[CKFetchDatabaseChangesOperation setRecordZoneWithIDChangedBlock:](v3, "setRecordZoneWithIDChangedBlock:", v9);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10012AD34;
  v7[3] = &unk_1004F2418;
  objc_copyWeak(&v8, &location);
  v7[4] = v11;
  -[CKFetchDatabaseChangesOperation setRecordZoneWithIDWasDeletedBlock:](v3, "setRecordZoneWithIDWasDeletedBlock:", v7);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10012AE2C;
  v6[3] = &unk_1004F2440;
  v6[4] = self;
  -[CKFetchDatabaseChangesOperation setChangeTokenUpdatedBlock:](v3, "setChangeTokenUpdatedBlock:", v6);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10012AEF4;
  v5[3] = &unk_1004F2468;
  v5[4] = self;
  v5[5] = v13;
  v5[6] = v11;
  -[CKFetchDatabaseChangesOperation setFetchDatabaseChangesCompletionBlock:]( v3,  "setFetchDatabaseChangesCompletionBlock:",  v5);
  -[CKFetchDatabaseChangesOperation setQualityOfService:](v3, "setQualityOfService:", 25LL);
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKContainer sharedCloudDatabase](self->_container, "sharedCloudDatabase"));
  [v4 addOperation:v3];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  _Block_object_dispose(v11, 8);

  _Block_object_dispose(v13, 8);
  objc_destroyWeak(&location);
}

- (void)_setupMultiUserSharedZone:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.%@.%@",  @"com.apple.assistant.multiuser.shared",  @"subscription",  @"AssistantVoiceTriggerFileAssetRecord"));
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.%@.%@",  @"com.apple.assistant.multiuser.shared",  @"subscription",  @"AssistantKeyValueRecord"));
  v7 = objc_alloc_init(&OBJC_CLASS___ADCloudKitMultiUserSharedDataStore);
  -[ADCloudKitMultiUserSharedDataStore setDataStoreIsOnSharedDatabase:](v7, "setDataStoreIsOnSharedDatabase:", 1LL);
  id v8 = objc_alloc(&OBJC_CLASS___ADCloudKitRecordZoneInfo);
  v23[0] = v5;
  v23[1] = v6;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v23, 2LL));
  id v10 = -[ADCloudKitRecordZoneInfo initWithZone:dataStore:subscriptionNames:]( v8,  "initWithZone:dataStore:subscriptionNames:",  v4,  v7,  v9);

  id v11 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v20 = "-[ADCloudKitShareeOperations _setupMultiUserSharedZone:]";
    __int16 v21 = 2112;
    id v22 = v4;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s zone is (%@)", buf, 0x16u);
  }

  id v12 = -[ADCloudKitSharedZoneUpdater initWithQueue:container:sharedZone:zoneOwner:delegate:]( objc_alloc(&OBJC_CLASS___ADCloudKitSharedZoneUpdater),  "initWithQueue:container:sharedZone:zoneOwner:delegate:",  self->_queue,  self->_container,  v10,  0LL,  0LL);
  sharedZoneUpdaters = self->_sharedZoneUpdaters;
  if (!sharedZoneUpdaters)
  {
    id v14 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v15 = self->_sharedZoneUpdaters;
    self->_sharedZoneUpdaters = v14;

    sharedZoneUpdaters = self->_sharedZoneUpdaters;
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue([v4 zoneID]);
  v17 = (void *)objc_claimAutoreleasedReturnValue([v16 ownerName]);
  -[NSMutableDictionary setObject:forKey:](sharedZoneUpdaters, "setObject:forKey:", v12, v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[ADCloudKitManager sharedManager](&OBJC_CLASS___ADCloudKitManager, "sharedManager"));
  [v18 fetchChangesWithZoneInfo:v10 useSharedDatabase:1];
}

- (void)fetchZones:(id)a3
{
  id v4 = a3;
  v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v43 = "-[ADCloudKitShareeOperations fetchZones:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }

  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  id obj = v4;
  id v6 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
  v7 = _NSConcreteStackBlock;
  if (v6)
  {
    id v8 = v6;
    uint64_t v9 = *(void *)v38;
    id v10 = &CFNotificationCenterGetDarwinNotifyCenter_ptr;
    v29 = self;
    do
    {
      id v11 = 0LL;
      do
      {
        if (*(void *)v38 != v9) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v37 + 1) + 8LL * (void)v11);
        id v13 = [objc_alloc((Class)v10[349]) initWithZoneID:v12];
        sharedZoneUpdaters = self->_sharedZoneUpdaters;
        if (sharedZoneUpdaters
          && (v15 = (void *)objc_claimAutoreleasedReturnValue([v12 ownerName]),
              v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](sharedZoneUpdaters, "objectForKey:", v15)),
              v15,
              v16))
        {
          dispatch_time_t v17 = dispatch_time(0LL, 20000000000LL);
          queue = (dispatch_queue_s *)self->_queue;
          block[0] = v7;
          block[1] = 3221225472LL;
          block[2] = sub_10012AB94;
          block[3] = &unk_1004FD968;
          id v35 = v16;
          id v36 = v13;
          id v19 = v8;
          uint64_t v20 = v9;
          __int16 v21 = v10;
          id v22 = v7;
          id v23 = v13;
          id v24 = v16;
          dispatch_after(v17, queue, block);

          v7 = v22;
          id v10 = v21;
          uint64_t v9 = v20;
          id v8 = v19;
          self = v29;
        }

        else
        {
          dispatch_time_t v25 = dispatch_time(0LL, 20000000000LL);
          v26 = (dispatch_queue_s *)self->_queue;
          v32[0] = v7;
          v32[1] = 3221225472LL;
          v32[2] = sub_10012AC10;
          v32[3] = &unk_1004FD968;
          v32[4] = self;
          id v33 = v13;
          id v24 = v13;
          dispatch_after(v25, v26, v32);
        }

        id v11 = (char *)v11 + 1;
      }

      while (v8 != v11);
      id v8 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
    }

    while (v8);
  }

  dispatch_time_t v27 = dispatch_time(0LL, 20000000000LL);
  v28 = (dispatch_queue_s *)self->_queue;
  v31[0] = v7;
  v31[1] = 3221225472LL;
  v31[2] = sub_10012AC1C;
  v31[3] = &unk_1004FD940;
  v31[4] = self;
  dispatch_after(v27, v28, v31);
}

- (void)deleteZones:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v14 + 1) + 8 * (void)v9) ownerName]);
        -[NSMutableArray addObject:](v4, "addObject:", v10);

        uint64_t v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v7);
  }

  if (-[NSMutableArray count](v4, "count"))
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[ADMultiUserService sharedService](&OBJC_CLASS___ADMultiUserService, "sharedService"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_10012AAB8;
    v12[3] = &unk_1004FBD90;
    id v13 = v4;
    [v11 removeUserWithShareOwnerNames:v13 completion:v12];
  }
}

- (void)_synchronizeSharedZones
{
  id v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v21 = "-[ADCloudKitShareeOperations _synchronizeSharedZones]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id obj = self->_sharedZoneUpdaters;
  id v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v16;
    do
    {
      id v7 = 0LL;
      do
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_sharedZoneUpdaters,  "objectForKey:",  *(void *)(*((void *)&v15 + 1) + 8LL * (void)v7)));
        dispatch_time_t v9 = dispatch_time(0LL, 20000000000LL);
        queue = (dispatch_queue_s *)self->_queue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_10012A9B0;
        block[3] = &unk_1004FD940;
        id v14 = v8;
        id v11 = v8;
        dispatch_after(v9, queue, block);

        id v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
    }

    while (v5);
  }
}

- (id)serverChangeToken
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 cloudKitSharedDatabaseChangeToken]);

  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[CKServerChangeToken ad_unarchiveTokenFromData:withExceptionBlock:]( &OBJC_CLASS___CKServerChangeToken,  "ad_unarchiveTokenFromData:withExceptionBlock:",  v3,  &stru_1004F24A8));
  return v4;
}

- (void)setServerChangeToken:(id)a3
{
  id v3 = a3;
  id v7 = v3;
  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "ad_archiveTokenToDataWithExceptionBlock:", &stru_1004F24C8));
    if (!v4) {
      goto LABEL_6;
    }
  }

  else
  {
    id v4 = 0LL;
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
  [v5 setCloudKitSharedDatabaseChangeToken:v4];

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
  [v6 synchronize];

LABEL_6:
}

- (void)reset
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
  [v3 setCloudKitSharedDatabaseChangeToken:0];
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10012A5BC;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)deleteShareForUser:(id)a3 markForReinvitation:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  queue = (dispatch_queue_s *)self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10012A310;
  v13[3] = &unk_1004FBFC0;
  v13[4] = self;
  id v14 = v8;
  BOOL v16 = a4;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(queue, v13);
}

- (void)synchronizeSharedZones
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10012A2D4;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void).cxx_destruct
{
}

@end