@interface PDPassCloudStoreContainer
- (BOOL)_queue_canInitializeContainer;
- (BOOL)canInitializeContainer;
- (PDCloudStoreStateConfiguration)stateConfiguration;
- (PDPassCloudStoreContainer)initWithDataSource:(id)a3;
- (id)allPossibleZoneNamesForContainerDatabase:(id)a3;
- (id)allPossibleZoneSubscriptionsForContainerDatabase:(id)a3;
- (id)cloudStoreZonesForItem:(id)a3 action:(unint64_t)a4 inContainerDatabase:(id)a5;
- (id)cloudStoreZonesForItemType:(unint64_t)a3 configuration:(id)a4 action:(unint64_t)a5 inContainerDatabase:(id)a6;
- (id)identifierFromRecord:(id)a3;
- (id)invalidCloudStoreStateChangeError;
- (id)possibleDatabaseSubscriptionForContainerDatabase:(id)a3;
- (id)recordTypeFromRecordName:(id)a3;
- (id)recordTypesForCloudStoreItemType:(unint64_t)a3;
- (id)subscriptionForZone:(id)a3 inContainerDatabase:(id)a4;
- (id)zoneIDForSubscription:(id)a3 inContainerDatabase:(id)a4;
- (unint64_t)cloudStoreItemTypeForRecordType:(id)a3;
- (void)_queue_setContainerState:(unint64_t)a3 operationGroupNameSuffix:(id)a4 retryCount:(unint64_t)a5 completion:(id)a6;
- (void)_setupContainerManager;
- (void)advanceToNextState:(unint64_t)a3;
- (void)advanceToNextState:(unint64_t)a3 withError:(id)a4;
- (void)checkAccountState;
- (void)eraseStateConfiguration;
- (void)finishInvalidStateChange;
- (void)onWorkQueue:(id)a3;
- (void)passOnHandlingStateChange;
- (void)processFetchedCloudStoreDataWithModifiedRecordsByDatabaseIdentifier:(id)a3 deletedRecordsByDatabaseIdentifier:(id)a4 carriedOverRecordsByDatabaseIdentifier:(id)a5 conflictingRecordsByDatabaseIdentifier:(id)a6 request:(id)a7 completion:(id)a8;
- (void)setCanInitializeContainer:(BOOL)a3;
- (void)setStateConfiguration:(id)a3;
@end

@implementation PDPassCloudStoreContainer

- (PDPassCloudStoreContainer)initWithDataSource:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___PDPassCloudStoreContainer;
  v3 = -[PDCloudStoreContainer initWithDataSource:notificationStreamManager:]( &v14,  "initWithDataSource:notificationStreamManager:",  a3,  0LL);
  v5 = v3;
  if (v3)
  {
    uint64_t v6 = PKIsPhone(v3, v4);
    if ((v6 & 1) != 0 || (PKIsWatch(v6) & 1) != 0 || (uint64_t v7 = PKIsPad(), (v7 & 1) != 0) || (PKIsMac(v7, v8) & 1) != 0) {
      int v9 = 1;
    }
    else {
      int v9 = PKIsVision();
    }
    uint64_t Object = PKLogFacilityTypeGetObject(9LL);
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Checking if the passes cloud store container can be initialized.",  buf,  2u);
    }

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = @"NO";
      if (v9) {
        v12 = @"YES";
      }
      *(_DWORD *)buf = 138543362;
      v16 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Can initalize the passes cloud store container: %{public}@",  buf,  0xCu);
    }

    v5->_canInitializeContainer = v9;
    -[PDPassCloudStoreContainer _setupContainerManager](v5, "_setupContainerManager");
  }

  return v5;
}

- (void)_setupContainerManager
{
  id v3 = objc_alloc(&OBJC_CLASS___CKContainerID);
  id v8 = [v3 initWithContainerIdentifier:PKCloudStorePassesContainerName environment:PKPassContainerEnvironment()];
  id v4 = objc_alloc_init(&OBJC_CLASS___CKContainerOptions);
  [v4 setApplicationBundleIdentifierOverride:PKPassdBundleIdentifier];
  v5 = -[CKContainer initWithContainerID:options:]( objc_alloc(&OBJC_CLASS___CKContainer),  "initWithContainerID:options:",  v8,  v4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer dataSource](self, "dataSource"));
  uint64_t v7 = -[PDCloudStoreContainerManager initWithContainer:validScopes:cacheDataSource:databaseContainerDataSource:]( objc_alloc(&OBJC_CLASS___PDCloudStoreContainerManager),  "initWithContainer:validScopes:cacheDataSource:databaseContainerDataSource:",  v5,  &off_100690FF8,  v6,  self);
  -[PDCloudStoreContainer setContainerManager:](self, "setContainerManager:", v7);
}

- (BOOL)_queue_canInitializeContainer
{
  return self->_canInitializeContainer;
}

- (void)_queue_setContainerState:(unint64_t)a3 operationGroupNameSuffix:(id)a4 retryCount:(unint64_t)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  v12 = objc_alloc_init(&OBJC_CLASS___PDCloudStoreStateConfiguration);
  -[PDCloudStoreStateConfiguration setCurrentState:](v12, "setCurrentState:", a3);
  -[PDCloudStoreStateConfiguration setOperationGroupNameSuffix:](v12, "setOperationGroupNameSuffix:", v11);

  -[PDCloudStoreStateConfiguration setRetryCount:](v12, "setRetryCount:", a5);
  -[PDCloudStoreStateConfiguration setStateChangeCompletion:](v12, "setStateChangeCompletion:", v10);

  -[PDPassCloudStoreContainer setStateConfiguration:](self, "setStateConfiguration:", v12);
  uint64_t Object = PKLogFacilityTypeGetObject(9LL);
  objc_super v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138543362;
    v16 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "[PDPassCloudStoreContainer] state will advance to %{public}@",  (uint8_t *)&v15,  0xCu);
  }

  if (-[PDCloudStoreContainer _queue_ensureContainerState:](self, "_queue_ensureContainerState:", a3))
  {
    if (a3 == 4) {
      -[PDPassCloudStoreContainer checkAccountState](self, "checkAccountState");
    }
    else {
      -[PDPassCloudStoreContainer passOnHandlingStateChange](self, "passOnHandlingStateChange");
    }
  }

  else
  {
    -[PDPassCloudStoreContainer finishInvalidStateChange](self, "finishInvalidStateChange");
  }
}

- (void)finishInvalidStateChange
{
  uint64_t Object = PKLogFacilityTypeGetObject(9LL);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDPassCloudStoreContainer stateConfiguration](self, "stateConfiguration"));
    int v9 = 138543362;
    id v10 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "[PDPassCloudStoreContainer] encountered invalid state configuration %{public}@",  (uint8_t *)&v9,  0xCu);
  }

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[PDPassCloudStoreContainer stateConfiguration](self, "stateConfiguration"));
  uint64_t v7 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue([v6 stateChangeCompletion]);

  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( -[PDPassCloudStoreContainer invalidCloudStoreStateChangeError]( self,  "invalidCloudStoreStateChangeError"));
    ((void (**)(void, void, void *))v7)[2](v7, 0LL, v8);
  }

  -[PDPassCloudStoreContainer eraseStateConfiguration](self, "eraseStateConfiguration");
}

- (id)invalidCloudStoreStateChangeError
{
  return -[PDCloudStoreContainer errorWithCode:description:]( self,  "errorWithCode:description:",  -4006LL,  @"Invalid cloud store state");
}

- (void)eraseStateConfiguration
{
}

- (void)advanceToNextState:(unint64_t)a3
{
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[PDPassCloudStoreContainer stateConfiguration](self, "stateConfiguration"));
  -[PDPassCloudStoreContainer eraseStateConfiguration](self, "eraseStateConfiguration");
  -[PDCloudStoreContainer setNextExpectedState:](self, "setNextExpectedState:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v8 operationGroupNameSuffix]);
  id v6 = [v8 retryCount];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v8 stateChangeCompletion]);
  -[PDPassCloudStoreContainer _queue_setContainerState:operationGroupNameSuffix:retryCount:completion:]( self,  "_queue_setContainerState:operationGroupNameSuffix:retryCount:completion:",  a3,  v5,  v6,  v7);
}

- (void)advanceToNextState:(unint64_t)a3 withError:(id)a4
{
  id v6 = a4;
  id v10 = (id)objc_claimAutoreleasedReturnValue(-[PDPassCloudStoreContainer stateConfiguration](self, "stateConfiguration"));
  -[PDPassCloudStoreContainer eraseStateConfiguration](self, "eraseStateConfiguration");
  -[PDCloudStoreContainer setNextExpectedState:](self, "setNextExpectedState:", a3);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v10 operationGroupNameSuffix]);
  id v8 = [v10 retryCount];
  int v9 = (void *)objc_claimAutoreleasedReturnValue([v10 stateChangeCompletion]);
  -[PDCloudStoreContainer _queue_processResultWithError:nextExpectedState:operationGroupNameSuffix:retryCount:shouldRetry:completion:]( self,  "_queue_processResultWithError:nextExpectedState:operationGroupNameSuffix:retryCount:shouldRetry:completion:",  v6,  a3,  v7,  v8,  0LL,  v9);
}

- (void)passOnHandlingStateChange
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[PDPassCloudStoreContainer stateConfiguration](self, "stateConfiguration"));
  -[PDPassCloudStoreContainer eraseStateConfiguration](self, "eraseStateConfiguration");
  id v4 = [v3 currentState];
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 operationGroupNameSuffix]);
  id v6 = [v3 retryCount];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v3 stateChangeCompletion]);
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___PDPassCloudStoreContainer;
  -[PDCloudStoreContainer _queue_setContainerState:operationGroupNameSuffix:retryCount:completion:]( &v8,  "_queue_setContainerState:operationGroupNameSuffix:retryCount:completion:",  v4,  v5,  v6,  v7);
}

- (void)checkAccountState
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_1001CCA14;
  v2[3] = &unk_10063DB10;
  v2[4] = self;
  -[PDCloudStoreContainer _queue_cloudStoreAccountInformationWithCompletion:]( self,  "_queue_cloudStoreAccountInformationWithCompletion:",  v2);
}

- (void)onWorkQueue:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer workQueue](self, "workQueue"));
  dispatch_async(v5, v4);
}

- (void)processFetchedCloudStoreDataWithModifiedRecordsByDatabaseIdentifier:(id)a3 deletedRecordsByDatabaseIdentifier:(id)a4 carriedOverRecordsByDatabaseIdentifier:(id)a5 conflictingRecordsByDatabaseIdentifier:(id)a6 request:(id)a7 completion:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v35 = a5;
  id v34 = a6;
  id v33 = a7;
  id v32 = a8;
  uint64_t Object = PKLogFacilityTypeGetObject(9LL);
  v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"Private"]);
    id v18 = [v17 count];
    v19 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:@"Private"]);
    *(_DWORD *)buf = 134218240;
    id v53 = v18;
    __int16 v54 = 2048;
    id v55 = [v19 count];
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "[PDPassCloudStoreContainer] received a batch of updates: %lu and deltes: %lu",  buf,  0x16u);
  }

  v36 = v14;

  v20 = objc_alloc_init(&OBJC_CLASS___PKCloudRecordArray);
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue([v13 allKeys]);
  id v40 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
  if (v40)
  {
    uint64_t v38 = *(void *)v47;
    id v39 = v13;
    do
    {
      uint64_t v21 = 0LL;
      do
      {
        if (*(void *)v47 != v38) {
          objc_enumerationMutation(obj);
        }
        uint64_t v41 = v21;
        uint64_t v22 = *(void *)(*((void *)&v46 + 1) + 8 * v21);
        __int128 v42 = 0u;
        __int128 v43 = 0u;
        __int128 v44 = 0u;
        __int128 v45 = 0u;
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", v22, v32, v33, v34, v35, v36));
        id v24 = [v23 countByEnumeratingWithState:&v42 objects:v50 count:16];
        if (v24)
        {
          id v25 = v24;
          uint64_t v26 = *(void *)v43;
          do
          {
            for (i = 0LL; i != v25; i = (char *)i + 1)
            {
              if (*(void *)v43 != v26) {
                objc_enumerationMutation(v23);
              }
              v28 = *(void **)(*((void *)&v42 + 1) + 8LL * (void)i);
              if (objc_msgSend(v28, "pk_isRemoteAsset"))
              {
                id v29 = objc_alloc(&OBJC_CLASS___PKCloudRecordAssetURL);
                v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v28));
                id v31 = [v29 initWithRecords:v30];

                -[PKCloudRecordArray addCloudRecord:forContainerDatabaseIdentifier:]( v20,  "addCloudRecord:forContainerDatabaseIdentifier:",  v31,  v22);
              }
            }

            id v25 = [v23 countByEnumeratingWithState:&v42 objects:v50 count:16];
          }

          while (v25);
        }

        uint64_t v21 = v41 + 1;
        id v13 = v39;
      }

      while ((id)(v41 + 1) != v40);
      id v40 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
    }

    while (v40);
  }

  if (v32) {
    (*((void (**)(id, PKCloudRecordArray *, void, void))v32 + 2))(v32, v20, 0LL, 0LL);
  }
}

- (id)recordTypesForCloudStoreItemType:(unint64_t)a3
{
  if (a3 == 4)
  {
    uint64_t v5 = PKCloudRemoteAssetRecordType;
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v5, 1LL));
  }

  else
  {
    id v3 = 0LL;
  }

  return v3;
}

- (unint64_t)cloudStoreItemTypeForRecordType:(id)a3
{
  id v3 = a3;
  id v4 = (void *)PKCloudRemoteAssetRecordType;
  id v5 = v3;
  id v6 = v4;
  if (v6 == v5)
  {
  }

  else
  {
    uint64_t v7 = v6;
    if (!v5 || !v6)
    {

LABEL_9:
      unint64_t v9 = 0LL;
      goto LABEL_10;
    }

    unsigned int v8 = [v5 isEqualToString:v6];

    if (!v8) {
      goto LABEL_9;
    }
  }

  unint64_t v9 = 4LL;
LABEL_10:

  return v9;
}

- (id)identifierFromRecord:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 recordID]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 recordName]);

  return v4;
}

- (id)recordTypeFromRecordName:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___PDPassCloudStoreContainer;
  id v3 = -[PDCloudStoreContainer recordTypeFromRecordName:](&v9, "recordTypeFromRecordName:", a3);
  uint64_t v4 = objc_claimAutoreleasedReturnValue(v3);
  id v5 = (void *)v4;
  id v6 = (void *)PKCloudRemoteAssetRecordType;
  if (v4) {
    id v6 = (void *)v4;
  }
  id v7 = v6;

  return v7;
}

- (id)allPossibleZoneNamesForContainerDatabase:(id)a3
{
  if ([a3 scope] == (id)2) {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", PKCloudStoreRemoteAssestsZoneName));
  }
  else {
    id v3 = 0LL;
  }
  return v3;
}

- (id)allPossibleZoneSubscriptionsForContainerDatabase:(id)a3
{
  id v5 = a3;
  id v6 = [v5 scope];
  if (v6 == (id)1 || v6 == (id)3)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](&OBJC_CLASS___NSSet, "set"));
  }

  else if (v6 == (id)2)
  {
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v5 zoneForZoneName:PKCloudStoreRemoteAssestsZoneName]);
    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue( -[PDPassCloudStoreContainer subscriptionForZone:inContainerDatabase:]( self,  "subscriptionForZone:inContainerDatabase:",  v8,  v5));

    if (v9) {
      uint64_t v10 = objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v9));
    }
    else {
      uint64_t v10 = objc_claimAutoreleasedReturnValue(+[NSSet set](&OBJC_CLASS___NSSet, "set"));
    }
    id v3 = (void *)v10;
  }

  return v3;
}

- (id)possibleDatabaseSubscriptionForContainerDatabase:(id)a3
{
  return 0LL;
}

- (id)subscriptionForZone:(id)a3 inContainerDatabase:(id)a4
{
  id v5 = a3;
  if ([a4 scope] != (id)2) {
    goto LABEL_6;
  }
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 zoneID]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 zoneName]);
  unsigned int v8 = (void *)PKCloudStoreRemoteAssestsZoneName;
  id v9 = v7;
  id v10 = v8;
  if (v9 == v10)
  {

    goto LABEL_8;
  }

  id v11 = v10;
  if (!v9 || !v10)
  {

    id v13 = 0LL;
    goto LABEL_10;
  }

  unsigned __int8 v12 = [v9 isEqualToString:v10];

  if ((v12 & 1) != 0)
  {
LABEL_8:
    id v14 = objc_alloc(&OBJC_CLASS___CKRecordZoneSubscription);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 zoneID]);
    id v13 = -[CKRecordZoneSubscription initWithZoneID:subscriptionID:]( v14,  "initWithZoneID:subscriptionID:",  v6,  PKCloudStoreRemoteAssetZoneSubscriptionID);
LABEL_10:

    goto LABEL_11;
  }

- (id)zoneIDForSubscription:(id)a3 inContainerDatabase:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 scope] != (id)2) {
    goto LABEL_6;
  }
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 subscriptionID]);
  unsigned int v8 = (void *)PKCloudStoreRemoteAssetZoneSubscriptionID;
  id v9 = v7;
  id v10 = v8;
  if (v9 == v10)
  {

    goto LABEL_8;
  }

  id v11 = v10;
  if (!v9 || !v10)
  {

    id v13 = 0LL;
    goto LABEL_10;
  }

  unsigned int v12 = [v9 isEqualToString:v10];

  if (v12)
  {
LABEL_8:
    id v9 = (id)objc_claimAutoreleasedReturnValue([v6 zoneForZoneName:PKCloudStoreRemoteAssestsZoneName]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v9 zoneID]);
LABEL_10:

    goto LABEL_11;
  }

- (id)cloudStoreZonesForItem:(id)a3 action:(unint64_t)a4 inContainerDatabase:(id)a5
{
  id v8 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[PDPassCloudStoreContainer cloudStoreZonesForItemType:configuration:action:inContainerDatabase:]( self,  "cloudStoreZonesForItemType:configuration:action:inContainerDatabase:",  [a3 itemType],  0,  a4,  v8));

  return v9;
}

- (id)cloudStoreZonesForItemType:(unint64_t)a3 configuration:(id)a4 action:(unint64_t)a5 inContainerDatabase:(id)a6
{
  if (a3 == 4)
  {
    id v7 = a6;
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer containerManager](self, "containerManager"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue( [v8 cloudStoreZoneForZoneName:PKCloudStoreRemoteAssestsZoneName inContainerDatabase:v7]);

    if (v9) {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v9));
    }
    else {
      id v10 = 0LL;
    }
  }

  else
  {
    id v10 = 0LL;
  }

  return v10;
}

- (PDCloudStoreStateConfiguration)stateConfiguration
{
  return self->_stateConfiguration;
}

- (void)setStateConfiguration:(id)a3
{
}

- (BOOL)canInitializeContainer
{
  return self->_canInitializeContainer;
}

- (void)setCanInitializeContainer:(BOOL)a3
{
  self->_canInitializeContainer = a3;
}

- (void).cxx_destruct
{
}

@end