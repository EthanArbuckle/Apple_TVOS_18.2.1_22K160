@interface PDPaymentWebServiceCoordinator
- (BOOL)_queue_automaticDeviceCheckInRequiredForRegion:(id)a3;
- (BOOL)allowAcquisitionOfAssertionOfType:(unint64_t)a3;
- (BOOL)interestedInAssertionOfType:(unint64_t)a3;
- (BOOL)shouldStartConsistencyCheck;
- (BOOL)synchronizeWithTSM;
- (PDAccountManager)accountManager;
- (PDAppletSubcredentialManager)credentialManager;
- (PDAppletSubcredentialManager)subcredentialManager;
- (PDApplyManager)applyManager;
- (PDAssertionManager)assertionManager;
- (PDAuxiliaryCapabilityManager)auxiliaryCapabilityManager;
- (PDCardFileManager)cardFileManager;
- (PDDatabaseManager)databaseManager;
- (PDDefaultPassManager)defaultPassManager;
- (PDDevicePasscodeManager)devicePasscodeManager;
- (PDDeviceRegistrationServiceCoordinator)deviceRegistrationServiceCoordinator;
- (PDDeviceRegistrationServiceCoordinator)registrationCoordinator;
- (PDDiscoveryManager)discoveryManager;
- (PDExpressPassManager)expressPassManager;
- (PDFamilyCircleManager)familyCircleManager;
- (PDISO18013Manager)isoManager;
- (PDPassUpgradeController)upgradeController;
- (PDPaymentSetupFeaturesCoordinator)paymentSetupFeaturesCoordinator;
- (PDPaymentWebServiceCoordinator)initWithPushNotificationManager:(id)a3 databaseManager:(id)a4 passStore:(id)a5 assertionManager:(id)a6 cloudStoreCoordinator:(id)a7 idsManager:(id)a8 tapToRadarDelegate:(id)a9 receiptFileManager:(id)a10 expressPassManager:(id)a11 familyCircleManager:(id)a12;
- (PDPeerPaymentWebServiceCoordinator)peerPaymentWebServiceCoordinator;
- (PDPendingProvisioningManager)pendingProvisioningManager;
- (PDProvisioningRequirementsChecker)provisioningRequirementsChecker;
- (PDPushProvisioningManager)pushProvisioningManager;
- (PDSharingManager)sharingManager;
- (PDUserNotificationManager)userNotificationManager;
- (PKPaymentWebServiceContext)sharedWebServiceContext;
- (double)_queue_deviceCheckInRepeatInterval;
- (id)_userNotificationFromResponse:(id)a3;
- (id)accountServicePushTopics;
- (id)applyServicePushTopics;
- (id)paymentOffersServicePushTopics;
- (id)paymentPasses;
- (id)pushNotificationTopics;
- (id)sharedWebService;
- (void)_accessObserversWithHandler:(id)a3;
- (void)_fetchPassesIfNecessaryForPushTopic:(id)a3;
- (void)_handleDeviceCheckInAction:(int64_t)a3 region:(id)a4 completion:(id)a5;
- (void)_handleDownloadedPass:(id)a3;
- (void)_paymentHardwareStatusWithType:(unint64_t)a3 completion:(id)a4;
- (void)_performDeviceCheckInTask:(id)a3;
- (void)_performNotificationActionWithUserInfo:(id)a3;
- (void)_processValueAddedServiceTransaction:(id)a3;
- (void)_queue_cancelAllDeviceCheckInTasks;
- (void)_queue_checkContextForDeviceCheckInAuthRequirement:(id)a3 completion:(id)a4;
- (void)_queue_coeleaseDeviceCheckInCompletion:(id)a3;
- (void)_queue_completeDeviceCheckInTask:(id)a3 success:(BOOL)a4 error:(id)a5;
- (void)_queue_completeDeviceUpgradeTasks;
- (void)_queue_enqueueDeviceCheckInTask:(id)a3;
- (void)_queue_handleCheckInForRegion:(id)a3 action:(int64_t)a4 completion:(id)a5;
- (void)_queue_performContactInformationFetchTaskWithCompletion:(id)a3;
- (void)_queue_performOwnershipTokensRequestWithUserInfo:(id)a3;
- (void)_queue_performRegistrationForBrokerURL:(id)a3 force:(BOOL)a4 completion:(id)a5;
- (void)_queue_performRegistrationForRegion:(id)a3 force:(BOOL)a4 completion:(id)a5;
- (void)_queue_provisionPushProvisioningSharingIdentifiers;
- (void)_queue_recreateCloudStoreTransactionZoneWithCompletion:(id)a3;
- (void)_queue_registerDeviceAtBrokerURL:(id)a3 completion:(id)a4;
- (void)_queue_scheduleDeviceCheckInWithStartTimeOffset:(double)a3 repeatInterval:(double)a4 randomizeTimes:(BOOL)a5;
- (void)_queue_setupBackgroundWebServiceWithCompletion:(id)a3;
- (void)_queue_unscheduleDeviceCheckIn;
- (void)_runDeviceUpgradeTasks;
- (void)_scheduleDeviceUpgradeTaskActivityWithRandomizeStartDate:(BOOL)a3;
- (void)_updateWebServiceConfigurationWithCompletion:(id)a3;
- (void)_updateWebServiceConfigurationWithSupportedRegionTimeInterval:(double)a3 unsupportedRegionTimeInterval:(double)a4 completion:(id)a5;
- (void)accountAttestationAnonymizationSaltWithCompletion:(id)a3;
- (void)applyPushNotificationToken:(id)a3;
- (void)assertionManager:(id)a3 didAcquireAssertion:(id)a4;
- (void)backgroundRegisterCredentialWithRequest:(id)a3;
- (void)checkSafariCredentialEligibility:(id)a3 completion:(id)a4;
- (void)connect;
- (void)dealloc;
- (void)deleteSharedWebServiceWithDiagnosticReason:(id)a3;
- (void)deviceStateWithCompletion:(id)a3;
- (void)didDownloadPaymentPass:(id)a3;
- (void)downloadReceiptForTransaction:(id)a3;
- (void)handleDeletionForPassTypeIdentifier:(id)a3 serialNumber:(id)a4;
- (void)handleInsertionForPaymentPass:(id)a3;
- (void)handlePushNotificationForTopic:(id)a3 userInfo:(id)a4;
- (void)handleRequestedActions:(id)a3 completion:(id)a4;
- (void)initiateDevicePassesDownload;
- (void)noteAccountChanged;
- (void)noteWebServiceDidChange;
- (void)passAdded:(id)a3;
- (void)passWillBeRemoved:(id)a3 withDiagnosticReason:(id)a4;
- (void)paymentHardwareStatusWithType:(unint64_t)a3 completion:(id)a4;
- (void)paymentWebService:(id)a3 didDownloadPass:(id)a4;
- (void)paymentWebService:(id)a3 didDownloadPass:(id)a4 cloudStoreCoordinatorDelegate:(id)a5;
- (void)paymentWebService:(id)a3 didDownloadPassRemoteAssets:(id)a4 completion:(id)a5;
- (void)paymentWebService:(id)a3 didDownloadSerialNumbersForInstalledPasses:(id)a4 inRegion:(id)a5;
- (void)paymentWebService:(id)a3 didRegisterCredentialWithIdentifier:(id)a4 response:(id)a5 error:(id)a6;
- (void)paymentWebServiceBackgroundSessionDidBecomeInvalid:(id)a3;
- (void)performConsistencyCheck;
- (void)performDeviceCheckInWithCompletion:(id)a3;
- (void)performHandlerOnSharedWebServiceQueue:(id)a3;
- (void)performPrimaryRegionRegistrationForce:(BOOL)a3 completion:(id)a4;
- (void)performRegistrationForBrokerURL:(id)a3 force:(BOOL)a4 completion:(id)a5;
- (void)performRegistrationForMemberOfRegions:(id)a3 force:(BOOL)a4 completion:(id)a5;
- (void)performRegistrationForRegion:(id)a3 force:(BOOL)a4 completion:(id)a5;
- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4;
- (void)processValueAddedServiceTransaction:(id)a3;
- (void)receivedXPCEvent:(id)a3 forEventStream:(id)a4;
- (void)registerCredentialWithRequest:(id)a3 completion:(id)a4;
- (void)registerObserver:(id)a3;
- (void)scheduleConsistencyCheck:(id)a3 pluggedIn:(BOOL)a4 backoffLevel:(id)a5;
- (void)scheduleConsistencyCheckIfNecessary;
- (void)scheduleDeviceCheckInIfNecessary;
- (void)scheduleDeviceCheckInWithStartTimeOffset:(double)a3;
- (void)scheduleDeviceUpgradeTasksIfNecessary;
- (void)scheduleDeviceUpgradeTasksIfNecessaryWithRandomizeStartDate:(BOOL)a3;
- (void)setAccountAttestationAnonymizationSalt:(id)a3 withCompletion:(id)a4;
- (void)setAccountManager:(id)a3;
- (void)setApplyManager:(id)a3;
- (void)setAssertionManager:(id)a3;
- (void)setAuxiliaryCapabilityManager:(id)a3;
- (void)setCredentialManager:(id)a3;
- (void)setDefaultPassManager:(id)a3;
- (void)setDeviceCheckInContextBuildVersion:(id)a3 outstandingAction:(int64_t)a4 forRegion:(id)a5;
- (void)setDevicePasscodeManager:(id)a3;
- (void)setDeviceRegistrationServiceCoordinator:(id)a3;
- (void)setDeviceUpgradeTasksContextBuildVersion:(id)a3 upgradeTaskVersion:(int64_t)a4 retryCount:(int64_t)a5;
- (void)setDiscoveryManager:(id)a3;
- (void)setIsoManager:(id)a3;
- (void)setPaymentSetupFeaturesCoordinator:(id)a3;
- (void)setPeerPaymentWebServiceCoordinator:(id)a3;
- (void)setPendingProvisioningManager:(id)a3;
- (void)setProvisioningRequirementsChecker:(id)a3;
- (void)setPushProvisioningManager:(id)a3;
- (void)setSharedWebService:(id)a3;
- (void)setSharingManager:(id)a3;
- (void)setUserNotificationManager:(id)a3;
- (void)startTasksIfNecessary;
- (void)submitVerificationCode:(id)a3 verificationData:(id)a4 forPass:(id)a5 handler:(id)a6;
- (void)unregisterObserver:(id)a3;
- (void)unscheduleDeviceCheckIn;
- (void)unscheduleDeviceUpgradeTaskActivity;
- (void)updateSharedWebServiceContext:(id)a3;
- (void)updateWebServiceConfigurationWithCompletion:(id)a3;
- (void)validatePreconditionsWithCompletion:(id)a3;
@end

@implementation PDPaymentWebServiceCoordinator

- (PDPaymentWebServiceCoordinator)initWithPushNotificationManager:(id)a3 databaseManager:(id)a4 passStore:(id)a5 assertionManager:(id)a6 cloudStoreCoordinator:(id)a7 idsManager:(id)a8 tapToRadarDelegate:(id)a9 receiptFileManager:(id)a10 expressPassManager:(id)a11 familyCircleManager:(id)a12
{
  id v60 = a3;
  id v59 = a4;
  id v58 = a5;
  id v49 = a6;
  id v57 = a6;
  id v56 = a7;
  id v50 = a8;
  id v55 = a8;
  id v54 = a9;
  id v53 = a10;
  id v52 = a11;
  id v51 = a12;
  v61.receiver = self;
  v61.super_class = (Class)&OBJC_CLASS___PDPaymentWebServiceCoordinator;
  v18 = -[PDPaymentWebServiceCoordinator init](&v61, "init");
  if (v18)
  {
    dispatch_queue_attr_t v19 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v20 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v19);
    dispatch_queue_t v21 = dispatch_queue_create("sharedWebServiceQueue", v20);
    sharedWebServiceQueue = v18->_sharedWebServiceQueue;
    v18->_sharedWebServiceQueue = (OS_dispatch_queue *)v21;

    dispatch_queue_t v23 = dispatch_queue_create("com.apple.passd.pdpaymentWebServiceCoordinator.reply", v20);
    replyQueue = v18->_replyQueue;
    v18->_replyQueue = (OS_dispatch_queue *)v23;

    objc_storeStrong((id *)&v18->_pushNotificationManager, a3);
    objc_storeStrong((id *)&v18->_databaseManager, a4);
    -[PDDatabaseManager setPaymentServicesDelegate:](v18->_databaseManager, "setPaymentServicesDelegate:", v18);
    v25 = objc_alloc_init(&OBJC_CLASS___PKSecureElement);
    secureElement = v18->_secureElement;
    v18->_secureElement = v25;

    objc_storeStrong((id *)&v18->_passStore, a5);
    objc_storeStrong((id *)&v18->_tapToRadarDelegate, a9);
    objc_storeStrong((id *)&v18->_receiptFileManager, a10);
    objc_storeStrong((id *)&v18->_expressPassManager, a11);
    uint64_t v27 = PKSharedWebServiceContextPath();
    v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue( +[PKPaymentWebServiceContext contextWithArchive:]( &OBJC_CLASS___PKPaymentWebServiceContext,  "contextWithArchive:",  v28));

    v30 = -[PDPaymentWebServiceArchiver initWithQueue:webServiceCoordinator:]( objc_alloc(&OBJC_CLASS___PDPaymentWebServiceArchiver),  "initWithQueue:webServiceCoordinator:",  v18->_sharedWebServiceQueue,  v18);
    archiver = v18->_archiver;
    v18->_archiver = v30;

    v32 = -[PDPaymentWebServiceTargetDevice initWithDataSource:]( objc_alloc(&OBJC_CLASS___PDPaymentWebServiceTargetDevice),  "initWithDataSource:",  v18);
    v33 = -[PKPaymentWebService initWithContext:targetDevice:archiver:tapToRadarDelegate:]( objc_alloc(&OBJC_CLASS___PKPaymentWebService),  "initWithContext:targetDevice:archiver:tapToRadarDelegate:",  v29,  v32,  v18->_archiver,  v18->_tapToRadarDelegate);
    sharedWebService = v18->_sharedWebService;
    v18->_sharedWebService = v33;

    v35 = -[PDPassUpgradeController initWithWebService:cardFileManager:]( objc_alloc(&OBJC_CLASS___PDPassUpgradeController),  "initWithWebService:cardFileManager:",  v18->_sharedWebService,  v18->_passStore);
    upgradeController = v18->_upgradeController;
    v18->_upgradeController = v35;

    v37 = -[PDPaymentSafariCardImportManager initWithWebService:webServiceQueue:databaseManager:]( objc_alloc(&OBJC_CLASS___PDPaymentSafariCardImportManager),  "initWithWebService:webServiceQueue:databaseManager:",  v18->_sharedWebService,  v18->_sharedWebServiceQueue,  v18->_databaseManager);
    safariCardImportManager = v18->_safariCardImportManager;
    v18->_safariCardImportManager = v37;

    objc_storeStrong((id *)&v18->_assertionManager, v49);
    objc_storeStrong((id *)&v18->_familyCircleManager, a12);
    objc_storeStrong((id *)&v18->_cloudStoreCoordinator, a7);
    objc_storeStrong((id *)&v18->_idsManager, v50);
    uint64_t v39 = objc_claimAutoreleasedReturnValue( +[NSHashTable pk_weakObjectsHashTableUsingPointerPersonality]( &OBJC_CLASS___NSHashTable,  "pk_weakObjectsHashTableUsingPointerPersonality"));
    observers = v18->_observers;
    v18->_observers = (NSHashTable *)v39;

    -[PDAssertionManager registerObserver:](v18->_assertionManager, "registerObserver:", v18);
    -[PDPushNotificationManager registerConsumer:](v18->_pushNotificationManager, "registerConsumer:", v18);
    v41 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    deviceCheckInTasks = v18->_deviceCheckInTasks;
    v18->_deviceCheckInTasks = v41;

    v43 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    fetchingReceiptUniqueIDs = v18->_fetchingReceiptUniqueIDs;
    v18->_fetchingReceiptUniqueIDs = v43;

    v18->_lock._os_unfair_lock_opaque = 0;
    v18->_observersLock._os_unfair_lock_opaque = 0;
    v45 = -[PDPaymentSetupFeaturesCoordinator initWithWebService:webServiceQueue:databaseManager:paymentWebServiceCoordinator:accountManager:familyCircleManager:discoveryManager:]( objc_alloc(&OBJC_CLASS___PDPaymentSetupFeaturesCoordinator),  "initWithWebService:webServiceQueue:databaseManager:paymentWebServiceCoordinator:accountManager:familyCircleM anager:discoveryManager:",  v18->_sharedWebService,  v18->_sharedWebServiceQueue,  v18->_databaseManager,  v18,  v18->_accountManager,  v18->_familyCircleManager,  v18->_discoveryManager);
    paymentSetupFeaturesCoordinator = v18->_paymentSetupFeaturesCoordinator;
    v18->_paymentSetupFeaturesCoordinator = v45;
  }

  return v18;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PDPaymentWebServiceCoordinator;
  -[PDPaymentWebServiceCoordinator dealloc](&v3, "dealloc");
}

- (void)setAccountManager:(id)a3
{
  id v5 = a3;
  -[PDPaymentSetupFeaturesCoordinator setAccountManager:]( self->_paymentSetupFeaturesCoordinator,  "setAccountManager:",  self->_accountManager);
}

- (void)setUserNotificationManager:(id)a3
{
  p_userNotificationManager = &self->_userNotificationManager;
  id v5 = a3;
  objc_storeWeak((id *)p_userNotificationManager, v5);
  -[PDPaymentSetupFeaturesCoordinator setUserNotificationManager:]( self->_paymentSetupFeaturesCoordinator,  "setUserNotificationManager:",  v5);
}

- (void)registerObserver:(id)a3
{
  if (a3)
  {
    p_observersLock = &self->_observersLock;
    id v5 = a3;
    os_unfair_lock_lock(p_observersLock);
    -[NSHashTable addObject:](self->_observers, "addObject:", v5);

    os_unfair_lock_unlock(p_observersLock);
  }

- (void)unregisterObserver:(id)a3
{
  if (a3)
  {
    p_observersLock = &self->_observersLock;
    id v5 = a3;
    os_unfair_lock_lock(p_observersLock);
    -[NSHashTable removeObject:](self->_observers, "removeObject:", v5);

    os_unfair_lock_unlock(p_observersLock);
  }

- (void)_accessObserversWithHandler:(id)a3
{
  id v4 = a3;
  if (!v4) {
    __break(1u);
  }
  id v5 = (void (**)(void, void))v4;
  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSHashTable allObjects](self->_observers, "allObjects"));
  os_unfair_lock_unlock(p_observersLock);
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v8 = v7;
  id v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        v5[2](v5, *(void *)(*((void *)&v13 + 1) + 8LL * (void)i));
      }

      id v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v10);
  }
}

- (void)connect
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002BEA0;
  block[3] = &unk_100639300;
  block[4] = self;
  if (qword_100707910 != -1) {
    dispatch_once(&qword_100707910, block);
  }
}

- (void)scheduleConsistencyCheckIfNecessary
{
  if ((PDScheduledActivityExists(@"PDPaymentWebServiceCoordinator", @"ConsistencyCheck") & 1) == 0)
  {
    objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", 600.0));
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412290;
      v7 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "No consistency check scheduled... scheduling for %@",  (uint8_t *)&v6,  0xCu);
    }

    -[PDPaymentWebServiceCoordinator scheduleConsistencyCheck:pluggedIn:backoffLevel:]( self,  "scheduleConsistencyCheck:pluggedIn:backoffLevel:",  v3,  0LL,  &off_10068FAC8);
  }

- (void)updateWebServiceConfigurationWithCompletion:(id)a3
{
  id v4 = a3;
  sharedWebServiceQueue = self->_sharedWebServiceQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002C0A8;
  block[3] = &unk_10063AC90;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)sharedWebServiceQueue, block);
}

- (void)_updateWebServiceConfigurationWithCompletion:(id)a3
{
  id v4 = (void (**)(void))a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDPaymentWebServiceCoordinator sharedWebService](self, "sharedWebService"));
  if ([v5 needsConfiguration])
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_10002C15C;
    v6[3] = &unk_10063ACB8;
    v7 = v4;
    [v5 configurePaymentServiceWithCompletion:v6];
  }

  else if (v4)
  {
    v4[2](v4);
  }
}

- (void)_updateWebServiceConfigurationWithSupportedRegionTimeInterval:(double)a3 unsupportedRegionTimeInterval:(double)a4 completion:(id)a5
{
  id v8 = (void (**)(void))a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDPaymentWebServiceCoordinator sharedWebService](self, "sharedWebService"));
  if ([v9 needsConfigurationWithSupportedRegionTimeInterval:a3 unsupportedRegionTimeInterval:a4])
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_10002C2F8;
    v10[3] = &unk_10063ACB8;
    uint64_t v11 = v8;
    [v9 configurePaymentServiceWithCompletion:v10];
  }

  else if (v8)
  {
    v8[2](v8);
  }
}

- (id)sharedWebService
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_sharedWebService;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setSharedWebService:(id)a3
{
  id v4 = (PKPaymentWebService *)a3;
  os_unfair_lock_lock(&self->_lock);
  sharedWebService = self->_sharedWebService;
  self->_sharedWebService = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (PKPaymentWebServiceContext)sharedWebServiceContext
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PKPaymentWebService context](self->_sharedWebService, "context"));
  os_unfair_lock_unlock(p_lock);
  return (PKPaymentWebServiceContext *)v4;
}

- (void)updateSharedWebServiceContext:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_lock);
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PKPaymentWebService context](self->_sharedWebService, "context"));
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 deviceID]);

    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue([v4 deviceID]);

      if (!v7)
      {
        uint64_t Object = PKLogFacilityTypeGetObject(6LL);
        id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
          int v20 = 136315394;
          dispatch_queue_t v21 = "-[PDPaymentWebServiceCoordinator updateSharedWebServiceContext:]";
          __int16 v22 = 2112;
          dispatch_queue_t v23 = v10;
          _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s archiving context without deviceID: %@",  (uint8_t *)&v20,  0x16u);
        }
      }
    }

    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[PKPaymentWebService context](self->_sharedWebService, "context"));
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 pushToken]);

    -[PKPaymentWebService setContext:](self->_sharedWebService, "setContext:", v4);
    if (v12)
    {
      __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(-[PKPaymentWebService context](self->_sharedWebService, "context"));
      __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 pushToken]);
      unsigned __int8 v15 = [v12 isEqualToString:v14];

      if ((v15 & 1) == 0)
      {
        __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(-[PKPaymentWebService context](self->_sharedWebService, "context"));
        [v16 setPushToken:v12];
      }
    }

    archiver = self->_archiver;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[PKPaymentWebService context](self->_sharedWebService, "context"));
    -[PDPaymentWebServiceArchiver archiveContext:](archiver, "archiveContext:", v18);

    os_unfair_lock_unlock(&self->_lock);
    -[PDPushNotificationManager recalculatePushTopics](self->_pushNotificationManager, "recalculatePushTopics");
  }

  else
  {
    uint64_t v19 = PKLogFacilityTypeGetObject(6LL);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v20) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Error: Refusing to update webservice context with nil.",  (uint8_t *)&v20,  2u);
    }
  }
}

- (void)performHandlerOnSharedWebServiceQueue:(id)a3
{
  id v4 = a3;
  sharedWebServiceQueue = self->_sharedWebServiceQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10002C760;
  v7[3] = &unk_1006396B0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)sharedWebServiceQueue, v7);
}

- (void)startTasksIfNecessary
{
}

- (void)deleteSharedWebServiceWithDiagnosticReason:(id)a3
{
  id v4 = a3;
  sharedWebServiceQueue = self->_sharedWebServiceQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002C85C;
  block[3] = &unk_1006392B0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)sharedWebServiceQueue, block);
}

- (void)submitVerificationCode:(id)a3 verificationData:(id)a4 forPass:(id)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t Object = PKLogFacilityTypeGetObject(37LL);
  unsigned __int8 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v12 passTypeIdentifier]);
    v17 = (void *)objc_claimAutoreleasedReturnValue([v12 serialNumber]);
    *(_DWORD *)buf = 138412802;
    id v33 = v10;
    __int16 v34 = 2112;
    v35 = v16;
    __int16 v36 = 2112;
    v37 = v17;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Submitting verification code (%@) for pass (%@,%@)",  buf,  0x20u);
  }

  v18 = (void *)PDOSTransactionCreate("PDPaymentWebServiceCoordinator.submit_otp");
  sharedWebServiceQueue = self->_sharedWebServiceQueue;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_10002CEB4;
  v25[3] = &unk_10063AD70;
  id v26 = v18;
  uint64_t v27 = self;
  id v28 = v10;
  id v29 = v11;
  id v30 = v12;
  id v31 = v13;
  id v20 = v13;
  id v21 = v12;
  id v22 = v11;
  id v23 = v10;
  id v24 = v18;
  dispatch_async((dispatch_queue_t)sharedWebServiceQueue, v25);
}

- (void)performConsistencyCheck
{
  sharedWebServiceQueue = self->_sharedWebServiceQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002D270;
  block[3] = &unk_100639300;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)sharedWebServiceQueue, block);
}

- (void)initiateDevicePassesDownload
{
  sharedWebServiceQueue = self->_sharedWebServiceQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002D440;
  block[3] = &unk_100639300;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)sharedWebServiceQueue, block);
}

- (void)processValueAddedServiceTransaction:(id)a3
{
  id v4 = a3;
  id v5 = PDDefaultQueue();
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v5);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10002D5B4;
  v8[3] = &unk_1006392B0;
  id v9 = v4;
  id v10 = self;
  id v7 = v4;
  dispatch_async(v6, v8);
}

- (id)applyServicePushTopics
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PDPaymentWebServiceCoordinator sharedWebServiceContext](self, "sharedWebServiceContext"));
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue([v2 applyServicePushTopics]);

  return v3;
}

- (id)accountServicePushTopics
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PDPaymentWebServiceCoordinator sharedWebServiceContext](self, "sharedWebServiceContext"));
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue([v2 accountServicePushTopics]);

  return v3;
}

- (id)paymentOffersServicePushTopics
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PDPaymentWebServiceCoordinator sharedWebServiceContext](self, "sharedWebServiceContext"));
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue([v2 paymentOffersServicePushTopics]);

  return v3;
}

- (void)downloadReceiptForTransaction:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 associatedReceiptUniqueID]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 receiptProviderURL]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 cardNumberSuffix]);
  if (v5 && v6)
  {
    sharedWebServiceQueue = self->_sharedWebServiceQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10002D8D4;
    block[3] = &unk_10063AE10;
    void block[4] = self;
    id v10 = v5;
    id v11 = v7;
    id v12 = v4;
    id v13 = v6;
    dispatch_async((dispatch_queue_t)sharedWebServiceQueue, block);
  }
}

- (void)paymentHardwareStatusWithType:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  sharedWebServiceQueue = self->_sharedWebServiceQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002E204;
  block[3] = &unk_10063AEB0;
  id v10 = v6;
  unint64_t v11 = a3;
  void block[4] = self;
  id v8 = v6;
  dispatch_async((dispatch_queue_t)sharedWebServiceQueue, block);
}

- (void)_paymentHardwareStatusWithType:(unint64_t)a3 completion:(id)a4
{
  id v6 = (void (**)(id, id))a4;
  id v7 = objc_alloc_init(&OBJC_CLASS___PKPaymentHardwareStatus);
  id v8 = [v7 setType:a3];
  id v10 = objc_msgSend(v7, "setHasSecureElement:", PKSecureElementIsAvailable(v8, v9) != 0);
  if (PKIsHandoffClient(v10))
  {
    if (PKIsTV())
    {
      [v7 setCanMakeRemotePayments:1];
    }

    else
    {
      objc_msgSend(v7, "setHasRemoteDevices:", -[PKIDSManager hasRemoteDevices](self->_idsManager, "hasRemoteDevices"));
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      __int128 v16 = 0u;
      __int128 v17 = 0u;
      unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[PKIDSManager remoteDevices](self->_idsManager, "remoteDevices", 0LL));
      id v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v12)
      {
        id v13 = v12;
        uint64_t v14 = *(void *)v17;
        while (2)
        {
          for (i = 0LL; i != v13; i = (char *)i + 1)
          {
            if (*(void *)v17 != v14) {
              objc_enumerationMutation(v11);
            }
            if ([*(id *)(*((void *)&v16 + 1) + 8 * (void)i) canMakePayments])
            {
              [v7 setCanMakeRemotePayments:1];
              goto LABEL_14;
            }
          }

          id v13 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
          if (v13) {
            continue;
          }
          break;
        }
      }

- (void)validatePreconditionsWithCompletion:(id)a3
{
  objc_super v3 = (void (**)(id, void))a3;
  if (v3)
  {
    if (!PKSecureElementIsAvailable()
      || (PKCurrentUserIsGuestUser() & 1) != 0
      || (PKCurrentUserIsInSharingMode() & 1) != 0
      || !PKHasVerifiedPrimaryAppleAccount()
      || !PKPasscodeEnabled())
    {
      goto LABEL_15;
    }

    if (PKIsSRD())
    {
      uint64_t Object = PKLogFacilityTypeGetObject(6LL);
      id v5 = (void *)objc_claimAutoreleasedReturnValue(Object);
      if (!os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT))
      {
LABEL_14:

LABEL_15:
        v3[2](v3, 0LL);
        goto LABEL_16;
      }

      __int16 v10 = 0;
      id v6 = "Preconditions failed - is SRD";
      id v7 = (uint8_t *)&v10;
    }

    else
    {
      if (!PKIsBeneficiaryAccount())
      {
        v3[2](v3, 1LL);
        goto LABEL_16;
      }

      uint64_t v8 = PKLogFacilityTypeGetObject(6LL);
      id v5 = (void *)objc_claimAutoreleasedReturnValue(v8);
      if (!os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_14;
      }
      __int16 v9 = 0;
      id v6 = "Preconditions failed - is beneficary account";
      id v7 = (uint8_t *)&v9;
    }

    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v5, OS_LOG_TYPE_DEFAULT, v6, v7, 2u);
    goto LABEL_14;
  }

- (void)accountAttestationAnonymizationSaltWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    sharedWebServiceQueue = self->_sharedWebServiceQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10002E560;
    block[3] = &unk_10063A830;
    id v8 = v4;
    dispatch_async((dispatch_queue_t)sharedWebServiceQueue, block);
  }
}

- (void)setAccountAttestationAnonymizationSalt:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  sharedWebServiceQueue = self->_sharedWebServiceQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10002E674;
  v11[3] = &unk_10063AC90;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)sharedWebServiceQueue, v11);
}

- (void)registerCredentialWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  sharedWebServiceQueue = self->_sharedWebServiceQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002E770;
  block[3] = &unk_100639AF0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)sharedWebServiceQueue, block);
}

- (void)backgroundRegisterCredentialWithRequest:(id)a3
{
  id v4 = a3;
  sharedWebServiceQueue = self->_sharedWebServiceQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10002E82C;
  v7[3] = &unk_1006392B0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)sharedWebServiceQueue, v7);
}

- (id)pushNotificationTopics
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PDPaymentWebServiceCoordinator sharedWebServiceContext](self, "sharedWebServiceContext"));
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue([v2 notificationPushTopics]);

  if (![v3 count])
  {
    uint64_t v4 = objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", @"com.apple.passd"));

    objc_super v3 = (void *)v4;
  }

  return v3;
}

- (void)handlePushNotificationForTopic:(id)a3 userInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  sharedWebServiceQueue = self->_sharedWebServiceQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002EA60;
  block[3] = &unk_100639350;
  id v12 = v6;
  id v13 = v7;
  uint64_t v14 = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)sharedWebServiceQueue, block);
}

- (void)applyPushNotificationToken:(id)a3
{
  id v4 = a3;
  sharedWebServiceQueue = self->_sharedWebServiceQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10002F190;
  v7[3] = &unk_1006392B0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)sharedWebServiceQueue, v7);
}

- (void)passWillBeRemoved:(id)a3 withDiagnosticReason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  sharedWebServiceQueue = self->_sharedWebServiceQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002F63C;
  block[3] = &unk_100639350;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)sharedWebServiceQueue, block);
}

- (void)passAdded:(id)a3
{
  id v4 = a3;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10002F814;
  v9[3] = &unk_1006392B0;
  id v10 = v4;
  unint64_t v11 = self;
  id v7 = v9;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100039760;
  block[3] = &unk_10063A830;
  id v13 = v7;
  id v8 = v4;
  dispatch_async(v6, block);
}

- (void)paymentWebService:(id)a3 didDownloadPass:(id)a4
{
}

- (void)paymentWebService:(id)a3 didDownloadPass:(id)a4 cloudStoreCoordinatorDelegate:(id)a5
{
  id v8 = a4;
  [a3 backgroundDownloadRemotePassAssets:v8 forSuffixesAndScreenScales:0 cloudStoreCoordinatorDelegate:a5];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10002FC88;
  v10[3] = &unk_10063B038;
  void v10[4] = self;
  id v11 = v8;
  id v9 = v8;
  -[PDPaymentWebServiceCoordinator _accessObserversWithHandler:](self, "_accessObserversWithHandler:", v10);
}

- (void)paymentWebService:(id)a3 didDownloadPassRemoteAssets:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  [v7 reloadDisplayProfileOfType:0];
  id v9 = PDDefaultQueue();
  id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v9);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002FD98;
  block[3] = &unk_100639AF0;
  void block[4] = self;
  id v14 = v7;
  id v15 = v8;
  id v11 = v8;
  id v12 = v7;
  dispatch_async(v10, block);
}

- (void)paymentWebService:(id)a3 didDownloadSerialNumbersForInstalledPasses:(id)a4 inRegion:(id)a5
{
  id v26 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t Object = PKLogFacilityTypeGetObject(6LL);
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Comparing server's expectation of installed passes with local passes…",  buf,  2u);
  }

  uint64_t v27 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v25 = self;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[PDDatabaseManager passesOfType:](self->_databaseManager, "passesOfType:", 1LL));
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  id v13 = [v12 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v34;
    do
    {
      for (i = 0LL; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v34 != v15) {
          objc_enumerationMutation(v12);
        }
        __int128 v17 = *(void **)(*((void *)&v33 + 1) + 8LL * (void)i);
        __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v17 passTypeIdentifier]);
        if ([v18 isEqualToString:v9])
        {
          __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v17 serialNumber]);
          unsigned __int8 v20 = [v8 containsObject:v19];

          if ((v20 & 1) == 0) {
            -[NSMutableArray addObject:](v27, "addObject:", v17);
          }
        }

        else
        {
        }
      }

      id v14 = [v12 countByEnumeratingWithState:&v33 objects:v38 count:16];
    }

    while (v14);
  }

  sharedWebServiceQueue = (dispatch_queue_s *)v25->_sharedWebServiceQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000300DC;
  block[3] = &unk_10063B060;
  id v29 = v27;
  id v30 = v9;
  id v31 = v25;
  id v32 = v8;
  id v22 = v8;
  id v23 = v9;
  id v24 = v27;
  dispatch_async(sharedWebServiceQueue, block);
}

- (void)paymentWebService:(id)a3 didRegisterCredentialWithIdentifier:(id)a4 response:(id)a5 error:(id)a6
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100030460;
  v11[3] = &unk_10063B088;
  id v12 = self;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v8 = v15;
  id v9 = v14;
  id v10 = v13;
  -[PDPaymentWebServiceCoordinator _accessObserversWithHandler:](v12, "_accessObserversWithHandler:", v11);
}

- (void)paymentWebServiceBackgroundSessionDidBecomeInvalid:(id)a3
{
  id v4 = a3;
  sharedWebServiceQueue = self->_sharedWebServiceQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10003052C;
  v7[3] = &unk_1006392B0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)sharedWebServiceQueue, v7);
}

- (void)performRegistrationForMemberOfRegions:(id)a3 force:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v8 && [v8 count])
  {
    sharedWebServiceQueue = self->_sharedWebServiceQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100030788;
    block[3] = &unk_10063B100;
    void block[4] = self;
    id v17 = v8;
    BOOL v19 = a4;
    id v18 = v9;
    dispatch_async((dispatch_queue_t)sharedWebServiceQueue, block);

    id v11 = v17;
LABEL_8:

    goto LABEL_9;
  }

  uint64_t Object = PKLogFacilityTypeGetObject(6LL);
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "PDPaymentWebServiceCoordinator: ignoring request to register among zero regions.",  buf,  2u);
  }

  if (v9)
  {
    id v14 = PDDefaultQueue();
    id v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v14);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_100030778;
    v20[3] = &unk_10063A830;
    id v21 = v9;
    dispatch_async(v15, v20);

    id v11 = v21;
    goto LABEL_8;
  }

- (void)performPrimaryRegionRegistrationForce:(BOOL)a3 completion:(id)a4
{
}

- (void)performRegistrationForRegion:(id)a3 force:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  sharedWebServiceQueue = self->_sharedWebServiceQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100030E3C;
  v13[3] = &unk_10063B100;
  v13[4] = self;
  id v14 = v8;
  BOOL v16 = a4;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async((dispatch_queue_t)sharedWebServiceQueue, v13);
}

- (void)_queue_performRegistrationForRegion:(id)a3 force:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[PDPaymentWebServiceCoordinator sharedWebService](self, "sharedWebService"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 context]);
  if (v8)
  {
    if (!PKRegistrationSupportedInRegionForWebService(v8, v10))
    {
      uint64_t Object = PKLogFacilityTypeGetObject(6LL);
      unsigned __int8 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_22;
      }
      *(_DWORD *)buf = 138543362;
      id v40 = v8;
      id v21 = "PDPaymentWebServiceCoordinator: cannot register for region %{public}@ - not supported.";
      goto LABEL_18;
    }

    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 configuration]);
    id v13 = (id)objc_claimAutoreleasedReturnValue([v12 brokerURLForRegion:v8]);

    if (v13)
    {
      if (([v11 isRegistered] & 1) != 0
        || (id v14 = (void *)objc_claimAutoreleasedReturnValue([v10 primaryBrokerURL]),
            char v15 = PKEqualObjects(v13, v14),
            v14,
            (v15 & 1) != 0))
      {
        uint64_t v16 = PKLogFacilityTypeGetObject(6LL);
        id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
        if (!os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_DEFAULT))
        {
LABEL_13:

          -[PDPaymentWebServiceCoordinator _queue_performRegistrationForBrokerURL:force:completion:]( self,  "_queue_performRegistrationForBrokerURL:force:completion:",  v13,  v6,  v9);
LABEL_24:

          goto LABEL_25;
        }

        *(_DWORD *)buf = 138543362;
        id v40 = v8;
      }

      else
      {
        uint64_t v28 = PKRegistrationSupportedInCurrentRegionForWebService(v10);
        uint64_t v29 = PKLogFacilityTypeGetObject(6LL);
        id v17 = (void *)objc_claimAutoreleasedReturnValue(v29);
        BOOL v30 = os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_DEFAULT);
        if (v28)
        {
          if (v30)
          {
            *(_DWORD *)buf = 138543362;
            id v40 = v8;
            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v17,  OS_LOG_TYPE_DEFAULT,  "PDPaymentWebServiceCoordinator: initially registering for device region as precondition for registration t o region %{public}@.",  buf,  0xCu);
          }

          v33[0] = _NSConcreteStackBlock;
          v33[1] = 3221225472LL;
          v33[2] = sub_10003127C;
          v33[3] = &unk_10063B128;
          id v34 = v8;
          __int128 v35 = self;
          id v36 = v13;
          BOOL v38 = v6;
          id v37 = v9;
          id v13 = v13;
          -[PDPaymentWebServiceCoordinator _queue_performRegistrationForBrokerURL:force:completion:]( self,  "_queue_performRegistrationForBrokerURL:force:completion:",  0LL,  0LL,  v33);

          goto LABEL_24;
        }

        if (!v30) {
          goto LABEL_13;
        }
        *(_DWORD *)buf = 138543362;
        id v40 = v8;
      }

      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v17,  OS_LOG_TYPE_DEFAULT,  "PDPaymentWebServiceCoordinator: registering for region %{public}@.",  buf,  0xCu);
      goto LABEL_13;
    }

    uint64_t v22 = PKLogFacilityTypeGetObject(6LL);
    unsigned __int8 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v40 = v8;
      id v21 = "PDPaymentWebServiceCoordinator: cannot register for region %{public}@ - could not resolve broker URL.";
LABEL_18:
      id v23 = v20;
      uint32_t v24 = 12;
LABEL_21:
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, v21, buf, v24);
    }
  }

  else
  {
    if (PKRegistrationSupportedInCurrentRegionForWebService(v10))
    {
      [v11 isRegistered];
      uint64_t v18 = PKLogFacilityTypeGetObject(6LL);
      id v17 = (void *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v17,  OS_LOG_TYPE_DEFAULT,  "PDPaymentWebServiceCoordinator: registering for primary region.",  buf,  2u);
      }

      id v13 = 0LL;
      goto LABEL_13;
    }

    uint64_t v25 = PKLogFacilityTypeGetObject(6LL);
    unsigned __int8 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v21 = "PDPaymentWebServiceCoordinator: cannot register for primary region - not supported.";
      id v23 = v20;
      uint32_t v24 = 2;
      goto LABEL_21;
    }
  }

- (void)performRegistrationForBrokerURL:(id)a3 force:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  sharedWebServiceQueue = self->_sharedWebServiceQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000314BC;
  v13[3] = &unk_10063B100;
  v13[4] = self;
  id v14 = v8;
  BOOL v16 = a4;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async((dispatch_queue_t)sharedWebServiceQueue, v13);
}

- (void)_queue_performRegistrationForBrokerURL:(id)a3 force:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[PDPaymentWebServiceCoordinator sharedWebService](self, "sharedWebService"));
  id v11 = v10;
  if (v8)
  {
    if (!a4 && ([v10 needsRegistrationForBrokerURL:v8] & 1) == 0)
    {
      uint64_t Object = PKLogFacilityTypeGetObject(6LL);
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_12;
      }
      *(_DWORD *)buf = 138412290;
      id v31 = v8;
      id v14 = "PDPaymentWebServiceCoordinator: skipping registration at %@ - already registered.";
      goto LABEL_11;
    }

    goto LABEL_15;
  }

  uint64_t v15 = objc_claimAutoreleasedReturnValue([v10 primaryBrokerURL]);
  id v8 = (id)v15;
  if (!v15 || a4)
  {
    if (!v15)
    {
      uint64_t v20 = PKLogFacilityTypeGetObject(6LL);
      id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "PDPaymentWebServiceCoordinator: cannot register with primary region - broker URL not found.",  buf,  2u);
      }

      if (!v9)
      {
        id v8 = 0LL;
        goto LABEL_17;
      }

      id v22 = PDDefaultQueue();
      id v23 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v22);
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472LL;
      v24[2] = sub_1000317C4;
      v24[3] = &unk_10063A830;
      BOOL v19 = &v25;
      id v25 = v9;
      dispatch_async(v23, v24);

      id v8 = 0LL;
      goto LABEL_16;
    }

    goto LABEL_15;
  }

  if ([v11 needsRegistration])
  {
LABEL_15:
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472LL;
    v28[2] = sub_1000317A0;
    v28[3] = &unk_100639688;
    BOOL v19 = &v29;
    id v29 = v9;
    -[PDPaymentWebServiceCoordinator _queue_registerDeviceAtBrokerURL:completion:]( self,  "_queue_registerDeviceAtBrokerURL:completion:",  v8,  v28);
    goto LABEL_16;
  }

  uint64_t v16 = PKLogFacilityTypeGetObject(6LL);
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
    goto LABEL_12;
  }
  *(_DWORD *)buf = 138412290;
  id v31 = v8;
  id v14 = "PDPaymentWebServiceCoordinator: skipping primary region registration at %@ - already registered.";
LABEL_11:
  _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v14, buf, 0xCu);
LABEL_12:

  if (v9)
  {
    id v17 = PDDefaultQueue();
    uint64_t v18 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v17);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000317B4;
    block[3] = &unk_10063A830;
    BOOL v19 = &v27;
    id v27 = v9;
    dispatch_async(v18, block);

LABEL_16:
  }

- (void)_queue_registerDeviceAtBrokerURL:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t Object = PKLogFacilityTypeGetObject(6LL);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "PDPaymentWebServiceCoordinator: registering with the broker at %@.",  buf,  0xCu);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[PDPaymentWebServiceCoordinator sharedWebService](self, "sharedWebService"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100031918;
  v13[3] = &unk_10063B178;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v11 = v7;
  id v12 = v6;
  [v10 registerDeviceAtBrokerURL:v12 consistencyCheckResults:0 completion:v13];
}

- (void)scheduleDeviceCheckInIfNecessary
{
  sharedWebServiceQueue = self->_sharedWebServiceQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100031C5C;
  block[3] = &unk_100639300;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)sharedWebServiceQueue, block);
}

- (void)scheduleDeviceCheckInWithStartTimeOffset:(double)a3
{
  sharedWebServiceQueue = self->_sharedWebServiceQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10003200C;
  v4[3] = &unk_10063A8A8;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  dispatch_async((dispatch_queue_t)sharedWebServiceQueue, v4);
}

- (void)_queue_scheduleDeviceCheckInWithStartTimeOffset:(double)a3 repeatInterval:(double)a4 randomizeTimes:(BOOL)a5
{
  BOOL v5 = a5;
  -[PDPaymentWebServiceCoordinator connect](self, "connect");
  uint64_t Criteria = PDScheduledActivityGetCriteria(@"PDPaymentWebServiceCoordinator", @"DeviceCheckIn");
  id v9 = (void *)objc_claimAutoreleasedReturnValue(Criteria);
  if (!v9)
  {
    double v13 = 0.0;
    double v14 = 0.0;
    if (v5)
    {
      double v13 = (double)arc4random_uniform(0xE10u);
      double v14 = (double)arc4random_uniform(0xE10u);
    }

    double v15 = v14 + a4;
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  v13 + a3));
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[PDScheduledActivityCriteria priorityActivityCriteriaWithStartDate:]( &OBJC_CLASS___PDScheduledActivityCriteria,  "priorityActivityCriteriaWithStartDate:",  v11));
    [v12 setRequireNetworkConnectivity:1];
    [v12 setRepeating:1];
    [v12 setRepeatInterval:v15];
    [v12 setReason:@"Device Check In"];
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v12 debugDescription]);
      int v19 = 138412290;
      uint64_t v20 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "passd scheduling device check in: %@",  (uint8_t *)&v19,  0xCu);
    }

    PDScheduledActivityRegister(@"PDPaymentWebServiceCoordinator", @"DeviceCheckIn", v12);
    goto LABEL_9;
  }

  uint64_t v10 = PKLogFacilityTypeGetObject(6LL);
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 debugDescription]);
    int v19 = 138412290;
    uint64_t v20 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Device check in already scheduled: %@",  (uint8_t *)&v19,  0xCu);
LABEL_9:
  }
}

- (BOOL)_queue_automaticDeviceCheckInRequiredForRegion:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 deviceCheckInPushTopic]);
  id v5 = [v4 length];

  if (v5)
  {
    uint64_t v6 = PKDeviceBuildVersion();
    id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    uint64_t v8 = objc_claimAutoreleasedReturnValue([v3 lastDeviceCheckInBuildVersion]);
    id v9 = (void *)v8;
    if (v7 && v8 && ![v7 compare:v8 options:1])
    {
      uint64_t Object = PKLogFacilityTypeGetObject(6LL);
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        id v17 = (void *)objc_claimAutoreleasedReturnValue([v3 regionCode]);
        int v18 = 138412802;
        int v19 = v17;
        __int16 v20 = 2112;
        id v21 = v7;
        __int16 v22 = 2112;
        id v23 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Device check in for region: %@ is not required as %@ is equal to %@",  (uint8_t *)&v18,  0x20u);
      }

      BOOL v13 = 0;
    }

    else
    {
      uint64_t v10 = PKLogFacilityTypeGetObject(6LL);
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v3 regionCode]);
        int v18 = 138412802;
        int v19 = v12;
        __int16 v20 = 2112;
        id v21 = v7;
        __int16 v22 = 2112;
        id v23 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Device check in for region: %@ is required as %@ is not equal to %@",  (uint8_t *)&v18,  0x20u);
      }

      BOOL v13 = 1;
    }
  }

  else
  {
    uint64_t v14 = PKLogFacilityTypeGetObject(6LL);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v7,  OS_LOG_TYPE_DEFAULT,  "Device check in required as no deviceCheckInPushTopic found in context",  (uint8_t *)&v18,  2u);
    }

    BOOL v13 = 1;
  }

  return v13;
}

- (double)_queue_deviceCheckInRepeatInterval
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PDPaymentWebServiceCoordinator sharedWebServiceContext](self, "sharedWebServiceContext"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 configuration]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v2 primaryRegion]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 regionCode]);
  [v3 deviceCheckInIntervalForRegion:v5];
  if (v6 <= 0.0) {
    double v7 = 21600.0;
  }
  else {
    double v7 = 1.0;
  }

  return v7;
}

- (void)unscheduleDeviceCheckIn
{
  id v3 = PDDefaultQueue();
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v3);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000325D8;
  block[3] = &unk_100639300;
  void block[4] = self;
  dispatch_async(v4, block);
}

- (void)_queue_unscheduleDeviceCheckIn
{
  uint64_t Object = PKLogFacilityTypeGetObject(6LL);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Unscheduling device check in", v5, 2u);
  }

  -[PDPaymentWebServiceCoordinator connect](self, "connect");
  PDScheduledActivityRemove(@"PDPaymentWebServiceCoordinator", @"DeviceCheckIn");
}

- (void)performDeviceCheckInWithCompletion:(id)a3
{
  id v4 = a3;
  sharedWebServiceQueue = self->_sharedWebServiceQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000326E4;
  v7[3] = &unk_10063AC90;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)sharedWebServiceQueue, v7);
}

- (void)_queue_enqueueDeviceCheckInTask:(id)a3
{
  id v4 = a3;
  -[NSMutableArray addObject:](self->_deviceCheckInTasks, "addObject:", v4);
  BOOL deviceCheckInRunning = self->_deviceCheckInRunning;
  uint64_t Object = PKLogFacilityTypeGetObject(6LL);
  double v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (deviceCheckInRunning)
  {
    if (v8)
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Device check in already running waiting",  v9,  2u);
    }
  }

  else
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Device check in not running starting immediately",  buf,  2u);
    }

    -[PDPaymentWebServiceCoordinator _performDeviceCheckInTask:](self, "_performDeviceCheckInTask:", v4);
  }
}

- (void)_queue_coeleaseDeviceCheckInCompletion:(id)a3
{
  id v7 = a3;
  id v4 = (PDDeviceCheckInTask *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_deviceCheckInTasks, "lastObject"));
  if (!v4)
  {
    id v4 = objc_alloc_init(&OBJC_CLASS___PDDeviceCheckInTask);
    -[NSMutableArray addObject:](self->_deviceCheckInTasks, "addObject:", v4);
  }

  if (v7)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDDeviceCheckInTask completionHandlers](v4, "completionHandlers"));
    id v6 = objc_retainBlock(v7);
    [v5 addObject:v6];
  }

  if (!self->_deviceCheckInRunning) {
    -[PDPaymentWebServiceCoordinator _performDeviceCheckInTask:](self, "_performDeviceCheckInTask:", v4);
  }
}

- (void)_queue_cancelAllDeviceCheckInTasks
{
  __int128 v7 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  v2 = self->_deviceCheckInTasks;
  id v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v2,  "countByEnumeratingWithState:objects:count:",  &v7,  v11,  16LL);
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      id v6 = 0LL;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * (void)v6), "setCancelled:", 1, (void)v7);
        id v6 = (char *)v6 + 1;
      }

      while (v4 != v6);
      id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v2,  "countByEnumeratingWithState:objects:count:",  &v7,  v11,  16LL);
    }

    while (v4);
  }
}

- (void)_performDeviceCheckInTask:(id)a3
{
  id v4 = a3;
  uint64_t Object = PKLogFacilityTypeGetObject(6LL);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Performing device check in task", buf, 2u);
  }

  self->_BOOL deviceCheckInRunning = 1;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100032BBC;
  v9[3] = &unk_100639350;
  id v10 = (id)PDOSTransactionCreate("PDPaymentWebServiceCoordinator.check_in.pre_configure");
  id v11 = self;
  id v12 = v4;
  id v7 = v4;
  id v8 = v10;
  -[PDPaymentWebServiceCoordinator _updateWebServiceConfigurationWithCompletion:]( self,  "_updateWebServiceConfigurationWithCompletion:",  v9);
}

- (void)_queue_completeDeviceCheckInTask:(id)a3 success:(BOOL)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  -[NSMutableArray removeObject:](self->_deviceCheckInTasks, "removeObject:", v8);
  replyQueue = self->_replyQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000336D0;
  block[3] = &unk_10063B300;
  id v11 = v8;
  id v26 = v11;
  BOOL v28 = a4;
  id v12 = v9;
  id v27 = v12;
  dispatch_async((dispatch_queue_t)replyQueue, block);
  BOOL v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->_deviceCheckInTasks, "firstObject"));
  uint64_t v14 = v13;
  if (v13)
  {
    if ([v13 cancelled]) {
      -[PDPaymentWebServiceCoordinator _queue_completeDeviceCheckInTask:success:error:]( self,  "_queue_completeDeviceCheckInTask:success:error:",  v14,  0LL,  0LL);
    }
    else {
      -[PDPaymentWebServiceCoordinator _performDeviceCheckInTask:](self, "_performDeviceCheckInTask:", v14);
    }
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "All device check in tasks are complete",  buf,  2u);
    }

    self->_BOOL deviceCheckInRunning = 0;
    if (v12) {
      a4 = 0;
    }
    uint64_t v17 = 0LL;
    if (!a4)
    {
      -[PDPaymentWebServiceCoordinator _queue_deviceCheckInRepeatInterval](self, "_queue_deviceCheckInRepeatInterval");
      uint64_t v17 = v18;
    }

    BOOL v19 = !a4;
    id v20 = PDDefaultQueue();
    id v21 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v20);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_1000337CC;
    v22[3] = &unk_100639238;
    v22[4] = self;
    BOOL v23 = v19;
    v22[5] = v17;
    dispatch_async(v21, v22);
  }
}

- (void)_queue_checkContextForDeviceCheckInAuthRequirement:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0LL;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000LL;
  char v20 = 0;
  if ([v6 canPromptForAuth])
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PDPaymentWebServiceCoordinator sharedWebServiceContext](self, "sharedWebServiceContext"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 regions]);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_1000339D4;
    v16[3] = &unk_10063B328;
    v16[4] = &v17;
    [v9 enumerateKeysAndObjectsUsingBlock:v16];
  }

  if (*((_BYTE *)v18 + 24))
  {
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Requesting grand slam token renew for device check in",  buf,  2u);
    }

    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[PDPaymentWebServiceCoordinator sharedWebService](self, "sharedWebService"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100033AB8;
    v13[3] = &unk_10063B378;
    v13[4] = self;
    id v14 = v7;
    [v12 _renewAppleAccountWithCompletionHandler:v13];
  }

  else
  {
    (*((void (**)(id, uint64_t, void))v7 + 2))(v7, 1LL, 0LL);
  }

  _Block_object_dispose(&v17, 8);
}

- (void)_queue_handleCheckInForRegion:(id)a3 action:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_100033E8C;
  v23[3] = &unk_10063B3C8;
  id v10 = v8;
  id v24 = v10;
  id v25 = self;
  id v11 = v9;
  id v26 = v11;
  id v12 = objc_retainBlock(v23);
  BOOL v13 = v12;
  if (a4)
  {
    ((void (*)(void *, int64_t))v12[2])(v12, a4);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    double v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v28 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "passd requesting device check in for region: %@",  buf,  0xCu);
    }

    uint64_t v16 = (void *)PDOSTransactionCreate("PDPaymentWebServiceCoordinator.check_in");
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[PDPaymentWebServiceCoordinator sharedWebService](self, "sharedWebService"));
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_100033FBC;
    v19[3] = &unk_10063B3F0;
    id v20 = v16;
    id v21 = v11;
    id v22 = v13;
    id v18 = v16;
    [v17 deviceCheckInDeviceCheckInForRegion:v10 completion:v19];
  }
}

- (void)_handleDeviceCheckInAction:(int64_t)a3 region:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[PDPaymentWebServiceCoordinator sharedWebService](self, "sharedWebService"));
  switch(a3)
  {
    case 0LL:
      uint64_t Object = PKLogFacilityTypeGetObject(6LL);
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_11;
      }
      *(_DWORD *)buf = 138412290;
      id v42 = v8;
      BOOL v13 = "No action taken from device check in for: %@";
      goto LABEL_10;
    case 1LL:
      sharedWebServiceQueue = self->_sharedWebServiceQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1000348AC;
      block[3] = &unk_100639AF0;
      id v25 = v8;
      id v26 = v10;
      id v27 = v9;
      dispatch_async((dispatch_queue_t)sharedWebServiceQueue, block);

      double v15 = v25;
      goto LABEL_7;
    case 2LL:
      uint64_t v16 = self->_sharedWebServiceQueue;
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472LL;
      v28[2] = sub_100034640;
      v28[3] = &unk_10063B440;
      id v29 = v8;
      BOOL v30 = self;
      id v31 = v10;
      id v32 = v9;
      dispatch_async((dispatch_queue_t)v16, v28);

      double v15 = v29;
      goto LABEL_7;
    case 3LL:
      uint64_t v17 = self->_sharedWebServiceQueue;
      v36[0] = _NSConcreteStackBlock;
      v36[1] = 3221225472LL;
      v36[2] = sub_1000343C4;
      v36[3] = &unk_10063B440;
      id v37 = v8;
      BOOL v38 = self;
      id v39 = v10;
      id v40 = v9;
      dispatch_async((dispatch_queue_t)v17, v36);

      double v15 = v37;
LABEL_7:

      break;
    case 4LL:
      uint64_t v18 = PKLogFacilityTypeGetObject(6LL);
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v42 = v8;
        BOOL v13 = "Device check in requires auth for: %@";
LABEL_10:
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v13, buf, 0xCu);
      }

- (void)setDeviceCheckInContextBuildVersion:(id)a3 outstandingAction:(int64_t)a4 forRegion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  sharedWebServiceQueue = self->_sharedWebServiceQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100034B04;
  v13[3] = &unk_100639288;
  v13[4] = self;
  id v14 = v9;
  id v15 = v8;
  int64_t v16 = a4;
  id v11 = v8;
  id v12 = v9;
  dispatch_async((dispatch_queue_t)sharedWebServiceQueue, v13);
}

- (void)handleInsertionForPaymentPass:(id)a3
{
  if (a3)
  {
    -[PDPushNotificationManager recalculatePushTopics](self->_pushNotificationManager, "recalculatePushTopics");
    id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", 180.0));
    -[PDPaymentWebServiceCoordinator scheduleConsistencyCheck:pluggedIn:backoffLevel:]( self,  "scheduleConsistencyCheck:pluggedIn:backoffLevel:",  v4,  0LL,  0LL);
  }

- (void)handleDeletionForPassTypeIdentifier:(id)a3 serialNumber:(id)a4
{
}

- (BOOL)interestedInAssertionOfType:(unint64_t)a3
{
  return a3 - 1 < 2;
}

- (BOOL)allowAcquisitionOfAssertionOfType:(unint64_t)a3
{
  return a3 - 1 < 2;
}

- (void)assertionManager:(id)a3 didAcquireAssertion:(id)a4
{
  id v5 = a4;
  sharedWebServiceQueue = self->_sharedWebServiceQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100034D6C;
  v8[3] = &unk_1006392B0;
  id v9 = v5;
  id v10 = self;
  id v7 = v5;
  dispatch_async((dispatch_queue_t)sharedWebServiceQueue, v8);
}

- (BOOL)synchronizeWithTSM
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[PDPaymentWebServiceCoordinator sharedWebService](self, "sharedWebService"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 context]);
  unsigned __int8 v5 = [v4 isRegistered];

  if ((v5 & 1) != 0)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PDPaymentWebServiceCoordinator sharedWebServiceContext](self, "sharedWebServiceContext"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 TSMPushTopics]);

    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    id v8 = v7;
    id v9 = [v8 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v18;
      do
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v8);
          }
          unsigned __int8 v13 = -[PKSecureElement queueConnectionToServerWithPushTopic:]( self->_secureElement,  "queueConnectionToServerWithPushTopic:",  *(void *)(*((void *)&v17 + 1) + 8LL * (void)i),  (void)v17);
        }

        BOOL v14 = v13;
        id v10 = [v8 countByEnumeratingWithState:&v17 objects:v22 count:16];
      }

      while (v10);
    }

    else
    {
      BOOL v14 = 1;
    }
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    id v8 = (id)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v8,  OS_LOG_TYPE_DEFAULT,  "Device needs to register; we will not sync with TSM",
        buf,
        2u);
    }

    BOOL v14 = 0;
  }

  return v14;
}

- (void)didDownloadPaymentPass:(id)a3
{
  id v4 = a3;
  id v5 = PDDefaultQueue();
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v5);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100035074;
  block[3] = &unk_1006392B0;
  void block[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_sync(v6, block);
}

- (id)paymentPasses
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PDDatabaseManager passesOfType:](self->_databaseManager, "passesOfType:", 1LL));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 allObjects]);

  return v3;
}

- (void)deviceStateWithCompletion:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v23 = v3;
    uint64_t v39 = 0LL;
    id v40 = &v39;
    uint64_t v41 = 0x3032000000LL;
    id v42 = sub_100033010;
    v43 = sub_100033020;
    id v44 = objc_alloc_init(&OBJC_CLASS___PKSecureElementConsistencyCheckDeviceState);
    id v4 = (void *)v40[5];
    id v5 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager deviceSpecificPaymentApplications]( self->_databaseManager,  "deviceSpecificPaymentApplications"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 allObjects]);
    [v4 setDevicePaymentApplications:v6];

    id v27 = (void *)objc_claimAutoreleasedReturnValue(-[PKSecureElement secureElementIdentifiers](self->_secureElement, "secureElementIdentifiers"));
    id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    __int128 v36 = 0u;
    __int128 v35 = 0u;
    id v8 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager passesWithISO18013Credentials]( self->_databaseManager,  "passesWithISO18013Credentials"));
    id v9 = [v8 countByEnumeratingWithState:&v35 objects:v46 count:16];
    if (v9)
    {
      id obj = v8;
      uint64_t v26 = *(void *)v36;
      do
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v36 != v26) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*((void *)&v35 + 1) + 8 * (void)i),  "iso18013BlobsForSecureElementIdentifiers:",  v27,  v23));
          __int128 v33 = 0u;
          __int128 v34 = 0u;
          __int128 v31 = 0u;
          __int128 v32 = 0u;
          id v12 = v11;
          id v13 = [v12 countByEnumeratingWithState:&v31 objects:v45 count:16];
          if (v13)
          {
            uint64_t v14 = *(void *)v32;
            do
            {
              for (j = 0LL; j != v13; j = (char *)j + 1)
              {
                if (*(void *)v32 != v14) {
                  objc_enumerationMutation(v12);
                }
                int64_t v16 = *(void **)(*((void *)&v31 + 1) + 8LL * (void)j);
                __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:v16]);
                __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v17 SHA256Hash]);
                __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v16 identifier]);
                -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v18, v19);
              }

              id v13 = [v12 countByEnumeratingWithState:&v31 objects:v45 count:16];
            }

            while (v13);
          }
        }

        id v8 = obj;
        id v9 = [obj countByEnumeratingWithState:&v35 objects:v46 count:16];
      }

      while (v9);
    }

    if (-[NSMutableDictionary count](v7, "count"))
    {
      __int128 v20 = (void *)v40[5];
      id v21 = -[NSMutableDictionary copy](v7, "copy");
      [v20 setPassIsoBlobHashForCredentialIdentifier:v21];
    }

    sharingManager = self->_sharingManager;
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472LL;
    v28[2] = sub_100035460;
    v28[3] = &unk_10063B508;
    BOOL v30 = &v39;
    void v28[4] = self;
    id v29 = v23;
    -[PDSharingManager pendingCredentialsBeingProvisioned:](sharingManager, "pendingCredentialsBeingProvisioned:", v28);

    _Block_object_dispose(&v39, 8);
    id v3 = v23;
  }
}

- (void)scheduleConsistencyCheck:(id)a3 pluggedIn:(BOOL)a4 backoffLevel:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = PDDefaultQueue();
  uint64_t v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v10);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10003571C;
  v14[3] = &unk_10063B558;
  v14[4] = self;
  id v15 = v8;
  BOOL v17 = a4;
  id v16 = v9;
  id v12 = v9;
  id v13 = v8;
  dispatch_async(v11, v14);
}

- (BOOL)shouldStartConsistencyCheck
{
  int IsAvailable = PKSecureElementIsAvailable(self, a2);
  if (IsAvailable)
  {
    secureElement = self->_secureElement;
    if (secureElement) {
      LOBYTE(IsAvailable) = ((unint64_t)-[PKSecureElement ownershipStateForCurrentUser]( secureElement,  "ownershipStateForCurrentUser") & 0xFFFFFFFFFFFFFFFELL) == 2;
    }
    else {
      LOBYTE(IsAvailable) = 1;
    }
  }

  return IsAvailable;
}

- (void)handleRequestedActions:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v36 = a4;
  id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v38 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v42 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  v43 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  uint64_t v41 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v40 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v37 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v75 = 0u;
  __int128 v76 = 0u;
  __int128 v77 = 0u;
  __int128 v78 = 0u;
  id obj = v6;
  id v8 = [obj countByEnumeratingWithState:&v75 objects:v81 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v76;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v76 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v75 + 1) + 8LL * (void)i);
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 deviceCredential]);
        unsigned __int8 v13 = [v11 actions];
        id v14 = [v12 type];
        if (v14 == (id)2)
        {
          __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v12 isoProperties]);
          id v15 = (void *)objc_claimAutoreleasedReturnValue([v18 isoIdentifier]);

          if ((v13 & 8) != 0) {
            -[NSMutableArray safelyAddObject:](v43, "safelyAddObject:", v15);
          }
          if ((v13 & 0x10) != 0) {
            -[NSMutableArray safelyAddObject:](v41, "safelyAddObject:", v15);
          }
          if ((v13 & 0x20) != 0) {
            -[NSMutableArray safelyAddObject:](v40, "safelyAddObject:", v15);
          }
          if ((v13 & 0x40) != 0)
          {
            __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v11 address]);
            -[NSMutableArray safelyAddObject:](v37, "safelyAddObject:", v19);
          }

          goto LABEL_24;
        }

        if (v14 == (id)1)
        {
          BOOL v17 = (void *)objc_claimAutoreleasedReturnValue([v12 address]);
          id v15 = (void *)objc_claimAutoreleasedReturnValue([v17 subcredentialIdentifier]);

          if ((v13 & 4) != 0) {
            -[NSMutableArray safelyAddObject:](v38, "safelyAddObject:", v15);
          }
          if ((v13 & 8) != 0 && v15) {
            -[NSMutableSet addObject:](v42, "addObject:", v15);
          }
          goto LABEL_24;
        }

        if (!v14 && (v13 & 8) != 0)
        {
          id v15 = (void *)objc_claimAutoreleasedReturnValue([v12 address]);
          id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 appletIdentifier]);
          -[NSMutableArray safelyAddObject:](v7, "safelyAddObject:", v16);

LABEL_24:
        }
      }

      id v8 = [obj countByEnumeratingWithState:&v75 objects:v81 count:16];
    }

    while (v8);
  }

  id v20 = objc_alloc_init(&OBJC_CLASS___PKAsyncUnaryOperationComposer);
  v73[0] = 0LL;
  v73[1] = v73;
  v73[2] = 0x2020000000LL;
  char v74 = 1;
  if (-[NSMutableArray count](v7, "count"))
  {
    v70[0] = _NSConcreteStackBlock;
    v70[1] = 3221225472LL;
    v70[2] = sub_10003611C;
    v70[3] = &unk_10063B5A8;
    v70[4] = self;
    v71 = v7;
    v72 = v73;
    [v20 addOperation:v70];
  }

  __int128 v34 = v7;
  __int128 v68 = 0u;
  __int128 v69 = 0u;
  __int128 v66 = 0u;
  __int128 v67 = 0u;
  id v21 = v38;
  id v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v21,  "countByEnumeratingWithState:objects:count:",  &v66,  v80,  16LL);
  if (v22)
  {
    uint64_t v23 = *(void *)v67;
    do
    {
      for (j = 0LL; j != v22; j = (char *)j + 1)
      {
        if (*(void *)v67 != v23) {
          objc_enumerationMutation(v21);
        }
        uint64_t v25 = *(void *)(*((void *)&v66 + 1) + 8LL * (void)j);
        v65[0] = _NSConcreteStackBlock;
        v65[1] = 3221225472LL;
        v65[2] = sub_100036208;
        v65[3] = &unk_10063B5A8;
        v65[4] = self;
        v65[5] = v25;
        v65[6] = v73;
        objc_msgSend(v20, "addOperation:", v65, v34, v36);
      }

      id v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v21,  "countByEnumeratingWithState:objects:count:",  &v66,  v80,  16LL);
    }

    while (v22);
  }

  if (-[NSMutableSet count](v42, "count"))
  {
    v62[0] = _NSConcreteStackBlock;
    v62[1] = 3221225472LL;
    v62[2] = sub_100036304;
    v62[3] = &unk_10063B5A8;
    v62[4] = self;
    v63 = v42;
    v64 = v73;
    [v20 addOperation:v62];
  }

  if (-[NSMutableArray count](v43, "count", v34))
  {
    v59[0] = _NSConcreteStackBlock;
    v59[1] = 3221225472LL;
    v59[2] = sub_10003645C;
    v59[3] = &unk_10063B5A8;
    v59[4] = self;
    id v60 = v43;
    objc_super v61 = v73;
    [v20 addOperation:v59];
  }

  if (-[NSMutableArray count](v41, "count"))
  {
    v56[0] = _NSConcreteStackBlock;
    v56[1] = 3221225472LL;
    v56[2] = sub_10003654C;
    v56[3] = &unk_10063B5A8;
    v56[4] = self;
    id v57 = v41;
    id v58 = v73;
    [v20 addOperation:v56];
  }

  if (-[NSMutableArray count](v40, "count"))
  {
    v53[0] = _NSConcreteStackBlock;
    v53[1] = 3221225472LL;
    v53[2] = sub_10003663C;
    v53[3] = &unk_10063B5A8;
    v53[4] = self;
    id v54 = v40;
    id v55 = v73;
    [v20 addOperation:v53];
  }

  uint64_t v39 = v21;
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  uint64_t v26 = v37;
  id v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v26,  "countByEnumeratingWithState:objects:count:",  &v49,  v79,  16LL);
  if (v27)
  {
    uint64_t v28 = *(void *)v50;
    do
    {
      for (k = 0LL; k != v27; k = (char *)k + 1)
      {
        if (*(void *)v50 != v28) {
          objc_enumerationMutation(v26);
        }
        uint64_t v30 = *(void *)(*((void *)&v49 + 1) + 8LL * (void)k);
        v48[0] = _NSConcreteStackBlock;
        v48[1] = 3221225472LL;
        v48[2] = sub_10003672C;
        v48[3] = &unk_10063B5A8;
        v48[4] = self;
        v48[5] = v30;
        v48[6] = v73;
        [v20 addOperation:v48];
      }

      id v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v26,  "countByEnumeratingWithState:objects:count:",  &v49,  v79,  16LL);
    }

    while (v27);
  }

  __int128 v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472LL;
  v45[2] = sub_100036930;
  v45[3] = &unk_100639778;
  id v32 = v36;
  id v46 = v32;
  v47 = v73;
  id v33 = [v20 evaluateWithInput:v31 completion:v45];

  _Block_object_dispose(v73, 8);
}

- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t Object = PKLogFacilityTypeGetObject(6LL);
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Handling Scheduled Activity: %@", buf, 0xCu);
  }

  if ([v6 isEqualToString:@"ConsistencyCheck"])
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[PDAssertionManager assertionsOfType:](self->_assertionManager, "assertionsOfType:", 1LL));
    id v11 = [v10 count];

    if (v11)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Provisioning is in progress, rescheduling consistency check…",  buf,  2u);
      }

      id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  120.0));
      -[PDPaymentWebServiceCoordinator scheduleConsistencyCheck:pluggedIn:backoffLevel:]( self,  "scheduleConsistencyCheck:pluggedIn:backoffLevel:",  v12,  0LL,  0LL);
    }

    else
    {
      -[PDPaymentWebServiceCoordinator performConsistencyCheck](self, "performConsistencyCheck");
    }
  }

  else if ([v6 hasPrefix:@"VASTransactionProcessor."])
  {
    unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "substringFromIndex:", objc_msgSend(@"VASTransactionProcessor.", "length")));
    id v14 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager valueAddedServiceTransactionWithIdentifier:]( self->_databaseManager,  "valueAddedServiceTransactionWithIdentifier:",  v13));
    if (v14)
    {
      -[PDPaymentWebServiceCoordinator _processValueAddedServiceTransaction:]( self,  "_processValueAddedServiceTransaction:",  v14);
    }

    else
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Couldn't find VAS Transaction in our database",  buf,  2u);
      }
    }
  }

  else if ([v6 isEqualToString:@"DeviceCheckIn"])
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "passd requesting device check in from scheduled activity",  buf,  2u);
    }

    sharedWebServiceQueue = self->_sharedWebServiceQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100036C5C;
    block[3] = &unk_100639300;
    void block[4] = self;
    dispatch_async((dispatch_queue_t)sharedWebServiceQueue, block);
  }

  else if ([v6 isEqualToString:@"DeviceUpgradeTasks"])
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "passd starting device upgrade tasks from scheduled activity",  buf,  2u);
    }

    -[PDPaymentWebServiceCoordinator _runDeviceUpgradeTasks](self, "_runDeviceUpgradeTasks");
  }
}

- (void)_processValueAddedServiceTransaction:(id)a3
{
  id v4 = a3;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100036D18;
  v7[3] = &unk_10063B688;
  id v8 = [[PKValueAddedServiceWebService alloc] initWithValueAddedServiceTransaction:v4];
  id v9 = v4;
  id v10 = self;
  id v5 = v4;
  id v6 = v8;
  [v6 downloadMerchantPayloadWithCompletion:v7];
}

- (void)_performNotificationActionWithUserInfo:(id)a3
{
  id v4 = a3;
  sharedWebServiceQueue = self->_sharedWebServiceQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100037064;
  v7[3] = &unk_1006392B0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)sharedWebServiceQueue, v7);
}

- (id)_userNotificationFromResponse:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 aps]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"alert"]);

  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSDictionary, v6);
  if ((objc_opt_isKindOfClass(v5, v7) & 1) != 0)
  {
    id v9 = (NSString *)objc_claimAutoreleasedReturnValue([v5 PKStringForKey:@"loc-key"]);
    id v10 = v9;
    if (v9)
    {
      uint64_t v11 = PKLocalizedString(v9);
      id v12 = (id)objc_claimAutoreleasedReturnValue(v11);
      if (![v12 isEqualToString:v10])
      {
LABEL_8:

        goto LABEL_12;
      }

      uint64_t Object = PKLogFacilityTypeGetObject(6LL);
      id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Did not find a localized key for this string not showing the message",  buf,  2u);
      }
    }

    id v12 = 0LL;
    goto LABEL_8;
  }

  uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSString, v8);
  if ((objc_opt_isKindOfClass(v5, v15) & 1) != 0) {
    id v12 = v5;
  }
  else {
    id v12 = 0LL;
  }
LABEL_12:
  if ([v12 length])
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v3 requestID]);
    if ([v16 length])
    {
      BOOL v17 = (void *)objc_claimAutoreleasedReturnValue([v3 action]);
      if ([v17 isEqualToString:PKNotificationActionOpenIDMSCardOnFile])
      {
        id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/%@",  PKURLActionPaymentSetupIDMSCardOnFile,  v16));
        __int128 v19 = -[PDGenericUserNotification initWithMessage:]( objc_alloc(&OBJC_CLASS___PDWalletUserNotification),  "initWithMessage:",  v12);
        id v20 = v19;
        if (v18) {
          -[PDUserNotification setCustomActionRoute:](v19, "setCustomActionRoute:", v18);
        }
      }

      else
      {
        uint64_t v24 = PKLogFacilityTypeGetObject(6LL);
        id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v3 action]);
          uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v3 requestID]);
          *(_DWORD *)buf = 138412546;
          id v29 = v25;
          __int16 v30 = 2112;
          __int128 v31 = v26;
          _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Unsupported action found:%@ for requestID:%@",  buf,  0x16u);
        }

        id v20 = 0LL;
      }
    }

    else
    {
      uint64_t v23 = PKLogFacilityTypeGetObject(6LL);
      BOOL v17 = (void *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v17,  OS_LOG_TYPE_DEFAULT,  "No requestID in response",  buf,  2u);
      }

      id v20 = 0LL;
    }
  }

  else
  {
    uint64_t v21 = PKLogFacilityTypeGetObject(6LL);
    id v16 = (void *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_DEFAULT))
    {
      id v22 = (void *)objc_claimAutoreleasedReturnValue([v3 requestID]);
      *(_DWORD *)buf = 138412290;
      id v29 = v22;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v16,  OS_LOG_TYPE_DEFAULT,  "No valid message found in response for requestID :%@",  buf,  0xCu);
    }

    id v20 = 0LL;
  }

  return v20;
}

- (void)_fetchPassesIfNecessaryForPushTopic:(id)a3
{
  id v4 = a3;
  sharedWebServiceQueue = self->_sharedWebServiceQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100037594;
  v7[3] = &unk_1006392B0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)sharedWebServiceQueue, v7);
}

- (void)_handleDownloadedPass:(id)a3
{
  id v4 = a3;
  id v5 = (void *)PDOSTransactionCreate("PDPaymentWebServiceCoordinator");
  id v6 = objc_autoreleasePoolPush();
  if ([v4 isIdentityPass]
    && (databaseManager = self->_databaseManager,
        id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueID]),
        LOBYTE(databaseManager) = -[PDDatabaseManager passExistsWithUniqueID:]( databaseManager,  "passExistsWithUniqueID:",  v8),  v8,  (databaseManager & 1) == 0))
  {
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueID]);
      *(_DWORD *)buf = 138412290;
      id v18 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Removing stale pass %@", buf, 0xCu);
    }

    id v12 = [[PKPaymentDeprovisionRequest alloc] initWithPaymentPass:v4];
    unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue(-[PDPaymentWebServiceCoordinator sharedWebService](self, "sharedWebService"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100037B3C;
    v15[3] = &unk_10063AFE8;
    id v16 = v12;
    id v14 = v12;
    [v13 diagnosticSessionWithReason:@"pass previously deleted" sessionHandler:v15];
  }

  else
  {
    -[PDCardFileManager writeCard:source:error:](self->_passStore, "writeCard:source:error:", v4, 1LL, 0LL);
  }

  objc_autoreleasePoolPop(v6);
}

- (void)_queue_setupBackgroundWebServiceWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = PKBackgroundWebServiceContextPath();
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v8 = (id)objc_claimAutoreleasedReturnValue( +[PKPaymentWebServiceBackgroundContext contextWithArchive:]( &OBJC_CLASS___PKPaymentWebServiceBackgroundContext,  "contextWithArchive:",  v6));

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDPaymentWebServiceCoordinator sharedWebService](self, "sharedWebService"));
  [v7 startBackgroundURLSessionWithIdentifier:@"com.apple.passd" context:v8 backgroundDelegate:self completion:v4];
}

- (void)noteAccountChanged
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[PDPaymentWebServiceCoordinator sharedWebService](self, "sharedWebService"));
  [v2 _resetSupportInRegionCache];
}

- (void)noteWebServiceDidChange
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_100037C5C;
  v2[3] = &unk_10063B0B0;
  v2[4] = self;
  -[PDPaymentWebServiceCoordinator _accessObserversWithHandler:](self, "_accessObserversWithHandler:", v2);
}

- (void)_queue_recreateCloudStoreTransactionZoneWithCompletion:(id)a3
{
}

- (void)_queue_provisionPushProvisioningSharingIdentifiers
{
  p_pushProvisioningManager = &self->_pushProvisioningManager;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pushProvisioningManager);

  if (WeakRetained)
  {
    id v4 = objc_loadWeakRetained((id *)p_pushProvisioningManager);
    [v4 provisionAvailablePushProvisioningSharingIdentifiers];
  }

- (void)_queue_performOwnershipTokensRequestWithUserInfo:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKey:@"reason"]);
  uint64_t v5 = PKPaymentSendOwnershipTokensRequestReasonFromString();

  id v6 = (id)objc_claimAutoreleasedReturnValue(-[PDPaymentWebServiceCoordinator sharedWebService](self, "sharedWebService"));
  [v6 sendOwnershipTokensForReason:v5 completion:&stru_10063B6F8];
}

- (void)checkSafariCredentialEligibility:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = PDDefaultQueue();
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100037F20;
  block[3] = &unk_100639AF0;
  void block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);
}

- (void)scheduleDeviceUpgradeTasksIfNecessary
{
}

- (void)scheduleDeviceUpgradeTasksIfNecessaryWithRandomizeStartDate:(BOOL)a3
{
  sharedWebServiceQueue = self->_sharedWebServiceQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100037F98;
  v4[3] = &unk_10063B720;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async((dispatch_queue_t)sharedWebServiceQueue, v4);
}

- (void)_scheduleDeviceUpgradeTaskActivityWithRandomizeStartDate:(BOOL)a3
{
  id v5 = PDDefaultQueue();
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v5);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000382A0;
  v7[3] = &unk_10063B720;
  void v7[4] = self;
  BOOL v8 = a3;
  dispatch_async(v6, v7);
}

- (void)unscheduleDeviceUpgradeTaskActivity
{
  id v3 = PDDefaultQueue();
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v3);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100038524;
  block[3] = &unk_100639300;
  void block[4] = self;
  dispatch_async(v4, block);
}

- (void)_queue_completeDeviceUpgradeTasks
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[PDPaymentWebServiceCoordinator sharedWebServiceContext](self, "sharedWebServiceContext"));
  [v3 atomicallyUpdatePrimaryRegion:&stru_10063B740];
  -[PDPaymentWebServiceArchiver archiveContext:](self->_archiver, "archiveContext:", v3);
  -[PDPaymentWebServiceCoordinator unscheduleDeviceUpgradeTaskActivity](self, "unscheduleDeviceUpgradeTaskActivity");
}

- (void)_runDeviceUpgradeTasks
{
  sharedWebServiceQueue = self->_sharedWebServiceQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000386B8;
  block[3] = &unk_100639300;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)sharedWebServiceQueue, block);
}

- (void)setDeviceUpgradeTasksContextBuildVersion:(id)a3 upgradeTaskVersion:(int64_t)a4 retryCount:(int64_t)a5
{
  id v8 = a3;
  sharedWebServiceQueue = self->_sharedWebServiceQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100039270;
  v11[3] = &unk_10063B858;
  int64_t v13 = a4;
  int64_t v14 = a5;
  void v11[4] = self;
  id v12 = v8;
  id v10 = v8;
  dispatch_async((dispatch_queue_t)sharedWebServiceQueue, v11);
}

- (void)_queue_performContactInformationFetchTaskWithCompletion:(id)a3
{
  id v3 = (void (**)(id, uint64_t))a3;
  uint64_t Object = PKLogFacilityTypeGetObject(6LL);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Platform doesn't support Core Recents, ignoring contact information update.",  v6,  2u);
  }

  v3[2](v3, 1LL);
}

- (void)receivedXPCEvent:(id)a3 forEventStream:(id)a4
{
}

- (PDApplyManager)applyManager
{
  return self->_applyManager;
}

- (PDCardFileManager)cardFileManager
{
  return self->_passStore;
}

- (PDDatabaseManager)databaseManager
{
  return self->_databaseManager;
}

- (PDAppletSubcredentialManager)subcredentialManager
{
  return (PDAppletSubcredentialManager *)objc_loadWeakRetained((id *)&self->_credentialManager);
}

- (PDExpressPassManager)expressPassManager
{
  return self->_expressPassManager;
}

- (PDPassUpgradeController)upgradeController
{
  return self->_upgradeController;
}

- (PDDeviceRegistrationServiceCoordinator)registrationCoordinator
{
  return self->_deviceRegistrationServiceCoordinator;
}

- (PDFamilyCircleManager)familyCircleManager
{
  return self->_familyCircleManager;
}

- (PDAccountManager)accountManager
{
  return self->_accountManager;
}

- (void)setApplyManager:(id)a3
{
}

- (PDAppletSubcredentialManager)credentialManager
{
  return (PDAppletSubcredentialManager *)objc_loadWeakRetained((id *)&self->_credentialManager);
}

- (void)setCredentialManager:(id)a3
{
}

- (PDPushProvisioningManager)pushProvisioningManager
{
  return (PDPushProvisioningManager *)objc_loadWeakRetained((id *)&self->_pushProvisioningManager);
}

- (void)setPushProvisioningManager:(id)a3
{
}

- (PDUserNotificationManager)userNotificationManager
{
  return (PDUserNotificationManager *)objc_loadWeakRetained((id *)&self->_userNotificationManager);
}

- (PDDiscoveryManager)discoveryManager
{
  return self->_discoveryManager;
}

- (void)setDiscoveryManager:(id)a3
{
}

- (PDPaymentSetupFeaturesCoordinator)paymentSetupFeaturesCoordinator
{
  return self->_paymentSetupFeaturesCoordinator;
}

- (void)setPaymentSetupFeaturesCoordinator:(id)a3
{
}

- (PDDeviceRegistrationServiceCoordinator)deviceRegistrationServiceCoordinator
{
  return self->_deviceRegistrationServiceCoordinator;
}

- (void)setDeviceRegistrationServiceCoordinator:(id)a3
{
}

- (PDDefaultPassManager)defaultPassManager
{
  return self->_defaultPassManager;
}

- (void)setDefaultPassManager:(id)a3
{
}

- (PDDevicePasscodeManager)devicePasscodeManager
{
  return self->_devicePasscodeManager;
}

- (void)setDevicePasscodeManager:(id)a3
{
}

- (PDPeerPaymentWebServiceCoordinator)peerPaymentWebServiceCoordinator
{
  return self->_peerPaymentWebServiceCoordinator;
}

- (void)setPeerPaymentWebServiceCoordinator:(id)a3
{
}

- (PDISO18013Manager)isoManager
{
  return self->_isoManager;
}

- (void)setIsoManager:(id)a3
{
}

- (PDPendingProvisioningManager)pendingProvisioningManager
{
  return self->_pendingProvisioningManager;
}

- (void)setPendingProvisioningManager:(id)a3
{
}

- (PDSharingManager)sharingManager
{
  return self->_sharingManager;
}

- (void)setSharingManager:(id)a3
{
}

- (PDProvisioningRequirementsChecker)provisioningRequirementsChecker
{
  return self->_provisioningRequirementsChecker;
}

- (void)setProvisioningRequirementsChecker:(id)a3
{
}

- (PDAssertionManager)assertionManager
{
  return self->_assertionManager;
}

- (void)setAssertionManager:(id)a3
{
}

- (PDAuxiliaryCapabilityManager)auxiliaryCapabilityManager
{
  return self->_auxiliaryCapabilityManager;
}

- (void)setAuxiliaryCapabilityManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end