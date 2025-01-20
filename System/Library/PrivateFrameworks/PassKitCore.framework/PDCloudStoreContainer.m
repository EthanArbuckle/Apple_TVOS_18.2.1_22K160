@interface PDCloudStoreContainer
- (BOOL)_queue_canInitializeContainer;
- (BOOL)_queue_canInvalidateContainer;
- (BOOL)_queue_ensureContainerState:(unint64_t)a3;
- (BOOL)accountChangedNotificationReceived;
- (BOOL)canCoalesceRequest:(id)a3 withNewRequest:(id)a4;
- (BOOL)cloudContainerSetupInProgress;
- (BOOL)isCloudStoreSetupAssistantComplete;
- (BOOL)isSetup;
- (BOOL)shouldContinueWithRequest:(id)a3;
- (BOOL)shouldForwardErrorsToRequestCompletionHandlers;
- (BOOL)supportsContainerChangeEventReports;
- (NSError)operationError;
- (NSString)description;
- (OS_dispatch_queue)workQueue;
- (PDCloudStoreContainer)initWithConfiguration:(id)a3;
- (PDCloudStoreContainer)initWithDataSource:(id)a3 notificationStreamManager:(id)a4;
- (PDCloudStoreContainerDelegate)delegate;
- (PDCloudStoreContainerManager)containerManager;
- (PDCloudStoreDataSource)dataSource;
- (double)_queue_initializationTimeout;
- (id)_cannotPerformActionErrorWithFailureReason:(id)a3;
- (id)errorWithCode:(int64_t)a3 description:(id)a4;
- (id)filterCloudStoreZones:(id)a3 action:(unint64_t)a4 inContainerDatabase:(id)a5;
- (id)identifierFromRecord:(id)a3;
- (id)recordTypeFromRecordName:(id)a3;
- (id)recordTypesForCloudStoreItemType:(unint64_t)a3;
- (id)reportContainerChangeEvent:(id)a3;
- (id)reportContainerChangeIntervalBeginEventWithType:(unint64_t)a3 stateName:(id)a4 objectNames:(id)a5 changeToken:(id)a6 operationGroupName:(id)a7 operationGroupNameSuffix:(id)a8;
- (id)reportContainerChangeIntervalBeginEventWithType:(unint64_t)a3 stateName:(id)a4 objectNames:(id)a5 operationGroupName:(id)a6 operationGroupNameSuffix:(id)a7;
- (id)setupAssistantNotCompleteError;
- (unint64_t)_setupAssistantState;
- (unint64_t)itemTypeFromRecord:(id)a3;
- (unint64_t)nextExpectedState;
- (void)_cloudStoreContainerCommonInit;
- (void)_deleteAllSubscriptionsWithOperationGroupNameSuffix:(id)a3 completion:(id)a4;
- (void)_deleteAllZonesWithOperationGroupNameSuffix:(id)a3 completion:(id)a4;
- (void)_deleteSubscriptions:(id)a3 operationGroupNameSuffix:(id)a4 completion:(id)a5;
- (void)_deleteZones:(id)a3 operationGroupNameSuffix:(id)a4 completion:(id)a5;
- (void)_deleteZonesAndSubscriptionsWithResetRequest:(id)a3 operationGroupNameSuffix:(id)a4 completion:(id)a5;
- (void)_executeNextResetRequestIfPossible;
- (void)_fetchAllSubscriptionsIfNeccessaryWithOperationGroupNameSuffix:(id)a3 completion:(id)a4;
- (void)_fetchAndSaveRecordZonesWithContainerDatabaseIdentifiers:(id)a3 operationGroupNameSuffix:(id)a4 completion:(id)a5;
- (void)_fetchParticipantWithRecipientHandle:(id)a3 cloudStoreZone:(id)a4 operationGroupName:(id)a5 operationGroupNameSuffix:(id)a6 qualityOfService:(int64_t)a7 completion:(id)a8;
- (void)_fetchRecordZonesIfNeccessaryWithOperationGroupNameSuffix:(id)a3 completion:(id)a4;
- (void)_fetchRecordsWithQuery:(id)a3 cursor:(id)a4 batchLimit:(int64_t)a5 operationGroupName:(id)a6 operationGroupNameSuffix:(id)a7 qualityOfService:(int64_t)a8 zone:(id)a9 containerDatabase:(id)a10 batchHandler:(id)a11 completion:(id)a12;
- (void)_forceFetchRecordZonesForContainerDatabase:(id)a3 operationGroupNameSuffix:(id)a4 completion:(id)a5;
- (void)_keychainSyncFinishedFired;
- (void)_markEndCloudStoreDatabaseSetupWithSuccess:(BOOL)a3 error:(id)a4;
- (void)_queue_addOperation:(id)a3 forDatabase:(id)a4;
- (void)_queue_aliasesForRecipientHandle:(id)a3 zoneName:(id)a4 completion:(id)a5;
- (void)_queue_attachToContainer;
- (void)_queue_cancelAllOperations;
- (void)_queue_cancelCloudStoreInitializationTimer;
- (void)_queue_cancelOperationsForDatabse:(id)a3 underlyingError:(id)a4;
- (void)_queue_cloudStoreAccountInformationWithCompletion:(id)a3;
- (void)_queue_cloudStoreInitializationTimerFired;
- (void)_queue_cloudStoreZoneInvitationDataForInvitation:(id)a3 toRecipient:(id)a4 completion:(id)a5;
- (void)_queue_createSubscriptionsByDatabaseIdentifier:(id)a3 operationGroupNameSuffix:(id)a4 completion:(id)a5;
- (void)_queue_createZoneAndSubscriptionsByDatabaseIdentifier:(id)a3 groupSuffix:(id)a4 completion:(id)a5;
- (void)_queue_createZonesByDatabaseIdentifier:(id)a3 shouldFetchData:(BOOL)a4 operationGroupNameSuffix:(id)a5 completion:(id)a6;
- (void)_queue_detachFromContainerWithState:(unint64_t)a3;
- (void)_queue_executeNextFecthRequestIfPossible;
- (void)_queue_fetchAllRecordsUsingConfiguration:(id)a3 operationGroupName:(id)a4 operationGroupNameSuffix:(id)a5 qualityOfService:(int64_t)a6 batchHandler:(id)a7 completion:(id)a8;
- (void)_queue_fetchInitialRecordsUsingConfiguration:(id)a3 operationGroupName:(id)a4 operationGroupNameSuffix:(id)a5 qualityOfService:(int64_t)a6 batchHandler:(id)a7 completion:(id)a8;
- (void)_queue_lockShareCreationForRecipientHandle:(id)a3 cloudStoreZone:(id)a4 operationGroupName:(id)a5 operationGroupNameSuffix:(id)a6 qualityOfService:(int64_t)a7 completion:(id)a8;
- (void)_queue_processOperationError:(id)a3 forZoneID:(id)a4 containerDatabaseIdentifier:(id)a5 operationGroupName:(id)a6 operationGroupNameSuffix:(id)a7 completion:(id)a8;
- (void)_queue_processResultWithError:(id)a3 nextExpectedState:(unint64_t)a4 operationGroupNameSuffix:(id)a5 retryCount:(unint64_t)a6 shouldRetry:(BOOL)a7 completion:(id)a8;
- (void)_queue_retryContainerStateWithError:(id)a3 operationGroupNameSuffix:(id)a4 retryCount:(unint64_t)a5 completion:(id)a6;
- (void)_queue_setContainerState:(unint64_t)a3 operationGroupNameSuffix:(id)a4 retryCount:(unint64_t)a5 completion:(id)a6;
- (void)_queue_startCloudStoreInitializationTimer;
- (void)_recordZonesWithOperationGroupNameSuffix:(id)a3 containerDatabaseIdentifiers:(id)a4 completion:(id)a5;
- (void)_setContainerState:(unint64_t)a3 operationGroupNameSuffix:(id)a4 retryCount:(unint64_t)a5 completion:(id)a6;
- (void)_setupManagerWithConfiguration:(id)a3;
- (void)_shareMetadataWithInvitationTokensByShareURL:(id)a3 operationGroupName:(id)a4 operationGroupNameSuffix:(id)a5 qualityOfService:(int64_t)a6 completion:(id)a7;
- (void)_subscriptionOperationWithSubscriptionsToSaveByDatabaseIdentifier:(id)a3 subscriptionIDsToDeleteByDatabase:(id)a4 operationGroupNameSuffix:(id)a5 completion:(id)a6;
- (void)_updateFetchNewestChangesFirstFlagForConfiguration:(id)a3 request:(id)a4;
- (void)_updateSetupAssistantStateFrom:(unint64_t)a3 toState:(unint64_t)a4;
- (void)_updateSetupAssistantStateIfNecessary;
- (void)_updateShare:(id)a3 cloudStoreZone:(id)a4 operationGroupName:(id)a5 operationGroupNameSuffix:(id)a6 qualityOfService:(int64_t)a7 completion:(id)a8;
- (void)_zoneOperationWithZonesToSaveByDatabaseIdentifier:(id)a3 recordZoneIDsToDeleteByDatabaseIdentifier:(id)a4 operationGroupNameSuffix:(id)a5 completion:(id)a6;
- (void)_zoneWideShareForCloudStoreZone:(id)a3 createIfNotExists:(BOOL)a4 operationGroupName:(id)a5 operationGroupNameSuffix:(id)a6 qualityOfService:(int64_t)a7 completion:(id)a8;
- (void)acceptShareInvitation:(id)a3 operationGroupName:(id)a4 operationGroupNameSuffix:(id)a5 qualityOfService:(int64_t)a6 completion:(id)a7;
- (void)allItemsOfItemType:(unint64_t)a3 storeLocally:(BOOL)a4 completion:(id)a5;
- (void)applePayContainerItemsFromDate:(id)a3 toDate:(id)a4 completion:(id)a5;
- (void)canInitializeContainerWithCompletion:(id)a3;
- (void)cloudStoreAccountChanged:(id)a3;
- (void)cloudStoreAccountInformationWithCompletion:(id)a3;
- (void)cloudStoreRecordArrayWithConfiguration:(id)a3 completion:(id)a4;
- (void)cloudStoreZoneInvitationDataForInvitation:(id)a3 toRecipient:(id)a4 completion:(id)a5;
- (void)createShareInvitationForRecipientHandle:(id)a3 zoneName:(id)a4 permission:(int64_t)a5 operationGroupName:(id)a6 operationGroupNameSuffix:(id)a7 qualityOfService:(int64_t)a8 completion:(id)a9;
- (void)createZone:(id)a3 completion:(id)a4;
- (void)declineInvitationForRecipientHandle:(id)a3 zoneName:(id)a4 operationGroupName:(id)a5 operationGroupNameSuffix:(id)a6 qualityOfService:(int64_t)a7 completion:(id)a8;
- (void)deleteZone:(id)a3 completion:(id)a4;
- (void)didUpdateSetupAssistantStateFrom:(unint64_t)a3 toState:(unint64_t)a4;
- (void)ensureZoneShareIntegrity;
- (void)executeRecordsRequest:(id)a3 completion:(id)a4;
- (void)executeResetRequest:(id)a3 completion:(id)a4;
- (void)fetchItemsWithQueryConfigurations:(id)a3 returnRecords:(BOOL)a4 storeRecords:(BOOL)a5 groupName:(id)a6 groupSuffix:(id)a7 completion:(id)a8;
- (void)fetchRecordsInAcceptedZoneShare:(id)a3 databaseIdentifier:(id)a4 operationGroupName:(id)a5 operationGroupNameSuffix:(id)a6 qualityOfService:(int64_t)a7 completion:(id)a8;
- (void)fetchRecordsWithQuery:(id)a3 batchLimit:(int64_t)a4 operationGroupName:(id)a5 operationGroupNameSuffix:(id)a6 qualityOfService:(int64_t)a7 zone:(id)a8 containerDatabase:(id)a9 batchHandler:(id)a10 completion:(id)a11;
- (void)fetchRecordsWithRecordIDsByDatabaseIdentifier:(id)a3 operationGroupName:(id)a4 operationGroupNameSuffix:(id)a5 qualityOfService:(int64_t)a6 completion:(id)a7;
- (void)initialCloudDatabaseSetupWithOperationGroupNameSuffix:(id)a3 completion:(id)a4;
- (void)invalidateCloudStoreIfPossibleWithOperationGroupNameSuffix:(id)a3 clearCache:(BOOL)a4;
- (void)invalidateCloudStoreWithOperationGroupNameSuffix:(id)a3 clearCache:(BOOL)a4 completion:(id)a5;
- (void)invalidateCloudStoreWithOperationGroupNameSuffix:(id)a3 clearCache:(BOOL)a4 resultOfZoneRecreation:(BOOL)a5 completion:(id)a6;
- (void)invalidateCloudStoreWithOperationGroupNameSuffix:(id)a3 clearCache:(BOOL)a4 resultOfZoneRecreation:(BOOL)a5 zoneNames:(id)a6 completion:(id)a7;
- (void)itemOfItemType:(unint64_t)a3 recordName:(id)a4 qualityOfService:(int64_t)a5 completion:(id)a6;
- (void)itemOfItemTypeFromAllZones:(unint64_t)a3 recordName:(id)a4 qualityOfService:(int64_t)a5 completion:(id)a6;
- (void)modifyRecordsOperationWithRecordsToSaveByDatabaseIdentifier:(id)a3 recordIDsToDeleteByDatabaseIdentifier:(id)a4 recordModificationOperationConfiguration:(id)a5 emitErrorIfConflictDetected:(BOOL)a6 isModifyingShare:(BOOL)a7 operationGroupName:(id)a8 operationGroupNameSuffix:(id)a9 qualityOfService:(int64_t)a10 completion:(id)a11;
- (void)processFetchedCloudStoreDataWithModifiedRecordsByDatabaseIdentifier:(id)a3 deletedRecordsByDatabaseIdentifier:(id)a4 carriedOverRecordsByDatabaseIdentifier:(id)a5 conflictingRecordsByDatabaseIdentifier:(id)a6 request:(id)a7 completion:(id)a8;
- (void)removeAllItems:(unint64_t)a3 inZoneName:(id)a4 storeLocally:(BOOL)a5 completion:(id)a6;
- (void)removeItems:(id)a3 groupName:(id)a4 groupNameSuffix:(id)a5 qualityOfService:(int64_t)a6 completion:(id)a7;
- (void)removeRecordWithRecordName:(id)a3 zoneName:(id)a4 groupName:(id)a5 groupNameSuffix:(id)a6 qualityOfService:(int64_t)a7 completion:(id)a8;
- (void)removedFromCloudStoreZoneInvitation:(id)a3 fromHandle:(id)a4;
- (void)reportContainerChangeIntervalEndEventWithBeginUniqueIdentifier:(id)a3 error:(id)a4;
- (void)reportContainerChangeSignpostEventType:(unint64_t)a3 stateName:(id)a4 objectNames:(id)a5 changeToken:(id)a6 error:(id)a7 operationGroupName:(id)a8 operationGroupNameSuffix:(id)a9;
- (void)resetContainerWithAdditionalZoneIDsByDatabaseIdentifiers:(id)a3 includedCachedZoneForDatabaseIdentifiers:(id)a4 completion:(id)a5;
- (void)resetContainerWithZoneNames:(id)a3 completion:(id)a4;
- (void)setAccountChangedNotificationReceived:(BOOL)a3;
- (void)setCloudContainerSetupInProgress:(BOOL)a3;
- (void)setContainerManager:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIsSetup:(BOOL)a3;
- (void)setNextExpectedState:(unint64_t)a3;
- (void)setOperationError:(id)a3;
- (void)shareForZoneName:(id)a3 operationGroupName:(id)a4 operationGroupNameSuffix:(id)a5 qualityOfService:(int64_t)a6 completion:(id)a7;
- (void)updateCloudStoreWithLocalItemsWithConfigurations:(id)a3 groupName:(id)a4 groupNameSuffix:(id)a5 qualityOfService:(int64_t)a6 completion:(id)a7;
@end

@implementation PDCloudStoreContainer

- (void)_setupManagerWithConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(&OBJC_CLASS___CKContainerID);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 containerIdentifier]);
  id v15 = objc_msgSend(v5, "initWithContainerIdentifier:environment:", v6, objc_msgSend(v4, "environment"));

  id v7 = objc_alloc_init(&OBJC_CLASS___CKContainerOptions);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v4 applicationBundleIdentifier]);
  [v7 setApplicationBundleIdentifierOverride:v8];

  v9 = -[CKContainer initWithContainerID:options:]( objc_alloc(&OBJC_CLASS___CKContainer),  "initWithContainerID:options:",  v15,  v7);
  v10 = objc_alloc(&OBJC_CLASS___PDCloudStoreContainerManager);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v4 validScopes]);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v4 dataSource]);
  v13 = (void *)objc_claimAutoreleasedReturnValue([v4 containerDatabaseDataSource]);

  v14 = -[PDCloudStoreContainerManager initWithContainer:validScopes:cacheDataSource:databaseContainerDataSource:]( v10,  "initWithContainer:validScopes:cacheDataSource:databaseContainerDataSource:",  v9,  v11,  v12,  v13);
  -[PDCloudStoreContainer setContainerManager:](self, "setContainerManager:", v14);
}

- (PDCloudStoreContainer)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___PDCloudStoreContainer;
  id v5 = -[PDCloudStoreContainer init](&v8, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 dataSource]);
    objc_storeWeak((id *)&v5->_dataSource, v6);

    -[PDCloudStoreContainer _cloudStoreContainerCommonInit](v5, "_cloudStoreContainerCommonInit");
    -[PDCloudStoreContainer _setupManagerWithConfiguration:](v5, "_setupManagerWithConfiguration:", v4);
  }

  return v5;
}

- (PDCloudStoreContainer)initWithDataSource:(id)a3 notificationStreamManager:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___PDCloudStoreContainer;
  objc_super v8 = -[PDCloudStoreContainer init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_dataSource, v6);
    objc_storeStrong((id *)&v9->_notificationStreamManager, a4);
    -[PDCloudStoreContainer _cloudStoreContainerCommonInit](v9, "_cloudStoreContainerCommonInit");
  }

  return v9;
}

- (void)_cloudStoreContainerCommonInit
{
  dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  attr = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
  id v4 = (OS_dispatch_queue *)dispatch_queue_create("PDCloudStoreContainer", attr);
  workQueue = self->_workQueue;
  self->_workQueue = v4;

  id v6 = (OS_dispatch_queue *)dispatch_queue_create("PDCloudStoreContainer_BackgroundQueue", attr);
  backgroundQueue = self->_backgroundQueue;
  self->_backgroundQueue = v6;

  objc_super v8 = (OS_dispatch_group *)dispatch_group_create();
  batchUpdateGroup = self->_batchUpdateGroup;
  self->_batchUpdateGroup = v8;

  v10 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  initializationCompletionHandlers = self->_initializationCompletionHandlers;
  self->_initializationCompletionHandlers = v10;

  v12 = objc_alloc_init(&OBJC_CLASS___NSMutableOrderedSet);
  fetchRequests = self->_fetchRequests;
  self->_fetchRequests = v12;

  v14 = objc_alloc_init(&OBJC_CLASS___NSMutableOrderedSet);
  resetRequests = self->_resetRequests;
  self->_resetRequests = v14;

  self->_lock._os_unfair_lock_opaque = 0;
  if (self->_notificationStreamManager)
  {
    v16 = -[PDSetupAssistantCompleteMonitor initWithNotificationStreamManager:]( objc_alloc(&OBJC_CLASS___PDSetupAssistantCompleteMonitor),  "initWithNotificationStreamManager:",  self->_notificationStreamManager);
    setupAssistantMonitor = self->_setupAssistantMonitor;
    self->_setupAssistantMonitor = v16;
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v18 addObserver:self selector:"cloudStoreAccountChanged:" name:CKAccountChangedNotification object:0];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained cloudStoreContainer:self didChangeContainerState:1];
}

- (void)initialCloudDatabaseSetupWithOperationGroupNameSuffix:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[PDCloudStoreContainer isSetup](self, "isSetup"))
  {
    uint64_t Object = PKLogFacilityTypeGetObject(9LL);
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v17 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "The cloud store %@ is already setup.",  buf,  0xCu);
    }

    if (v7)
    {
      os_unfair_lock_lock(&self->_lock);
      initializationCompletionHandlers = self->_initializationCompletionHandlers;
      id v11 = objc_retainBlock(v7);
      -[NSMutableSet addObject:](initializationCompletionHandlers, "addObject:", v11);

      os_unfair_lock_unlock(&self->_lock);
    }

    -[PDCloudStoreContainer _markEndCloudStoreDatabaseSetupWithSuccess:error:]( self,  "_markEndCloudStoreDatabaseSetupWithSuccess:error:",  1LL,  0LL);
  }

  else
  {
    workQueue = self->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10017F63C;
    block[3] = &unk_100639AF0;
    block[4] = self;
    id v14 = v6;
    id v15 = v7;
    dispatch_async((dispatch_queue_t)workQueue, block);
  }
}

- (BOOL)_queue_ensureContainerState:(unint64_t)a3
{
  unint64_t nextExpectedState = self->_nextExpectedState;
  if (nextExpectedState != a3)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(9LL);
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v8 = PDCloudStoreContainerStateToString(a3);
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      v10 = PDCloudStoreContainerStateToString(self->_nextExpectedState);
      id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      int v13 = 138543618;
      id v14 = v9;
      __int16 v15 = 2114;
      v16 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "PDCloudStoreContainer: Error: Invalid state detected. (Expected: %{public}@, Actual: %{public}@)",  (uint8_t *)&v13,  0x16u);
    }
  }

  return nextExpectedState == a3;
}

- (BOOL)isSetup
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_isSetup;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setIsSetup:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_isSetup = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)_queue_canInitializeContainer
{
  return 1;
}

- (void)canInitializeContainerWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    workQueue = self->_workQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_100180204;
    v7[3] = &unk_1006396B0;
    v7[4] = self;
    id v8 = v4;
    dispatch_async((dispatch_queue_t)workQueue, v7);
  }
}

- (BOOL)_queue_canInvalidateContainer
{
  return 0;
}

- (double)_queue_initializationTimeout
{
  return 120.0;
}

- (id)recordTypesForCloudStoreItemType:(unint64_t)a3
{
  if (a3 == 6)
  {
    CKRecordType v5 = CKRecordTypeShare;
    dispatch_queue_attr_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v5, 1LL));
  }

  else
  {
    dispatch_queue_attr_t v3 = 0LL;
  }

  return v3;
}

- (unint64_t)itemTypeFromRecord:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 recordType]);
  unint64_t v5 = 0LL;
  while (1)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue( -[PDCloudStoreContainer recordTypesForCloudStoreItemType:]( self,  "recordTypesForCloudStoreItemType:",  v5));
    unsigned __int8 v7 = [v6 containsObject:v4];

    if ((v7 & 1) != 0) {
      break;
    }
    if (++v5 == 11)
    {
      unint64_t v5 = 0LL;
      break;
    }
  }

  return v5;
}

- (id)identifierFromRecord:(id)a3
{
  dispatch_queue_attr_t v3 = (void *)objc_claimAutoreleasedReturnValue([a3 recordID]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 recordName]);

  return v4;
}

- (id)recordTypeFromRecordName:(id)a3
{
  dispatch_queue_attr_t v3 = (NSString *)a3;
  id v4 = CKRecordNameZoneWideShare;
  unint64_t v5 = v4;
  if (v4 == v3)
  {
  }

  else
  {
    if (!v3 || !v4)
    {

LABEL_9:
      unsigned __int8 v7 = 0LL;
      goto LABEL_10;
    }

    unsigned int v6 = -[NSString isEqualToString:](v3, "isEqualToString:", v4);

    if (!v6) {
      goto LABEL_9;
    }
  }

  unsigned __int8 v7 = v5;
LABEL_10:

  return v7;
}

- (id)filterCloudStoreZones:(id)a3 action:(unint64_t)a4 inContainerDatabase:(id)a5
{
  return a3;
}

- (void)invalidateCloudStoreIfPossibleWithOperationGroupNameSuffix:(id)a3 clearCache:(BOOL)a4
{
}

- (void)invalidateCloudStoreWithOperationGroupNameSuffix:(id)a3 clearCache:(BOOL)a4 completion:(id)a5
{
}

- (void)invalidateCloudStoreWithOperationGroupNameSuffix:(id)a3 clearCache:(BOOL)a4 resultOfZoneRecreation:(BOOL)a5 completion:(id)a6
{
}

- (void)invalidateCloudStoreWithOperationGroupNameSuffix:(id)a3 clearCache:(BOOL)a4 resultOfZoneRecreation:(BOOL)a5 zoneNames:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100180538;
  block[3] = &unk_100647D68;
  BOOL v24 = a4;
  BOOL v25 = a5;
  id v20 = v12;
  id v21 = v13;
  v22 = self;
  id v23 = v14;
  id v16 = v14;
  id v17 = v13;
  id v18 = v12;
  dispatch_async((dispatch_queue_t)workQueue, block);
}

- (void)_queue_attachToContainer
{
  operationError = self->_operationError;
  self->_operationError = 0LL;

  self->_shouldCancelAllTasks = 0;
  -[PDCloudStoreContainerManager createContainerCacheIfNecessary]( self->_containerManager,  "createContainerCacheIfNecessary");
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained cloudStoreContainer:self didChangeContainerState:1];
}

- (void)_queue_detachFromContainerWithState:(unint64_t)a3
{
  self->_shouldCancelAllTasks = 0;
  self->_shouldInvalidateCloudStore = 0;
  *(_WORD *)&self->_accountChangedNotificationReceived = 0;
  operationError = self->_operationError;
  self->_operationError = 0LL;

  lastInvalidationDate = self->_lastInvalidationDate;
  self->_lastInvalidationDate = 0LL;

  -[PDCloudStoreContainer _queue_cancelCloudStoreInitializationTimer]( self,  "_queue_cancelCloudStoreInitializationTimer");
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained cloudStoreContainer:self didChangeContainerState:a3];
}

- (void)cloudStoreAccountInformationWithCompletion:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100180F38;
  v7[3] = &unk_10063AC90;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)workQueue, v7);
}

- (void)_queue_cloudStoreAccountInformationWithCompletion:(id)a3
{
  id v4 = a3;
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainerManager container](self->_containerManager, "container"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100180FDC;
  v7[3] = &unk_10063DCE8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 accountInfoWithCompletionHandler:v7];
}

- (void)_setContainerState:(unint64_t)a3 operationGroupNameSuffix:(id)a4 retryCount:(unint64_t)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100181268;
  block[3] = &unk_10063DA20;
  void block[4] = self;
  id v16 = v10;
  unint64_t v18 = a3;
  unint64_t v19 = a5;
  id v17 = v11;
  id v13 = v11;
  id v14 = v10;
  dispatch_async((dispatch_queue_t)workQueue, block);
}

- (void)_queue_setContainerState:(unint64_t)a3 operationGroupNameSuffix:(id)a4 retryCount:(unint64_t)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = (void (**)(id, void, NSError *))a6;
  uint64_t Object = PKLogFacilityTypeGetObject(9LL);
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = PDCloudStoreContainerStateToString(a3);
    __int16 v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    *(_DWORD *)buf = 138543874;
    id v60 = v15;
    __int16 v61 = 2114;
    id v62 = v10;
    __int16 v63 = 2048;
    unint64_t v64 = a5;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "PDCloudStoreContainer: setContainerState called with state %{public}@, operationGroupNameSuffix: %{public}@, and retry count %lu",  buf,  0x20u);
  }

  if (-[PDCloudStoreContainer _queue_ensureContainerState:](self, "_queue_ensureContainerState:", a3))
  {
    id v16 = PDCloudStoreContainerStateToUserString(a3);
    id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    -[PDCloudStoreContainer reportContainerChangeSignpostEventType:stateName:objectNames:changeToken:error:operationGroupName:operationGroupNameSuffix:]( self,  "reportContainerChangeSignpostEventType:stateName:objectNames:changeToken:error:operationGroupName:operationGroupNameSuffix:",  1LL,  v17,  0LL,  0LL,  0LL,  0LL,  v10);

    -[PDCloudStoreContainer _updateSetupAssistantStateIfNecessary](self, "_updateSetupAssistantStateIfNecessary");
    switch(a3)
    {
      case 1uLL:
        -[PDCloudStoreContainer _queue_attachToContainer](self, "_queue_attachToContainer");
        self->_unint64_t nextExpectedState = 4LL;
        -[PDCloudStoreContainer _queue_setContainerState:operationGroupNameSuffix:retryCount:completion:]( self,  "_queue_setContainerState:operationGroupNameSuffix:retryCount:completion:",  4LL,  v10,  a5,  v11);
        break;
      case 2uLL:
        operationError = self->_operationError;
        self->_operationError = 0LL;
        self->_unint64_t nextExpectedState = 1LL;

        -[PDCloudStoreContainer _queue_detachFromContainerWithState:](self, "_queue_detachFromContainerWithState:", 2LL);
        if (v11) {
          goto LABEL_14;
        }
        break;
      case 3uLL:
        self->_unint64_t nextExpectedState = 1LL;
        v22 = self->_operationError;
        -[PDCloudStoreContainer _queue_detachFromContainerWithState:](self, "_queue_detachFromContainerWithState:", 2LL);
        if (v11) {
          v11[2](v11, 0LL, v22);
        }

        break;
      case 4uLL:
        self->_unint64_t nextExpectedState = 5LL;
        -[PDCloudStoreContainer _queue_setContainerState:operationGroupNameSuffix:retryCount:completion:]( self,  "_queue_setContainerState:operationGroupNameSuffix:retryCount:completion:",  5LL,  v10,  a5,  v11);
        break;
      case 5uLL:
        self->_unint64_t nextExpectedState = 6LL;
        -[PDCloudStoreContainer _queue_setContainerState:operationGroupNameSuffix:retryCount:completion:]( self,  "_queue_setContainerState:operationGroupNameSuffix:retryCount:completion:",  6LL,  v10,  a5,  v11);
        break;
      case 6uLL:
        v55[0] = _NSConcreteStackBlock;
        v55[1] = 3221225472LL;
        v55[2] = sub_100181B10;
        v55[3] = &unk_100647D90;
        v55[4] = self;
        id v56 = v10;
        unint64_t v58 = a5;
        v57 = v11;
        -[PDCloudStoreContainer _fetchRecordZonesIfNeccessaryWithOperationGroupNameSuffix:completion:]( self,  "_fetchRecordZonesIfNeccessaryWithOperationGroupNameSuffix:completion:",  v56,  v55);

        break;
      case 7uLL:
        v51[0] = _NSConcreteStackBlock;
        v51[1] = 3221225472LL;
        v51[2] = sub_100181BE0;
        v51[3] = &unk_100647D90;
        v51[4] = self;
        id v52 = v10;
        unint64_t v54 = a5;
        v53 = v11;
        -[PDCloudStoreContainer _fetchAllSubscriptionsIfNeccessaryWithOperationGroupNameSuffix:completion:]( self,  "_fetchAllSubscriptionsIfNeccessaryWithOperationGroupNameSuffix:completion:",  v52,  v51);

        break;
      case 8uLL:
        id v23 = (void *)objc_claimAutoreleasedReturnValue( -[PDCloudStoreContainerManager zonesThatNeedToBeCreated]( self->_containerManager,  "zonesThatNeedToBeCreated"));
        id v24 = [v23 count];
        BOOL v25 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
        if (v24)
        {
          if (v25)
          {
            id v26 = [v23 count];
            v27 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainerManager containerName](self->_containerManager, "containerName"));
            *(_DWORD *)buf = 134349314;
            id v60 = v26;
            __int16 v61 = 2114;
            id v62 = v27;
            _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "There are %{public}lu zones that need to be created for container %{public}@",  buf,  0x16u);
          }

          v47[0] = _NSConcreteStackBlock;
          v47[1] = 3221225472LL;
          v47[2] = sub_100181CB0;
          v47[3] = &unk_100647DB8;
          v47[4] = self;
          id v48 = v10;
          unint64_t v50 = a5;
          v49 = v11;
          -[PDCloudStoreContainer _queue_createZonesByDatabaseIdentifier:shouldFetchData:operationGroupNameSuffix:completion:]( self,  "_queue_createZonesByDatabaseIdentifier:shouldFetchData:operationGroupNameSuffix:completion:",  v23,  0LL,  v48,  v47);
        }

        else
        {
          if (v25)
          {
            v29 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainerManager containerName](self->_containerManager, "containerName"));
            *(_DWORD *)buf = 138543362;
            id v60 = v29;
            _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "There are no zones that need to be created for container %{public}@",  buf,  0xCu);
          }

          -[PDCloudStoreContainer _queue_processResultWithError:nextExpectedState:operationGroupNameSuffix:retryCount:shouldRetry:completion:]( self,  "_queue_processResultWithError:nextExpectedState:operationGroupNameSuffix:retryCount:shouldRetry:completion:",  0LL,  9LL,  v10,  a5,  1LL,  v11);
        }

        break;
      case 9uLL:
        v28 = (void *)objc_claimAutoreleasedReturnValue( -[PDCloudStoreContainerManager subscriptionsThatNeedToBeCreated]( self->_containerManager,  "subscriptionsThatNeedToBeCreated"));
        if ([v28 count])
        {
          v43[0] = _NSConcreteStackBlock;
          v43[1] = 3221225472LL;
          v43[2] = sub_100181D80;
          v43[3] = &unk_100647DB8;
          v43[4] = self;
          id v44 = v10;
          unint64_t v46 = a5;
          v45 = v11;
          -[PDCloudStoreContainer _queue_createSubscriptionsByDatabaseIdentifier:operationGroupNameSuffix:completion:]( self,  "_queue_createSubscriptionsByDatabaseIdentifier:operationGroupNameSuffix:completion:",  v28,  v44,  v43);
        }

        else
        {
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            v30 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainerManager containerName](self->_containerManager, "containerName"));
            *(_DWORD *)buf = 138412290;
            id v60 = v30;
            _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "There are no subscriptions that need to be created for container %@",  buf,  0xCu);
          }

          -[PDCloudStoreContainer _queue_processResultWithError:nextExpectedState:operationGroupNameSuffix:retryCount:shouldRetry:completion:]( self,  "_queue_processResultWithError:nextExpectedState:operationGroupNameSuffix:retryCount:shouldRetry:completion:",  0LL,  13LL,  v10,  a5,  1LL,  v11);
        }

        break;
      case 0xAuLL:
        self->_unint64_t nextExpectedState = 1LL;
        objc_initWeak((id *)buf, self);
        v39[0] = _NSConcreteStackBlock;
        v39[1] = 3221225472LL;
        v39[2] = sub_100181E50;
        v39[3] = &unk_100647DE0;
        objc_copyWeak(v42, (id *)buf);
        id v40 = v10;
        v42[1] = (id)a5;
        v41 = v11;
        -[PDCloudStoreContainer _queue_setContainerState:operationGroupNameSuffix:retryCount:completion:]( self,  "_queue_setContainerState:operationGroupNameSuffix:retryCount:completion:",  1LL,  v40,  a5,  v39);

        objc_destroyWeak(v42);
        objc_destroyWeak((id *)buf);
        break;
      case 0xBuLL:
        v35[0] = _NSConcreteStackBlock;
        v35[1] = 3221225472LL;
        v35[2] = sub_100181EE4;
        v35[3] = &unk_100647DB8;
        v35[4] = self;
        id v36 = v10;
        unint64_t v38 = a5;
        v37 = v11;
        -[PDCloudStoreContainer _deleteAllZonesWithOperationGroupNameSuffix:completion:]( self,  "_deleteAllZonesWithOperationGroupNameSuffix:completion:",  v36,  v35);

        break;
      case 0xCuLL:
        v31[0] = _NSConcreteStackBlock;
        v31[1] = 3221225472LL;
        v31[2] = sub_100181FB4;
        v31[3] = &unk_100647DB8;
        v31[4] = self;
        id v32 = v10;
        unint64_t v34 = a5;
        v33 = v11;
        -[PDCloudStoreContainer _deleteAllSubscriptionsWithOperationGroupNameSuffix:completion:]( self,  "_deleteAllSubscriptionsWithOperationGroupNameSuffix:completion:",  v32,  v31);

        break;
      case 0xDuLL:
        self->_unint64_t nextExpectedState = 14LL;
        -[PDCloudStoreContainer _queue_setContainerState:operationGroupNameSuffix:retryCount:completion:]( self,  "_queue_setContainerState:operationGroupNameSuffix:retryCount:completion:",  14LL,  v10,  a5,  v11);
        break;
      case 0xEuLL:
        self->_unint64_t nextExpectedState = 15LL;
        -[PDCloudStoreContainer _queue_setContainerState:operationGroupNameSuffix:retryCount:completion:]( self,  "_queue_setContainerState:operationGroupNameSuffix:retryCount:completion:",  15LL,  v10,  a5,  v11);
        break;
      case 0xFuLL:
        unint64_t v19 = self->_operationError;
        self->_operationError = 0LL;

        if (v11) {
LABEL_14:
        }
          v11[2](v11, 1LL, 0LL);
        break;
      default:
        id v20 = self->_operationError;
        self->_operationError = 0LL;

        if (v11) {
          v11[2](v11, 0LL, 0LL);
        }
        break;
    }
  }

  else if (v11)
  {
    unint64_t v18 = (NSError *)objc_claimAutoreleasedReturnValue( -[PDCloudStoreContainer errorWithCode:description:]( self,  "errorWithCode:description:",  -4006LL,  @"Invalid cloud store state"));
    v11[2](v11, 0LL, v18);
  }
}

- (void)processFetchedCloudStoreDataWithModifiedRecordsByDatabaseIdentifier:(id)a3 deletedRecordsByDatabaseIdentifier:(id)a4 carriedOverRecordsByDatabaseIdentifier:(id)a5 conflictingRecordsByDatabaseIdentifier:(id)a6 request:(id)a7 completion:(id)a8
{
  if (a8) {
    (*((void (**)(id, void, void, void))a8 + 2))(a8, 0LL, 0LL, 0LL);
  }
}

- (void)_queue_processResultWithError:(id)a3 nextExpectedState:(unint64_t)a4 operationGroupNameSuffix:(id)a5 retryCount:(unint64_t)a6 shouldRetry:(BOOL)a7 completion:(id)a8
{
  BOOL v9 = a7;
  id v15 = a3;
  id v16 = a5;
  id v17 = a8;
  if (v15) {
    -[PDCloudStoreContainer reportContainerChangeSignpostEventType:stateName:objectNames:changeToken:error:operationGroupName:operationGroupNameSuffix:]( self,  "reportContainerChangeSignpostEventType:stateName:objectNames:changeToken:error:operationGroupName:operationGroupNameSuffix:",  3LL,  0LL,  0LL,  0LL,  v15,  0LL,  v16);
  }
  id v18 = [[PKCloudStoreError alloc] initWithError:v15];
  if ([v18 isUnrecoverableDecryptionError])
  {
    uint64_t Object = PKLogFacilityTypeGetObject(9LL);
    id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Received an unrecoverable error. Attempting to setup again since the error has been processed.",  buf,  2u);
    }

    self->_unint64_t nextExpectedState = 1LL;
    id v21 = self;
    unint64_t v22 = 1LL;
    goto LABEL_32;
  }

  if (![v18 isNetworkUnavailable])
  {
    if ([v18 isKeychainSyncingInProgress])
    {
      uint64_t v23 = PKLogFacilityTypeGetObject(9LL);
      id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Received keychain sync in process. Will listen for key sync notifications and try to initalize container in the future.",  buf,  2u);
      }

      BOOL v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      [v25 addObserver:self selector:"_keychainSyncFinishedFired" name:CKIdentityUpdateNotification object:0];

      id v26 = &PKAggDKeyCloudStoreFailureKeyChainSyncFailure;
    }

    else if ([v18 isInitializationTimeOutError])
    {
      uint64_t v27 = PKLogFacilityTypeGetObject(9LL);
      v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v37 = v18;
        _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "Received an initialization time out error %@",  buf,  0xCu);
      }

      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Detaching from the cloud store.", buf, 2u);
      }

      id v26 = &PKAggDKeyCloudStoreFailureInitializationTimeout;
    }

    else
    {
      if ([v18 isZoneNotFoundError])
      {
        uint64_t v29 = PKLogFacilityTypeGetObject(9LL);
        v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v37 = v18;
          _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "Received an zone not found. Trying to recreate it now. %@",  buf,  0xCu);
        }

        -[PDCloudStoreContainerManager clearCacheInContainer](self->_containerManager, "clearCacheInContainer");
        -[PDCloudStoreContainerManager createContainerCacheIfNecessary]( self->_containerManager,  "createContainerCacheIfNecessary");
        self->_unint64_t nextExpectedState = 8LL;
        id v21 = self;
        unint64_t v22 = 8LL;
        goto LABEL_32;
      }

      if (!v18)
      {
        if (!v15 || (self->_nextExpectedState & 0xFFFFFFFFFFFFFFFELL) != 8)
        {
          self->_unint64_t nextExpectedState = a4;
          id v21 = self;
          unint64_t v22 = a4;
          goto LABEL_32;
        }

        uint64_t v34 = PKLogFacilityTypeGetObject(9LL);
        v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          id v37 = v15;
          _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "Detaching cloud store because zones or subscriptions were not created %{public}@",  buf,  0xCu);
        }

LABEL_31:
        self->_unint64_t nextExpectedState = 3LL;
        objc_storeStrong((id *)&self->_operationError, a3);
        id v21 = self;
        unint64_t v22 = 3LL;
LABEL_32:
        -[PDCloudStoreContainer _queue_setContainerState:operationGroupNameSuffix:retryCount:completion:]( v21,  "_queue_setContainerState:operationGroupNameSuffix:retryCount:completion:",  v22,  v16,  a6,  v17);
        goto LABEL_33;
      }

      uint64_t v31 = PKLogFacilityTypeGetObject(9LL);
      id v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v37 = v18;
        _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "Detaching cloud store with unknown error %@",  buf,  0xCu);
      }

      unsigned int v33 = [v18 isPCSError];
      id v26 = &PKAggDKeyCloudStoreFailurePCSError;
      if (!v33) {
        id v26 = &PKAggDKeyCloudStoreFailureOtherError;
      }
    }

- (void)_updateSetupAssistantStateIfNecessary
{
  if (self->_setupAssistantMonitor)
  {
    if (!-[PDCloudStoreContainer _setupAssistantState](self, "_setupAssistantState"))
    {
      -[PDCloudStoreContainer _updateSetupAssistantStateFrom:toState:]( self,  "_updateSetupAssistantStateFrom:toState:",  0LL,  2LL);
      setupAssistantMonitor = self->_setupAssistantMonitor;
      v4[0] = _NSConcreteStackBlock;
      v4[1] = 3221225472LL;
      v4[2] = sub_1001825C0;
      v4[3] = &unk_100639300;
      v4[4] = self;
      -[PDSetupAssistantCompleteMonitor waitForSetupAssistantCompletion:]( setupAssistantMonitor,  "waitForSetupAssistantCompletion:",  v4);
    }
  }

  else
  {
    -[PDCloudStoreContainer _updateSetupAssistantStateFrom:toState:]( self,  "_updateSetupAssistantStateFrom:toState:",  0LL,  1LL);
  }

- (void)_updateSetupAssistantStateFrom:(unint64_t)a3 toState:(unint64_t)a4
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_setupAssistantState = a4;
  os_unfair_lock_unlock(p_lock);
  -[PDCloudStoreContainer didUpdateSetupAssistantStateFrom:toState:]( self,  "didUpdateSetupAssistantStateFrom:toState:",  a3,  a4);
}

- (unint64_t)_setupAssistantState
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t setupAssistantState = self->_setupAssistantState;
  os_unfair_lock_unlock(p_lock);
  return setupAssistantState;
}

- (BOOL)isCloudStoreSetupAssistantComplete
{
  unint64_t v3 = -[PDCloudStoreContainer _setupAssistantState](self, "_setupAssistantState");
  BOOL result = 1;
  switch(v3)
  {
    case 0uLL:
    case 2uLL:
      uint64_t Object = PKLogFacilityTypeGetObject(9LL);
      id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        unsigned __int8 v7 = @"unknown";
        if (v3 == 1) {
          unsigned __int8 v7 = @"notSupported";
        }
        if (v3 == 2) {
          unsigned __int8 v7 = @"waitingForCompletion";
        }
        id v8 = v7;
        int v11 = 138412546;
        id v12 = v8;
        __int16 v13 = 2114;
        id v14 = (id)objc_opt_class(self, v9);
        id v10 = v14;
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%@: PDCloudStoreContainerSetupAssistantState is not complete with state %{public}@",  (uint8_t *)&v11,  0x16u);
      }

      goto LABEL_9;
    case 1uLL:
    case 3uLL:
      return result;
    default:
LABEL_9:
      BOOL result = 0;
      break;
  }

  return result;
}

- (void)didUpdateSetupAssistantStateFrom:(unint64_t)a3 toState:(unint64_t)a4
{
  if (a4 != 1)
  {
    v28[0] = @"fromState";
    unint64_t v5 = a3 - 1;
    id v6 = @"unknown";
    unsigned __int8 v7 = @"unknown";
    if (a3 - 1 <= 2) {
      unsigned __int8 v7 = off_100649930[v5];
    }
    if (a4 == 2) {
      id v6 = @"waitingForCompletion";
    }
    if (a4 == 3) {
      id v6 = @"complete";
    }
    v29[0] = v7;
    v29[1] = v6;
    v28[1] = @"toState";
    v28[2] = @"container";
    id v8 = v6;
    id v10 = objc_msgSend((id)objc_opt_class(self, v9), "description");
    uint64_t v11 = objc_claimAutoreleasedReturnValue(v10);
    id v12 = (void *)v11;
    __int16 v13 = &stru_100662310;
    if (v11) {
      __int16 v13 = (const __CFString *)v11;
    }
    v29[2] = v13;
    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v29,  v28,  3LL));

    uint64_t Object = PKLogFacilityTypeGetObject(9LL);
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      if (v5 > 2) {
        id v18 = @"unknown";
      }
      else {
        id v18 = off_100649930[v5];
      }
      id v19 = objc_msgSend((id)objc_opt_class(self, v17), "description");
      id v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
      *(_DWORD *)buf = 138543874;
      uint64_t v23 = v18;
      __int16 v24 = 2114;
      BOOL v25 = v8;
      __int16 v26 = 2112;
      uint64_t v27 = v20;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Did update PDCloudStoreContainerSetupAssistantState from %{public}@ to %{public}@ for container %@",  buf,  0x20u);
    }

    id v21 = (void *)objc_claimAutoreleasedReturnValue([v14 description]);
    -[PDCloudStoreContainer reportContainerChangeSignpostEventType:stateName:objectNames:changeToken:error:operationGroupName:operationGroupNameSuffix:]( self,  "reportContainerChangeSignpostEventType:stateName:objectNames:changeToken:error:operationGroupName:operationGroupNameSuffix:",  54LL,  v21,  0LL,  0LL,  0LL,  0LL,  0LL);
  }

- (void)cloudStoreAccountChanged:(id)a3
{
  id v4 = a3;
  uint64_t Object = PKLogFacilityTypeGetObject(9LL);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Received CKAccountChangedNotification.",  buf,  2u);
  }

  workQueue = self->_workQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100182A60;
  v9[3] = &unk_1006392B0;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_async((dispatch_queue_t)workQueue, v9);
}

- (void)_keychainSyncFinishedFired
{
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100182B10;
  block[3] = &unk_100639300;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)workQueue, block);
}

- (void)_queue_createZoneAndSubscriptionsByDatabaseIdentifier:(id)a3 groupSuffix:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t Object = PKLogFacilityTypeGetObject(9LL);
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Received call to create zones and subcriptions: %@",  buf,  0xCu);
  }

  if ([v8 count])
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100183030;
    v13[3] = &unk_100647E58;
    v13[4] = self;
    id v14 = v8;
    id v16 = v10;
    id v15 = v9;
    -[PDCloudStoreContainer _queue_createZonesByDatabaseIdentifier:shouldFetchData:operationGroupNameSuffix:completion:]( self,  "_queue_createZonesByDatabaseIdentifier:shouldFetchData:operationGroupNameSuffix:completion:",  v14,  0LL,  v15,  v13);
  }

  else if (v10)
  {
    (*((void (**)(id, uint64_t, void))v10 + 2))(v10, 1LL, 0LL);
  }
}

- (void)updateCloudStoreWithLocalItemsWithConfigurations:(id)a3 groupName:(id)a4 groupNameSuffix:(id)a5 qualityOfService:(int64_t)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  workQueue = self->_workQueue;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_10018354C;
  v21[3] = &unk_100647EF8;
  v21[4] = self;
  id v22 = v12;
  id v25 = v15;
  int64_t v26 = a6;
  id v23 = v13;
  id v24 = v14;
  id v17 = v14;
  id v18 = v13;
  id v19 = v12;
  id v20 = v15;
  dispatch_async((dispatch_queue_t)workQueue, v21);
}

- (void)_queue_createZonesByDatabaseIdentifier:(id)a3 shouldFetchData:(BOOL)a4 operationGroupNameSuffix:(id)a5 completion:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = [v10 count];
  uint64_t Object = PKLogFacilityTypeGetObject(9LL);
  id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  if (v13)
  {
    if (v16)
    {
      id v17 = @"NO";
      if (v8) {
        id v17 = @"YES";
      }
      *(_DWORD *)buf = 138543618;
      id v23 = v10;
      __int16 v24 = 2114;
      id v25 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Creating record zones %{public}@. Should fetch data %{public}@.",  buf,  0x16u);
    }

    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_100184578;
    v18[3] = &unk_100647F20;
    v18[4] = self;
    id v19 = v10;
    BOOL v21 = v8;
    id v20 = v12;
    -[PDCloudStoreContainer _zoneOperationWithZonesToSaveByDatabaseIdentifier:recordZoneIDsToDeleteByDatabaseIdentifier:operationGroupNameSuffix:completion:]( self,  "_zoneOperationWithZonesToSaveByDatabaseIdentifier:recordZoneIDsToDeleteByDatabaseIdentifier:operationGroupNameSuffix:completion:",  v19,  0LL,  v11,  v18);
  }

  else
  {
    if (v16)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "No zones to save.", buf, 2u);
    }

    if (v12) {
      (*((void (**)(id, id, void))v12 + 2))(v12, v10, 0LL);
    }
  }
}

- (void)_queue_createSubscriptionsByDatabaseIdentifier:(id)a3 operationGroupNameSuffix:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 count];
  uint64_t Object = PKLogFacilityTypeGetObject(9LL);
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v14)
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v8;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Creating subscriptions %@", buf, 0xCu);
    }

    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100184C64;
    v15[3] = &unk_100647F48;
    v15[4] = self;
    id v16 = v10;
    -[PDCloudStoreContainer _subscriptionOperationWithSubscriptionsToSaveByDatabaseIdentifier:subscriptionIDsToDeleteByDatabase:operationGroupNameSuffix:completion:]( self,  "_subscriptionOperationWithSubscriptionsToSaveByDatabaseIdentifier:subscriptionIDsToDeleteByDatabase:operationGroup NameSuffix:completion:",  v8,  0LL,  v9,  v15);
  }

  else
  {
    if (v14)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "No subscriptions to save.", buf, 2u);
    }

    if (v10) {
      (*((void (**)(id, void, void))v10 + 2))(v10, 0LL, 0LL);
    }
  }
}

- (void)executeRecordsRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t Object = PKLogFacilityTypeGetObject(9LL);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Records request incoming %@", buf, 0xCu);
  }

  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100184FC0;
  block[3] = &unk_100639AF0;
  void block[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v11 = v7;
  id v12 = v6;
  dispatch_async((dispatch_queue_t)workQueue, block);
}

- (void)_queue_executeNextFecthRequestIfPossible
{
  if (!self->_currentRequest)
  {
    p_fetchRequests = &self->_fetchRequests;
    unint64_t v3 = (PDCloudStoreRecordsRequest *)objc_claimAutoreleasedReturnValue(-[NSMutableOrderedSet firstObject](self->_fetchRequests, "firstObject"));
    currentRequest = self->_currentRequest;
    self->_currentRequest = v3;

    -[NSMutableOrderedSet removeObject:](*p_fetchRequests, "removeObject:", self->_currentRequest);
    unint64_t v5 = self->_currentRequest;
    if (v5)
    {
      uint64_t Object = PKLogFacilityTypeGetObject(9LL);
      id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v5;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Records request starting %@",  (uint8_t *)&buf,  0xCu);
      }

      v102 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreRecordsRequest groupName](self->_currentRequest, "groupName"));
      v101 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreRecordsRequest groupNameSuffix](self->_currentRequest, "groupNameSuffix"));
      int64_t v108 = -[PDCloudStoreRecordsRequest qualityOfService](self->_currentRequest, "qualityOfService");
      id v8 = PDCloudStoreRecordsRequestTypeToString(-[PDCloudStoreRecordsRequest requestType](self->_currentRequest, "requestType"));
      id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      id v10 = (void *)objc_claimAutoreleasedReturnValue( -[PDCloudStoreContainer reportContainerChangeIntervalBeginEventWithType:stateName:objectNames:operationGroupName:operationGroupNameSuffix:]( self,  "reportContainerChangeIntervalBeginEventWithType:stateName:objectNames:operationGroupName:operati onGroupNameSuffix:",  13LL,  v9,  0LL,  v102,  v101));

      v179[0] = _NSConcreteStackBlock;
      v179[1] = 3221225472LL;
      v179[2] = sub_100186540;
      v179[3] = &unk_100647F98;
      v179[4] = self;
      id v99 = v10;
      id v180 = v99;
      v100 = objc_retainBlock(v179);
      -[PDCloudStoreContainer _updateSetupAssistantStateIfNecessary](self, "_updateSetupAssistantStateIfNecessary");
      switch(-[PDCloudStoreRecordsRequest requestType](self->_currentRequest, "requestType"))
      {
        case 0uLL:
          if (-[PDCloudStoreContainer isCloudStoreSetupAssistantComplete](self, "isCloudStoreSetupAssistantComplete"))
          {
            v35 = objc_alloc_init(&OBJC_CLASS___PKCloudRecordArray);
            id v36 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
            id v37 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreRecordsRequest cloudStoreZone](self->_currentRequest, "cloudStoreZone"));
            unint64_t v38 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreRecordsRequest containerDatabase](self->_currentRequest, "containerDatabase"));
            if (v37)
            {
              uint64_t v39 = objc_claimAutoreleasedReturnValue( -[PDCloudStoreContainerManager databaseForCloudStoreZone:]( self->_containerManager,  "databaseForCloudStoreZone:",  v37));

              unint64_t v38 = (void *)v39;
            }

            id v40 = objc_alloc_init(&OBJC_CLASS___PDCloudStoreTokenRecordFetchConfiguration);
            -[PDCloudStoreTokenRecordFetchConfiguration setShouldSaveToken:]( v40,  "setShouldSaveToken:",  -[PDCloudStoreRecordsRequest shouldSaveToken](self->_currentRequest, "shouldSaveToken"));
            -[PDCloudStoreTokenRecordFetchConfiguration setUseStoredChangeToken:]( v40,  "setUseStoredChangeToken:",  -[PDCloudStoreRecordsRequest useLastChangeToken](self->_currentRequest, "useLastChangeToken"));
            v41 = -[PDCloudStoreTokenRecordFetchCloudStoreZoneAndChangeToken initWithCloudStoreZone:]( objc_alloc(&OBJC_CLASS___PDCloudStoreTokenRecordFetchCloudStoreZoneAndChangeToken),  "initWithCloudStoreZone:",  v37);
            v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v41));
            -[PDCloudStoreTokenRecordFetchConfiguration setCloudStoreZonesAndChangeTokens:]( v40,  "setCloudStoreZonesAndChangeTokens:",  v42);

            -[PDCloudStoreTokenRecordFetchConfiguration setContainerDatabase:](v40, "setContainerDatabase:", v38);
            v43 = (void *)objc_claimAutoreleasedReturnValue( -[PDCloudStoreRecordsRequest ignoreRecordsBeforeDate]( self->_currentRequest,  "ignoreRecordsBeforeDate"));
            -[PDCloudStoreTokenRecordFetchConfiguration setIgnoreRecordsBeforeDate:]( v40,  "setIgnoreRecordsBeforeDate:",  v43);

            id v44 = (void *)objc_claimAutoreleasedReturnValue( -[PDCloudStoreRecordsRequest ignoreRecordsAfterDate]( self->_currentRequest,  "ignoreRecordsAfterDate"));
            -[PDCloudStoreTokenRecordFetchConfiguration setIgnoreRecordsAfterDate:]( v40,  "setIgnoreRecordsAfterDate:",  v44);

            -[PDCloudStoreTokenRecordFetchConfiguration setIgnoreChangesMadeByThisDevice:]( v40,  "setIgnoreChangesMadeByThisDevice:",  -[PDCloudStoreRecordsRequest ignoreChangesMadeByThisDevice]( self->_currentRequest,  "ignoreChangesMadeByThisDevice"));
            *(void *)&__int128 buf = 0LL;
            *((void *)&buf + 1) = &buf;
            uint64_t v184 = 0x3032000000LL;
            v185 = sub_10018664C;
            v186 = sub_10018665C;
            id v187 = 0LL;
            v175[0] = _NSConcreteStackBlock;
            v175[1] = 3221225472LL;
            v175[2] = sub_100186664;
            v175[3] = &unk_100647FE8;
            v175[4] = self;
            p___int128 buf = &buf;
            v176 = v35;
            v177 = v36;
            v171[0] = _NSConcreteStackBlock;
            v171[1] = 3221225472LL;
            v171[2] = sub_10018699C;
            v171[3] = &unk_100648010;
            v171[4] = self;
            v45 = v176;
            v172 = v45;
            unint64_t v46 = v177;
            v173 = v46;
            v174 = v100;
            -[PDCloudStoreContainer _queue_fetchAllRecordsUsingConfiguration:operationGroupName:operationGroupNameSuffix:qualityOfService:batchHandler:completion:]( self,  "_queue_fetchAllRecordsUsingConfiguration:operationGroupName:operationGroupNameSuffix:qualityOfService:batc hHandler:completion:",  v40,  v102,  v101,  v108,  v175,  v171);

            _Block_object_dispose(&buf, 8);
          }

          else
          {
            if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
            {
              v87 = self->_currentRequest;
              LODWORD(buf) = 138412290;
              *(void *)((char *)&buf + 4) = v87;
              _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Not performing request since the PDCloudStoreContainerSetupAssistantState is not complete %@",  (uint8_t *)&buf,  0xCu);
            }

            v88 = (void *)objc_claimAutoreleasedReturnValue( -[PDCloudStoreContainer setupAssistantNotCompleteError]( self,  "setupAssistantNotCompleteError"));
            ((void (*)(void *, void, void *))v100[2])(v100, 0LL, v88);
          }

          break;
        case 1uLL:
          v47 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreRecordsRequest cloudStoreZone](self->_currentRequest, "cloudStoreZone"));
          id v48 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreRecordsRequest containerDatabase](self->_currentRequest, "containerDatabase"));
          if (v47)
          {
            uint64_t v49 = objc_claimAutoreleasedReturnValue( -[PDCloudStoreContainerManager databaseForCloudStoreZone:]( self->_containerManager,  "databaseForCloudStoreZone:",  v47));

            id v48 = (void *)v49;
          }

          unint64_t v50 = objc_alloc_init(&OBJC_CLASS___PDCloudStoreTokenRecordFetchConfiguration);
          -[PDCloudStoreTokenRecordFetchConfiguration setShouldSaveToken:]( v50,  "setShouldSaveToken:",  -[PDCloudStoreRecordsRequest shouldSaveToken](self->_currentRequest, "shouldSaveToken"));
          -[PDCloudStoreTokenRecordFetchConfiguration setUseStoredChangeToken:]( v50,  "setUseStoredChangeToken:",  -[PDCloudStoreRecordsRequest useLastChangeToken](self->_currentRequest, "useLastChangeToken"));
          v51 = -[PDCloudStoreTokenRecordFetchCloudStoreZoneAndChangeToken initWithCloudStoreZone:]( objc_alloc(&OBJC_CLASS___PDCloudStoreTokenRecordFetchCloudStoreZoneAndChangeToken),  "initWithCloudStoreZone:",  v47);
          id v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v51));
          -[PDCloudStoreTokenRecordFetchConfiguration setCloudStoreZonesAndChangeTokens:]( v50,  "setCloudStoreZonesAndChangeTokens:",  v52);

          -[PDCloudStoreTokenRecordFetchConfiguration setContainerDatabase:](v50, "setContainerDatabase:", v48);
          -[PDCloudStoreTokenRecordFetchConfiguration setBatchLimit:]( v50,  "setBatchLimit:",  -[PDCloudStoreRecordsRequest batchLimit](self->_currentRequest, "batchLimit"));
          v53 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreRecordsRequest batchHandler](self->_currentRequest, "batchHandler"));
          unint64_t v54 = v53;
          if (v53)
          {
            v169[0] = _NSConcreteStackBlock;
            v169[1] = 3221225472LL;
            v169[2] = sub_100186AB4;
            v169[3] = &unk_100648060;
            v169[4] = self;
            id v170 = v53;
            v167[0] = _NSConcreteStackBlock;
            v167[1] = 3221225472LL;
            v167[2] = sub_100186C20;
            v167[3] = &unk_100648088;
            v167[4] = self;
            v168 = v100;
            -[PDCloudStoreContainer _queue_fetchInitialRecordsUsingConfiguration:operationGroupName:operationGroupNameSuffix:qualityOfService:batchHandler:completion:]( self,  "_queue_fetchInitialRecordsUsingConfiguration:operationGroupName:operationGroupNameSuffix:qualityOfService: batchHandler:completion:",  v50,  v102,  v101,  v108,  v169,  v167);
          }

          else
          {
            v90 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer description](self, "description"));
            v91 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"No hander provider %@",  v90));
            v92 = (void *)objc_claimAutoreleasedReturnValue( -[PDCloudStoreContainer errorWithCode:description:]( self,  "errorWithCode:description:",  -4004LL,  v91));

            ((void (*)(void *, void, void *))v100[2])(v100, 0LL, v92);
          }

          break;
        case 2uLL:
        case 3uLL:
          v98 = (void *)objc_claimAutoreleasedReturnValue( -[PDCloudStoreRecordsRequest ignoreRecordsBeforeDate]( self->_currentRequest,  "ignoreRecordsBeforeDate"));
          if (v98)
          {
            id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"creationDate > %@",  v98));
            if ((id)-[PDCloudStoreRecordsRequest requestType](self->_currentRequest, "requestType") == (id)3)
            {
              uint64_t v12 = objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"modificationDate >= %@",  v98));

              id v11 = (void *)v12;
            }

            containerManager = self->_containerManager;
            id v14 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreRecordsRequest cloudStoreZone](self->_currentRequest, "cloudStoreZone"));
            id v15 = (void *)objc_claimAutoreleasedReturnValue( -[PDCloudStoreContainerManager databaseForCloudStoreZone:]( containerManager,  "databaseForCloudStoreZone:",  v14));

            id v16 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreRecordsRequest batchHandler](self->_currentRequest, "batchHandler"));
            if (v16 || !-[PDCloudStoreRecordsRequest returnRecords](self->_currentRequest, "returnRecords"))
            {
              id v18 = 0LL;
              id v17 = 0LL;
            }

            else
            {
              id v17 = objc_alloc_init(&OBJC_CLASS___PDCloudStoreRecordsResponse);
              id v18 = objc_alloc_init(&OBJC_CLASS___PKCloudRecordArray);
            }

            v164[0] = _NSConcreteStackBlock;
            v164[1] = 3221225472LL;
            v164[2] = sub_100186D14;
            v164[3] = &unk_1006480B0;
            id v19 = v18;
            v165 = v19;
            id v93 = v16;
            id v166 = v93;
            id v20 = objc_retainBlock(v164);
            id v105 = objc_alloc_init(&OBJC_CLASS___PKAsyncUnaryOperationComposer);
            v154[0] = _NSConcreteStackBlock;
            v154[1] = 3221225472LL;
            v154[2] = sub_100186E04;
            v154[3] = &unk_100648128;
            id v104 = v11;
            id v155 = v104;
            v156 = self;
            id v21 = v102;
            id v157 = v21;
            id v22 = v101;
            id v158 = v22;
            int64_t v163 = v108;
            id v103 = v15;
            id v159 = v103;
            v94 = v20;
            id v162 = v94;
            v97 = v17;
            v160 = v97;
            v96 = v19;
            v161 = v96;
            [v105 addOperation:v154];
            context = objc_autoreleasePoolPush();
            id v23 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
            v182[0] = PKCloudAccountEventRecordType;
            v182[1] = PKCloudAccountRewardsRecordType;
            v182[2] = PKCloudCreditAccountStatementRecordType;
            v182[3] = PKCloudAccountPaymentRecordType;
            v182[4] = PKCloudAccountServicingRecordType;
            v182[5] = PKCloudAccountTransferRecordType;
            v182[6] = PKCloudAccountHoldRecordType;
            __int128 v152 = 0u;
            __int128 v153 = 0u;
            __int128 v150 = 0u;
            __int128 v151 = 0u;
            id v24 = (id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v182,  7LL));
            id v25 = [v24 countByEnumeratingWithState:&v150 objects:v181 count:16];
            if (v25)
            {
              uint64_t v26 = *(void *)v151;
              do
              {
                for (i = 0LL; i != v25; i = (char *)i + 1)
                {
                  if (*(void *)v151 != v26) {
                    objc_enumerationMutation(v24);
                  }
                  uint64_t v28 = *(void *)(*((void *)&v150 + 1) + 8LL * (void)i);
                  v142[0] = _NSConcreteStackBlock;
                  v142[1] = 3221225472LL;
                  v142[2] = sub_100187180;
                  v142[3] = &unk_100648178;
                  v142[4] = v28;
                  id v143 = v104;
                  v144 = self;
                  id v145 = v21;
                  id v146 = v22;
                  int64_t v149 = v108;
                  id v147 = v103;
                  v148 = v23;
                  [v105 addOperation:v142];
                }

                id v25 = [v24 countByEnumeratingWithState:&v150 objects:v181 count:16];
              }

              while (v25);
            }

            v138[0] = _NSConcreteStackBlock;
            v138[1] = 3221225472LL;
            v138[2] = sub_10018752C;
            v138[3] = &unk_10063BAD8;
            v138[4] = self;
            v139 = v23;
            uint64_t v29 = v97;
            v140 = v29;
            v30 = v96;
            v141 = v30;
            uint64_t v31 = v23;
            [v105 addOperation:v138];

            objc_autoreleasePoolPop(context);
            id v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
            v135[0] = _NSConcreteStackBlock;
            v135[1] = 3221225472LL;
            v135[2] = sub_1001876FC;
            v135[3] = &unk_10063F600;
            v135[4] = self;
            v137 = v100;
            v136 = v29;
            unsigned int v33 = v29;
            id v34 = [v105 evaluateWithInput:v32 completion:v135];
          }

          else
          {
            id v104 = (id)objc_claimAutoreleasedReturnValue( -[PDCloudStoreContainer errorWithCode:description:]( self,  "errorWithCode:description:",  -4004LL,  @"Cannot perform cloud kit request since ignoreRecordsBeforeDate is nil"));
            ((void (*)(void *, void, id))v100[2])(v100, 0LL, v104);
          }

          break;
        case 4uLL:
          v55 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreRecordsRequest batchHandler](self->_currentRequest, "batchHandler"));
          if (v55 || !-[PDCloudStoreRecordsRequest returnRecords](self->_currentRequest, "returnRecords"))
          {
            id v56 = 0LL;
            v57 = 0LL;
          }

          else
          {
            id v56 = objc_alloc_init(&OBJC_CLASS___PDCloudStoreRecordsResponse);
            v57 = objc_alloc_init(&OBJC_CLASS___PKCloudRecordArray);
          }

          v71 = self->_containerManager;
          v72 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreRecordsRequest cloudStoreZone](self->_currentRequest, "cloudStoreZone"));
          v107 = (void *)objc_claimAutoreleasedReturnValue( -[PDCloudStoreContainerManager databaseForCloudStoreZone:]( v71,  "databaseForCloudStoreZone:",  v72));

          v73 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreRecordsRequest ckQuery](self->_currentRequest, "ckQuery"));
          int64_t v74 = -[PDCloudStoreRecordsRequest batchLimit](self->_currentRequest, "batchLimit");
          v75 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreRecordsRequest cloudStoreZone](self->_currentRequest, "cloudStoreZone"));
          v76 = (void *)objc_claimAutoreleasedReturnValue([v75 recordZone]);
          v132[0] = _NSConcreteStackBlock;
          v132[1] = 3221225472LL;
          v132[2] = sub_1001877E4;
          v132[3] = &unk_100648208;
          v132[4] = self;
          v133 = v57;
          id v134 = v55;
          v128[0] = _NSConcreteStackBlock;
          v128[1] = 3221225472LL;
          v128[2] = sub_100187B78;
          v128[3] = &unk_100648010;
          v128[4] = self;
          v129 = v56;
          v130 = v133;
          v131 = v100;
          v77 = v133;
          v78 = v56;
          id v79 = v55;
          -[PDCloudStoreContainer fetchRecordsWithQuery:batchLimit:operationGroupName:operationGroupNameSuffix:qualityOfService:zone:containerDatabase:batchHandler:completion:]( self,  "fetchRecordsWithQuery:batchLimit:operationGroupName:operationGroupNameSuffix:qualityOfService:zone:container Database:batchHandler:completion:",  v73,  v74,  v102,  v101,  v108,  v76,  v107,  v132,  v128);

          break;
        case 5uLL:
          __int16 v63 = (void *)objc_claimAutoreleasedReturnValue( -[PDCloudStoreRecordsRequest recordIDsByDatabaseIdentifier]( self->_currentRequest,  "recordIDsByDatabaseIdentifier"));
          v124[0] = _NSConcreteStackBlock;
          v124[1] = 3221225472LL;
          v124[2] = sub_100188244;
          v124[3] = &unk_1006482E8;
          v124[4] = self;
          v125 = v100;
          -[PDCloudStoreContainer fetchRecordsWithRecordIDsByDatabaseIdentifier:operationGroupName:operationGroupNameSuffix:qualityOfService:completion:]( self,  "fetchRecordsWithRecordIDsByDatabaseIdentifier:operationGroupName:operationGroupNameSuffix:qualityOfService:completion:",  v63,  v102,  v101,  v108,  v124);

          break;
        case 6uLL:
          unint64_t v64 = (void *)objc_claimAutoreleasedReturnValue( -[PDCloudStoreRecordsRequest recordsToSaveByDatabaseIdentifier]( self->_currentRequest,  "recordsToSaveByDatabaseIdentifier"));
          v65 = (void *)objc_claimAutoreleasedReturnValue( -[PDCloudStoreRecordsRequest recordIDsByDatabaseIdentifier]( self->_currentRequest,  "recordIDsByDatabaseIdentifier"));
          v66 = (void *)objc_claimAutoreleasedReturnValue( -[PDCloudStoreRecordsRequest recordModificationOperationConfiguration]( self->_currentRequest,  "recordModificationOperationConfiguration"));
          BOOL v67 = -[PDCloudStoreRecordsRequest detectConflicts](self->_currentRequest, "detectConflicts");
          BOOL v68 = -[PDCloudStoreRecordsRequest isModifyingShare](self->_currentRequest, "isModifyingShare");
          v126[0] = _NSConcreteStackBlock;
          v126[1] = 3221225472LL;
          v126[2] = sub_100187C64;
          v126[3] = &unk_100648278;
          v126[4] = self;
          v127 = v100;
          -[PDCloudStoreContainer modifyRecordsOperationWithRecordsToSaveByDatabaseIdentifier:recordIDsToDeleteByDatabaseIdentifier:recordModificationOperationConfiguration:emitErrorIfConflictDetected:isModifyingShare:operationGroupName:operationGroupNameSuffix:qualityOfService:completion:]( self,  "modifyRecordsOperationWithRecordsToSaveByDatabaseIdentifier:recordIDsToDeleteByDatabaseIdentifier:recordModi ficationOperationConfiguration:emitErrorIfConflictDetected:isModifyingShare:operationGroupName:operationGrou pNameSuffix:qualityOfService:completion:",  v64,  v65,  v66,  v67,  v68,  v102,  v101,  v108,  v126);

          break;
        case 7uLL:
          unint64_t v58 = self->_containerManager;
          v59 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreRecordsRequest cloudStoreZone](self->_currentRequest, "cloudStoreZone"));
          v106 = (void *)objc_claimAutoreleasedReturnValue( -[PDCloudStoreContainerManager databaseForCloudStoreZone:]( v58,  "databaseForCloudStoreZone:",  v59));

          id v60 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreRecordsRequest batchHandler](self->_currentRequest, "batchHandler"));
          if (v60 || !-[PDCloudStoreRecordsRequest returnRecords](self->_currentRequest, "returnRecords"))
          {
            __int16 v61 = 0LL;
            id v62 = 0LL;
          }

          else
          {
            __int16 v61 = objc_alloc_init(&OBJC_CLASS___PDCloudStoreRecordsResponse);
            id v62 = objc_alloc_init(&OBJC_CLASS___PKCloudRecordArray);
          }

          v80 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreRecordsRequest ckQuery](self->_currentRequest, "ckQuery"));
          int64_t v81 = -[PDCloudStoreRecordsRequest batchLimit](self->_currentRequest, "batchLimit");
          v82 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreRecordsRequest cloudStoreZone](self->_currentRequest, "cloudStoreZone"));
          v83 = (void *)objc_claimAutoreleasedReturnValue([v82 recordZone]);
          v121[0] = _NSConcreteStackBlock;
          v121[1] = 3221225472LL;
          v121[2] = sub_10018860C;
          v121[3] = &unk_100648208;
          v121[4] = self;
          v122 = v62;
          id v123 = v60;
          v116[0] = _NSConcreteStackBlock;
          v116[1] = 3221225472LL;
          v116[2] = sub_1001889F8;
          v116[3] = &unk_100648010;
          v117 = v61;
          v118 = v122;
          v119 = self;
          v120 = v100;
          v84 = v122;
          v85 = v61;
          id v86 = v60;
          -[PDCloudStoreContainer fetchRecordsWithQuery:batchLimit:operationGroupName:operationGroupNameSuffix:qualityOfService:zone:containerDatabase:batchHandler:completion:]( self,  "fetchRecordsWithQuery:batchLimit:operationGroupName:operationGroupNameSuffix:qualityOfService:zone:container Database:batchHandler:completion:",  v80,  v81,  v102,  v101,  v108,  v83,  v106,  v121,  v116);

          break;
        case 8uLL:
          v69 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreRecordsRequest recordName](self->_currentRequest, "recordName"));
          if (v69)
          {
            v70 = (void *)objc_claimAutoreleasedReturnValue( -[PDCloudStoreContainerManager validDatabaseIdentifiers]( self->_containerManager,  "validDatabaseIdentifiers"));
            v110[0] = _NSConcreteStackBlock;
            v110[1] = 3221225472LL;
            v110[2] = sub_100188AE4;
            v110[3] = &unk_100648360;
            v110[4] = self;
            v114 = v100;
            id v111 = v69;
            id v112 = v102;
            id v113 = v101;
            int64_t v115 = v108;
            -[PDCloudStoreContainer _recordZonesWithOperationGroupNameSuffix:containerDatabaseIdentifiers:completion:]( self,  "_recordZonesWithOperationGroupNameSuffix:containerDatabaseIdentifiers:completion:",  v113,  v70,  v110);
          }

          else
          {
            if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
            {
              v89 = self->_currentRequest;
              LODWORD(buf) = 138412290;
              *(void *)((char *)&buf + 4) = v89;
              _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "No recordName defined for request %@",  (uint8_t *)&buf,  0xCu);
            }

            ((void (*)(void *, void, void))v100[2])(v100, 0LL, 0LL);
          }

          break;
        default:
          break;
      }
    }
  }

- (BOOL)canCoalesceRequest:(id)a3 withNewRequest:(id)a4
{
  return 0;
}

- (BOOL)shouldContinueWithRequest:(id)a3
{
  return 1;
}

- (BOOL)shouldForwardErrorsToRequestCompletionHandlers
{
  return 0;
}

- (void)_queue_fetchInitialRecordsUsingConfiguration:(id)a3 operationGroupName:(id)a4 operationGroupNameSuffix:(id)a5 qualityOfService:(int64_t)a6 batchHandler:(id)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = (void (**)(id, void *))a8;
  unint64_t nextExpectedState = self->_nextExpectedState;
  BOOL v20 = nextExpectedState > 0xF || ((1LL << nextExpectedState) & 0xA100) == 0;
  id v71 = v14;
  if (v20)
  {
    unint64_t v58 = PDCloudStoreContainerStateToString(nextExpectedState);
    v59 = (void *)objc_claimAutoreleasedReturnValue(v58);
    v53 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Cannot peform %s: when the container is in state: %@",  "-[PDCloudStoreContainer _queue_fetchInitialRecordsUsingConfiguration:operationGroupName:operationG roupNameSuffix:qualityOfService:batchHandler:completion:]",  v59));

    uint64_t Object = PKLogFacilityTypeGetObject(9LL);
    __int16 v61 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412290;
      id v105 = v53;
      _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }

    id v21 = v71;
    if (!v18) {
      goto LABEL_41;
    }
LABEL_34:
    v55 = (void *)objc_claimAutoreleasedReturnValue( -[PDCloudStoreContainer _cannotPerformActionErrorWithFailureReason:]( self,  "_cannotPerformActionErrorWithFailureReason:",  v53));
    v18[2](v18, v55);
LABEL_40:

    goto LABEL_41;
  }

  id v21 = v14;
  if (([v14 hasCloudStoreZones] & 1) == 0
    && ([v14 hasContainerDatabase] & 1) == 0)
  {
    id v22 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer containerManager](self, "containerManager"));
    id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 databaseForScope:2]);

    [v14 setContainerDatabase:v23];
    uint64_t v24 = PKLogFacilityTypeGetObject(9LL);
    id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412290;
      id v105 = v23;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "There is no cloud store zone or database defined for fetch changes request. Assuming request is for private database. %@",  buf,  0xCu);
    }
  }

  if ([v14 hasCloudStoreZones]
    && ([v14 hasContainerDatabase] & 1) != 0)
  {
    unint64_t v64 = v18;
    v65 = v17;
    uint64_t v26 = PKLogFacilityTypeGetObject(9LL);
    uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138413058;
      id v105 = v14;
      __int16 v106 = 2112;
      id v107 = v15;
      __int16 v108 = 2112;
      id v109 = v16;
      __int16 v110 = 2048;
      int64_t v111 = a6;
      _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "Fetching records, using configuration: %@ group %@, suffix %@, QoS: %ld",  buf,  0x2Au);
    }

    int64_t v63 = a6;
    v69 = v16;
    v66 = v15;

    unsigned __int8 v62 = [v14 shouldSaveToken];
    unsigned int v77 = [v14 useStoredChangeToken];
    BOOL v68 = (void *)objc_claimAutoreleasedReturnValue([v14 containerDatabase]);
    BOOL v67 = (void *)objc_claimAutoreleasedReturnValue([v68 identifier]);
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    v78 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v99 = 0u;
    __int128 v100 = 0u;
    __int128 v101 = 0u;
    __int128 v102 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue([v14 cloudStoreZonesAndChangeTokens]);
    id v29 = [obj countByEnumeratingWithState:&v99 objects:v103 count:16];
    v70 = v28;
    if (v29)
    {
      id v30 = v29;
      uint64_t v75 = *(void *)v100;
      uint64_t v73 = PKCloudStoreOperationGroupInitialDownload;
      do
      {
        for (i = 0LL; i != v30; i = (char *)i + 1)
        {
          if (*(void *)v100 != v75) {
            objc_enumerationMutation(obj);
          }
          id v32 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v99 + 1) + 8 * (void)i) cloudStoreZone]);
          unsigned int v33 = (void *)objc_claimAutoreleasedReturnValue([v32 recordZone]);
          id v34 = (void *)objc_claimAutoreleasedReturnValue([v33 zoneID]);

          v35 = (void *)objc_claimAutoreleasedReturnValue( -[PDCloudStoreContainerManager changeTokenForCloudStoreStore:]( self->_containerManager,  "changeTokenForCloudStoreStore:",  v32));
          id v36 = objc_alloc_init(&OBJC_CLASS___CKFetchRecordZoneChangesConfiguration);
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            id v37 = (void *)objc_claimAutoreleasedReturnValue([v35 data]);
            unint64_t v38 = (void *)objc_claimAutoreleasedReturnValue([v32 zoneName]);
            *(_DWORD *)__int128 buf = 138543618;
            id v105 = v37;
            __int16 v106 = 2114;
            id v107 = v38;
            _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "Using server change token %{public}@ for zone %{public}@",  buf,  0x16u);

            id v21 = v71;
            uint64_t v28 = v70;
          }

          -[PDCloudStoreRecordsRequest setQualityOfService:](self->_currentRequest, "setQualityOfService:", 9LL);
          -[PDCloudStoreRecordsRequest setGroupName:](self->_currentRequest, "setGroupName:", v73);
          if (v77) {
            -[CKFetchRecordZoneChangesConfiguration setPreviousServerChangeToken:]( v36,  "setPreviousServerChangeToken:",  v35);
          }
          -[CKFetchRecordZoneChangesConfiguration setResultsLimit:]( v36,  "setResultsLimit:",  [v21 batchLimit]);
          -[PDCloudStoreContainer _updateFetchNewestChangesFirstFlagForConfiguration:request:]( self,  "_updateFetchNewestChangesFirstFlagForConfiguration:request:",  v36,  self->_currentRequest);
          [v28 setObject:v36 forKey:v34];
          -[NSMutableArray addObject:](v78, "addObject:", v34);
        }

        id v30 = [obj countByEnumeratingWithState:&v99 objects:v103 count:16];
      }

      while (v30);
    }

    uint64_t v39 = v78;
    if (-[NSMutableArray count](v78, "count"))
    {
      id v40 = -[CKFetchRecordZoneChangesOperation initWithRecordZoneIDs:configurationsByRecordZoneID:]( objc_alloc(&OBJC_CLASS___CKFetchRecordZoneChangesOperation),  "initWithRecordZoneIDs:configurationsByRecordZoneID:",  v78,  v28);
      v76 = objc_alloc_init(&OBJC_CLASS___CKOperationConfiguration);
      v41 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainerManager container](self->_containerManager, "container"));
      -[CKOperationConfiguration setContainer:](v76, "setContainer:", v41);

      -[CKOperationConfiguration setDiscretionaryNetworkBehavior:](v76, "setDiscretionaryNetworkBehavior:", 0LL);
      -[CKOperationConfiguration setAutomaticallyRetryNetworkFailures:]( v76,  "setAutomaticallyRetryNetworkFailures:",  0LL);
      -[CKFetchRecordZoneChangesOperation setConfiguration:](v40, "setConfiguration:", v76);
      v42 = (void *)objc_claimAutoreleasedReturnValue([v68 database]);
      -[CKFetchRecordZoneChangesOperation setDatabase:](v40, "setDatabase:", v42);

      v43 = (void *)objc_claimAutoreleasedReturnValue( +[CKOperationGroup pk_operationGroupWithName:suffix:]( &OBJC_CLASS___CKOperationGroup,  "pk_operationGroupWithName:suffix:",  PKCloudStoreOperationGroupInitialDownload,  v69));
      -[CKFetchRecordZoneChangesOperation setGroup:](v40, "setGroup:", v43);

      -[CKFetchRecordZoneChangesOperation setQualityOfService:](v40, "setQualityOfService:", 9LL);
      -[CKFetchRecordZoneChangesOperation setFetchAllChanges:](v40, "setFetchAllChanges:", 0LL);
      v97[0] = _NSConcreteStackBlock;
      v97[1] = 3221225472LL;
      v97[2] = sub_100189AA0;
      v97[3] = &unk_100648388;
      id v44 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
      v98 = v44;
      -[CKFetchRecordZoneChangesOperation setRecordWasChangedBlock:](v40, "setRecordWasChangedBlock:", v97);
      v84[0] = _NSConcreteStackBlock;
      v84[1] = 3221225472LL;
      v84[2] = sub_100189C94;
      v84[3] = &unk_100648428;
      v85 = v44;
      id v86 = self;
      unsigned __int8 v95 = v62;
      id v45 = v67;
      id v87 = v45;
      id v74 = v68;
      id v88 = v74;
      char v96 = v77;
      id v89 = v21;
      id v15 = v66;
      id v46 = v66;
      id v90 = v46;
      id v47 = v69;
      id v91 = v47;
      int64_t v94 = v63;
      id v17 = v65;
      id v92 = v65;
      id v48 = v64;
      id v93 = v48;
      uint64_t v49 = v44;
      -[CKFetchRecordZoneChangesOperation setRecordZoneFetchCompletionBlock:]( v40,  "setRecordZoneFetchCompletionBlock:",  v84);
      v79[0] = _NSConcreteStackBlock;
      v79[1] = 3221225472LL;
      v79[2] = sub_10018A5F0;
      v79[3] = &unk_100648450;
      v79[4] = self;
      id v50 = v45;
      uint64_t v39 = v78;
      id v80 = v50;
      id v81 = v46;
      id v51 = v47;
      uint64_t v28 = v70;
      id v82 = v51;
      id v52 = v48;
      id v18 = v64;
      v53 = v68;
      v83 = v52;
      -[CKFetchRecordZoneChangesOperation setFetchRecordZoneChangesCompletionBlock:]( v40,  "setFetchRecordZoneChangesCompletionBlock:",  v79);
      unint64_t v54 = (void *)objc_claimAutoreleasedReturnValue([v74 database]);
      -[PDCloudStoreContainer _queue_addOperation:forDatabase:](self, "_queue_addOperation:forDatabase:", v40, v54);

      id v21 = v71;
      v55 = v67;
    }

    else
    {
      id v18 = v64;
      v53 = v68;
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Error: No recordZoneIDs to fetch", buf, 2u);
      }

      id v17 = v65;
      id v15 = v66;
      v55 = v67;
      if (v64) {
        v64[2](v64, 0LL);
      }
    }

    id v16 = v69;
    goto LABEL_40;
  }

  v53 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"Cannot peform %s: when there is no zone or database defined (%id, %id)",  "-[PDCloudStoreContainer _queue_fetchInitialRecordsUsingConfiguration:operationGroupName:operationGro upNameSuffix:qualityOfService:batchHandler:completion:]",  [v14 hasCloudStoreZones],  objc_msgSend(v14, "hasContainerDatabase")));
  uint64_t v56 = PKLogFacilityTypeGetObject(9LL);
  v57 = (os_log_s *)objc_claimAutoreleasedReturnValue(v56);
  if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138543362;
    id v105 = v53;
    _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
  }

  if (v18) {
    goto LABEL_34;
  }
LABEL_41:
}

- (void)_queue_fetchAllRecordsUsingConfiguration:(id)a3 operationGroupName:(id)a4 operationGroupNameSuffix:(id)a5 qualityOfService:(int64_t)a6 batchHandler:(id)a7 completion:(id)a8
{
  id v13 = a3;
  id v93 = a4;
  int64_t v94 = (uint64_t (*)(uint64_t, uint64_t))a5;
  id v92 = a7;
  id v95 = a8;
  unint64_t nextExpectedState = self->_nextExpectedState;
  if (nextExpectedState > 0xF || ((1LL << nextExpectedState) & 0xA100) == 0)
  {
    unsigned int v33 = PDCloudStoreContainerStateToString(nextExpectedState);
    id v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
    v97 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Cannot peform %s: when the container is in state: %@",  "-[PDCloudStoreContainer _queue_fetchAllRecordsUsingConfiguration:operationGroupName:operationGroup NameSuffix:qualityOfService:batchHandler:completion:]",  v34));

    uint64_t Object = PKLogFacilityTypeGetObject(9LL);
    id v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412290;
      *(void *)&uint8_t buf[4] = v97;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }

    if (v95) {
      goto LABEL_25;
    }
  }

  else
  {
    if (([v13 hasCloudStoreZones] & 1) == 0
      && ([v13 hasContainerDatabase] & 1) == 0)
    {
      id v16 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer containerManager](self, "containerManager"));
      id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 databaseForScope:2]);

      [v13 setContainerDatabase:v17];
      uint64_t v18 = PKLogFacilityTypeGetObject(9LL);
      id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 138412290;
        *(void *)&uint8_t buf[4] = v17;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "There is no cloud store zone or database defined for fetch changes request. Assuming request is for private database. %@",  buf,  0xCu);
      }
    }

    if ([v13 hasContainerDatabase])
    {
      uint64_t v20 = PKLogFacilityTypeGetObject(9LL);
      id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 138413058;
        *(void *)&uint8_t buf[4] = v13;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v93;
        *(_WORD *)&buf[22] = 2114;
        id v170 = v94;
        LOWORD(v171) = 2048;
        *(void *)((char *)&v171 + 2) = a6;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Fetching records, using configuration: %@ group %{public}@, suffix %{public}@, QoS: %ld",  buf,  0x2Au);
      }

      unsigned __int8 v81 = [v13 shouldSaveToken];
      unsigned __int8 v84 = [v13 useStoredChangeToken];
      unsigned __int8 v22 = [v13 ignoreChangesMadeByThisDevice];
      v97 = (void *)objc_claimAutoreleasedReturnValue([v13 containerDatabase]);
      id v90 = (void *)objc_claimAutoreleasedReturnValue([v97 identifier]);
      id v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
      uint64_t v24 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      uint64_t v159 = 0LL;
      v160 = &v159;
      uint64_t v161 = 0x2020000000LL;
      int64_t v162 = a6;
      *(void *)__int128 buf = 0LL;
      *(void *)&buf[8] = buf;
      *(void *)&uint8_t buf[16] = 0x3032000000LL;
      id v170 = sub_10018664C;
      *(void *)&__int128 v171 = sub_10018665C;
      id v79 = v93;
      *((void *)&v171 + 1) = v79;
      id v25 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      v151[0] = _NSConcreteStackBlock;
      v151[1] = 3221225472LL;
      v151[2] = sub_10018B670;
      v151[3] = &unk_100648478;
      unsigned __int8 v157 = v84;
      v151[4] = self;
      id v155 = &v159;
      v156 = buf;
      unsigned __int8 v158 = v22;
      id v83 = v23;
      id v152 = v83;
      id v86 = v24;
      __int128 v153 = v86;
      id v82 = v25;
      v154 = v82;
      uint64_t v26 = objc_retainBlock(v151);
      if ([v13 hasCloudStoreZones])
      {
        __int128 v145 = 0u;
        __int128 v146 = 0u;
        __int128 v143 = 0u;
        __int128 v144 = 0u;
        uint64_t v27 = (NSMutableSet *)objc_claimAutoreleasedReturnValue([v13 cloudStoreZonesAndChangeTokens]);
        id v28 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v27,  "countByEnumeratingWithState:objects:count:",  &v143,  v167,  16LL);
        if (v28)
        {
          uint64_t v29 = *(void *)v144;
          do
          {
            for (i = 0LL; i != v28; i = (char *)i + 1)
            {
              if (*(void *)v144 != v29) {
                objc_enumerationMutation(v27);
              }
              ((void (*)(void *, void))v26[2])( v26,  *(void *)(*((void *)&v143 + 1) + 8LL * (void)i));
            }

            id v28 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v27,  "countByEnumeratingWithState:objects:count:",  &v143,  v167,  16LL);
          }

          while (v28);
        }
      }

      else
      {
        uint64_t v27 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
        __int128 v149 = 0u;
        __int128 v150 = 0u;
        __int128 v147 = 0u;
        __int128 v148 = 0u;
        id v37 = (void *)objc_claimAutoreleasedReturnValue( -[PDCloudStoreContainerManager cloudStoreZonesInContainerDatabase:]( self->_containerManager,  "cloudStoreZonesInContainerDatabase:",  v97));
        id v38 = [v37 countByEnumeratingWithState:&v147 objects:v168 count:16];
        if (v38)
        {
          uint64_t v39 = *(void *)v148;
          do
          {
            for (j = 0LL; j != v38; j = (char *)j + 1)
            {
              if (*(void *)v148 != v39) {
                objc_enumerationMutation(v37);
              }
              v41 = -[PDCloudStoreTokenRecordFetchCloudStoreZoneAndChangeToken initWithCloudStoreZone:]( objc_alloc(&OBJC_CLASS___PDCloudStoreTokenRecordFetchCloudStoreZoneAndChangeToken),  "initWithCloudStoreZone:",  *(void *)(*((void *)&v147 + 1) + 8LL * (void)j));
              ((void (*)(void *, PDCloudStoreTokenRecordFetchCloudStoreZoneAndChangeToken *))v26[2])( v26,  v41);
              -[NSMutableSet addObject:](v27, "addObject:", v41);
            }

            id v38 = [v37 countByEnumeratingWithState:&v147 objects:v168 count:16];
          }

          while (v38);
        }

        id v42 = -[NSMutableSet copy](v27, "copy");
        [v13 setCloudStoreZonesAndChangeTokens:v42];

        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          currentRequest = self->_currentRequest;
          *(_DWORD *)int64_t v163 = 138412546;
          *(void *)&v163[4] = v27;
          *(_WORD *)&v163[12] = 2112;
          *(void *)&v163[14] = currentRequest;
          _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Applying cloud store zones to fetch request %@, %@",  v163,  0x16u);
        }
      }

      if (-[NSMutableArray count](v86, "count"))
      {
        id v44 = -[CKFetchRecordZoneChangesOperation initWithRecordZoneIDs:configurationsByRecordZoneID:]( objc_alloc(&OBJC_CLASS___CKFetchRecordZoneChangesOperation),  "initWithRecordZoneIDs:configurationsByRecordZoneID:",  v86,  v83);
        id v45 = (void *)objc_claimAutoreleasedReturnValue( +[CKOperationGroup pk_operationGroupWithName:suffix:]( &OBJC_CLASS___CKOperationGroup,  "pk_operationGroupWithName:suffix:",  *(void *)(*(void *)&buf[8] + 40LL),  v94));
        -[CKFetchRecordZoneChangesOperation setGroup:](v44, "setGroup:", v45);
        id v87 = v44;

        -[CKFetchRecordZoneChangesOperation setFetchAllChanges:](v44, "setFetchAllChanges:", 0LL);
        -[CKFetchRecordZoneChangesOperation setQualityOfService:](v44, "setQualityOfService:", v160[3]);
        id v46 = objc_alloc_init(&OBJC_CLASS___CKOperationConfiguration);
        id v47 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainerManager container](self->_containerManager, "container"));
        -[CKOperationConfiguration setContainer:](v46, "setContainer:", v47);
        id v80 = v46;

        -[CKOperationConfiguration setDiscretionaryNetworkBehavior:](v46, "setDiscretionaryNetworkBehavior:", 0LL);
        -[CKFetchRecordZoneChangesOperation setConfiguration:](v87, "setConfiguration:", v46);
        id v48 = (void *)objc_claimAutoreleasedReturnValue([v97 database]);
        -[CKFetchRecordZoneChangesOperation setDatabase:](v87, "setDatabase:", v48);

        uint64_t v49 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
        id v50 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
        *(void *)int64_t v163 = 0LL;
        *(void *)&v163[8] = v163;
        *(void *)&v163[16] = 0x3032000000LL;
        v164 = sub_10018664C;
        v165 = sub_10018665C;
        id v166 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
        v142[0] = 0LL;
        v142[1] = v142;
        v142[2] = 0x2020000000LL;
        v142[3] = 0LL;
        v140[0] = 0LL;
        v140[1] = v140;
        v140[2] = 0x2020000000LL;
        char v141 = 0;
        id v51 = (void *)objc_claimAutoreleasedReturnValue([v13 ignoreRecordsBeforeDate]);
        id v52 = (void *)objc_claimAutoreleasedReturnValue([v13 ignoreRecordsAfterDate]);
        v135[0] = _NSConcreteStackBlock;
        v135[1] = 3221225472LL;
        v135[2] = sub_10018BA00;
        v135[3] = &unk_1006484A0;
        v135[4] = self;
        id v53 = v97;
        id v136 = v53;
        id v76 = v51;
        id v137 = v76;
        id v54 = v52;
        id v138 = v54;
        v55 = v49;
        v139 = v55;
        -[CKFetchRecordZoneChangesOperation setRecordChangedBlock:](v87, "setRecordChangedBlock:", v135);
        v132[0] = _NSConcreteStackBlock;
        v132[1] = 3221225472LL;
        v132[2] = sub_10018BE38;
        v132[3] = &unk_1006484C8;
        v132[4] = self;
        id v56 = v53;
        id v133 = v56;
        v57 = v50;
        id v134 = v57;
        -[CKFetchRecordZoneChangesOperation setRecordWithIDWasDeletedBlock:]( v87,  "setRecordWithIDWasDeletedBlock:",  v132);
        unsigned int v77 = v57;
        v78 = v55;
        uint64_t v75 = v54;
        uint64_t v58 = PKLogFacilityTypeGetObject(35LL);
        v59 = (os_log_s *)(id)objc_claimAutoreleasedReturnValue(v58);
        os_signpost_id_t v60 = os_signpost_id_make_with_pointer(v59, self);
        if (v60 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v61 = v60;
          if (os_signpost_enabled(v59))
          {
            *(_WORD *)v131 = 0;
            _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v59,  OS_SIGNPOST_INTERVAL_BEGIN,  v61,  "cloudstore:fetchRecordChangesBlock",  "",  v131,  2u);
          }
        }

        v117[0] = _NSConcreteStackBlock;
        v117[1] = 3221225472LL;
        v117[2] = sub_10018C0C0;
        v117[3] = &unk_100648518;
        v125 = v140;
        v126 = v142;
        v117[4] = self;
        v127 = v163;
        unsigned __int8 v129 = v81;
        unsigned __int8 v130 = v84;
        id v62 = v56;
        id v118 = v62;
        id v119 = v13;
        id v63 = v79;
        id v120 = v63;
        unint64_t v64 = v94;
        v121 = v64;
        int64_t v128 = a6;
        id v65 = v92;
        id v123 = v65;
        id v124 = v95;
        v66 = v82;
        v122 = v66;
        BOOL v67 = objc_retainBlock(v117);
        v104[0] = _NSConcreteStackBlock;
        v104[1] = 3221225472LL;
        v104[2] = sub_10018C6FC;
        v104[3] = &unk_100648618;
        v104[4] = self;
        id v105 = v66;
        id v68 = v62;
        id v106 = v68;
        v114 = v142;
        v85 = v78;
        id v107 = v85;
        id v69 = v63;
        id v108 = v69;
        v70 = v64;
        id v109 = v70;
        id v89 = v77;
        __int16 v110 = v89;
        id v112 = v65;
        id v71 = v90;
        id v111 = v71;
        int64_t v115 = v163;
        unsigned __int8 v116 = v81;
        v72 = v67;
        id v113 = v72;
        -[CKFetchRecordZoneChangesOperation setRecordZoneFetchCompletionBlock:]( v87,  "setRecordZoneFetchCompletionBlock:",  v104);
        v98[0] = _NSConcreteStackBlock;
        v98[1] = 3221225472LL;
        v98[2] = sub_10018D29C;
        v98[3] = &unk_100648668;
        v98[4] = self;
        id v103 = v140;
        id v99 = v71;
        id v100 = v69;
        __int128 v101 = v70;
        uint64_t v73 = v72;
        id v102 = v73;
        -[CKFetchRecordZoneChangesOperation setFetchRecordZoneChangesCompletionBlock:]( v87,  "setFetchRecordZoneChangesCompletionBlock:",  v98);
        id v74 = (void *)objc_claimAutoreleasedReturnValue([v68 database]);
        -[PDCloudStoreContainer _queue_addOperation:forDatabase:](self, "_queue_addOperation:forDatabase:", v87, v74);

        _Block_object_dispose(v140, 8);
        _Block_object_dispose(v142, 8);
        _Block_object_dispose(v163, 8);
      }

      else
      {
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)int64_t v163 = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Error: No recordZoneIDs to fetch",  v163,  2u);
        }

        if (v95) {
          (*((void (**)(id, void))v95 + 2))(v95, 0LL);
        }
      }

      _Block_object_dispose(buf, 8);
      _Block_object_dispose(&v159, 8);

      goto LABEL_50;
    }

    v97 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Cannot peform %s: when there is no zone or database defined",  "-[PDCloudStoreContainer _queue_fetchAllRecordsUsingConfiguration:operationGroupName:operationGroup NameSuffix:qualityOfService:batchHandler:completion:]"));
    uint64_t v31 = PKLogFacilityTypeGetObject(9LL);
    id v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412290;
      *(void *)&uint8_t buf[4] = v97;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }

    if (v95)
    {
LABEL_25:
      id v91 = (void *)objc_claimAutoreleasedReturnValue( -[PDCloudStoreContainer _cannotPerformActionErrorWithFailureReason:]( self,  "_cannotPerformActionErrorWithFailureReason:",  v97));
      (*((void (**)(id, void *))v95 + 2))(v95, v91);
    }
  }

- (void)_updateFetchNewestChangesFirstFlagForConfiguration:(id)a3 request:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 requestType];
  unsigned int v8 = [v6 useLastChangeToken];

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 previousServerChangeToken]);
  unsigned int v10 = v8 ^ 1;
  if (!v9) {
    unsigned int v10 = 1;
  }
  if (v7) {
    uint64_t v11 = 0LL;
  }
  else {
    uint64_t v11 = v10;
  }
  uint64_t Object = PKLogFacilityTypeGetObject(9LL);
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = @"NO";
    if ((_DWORD)v11) {
      id v15 = @"YES";
    }
    else {
      id v15 = @"NO";
    }
    if (v7) {
      id v16 = @"NO";
    }
    else {
      id v16 = @"YES";
    }
    int v18 = 138544130;
    id v19 = v15;
    if (v8) {
      id v17 = @"NO";
    }
    else {
      id v17 = @"YES";
    }
    __int16 v20 = 2114;
    id v21 = v16;
    __int16 v22 = 2114;
    id v23 = v17;
    if (!v9) {
      id v14 = @"YES";
    }
    __int16 v24 = 2114;
    id v25 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Setting fetchNewestChangesFirst to %{public}@, isTokenRequest: %{public}@, ignoreLastChangeToken: %{public}@, miss ingChangeToken: %{public}@",  (uint8_t *)&v18,  0x2Au);
  }

  [v5 setFetchNewestChangesFirst:v11];
}

- (void)_queue_processOperationError:(id)a3 forZoneID:(id)a4 containerDatabaseIdentifier:(id)a5 operationGroupName:(id)a6 operationGroupNameSuffix:(id)a7 completion:(id)a8
{
  id v14 = a3;
  id v52 = a4;
  id v15 = a5;
  id v49 = a6;
  id v50 = a7;
  id v16 = a8;
  id v17 = v16;
  id v53 = v15;
  if (v14)
  {
    id v48 = (void (**)(void, void, void))v16;
    if (v15)
    {
      int v18 = (void *)objc_claimAutoreleasedReturnValue( -[PDCloudStoreContainerManager databaseForScope:]( self->_containerManager,  "databaseForScope:",  2LL));
      id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 identifier]);
      id v20 = v15;
      id v21 = v19;
      __int16 v22 = v21;
      if (v21 == v20)
      {
        unsigned int v45 = 1;
      }

      else if (v21)
      {
        unsigned int v45 = [v20 isEqualToString:v21];
      }

      else
      {
        unsigned int v45 = 0;
      }

      id v25 = (void *)objc_claimAutoreleasedReturnValue( -[PDCloudStoreContainerManager databaseForScope:]( self->_containerManager,  "databaseForScope:",  3LL));
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v25 identifier]);
      id v27 = v20;
      id v28 = v26;
      uint64_t v29 = v28;
      if (v28 == v27)
      {
        unsigned int v44 = 1;
      }

      else if (v28)
      {
        unsigned int v44 = [v27 isEqualToString:v28];
      }

      else
      {
        unsigned int v44 = 0;
      }

      id v51 = [[PKCloudStoreError alloc] initWithError:v14];
      id v30 = (void *)objc_claimAutoreleasedReturnValue([v51 allZoneIDs]);
      id v31 = [v30 mutableCopy];

      if (v52) {
        [v31 addObject:v52];
      }
      id v46 = v31;
      if (([v51 isPartialErrorWithUnkownItems] & 1) == 0) {
        -[PDCloudStoreContainer reportContainerChangeSignpostEventType:stateName:objectNames:changeToken:error:operationGroupName:operationGroupNameSuffix:]( self,  "reportContainerChangeSignpostEventType:stateName:objectNames:changeToken:error:operationGroupName:operationGroupNameSuffix:",  3LL,  0LL,  0LL,  0LL,  v14,  v49,  v50);
      }
      uint64_t Object = PKLogFacilityTypeGetObject(9LL);
      unsigned int v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 138413058;
        *(void *)&uint8_t buf[4] = v51;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v52;
        *(_WORD *)&buf[22] = 2114;
        id v89 = (uint64_t (*)(uint64_t, uint64_t))v31;
        LOWORD(v90) = 2112;
        *(void *)((char *)&v90 + 2) = v27;
        _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "Processing operation error %@ for zoneID %{public}@, all error zoneIDs %{public}@ and database identifier %@",  buf,  0x2Au);
      }

      id v47 = objc_alloc_init(&OBJC_CLASS___PKAsyncUnaryOperationComposer);
      *(void *)__int128 buf = 0LL;
      *(void *)&buf[8] = buf;
      *(void *)&uint8_t buf[16] = 0x3032000000LL;
      id v89 = sub_10018664C;
      *(void *)&__int128 v90 = sub_10018665C;
      *((void *)&v90 + 1) = 0LL;
      if ([v51 isChangeTokenExpired])
      {
        id v34 = (void *)objc_claimAutoreleasedReturnValue([v51 userInfo]);
        v35 = (void *)objc_claimAutoreleasedReturnValue([v34 objectForKey:CKPartialErrorsByItemIDKey]);

        v81[0] = _NSConcreteStackBlock;
        v81[1] = 3221225472LL;
        v81[2] = sub_10018DEA4;
        v81[3] = &unk_100648690;
        v81[4] = self;
        id v82 = v27;
        [v35 enumerateKeysAndObjectsUsingBlock:v81];
      }

      else if ([v51 isZoneNotFoundError])
      {
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)unsigned __int8 v84 = 138543618;
          id v85 = v31;
          __int16 v86 = 2114;
          id v87 = v27;
          _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "ZoneIDs with zone not found errors in database %{public}@, %{public}@",  v84,  0x16u);
        }

        __int128 v79 = 0u;
        __int128 v80 = 0u;
        __int128 v77 = 0u;
        __int128 v78 = 0u;
        id v38 = v31;
        id v39 = [v38 countByEnumeratingWithState:&v77 objects:v83 count:16];
        if (v39)
        {
          uint64_t v40 = *(void *)v78;
          do
          {
            for (i = 0LL; i != v39; i = (char *)i + 1)
            {
              if (*(void *)v78 != v40) {
                objc_enumerationMutation(v38);
              }
              containerManager = self->_containerManager;
              v43 = (void *)objc_claimAutoreleasedReturnValue( +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  *(void *)(*((void *)&v77 + 1) + 8LL * (void)i)));
              -[PDCloudStoreContainerManager containerDatabaseIdentifier:didRemoveZoneIDs:]( containerManager,  "containerDatabaseIdentifier:didRemoveZoneIDs:",  v27,  v43);
            }

            id v39 = [v38 countByEnumeratingWithState:&v77 objects:v83 count:16];
          }

          while (v39);
        }

        if (v45)
        {
          v72[0] = _NSConcreteStackBlock;
          v72[1] = 3221225472LL;
          v72[2] = sub_10018DFC4;
          v72[3] = &unk_1006433B0;
          id v73 = v38;
          id v74 = v27;
          uint64_t v75 = self;
          id v76 = buf;
          [v47 addOperation:v72];

          v35 = v73;
        }

        else
        {
          if (!v44) {
            goto LABEL_28;
          }
          v68[0] = _NSConcreteStackBlock;
          v68[1] = 3221225472LL;
          v68[2] = sub_10018E230;
          v68[3] = &unk_10063EC90;
          id v69 = v38;
          id v70 = v27;
          id v71 = self;
          [v47 addOperation:v68];

          v35 = v69;
        }
      }

      else
      {
        PKAnalyticsSendEvent(PKAggDKeyCloudStoreFailureUnrecoverableError, 0LL);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)unsigned __int8 v84 = 138412546;
          id v85 = v31;
          __int16 v86 = 2112;
          id v87 = v27;
          _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "ZoneIDs with unrecoverable errors in database %@, %@",  v84,  0x16u);
        }

        if (v45)
        {
          v63[0] = _NSConcreteStackBlock;
          v63[1] = 3221225472LL;
          v63[2] = sub_10018E324;
          v63[3] = &unk_1006433B0;
          id v64 = v31;
          id v65 = self;
          id v66 = v27;
          BOOL v67 = buf;
          [v47 addOperation:v63];

          v35 = v64;
        }

        else
        {
          if (!v44) {
            goto LABEL_28;
          }
          v58[0] = _NSConcreteStackBlock;
          v58[1] = 3221225472LL;
          v58[2] = sub_10018E580;
          v58[3] = &unk_1006433B0;
          id v59 = v31;
          os_signpost_id_t v60 = self;
          id v61 = v27;
          id v62 = buf;
          [v47 addOperation:v58];

          v35 = v59;
        }
      }

LABEL_28:
      id v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
      v54[0] = _NSConcreteStackBlock;
      v54[1] = 3221225472LL;
      v54[2] = sub_10018E97C;
      v54[3] = &unk_1006486E0;
      v57 = buf;
      v54[4] = self;
      id v55 = v14;
      id v56 = v48;
      id v37 = [v47 evaluateWithInput:v36 completion:v54];

      _Block_object_dispose(buf, 8);
      goto LABEL_29;
    }

    uint64_t v23 = PKLogFacilityTypeGetObject(9LL);
    __int16 v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412290;
      *(void *)&uint8_t buf[4] = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Cannot process operaiton error %@ with a nil database identifier",  buf,  0xCu);
    }

    id v17 = v48;
    if (v48)
    {
      v48[2](v48, 0LL, 0LL);
LABEL_29:
      id v17 = v48;
    }
  }

  else if (v16)
  {
    (*((void (**)(id, uint64_t, void))v16 + 2))(v16, 1LL, 0LL);
  }
}

- (void)fetchRecordsWithRecordIDsByDatabaseIdentifier:(id)a3 operationGroupName:(id)a4 operationGroupNameSuffix:(id)a5 qualityOfService:(int64_t)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  uint64_t Object = PKLogFacilityTypeGetObject(9LL);
  id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138412546;
    id v27 = v12;
    __int16 v28 = 2114;
    id v29 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Fetching records with recordIDs: %@, suffix %{public}@",  buf,  0x16u);
  }

  if ([v12 count])
  {
    workQueue = self->_workQueue;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_10018EBC0;
    v19[3] = &unk_10063DA98;
    id v20 = v12;
    id v21 = v13;
    int64_t v25 = a6;
    id v22 = v14;
    uint64_t v23 = self;
    id v24 = v15;
    dispatch_async((dispatch_queue_t)workQueue, v19);
  }

  else if (v15)
  {
    (*((void (**)(id, void, void))v15 + 2))(v15, 0LL, 0LL);
  }
}

- (void)allItemsOfItemType:(unint64_t)a3 storeLocally:(BOOL)a4 completion:(id)a5
{
  id v8 = a5;
  workQueue = self->_workQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10018FA60;
  v11[3] = &unk_10063C478;
  v11[4] = self;
  id v12 = v8;
  unint64_t v13 = a3;
  BOOL v14 = a4;
  id v10 = v8;
  dispatch_async((dispatch_queue_t)workQueue, v11);
}

- (void)applePayContainerItemsFromDate:(id)a3 toDate:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  workQueue = self->_workQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100190560;
  v15[3] = &unk_10063CD10;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v9;
  id v13 = v8;
  id v14 = v10;
  dispatch_async((dispatch_queue_t)workQueue, v15);
}

- (void)removeAllItems:(unint64_t)a3 inZoneName:(id)a4 storeLocally:(BOOL)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100190FF0;
  block[3] = &unk_100648900;
  id v17 = v11;
  unint64_t v18 = a3;
  void block[4] = self;
  id v16 = v10;
  BOOL v19 = a5;
  id v13 = v10;
  id v14 = v11;
  dispatch_async((dispatch_queue_t)workQueue, block);
}

- (void)itemOfItemTypeFromAllZones:(unint64_t)a3 recordName:(id)a4 qualityOfService:(int64_t)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100191D88;
  block[3] = &unk_100648928;
  void block[4] = self;
  id v16 = v10;
  id v17 = v11;
  unint64_t v18 = a3;
  int64_t v19 = a5;
  id v13 = v10;
  id v14 = v11;
  dispatch_async((dispatch_queue_t)workQueue, block);
}

- (void)cloudStoreRecordArrayWithConfiguration:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void (**)(void, void, void))v7;
  if (v6)
  {
    id v13 = v6;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v13, 1LL));
    -[PDCloudStoreContainer fetchItemsWithQueryConfigurations:returnRecords:storeRecords:groupName:groupSuffix:completion:]( self,  "fetchItemsWithQueryConfigurations:returnRecords:storeRecords:groupName:groupSuffix:completion:",  v9,  1LL,  0LL,  PKCloudStoreOperationGroupUserActionImplicit,  0LL,  v8);
LABEL_7:

    goto LABEL_8;
  }

  if (v7)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(9LL);
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v12 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "There is no query configuration defined",  v12,  2u);
    }

    id v9 = (void *)objc_claimAutoreleasedReturnValue( -[PDCloudStoreContainer errorWithCode:description:]( self,  "errorWithCode:description:",  -4010LL,  @"There is no query configuration defined"));
    ((void (**)(void, void, void *))v8)[2](v8, 0LL, v9);
    goto LABEL_7;
  }

- (void)fetchItemsWithQueryConfigurations:(id)a3 returnRecords:(BOOL)a4 storeRecords:(BOOL)a5 groupName:(id)a6 groupSuffix:(id)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  workQueue = self->_workQueue;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_1001922F4;
  v23[3] = &unk_100648950;
  id v26 = v16;
  id v27 = v17;
  v23[4] = self;
  id v24 = v14;
  BOOL v28 = a5;
  BOOL v29 = a4;
  id v25 = v15;
  id v19 = v16;
  id v20 = v15;
  id v21 = v14;
  id v22 = v17;
  dispatch_async((dispatch_queue_t)workQueue, v23);
}

- (void)itemOfItemType:(unint64_t)a3 recordName:(id)a4 qualityOfService:(int64_t)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100192A08;
  block[3] = &unk_100648928;
  void block[4] = self;
  id v16 = v10;
  id v17 = v11;
  unint64_t v18 = a3;
  int64_t v19 = a5;
  id v13 = v10;
  id v14 = v11;
  dispatch_async((dispatch_queue_t)workQueue, block);
}

- (void)removeItems:(id)a3 groupName:(id)a4 groupNameSuffix:(id)a5 qualityOfService:(int64_t)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  workQueue = self->_workQueue;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_100193164;
  v21[3] = &unk_100647EF8;
  v21[4] = self;
  id v22 = v12;
  id v25 = v15;
  int64_t v26 = a6;
  id v23 = v13;
  id v24 = v14;
  id v17 = v14;
  id v18 = v13;
  id v19 = v12;
  id v20 = v15;
  dispatch_async((dispatch_queue_t)workQueue, v21);
}

- (void)removeRecordWithRecordName:(id)a3 zoneName:(id)a4 groupName:(id)a5 groupNameSuffix:(id)a6 qualityOfService:(int64_t)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v51 = a5;
  id v16 = a6;
  id v17 = a8;
  unint64_t nextExpectedState = self->_nextExpectedState;
  if (nextExpectedState == 15)
  {
    id v19 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainerManager databaseForScope:](self->_containerManager, "databaseForScope:", 2LL));
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 zoneForZoneName:v15]);
    id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 zoneID]);

    uint64_t v22 = objc_claimAutoreleasedReturnValue( -[PDCloudStoreContainerManager cloudStoreZoneForZoneID:inContainerDatabase:]( self->_containerManager,  "cloudStoreZoneForZoneID:inContainerDatabase:",  v21,  v19));
    if (v22)
    {
      id v23 = (void *)v22;
      id v49 = (void (**)(void, void))v17;
      id v24 = v19;
    }

    else
    {
      id v24 = (void *)objc_claimAutoreleasedReturnValue( -[PDCloudStoreContainerManager databaseForScope:]( self->_containerManager,  "databaseForScope:",  3LL));

      uint64_t v29 = objc_claimAutoreleasedReturnValue( -[PDCloudStoreContainerManager cloudStoreZoneForZoneID:inContainerDatabase:]( self->_containerManager,  "cloudStoreZoneForZoneID:inContainerDatabase:",  v21,  v24));
      if (!v29)
      {
        id v50 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"A zone does not exist with name %@",  v15));
        uint64_t Object = PKLogFacilityTypeGetObject(9LL);
        id v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__int128 buf = 138412290;
          id v58 = v50;
          _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
        }

        if (!v17) {
          goto LABEL_19;
        }
        unsigned int v44 = (void *)objc_claimAutoreleasedReturnValue( -[PDCloudStoreContainer _cannotPerformActionErrorWithFailureReason:]( self,  "_cannotPerformActionErrorWithFailureReason:",  v50));
        (*((void (**)(id, void *))v17 + 2))(v17, v44);
LABEL_18:

LABEL_19:
        goto LABEL_20;
      }

      id v23 = (void *)v29;
      id v49 = (void (**)(void, void))v17;
    }

    id v30 = v23;
    id v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v23));
    id v32 = (void *)objc_claimAutoreleasedReturnValue( -[PDCloudStoreContainer filterCloudStoreZones:action:inContainerDatabase:]( self,  "filterCloudStoreZones:action:inContainerDatabase:",  v31,  3LL,  v24));

    id v48 = v32;
    id v50 = v30;
    if ([v32 count])
    {
      unsigned int v33 = objc_alloc(&OBJC_CLASS___CKRecordID);
      id v34 = v14;
      v35 = (void *)objc_claimAutoreleasedReturnValue([v30 recordZone]);
      id v47 = v15;
      id v36 = (void *)objc_claimAutoreleasedReturnValue([v35 zoneID]);
      id v37 = -[CKRecordID initWithRecordName:zoneID:](v33, "initWithRecordName:zoneID:", v34, v36);

      id v38 = -[PDCloudStoreRecordsRequest initWithRequestType:storeChanges:returnRecords:qualityOfService:groupName:groupNameSuffix:]( objc_alloc(&OBJC_CLASS___PDCloudStoreRecordsRequest),  "initWithRequestType:storeChanges:returnRecords:qualityOfService:groupName:groupNameSuffix:",  6LL,  0LL,  0LL,  a7,  v51,  v16);
      id v39 = (void *)objc_claimAutoreleasedReturnValue([v24 identifier]);
      id v55 = v39;
      uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v37));
      id v56 = v40;
      v41 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v56,  &v55,  1LL));
      -[PDCloudStoreRecordsRequest setRecordIDsByDatabaseIdentifier:](v38, "setRecordIDsByDatabaseIdentifier:", v41);

      id v15 = v47;
      id v14 = v34;
      v52[0] = _NSConcreteStackBlock;
      v52[1] = 3221225472LL;
      v52[2] = sub_100193F10;
      v52[3] = &unk_100648978;
      id v53 = v34;
      id v17 = v49;
      id v54 = v49;
      -[PDCloudStoreContainer executeRecordsRequest:completion:](self, "executeRecordsRequest:completion:", v38, v52);
    }

    else
    {
      uint64_t v42 = PKLogFacilityTypeGetObject(9LL);
      v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 138412290;
        id v58 = v15;
        _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_DEFAULT,  "You do not have permission to remove items from zone %@",  buf,  0xCu);
      }

      id v17 = v49;
      if (!v49) {
        goto LABEL_17;
      }
      id v37 = (CKRecordID *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"You do not have permission to remove items from zone %@",  v15));
      id v38 = (PDCloudStoreRecordsRequest *)objc_claimAutoreleasedReturnValue( -[PDCloudStoreContainer errorWithCode:description:]( self,  "errorWithCode:description:",  -4004LL,  v37));
      ((void (**)(void, PDCloudStoreRecordsRequest *))v49)[2](v49, v38);
    }

LABEL_17:
    unsigned int v44 = v48;
    goto LABEL_18;
  }

  id v25 = PDCloudStoreContainerStateToString(nextExpectedState);
  int64_t v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
  id v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Cannot peform %s: when the container is in state: %@",  "-[PDCloudStoreContainer removeRecordWithRecordName:zoneName:groupName:groupNameSuffix:qualityOfService:completion:]",  v26));

  uint64_t v27 = PKLogFacilityTypeGetObject(9LL);
  BOOL v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138412290;
    id v58 = v24;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }

  if (v17)
  {
    id v21 = (void *)objc_claimAutoreleasedReturnValue( -[PDCloudStoreContainer _cannotPerformActionErrorWithFailureReason:]( self,  "_cannotPerformActionErrorWithFailureReason:",  v24));
    (*((void (**)(id, void *))v17 + 2))(v17, v21);
LABEL_20:
  }
}

- (void)resetContainerWithZoneNames:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001940E4;
  block[3] = &unk_100639AF0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)workQueue, block);
}

- (void)resetContainerWithAdditionalZoneIDsByDatabaseIdentifiers:(id)a3 includedCachedZoneForDatabaseIdentifiers:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  -[PDCloudStoreContainer willResetContainerWithAdditionalZoneIDsByDatabaseIdentifiers:includedCachedZoneForDatabaseIdentifiers:]( self,  "willResetContainerWithAdditionalZoneIDsByDatabaseIdentifiers:includedCachedZoneForDatabaseIdentifiers:",  v10,  v9);
  id v11 = -[PDCloudStoreResetRequest initWithCompletion:]( objc_alloc(&OBJC_CLASS___PDCloudStoreResetRequest),  "initWithCompletion:",  v8);

  -[PDCloudStoreResetRequest setIncludeCachedZonesForDatabaseIdentifiers:]( v11,  "setIncludeCachedZonesForDatabaseIdentifiers:",  v9);
  -[PDCloudStoreResetRequest setAdditionalZoneIDsByDatabaseIdentifier:]( v11,  "setAdditionalZoneIDsByDatabaseIdentifier:",  v10);

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1001943D8;
  v12[3] = &unk_10063AFC0;
  v12[4] = self;
  -[PDCloudStoreContainer executeResetRequest:completion:](self, "executeResetRequest:completion:", v11, v12);
}

- (void)executeResetRequest:(id)a3 completion:(id)a4
{
  id v5 = a3;
  uint64_t Object = PKLogFacilityTypeGetObject(9LL);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138412290;
    id v14 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Container reset request incoming %@", buf, 0xCu);
  }

  workQueue = self->_workQueue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1001944F4;
  v10[3] = &unk_1006392B0;
  id v11 = v5;
  id v12 = self;
  id v9 = v5;
  dispatch_async((dispatch_queue_t)workQueue, v10);
}

- (void)_executeNextResetRequestIfPossible
{
  if (!self->_currentResetRequest)
  {
    unint64_t v3 = (PDCloudStoreResetRequest *)objc_claimAutoreleasedReturnValue(-[NSMutableOrderedSet firstObject](self->_resetRequests, "firstObject"));
    currentResetRequest = self->_currentResetRequest;
    self->_currentResetRequest = v3;

    if (self->_currentResetRequest)
    {
      -[NSMutableOrderedSet removeObjectAtIndex:](self->_resetRequests, "removeObjectAtIndex:", 0LL);
      id v5 = self->_currentResetRequest;
      if (v5)
      {
        id v6 = v5;
        uint64_t Object = PKLogFacilityTypeGetObject(9LL);
        id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__int128 buf = 138412290;
          id v14 = v6;
          _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Container reset request starting %@",  buf,  0xCu);
        }

        uint64_t v9 = PKCloudStoreOperationGroupSuffixUnrecoverableError;
        v11[0] = _NSConcreteStackBlock;
        v11[1] = 3221225472LL;
        v11[2] = sub_100194840;
        v11[3] = &unk_1006489C0;
        v11[4] = self;
        id v12 = v6;
        id v10 = v6;
        -[PDCloudStoreContainer _deleteZonesAndSubscriptionsWithResetRequest:operationGroupNameSuffix:completion:]( self,  "_deleteZonesAndSubscriptionsWithResetRequest:operationGroupNameSuffix:completion:",  v10,  v9,  v11);
      }
    }
  }

- (void)deleteZone:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void (**)(void, void, void))v7;
  if (v6)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(9LL);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412290;
      id v29 = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Deleteing zone: %@", buf, 0xCu);
    }

    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainerManager databaseForScope:](self->_containerManager, "databaseForScope:", 2LL));
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 identifier]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 zoneForZoneName:v6]);
    id v14 = v13;
    if (v11 && v13)
    {
      int64_t v26 = v12;
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v13 zoneID]);
      id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v15));
      uint64_t v27 = v16;
      id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v27,  &v26,  1LL));
      uint64_t v18 = PKCloudStoreOperationGroupSuffixPassutil;
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472LL;
      v21[2] = sub_100194CC8;
      v21[3] = &unk_1006489E8;
      id v22 = v12;
      id v23 = v14;
      id v24 = self;
      id v25 = v8;
      -[PDCloudStoreContainer _zoneOperationWithZonesToSaveByDatabaseIdentifier:recordZoneIDsToDeleteByDatabaseIdentifier:operationGroupNameSuffix:completion:]( self,  "_zoneOperationWithZonesToSaveByDatabaseIdentifier:recordZoneIDsToDeleteByDatabaseIdentifier:operationGroupNameSu ffix:completion:",  0LL,  v17,  v18,  v21);

      id v19 = v22;
    }

    else
    {
      if (!v8)
      {
LABEL_12:

        goto LABEL_13;
      }

      id v19 = (void *)objc_claimAutoreleasedReturnValue( -[PDCloudStoreContainer errorWithCode:description:]( self,  "errorWithCode:description:",  -4000LL,  @"Cannot remove a nil zone or nil database container"));
      ((void (**)(void, void, void *))v8)[2](v8, 0LL, v19);
    }

    goto LABEL_12;
  }

  if (v7)
  {
    id v20 = (void *)objc_claimAutoreleasedReturnValue( -[PDCloudStoreContainer errorWithCode:description:]( self,  "errorWithCode:description:",  -4000LL,  @"Cannot remove a zone with a nil zone name"));
    ((void (**)(void, void, void *))v8)[2](v8, 0LL, v20);
  }

- (void)createZone:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001951B8;
  block[3] = &unk_100639AF0;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)workQueue, block);
}

- (void)ensureZoneShareIntegrity
{
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100195418;
  block[3] = &unk_100639300;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)workQueue, block);
}

- (void)acceptShareInvitation:(id)a3 operationGroupName:(id)a4 operationGroupNameSuffix:(id)a5 qualityOfService:(int64_t)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  workQueue = self->_workQueue;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_100195528;
  v21[3] = &unk_100647EF8;
  id v22 = v12;
  id v23 = self;
  id v24 = v13;
  id v25 = v14;
  id v26 = v15;
  int64_t v27 = a6;
  id v17 = v14;
  id v18 = v13;
  id v19 = v15;
  id v20 = v12;
  dispatch_async((dispatch_queue_t)workQueue, v21);
}

- (void)fetchRecordsInAcceptedZoneShare:(id)a3 databaseIdentifier:(id)a4 operationGroupName:(id)a5 operationGroupNameSuffix:(id)a6 qualityOfService:(int64_t)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  uint64_t Object = PKLogFacilityTypeGetObject(9LL);
  id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    id v21 = (void *)objc_claimAutoreleasedReturnValue([v14 zoneName]);
    *(_DWORD *)__int128 buf = 138412290;
    id v32 = v21;
    _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Fetching records in newly shared zone %@",  buf,  0xCu);
  }

  id v22 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer containerManager](self, "containerManager"));
  id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 databaseForIdentifier:v15]);

  id v24 = -[PDCloudStoreRecordsRequest initWithRequestType:storeChanges:returnRecords:qualityOfService:groupName:groupNameSuffix:]( objc_alloc(&OBJC_CLASS___PDCloudStoreRecordsRequest),  "initWithRequestType:storeChanges:returnRecords:qualityOfService:groupName:groupNameSuffix:",  0LL,  1LL,  0LL,  a7,  v16,  v17);
  -[PDCloudStoreRecordsRequest setCloudStoreZone:](v24, "setCloudStoreZone:", v14);
  -[PDCloudStoreRecordsRequest setUseLastChangeToken:](v24, "setUseLastChangeToken:", 0LL);
  -[PDCloudStoreRecordsRequest setShouldSaveToken:](v24, "setShouldSaveToken:", 1LL);
  -[PDCloudStoreRecordsRequest setContainerDatabase:](v24, "setContainerDatabase:", v23);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_1001963F0;
  v27[3] = &unk_100648AD8;
  id v29 = self;
  id v30 = v18;
  id v28 = v14;
  id v25 = v14;
  id v26 = v18;
  -[PDCloudStoreContainer executeRecordsRequest:completion:](self, "executeRecordsRequest:completion:", v24, v27);
}

- (void)declineInvitationForRecipientHandle:(id)a3 zoneName:(id)a4 operationGroupName:(id)a5 operationGroupNameSuffix:(id)a6 qualityOfService:(int64_t)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100196578;
  block[3] = &unk_100648B78;
  void block[4] = self;
  id v26 = v15;
  id v27 = v14;
  id v28 = v16;
  id v29 = v17;
  id v30 = v18;
  int64_t v31 = a7;
  id v20 = v18;
  id v21 = v17;
  id v22 = v16;
  id v23 = v14;
  id v24 = v15;
  dispatch_async((dispatch_queue_t)workQueue, block);
}

- (void)shareForZoneName:(id)a3 operationGroupName:(id)a4 operationGroupNameSuffix:(id)a5 qualityOfService:(int64_t)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  workQueue = self->_workQueue;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_100196F20;
  v21[3] = &unk_100648BC8;
  void v21[4] = self;
  id v22 = v12;
  id v23 = v13;
  id v24 = v14;
  id v25 = v15;
  int64_t v26 = a6;
  id v17 = v14;
  id v18 = v13;
  id v19 = v15;
  id v20 = v12;
  dispatch_async((dispatch_queue_t)workQueue, v21);
}

- (void)createShareInvitationForRecipientHandle:(id)a3 zoneName:(id)a4 permission:(int64_t)a5 operationGroupName:(id)a6 operationGroupNameSuffix:(id)a7 qualityOfService:(int64_t)a8 completion:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  id v18 = a7;
  id v19 = a9;
  workQueue = self->_workQueue;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_100197454;
  v26[3] = &unk_100649028;
  v26[4] = self;
  id v27 = v16;
  id v28 = v15;
  id v29 = v18;
  id v30 = v17;
  id v31 = v19;
  int64_t v32 = a5;
  int64_t v33 = a8;
  id v21 = v17;
  id v22 = v18;
  id v23 = v15;
  id v24 = v19;
  id v25 = v16;
  dispatch_async((dispatch_queue_t)workQueue, v26);
}

- (void)_queue_lockShareCreationForRecipientHandle:(id)a3 cloudStoreZone:(id)a4 operationGroupName:(id)a5 operationGroupNameSuffix:(id)a6 qualityOfService:(int64_t)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  if (!v15)
  {
    id v38 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"A cloud store zone is not defined"));
    uint64_t Object = PKLogFacilityTypeGetObject(9LL);
    v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (!os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    *(_DWORD *)__int128 buf = 138412290;
    id v68 = v38;
    goto LABEL_10;
  }

  if ([v15 scope] == (id)2)
  {
    id v43 = v17;
    id v44 = v14;
    unsigned int v45 = v16;
    id v19 = objc_alloc(&OBJC_CLASS___PKCloudStoreZoneShareLock);
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v15 zoneName]);
    id v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    id v22 = (void *)objc_claimAutoreleasedReturnValue( +[PKSecureElement primarySecureElementIdentifier]( &OBJC_CLASS___PKSecureElement,  "primarySecureElementIdentifier"));
    uint64_t v23 = PKDeviceName();
    id v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    id v25 = [v19 initWithZoneName:v20 creationDate:v21 originDeviceIdentifier:v22 originDeviceName:v24];

    uint64_t v26 = PKLogFacilityTypeGetObject(9LL);
    id v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412546;
      id v68 = v44;
      __int16 v69 = 2112;
      id v70 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "Checking if share lock can be created for %@, %@",  buf,  0x16u);
    }

    v63[0] = _NSConcreteStackBlock;
    v63[1] = 3221225472LL;
    v63[2] = sub_10019A360;
    v63[3] = &unk_100649050;
    id v28 = v25;
    id v64 = v28;
    id v65 = self;
    id v66 = v18;
    id v29 = objc_retainBlock(v63);
    v57[0] = _NSConcreteStackBlock;
    v57[1] = 3221225472LL;
    v57[2] = sub_10019A4E8;
    v57[3] = &unk_100649078;
    id v58 = v15;
    id v59 = self;
    id v30 = v45;
    id v60 = v30;
    id v31 = v17;
    id v61 = v31;
    int64_t v62 = a7;
    int64_t v32 = objc_retainBlock(v57);
    v51[0] = _NSConcreteStackBlock;
    v51[1] = 3221225472LL;
    v51[2] = sub_10019A6FC;
    v51[3] = &unk_1006490C8;
    v51[4] = self;
    id v52 = v30;
    id v55 = v32;
    int64_t v56 = a7;
    id v53 = v31;
    id v33 = v28;
    id v54 = v33;
    id v34 = v32;
    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472LL;
    v46[2] = sub_10019A848;
    v46[3] = &unk_100649118;
    id v49 = objc_retainBlock(v51);
    id v50 = v29;
    id v47 = v33;
    id v48 = self;
    v35 = (void (*)(void *, id, void *))v34[2];
    id v36 = v29;
    id v37 = v49;
    id v38 = v33;
    v35(v34, v38, v46);
    id v17 = v43;

    id v16 = v45;
    id v39 = v64;
    id v14 = v44;
    goto LABEL_13;
  }

  id v38 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Cannot create a share lock for a shared zone %@",  v15));
  uint64_t v42 = PKLogFacilityTypeGetObject(9LL);
  v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138412290;
    id v68 = v38;
LABEL_10:
    _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }

- (void)cloudStoreZoneInvitationDataForInvitation:(id)a3 toRecipient:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  workQueue = self->_workQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10019AEBC;
  v15[3] = &unk_10063B440;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async((dispatch_queue_t)workQueue, v15);
}

- (void)_queue_cloudStoreZoneInvitationDataForInvitation:(id)a3 toRecipient:(id)a4 completion:(id)a5
{
  if (a5) {
    (*((void (**)(id, void, void, void))a5 + 2))(a5, 0LL, 0LL, 0LL);
  }
}

- (void)_queue_aliasesForRecipientHandle:(id)a3 zoneName:(id)a4 completion:(id)a5
{
  if (a5) {
    (*((void (**)(id, void))a5 + 2))(a5, 0LL);
  }
}

- (void)removedFromCloudStoreZoneInvitation:(id)a3 fromHandle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t Object = PKLogFacilityTypeGetObject(9LL);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 138412546;
    id v20 = v6;
    __int16 v21 = 2112;
    id v22 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Attempting to remove the cached cloud store zone in response to a zone share removal. %@ From Handle %@",  (uint8_t *)&v19,  0x16u);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainerManager databaseForScope:](self->_containerManager, "databaseForScope:", 3LL));
  containerManager = self->_containerManager;
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 zoneName]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue( -[PDCloudStoreContainerManager cloudStoreZoneForZoneName:inContainerDatabase:]( containerManager,  "cloudStoreZoneForZoneName:inContainerDatabase:",  v12,  v10));

  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 138412290;
    id v20 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Zone being shared that will be removed %@",  (uint8_t *)&v19,  0xCu);
  }

  if (v13)
  {
    id v14 = self->_containerManager;
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v13 recordZone]);
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 zoneID]);
    id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v17));
    -[PDCloudStoreContainerManager containerDatabaseIdentifier:didRemoveZoneIDs:]( v14,  "containerDatabaseIdentifier:didRemoveZoneIDs:",  v15,  v18);
  }
}

- (void)_updateShare:(id)a3 cloudStoreZone:(id)a4 operationGroupName:(id)a5 operationGroupNameSuffix:(id)a6 qualityOfService:(int64_t)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  if (!v15)
  {
    id v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"A cloud store zone is not defined"));
    uint64_t Object = PKLogFacilityTypeGetObject(9LL);
    id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_10;
    }
    *(_DWORD *)__int128 buf = 138412290;
    id v49 = v22;
    goto LABEL_9;
  }

  if (v14)
  {
    int v19 = (void *)objc_claimAutoreleasedReturnValue([v14 debugDescription]);
    if (v19)
    {
      id v20 = (void *)objc_claimAutoreleasedReturnValue([v14 debugDescription]);
      id v47 = v20;
      uint64_t v21 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v47, 1LL));
    }

    else
    {
      uint64_t v21 = 0LL;
    }

    id v38 = (void *)v21;

    id v27 = (void *)objc_claimAutoreleasedReturnValue([v15 zoneName]);
    id v37 = (void *)objc_claimAutoreleasedReturnValue( -[PDCloudStoreContainer reportContainerChangeIntervalBeginEventWithType:stateName:objectNames:operationGroupName:operationGroupNameSuffix:]( self,  "reportContainerChangeIntervalBeginEventWithType:stateName:objectNames:operationGroupName:operation GroupNameSuffix:",  27LL,  v27,  v21,  v16,  v17));

    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainerManager databaseForScope:](self->_containerManager, "databaseForScope:", 2LL));
    id v28 = -[PDCloudStoreRecordsRequest initWithRequestType:storeChanges:returnRecords:qualityOfService:groupName:groupNameSuffix:]( objc_alloc(&OBJC_CLASS___PDCloudStoreRecordsRequest),  "initWithRequestType:storeChanges:returnRecords:qualityOfService:groupName:groupNameSuffix:",  6LL,  1LL,  1LL,  a7,  v16,  v17);
    -[PDCloudStoreRecordsRequest setIsModifyingShare:](v28, "setIsModifyingShare:", 1LL);
    id v29 = self;
    id v30 = v16;
    id v31 = (void *)objc_claimAutoreleasedReturnValue([v26 identifier]);
    unsigned int v45 = v31;
    id v32 = v17;
    id v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v14));
    id v46 = v33;
    id v39 = v15;
    id v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v46,  &v45,  1LL));
    -[PDCloudStoreRecordsRequest setRecordsToSaveByDatabaseIdentifier:]( v28,  "setRecordsToSaveByDatabaseIdentifier:",  v34);

    id v17 = v32;
    id v16 = v30;
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472LL;
    v40[2] = sub_10019B4A0;
    v40[3] = &unk_10063DB38;
    id v41 = v14;
    uint64_t v42 = v29;
    id v43 = v37;
    id v44 = v18;
    id v35 = v37;
    id v36 = v29;
    id v22 = v38;
    -[PDCloudStoreContainer executeRecordsRequest:completion:](v36, "executeRecordsRequest:completion:", v28, v40);

    id v15 = v39;
    goto LABEL_14;
  }

  id v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"A share is not defined."));
  uint64_t v25 = PKLogFacilityTypeGetObject(9LL);
  id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138412290;
    id v49 = v22;
LABEL_9:
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }

- (void)_shareMetadataWithInvitationTokensByShareURL:(id)a3 operationGroupName:(id)a4 operationGroupNameSuffix:(id)a5 qualityOfService:(int64_t)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  workQueue = self->_workQueue;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_10019B7CC;
  v21[3] = &unk_10063DA98;
  id v22 = v12;
  id v23 = v13;
  id v24 = v14;
  uint64_t v25 = self;
  id v26 = v15;
  int64_t v27 = a6;
  id v17 = v15;
  id v18 = v14;
  id v19 = v13;
  id v20 = v12;
  dispatch_async((dispatch_queue_t)workQueue, v21);
}

- (void)_fetchParticipantWithRecipientHandle:(id)a3 cloudStoreZone:(id)a4 operationGroupName:(id)a5 operationGroupNameSuffix:(id)a6 qualityOfService:(int64_t)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10019BE28;
  block[3] = &unk_1006491D0;
  id v26 = v15;
  int64_t v27 = self;
  id v28 = v14;
  id v29 = v16;
  id v30 = v17;
  id v31 = v18;
  int64_t v32 = a7;
  id v20 = v17;
  id v21 = v16;
  id v22 = v14;
  id v23 = v18;
  id v24 = v15;
  dispatch_async((dispatch_queue_t)workQueue, block);
}

- (void)_zoneWideShareForCloudStoreZone:(id)a3 createIfNotExists:(BOOL)a4 operationGroupName:(id)a5 operationGroupNameSuffix:(id)a6 qualityOfService:(int64_t)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a8;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10019C510;
  block[3] = &unk_100649298;
  id v24 = v14;
  uint64_t v25 = self;
  id v26 = v15;
  id v27 = v16;
  id v28 = v17;
  int64_t v29 = a7;
  BOOL v30 = a4;
  id v19 = v16;
  id v20 = v15;
  id v21 = v17;
  id v22 = v14;
  dispatch_async((dispatch_queue_t)workQueue, block);
}

- (BOOL)supportsContainerChangeEventReports
{
  return 0;
}

- (id)reportContainerChangeIntervalBeginEventWithType:(unint64_t)a3 stateName:(id)a4 objectNames:(id)a5 operationGroupName:(id)a6 operationGroupNameSuffix:(id)a7
{
  return -[PDCloudStoreContainer reportContainerChangeIntervalBeginEventWithType:stateName:objectNames:changeToken:operationGroupName:operationGroupNameSuffix:]( self,  "reportContainerChangeIntervalBeginEventWithType:stateName:objectNames:changeToken:operationGroupName:operatio nGroupNameSuffix:",  a3,  a4,  a5,  0LL,  a6,  a7);
}

- (id)reportContainerChangeIntervalBeginEventWithType:(unint64_t)a3 stateName:(id)a4 objectNames:(id)a5 changeToken:(id)a6 operationGroupName:(id)a7 operationGroupNameSuffix:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer containerManager](self, "containerManager"));
  id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 containerName]);

  id v21 = (void *)objc_claimAutoreleasedReturnValue( +[PKCloudStoreContainerChangeEvent intervalBeginEventWithType:containerIdentifier:stateName:objectNames:error:changeToken:operationGroupName:operationGroupNameSuffix:]( &OBJC_CLASS___PKCloudStoreContainerChangeEvent,  "intervalBeginEventWithType:containerIdentifier:stateName:objectNames:error:changeToken:operationGrou pName:operationGroupNameSuffix:",  a3,  v20,  v18,  v17,  0LL,  v16,  v15,  v14));
  id v22 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer reportContainerChangeEvent:](self, "reportContainerChangeEvent:", v21));

  return v22;
}

- (void)reportContainerChangeIntervalEndEventWithBeginUniqueIdentifier:(id)a3 error:(id)a4
{
  id v6 = (id)objc_claimAutoreleasedReturnValue( +[PKCloudStoreContainerChangeEvent intervalEndEventWithBeginUniqueIdentifier:error:]( &OBJC_CLASS___PKCloudStoreContainerChangeEvent,  "intervalEndEventWithBeginUniqueIdentifier:error:",  a3,  a4));
  id v5 = -[PDCloudStoreContainer reportContainerChangeEvent:](self, "reportContainerChangeEvent:", v6);
}

- (void)reportContainerChangeSignpostEventType:(unint64_t)a3 stateName:(id)a4 objectNames:(id)a5 changeToken:(id)a6 error:(id)a7 operationGroupName:(id)a8 operationGroupNameSuffix:(id)a9
{
  id v16 = a9;
  id v17 = a8;
  id v18 = a7;
  id v19 = a6;
  id v20 = a5;
  id v21 = a4;
  id v22 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer containerManager](self, "containerManager"));
  id v25 = (id)objc_claimAutoreleasedReturnValue([v22 containerName]);

  id v23 = (void *)objc_claimAutoreleasedReturnValue( +[PKCloudStoreContainerChangeEvent signpostEventWithType:containerIdentifier:stateName:objectNames:error:changeToken:operationGroupName:operationGroupNameSuffix:]( &OBJC_CLASS___PKCloudStoreContainerChangeEvent,  "signpostEventWithType:containerIdentifier:stateName:objectNames:error:changeToken:operationGroupName :operationGroupNameSuffix:",  a3,  v25,  v21,  v20,  v18,  v19,  v17,  v16));
  id v24 = -[PDCloudStoreContainer reportContainerChangeEvent:](self, "reportContainerChangeEvent:", v23);
}

- (id)reportContainerChangeEvent:(id)a3
{
  id v4 = a3;
  if (v4 && -[PDCloudStoreContainer supportsContainerChangeEventReports](self, "supportsContainerChangeEventReports"))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    [WeakRetained addCloudStoreContainerChangeEvent:v4];

    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

- (void)modifyRecordsOperationWithRecordsToSaveByDatabaseIdentifier:(id)a3 recordIDsToDeleteByDatabaseIdentifier:(id)a4 recordModificationOperationConfiguration:(id)a5 emitErrorIfConflictDetected:(BOOL)a6 isModifyingShare:(BOOL)a7 operationGroupName:(id)a8 operationGroupNameSuffix:(id)a9 qualityOfService:(int64_t)a10 completion:(id)a11
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a8;
  id v20 = a9;
  id v21 = a11;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10019D2B8;
  block[3] = &unk_100649468;
  id v31 = v16;
  id v32 = v17;
  id v33 = self;
  id v34 = v19;
  id v35 = v20;
  id v36 = v18;
  BOOL v39 = a6;
  BOOL v40 = a7;
  id v37 = v21;
  int64_t v38 = a10;
  id v23 = v21;
  id v24 = v18;
  id v25 = v20;
  id v26 = v19;
  id v27 = v17;
  id v28 = v16;
  dispatch_async((dispatch_queue_t)workQueue, block);
}

- (void)fetchRecordsWithQuery:(id)a3 batchLimit:(int64_t)a4 operationGroupName:(id)a5 operationGroupNameSuffix:(id)a6 qualityOfService:(int64_t)a7 zone:(id)a8 containerDatabase:(id)a9 batchHandler:(id)a10 completion:(id)a11
{
}

- (void)_fetchRecordsWithQuery:(id)a3 cursor:(id)a4 batchLimit:(int64_t)a5 operationGroupName:(id)a6 operationGroupNameSuffix:(id)a7 qualityOfService:(int64_t)a8 zone:(id)a9 containerDatabase:(id)a10 batchHandler:(id)a11 completion:(id)a12
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a6;
  id v20 = a7;
  id v21 = a9;
  id v22 = a10;
  id v23 = a11;
  id v24 = a12;
  if (v23)
  {
    if (v21)
    {
      id v37 = v20;
      if (v22)
      {
        queue = (dispatch_queue_s *)self->_workQueue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_10019F2C8;
        block[3] = &unk_100649530;
        int64_t v49 = a5;
        id v40 = v19;
        int64_t v50 = a8;
        id v41 = v21;
        id v42 = v18;
        id v43 = v17;
        id v47 = v24;
        id v44 = self;
        id v45 = v20;
        id v46 = v22;
        id v48 = v23;
        dispatch_async(queue, block);
      }

      else
      {
        id v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"No database defined for query request with zone %@. Not preforming query.",  v21));
        uint64_t Object = PKLogFacilityTypeGetObject(9LL);
        id v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__int128 buf = 138412290;
          id v52 = v32;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
        }

        if (v24)
        {
          id v35 = (void *)objc_claimAutoreleasedReturnValue( -[PDCloudStoreContainer _cannotPerformActionErrorWithFailureReason:]( self,  "_cannotPerformActionErrorWithFailureReason:",  v32));
          (*((void (**)(id, void *))v24 + 2))(v24, v35);
        }

        id v20 = v37;
      }
    }

    else
    {
      id v27 = v20;
      id v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"No zone for query reques %@. Not preforming query.",  v17));
      uint64_t v29 = PKLogFacilityTypeGetObject(9LL);
      BOOL v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 138412290;
        id v52 = v28;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
      }

      if (v24)
      {
        id v31 = (void *)objc_claimAutoreleasedReturnValue( -[PDCloudStoreContainer _cannotPerformActionErrorWithFailureReason:]( self,  "_cannotPerformActionErrorWithFailureReason:",  v28));
        (*((void (**)(id, void *))v24 + 2))(v24, v31);
      }

      id v20 = v27;
    }
  }

  else
  {
    uint64_t v25 = PKLogFacilityTypeGetObject(9LL);
    id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "No batch handler defined for query request. Not preforming query.",  buf,  2u);
    }

    if (v24) {
      (*((void (**)(id, void))v24 + 2))(v24, 0LL);
    }
  }
}

- (void)_subscriptionOperationWithSubscriptionsToSaveByDatabaseIdentifier:(id)a3 subscriptionIDsToDeleteByDatabase:(id)a4 operationGroupNameSuffix:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v10 allKeys]);
  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](&OBJC_CLASS___NSMutableSet, "setWithArray:", v14));

  id v16 = (void *)objc_claimAutoreleasedReturnValue([v11 allKeys]);
  id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v16));
  [v15 unionSet:v17];

  workQueue = self->_workQueue;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_1001A0378;
  v24[3] = &unk_10063AD70;
  id v25 = v15;
  id v26 = v10;
  id v27 = v11;
  id v28 = v12;
  uint64_t v29 = self;
  id v30 = v13;
  id v19 = v13;
  id v20 = v12;
  id v21 = v11;
  id v22 = v10;
  id v23 = v15;
  dispatch_async((dispatch_queue_t)workQueue, v24);
}

- (void)_deleteZonesAndSubscriptionsWithResetRequest:(id)a3 operationGroupNameSuffix:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v26 = a4;
  id v27 = a5;
  id v8 = objc_alloc(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v29 = v7;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 additionalZoneIDsByDatabaseIdentifier]);
  id v30 = -[NSMutableDictionary initWithDictionary:](v8, "initWithDictionary:", v9);

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 includeCachedZonesForDatabaseIdentifiers]);
  id v11 = [v10 count];
  uint64_t Object = PKLogFacilityTypeGetObject(9LL);
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  id v14 = v13;
  if (v11)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Including cached cloud store zones in database identifier %@ for deletion.",  (uint8_t *)&buf,  0xCu);
    }

    id v15 = (void *)objc_claimAutoreleasedReturnValue( -[PDCloudStoreContainerManager allPossibleZoneIDsByDatabaseIdentifier]( self->_containerManager,  "allPossibleZoneIDsByDatabaseIdentifier",  v26,  v27));
    id v16 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    id v17 = v10;
    id v18 = [v17 countByEnumeratingWithState:&v36 objects:v45 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v37;
      do
      {
        for (i = 0LL; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v37 != v19) {
            objc_enumerationMutation(v17);
          }
          uint64_t v21 = *(void *)(*((void *)&v36 + 1) + 8LL * (void)i);
          id v22 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKey:v21]);
          if ([v22 count]) {
            -[NSMutableDictionary setObject:forKey:](v16, "setObject:forKey:", v22, v21);
          }
        }

        id v18 = [v17 countByEnumeratingWithState:&v36 objects:v45 count:16];
      }

      while (v18);
    }

    -[NSMutableDictionary addEntriesFromDictionary:](v30, "addEntriesFromDictionary:", v16);
  }

  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v30;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Deleteing zones and subscriptions for zoneIDs %@",  (uint8_t *)&buf,  0xCu);
  }

  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v41 = 0x3032000000LL;
  id v42 = sub_10018664C;
  id v43 = sub_10018665C;
  id v44 = 0LL;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  v31[2] = sub_1001A116C;
  v31[3] = &unk_100649638;
  p___int128 buf = &buf;
  v31[4] = self;
  id v23 = v30;
  id v32 = v23;
  id v24 = v26;
  id v33 = v24;
  id v25 = v27;
  id v34 = v25;
  -[PDCloudStoreContainer _deleteZones:operationGroupNameSuffix:completion:]( self,  "_deleteZones:operationGroupNameSuffix:completion:",  v23,  v24,  v31);

  _Block_object_dispose(&buf, 8);
}

- (void)_deleteAllZonesWithOperationGroupNameSuffix:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[PDCloudStoreContainerManager allPossibleZoneIDsByDatabaseIdentifier]( self->_containerManager,  "allPossibleZoneIDsByDatabaseIdentifier"));
  if (![v8 count])
  {
    uint64_t Object = PKLogFacilityTypeGetObject(9LL);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "There are no zones to delete.", v11, 2u);
    }

    if (v7) {
      (*((void (**)(id, void, void))v7 + 2))(v7, 0LL, 0LL);
    }
  }

  -[PDCloudStoreContainer _deleteZones:operationGroupNameSuffix:completion:]( self,  "_deleteZones:operationGroupNameSuffix:completion:",  v8,  v6,  v7);
}

- (void)_deleteZones:(id)a3 operationGroupNameSuffix:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t Object = PKLogFacilityTypeGetObject(9LL);
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138412290;
    id v17 = v8;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Deleting zones %@", buf, 0xCu);
  }

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1001A14C8;
  v14[3] = &unk_100647F48;
  v14[4] = self;
  id v15 = v10;
  id v13 = v10;
  -[PDCloudStoreContainer _zoneOperationWithZonesToSaveByDatabaseIdentifier:recordZoneIDsToDeleteByDatabaseIdentifier:operationGroupNameSuffix:completion:]( self,  "_zoneOperationWithZonesToSaveByDatabaseIdentifier:recordZoneIDsToDeleteByDatabaseIdentifier:operationGroupNameSuffix:completion:",  0LL,  v8,  v9,  v14);
}

- (void)_deleteAllSubscriptionsWithOperationGroupNameSuffix:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[PDCloudStoreContainerManager allPossibleSubscriptionIdentifiersByDatabaseIdentifier]( self->_containerManager,  "allPossibleSubscriptionIdentifiersByDatabaseIdentifier"));
  if ([v8 count])
  {
    -[PDCloudStoreContainer _deleteSubscriptions:operationGroupNameSuffix:completion:]( self,  "_deleteSubscriptions:operationGroupNameSuffix:completion:",  v8,  v6,  v7);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(9LL);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "No zone subscriptions to delete.", v11, 2u);
    }

    if (v7) {
      (*((void (**)(id, void, void))v7 + 2))(v7, 0LL, 0LL);
    }
  }
}

- (void)_deleteSubscriptions:(id)a3 operationGroupNameSuffix:(id)a4 completion:(id)a5
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1001A1888;
  v8[3] = &unk_100647F48;
  id v9 = self;
  id v10 = a5;
  id v7 = v10;
  -[PDCloudStoreContainer _subscriptionOperationWithSubscriptionsToSaveByDatabaseIdentifier:subscriptionIDsToDeleteByDatabase:operationGroupNameSuffix:completion:]( v9,  "_subscriptionOperationWithSubscriptionsToSaveByDatabaseIdentifier:subscriptionIDsToDeleteByDatabase:operationGroupNa meSuffix:completion:",  0LL,  a3,  a4,  v8);
}

- (void)_zoneOperationWithZonesToSaveByDatabaseIdentifier:(id)a3 recordZoneIDsToDeleteByDatabaseIdentifier:(id)a4 operationGroupNameSuffix:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v10 allKeys]);
  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](&OBJC_CLASS___NSMutableSet, "setWithArray:", v14));

  id v16 = (void *)objc_claimAutoreleasedReturnValue([v11 allKeys]);
  id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v16));
  [v15 unionSet:v17];

  workQueue = self->_workQueue;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_1001A1C5C;
  v24[3] = &unk_10063AD70;
  id v25 = v15;
  id v26 = v10;
  id v27 = v11;
  id v28 = self;
  id v29 = v12;
  id v30 = v13;
  id v19 = v13;
  id v20 = v12;
  id v21 = v11;
  id v22 = v10;
  id v23 = v15;
  dispatch_async((dispatch_queue_t)workQueue, v24);
}

- (void)_forceFetchRecordZonesForContainerDatabase:(id)a3 operationGroupNameSuffix:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void))a5;
  if (v8)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v11));
    -[PDCloudStoreContainer _fetchAndSaveRecordZonesWithContainerDatabaseIdentifiers:operationGroupNameSuffix:completion:]( self,  "_fetchAndSaveRecordZonesWithContainerDatabaseIdentifiers:operationGroupNameSuffix:completion:",  v12,  v9,  v10);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(9LL);
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v15 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Not fetching zones since container database is not defined.",  v15,  2u);
    }

    if (v10) {
      v10[2](v10, 0LL);
    }
  }
}

- (void)_fetchRecordZonesIfNeccessaryWithOperationGroupNameSuffix:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[PDCloudStoreContainerManager zonesThatNeedToBeCreated]( self->_containerManager,  "zonesThatNeedToBeCreated"));
  if ([v8 count])
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 allKeys]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v9));
    -[PDCloudStoreContainer _fetchAndSaveRecordZonesWithContainerDatabaseIdentifiers:operationGroupNameSuffix:completion:]( self,  "_fetchAndSaveRecordZonesWithContainerDatabaseIdentifiers:operationGroupNameSuffix:completion:",  v10,  v6,  v7);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(9LL);
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v13 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Not fetching zones since all zones are cached.",  v13,  2u);
    }

    if (v7) {
      v7[2](v7, 0LL);
    }
  }
}

- (void)_fetchAndSaveRecordZonesWithContainerDatabaseIdentifiers:(id)a3 operationGroupNameSuffix:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17[0] = 0LL;
  v17[1] = v17;
  v17[2] = 0x3032000000LL;
  v17[3] = sub_10018664C;
  v17[4] = sub_10018665C;
  id v18 = 0LL;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1001A2C18;
  v13[3] = &unk_100649730;
  v13[4] = self;
  id v16 = v17;
  id v11 = v9;
  id v14 = v11;
  id v12 = v10;
  id v15 = v12;
  -[PDCloudStoreContainer _recordZonesWithOperationGroupNameSuffix:containerDatabaseIdentifiers:completion:]( self,  "_recordZonesWithOperationGroupNameSuffix:containerDatabaseIdentifiers:completion:",  v11,  v8,  v13);

  _Block_object_dispose(v17, 8);
}

- (void)_recordZonesWithOperationGroupNameSuffix:(id)a3 containerDatabaseIdentifiers:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  workQueue = self->_workQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1001A300C;
  v15[3] = &unk_10063B440;
  id v16 = v9;
  id v17 = self;
  id v18 = v8;
  id v19 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_async((dispatch_queue_t)workQueue, v15);
}

- (void)_fetchAllSubscriptionsIfNeccessaryWithOperationGroupNameSuffix:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[PDCloudStoreContainerManager subscriptionsThatNeedToBeCreated]( self->_containerManager,  "subscriptionsThatNeedToBeCreated"));
  if ([v8 count])
  {
    workQueue = self->_workQueue;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1001A3B28;
    v12[3] = &unk_10063B440;
    id v13 = v8;
    id v14 = self;
    id v15 = v6;
    id v16 = v7;
    dispatch_async((dispatch_queue_t)workQueue, v12);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(9LL);
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Not fetching subscriptions since all subscriptions are cached.",  buf,  2u);
    }

    if (v7) {
      (*((void (**)(id, void))v7 + 2))(v7, 0LL);
    }
  }
}

- (void)_queue_retryContainerStateWithError:(id)a3 operationGroupNameSuffix:(id)a4 retryCount:(unint64_t)a5 completion:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  if (a5)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v11 userInfo]);
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:CKErrorRetryAfterKey]);
    [v15 doubleValue];
    double v17 = v16;

    if (v17 <= 0.0) {
      double v17 = pow(1.5, (double)(4 - a5));
    }
    uint64_t Object = PKLogFacilityTypeGetObject(9LL);
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      id v20 = PDCloudStoreContainerStateToString(self->_nextExpectedState);
      id v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      *(_DWORD *)__int128 buf = 138543618;
      id v31 = v21;
      __int16 v32 = 2048;
      double v33 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Retrying state %{public}@ with retry interval: %f",  buf,  0x16u);
    }

    dispatch_time_t v22 = dispatch_time(0LL, (uint64_t)(v17 * 1000000000.0));
    workQueue = self->_workQueue;
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472LL;
    v26[2] = sub_1001A43F8;
    v26[3] = &unk_10063C928;
    v26[4] = self;
    id v27 = v12;
    unint64_t v29 = a5;
    id v28 = v13;
    dispatch_after(v22, (dispatch_queue_t)workQueue, v26);
  }

  else
  {
    uint64_t v24 = PKLogFacilityTypeGetObject(9LL);
    id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Exhausted all retry attempts.", buf, 2u);
    }

    objc_storeStrong((id *)&self->_operationError, a3);
    self->_unint64_t nextExpectedState = 3LL;
    -[PDCloudStoreContainer _queue_setContainerState:operationGroupNameSuffix:retryCount:completion:]( self,  "_queue_setContainerState:operationGroupNameSuffix:retryCount:completion:",  3LL,  v12,  0LL,  v13);
  }
}

- (void)_queue_cancelOperationsForDatabse:(id)a3 underlyingError:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 operationQueue]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 operations]);
  uint64_t Object = PKLogFacilityTypeGetObject(9LL);
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = CKDatabaseScopeString([v5 databaseScope]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    *(_DWORD *)__int128 buf = 138543618;
    id v27 = v12;
    __int16 v28 = 2112;
    unint64_t v29 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Canceling all cloud store operations in database %{public}@, %@.",  buf,  0x16u);
  }

  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v13 = v8;
  id v14 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v14)
  {
    id v16 = v14;
    uint64_t v17 = *(void *)v22;
    do
    {
      id v18 = 0LL;
      do
      {
        if (*(void *)v22 != v17) {
          objc_enumerationMutation(v13);
        }
        id v19 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)v18);
        uint64_t v20 = objc_opt_class(&OBJC_CLASS___CKOperation, v15);
        if ((objc_opt_isKindOfClass(v19, v20) & 1) != 0) {
          [v19 cancelWithUnderlyingError:v6];
        }
        else {
          objc_msgSend(v19, "cancel", (void)v21);
        }
        id v18 = (char *)v18 + 1;
      }

      while (v16 != v18);
      id v16 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }

    while (v16);
  }
}

- (void)_queue_cancelAllOperations
{
  self->_shouldCancelAllTasks = 1;
  -[PDCloudStoreContainer _queue_initializationTimeout](self, "_queue_initializationTimeout");
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Cloud store initialization has timed out. Current timeout is %f seconds. Container: %@",  v3,  self));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer errorWithCode:description:](self, "errorWithCode:description:", -4007LL, v4));

  -[PDCloudStoreContainer reportContainerChangeSignpostEventType:stateName:objectNames:changeToken:error:operationGroupName:operationGroupNameSuffix:]( self,  "reportContainerChangeSignpostEventType:stateName:objectNames:changeToken:error:operationGroupName:operationGroupNameSuffix:",  22LL,  0LL,  0LL,  0LL,  v5,  0LL,  0LL);
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainerManager validDatabases](self->_containerManager, "validDatabases"));
  id v7 = [v6 countByEnumeratingWithState:&v18 objects:v24 count:16];
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
        uint64_t v11 = *(PDCloudStoreContainer **)(*((void *)&v18 + 1) + 8LL * (void)i);
        uint64_t Object = PKLogFacilityTypeGetObject(9LL);
        id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__int128 buf = 138412290;
          __int128 v23 = v11;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Invalidating database %@", buf, 0xCu);
        }

        id v14 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer database](v11, "database"));
        -[PDCloudStoreContainer _queue_cancelOperationsForDatabse:underlyingError:]( self,  "_queue_cancelOperationsForDatabse:underlyingError:",  v14,  v5);
      }

      id v8 = [v6 countByEnumeratingWithState:&v18 objects:v24 count:16];
    }

    while (v8);
  }

  uint64_t v15 = PKLogFacilityTypeGetObject(9LL);
  id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138412290;
    __int128 v23 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Invalidating cloud store because of operation timeout %@",  buf,  0xCu);
  }

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_1001A4884;
  v17[3] = &unk_10063AFC0;
  v17[4] = self;
  -[PDCloudStoreContainer invalidateCloudStoreWithOperationGroupNameSuffix:clearCache:completion:]( self,  "invalidateCloudStoreWithOperationGroupNameSuffix:clearCache:completion:",  0LL,  0LL,  v17);
}

- (void)_queue_addOperation:(id)a3 forDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if (v6)
    {
      uint64_t Object = PKLogFacilityTypeGetObject(9LL);
      uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 138412290;
        id v15 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Adding CKDatabaseOperation %@",  (uint8_t *)&v14,  0xCu);
      }

      [v7 addOperation:v6];
    }
  }

  else
  {
    uint64_t v10 = PKLogFacilityTypeGetObject(9LL);
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      id v15 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Error: No database defined for operation %@",  (uint8_t *)&v14,  0xCu);
    }
  }

  if (self->_shouldCancelAllTasks)
  {
    uint64_t v12 = PKLogFacilityTypeGetObject(9LL);
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Trying to add an operation after the initialization has timed out. Canceling now...",  (uint8_t *)&v14,  2u);
    }

    -[PDCloudStoreContainer _queue_cancelAllOperations](self, "_queue_cancelAllOperations");
  }
}

- (id)errorWithCode:(int64_t)a3 description:(id)a4
{
  v9[0] = NSLocalizedDescriptionKey;
  v9[1] = NSLocalizedFailureReasonErrorKey;
  v10[0] = a4;
  v10[1] = a4;
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v10,  v9,  2LL));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKPassKitErrorDomain,  a3,  v6));

  return v7;
}

- (id)setupAssistantNotCompleteError
{
  unint64_t v3 = -[PDCloudStoreContainer _setupAssistantState](self, "_setupAssistantState") - 1;
  if (v3 > 2) {
    id v4 = @"unknown";
  }
  else {
    id v4 = off_100649930[v3];
  }
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Cannot perform cloud store fetch task since the setup assistant state is %@",  v4));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer errorWithCode:description:](self, "errorWithCode:description:", -4016LL, v5));

  return v6;
}

- (void)_queue_startCloudStoreInitializationTimer
{
  double v4 = v3;
  uint64_t Object = PKLogFacilityTypeGetObject(9LL);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 134217984;
    double v14 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Starting cloud store initialization background activity with timeout of %f seconds.",  buf,  0xCu);
  }

  id v7 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_workQueue);
  timeoutTimer = self->_timeoutTimer;
  self->_timeoutTimer = v7;

  uint64_t v9 = self->_timeoutTimer;
  dispatch_time_t v10 = dispatch_time(0LL, (uint64_t)(v4 * 1000000000.0));
  dispatch_source_set_timer((dispatch_source_t)v9, v10, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
  uint64_t v11 = self->_timeoutTimer;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_1001A4D78;
  handler[3] = &unk_100639300;
  handler[4] = self;
  dispatch_source_set_event_handler((dispatch_source_t)v11, handler);
  dispatch_resume((dispatch_object_t)self->_timeoutTimer);
}

- (void)_queue_cancelCloudStoreInitializationTimer
{
  if (self->_timeoutTimer)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(9LL);
    double v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Invalidating cloud store initialization timer.",  v6,  2u);
    }

    dispatch_source_cancel((dispatch_source_t)self->_timeoutTimer);
    timeoutTimer = self->_timeoutTimer;
    self->_timeoutTimer = 0LL;
  }

- (void)_queue_cloudStoreInitializationTimerFired
{
  uint64_t Object = PKLogFacilityTypeGetObject(9LL);
  double v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Cloud store initialization timeout background activity did fire.",  v5,  2u);
  }

  -[PDCloudStoreContainer _queue_cancelCloudStoreInitializationTimer]( self,  "_queue_cancelCloudStoreInitializationTimer");
  -[PDCloudStoreContainer _queue_cancelAllOperations](self, "_queue_cancelAllOperations");
}

- (NSString)description
{
  double v3 = +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"<%@: %p; ",
         objc_opt_class(self, a2),
         self);
  double v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainerManager containerName](self->_containerManager, "containerName"));
  [v4 appendFormat:@"containerName: '%@'; ", v5];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainerManager validDatabases](self->_containerManager, "validDatabases"));
  [v4 appendFormat:@"databases: '%@'; ", v6];

  [v4 appendFormat:@">"];
  return (NSString *)v4;
}

- (id)_cannotPerformActionErrorWithFailureReason:(id)a3
{
  v7[0] = NSLocalizedDescriptionKey;
  v7[1] = NSLocalizedFailureReasonErrorKey;
  v8[0] = @"Cannot perform action on CloudKit container when it is not setup.";
  v8[1] = a3;
  id v3 = a3;
  double v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v8,  v7,  2LL));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKPassKitErrorDomain,  -4004LL,  v4));

  return v5;
}

- (void)_markEndCloudStoreDatabaseSetupWithSuccess:(BOOL)a3 error:(id)a4
{
  id v6 = a4;
  uint64_t Object = PKLogFacilityTypeGetObject(9LL);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Calling all initialization completion handlers.",  buf,  2u);
  }

  os_unfair_lock_lock(&self->_lock);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](self->_initializationCompletionHandlers, "allObjects"));
  id v10 = [v9 copy];

  -[NSMutableSet removeAllObjects](self->_initializationCompletionHandlers, "removeAllObjects");
  self->_isSetup = a3;
  os_unfair_lock_unlock(&self->_lock);
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v11 = v10;
  id v12 = [v11 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      id v15 = 0LL;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v16 + 1) + 8LL * (void)v15) + 16LL))(*(void *)(*((void *)&v16 + 1) + 8LL * (void)v15));
        id v15 = (char *)v15 + 1;
      }

      while (v13 != v15);
      id v13 = [v11 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }

    while (v13);
  }
}

- (PDCloudStoreContainerDelegate)delegate
{
  return (PDCloudStoreContainerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (PDCloudStoreDataSource)dataSource
{
  return (PDCloudStoreDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (PDCloudStoreContainerManager)containerManager
{
  return self->_containerManager;
}

- (void)setContainerManager:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (NSError)operationError
{
  return self->_operationError;
}

- (void)setOperationError:(id)a3
{
}

- (unint64_t)nextExpectedState
{
  return self->_nextExpectedState;
}

- (void)setNextExpectedState:(unint64_t)a3
{
  self->_unint64_t nextExpectedState = a3;
}

- (BOOL)accountChangedNotificationReceived
{
  return self->_accountChangedNotificationReceived;
}

- (void)setAccountChangedNotificationReceived:(BOOL)a3
{
  self->_accountChangedNotificationReceived = a3;
}

- (BOOL)cloudContainerSetupInProgress
{
  return self->_cloudContainerSetupInProgress;
}

- (void)setCloudContainerSetupInProgress:(BOOL)a3
{
  self->_cloudContainerSetupInProgress = a3;
}

- (void).cxx_destruct
{
}

@end