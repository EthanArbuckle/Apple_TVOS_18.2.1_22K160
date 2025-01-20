@interface PDPeerPaymentWebServiceCoordinator
- (BOOL)_hasAssociatedPeerPaymentPass;
- (BOOL)_hasAssociatedPeerPaymentPassSetup;
- (BOOL)_peerPaymentPassExists;
- (BOOL)_shouldAttemptBackgroundPeerPaymentPassDownload;
- (PDCloudStoreNotificationCoordinator)cloudStoreNotificationCoordinator;
- (PDDeviceRegistrationServiceCoordinator)deviceRegistrationCoordinator;
- (PDPeerPaymentWebServiceCoordinator)initWithPushNotificationManager:(id)a3 paymentWebService:(id)a4 assertionManager:(id)a5 userNotificationManager:(id)a6 sharingIDSManager:(id)a7 familyCircleManager:(id)a8 dataSource:(id)a9 passStore:(id)a10 tapToRadarDelegate:(id)a11;
- (PKPaymentWebService)paymentWebService;
- (PKPeerPaymentWebService)sharedPeerPaymentWebService;
- (id)_altDSIDFromAssociatedAccountRemoteRegistrationActivityIdentifier:(id)a3;
- (id)_associatedAccountRemoteRegistrationActivityIdentifierForAltDSID:(id)a3;
- (id)_mockAccountInitialState;
- (id)pushNotificationTopics;
- (unint64_t)_peerPaymentErrorStateForRegistrationResponse:(id)a3 error:(id)a4 expectsPass:(BOOL)a5;
- (void)_accessObserversWithHandler:(id)a3;
- (void)_archiveSharedPeerPaymentWebServiceContext;
- (void)_cancelPendingTransactionNotifications;
- (void)_completeUpdatingPreferences;
- (void)_downloadAssociatedPeerPaymentPassWithCompletion:(id)a3;
- (void)_handleUpdatedAccount:(id)a3 withOldAccount:(id)a4;
- (void)_initalizeCloudStoreIfNecessaryWithCompletion:(id)a3;
- (void)_performPeerPaymentAssociatedAccountRemoteRegistrationRequestWithActivityIdentifier:(id)a3 reason:(id)a4;
- (void)_performPeerPaymentPassDownloadActivity;
- (void)_performPeerPaymentReregisterActivityForReason:(id)a3;
- (void)_postAccountChangedNotification;
- (void)_postAssociatedAccountActiveNotificationIfNecessaryForNewAssociatedAccountInformation:(id)a3 oldAssociatedAccountInformation:(id)a4;
- (void)_postGraduationNotificationIfNecessary;
- (void)_processStaleAccountFetchAfterTranactionScheduledTask:(id)a3;
- (void)_queue_addAccountFetchRequest:(id)a3;
- (void)_queue_executeNextAccountFetchRequestIfPossible;
- (void)_queue_processRegistrationResponse:(id)a3 registrationError:(id)a4 previouslyRegistered:(BOOL)a5 abridgedRegistration:(BOOL)a6 completion:(id)a7;
- (void)_removeUpcomingPaymentNotificationForRecurringPaymentIdentifier:(id)a3;
- (void)_scheduleAssociatedAccountRemoteRegistrationActivityIfNecessaryForReason:(unint64_t)a3;
- (void)_scheduleOrRemoveNotificationsForRecurringPayment:(id)a3;
- (void)_schedulePeerPaymentCoordinatorActivities;
- (void)_schedulePeerPaymentReregisterActivityForReason:(id)a3;
- (void)_updateAccountFromPush:(BOOL)a3 diagnosticReasons:(id)a4 abridgedRegistration:(BOOL)a5 completion:(id)a6;
- (void)_updateAccountWithRequest:(id)a3 completion:(id)a4;
- (void)_updateAssociatedAccountsFromPush:(BOOL)a3 diagnosticReasons:(id)a4 abridgedRegistration:(BOOL)a5 completion:(id)a6;
- (void)_updateEncryptionCertificateIfNeededForDestination:(unint64_t)a3 expectedVersion:(int64_t)a4 forceUpdate:(BOOL)a5 completion:(id)a6;
- (void)_updateEncryptionCertificatesIfNeededWithAccount:(id)a3;
- (void)_updatePreferencesWithCompletion:(id)a3;
- (void)_updatePushTopics;
- (void)_updateSharedCacheWithAccount:(id)a3;
- (void)_updateSharedCacheWithWebService:(id)a3;
- (void)_writePreferences:(id)a3 withError:(id)a4;
- (void)accountWithPreventingServerFetch:(BOOL)a3 completion:(id)a4;
- (void)applyPushNotificationToken:(id)a3;
- (void)checkTLKsMissingWithCompletion:(id)a3;
- (void)cloudStoreNotificationCoordinator:(id)a3 createdZoneWithName:(id)a4 forContainerName:(id)a5 scope:(int64_t)a6;
- (void)cloudStoreStatusWithCompletion:(id)a3;
- (void)dealloc;
- (void)deleteAccountWithCompletion:(id)a3;
- (void)deletePreferencesWithCompletion:(id)a3;
- (void)deleteSharedWebServiceWithDiagnosticReason:(id)a3;
- (void)didReceiveRemoteRegistationResult:(unint64_t)a3 fromDestination:(id)a4;
- (void)downloadPassIfNecessaryWithCompletion:(id)a3;
- (void)encryptData:(id)a3 usingCertificateWithDestination:(unint64_t)a4 completion:(id)a5;
- (void)encryptionCertificateForDestination:(unint64_t)a3 forceUpdate:(BOOL)a4 completion:(id)a5;
- (void)handleCompanionSerialNumberChanged;
- (void)handleMigratedAccount:(id)a3;
- (void)handlePassLibraryChangedWithPassUniqueIdentifier:(id)a3;
- (void)handlePushNotificationForTopic:(id)a3 userInfo:(id)a4;
- (void)identityVerificationResponseWithCompletion:(id)a3;
- (void)initalizeCloudStoreIfNecessaryWithHandler:(id)a3;
- (void)peerPaymentPendingRequestsForRequests:(id)a3 completion:(id)a4;
- (void)performDeviceRegistrationWithRegistrationURL:(id)a3 pushToken:(id)a4 forceReregister:(BOOL)a5 abridgedRegistration:(BOOL)a6 completion:(id)a7;
- (void)performRecurringPaymentAction:(unint64_t)a3 identifier:(id)a4 completion:(id)a5;
- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4;
- (void)preferencesWithCompletion:(id)a3;
- (void)receivedPeerPaymentMessage:(id)a3;
- (void)recurringPaymentsWithPreventingServerFetch:(BOOL)a3 completion:(id)a4;
- (void)registerDeviceWithForceReregister:(BOOL)a3 reason:(id)a4 completion:(id)a5;
- (void)registerDeviceWithReason:(id)a3 completion:(id)a4;
- (void)registerDeviceWithRegistrationURL:(id)a3 pushToken:(id)a4 forceReregister:(BOOL)a5 completion:(id)a6;
- (void)registerDeviceWithRegistrationURL:(id)a3 pushToken:(id)a4 forceReregister:(BOOL)a5 reason:(id)a6 completion:(id)a7;
- (void)registerDeviceWithRegistrationURL:(id)a3 pushToken:(id)a4 reason:(id)a5 completion:(id)a6;
- (void)registerObserver:(id)a3;
- (void)registrationStatusWithCompletion:(id)a3;
- (void)remoteRegistrationRequest:(id)a3 forHandle:(id)a4 completion:(id)a5;
- (void)reportFailureDiagnostic:(id)a3 completion:(id)a4;
- (void)resetApplePayManateeViewWithCompletion:(id)a3;
- (void)scheduleTaskToFetchStaleAccountIfNecessary:(BOOL)a3 associatedAccountEndpoint:(BOOL)a4;
- (void)setCloudStoreNotificationCoordinator:(id)a3;
- (void)setDeviceRegistrationCoordinator:(id)a3;
- (void)setPaymentWebService:(id)a3;
- (void)setPreferences:(id)a3 completion:(id)a4;
- (void)submitDeviceScoreIdentifiersForTransaction:(id)a3 completion:(id)a4;
- (void)unregisterDeviceWithCompletion:(id)a3;
- (void)unregisterObserver:(id)a3;
- (void)updateAccountAndAssociatedAccountsWithCompletion:(id)a3;
- (void)updateAccountAndAssociatedAccountsWithDiagnosticReasons:(id)a3 abridgedRegistration:(BOOL)a4 completion:(id)a5;
- (void)updateAccountAndAssociatedAccountsWithDiagnosticReasons:(id)a3 completion:(id)a4;
- (void)updateAccountWithCompletion:(id)a3;
- (void)updateAccountWithDiagnosticReasons:(id)a3 abridgedRegistration:(BOOL)a4 completion:(id)a5;
- (void)updateAccountWithDiagnosticReasons:(id)a3 completion:(id)a4;
- (void)updateAssociatedAccountsWithCompletion:(id)a3;
- (void)updateAssociatedAccountsWithDiagnosticReasons:(id)a3 abridgedRegistration:(BOOL)a4 completion:(id)a5;
- (void)updateAssociatedAccountsWithDiagnosticReasons:(id)a3 completion:(id)a4;
- (void)updateMockAccountBalanceByAddingAmount:(id)a3 completion:(id)a4;
- (void)updatePendingRequestsWithRequestTokens:(id)a3;
- (void)updateRecurringPaymentsWithCompletion:(id)a3;
- (void)updateSharedCache;
- (void)updateSharedWebServiceContext:(id)a3;
@end

@implementation PDPeerPaymentWebServiceCoordinator

- (PDPeerPaymentWebServiceCoordinator)initWithPushNotificationManager:(id)a3 paymentWebService:(id)a4 assertionManager:(id)a5 userNotificationManager:(id)a6 sharingIDSManager:(id)a7 familyCircleManager:(id)a8 dataSource:(id)a9 passStore:(id)a10 tapToRadarDelegate:(id)a11
{
  id v78 = a3;
  id v77 = a4;
  id v76 = a5;
  id v75 = a6;
  id v74 = a7;
  id obj = a8;
  id v73 = a8;
  id v18 = a9;
  id v19 = a10;
  id v72 = a11;
  v86.receiver = self;
  v86.super_class = (Class)&OBJC_CLASS___PDPeerPaymentWebServiceCoordinator;
  v20 = -[PDPeerPaymentWebServiceCoordinator init](&v86, "init");
  if (!v20) {
    goto LABEL_21;
  }
  dispatch_queue_attr_t v21 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v22 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v21);
  dispatch_queue_t v23 = dispatch_queue_create("sharedPeerPaymentWebServiceQueue", v22);
  sharedPeerPaymentWebServiceQueue = v20->_sharedPeerPaymentWebServiceQueue;
  v20->_sharedPeerPaymentWebServiceQueue = (OS_dispatch_queue *)v23;

  dispatch_queue_t v25 = dispatch_queue_create("sharedPeerPaymentWebServiceQueue.replyQueue", v22);
  replyQueue = v20->_replyQueue;
  v20->_replyQueue = (OS_dispatch_queue *)v25;

  v27 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  pendingPreferencesFetches = v20->_pendingPreferencesFetches;
  v20->_pendingPreferencesFetches = v27;

  v29 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  queuedPendingPreferencesFetches = v20->_queuedPendingPreferencesFetches;
  v20->_queuedPendingPreferencesFetches = v29;

  v31 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  accountFetchRequests = v20->_accountFetchRequests;
  v20->_accountFetchRequests = v31;

  objc_storeWeak((id *)&v20->_dataSource, v18);
  objc_storeWeak((id *)&v20->_passStore, v19);
  objc_storeStrong((id *)&v20->_assertionManager, a5);
  objc_storeStrong((id *)&v20->_paymentWebService, a4);
  objc_storeStrong((id *)&v20->_pushNotificationManager, a3);
  objc_storeStrong((id *)&v20->_userNotificationManager, a6);
  objc_storeStrong((id *)&v20->_tapToRadarDelegate, a11);
  objc_storeStrong((id *)&v20->_sharingIDSManager, a7);
  -[PKSharingIDSManager addDelegate:](v20->_sharingIDSManager, "addDelegate:", v20);
  objc_storeStrong((id *)&v20->_familyCircleManager, obj);
  uint64_t v33 = PKSharedPeerPaymentWebServiceContextPath();
  v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
  v35 = (void *)objc_claimAutoreleasedReturnValue( +[PKPeerPaymentWebServiceContext contextWithArchive:]( &OBJC_CLASS___PKPeerPaymentWebServiceContext,  "contextWithArchive:",  v34));

  v36 = -[PDPeerPaymentWebServiceArchiver initWithQueue:]( objc_alloc(&OBJC_CLASS___PDPeerPaymentWebServiceArchiver),  "initWithQueue:",  v20->_sharedPeerPaymentWebServiceQueue);
  archiver = v20->_archiver;
  v20->_archiver = v36;

  v38 = objc_alloc(&OBJC_CLASS___PKPeerPaymentWebService);
  id v39 = [[PKPeerPaymentWebServiceTargetDevice alloc] initWithTargetDeviceDelegate:v20];
  v40 = -[PKPeerPaymentWebService initWithContext:targetDevice:archiver:]( v38,  "initWithContext:targetDevice:archiver:",  v35,  v39,  v20->_archiver);
  sharedPeerPaymentWebService = v20->_sharedPeerPaymentWebService;
  v20->_sharedPeerPaymentWebService = v40;

  -[PDPeerPaymentWebServiceCoordinator _updateSharedCacheWithWebService:]( v20,  "_updateSharedCacheWithWebService:",  v20->_sharedPeerPaymentWebService);
  id v42 = -[PKPeerPaymentWebService needsRegistration](v20->_sharedPeerPaymentWebService, "needsRegistration");
  if ((v42 & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&v20->_dataSource);
    uint64_t v45 = objc_claimAutoreleasedReturnValue([WeakRetained peerPaymentAccount]);
    account = v20->_account;
    v20->_account = (PKPeerPaymentAccount *)v45;

    id v47 = objc_loadWeakRetained((id *)&v20->_dataSource);
    uint64_t v48 = objc_claimAutoreleasedReturnValue([v47 peerPaymentPreferences]);
    preferences = v20->_preferences;
    v20->_preferences = (PKPeerPaymentPreferences *)v48;

    v50 = v20->_account;
    if (v50)
    {
      v51 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentAccount identifier](v50, "identifier"));

      if (!v51)
      {
        uint64_t Object = PKLogFacilityTypeGetObject(11LL);
        v59 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
        if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v59,  OS_LOG_TYPE_DEFAULT,  "The doesnt have the identifier defined on the peer payment account. Updating now.",  buf,  2u);
        }

        v60 = (void *)objc_claimAutoreleasedReturnValue( +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  @"CashReasonNoAccountIdentifier"));
        v83[0] = _NSConcreteStackBlock;
        v83[1] = 3221225472LL;
        v83[2] = sub_1003C1D38;
        v83[3] = &unk_10065BA20;
        v84 = v20;
        -[PDPeerPaymentWebServiceCoordinator updateAccountWithDiagnosticReasons:completion:]( v84,  "updateAccountWithDiagnosticReasons:completion:",  v60,  v83);

        v57 = v84;
        goto LABEL_16;
      }

      if (v20->_account)
      {
        if (!v20->_preferences)
        {
          uint64_t v52 = PKLogFacilityTypeGetObject(11LL);
          v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
          if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_DEFAULT,  "The user is registered for peer payment but does not have any preferences. Fetching preferences now.",  buf,  2u);
          }

          id v42 = -[PDPeerPaymentWebServiceCoordinator updatePreferencesWithCompletion:]( v20,  "updatePreferencesWithCompletion:",  0LL);
        }

        goto LABEL_17;
      }
    }

    uint64_t v54 = PKLogFacilityTypeGetObject(11LL);
    v55 = (os_log_s *)objc_claimAutoreleasedReturnValue(v54);
    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v55,  OS_LOG_TYPE_DEFAULT,  "The user is registered for peer payment but does not have an account. Fetching account now.",  buf,  2u);
    }

    v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", @"CashReasonMissingAccount"));
    v81[0] = _NSConcreteStackBlock;
    v81[1] = 3221225472LL;
    v81[2] = sub_1003C1DBC;
    v81[3] = &unk_10065BA20;
    v82 = v20;
    -[PDPeerPaymentWebServiceCoordinator updateAccountAndAssociatedAccountsWithDiagnosticReasons:completion:]( v82,  "updateAccountAndAssociatedAccountsWithDiagnosticReasons:completion:",  v56,  v81);

    v57 = v82;
LABEL_16:
  }

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter"));
  [v3 removeObserver:self name:PDSharedPeerPaymentWebServiceDidChangeNotification object:0];

  -[PKPeerPaymentWebService invalidate](self->_sharedPeerPaymentWebService, "invalidate");
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___PDPeerPaymentWebServiceCoordinator;
  -[PDPeerPaymentWebServiceCoordinator dealloc](&v4, "dealloc");
}

- (PKPeerPaymentWebService)sharedPeerPaymentWebService
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  v9 = sub_1003C2164;
  v10 = sub_1003C2174;
  id v11 = 0LL;
  sharedPeerPaymentWebServiceQueue = self->_sharedPeerPaymentWebServiceQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1003C217C;
  v5[3] = &unk_10063AA60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)sharedPeerPaymentWebServiceQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (PKPeerPaymentWebService *)v3;
}

- (void)deleteSharedWebServiceWithDiagnosticReason:(id)a3
{
  id v4 = a3;
  sharedPeerPaymentWebServiceQueue = self->_sharedPeerPaymentWebServiceQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1003C220C;
  block[3] = &unk_1006392B0;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)sharedPeerPaymentWebServiceQueue, block);
}

- (void)updateSharedWebServiceContext:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    sharedPeerPaymentWebServiceQueue = self->_sharedPeerPaymentWebServiceQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1003C2838;
    block[3] = &unk_1006392B0;
    void block[4] = self;
    id v11 = v4;
    dispatch_sync((dispatch_queue_t)sharedPeerPaymentWebServiceQueue, block);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(11LL);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Error: Refusing to update webservice context with nil.",  v9,  2u);
    }
  }
}

- (void)accountWithPreventingServerFetch:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  v7 = v6;
  if (v6)
  {
    sharedPeerPaymentWebServiceQueue = self->_sharedPeerPaymentWebServiceQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1003C2994;
    block[3] = &unk_100641500;
    void block[4] = self;
    id v10 = v6;
    BOOL v11 = a3;
    dispatch_async((dispatch_queue_t)sharedPeerPaymentWebServiceQueue, block);
  }
}

- (void)preferencesWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    sharedPeerPaymentWebServiceQueue = self->_sharedPeerPaymentWebServiceQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1003C2C94;
    v7[3] = &unk_1006396B0;
    v7[4] = self;
    id v8 = v4;
    dispatch_async((dispatch_queue_t)sharedPeerPaymentWebServiceQueue, v7);
  }
}

- (void)handlePassLibraryChangedWithPassUniqueIdentifier:(id)a3
{
  if (a3)
  {
    account = self->_account;
    if (account)
    {
      id v5 = a3;
      id v10 = (id)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentAccount associatedPassUniqueID](account, "associatedPassUniqueID"));
      unsigned int v6 = [v10 isEqualToString:v5];

      if (v6)
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
        id v8 = (PKPeerPaymentAccount *)objc_claimAutoreleasedReturnValue([WeakRetained insertOrUpdatePeerPaymentAccount:self->_account]);
        v9 = self->_account;
        self->_account = v8;
      }
    }
  }

- (void)receivedPeerPaymentMessage:(id)a3
{
  id v4 = a3;
  if (-[PKPeerPaymentAccount stage](self->_account, "stage") != (id)1) {
    goto LABEL_4;
  }
  uint64_t v5 = (uint64_t)-[PKPeerPaymentAccount pendingPaymentCount](self->_account, "pendingPaymentCount");
  if (v5)
  {
    if (v5 >= 2) {
LABEL_4:
    }
      PKSharedCacheSetObjectForKey(0LL, PKSharedCachePeerPaymentPendingPaymentSenderAddressKey);
  }

  else if ([v4 hasSenderAddress])
  {
    uint64_t Object = PKLogFacilityTypeGetObject(11LL);
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Caching sender address as a pending payment",  v9,  2u);
    }

    id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 senderAddress]);
    PKSharedCacheSetObjectForKey(v8, PKSharedCachePeerPaymentPendingPaymentSenderAddressKey);
  }
}

- (void)identityVerificationResponseWithCompletion:(id)a3
{
  id v4 = a3;
  sharedPeerPaymentWebServiceQueue = self->_sharedPeerPaymentWebServiceQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1003C2F3C;
  v7[3] = &unk_1006396B0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)sharedPeerPaymentWebServiceQueue, v7);
}

- (void)registrationStatusWithCompletion:(id)a3
{
  id v4 = a3;
  sharedPeerPaymentWebServiceQueue = self->_sharedPeerPaymentWebServiceQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1003C3040;
  v7[3] = &unk_1006396B0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)sharedPeerPaymentWebServiceQueue, v7);
}

- (void)handleCompanionSerialNumberChanged
{
  sharedPeerPaymentWebServiceQueue = self->_sharedPeerPaymentWebServiceQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1003C3280;
  block[3] = &unk_100639300;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)sharedPeerPaymentWebServiceQueue, block);
}

- (void)registerDeviceWithForceReregister:(BOOL)a3 reason:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t Object = PKLogFacilityTypeGetObject(11LL);
  BOOL v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = @"NO";
    if (v6) {
      v12 = @"YES";
    }
    int v22 = 138412290;
    dispatch_queue_t v23 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Attempting to register with the peer payment service. Force Re-register %@",  (uint8_t *)&v22,  0xCu);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[PKPaymentWebService context](self->_paymentWebService, "context"));
  v14 = (__CFString *)objc_claimAutoreleasedReturnValue([v13 peerPaymentServiceURL]);

  uint64_t v15 = PKPeerPaymentServiceOverrideURL();
  v16 = (__CFString *)objc_claimAutoreleasedReturnValue(v15);
  if (v16)
  {
    uint64_t v17 = PKLogFacilityTypeGetObject(0LL);
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 138412290;
      dispatch_queue_t v23 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Using overriden peer payment service url '%@'",  (uint8_t *)&v22,  0xCu);
    }

    id v19 = v16;
    v14 = v19;
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[PKPaymentWebService context](self->_paymentWebService, "context"));
  dispatch_queue_attr_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 pushToken]);

  -[PDPeerPaymentWebServiceCoordinator registerDeviceWithRegistrationURL:pushToken:forceReregister:completion:]( self,  "registerDeviceWithRegistrationURL:pushToken:forceReregister:completion:",  v14,  v21,  v6,  v9);
}

- (void)registerDeviceWithReason:(id)a3 completion:(id)a4
{
}

- (void)registerDeviceWithRegistrationURL:(id)a3 pushToken:(id)a4 forceReregister:(BOOL)a5 completion:(id)a6
{
}

- (void)registerDeviceWithRegistrationURL:(id)a3 pushToken:(id)a4 reason:(id)a5 completion:(id)a6
{
}

- (void)registerDeviceWithRegistrationURL:(id)a3 pushToken:(id)a4 forceReregister:(BOOL)a5 reason:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  sharedPeerPaymentWebServiceQueue = self->_sharedPeerPaymentWebServiceQueue;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_1003C365C;
  v21[3] = &unk_10065BA70;
  BOOL v26 = a5;
  id v24 = v14;
  id v25 = v15;
  v21[4] = self;
  id v22 = v13;
  id v23 = v12;
  id v17 = v14;
  id v18 = v12;
  id v19 = v13;
  id v20 = v15;
  dispatch_async((dispatch_queue_t)sharedPeerPaymentWebServiceQueue, v21);
}

- (void)performDeviceRegistrationWithRegistrationURL:(id)a3 pushToken:(id)a4 forceReregister:(BOOL)a5 abridgedRegistration:(BOOL)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  sharedPeerPaymentWebServiceQueue = self->_sharedPeerPaymentWebServiceQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1003C39B0;
  block[3] = &unk_100647D68;
  id v20 = v12;
  id v21 = v13;
  BOOL v24 = a5;
  id v22 = self;
  id v23 = v14;
  BOOL v25 = a6;
  id v16 = v14;
  id v17 = v13;
  id v18 = v12;
  dispatch_async((dispatch_queue_t)sharedPeerPaymentWebServiceQueue, block);
}

- (void)_queue_processRegistrationResponse:(id)a3 registrationError:(id)a4 previouslyRegistered:(BOOL)a5 abridgedRegistration:(BOOL)a6 completion:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v13 domain]);
  unsigned int v16 = [v15 isEqualToString:PKDisplayableErrorDomain];

  if (v16)
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v13 userInfo]);
    uint64_t v18 = objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:NSUnderlyingErrorKey]);

    id v13 = (id)v18;
  }

  unint64_t v19 = -[PDPeerPaymentWebServiceCoordinator _peerPaymentErrorStateForRegistrationResponse:error:expectsPass:]( self,  "_peerPaymentErrorStateForRegistrationResponse:error:expectsPass:",  v12,  v13,  !v8);
  id v20 = [v13 code];
  if (v12 && !v13)
  {
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472LL;
    v33[2] = sub_1003C444C;
    v33[3] = &unk_10065BB10;
    v33[4] = self;
    v34 = (__CFString *)v12;
    id v35 = 0LL;
    BOOL v37 = v8;
    BOOL v38 = a5;
    id v36 = v14;
    id v21 = objc_retainBlock(v33);
    familyCircleManager = self->_familyCircleManager;
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472LL;
    v30[2] = sub_1003C46D0;
    v30[3] = &unk_10065BB38;
    BOOL v32 = v8;
    v30[4] = self;
    id v31 = v21;
    id v23 = v21;
    -[PDFamilyCircleManager familyMembersWithCachePolicy:completion:]( familyCircleManager,  "familyMembersWithCachePolicy:completion:",  0LL,  v30);

    BOOL v24 = v34;
LABEL_23:

    goto LABEL_24;
  }

  BOOL v25 = (void *)objc_claimAutoreleasedReturnValue([v13 domain]);
  if ([v25 isEqualToString:PKPeerPaymentWebServiceErrorDomain])
  {

    if (v20 == (id)40319 || v20 == (id)40308)
    {
      uint64_t Object = PKLogFacilityTypeGetObject(11LL);
      v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        id v50 = v20;
        _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "Failed to re-register due to terminal server response %li. Unscheduling peer payment re-register activity and attempting to unregister device.",  buf,  0xCu);
      }

      PDScheduledActivityRemove(@"PDPeerPaymentWebServiceCoordinator", @"PeerPaymentReregisterActivity");
      PKSetUserHasDisabledPeerPayment(1LL);
      if (v20 == (id)40308) {
        v28 = @"Unregister Underage Account";
      }
      else {
        v28 = @"Unregister, invalid email";
      }
      -[PKPeerPaymentWebService addDiagnosticReason:](self->_sharedPeerPaymentWebService, "addDiagnosticReason:", v28);
      v44[0] = _NSConcreteStackBlock;
      v44[1] = 3221225472LL;
      v44[2] = sub_1003C42D0;
      v44[3] = &unk_10065BAE8;
      v44[4] = self;
      uint64_t v45 = v28;
      id v47 = v14;
      unint64_t v48 = v19;
      id v46 = v13;
      -[PDPeerPaymentWebServiceCoordinator unregisterDeviceWithCompletion:]( self,  "unregisterDeviceWithCompletion:",  v44);

      BOOL v24 = (__CFString *)v45;
      goto LABEL_23;
    }
  }

  else
  {
  }

  if (!a5)
  {
    if (v19 > 4) {
      v29 = @"unknown";
    }
    else {
      v29 = off_10065C120[v19];
    }
    -[PKPeerPaymentWebService addDiagnosticReason:](self->_sharedPeerPaymentWebService, "addDiagnosticReason:", v29);
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472LL;
    v39[2] = sub_1003C4404;
    v39[3] = &unk_10065BAE8;
    v39[4] = self;
    v40 = v29;
    id v42 = v14;
    unint64_t v43 = v19;
    id v41 = v13;
    -[PDPeerPaymentWebServiceCoordinator unregisterDeviceWithCompletion:](self, "unregisterDeviceWithCompletion:", v39);

    BOOL v24 = (__CFString *)v40;
    goto LABEL_23;
  }

  if (v14) {
    (*((void (**)(id, unint64_t, id))v14 + 2))(v14, v19, v13);
  }
LABEL_24:
}

- (void)unregisterDeviceWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t Object = PKLogFacilityTypeGetObject(11LL);
  BOOL v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Attempting to unregister from the peer payment service.",  buf,  2u);
  }

  sharedPeerPaymentWebServiceQueue = self->_sharedPeerPaymentWebServiceQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1003C4B0C;
  v9[3] = &unk_10063AC90;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_async((dispatch_queue_t)sharedPeerPaymentWebServiceQueue, v9);
}

- (void)updateAccountWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", @"CashReasonWallet"));
  -[PDPeerPaymentWebServiceCoordinator updateAccountWithDiagnosticReasons:completion:]( self,  "updateAccountWithDiagnosticReasons:completion:",  v5,  v4);
}

- (void)updateAssociatedAccountsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", @"CashReasonWallet"));
  -[PDPeerPaymentWebServiceCoordinator updateAssociatedAccountsWithDiagnosticReasons:completion:]( self,  "updateAssociatedAccountsWithDiagnosticReasons:completion:",  v5,  v4);
}

- (void)updateAccountAndAssociatedAccountsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", @"CashReasonWallet"));
  -[PDPeerPaymentWebServiceCoordinator updateAccountAndAssociatedAccountsWithDiagnosticReasons:completion:]( self,  "updateAccountAndAssociatedAccountsWithDiagnosticReasons:completion:",  v5,  v4);
}

- (void)updateAccountWithDiagnosticReasons:(id)a3 completion:(id)a4
{
}

- (void)updateAccountWithDiagnosticReasons:(id)a3 abridgedRegistration:(BOOL)a4 completion:(id)a5
{
}

- (void)_updateAccountFromPush:(BOOL)a3 diagnosticReasons:(id)a4 abridgedRegistration:(BOOL)a5 completion:(id)a6
{
  BOOL v6 = a5;
  BOOL v8 = a3;
  id v12 = a6;
  id v10 = a4;
  BOOL v11 = -[PDPeerPaymentWebServiceAccountFetch initWithCompletionHandler:]( objc_alloc(&OBJC_CLASS___PDPeerPaymentWebServiceAccountFetch),  "initWithCompletionHandler:",  v12);
  -[PDPeerPaymentWebServiceAccountFetch setUpdateAccount:](v11, "setUpdateAccount:", 1LL);
  -[PDPeerPaymentWebServiceAccountFetch setFromPush:](v11, "setFromPush:", v8);
  -[PDPeerPaymentWebServiceAccountFetch setUpdatePass:](v11, "setUpdatePass:", !v6);
  -[PDPeerPaymentWebServiceAccountFetch addDiagnosticReasons:](v11, "addDiagnosticReasons:", v10);

  if (v8) {
    -[PDPeerPaymentWebServiceAccountFetch addDiagnosticReason:]( v11,  "addDiagnosticReason:",  @"CashReasonFromPush");
  }
  -[PDPeerPaymentWebServiceCoordinator _updateAccountWithRequest:completion:]( self,  "_updateAccountWithRequest:completion:",  v11,  v12);
}

- (void)updateAssociatedAccountsWithDiagnosticReasons:(id)a3 completion:(id)a4
{
}

- (void)updateAssociatedAccountsWithDiagnosticReasons:(id)a3 abridgedRegistration:(BOOL)a4 completion:(id)a5
{
}

- (void)_updateAssociatedAccountsFromPush:(BOOL)a3 diagnosticReasons:(id)a4 abridgedRegistration:(BOOL)a5 completion:(id)a6
{
  BOOL v6 = a5;
  BOOL v8 = a3;
  id v12 = a6;
  id v10 = a4;
  BOOL v11 = -[PDPeerPaymentWebServiceAccountFetch initWithCompletionHandler:]( objc_alloc(&OBJC_CLASS___PDPeerPaymentWebServiceAccountFetch),  "initWithCompletionHandler:",  v12);
  -[PDPeerPaymentWebServiceAccountFetch setUpdateAssociatedAccounts:](v11, "setUpdateAssociatedAccounts:", 1LL);
  -[PDPeerPaymentWebServiceAccountFetch setFromPush:](v11, "setFromPush:", v8);
  -[PDPeerPaymentWebServiceAccountFetch setUpdatePass:](v11, "setUpdatePass:", !v6);
  -[PDPeerPaymentWebServiceAccountFetch addDiagnosticReasons:](v11, "addDiagnosticReasons:", v10);

  if (v8) {
    -[PDPeerPaymentWebServiceAccountFetch addDiagnosticReason:]( v11,  "addDiagnosticReason:",  @"CashReasonFromPush");
  }
  -[PDPeerPaymentWebServiceCoordinator _updateAccountWithRequest:completion:]( self,  "_updateAccountWithRequest:completion:",  v11,  v12);
}

- (void)updateAccountAndAssociatedAccountsWithDiagnosticReasons:(id)a3 completion:(id)a4
{
}

- (void)updateAccountAndAssociatedAccountsWithDiagnosticReasons:(id)a3 abridgedRegistration:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = -[PDPeerPaymentWebServiceAccountFetch initWithCompletionHandler:]( objc_alloc(&OBJC_CLASS___PDPeerPaymentWebServiceAccountFetch),  "initWithCompletionHandler:",  v8);
  -[PDPeerPaymentWebServiceAccountFetch setUpdateAccount:](v10, "setUpdateAccount:", 1LL);
  -[PDPeerPaymentWebServiceAccountFetch setUpdateAssociatedAccounts:](v10, "setUpdateAssociatedAccounts:", 1LL);
  -[PDPeerPaymentWebServiceAccountFetch setUpdatePass:](v10, "setUpdatePass:", !v5);
  -[PDPeerPaymentWebServiceAccountFetch addDiagnosticReasons:](v10, "addDiagnosticReasons:", v9);

  -[PDPeerPaymentWebServiceCoordinator _updateAccountWithRequest:completion:]( self,  "_updateAccountWithRequest:completion:",  v10,  v8);
}

- (void)deleteAccountWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t Object = PKLogFacilityTypeGetObject(11LL);
  BOOL v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Deleting peer payment account.", v10, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  id v8 = [WeakRetained removePeerPaymentAccount];

  account = self->_account;
  self->_account = 0LL;

  -[PDPeerPaymentWebServiceCoordinator _postAccountChangedNotification](self, "_postAccountChangedNotification");
  -[PDPeerPaymentWebServiceCoordinator _accessObserversWithHandler:]( self,  "_accessObserversWithHandler:",  &stru_10065BB78);
  -[PDPeerPaymentWebServiceCoordinator deletePreferencesWithCompletion:](self, "deletePreferencesWithCompletion:", v4);
}

- (void)deletePreferencesWithCompletion:(id)a3
{
  id v9 = a3;
  PKPeerPaymentRemoveAllRecurringPaymentRecentMemoIcons();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  id v5 = [WeakRetained removePeerPaymentPreferences];

  preferences = self->_preferences;
  self->_preferences = 0LL;

  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter"));
  [v7 postNotificationName:PDPeerPaymentServicePreferencesChangedDistributedNotification object:0 userInfo:0 deliverImmediately:0];

  id v8 = v9;
  if (v9)
  {
    (*((void (**)(id))v9 + 2))(v9);
    id v8 = v9;
  }
}

- (void)setPreferences:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  sharedPeerPaymentWebServiceQueue = self->_sharedPeerPaymentWebServiceQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1003C5474;
  block[3] = &unk_100639AF0;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)sharedPeerPaymentWebServiceQueue, block);
}

- (void)handleMigratedAccount:(id)a3
{
  id v4 = a3;
  uint64_t Object = PKLogFacilityTypeGetObject(11LL);
  id WeakRetained = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  WeakRetained,  OS_LOG_TYPE_DEFAULT,  "Handling migrated peer payment account.",  buf,  2u);
  }

  account = self->_account;
  if (account
    && (id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentAccount lastUpdated](account, "lastUpdated")),
        id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 lastUpdated]),
        id v10 = [v8 compare:v9],
        v9,
        v8,
        v10 == (id)1))
  {
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v13 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  WeakRetained,  OS_LOG_TYPE_DEFAULT,  "Provided peer payment account is older than the one we have.",  v13,  2u);
    }
  }

  else
  {
    id WeakRetained = (os_log_s *)objc_loadWeakRetained((id *)&self->_dataSource);
    BOOL v11 = (PKPeerPaymentAccount *)objc_claimAutoreleasedReturnValue( -[os_log_s insertOrUpdatePeerPaymentAccount:]( WeakRetained,  "insertOrUpdatePeerPaymentAccount:",  v4));
    id v12 = self->_account;
    self->_account = v11;
  }
}

- (BOOL)_peerPaymentPassExists
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentAccount associatedPassUniqueID](self->_account, "associatedPassUniqueID"));
  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentAccount associatedPassURL](self->_account, "associatedPassURL"));
    if (v4)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentAccount associatedPassUniqueID](self->_account, "associatedPassUniqueID"));
      unsigned __int8 v7 = [WeakRetained passExistsWithUniqueID:v6];
    }

    else
    {
      unsigned __int8 v7 = 0;
    }
  }

  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (void)downloadPassIfNecessaryWithCompletion:(id)a3
{
  id v4 = (void (**)(id, uint64_t))a3;
  if (-[PDPeerPaymentWebServiceCoordinator _hasAssociatedPeerPaymentPassSetup]( self,  "_hasAssociatedPeerPaymentPassSetup"))
  {
    if (v4) {
      v4[2](v4, 1LL);
    }
  }

  else
  {
    -[PDPeerPaymentWebServiceCoordinator _downloadAssociatedPeerPaymentPassWithCompletion:]( self,  "_downloadAssociatedPeerPaymentPassWithCompletion:",  v4);
  }
}

- (BOOL)_hasAssociatedPeerPaymentPass
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentAccount associatedPassUniqueID](self->_account, "associatedPassUniqueID"));
  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    unsigned __int8 v5 = [WeakRetained passExistsWithUniqueID:v3];
  }

  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (BOOL)_hasAssociatedPeerPaymentPassSetup
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentAccount associatedPassUniqueID](self->_account, "associatedPassUniqueID"));
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained passWithUniqueIdentifier:v4]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 paymentPass]);

  if (v6)
  {
    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue([v6 devicePrimaryPaymentApplication]);
    BOOL v8 = v7 != 0LL;
  }

  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (void)_downloadAssociatedPeerPaymentPassWithCompletion:(id)a3
{
  id v4 = a3;
  sharedPeerPaymentWebServiceQueue = self->_sharedPeerPaymentWebServiceQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1003C59F0;
  v7[3] = &unk_10063AC90;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)sharedPeerPaymentWebServiceQueue, v7);
}

- (void)updateMockAccountBalanceByAddingAmount:(id)a3 completion:(id)a4
{
  id v14 = (void (**)(id, PKPeerPaymentAccount *))a4;
  mockAccount = self->_mockAccount;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentAccount currentBalance](mockAccount, "currentBalance"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 amount]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 decimalNumberByAdding:v7]);

  BOOL v11 = objc_alloc(&OBJC_CLASS___PKCurrencyAmount);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 currency]);
  id v13 = -[PKCurrencyAmount initWithAmount:currency:exponent:](v11, "initWithAmount:currency:exponent:", v10, v12, 0LL);

  -[PKPeerPaymentAccount setCurrentBalance:](self->_mockAccount, "setCurrentBalance:", v13);
  -[PDPeerPaymentWebServiceCoordinator _postAccountChangedNotification](self, "_postAccountChangedNotification");
  if (v14) {
    v14[2](v14, self->_mockAccount);
  }
}

- (void)submitDeviceScoreIdentifiersForTransaction:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  sharedPeerPaymentWebServiceQueue = self->_sharedPeerPaymentWebServiceQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1003C6CC0;
  block[3] = &unk_100639AF0;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)sharedPeerPaymentWebServiceQueue, block);
}

- (void)cloudStoreStatusWithCompletion:(id)a3
{
  id v4 = a3;
  sharedPeerPaymentWebServiceQueue = self->_sharedPeerPaymentWebServiceQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1003C6F20;
  v7[3] = &unk_10063AC90;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)sharedPeerPaymentWebServiceQueue, v7);
}

- (void)initalizeCloudStoreIfNecessaryWithHandler:(id)a3
{
}

- (void)checkTLKsMissingWithCompletion:(id)a3
{
  id v4 = a3;
  sharedPeerPaymentWebServiceQueue = self->_sharedPeerPaymentWebServiceQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1003C6FAC;
  v7[3] = &unk_10063AC90;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)sharedPeerPaymentWebServiceQueue, v7);
}

- (void)resetApplePayManateeViewWithCompletion:(id)a3
{
  id v4 = a3;
  sharedPeerPaymentWebServiceQueue = self->_sharedPeerPaymentWebServiceQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1003C7034;
  v7[3] = &unk_10063AC90;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)sharedPeerPaymentWebServiceQueue, v7);
}

- (void)remoteRegistrationRequest:(id)a3 forHandle:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  sharedPeerPaymentWebServiceQueue = self->_sharedPeerPaymentWebServiceQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1003C7108;
  v15[3] = &unk_10063B440;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async((dispatch_queue_t)sharedPeerPaymentWebServiceQueue, v15);
}

- (void)_schedulePeerPaymentCoordinatorActivities
{
  id v3 = PDDefaultQueue();
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  PDScheduledActivityClientRegister(@"PDPeerPaymentWebServiceCoordinator", self, v4);

  if (-[PDPeerPaymentWebServiceCoordinator _shouldAttemptBackgroundPeerPaymentPassDownload]( self,  "_shouldAttemptBackgroundPeerPaymentPassDownload"))
  {
    uint64_t Object = PKLogFacilityTypeGetObject(11LL);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Scheduling background peer payment pass download activity task.",  v8,  2u);
    }

    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[PDScheduledActivityCriteria maintenanceActivityCriteriaWithStartDate:]( &OBJC_CLASS___PDScheduledActivityCriteria,  "maintenanceActivityCriteriaWithStartDate:",  0LL));
    [v7 setRepeating:1];
    [v7 setRepeatInterval:3600.0];
    [v7 setRequireNetworkConnectivity:1];
    PDScheduledActivityRegister(@"PDPeerPaymentWebServiceCoordinator", @"PeerPaymentPassDownload", v7);
  }

- (void)_performPeerPaymentPassDownloadActivity
{
  uint64_t Object = PKLogFacilityTypeGetObject(11LL);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Background peer payment pass download activity fired.",  buf,  2u);
  }

  unsigned int v5 = -[PDPeerPaymentWebServiceCoordinator _shouldAttemptBackgroundPeerPaymentPassDownload]( self,  "_shouldAttemptBackgroundPeerPaymentPassDownload");
  BOOL v6 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Attempting peer payment pass download.",  buf,  2u);
    }

    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1003C73D4;
    v12[3] = &unk_100639300;
    v12[4] = self;
    id v7 = objc_retainBlock(v12);
    id v8 = v7;
    if (self->_account)
    {
      ((void (*)(void *))v7[2])(v7);
    }

    else
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  @"CashReasonPassBackgroundDownload"));
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472LL;
      v10[2] = sub_1003C7468;
      v10[3] = &unk_100650340;
      id v11 = v8;
      -[PDPeerPaymentWebServiceCoordinator updateAccountAndAssociatedAccountsWithDiagnosticReasons:completion:]( self,  "updateAccountAndAssociatedAccountsWithDiagnosticReasons:completion:",  v9,  v10);
    }
  }

  else
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Unscheduling peer payment pass download activity.",  buf,  2u);
    }

    PDScheduledActivityRemove(@"PDPeerPaymentWebServiceCoordinator", @"PeerPaymentPassDownload");
  }

- (void)_schedulePeerPaymentReregisterActivityForReason:(id)a3
{
  id v3 = a3;
  uint64_t Object = PKLogFacilityTypeGetObject(11LL);
  unsigned int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Scheduling peer payment re-register activity.",  v7,  2u);
  }

  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue( +[PDScheduledActivityCriteria maintenanceActivityCriteriaWithStartDate:]( &OBJC_CLASS___PDScheduledActivityCriteria,  "maintenanceActivityCriteriaWithStartDate:",  0LL));
  [v6 setRepeating:1];
  [v6 setRepeatInterval:900.0];
  [v6 setRequireNetworkConnectivity:1];
  [v6 setReason:v3];
  PDScheduledActivityRegister(@"PDPeerPaymentWebServiceCoordinator", @"PeerPaymentReregisterActivity", v6);
}

- (void)_performPeerPaymentReregisterActivityForReason:(id)a3
{
  id v4 = (__CFString *)a3;
  if (v4) {
    unsigned int v5 = v4;
  }
  else {
    unsigned int v5 = @"default re-register";
  }
  uint64_t Object = PKLogFacilityTypeGetObject(11LL);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v13 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Scheduled peer payment re-register activity fired because: %{public}@",  buf,  0xCu);
  }

  sharedPeerPaymentWebServiceQueue = self->_sharedPeerPaymentWebServiceQueue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1003C7660;
  v10[3] = &unk_1006392B0;
  void v10[4] = self;
  id v11 = v5;
  id v9 = v5;
  dispatch_async((dispatch_queue_t)sharedPeerPaymentWebServiceQueue, v10);
}

- (void)_scheduleAssociatedAccountRemoteRegistrationActivityIfNecessaryForReason:(unint64_t)a3
{
  familyCircleManager = self->_familyCircleManager;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1003C7894;
  v4[3] = &unk_10063A508;
  v4[4] = self;
  v4[5] = a3;
  -[PDFamilyCircleManager familyMembersWithCachePolicy:completion:]( familyCircleManager,  "familyMembersWithCachePolicy:completion:",  0LL,  v4);
}

- (id)_associatedAccountRemoteRegistrationActivityIdentifierForAltDSID:(id)a3
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@",  @"PPRemoteRegActivity.",  a3);
}

- (id)_altDSIDFromAssociatedAccountRemoteRegistrationActivityIdentifier:(id)a3
{
  id v3 = a3;
  if ([v3 hasPrefix:@"PPRemoteRegActivity."]) {
    id v4 = (void *)objc_claimAutoreleasedReturnValue( [v3 stringByReplacingOccurrencesOfString:@"PPRemoteRegActivity." withString:&stru_100662310]);
  }
  else {
    id v4 = 0LL;
  }

  return v4;
}

- (void)_performPeerPaymentAssociatedAccountRemoteRegistrationRequestWithActivityIdentifier:(id)a3 reason:(id)a4
{
  BOOL v6 = (__CFString *)a3;
  id v7 = (__CFString *)a4;
  if (v7) {
    id v8 = v7;
  }
  else {
    id v8 = @"IDS message received with registration result";
  }
  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[PDPeerPaymentWebServiceCoordinator _altDSIDFromAssociatedAccountRemoteRegistrationActivityIdentifier:]( self,  "_altDSIDFromAssociatedAccountRemoteRegistrationActivityIdentifier:",  v6));
  uint64_t Object = PKLogFacilityTypeGetObject(11LL);
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v12)
    {
      *(_DWORD *)buf = 138543618;
      unint64_t v19 = v8;
      __int16 v20 = 2112;
      id v21 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Performing associated account remote registration activity for reason: %{public}@ and altDSID %@",  buf,  0x16u);
    }

    sharedPeerPaymentWebServiceQueue = self->_sharedPeerPaymentWebServiceQueue;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_1003C8088;
    v14[3] = &unk_10063B060;
    v14[4] = self;
    id v15 = v9;
    id v16 = @"PDPeerPaymentWebServiceCoordinator";
    id v17 = v6;
    dispatch_async((dispatch_queue_t)sharedPeerPaymentWebServiceQueue, v14);
  }

  else
  {
    if (v12)
    {
      *(_DWORD *)buf = 138412290;
      unint64_t v19 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Cannot perform associated account remote registration activity since there is no altDSID defined in activity identifier %@",  buf,  0xCu);
    }

    PDScheduledActivityRemove(@"PDPeerPaymentWebServiceCoordinator", v6);
  }
}

- (void)scheduleTaskToFetchStaleAccountIfNecessary:(BOOL)a3 associatedAccountEndpoint:(BOOL)a4
{
  if (a3 || a4)
  {
    if (a3 && a4)
    {
      id v7 = @"CashStaleAccountAndAssociatedAccount";
      if ((PDScheduledActivityExists( @"PDPeerPaymentWebServiceCoordinator",  @"CashStaleAccountAndAssociatedAccount") & 1) != 0) {
        return;
      }
LABEL_15:
      sharedPeerPaymentWebServiceQueue = self->_sharedPeerPaymentWebServiceQueue;
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472LL;
      v9[2] = sub_1003C878C;
      v9[3] = &unk_10065BD28;
      BOOL v12 = a3;
      BOOL v13 = a4;
      v9[4] = self;
      id v10 = @"PDPeerPaymentWebServiceCoordinator";
      id v11 = (__CFString *)v7;
      dispatch_async((dispatch_queue_t)sharedPeerPaymentWebServiceQueue, v9);

      return;
    }

    if (a3)
    {
      if ((PDScheduledActivityExists(@"PDPeerPaymentWebServiceCoordinator", @"CashStaleAccount") & 1) == 0
        && (PDScheduledActivityExists( @"PDPeerPaymentWebServiceCoordinator",  @"CashStaleAccountAndAssociatedAccount") & 1) == 0)
      {
        id v7 = @"CashStaleAccount";
        goto LABEL_15;
      }
    }

    else if (a4 {
           && (PDScheduledActivityExists( @"PDPeerPaymentWebServiceCoordinator",  @"CashStaleAssociatedAccount") & 1) == 0 && (PDScheduledActivityExists( @"PDPeerPaymentWebServiceCoordinator",  @"CashStaleAccountAndAssociatedAccount") & 1) == 0)
    }
    {
      id v7 = @"CashStaleAssociatedAccount";
      goto LABEL_15;
    }
  }

- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4
{
  id v17 = a3;
  id v6 = a4;
  if ([v17 isEqualToString:@"PeerPaymentPassDownload"])
  {
    -[PDPeerPaymentWebServiceCoordinator _performPeerPaymentPassDownloadActivity]( self,  "_performPeerPaymentPassDownloadActivity");
    goto LABEL_8;
  }

  if ([v17 isEqualToString:@"PeerPaymentReregisterActivity"])
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 reason]);
    -[PDPeerPaymentWebServiceCoordinator _performPeerPaymentReregisterActivityForReason:]( self,  "_performPeerPaymentReregisterActivityForReason:",  v7);
LABEL_7:

    goto LABEL_8;
  }

  if ([v17 hasPrefix:@"PPRemoteRegActivity."])
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 reason]);
    -[PDPeerPaymentWebServiceCoordinator _performPeerPaymentAssociatedAccountRemoteRegistrationRequestWithActivityIdentifier:reason:]( self,  "_performPeerPaymentAssociatedAccountRemoteRegistrationRequestWithActivityIdentifier:reason:",  v17,  v7);
    goto LABEL_7;
  }

  id v8 = (__CFString *)v17;
  id v9 = v8;
  if (v8 == @"CashStaleAccountAndAssociatedAccount") {
    goto LABEL_16;
  }
  if (v8)
  {
    unsigned __int8 v10 = -[__CFString isEqualToString:]( v8,  "isEqualToString:",  @"CashStaleAccountAndAssociatedAccount");

    if ((v10 & 1) != 0) {
      goto LABEL_16;
    }
    id v11 = v9;
    if (v11 == @"CashStaleAccount"
      || (BOOL v12 = v11,
          unsigned __int8 v13 = -[__CFString isEqualToString:](v11, "isEqualToString:", @"CashStaleAccount"),
          v12,
          (v13 & 1) != 0)
      || (id v14 = v12, v14 == @"CashStaleAssociatedAccount")
      || (id v15 = v14,
          unsigned int v16 = -[__CFString isEqualToString:]( v14,  "isEqualToString:",  @"CashStaleAssociatedAccount"),  v15,  v16))
    {
LABEL_16:
      -[PDPeerPaymentWebServiceCoordinator _processStaleAccountFetchAfterTranactionScheduledTask:]( self,  "_processStaleAccountFetchAfterTranactionScheduledTask:",  v9);
    }
  }

- (void)_processStaleAccountFetchAfterTranactionScheduledTask:(id)a3
{
  id v4 = a3;
  sharedPeerPaymentWebServiceQueue = self->_sharedPeerPaymentWebServiceQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1003C8AF4;
  v7[3] = &unk_1006392B0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)sharedPeerPaymentWebServiceQueue, v7);
}

- (void)cloudStoreNotificationCoordinator:(id)a3 createdZoneWithName:(id)a4 forContainerName:(id)a5 scope:(int64_t)a6
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = PKCurrentCloudStoreApplePayContainerName();
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  id v12 = v9;
  id v13 = v11;
  if (v13 == v12)
  {
  }

  else
  {
    id v14 = v13;
    if (!v12 || !v13)
    {

      goto LABEL_11;
    }

    unsigned int v15 = [v12 isEqualToString:v13];

    if (!v15) {
      goto LABEL_11;
    }
  }

  uint64_t Object = PKLogFacilityTypeGetObject(11LL);
  id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v22 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "PDPeerPaymentWebServiceCoordinator: The %@ zone was created.",  buf,  0xCu);
  }

  sharedPeerPaymentWebServiceQueue = self->_sharedPeerPaymentWebServiceQueue;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_1003C8F60;
  v19[3] = &unk_1006392B0;
  v19[4] = self;
  id v20 = v8;
  dispatch_async((dispatch_queue_t)sharedPeerPaymentWebServiceQueue, v19);

LABEL_11:
}

- (void)_updatePushTopics
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentWebService context](self->_sharedPeerPaymentWebService, "context"));
  id v20 = (id)objc_claimAutoreleasedReturnValue([v3 pushTopic]);

  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  unsigned int v5 = v4;
  if (v20) {
    -[NSMutableSet addObject:](v4, "addObject:", v20);
  }
  os_unfair_lock_lock(&self->_lockPushTopics);
  id v6 = -[NSSet copy](self->_peerPaymentPushNotificationTopics, "copy");
  id v19 = -[NSSet copy](self->_additionalPushNotificationTopics, "copy");
  if (!-[NSMutableSet count](v5, "count")) {
    -[NSMutableSet addObject:](v5, "addObject:", @"com.apple.peerpayment");
  }
  id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentAccount additionalPushTopics](self->_account, "additionalPushTopics"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 preferences]);
  if (v9) {
    -[NSMutableSet addObject:](v7, "addObject:", v9);
  }
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 associatedAccounts]);
  id v11 = v6;
  if (v10) {
    -[NSMutableSet addObject:](v7, "addObject:", v10);
  }
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 requests]);
  if (v12) {
    -[NSMutableSet addObject:](v7, "addObject:", v12);
  }
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 endpoint]);
  if (v13) {
    -[NSMutableSet addObject:](v7, "addObject:", v13);
  }
  id v14 = (NSSet *)-[NSMutableSet copy](v7, "copy");
  additionalPushNotificationTopics = self->_additionalPushNotificationTopics;
  self->_additionalPushNotificationTopics = v14;

  unsigned int v16 = (NSSet *)-[NSMutableSet copy](v5, "copy");
  peerPaymentPushNotificationTopics = self->_peerPaymentPushNotificationTopics;
  self->_peerPaymentPushNotificationTopics = v16;

  if (PKEqualObjects(v11, self->_peerPaymentPushNotificationTopics))
  {
    char v18 = PKEqualObjects(v19, self->_additionalPushNotificationTopics);
    os_unfair_lock_unlock(&self->_lockPushTopics);

    if ((v18 & 1) != 0) {
      goto LABEL_18;
    }
  }

  else
  {
    os_unfair_lock_unlock(&self->_lockPushTopics);
  }

  -[PDPushNotificationManager recalculatePushTopics](self->_pushNotificationManager, "recalculatePushTopics");
LABEL_18:
}

- (id)pushNotificationTopics
{
  p_lockPushTopics = &self->_lockPushTopics;
  os_unfair_lock_lock(&self->_lockPushTopics);
  peerPaymentPushNotificationTopics = self->_peerPaymentPushNotificationTopics;
  if (peerPaymentPushNotificationTopics) {
    unsigned int v5 = (NSMutableSet *)-[NSSet mutableCopy](peerPaymentPushNotificationTopics, "mutableCopy");
  }
  else {
    unsigned int v5 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  }
  id v6 = v5;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSSet allObjects](self->_additionalPushNotificationTopics, "allObjects"));
  -[NSMutableSet addObjectsFromArray:](v6, "addObjectsFromArray:", v7);

  os_unfair_lock_unlock(p_lockPushTopics);
  uint64_t Object = PKLogFacilityTypeGetObject(11LL);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Peer Payment Web Service push topics: %@",  (uint8_t *)&v12,  0xCu);
  }

  id v10 = -[NSMutableSet copy](v6, "copy");
  return v10;
}

- (void)handlePushNotificationForTopic:(id)a3 userInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t Object = PKLogFacilityTypeGetObject(11LL);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v23 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Received push for push topic: %@", buf, 0xCu);
  }

  os_unfair_lock_lock(&self->_lockPushTopics);
  unsigned __int8 v10 = -[NSSet containsObject:](self->_peerPaymentPushNotificationTopics, "containsObject:", v6);
  os_unfair_lock_unlock(&self->_lockPushTopics);
  if ((v10 & 1) == 0)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentWebService context](self->_sharedPeerPaymentWebService, "context"));
    id v12 = (id)objc_claimAutoreleasedReturnValue([v11 pushTopic]);
    id v13 = v6;
    id v14 = v13;
    if (v12 == v13)
    {
    }

    else
    {
      if (!v13 || !v12)
      {

LABEL_12:
        sharedPeerPaymentWebServiceQueue = self->_sharedPeerPaymentWebServiceQueue;
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472LL;
        v18[2] = sub_1003C96D4;
        v18[3] = &unk_100639350;
        v18[4] = self;
        id v19 = v14;
        id v20 = v7;
        dispatch_async((dispatch_queue_t)sharedPeerPaymentWebServiceQueue, v18);

        goto LABEL_13;
      }

      unsigned __int8 v15 = [v12 isEqualToString:v13];

      if ((v15 & 1) == 0) {
        goto LABEL_12;
      }
    }
  }

  unsigned int v16 = self->_sharedPeerPaymentWebServiceQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1003C95F4;
  block[3] = &unk_100639300;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)v16, block);
LABEL_13:
}

- (void)applyPushNotificationToken:(id)a3
{
  id v4 = a3;
  sharedPeerPaymentWebServiceQueue = self->_sharedPeerPaymentWebServiceQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1003C9C50;
  v7[3] = &unk_1006392B0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)sharedPeerPaymentWebServiceQueue, v7);
}

- (void)_cancelPendingTransactionNotifications
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentAccount associatedPassUniqueID](self->_account, "associatedPassUniqueID"));
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained passWithUniqueIdentifier:v3]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 paymentPass]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 deviceTransactionSourceIdentifiers]);
  id v8 = [v7 count];

  if (v8)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(11LL);
    unsigned __int8 v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      BOOL v32 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Fetching all received peer payment transactions associated with the peer payment pass %@",  buf,  0xCu);
    }

    BOOL v26 = v3;

    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    uint64_t v12 = objc_claimAutoreleasedReturnValue([v11 dateByAddingTimeInterval:-604800.0]);

    id v13 = objc_loadWeakRetained((id *)&self->_dataSource);
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v6 deviceTransactionSourceIdentifiers]);
    unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    BOOL v25 = (void *)v12;
    unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue( [v13 peerPaymentTransactionServiceIdentifiersForTransactionSourceIdentifiers:v14 withPeerPaymentSubtype:2 wit hTransactionSource:0 withBackingData:0 startDate:v12 endDate:v15]);

    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    id v17 = v16;
    id v18 = [v17 countByEnumeratingWithState:&v27 objects:v35 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v28;
      do
      {
        for (i = 0LL; i != v19; i = (char *)i + 1)
        {
          if (*(void *)v28 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v22 = *(void *)(*((void *)&v27 + 1) + 8LL * (void)i);
          id v23 = (void *)objc_claimAutoreleasedReturnValue( +[PDPeerPaymentTransactionReminderUserNotification notificationIdentifierForTransactionServiceIdentifier:reminderPeriod:]( &OBJC_CLASS___PDPeerPaymentTransactionReminderUserNotification,  "notificationIdentifierForTransactionServiceIdentifier:reminderPeriod:",  v22,  0LL));
          BOOL v24 = (void *)objc_claimAutoreleasedReturnValue( +[PDPeerPaymentTransactionReminderUserNotification notificationIdentifierForTransactionServiceIdentifier:reminderPeriod:]( &OBJC_CLASS___PDPeerPaymentTransactionReminderUserNotification,  "notificationIdentifierForTransactionServiceIdentifier:reminderPeriod:",  v22,  1LL));
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            BOOL v32 = v23;
            __int16 v33 = 2112;
            v34 = v24;
            _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Removing peer payment reminder notifications with identifiers: One Hour: %@, Day Before: %@",  buf,  0x16u);
          }

          -[PDUserNotificationManager removeUserNotificationWithIdentifier:]( self->_userNotificationManager,  "removeUserNotificationWithIdentifier:",  v23);
          -[PDUserNotificationManager removeUserNotificationWithIdentifier:]( self->_userNotificationManager,  "removeUserNotificationWithIdentifier:",  v24);
        }

        id v19 = [v17 countByEnumeratingWithState:&v27 objects:v35 count:16];
      }

      while (v19);
    }

    id v3 = v26;
  }
}

- (void)didReceiveRemoteRegistationResult:(unint64_t)a3 fromDestination:(id)a4
{
  id v6 = a4;
  sharedPeerPaymentWebServiceQueue = self->_sharedPeerPaymentWebServiceQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1003CA244;
  block[3] = &unk_10063A858;
  id v11 = self;
  unint64_t v12 = a3;
  id v10 = v6;
  id v8 = v6;
  dispatch_async((dispatch_queue_t)sharedPeerPaymentWebServiceQueue, block);
}

- (void)peerPaymentPendingRequestsForRequests:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  sharedPeerPaymentWebServiceQueue = self->_sharedPeerPaymentWebServiceQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1003CA850;
  block[3] = &unk_10063C6A8;
  id v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async((dispatch_queue_t)sharedPeerPaymentWebServiceQueue, block);
}

- (void)updatePendingRequestsWithRequestTokens:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___PKPeerPaymentPendingRequestsRequest);
  [v5 setRequestTokens:v4];
  sharedPeerPaymentWebService = self->_sharedPeerPaymentWebService;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1003CAD58;
  v8[3] = &unk_10065BE28;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  -[PKPeerPaymentWebService peerPaymentPendingRequestsWithRequest:completion:]( sharedPeerPaymentWebService,  "peerPaymentPendingRequestsWithRequest:completion:",  v5,  v8);
}

- (void)recurringPaymentsWithPreventingServerFetch:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  sharedPeerPaymentWebServiceQueue = self->_sharedPeerPaymentWebServiceQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1003CB214;
  block[3] = &unk_100644C20;
  BOOL v11 = a3;
  void block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async((dispatch_queue_t)sharedPeerPaymentWebServiceQueue, block);
}

- (void)updateRecurringPaymentsWithCompletion:(id)a3
{
  id v4 = a3;
  sharedPeerPaymentWebServiceQueue = self->_sharedPeerPaymentWebServiceQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1003CB324;
  v7[3] = &unk_10063AC90;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)sharedPeerPaymentWebServiceQueue, v7);
}

- (void)performRecurringPaymentAction:(unint64_t)a3 identifier:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  sharedPeerPaymentWebServiceQueue = self->_sharedPeerPaymentWebServiceQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1003CB9E8;
  v13[3] = &unk_10065BEE0;
  id v15 = v9;
  unint64_t v16 = a3;
  v13[4] = self;
  id v14 = v8;
  id v11 = v8;
  id v12 = v9;
  dispatch_async((dispatch_queue_t)sharedPeerPaymentWebServiceQueue, v13);
}

- (void)_scheduleOrRemoveNotificationsForRecurringPayment:(id)a3
{
  id v4 = a3;
  if ([v4 sentByMe])
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 createdDate]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 startDate]);
    if (v5)
    {
      [v5 timeIntervalSinceNow];
      if (v7 > -180.0 && v6 != 0LL)
      {
        id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"));
        unsigned __int8 v10 = [v9 isDateInToday:v6];

        if ((v10 & 1) == 0)
        {
          id v11 = objc_alloc(&OBJC_CLASS___PDPeerPaymentRecurringPaymentSetupNotification);
          id v12 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentAccount associatedPassUniqueID](self->_account, "associatedPassUniqueID"));
          id v13 = -[PDPeerPaymentRecurringPaymentSetupNotification initWithPassUniqueIdentifier:recurringPayment:]( v11,  "initWithPassUniqueIdentifier:recurringPayment:",  v12,  v4);

          -[PDUserNotificationManager insertUserNotification:]( self->_userNotificationManager,  "insertUserNotification:",  v13);
        }
      }
    }

    if (([v4 status] == (id)1 || objc_msgSend(v4, "status") == (id)3)
      && (id v14 = (void *)objc_claimAutoreleasedReturnValue([v4 upcomingPaymentDates]),
          id v15 = [v14 count],
          v14,
          v15))
    {
      unint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v4 upcomingPaymentDates]);
      id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 firstObject]);

      id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"));
      unsigned __int8 v19 = [v18 isDateInToday:v17];

      if ((v19 & 1) == 0)
      {
        sharedPeerPaymentWebServiceQueue = self->_sharedPeerPaymentWebServiceQueue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_1003CC080;
        block[3] = &unk_100639350;
        id v22 = v4;
        id v23 = self;
        id v24 = v17;
        dispatch_async((dispatch_queue_t)sharedPeerPaymentWebServiceQueue, block);
      }
    }

    else
    {
      id v17 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
      -[PDPeerPaymentWebServiceCoordinator _removeUpcomingPaymentNotificationForRecurringPaymentIdentifier:]( self,  "_removeUpcomingPaymentNotificationForRecurringPaymentIdentifier:",  v17);
    }
  }
}

- (void)_removeUpcomingPaymentNotificationForRecurringPaymentIdentifier:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue( +[PDPeerPaymentRecurringPaymentUpcomingPaymentNotification notificationIdentifierForRecurringPaymentIdentifier:]( &OBJC_CLASS___PDPeerPaymentRecurringPaymentUpcomingPaymentNotification,  "notificationIdentifierForRecurringPaymentIdentifier:",  a3));
  -[PDUserNotificationManager removeUserNotificationWithIdentifier:]( self->_userNotificationManager,  "removeUserNotificationWithIdentifier:",  v4);
}

- (void)encryptionCertificateForDestination:(unint64_t)a3 forceUpdate:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  if ((a3 & 0xFFFFFFFFFFFFFFFDLL) != 0)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue( -[PKPeerPaymentAccount encryptionCertificatesVersions]( self->_account,  "encryptionCertificatesVersions"));
    id v10 = [v9 certificatesVersionForDestination:a3];

    -[PDPeerPaymentWebServiceCoordinator _updateEncryptionCertificateIfNeededForDestination:expectedVersion:forceUpdate:completion:]( self,  "_updateEncryptionCertificateIfNeededForDestination:expectedVersion:forceUpdate:completion:",  a3,  v10,  v5,  v8);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(11LL);
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v13 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Unknown encryption certificate destination, ignoring.",  v13,  2u);
    }

    if (v8) {
      (*((void (**)(id, void, void))v8 + 2))(v8, 0LL, 0LL);
    }
  }
}

- (void)_updateEncryptionCertificatesIfNeededWithAccount:(id)a3
{
  id v6 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v6 encryptionCertificatesVersions]);
  id v5 = [v4 certificatesVersionForDestination:1];

  -[PDPeerPaymentWebServiceCoordinator _updateEncryptionCertificateIfNeededForDestination:expectedVersion:forceUpdate:completion:]( self,  "_updateEncryptionCertificateIfNeededForDestination:expectedVersion:forceUpdate:completion:",  1LL,  v5,  0LL,  0LL);
}

- (void)_updateEncryptionCertificateIfNeededForDestination:(unint64_t)a3 expectedVersion:(int64_t)a4 forceUpdate:(BOOL)a5 completion:(id)a6
{
  id v10 = a6;
  sharedPeerPaymentWebServiceQueue = self->_sharedPeerPaymentWebServiceQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1003CC60C;
  block[3] = &unk_10065BF58;
  unint64_t v15 = a3;
  int64_t v16 = a4;
  BOOL v17 = a5;
  void block[4] = self;
  id v14 = v10;
  id v12 = v10;
  dispatch_async((dispatch_queue_t)sharedPeerPaymentWebServiceQueue, block);
}

- (void)encryptData:(id)a3 usingCertificateWithDestination:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v9)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_1003CC8F0;
    v10[3] = &unk_10065BFC0;
    void v10[4] = self;
    id v11 = v8;
    id v12 = v9;
    -[PDPeerPaymentWebServiceCoordinator encryptionCertificateForDestination:forceUpdate:completion:]( self,  "encryptionCertificateForDestination:forceUpdate:completion:",  a4,  0LL,  v10);
  }
}

- (void)reportFailureDiagnostic:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  sharedPeerPaymentWebServiceQueue = self->_sharedPeerPaymentWebServiceQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1003CCCD4;
  block[3] = &unk_100639AF0;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)sharedPeerPaymentWebServiceQueue, block);
}

- (BOOL)_shouldAttemptBackgroundPeerPaymentPassDownload
{
  unsigned __int8 v3 = -[PKPeerPaymentWebService needsRegistration]( self->_sharedPeerPaymentWebService,  "needsRegistration");
  account = self->_account;
  unsigned int v5 = !-[PDPeerPaymentWebServiceCoordinator _peerPaymentPassExists](self, "_peerPaymentPassExists");
  if (!account) {
    LOBYTE(v5) = 1;
  }
  if ((v3 & 1) != 0) {
    return 0;
  }
  else {
    return v5;
  }
}

- (void)_queue_addAccountFetchRequest:(id)a3
{
  id v4 = (os_log_s *)a3;
  uint64_t Object = PKLogFacilityTypeGetObject(11LL);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Peer Payment account fetch request incoming. %@",  buf,  0xCu);
  }

  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v7 = self->_accountFetchRequests;
  id v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v13,  v21,  16LL);
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v14;
    while (2)
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        if (objc_msgSend(v12, "coalesceWithRequest:", v4, (void)v13))
        {
          if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            id v18 = v4;
            __int16 v19 = 2112;
            uint64_t v20 = v12;
            _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Peer Payment account fetch request coalesced %@ onto existing request %@",  buf,  0x16u);
          }

          id v6 = v4;
          goto LABEL_18;
        }
      }

      id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v13,  v21,  16LL);
      if (v9) {
        continue;
      }
      break;
    }
  }

  if (v4)
  {
    -[NSMutableArray addObject:](self->_accountFetchRequests, "addObject:", v4);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Peer Payment account fetch request queued %@",  buf,  0xCu);
    }

    id v7 = (NSMutableArray *)v4;
LABEL_18:
  }

- (void)_queue_executeNextAccountFetchRequestIfPossible
{
  if (!self->_currentAccountFetchRequest)
  {
    unsigned __int8 v3 = (PDPeerPaymentWebServiceAccountFetch *)objc_claimAutoreleasedReturnValue( -[NSMutableArray firstObject]( self->_accountFetchRequests,  "firstObject"));
    currentAccountFetchRequest = self->_currentAccountFetchRequest;
    self->_currentAccountFetchRequest = v3;

    if (self->_currentAccountFetchRequest)
    {
      -[NSMutableArray removeObjectAtIndex:](self->_accountFetchRequests, "removeObjectAtIndex:", 0LL);
      uint64_t Object = PKLogFacilityTypeGetObject(11LL);
      id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        id v7 = self->_currentAccountFetchRequest;
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Peer Payment account fetch request starting %@",  (uint8_t *)&buf,  0xCu);
      }

      sharedPeerPaymentWebService = self->_sharedPeerPaymentWebService;
      id v9 = (void *)objc_claimAutoreleasedReturnValue( -[PDPeerPaymentWebServiceAccountFetch diagnosticReasonString]( self->_currentAccountFetchRequest,  "diagnosticReasonString"));
      -[PKPeerPaymentWebService addDiagnosticReason:](sharedPeerPaymentWebService, "addDiagnosticReason:", v9);

      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentAccount identifier](self->_account, "identifier"));
      id v11 = objc_alloc_init(&OBJC_CLASS___PKAsyncUnaryOperationComposer);
      *(void *)&__int128 buf = 0LL;
      *((void *)&buf + 1) = &buf;
      uint64_t v24 = 0x2020000000LL;
      char v25 = 0;
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472LL;
      v20[2] = sub_1003CD320;
      v20[3] = &unk_10063B5A8;
      v20[4] = self;
      id v12 = v10;
      id v21 = v12;
      p___int128 buf = &buf;
      [v11 addOperation:v20];
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472LL;
      v17[2] = sub_1003CDBE4;
      v17[3] = &unk_10063B5A8;
      v17[4] = self;
      id v13 = v12;
      id v18 = v13;
      __int16 v19 = &buf;
      [v11 addOperation:v17];
      kdebug_trace(730333328LL, 0LL, 0LL, 0LL, 0LL);
      __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472LL;
      v16[2] = sub_1003CE644;
      v16[3] = &unk_100659750;
      v16[4] = self;
      v16[5] = &buf;
      id v15 = [v11 evaluateWithInput:v14 completion:v16];

      _Block_object_dispose(&buf, 8);
    }
  }

- (void)_postGraduationNotificationIfNecessary
{
  unsigned __int8 v3 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentAccount associatedAccountInformation](self->_account, "associatedAccountInformation"));
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 associatedAccountRemovalRecords]);

  id v6 = [v5 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)i);
        if (([v10 hasPresentedNotification] & 1) == 0
          && [v10 reason] == (id)1)
        {
          id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 date]);
          if (v11)
          {
            id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
            [v12 timeIntervalSinceDate:v11];
            double v14 = v13;

            if (v14 <= 259200.0) {
              -[NSMutableSet addObject:](v3, "addObject:", v10);
            }
          }

          else
          {
            uint64_t Object = PKLogFacilityTypeGetObject(11LL);
            __int128 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)__int128 buf = 138412290;
              char v25 = v10;
              _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "There is no removal date set on the removal record %@",  buf,  0xCu);
            }
          }
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v20 objects:v26 count:16];
    }

    while (v7);
  }

  if (-[NSMutableSet count](v3, "count"))
  {
    familyCircleManager = self->_familyCircleManager;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_1003CEAA0;
    v18[3] = &unk_100650318;
    v18[4] = self;
    __int16 v19 = v3;
    -[PDFamilyCircleManager familyMembersWithCachePolicy:completion:]( familyCircleManager,  "familyMembersWithCachePolicy:completion:",  1LL,  v18);
  }
}

- (void)_postAssociatedAccountActiveNotificationIfNecessaryForNewAssociatedAccountInformation:(id)a3 oldAssociatedAccountInformation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  id v9 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  __int128 v53 = 0u;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v6 associatedAccounts]);
  id v11 = [v10 countByEnumeratingWithState:&v50 objects:v58 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v51;
    do
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v51 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(void **)(*((void *)&v50 + 1) + 8LL * (void)i);
        if (([v15 hasDisplayedAssociatedAccountActiveNotification] & 1) == 0)
        {
          __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v15 altDSID]);
          -[NSMutableSet addObject:](v9, "addObject:", v16);
        }
      }

      id v12 = [v10 countByEnumeratingWithState:&v50 objects:v58 count:16];
    }

    while (v12);
  }

  __int128 v48 = 0u;
  __int128 v49 = 0u;
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  BOOL v17 = (void *)objc_claimAutoreleasedReturnValue([v7 associatedAccountInvitations]);
  id v18 = [v17 countByEnumeratingWithState:&v46 objects:v57 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v47;
    do
    {
      for (j = 0LL; j != v19; j = (char *)j + 1)
      {
        if (*(void *)v47 != v20) {
          objc_enumerationMutation(v17);
        }
        __int128 v22 = *(void **)(*((void *)&v46 + 1) + 8LL * (void)j);
        if ([v22 status] == (id)1)
        {
          __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v22 altDSID]);
          -[NSMutableSet addObject:](v8, "addObject:", v23);
        }
      }

      id v19 = [v17 countByEnumeratingWithState:&v46 objects:v57 count:16];
    }

    while (v19);
  }

  id v24 = -[NSMutableSet mutableCopy](v8, "mutableCopy");
  [v24 intersectSet:v9];
  if (-[NSMutableSet count](v9, "count"))
  {
    id v38 = v7;
    id v39 = v6;
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    char v25 = v9;
    id v26 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v25,  "countByEnumeratingWithState:objects:count:",  &v42,  v56,  16LL);
    if (v26)
    {
      id v27 = v26;
      uint64_t v28 = *(void *)v43;
      do
      {
        for (k = 0LL; k != v27; k = (char *)k + 1)
        {
          if (*(void *)v43 != v28) {
            objc_enumerationMutation(v25);
          }
          uint64_t v30 = *(void *)(*((void *)&v42 + 1) + 8LL * (void)k);
          id v31 = (void *)objc_claimAutoreleasedReturnValue( -[PKPeerPaymentAccount associatedAccountInformation]( self->_account,  "associatedAccountInformation",  v38,  v39));
          [v31 markAssociatedAccountActiveWithAltDSID:v30 hasPresentedNotification:1];
        }

        id v27 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v25,  "countByEnumeratingWithState:objects:count:",  &v42,  v56,  16LL);
      }

      while (v27);
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    __int16 v33 = (PKPeerPaymentAccount *)objc_claimAutoreleasedReturnValue([WeakRetained insertOrUpdatePeerPaymentAccount:self->_account]);
    account = self->_account;
    self->_account = v33;

    id v7 = v38;
    id v6 = v39;
  }

  if (objc_msgSend(v24, "count", v38, v39))
  {
    uint64_t Object = PKLogFacilityTypeGetObject(11LL);
    id v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412290;
      id v55 = v24;
      _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "There are new associated accounts that just became active for altDSIDs %@",  buf,  0xCu);
    }

    familyCircleManager = self->_familyCircleManager;
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472LL;
    v40[2] = sub_1003CF4EC;
    v40[3] = &unk_100650318;
    v40[4] = self;
    id v41 = v24;
    -[PDFamilyCircleManager familyMembersWithCachePolicy:completion:]( familyCircleManager,  "familyMembersWithCachePolicy:completion:",  0LL,  v40);
  }
}

- (void)_postAccountChangedNotification
{
  uint64_t Object = PKLogFacilityTypeGetObject(11LL);
  unsigned __int8 v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v5 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Posting PDPeerPaymentServiceAccountChangedDistributedNotification",  v5,  2u);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter"));
  [v4 postNotificationName:PDPeerPaymentServiceAccountChangedDistributedNotification object:0 userInfo:0 deliverImmediately:0];
}

- (void)_updateAccountWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  sharedPeerPaymentWebServiceQueue = self->_sharedPeerPaymentWebServiceQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1003CFBA0;
  block[3] = &unk_10063C450;
  id v12 = v6;
  id v13 = v7;
  void block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async((dispatch_queue_t)sharedPeerPaymentWebServiceQueue, block);
}

- (void)_updatePreferencesWithCompletion:(id)a3
{
  id v4 = a3;
  kdebug_trace(730333368LL, 0LL, 0LL, 0LL, 0LL);
  sharedPeerPaymentWebServiceQueue = self->_sharedPeerPaymentWebServiceQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1003CFD3C;
  v7[3] = &unk_10063AC90;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)sharedPeerPaymentWebServiceQueue, v7);
}

- (void)_writePreferences:(id)a3 withError:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (v7 && !v8)
  {
    objc_storeStrong((id *)&self->_preferences, a3);
    -[PKPeerPaymentPreferences setDirty:](self->_preferences, "setDirty:", 0LL);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    id v11 = [WeakRetained insertOrUpdatePeerPaymentPreferences:v7];

    uint64_t Object = PKLogFacilityTypeGetObject(11LL);
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138412290;
      id v19 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Received an updated preferences %@.",  (uint8_t *)&v18,  0xCu);
    }

    id v14 = (id)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter"));
    [v14 postNotificationName:PDPeerPaymentServicePreferencesChangedDistributedNotification object:0 userInfo:0 deliverImmediately:0];
    goto LABEL_10;
  }

  uint64_t v15 = PKLogFacilityTypeGetObject(11LL);
  __int128 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138412290;
    id v19 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Error: Failed to fetch an updated peer payment preferences with error: %@.",  (uint8_t *)&v18,  0xCu);
  }

  if (self->_account)
  {
    -[PKPeerPaymentPreferences setDirty:](self->_preferences, "setDirty:", 1LL);
    id v14 = objc_loadWeakRetained((id *)&self->_dataSource);
    id v17 = [v14 insertOrUpdatePeerPaymentPreferences:self->_preferences];
LABEL_10:
  }
}

- (void)_completeUpdatingPreferences
{
  self->_isFetchingPreferences = 0;
  id v3 = -[NSMutableArray copy](self->_pendingPreferencesFetches, "copy");
  -[NSMutableArray removeAllObjects](self->_pendingPreferencesFetches, "removeAllObjects");
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v4 = v3;
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      id v8 = 0LL;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * (void)v8), "completionHandler", (void)v11));
        id v10 = (void *)v9;
        if (v9) {
          (*(void (**)(uint64_t, PKPeerPaymentPreferences *))(v9 + 16))(v9, self->_preferences);
        }

        id v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v6);
  }

  if (-[NSMutableArray count](self->_queuedPendingPreferencesFetches, "count"))
  {
    -[NSMutableArray addObjectsFromArray:]( self->_pendingPreferencesFetches,  "addObjectsFromArray:",  self->_queuedPendingPreferencesFetches);
    -[NSMutableArray removeAllObjects](self->_queuedPendingPreferencesFetches, "removeAllObjects");
    -[PDPeerPaymentWebServiceCoordinator _updatePreferencesWithCompletion:]( self,  "_updatePreferencesWithCompletion:",  0LL);
  }

  kdebug_trace(730333372LL, 0LL, 0LL, 0LL, 0LL);
}

- (void)_handleUpdatedAccount:(id)a3 withOldAccount:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 stage] != (id)1
    || (id v8 = [v6 pendingPaymentCount], (uint64_t)v8 < (uint64_t)objc_msgSend(v7, "pendingPaymentCount")))
  {
    PKSharedCacheSetObjectForKey(0LL, PKSharedCachePeerPaymentPendingPaymentSenderAddressKey);
  }

  if (v7)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v7 associatedAccountInformation]);
    if (v9) {
      [v6 setAssociatedAccountInformation:v9];
    }
  }

  else
  {
    [v6 setAssociatedAccountInformation:0];
  }

  if ([v6 role] == (id)1)
  {
    id v10 = [v7 sendRestrictionType];
    if (v10 != [v6 sendRestrictionType])
    {
      uint64_t Object = PKLogFacilityTypeGetObject(11LL);
      __int128 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Purging recipient cache since the person to person restriction type has changed.",  buf,  2u);
      }

      __int128 v13 = (void *)objc_claimAutoreleasedReturnValue( +[PKPeerPaymentRecipientCache sharedCache]( &OBJC_CLASS___PKPeerPaymentRecipientCache,  "sharedCache"));
      unsigned __int8 v14 = [v13 purgeCache];

      if ((v14 & 1) == 0)
      {
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)__int128 buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Failed to purge the peer payment recipient cache.",  buf,  2u);
        }
      }
    }
  }

  -[PDPeerPaymentWebServiceCoordinator _updatePushTopics](self, "_updatePushTopics");
  if ((char *)[v6 state] - 3 <= (char *)1)
  {
    id v15 = [v7 state];
    if (v15 != [v6 state]) {
      -[PDPeerPaymentWebServiceCoordinator _cancelPendingTransactionNotifications]( self,  "_cancelPendingTransactionNotifications");
    }
  }

  unsigned int v16 = [v6 hasRecurringPayments];
  if (v16 != [v7 hasRecurringPayments]) {
    -[PDPeerPaymentWebServiceCoordinator updateRecurringPaymentsWithCompletion:]( self,  "updateRecurringPaymentsWithCompletion:",  0LL);
  }
  -[PDPeerPaymentWebServiceCoordinator _updateEncryptionCertificatesIfNeededWithAccount:]( self,  "_updateEncryptionCertificatesIfNeededWithAccount:",  v6);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_1003D05B4;
  v19[3] = &unk_10065C100;
  v19[4] = self;
  id v20 = v6;
  id v21 = v7;
  id v17 = v7;
  id v18 = v6;
  -[PDPeerPaymentWebServiceCoordinator _accessObserversWithHandler:](self, "_accessObserversWithHandler:", v19);
}

- (void)_archiveSharedPeerPaymentWebServiceContext
{
  sharedPeerPaymentWebServiceQueue = self->_sharedPeerPaymentWebServiceQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1003D065C;
  block[3] = &unk_100639300;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)sharedPeerPaymentWebServiceQueue, block);
}

- (void)_initalizeCloudStoreIfNecessaryWithCompletion:(id)a3
{
  id v4 = a3;
  sharedPeerPaymentWebServiceQueue = self->_sharedPeerPaymentWebServiceQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1003D077C;
  v7[3] = &unk_10063AC90;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)sharedPeerPaymentWebServiceQueue, v7);
}

- (void)_updateSharedCacheWithWebService:(id)a3
{
  id v4 = a3;
  id v9 = v4;
  if (!v4)
  {
    uint64_t v7 = PKSharedCacheSetBoolForKey(0LL, PKSharedCacheRegisteredForPeerPaymentsKey);
    goto LABEL_5;
  }

  unsigned int v5 = [v4 needsRegistration];
  char v6 = v5;
  uint64_t v7 = PKSharedCacheSetBoolForKey(v5 ^ 1, PKSharedCacheRegisteredForPeerPaymentsKey);
  if ((v6 & 1) != 0)
  {
LABEL_5:
    uint64_t HasDisabledPeerPayment = PKUserHasDisabledPeerPayment(v7);
    PKPeerPaymentSetMessagesExtensionIsVisible(HasDisabledPeerPayment);
    -[PDPeerPaymentWebServiceCoordinator _updateSharedCacheWithAccount:](self, "_updateSharedCacheWithAccount:", 0LL);
    goto LABEL_6;
  }

  PKPeerPaymentSetMessagesExtensionIsVisible(1LL);
LABEL_6:
}

- (void)updateSharedCache
{
}

- (void)_updateSharedCacheWithAccount:(id)a3
{
  id v17 = a3;
  if (v17)
  {
    BOOL v4 = -[PDPeerPaymentWebServiceCoordinator _hasAssociatedPeerPaymentPassSetup]( self,  "_hasAssociatedPeerPaymentPassSetup");
    PKSharedCacheSetBoolForKey(v4, PKSharedCachePeerPaymentIsSetup);
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v17 associatedAccountInformation]);
    char v6 = (void *)objc_claimAutoreleasedReturnValue([v5 associatedAccounts]);
    BOOL v7 = [v6 count] != 0;
    PKSharedCacheSetBoolForKey(v7, PKSharedCachePeerPaymentHasCashFamily);

    id v8 = [v17 supportsSendToUser];
  }

  else
  {
    PKSharedCacheSetBoolForKey(0LL, PKSharedCachePeerPaymentIsSetup);
    PKSharedCacheSetBoolForKey(0LL, PKSharedCachePeerPaymentHasCashFamily);
    id v8 = 0LL;
  }

  PKSharedCacheSetBoolForKey(v8, PKSharedCacheCanSendPeerPaymentsKey);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v17 currentBalance]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 currency]);
  PKSharedCacheSetObjectForKey(v10, PKSharedCachePeerPaymentSendCurrencyKey);

  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v17 sendToUserFeatureDescriptor]);
  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v11 minimumAmount]);
  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v12 stringValue]);
  PKSharedCacheSetObjectForKey(v13, PKSharedCacheMinimumPeerPaymentSendAmountKey);

  unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue([v17 sendToUserFeatureDescriptor]);
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 maximumAmount]);
  unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue([v15 stringValue]);
  PKSharedCacheSetObjectForKey(v16, PKSharedCacheMaximumPeerPaymentSendAmountKey);
}

- (unint64_t)_peerPaymentErrorStateForRegistrationResponse:(id)a3 error:(id)a4 expectsPass:(BOOL)a5
{
  BOOL v5 = a5;
  if (a3) {
    BOOL v6 = a4 == 0LL;
  }
  else {
    BOOL v6 = 0;
  }
  int v7 = v6;
  account = self->_account;
  unsigned int v9 = -[PDPeerPaymentWebServiceCoordinator _peerPaymentPassExists](self, "_peerPaymentPassExists");
  uint64_t Object = PKLogFacilityTypeGetObject(11LL);
  __int128 v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    __int128 v12 = @"NO";
    if (v7) {
      __int128 v13 = @"YES";
    }
    else {
      __int128 v13 = @"NO";
    }
    if (account) {
      unsigned __int8 v14 = @"YES";
    }
    else {
      unsigned __int8 v14 = @"NO";
    }
    int v19 = 138544130;
    id v20 = v13;
    if (v9) {
      id v15 = @"YES";
    }
    else {
      id v15 = @"NO";
    }
    __int16 v21 = 2114;
    __int128 v22 = v14;
    __int16 v23 = 2114;
    id v24 = v15;
    if (v5) {
      __int128 v12 = @"YES";
    }
    __int16 v25 = 2114;
    id v26 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Registered for peer payment with success: %{public}@, account exists: %{public}@, pass exists: %{public}@, expects pass: %{public}@",  (uint8_t *)&v19,  0x2Au);
  }

  uint64_t v16 = 3LL;
  if (v9) {
    uint64_t v16 = 4LL;
  }
  if (!v5) {
    uint64_t v16 = 4LL;
  }
  if (!account) {
    uint64_t v16 = 2LL;
  }
  if (v7) {
    unint64_t v17 = v16;
  }
  else {
    unint64_t v17 = 1LL;
  }

  return v17;
}

- (id)_mockAccountInitialState
{
  v2 = objc_alloc_init(&OBJC_CLASS___PKPeerPaymentAccount);
  -[PKPeerPaymentAccount setCountryCode:](v2, "setCountryCode:", @"US");
  -[PKPeerPaymentAccount setState:](v2, "setState:", 1LL);
  __int128 v42 = v2;
  -[PKPeerPaymentAccount setStage:](v2, "setStage:", 3LL);
  id v3 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue( +[NSDecimalNumber decimalNumberWithString:]( &OBJC_CLASS___NSDecimalNumber,  "decimalNumberWithString:",  @"200.00"));
  uint64_t v4 = PKCurrencyAmountCreate(v3, @"USD", 0LL);
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  -[PKPeerPaymentAccount setCurrentBalance:](v2, "setCurrentBalance:", v5);

  BOOL v6 = objc_alloc_init(&OBJC_CLASS___PKPeerPaymentAccountFeatureDescriptor);
  -[PKPeerPaymentAccountFeatureDescriptor setIdentifier:]( v6,  "setIdentifier:",  PKPeerPaymentAccountFeatureDescriptorIdentifierLoadFromCard);
  int v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDecimalNumber decimalNumberWithString:]( &OBJC_CLASS___NSDecimalNumber,  "decimalNumberWithString:",  @"10.00"));
  -[PKPeerPaymentAccountFeatureDescriptor setMinimumAmount:](v6, "setMinimumAmount:", v7);

  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDecimalNumber decimalNumberWithString:]( &OBJC_CLASS___NSDecimalNumber,  "decimalNumberWithString:",  @"10000.00"));
  -[PKPeerPaymentAccountFeatureDescriptor setMaximumAmount:](v6, "setMaximumAmount:", v8);

  -[PKPeerPaymentAccountFeatureDescriptor setMerchantIdentifier:](v6, "setMerchantIdentifier:", @"com.apple.test");
  __int128 v45 = v6;
  -[PKPeerPaymentAccountFeatureDescriptor setMerchantCapabilities:](v6, "setMerchantCapabilities:", 11LL);
  v49[0] = PKPaymentNetworkVisa;
  v49[1] = PKPaymentNetworkMasterCard;
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v49, 2LL));
  -[PKPeerPaymentAccountFeatureDescriptor setSupportedNetworks:](v6, "setSupportedNetworks:", v9);

  id v10 = objc_alloc_init(&OBJC_CLASS___PKPeerPaymentAccountFeatureDescriptor);
  -[PKPeerPaymentAccountFeatureDescriptor setIdentifier:]( v10,  "setIdentifier:",  PKPeerPaymentAccountFeatureDescriptorIdentifierTransferToBank);
  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDecimalNumber decimalNumberWithString:]( &OBJC_CLASS___NSDecimalNumber,  "decimalNumberWithString:",  @"1.00"));
  __int128 v44 = v10;
  -[PKPeerPaymentAccountFeatureDescriptor setMinimumAmount:](v10, "setMinimumAmount:", v11);

  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDecimalNumber decimalNumberWithString:]( &OBJC_CLASS___NSDecimalNumber,  "decimalNumberWithString:",  @"10000.00"));
  -[PKPeerPaymentAccountFeatureDescriptor setMaximumAmount:](v10, "setMaximumAmount:", v12);

  __int128 v13 = objc_alloc_init(&OBJC_CLASS___PKPeerPaymentAccountFeatureDescriptor);
  -[PKPeerPaymentAccountFeatureDescriptor setIdentifier:]( v13,  "setIdentifier:",  PKPeerPaymentAccountFeatureDescriptorIdentifierInstantWithdrawal);
  unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDecimalNumber decimalNumberWithString:]( &OBJC_CLASS___NSDecimalNumber,  "decimalNumberWithString:",  @"1.00"));
  -[PKPeerPaymentAccountFeatureDescriptor setMinimumAmount:](v13, "setMinimumAmount:", v14);

  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDecimalNumber decimalNumberWithString:]( &OBJC_CLASS___NSDecimalNumber,  "decimalNumberWithString:",  @"10000.00"));
  -[PKPeerPaymentAccountFeatureDescriptor setMaximumAmount:](v13, "setMaximumAmount:", v15);

  -[PKPeerPaymentAccountFeatureDescriptor setMerchantIdentifier:]( v13,  "setMerchantIdentifier:",  @"com.apple.test");
  __int128 v43 = v13;
  -[PKPeerPaymentAccountFeatureDescriptor setMerchantCapabilities:](v13, "setMerchantCapabilities:", 3LL);
  PKPaymentNetwork v48 = PKPaymentNetworkVisa;
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v48, 1LL));
  -[PKPeerPaymentAccountFeatureDescriptor setSupportedNetworks:](v13, "setSupportedNetworks:", v16);

  unint64_t v17 = objc_alloc_init(&OBJC_CLASS___PKPeerPaymentAccountFeatureDescriptor);
  -[PKPeerPaymentAccountFeatureDescriptor setIdentifier:]( v17,  "setIdentifier:",  PKPeerPaymentAccountFeatureDescriptorIdentifierSendToUser);
  id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDecimalNumber decimalNumberWithString:]( &OBJC_CLASS___NSDecimalNumber,  "decimalNumberWithString:",  @"1.00"));
  -[PKPeerPaymentAccountFeatureDescriptor setMinimumAmount:](v17, "setMinimumAmount:", v18);

  int v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDecimalNumber decimalNumberWithString:]( &OBJC_CLASS___NSDecimalNumber,  "decimalNumberWithString:",  @"10000.00"));
  -[PKPeerPaymentAccountFeatureDescriptor setMaximumAmount:](v17, "setMaximumAmount:", v19);

  -[PKPeerPaymentAccountFeatureDescriptor setMerchantIdentifier:]( v17,  "setMerchantIdentifier:",  @"com.apple.test");
  -[PKPeerPaymentAccountFeatureDescriptor setMerchantCapabilities:](v17, "setMerchantCapabilities:", 3LL);
  v47[0] = PKPaymentNetworkVisa;
  v47[1] = PKPaymentNetworkMasterCard;
  v47[2] = PKPaymentNetworkAmex;
  v47[3] = PKPaymentNetworkDiscover;
  id v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v47, 4LL));
  -[PKPeerPaymentAccountFeatureDescriptor setSupportedNetworks:](v17, "setSupportedNetworks:", v20);

  __int16 v21 = objc_alloc_init(&OBJC_CLASS___PKPeerPaymentAccountFeatureDescriptor);
  -[PKPeerPaymentAccountFeatureDescriptor setIdentifier:]( v21,  "setIdentifier:",  PKPeerPaymentAccountFeatureDescriptorIdentifierRequestFromUser);
  __int128 v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSDecimalNumber decimalNumberWithString:]( &OBJC_CLASS___NSDecimalNumber,  "decimalNumberWithString:",  @"1.00"));
  -[PKPeerPaymentAccountFeatureDescriptor setMinimumAmount:](v21, "setMinimumAmount:", v22);

  __int16 v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSDecimalNumber decimalNumberWithString:]( &OBJC_CLASS___NSDecimalNumber,  "decimalNumberWithString:",  @"10000.00"));
  id v41 = v21;
  -[PKPeerPaymentAccountFeatureDescriptor setMaximumAmount:](v21, "setMaximumAmount:", v23);

  id v24 = objc_alloc_init(&OBJC_CLASS___PKPeerPaymentAccountFeatureDescriptor);
  -[PKPeerPaymentAccountFeatureDescriptor setIdentifier:]( v24,  "setIdentifier:",  PKPeerPaymentAccountFeatureDescriptorIdentifierCardBalancePromotion);
  __int16 v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSDecimalNumber decimalNumberWithString:]( &OBJC_CLASS___NSDecimalNumber,  "decimalNumberWithString:",  @"10.00"));
  -[PKPeerPaymentAccountFeatureDescriptor setMinimumAmount:](v24, "setMinimumAmount:", v25);

  id v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSDecimalNumber decimalNumberWithString:]( &OBJC_CLASS___NSDecimalNumber,  "decimalNumberWithString:",  @"20000.00"));
  -[PKPeerPaymentAccountFeatureDescriptor setMaximumAmount:](v24, "setMaximumAmount:", v26);

  id v27 = objc_alloc_init(&OBJC_CLASS___PKPeerPaymentAccountFeatureDescriptor);
  -[PKPeerPaymentAccountFeatureDescriptor setIdentifier:]( v27,  "setIdentifier:",  PKPeerPaymentAccountFeatureDescriptorIdentifierRecurringPayments);
  uint64_t v28 = objc_alloc_init(&OBJC_CLASS___PKPeerPaymentAccountFeatureDescriptor);
  -[PKPeerPaymentAccountFeatureDescriptor setIdentifier:]( v28,  "setIdentifier:",  PKPeerPaymentAccountFeatureDescriptorIdentifierThresholdTopUp);
  v46[0] = v6;
  v46[1] = v44;
  v46[2] = v43;
  v46[3] = v17;
  v46[4] = v21;
  v46[5] = v24;
  v46[6] = v27;
  v46[7] = v28;
  __int128 v29 = v27;
  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v46, 8LL));
  id v31 = objc_alloc_init(&OBJC_CLASS___PKPeerPaymentAccountFeatureDescriptor);
  -[PKPeerPaymentAccountFeatureDescriptor setIdentifier:]( v31,  "setIdentifier:",  PKPeerPaymentAccountFeatureDescriptorIdentifierDeviceTap);
  id v32 = [v30 arrayByAddingObject:v31];
  __int16 v33 = objc_alloc_init(&OBJC_CLASS___PKPeerPaymentPaymentModeIdentifiers);
  -[PKPeerPaymentPaymentModeIdentifiers setDeviceTap:](v33, "setDeviceTap:", @"12345678");
  -[PKPeerPaymentAccount setPaymentModeIdentifiers:](v42, "setPaymentModeIdentifiers:", v33);
  v34 = objc_alloc_init(&OBJC_CLASS___PKPeerPaymentEncryptionCertificatesVersions);
  -[PKPeerPaymentEncryptionCertificatesVersions setRecipientData:](v34, "setRecipientData:", 1LL);
  -[PKPeerPaymentAccount setEncryptionCertificatesVersions:](v42, "setEncryptionCertificatesVersions:", v34);
  id v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v30));
  -[PKPeerPaymentAccount setSupportedFeatureDescriptors:](v42, "setSupportedFeatureDescriptors:", v35);

  uint64_t v36 = PKMockPeerPaymentPassSerialNumber();
  BOOL v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
  -[PKPeerPaymentAccount setAssociatedPassSerialNumber:](v42, "setAssociatedPassSerialNumber:", v37);

  uint64_t v38 = PKMockPeerPaymentPassPassTypeID();
  id v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
  -[PKPeerPaymentAccount setAssociatedPassTypeIdentifier:](v42, "setAssociatedPassTypeIdentifier:", v39);

  return v42;
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_lockObservers);
    -[NSHashTable addObject:](self->_observers, "addObject:", v4);
    os_unfair_lock_unlock(&self->_lockObservers);
  }
}

- (void)unregisterObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_lockObservers);
    -[NSHashTable removeObject:](self->_observers, "removeObject:", v4);
    os_unfair_lock_unlock(&self->_lockObservers);
  }
}

- (void)_accessObserversWithHandler:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_lockObservers);
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSHashTable allObjects](self->_observers, "allObjects"));
    os_unfair_lock_unlock(&self->_lockObservers);
    replyQueue = self->_replyQueue;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_1003D12B8;
    v8[3] = &unk_10063AC90;
    id v9 = v5;
    id v10 = v4;
    id v7 = v5;
    dispatch_async((dispatch_queue_t)replyQueue, v8);
  }
}

- (PDCloudStoreNotificationCoordinator)cloudStoreNotificationCoordinator
{
  return self->_cloudStoreNotificationCoordinator;
}

- (void)setCloudStoreNotificationCoordinator:(id)a3
{
}

- (PDDeviceRegistrationServiceCoordinator)deviceRegistrationCoordinator
{
  return self->_deviceRegistrationCoordinator;
}

- (void)setDeviceRegistrationCoordinator:(id)a3
{
}

- (PKPaymentWebService)paymentWebService
{
  return self->_paymentWebService;
}

- (void)setPaymentWebService:(id)a3
{
}

- (void).cxx_destruct
{
}

@end