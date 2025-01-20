@interface PDPassSyncCloudStoreContainer
- (BOOL)_queue_canInitializeContainer;
- (BOOL)canSkipDownloadForReason:(int64_t)a3;
- (BOOL)didEncounterChangeTokenExpiredError:(id)a3;
- (BOOL)ensureSyncPreconditionsAreMet;
- (BOOL)isBusy;
- (BOOL)isDeltaSyncPossible;
- (BOOL)isWalletSyncEnabled;
- (BOOL)shouldForwardErrorsToRequestCompletionHandlers;
- (NSString)identifier;
- (PDCardCloudManagerLocalStore)localStore;
- (PDCloudStoreStateConfiguration)stateConfiguration;
- (PDPassSyncCloudStoreContainer)initWithConfiguration:(id)a3;
- (double)_queue_initializationTimeout;
- (id)allPossibleZoneNamesForContainerDatabase:(id)a3;
- (id)allPossibleZoneSubscriptionsForContainerDatabase:(id)a3;
- (id)allRecordsRequest;
- (id)changesRecordsRequest;
- (id)cloudPassIDForLocalUniqueID:(id)a3 inDatabase:(id)a4;
- (id)cloudStoreZonesForItem:(id)a3 action:(unint64_t)a4 inContainerDatabase:(id)a5;
- (id)cloudStoreZonesForItemType:(unint64_t)a3 configuration:(id)a4 action:(unint64_t)a5 inContainerDatabase:(id)a6;
- (id)identifierFromRecord:(id)a3;
- (id)invalidCloudStoreStateChangeError;
- (id)lastSyncDateDescription;
- (id)passesZone;
- (id)possibleDatabaseSubscriptionForContainerDatabase:(id)a3;
- (id)recordTypeFromRecordName:(id)a3;
- (id)recordTypesForCloudStoreItemType:(unint64_t)a3;
- (id)requestForAllChangedRecordsInZone:(id)a3;
- (id)requestForAllRecordsInZone:(id)a3;
- (id)sanitizeItems:(id)a3;
- (id)stateDescription;
- (id)subscriptionForZone:(id)a3 inContainerDatabase:(id)a4;
- (id)syncTokenDescription;
- (id)zoneIDForSubscription:(id)a3 inContainerDatabase:(id)a4;
- (unint64_t)cloudStoreItemTypeForRecordType:(id)a3;
- (void)_queue_cloudStoreAccountChanged:(id)a3;
- (void)_queue_processResultWithError:(id)a3 nextExpectedState:(unint64_t)a4 operationGroupNameSuffix:(id)a5 retryCount:(unint64_t)a6 shouldRetry:(BOOL)a7 completion:(id)a8;
- (void)_queue_setContainerState:(unint64_t)a3 operationGroupNameSuffix:(id)a4 retryCount:(unint64_t)a5 completion:(id)a6;
- (void)abortDownloadOfCloudDataWithReason:(int64_t)a3;
- (void)advanceToNextState:(unint64_t)a3;
- (void)advanceToNextState:(unint64_t)a3 withError:(id)a4;
- (void)checkAccountState;
- (void)clearChangeHistory;
- (void)clearSyncToken;
- (void)deleteCloudSyncRelatedInformation;
- (void)doDeltaSyncOfZone:(id)a3 andFill:(id)a4 completion:(id)a5;
- (void)doFullSyncOfZone:(id)a3 andFill:(id)a4 completion:(id)a5;
- (void)downloadCloudDataWithReason:(int64_t)a3;
- (void)eraseStateConfiguration;
- (void)fetchDiagnosticInformation:(id)a3;
- (void)fetchDiagnosticSnapshot:(id)a3;
- (void)finishDownloadOfCloudDataWithContents:(id)a3 forReason:(int64_t)a4;
- (void)finishInitialDownloadOfCloudDataWithContents:(id)a3;
- (void)finishInvalidStateChange;
- (void)finishRegularDownloadOfCloudDataWithContents:(id)a3;
- (void)markEndOfDownload:(id)a3;
- (void)moveItemsFromBatchContents:(id)a3 toFinalContents:(id)a4;
- (void)moveItemsFromResponse:(id)a3 duringDeltaSync:(BOOL)a4 orError:(id)a5 toContents:(id)a6;
- (void)onWorkQueue:(id)a3;
- (void)passOnHandlingStateChange;
- (void)performDeletes:(id)a3 completion:(id)a4;
- (void)prepareForDetachment;
- (void)prepareForSetup;
- (void)processChangeHistory;
- (void)processFetchedCloudStoreDataWithModifiedRecordsByDatabaseIdentifier:(id)a3 deletedRecordsByDatabaseIdentifier:(id)a4 carriedOverRecordsByDatabaseIdentifier:(id)a5 conflictingRecordsByDatabaseIdentifier:(id)a6 request:(id)a7 completion:(id)a8;
- (void)processPendingChanges:(id)a3;
- (void)processPendingChangesWithReason:(int64_t)a3;
- (void)reload;
- (void)removeCloudPassesWithLocalUniqueIDs:(id)a3 completion:(id)a4;
- (void)resetContents;
- (void)resetMigration;
- (void)retryExecutingAnyDroppedDownload;
- (void)setLocalStore:(id)a3;
- (void)setStateConfiguration:(id)a3;
- (void)synchronizeWithReason:(int64_t)a3;
- (void)updateCloudCatalog:(id)a3 completion:(id)a4;
- (void)updateCloudPasses:(id)a3 completion:(id)a4;
- (void)updateCloudStoreWithLocalItemsWithConfigurations:(id)a3 groupName:(id)a4 groupNameSuffix:(id)a5 qualityOfService:(int64_t)a6 completion:(id)a7;
- (void)uploadLocalDataToCloud;
@end

@implementation PDPassSyncCloudStoreContainer

- (PDPassSyncCloudStoreContainer)initWithConfiguration:(id)a3
{
  id v5 = a3;
  [v5 setContainerDatabaseDataSource:self];
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___PDPassSyncCloudStoreContainer;
  v6 = -[PDCloudStoreContainer initWithConfiguration:](&v13, "initWithConfiguration:", v5);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue( -[PDCloudStoreContainerConfiguration stringPrefixedWithContainerName:]( v7->_configuration,  "stringPrefixedWithContainerName:",  @"PDPassSyncCloudStoreContainerLastDownloadDateKey"));
    uint64_t DateForKey = PKSharedCacheGetDateForKey();
    uint64_t v10 = objc_claimAutoreleasedReturnValue(DateForKey);
    lastDownloadDate = v7->_lastDownloadDate;
    v7->_lastDownloadDate = (NSDate *)v10;

    v7->_lock._os_unfair_lock_opaque = 0;
  }

  return v7;
}

- (NSString)identifier
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer containerManager](self, "containerManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 container]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 containerIdentifier]);

  return (NSString *)v4;
}

- (void)synchronizeWithReason:(int64_t)a3
{
  if (PKCloudKitPassSyncEnabled(self, a2))
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_10006EA7C;
    v5[3] = &unk_10063A8A8;
    v5[4] = self;
    v5[5] = a3;
    -[PDPassSyncCloudStoreContainer onWorkQueue:](self, "onWorkQueue:", v5);
  }

- (void)processPendingChangesWithReason:(int64_t)a3
{
  if (PKCloudKitPassSyncEnabled(self, a2))
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_10006ED0C;
    v5[3] = &unk_10063A8A8;
    v5[4] = self;
    v5[5] = a3;
    -[PDPassSyncCloudStoreContainer onWorkQueue:](self, "onWorkQueue:", v5);
  }

- (void)reload
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_10006F0B0;
  v2[3] = &unk_100639300;
  v2[4] = self;
  -[PDPassSyncCloudStoreContainer onWorkQueue:](self, "onWorkQueue:", v2);
}

- (BOOL)ensureSyncPreconditionsAreMet
{
  uint64_t Object = PKLogFacilityTypeGetObject(9LL);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainerConfiguration logDescription](self->_configuration, "logDescription"));
    int v27 = 138543362;
    v28 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "[PDPassCloudStore(%{public}@)] checking sync preconditions",  (uint8_t *)&v27,  0xCu);
  }

  os_unfair_lock_lock(&self->_lock);
  BOOL isDownloading = self->_isDownloading;
  os_unfair_lock_unlock(&self->_lock);
  if (!-[PDCloudStoreContainer isSetup](self, "isSetup")
    && (id)-[PDCloudStoreContainer nextExpectedState](self, "nextExpectedState") != (id)14)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainerConfiguration logDescription](self->_configuration, "logDescription"));
      int v27 = 138543362;
      v28 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "[PDPassCloudStore(%{public}@)] not is set up",  (uint8_t *)&v27,  0xCu);
    }

    if (-[PDCloudStoreContainer cloudContainerSetupInProgress](self, "cloudContainerSetupInProgress"))
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainerConfiguration logDescription](self->_configuration, "logDescription"));
        int v27 = 138543362;
        v28 = v7;
        v8 = "[PDPassCloudStore(%{public}@)] looks like container is being set up";
        goto LABEL_35;
      }

      goto LABEL_43;
    }

    unsigned __int8 v19 = sub_10006F728();
    BOOL v20 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    if ((v19 & 1) == 0)
    {
      if (v20)
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainerConfiguration logDescription](self->_configuration, "logDescription"));
        int v27 = 138543362;
        v28 = v7;
        v8 = "[PDPassCloudStore(%{public}@)] looks like container is not set up because wallet dataclass is not enabled";
        goto LABEL_35;
      }

      goto LABEL_43;
    }

    if (v20)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainerConfiguration logDescription](self->_configuration, "logDescription"));
      int v27 = 138543362;
      v28 = v21;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "[PDPassCloudStore(%{public}@)] setting up container",  (uint8_t *)&v27,  0xCu);
    }

    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer delegate](self, "delegate"));
    v4 = v22;
    v23 = self;
    uint64_t v24 = 0LL;
    goto LABEL_42;
  }

  if (!-[PDPassSyncCloudStoreContainer isWalletSyncEnabled](self, "isWalletSyncEnabled"))
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainerConfiguration logDescription](self->_configuration, "logDescription"));
      int v27 = 138543362;
      v28 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "[PDPassCloudStore(%{public}@)] wallet sync was disabled - checking again",  (uint8_t *)&v27,  0xCu);
    }

    if ((PKCloudKitPassSyncEnabled(v10, v11) & 1) == 0)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainerConfiguration logDescription](self->_configuration, "logDescription"));
        int v27 = 138543362;
        v28 = v7;
        v8 = "[PDPassCloudStore(%{public}@)] sync swich is still disabled";
        goto LABEL_35;
      }

      goto LABEL_43;
    }

    if ((sub_10006F728() & 1) == 0)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainerConfiguration logDescription](self->_configuration, "logDescription"));
        int v27 = 138543362;
        v28 = v7;
        v8 = "[PDPassCloudStore(%{public}@)] wallet dataclass is still disabled ";
        goto LABEL_35;
      }

      goto LABEL_43;
    }

    unsigned int v12 = -[PDCloudStoreContainer cloudContainerSetupInProgress](self, "cloudContainerSetupInProgress");
    BOOL v13 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    if (v12)
    {
      if (v13)
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainerConfiguration logDescription](self->_configuration, "logDescription"));
        int v27 = 138543362;
        v28 = v7;
        v8 = "[PDPassCloudStore(%{public}@)] wallet dataclass is now enabled - container already being set up";
        goto LABEL_35;
      }

- (BOOL)_queue_canInitializeContainer
{
  return -[PDCloudStoreContainerConfiguration canInitializeContainer](self->_configuration, "canInitializeContainer");
}

- (BOOL)shouldForwardErrorsToRequestCompletionHandlers
{
  return 1;
}

- (double)_queue_initializationTimeout
{
  return 300.0;
}

- (void)_queue_setContainerState:(unint64_t)a3 operationGroupNameSuffix:(id)a4 retryCount:(unint64_t)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  unsigned int v12 = objc_alloc_init(&OBJC_CLASS___PDCloudStoreStateConfiguration);
  -[PDCloudStoreStateConfiguration setCurrentState:](v12, "setCurrentState:", a3);
  -[PDCloudStoreStateConfiguration setOperationGroupNameSuffix:](v12, "setOperationGroupNameSuffix:", v11);

  -[PDCloudStoreStateConfiguration setRetryCount:](v12, "setRetryCount:", a5);
  -[PDCloudStoreStateConfiguration setStateChangeCompletion:](v12, "setStateChangeCompletion:", v10);

  -[PDPassSyncCloudStoreContainer setStateConfiguration:](self, "setStateConfiguration:", v12);
  uint64_t Object = PKLogFacilityTypeGetObject(9LL);
  v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainerConfiguration logDescription](self->_configuration, "logDescription"));
    int v16 = 138543618;
    v17 = v15;
    __int16 v18 = 2114;
    unsigned __int8 v19 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "[PDPassCloudStore(%{public}@)] state will advance to %{public}@",  (uint8_t *)&v16,  0x16u);
  }

  if (-[PDCloudStoreContainer _queue_ensureContainerState:](self, "_queue_ensureContainerState:", a3))
  {
    switch(a3)
    {
      case 2uLL:
      case 3uLL:
        -[PDPassSyncCloudStoreContainer prepareForDetachment](self, "prepareForDetachment");
        goto LABEL_6;
      case 4uLL:
        -[PDPassSyncCloudStoreContainer checkAccountState](self, "checkAccountState");
        break;
      case 5uLL:
        -[PDPassSyncCloudStoreContainer prepareForSetup](self, "prepareForSetup");
        break;
      case 0xDuLL:
        -[PDPassSyncCloudStoreContainer downloadCloudDataWithReason:](self, "downloadCloudDataWithReason:", 0LL);
        break;
      case 0xEuLL:
        -[PDPassSyncCloudStoreContainer uploadLocalDataToCloud](self, "uploadLocalDataToCloud");
        break;
      default:
LABEL_6:
        -[PDPassSyncCloudStoreContainer passOnHandlingStateChange](self, "passOnHandlingStateChange");
        break;
    }
  }

  else
  {
    -[PDPassSyncCloudStoreContainer finishInvalidStateChange](self, "finishInvalidStateChange");
  }
}

- (void)_queue_processResultWithError:(id)a3 nextExpectedState:(unint64_t)a4 operationGroupNameSuffix:(id)a5 retryCount:(unint64_t)a6 shouldRetry:(BOOL)a7 completion:(id)a8
{
  BOOL v9 = a7;
  id v14 = a3;
  id v15 = a5;
  id v16 = a8;
  id v17 = [[PKCloudStoreError alloc] initWithError:v14];
  if (([v17 isUnrecoverableDecryptionError] & 1) != 0
    || [v17 isZoneNotFoundError])
  {
    __int16 v18 = (void *)objc_claimAutoreleasedReturnValue(-[PDPassSyncCloudStoreContainer localStore](self, "localStore"));
    [v18 resetMigration];
  }

  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___PDPassSyncCloudStoreContainer;
  -[PDCloudStoreContainer _queue_processResultWithError:nextExpectedState:operationGroupNameSuffix:retryCount:shouldRetry:completion:]( &v19,  "_queue_processResultWithError:nextExpectedState:operationGroupNameSuffix:retryCount:shouldRetry:completion:",  v14,  a4,  v15,  a6,  v9,  v16);
}

- (void)finishInvalidStateChange
{
  uint64_t Object = PKLogFacilityTypeGetObject(9LL);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainerConfiguration logDescription](self->_configuration, "logDescription"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PDPassSyncCloudStoreContainer stateConfiguration](self, "stateConfiguration"));
    int v10 = 138543618;
    id v11 = v5;
    __int16 v12 = 2114;
    BOOL v13 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "[PDPassCloudStore(%{public}@)] encountered invalid state configuration %{public}@",  (uint8_t *)&v10,  0x16u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDPassSyncCloudStoreContainer stateConfiguration](self, "stateConfiguration"));
  v8 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue([v7 stateChangeCompletion]);

  if (v8)
  {
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue( -[PDPassSyncCloudStoreContainer invalidCloudStoreStateChangeError]( self,  "invalidCloudStoreStateChangeError"));
    ((void (**)(void, void, void *))v8)[2](v8, 0LL, v9);
  }

  -[PDPassSyncCloudStoreContainer eraseStateConfiguration](self, "eraseStateConfiguration");
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
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[PDPassSyncCloudStoreContainer stateConfiguration](self, "stateConfiguration"));
  -[PDPassSyncCloudStoreContainer eraseStateConfiguration](self, "eraseStateConfiguration");
  -[PDCloudStoreContainer setNextExpectedState:](self, "setNextExpectedState:", a3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v8 operationGroupNameSuffix]);
  id v6 = [v8 retryCount];
  v7 = (void *)objc_claimAutoreleasedReturnValue([v8 stateChangeCompletion]);
  -[PDPassSyncCloudStoreContainer _queue_setContainerState:operationGroupNameSuffix:retryCount:completion:]( self,  "_queue_setContainerState:operationGroupNameSuffix:retryCount:completion:",  a3,  v5,  v6,  v7);
}

- (void)advanceToNextState:(unint64_t)a3 withError:(id)a4
{
  id v6 = a4;
  id v10 = (id)objc_claimAutoreleasedReturnValue(-[PDPassSyncCloudStoreContainer stateConfiguration](self, "stateConfiguration"));
  -[PDPassSyncCloudStoreContainer eraseStateConfiguration](self, "eraseStateConfiguration");
  -[PDCloudStoreContainer setNextExpectedState:](self, "setNextExpectedState:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v10 operationGroupNameSuffix]);
  id v8 = [v10 retryCount];
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v10 stateChangeCompletion]);
  -[PDPassSyncCloudStoreContainer _queue_processResultWithError:nextExpectedState:operationGroupNameSuffix:retryCount:shouldRetry:completion:]( self,  "_queue_processResultWithError:nextExpectedState:operationGroupNameSuffix:retryCount:shouldRetry:completion:",  v6,  a3,  v7,  v8,  0LL,  v9);
}

- (void)passOnHandlingStateChange
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PDPassSyncCloudStoreContainer stateConfiguration](self, "stateConfiguration"));
  -[PDPassSyncCloudStoreContainer eraseStateConfiguration](self, "eraseStateConfiguration");
  id v4 = [v3 currentState];
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 operationGroupNameSuffix]);
  id v6 = [v3 retryCount];
  v7 = (void *)objc_claimAutoreleasedReturnValue([v3 stateChangeCompletion]);
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___PDPassSyncCloudStoreContainer;
  -[PDCloudStoreContainer _queue_setContainerState:operationGroupNameSuffix:retryCount:completion:]( &v8,  "_queue_setContainerState:operationGroupNameSuffix:retryCount:completion:",  v4,  v5,  v6,  v7);
}

- (void)checkAccountState
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_10006FE44;
  v2[3] = &unk_10063DB10;
  v2[4] = self;
  -[PDCloudStoreContainer _queue_cloudStoreAccountInformationWithCompletion:]( self,  "_queue_cloudStoreAccountInformationWithCompletion:",  v2);
}

- (void)prepareForSetup
{
  uint64_t Object = PKLogFacilityTypeGetObject(9LL);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainerConfiguration logDescription](self->_configuration, "logDescription"));
    int v14 = 138543362;
    id v15 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "[PDPassCloudStore(%{public}@)] will prepare for setup",  (uint8_t *)&v14,  0xCu);
  }

  if (PKIsCloudKitEnvironmentChangeHandlingDisabled())
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue( -[PDCloudStoreContainer errorWithCode:description:]( self,  "errorWithCode:description:",  -4008LL,  @"CK environment change handling disabled"));
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_17;
    }
    goto LABEL_18;
  }

  self->_isWalletDataclassEnabledOnPrimaryAppleAccount = sub_10006F728();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainerConfiguration logDescription](self->_configuration, "logDescription"));
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  self->_isWalletDataclassEnabledOnPrimaryAppleAccount));
    int v14 = 138543618;
    id v15 = v7;
    __int16 v16 = 2114;
    id v17 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "[PDPassCloudStore(%{public}@)] wallet dataclass enbabled: %{public}@",  (uint8_t *)&v14,  0x16u);
  }

  if (!self->_isWalletDataclassEnabledOnPrimaryAppleAccount)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue( -[PDCloudStoreContainer errorWithCode:description:]( self,  "errorWithCode:description:",  -4008LL,  @"Wallet dataclass disabled"));
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
LABEL_17:
      BOOL v13 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainerConfiguration logDescription](self->_configuration, "logDescription"));
      int v14 = 138543618;
      id v15 = v13;
      __int16 v16 = 2114;
      id v17 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "[PDPassCloudStore(%{public}@)] error preparing for setup: %{public}@",  (uint8_t *)&v14,  0x16u);
    }

- (void)downloadCloudDataWithReason:(int64_t)a3
{
  else {
    id v5 = off_10063DDF8[a3];
  }
  os_unfair_lock_lock(&self->_lock);
  BOOL isDownloading = self->_isDownloading;
  os_unfair_lock_unlock(&self->_lock);
  if (!-[PDPassSyncCloudStoreContainer isWalletSyncEnabled](self, "isWalletSyncEnabled"))
  {
    uint64_t Object = PKLogFacilityTypeGetObject(9LL);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(Object);
    if (!os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEFAULT))
    {
LABEL_12:

      -[PDPassSyncCloudStoreContainer abortDownloadOfCloudDataWithReason:]( self,  "abortDownloadOfCloudDataWithReason:",  a3);
      return;
    }

    __int16 v12 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainerConfiguration logDescription](self->_configuration, "logDescription"));
    BOOL isWalletDataclassEnabledOnPrimaryAppleAccount = self->_isWalletDataclassEnabledOnPrimaryAppleAccount;
    *(_DWORD *)buf = 138543874;
    v31 = v12;
    __int16 v32 = 1026;
    *(_DWORD *)v33 = isWalletDataclassEnabledOnPrimaryAppleAccount;
    *(_WORD *)&v33[4] = 1026;
    *(_DWORD *)&v33[6] = PKCloudKitPassSyncEnabled(v12, v14);
    id v15 = "[PDPassCloudStore(%{public}@)] wallet sync is disabled (%{public}d, %{public}d)";
    __int16 v16 = (os_log_s *)v11;
    uint32_t v17 = 24;
LABEL_11:
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, v15, buf, v17);

    goto LABEL_12;
  }

  if (isDownloading)
  {
    uint64_t v7 = PKLogFacilityTypeGetObject(9LL);
    objc_super v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainerConfiguration logDescription](self->_configuration, "logDescription"));
      *(_DWORD *)buf = 138543618;
      v31 = v9;
      __int16 v32 = 2114;
      *(void *)v33 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "[PDPassCloudStore(%{public}@)] download of cloud data already in progress dropping: %{public}@",  buf,  0x16u);
    }

    os_unfair_lock_lock(&self->_lock);
    self->_didDropDownload = 1;
    os_unfair_lock_unlock(&self->_lock);
    return;
  }

  if (-[PDPassSyncCloudStoreContainer canSkipDownloadForReason:](self, "canSkipDownloadForReason:", a3))
  {
    uint64_t v18 = PKLogFacilityTypeGetObject(9LL);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(v18);
    if (!os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    __int16 v12 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainerConfiguration logDescription](self->_configuration, "logDescription"));
    *(_DWORD *)buf = 138543618;
    v31 = v12;
    __int16 v32 = 2114;
    *(void *)v33 = v5;
    id v15 = "[PDPassCloudStore(%{public}@)] skipping download of cloud data: %{public}@";
    __int16 v16 = (os_log_s *)v11;
    uint32_t v17 = 22;
    goto LABEL_11;
  }

  objc_super v19 = objc_alloc_init(&OBJC_CLASS___PDPassCloudStoreContainerContent);
  uint64_t v20 = PKLogFacilityTypeGetObject(9LL);
  v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainerConfiguration logDescription](self->_configuration, "logDescription"));
    *(_DWORD *)buf = 138543618;
    v31 = v22;
    __int16 v32 = 2114;
    *(void *)v33 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "[PDPassCloudStore(%{public}@)] starting of download of cloud data because of: %{public}@",  buf,  0x16u);
  }

  os_unfair_lock_lock(&self->_lock);
  self->_BOOL isDownloading = 1;
  os_unfair_lock_unlock(&self->_lock);
  unsigned int v23 = -[PDPassSyncCloudStoreContainer isDeltaSyncPossible](self, "isDeltaSyncPossible");
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[PDPassSyncCloudStoreContainer passesZone](self, "passesZone"));
  if (v23)
  {
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472LL;
    v28[2] = sub_1000709A4;
    v28[3] = &unk_10063A858;
    v25 = (id *)v29;
    v28[4] = self;
    v29[0] = v19;
    v29[1] = a3;
    -[PDPassSyncCloudStoreContainer doDeltaSyncOfZone:andFill:completion:]( self,  "doDeltaSyncOfZone:andFill:completion:",  v24,  v19,  v28);
  }

  else
  {
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472LL;
    v26[2] = sub_1000709D4;
    v26[3] = &unk_10063A858;
    v25 = (id *)v27;
    v26[4] = self;
    v27[0] = v19;
    v27[1] = a3;
    -[PDPassSyncCloudStoreContainer doFullSyncOfZone:andFill:completion:]( self,  "doFullSyncOfZone:andFill:completion:",  v24,  v19,  v26);
  }
}

- (BOOL)isWalletSyncEnabled
{
  if (self->_isWalletDataclassEnabledOnPrimaryAppleAccount) {
    return PKCloudKitPassSyncEnabled();
  }
  else {
    return 0;
  }
}

- (BOOL)canSkipDownloadForReason:(int64_t)a3
{
  if (!self->_isReadOnly)
  {
    if (a3)
    {
      uint64_t Object = PKLogFacilityTypeGetObject(9LL);
      id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainerConfiguration logDescription](self->_configuration, "logDescription"));
        int v19 = 138543362;
        uint64_t v20 = v9;
        id v10 = "[PDPassCloudStore(%{public}@)] cannot skip download because it not is initial";
LABEL_13:
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v19, 0xCu);
      }
    }

    else if (-[PDPassSyncCloudStoreContainer isDeltaSyncPossible](self, "isDeltaSyncPossible"))
    {
      os_unfair_lock_lock(&self->_lock);
      id v5 = self->_lastDownloadDate;
      os_unfair_lock_unlock(&self->_lock);
      if (v5)
      {
        id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
        [v11 timeIntervalSinceDate:v5];
        double v13 = v12;

        BOOL v7 = v13 < 10800.0;
        goto LABEL_15;
      }

      uint64_t v16 = PKLogFacilityTypeGetObject(9LL);
      uint32_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainerConfiguration logDescription](self->_configuration, "logDescription"));
        int v19 = 138543362;
        uint64_t v20 = v18;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "[PDPassCloudStore(%{public}@)] cannot skip download because we've never synced",  (uint8_t *)&v19,  0xCu);
      }
    }

    else
    {
      uint64_t v14 = PKLogFacilityTypeGetObject(9LL);
      id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainerConfiguration logDescription](self->_configuration, "logDescription"));
        int v19 = 138543362;
        uint64_t v20 = v9;
        id v10 = "[PDPassCloudStore(%{public}@)] cannot skip download because full sync is needed";
        goto LABEL_13;
      }
    }

    BOOL v7 = 0;
    goto LABEL_15;
  }

  uint64_t v4 = PKLogFacilityTypeGetObject(9LL);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainerConfiguration logDescription](self->_configuration, "logDescription"));
    int v19 = 138543362;
    uint64_t v20 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "[PDPassCloudStore(%{public}@)] can skip download because readOnly flag is set",  (uint8_t *)&v19,  0xCu);
  }

  BOOL v7 = 1;
LABEL_15:

  return v7;
}

- (BOOL)isDeltaSyncPossible
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer containerManager](self, "containerManager"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[PDPassSyncCloudStoreContainer passesZone](self, "passesZone"));
  unsigned __int8 v5 = [v3 didFinishInitialSyncForCloudStoreZone:v4];

  return v5;
}

- (void)markEndOfDownload:(id)a3
{
  id v4 = a3;
  id obj = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue([v4 errorEncounered]);

  os_unfair_lock_lock(&self->_lock);
  self->_BOOL isDownloading = 0;
  p_lastDownloadDate = &self->_lastDownloadDate;
  if (v5)
  {
    objc_storeStrong((id *)p_lastDownloadDate, *p_lastDownloadDate);
    os_unfair_lock_unlock(&self->_lock);
  }

  else
  {
    objc_storeStrong((id *)p_lastDownloadDate, obj);
    os_unfair_lock_unlock(&self->_lock);
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue( -[PDCloudStoreContainerConfiguration stringPrefixedWithContainerName:]( self->_configuration,  "stringPrefixedWithContainerName:",  @"PDPassSyncCloudStoreContainerLastDownloadDateKey"));
    PKSharedCacheSetObjectForKey(obj, v7);
  }
}

- (void)prepareForDetachment
{
  uint64_t Object = PKLogFacilityTypeGetObject(9LL);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainerConfiguration logDescription](self->_configuration, "logDescription"));
    int v7 = 138543362;
    objc_super v8 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "[PDPassCloudStore(%{public}@)] clearing state caused by detachment",  (uint8_t *)&v7,  0xCu);
  }

  downloadedContents = self->_downloadedContents;
  self->_downloadedContents = 0LL;

  self->_BOOL didSuccessfullySyncAtLeastOnce = 0;
  os_unfair_lock_lock(&self->_lock);
  self->_didDropDownload = 0;
  self->_BOOL isDownloading = 0;
  os_unfair_lock_unlock(&self->_lock);
  self->_BOOL isWalletDataclassEnabledOnPrimaryAppleAccount = 0;
  self->_isReadOnly = 0;
  -[PDCloudStoreContainer setAccountChangedNotificationReceived:](self, "setAccountChangedNotificationReceived:", 0LL);
}

- (void)abortDownloadOfCloudDataWithReason:(int64_t)a3
{
  if (!a3)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(9LL);
    unsigned __int8 v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainerConfiguration logDescription](self->_configuration, "logDescription"));
      *(_DWORD *)buf = 138543362;
      BOOL v9 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "[PDPassCloudStore(%{public}@)] aborting initial download of cloud data gracefully",  buf,  0xCu);
    }

    self->_BOOL didSuccessfullySyncAtLeastOnce = 1;
    -[PDPassSyncCloudStoreContainer advanceToNextState:withError:](self, "advanceToNextState:withError:", 15LL, 0LL);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_100071074;
    v7[3] = &unk_10063AFC0;
    v7[4] = self;
    -[PDPassSyncCloudStoreContainer processPendingChanges:](self, "processPendingChanges:", v7);
  }

- (void)doDeltaSyncOfZone:(id)a3 andFill:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t Object = PKLogFacilityTypeGetObject(9LL);
  double v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    double v13 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainerConfiguration logDescription](self->_configuration, "logDescription"));
    *(_DWORD *)buf = 138543362;
    unsigned int v23 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "[PDPassCloudStore(%{public}@)] will attempt to download records (delta-sync)",  buf,  0xCu);
  }

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( -[PDPassSyncCloudStoreContainer requestForAllChangedRecordsInZone:]( self,  "requestForAllChangedRecordsInZone:",  v8));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_100071310;
  v18[3] = &unk_10063DB38;
  v18[4] = self;
  id v19 = v8;
  id v20 = v9;
  id v21 = v10;
  id v15 = v10;
  id v16 = v9;
  id v17 = v8;
  -[PDCloudStoreContainer executeRecordsRequest:completion:](self, "executeRecordsRequest:completion:", v14, v18);
}

- (void)doFullSyncOfZone:(id)a3 andFill:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t Object = PKLogFacilityTypeGetObject(9LL);
  double v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    double v13 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainerConfiguration logDescription](self->_configuration, "logDescription"));
    *(_DWORD *)buf = 138543362;
    int v27 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "[PDPassCloudStore(%{public}@)] will attempt to download records (full-sync)",  buf,  0xCu);
  }

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer containerManager](self, "containerManager"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 changeTokenForCloudStoreStore:v8]);

  if (!v15)
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[PDPassSyncCloudStoreContainer localStore](self, "localStore"));
    [v16 prepareToSaveRemoteData];
  }

  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[PDPassSyncCloudStoreContainer requestForAllRecordsInZone:](self, "requestForAllRecordsInZone:", v8));
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_100071704;
  v24[3] = &unk_10063DB60;
  v24[4] = self;
  id v18 = v9;
  id v25 = v18;
  [v17 setBatchHandler:v24];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_10007189C;
  v21[3] = &unk_10063DB88;
  v21[4] = self;
  id v22 = v18;
  id v23 = v10;
  id v19 = v10;
  id v20 = v18;
  -[PDCloudStoreContainer executeRecordsRequest:completion:](self, "executeRecordsRequest:completion:", v17, v21);
}

- (void)finishDownloadOfCloudDataWithContents:(id)a3 forReason:(int64_t)a4
{
  if (a4) {
    -[PDPassSyncCloudStoreContainer finishRegularDownloadOfCloudDataWithContents:]( self,  "finishRegularDownloadOfCloudDataWithContents:",  a3);
  }
  else {
    -[PDPassSyncCloudStoreContainer finishInitialDownloadOfCloudDataWithContents:]( self,  "finishInitialDownloadOfCloudDataWithContents:",  a3);
  }
}

- (void)finishInitialDownloadOfCloudDataWithContents:(id)a3
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 errorEncounered]);

  uint64_t Object = PKLogFacilityTypeGetObject(9LL);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v9)
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainerConfiguration logDescription](self->_configuration, "logDescription"));
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v5 errorEncounered]);
      int v16 = 138543618;
      id v17 = v10;
      __int16 v18 = 2114;
      id v19 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "[PDPassCloudStore(%{public}@)] error initially downloading cloud data: %{public}@",  (uint8_t *)&v16,  0x16u);
    }

    double v12 = (void *)objc_claimAutoreleasedReturnValue([v5 errorEncounered]);
    double v13 = self;
    uint64_t v14 = 3LL;
  }

  else
  {
    if (v9)
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainerConfiguration logDescription](self->_configuration, "logDescription"));
      int v16 = 138543362;
      id v17 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "[PDPassCloudStore(%{public}@)] initial download of cloud data did finish",  (uint8_t *)&v16,  0xCu);
    }

    self->_BOOL didSuccessfullySyncAtLeastOnce = 1;
    objc_storeStrong((id *)&self->_downloadedContents, a3);
    double v12 = (void *)objc_claimAutoreleasedReturnValue([v5 errorEncounered]);
    double v13 = self;
    uint64_t v14 = 14LL;
  }

  -[PDPassSyncCloudStoreContainer advanceToNextState:withError:](v13, "advanceToNextState:withError:", v14, v12);
}

- (void)finishRegularDownloadOfCloudDataWithContents:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 errorEncounered]);

  if (v5)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(9LL);
    int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainerConfiguration logDescription](self->_configuration, "logDescription"));
      BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v4 errorEncounered]);
      *(_DWORD *)buf = 138543618;
      id v19 = v8;
      __int16 v20 = 2114;
      id v21 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "[PDPassCloudStore(%{public}@)] error downloading cloud data: %{public}@",  buf,  0x16u);
    }

- (void)uploadLocalDataToCloud
{
  v3 = self->_downloadedContents;
  id v4 = v3;
  if (v3)
  {
    int64_t v5 = -[PDPassCloudStoreContainerContent typeOfSyncPerformed](v3, "typeOfSyncPerformed");
    uint64_t Object = PKLogFacilityTypeGetObject(9LL);
    int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v8)
      {
        BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainerConfiguration logDescription](self->_configuration, "logDescription"));
        *(_DWORD *)buf = 138543362;
        id v19 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "[PDPassCloudStore(%{public}@)] will upload local data after download (delta-sync)",  buf,  0xCu);
      }

      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472LL;
      v16[2] = sub_100072520;
      v16[3] = &unk_10063AFC0;
      v16[4] = self;
      -[PDPassSyncCloudStoreContainer processPendingChanges:](self, "processPendingChanges:", v16);
    }

    else
    {
      if (v8)
      {
        BOOL v13 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainerConfiguration logDescription](self->_configuration, "logDescription"));
        *(_DWORD *)buf = 138543362;
        id v19 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "[PDPassCloudStore(%{public}@)] will upload local data after download (full-sync)",  buf,  0xCu);
      }

      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[PDPassSyncCloudStoreContainer localStore](self, "localStore"));
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472LL;
      v17[2] = sub_1000723AC;
      v17[3] = &unk_10063AFC0;
      v17[4] = self;
      [v14 saveLocalDataInContainer:v4 completion:v17];
    }

    downloadedContents = self->_downloadedContents;
    self->_downloadedContents = 0LL;
  }

  else
  {
    uint64_t v10 = PKLogFacilityTypeGetObject(9LL);
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      double v12 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainerConfiguration logDescription](self->_configuration, "logDescription"));
      *(_DWORD *)buf = 138543362;
      id v19 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "[PDPassCloudStore(%{public}@)] did not find contents to use, advancing.",  buf,  0xCu);
    }

    -[PDPassSyncCloudStoreContainer advanceToNextState:withError:](self, "advanceToNextState:withError:", 15LL, 0LL);
  }
}

- (void)processPendingChanges:(id)a3
{
  id v4 = (void (**)(id, uint64_t, void))a3;
  if (self->_isReadOnly)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(9LL);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainerConfiguration logDescription](self->_configuration, "logDescription"));
      int v9 = 138543362;
      uint64_t v10 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "[PDPassCloudStore(%{public}@)] won't process pending changes because container is readonly",  (uint8_t *)&v9,  0xCu);
    }

    if (v4) {
      v4[2](v4, 1LL, 0LL);
    }
  }

  else
  {
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[PDPassSyncCloudStoreContainer localStore](self, "localStore"));
    [v8 processPendingChanges:v4];
  }
}

- (id)requestForAllRecordsInZone:(id)a3
{
  id v4 = a3;
  int64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDPassSyncCloudStoreContainer allRecordsRequest](self, "allRecordsRequest"));
  [v5 setUseLastChangeToken:1];
  [v5 setShouldSaveToken:1];
  [v5 setStoreChangesInDatabase:0];
  [v5 setIgnoreChangesMadeByThisDevice:0];
  [v5 setBatchLimit:25];
  [v5 setCloudStoreZone:v4];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer containerManager](self, "containerManager"));
  int v7 = (void *)objc_claimAutoreleasedReturnValue([v6 databaseForScope:2]);
  [v5 setContainerDatabase:v7];

  return v5;
}

- (id)requestForAllChangedRecordsInZone:(id)a3
{
  id v4 = a3;
  int64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDPassSyncCloudStoreContainer changesRecordsRequest](self, "changesRecordsRequest"));
  [v5 setUseLastChangeToken:1];
  [v5 setShouldSaveToken:1];
  [v5 setStoreChangesInDatabase:1];
  [v5 setIgnoreChangesMadeByThisDevice:1];
  [v5 setBatchLimit:25];
  [v5 setCloudStoreZone:v4];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer containerManager](self, "containerManager"));
  int v7 = (void *)objc_claimAutoreleasedReturnValue([v6 databaseForScope:2]);
  [v5 setContainerDatabase:v7];

  return v5;
}

- (id)allRecordsRequest
{
  v2 = objc_alloc(&OBJC_CLASS___PDCloudStoreRecordsRequest);
  return  -[PDCloudStoreRecordsRequest initWithRequestType:storeChanges:returnRecords:qualityOfService:groupName:groupNameSuffix:]( v2,  "initWithRequestType:storeChanges:returnRecords:qualityOfService:groupName:groupNameSuffix:",  1LL,  0LL,  1LL,  17LL,  PKCloudStoreOperationGroupInitialDownload,  PKCloudStoreOperationGroupSuffixPKPassdStartup);
}

- (id)changesRecordsRequest
{
  v2 = objc_alloc(&OBJC_CLASS___PDCloudStoreRecordsRequest);
  return  -[PDCloudStoreRecordsRequest initWithRequestType:storeChanges:returnRecords:qualityOfService:groupName:groupNameSuffix:]( v2,  "initWithRequestType:storeChanges:returnRecords:qualityOfService:groupName:groupNameSuffix:",  0LL,  1LL,  1LL,  17LL,  PKCloudStoreOperationGroupInitialDownload,  PKCloudStoreOperationGroupSuffixPKPassdStartup);
}

- (BOOL)didEncounterChangeTokenExpiredError:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v3 = a3;
  id v4 = [[PKCloudStoreError alloc] initWithError:v3];

  LOBYTE(v3) = [v4 isChangeTokenExpired];
  return (char)v3;
}

- (void)moveItemsFromResponse:(id)a3 duringDeltaSync:(BOOL)a4 orError:(id)a5 toContents:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  [v12 noteTypeOfSyncPerformed:v8];
  if (v11)
  {
    [v12 noteEnounteredError:v11];
  }

  else
  {
    v31 = self;
    id v30 = v10;
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    BOOL v13 = (void *)objc_claimAutoreleasedReturnValue([v10 cloudStoreRecords]);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 allItems]);

    id v15 = [v14 countByEnumeratingWithState:&v32 objects:v40 count:16];
    if (v15)
    {
      id v17 = v15;
      uint64_t v18 = *(void *)v33;
      do
      {
        for (i = 0LL; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v33 != v18) {
            objc_enumerationMutation(v14);
          }
          uint64_t v20 = *(void *)(*((void *)&v32 + 1) + 8LL * (void)i);
          uint64_t v21 = objc_opt_class(&OBJC_CLASS___PKPass, v16);
          if ((objc_opt_isKindOfClass(v20, v21) & 1) != 0)
          {
            [v12 appendPass:v20];
          }

          else
          {
            uint64_t v23 = objc_opt_class(&OBJC_CLASS___PKCatalog, v22);
            if ((objc_opt_isKindOfClass(v20, v23) & 1) == 0)
            {
              uint64_t v24 = (objc_class *)objc_opt_class(v20, v16);
              id v25 = NSStringFromClass(v24);
              v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
              uint64_t Object = PKLogFacilityTypeGetObject(9LL);
              v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
              {
                v29 = (void *)objc_claimAutoreleasedReturnValue( -[PDCloudStoreContainerConfiguration logDescription]( v31->_configuration,  "logDescription"));
                *(_DWORD *)buf = 138543618;
                v37 = v29;
                __int16 v38 = 2114;
                v39 = v26;
                _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "[PDPassCloudStore(%{public}@)] skipping item we can't handle %{public}@",  buf,  0x16u);
              }
            }
          }
        }

        id v17 = [v14 countByEnumeratingWithState:&v32 objects:v40 count:16];
      }

      while (v17);
    }

    id v11 = 0LL;
    id v10 = v30;
  }
}

- (void)moveItemsFromBatchContents:(id)a3 toFinalContents:(id)a4
{
  id v5 = a4;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "cloudPasses", 0));
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      id v10 = 0LL;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [v5 appendPassID:*(void *)(*((void *)&v11 + 1) + 8 * (void)v10)];
        id v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v8);
  }
}

- (void)retryExecutingAnyDroppedDownload
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_100072E08;
  v2[3] = &unk_100639300;
  v2[4] = self;
  -[PDPassSyncCloudStoreContainer onWorkQueue:](self, "onWorkQueue:", v2);
}

- (void)onWorkQueue:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer workQueue](self, "workQueue"));
  dispatch_async(v5, v4);
}

- (void)processFetchedCloudStoreDataWithModifiedRecordsByDatabaseIdentifier:(id)a3 deletedRecordsByDatabaseIdentifier:(id)a4 carriedOverRecordsByDatabaseIdentifier:(id)a5 conflictingRecordsByDatabaseIdentifier:(id)a6 request:(id)a7 completion:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  uint64_t v16 = (void (**)(id, void *, void, void *))a8;
  id v17 = a7;
  uint64_t v18 = PDCloudStoreRecordsRequestTypeToString((uint64_t)[v17 requestType]);
  __int128 v33 = v13;
  __int128 v34 = (void *)objc_claimAutoreleasedReturnValue(v18);
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"Private"]);
  id v20 = [v19 count];

  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:@"Private"]);
  id v22 = [v21 count];

  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:@"Private"]);
  id v24 = [v23 count];

  uint64_t Object = PKLogFacilityTypeGetObject(9LL);
  v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    int v27 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainerConfiguration logDescription](self->_configuration, "logDescription"));
    *(_DWORD *)buf = 138544386;
    v36 = v27;
    __int16 v37 = 2050;
    id v38 = v20;
    __int16 v39 = 2050;
    id v40 = v22;
    __int16 v41 = 2050;
    id v42 = v24;
    __int16 v43 = 2114;
    v44 = v34;
    _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "[PDPassCloudStore(%{public}@)] received a batch of updates:%{public}lu deletes:%{public}lu and conflicts:%{public} lu from request %{public}@",  buf,  0x34u);
  }

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[PDPassSyncCloudStoreContainer localStore](self, "localStore"));
  v29 = (void *)objc_claimAutoreleasedReturnValue([v28 reflectRemoteUpdates:v33 perRequest:v17]);

  id v30 = (void *)objc_claimAutoreleasedReturnValue(-[PDPassSyncCloudStoreContainer localStore](self, "localStore"));
  [v30 reflectRemoteDeletes:v14 perRequest:v17];

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[PDPassSyncCloudStoreContainer localStore](self, "localStore"));
  __int128 v32 = (void *)objc_claimAutoreleasedReturnValue([v31 convertConflicts:v15]);

  if (v16) {
    v16[2](v16, v29, 0LL, v32);
  }
}

- (void)updateCloudPasses:(id)a3 completion:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100073278;
  v8[3] = &unk_10063C450;
  id v9 = a3;
  id v10 = a4;
  v8[4] = self;
  id v6 = v9;
  id v7 = v10;
  -[PDPassSyncCloudStoreContainer onWorkQueue:](self, "onWorkQueue:", v8);
}

- (void)removeCloudPassesWithLocalUniqueIDs:(id)a3 completion:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100073678;
  v8[3] = &unk_10063C450;
  id v9 = a3;
  id v10 = a4;
  v8[4] = self;
  id v6 = v9;
  id v7 = v10;
  -[PDPassSyncCloudStoreContainer onWorkQueue:](self, "onWorkQueue:", v8);
}

- (id)cloudPassIDForLocalUniqueID:(id)a3 inDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 length])
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( -[PDPassSyncCloudStoreContainer cloudStoreZonesForItemType:configuration:action:inContainerDatabase:]( self,  "cloudStoreZonesForItemType:configuration:action:inContainerDatabase:",  2LL,  0LL,  3LL,  v7));
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[PKPass recordNameForUniqueID:](&OBJC_CLASS___PKPass, "recordNameForUniqueID:", v6));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 anyObject]);
    __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v10 recordZone]);
    __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v11 zoneID]);

    if (v9 && v12)
    {
      id v13 = -[CKRecordID initWithRecordName:zoneID:]( objc_alloc(&OBJC_CLASS___CKRecordID),  "initWithRecordName:zoneID:",  v9,  v12);
    }

    else
    {
      uint64_t Object = PKLogFacilityTypeGetObject(9LL);
      id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainerConfiguration logDescription](self->_configuration, "logDescription"));
        int v20 = 138543362;
        uint64_t v21 = v18;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "[PDPassCloudStore(%{public}@)] could not generate cloud pass ID",  (uint8_t *)&v20,  0xCu);
      }

      id v13 = 0LL;
    }
  }

  else
  {
    uint64_t v14 = PKLogFacilityTypeGetObject(9LL);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainerConfiguration logDescription](self->_configuration, "logDescription"));
      int v20 = 138543362;
      uint64_t v21 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v8,  OS_LOG_TYPE_DEFAULT,  "[PDPassCloudStore(%{public}@)] could not generate cloud pass ID given no local ID",  (uint8_t *)&v20,  0xCu);
    }

    id v13 = 0LL;
  }

  return v13;
}

- (void)performDeletes:(id)a3 completion:(id)a4
{
  id v6 = a4;
  uint64_t v7 = PKCloudStoreOperationGroupUserActionExplicit;
  uint64_t v8 = PKCloudStoreOperationGroupSuffixPassRemoved;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100073D9C;
  v10[3] = &unk_10063DC80;
  id v11 = v6;
  id v9 = v6;
  -[PDCloudStoreContainer modifyRecordsOperationWithRecordsToSaveByDatabaseIdentifier:recordIDsToDeleteByDatabaseIdentifier:recordModificationOperationConfiguration:emitErrorIfConflictDetected:isModifyingShare:operationGroupName:operationGroupNameSuffix:qualityOfService:completion:]( self,  "modifyRecordsOperationWithRecordsToSaveByDatabaseIdentifier:recordIDsToDeleteByDatabaseIdentifier:recordModification OperationConfiguration:emitErrorIfConflictDetected:isModifyingShare:operationGroupName:operationGroupNameSuffix:qual ityOfService:completion:",  0LL,  a3,  0LL,  0LL,  0LL,  v7,  v8,  17LL,  v10);
}

- (void)updateCloudCatalog:(id)a3 completion:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100074054;
  v8[3] = &unk_10063C450;
  id v9 = a3;
  id v10 = a4;
  v8[4] = self;
  id v6 = v9;
  id v7 = v10;
  -[PDPassSyncCloudStoreContainer onWorkQueue:](self, "onWorkQueue:", v8);
}

- (void)deleteCloudSyncRelatedInformation
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_100074438;
  v2[3] = &unk_100639300;
  v2[4] = self;
  -[PDPassSyncCloudStoreContainer onWorkQueue:](self, "onWorkQueue:", v2);
}

- (BOOL)isBusy
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t v4 = -[PDCloudStoreContainer nextExpectedState](self, "nextExpectedState");
  BOOL isDownloading = self->_isDownloading;
  os_unfair_lock_unlock(p_lock);
  if (v4 == 1) {
    return 0;
  }
  return isDownloading || v4 != 15;
}

- (void)_queue_cloudStoreAccountChanged:(id)a3
{
  if (PKIsCloudKitEnvironmentChangeHandlingDisabled(self, a2, a3))
  {
    uint64_t Object = PKLogFacilityTypeGetObject(9LL);
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainerConfiguration logDescription](self->_configuration, "logDescription"));
      *(_DWORD *)buf = 138543362;
      uint64_t v14 = v6;
      id v7 = "[PDPassCloudStore(%{public}@)] CKAccountChangedNotification disabled";
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v7, buf, 0xCu);

      goto LABEL_9;
    }

    goto LABEL_9;
  }

  if (-[PDCloudStoreContainer cloudContainerSetupInProgress](self, "cloudContainerSetupInProgress")
    || -[PDCloudStoreContainer accountChangedNotificationReceived](self, "accountChangedNotificationReceived"))
  {
    uint64_t v8 = PKLogFacilityTypeGetObject(9LL);
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainerConfiguration logDescription](self->_configuration, "logDescription"));
      *(_DWORD *)buf = 138543362;
      uint64_t v14 = v6;
      id v7 = "[PDPassCloudStore(%{public}@)] CKAccountChangedNotification ignored";
      goto LABEL_8;
    }

- (void)updateCloudStoreWithLocalItemsWithConfigurations:(id)a3 groupName:(id)a4 groupNameSuffix:(id)a5 qualityOfService:(int64_t)a6 completion:(id)a7
{
  id v12 = a7;
  id v13 = a5;
  id v14 = a4;
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[PDPassSyncCloudStoreContainer sanitizeItems:](self, "sanitizeItems:", a3));
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___PDPassSyncCloudStoreContainer;
  -[PDCloudStoreContainer updateCloudStoreWithLocalItemsWithConfigurations:groupName:groupNameSuffix:qualityOfService:completion:]( &v16,  "updateCloudStoreWithLocalItemsWithConfigurations:groupName:groupNameSuffix:qualityOfService:completion:",  v15,  v14,  v13,  a6,  v12);
}

- (id)sanitizeItems:(id)a3
{
  return objc_msgSend(a3, "pk_setByApplyingBlock:", &stru_10063DCC0);
}

- (id)recordTypesForCloudStoreItemType:(unint64_t)a3
{
  if (a3 == 3)
  {
    uint64_t v6 = PKCloudPassCatalogRecordType;
    id v3 = &v6;
  }

  else
  {
    if (a3 != 2)
    {
      unint64_t v4 = 0LL;
      return v4;
    }

    uint64_t v7 = PKCloudPassRecordType;
    id v3 = &v7;
  }

  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v3, 1LL));
  return v4;
}

- (unint64_t)cloudStoreItemTypeForRecordType:(id)a3
{
  id v3 = a3;
  unint64_t v4 = (void *)PKCloudPassRecordType;
  id v5 = v3;
  id v6 = v4;
  if (v6 == v5)
  {

    goto LABEL_7;
  }

  uint64_t v7 = v6;
  if (v5 && v6)
  {
    unsigned __int8 v8 = [v5 isEqualToString:v6];

    if ((v8 & 1) == 0) {
      goto LABEL_9;
    }
LABEL_7:
    unint64_t v9 = 2LL;
    goto LABEL_18;
  }

LABEL_9:
  id v10 = (void *)PKCloudPassCatalogRecordType;
  id v11 = v5;
  id v12 = v10;
  if (v12 == v11)
  {
  }

  else
  {
    id v13 = v12;
    if (!v5 || !v12)
    {

LABEL_17:
      unint64_t v9 = 0LL;
      goto LABEL_18;
    }

    unsigned int v14 = [v11 isEqualToString:v12];

    if (!v14) {
      goto LABEL_17;
    }
  }

  unint64_t v9 = 3LL;
LABEL_18:

  return v9;
}

- (id)identifierFromRecord:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 recordID]);
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 recordName]);

  id v5 = (char *)[v4 rangeOfString:@"-"];
  if (v5 != (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByReplacingCharactersInRange:withString:", 0, v5 + 1, &stru_100662310));

    unint64_t v4 = (void *)v6;
  }

  return v4;
}

- (id)recordTypeFromRecordName:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___PDPassSyncCloudStoreContainer;
  id v5 = -[PDCloudStoreContainer recordTypeFromRecordName:](&v15, "recordTypeFromRecordName:", v4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v7 = v6;
  if (!v6)
  {
    unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(+[PKPass recordNamePrefix](&OBJC_CLASS___PKPass, "recordNamePrefix"));
    unsigned int v9 = [v4 hasPrefix:v8];

    if (v9)
    {
      id v10 = (void **)&PKCloudPassRecordType;
    }

    else
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue(+[PKCatalog recordNamePrefix](&OBJC_CLASS___PKCatalog, "recordNamePrefix"));
      unsigned int v12 = [v4 hasPrefix:v11];

      if (!v12)
      {
        id v13 = 0LL;
        goto LABEL_8;
      }

      id v10 = (void **)&PKCloudPassCatalogRecordType;
    }

    uint64_t v7 = *v10;
  }

  id v13 = v7;
LABEL_8:

  return v13;
}

- (id)allPossibleZoneNamesForContainerDatabase:(id)a3
{
  if ([a3 scope] == (id)2) {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", PKCloudStorePassesZoneName));
  }
  else {
    id v3 = 0LL;
  }
  return v3;
}

- (id)allPossibleZoneSubscriptionsForContainerDatabase:(id)a3
{
  id v4 = a3;
  if ([v4 scope] == (id)2)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 zoneForZoneName:PKCloudStorePassesZoneName]);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( -[PDPassSyncCloudStoreContainer subscriptionForZone:inContainerDatabase:]( self,  "subscriptionForZone:inContainerDatabase:",  v5,  v4));

    if (v6) {
      uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v6));
    }
    else {
      uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSSet set](&OBJC_CLASS___NSSet, "set"));
    }
    unsigned __int8 v8 = (void *)v7;
  }

  else
  {
    unsigned __int8 v8 = 0LL;
  }

  return v8;
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
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 zoneID]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 zoneName]);
  unsigned __int8 v8 = (void *)PKCloudStorePassesZoneName;
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
    unsigned int v14 = objc_alloc(&OBJC_CLASS___CKRecordZoneSubscription);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 zoneID]);
    id v13 = -[CKRecordZoneSubscription initWithZoneID:subscriptionID:]( v14,  "initWithZoneID:subscriptionID:",  v6,  PKCloudStorePassesZoneSubscriptionID);
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
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 subscriptionID]);
  unsigned __int8 v8 = (void *)PKCloudStorePassesZoneSubscriptionID;
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
    id v9 = (id)objc_claimAutoreleasedReturnValue([v6 zoneForZoneName:PKCloudStorePassesZoneName]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v9 zoneID]);
LABEL_10:

    goto LABEL_11;
  }

- (id)cloudStoreZonesForItem:(id)a3 action:(unint64_t)a4 inContainerDatabase:(id)a5
{
  id v8 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[PDPassSyncCloudStoreContainer cloudStoreZonesForItemType:configuration:action:inContainerDatabase:]( self,  "cloudStoreZonesForItemType:configuration:action:inContainerDatabase:",  [a3 itemType],  0,  a4,  v8));

  return v9;
}

- (id)cloudStoreZonesForItemType:(unint64_t)a3 configuration:(id)a4 action:(unint64_t)a5 inContainerDatabase:(id)a6
{
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    id v7 = a6;
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer containerManager](self, "containerManager"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 cloudStoreZoneForZoneName:PKCloudStorePassesZoneName inContainerDatabase:v7]);

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

- (id)passesZone
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer containerManager](self, "containerManager"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 databaseForScope:2]);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer containerManager](self, "containerManager"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 cloudStoreZoneForZoneName:PKCloudStorePassesZoneName inContainerDatabase:v4]);

  return v6;
}

- (void)fetchDiagnosticInformation:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100075520;
  v4[3] = &unk_10063AC90;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  -[PDPassSyncCloudStoreContainer onWorkQueue:](v5, "onWorkQueue:", v4);
}

- (void)clearSyncToken
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_100075724;
  v2[3] = &unk_100639300;
  v2[4] = self;
  -[PDPassSyncCloudStoreContainer onWorkQueue:](self, "onWorkQueue:", v2);
}

- (void)resetMigration
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_1000758F0;
  v2[3] = &unk_100639300;
  v2[4] = self;
  -[PDPassSyncCloudStoreContainer onWorkQueue:](self, "onWorkQueue:", v2);
}

- (void)clearChangeHistory
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_1000759E0;
  v2[3] = &unk_100639300;
  v2[4] = self;
  -[PDPassSyncCloudStoreContainer onWorkQueue:](self, "onWorkQueue:", v2);
}

- (void)processChangeHistory
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_100075A60;
  v2[3] = &unk_100639300;
  v2[4] = self;
  -[PDPassSyncCloudStoreContainer onWorkQueue:](self, "onWorkQueue:", v2);
}

- (void)resetContents
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_100075ABC;
  v2[3] = &unk_100639300;
  v2[4] = self;
  -[PDPassSyncCloudStoreContainer onWorkQueue:](self, "onWorkQueue:", v2);
}

- (id)stateDescription
{
  return (id)PDCloudStoreContainerStateToUserString(-[PDCloudStoreContainer nextExpectedState](self, "nextExpectedState"));
}

- (id)lastSyncDateDescription
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_lastDownloadDate;
  os_unfair_lock_unlock(p_lock);
  if (v4)
  {
    id v5 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
    -[NSDateFormatter setDateStyle:](v5, "setDateStyle:", 1LL);
    -[NSDateFormatter setTimeStyle:](v5, "setTimeStyle:", 1LL);
    id v6 = (__CFString *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](v5, "stringFromDate:", v4));
  }

  else
  {
    id v6 = @"N/A";
  }

  return v6;
}

- (id)syncTokenDescription
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer containerManager](self, "containerManager"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PDPassSyncCloudStoreContainer passesZone](self, "passesZone"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 changeTokenForCloudStoreStore:v4]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 data]);
  id v7 = [v6 length];

  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 data]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 hexEncoding]);

    if ((unint64_t)[v9 length] > 0x15)
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 substringToIndex:11]);
      unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "substringFromIndex:", (char *)objc_msgSend(v9, "length") - 11));
      id v10 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@..%@",  v11,  v12));
    }

    else
    {
      id v10 = v9;
    }
  }

  else
  {
    id v10 = @"N/A";
  }

  return v10;
}

- (void)fetchDiagnosticSnapshot:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100075DE0;
  v4[3] = &unk_10063AC90;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  -[PDPassSyncCloudStoreContainer onWorkQueue:](v5, "onWorkQueue:", v4);
}

- (PDCardCloudManagerLocalStore)localStore
{
  return (PDCardCloudManagerLocalStore *)objc_loadWeakRetained((id *)&self->_localStore);
}

- (void)setLocalStore:(id)a3
{
}

- (PDCloudStoreStateConfiguration)stateConfiguration
{
  return self->_stateConfiguration;
}

- (void)setStateConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
}

@end