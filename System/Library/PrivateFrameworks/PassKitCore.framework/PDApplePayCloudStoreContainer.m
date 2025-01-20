@interface PDApplePayCloudStoreContainer
- (BOOL)_canFormShareFromCloudStoreRecord:(id)a3;
- (BOOL)_canFormShareLockFromCloudStoreRecord:(id)a3;
- (BOOL)_canFormTransactionFromCloudStoreRecord:(id)a3;
- (BOOL)_isAccountEventAssociatedObjectFromRecordType:(id)a3;
- (BOOL)_isAccountEventFromRecordType:(id)a3;
- (BOOL)_isAccountFromRecordType:(id)a3;
- (BOOL)_isCloudStoreZoneThePrimaryZoneForCurrentUser:(id)a3 containerDatabase:(id)a4;
- (BOOL)_isTransactionItemFromRecordType:(id)a3;
- (BOOL)_queue_canInitializeContainer;
- (BOOL)_queue_canInvalidateContainer;
- (BOOL)_queue_canSyncTransactionToCloudKit:(id)a3 forTransactionSourceIdentifier:(id)a4;
- (BOOL)_queue_isRelevantTransactionSourceIdentifier:(id)a3;
- (BOOL)canCoalesceRequest:(id)a3 withNewRequest:(id)a4;
- (BOOL)shouldContinueWithRequest:(id)a3;
- (BOOL)shouldForwardErrorsToRequestCompletionHandlers;
- (BOOL)supportsContainerChangeEventReports;
- (PDApplePayCloudStoreContainer)initWithDataSource:(id)a3 delegate:(id)a4 transactionProcessor:(id)a5 accountManager:(id)a6 paymentWebServiceCoordinator:(id)a7 peerPaymentWebServiceCoordinator:(id)a8 familyCircleManager:(id)a9 spotlightIndexer:(id)a10 notificationStreamManager:(id)a11;
- (id)_accountCreateDateForTranactionSourceIdentifier:(id)a3 passUniqueID:(id)a4;
- (id)_accountZoneNamesForAccount:(id)a3 containerDatabase:(id)a4;
- (id)_accountZoneNamesForAccountSet:(id)a3 containerDatabase:(id)a4;
- (id)_accountZoneNamesForAccountUser:(id)a3 containerDatabase:(id)a4;
- (id)_allPossibleCloudStoreZonesForFetchingWithTransactionSourceIdentifier:(id)a3;
- (id)_cloudStoreSpecificKeysForItem:(id)a3 paymentPass:(id)a4;
- (id)_originDeviceID;
- (id)_originDeviceIDForCloudStoreRecord:(id)a3;
- (id)_parseTransactionRecords:(id)a3 request:(id)a4 databaseIdentifier:(id)a5 updateReasons:(unint64_t)a6;
- (id)_paymentApplicationForPassUniqueIdentifier:(id)a3;
- (id)_peerPaymentZoneNamesForAccount:(id)a3 containerDatabase:(id)a4;
- (id)_queue_additionalTransactionSourceIdentifiersForProvisioningWithZone:(id)a3 transactionSourceIdentifiers:(id)a4;
- (id)_recordTypeForAccountEventRecord:(id)a3;
- (id)_recordsByFromAccountEvent:(id)a3 zone:(id)a4;
- (id)_stripToFirstDash:(id)a3;
- (id)_transactionSourceIdentifierForTransactionCloudStoreRecord:(id)a3 databaseIdentifier:(id)a4;
- (id)_transactionSourceIdentifierForTransactionRecordID:(id)a3 recordType:(id)a4 databaseIdentifier:(id)a5;
- (id)allPossibleZoneNamesForContainerDatabase:(id)a3;
- (id)allPossibleZoneNamesForContainerDatabase:(id)a3 itemType:(unint64_t)a4;
- (id)allPossibleZoneSubscriptionsForContainerDatabase:(id)a3;
- (id)cloudStoreSpecificKeysForItem:(id)a3;
- (id)cloudStoreZonesForItem:(id)a3 action:(unint64_t)a4 inContainerDatabase:(id)a5;
- (id)cloudStoreZonesForItemType:(unint64_t)a3 configuration:(id)a4 action:(unint64_t)a5 inContainerDatabase:(id)a6;
- (id)filterCloudStoreZones:(id)a3 action:(unint64_t)a4 inContainerDatabase:(id)a5;
- (id)identifierFromRecord:(id)a3;
- (id)possibleDatabaseSubscriptionForContainerDatabase:(id)a3;
- (id)primaryRecordTypesForCloudStoreItemType:(unint64_t)a3;
- (id)recordTypeFromRecordName:(id)a3;
- (id)recordTypesForCloudStoreItemType:(unint64_t)a3;
- (id)subscriptionForZone:(id)a3 inContainerDatabase:(id)a4;
- (id)zoneIDForSubscription:(id)a3 inContainerDatabase:(id)a4;
- (void)_addCloudStoreRecordsFromResponse:(id)a3 toTransactionSourceRecords:(id)a4 transactionSourceIdentifiers:(id)a5 passUniqueID:(id)a6;
- (void)_deleteLocalDataFromDeletedRecordsByDatabaseIdentifier:(id)a3;
- (void)_fetchAndStoreAppleCashItemWithRecordType:(id)a3 operationGroupName:(id)a4 operationGroupNameSuffix:(id)a5 zone:(id)a6 containerDatabase:(id)a7 transactionSourceIdentifiers:(id)a8 accountCreationDate:(id)a9 completion:(id)a10;
- (void)_fetchAndStoreAppleCashRecordsIfNecessaryForPassUniqueID:(id)a3 operationGroupName:(id)a4 operationGroupNameSuffix:(id)a5 completion:(id)a6;
- (void)_fetchMissingAccountEventsWithRecordParser:(id)a3 request:(id)a4 databaseIdentifier:(id)a5 carriedOverRecordsByDatabaseIdentifier:(id)a6 updateReasons:(unint64_t)a7 completion:(id)a8;
- (void)_fetchMissingTransactionRecordsWithRecordParser:(id)a3 request:(id)a4 databaseIdentifier:(id)a5 completion:(id)a6;
- (void)_fetchTaskOperationWithIdentifier:(id)a3 completedWithError:(id)a4;
- (void)_handleFamilyUpdateNotification:(id)a3;
- (void)_handlePeerPaymentAccountChanged:(id)a3;
- (void)_insertAccountBalanceUpdateNotificationIfNecessaryForAccount:(id)a3 record:(id)a4;
- (void)_parseAccountEventsFromRecordParser:(id)a3 databaseIdentifier:(id)a4 shouldUpdateLocalDatabase:(BOOL)a5 shouldReturn:(BOOL)a6 updateReasons:(unint64_t)a7 completion:(id)a8;
- (void)_parseAccountsFromRecordParser:(id)a3 databaseIdentifier:(id)a4 shouldUpdateLocalDatabase:(BOOL)a5 shouldReturn:(BOOL)a6 completion:(id)a7;
- (void)_processCounterpartImageDataWithRecordParser:(id)a3 request:(id)a4 databaseIdentifier:(id)a5 completion:(id)a6;
- (void)_processRecurringPaymentsWithRecordParser:(id)a3 request:(id)a4 databaseIdentifier:(id)a5 completion:(id)a6;
- (void)_processShareWithRecordParser:(id)a3 request:(id)a4 databaseIdentifier:(id)a5 completion:(id)a6;
- (void)_processZoneShareLockWithRecordParser:(id)a3 request:(id)a4 databaseIdentifier:(id)a5 completion:(id)a6;
- (void)_queue_aliasesForRecipientHandle:(id)a3 zoneName:(id)a4 completion:(id)a5;
- (void)_queue_cloudStoreAccountChanged:(id)a3;
- (void)_queue_cloudStoreZoneInvitationDataForInvitation:(id)a3 toRecipient:(id)a4 completion:(id)a5;
- (void)_queue_createOrRemoveZoneSharesForAccountsIfNecessaryWithCompletion:(id)a3;
- (void)_queue_createOrRemoveZoneSharesForPeerPaymentIfNecessaryWithCompletion:(id)a3;
- (void)_queue_createOrRemoveZoneSharesIfNecessaryWithCompletion:(id)a3;
- (void)_queue_didInvalidateContainer:(BOOL)a3;
- (void)_queue_ensureZoneShareIntegrity;
- (void)_queue_familyMembersByAltDSIDWithCompletion:(id)a3;
- (void)_queue_familyMembersWithCompletion:(id)a3;
- (void)_queue_markAllRunningFetchTasksWithError:(id)a3;
- (void)_queue_performFetchTasksBackgroundActivityForGroupName:(id)a3 suffix:(id)a4 completion:(id)a5;
- (void)_queue_performUnarchivedTransactionsBackgroundActivityForGroupName:(id)a3 suffix:(id)a4 completion:(id)a5;
- (void)_queue_processAccountChangeWithOldAccounts:(id)a3 newAccounts:(id)a4;
- (void)_queue_processPeerPaymentAccountChangeWithOldAccount:(id)a3 newPeerPaymentAccount:(id)a4;
- (void)_queue_processResultWithError:(id)a3 nextExpectedState:(unint64_t)a4 operationGroupNameSuffix:(id)a5 retryCount:(unint64_t)a6 shouldRetry:(BOOL)a7 completion:(id)a8;
- (void)_queue_processSharedAccountCloudStoreChangeWithOldSharedAccountCloudStore:(id)a3 newSharedAccountCloudStore:(id)a4;
- (void)_queue_setContainerState:(unint64_t)a3 operationGroupNameSuffix:(id)a4 retryCount:(unint64_t)a5 completion:(id)a6;
- (void)_queue_updateWithPossibleNewZonesToAdd:(id)a3 orphanedZones:(id)a4 containerDatabase:(id)a5;
- (void)_updateFetchTaskScheduledActivityIfNeccessary;
- (void)_updateUnarchivedTransactionsScheduledActivityIfNeccessary;
- (void)accountManager:(id)a3 accountUsersChanged:(id)a4 oldUsers:(id)a5 accountIdentifier:(id)a6;
- (void)accountManager:(id)a3 didAddAccount:(id)a4;
- (void)accountManager:(id)a3 didRemoveAccount:(id)a4;
- (void)accountManager:(id)a3 didUpdateAccount:(id)a4 oldAccount:(id)a5;
- (void)accountManager:(id)a3 sharedAccountCloudStoreChangedForAccountIdentifier:(id)a4;
- (void)backgroundModifiedRecordSyncForTranasctionSourceIdentifiers:(id)a3 fromDate:(id)a4 returnRecords:(BOOL)a5 formReport:(BOOL)a6 completion:(id)a7;
- (void)backgroundRecordChangedSyncForTranasctionSourceIdentifiers:(id)a3 completion:(id)a4;
- (void)bootstrapZoneWithName:(id)a3 completion:(id)a4;
- (void)canSyncTransactionFromCloudKitForTransactionSourceIdentifier:(id)a3 completion:(id)a4;
- (void)canSyncTransactionToCloudKit:(id)a3 forTransactionSourceIdentifier:(id)a4 completion:(id)a5;
- (void)coalesceApplePayRequest:(id)a3 withNewApplePayRequest:(id)a4;
- (void)coalesceRequest:(id)a3 withNewRequest:(id)a4;
- (void)containerResetCompletedWithSuccess:(BOOL)a3 error:(id)a4;
- (void)dealloc;
- (void)didUpdateSetupAssistantStateFrom:(unint64_t)a3 toState:(unint64_t)a4;
- (void)fetchAndStoreAccountEventsWithIdentifiers:(id)a3 completion:(id)a4;
- (void)fetchRecordsInAcceptedZoneShare:(id)a3 databaseIdentifier:(id)a4 operationGroupName:(id)a5 operationGroupNameSuffix:(id)a6 qualityOfService:(int64_t)a7 completion:(id)a8;
- (void)generateRandomTransactionForTransactionSourceIdentifier:(id)a3 completion:(id)a4;
- (void)invalidateCloudStoreIfPossibleWithOperationGroupNameSuffix:(id)a3 clearCache:(BOOL)a4;
- (void)passDidDisappear:(id)a3;
- (void)passProvisioningDidStartForPassUniqueID:(id)a3 transactionSourceIdentifiers:(id)a4 ignoreExistingRecordHash:(BOOL)a5 groupNameSuffix:(id)a6 completion:(id)a7;
- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4;
- (void)populateEvents:(id)a3 forAccountIdentifier:(id)a4 completion:(id)a5;
- (void)processFetchedCloudStoreDataWithModifiedRecordsByDatabaseIdentifier:(id)a3 deletedRecordsByDatabaseIdentifier:(id)a4 carriedOverRecordsByDatabaseIdentifier:(id)a5 conflictingRecordsByDatabaseIdentifier:(id)a6 request:(id)a7 completion:(id)a8;
- (void)requestUpdatesForTransactionSourceIdentifier:(id)a3;
- (void)syncTransactionsToCloudStoreOriginatedOnDevice:(unint64_t)a3;
- (void)uploadCounterpartImageData:(id)a3 completion:(id)a4;
- (void)uploadRecurringPayment:(id)a3 completion:(id)a4;
- (void)uploadTransaction:(id)a3 forTransactionSourceIdentifier:(id)a4 includeServerData:(BOOL)a5 completion:(id)a6;
@end

@implementation PDApplePayCloudStoreContainer

- (PDApplePayCloudStoreContainer)initWithDataSource:(id)a3 delegate:(id)a4 transactionProcessor:(id)a5 accountManager:(id)a6 paymentWebServiceCoordinator:(id)a7 peerPaymentWebServiceCoordinator:(id)a8 familyCircleManager:(id)a9 spotlightIndexer:(id)a10 notificationStreamManager:(id)a11
{
  id v17 = a3;
  id v18 = a4;
  id v63 = a5;
  id v62 = a6;
  id v61 = a7;
  id v60 = a8;
  id v59 = a9;
  id v58 = a10;
  v64.receiver = self;
  v64.super_class = (Class)&OBJC_CLASS___PDApplePayCloudStoreContainer;
  v19 = -[PDCloudStoreContainer initWithDataSource:notificationStreamManager:]( &v64,  "initWithDataSource:notificationStreamManager:",  v17,  a11);
  if (v19)
  {
    v19->_isInternalBuild = os_variant_has_internal_ui(PKOSVariantSubsystem);
    objc_storeWeak((id *)&v19->_applePayContainerDelegate, v18);
    objc_storeStrong((id *)&v19->_transactionProcessor, a5);
    objc_storeStrong((id *)&v19->_accountManager, a6);
    objc_storeStrong((id *)&v19->_peerPaymentWebServiceCoordinator, a8);
    objc_storeStrong((id *)&v19->_familyCircleManager, a9);
    objc_storeStrong((id *)&v19->_spotlightIndexer, a10);
    v20 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    backgroundTasksBeingRun = v19->_backgroundTasksBeingRun;
    v19->_backgroundTasksBeingRun = v20;

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer dataSource](v19, "dataSource"));
    uint64_t v23 = objc_claimAutoreleasedReturnValue([v22 peerPaymentAccount]);
    peerPaymentAccount = v19->_peerPaymentAccount;
    v19->_peerPaymentAccount = (PKPeerPaymentAccount *)v23;

    -[PDAccountManager registerObserver:](v19->_accountManager, "registerObserver:", v19);
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer dataSource](v19, "dataSource"));
    uint64_t v26 = objc_claimAutoreleasedReturnValue([v25 accounts]);
    accounts = v19->_accounts;
    v19->_accounts = (NSSet *)v26;

    objc_storeStrong((id *)&v19->_paymentWebServiceCoordinator, a7);
    v28 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    fetchTasks = v19->_fetchTasks;
    v19->_fetchTasks = v28;

    v19->_fetchTasksLock._os_unfair_lock_opaque = 0;
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer dataSource](v19, "dataSource"));
    uint64_t v31 = objc_claimAutoreleasedReturnValue([v30 sharedAccountCloudStoreByAccountIdentifier]);
    sharedAccountCloudStoreByAccountIdentifier = v19->_sharedAccountCloudStoreByAccountIdentifier;
    v19->_sharedAccountCloudStoreByAccountIdentifier = (NSDictionary *)v31;

    v33 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer dataSource](v19, "dataSource"));
    uint64_t v34 = objc_claimAutoreleasedReturnValue([v33 accountUsersByAccountIdentifier]);
    accountUsersByAccountIdentifier = v19->_accountUsersByAccountIdentifier;
    v19->_accountUsersByAccountIdentifier = (NSDictionary *)v34;

    uint64_t v36 = PKCurrentCloudStoreApplePayContainerName();
    v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
    uint64_t v38 = PKApplePayContainerEnvironment();
    id v39 = [[CKContainerID alloc] initWithContainerIdentifier:v37 environment:v38];
    uint64_t Object = PKLogFacilityTypeGetObject(9LL);
    v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v42 = CKContainerEnvironmentString(v38);
      v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
      *(_DWORD *)buf = 138412546;
      v66 = v37;
      __int16 v67 = 2112;
      v68 = v43;
      _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_DEFAULT,  "Creating container \"%@\" in environment \"%@\"",  buf,  0x16u);
    }

    id v44 = objc_alloc_init(&OBJC_CLASS___CKContainerOptions);
    [v44 setApplicationBundleIdentifierOverride:PKPassdBundleIdentifier];
    v45 = -[CKContainer initWithContainerID:options:]( objc_alloc(&OBJC_CLASS___CKContainer),  "initWithContainerID:options:",  v39,  v44);
    v46 = (void *)PKCloudStoreApplePayPrototypeContainerName;
    id v47 = v37;
    id v48 = v46;
    if (v47 == v48)
    {
    }

    else
    {
      v49 = v48;
      if (!v47 || !v48)
      {

        v51 = v47;
        goto LABEL_12;
      }

      unsigned int v50 = [v47 isEqualToString:v48];

      if (!v50) {
        goto LABEL_13;
      }
    }

    v51 = (void *)objc_claimAutoreleasedReturnValue(-[CKContainer options](v45, "options"));
    [v51 setUseZoneWidePCS:1];
LABEL_12:

LABEL_13:
    v52 = -[PDCloudStoreContainerManager initWithContainer:validScopes:cacheDataSource:databaseContainerDataSource:]( objc_alloc(&OBJC_CLASS___PDCloudStoreContainerManager),  "initWithContainer:validScopes:cacheDataSource:databaseContainerDataSource:",  v45,  &off_100690F08,  v17,  v19);
    -[PDCloudStoreContainer setContainerManager:](v19, "setContainerManager:", v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter"));
    [v53 addObserver:v19 selector:"_handlePeerPaymentAccountChanged:" name:PDPeerPaymentServiceAccountChangedDistributedNotification object:0];

    v54 = (void *)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter"));
    [v54 addObserver:v19 selector:"_handleFamilyUpdateNotification:" name:FAFamilyUpdateNotification object:0];

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver( DarwinNotifyCenter,  v19,  (CFNotificationCallback)sub_100088DF0,  @"INFamilyDidChangeNotification",  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
    v56 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer workQueue](v19, "workQueue"));
    PDScheduledActivityClientRegister(@"ApplePayCloudStoreContainerClientIdentifier", v19, v56);
  }

  return v19;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PDApplePayCloudStoreContainer;
  -[PDApplePayCloudStoreContainer dealloc](&v3, "dealloc");
}

- (void)invalidateCloudStoreIfPossibleWithOperationGroupNameSuffix:(id)a3 clearCache:(BOOL)a4
{
  id v6 = a3;
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer workQueue](self, "workQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100088F58;
  block[3] = &unk_10063B300;
  block[4] = self;
  id v10 = v6;
  BOOL v11 = a4;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (BOOL)shouldForwardErrorsToRequestCompletionHandlers
{
  return 1;
}

- (BOOL)_queue_canInitializeContainer
{
  uint64_t Object = PKLogFacilityTypeGetObject(9LL);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer containerManager](self, "containerManager"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 containerName]);
    *(_DWORD *)buf = 138412290;
    uint64_t v34 = (uint64_t)v6;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Checking if the %@ cloud store can be initalized.",  buf,  0xCu);
  }

  uint64_t v9 = PKIsMac(v7, v8);
  if ((_DWORD)v9)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Device is a Mac, no restrictions when registering for the cloud store",  buf,  2u);
    }

    int v11 = 1;
    v12 = v4;
  }

  else
  {
    uint64_t IsAvailable = PKSecureElementIsAvailable(v9, v10);
    int v14 = IsAvailable;
    if ((PKIsPhone(IsAvailable, v15) & 1) != 0 || (PKIsWatch() & 1) != 0 || (PKIsPad() & 1) != 0) {
      uint64_t v16 = 1LL;
    }
    else {
      uint64_t v16 = PKIsVision();
    }
    v32 = self;
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[PDPaymentWebServiceCoordinator sharedWebService]( self->_paymentWebServiceCoordinator,  "sharedWebService"));
    unsigned int v17 = -[os_log_s _needsRegistrationShouldCheckSecureElementOwnership:]( v12,  "_needsRegistrationShouldCheckSecureElementOwnership:",  v16);
    unsigned int v18 = -[os_log_s _canRegisterForPeerPayment](v12, "_canRegisterForPeerPayment");
    int v31 = v14;
    if (v14) {
      int v19 = v16 & (v17 ^ 1);
    }
    else {
      int v19 = 0;
    }
    unsigned int v20 = -[os_log_s _supportsAccounts](v12, "_supportsAccounts");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      if (v20) {
        v21 = @"YES";
      }
      else {
        v21 = @"NO";
      }
      *(_DWORD *)buf = 138543362;
      uint64_t v34 = (uint64_t)v21;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "PDApplePayCloudStoreContainer: Supports accounts %{public}@",  buf,  0xCu);
    }

    int v11 = v19 & (v18 | v20);

    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      if (v31) {
        v22 = @"YES";
      }
      else {
        v22 = @"NO";
      }
      if ((_DWORD)v16) {
        uint64_t v23 = @"YES";
      }
      else {
        uint64_t v23 = @"NO";
      }
      *(_DWORD *)buf = 138544130;
      uint64_t v34 = (uint64_t)v22;
      if (v17) {
        v24 = @"NO";
      }
      else {
        v24 = @"YES";
      }
      __int16 v35 = 2114;
      uint64_t v36 = v23;
      if (v18) {
        v25 = @"YES";
      }
      else {
        v25 = @"NO";
      }
      __int16 v37 = 2114;
      uint64_t v38 = v24;
      __int16 v39 = 2114;
      v40 = v25;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Secure element available: %{public}@, is on supported device: %{public}@, is broker registered: %{public}@, can register for peer payment: %{public}@",  buf,  0x2Au);
    }

    self = v32;
  }

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer containerManager](self, "containerManager"));
    uint64_t v27 = objc_claimAutoreleasedReturnValue([v26 containerName]);
    v28 = (void *)v27;
    if (v11) {
      v29 = @"YES";
    }
    else {
      v29 = @"NO";
    }
    *(_DWORD *)buf = 138412546;
    uint64_t v34 = v27;
    __int16 v35 = 2114;
    uint64_t v36 = v29;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Can initalize the %@ cloud store: %{public}@",  buf,  0x16u);
  }

  return v11;
}

- (BOOL)_queue_canInvalidateContainer
{
  NSUInteger v3 = -[NSSet count](self->_accounts, "count");
  v4 = (void *)objc_claimAutoreleasedReturnValue( -[PKPeerPaymentAccount associatedAccountInformation]( self->_peerPaymentAccount,  "associatedAccountInformation"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 associatedAccounts]);
  unint64_t v6 = (unint64_t)[v5 count];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentAccount associatedPassUniqueID](self->_peerPaymentAccount, "associatedPassUniqueID"));
  if (v7)
  {
    NSUInteger v8 = v3 | v6;
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer dataSource](self, "dataSource"));
    unsigned int v10 = [v9 passExistsWithUniqueID:v7];

    BOOL v11 = v8 != 0;
    int v12 = v10 ^ 1;
  }

  else
  {
    BOOL v11 = (v3 | v6) != 0;
    int v12 = 1;
  }

  int v13 = v12 & !v11;
  uint64_t Object = PKLogFacilityTypeGetObject(9LL);
  uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer containerManager](self, "containerManager"));
    uint64_t v17 = objc_claimAutoreleasedReturnValue([v16 containerName]);
    unsigned int v18 = (void *)v17;
    int v19 = @"NO";
    if (v13) {
      int v19 = @"YES";
    }
    int v21 = 138412546;
    uint64_t v22 = v17;
    __int16 v23 = 2112;
    v24 = v19;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Can invalidate cloud store container %@: %@",  (uint8_t *)&v21,  0x16u);
  }

  return v13;
}

- (id)cloudStoreSpecificKeysForItem:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___PKPaymentTransaction, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    id v7 = v4;
    NSUInteger v8 = (void *)objc_claimAutoreleasedReturnValue([v7 transactionSourceIdentifier]);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v7 serviceIdentifier]);
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v7 accountIdentifier]);
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue([v7 altDSID]);
    int v12 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer dataSource](self, "dataSource"));
    id v13 = [v12 transactionSourceTypeForTransactionSourceIdentifier:v8];

    int v14 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer dataSource](self, "dataSource"));
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( [v14 passUniqueIdentifierForTransactionWithServiceIdentifier:v9 transactionSourceIdentifier:v8]);

    if (!v15)
    {
      if ((unint64_t)v13 >= 2)
      {
        if (v13 == (id)2)
        {
          __int16 v23 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer dataSource](self, "dataSource"));
          int v19 = (void *)objc_claimAutoreleasedReturnValue([v23 accountUserWithAltDSID:v11 accountIdentifier:v10]);

          if (!v19 || [v19 accessLevel] != (id)1)
          {
            uint64_t v15 = 0LL;
            goto LABEL_14;
          }

          unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer dataSource](self, "dataSource"));
          uint64_t v21 = objc_claimAutoreleasedReturnValue([v20 passUniqueIdentifierWithAssociatedAccountIdentifier:v10]);
LABEL_12:
          uint64_t v15 = (void *)v21;

LABEL_14:
          goto LABEL_15;
        }

        uint64_t v15 = 0LL;
      }

      else
      {
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer dataSource](self, "dataSource"));
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v7 accountIdentifier]);
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v16,  "passUniqueIdentifierForTransactionWithServiceIdentifier:accountIdentifier:accountType:",  v9,  v17,  objc_msgSend(v7, "accountType")));

        if (!v15)
        {
          unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer dataSource](self, "dataSource"));
          int v19 = (void *)objc_claimAutoreleasedReturnValue( [v18 broadwayOrSurfTransactionSourceIdentifierForAmbiguousServiceIdentifier:v9 transactionAccountIde ntifier:0 transactionAccountType:0 transactionAltDSID:0]);

          unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer dataSource](self, "dataSource"));
          uint64_t v21 = objc_claimAutoreleasedReturnValue([v20 passUniqueIdentifierForTransactionSourceIdentifier:v19]);
          goto LABEL_12;
        }
      }
    }

- (void)_queue_cloudStoreAccountChanged:(id)a3
{
  id v4 = a3;
  uint64_t Object = PKLogFacilityTypeGetObject(9LL);
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Received CKAccountChangedNotification in PDApplePayCloudStoreContainer. Fetching latest account information.",  buf,  2u);
  }

  if (-[PDCloudStoreContainer cloudContainerSetupInProgress](self, "cloudContainerSetupInProgress")
    || -[PDCloudStoreContainer accountChangedNotificationReceived](self, "accountChangedNotificationReceived"))
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "A cloud store initialization is already in progess. This notification will be processed when initialization is done.",  buf,  2u);
    }

    -[PDCloudStoreContainer setAccountChangedNotificationReceived:](self, "setAccountChangedNotificationReceived:", 1LL);
  }

  else
  {
    -[PDCloudStoreContainer setAccountChangedNotificationReceived:](self, "setAccountChangedNotificationReceived:", 1LL);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_100089878;
    v7[3] = &unk_10063DB10;
    v7[4] = self;
    -[PDCloudStoreContainer _queue_cloudStoreAccountInformationWithCompletion:]( self,  "_queue_cloudStoreAccountInformationWithCompletion:",  v7);
  }
}

- (void)_queue_setContainerState:(unint64_t)a3 operationGroupNameSuffix:(id)a4 retryCount:(unint64_t)a5 completion:(id)a6
{
  unsigned int v10 = (NSMutableDictionary *)a4;
  id v11 = a6;
  uint64_t Object = PKLogFacilityTypeGetObject(9LL);
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = PDCloudStoreContainerStateToString(a3);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    *(_DWORD *)buf = 138543874;
    v82 = v15;
    __int16 v83 = 2114;
    v84 = v10;
    __int16 v85 = 2048;
    unint64_t v86 = a5;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "PDApplePayCloudStoreContainer: setContainerState called with state %{public}@, operationGroupNameSuffix: %{public} @, and retry count %lu",  buf,  0x20u);
  }

  if (-[PDCloudStoreContainer _queue_ensureContainerState:](self, "_queue_ensureContainerState:", a3))
  {
    if ((uint64_t)a3 > 3)
    {
      if (a3 == 4)
      {
        v67[0] = _NSConcreteStackBlock;
        v67[1] = 3221225472LL;
        v67[2] = sub_10008A460;
        v67[3] = &unk_10063E878;
        v67[4] = self;
        v68 = v10;
        unint64_t v70 = a5;
        id v69 = v11;
        -[PDCloudStoreContainer _queue_cloudStoreAccountInformationWithCompletion:]( self,  "_queue_cloudStoreAccountInformationWithCompletion:",  v67);

        v49 = v68;
LABEL_37:

        goto LABEL_38;
      }

      if (a3 == 15)
      {
        -[PDApplePayCloudStoreContainer _updateFetchTaskScheduledActivityIfNeccessary]( self,  "_updateFetchTaskScheduledActivityIfNeccessary");
        -[PDApplePayCloudStoreContainer _updateUnarchivedTransactionsScheduledActivityIfNeccessary]( self,  "_updateUnarchivedTransactionsScheduledActivityIfNeccessary");
        v65.receiver = self;
        v65.super_class = (Class)&OBJC_CLASS___PDApplePayCloudStoreContainer;
        -[PDCloudStoreContainer _queue_setContainerState:operationGroupNameSuffix:retryCount:completion:]( &v65,  "_queue_setContainerState:operationGroupNameSuffix:retryCount:completion:",  15LL,  v10,  a5,  v11);
        goto LABEL_38;
      }
    }

    else
    {
      if (a3 - 2 < 2)
      {
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer operationError](self, "operationError"));
        uint64_t v17 = v16;
        if (v16)
        {
          id v18 = v16;
        }

        else
        {
          NSErrorUserInfoKey v76 = NSLocalizedDescriptionKey;
          v77 = @"Detached from container while running operation";
          unsigned int v50 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v77,  &v76,  1LL));
          id v18 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKPassKitErrorDomain,  -5001LL,  v50));
        }

        -[PDApplePayCloudStoreContainer _queue_markAllRunningFetchTasksWithError:]( self,  "_queue_markAllRunningFetchTasksWithError:",  v18);
        os_unfair_lock_lock(&self->_fetchTasksLock);
        -[NSMutableDictionary removeAllObjects](self->_fetchTasks, "removeAllObjects");
        os_unfair_lock_unlock(&self->_fetchTasksLock);
        peerPaymentAccount = self->_peerPaymentAccount;
        self->_peerPaymentAccount = 0LL;

        accounts = self->_accounts;
        self->_accounts = 0LL;

        sharedAccountCloudStoreByAccountIdentifier = self->_sharedAccountCloudStoreByAccountIdentifier;
        self->_sharedAccountCloudStoreByAccountIdentifier = 0LL;

        accountUsersByAccountIdentifier = self->_accountUsersByAccountIdentifier;
        self->_accountUsersByAccountIdentifier = 0LL;

        v66.receiver = self;
        v66.super_class = (Class)&OBJC_CLASS___PDApplePayCloudStoreContainer;
        -[PDCloudStoreContainer _queue_setContainerState:operationGroupNameSuffix:retryCount:completion:]( &v66,  "_queue_setContainerState:operationGroupNameSuffix:retryCount:completion:",  a3,  v10,  a5,  v11);

        goto LABEL_38;
      }

      if (a3 == 1)
      {
        oslog = v13;
        unint64_t v61 = a5;
        id v62 = v11;
        unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer dataSource](self, "dataSource"));
        uint64_t v21 = (PKPeerPaymentAccount *)objc_claimAutoreleasedReturnValue([v20 peerPaymentAccount]);
        uint64_t v22 = self->_peerPaymentAccount;
        self->_peerPaymentAccount = v21;

        __int16 v23 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer dataSource](self, "dataSource"));
        v24 = (NSSet *)objc_claimAutoreleasedReturnValue([v23 accounts]);
        v25 = self->_accounts;
        self->_accounts = v24;

        uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer dataSource](self, "dataSource"));
        uint64_t v27 = (NSDictionary *)objc_claimAutoreleasedReturnValue([v26 sharedAccountCloudStoreByAccountIdentifier]);
        v28 = self->_sharedAccountCloudStoreByAccountIdentifier;
        self->_sharedAccountCloudStoreByAccountIdentifier = v27;

        v29 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer dataSource](self, "dataSource"));
        v30 = (NSDictionary *)objc_claimAutoreleasedReturnValue([v29 accountUsersByAccountIdentifier]);
        int v31 = self->_accountUsersByAccountIdentifier;
        self->_accountUsersByAccountIdentifier = v30;

        v32 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer dataSource](self, "dataSource"));
        v33 = (void *)objc_claimAutoreleasedReturnValue([v32 allRecordFetchTasks]);

        uint64_t v34 = self;
        os_unfair_lock_t lock = &self->_fetchTasksLock;
        os_unfair_lock_lock(&self->_fetchTasksLock);
        __int128 v74 = 0u;
        __int128 v75 = 0u;
        __int128 v72 = 0u;
        __int128 v73 = 0u;
        obj = v33;
        id v35 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v72,  v80,  16LL);
        if (v35)
        {
          id v36 = v35;
          uint64_t v37 = *(void *)v73;
          do
          {
            for (i = 0LL; i != v36; i = (char *)i + 1)
            {
              if (*(void *)v73 != v37) {
                objc_enumerationMutation(obj);
              }
              __int16 v39 = *(void **)(*((void *)&v72 + 1) + 8LL * (void)i);
              v40 = objc_autoreleasePoolPush();
              v41 = (void *)objc_claimAutoreleasedReturnValue([v39 identifier]);
              if ([v39 type]) {
                BOOL v42 = v41 == 0LL;
              }
              else {
                BOOL v42 = 1;
              }
              if (!v42)
              {
                v43 = objc_alloc_init(&OBJC_CLASS___PDApplePayCloudStoreRecordFetchOperation);
                -[PDApplePayCloudStoreRecordFetchOperation updateTask:](v43, "updateTask:", v39);
                fetchTasks = v34->_fetchTasks;
                v45 = (void *)objc_claimAutoreleasedReturnValue(-[PDApplePayCloudStoreRecordFetchOperation identifier](v43, "identifier"));
                -[NSMutableDictionary safelySetObject:forKey:](fetchTasks, "safelySetObject:forKey:", v43, v45);
              }

              objc_autoreleasePoolPop(v40);
            }

            id v36 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v72,  v80,  16LL);
          }

          while (v36);
        }

        os_unfair_lock_unlock(lock);
        v46 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer operationError](v34, "operationError"));
        id v47 = v46;
        if (v46)
        {
          id v48 = v46;
        }

        else
        {
          NSErrorUserInfoKey v78 = NSLocalizedDescriptionKey;
          v79 = @"Attaching to container while a while running operation";
          v55 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v79,  &v78,  1LL));
          id v48 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKPassKitErrorDomain,  -5001LL,  v55));
        }

        id v11 = v62;

        -[PDApplePayCloudStoreContainer _queue_markAllRunningFetchTasksWithError:]( v34,  "_queue_markAllRunningFetchTasksWithError:",  v48);
        os_unfair_lock_lock(lock);
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
        {
          v56 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer containerManager](v34, "containerManager"));
          v57 = (void *)objc_claimAutoreleasedReturnValue([v56 containerName]);
          id v58 = v34->_fetchTasks;
          *(_DWORD *)buf = 138412546;
          v82 = v57;
          __int16 v83 = 2112;
          v84 = v58;
          _os_log_impl( (void *)&_mh_execute_header,  oslog,  OS_LOG_TYPE_DEFAULT,  "Previous fetch tasks for container %@ are %@.",  buf,  0x16u);
        }

        os_unfair_lock_unlock(lock);
        v71.receiver = v34;
        v71.super_class = (Class)&OBJC_CLASS___PDApplePayCloudStoreContainer;
        -[PDCloudStoreContainer _queue_setContainerState:operationGroupNameSuffix:retryCount:completion:]( &v71,  "_queue_setContainerState:operationGroupNameSuffix:retryCount:completion:",  1LL,  v10,  v61,  v62);

        v49 = obj;
        goto LABEL_37;
      }
    }

    v64.receiver = self;
    v64.super_class = (Class)&OBJC_CLASS___PDApplePayCloudStoreContainer;
    -[PDCloudStoreContainer _queue_setContainerState:operationGroupNameSuffix:retryCount:completion:]( &v64,  "_queue_setContainerState:operationGroupNameSuffix:retryCount:completion:",  a3,  v10,  a5,  v11);
    goto LABEL_38;
  }

  if (v11)
  {
    int v19 = (void *)objc_claimAutoreleasedReturnValue( -[PDCloudStoreContainer errorWithCode:description:]( self,  "errorWithCode:description:",  -4006LL,  @"Invalid cloud store state"));
    (*((void (**)(id, void, void *))v11 + 2))(v11, 0LL, v19);
  }

- (void)_queue_markAllRunningFetchTasksWithError:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_fetchTasksLock);
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  obj = self->_fetchTasks;
  id v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v20,  v26,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v21;
    id v19 = v4;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v20 + 1) + 8LL * (void)i);
        unsigned int v10 = objc_autoreleasePoolPush();
        id v11 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_fetchTasks,  "objectForKeyedSubscript:",  v9));
        int v12 = (void *)objc_claimAutoreleasedReturnValue([v11 task]);
        id v13 = [v12 status];
        if (v13 == (id)4 || v13 == (id)1)
        {
          if (v4)
          {
            id v15 = v4;
          }

          else
          {
            NSErrorUserInfoKey v24 = NSLocalizedDescriptionKey;
            v25 = @"Unknown error occuring while task was running";
            uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v25,  &v24,  1LL));
            id v15 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKPassKitErrorDomain,  -1LL,  v16));
          }

          [v12 completeTaskWithError:v15];
          uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer dataSource](self, "dataSource"));
          [v17 updateRecordFetchTask:v12];

          id v4 = v19;
        }

        objc_autoreleasePoolPop(v10);
      }

      id v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v20,  v26,  16LL);
    }

    while (v6);
  }

  os_unfair_lock_unlock(&self->_fetchTasksLock);
}

- (BOOL)canCoalesceRequest:(id)a3 withNewRequest:(id)a4
{
  return _[a3 canCoalesceWithRequest:a4];
}

- (void)coalesceRequest:(id)a3 withNewRequest:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___PDApplePayCloudStoreRecordsRequest, v7);
  if ((objc_opt_isKindOfClass(v11, v8) & 1) != 0)
  {
    uint64_t v10 = objc_opt_class(&OBJC_CLASS___PDApplePayCloudStoreRecordsRequest, v9);
    if ((objc_opt_isKindOfClass(v6, v10) & 1) != 0) {
      -[PDApplePayCloudStoreContainer coalesceApplePayRequest:withNewApplePayRequest:]( self,  "coalesceApplePayRequest:withNewApplePayRequest:",  v11,  v6);
    }
  }
}

- (void)coalesceApplePayRequest:(id)a3 withNewApplePayRequest:(id)a4
{
  id v15 = a3;
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v15 transactionSourceIdentifiers]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 transactionSourceIdentifiers]);
  if ([v6 count] || objc_msgSend(v7, "count"))
  {
    if (v6)
    {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 setByAddingObjectsFromSet:v7]);
      [v15 setTransactionSourceIdentifiers:v8];
    }

    else
    {
      [v15 setTransactionSourceIdentifiers:v7];
    }
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v15 ignoreRecordsBeforeDate]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v5 ignoreRecordsBeforeDate]);
  char v11 = PKEqualObjects(v9, v10);

  if ((v11 & 1) == 0) {
    [v15 setIgnoreRecordsBeforeDate:0];
  }
  int v12 = (void *)objc_claimAutoreleasedReturnValue([v15 ignoreRecordsAfterDate]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v5 ignoreRecordsAfterDate]);
  char v14 = PKEqualObjects(v12, v13);

  if ((v14 & 1) == 0) {
    [v15 setIgnoreRecordsAfterDate:0];
  }
}

- (BOOL)shouldContinueWithRequest:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___PDApplePayCloudStoreRecordsRequest, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) == 0) {
    goto LABEL_13;
  }
  id v7 = v4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 transactionSourceIdentifiers]);
  id v9 = [v8 count];

  if (!v9)
  {

LABEL_13:
    unsigned __int8 v17 = 1;
    goto LABEL_14;
  }

  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "transactionSourceIdentifiers", 0));
  id v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v20;
LABEL_5:
    uint64_t v14 = 0LL;
    while (1)
    {
      if (*(void *)v20 != v13) {
        objc_enumerationMutation(v10);
      }
      uint64_t v15 = *(void *)(*((void *)&v19 + 1) + 8 * v14);
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer dataSource](self, "dataSource"));
      unsigned __int8 v17 = [v16 transactionSourceExistsWithIdentifier:v15];

      if ((v17 & 1) != 0) {
        break;
      }
      if (v12 == (id)++v14)
      {
        id v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v12) {
          goto LABEL_5;
        }
        break;
      }
    }
  }

  else
  {

    unsigned __int8 v17 = 0;
  }

- (void)_deleteLocalDataFromDeletedRecordsByDatabaseIdentifier:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10008AD24;
  v3[3] = &unk_10063A468;
  v3[4] = self;
  [a3 enumerateKeysAndObjectsUsingBlock:v3];
}

- (void)processFetchedCloudStoreDataWithModifiedRecordsByDatabaseIdentifier:(id)a3 deletedRecordsByDatabaseIdentifier:(id)a4 carriedOverRecordsByDatabaseIdentifier:(id)a5 conflictingRecordsByDatabaseIdentifier:(id)a6 request:(id)a7 completion:(id)a8
{
  id v55 = a3;
  id v14 = a4;
  id v53 = a5;
  id v54 = a6;
  id v15 = a7;
  id v51 = a8;
  unsigned int v50 = (void *)objc_claimAutoreleasedReturnValue( -[PDCloudStoreContainer reportContainerChangeIntervalBeginEventWithType:stateName:objectNames:operationGroupName:operationGroupNameSuffix:]( self,  "reportContainerChangeIntervalBeginEventWithType:stateName:objectNames:operationGroupName:operationGroupNameSuffix:",  33LL,  0LL,  0LL,  0LL,  0LL));
  -[PDApplePayCloudStoreContainer _deleteLocalDataFromDeletedRecordsByDatabaseIdentifier:]( self,  "_deleteLocalDataFromDeletedRecordsByDatabaseIdentifier:",  v14);
  else {
    uint64_t v16 = 0LL;
  }
  else {
    v52 = 0LL;
  }
  v74[0] = 0LL;
  v74[1] = v74;
  v74[2] = 0x3032000000LL;
  v74[3] = sub_10008BBF8;
  v74[4] = sub_10008BC08;
  id v75 = 0LL;
  unsigned __int8 v17 = (void *)objc_claimAutoreleasedReturnValue([v15 groupName]);
  id v18 = (void *)PKCloudStoreOperationGroupInitialDownload;
  id v19 = v17;
  id v20 = v18;
  if (v19 == v20) {
    goto LABEL_25;
  }
  __int128 v21 = v20;
  if (v19 && v20)
  {
    unsigned __int8 v22 = [v19 isEqualToString:v20];

    if ((v22 & 1) != 0) {
      goto LABEL_26;
    }
  }

  else
  {
  }

  __int128 v23 = (void *)PKCloudStoreOperationGroupInitialUpload;
  id v24 = v19;
  id v25 = v23;
  if (v24 == v25) {
    goto LABEL_25;
  }
  uint64_t v26 = v25;
  if (v19 && v25)
  {
    unsigned __int8 v27 = [v24 isEqualToString:v25];

    if ((v27 & 1) != 0) {
      goto LABEL_26;
    }
  }

  else
  {
  }

  v28 = (void *)PKCloudStoreOperationGroupInitialSetup;
  id v29 = v24;
  id v30 = v28;
  if (v29 == v30)
  {
LABEL_25:
  }

  else
  {
    int v31 = v30;
    if (!v19 || !v30)
    {

LABEL_34:
      uint64_t v34 = 0LL;
      uint64_t v33 = 0LL;
      goto LABEL_27;
    }

    unsigned __int8 v32 = [v29 isEqualToString:v30];

    if ((v32 & 1) == 0) {
      goto LABEL_34;
    }
  }

- (void)_queue_processResultWithError:(id)a3 nextExpectedState:(unint64_t)a4 operationGroupNameSuffix:(id)a5 retryCount:(unint64_t)a6 shouldRetry:(BOOL)a7 completion:(id)a8
{
  BOOL v9 = a7;
  id v14 = a3;
  id v15 = a5;
  id v16 = a8;
  id v17 = [[PKCloudStoreError alloc] initWithError:v14];
  if ([v17 isManateeNotAvailableError])
  {
    uint64_t Object = PKLogFacilityTypeGetObject(9LL);
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Received manatee is not available error. This is most likely do to the fact HSA2 is not enabled. Detaching from container.",  buf,  2u);
    }

    PKAnalyticsSendEvent(PKAggDKeyCloudStoreFailureManateeNotAvailableError, 0LL);
    -[PDCloudStoreContainer setNextExpectedState:](self, "setNextExpectedState:", 3LL);
    -[PDCloudStoreContainer setOperationError:](self, "setOperationError:", v14);
    -[PDApplePayCloudStoreContainer _queue_setContainerState:operationGroupNameSuffix:retryCount:completion:]( self,  "_queue_setContainerState:operationGroupNameSuffix:retryCount:completion:",  3LL,  v15,  a6,  v16);
  }

  else
  {
    v20.receiver = self;
    v20.super_class = (Class)&OBJC_CLASS___PDApplePayCloudStoreContainer;
    -[PDCloudStoreContainer _queue_processResultWithError:nextExpectedState:operationGroupNameSuffix:retryCount:shouldRetry:completion:]( &v20,  "_queue_processResultWithError:nextExpectedState:operationGroupNameSuffix:retryCount:shouldRetry:completion:",  v14,  a4,  v15,  a6,  v9,  v16);
  }
}

- (id)recordTypesForCloudStoreItemType:(unint64_t)a3
{
  switch(a3)
  {
    case 1uLL:
      v16[0] = PKCloudTransactionRecordType;
      v16[1] = PKCloudTransactionDeviceDataRecordType;
      uint64_t v5 = v16;
      uint64_t v6 = 2LL;
      goto LABEL_9;
    case 5uLL:
      v15[0] = PKCloudAccountEventRecordType;
      v15[1] = PKCloudAccountRewardsRecordType;
      v15[2] = PKCloudCreditAccountStatementRecordType;
      v15[3] = PKCloudAccountServicingRecordType;
      v15[4] = PKCloudAccountPaymentRecordType;
      v15[5] = PKCloudAccountPaymentReminderRecordType;
      v15[6] = PKCloudAccountCreditTermsUpdateRecordType;
      v15[7] = PKCloudAccountPhysicalCardStatusUpdateRecordType;
      v15[8] = PKCloudAccountPhysicalCardShippingUpdateRecordType;
      v15[9] = PKCloudAccountVirtualCardStatusUpdateRecordType;
      v15[10] = PKCloudAccountBillPaymentSelectedSuggestedAmountRecordType;
      v15[11] = PKCloudAccountUserInfoRecordType;
      v15[12] = PKCloudAccountAssistanceProgramRecordType;
      v15[13] = PKCloudAccountTransferRecordType;
      v15[14] = PKCloudAccountHoldRecordType;
      uint64_t v5 = v15;
      uint64_t v6 = 15LL;
      goto LABEL_9;
    case 7uLL:
      uint64_t v14 = PKCloudAccountRecordType;
      uint64_t v5 = &v14;
      goto LABEL_8;
    case 8uLL:
      uint64_t v13 = PKCloudShareCreationLockRecordType;
      uint64_t v5 = &v13;
      goto LABEL_8;
    case 9uLL:
      uint64_t v12 = PKCloudRecurringPaymentMemoRecordType;
      uint64_t v5 = &v12;
      goto LABEL_8;
    case 0xAuLL:
      uint64_t v11 = PKCloudCounterpartImageRecordType;
      uint64_t v5 = &v11;
LABEL_8:
      uint64_t v6 = 1LL;
LABEL_9:
      id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v5, v6));
      if (!v7) {
        goto LABEL_10;
      }
      return v7;
    default:
LABEL_10:
      v10.receiver = self;
      v10.super_class = (Class)&OBJC_CLASS___PDApplePayCloudStoreContainer;
      id v8 = -[PDCloudStoreContainer recordTypesForCloudStoreItemType:](&v10, "recordTypesForCloudStoreItemType:", a3);
      id v7 = (void *)objc_claimAutoreleasedReturnValue(v8);
      return v7;
  }

- (id)primaryRecordTypesForCloudStoreItemType:(unint64_t)a3
{
  switch(a3)
  {
    case 1uLL:
      v16[0] = PKCloudTransactionRecordType;
      v16[1] = PKCloudTransactionDeviceDataRecordType;
      uint64_t v5 = v16;
      uint64_t v6 = 2LL;
      goto LABEL_9;
    case 5uLL:
      uint64_t v15 = PKCloudAccountEventRecordType;
      uint64_t v5 = &v15;
      goto LABEL_8;
    case 7uLL:
      uint64_t v14 = PKCloudAccountRecordType;
      uint64_t v5 = &v14;
      goto LABEL_8;
    case 8uLL:
      uint64_t v13 = PKCloudShareCreationLockRecordType;
      uint64_t v5 = &v13;
      goto LABEL_8;
    case 9uLL:
      uint64_t v12 = PKCloudRecurringPaymentMemoRecordType;
      uint64_t v5 = &v12;
      goto LABEL_8;
    case 0xAuLL:
      uint64_t v11 = PKCloudCounterpartImageRecordType;
      uint64_t v5 = &v11;
LABEL_8:
      uint64_t v6 = 1LL;
LABEL_9:
      id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v5, v6));
      if (!v7) {
        goto LABEL_10;
      }
      return v7;
    default:
LABEL_10:
      v10.receiver = self;
      v10.super_class = (Class)&OBJC_CLASS___PDApplePayCloudStoreContainer;
      id v8 = -[PDCloudStoreContainer primaryRecordTypesForCloudStoreItemType:]( &v10,  "primaryRecordTypesForCloudStoreItemType:",  a3);
      id v7 = (void *)objc_claimAutoreleasedReturnValue(v8);
      return v7;
  }

- (id)identifierFromRecord:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 recordType]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 recordID]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 recordName]);

  if (-[PDApplePayCloudStoreContainer _isAccountEventFromRecordType:](self, "_isAccountEventFromRecordType:", v5))
  {
LABEL_2:
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 recordID]);
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v8 recordName]);
    id v10 = (id)objc_claimAutoreleasedReturnValue(-[PDApplePayCloudStoreContainer _stripToFirstDash:](self, "_stripToFirstDash:", v9));
LABEL_3:
    uint64_t v11 = (uint64_t)v10;
    goto LABEL_21;
  }

  if (!-[PDApplePayCloudStoreContainer _isAccountEventAssociatedObjectFromRecordType:]( self,  "_isAccountEventAssociatedObjectFromRecordType:",  v5))
  {
    if (![v5 isEqualToString:PKCloudTransactionDeviceDataRecordType])
    {
      if (![v5 isEqualToString:PKCloudShareCreationLockRecordType])
      {
        if (v7) {
          goto LABEL_25;
        }
        goto LABEL_22;
      }

      goto LABEL_2;
    }

    id v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pk_referenceForKey:", PKPaymentTransactionReferenceFromDeviceData));
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v8 recordID]);
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v13 recordName]);

    if (!v9) {
      goto LABEL_19;
    }
    id v14 = v9;
    id v15 = v7;
    id v16 = v15;
    if (v14 != v15)
    {
      if (v15)
      {
        unsigned __int8 v17 = [v14 isEqualToString:v15];

        if ((v17 & 1) != 0) {
          goto LABEL_19;
        }
      }

      else
      {
      }

      if ([v16 containsString:v14])
      {
        id v10 = v14;
        BOOL v9 = v10;
        id v7 = v16;
        goto LABEL_3;
      }

      goto LABEL_19;
    }

LABEL_19:
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v4 recordID]);
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v12 recordName]);
    uint64_t v11 = objc_claimAutoreleasedReturnValue(-[PDApplePayCloudStoreContainer _stripToFirstDash:](self, "_stripToFirstDash:", v18));

    goto LABEL_20;
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pk_referenceForKey:", PKAccountEventReferenceFromAssociatedObject));
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v8 recordID]);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v9 recordName]);
  uint64_t v11 = objc_claimAutoreleasedReturnValue(-[PDApplePayCloudStoreContainer _stripToFirstDash:](self, "_stripToFirstDash:", v12));

LABEL_20:
  id v7 = v12;
LABEL_21:

  id v7 = (void *)v11;
  if (v11) {
    goto LABEL_25;
  }
LABEL_22:
  uint64_t Object = PKLogFacilityTypeGetObject(9LL);
  objc_super v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v4 recordID]);
    unsigned __int8 v22 = (void *)objc_claimAutoreleasedReturnValue([v21 recordName]);
    __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v4 recordType]);
    int v25 = 138543618;
    uint64_t v26 = v22;
    __int16 v27 = 2114;
    v28 = v23;
    _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Could not identify %{public}@, type: %{public}@",  (uint8_t *)&v25,  0x16u);
  }

LABEL_25:
  return v7;
}

- (id)recordTypeFromRecordName:(id)a3
{
  id v4 = a3;
  v51.receiver = self;
  v51.super_class = (Class)&OBJC_CLASS___PDApplePayCloudStoreContainer;
  id v5 = -[PDCloudStoreContainer recordTypeFromRecordName:](&v51, "recordTypeFromRecordName:", v4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = v6;
  if (!v6)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[PKPaymentTransaction recordNamePrefix](&OBJC_CLASS___PKPaymentTransaction, "recordNamePrefix"));
    unsigned int v9 = [v4 hasPrefix:v8];

    if (v9)
    {
      id v10 = (void **)&PKCloudTransactionDeviceDataRecordType;
    }

    else
    {
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[PKAccountEvent recordNamePrefix](&OBJC_CLASS___PKAccountEvent, "recordNamePrefix"));
      unsigned int v12 = [v4 hasPrefix:v11];

      if (v12)
      {
        id v10 = (void **)&PKCloudAccountEventRecordType;
      }

      else
      {
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[PKAccountRewards recordNamePrefix](&OBJC_CLASS___PKAccountRewards, "recordNamePrefix"));
        unsigned int v14 = [v4 hasPrefix:v13];

        if (v14)
        {
          id v10 = (void **)&PKCloudAccountRewardsRecordType;
        }

        else
        {
          id v15 = (void *)objc_claimAutoreleasedReturnValue( +[PKCreditAccountStatement recordNamePrefix]( &OBJC_CLASS___PKCreditAccountStatement,  "recordNamePrefix"));
          unsigned int v16 = [v4 hasPrefix:v15];

          if (v16)
          {
            id v10 = (void **)&PKCloudCreditAccountStatementRecordType;
          }

          else
          {
            unsigned __int8 v17 = (void *)objc_claimAutoreleasedReturnValue( +[PKAccountServicingEvent recordNamePrefix]( &OBJC_CLASS___PKAccountServicingEvent,  "recordNamePrefix"));
            unsigned int v18 = [v4 hasPrefix:v17];

            if (v18)
            {
              id v10 = (void **)&PKCloudAccountServicingRecordType;
            }

            else
            {
              id v19 = (void *)objc_claimAutoreleasedReturnValue(+[PKAccountPayment recordNamePrefix](&OBJC_CLASS___PKAccountPayment, "recordNamePrefix"));
              unsigned int v20 = [v4 hasPrefix:v19];

              if (v20)
              {
                id v10 = (void **)&PKCloudAccountPaymentRecordType;
              }

              else
              {
                __int128 v21 = (void *)objc_claimAutoreleasedReturnValue( +[PKAccountTransfer recordNamePrefix]( &OBJC_CLASS___PKAccountTransfer,  "recordNamePrefix"));
                unsigned int v22 = [v4 hasPrefix:v21];

                if (v22)
                {
                  id v10 = (void **)&PKCloudAccountTransferRecordType;
                }

                else
                {
                  __int128 v23 = (void *)objc_claimAutoreleasedReturnValue(+[PKAccountHold recordNamePrefix](&OBJC_CLASS___PKAccountHold, "recordNamePrefix"));
                  unsigned int v24 = [v4 hasPrefix:v23];

                  if (v24)
                  {
                    id v10 = (void **)&PKCloudAccountHoldRecordType;
                  }

                  else
                  {
                    int v25 = (void *)objc_claimAutoreleasedReturnValue( +[PKAccountPaymentReminder recordNamePrefix]( &OBJC_CLASS___PKAccountPaymentReminder,  "recordNamePrefix"));
                    unsigned int v26 = [v4 hasPrefix:v25];

                    if (v26)
                    {
                      id v10 = (void **)&PKCloudAccountPaymentReminderRecordType;
                    }

                    else
                    {
                      __int16 v27 = (void *)objc_claimAutoreleasedReturnValue( +[PKAccountCreditTermsUpdate recordNamePrefix]( &OBJC_CLASS___PKAccountCreditTermsUpdate,  "recordNamePrefix"));
                      unsigned int v28 = [v4 hasPrefix:v27];

                      if (v28)
                      {
                        id v10 = (void **)&PKCloudAccountCreditTermsUpdateRecordType;
                      }

                      else
                      {
                        id v29 = (void *)objc_claimAutoreleasedReturnValue( +[PKAccountPhysicalCardStatusUpdate recordNamePrefix]( &OBJC_CLASS___PKAccountPhysicalCardStatusUpdate,  "recordNamePrefix"));
                        unsigned int v30 = [v4 hasPrefix:v29];

                        if (v30)
                        {
                          id v10 = (void **)&PKCloudAccountPhysicalCardStatusUpdateRecordType;
                        }

                        else
                        {
                          int v31 = (void *)objc_claimAutoreleasedReturnValue( +[PKAccountPhysicalCardShippingUpdate recordNamePrefix]( &OBJC_CLASS___PKAccountPhysicalCardShippingUpdate,  "recordNamePrefix"));
                          unsigned int v32 = [v4 hasPrefix:v31];

                          if (v32)
                          {
                            id v10 = (void **)&PKCloudAccountPhysicalCardShippingUpdateRecordType;
                          }

                          else
                          {
                            uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue( +[PKAccountVirtualCardStatusUpdate recordNamePrefix]( &OBJC_CLASS___PKAccountVirtualCardStatusUpdate,  "recordNamePrefix"));
                            unsigned int v34 = [v4 hasPrefix:v33];

                            if (v34)
                            {
                              id v10 = (void **)&PKCloudAccountVirtualCardStatusUpdateRecordType;
                            }

                            else
                            {
                              id v35 = (void *)objc_claimAutoreleasedReturnValue( +[PKBillPaymentSelectedSuggestedAmountData recordNamePrefix]( &OBJC_CLASS___PKBillPaymentSelectedSuggestedAmountData,  "recordNamePrefix"));
                              unsigned int v36 = [v4 hasPrefix:v35];

                              if (v36)
                              {
                                id v10 = (void **)&PKCloudAccountBillPaymentSelectedSuggestedAmountRecordType;
                              }

                              else
                              {
                                id v37 = (void *)objc_claimAutoreleasedReturnValue( +[PKAccountUserInfoUpdate recordNamePrefix]( &OBJC_CLASS___PKAccountUserInfoUpdate,  "recordNamePrefix"));
                                unsigned int v38 = [v4 hasPrefix:v37];

                                if (v38)
                                {
                                  id v10 = (void **)&PKCloudAccountUserInfoRecordType;
                                }

                                else
                                {
                                  id v39 = (void *)objc_claimAutoreleasedReturnValue( +[PKAccountAssistanceProgramMessage recordNamePrefix]( &OBJC_CLASS___PKAccountAssistanceProgramMessage,  "recordNamePrefix"));
                                  unsigned int v40 = [v4 hasPrefix:v39];

                                  if (v40)
                                  {
                                    id v10 = (void **)&PKCloudAccountAssistanceProgramRecordType;
                                  }

                                  else
                                  {
                                    id v41 = (void *)objc_claimAutoreleasedReturnValue( +[PKAccount recordNamePrefix]( &OBJC_CLASS___PKAccount,  "recordNamePrefix"));
                                    unsigned int v42 = [v4 hasPrefix:v41];

                                    if (v42)
                                    {
                                      id v10 = (void **)&PKCloudAccountRecordType;
                                    }

                                    else
                                    {
                                      v43 = (void *)objc_claimAutoreleasedReturnValue( +[PKCloudStoreZoneShareLock recordNamePrefix]( &OBJC_CLASS___PKCloudStoreZoneShareLock,  "recordNamePrefix"));
                                      unsigned int v44 = [v4 hasPrefix:v43];

                                      if (v44)
                                      {
                                        id v10 = (void **)&PKCloudShareCreationLockRecordType;
                                      }

                                      else
                                      {
                                        id v45 = (void *)objc_claimAutoreleasedReturnValue( +[PKPeerPaymentRecurringPayment recordNamePrefix]( &OBJC_CLASS___PKPeerPaymentRecurringPayment,  "recordNamePrefix"));
                                        unsigned int v46 = [v4 hasPrefix:v45];

                                        if (v46)
                                        {
                                          id v10 = (void **)&PKCloudRecurringPaymentMemoRecordType;
                                        }

                                        else
                                        {
                                          id v47 = (void *)objc_claimAutoreleasedReturnValue( +[PKPeerPaymentCounterpartImageData recordNamePrefix]( &OBJC_CLASS___PKPeerPaymentCounterpartImageData,  "recordNamePrefix"));
                                          unsigned int v48 = [v4 hasPrefix:v47];

                                          if (v48) {
                                            id v10 = (void **)&PKCloudCounterpartImageRecordType;
                                          }
                                          else {
                                            id v10 = (void **)&PKCloudTransactionRecordType;
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }

    id v7 = *v10;
  }

  id v49 = v7;

  return v49;
}

- (id)_stripToFirstDash:(id)a3
{
  id v3 = [a3 copy];
  id v4 = (char *)[v3 rangeOfString:@"-"];
  if (v4 != (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByReplacingCharactersInRange:withString:", 0, v4 + 1, &stru_100662310));

    id v3 = (id)v5;
  }

  return v3;
}

- (void)_queue_cloudStoreZoneInvitationDataForInvitation:(id)a3 toRecipient:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v8 zoneName]);
    v36[3] = 0LL;
    uint64_t v37 = 0LL;
    v36[0] = 0LL;
    v36[1] = v36;
    v36[2] = 0x2020000000LL;
    v34[0] = 0LL;
    v34[1] = v34;
    v34[2] = 0x3032000000LL;
    v34[3] = sub_10008BBF8;
    v34[4] = sub_10008BC08;
    id v35 = 0LL;
    id v32 = 0LL;
    id v33 = 0LL;
    +[PKCloudStoreZone zoneValueForZoneName:outZoneType:outAccountIdentifier:altDSID:]( &OBJC_CLASS___PKCloudStoreZone,  "zoneValueForZoneName:outZoneType:outAccountIdentifier:altDSID:",  v11,  &v37,  &v33,  &v32);
    id v12 = v33;
    id v13 = v32;
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_10008E81C;
    v25[3] = &unk_10063EB38;
    uint64_t v31 = v37;
    v25[4] = self;
    id v29 = v34;
    id v14 = v9;
    id v26 = v14;
    unsigned int v30 = v36;
    id v15 = v12;
    id v27 = v15;
    id v16 = v13;
    id v28 = v16;
    unsigned __int8 v17 = objc_retainBlock(v25);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_10008EF64;
    v19[3] = &unk_10063EBD8;
    v19[4] = self;
    id v22 = v10;
    __int128 v23 = v34;
    id v20 = v14;
    id v18 = v11;
    id v21 = v18;
    unsigned int v24 = v36;
    ((void (*)(void *, void *))v17[2])(v17, v19);

    _Block_object_dispose(v34, 8);
    _Block_object_dispose(v36, 8);
  }
}

- (void)_queue_aliasesForRecipientHandle:(id)a3 zoneName:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = v10;
  if (v10)
  {
    if (v8)
    {
      id v12 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
      -[NSMutableSet pk_safelyAddObject:](v12, "pk_safelyAddObject:", v8);
      id v23 = 0LL;
      uint64_t v24 = 0LL;
      +[PKCloudStoreZone zoneValueForZoneName:outZoneType:outAccountIdentifier:altDSID:]( &OBJC_CLASS___PKCloudStoreZone,  "zoneValueForZoneName:outZoneType:outAccountIdentifier:altDSID:",  v9,  &v24,  &v23,  0LL);
      id v13 = v23;
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472LL;
      void v16[2] = sub_10008FA20;
      v16[3] = &unk_10063EC00;
      id v17 = v8;
      id v18 = v12;
      uint64_t v22 = v24;
      id v19 = self;
      id v20 = v13;
      id v21 = v11;
      id v14 = v13;
      id v15 = v12;
      -[PDApplePayCloudStoreContainer _queue_familyMembersWithCompletion:]( self,  "_queue_familyMembersWithCompletion:",  v16);
    }

    else
    {
      (*((void (**)(id, void))v10 + 2))(v10, 0LL);
    }
  }
}

- (BOOL)supportsContainerChangeEventReports
{
  if (self->_isInternalBuild) {
    return PKDisableContainerChangeEvents() ^ 1;
  }
  else {
    return 0;
  }
}

- (void)didUpdateSetupAssistantStateFrom:(unint64_t)a3 toState:(unint64_t)a4
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___PDApplePayCloudStoreContainer;
  -[PDCloudStoreContainer didUpdateSetupAssistantStateFrom:toState:](&v12, "didUpdateSetupAssistantStateFrom:toState:");
  if (a3 != 3 && a4 == 3)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(9LL);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer containerManager](self, "containerManager"));
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 containerName]);
      *(_DWORD *)buf = 138412290;
      id v14 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Cloud store setup assistant has completed. Starting initialization now for %@",  buf,  0xCu);
    }

    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10008FE94;
    v11[3] = &unk_10063AFC0;
    v11[4] = self;
    -[PDCloudStoreContainer initialCloudDatabaseSetupWithOperationGroupNameSuffix:completion:]( self,  "initialCloudDatabaseSetupWithOperationGroupNameSuffix:completion:",  PKCloudStoreOperationGroupSuffixSetupAssistantComplete,  v11);
  }

- (void)requestUpdatesForTransactionSourceIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v80 = self;
    __int128 v74 = v4;
    id v67 = (void *)objc_claimAutoreleasedReturnValue( -[PDApplePayCloudStoreContainer _allPossibleCloudStoreZonesForFetchingWithTransactionSourceIdentifier:]( self,  "_allPossibleCloudStoreZonesForFetchingWithTransactionSourceIdentifier:"));
    v77 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    id v75 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    NSErrorUserInfoKey v76 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    os_unfair_lock_t lock = &self->_fetchTasksLock;
    os_unfair_lock_lock(&self->_fetchTasksLock);
    uint64_t v5 = (PDApplePayCloudStoreRecordFetchOperation *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_fetchTasks,  "objectForKeyedSubscript:",  v74));
    uint64_t v73 = (void *)objc_claimAutoreleasedReturnValue(-[PDApplePayCloudStoreRecordFetchOperation task](v5, "task"));
    id v6 = [v73 status];
    id v7 = [v73 status];
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer dataSource](v80, "dataSource"));
    id v9 = [v8 transactionSourceTypeForTransactionSourceIdentifier:v74];

    id v69 = v9;
    if (v6 == (id)3 || v5 && v73 && v7 != (id)2) {
      goto LABEL_23;
    }
    __int128 v97 = 0u;
    __int128 v98 = 0u;
    __int128 v95 = 0u;
    __int128 v96 = 0u;
    id v10 = v67;
    id v11 = [v10 countByEnumeratingWithState:&v95 objects:v116 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v96;
      do
      {
        id v13 = 0LL;
        do
        {
          if (*(void *)v96 != v12) {
            objc_enumerationMutation(v10);
          }
          id v14 = *(void **)(*((void *)&v95 + 1) + 8LL * (void)v13);
          id v15 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer containerManager](v80, "containerManager"));
          id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 fetchTimestampForCloudStoreStore:v14]);

          if (v16
            && (id v17 = [v16 timeIntervalSinceNow], fabs(v18) <= 14400.0)
            && !PKDisableNotificationPullTimeout(v17))
          {
            id v19 = (void *)objc_claimAutoreleasedReturnValue([v14 zoneName]);
            -[NSMutableDictionary safelySetObject:forKey:](v76, "safelySetObject:forKey:", v16, v19);
          }

          else
          {
            -[NSMutableSet addObject:](v77, "addObject:", v14);
          }

          id v13 = (char *)v13 + 1;
        }

        while (v11 != v13);
        id v20 = [v10 countByEnumeratingWithState:&v95 objects:v116 count:16];
        id v11 = v20;
      }

      while (v20);
    }

    id v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet pk_setByApplyingBlock:](v77, "pk_setByApplyingBlock:", &stru_10063EC40));
    -[NSMutableDictionary safelySetObject:forKey:](v75, "safelySetObject:forKey:", v21, @"cloudStoreZonesToFetch");

    if (!-[NSMutableSet count](v77, "count"))
    {
LABEL_23:
      uint64_t v25 = 0LL;
      uint64_t v72 = 0LL;
    }

    else
    {
      if (!v5) {
        uint64_t v5 = objc_alloc_init(&OBJC_CLASS___PDApplePayCloudStoreRecordFetchOperation);
      }
      uint64_t v72 = -[PKCloudStoreRecordFetchTask initWithTransactionSourceIdentifier:type:]( objc_alloc(&OBJC_CLASS___PKCloudStoreRecordFetchTask),  "initWithTransactionSourceIdentifier:type:",  v74,  2LL);
      -[PKCloudStoreRecordFetchTask queueTask](v72, "queueTask");
      -[PDApplePayCloudStoreRecordFetchOperation updateTask:](v5, "updateTask:", v72);
      fetchTasks = v80->_fetchTasks;
      id v23 = (void *)objc_claimAutoreleasedReturnValue(-[PDApplePayCloudStoreRecordFetchOperation identifier](v5, "identifier"));
      -[NSMutableDictionary safelySetObject:forKey:](fetchTasks, "safelySetObject:forKey:", v5, v23);

      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer dataSource](v80, "dataSource"));
      [v24 updateRecordFetchTask:v72];

      uint64_t v25 = 1LL;
    }

    os_unfair_lock_unlock(lock);
    uint64_t v26 = PKCloudStoreOperationGroupSuffixFullFetchBecausePreviousError;
    uint64_t v27 = PKCloudStoreOperationGroupSuffixViewedTransactions;
    if (v6 == (id)3) {
      id v28 = (void *)PKCloudStoreOperationGroupSuffixFullFetchBecausePreviousError;
    }
    else {
      id v28 = (void *)PKCloudStoreOperationGroupSuffixViewedTransactions;
    }
    id v79 = v28;
    id v78 = PKCloudStoreOperationGroupUserActionImplicit;
    uint64_t Object = PKLogFacilityTypeGetObject(9LL);
    unsigned int v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v31 = PKTransactionSourceTypeToString(v69);
      id v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
      if (v6 == (id)3) {
        id v33 = @"YES";
      }
      else {
        id v33 = @"NO";
      }
      if ((_DWORD)v25) {
        unsigned int v34 = @"YES";
      }
      else {
        unsigned int v34 = @"NO";
      }
      id v35 = -[NSMutableSet count](v77, "count");
      id v36 = -[NSMutableDictionary count](v76, "count");
      *(_DWORD *)buf = 138414594;
      *(void *)&uint8_t buf[4] = v74;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v32;
      *(_WORD *)&buf[22] = 2114;
      v104 = (uint64_t (*)(uint64_t, uint64_t))v33;
      *(_WORD *)v105 = 2114;
      *(void *)&v105[2] = v34;
      *(_WORD *)&v105[10] = 2048;
      *(void *)&v105[12] = v35;
      __int16 v106 = 2112;
      v107 = v77;
      __int16 v108 = 2048;
      id v109 = v36;
      __int16 v110 = 2112;
      v111 = v76;
      __int16 v112 = 2112;
      v113 = v73;
      __int16 v114 = 2112;
      v115 = v72;
      _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "Requesting updates for transactionSourceIdentifier: %@, type: %{public}@, performFullFetch: %{public}@, performP roactiveFetch: %{public}@, %lu cloudStoreZonesToFetch: %@, %lu zonesNotFetching: %@, existingTask: %@, newTask: %@",  buf,  0x66u);
    }

    BOOL v37 = v6 == (id)3;

    -[NSMutableDictionary safelySetObject:forKey:](v75, "safelySetObject:forKey:", v72, @"newTask");
    -[NSMutableDictionary safelySetObject:forKey:](v75, "safelySetObject:forKey:", v73, @"existingTask");
    -[NSMutableDictionary safelySetObject:forKey:]( v75,  "safelySetObject:forKey:",  v74,  @"transactionSourceIdentifier");
    uint64_t v38 = PKTransactionSourceTypeToString(v69);
    id v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
    -[NSMutableDictionary safelySetObject:forKey:](v75, "safelySetObject:forKey:", v39, @"transactionSourceType");

    unsigned int v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v37));
    -[NSMutableDictionary safelySetObject:forKey:](v75, "safelySetObject:forKey:", v40, @"performFullFetch");

    id v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v25));
    -[NSMutableDictionary safelySetObject:forKey:](v75, "safelySetObject:forKey:", v41, @"performProactiveFetch");

    unsigned int v42 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary description](v75, "description"));
    v102 = v42;
    v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v102, 1LL));
    -[PDCloudStoreContainer reportContainerChangeSignpostEventType:stateName:objectNames:changeToken:error:operationGroupName:operationGroupNameSuffix:]( v80,  "reportContainerChangeSignpostEventType:stateName:objectNames:changeToken:error:operationGroupName:operationGroupNameSuffix:",  46LL,  v74,  v43,  0LL,  0LL,  v78,  v79);

    if (v37)
    {
      id v44 = v69;
      switch((unint64_t)v69)
      {
        case 0uLL:
          id v45 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer dataSource](v80, "dataSource"));
          objc_super v71 = (void *)objc_claimAutoreleasedReturnValue([v45 passUniqueIdentifierForTransactionSourceIdentifier:v74]);
          goto LABEL_51;
        case 1uLL:
          id v58 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer dataSource](v80, "dataSource"));
          id v45 = (void *)objc_claimAutoreleasedReturnValue([v58 peerPaymentAccountForTransactionSourceIdentifier:v74]);

          objc_super v71 = (void *)objc_claimAutoreleasedReturnValue([v45 associatedPassUniqueID]);
          goto LABEL_51;
        case 2uLL:
          id v59 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer dataSource](v80, "dataSource"));
          id v60 = (void *)objc_claimAutoreleasedReturnValue([v59 accountUserWithTransactionSourceIdentifier:v74]);
          id v45 = (void *)objc_claimAutoreleasedReturnValue([v60 accountIdentifier]);

          unint64_t v61 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer dataSource](v80, "dataSource"));
          objc_super v71 = (void *)objc_claimAutoreleasedReturnValue([v61 passUniqueIdentifierWithAssociatedAccountIdentifier:v45]);

          goto LABEL_51;
        case 3uLL:
          id v62 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer dataSource](v80, "dataSource"));
          id v63 = (void *)objc_claimAutoreleasedReturnValue([v62 accountWithTransactionSourceIdentifier:v74]);
          id v45 = (void *)objc_claimAutoreleasedReturnValue([v63 accountIdentifier]);

          id v64 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer dataSource](v80, "dataSource"));
          objc_super v71 = (void *)objc_claimAutoreleasedReturnValue([v64 passUniqueIdentifierWithAssociatedAccountIdentifier:v45]);

LABEL_51:
          id v57 = v74;
          id v44 = v69;
          break;
        default:
          objc_super v71 = 0LL;
          id v57 = v74;
          break;
      }

      v100 = v57;
      uint64_t v65 = PKTransactionSourceTypeToString(v44);
      id v47 = (id)objc_claimAutoreleasedReturnValue(v65);
      id v101 = v47;
      objc_super v66 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v101,  &v100,  1LL));
      -[PDApplePayCloudStoreContainer passProvisioningDidStartForPassUniqueID:transactionSourceIdentifiers:ignoreExistingRecordHash:groupNameSuffix:completion:]( v80,  "passProvisioningDidStartForPassUniqueID:transactionSourceIdentifiers:ignoreExistingRecordHash:groupNameSuffix:completion:",  v71,  v66,  0LL,  v26,  0LL);
    }

    else
    {
      if (!-[NSMutableSet count](v77, "count"))
      {
LABEL_54:

        id v4 = v74;
        goto LABEL_55;
      }

      os_unfair_lock_lock(lock);
      id v70 = (PDApplePayCloudStoreRecordFetchOperation *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v80->_fetchTasks,  "objectForKeyedSubscript:",  v74));

      objc_super v71 = (void *)objc_claimAutoreleasedReturnValue(-[PDApplePayCloudStoreRecordFetchOperation task](v70, "task"));
      [v71 startTask];
      -[PDApplePayCloudStoreRecordFetchOperation updateTask:](v70, "updateTask:", v71);
      unsigned int v46 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer dataSource](v80, "dataSource"));
      [v46 updateRecordFetchTask:v71];

      os_unfair_lock_unlock(lock);
      id v47 = objc_alloc_init(&OBJC_CLASS___PKAsyncUnaryOperationComposer);
      v93[0] = _NSConcreteStackBlock;
      v93[1] = 3221225472LL;
      v93[2] = sub_10009095C;
      v93[3] = &unk_10063EC90;
      v93[4] = v80;
      v93[5] = v27;
      id v48 = v74;
      id v94 = v48;
      [v47 addOperation:v93];
      *(void *)buf = 0LL;
      *(void *)&buf[8] = buf;
      *(void *)&uint8_t buf[16] = 0x3032000000LL;
      v104 = sub_10008BBF8;
      *(void *)v105 = sub_10008BC08;
      *(void *)&v105[8] = 0LL;
      __int128 v89 = 0u;
      __int128 v90 = 0u;
      __int128 v91 = 0u;
      __int128 v92 = 0u;
      id v49 = v77;
      id v50 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v49,  "countByEnumeratingWithState:objects:count:",  &v89,  v99,  16LL);
      if (v50)
      {
        uint64_t v51 = *(void *)v90;
        do
        {
          for (i = 0LL; i != v50; i = (char *)i + 1)
          {
            if (*(void *)v90 != v51) {
              objc_enumerationMutation(v49);
            }
            uint64_t v53 = *(void *)(*((void *)&v89 + 1) + 8LL * (void)i);
            v84[0] = _NSConcreteStackBlock;
            v84[1] = 3221225472LL;
            v84[2] = sub_100090AF8;
            v84[3] = &unk_10063ECE0;
            v84[4] = v53;
            v84[5] = v80;
            v84[6] = v79;
            id v85 = v48;
            id v54 = v49;
            unint64_t v86 = v54;
            id v87 = v78;
            v88 = buf;
            [v47 addOperation:v84];
          }

          id v50 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v54,  "countByEnumeratingWithState:objects:count:",  &v89,  v99,  16LL);
        }

        while (v50);
      }

      id v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
      v81[0] = _NSConcreteStackBlock;
      v81[1] = 3221225472LL;
      v81[2] = sub_100090E1C;
      v81[3] = &unk_10063ED30;
      v81[4] = v80;
      id v82 = v48;
      __int16 v83 = buf;
      id v56 = [v47 evaluateWithInput:v55 completion:v81];

      _Block_object_dispose(buf, 8);
      uint64_t v5 = v70;
    }

    goto LABEL_54;
  }

- (void)backgroundModifiedRecordSyncForTranasctionSourceIdentifiers:(id)a3 fromDate:(id)a4 returnRecords:(BOOL)a5 formReport:(BOOL)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  id v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer workQueue](self, "workQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100091098;
  block[3] = &unk_10063EDF8;
  id v20 = v13;
  id v21 = self;
  BOOL v24 = a5;
  BOOL v25 = a6;
  id v22 = v12;
  id v23 = v14;
  id v16 = v12;
  id v17 = v14;
  id v18 = v13;
  dispatch_async(v15, block);
}

- (void)backgroundRecordChangedSyncForTranasctionSourceIdentifiers:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer workQueue](self, "workQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100091B1C;
  block[3] = &unk_100639AF0;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)passProvisioningDidStartForPassUniqueID:(id)a3 transactionSourceIdentifiers:(id)a4 ignoreExistingRecordHash:(BOOL)a5 groupNameSuffix:(id)a6 completion:(id)a7
{
  BOOL v62 = a5;
  id v70 = (NSMutableSet *)a3;
  objc_super v71 = (_UNKNOWN **)a4;
  id v68 = a6;
  id v69 = (void (**)(id, void))a7;
  id v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v78 = PKCloudStoreOperationGroupUserActionExplicit;
  id v10 = (void *)PKCloudStoreOperationGroupSuffixPassAdded;
  if (v68) {
    id v10 = v68;
  }
  id v79 = v10;
  id v72 = objc_alloc_init(&OBJC_CLASS___PKAsyncUnaryOperationComposer);
  uint64_t v140 = 0LL;
  v141 = (id *)&v140;
  uint64_t v142 = 0x3032000000LL;
  v143 = sub_10008BBF8;
  v144 = sub_10008BC08;
  id v145 = 0LL;
  v138[0] = 0LL;
  v138[1] = v138;
  v138[2] = 0x3032000000LL;
  v138[3] = sub_10008BBF8;
  v138[4] = sub_10008BC08;
  id v139 = 0LL;
  os_unfair_lock_lock(&self->_fetchTasksLock);
  id v66 = -[NSMutableDictionary copy](self->_fetchTasks, "copy");
  os_unfair_lock_t lock = &self->_fetchTasksLock;
  os_unfair_lock_unlock(&self->_fetchTasksLock);
  id v11 = &_s10Foundation22_convertErrorToNSErrorySo0E0Cs0C0_pF_ptr;
  NSErrorUserInfoKey v76 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  id v67 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  uint64_t v65 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t Object = PKLogFacilityTypeGetObject(9LL);
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = v71;
    id v14 = [v71 count];
    id v15 = @"NO";
    *(_DWORD *)buf = 138544386;
    __int16 v151 = 2048;
    v150 = v70;
    if (v62) {
      id v15 = @"YES";
    }
    id v152 = v14;
    __int16 v153 = 2112;
    v154 = (PDApplePayCloudStoreRecordFetchOperation *)v71;
    __int16 v155 = 2114;
    id v156 = v79;
    __int16 v157 = 2114;
    v158 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "passProvisioningDidStartForPassUniqueID %{public}@, %lu transactionSourceIdentifiers %@, groupNameSuffix: %{public }@, ignoreExistingRecordHash: %{public}@",  buf,  0x34u);
  }

  oslog = v13;

  if (v71)
  {
    id v16 = self;
    id v11 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue([v71 description]);
    v148 = v11;
    id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v148, 1LL));
  }

  else
  {
    id v17 = 0LL;
    id v16 = self;
  }

  -[PDCloudStoreContainer reportContainerChangeSignpostEventType:stateName:objectNames:changeToken:error:operationGroupName:operationGroupNameSuffix:]( v16,  "reportContainerChangeSignpostEventType:stateName:objectNames:changeToken:error:operationGroupName:operationGroupNameSuffix:",  47LL,  v70,  v17,  0LL,  0LL,  v78,  v79);
  if (v71)
  {

    id v16 = self;
  }

  if (![v71 count])
  {
    if (v69) {
      v69[2](v69, 0LL);
    }
    goto LABEL_67;
  }

  v137[0] = _NSConcreteStackBlock;
  v137[1] = 3221225472LL;
  v137[2] = sub_10009324C;
  v137[3] = &unk_10063EE98;
  v137[4] = v16;
  unint64_t v61 = objc_retainBlock(v137);
  group = dispatch_group_create();
  unsigned __int8 v75 = -[PDCloudStoreContainer isCloudStoreSetupAssistantComplete](self, "isCloudStoreSetupAssistantComplete");
  os_unfair_lock_lock(lock);
  __int128 v135 = 0u;
  __int128 v136 = 0u;
  __int128 v133 = 0u;
  __int128 v134 = 0u;
  obj = v71;
  id v18 = [obj countByEnumeratingWithState:&v133 objects:v147 count:16];
  if (!v18)
  {

    os_unfair_lock_unlock(lock);
    goto LABEL_63;
  }

  char v73 = 0;
  uint64_t v82 = *(void *)v134;
  do
  {
    id v19 = 0LL;
    id v84 = v18;
    do
    {
      if (*(void *)v134 != v82) {
        objc_enumerationMutation(obj);
      }
      id v20 = *(NSMutableSet **)(*((void *)&v133 + 1) + 8LL * (void)v19);
      id v21 = objc_autoreleasePoolPush();
      id v22 = (PDApplePayCloudStoreRecordFetchOperation *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_fetchTasks,  "objectForKeyedSubscript:",  v20));
      id v23 = (void *)objc_claimAutoreleasedReturnValue(-[PDApplePayCloudStoreRecordFetchOperation task](v22, "task"));
      BOOL v24 = [v23 status] == (id)1 && objc_msgSend(v23, "type") != (id)2;
      BOOL v25 = [v23 status] == (id)4 && objc_msgSend(v23, "type") != (id)2;
      if (v24 || v25)
      {
        uint64_t v26 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
        uint64_t v27 = v26;
        if (v24)
        {
          -[NSMutableArray safelyAddObject:](v26, "safelyAddObject:", @"runningTask");
          uint64_t v28 = 49LL;
        }

        else if (v25)
        {
          -[NSMutableArray safelyAddObject:](v26, "safelyAddObject:", @"queuedTask");
          uint64_t v28 = 50LL;
        }

        else
        {
          uint64_t v28 = 0LL;
        }

        id v35 = (void *)objc_claimAutoreleasedReturnValue(-[PDApplePayCloudStoreRecordFetchOperation description](v22, "description"));
        -[NSMutableArray safelyAddObject:](v27, "safelyAddObject:", v35);

        if (v24)
        {
          id v36 = oslog;
          if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
          {
            BOOL v37 = (void *)objc_claimAutoreleasedReturnValue([obj objectForKeyedSubscript:v20]);
            *(_DWORD *)buf = 138412802;
            v150 = v20;
            __int16 v151 = 2112;
            id v152 = v37;
            __int16 v153 = 2112;
            v154 = v22;
            _os_log_impl( (void *)&_mh_execute_header,  oslog,  OS_LOG_TYPE_DEFAULT,  "The transactionSourceIdentifier %@ of type %@ already has a fetch task running. Waiting for it to complete %@",  buf,  0x20u);

            goto LABEL_45;
          }

          goto LABEL_46;
        }

        if (v25)
        {
          id v36 = oslog;
          if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue([obj objectForKeyedSubscript:v20]);
            *(_DWORD *)buf = 138412802;
            v150 = v20;
            __int16 v151 = 2112;
            id v152 = v38;
            __int16 v153 = 2112;
            v154 = v22;
            _os_log_impl( (void *)&_mh_execute_header,  oslog,  OS_LOG_TYPE_DEFAULT,  "The transactionSourceIdentifier %@ of type %@ is currently queued. Waiting for it to complete %@",  buf,  0x20u);

LABEL_45:
            id v36 = oslog;
          }

- (void)fetchRecordsInAcceptedZoneShare:(id)a3 databaseIdentifier:(id)a4 operationGroupName:(id)a5 operationGroupNameSuffix:(id)a6 qualityOfService:(int64_t)a7 completion:(id)a8
{
  id v13 = a3;
  id v43 = a4;
  id v45 = a5;
  id v46 = a6;
  id v44 = (void (**)(void))a8;
  uint64_t Object = PKLogFacilityTypeGetObject(9LL);
  id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v13 zoneName]);
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v16;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Fetching records in newly shared zone %{public}@",  (uint8_t *)&buf,  0xCu);
  }

  if (v13)
  {
    id v17 = objc_alloc_init(&OBJC_CLASS___PKAsyncUnaryOperationComposer);
    group = dispatch_group_create();
    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v72 = 0x3032000000LL;
    char v73 = sub_10008BBF8;
    __int128 v74 = sub_10008BC08;
    id v75 = 0LL;
    unsigned __int8 v40 = -[PDCloudStoreContainer isCloudStoreSetupAssistantComplete](self, "isCloudStoreSetupAssistantComplete");
    os_unfair_lock_lock(&self->_fetchTasksLock);
    id v18 = -[PKCloudStoreRecordFetchTask initWithCloudStoreZone:type:]( objc_alloc(&OBJC_CLASS___PKCloudStoreRecordFetchTask),  "initWithCloudStoreZone:type:",  v13,  3LL);
    -[PKCloudStoreRecordFetchTask queueTask](v18, "queueTask");
    id v19 = (void *)objc_claimAutoreleasedReturnValue(-[PKCloudStoreRecordFetchTask identifier](v18, "identifier"));
    id v20 = (PDApplePayCloudStoreRecordFetchOperation *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_fetchTasks,  "objectForKeyedSubscript:",  v19));
    id v21 = (void *)objc_claimAutoreleasedReturnValue(-[PDApplePayCloudStoreRecordFetchOperation task](v20, "task"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_fetchTasks, "setObject:forKeyedSubscript:", v20, v19);
    id v22 = [v21 status];
    id v23 = v21;
    id v24 = v22;
    id v39 = v23;
    id v25 = [v23 status];
    if (v24 == (id)1 || v25 == (id)4)
    {
      dispatch_group_enter(group);
      v67[0] = _NSConcreteStackBlock;
      v67[1] = 3221225472LL;
      v67[2] = sub_100095564;
      v67[3] = &unk_10063F0A0;
      id v68 = group;
      -[PDApplePayCloudStoreRecordFetchOperation addCompletion:](v20, "addCompletion:", v67);
      uint64_t v26 = v68;
    }

    else if ((v40 & 1) != 0)
    {
      -[PKCloudStoreRecordFetchTask queueTask](v18, "queueTask");
      -[PDApplePayCloudStoreRecordFetchOperation updateTask:](v20, "updateTask:", v18);
      uint64_t v26 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer dataSource](self, "dataSource"));
      -[dispatch_group_s updateRecordFetchTask:](v26, "updateRecordFetchTask:", v18);
    }

    else
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v13 zoneName]);
        *(_DWORD *)id v69 = 138412290;
        id v70 = v28;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Cannot accept zone share %@ since the cloud store setup assistant is not complete",  v69,  0xCu);
      }

      uint64_t v26 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue( -[PDCloudStoreContainer setupAssistantNotCompleteError]( self,  "setupAssistantNotCompleteError"));
      id v29 = (void *)objc_claimAutoreleasedReturnValue([v13 zoneName]);
      -[PDCloudStoreContainer reportContainerChangeSignpostEventType:stateName:objectNames:changeToken:error:operationGroupName:operationGroupNameSuffix:]( self,  "reportContainerChangeSignpostEventType:stateName:objectNames:changeToken:error:operationGroupName:operationGroupNameSuffix:",  3LL,  v29,  0LL,  0LL,  v26,  v45,  v46);

      if (!v20) {
        id v20 = objc_alloc_init(&OBJC_CLASS___PDApplePayCloudStoreRecordFetchOperation);
      }
      -[PKCloudStoreRecordFetchTask startTask](v18, "startTask");
      objc_storeStrong((id *)(*((void *)&buf + 1) + 40LL), v26);
      -[PDApplePayCloudStoreRecordFetchOperation updateTask:](v20, "updateTask:", v18);
      fetchTasks = self->_fetchTasks;
      uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(-[PDApplePayCloudStoreRecordFetchOperation identifier](v20, "identifier"));
      -[NSMutableDictionary safelySetObject:forKey:](fetchTasks, "safelySetObject:forKey:", v20, v31);

      id v32 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer dataSource](self, "dataSource"));
      [v32 updateRecordFetchTask:v18];
    }

    os_unfair_lock_unlock(&self->_fetchTasksLock);
    v64[0] = _NSConcreteStackBlock;
    v64[1] = 3221225472LL;
    v64[2] = sub_10009556C;
    v64[3] = &unk_10063CB08;
    id v33 = group;
    uint64_t v65 = v33;
    id v66 = self;
    [v17 addOperation:v64];
    v59[0] = _NSConcreteStackBlock;
    v59[1] = 3221225472LL;
    v59[2] = sub_10009563C;
    v59[3] = &unk_10063F0C8;
    unsigned __int8 v63 = v40;
    p___int128 buf = &buf;
    v59[4] = self;
    id v34 = v19;
    id v60 = v34;
    id v35 = v13;
    id v61 = v35;
    [v17 addOperation:v59];
    v51[0] = _NSConcreteStackBlock;
    v51[1] = 3221225472LL;
    v51[2] = sub_100095800;
    v51[3] = &unk_10063F0F0;
    id v52 = v35;
    id v53 = v43;
    id v54 = v45;
    id v57 = &buf;
    int64_t v58 = a7;
    id v55 = v46;
    id v56 = self;
    [v17 addOperation:v51];
    id v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472LL;
    v47[2] = sub_100095948;
    v47[3] = &unk_10063F118;
    v47[4] = self;
    id v37 = v34;
    id v48 = v37;
    id v50 = &buf;
    os_signpost_id_t v49 = v44;
    id v38 = [v17 evaluateWithInput:v36 completion:v47];

    _Block_object_dispose(&buf, 8);
  }

  else
  {
    NSErrorUserInfoKey v76 = NSLocalizedDescriptionKey;
    v77 = @"Error: cannot fetch records from a nil accepted zone share";
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v77,  &v76,  1LL));
    id v17 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKPassKitErrorDomain,  -4001LL,  v27));

    -[PDCloudStoreContainer reportContainerChangeSignpostEventType:stateName:objectNames:changeToken:error:operationGroupName:operationGroupNameSuffix:]( self,  "reportContainerChangeSignpostEventType:stateName:objectNames:changeToken:error:operationGroupName:operationGroupNameSuffix:",  3LL,  0LL,  0LL,  0LL,  v17,  v45,  v46);
    if (v44) {
      v44[2]();
    }
  }
}

- (void)_fetchTaskOperationWithIdentifier:(id)a3 completedWithError:(id)a4
{
  p_fetchTasksLock = &self->_fetchTasksLock;
  id v7 = a4;
  id v8 = a3;
  os_unfair_lock_lock(p_fetchTasksLock);
  id v11 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_fetchTasks, "objectForKeyedSubscript:", v8));

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v11 task]);
  [v9 completeTaskWithError:v7];
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer dataSource](self, "dataSource"));
  [v10 updateRecordFetchTask:v9];

  os_unfair_lock_unlock(p_fetchTasksLock);
  [v11 callCompletionsWithError:v7 cloudStoreRecords:0];

  -[PDApplePayCloudStoreContainer _updateFetchTaskScheduledActivityIfNeccessary]( self,  "_updateFetchTaskScheduledActivityIfNeccessary");
}

- (id)_queue_additionalTransactionSourceIdentifiersForProvisioningWithZone:(id)a3 transactionSourceIdentifiers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6 || (unint64_t v8 = (unint64_t)[v6 zoneType], v8 < 9) && ((0x1EDu >> v8) & 1) != 0)
  {
    id v17 = 0LL;
    goto LABEL_72;
  }

  id v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  peerPaymentAccount = self->_peerPaymentAccount;
  if (peerPaymentAccount)
  {
    id v11 = v7;
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentAccount associatedPassUniqueID](peerPaymentAccount, "associatedPassUniqueID"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer dataSource](self, "dataSource"));
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 passWithUniqueIdentifier:v12]);
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 paymentPass]);

    if (v15)
    {
      id v7 = v11;
      if ([v15 activationState]) {
        BOOL v16 = [v15 activationState] == (id)2;
      }
      else {
        BOOL v16 = 1;
      }
    }

    else
    {
      BOOL v16 = 0;
      id v7 = v11;
    }

    id v18 = (void *)objc_claimAutoreleasedReturnValue([v15 deviceTransactionSourceIdentifiers]);
    unsigned int v81 = [v18 isSubsetOfSet:v7];
  }

  else
  {
    unsigned int v81 = 0;
    id v15 = 0LL;
    BOOL v16 = 0;
  }

  id v84 = v15;
  accountManager = self->_accountManager;
  id v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSSet allObjects](self->_accounts, "allObjects"));
  uint64_t v21 = objc_claimAutoreleasedReturnValue( -[PDAccountManager defaultAccountForFeature:forAccounts:]( accountManager,  "defaultAccountForFeature:forAccounts:",  2LL,  v20));

  id v22 = (void *)v21;
  if (v21)
  {
    id v23 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer dataSource](self, "dataSource"));
    id v24 = (void *)objc_claimAutoreleasedReturnValue([(id)v21 associatedPassUniqueID]);
    id v25 = (void *)objc_claimAutoreleasedReturnValue([v23 passWithUniqueIdentifier:v24]);
    uint64_t v21 = objc_claimAutoreleasedReturnValue([v25 paymentPass]);

    uint64_t v26 = (void *)v21;
    if (v21)
    {
      if ([(id)v21 activationState]) {
        LODWORD(v21) = [(id)v21 activationState] == (id)2;
      }
      else {
        LODWORD(v21) = 1;
      }
    }

    __int16 v83 = v26;
    unsigned int v30 = (void *)objc_claimAutoreleasedReturnValue([v26 deviceTransactionSourceIdentifiers]);
    unsigned int v27 = [v30 isSubsetOfSet:v7];

    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v22 accountIdentifier]);
    if (v31)
    {
      id v32 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( self->_accountUsersByAccountIdentifier,  "objectForKeyedSubscript:",  v31));
      id v29 = (void *)objc_claimAutoreleasedReturnValue([v32 coOwnerAccountUser]);

      if (v29)
      {
        id v33 = (void *)objc_claimAutoreleasedReturnValue([v29 transactionSourceIdentifiers]);
        unsigned int v79 = v27;
        int v34 = v21;
        BOOL v35 = v16;
        id v36 = v29;
        id v37 = v22;
        id v38 = v7;
        id v39 = v33;
        unsigned int v28 = [v33 isSubsetOfSet:v38];

        id v7 = v38;
        id v22 = v37;
        id v29 = v36;
        BOOL v16 = v35;
        LODWORD(v21) = v34;
        unsigned int v27 = v79;
      }

      else
      {
        unsigned int v28 = 0;
      }
    }

    else
    {
      unsigned int v28 = 0;
      id v29 = 0LL;
    }
  }

  else
  {
    unsigned int v27 = 0;
    unsigned int v28 = 0;
    __int16 v83 = 0LL;
    id v29 = 0LL;
  }

  if ([v6 zoneType] == (id)1)
  {
    int v40 = v21 & v27;
    int v41 = v16 & v81;
    if ((v21 & v27) != 1 || (v41 & 1) == 0)
    {
      if (((v41 | v16 & v40 ^ 1) & 1) == 0)
      {
        id v78 = v7;
        __int128 v99 = 0u;
        __int128 v100 = 0u;
        __int128 v97 = 0u;
        __int128 v98 = 0u;
        unsigned int v42 = (void *)objc_claimAutoreleasedReturnValue([v84 deviceTransactionSourceIdentifiers]);
        id v61 = [v42 countByEnumeratingWithState:&v97 objects:v104 count:16];
        if (v61)
        {
          id v62 = v61;
          uint64_t v82 = v29;
          NSErrorUserInfoKey v76 = v22;
          id v77 = v6;
          uint64_t v63 = *(void *)v98;
          do
          {
            for (i = 0LL; i != v62; i = (char *)i + 1)
            {
              if (*(void *)v98 != v63) {
                objc_enumerationMutation(v42);
              }
              uint64_t v65 = *(void *)(*((void *)&v97 + 1) + 8LL * (void)i);
              id v66 = (void *)objc_claimAutoreleasedReturnValue([v84 uniqueID]);
              id v67 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"paymentApplication, %@, Apple Cash",  v66));
              -[NSMutableDictionary safelySetObject:forKey:](v9, "safelySetObject:forKey:", v67, v65);
            }

            id v62 = [v42 countByEnumeratingWithState:&v97 objects:v104 count:16];
          }

          while (v62);
          goto LABEL_66;
        }

- (void)_fetchAndStoreAppleCashRecordsIfNecessaryForPassUniqueID:(id)a3 operationGroupName:(id)a4 operationGroupNameSuffix:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer workQueue](self, "workQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100096358;
  block[3] = &unk_10063F190;
  void block[4] = self;
  id v20 = v10;
  id v22 = v12;
  id v23 = v13;
  id v21 = v11;
  id v15 = v12;
  id v16 = v11;
  id v17 = v13;
  id v18 = v10;
  dispatch_async(v14, block);
}

- (void)_fetchAndStoreAppleCashItemWithRecordType:(id)a3 operationGroupName:(id)a4 operationGroupNameSuffix:(id)a5 zone:(id)a6 containerDatabase:(id)a7 transactionSourceIdentifiers:(id)a8 accountCreationDate:(id)a9 completion:(id)a10
{
  id v15 = a8;
  id v27 = a10;
  id v26 = a9;
  id v16 = a7;
  id v17 = a6;
  id v18 = a5;
  id v19 = a4;
  id v20 = a3;
  id v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithValue:](&OBJC_CLASS___NSPredicate, "predicateWithValue:", 1LL));
  id v22 = -[CKQuery initWithRecordType:predicate:]( objc_alloc(&OBJC_CLASS___CKQuery),  "initWithRecordType:predicate:",  v20,  v21);

  id v23 = -[PDCloudStoreRecordsRequest initWithRequestType:storeChanges:returnRecords:qualityOfService:groupName:groupNameSuffix:]( objc_alloc(&OBJC_CLASS___PDApplePayCloudStoreRecordsRequest),  "initWithRequestType:storeChanges:returnRecords:qualityOfService:groupName:groupNameSuffix:",  4LL,  1LL,  0LL,  17LL,  v19,  v18);
  -[PDCloudStoreRecordsRequest setCkQuery:](v23, "setCkQuery:", v22);
  -[PDCloudStoreRecordsRequest setCloudStoreZone:](v23, "setCloudStoreZone:", v17);

  -[PDCloudStoreRecordsRequest setContainerDatabase:](v23, "setContainerDatabase:", v16);
  -[PDApplePayCloudStoreRecordsRequest setTransactionSourceIdentifiers:](v23, "setTransactionSourceIdentifiers:", v15);
  -[PDCloudStoreRecordsRequest setIgnoreRecordsBeforeDate:](v23, "setIgnoreRecordsBeforeDate:", v26);

  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472LL;
  v29[2] = sub_100097120;
  v29[3] = &unk_10063DB88;
  id v30 = v15;
  uint64_t v31 = self;
  id v32 = v27;
  id v24 = v27;
  id v25 = v15;
  -[PDCloudStoreContainer executeRecordsRequest:completion:](self, "executeRecordsRequest:completion:", v23, v29);
}

- (void)_addCloudStoreRecordsFromResponse:(id)a3 toTransactionSourceRecords:(id)a4 transactionSourceIdentifiers:(id)a5 passUniqueID:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = (void *)objc_claimAutoreleasedReturnValue([a3 cloudStoreRecords]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 allObjectsByDatabaseIdentifier]);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_100097368;
  v18[3] = &unk_10063F1B8;
  v18[4] = self;
  id v19 = v11;
  id v20 = v10;
  id v21 = v12;
  id v15 = v12;
  id v16 = v10;
  id v17 = v11;
  [v14 enumerateKeysAndObjectsUsingBlock:v18];
}

- (void)canSyncTransactionFromCloudKitForTransactionSourceIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    unint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer workQueue](self, "workQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000976F8;
    block[3] = &unk_10063C6A8;
    id v11 = v7;
    void block[4] = self;
    id v10 = v6;
    dispatch_async(v8, block);
  }
}

- (void)canSyncTransactionToCloudKit:(id)a3 forTransactionSourceIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer workQueue](self, "workQueue"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100097810;
    v12[3] = &unk_10063CD60;
    id v15 = v10;
    v12[4] = self;
    id v13 = v8;
    id v14 = v9;
    dispatch_async(v11, v12);
  }
}

- (BOOL)_queue_canSyncTransactionToCloudKit:(id)a3 forTransactionSourceIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 hasBackingData]
    && (id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 serviceIdentifier]),
        id v9 = [v8 length],
        v8,
        v9)
    && -[PDApplePayCloudStoreContainer _queue_isRelevantTransactionSourceIdentifier:]( self,  "_queue_isRelevantTransactionSourceIdentifier:",  v7))
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer dataSource](self, "dataSource"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 serviceIdentifier]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue( [v10 transactionArchiveForTransactionWithServiceIdentifier:v11 transactionSourceIdentifier:v7]);

    unsigned int v13 = [v12 allArchiveLocationsWithType:0 areArchived:1];
    if (!v12)
    {
      uint64_t Object = PKLogFacilityTypeGetObject(9LL);
      id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v6 serviceIdentifier]);
        int v26 = 138412802;
        id v27 = v6;
        __int16 v28 = 2114;
        id v29 = v16;
        __int16 v30 = 2112;
        id v31 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Error: there is no archive defined for transaction %@ (service id %{public}@) with transactionSourceIdentifier %@",  (uint8_t *)&v26,  0x20u);
      }
    }

    if (v12) {
      int v17 = v13 ^ 1;
    }
    else {
      int v17 = 1;
    }
    if (((v13 ^ 1) & 1) == 0)
    {
      id v18 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer containerManager](self, "containerManager"));
      id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 cloudStoreZonesByDatabaseIdentifierForItem:v6 action:1]);

      if ([v19 count])
      {
        uint64_t v20 = PKLogFacilityTypeGetObject(9LL);
        id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          id v22 = (void *)objc_claimAutoreleasedReturnValue([v6 serviceIdentifier]);
          id v23 = [v19 count];
          int v26 = 138413058;
          id v27 = v6;
          __int16 v28 = 2114;
          id v29 = v22;
          __int16 v30 = 2048;
          id v31 = v23;
          __int16 v32 = 2112;
          id v33 = v19;
          _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Allowing transaction %@ (service id %{public}@) to sync to cloud store since there are %lu zones associated with that transaction %@",  (uint8_t *)&v26,  0x2Au);
        }

        int v17 = 1;
      }
    }

    BOOL v24 = v17 != 0;
  }

  else
  {
    BOOL v24 = 0;
  }

  return v24;
}

- (void)passDidDisappear:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 paymentPass]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 deviceTransactionSourceIdentifiers]);
  id v6 = (id)objc_claimAutoreleasedReturnValue([v5 allObjects]);

  os_unfair_lock_lock(&self->_fetchTasksLock);
  -[NSMutableDictionary removeObjectsForKeys:](self->_fetchTasks, "removeObjectsForKeys:", v6);
  os_unfair_lock_unlock(&self->_fetchTasksLock);
}

- (void)syncTransactionsToCloudStoreOriginatedOnDevice:(unint64_t)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer dataSource](self, "dataSource"));
  [v4 syncTransactionsToCloudStoreOriginatedOnDevice:a3];
}

- (void)bootstrapZoneWithName:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer workQueue](self, "workQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100097C5C;
  block[3] = &unk_100639AF0;
  id v12 = v6;
  unsigned int v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)generateRandomTransactionForTransactionSourceIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer workQueue](self, "workQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100097F20;
  block[3] = &unk_100639AF0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)uploadTransaction:(id)a3 forTransactionSourceIdentifier:(id)a4 includeServerData:(BOOL)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer workQueue](self, "workQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000980A0;
  block[3] = &unk_100639508;
  void block[4] = self;
  id v18 = v10;
  BOOL v21 = a5;
  id v19 = v11;
  id v20 = v12;
  id v14 = v11;
  id v15 = v12;
  id v16 = v10;
  dispatch_async(v13, block);
}

- (void)uploadRecurringPayment:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer workQueue](self, "workQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10009892C;
  block[3] = &unk_100639AF0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)uploadCounterpartImageData:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer workQueue](self, "workQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100098F34;
  block[3] = &unk_100639AF0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)populateEvents:(id)a3 forAccountIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer workQueue](self, "workQueue"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100099564;
  v15[3] = &unk_10063CD10;
  id v16 = v8;
  int v17 = self;
  id v18 = v9;
  id v19 = v10;
  id v12 = v9;
  id v13 = v10;
  id v14 = v8;
  dispatch_async(v11, v15);
}

- (void)_handlePeerPaymentAccountChanged:(id)a3
{
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer workQueue](self, "workQueue", a3));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100099BC8;
  block[3] = &unk_100639300;
  void block[4] = self;
  dispatch_async(v4, block);
}

- (void)accountManager:(id)a3 didAddAccount:(id)a4
{
  id v5 = a4;
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer workQueue](self, "workQueue"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100099D2C;
  v8[3] = &unk_1006392B0;
  id v9 = v5;
  id v10 = self;
  id v7 = v5;
  dispatch_async(v6, v8);
}

- (void)accountManager:(id)a3 didRemoveAccount:(id)a4
{
  id v5 = a4;
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer workQueue](self, "workQueue"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100099EE0;
  v8[3] = &unk_1006392B0;
  id v9 = v5;
  id v10 = self;
  id v7 = v5;
  dispatch_async(v6, v8);
}

- (void)accountManager:(id)a3 didUpdateAccount:(id)a4 oldAccount:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer workQueue](self, "workQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10009A0B8;
  block[3] = &unk_100639350;
  id v13 = v7;
  id v14 = v8;
  id v15 = self;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(v9, block);
}

- (void)accountManager:(id)a3 sharedAccountCloudStoreChangedForAccountIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer workQueue](self, "workQueue"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10009A278;
  v8[3] = &unk_1006392B0;
  void v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

- (void)accountManager:(id)a3 accountUsersChanged:(id)a4 oldUsers:(id)a5 accountIdentifier:(id)a6
{
  id v7 = a6;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer workQueue](self, "workQueue"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10009A440;
  v10[3] = &unk_1006392B0;
  v10[4] = self;
  id v11 = v7;
  id v9 = v7;
  dispatch_async(v8, v10);
}

- (id)allPossibleZoneNamesForContainerDatabase:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  id v6 = [v4 scope];
  if (v6 == (id)3)
  {
    if (!-[PKPeerPaymentAccount role](self->_peerPaymentAccount, "role"))
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue( -[PKPeerPaymentAccount associatedAccountInformation]( self->_peerPaymentAccount,  "associatedAccountInformation"));
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472LL;
      v11[2] = sub_10009A6AC;
      v11[3] = &unk_10063F2A8;
      id v12 = v5;
      id v13 = self;
      id v14 = v4;
      [v8 enumerateAssociatedAccountsUsingBlock:v11];
    }

    goto LABEL_6;
  }

  if (v6 == (id)2)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue( -[PDApplePayCloudStoreContainer _peerPaymentZoneNamesForAccount:containerDatabase:]( self,  "_peerPaymentZoneNamesForAccount:containerDatabase:",  self->_peerPaymentAccount,  v4));
    -[NSMutableSet unionSet:](v5, "unionSet:", v7);

LABEL_6:
    id v9 = (void *)objc_claimAutoreleasedReturnValue( -[PDApplePayCloudStoreContainer _accountZoneNamesForAccountSet:containerDatabase:]( self,  "_accountZoneNamesForAccountSet:containerDatabase:",  self->_accounts,  v4));
    -[NSMutableSet unionSet:](v5, "unionSet:", v9);
  }

  return v5;
}

- (id)allPossibleZoneNamesForContainerDatabase:(id)a3 itemType:(unint64_t)a4
{
  id v6 = a3;
  id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[PDApplePayCloudStoreContainer allPossibleZoneNamesForContainerDatabase:]( self,  "allPossibleZoneNamesForContainerDatabase:",  v6));
  id v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v20;
    unint64_t v12 = a4 - 1;
    do
    {
      id v13 = 0LL;
      do
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v14 = *(void *)(*((void *)&v19 + 1) + 8LL * (void)v13);
        unint64_t v18 = 0LL;
        +[PKCloudStoreZone zoneValueForZoneName:outZoneType:outAccountIdentifier:altDSID:]( &OBJC_CLASS___PKCloudStoreZone,  "zoneValueForZoneName:outZoneType:outAccountIdentifier:altDSID:",  v14,  &v18,  0LL,  0LL);
        switch(v12)
        {
          case 0uLL:
            if (v18 - 1 < 8) {
              goto LABEL_13;
            }
            break;
          case 4uLL:
            if (v18 <= 8 && ((1LL << v18) & 0x176) != 0) {
              goto LABEL_13;
            }
            break;
          case 5uLL:
            if (v18 - 3 < 4) {
              goto LABEL_13;
            }
            break;
          case 6uLL:
            if (v18 == 7) {
              goto LABEL_13;
            }
            break;
          case 7uLL:
            goto LABEL_13;
          case 8uLL:
          case 9uLL:
            if (v18 == 1) {
LABEL_13:
            }
              -[NSMutableSet addObject:](v7, "addObject:", v14);
            break;
          default:
            break;
        }

        id v13 = (char *)v13 + 1;
      }

      while (v10 != v13);
      id v15 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
      id v10 = v15;
    }

    while (v15);
  }

  id v16 = -[NSMutableSet copy](v7, "copy");
  return v16;
}

- (id)allPossibleZoneSubscriptionsForContainerDatabase:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  if ([v4 scope] == (id)2)
  {
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    id v6 = (void *)objc_claimAutoreleasedReturnValue( -[PDApplePayCloudStoreContainer allPossibleZoneNamesForContainerDatabase:]( self,  "allPossibleZoneNamesForContainerDatabase:",  v4,  0LL));
    id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        id v10 = 0LL;
        do
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v4 zoneForZoneName:*(void *)(*((void *)&v15 + 1) + 8 * (void)v10)]);
          unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( -[PDApplePayCloudStoreContainer subscriptionForZone:inContainerDatabase:]( self,  "subscriptionForZone:inContainerDatabase:",  v11,  v4));
          if (v12) {
            -[NSMutableSet addObject:](v5, "addObject:", v12);
          }

          id v10 = (char *)v10 + 1;
        }

        while (v8 != v10);
        id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }

      while (v8);
    }
  }

  id v13 = -[NSMutableSet copy](v5, "copy");

  return v13;
}

- (id)possibleDatabaseSubscriptionForContainerDatabase:(id)a3
{
  id v4 = a3;
  if ([v4 scope] == (id)3)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer containerManager](self, "containerManager"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 containerName]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@%@%@%@",  v6,  @"-",  v7,  @"-",  @"database-subscription"));

    uint64_t v9 = -[CKDatabaseSubscription initWithSubscriptionID:]( objc_alloc(&OBJC_CLASS___CKDatabaseSubscription),  "initWithSubscriptionID:",  v8);
  }

  else
  {
    uint64_t v9 = 0LL;
  }

  return v9;
}

- (id)subscriptionForZone:(id)a3 inContainerDatabase:(id)a4
{
  id v5 = a3;
  if ([a4 scope] != (id)2)
  {
    id v13 = 0LL;
    goto LABEL_16;
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 zoneID]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 zoneName]);

  id v8 = (void *)PKCloudStoreTransactionsZoneName;
  id v9 = v7;
  id v10 = v8;
  if (v9 == v10)
  {

    goto LABEL_9;
  }

  uint64_t v11 = v10;
  if (v9 && v10)
  {
    unsigned __int8 v12 = [v9 isEqualToString:v10];

    if ((v12 & 1) == 0) {
      goto LABEL_11;
    }
LABEL_9:
    uint64_t v14 = @"PDCloudStoreManagerTransactionZoneSubscriptionID";
    goto LABEL_12;
  }

LABEL_11:
  uint64_t v14 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@%@",  v9,  @"-",  @"subscription"));
LABEL_12:
  id v13 = 0LL;
  if (v5 && v14)
  {
    __int128 v15 = objc_alloc(&OBJC_CLASS___CKRecordZoneSubscription);
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v5 zoneID]);
    id v13 = -[CKRecordZoneSubscription initWithZoneID:subscriptionID:](v15, "initWithZoneID:subscriptionID:", v16, v14);
  }

LABEL_16:
  return v13;
}

- (id)zoneIDForSubscription:(id)a3 inContainerDatabase:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 scope] == (id)2)
  {
    id v7 = (__CFString *)(id)objc_claimAutoreleasedReturnValue([v5 subscriptionID]);
    id v8 = v7;
    if (v7 == @"PDCloudStoreManagerTransactionZoneSubscriptionID"
      || v7
      && (unsigned int v9 = -[__CFString isEqualToString:]( v7,  "isEqualToString:",  @"PDCloudStoreManagerTransactionZoneSubscriptionID"),  v8,  v9))
    {
      id v10 = PKCloudStoreTransactionsZoneName;
    }

    else
    {
      unsigned __int8 v12 = (char *)-[__CFString rangeOfString:](v8, "rangeOfString:", @"subscription") - 1;
      if (v12 >= -[__CFString length](v8, "length")) {
        goto LABEL_11;
      }
      id v10 = (id)objc_claimAutoreleasedReturnValue(-[__CFString substringToIndex:](v8, "substringToIndex:", v12));
    }

    id v13 = v10;
    if (v10)
    {
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v6 zoneForZoneName:v10]);
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v14 zoneID]);

LABEL_12:
      goto LABEL_13;
    }

- (id)cloudStoreZonesForItem:(id)a3 action:(unint64_t)a4 inContainerDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v11 = 0LL;
  switch((unint64_t)[v8 itemType])
  {
    case 1uLL:
      uint64_t v14 = objc_opt_class(&OBJC_CLASS___PKPaymentTransaction, v10);
      if ((objc_opt_isKindOfClass(v8, v14) & 1) != 0)
      {
        id v15 = v8;
        v111 = (void *)objc_claimAutoreleasedReturnValue([v15 serviceIdentifier]);
      }

      else
      {
        id v15 = 0LL;
        v111 = 0LL;
      }

      BOOL v24 = (void *)objc_claimAutoreleasedReturnValue([v15 accountIdentifier]);
      id v25 = [v15 accountType];
      id v26 = (id)objc_claimAutoreleasedReturnValue([v15 transactionSourceIdentifier]);
      if (v24)
      {
        if (v25) {
          uint64_t v27 = (uint64_t)v25;
        }
        else {
          uint64_t v27 = 2LL;
        }
      }

      else
      {
        uint64_t Object = PKLogFacilityTypeGetObject(9LL);
        id v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__int128 buf = 138412290;
          id v122 = v8;
          _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "Assuming the item is for the peer payment account since the account identifier wasnt defined %@",  buf,  0xCu);
        }

        BOOL v24 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentAccount identifier](self->_peerPaymentAccount, "identifier"));
        uint64_t v27 = 1LL;
      }

      id v116 = self;
      uint64_t v103 = v27;
      if (v26) {
        goto LABEL_82;
      }
      if ((unint64_t)(v27 - 2) < 3)
      {
        __int128 v119 = 0u;
        __int128 v120 = 0u;
        __int128 v117 = 0u;
        __int128 v118 = 0u;
        obja = self->_accounts;
        id v26 = -[NSSet countByEnumeratingWithState:objects:count:]( obja,  "countByEnumeratingWithState:objects:count:",  &v117,  v129,  16LL);
        if (!v26) {
          goto LABEL_81;
        }
        id v106 = v15;
        unint64_t v114 = a4;
        uint64_t v56 = *(void *)v118;
        while (1)
        {
          for (i = 0LL; i != v26; i = (char *)i + 1)
          {
            if (*(void *)v118 != v56) {
              objc_enumerationMutation(obja);
            }
            int64_t v58 = *(void **)(*((void *)&v117 + 1) + 8LL * (void)i);
            id v59 = (id)objc_claimAutoreleasedReturnValue([v58 accountIdentifier]);
            id v60 = v24;
            id v61 = v60;
            if (v59 == v60)
            {
              id v62 = v24;

LABEL_65:
              int v41 = (void *)objc_claimAutoreleasedReturnValue([v58 associatedPassUniqueID]);
              if (v41)
              {
                id v67 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer dataSource](v116, "dataSource"));
                id v68 = (void *)objc_claimAutoreleasedReturnValue([v67 transactionSourceIdentifiersForPassUniqueIdentifier:v41]);
                id v26 = (id)objc_claimAutoreleasedReturnValue([v68 anyObject]);

                a4 = v114;
                id v15 = v106;
                BOOL v24 = v62;
                self = v116;
                goto LABEL_78;
              }

              id v15 = v106;
              a4 = v114;
              BOOL v24 = v62;
              if (v103 == 3)
              {
                self = v116;
                id v67 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer dataSource](v116, "dataSource"));
                id v26 = (id)objc_claimAutoreleasedReturnValue([v67 transactionSourceIdentifierForAccountIdentifier:v61]);
LABEL_78:
              }

              else
              {
                id v26 = 0LL;
                self = v116;
              }

              uint64_t v27 = v103;
              goto LABEL_80;
            }

            id v62 = v24;
            if (v24 && v59)
            {
              unsigned int v63 = [v59 isEqualToString:v60];

              if (v63) {
                goto LABEL_65;
              }
            }

            else
            {
            }

            BOOL v24 = v62;
            self = v116;
          }

          id v26 = -[NSSet countByEnumeratingWithState:objects:count:]( obja,  "countByEnumeratingWithState:objects:count:",  &v117,  v129,  16LL);
          if (!v26)
          {
            a4 = v114;
            uint64_t v27 = v103;
            id v15 = v106;
            goto LABEL_81;
          }
        }
      }

      if (v27 != 1)
      {
        id v26 = 0LL;
        goto LABEL_82;
      }

      uint64_t v38 = objc_claimAutoreleasedReturnValue( -[PKPeerPaymentAccount peerPaymentAccountWithIdentifier:]( self->_peerPaymentAccount,  "peerPaymentAccountWithIdentifier:",  v24));
      peerPaymentAccount = self->_peerPaymentAccount;
      int v40 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer dataSource](self, "dataSource"));
      obja = (NSSet *)v38;
      if ((PKPeerPaymentAccount *)v38 == peerPaymentAccount)
      {
        __int128 v95 = v40;
        __int128 v96 = (void *)objc_claimAutoreleasedReturnValue( -[PKPeerPaymentAccount associatedPassUniqueID]( self->_peerPaymentAccount,  "associatedPassUniqueID"));
        int v41 = v95;
        __int128 v97 = (void *)objc_claimAutoreleasedReturnValue([v95 transactionSourceIdentifiersForPassUniqueIdentifier:v96]);
        id v26 = (id)objc_claimAutoreleasedReturnValue([v97 anyObject]);

        uint64_t v27 = v103;
      }

      else
      {
        int v41 = v40;
        id v26 = (id)objc_claimAutoreleasedReturnValue([v40 transactionSourceIdentifierForPeerPaymentAccountIdentifier:v24]);
      }

- (id)filterCloudStoreZones:(id)a3 action:(unint64_t)a4 inContainerDatabase:(id)a5
{
  id v6 = a3;
  id v7 = a5;
  __int16 v30 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v34 objects:v44 count:16];
  if (v9)
  {
    id v11 = v9;
    uint64_t v12 = *(void *)v35;
    *(void *)&__int128 v10 = 138412802LL;
    __int128 v29 = v10;
LABEL_3:
    uint64_t v13 = 0LL;
    while (2)
    {
      if (*(void *)v35 != v12) {
        objc_enumerationMutation(v8);
      }
      uint64_t v14 = *(void **)(*((void *)&v34 + 1) + 8 * v13);
      id v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "zoneName", v29));
      switch((unint64_t)[v14 zoneType])
      {
        case 0uLL:
          goto LABEL_22;
        case 1uLL:
        case 2uLL:
        case 7uLL:
        case 8uLL:
          goto LABEL_22;
        case 3uLL:
          id v20 = [v7 scope];
          if (v20 != (id)1 && (v20 != (id)3 || a4 > 3 || a4 == 2)) {
            goto LABEL_26;
          }
          goto LABEL_22;
        case 5uLL:
        case 6uLL:
          id v32 = 0LL;
          id v33 = 0LL;
          +[PKCloudStoreZone zoneValueForZoneName:outZoneType:outAccountIdentifier:altDSID:]( &OBJC_CLASS___PKCloudStoreZone,  "zoneValueForZoneName:outZoneType:outAccountIdentifier:altDSID:",  v15,  0LL,  &v33,  &v32);
          id v16 = v33;
          id v17 = v32;
          __int128 v18 = (char *)[v7 scope];
          if ((unint64_t)(v18 - 2) >= 2)
          {
LABEL_21:

            goto LABEL_22;
          }

          if (!a4) {
            goto LABEL_21;
          }
          if (a4 != 3 || [v7 scope] == (id)2)
          {
LABEL_25:

LABEL_26:
            -[NSMutableSet addObject:](v30, "addObject:", v14);
            goto LABEL_27;
          }

          char v19 = PKAltDSIDIsCurrentUser(v17);

          if ((v19 & 1) != 0) {
            goto LABEL_26;
          }
LABEL_22:
          uint64_t Object = PKLogFacilityTypeGetObject(9LL);
          __int128 v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            id v23 = PDCloudStoreZoneActionToString(a4);
            BOOL v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
            id v25 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
            *(_DWORD *)__int128 buf = v29;
            id v39 = v14;
            __int16 v40 = 2112;
            int v41 = v24;
            __int16 v42 = 2112;
            id v43 = v25;
            _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Filtering zone %@ for action %@ in container %@",  buf,  0x20u);
          }

LABEL_27:
          if (v11 != (id)++v13) {
            continue;
          }
          id v11 = [v8 countByEnumeratingWithState:&v34 objects:v44 count:16];
          if (!v11) {
            goto LABEL_29;
          }
          goto LABEL_3;
        default:
          goto LABEL_26;
      }
    }
  }

- (id)cloudStoreZonesForItemType:(unint64_t)a3 configuration:(id)a4 action:(unint64_t)a5 inContainerDatabase:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  uint64_t v12 = objc_claimAutoreleasedReturnValue([v10 recordName]);
  uint64_t v13 = (void *)v12;
  uint64_t v14 = 0LL;
  switch(a3)
  {
    case 1uLL:
      if (v12)
      {
        id v17 = (void *)objc_claimAutoreleasedReturnValue(+[PKPaymentTransaction recordNamePrefix](&OBJC_CLASS___PKPaymentTransaction, "recordNamePrefix"));
        uint64_t v18 = objc_claimAutoreleasedReturnValue([v13 stringByReplacingOccurrencesOfString:v17 withString:&stru_100662310]);

        char v19 = (void *)objc_claimAutoreleasedReturnValue([v10 transactionSourceIdentifier]);
        if (!v19)
        {
          id v20 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer dataSource](self, "dataSource"));
          __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v10 accountIdentifier]);
          char v19 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v20,  "transactionSourceIdentifierForTransactionWithServiceIdentifier:accountIdentifier:accountType:",  v18,  v21,  objc_msgSend(v10, "accountType")));

          if (!v19)
          {
            __int128 v22 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer dataSource](self, "dataSource"));
            id v23 = (void *)objc_claimAutoreleasedReturnValue([v10 altDSID]);
            BOOL v24 = (void *)objc_claimAutoreleasedReturnValue([v10 accountIdentifier]);
            char v19 = (void *)objc_claimAutoreleasedReturnValue( [v22 transactionSourceIdentifierForAccountUserAltDSID:v23 accountIdentifier:v24]);
          }
        }

        id v25 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer dataSource](self, "dataSource"));
        id v26 = [v25 transactionSourceTypeForTransactionSourceIdentifier:v19];

        switch((unint64_t)v26)
        {
          case 0uLL:
            unint64_t v143 = a5;
            id v27 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer dataSource](self, "dataSource"));
            uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v27 passUniqueIdentifierForTransactionSourceIdentifier:v19]);

            uint64_t v139 = v18;
            v141 = v19;
            if (v28) {
              goto LABEL_64;
            }
            *(void *)__int128 buf = 0LL;
            __int128 v29 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer dataSource](self, "dataSource"));
            id v153 = 0LL;
            id v154 = 0LL;
            __int16 v30 = (void *)objc_claimAutoreleasedReturnValue( [v29 broadwayOrSurfTransactionSourceIdentifierForAmbiguousServiceIdentifier:v18 transactionAccountI dentifier:&v154 transactionAccountType:buf transactionAltDSID:&v153]);
            id v31 = v154;
            id v32 = v153;

            if (v30)
            {
              id obja = v32;
              id v33 = v31;
              __int128 v34 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer dataSource](self, "dataSource"));
              uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v34 passUniqueIdentifierForTransactionSourceIdentifier:v30]);

              id v31 = v33;
              id v32 = obja;
              [v10 setAccountIdentifier:v31];
              [v10 setAccountType:*(void *)buf];
              [v10 setAltDSID:obja];
            }

            else
            {
              uint64_t v28 = 0LL;
            }

            if (v28)
            {
LABEL_64:
              __int128 v85 = (void *)objc_claimAutoreleasedReturnValue( -[PKPeerPaymentAccount associatedPassUniqueID]( self->_peerPaymentAccount,  "associatedPassUniqueID"));
              id v86 = v28;
              id v87 = v85;
              if (v86 == v87)
              {
              }

              else
              {
                unint64_t v88 = v87;
                if (!v87)
                {

                  goto LABEL_72;
                }

                unsigned int v89 = [v86 isEqualToString:v87];

                if (!v89)
                {
LABEL_72:
                  __int128 v92 = (void *)objc_claimAutoreleasedReturnValue([v10 accountIdentifier]);
                  __int128 v93 = (void *)objc_claimAutoreleasedReturnValue([v10 altDSID]);
                  __int128 v94 = v93;
                  if (v93)
                  {
                    id v95 = v93;
                  }

                  else
                  {
                    uint64_t v96 = PKCurrentUserAltDSID();
                    id v95 = (id)objc_claimAutoreleasedReturnValue(v96);
                  }

                  __int128 v91 = v95;

                  accounts = self->_accounts;
                  v151[0] = _NSConcreteStackBlock;
                  v151[1] = 3221225472LL;
                  v151[2] = sub_10009CB6C;
                  v151[3] = &unk_10063F2D0;
                  id v90 = v92;
                  id v152 = v90;
                  __int128 v98 = (void *)objc_claimAutoreleasedReturnValue(-[NSSet pk_anyObjectPassingTest:](accounts, "pk_anyObjectPassingTest:", v151));
                  __int128 v136 = v98;
                  if ([v98 isSharedAccount] && v90 && v91)
                  {
                    id v133 = v90;
                    uint64_t v99 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer dataSource](self, "dataSource"));
                    uint64_t v100 = (NSSet *)objc_claimAutoreleasedReturnValue( [v99 transactionArchiveForTransactionWithServiceIdentifier:v18 transactionSourceIdentifier:v141]);

                    id obj = v100;
                    id v101 = (void *)objc_claimAutoreleasedReturnValue(-[NSSet locations](v100, "locations"));
                    id v102 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v101, "pk_setByApplyingBlock:", &stru_10063F310));

                    uint64_t v103 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer containerManager](self, "containerManager"));
                    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v103 cloudStoreZonesFromZoneNames:v102 inContainerDatabase:v11]);

                    if (![v14 count])
                    {
                      v104 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer dataSource](self, "dataSource"));
                      v105 = (void *)objc_claimAutoreleasedReturnValue([v104 accountUserWithAltDSID:v91 accountIdentifier:v133]);

                      if (v105)
                      {
                        __int128 v134 = v105;
                        id v106 = (void *)objc_claimAutoreleasedReturnValue( -[PDApplePayCloudStoreContainer _accountZoneNamesForAccountUser:containerDatabase:]( self,  "_accountZoneNamesForAccountUser:containerDatabase:",  v105,  v11));
                        id v107 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer containerManager](self, "containerManager"));
                        uint64_t v130 = objc_claimAutoreleasedReturnValue([v107 cloudStoreZonesFromZoneNames:v106 inContainerDatabase:v11]);

                        v105 = v134;
                        uint64_t v14 = (void *)v130;
                      }
                    }

- (void)_queue_processPeerPaymentAccountChangeWithOldAccount:(id)a3 newPeerPaymentAccount:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer containerManager](self, "containerManager"));
  id v13 = (id)objc_claimAutoreleasedReturnValue([v8 databaseForScope:2]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[PDApplePayCloudStoreContainer _peerPaymentZoneNamesForAccount:containerDatabase:]( self,  "_peerPaymentZoneNamesForAccount:containerDatabase:",  v6,  v13));
  id v10 = (void *)objc_claimAutoreleasedReturnValue( -[PDApplePayCloudStoreContainer _peerPaymentZoneNamesForAccount:containerDatabase:]( self,  "_peerPaymentZoneNamesForAccount:containerDatabase:",  v7,  v13));

  id v11 = [v10 mutableCopy];
  [v11 minusSet:v9];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( -[PDApplePayCloudStoreContainer _accountZoneNamesForAccountSet:containerDatabase:]( self,  "_accountZoneNamesForAccountSet:containerDatabase:",  self->_accounts,  v13));
  [v11 minusSet:v12];
  -[PDApplePayCloudStoreContainer _queue_updateWithPossibleNewZonesToAdd:orphanedZones:containerDatabase:]( self,  "_queue_updateWithPossibleNewZonesToAdd:orphanedZones:containerDatabase:",  v9,  v11,  v13);
}

- (void)_queue_processAccountChangeWithOldAccounts:(id)a3 newAccounts:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer containerManager](self, "containerManager"));
  id v13 = (id)objc_claimAutoreleasedReturnValue([v8 databaseForScope:2]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[PDApplePayCloudStoreContainer _accountZoneNamesForAccountSet:containerDatabase:]( self,  "_accountZoneNamesForAccountSet:containerDatabase:",  v6,  v13));
  id v10 = (void *)objc_claimAutoreleasedReturnValue( -[PDApplePayCloudStoreContainer _accountZoneNamesForAccountSet:containerDatabase:]( self,  "_accountZoneNamesForAccountSet:containerDatabase:",  v7,  v13));

  id v11 = [v10 mutableCopy];
  [v11 minusSet:v9];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( -[PDApplePayCloudStoreContainer _peerPaymentZoneNamesForAccount:containerDatabase:]( self,  "_peerPaymentZoneNamesForAccount:containerDatabase:",  self->_peerPaymentAccount,  v13));
  [v11 minusSet:v12];
  -[PDApplePayCloudStoreContainer _queue_updateWithPossibleNewZonesToAdd:orphanedZones:containerDatabase:]( self,  "_queue_updateWithPossibleNewZonesToAdd:orphanedZones:containerDatabase:",  v9,  v11,  v13);
}

- (void)_queue_processSharedAccountCloudStoreChangeWithOldSharedAccountCloudStore:(id)a3 newSharedAccountCloudStore:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer containerManager](self, "containerManager"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 databaseForScope:2]);

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 sharedAccountCloudStoreZonesWithAccess:1]);
  uint64_t Object = PKLogFacilityTypeGetObject(9LL);
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412290;
    id v15 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Old shared account cloud store %@: ",  (uint8_t *)&v14,  0xCu);
  }

  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412290;
    id v15 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "New shared account cloud store %@: ",  (uint8_t *)&v14,  0xCu);
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "pk_setByApplyingBlock:", &stru_10063F350));
  -[PDApplePayCloudStoreContainer _queue_updateWithPossibleNewZonesToAdd:orphanedZones:containerDatabase:]( self,  "_queue_updateWithPossibleNewZonesToAdd:orphanedZones:containerDatabase:",  v13,  0LL,  v9);
}

- (void)_queue_updateWithPossibleNewZonesToAdd:(id)a3 orphanedZones:(id)a4 containerDatabase:(id)a5
{
  id v8 = (NSMutableSet *)a3;
  id v39 = (NSMutableSet *)a4;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer containerManager](self, "containerManager"));
  uint64_t v11 = objc_claimAutoreleasedReturnValue([v10 containerName]);

  uint64_t Object = PKLogFacilityTypeGetObject(9LL);
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 134218498;
    id v57 = -[NSMutableSet count](v8, "count");
    __int16 v58 = 2112;
    id v59 = v8;
    __int16 v60 = 2114;
    uint64_t v61 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%lu possible new zones to add for %@ container: %{public}@",  buf,  0x20u);
  }

  id v40 = (void *)v11;
  oslog = v13;

  int v14 = -[NSMutableSet initWithSet:](objc_alloc(&OBJC_CLASS___NSMutableSet), "initWithSet:", v8);
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  id v15 = v8;
  id v16 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v48,  v55,  16LL);
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v49;
    do
    {
      for (i = 0LL; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v49 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void *)(*((void *)&v48 + 1) + 8LL * (void)i);
        __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer containerManager](self, "containerManager"));
        __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([v21 cloudStoreZoneForZoneName:v20 inContainerDatabase:v9]);

        if (v22) {
          -[NSMutableSet removeObject:](v14, "removeObject:", v20);
        }
      }

      id v17 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v48,  v55,  16LL);
    }

    while (v17);
  }

  id v23 = v40;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    id v24 = -[NSMutableSet count](v14, "count");
    *(_DWORD *)__int128 buf = 134218498;
    id v57 = v24;
    __int16 v58 = 2112;
    id v59 = v14;
    __int16 v60 = 2112;
    uint64_t v61 = (uint64_t)v40;
    _os_log_impl( (void *)&_mh_execute_header,  oslog,  OS_LOG_TYPE_DEFAULT,  "%lu new zones that need to be created %@ for container: %@",  buf,  0x20u);
  }

  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    id v25 = -[NSMutableSet count](v39, "count");
    *(_DWORD *)__int128 buf = 134218498;
    id v57 = v25;
    __int16 v58 = 2112;
    id v59 = v39;
    __int16 v60 = 2112;
    uint64_t v61 = (uint64_t)v40;
    _os_log_impl( (void *)&_mh_execute_header,  oslog,  OS_LOG_TYPE_DEFAULT,  "%lu zones that are orphaned from all accounts %@ for container: %@",  buf,  0x20u);
  }

  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472LL;
  v47[2] = sub_10009D4A4;
  v47[3] = &unk_100639300;
  v47[4] = self;
  id v26 = objc_retainBlock(v47);
  if (-[NSMutableSet count](v14, "count"))
  {
    os_log_t osloga = v26;
    id v27 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    __int128 v43 = 0u;
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    uint64_t v28 = v14;
    id v29 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v28,  "countByEnumeratingWithState:objects:count:",  &v43,  v54,  16LL);
    if (v29)
    {
      id v30 = v29;
      uint64_t v31 = *(void *)v44;
      do
      {
        for (j = 0LL; j != v30; j = (char *)j + 1)
        {
          if (*(void *)v44 != v31) {
            objc_enumerationMutation(v28);
          }
          id v33 = (void *)objc_claimAutoreleasedReturnValue([v9 zoneForZoneName:*(void *)(*((void *)&v43 + 1) + 8 * (void)j)]);
          -[NSMutableSet addObject:](v27, "addObject:", v33);
        }

        id v30 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v28,  "countByEnumeratingWithState:objects:count:",  &v43,  v54,  16LL);
      }

      while (v30);
    }

    __int128 v34 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
    id v52 = v34;
    id v53 = v27;
    uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v53,  &v52,  1LL));
    uint64_t v36 = PKCloudStoreOperationGroupSuffixAccountModified;
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472LL;
    v41[2] = sub_10009D4CC;
    v41[3] = &unk_10063B468;
    v41[4] = self;
    id v26 = osloga;
    __int16 v42 = osloga;
    -[PDCloudStoreContainer _queue_createZoneAndSubscriptionsByDatabaseIdentifier:groupSuffix:completion:]( self,  "_queue_createZoneAndSubscriptionsByDatabaseIdentifier:groupSuffix:completion:",  v35,  v36,  v41);

    id v23 = v40;
  }

  else if (-[PDApplePayCloudStoreContainer _queue_canInvalidateContainer](self, "_queue_canInvalidateContainer"))
  {
    -[PDApplePayCloudStoreContainer invalidateCloudStoreIfPossibleWithOperationGroupNameSuffix:clearCache:]( self,  "invalidateCloudStoreIfPossibleWithOperationGroupNameSuffix:clearCache:",  PKCloudStoreOperationGroupSuffixPKAccountRemoved,  1LL);
  }

  else
  {
    (*((void (**)(os_log_s *))v26 + 2))(v26);
  }
}

- (id)_peerPaymentZoneNamesForAccount:(id)a3 containerDatabase:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 cloudStoreZoneNames]);

  unint64_t v9 = (unint64_t)[v5 scope];
  if ((v9 & 0xFFFFFFFFFFFFFFFELL) == 2 && [v8 count])
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 anyObject]);
    -[NSMutableSet addObject:](v7, "addObject:", v10);
  }

  id v11 = -[NSMutableSet copy](v7, "copy");

  return v11;
}

- (id)_accountZoneNamesForAccountSet:(id)a3 containerDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v9 = v6;
  id v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      id v13 = 0LL;
      do
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        int v14 = (void *)objc_claimAutoreleasedReturnValue( -[PDApplePayCloudStoreContainer _accountZoneNamesForAccount:containerDatabase:]( self,  "_accountZoneNamesForAccount:containerDatabase:",  *(void *)(*((void *)&v17 + 1) + 8LL * (void)v13),  v7,  (void)v17));
        -[NSMutableSet unionSet:](v8, "unionSet:", v14);

        id v13 = (char *)v13 + 1;
      }

      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v11);
  }

  id v15 = -[NSMutableSet copy](v8, "copy");
  return v15;
}

- (id)_accountZoneNamesForAccountUser:(id)a3 containerDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 accountIdentifier]);
  if (v8)
  {
    id v9 = (char *)[v7 scope];
    else {
      uint64_t v10 = qword_1004D6880[(void)(v9 - 1)];
    }
    int v14 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKey:]( self->_sharedAccountCloudStoreByAccountIdentifier,  "objectForKey:",  v8));
    id v15 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( self->_accountUsersByAccountIdentifier,  "objectForKeyedSubscript:",  v8));
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v14 primaryZoneForAccountUser:v6 inAccountUserCollection:v15 access:v10]);
    __int128 v17 = v16;
    if (v16)
    {
      __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v16 zoneName]);
      id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v18));
    }

    else
    {
      id v13 = 0LL;
    }
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(9LL);
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 138412290;
      id v21 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Error: an account identifier is not defined for account user %@",  (uint8_t *)&v20,  0xCu);
    }

    id v13 = 0LL;
  }

  return v13;
}

- (id)_accountZoneNamesForAccount:(id)a3 containerDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  if ([v6 isSharedAccount])
  {
    accountUsersByAccountIdentifier = self->_accountUsersByAccountIdentifier;
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v6 accountIdentifier]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](accountUsersByAccountIdentifier, "objectForKey:", v10));

    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "accountUsers", 0));
    id v13 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v23;
      do
      {
        id v16 = 0LL;
        do
        {
          if (*(void *)v23 != v15) {
            objc_enumerationMutation(v12);
          }
          __int128 v17 = (void *)objc_claimAutoreleasedReturnValue( -[PDApplePayCloudStoreContainer _accountZoneNamesForAccountUser:containerDatabase:]( self,  "_accountZoneNamesForAccountUser:containerDatabase:",  *(void *)(*((void *)&v22 + 1) + 8LL * (void)v16),  v7));
          if ([v17 count]) {
            -[NSMutableSet unionSet:](v8, "unionSet:", v17);
          }

          id v16 = (char *)v16 + 1;
        }

        while (v14 != v16);
        id v14 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }

      while (v14);
    }
  }

  else if ([v7 scope] == (id)2)
  {
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v6 cloudStoreZoneNames]);
    if ([v18 count])
    {
      if ([v6 feature] == (id)4)
      {
        -[NSMutableSet addObjectsFromArray:](v8, "addObjectsFromArray:", v18);
      }

      else
      {
        __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v18 firstObject]);
        -[NSMutableSet addObject:](v8, "addObject:", v19);
      }
    }
  }

  id v20 = -[NSMutableSet copy](v8, "copy");

  return v20;
}

- (void)_queue_ensureZoneShareIntegrity
{
  if (self->_ensuringZoneShareIntegrityInProgress)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(9LL);
    id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "A zone share integrity operation is already in progress.",  buf,  2u);
    }
  }

  else
  {
    self->_ensuringZoneShareIntegrityInProgress = 1;
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472LL;
    v4[2] = sub_10009DC3C;
    v4[3] = &unk_1006392B0;
    id v5 = self;
    id v6 = (id)objc_claimAutoreleasedReturnValue( -[PDCloudStoreContainer reportContainerChangeIntervalBeginEventWithType:stateName:objectNames:operationGroupName:operationGroupNameSuffix:]( self,  "reportContainerChangeIntervalBeginEventWithType:stateName:objectNames:operationGroupName:operationGroupNameSuffix:",  40LL,  0LL,  0LL,  0LL,  0LL));
    id v3 = (os_log_s *)v6;
    -[PDApplePayCloudStoreContainer _queue_createOrRemoveZoneSharesIfNecessaryWithCompletion:]( v5,  "_queue_createOrRemoveZoneSharesIfNecessaryWithCompletion:",  v4);
  }
}

- (void)_queue_createOrRemoveZoneSharesForPeerPaymentIfNecessaryWithCompletion:(id)a3
{
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_10009DFD8;
  v21[3] = &unk_10063A830;
  id v4 = a3;
  id v22 = v4;
  id v5 = objc_retainBlock(v21);
  uint64_t Object = PKLogFacilityTypeGetObject(9LL);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Starting zone share integrity check for peer payment.",  buf,  2u);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentAccount cloudStoreZoneNames](self->_peerPaymentAccount, "cloudStoreZoneNames"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer containerManager](self, "containerManager"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer containerManager](self, "containerManager"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 databaseForScope:2]);
  id v12 = (id)objc_claimAutoreleasedReturnValue([v9 cloudStoreZonesFromZoneNames:v8 inContainerDatabase:v11]);

  if ([v12 count])
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"zoneName BEGINSWITH %@",  PKApplePayContainerCashZoneNamePrefix));
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v12 filteredSetUsingPredicate:v13]);

    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Starting zone share integrity operation",  buf,  2u);
    }

    id v15 = -[PKPeerPaymentAccount role](self->_peerPaymentAccount, "role");
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    void v16[2] = sub_10009E054;
    v16[3] = &unk_10063F418;
    id v12 = v14;
    id v20 = v15;
    id v17 = v12;
    __int128 v18 = self;
    __int128 v19 = v5;
    -[PDApplePayCloudStoreContainer _queue_familyMembersWithCompletion:]( self,  "_queue_familyMembersWithCompletion:",  v16);
  }

  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412290;
      __int128 v24 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "There are no cached cloud store zones for zone names in private database %@",  buf,  0xCu);
    }

    ((void (*)(void *))v5[2])(v5);
  }
}

- (void)_queue_createOrRemoveZoneSharesForAccountsIfNecessaryWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t Object = PKLogFacilityTypeGetObject(9LL);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    sharedAccountCloudStoreByAccountIdentifier = self->_sharedAccountCloudStoreByAccountIdentifier;
    accountUsersByAccountIdentifier = self->_accountUsersByAccountIdentifier;
    *(_DWORD *)__int128 buf = 138412546;
    __int128 v24 = sharedAccountCloudStoreByAccountIdentifier;
    __int16 v25 = 2112;
    id v26 = accountUsersByAccountIdentifier;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Starting zone share integrity check for accounts.\nsharedAccountCloudStore => %@\nusers=> %@",  buf,  0x16u);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer containerManager](self, "containerManager"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 databaseForScope:2]);

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer containerManager](self, "containerManager"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 databaseForScope:3]);

  uint64_t v13 = PKCurrentUserAltDSID();
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_10009F084;
  v18[3] = &unk_10063F490;
  v18[4] = self;
  id v19 = v10;
  id v20 = v12;
  id v21 = (id)objc_claimAutoreleasedReturnValue(v13);
  id v22 = v4;
  id v14 = v4;
  id v15 = v21;
  id v16 = v12;
  id v17 = v10;
  -[PDApplePayCloudStoreContainer _queue_familyMembersByAltDSIDWithCompletion:]( self,  "_queue_familyMembersByAltDSIDWithCompletion:",  v18);
}

- (void)_queue_createOrRemoveZoneSharesIfNecessaryWithCompletion:(id)a3
{
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1000A0240;
  v14[3] = &unk_10063A830;
  id v15 = a3;
  id v4 = v15;
  id v5 = objc_retainBlock(v14);
  id v6 = objc_alloc_init(&OBJC_CLASS___PKAsyncUnaryOperationComposer);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000A02BC;
  v13[3] = &unk_1006396D8;
  v13[4] = self;
  [v6 addOperation:v13];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000A0378;
  v12[3] = &unk_1006396D8;
  v12[4] = self;
  [v6 addOperation:v12];
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000A0434;
  v10[3] = &unk_10063F4B8;
  id v11 = v5;
  id v8 = v5;
  id v9 = [v6 evaluateWithInput:v7 completion:v10];
}

- (id)_allPossibleCloudStoreZonesForFetchingWithTransactionSourceIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer dataSource](self, "dataSource"));
  id v101 = v4;
  id v6 = [v5 transactionSourceTypeForTransactionSourceIdentifier:v4];

  id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  switch((unint64_t)v6)
  {
    case 0uLL:
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer dataSource](self, "dataSource"));
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 passUniqueIdentifierForTransactionSourceIdentifier:v101]);

      peerPaymentAccount = self->_peerPaymentAccount;
      if (peerPaymentAccount)
      {
        id v11 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentAccount associatedPassUniqueID](peerPaymentAccount, "associatedPassUniqueID"));
        id v12 = v9;
        id v13 = v11;
        id v14 = v13;
        if (v12 == v13)
        {
          unsigned int v15 = 1;
        }

        else
        {
          unsigned int v15 = 0;
          if (v12 && v13) {
            unsigned int v15 = [v12 isEqualToString:v13];
          }
        }
      }

      else
      {
        unsigned int v15 = 0;
      }

      uint64_t v61 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer dataSource](self, "dataSource"));
      uint64_t v62 = (void *)objc_claimAutoreleasedReturnValue([v61 associatedAccountIdentifierForPassWithUniqueIdentifier:v9]);

      id obj = v62;
      id v63 = [v62 length];
      if (v15)
      {
        uint64_t v64 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer containerManager](self, "containerManager"));
        id v19 = (void *)objc_claimAutoreleasedReturnValue([v64 databaseForScope:2]);

        __int128 v143 = 0u;
        __int128 v144 = 0u;
        __int128 v141 = 0u;
        __int128 v142 = 0u;
        id v104 = (id)objc_claimAutoreleasedReturnValue( -[PDApplePayCloudStoreContainer _peerPaymentZoneNamesForAccount:containerDatabase:]( self,  "_peerPaymentZoneNamesForAccount:containerDatabase:",  self->_peerPaymentAccount,  v19));
        id v65 = [v104 countByEnumeratingWithState:&v141 objects:v152 count:16];
        if (v65)
        {
          id v66 = v65;
          uint64_t v67 = *(void *)v142;
          do
          {
            for (i = 0LL; i != v66; i = (char *)i + 1)
            {
              if (*(void *)v142 != v67) {
                objc_enumerationMutation(v104);
              }
              uint64_t v69 = *(void *)(*((void *)&v141 + 1) + 8LL * (void)i);
              uint64_t v70 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer containerManager](self, "containerManager"));
              id v71 = (void *)objc_claimAutoreleasedReturnValue([v70 cloudStoreZoneForZoneName:v69 inContainerDatabase:v19]);

              if (v71) {
                -[NSMutableSet addObject:](v7, "addObject:", v71);
              }
            }

            id v66 = [v104 countByEnumeratingWithState:&v141 objects:v152 count:16];
          }

          while (v66);
        }
      }

      else
      {
        if (!v63) {
          goto LABEL_94;
        }
        __int16 v112 = v9;
        uint64_t v72 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer dataSource](self, "dataSource"));
        uint64_t v95 = objc_claimAutoreleasedReturnValue([v72 accountWithIdentifier:v62]);

        uint64_t v73 = PKCurrentUserAltDSID();
        id v104 = (id)objc_claimAutoreleasedReturnValue(v73);
        __int128 v137 = 0u;
        __int128 v138 = 0u;
        __int128 v139 = 0u;
        __int128 v140 = 0u;
        id v74 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer containerManager](self, "containerManager"));
        id v75 = (void *)objc_claimAutoreleasedReturnValue([v74 validDatabases]);

        id v96 = v75;
        id v100 = [v75 countByEnumeratingWithState:&v137 objects:v151 count:16];
        if (v100)
        {
          uint64_t v97 = *(void *)v138;
          do
          {
            for (j = 0LL; j != v100; j = (char *)j + 1)
            {
              if (*(void *)v138 != v97) {
                objc_enumerationMutation(v96);
              }
              uint64_t v77 = *(void **)(*((void *)&v137 + 1) + 8LL * (void)j);
              id v78 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer dataSource](self, "dataSource"));
              uint64_t v79 = objc_claimAutoreleasedReturnValue([v78 accountUserWithAltDSID:v104 accountIdentifier:obj]);

              id v109 = (void *)v79;
              if (v79)
              {
                uint64_t v80 = (char *)[v77 scope];
                else {
                  uint64_t v81 = qword_1004D6880[(void)(v80 - 1)];
                }
                unint64_t v83 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKey:]( self->_sharedAccountCloudStoreByAccountIdentifier,  "objectForKey:",  obj));
                id v84 = (void *)objc_claimAutoreleasedReturnValue([v83 allPossibleZonesForAccountUser:v79 access:v81]);
                __int128 v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "pk_arrayByApplyingBlock:", &stru_10063F4D8));
                uint64_t v82 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v85));
              }

              else
              {
                uint64_t v82 = (void *)objc_claimAutoreleasedReturnValue( -[PDApplePayCloudStoreContainer _accountZoneNamesForAccount:containerDatabase:]( self,  "_accountZoneNamesForAccount:containerDatabase:",  v95,  v77));
              }

              __int128 v135 = 0u;
              __int128 v136 = 0u;
              __int128 v133 = 0u;
              __int128 v134 = 0u;
              id v86 = v82;
              id v87 = [v86 countByEnumeratingWithState:&v133 objects:v150 count:16];
              if (v87)
              {
                id v88 = v87;
                uint64_t v89 = *(void *)v134;
                do
                {
                  for (k = 0LL; k != v88; k = (char *)k + 1)
                  {
                    if (*(void *)v134 != v89) {
                      objc_enumerationMutation(v86);
                    }
                    uint64_t v91 = *(void *)(*((void *)&v133 + 1) + 8LL * (void)k);
                    __int128 v92 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer containerManager](self, "containerManager"));
                    __int128 v93 = (void *)objc_claimAutoreleasedReturnValue([v92 cloudStoreZoneForZoneName:v91 inContainerDatabase:v77]);

                    if (v93) {
                      -[NSMutableSet addObject:](v7, "addObject:", v93);
                    }
                  }

                  id v88 = [v86 countByEnumeratingWithState:&v133 objects:v150 count:16];
                }

                while (v88);
              }
            }

            id v100 = [v96 countByEnumeratingWithState:&v137 objects:v151 count:16];
          }

          while (v100);
        }

        id v9 = v112;
        id v19 = (void *)v95;
      }

      goto LABEL_93;
    case 1uLL:
      id v16 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer containerManager](self, "containerManager"));
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v16 databaseForScope:3]);

      id v17 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer dataSource](self, "dataSource"));
      uint64_t v18 = objc_claimAutoreleasedReturnValue([v17 peerPaymentAccountForTransactionSourceIdentifier:v101]);

      __int128 v131 = 0u;
      __int128 v132 = 0u;
      __int128 v129 = 0u;
      __int128 v130 = 0u;
      id obj = (id)v18;
      id v19 = (void *)objc_claimAutoreleasedReturnValue( -[PDApplePayCloudStoreContainer _peerPaymentZoneNamesForAccount:containerDatabase:]( self,  "_peerPaymentZoneNamesForAccount:containerDatabase:",  v18,  v9));
      id v20 = [v19 countByEnumeratingWithState:&v129 objects:v149 count:16];
      if (v20)
      {
        id v21 = v20;
        uint64_t v22 = *(void *)v130;
        do
        {
          for (m = 0LL; m != v21; m = (char *)m + 1)
          {
            if (*(void *)v130 != v22) {
              objc_enumerationMutation(v19);
            }
            uint64_t v24 = *(void *)(*((void *)&v129 + 1) + 8LL * (void)m);
            __int16 v25 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer containerManager](self, "containerManager"));
            id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 cloudStoreZoneForZoneName:v24 inContainerDatabase:v9]);

            if (v26) {
              -[NSMutableSet addObject:](v7, "addObject:", v26);
            }
          }

          id v21 = [v19 countByEnumeratingWithState:&v129 objects:v149 count:16];
        }

        while (v21);
      }

- (void)_handleFamilyUpdateNotification:(id)a3
{
  uint64_t Object = PKLogFacilityTypeGetObject(9LL);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "FAFamilyUpdateNotification fired", buf, 2u);
  }

  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer workQueue](self, "workQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000A0F74;
  block[3] = &unk_100639300;
  void block[4] = self;
  dispatch_async(v6, block);
}

- (void)_queue_familyMembersWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    familyCircleManager = self->_familyCircleManager;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1000A1014;
    v7[3] = &unk_10063F520;
    v7[4] = self;
    id v8 = v4;
    -[PDFamilyCircleManager familyMembersWithCachePolicy:completion:]( familyCircleManager,  "familyMembersWithCachePolicy:completion:",  0LL,  v7);
  }
}

- (void)_queue_familyMembersByAltDSIDWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    familyCircleManager = self->_familyCircleManager;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1000A1164;
    v7[3] = &unk_10063F520;
    v7[4] = self;
    id v8 = v4;
    -[PDFamilyCircleManager familyMembersWithCachePolicy:completion:]( familyCircleManager,  "familyMembersWithCachePolicy:completion:",  0LL,  v7);
  }
}

- (void)_updateUnarchivedTransactionsScheduledActivityIfNeccessary
{
  id v3 = PKCloudStoreOperationGroupSuffixFetchTaskBackgroundActivity;
  if ((PDScheduledActivityExists( @"ApplePayCloudStoreContainerClientIdentifier",  @"ApplePayCloudStoreUnarchivedTask") & 1) == 0)
  {
    if (-[PDCloudStoreContainer isCloudStoreSetupAssistantComplete](self, "isCloudStoreSetupAssistantComplete"))
    {
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472LL;
      v6[2] = sub_1000A14C4;
      v6[3] = &unk_10063DAE8;
      v6[4] = self;
      v6[5] = v3;
      -[PDCloudStoreContainer initialCloudDatabaseSetupWithOperationGroupNameSuffix:completion:]( self,  "initialCloudDatabaseSetupWithOperationGroupNameSuffix:completion:",  v3,  v6);
    }

    else
    {
      uint64_t Object = PKLogFacilityTypeGetObject(9LL);
      id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 138543362;
        id v8 = @"ApplePayCloudStoreUnarchivedTask";
        _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Not scheduling %{public}@ since PDCloudStoreContainerSetupAssistantState is not complete",  buf,  0xCu);
      }
    }
  }
}

- (void)_updateFetchTaskScheduledActivityIfNeccessary
{
  id v3 = PKCloudStoreOperationGroupSuffixFetchTaskBackgroundActivity;
  if (-[PDCloudStoreContainer isCloudStoreSetupAssistantComplete](self, "isCloudStoreSetupAssistantComplete"))
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_1000A18A4;
    v6[3] = &unk_10063DAE8;
    v6[4] = self;
    v6[5] = v3;
    -[PDCloudStoreContainer initialCloudDatabaseSetupWithOperationGroupNameSuffix:completion:]( self,  "initialCloudDatabaseSetupWithOperationGroupNameSuffix:completion:",  v3,  v6);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(9LL);
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138543362;
      id v8 = @"ApplePayCloudStorePerformFetchTasks";
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Not scheduling %{public}@ since PDCloudStoreContainerSetupAssistantState is not complete",  buf,  0xCu);
    }
  }
}

- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = PKCloudStoreOperationGroupScheduledActivity;
  id v9 = PKCloudStoreOperationGroupSuffixFetchTaskBackgroundActivity;
  uint64_t Object = PKLogFacilityTypeGetObject(9LL);
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138543362;
    id v20 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "PDApplePayCloudStoreContainer starting activity: %{public}@",  buf,  0xCu);
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_backgroundTasksBeingRun,  "objectForKeyedSubscript:",  v6));
  unsigned int v13 = [v12 BOOLValue];

  if (-[PDCloudStoreContainer isCloudStoreSetupAssistantComplete](self, "isCloudStoreSetupAssistantComplete"))
  {
    if (!v13)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_backgroundTasksBeingRun,  "setObject:forKeyedSubscript:",  &__kCFBooleanTrue,  v6);
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472LL;
      v15[2] = sub_1000A21E0;
      v15[3] = &unk_10063A340;
      void v15[4] = self;
      id v16 = v6;
      id v17 = v8;
      id v18 = v9;
      -[PDCloudStoreContainer initialCloudDatabaseSetupWithOperationGroupNameSuffix:completion:]( self,  "initialCloudDatabaseSetupWithOperationGroupNameSuffix:completion:",  v9,  v15);

      goto LABEL_12;
    }

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138543362;
      id v20 = v6;
      id v14 = "PDApplePayCloudStoreContainer not running %{public}@ since one is already in progress";
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v14, buf, 0xCu);
    }
  }

  else if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138543362;
    id v20 = v6;
    id v14 = "PDApplePayCloudStoreContainer not running %{public}@ since setup assistant is not complete";
    goto LABEL_9;
  }

LABEL_12:
}

- (void)_queue_performFetchTasksBackgroundActivityForGroupName:(id)a3 suffix:(id)a4 completion:(id)a5
{
  id v108 = a3;
  id v131 = a4;
  id v107 = (void (**)(void))a5;
  id v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v115 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v116 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v122 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  os_unfair_lock_t lock = &self->_fetchTasksLock;
  os_unfair_lock_lock(&self->_fetchTasksLock);
  uint64_t v9 = objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  __int128 v124 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v127 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v120 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  uint64_t Object = PKLogFacilityTypeGetObject(9LL);
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    fetchTasks = self->_fetchTasks;
    *(_DWORD *)__int128 buf = 138543618;
    v161 = @"ApplePayCloudStorePerformFetchTasks";
    __int16 v162 = 2112;
    v163 = fetchTasks;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Current cloud store fetch tasks for acivity %{public}@: %@",  buf,  0x16u);
  }

  oslog = v11;

  __int128 v153 = 0u;
  __int128 v154 = 0u;
  __int128 v151 = 0u;
  __int128 v152 = 0u;
  id obj = self->_fetchTasks;
  id v132 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v151,  v172,  16LL);
  __int128 v134 = self;
  __int128 v123 = (void *)v9;
  if (v132)
  {
    uint64_t v128 = *(void *)v152;
    do
    {
      unsigned int v13 = 0LL;
      do
      {
        if (*(void *)v152 != v128) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v151 + 1) + 8LL * (void)v13);
        unsigned int v15 = objc_autoreleasePoolPush();
        id v16 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_fetchTasks,  "objectForKeyedSubscript:",  v14));
        id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 task]);
        id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 nextPossibleFetchDate]);
        if (!v14 || [v17 status] != (id)3 || v18 && objc_msgSend(v18, "compare:", v9) == (id)1)
        {
          -[NSMutableArray safelyAddObject:](v127, "safelyAddObject:", v17);
          goto LABEL_13;
        }

        -[NSMutableArray safelyAddObject:](v124, "safelyAddObject:", v17);
        id v19 = [v17 type];
        if (v19 == (id)3)
        {
          -[NSMutableSet pk_safelyAddObject:](v122, "pk_safelyAddObject:", v14);
          goto LABEL_13;
        }

        if (v19 == (id)2)
        {
          uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer dataSource](self, "dataSource"));
          unsigned __int8 v39 = [v38 transactionSourceExistsWithIdentifier:v14];

          if ((v39 & 1) != 0)
          {
            -[NSMutableSet pk_safelyAddObject:](v116, "pk_safelyAddObject:", v14);
          }

          else
          {
            -[NSMutableArray safelyAddObject:](v120, "safelyAddObject:", v17);
            -[NSMutableArray removeObject:](v124, "removeObject:", v17);
          }
        }

        else
        {
          if (v19 != (id)1) {
            goto LABEL_13;
          }
          id v20 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer dataSource](self, "dataSource"));
          id v21 = self;
          unsigned __int8 v22 = [v20 transactionSourceExistsWithIdentifier:v14];

          if ((v22 & 1) == 0)
          {
            -[NSMutableArray safelyAddObject:](v120, "safelyAddObject:", v17);
            -[NSMutableArray removeObject:](v124, "removeObject:", v17);
            self = v21;
            uint64_t v9 = (uint64_t)v123;
            goto LABEL_13;
          }

          __int128 v23 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer dataSource](v21, "dataSource"));
          id v24 = [v23 transactionSourceTypeForTransactionSourceIdentifier:v14];

          self = v21;
          uint64_t v9 = (uint64_t)v123;
          switch((unint64_t)v24)
          {
            case 0uLL:
              __int16 v25 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer dataSource](self, "dataSource"));
              uint64_t v26 = objc_claimAutoreleasedReturnValue([v25 passUniqueIdentifierForTransactionSourceIdentifier:v14]);

              id v27 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer dataSource](self, "dataSource"));
              __int128 v121 = (void *)v26;
              uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v27 passWithUniqueIdentifier:v26]);
              id v29 = (void *)objc_claimAutoreleasedReturnValue([v28 paymentPass]);

              id v30 = v29;
              if (!v29)
              {
                self = v134;
                uint64_t v9 = (uint64_t)v123;
                goto LABEL_43;
              }

              unsigned __int8 v31 = [v29 hasAssociatedPeerPaymentAccount];
              id v32 = @"Apple Cash";
              self = v134;
              uint64_t v9 = (uint64_t)v123;
              if ((v31 & 1) == 0)
              {
                __int16 v112 = v30;
                id v33 = [v30 associatedAccountFeatureIdentifier];
                if (!v33)
                {
                  __int128 v34 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer dataSource](v134, "dataSource"));
                  uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue([v34 associatedAccountIdentifierForPassWithUniqueIdentifier:v121]);

                  __int128 v118 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer dataSource](v134, "dataSource"));
                  uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue([v118 accountWithIdentifier:v35]);
                  id v33 = [v36 feature];

                  self = v134;
                }

                uint64_t v37 = PKFeatureIdentifierToString(v33);
                id v32 = (const __CFString *)objc_claimAutoreleasedReturnValue(v37);
                id v30 = v112;
                uint64_t v9 = (uint64_t)v123;
              }

              __int128 v119 = (void *)v32;
              __int128 v117 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"paymentApplication, %@, %@",  v121,  v32));
              -[NSMutableDictionary safelySetObject:forKey:](v8, "safelySetObject:forKey:");
              goto LABEL_42;
            case 1uLL:
              id v40 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer dataSource](self, "dataSource"));
              id v41 = (void *)objc_claimAutoreleasedReturnValue([v40 peerPaymentAccount]);
              __int128 v121 = (void *)objc_claimAutoreleasedReturnValue([v41 associatedPassUniqueID]);

              self = v134;
              id v42 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer dataSource](v134, "dataSource"));
              uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue([v42 peerPaymentAccountForTransactionSourceIdentifier:v14]);

              uint64_t v44 = objc_claimAutoreleasedReturnValue([v43 identifier]);
              __int128 v117 = (void *)objc_claimAutoreleasedReturnValue([v43 altDSID]);
              __int128 v119 = (void *)v44;
              uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Peer Payment Associated Account: %@, %@",  v44,  v117));
              -[NSMutableDictionary safelySetObject:forKey:](v8, "safelySetObject:forKey:", v45, v14);

              id v30 = v43;
              uint64_t v9 = (uint64_t)v123;
              goto LABEL_42;
            case 2uLL:
              __int128 v46 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer dataSource](self, "dataSource"));
              __int128 v113 = (void *)objc_claimAutoreleasedReturnValue([v46 accountUserWithTransactionSourceIdentifier:v14]);

              uint64_t v47 = objc_claimAutoreleasedReturnValue([v113 accountIdentifier]);
              __int128 v48 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer dataSource](self, "dataSource"));
              __int128 v119 = (void *)v47;
              __int128 v121 = (void *)objc_claimAutoreleasedReturnValue([v48 passUniqueIdentifierWithAssociatedAccountIdentifier:v47]);

              __int128 v117 = (void *)objc_claimAutoreleasedReturnValue([v113 altDSID]);
              v111 = (void *)objc_claimAutoreleasedReturnValue([v113 firstName]);
              __int16 v110 = (void *)objc_claimAutoreleasedReturnValue([v113 lastName]);
              id v109 = (void *)objc_claimAutoreleasedReturnValue([v113 appleID]);
              __int128 v49 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"accountUser, %@ - %@ - %@ - %@",  v117,  v111,  v110,  v109));
              -[NSMutableDictionary safelySetObject:forKey:](v8, "safelySetObject:forKey:", v49, v14);

              id v30 = v113;
              uint64_t v9 = (uint64_t)v123;

              self = v134;
              goto LABEL_42;
            case 3uLL:
              __int128 v50 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer dataSource](self, "dataSource"));
              uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue([v50 accountWithTransactionSourceIdentifier:v14]);

              __int128 v114 = v51;
              __int128 v119 = (void *)objc_claimAutoreleasedReturnValue([v51 accountIdentifier]);
              uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer dataSource](self, "dataSource"));
              id v53 = (__CFString *)objc_claimAutoreleasedReturnValue([v52 passUniqueIdentifierForTransactionSourceIdentifier:v14]);

              if (!v53)
              {
                if ([v114 feature] == (id)5)
                {
                  accountManager = self->_accountManager;
                  id v55 = (void *)objc_claimAutoreleasedReturnValue(-[NSSet allObjects](self->_accounts, "allObjects"));
                  uint64_t v56 = (void *)objc_claimAutoreleasedReturnValue( -[PDAccountManager defaultAccountForFeature:forAccounts:]( accountManager,  "defaultAccountForFeature:forAccounts:",  2LL,  v55));
                  id v53 = (__CFString *)objc_claimAutoreleasedReturnValue([v56 associatedPassUniqueID]);

                  if (!v53
                    || (id v57 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer dataSource](v134, "dataSource")),
                        unsigned __int8 v58 = [v57 passExistsWithUniqueID:v53],
                        v57,
                        (v58 & 1) == 0))
                  {

                    id v53 = @"<savings-account>";
                  }

                  self = v134;
                }

                else
                {
                  id v53 = 0LL;
                }
              }

              __int128 v121 = v53;
              uint64_t v59 = PKFeatureIdentifierToString([v114 feature]);
              __int128 v117 = (void *)objc_claimAutoreleasedReturnValue(v59);
              __int16 v60 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"account, %@, %@",  v117,  v119));
              -[NSMutableDictionary safelySetObject:forKey:](v8, "safelySetObject:forKey:", v60, v14);

              uint64_t v9 = (uint64_t)v123;
              id v30 = v114;
LABEL_42:

LABEL_43:
              if (!v121) {
                goto LABEL_13;
              }
              uint64_t v61 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v115, "objectForKeyedSubscript:"));
              uint64_t v62 = v61;
              if (v61) {
                id v63 = v61;
              }
              else {
                id v63 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
              }
              uint64_t v64 = v63;

              -[NSMutableDictionary setObject:forKeyedSubscript:](v115, "setObject:forKeyedSubscript:", v64, v121);
              -[NSMutableSet pk_safelyAddObject:](v64, "pk_safelyAddObject:", v14);

              break;
            default:
              goto LABEL_13;
          }
        }

        self = v134;
LABEL_13:

        objc_autoreleasePoolPop(v15);
        unsigned int v13 = (char *)v13 + 1;
      }

      while (v132 != v13);
      id v65 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v151,  v172,  16LL);
      id v132 = v65;
    }

    while (v65);
  }

  os_unfair_lock_unlock(lock);
  v170[0] = @"activityIdentifier";
  v170[1] = @"processingTasks";
  id v66 = &stru_100662310;
  uint64_t v67 = (const __CFString *)v124;
  if (!v124) {
    uint64_t v67 = &stru_100662310;
  }
  v171[0] = @"ApplePayCloudStorePerformFetchTasks";
  v171[1] = v67;
  id v68 = (const __CFString *)v127;
  if (!v127) {
    id v68 = &stru_100662310;
  }
  v170[2] = @"skippingTasks";
  v170[3] = @"transactionSourceIdentifiersToDescription";
  if (v8) {
    uint64_t v69 = (const __CFString *)v8;
  }
  else {
    uint64_t v69 = &stru_100662310;
  }
  v171[2] = v68;
  v171[3] = v69;
  uint64_t v70 = v115;
  if (v115) {
    id v71 = (const __CFString *)v115;
  }
  else {
    id v71 = &stru_100662310;
  }
  v170[4] = @"passUniqueIDToTransactionSourceIdentifier";
  v170[5] = @"proactiveFetchTransactionSourceIdentifiers";
  uint64_t v72 = (const __CFString *)v116;
  if (!v116) {
    uint64_t v72 = &stru_100662310;
  }
  v171[4] = v71;
  v171[5] = v72;
  v170[6] = @"sharedZonesToFetchRecords";
  v170[7] = @"removalTasks";
  if (v122) {
    uint64_t v73 = (const __CFString *)v122;
  }
  else {
    uint64_t v73 = &stru_100662310;
  }
  if (v120) {
    id v66 = (const __CFString *)v120;
  }
  v171[6] = v73;
  v171[7] = v66;
  id v74 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v171,  v170,  8LL));
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138413314;
    v161 = (const __CFString *)v124;
    __int16 v162 = 2112;
    v163 = v127;
    __int16 v164 = 2112;
    v165 = v120;
    __int16 v166 = 2114;
    v167 = @"ApplePayCloudStorePerformFetchTasks";
    __int16 v168 = 2112;
    v169 = v74;
    _os_log_impl( (void *)&_mh_execute_header,  oslog,  OS_LOG_TYPE_DEFAULT,  "Processing fetch tasks %@, skipping fetch tasks %@, removing fetch tasks %@, for scheduled activity %{public}@. %@",  buf,  0x34u);
  }

  id obja = v74;
  id v75 = (void *)objc_claimAutoreleasedReturnValue([v74 description]);
  v159 = v75;
  uint64_t v76 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v159, 1LL));
  uint64_t v77 = v108;
  -[PDCloudStoreContainer reportContainerChangeSignpostEventType:stateName:objectNames:changeToken:error:operationGroupName:operationGroupNameSuffix:]( self,  "reportContainerChangeSignpostEventType:stateName:objectNames:changeToken:error:operationGroupName:operationGroupNameSuffix:",  55LL,  @"ApplePayCloudStorePerformFetchTasks",  v76,  0LL,  0LL,  v108,  v131);

  -[PDApplePayCloudStoreContainer _queue_ensureZoneShareIntegrity](self, "_queue_ensureZoneShareIntegrity");
  if (-[NSMutableArray count](v120, "count"))
  {
    id v78 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer dataSource](self, "dataSource"));
    [v78 removeRecordFetchTasks:v120];
  }

  if (-[NSMutableSet count](v122, "count"))
  {
    uint64_t v79 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer containerManager](self, "containerManager"));
    uint64_t v80 = (void *)objc_claimAutoreleasedReturnValue([v79 databaseForScope:3]);

    __int128 v149 = 0u;
    __int128 v150 = 0u;
    __int128 v147 = 0u;
    __int128 v148 = 0u;
    uint64_t v81 = v122;
    id v82 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v81,  "countByEnumeratingWithState:objects:count:",  &v147,  v158,  16LL);
    if (v82)
    {
      id v83 = v82;
      uint64_t v84 = *(void *)v148;
      do
      {
        for (i = 0LL; i != v83; i = (char *)i + 1)
        {
          if (*(void *)v148 != v84) {
            objc_enumerationMutation(v81);
          }
          uint64_t v86 = *(void *)(*((void *)&v147 + 1) + 8LL * (void)i);
          id v87 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer containerManager](v134, "containerManager"));
          id v88 = (void *)objc_claimAutoreleasedReturnValue([v87 cloudStoreZoneForZoneName:v86 inContainerDatabase:v80]);

          uint64_t v89 = (void *)objc_claimAutoreleasedReturnValue([v80 identifier]);
          -[PDApplePayCloudStoreContainer fetchRecordsInAcceptedZoneShare:databaseIdentifier:operationGroupName:operationGroupNameSuffix:qualityOfService:completion:]( v134,  "fetchRecordsInAcceptedZoneShare:databaseIdentifier:operationGroupName:operationGroupNameSuffix:qualityOfService:completion:",  v88,  v89,  v108,  v131,  17LL,  0LL);
        }

        id v83 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v81,  "countByEnumeratingWithState:objects:count:",  &v147,  v158,  16LL);
      }

      while (v83);
    }

    uint64_t v70 = v115;
    self = v134;
  }

  if (-[NSMutableDictionary count](v70, "count"))
  {
    __int128 v145 = 0u;
    __int128 v146 = 0u;
    __int128 v143 = 0u;
    __int128 v144 = 0u;
    __int128 v133 = v115;
    id v130 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v133,  "countByEnumeratingWithState:objects:count:",  &v143,  v157,  16LL);
    if (v130)
    {
      uint64_t v129 = *(void *)v144;
      do
      {
        for (j = 0LL; j != v130; j = (char *)j + 1)
        {
          if (*(void *)v144 != v129) {
            objc_enumerationMutation(v133);
          }
          uint64_t v91 = *(void *)(*((void *)&v143 + 1) + 8LL * (void)j);
          __int128 v92 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
          __int128 v93 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v133, "objectForKeyedSubscript:", v91));
          __int128 v139 = 0u;
          __int128 v140 = 0u;
          __int128 v141 = 0u;
          __int128 v142 = 0u;
          id v94 = [v93 countByEnumeratingWithState:&v139 objects:v156 count:16];
          if (v94)
          {
            id v95 = v94;
            uint64_t v96 = *(void *)v140;
            do
            {
              for (k = 0LL; k != v95; k = (char *)k + 1)
              {
                if (*(void *)v140 != v96) {
                  objc_enumerationMutation(v93);
                }
                uint64_t v98 = *(void *)(*((void *)&v139 + 1) + 8LL * (void)k);
                uint64_t v99 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", v98));
                -[NSMutableDictionary safelySetObject:forKey:](v92, "safelySetObject:forKey:", v99, v98);
              }

              id v95 = [v93 countByEnumeratingWithState:&v139 objects:v156 count:16];
            }

            while (v95);
          }

          if (-[NSMutableDictionary count](v92, "count")) {
            -[PDApplePayCloudStoreContainer passProvisioningDidStartForPassUniqueID:transactionSourceIdentifiers:ignoreExistingRecordHash:groupNameSuffix:completion:]( v134,  "passProvisioningDidStartForPassUniqueID:transactionSourceIdentifiers:ignoreExistingRecordHash:groupNameSuffix:completion:",  v91,  v92,  0LL,  v131,  0LL);
          }
        }

        id v130 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v133,  "countByEnumeratingWithState:objects:count:",  &v143,  v157,  16LL);
      }

      while (v130);
    }

    uint64_t v77 = v108;
    self = v134;
  }

  if (-[NSMutableSet count](v116, "count"))
  {
    __int128 v137 = 0u;
    __int128 v138 = 0u;
    __int128 v135 = 0u;
    __int128 v136 = 0u;
    id v100 = v116;
    id v101 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v100,  "countByEnumeratingWithState:objects:count:",  &v135,  v155,  16LL);
    if (v101)
    {
      id v102 = v101;
      uint64_t v103 = *(void *)v136;
      do
      {
        for (m = 0LL; m != v102; m = (char *)m + 1)
        {
          if (*(void *)v136 != v103) {
            objc_enumerationMutation(v100);
          }
          -[PDApplePayCloudStoreContainer requestUpdatesForTransactionSourceIdentifier:]( self,  "requestUpdatesForTransactionSourceIdentifier:",  *(void *)(*((void *)&v135 + 1) + 8LL * (void)m));
        }

        id v102 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v100,  "countByEnumeratingWithState:objects:count:",  &v135,  v155,  16LL);
      }

      while (v102);
    }
  }

  -[PDApplePayCloudStoreContainer _updateFetchTaskScheduledActivityIfNeccessary]( self,  "_updateFetchTaskScheduledActivityIfNeccessary");
  if (v107) {
    v107[2](v107);
  }
}

- (void)_queue_performUnarchivedTransactionsBackgroundActivityForGroupName:(id)a3 suffix:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer dataSource](self, "dataSource"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 transactionArchivesWithType:0 isArchived:0]);
  unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v12 allObjects]);

  uint64_t Object = PKLogFacilityTypeGetObject(9LL);
  unsigned int v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 134349056;
    id v44 = [v13 count];
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Uploading %{public}lu unarchived transactions",  buf,  0xCu);
  }

  id v16 = objc_msgSend(v13, "pk_createArrayBySafelyApplyingBlock:", &stru_10063F560);
  v41[0] = @"archivesThatNeedSyncingCount";
  id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v13 count]));
  v41[1] = @"serviceIdentifiersToUpload";
  v42[0] = v17;
  uint64_t v18 = objc_claimAutoreleasedReturnValue([v16 description]);
  id v19 = (void *)v18;
  id v20 = &stru_100662310;
  if (v18) {
    id v20 = (const __CFString *)v18;
  }
  v42[1] = v20;
  id v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v42,  v41,  2LL));

  unsigned __int8 v22 = (void *)objc_claimAutoreleasedReturnValue([v21 description]);
  id v40 = v22;
  __int128 v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v40, 1LL));
  -[PDCloudStoreContainer reportContainerChangeSignpostEventType:stateName:objectNames:changeToken:error:operationGroupName:operationGroupNameSuffix:]( self,  "reportContainerChangeSignpostEventType:stateName:objectNames:changeToken:error:operationGroupName:operationGroupNameSuffix:",  55LL,  @"ApplePayCloudStoreUnarchivedTask",  v23,  0LL,  0LL,  v10,  v9);

  id v24 = objc_alloc_init(&OBJC_CLASS___PKAsyncUnaryOperationComposer);
  id v25 = [v13 count];
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472LL;
  v36[2] = sub_1000A3664;
  v36[3] = &unk_10063F5D8;
  id v26 = v13;
  id v37 = v26;
  id v38 = v24;
  unsigned __int8 v39 = self;
  id v27 = v24;
  PKRangeEnumeratePartitions(v25, 250LL, v36);
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472LL;
  v32[2] = sub_1000A4168;
  v32[3] = &unk_10063F600;
  __int128 v34 = self;
  id v35 = v8;
  id v33 = v26;
  id v29 = v8;
  id v30 = v26;
  id v31 = [v27 evaluateWithInput:v28 completion:v32];
}

- (BOOL)_queue_isRelevantTransactionSourceIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer dataSource](self, "dataSource"));
  id v6 = [v5 transactionSourceTypeForTransactionSourceIdentifier:v4];

  uint64_t Object = PKLogFacilityTypeGetObject(9LL);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer containerManager](self, "containerManager"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 containerName]);
    int v23 = 138412546;
    id v24 = v4;
    __int16 v25 = 2112;
    id v26 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Checking if %@ is relevant transaction source identifiers for %@",  (uint8_t *)&v23,  0x16u);
  }

  switch((unint64_t)v6)
  {
    case 0uLL:
      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer dataSource](self, "dataSource"));
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 passUniqueIdentifierForTransactionSourceIdentifier:v4]);

      peerPaymentAccount = self->_peerPaymentAccount;
      if (!peerPaymentAccount) {
        goto LABEL_25;
      }
      id v14 = (id)objc_claimAutoreleasedReturnValue( -[PKPeerPaymentAccount associatedPassUniqueID]( peerPaymentAccount,  "associatedPassUniqueID"));
      id v15 = v12;
      id v16 = v15;
      if (v14 == v15)
      {

        goto LABEL_21;
      }

      if (v15 && v14)
      {
        unsigned int v17 = [v14 isEqualToString:v15];

        if (!v17) {
          goto LABEL_25;
        }
LABEL_21:
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          int v23 = 138412290;
          id v24 = v4;
          _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%@ is relevant because it is the peer payment pass",  (uint8_t *)&v23,  0xCu);
        }

        LOBYTE(self) = 1;
        goto LABEL_30;
      }

LABEL_25:
      id v20 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer dataSource](self, "dataSource"));
      id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 associatedAccountIdentifierForPassWithUniqueIdentifier:v12]);

      if (!v21)
      {
        LOBYTE(self) = 0;
        goto LABEL_32;
      }

      if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_29;
      }
      int v23 = 138412290;
      id v24 = v4;
      uint64_t v18 = "%@ is relevant because it has an associated account";
LABEL_28:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)&v23, 0xCu);
LABEL_29:
      LOBYTE(self) = 1;
      id v16 = v12;
LABEL_30:

LABEL_31:
      id v12 = v16;
LABEL_32:

LABEL_33:
      return (char)self;
    case 1uLL:
      self = (PDApplePayCloudStoreContainer *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer dataSource](self, "dataSource"));
      id v12 = (void *)objc_claimAutoreleasedReturnValue( -[PDApplePayCloudStoreContainer peerPaymentAccountForTransactionSourceIdentifier:]( self,  "peerPaymentAccountForTransactionSourceIdentifier:",  v4));

      LOBYTE(self) = v12 != 0LL;
      if (!v12) {
        goto LABEL_32;
      }
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_29;
      }
      int v23 = 138412290;
      id v24 = v4;
      uint64_t v18 = "%@ is relevant because it has an associated peer payment account";
      goto LABEL_28;
    case 2uLL:
      self = (PDApplePayCloudStoreContainer *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer dataSource](self, "dataSource"));
      id v12 = (void *)objc_claimAutoreleasedReturnValue( -[PDApplePayCloudStoreContainer accountUserWithTransactionSourceIdentifier:]( self,  "accountUserWithTransactionSourceIdentifier:",  v4));

      LOBYTE(self) = v12 != 0LL;
      if (!v12) {
        goto LABEL_32;
      }
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_29;
      }
      int v23 = 138412290;
      id v24 = v4;
      uint64_t v18 = "%@ is relevant because it is an account user";
      goto LABEL_28;
    case 3uLL:
      id v19 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer dataSource](self, "dataSource"));
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v19 accountWithTransactionSourceIdentifier:v4]);

      LODWORD(self) = [v16 supportsStandaloneTransactions];
      if (!(_DWORD)self) {
        goto LABEL_31;
      }
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v23 = 138412290;
        id v24 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%@ is relevant because it has a matching account",  (uint8_t *)&v23,  0xCu);
      }

      goto LABEL_30;
    default:
      LOBYTE(self) = 0;
      goto LABEL_33;
  }

- (id)_accountCreateDateForTranactionSourceIdentifier:(id)a3 passUniqueID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer dataSource](self, "dataSource"));
  id v9 = [v8 transactionSourceTypeForTransactionSourceIdentifier:v6];

  switch((unint64_t)v9)
  {
    case 0uLL:
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer dataSource](self, "dataSource"));
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 passUniqueIdentifierForTransactionSourceIdentifier:v6]);

      if (v11) {
        id v12 = v11;
      }
      else {
        id v12 = v7;
      }
      id v13 = v12;

      id v14 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer dataSource](self, "dataSource"));
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 associatedAccountIdentifierForPassWithUniqueIdentifier:v13]);

      id v16 = 0LL;
      if (v6 && !v15)
      {
        unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer dataSource](self, "dataSource"));
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( -[PKPeerPaymentAccount associatedPassUniqueID]( self->_peerPaymentAccount,  "associatedPassUniqueID"));
        id v19 = (void *)objc_claimAutoreleasedReturnValue([v17 transactionSourceIdentifiersForPassUniqueIdentifier:v18]);
        unsigned int v20 = [v19 containsObject:v6];

        if (v20) {
          id v16 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentAccount createdDate](self->_peerPaymentAccount, "createdDate"));
        }
        else {
          id v16 = 0LL;
        }
      }

      goto LABEL_13;
    case 1uLL:
      id v16 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentAccount createdDate](self->_peerPaymentAccount, "createdDate"));
      id v15 = 0LL;
      break;
    case 2uLL:
      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer dataSource](self, "dataSource"));
      id v21 = (void *)objc_claimAutoreleasedReturnValue([v11 accountUserWithTransactionSourceIdentifier:v6]);
      goto LABEL_12;
    case 3uLL:
      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer dataSource](self, "dataSource"));
      id v21 = (void *)objc_claimAutoreleasedReturnValue([v11 accountWithTransactionSourceIdentifier:v6]);
LABEL_12:
      unsigned __int8 v22 = v21;
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v21 accountIdentifier]);

      id v16 = 0LL;
      id v13 = v7;
LABEL_13:

      if (v15)
      {
        int v23 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer dataSource](self, "dataSource"));
        id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 accountWithIdentifier:v15]);
        uint64_t v25 = objc_claimAutoreleasedReturnValue([v24 createdDate]);

        id v7 = v13;
        id v16 = (void *)v25;
      }

      else
      {
        id v7 = v13;
      }

      break;
    default:
      id v15 = 0LL;
      id v16 = 0LL;
      break;
  }

  return v16;
}

- (id)_paymentApplicationForPassUniqueIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer dataSource](self, "dataSource"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 paymentApplicationsForPassUniqueIdentifier:v4]);

  if ([v6 count] == (id)1) {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 anyObject]);
  }
  else {
    id v7 = 0LL;
  }

  return v7;
}

- (id)_cloudStoreSpecificKeysForItem:(id)a3 paymentPass:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  if (!v5) {
    goto LABEL_23;
  }
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 serialNumber]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 passTypeIdentifier]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 primaryAccountIdentifier]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 devicePrimaryPaymentApplication]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 dpanIdentifier]);

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[PDApplePayCloudStoreContainer _originDeviceID](self, "_originDeviceID"));
  if ([v5 hasAssociatedPeerPaymentAccount])
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer dataSource](self, "dataSource"));
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v5 deviceTransactionSourceIdentifiers]);
    id v31 = v12;
    id v15 = v11;
    id v16 = v9;
    unsigned int v17 = v8;
    uint64_t v18 = v7;
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v14 anyObject]);
    unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue([v13 peerPaymentAccountForTransactionSourceIdentifier:v19]);

    id v7 = v18;
    id v8 = v17;
    id v9 = v16;
    id v11 = v15;
    id v12 = v31;

    id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 identifier]);
    uint64_t v22 = 1LL;
  }

  else
  {
    id v21 = (void *)objc_claimAutoreleasedReturnValue([v5 associatedAccountServiceAccountIdentifier]);
    id v23 = [v5 associatedAccountFeatureIdentifier];
    uint64_t v24 = 2LL;
    if (v23 == (id)1) {
      uint64_t v24 = 1LL;
    }
    if (v23 == (id)4) {
      uint64_t v22 = 4LL;
    }
    else {
      uint64_t v22 = v24;
    }
  }

  if ([v21 length])
  {
    uint64_t v25 = &PKCloudTransactionAccountIdentifierKey;
    id v26 = v21;
  }

  else
  {
    if ([v7 length]) {
      -[NSMutableDictionary setObject:forKey:](v6, "setObject:forKey:", v7, PKCloudTransactionPassSerialNumberKey);
    }
    if (![v8 length]) {
      goto LABEL_16;
    }
    uint64_t v25 = &PKCloudTransactionPassTypeIdentifierKey;
    id v26 = v8;
  }

  -[NSMutableDictionary setObject:forKey:](v6, "setObject:forKey:", v26, *v25);
LABEL_16:
  if ([v9 length]) {
    -[NSMutableDictionary setObject:forKey:](v6, "setObject:forKey:", v9, PKCloudTransactionFPANIdentifierKey);
  }
  if ([v11 length]) {
    -[NSMutableDictionary setObject:forKey:](v6, "setObject:forKey:", v11, PKCloudTransactionDPANIdentifierKey);
  }
  if (v12) {
    -[NSMutableDictionary setObject:forKey:](v6, "setObject:forKey:", v12, PKCloudTransactionOriginDeviceIDKey);
  }
  uint64_t v27 = PKPaymentTransactionAccountTypeToString(v22);
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
  -[NSMutableDictionary setObject:forKey:](v6, "setObject:forKey:", v28, PKCloudTransactionAccountTypeKey);

  -[NSMutableDictionary setObject:forKey:](v6, "setObject:forKey:", &off_10068FBE8, PKCloudTransactionCloudVersionKey);
LABEL_23:
  id v29 = -[NSMutableDictionary copy](v6, "copy");

  return v29;
}

- (id)_originDeviceID
{
  return +[PKSecureElement primarySecureElementIdentifier]( &OBJC_CLASS___PKSecureElement,  "primarySecureElementIdentifier");
}

- (BOOL)_isTransactionItemFromRecordType:(id)a3
{
  id v3 = a3;
  else {
    unsigned __int8 v4 = [v3 isEqualToString:PKCloudTransactionDeviceDataRecordType];
  }

  return v4;
}

- (void)containerResetCompletedWithSuccess:(BOOL)a3 error:(id)a4
{
  id v6 = a4;
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer workQueue](self, "workQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000A4CEC;
  block[3] = &unk_10063B300;
  BOOL v12 = a3;
  id v10 = v6;
  id v11 = self;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (void)_queue_didInvalidateContainer:(BOOL)a3
{
  if (a3)
  {
    unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer dataSource](self, "dataSource"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer dataSource](self, "dataSource"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 allRecordFetchTasks]);
    [v4 removeRecordFetchTasks:v6];

    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer dataSource](self, "dataSource"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 allRecordFetchTasks]);

    os_unfair_lock_lock(&self->_fetchTasksLock);
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    id v9 = v8;
    id v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v22;
      do
      {
        for (i = 0LL; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v22 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
          id v15 = objc_autoreleasePoolPush();
          id v16 = (void *)objc_claimAutoreleasedReturnValue([v14 identifier]);
          if ([v14 type]) {
            BOOL v17 = v16 == 0LL;
          }
          else {
            BOOL v17 = 1;
          }
          if (!v17)
          {
            uint64_t v18 = objc_alloc_init(&OBJC_CLASS___PDApplePayCloudStoreRecordFetchOperation);
            -[PDApplePayCloudStoreRecordFetchOperation updateTask:](v18, "updateTask:", v14);
            fetchTasks = self->_fetchTasks;
            unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue(-[PDApplePayCloudStoreRecordFetchOperation identifier](v18, "identifier"));
            -[NSMutableDictionary safelySetObject:forKey:](fetchTasks, "safelySetObject:forKey:", v18, v20);
          }

          objc_autoreleasePoolPop(v15);
        }

        id v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }

      while (v11);
    }

    os_unfair_lock_unlock(&self->_fetchTasksLock);
  }

- (BOOL)_isCloudStoreZoneThePrimaryZoneForCurrentUser:(id)a3 containerDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v33 = 0LL;
  unint64_t v8 = (unint64_t)[v7 scope];
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 zoneName]);
  id v31 = 0LL;
  id v32 = 0LL;
  +[PKCloudStoreZone zoneValueForZoneName:outZoneType:outAccountIdentifier:altDSID:]( &OBJC_CLASS___PKCloudStoreZone,  "zoneValueForZoneName:outZoneType:outAccountIdentifier:altDSID:",  v9,  &v33,  &v32,  &v31);
  id v10 = v32;
  id v11 = v31;
  uint64_t v12 = v11;
  switch(v33)
  {
    case 1LL:
    case 7LL:
    case 8LL:
      LOBYTE(v13) = [v7 scope] == (id)2;
      goto LABEL_34;
    case 2LL:
      if (v8 != 2) {
        goto LABEL_26;
      }
      __int128 v29 = 0u;
      __int128 v30 = 0u;
      __int128 v27 = 0u;
      __int128 v28 = 0u;
      id obj = self->_accounts;
      id v13 = -[NSSet countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v27,  v34,  16LL);
      if (!v13) {
        goto LABEL_31;
      }
      uint64_t v25 = v12;
      uint64_t v14 = *(void *)v28;
LABEL_8:
      id v15 = 0LL;
      break;
    case 3LL:
      if (v8 != 2) {
        goto LABEL_26;
      }
      id v21 = (id)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentAccount identifier](self->_peerPaymentAccount, "identifier"));
      id v22 = v10;
      __int128 v23 = v22;
      if (v21 == v22)
      {
        LOBYTE(v13) = 1;
      }

      else
      {
        LOBYTE(v13) = 0;
        if (v22 && v21) {
          LOBYTE(v13) = [v21 isEqualToString:v22];
        }
      }

      goto LABEL_34;
    case 4LL:
      LOBYTE(v13) = 1;
      goto LABEL_34;
    case 5LL:
    case 6LL:
      if ((v8 & 0xFFFFFFFFFFFFFFFELL) != 2) {
        goto LABEL_26;
      }
      LOBYTE(v13) = PKAltDSIDIsCurrentUser(v11);
      goto LABEL_34;
    default:
LABEL_26:
      LOBYTE(v13) = 0;
      goto LABEL_34;
  }

  do
  {
    if (*(void *)v28 != v14) {
      objc_enumerationMutation(obj);
    }
    id v16 = *(void **)(*((void *)&v27 + 1) + 8LL * (void)v15);
    if ((objc_msgSend(v16, "isSharedAccount", v25) & 1) == 0)
    {
      id v17 = (id)objc_claimAutoreleasedReturnValue([v16 accountIdentifier]);
      id v18 = v10;
      id v19 = v18;
      if (v17 == v18)
      {

LABEL_29:
        LOBYTE(v13) = 1;
        goto LABEL_30;
      }

      if (v10 && v17)
      {
        unsigned __int8 v20 = [v17 isEqualToString:v18];

        if ((v20 & 1) != 0) {
          goto LABEL_29;
        }
      }

      else
      {
      }
    }

    id v15 = (char *)v15 + 1;
  }

  while (v13 != v15);
  id v13 = -[NSSet countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v27,  v34,  16LL);
  if (v13) {
    goto LABEL_8;
  }
LABEL_30:
  uint64_t v12 = v25;
LABEL_31:

LABEL_34:
  return (char)v13;
}

- (id)_parseTransactionRecords:(id)a3 request:(id)a4 databaseIdentifier:(id)a5 updateReasons:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = objc_alloc_init(&OBJC_CLASS___PKCloudRecordArray);
  uint64_t v14 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  uint64_t Object = PKLogFacilityTypeGetObject(9LL);
  id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Parsing all fetched records.", buf, 2u);
  }

  uint64_t v17 = PKLogFacilityTypeGetObject(35LL);
  id v18 = (os_log_s *)(id)objc_claimAutoreleasedReturnValue(v17);
  os_signpost_id_t v19 = os_signpost_id_make_with_pointer(v18, self);
  if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v20 = v19;
    if (os_signpost_enabled(v18))
    {
      *(_WORD *)__int128 buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v18,  OS_SIGNPOST_INTERVAL_BEGIN,  v20,  "cloudstore:processTransactions",  "",  buf,  2u);
    }
  }

  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472LL;
  v36[2] = sub_1000A5904;
  v36[3] = &unk_10063F650;
  void v36[4] = self;
  id v21 = v12;
  id v37 = v21;
  id v22 = v11;
  id v38 = v22;
  unint64_t v41 = a6;
  __int128 v23 = v13;
  unsigned __int8 v39 = v23;
  __int128 v24 = v14;
  id v40 = v24;
  [v10 enumerateKeysAndObjectsForItemType:1 usingBlock:v36];
  uint64_t v25 = v18;
  os_signpost_id_t v26 = os_signpost_id_make_with_pointer(v25, self);
  if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v27 = v26;
    if (os_signpost_enabled(v25))
    {
      *(_WORD *)__int128 buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v25,  OS_SIGNPOST_INTERVAL_END,  v27,  "cloudstore:processTransactions",  "",  buf,  2u);
    }
  }

  if (-[NSMutableSet count](v24, "count"))
  {
    __int128 v28 = objc_autoreleasePoolPush();
    __int128 v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v24, "allObjects"));
    id v30 = objc_msgSend(v29, "pk_createArrayBySafelyApplyingBlock:", &stru_10063F690);

    -[PDCloudStoreContainer reportContainerChangeSignpostEventType:stateName:objectNames:changeToken:error:operationGroupName:operationGroupNameSuffix:]( self,  "reportContainerChangeSignpostEventType:stateName:objectNames:changeToken:error:operationGroupName:operationGroupNameSuffix:",  35LL,  0LL,  v30,  0LL,  0LL,  0LL,  0LL);
    transactionProcessor = self->_transactionProcessor;
    id v32 = -[NSMutableSet copy](v24, "copy");
    -[PDPaymentTransactionProcessor processPaymentTransactionConfigurations:]( transactionProcessor,  "processPaymentTransactionConfigurations:",  v32);

    objc_autoreleasePoolPop(v28);
  }

  uint64_t v33 = v40;
  __int128 v34 = v23;

  return v34;
}

- (BOOL)_canFormShareFromCloudStoreRecord:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 recordsWithRecordType:CKRecordTypeShare]);
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue([v3 firstObject]);

  return v4 != 0LL;
}

- (BOOL)_canFormShareLockFromCloudStoreRecord:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 recordsWithRecordType:PKCloudShareCreationLockRecordType]);
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue([v3 firstObject]);

  return v4 != 0LL;
}

- (BOOL)_canFormTransactionFromCloudStoreRecord:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue([v3 recordsWithRecordType:PKCloudTransactionRecordType]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 firstObject]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 encryptedValues]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:PKCloudTransactionCloudVersionKey]);

  if (v5)
  {
    if (!v7 || [v7 integerValue] == (id)1)
    {
      BOOL v8 = 1;
      goto LABEL_13;
    }

    uint64_t Object = PKLogFacilityTypeGetObject(9LL);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412290;
      id v17 = v7;
      id v11 = "Ignoring transaction record with unsupported transaction version %@";
      id v12 = v10;
      uint32_t v13 = 12;
      goto LABEL_9;
    }
  }

  else
  {
    uint64_t v9 = PKLogFacilityTypeGetObject(9LL);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      id v11 = "Missing transaction record.";
      id v12 = v10;
      uint32_t v13 = 2;
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v16, v13);
    }
  }

  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412290;
    id v17 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Cannot form local transaction for cloudStoreRecord %@",  (uint8_t *)&v16,  0xCu);
  }

  BOOL v8 = 0;
LABEL_13:

  return v8;
}

- (void)_processShareWithRecordParser:(id)a3 request:(id)a4 databaseIdentifier:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = a3;
  v60[0] = _NSConcreteStackBlock;
  v60[1] = 3221225472LL;
  v60[2] = sub_1000A77E4;
  v60[3] = &unk_10063EA70;
  v60[4] = self;
  uint64_t v14 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  uint64_t v61 = v14;
  [v13 enumerateKeysAndObjectsForItemType:6 usingBlock:v60];

  if (-[NSMutableSet count](v14, "count"))
  {
    id v37 = v12;
    id v38 = v10;
    else {
      id v35 = 0LL;
    }
    id v15 = objc_alloc_init(&OBJC_CLASS___PKAsyncUnaryOperationComposer);
    int v16 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    id v17 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    id v18 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    v55[0] = _NSConcreteStackBlock;
    v55[1] = 3221225472LL;
    v55[2] = sub_1000A78F0;
    v55[3] = &unk_10063BAD8;
    uint64_t v36 = v14;
    uint64_t v56 = v14;
    os_signpost_id_t v19 = v17;
    id v57 = v19;
    os_signpost_id_t v20 = v18;
    unsigned __int8 v58 = v20;
    id v21 = v16;
    uint64_t v59 = v21;
    [v15 addOperation:v55];
    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472LL;
    v48[2] = sub_1000A7BD0;
    v48[3] = &unk_10063F708;
    __int128 v49 = v19;
    __int128 v50 = v20;
    id v22 = self;
    uint64_t v51 = self;
    id v23 = v11;
    id v24 = v11;
    id v52 = v24;
    id v25 = v38;
    id v53 = v25;
    os_signpost_id_t v26 = v21;
    id v54 = v26;
    os_signpost_id_t v27 = v20;
    __int128 v28 = v19;
    [v15 addOperation:v48];
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472LL;
    void v42[2] = sub_1000A8740;
    v42[3] = &unk_10063E930;
    uint64_t v43 = v26;
    __int128 v29 = v35;
    id v44 = v29;
    id v30 = v24;
    id v11 = v23;
    id v45 = v30;
    id v46 = v25;
    uint64_t v47 = v22;
    id v31 = v26;
    [v15 addOperation:v42];
    id v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472LL;
    v39[2] = sub_1000A8B04;
    v39[3] = &unk_10063F000;
    id v12 = v37;
    id v40 = v29;
    id v41 = v37;
    uint64_t v33 = v29;
    id v34 = [v15 evaluateWithInput:v32 completion:v39];

    id v10 = v38;
    uint64_t v14 = v36;
  }

  else
  {
    (*((void (**)(id, void))v12 + 2))(v12, 0LL);
  }
}

- (void)_processZoneShareLockWithRecordParser:(id)a3 request:(id)a4 databaseIdentifier:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = (void (**)(id, id))a6;
  else {
    id v12 = 0LL;
  }
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000A8C10;
  v15[3] = &unk_10063EA70;
  id v13 = v12;
  int v16 = v13;
  id v17 = v10;
  id v14 = v10;
  [v9 enumerateKeysAndObjectsForItemType:8 usingBlock:v15];
  if (v11) {
    v11[2](v11, v13);
  }
}

- (void)_processRecurringPaymentsWithRecordParser:(id)a3 request:(id)a4 databaseIdentifier:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = (void (**)(id, id))a6;
  else {
    id v13 = 0LL;
  }
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  void v16[2] = sub_1000A8E94;
  v16[3] = &unk_10063F758;
  void v16[4] = self;
  id v14 = v13;
  id v17 = v14;
  id v18 = v11;
  id v15 = v11;
  [v10 enumerateKeysAndObjectsForItemType:9 usingBlock:v16];
  if (v12) {
    v12[2](v12, v14);
  }
}

- (void)_processCounterpartImageDataWithRecordParser:(id)a3 request:(id)a4 databaseIdentifier:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = (void (**)(id, id))a6;
  else {
    id v13 = 0LL;
  }
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  void v16[2] = sub_1000A9330;
  v16[3] = &unk_10063F758;
  void v16[4] = self;
  id v14 = v13;
  id v17 = v14;
  id v18 = v11;
  id v15 = v11;
  [v10 enumerateKeysAndObjectsForItemType:10 usingBlock:v16];
  if (v12) {
    v12[2](v12, v14);
  }
}

- (void)_fetchMissingTransactionRecordsWithRecordParser:(id)a3 request:(id)a4 databaseIdentifier:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer workQueue](self, "workQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000A97AC;
  block[3] = &unk_10063CD88;
  id v20 = v10;
  id v21 = self;
  id v22 = v12;
  id v23 = v11;
  id v24 = v13;
  id v15 = v13;
  id v16 = v11;
  id v17 = v12;
  id v18 = v10;
  dispatch_async(v14, block);
}

- (id)_transactionSourceIdentifierForTransactionRecordID:(id)a3 recordType:(id)a4 databaseIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!-[PDApplePayCloudStoreContainer _isTransactionItemFromRecordType:]( self,  "_isTransactionItemFromRecordType:",  v9))
  {
    id v23 = 0LL;
    goto LABEL_124;
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 zoneID]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 zoneName]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 recordName]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[PKPaymentTransaction recordNamePrefix](&OBJC_CLASS___PKPaymentTransaction, "recordNamePrefix"));
  if ([v13 hasPrefix:v14])
  {
    uint64_t v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "substringFromIndex:", objc_msgSend(v14, "length")));

    id v13 = (void *)v15;
  }

  uint64_t v16 = PKApplePayContainerCashZoneNamePrefix;
  v159 = v10;
  if ([v12 hasPrefix:PKApplePayContainerCashZoneNamePrefix])
  {
    uint64_t v157 = v11;
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v12 stringByReplacingOccurrencesOfString:v16 withString:&stru_100662310]);
    id v18 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentAccount identifier](self->_peerPaymentAccount, "identifier"));
    id v19 = v17;
    id v20 = v18;
    if (v19 == v20)
    {
    }

    else
    {
      id v21 = v20;
      if (!v19 || !v20)
      {

        goto LABEL_30;
      }

      unsigned int v22 = [v19 isEqualToString:v20];

      if (!v22)
      {
LABEL_30:
        id v44 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer dataSource](self, "dataSource"));
        id v43 = (id)objc_claimAutoreleasedReturnValue([v44 transactionSourceIdentifierForPeerPaymentAccountIdentifier:v19]);

        if (v43) {
          goto LABEL_95;
        }
        id v154 = v8;
        __int128 v146 = v12;
        id v45 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer containerManager](self, "containerManager"));
        id v46 = (void *)objc_claimAutoreleasedReturnValue([v45 databaseIdentifierForScope:2]);
        id v47 = v159;
        id v48 = v46;
        if (v48 == v47)
        {
        }

        else
        {
          __int128 v49 = v48;
          if (!v47 || !v48)
          {

            goto LABEL_59;
          }

          unsigned __int8 v50 = [v47 isEqualToString:v48];

          if ((v50 & 1) == 0)
          {
LABEL_59:
            __int16 v162 = self;
            id v78 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer containerManager](self, "containerManager"));
            uint64_t v79 = (void *)objc_claimAutoreleasedReturnValue([v78 databaseIdentifierForScope:3]);
            id v80 = v47;
            id v81 = v79;
            if (v81 == v80)
            {
            }

            else
            {
              id v82 = v81;
              if (!v47 || !v81)
              {

LABEL_91:
                id v43 = 0LL;
                id v12 = v146;
                id v8 = v154;
                self = v162;
                goto LABEL_95;
              }

              unsigned __int8 v83 = [v80 isEqualToString:v81];

              if ((v83 & 1) == 0) {
                goto LABEL_91;
              }
            }

            self = v162;
            uint64_t v84 = (void *)objc_claimAutoreleasedReturnValue( -[PKPeerPaymentAccount associatedAccountInformation]( v162->_peerPaymentAccount,  "associatedAccountInformation"));
            __int128 v85 = (void *)objc_claimAutoreleasedReturnValue([v84 associatedAccounts]);
            id v86 = [v85 count];

            if (v86 == (id)1)
            {
              id v87 = (void *)objc_claimAutoreleasedReturnValue( -[PKPeerPaymentAccount associatedAccountInformation]( v162->_peerPaymentAccount,  "associatedAccountInformation"));
              id v88 = (void *)objc_claimAutoreleasedReturnValue([v87 associatedAccounts]);
              uint64_t v89 = (void *)objc_claimAutoreleasedReturnValue([v88 anyObject]);
              id v43 = (id)objc_claimAutoreleasedReturnValue([v89 transactionSourceIdentifier]);

              id v12 = v146;
              id v8 = v154;
            }

            else
            {
              uint64_t Object = PKLogFacilityTypeGetObject(9LL);
              id v109 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
              id v8 = v154;
              if (os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)__int128 buf = 138412546;
                id v177 = v154;
                __int16 v178 = 2112;
                id v179 = v80;
                _os_log_impl( (void *)&_mh_execute_header,  v109,  OS_LOG_TYPE_DEFAULT,  "Cannot get transaction source identifier for recordID %@ in database %@",  buf,  0x16u);
              }

              id v43 = 0LL;
              id v12 = v146;
              self = v162;
            }

- (id)_transactionSourceIdentifierForTransactionCloudStoreRecord:(id)a3 databaseIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 recordsWithRecordType:PKCloudTransactionRecordType]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 firstObject]);

  id v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "pk_encryptedStringForKey:", PKCloudTransactionFPANIdentifierKey));
  uint64_t v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "pk_encryptedStringForKey:", PKCloudTransactionPassSerialNumberKey));
  uint64_t v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "pk_encryptedStringForKey:", PKCloudTransactionPassTypeIdentifierKey));
  id v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "pk_encryptedStringForKey:", PKCloudTransactionAccountIdentifierKey));
  uint64_t v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "pk_encryptedStringForKey:", PKCloudTransactionAltDSIDKey));
  if (!v13) {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "pk_encryptedStringForKey:", PKCloudTransactionPeerPaymentAccountIdentifierKey));
  }
  id v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "pk_stringForKey:", PKCloudTransactionAccountTypeKey));
  uint64_t v59 = PKPaymentTransactionAccountTypeFromString();

  if (v11) {
    BOOL v15 = v12 == 0;
  }
  else {
    BOOL v15 = 1;
  }
  __int16 v60 = (void *)v12;
  uint64_t v61 = (void *)v11;
  if (v15)
  {
    if (!v10)
    {
      unsigned int v22 = 0LL;
      goto LABEL_11;
    }

    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer dataSource](self, "dataSource"));
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v16 passUniqueIdentifierWithPrimaryAccountIdentifier:v10]);
  }

  else
  {
    uint64_t v17 = PKGeneratePassUniqueID(v12, v11);
    id v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  }

  id v19 = self;
  id v20 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer dataSource](self, "dataSource"));
  id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 transactionSourceIdentifiersForPassUniqueIdentifier:v18]);
  unsigned int v22 = (void *)objc_claimAutoreleasedReturnValue([v21 anyObject]);

  self = v19;
  if (v22) {
    goto LABEL_51;
  }
LABEL_11:
  if (!v13) {
    goto LABEL_51;
  }
  if ((unint64_t)(v59 - 2) >= 3)
  {
    if (v59 == 1)
    {
      id v57 = v7;
      id v33 = (id)objc_claimAutoreleasedReturnValue( -[PKPeerPaymentAccount peerPaymentAccountWithIdentifier:]( self->_peerPaymentAccount,  "peerPaymentAccountWithIdentifier:",  v13));
      unsigned __int8 v39 = self;
      unsigned int v35 = (void *)objc_claimAutoreleasedReturnValue([v33 associatedPassUniqueID]);
      id v40 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer dataSource](v39, "dataSource"));
      id v41 = (void *)objc_claimAutoreleasedReturnValue([v40 transactionSourceIdentifiersForPassUniqueIdentifier:v35]);
      unsigned int v22 = (void *)objc_claimAutoreleasedReturnValue([v41 anyObject]);

      unsigned __int8 v58 = v39;
      if (v22
        || (id v42 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer dataSource](v39, "dataSource")),
            unsigned int v22 = (void *)objc_claimAutoreleasedReturnValue([v42 transactionSourceIdentifierForPeerPaymentAccountIdentifier:v13]),
            v42,
            v22))
      {
        id v7 = v57;
      }

      else
      {
        uint64_t Object = PKLogFacilityTypeGetObject(9LL);
        id v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
        id v7 = v57;
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__int128 buf = 138412290;
          id v68 = v13;
          _os_log_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_DEFAULT,  "No transaction source identifiers peer payment account id %@",  buf,  0xCu);
        }

        unsigned int v22 = 0LL;
      }

      goto LABEL_49;
    }

    if (v59) {
      goto LABEL_53;
    }
  }

  id v55 = v10;
  __int128 v65 = 0u;
  __int128 v66 = 0u;
  __int128 v63 = 0u;
  __int128 v64 = 0u;
  unsigned __int8 v58 = self;
  id v23 = self->_accounts;
  id v24 = -[NSSet countByEnumeratingWithState:objects:count:]( v23,  "countByEnumeratingWithState:objects:count:",  &v63,  v71,  16LL);
  if (v24)
  {
    id v25 = v24;
    uint64_t v26 = *(void *)v64;
    id v54 = v6;
    id v56 = v7;
    while (2)
    {
      for (i = 0LL; i != v25; i = (char *)i + 1)
      {
        if (*(void *)v64 != v26) {
          objc_enumerationMutation(v23);
        }
        uint64_t v28 = *(void **)(*((void *)&v63 + 1) + 8LL * (void)i);
        id v29 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "accountIdentifier", v54));
        id v30 = v13;
        id v31 = v30;
        if (v29 == v30)
        {

LABEL_30:
          id v33 = v28;
          id v6 = v54;
          id v7 = v56;
          goto LABEL_32;
        }

        if (v29)
        {
          unsigned int v32 = [v29 isEqualToString:v30];

          if (v32) {
            goto LABEL_30;
          }
        }

        else
        {
        }
      }

      id v25 = -[NSSet countByEnumeratingWithState:objects:count:]( v23,  "countByEnumeratingWithState:objects:count:",  &v63,  v71,  16LL);
      id v33 = 0LL;
      id v6 = v54;
      id v7 = v56;
      if (v25) {
        continue;
      }
      break;
    }
  }

  else
  {
    id v33 = 0LL;
  }

- (id)_originDeviceIDForCloudStoreRecord:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 recordsWithRecordType:PKCloudTransactionDeviceDataRecordType]);
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue([v3 firstObject]);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pk_encryptedStringForKey:", PKCloudTransactionOriginDeviceIDKey));
  return v5;
}

- (BOOL)_isAccountEventFromRecordType:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = (void *)PKCloudAccountEventRecordType;
  id v5 = v3;
  id v6 = v4;
  id v7 = v6;
  if (v6 == v5)
  {
    unsigned __int8 v8 = 1;
  }

  else
  {
    unsigned __int8 v8 = 0;
    if (v5 && v6) {
      unsigned __int8 v8 = [v5 isEqualToString:v6];
    }
  }

  return v8;
}

- (BOOL)_isAccountEventAssociatedObjectFromRecordType:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = (void *)PKCloudAccountRewardsRecordType;
  id v5 = v3;
  id v6 = v4;
  if (v6 == v5)
  {
    unsigned __int8 v9 = 1;
    id v10 = v5;
LABEL_85:

    goto LABEL_86;
  }

  id v7 = v6;
  if (v5 && v6)
  {
    unsigned __int8 v8 = [v5 isEqualToString:v6];

    if ((v8 & 1) != 0) {
      goto LABEL_78;
    }
  }

  else
  {
  }

  uint64_t v11 = (void *)PKCloudCreditAccountStatementRecordType;
  id v10 = v5;
  id v12 = v11;
  if (v12 == v10) {
    goto LABEL_84;
  }
  id v13 = v12;
  if (v5 && v12)
  {
    unsigned __int8 v14 = [v10 isEqualToString:v12];

    if ((v14 & 1) != 0) {
      goto LABEL_78;
    }
  }

  else
  {
  }

  BOOL v15 = (void *)PKCloudAccountServicingRecordType;
  id v10 = v10;
  id v16 = v15;
  if (v16 == v10) {
    goto LABEL_84;
  }
  uint64_t v17 = v16;
  if (v5 && v16)
  {
    unsigned __int8 v18 = [v10 isEqualToString:v16];

    if ((v18 & 1) != 0) {
      goto LABEL_78;
    }
  }

  else
  {
  }

  id v19 = (void *)PKCloudAccountPaymentRecordType;
  id v10 = v10;
  id v20 = v19;
  if (v20 == v10) {
    goto LABEL_84;
  }
  id v21 = v20;
  if (v5 && v20)
  {
    unsigned __int8 v22 = [v10 isEqualToString:v20];

    if ((v22 & 1) != 0) {
      goto LABEL_78;
    }
  }

  else
  {
  }

  id v23 = (void *)PKCloudAccountTransferRecordType;
  id v10 = v10;
  id v24 = v23;
  if (v24 == v10) {
    goto LABEL_84;
  }
  id v25 = v24;
  if (v5 && v24)
  {
    unsigned __int8 v26 = [v10 isEqualToString:v24];

    if ((v26 & 1) != 0) {
      goto LABEL_78;
    }
  }

  else
  {
  }

  id v27 = (void *)PKCloudAccountHoldRecordType;
  id v10 = v10;
  id v28 = v27;
  if (v28 == v10) {
    goto LABEL_84;
  }
  id v29 = v28;
  if (v5 && v28)
  {
    unsigned __int8 v30 = [v10 isEqualToString:v28];

    if ((v30 & 1) != 0) {
      goto LABEL_78;
    }
  }

  else
  {
  }

  id v31 = (void *)PKCloudAccountCreditTermsUpdateRecordType;
  id v10 = v10;
  id v32 = v31;
  if (v32 == v10) {
    goto LABEL_84;
  }
  id v33 = v32;
  if (v5 && v32)
  {
    unsigned __int8 v34 = [v10 isEqualToString:v32];

    if ((v34 & 1) != 0) {
      goto LABEL_78;
    }
  }

  else
  {
  }

  unsigned int v35 = (void *)PKCloudAccountPaymentReminderRecordType;
  id v10 = v10;
  id v36 = v35;
  if (v36 == v10) {
    goto LABEL_84;
  }
  uint64_t v37 = v36;
  if (v5 && v36)
  {
    unsigned __int8 v38 = [v10 isEqualToString:v36];

    if ((v38 & 1) != 0) {
      goto LABEL_78;
    }
  }

  else
  {
  }

  unsigned __int8 v39 = (void *)PKCloudAccountPhysicalCardStatusUpdateRecordType;
  id v10 = v10;
  id v40 = v39;
  if (v40 == v10) {
    goto LABEL_84;
  }
  id v41 = v40;
  if (v5 && v40)
  {
    unsigned __int8 v42 = [v10 isEqualToString:v40];

    if ((v42 & 1) != 0) {
      goto LABEL_78;
    }
  }

  else
  {
  }

  id v43 = (void *)PKCloudAccountPhysicalCardShippingUpdateRecordType;
  id v10 = v10;
  id v44 = v43;
  if (v44 == v10) {
    goto LABEL_84;
  }
  id v45 = v44;
  if (v5 && v44)
  {
    unsigned __int8 v46 = [v10 isEqualToString:v44];

    if ((v46 & 1) != 0) {
      goto LABEL_78;
    }
  }

  else
  {
  }

  id v47 = (void *)PKCloudAccountVirtualCardStatusUpdateRecordType;
  id v10 = v10;
  id v48 = v47;
  if (v48 == v10) {
    goto LABEL_84;
  }
  uint64_t v49 = v48;
  if (v5 && v48)
  {
    unsigned __int8 v50 = [v10 isEqualToString:v48];

    if ((v50 & 1) != 0) {
      goto LABEL_78;
    }
  }

  else
  {
  }

  uint64_t v51 = (void *)PKCloudAccountBillPaymentSelectedSuggestedAmountRecordType;
  id v10 = v10;
  id v52 = v51;
  if (v52 == v10) {
    goto LABEL_84;
  }
  id v53 = v52;
  if (v5 && v52)
  {
    unsigned __int8 v54 = [v10 isEqualToString:v52];

    if ((v54 & 1) != 0) {
      goto LABEL_78;
    }
  }

  else
  {
  }

  id v55 = (void *)PKCloudAccountUserInfoRecordType;
  id v10 = v10;
  id v56 = v55;
  if (v56 == v10)
  {
LABEL_84:
    unsigned __int8 v9 = 1;
    goto LABEL_85;
  }

  id v57 = v56;
  if (!v5 || !v56)
  {

LABEL_80:
    uint64_t v59 = (void *)PKCloudAccountAssistanceProgramRecordType;
    id v60 = v10;
    id v61 = v59;
    id v10 = v61;
    if (v61 != v60)
    {
      unsigned __int8 v9 = 0;
      if (v5 && v61) {
        unsigned __int8 v9 = [v60 isEqualToString:v61];
      }
      goto LABEL_85;
    }

    goto LABEL_84;
  }

  unsigned __int8 v58 = [v10 isEqualToString:v56];

  if ((v58 & 1) == 0) {
    goto LABEL_80;
  }
LABEL_78:
  unsigned __int8 v9 = 1;
LABEL_86:

  return v9;
}

- (id)_recordTypeForAccountEventRecord:(id)a3
{
  id v3 = (char *)+[PKAccountEvent accountEventTypeFromRecord:]( &OBJC_CLASS___PKAccountEvent,  "accountEventTypeFromRecord:",  a3);
  else {
    return *(id *)*(&off_10063FA10 + (void)(v3 - 1));
  }
}

- (void)fetchAndStoreAccountEventsWithIdentifiers:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer workQueue](self, "workQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000AC28C;
  block[3] = &unk_100639AF0;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)_fetchMissingAccountEventsWithRecordParser:(id)a3 request:(id)a4 databaseIdentifier:(id)a5 carriedOverRecordsByDatabaseIdentifier:(id)a6 updateReasons:(unint64_t)a7 completion:(id)a8
{
  id v98 = a3;
  id v12 = a4;
  id v105 = a5;
  id v100 = a6;
  id v87 = a8;
  id v97 = objc_alloc_init(&OBJC_CLASS___PKAsyncUnaryOperationComposer);
  uint64_t v103 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  context = objc_autoreleasePoolPush();
  id v13 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  uint64_t v15 = objc_opt_class(&OBJC_CLASS___PDApplePayCloudStoreRecordsRequest, v14);
  if ((objc_opt_isKindOfClass(v12, v15) & 1) != 0) {
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v12 transactionSourceIdentifiers]);
  }
  else {
    id v16 = 0LL;
  }
  __int128 v142 = 0u;
  __int128 v143 = 0u;
  __int128 v140 = 0u;
  __int128 v141 = 0u;
  id v17 = v16;
  id v18 = [v17 countByEnumeratingWithState:&v140 objects:v146 count:16];
  id v90 = v17;
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v141;
    do
    {
      for (i = 0LL; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v141 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = *(void *)(*((void *)&v140 + 1) + 8LL * (void)i);
        id v23 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer dataSource](self, "dataSource"));
        id v24 = [v23 transactionSourceTypeForTransactionSourceIdentifier:v22];

        if (v24 == (id)3)
        {
          unsigned __int8 v26 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer dataSource](self, "dataSource"));
          id v29 = (void *)objc_claimAutoreleasedReturnValue([v26 accountWithTransactionSourceIdentifier:v22]);
LABEL_15:
          id v27 = v29;
          uint64_t v28 = objc_claimAutoreleasedReturnValue([v29 accountIdentifier]);
LABEL_16:
          unsigned __int8 v30 = (void *)v28;

          goto LABEL_18;
        }

        if (v24 == (id)2)
        {
          unsigned __int8 v26 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer dataSource](self, "dataSource"));
          id v29 = (void *)objc_claimAutoreleasedReturnValue([v26 accountUserWithTransactionSourceIdentifier:v22]);
          goto LABEL_15;
        }

        if (!v24)
        {
          id v25 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer dataSource](self, "dataSource"));
          unsigned __int8 v26 = (void *)objc_claimAutoreleasedReturnValue([v25 passUniqueIdentifierForTransactionSourceIdentifier:v22]);

          id v17 = v90;
          id v27 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer dataSource](self, "dataSource"));
          uint64_t v28 = objc_claimAutoreleasedReturnValue([v27 associatedAccountIdentifierForPassWithUniqueIdentifier:v26]);
          goto LABEL_16;
        }

        unsigned __int8 v30 = 0LL;
LABEL_18:
        -[NSMutableArray safelyAddObject:](v13, "safelyAddObject:", v30);
      }

      id v19 = [v17 countByEnumeratingWithState:&v140 objects:v146 count:16];
    }

    while (v19);
  }

  id v31 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  id v32 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v33 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  v131[0] = _NSConcreteStackBlock;
  v131[1] = 3221225472LL;
  v131[2] = sub_1000AD1E0;
  v131[3] = &unk_10063F898;
  unsigned __int8 v34 = self;
  v131[4] = self;
  __int128 v85 = v13;
  id v132 = v85;
  id v35 = v100;
  id v133 = v35;
  id v99 = v105;
  id v134 = v99;
  id v36 = v33;
  __int128 v135 = v36;
  id v37 = v12;
  id v136 = v37;
  uint64_t v89 = v32;
  uint64_t v137 = v89;
  unsigned __int8 v38 = v103;
  id v138 = v38;
  id v88 = v31;
  __int128 v139 = v88;
  unsigned __int8 v39 = v98;
  [v98 enumerateKeysAndObjectsForItemType:5 usingBlock:v131];
  uint64_t v84 = v36;
  [v98 addRecords:v36];
  id v94 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v127 = 0u;
  __int128 v128 = 0u;
  __int128 v129 = 0u;
  __int128 v130 = 0u;
  id v40 = v38;
  id v41 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v40,  "countByEnumeratingWithState:objects:count:",  &v127,  v145,  16LL);
  unsigned __int8 v42 = v97;
  if (v41)
  {
    id v43 = v41;
    uint64_t v44 = *(void *)v128;
    do
    {
      for (j = 0LL; j != v43; j = (char *)j + 1)
      {
        if (*(void *)v128 != v44) {
          objc_enumerationMutation(v40);
        }
        unsigned __int8 v46 = (void *)objc_claimAutoreleasedReturnValue( -[PDApplePayCloudStoreContainer identifierFromRecord:]( self,  "identifierFromRecord:",  *(void *)(*((void *)&v127 + 1) + 8LL * (void)j)));
        -[NSMutableSet addObject:](v94, "addObject:", v46);
      }

      id v43 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v40,  "countByEnumeratingWithState:objects:count:",  &v127,  v145,  16LL);
    }

    while (v43);
  }

  [v98 removeIdentifiers:v94 itemType:5];
  uint64_t Object = PKLogFacilityTypeGetObject(35LL);
  id v48 = (os_log_s *)(id)objc_claimAutoreleasedReturnValue(Object);
  os_signpost_id_t v49 = os_signpost_id_make_with_pointer(v48, self);
  if (v49 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v50 = v49;
    if (os_signpost_enabled(v48))
    {
      *(_WORD *)__int128 buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v48,  OS_SIGNPOST_INTERVAL_BEGIN,  v50,  "cloudstore:fetchMissingAccountEventRecords",  "",  buf,  2u);
    }
  }

  uint64_t v51 = v88;
  id v52 = v99;
  if (-[NSMutableSet count](v88, "count"))
  {
    v121[0] = _NSConcreteStackBlock;
    v121[1] = 3221225472LL;
    v121[2] = sub_1000ADC54;
    v121[3] = &unk_10063E930;
    v121[4] = self;
    id v122 = v99;
    __int128 v123 = v88;
    id v124 = v37;
    id v125 = v98;
    [v97 addOperation:v121];
  }

  id v53 = v89;
  if (-[NSMutableDictionary count](v89, "count"))
  {
    id v82 = v40;
    id v83 = v35;
    uint64_t v96 = v37;
    __int128 v119 = 0u;
    __int128 v120 = 0u;
    __int128 v117 = 0u;
    __int128 v118 = 0u;
    id obj = v89;
    id v92 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v117,  v144,  16LL);
    if (v92)
    {
      unsigned __int8 v54 = &_s10Foundation22_convertErrorToNSErrorySo0E0Cs0C0_pF_ptr;
      uint64_t v91 = *(void *)v118;
      id v55 = &_s10Foundation22_convertErrorToNSErrorySo0E0Cs0C0_pF_ptr;
      id v56 = &_s10Foundation22_convertErrorToNSErrorySo0E0Cs0C0_pF_ptr;
      do
      {
        uint64_t v57 = 0LL;
        do
        {
          if (*(void *)v118 != v91) {
            objc_enumerationMutation(obj);
          }
          uint64_t v95 = v57;
          uint64_t v58 = *(void *)(*((void *)&v117 + 1) + 8 * v57);
          uint64_t v59 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](obj, "objectForKey:", v58));
          id v60 = (char *)[v59 count];
          if (v60)
          {
            unint64_t v61 = 0LL;
            id v101 = v60;
            do
            {
              else {
                uint64_t v62 = (uint64_t)&v60[-v61];
              }
              uint64_t v106 = v62;
              __int128 v63 = (void *)objc_claimAutoreleasedReturnValue([v59 subarrayWithRange:v61]);
              id v104 = (void *)objc_claimAutoreleasedReturnValue([v54[403] predicateWithFormat:@"accountEventReference IN %@", v63]);
              id v64 = [objc_alloc((Class)v55[332]) initWithRecordType:v58 predicate:v104];
              __int128 v65 = v59;
              uint64_t v66 = v58;
              id v67 = v56;
              id v68 = objc_alloc((Class)v56[336]);
              __int16 v69 = (void *)objc_claimAutoreleasedReturnValue([v63 firstObject]);
              uint64_t v70 = (void *)objc_claimAutoreleasedReturnValue([v69 recordID]);
              id v71 = (void *)objc_claimAutoreleasedReturnValue([v70 zoneID]);
              id v72 = [v68 initWithZoneID:v71];

              unsigned __int8 v39 = v98;
              v111[0] = _NSConcreteStackBlock;
              v111[1] = 3221225472LL;
              v111[2] = sub_1000ADE5C;
              v111[3] = &unk_10063F708;
              v111[4] = self;
              id v112 = v64;
              id v113 = v96;
              id v114 = v72;
              id v115 = v99;
              id v116 = v98;
              id v73 = v72;
              id v56 = v67;
              uint64_t v58 = v66;
              uint64_t v59 = v65;
              id v74 = v73;
              id v75 = v64;
              unsigned __int8 v42 = v97;
              id v76 = v75;
              [v97 addOperation:v111];

              id v55 = &_s10Foundation22_convertErrorToNSErrorySo0E0Cs0C0_pF_ptr;
              unsigned __int8 v54 = &_s10Foundation22_convertErrorToNSErrorySo0E0Cs0C0_pF_ptr;

              id v60 = v101;
              v61 += v106;
            }

            while (v61 < (unint64_t)v101);
          }

          uint64_t v57 = v95 + 1;
        }

        while ((id)(v95 + 1) != v92);
        id v92 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v117,  v144,  16LL);
      }

      while (v92);
    }

    unsigned __int8 v34 = self;
    id v40 = v82;
    id v35 = v83;
    id v37 = v96;
    id v52 = v99;
    uint64_t v51 = v88;
    id v53 = v89;
  }

  objc_autoreleasePoolPop(context);
  uint64_t v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  v107[0] = _NSConcreteStackBlock;
  v107[1] = 3221225472LL;
  v107[2] = sub_1000AE08C;
  v107[3] = &unk_10063CC70;
  v107[4] = v34;
  id v108 = v40;
  id v109 = v52;
  id v110 = v87;
  id v78 = v52;
  uint64_t v79 = v40;
  id v80 = v87;
  id v81 = [v42 evaluateWithInput:v77 completion:v107];
}

- (id)_recordsByFromAccountEvent:(id)a3 zone:(id)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a4 zoneID]);
  id v7 = objc_alloc(&OBJC_CLASS___CKRecordID);
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue([v5 recordName]);
  id v9 = -[CKRecordID initWithRecordName:zoneID:](v7, "initWithRecordName:zoneID:", v8, v6);

  id v10 = objc_alloc(&OBJC_CLASS___CKRecord);
  uint64_t v11 = -[CKRecord initWithRecordType:recordID:](v10, "initWithRecordType:recordID:", PKCloudAccountEventRecordType, v9);
  id v12 = objc_alloc(&OBJC_CLASS___PKCloudStoreRecord);
  id v18 = v11;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v18, 1LL));
  id v14 = [v12 initWithRecords:v13];

  [v5 encodeWithCloudStoreCoder:v14 codingType:2];
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 records]);
  id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v15));

  return v16;
}

- (void)_parseAccountEventsFromRecordParser:(id)a3 databaseIdentifier:(id)a4 shouldUpdateLocalDatabase:(BOOL)a5 shouldReturn:(BOOL)a6 updateReasons:(unint64_t)a7 completion:(id)a8
{
  BOOL v10 = a6;
  BOOL v11 = a5;
  id v35 = a3;
  id v14 = a4;
  id v15 = a8;
  if (!v11)
  {
    id v16 = 0LL;
    if (!v10) {
      goto LABEL_3;
    }
LABEL_5:
    id v17 = objc_alloc_init(&OBJC_CLASS___PKCloudRecordArray);
    goto LABEL_6;
  }

  id v16 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  if (v10) {
    goto LABEL_5;
  }
LABEL_3:
  id v17 = 0LL;
LABEL_6:
  uint64_t v18 = PKCurrentUserAltDSID();
  id v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  uint64_t Object = PKLogFacilityTypeGetObject(35LL);
  id v21 = (os_log_s *)(id)objc_claimAutoreleasedReturnValue(Object);
  os_signpost_id_t v22 = os_signpost_id_make_with_pointer(v21, self);
  if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v23 = v22;
    if (os_signpost_enabled(v21))
    {
      *(_WORD *)__int128 buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v21,  OS_SIGNPOST_INTERVAL_BEGIN,  v23,  "cloudstore:processAccountEvents",  "",  buf,  2u);
    }
  }

  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472LL;
  v39[2] = sub_1000AE660;
  v39[3] = &unk_10063F910;
  id v24 = v19;
  id v40 = v24;
  id v25 = v16;
  id v41 = v25;
  unint64_t v44 = a7;
  unsigned __int8 v26 = v17;
  unsigned __int8 v42 = v26;
  id v27 = v14;
  id v43 = v27;
  [v35 enumerateKeysAndObjectsForItemType:5 usingBlock:v39];
  uint64_t v28 = v21;
  os_signpost_id_t v29 = os_signpost_id_make_with_pointer(v28, self);
  if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v30 = v29;
    if (os_signpost_enabled(v28))
    {
      *(_WORD *)__int128 buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v28,  OS_SIGNPOST_INTERVAL_END,  v30,  "cloudstore:processAccountEvents",  "",  buf,  2u);
    }
  }

  if (v11)
  {
    if (-[NSMutableSet count](v25, "count"))
    {
      id v31 = objc_autoreleasePoolPush();
      id v32 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v25, "allObjects"));
      id v33 = objc_msgSend(v32, "pk_createArrayBySafelyApplyingBlock:", &stru_10063F950);

      -[PDCloudStoreContainer reportContainerChangeSignpostEventType:stateName:objectNames:changeToken:error:operationGroupName:operationGroupNameSuffix:]( self,  "reportContainerChangeSignpostEventType:stateName:objectNames:changeToken:error:operationGroupName:operationGroupNameSuffix:",  36LL,  0LL,  v33,  0LL,  0LL,  0LL,  0LL);
      objc_autoreleasePoolPop(v31);
    }

    accountManager = self->_accountManager;
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472LL;
    v36[2] = sub_1000AE910;
    v36[3] = &unk_1006396B0;
    id v38 = v15;
    id v37 = v26;
    -[PDAccountManager insertEvents:completion:](accountManager, "insertEvents:completion:", v25, v36);
  }

  else if (v15)
  {
    (*((void (**)(id, PKCloudRecordArray *))v15 + 2))(v15, v26);
  }
}

- (BOOL)_isAccountFromRecordType:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = (void *)PKCloudAccountRecordType;
  id v5 = v3;
  id v6 = v4;
  id v7 = v6;
  if (v6 == v5)
  {
    unsigned __int8 v8 = 1;
  }

  else
  {
    unsigned __int8 v8 = 0;
    if (v5 && v6) {
      unsigned __int8 v8 = [v5 isEqualToString:v6];
    }
  }

  return v8;
}

- (void)_parseAccountsFromRecordParser:(id)a3 databaseIdentifier:(id)a4 shouldUpdateLocalDatabase:(BOOL)a5 shouldReturn:(BOOL)a6 completion:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  if (!v9)
  {
    id v15 = 0LL;
    if (!v8) {
      goto LABEL_3;
    }
LABEL_5:
    id v16 = objc_alloc_init(&OBJC_CLASS___PKCloudRecordArray);
    goto LABEL_6;
  }

  id v15 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  if (v8) {
    goto LABEL_5;
  }
LABEL_3:
  id v16 = 0LL;
LABEL_6:
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472LL;
  v33[2] = sub_1000AEBAC;
  v33[3] = &unk_10063F9C8;
  dispatch_group_t v34 = dispatch_group_create();
  id v35 = self;
  id v17 = v15;
  id v36 = v17;
  uint64_t v18 = v16;
  id v37 = v18;
  id v38 = v13;
  id v19 = v13;
  uint64_t v20 = v34;
  [v12 enumerateKeysAndObjectsForItemType:7 usingBlock:v33];
  objc_initWeak(&location, self);
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(2LL, 0LL);
  os_signpost_id_t v22 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_1000AEF40;
  v26[3] = &unk_10063F9F0;
  BOOL v31 = v9;
  objc_copyWeak(&v30, &location);
  uint64_t v28 = v18;
  id v29 = v14;
  id v27 = v17;
  os_signpost_id_t v23 = v18;
  id v24 = v14;
  id v25 = v17;
  dispatch_group_notify(v20, v22, v26);

  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);
}

- (void)_insertAccountBalanceUpdateNotificationIfNecessaryForAccount:(id)a3 record:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainer dataSource](self, "dataSource"));
  uint64_t v9 = objc_claimAutoreleasedReturnValue([v6 associatedPassUniqueID]);
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue([v8 passWithUniqueIdentifier:v9]);
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue([v10 paymentPass]);

  LOBYTE(v9) = [v11 settings];
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 cloudStoreZoneNames]);
  unsigned __int8 v13 = [v12 containsObject:PKCloudStoreAppleBalanceTransactionsZoneName];

  if ((v9 & 8) != 0 && (v13 & 1) == 0)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v7 recordsWithRecordType:PKCloudAccountRecordType]);
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 firstObject]);

    id v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "pk_encryptedStringForKey:", PKCloudAccountBalanceUpdateReasonKey));
    id v17 = (void *)PKCloudAccountBalanceUpdateInStoreTopUpReason;
    id v18 = v16;
    id v19 = v17;
    if (v18 == v19) {
      goto LABEL_16;
    }
    uint64_t v20 = v19;
    if (v18 && v19)
    {
      unsigned __int8 v21 = [v18 isEqualToString:v19];

      if ((v21 & 1) != 0) {
        goto LABEL_17;
      }
    }

    else
    {
    }

    id v24 = (void *)PKCloudAccountBalanceUpdateInWalletTopUpReason;
    id v25 = v18;
    id v26 = v24;
    if (v25 == v26)
    {
LABEL_16:
    }

    else
    {
      id v27 = v26;
      if (!v18 || !v26)
      {

        goto LABEL_25;
      }

      unsigned __int8 v28 = [v25 isEqualToString:v26];

      if ((v28 & 1) == 0)
      {
LABEL_25:
        uint64_t Object = PKLogFacilityTypeGetObject(9LL);
        id v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__int128 buf = 138412290;
          id v41 = v25;
          _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "Error: attempted to insert balance update notification for unsupported update reason %@",  buf,  0xCu);
        }

        goto LABEL_22;
      }
    }

- (void).cxx_destruct
{
}

@end