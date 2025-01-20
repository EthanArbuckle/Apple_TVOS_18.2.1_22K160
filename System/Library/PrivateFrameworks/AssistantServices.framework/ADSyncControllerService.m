@interface ADSyncControllerService
+ (BOOL)_personalDomainsOverriden;
+ (id)_cachedMuxSyncStatus;
+ (id)_getValidatedUserFromNotification:(id)a3;
+ (id)syncTypes;
+ (void)_logSyncNotificationLatencyFromCompanionSyncMetadata:(id)a3;
+ (void)_updateCachedMuxSyncStatus:(id)a3;
- (ADSyncControllerService)init;
- (BOOL)_syncCompletedForAssistantId:(id)a3;
- (BOOL)syncInProgressForRefId:(id)a3;
- (NSMutableDictionary)muxSyncStatus;
- (NSMutableDictionary)sharedUserIdByCompanionAssistantId;
- (NSMutableOrderedSet)downloadTaskSet;
- (NSMutableSet)assistantIdsToBuildSpeechProfile;
- (NSMutableSet)syncParamsPendingSyncToken;
- (OS_dispatch_queue)queue;
- (id)assistantIdsWithSyncCompleted;
- (id)commandsForDomain:(id)a3;
- (id)currentMuxSyncStatus;
- (id)domains;
- (void)_createDownloadTasksForUser:(id)a3;
- (void)_loadSyncStatusAndPopulateUserIdToCompanionAssistantIdMapWithUser:(id)a3 cachedMuxSyncStatus:(id)a4;
- (void)_loadSyncStatusFromCacheAndPopulateUserIdToCompanionAssistantIdMap;
- (void)_registerNotificationHandlers;
- (void)_sharedUserAddedNotification:(id)a3;
- (void)_sharedUserCompanionInfoChangedNotification:(id)a3;
- (void)_sharedUserPersonalDomainsChangedNotification:(id)a3;
- (void)_sharedUserRemovedNotification:(id)a3;
- (void)_startDownloading;
- (void)_syncInformationUpdatedForUserNotification:(id)a3;
- (void)_syncTokenReceivedNotification:(id)a3;
- (void)_triggerBuildSpeechProfileIfRequiredForAssistantId:(id)a3;
- (void)clearMuxSyncStatus;
- (void)createDownloadTasksForAllUsersWithCompletion:(id)a3;
- (void)handleCommand:(id)a3 forDomain:(id)a4 executionContext:(id)a5 reply:(id)a6;
- (void)setAssistantIdsToBuildSpeechProfile:(id)a3;
- (void)setMuxSyncStatus:(id)a3;
- (void)setSharedUserIdByCompanionAssistantId:(id)a3;
- (void)setSyncParamsPendingSyncToken:(id)a3;
- (void)syncDownloadTask:(id)a3 endedWithResult:(id)a4;
@end

@implementation ADSyncControllerService

- (ADSyncControllerService)init
{
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___ADSyncControllerService;
  v2 = -[ADSyncControllerService init](&v21, "init");
  v3 = v2;
  if (v2)
  {
    -[ADService setIdentifier:](v2, "setIdentifier:", @"SyncControllerService");
    dispatch_queue_attr_t v4 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v4);
    dispatch_queue_attr_t v6 = dispatch_queue_attr_make_with_qos_class(v5, QOS_CLASS_DEFAULT, 0);
    v7 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v6);

    dispatch_queue_t v8 = dispatch_queue_create("ADSyncControllerService", v7);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v8;

    v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    sharedUserIdByCompanionAssistantId = v3->_sharedUserIdByCompanionAssistantId;
    v3->_sharedUserIdByCompanionAssistantId = v10;

    v12 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    muxSyncStatus = v3->_muxSyncStatus;
    v3->_muxSyncStatus = v12;

    v14 = objc_alloc_init(&OBJC_CLASS___NSMutableOrderedSet);
    downloadTaskSet = v3->_downloadTaskSet;
    v3->_downloadTaskSet = v14;

    v16 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    syncParamsPendingSyncToken = v3->_syncParamsPendingSyncToken;
    v3->_syncParamsPendingSyncToken = v16;

    v18 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    assistantIdsToBuildSpeechProfile = v3->_assistantIdsToBuildSpeechProfile;
    v3->_assistantIdsToBuildSpeechProfile = v18;

    -[ADSyncControllerService _loadSyncStatusFromCacheAndPopulateUserIdToCompanionAssistantIdMap]( v3,  "_loadSyncStatusFromCacheAndPopulateUserIdToCompanionAssistantIdMap");
    -[ADSyncControllerService _registerNotificationHandlers](v3, "_registerNotificationHandlers");
  }

  return v3;
}

- (void)_loadSyncStatusFromCacheAndPopulateUserIdToCompanionAssistantIdMap
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[ADSyncControllerService _cachedMuxSyncStatus]( &OBJC_CLASS___ADSyncControllerService,  "_cachedMuxSyncStatus"));
  dispatch_queue_attr_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[ADMultiUserService sharedService](&OBJC_CLASS___ADMultiUserService, "sharedService"));
  id v6 = (id)objc_claimAutoreleasedReturnValue([v4 allUsersBySharedUserID]);

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10010D0BC;
  v7[3] = &unk_1004F1AC8;
  v7[4] = self;
  id v8 = v3;
  id v5 = v3;
  [v6 enumerateKeysAndObjectsUsingBlock:v7];
}

- (void)_loadSyncStatusAndPopulateUserIdToCompanionAssistantIdMapWithUser:(id)a3 cachedMuxSyncStatus:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v15 companionAssistantID]);
  if (v7
    && (([v15 personalDomainsIsEnabled] & 1) != 0
     || +[ADSyncControllerService _personalDomainsOverriden]( &OBJC_CLASS___ADSyncControllerService,  "_personalDomainsOverriden")))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:v7]);
    v9 = v8;
    muxSyncStatus = self->_muxSyncStatus;
    if (v8) {
      v11 = (NSMutableDictionary *)[v8 mutableCopy];
    }
    else {
      v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    }
    v12 = v11;
    -[NSMutableDictionary setObject:forKey:](muxSyncStatus, "setObject:forKey:", v11, v7);

    sharedUserIdByCompanionAssistantId = self->_sharedUserIdByCompanionAssistantId;
    v14 = (void *)objc_claimAutoreleasedReturnValue([v15 sharedUserID]);
    -[NSMutableDictionary setObject:forKey:](sharedUserIdByCompanionAssistantId, "setObject:forKey:", v14, v7);
  }
}

- (void)_registerNotificationHandlers
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 addObserver:self selector:"_syncTokenReceivedNotification:" name:@"ADMUXSyncTokenReceivedNotification" object:0];

  dispatch_queue_attr_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v4 addObserver:self selector:"_syncInformationUpdatedForUserNotification:" name:@"ADMultiUserSyncMetadataDidChangeNotification" object:0];

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v5 addObserver:self selector:"_sharedUserAddedNotification:" name:@"ADMultiUserSharedUserAddedNotification" object:0];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v6 addObserver:self selector:"_sharedUserRemovedNotification:" name:@"ADMultiUserSharedUserRemovedNotification" object:0];

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v7 addObserver:self selector:"_sharedUserPersonalDomainsChangedNotification:" name:@"ADMultiUserSharedUserPersonalDomainsChangedNotification" object:0];

  id v8 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v8 addObserver:self selector:"_sharedUserCompanionInfoChangedNotification:" name:@"ADMultiUserSharedUserCompanionInfoChangedNotification" object:0];
}

- (BOOL)syncInProgressForRefId:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0LL;
  v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  char v14 = 0;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10010CF8C;
  block[3] = &unk_1004FBE80;
  block[4] = self;
  id v9 = v4;
  v10 = &v11;
  id v6 = v4;
  dispatch_sync(queue, block);
  LOBYTE(queue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)queue;
}

- (id)assistantIdsWithSyncCompleted
{
  uint64_t v7 = 0LL;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  v10 = sub_10010B1BC;
  uint64_t v11 = sub_10010B1CC;
  id v12 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  queue = (dispatch_queue_s *)self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10010CE6C;
  v6[3] = &unk_1004FCDB0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(queue, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (BOOL)_syncCompletedForAssistantId:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_muxSyncStatus, "objectForKey:", v4));
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[ADSyncControllerService syncTypes](&OBJC_CLASS___ADSyncControllerService, "syncTypes", 0LL));
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:*(void *)(*((void *)&v14 + 1) + 8 * (void)i)]);

        if (!v11)
        {
          BOOL v12 = 0;
          goto LABEL_11;
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  BOOL v12 = 1;
LABEL_11:

  return v12;
}

- (id)currentMuxSyncStatus
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  queue = (dispatch_queue_s *)self->_queue;
  id v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472LL;
  v10 = sub_10010CD9C;
  uint64_t v11 = &unk_1004FD968;
  BOOL v12 = self;
  uint64_t v13 = v3;
  id v5 = v3;
  dispatch_sync(queue, &v8);
  id v6 = -[NSMutableDictionary copy](v5, "copy", v8, v9, v10, v11, v12);

  return v6;
}

- (void)clearMuxSyncStatus
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10010CD60;
  block[3] = &unk_1004FD940;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (id)domains
{
  uint64_t v3 = SASyncGroupIdentifier;
  return (id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v3,  1LL));
}

- (id)commandsForDomain:(id)a3
{
  if ([a3 isEqualToString:SASyncGroupIdentifier])
  {
    uint64_t v5 = SASyncServerSyncDataResponseClassIdentifier;
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v5, 1LL));
  }

  else
  {
    uint64_t v3 = 0LL;
  }

  return v3;
}

- (void)handleCommand:(id)a3 forDomain:(id)a4 executionContext:(id)a5 reply:(id)a6
{
  id v8 = a3;
  id v9 = a6;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10010C9B4;
  block[3] = &unk_1004FD9E0;
  id v14 = v8;
  __int128 v15 = self;
  id v16 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(queue, block);
}

- (void)_triggerBuildSpeechProfileIfRequiredForAssistantId:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ((-[NSMutableSet containsObject:](self->_assistantIdsToBuildSpeechProfile, "containsObject:", v4) & 1) != 0)
  {
    uint64_t v5 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_sharedUserIdByCompanionAssistantId, "objectForKey:", v4));
    id v6 = (void *)v5;
    if (v5)
    {
      v22 = (void *)v5;
      __int128 v27 = 0u;
      __int128 v28 = 0u;
      __int128 v25 = 0u;
      __int128 v26 = 0u;
      id v7 = self->_downloadTaskSet;
      id v8 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v25,  v29,  16LL);
      if (v8)
      {
        id v9 = v8;
        uint64_t v10 = *(void *)v26;
        while (2)
        {
          for (i = 0LL; i != v9; i = (char *)i + 1)
          {
            if (*(void *)v26 != v10) {
              objc_enumerationMutation(v7);
            }
            id v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * (void)i), "params", v22));
            uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 assistantId]);

            id v14 = v13;
            id v15 = v4;
            id v16 = v15;
            if (v14 == v15)
            {

              if (v4)
              {
                id v14 = v16;
LABEL_24:

                objc_super v21 = (os_log_s *)AFSiriLogContextDaemon;
                id v6 = v22;
                if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 136315394;
                  v31 = "-[ADSyncControllerService _triggerBuildSpeechProfileIfRequiredForAssistantId:]";
                  __int16 v32 = 2112;
                  id v33 = v16;
                  _os_log_debug_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEBUG,  "%s Skipping profile rebuild for assistantId: %@ as there are multiple download tasks in progress",  buf,  0x16u);
                }

                goto LABEL_26;
              }
            }

            else if (v4 && v14)
            {
              unsigned __int8 v17 = [v14 isEqual:v15];

              if ((v17 & 1) != 0) {
                goto LABEL_24;
              }
            }

            else
            {
            }
          }

          id v9 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v25,  v29,  16LL);
          if (v9) {
            continue;
          }
          break;
        }
      }

      id v6 = v22;
      if (-[ADSyncControllerService _syncCompletedForAssistantId:](self, "_syncCompletedForAssistantId:", v4))
      {
        -[NSMutableSet removeObject:](self->_assistantIdsToBuildSpeechProfile, "removeObject:", v4);
        v18 = (void *)objc_claimAutoreleasedReturnValue( +[CKVocabularyAdministrator makeAdministrator]( &OBJC_CLASS___CKVocabularyAdministrator,  "makeAdministrator"));
        v23[0] = _NSConcreteStackBlock;
        v23[1] = 3221225472LL;
        v23[2] = sub_10010C85C;
        v23[3] = &unk_1004FB890;
        id v24 = v22;
        [v18 rebuildSpeechProfileForUserId:v24 completion:v23];
      }
    }

    else
    {
      v20 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v31 = "-[ADSyncControllerService _triggerBuildSpeechProfileIfRequiredForAssistantId:]";
        __int16 v32 = 2112;
        id v33 = v4;
        _os_log_error_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "%s Skipping profile rebuild for assistantId: %@ as userId was not found",  buf,  0x16u);
      }
    }

- (void)createDownloadTasksForAllUsersWithCompletion:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10010C280;
  v7[3] = &unk_1004FD990;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)_createDownloadTasksForUser:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[ADAccount activeAccount](&OBJC_CLASS___ADAccount, "activeAccount"));
  v45 = (void *)objc_claimAutoreleasedReturnValue([v5 aceHostCluster]);

  id v6 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    id v7 = v6;
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 companionAssistantID]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 sharedUserID]);
    *(_DWORD *)buf = 136315651;
    v52 = "-[ADSyncControllerService _createDownloadTasksForUser:]";
    __int16 v53 = 2113;
    v54 = v8;
    __int16 v55 = 2113;
    v56 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%s Received update notification for assistantId: %{private}@, userId: %{private}@",  buf,  0x20u);
  }

  sharedUserIdByCompanionAssistantId = self->_sharedUserIdByCompanionAssistantId;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 companionAssistantID]);
  uint64_t v12 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](sharedUserIdByCompanionAssistantId, "objectForKey:", v11));

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[ADMUXSyncTokenManager sharedInstance](&OBJC_CLASS___ADMUXSyncTokenManager, "sharedInstance"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v4 companionAssistantID]);
  v43 = (void *)objc_claimAutoreleasedReturnValue([v13 getSyncTokenForAssistantId:v14 aceHost:v45]);

  v44 = (void *)v12;
  if (v12)
  {
    __int128 v48 = 0u;
    __int128 v49 = 0u;
    __int128 v46 = 0u;
    __int128 v47 = 0u;
    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[ADSyncControllerService syncTypes](&OBJC_CLASS___ADSyncControllerService, "syncTypes"));
    id v16 = [v15 countByEnumeratingWithState:&v46 objects:v50 count:16];
    if (!v16) {
      goto LABEL_24;
    }
    id v18 = v16;
    uint64_t v19 = *(void *)v47;
    *(void *)&__int128 v17 = 136315650LL;
    __int128 v42 = v17;
    while (1)
    {
      for (i = 0LL; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v47 != v19) {
          objc_enumerationMutation(v15);
        }
        objc_super v21 = *(void **)(*((void *)&v46 + 1) + 8LL * (void)i);
        muxSyncStatus = self->_muxSyncStatus;
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "companionAssistantID", v42));
        id v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](muxSyncStatus, "objectForKey:", v23));
        __int128 v25 = (void *)objc_claimAutoreleasedReturnValue([v24 objectForKey:v21]);

        __int128 v26 = (void *)objc_claimAutoreleasedReturnValue([v4 lastSyncGenerationForSyncType:v21]);
        id v27 = v25;
        id v28 = v26;
        if (v27 == v28)
        {

          if (v27) {
            goto LABEL_22;
          }
        }

        else
        {
          v29 = v28;
          if (v27) {
            BOOL v30 = v28 == 0LL;
          }
          else {
            BOOL v30 = 1;
          }
          if (v30)
          {
          }

          else
          {
            unsigned __int8 v31 = [v27 isEqual:v28];

            if ((v31 & 1) != 0) {
              goto LABEL_22;
            }
          }
        }

        __int16 v32 = (void *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
        {
          v37 = v32;
          v38 = (void *)objc_claimAutoreleasedReturnValue([v4 companionAssistantID]);
          *(_DWORD *)buf = v42;
          v52 = "-[ADSyncControllerService _createDownloadTasksForUser:]";
          __int16 v53 = 2112;
          v54 = v38;
          __int16 v55 = 2112;
          v56 = v21;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEBUG,  "%s Creating download task for user: %@, SyncType: %@",  buf,  0x20u);
        }

        id v33 = objc_alloc(&OBJC_CLASS___ADServerSyncRequestParams);
        v34 = (void *)objc_claimAutoreleasedReturnValue([v4 companionAssistantID]);
        v35 = -[ADServerSyncRequestParams initWithAssistantId:sharedUserId:syncType:clientGeneration:clusterId:triggerType:]( v33,  "initWithAssistantId:sharedUserId:syncType:clientGeneration:clusterId:triggerType:",  v34,  v44,  v21,  v27,  v45,  0LL);

        v36 = -[ADSyncDataDownloadTask initWithParams:usingSyncToken:withDelegate:]( objc_alloc(&OBJC_CLASS___ADSyncDataDownloadTask),  "initWithParams:usingSyncToken:withDelegate:",  v35,  v43,  self);
        -[NSMutableOrderedSet addObject:](self->_downloadTaskSet, "addObject:", v36);

LABEL_22:
      }

      id v18 = [v15 countByEnumeratingWithState:&v46 objects:v50 count:16];
      if (!v18)
      {
LABEL_24:

        -[ADSyncControllerService _startDownloading](self, "_startDownloading");
        goto LABEL_27;
      }
    }
  }

  v39 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    v40 = v39;
    v41 = (void *)objc_claimAutoreleasedReturnValue([v4 companionAssistantID]);
    *(_DWORD *)buf = 136315395;
    v52 = "-[ADSyncControllerService _createDownloadTasksForUser:]";
    __int16 v53 = 2113;
    v54 = v41;
    _os_log_error_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_ERROR,  "%s Found no sharedUserId for assistantId: %{private}@. Unable to create sync download task",  buf,  0x16u);
  }

- (void)_startDownloading
{
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  uint64_t v3 = self->_downloadTaskSet;
  id v4 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
  if (v4)
  {
    id v5 = v4;
    char v6 = 0;
    uint64_t v7 = *(void *)v12;
LABEL_3:
    id v8 = 0LL;
    while (1)
    {
      if (*(void *)v12 != v7) {
        objc_enumerationMutation(v3);
      }
      id v9 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)v8);
      uint64_t v10 = (char *)objc_msgSend(v9, "state", (void)v11);
      if ((v6 & 1) != 0) {
        break;
      }
      id v8 = (char *)v8 + 1;
      char v6 = 1;
      if (v5 == v8)
      {
        id v5 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
        if (v5) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (void)_syncTokenReceivedNotification:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10010BC9C;
  v7[3] = &unk_1004FD968;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)_syncInformationUpdatedForUserNotification:(id)a3
{
  id v4 = a3;
  id v5 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    __int128 v11 = v5;
    __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
    *(_DWORD *)buf = 136315394;
    uint64_t v19 = "-[ADSyncControllerService _syncInformationUpdatedForUserNotification:]";
    __int16 v20 = 2112;
    objc_super v21 = v12;
    _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%s Received notification: %@", buf, 0x16u);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[ADSyncControllerService _getValidatedUserFromNotification:]( &OBJC_CLASS___ADSyncControllerService,  "_getValidatedUserFromNotification:",  v4));
  uint64_t v7 = v6;
  if (v6)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 companionAssistantID]);
    if (v8)
    {
      queue = (dispatch_queue_s *)self->_queue;
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472LL;
      v15[2] = sub_10010BB90;
      v15[3] = &unk_1004FD968;
      id v16 = v7;
      __int128 v17 = self;
      dispatch_async(queue, v15);
    }

    else
    {
      uint64_t v10 = (void *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        __int128 v13 = v10;
        __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
        *(_DWORD *)buf = 136315650;
        uint64_t v19 = "-[ADSyncControllerService _syncInformationUpdatedForUserNotification:]";
        __int16 v20 = 2112;
        objc_super v21 = v14;
        __int16 v22 = 2112;
        v23 = v7;
        _os_log_error_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "%s Received %@ notification with user %@ but no companionAssistantId",  buf,  0x20u);
      }
    }
  }
}

- (void)_sharedUserAddedNotification:(id)a3
{
  id v4 = a3;
  id v5 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    id v9 = v5;
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
    *(_DWORD *)buf = 136315394;
    id v15 = "-[ADSyncControllerService _sharedUserAddedNotification:]";
    __int16 v16 = 2112;
    __int128 v17 = v10;
    _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%s Received notification: %@", buf, 0x16u);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[ADSyncControllerService _getValidatedUserFromNotification:]( &OBJC_CLASS___ADSyncControllerService,  "_getValidatedUserFromNotification:",  v4));
  uint64_t v7 = v6;
  if (v6)
  {
    queue = (dispatch_queue_s *)self->_queue;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10010B9DC;
    v11[3] = &unk_1004FD968;
    id v12 = v6;
    __int128 v13 = self;
    dispatch_async(queue, v11);
  }
}

- (void)_sharedUserRemovedNotification:(id)a3
{
  id v4 = a3;
  id v5 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    id v9 = v5;
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
    *(_DWORD *)buf = 136315394;
    __int16 v16 = "-[ADSyncControllerService _sharedUserRemovedNotification:]";
    __int16 v17 = 2112;
    id v18 = v10;
    _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%s Received notification: %@", buf, 0x16u);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[ADSyncControllerService _getValidatedUserFromNotification:]( &OBJC_CLASS___ADSyncControllerService,  "_getValidatedUserFromNotification:",  v4));
  uint64_t v7 = v6;
  if (v6)
  {
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10010B700;
    block[3] = &unk_1004FD4C0;
    id v12 = v6;
    __int128 v13 = self;
    id v14 = v4;
    dispatch_async(queue, block);
  }
}

- (void)_sharedUserPersonalDomainsChangedNotification:(id)a3
{
  id v4 = a3;
  id v5 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    __int16 v17 = v5;
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
    *(_DWORD *)buf = 136315394;
    id v27 = "-[ADSyncControllerService _sharedUserPersonalDomainsChangedNotification:]";
    __int16 v28 = 2112;
    v29 = v18;
    _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "%s Received notification: %@", buf, 0x16u);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 object]);
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___ADCommunalDeviceUser);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0) {
    id v8 = v6;
  }
  else {
    id v8 = 0LL;
  }
  id v9 = v8;
  uint64_t v10 = v9;
  if (v9)
  {
    __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v9 companionAssistantID]);
    if (v11)
    {
      queue = (dispatch_queue_s *)self->_queue;
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472LL;
      v21[2] = sub_10010B3C8;
      v21[3] = &unk_1004FD470;
      id v22 = v10;
      v23 = self;
      id v24 = v11;
      id v25 = v4;
      dispatch_async(queue, v21);
    }

    else
    {
      __int16 v16 = (void *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        uint64_t v19 = v16;
        __int16 v20 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
        *(_DWORD *)buf = 136315650;
        id v27 = "-[ADSyncControllerService _sharedUserPersonalDomainsChangedNotification:]";
        __int16 v28 = 2112;
        v29 = v20;
        __int16 v30 = 2112;
        unsigned __int8 v31 = v10;
        _os_log_error_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "%s Received %@ notification with user %@ but no companion assistantID",  buf,  0x20u);
      }
    }
  }

  else
  {
    __int128 v13 = (void *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      id v14 = v13;
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
      *(_DWORD *)buf = 136315394;
      id v27 = "-[ADSyncControllerService _sharedUserPersonalDomainsChangedNotification:]";
      __int16 v28 = 2112;
      v29 = v15;
      _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "%s Received %@ notification with incompatible object",  buf,  0x16u);
    }
  }
}

- (void)_sharedUserCompanionInfoChangedNotification:(id)a3
{
  id v4 = a3;
  id v5 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    id v9 = v5;
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
    *(_DWORD *)buf = 136315394;
    id v15 = "-[ADSyncControllerService _sharedUserCompanionInfoChangedNotification:]";
    __int16 v16 = 2112;
    __int16 v17 = v10;
    _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%s Received notification: %@", buf, 0x16u);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[ADSyncControllerService _getValidatedUserFromNotification:]( &OBJC_CLASS___ADSyncControllerService,  "_getValidatedUserFromNotification:",  v4));
  uint64_t v7 = v6;
  if (v6)
  {
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10010AED0;
    block[3] = &unk_1004FD4C0;
    void block[4] = self;
    id v12 = v6;
    id v13 = v4;
    dispatch_async(queue, block);
  }
}

- (void)syncDownloadTask:(id)a3 endedWithResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10010A710;
  block[3] = &unk_1004FD4C0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSMutableOrderedSet)downloadTaskSet
{
  return self->_downloadTaskSet;
}

- (NSMutableDictionary)muxSyncStatus
{
  return self->_muxSyncStatus;
}

- (void)setMuxSyncStatus:(id)a3
{
}

- (NSMutableDictionary)sharedUserIdByCompanionAssistantId
{
  return self->_sharedUserIdByCompanionAssistantId;
}

- (void)setSharedUserIdByCompanionAssistantId:(id)a3
{
}

- (NSMutableSet)syncParamsPendingSyncToken
{
  return self->_syncParamsPendingSyncToken;
}

- (void)setSyncParamsPendingSyncToken:(id)a3
{
}

- (NSMutableSet)assistantIdsToBuildSpeechProfile
{
  return self->_assistantIdsToBuildSpeechProfile;
}

- (void)setAssistantIdsToBuildSpeechProfile:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (BOOL)_personalDomainsOverriden
{
  return 0;
}

+ (id)_getValidatedUserFromNotification:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 object]);
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___ADCommunalDeviceUser);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0) {
    id v6 = v4;
  }
  else {
    id v6 = 0LL;
  }
  id v7 = v6;
  id v8 = v7;
  if (v7)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 sharedUserID]);
    if ([v9 length])
    {
      if (([v8 personalDomainsIsEnabled] & 1) != 0
        || +[ADSyncControllerService _personalDomainsOverriden]( &OBJC_CLASS___ADSyncControllerService,  "_personalDomainsOverriden"))
      {
        id v10 = v8;
        __int128 v11 = v4;
LABEL_16:

        goto LABEL_17;
      }

      __int16 v16 = (void *)AFSiriLogContextDaemon;
      if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
      {
LABEL_15:
        __int128 v11 = 0LL;
        goto LABEL_16;
      }

      id v14 = v16;
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v3 name]);
      int v20 = 136315650;
      objc_super v21 = "+[ADSyncControllerService _getValidatedUserFromNotification:]";
      __int16 v22 = 2112;
      v23 = v15;
      __int16 v24 = 2112;
      id v25 = v8;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEBUG,  "%s Received %@ notification with user %@ but personal domains are disabled for user. Ignoring",  (uint8_t *)&v20,  0x20u);
    }

    else
    {
      id v13 = (void *)AFSiriLogContextDaemon;
      if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR)) {
        goto LABEL_15;
      }
      id v14 = v13;
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v3 name]);
      int v20 = 136315650;
      objc_super v21 = "+[ADSyncControllerService _getValidatedUserFromNotification:]";
      __int16 v22 = 2112;
      v23 = v15;
      __int16 v24 = 2112;
      id v25 = v8;
      _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "%s Received %@ notification with user %@ but no sharedUserID",  (uint8_t *)&v20,  0x20u);
    }

    goto LABEL_15;
  }

  id v12 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    id v18 = v12;
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v3 name]);
    int v20 = 136315394;
    objc_super v21 = "+[ADSyncControllerService _getValidatedUserFromNotification:]";
    __int16 v22 = 2112;
    v23 = v19;
    _os_log_error_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "%s Received %@ notification with incompatible object",  (uint8_t *)&v20,  0x16u);
  }

  __int128 v11 = 0LL;
LABEL_17:

  return v11;
}

+ (id)syncTypes
{
  if (qword_100577E18 != -1) {
    dispatch_once(&qword_100577E18, &stru_1004F1B10);
  }
  return (id)qword_100577E20;
}

+ (void)_updateCachedMuxSyncStatus:(id)a3
{
  id v3 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
  id v4 = objc_alloc(&OBJC_CLASS___NSDictionary);
  id v5 = sub_1001EB128();
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = -[NSDictionary initWithObjectsAndKeys:](v4, "initWithObjectsAndKeys:", v3, v6, 0LL);

  [v8 setBootMuxSyncStatus:v7];
}

+ (id)_cachedMuxSyncStatus
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 bootMuxSyncStatus]);
  id v4 = sub_1001EB128();
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:v5]);

  return v6;
}

+ (void)_logSyncNotificationLatencyFromCompanionSyncMetadata:(id)a3
{
  id v3 = a3;
  if (qword_100577E28 != -1) {
    dispatch_once(&qword_100577E28, &stru_1004F1B30);
  }
  id v4 = (id)qword_100577E30;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v6)
  {
    id v8 = v6;
    id v9 = 0LL;
    uint64_t v10 = *(void *)v28;
    *(void *)&__int128 v7 = 136315394LL;
    __int128 v26 = v7;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v28 != v10) {
          objc_enumerationMutation(v5);
        }
        id v12 = *(void **)(*((void *)&v27 + 1) + 8LL * (void)i);
        id v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", v12, v26, (void)v27));
        if (v13)
        {
          id v14 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v12]);
          id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:@"syncTimestamp"]);
          if (v15)
          {
            if (!v9 || ([v9 doubleValue], double v17 = v16, objc_msgSend(v15, "doubleValue"), v17 < v18))
            {
              id v19 = v15;

              id v9 = v19;
            }
          }

          else
          {
            objc_super v21 = (os_log_s *)AFSiriLogContextDaemon;
            if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v26;
              __int16 v32 = "+[ADSyncControllerService _logSyncNotificationLatencyFromCompanionSyncMetadata:]";
              __int16 v33 = 2112;
              v34 = v14;
              _os_log_error_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "%s Sync timestamp missing in sync metadata:%@",  buf,  0x16u);
            }
          }
        }

        else
        {
          int v20 = (os_log_s *)AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v26;
            __int16 v32 = "+[ADSyncControllerService _logSyncNotificationLatencyFromCompanionSyncMetadata:]";
            __int16 v33 = 2112;
            v34 = v12;
            _os_log_error_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "%s Unable to find SyncType for SyncKey:%@",  buf,  0x16u);
          }
        }
      }

      id v8 = [v5 countByEnumeratingWithState:&v27 objects:v35 count:16];
    }

    while (v8);

    if (v9)
    {
      __int16 v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      [v22 timeIntervalSince1970];
      double v24 = v23;

      [v9 doubleValue];
      +[ADMUXReverseSyncInstrumentationUtil logSyncDataUpdateNotificationReceivedWithLatency:]( &OBJC_CLASS___ADMUXReverseSyncInstrumentationUtil,  "logSyncDataUpdateNotificationReceivedWithLatency:",  v24 - v25);
    }
  }

  else
  {

    id v9 = 0LL;
  }
}

@end