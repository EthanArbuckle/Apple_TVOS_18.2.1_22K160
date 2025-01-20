@interface PDPeerPaymentService
- (PDDatabaseManager)databaseManager;
- (PDPeerPaymentAccountManager)peerPaymentAccountManager;
- (PDPeerPaymentService)initWithConnection:(id)a3;
- (PDPeerPaymentService)initWithConnection:(id)a3 server:(id)a4;
- (PDPeerPaymentWebServiceCoordinator)peerPaymentWebServiceCoordinator;
- (PDUserNotificationManager)userNotificationManager;
- (PKSharingIDSManager)idsSharingManager;
- (id)_displayNameForAddress:(id)a3;
- (void)_notifyPendingRequestsChangedObservers;
- (void)_notifyRecurringPaymentsChangedObservers;
- (void)_removeAllNotificationsForPeerPaymentPendingRequests;
- (void)_removeAllNotificationsForPeerPaymentRecurringPayments;
- (void)_removeNotificationsForPeerPaymentPendingRequestWithRequestTokens:(id)a3;
- (void)_removeNotificationsForPeerPaymentRecurringPaymentsWithIdentifiers:(id)a3;
- (void)_scheduleNotificationsForPeerPaymentPendingRequests:(id)a3;
- (void)accountWithCompletion:(id)a3;
- (void)balanceForPass:(id)a3 completion:(id)a4;
- (void)checkTLKsMissingWithCompletion:(id)a3;
- (void)cloudStoreStatusWithCompletion:(id)a3;
- (void)counterpartImageDataForTransactionWithIdentifier:(id)a3 completion:(id)a4;
- (void)counterpartImageDataWithCompletion:(id)a3;
- (void)counterpartImageDataWithIdentifier:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)deleteAccountWithCompletion:(id)a3;
- (void)deleteAllCounterpartImageDataWithCompletion:(id)a3;
- (void)deleteAllRecurringPaymentsWithCompletion:(id)a3;
- (void)deletePeerPaymentPendingRequestsForPeerPaymentAccountWithCompletion:(id)a3;
- (void)deletePeerPaymentPendingRequestsForRequestTokens:(id)a3 completion:(id)a4;
- (void)deletePreferencesWithCompletion:(id)a3;
- (void)deleteRecurringPaymentsForIdentifiers:(id)a3 completion:(id)a4;
- (void)downloadPassIfNecessaryWithCompletion:(id)a3;
- (void)encryptData:(id)a3 usingCertificateWithDestination:(unint64_t)a4 completion:(id)a5;
- (void)encryptionCertificateForDestination:(unint64_t)a3 forceUpdate:(BOOL)a4 completion:(id)a5;
- (void)hasRecurringPayments:(id)a3;
- (void)initalizeCloudStoreIfNecessaryWithHandler:(id)a3;
- (void)insertOrUpdateDeviceOriginatedNearbyPeerPaymentTransactionWithIdentifier:(id)a3 memo:(id)a4 counterpartAppearanceData:(id)a5 completion:(id)a6;
- (void)insertOrUpdateNearbyPeerPaymentSetupNotificationWithTransactionIdentifier:(id)a3 amount:(id)a4 currency:(id)a5 senderName:(id)a6 completion:(id)a7;
- (void)insertOrUpdatePeerPaymentPendingRequests:(id)a3 shouldScheduleNotifications:(BOOL)a4 completion:(id)a5;
- (void)insertOrUpdateRecurringPayments:(id)a3 completion:(id)a4;
- (void)lastUsedAlternateFundingSourcePassUniqueIdentifier:(id)a3;
- (void)peerPaymentAccountManagerPendingRequestsChanged;
- (void)peerPaymentAccountManagerRecurringPaymentsChanged;
- (void)peerPaymentPendingRequestsForPeerPaymentAccountWithCompletion:(id)a3;
- (void)peerPaymentPendingRequestsForRequestTokens:(id)a3 completion:(id)a4;
- (void)peerPaymentWebServiceCoordinatorPendingRequestsChanged;
- (void)peerPaymentWebServiceCoordinatorRecurringPaymentsChanged;
- (void)performRecurringPaymentAction:(unint64_t)a3 identifier:(id)a4 completion:(id)a5;
- (void)preferencesWithCompletion:(id)a3;
- (void)presentIdentityVerificationFlowWithResponseData:(id)a3 orientation:(id)a4 completion:(id)a5;
- (void)presentPeerPaymentTermsAndConditionsWithTermsURL:(id)a3 termsIdentifier:(id)a4 passUniqueID:(id)a5 orientation:(id)a6 completion:(id)a7;
- (void)presentReceiverFlowWithOrientation:(id)a3 host:(unint64_t)a4 completion:(id)a5;
- (void)presentRegistrationFlowWithAccount:(id)a3 amount:(id)a4 state:(unint64_t)a5 senderAddress:(id)a6 orientation:(id)a7 hostSceneIdentifier:(id)a8 hostSceneBundleIdentifier:(id)a9 completion:(id)a10;
- (void)presentSenderFlowWithHost:(unint64_t)a3 userInfo:(id)a4 completion:(id)a5;
- (void)receivedPeerPaymentMessageData:(id)a3 handler:(id)a4;
- (void)recurringPaymentsWithCompletion:(id)a3;
- (void)registerDeviceWithCompletion:(id)a3;
- (void)registerDeviceWithForceReregister:(BOOL)a3 completion:(id)a4;
- (void)registerDeviceWithRegistrationURL:(id)a3 pushToken:(id)a4 forceReregister:(BOOL)a5 completion:(id)a6;
- (void)registrationStatusWithCompletion:(id)a3;
- (void)remoteRegistrationRequest:(id)a3 forHandle:(id)a4 completion:(id)a5;
- (void)reportFailureDiagnostic:(id)a3 completion:(id)a4;
- (void)resetApplePayManateeViewWithCompletion:(id)a3;
- (void)setDatabaseManager:(id)a3;
- (void)setIdsSharingManager:(id)a3;
- (void)setLastUsedAlternateFundingSourcePassUniqueIdentifier:(id)a3 handler:(id)a4;
- (void)setPeerPaymentAccountManager:(id)a3;
- (void)setPeerPaymentWebServiceCoordinator:(id)a3;
- (void)setPreferences:(id)a3 completion:(id)a4;
- (void)setUserNotificationManager:(id)a3;
- (void)unregisterDeviceWithCompletion:(id)a3;
- (void)updateAccountAndAssociatedAccountsWithCompletion:(id)a3;
- (void)updateAccountWithCompletion:(id)a3;
- (void)updateAssociatedAccountsWithCompletion:(id)a3;
- (void)updateAutoReloadAmount:(id)a3 threshold:(id)a4 identifier:(id)a5 completion:(id)a6;
- (void)updateMessageReceivedDate:(id)a3 forTransactionWithIdentifier:(id)a4 handler:(id)a5;
- (void)updateMockAccountBalanceByAddingAmount:(id)a3 completion:(id)a4;
- (void)updatePreferencesWithCompletion:(id)a3;
- (void)updateRecurringPaymentMemo:(id)a3 identifier:(id)a4 completion:(id)a5;
- (void)updateRecurringPaymentStatus:(unint64_t)a3 identifier:(id)a4 completion:(id)a5;
- (void)updateRecurringPaymentsWithCompletion:(id)a3;
- (void)usingSynchronousProxy:(BOOL)a3 fetchSharedPeerPaymentWebServiceContextWithHandler:(id)a4;
- (void)usingSynchronousProxy:(BOOL)a3 setSharedPeerPaymentWebServiceContext:(id)a4 withCompletion:(id)a5;
@end

@implementation PDPeerPaymentService

- (PDPeerPaymentService)initWithConnection:(id)a3
{
  return 0LL;
}

- (PDPeerPaymentService)initWithConnection:(id)a3 server:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___PDPeerPaymentService;
  v8 = -[PDPeerPaymentService initWithConnection:](&v21, "initWithConnection:", v6);
  if (v8)
  {
    v9 = -[PKEntitlementWhitelist initWithConnection:]( objc_alloc(&OBJC_CLASS___PKEntitlementWhitelist),  "initWithConnection:",  v6);
    whitelist = v8->_whitelist;
    v8->_whitelist = v9;

    uint64_t v11 = sub_10002A820((uint64_t)v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    uint64_t v13 = sub_100016B80((uint64_t)v12);
    uint64_t v14 = objc_claimAutoreleasedReturnValue(v13);
    remoteInterfacePresenter = v8->_remoteInterfacePresenter;
    v8->_remoteInterfacePresenter = (PDRemoteInterfacePresenter *)v14;

    uint64_t v16 = PKPeerPaymentServiceInterface();
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    [v6 setRemoteObjectInterface:v17];

    uint64_t v18 = PDPeerPaymentServiceInterface();
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    [v6 setExportedInterface:v19];

    [v6 setExportedObject:v8];
  }

  return v8;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PDPeerPaymentService;
  -[PDPeerPaymentService dealloc](&v3, "dealloc");
}

- (void)setIdsSharingManager:(id)a3
{
  v5 = (PKSharingIDSManager *)a3;
  if (self->_idsSharingManager != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_idsSharingManager, a3);
    v5 = v6;
  }
}

- (void)setPeerPaymentAccountManager:(id)a3
{
  v5 = (PDPeerPaymentAccountManager *)a3;
  peerPaymentAccountManager = self->_peerPaymentAccountManager;
  if (peerPaymentAccountManager != v5)
  {
    id v7 = v5;
    if (peerPaymentAccountManager) {
      -[PDPeerPaymentAccountManager unregisterObserver:](peerPaymentAccountManager, "unregisterObserver:", self);
    }
    objc_storeStrong((id *)&self->_peerPaymentAccountManager, a3);
    -[PDPeerPaymentAccountManager registerObserver:](self->_peerPaymentAccountManager, "registerObserver:", self);
    v5 = v7;
  }
}

- (void)setPeerPaymentWebServiceCoordinator:(id)a3
{
  v5 = (PDPeerPaymentWebServiceCoordinator *)a3;
  peerPaymentWebServiceCoordinator = self->_peerPaymentWebServiceCoordinator;
  if (peerPaymentWebServiceCoordinator != v5)
  {
    id v7 = v5;
    if (peerPaymentWebServiceCoordinator) {
      -[PDPeerPaymentWebServiceCoordinator unregisterObserver:]( peerPaymentWebServiceCoordinator,  "unregisterObserver:",  self);
    }
    objc_storeStrong((id *)&self->_peerPaymentWebServiceCoordinator, a3);
    -[PDPeerPaymentWebServiceCoordinator registerObserver:]( self->_peerPaymentWebServiceCoordinator,  "registerObserver:",  self);
    v5 = v7;
  }
}

- (void)usingSynchronousProxy:(BOOL)a3 fetchSharedPeerPaymentWebServiceContextWithHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = (void (**)(id, void *))a4;
  if (v6)
  {
    if ((-[PKEntitlementWhitelist peerPaymentAllAccess](self->_whitelist, "peerPaymentAllAccess") & 1) != 0)
    {
      if (v4)
      {
        id v7 = objc_autoreleasePoolPush();
        v8 = (void *)objc_claimAutoreleasedReturnValue( -[PDPeerPaymentWebServiceCoordinator sharedPeerPaymentWebService]( self->_peerPaymentWebServiceCoordinator,  "sharedPeerPaymentWebService"));
        v9 = (void *)objc_claimAutoreleasedReturnValue([v8 context]);
        v6[2](v6, v9);

        objc_autoreleasePoolPop(v7);
      }

      else
      {
        id v12 = PDDefaultQueue();
        uint64_t v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v12);
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472LL;
        v14[2] = sub_10010E9A4;
        v14[3] = &unk_1006396B0;
        v14[4] = self;
        v15 = v6;
        dispatch_async(v13, v14);
      }
    }

    else
    {
      uint64_t Object = PKLogFacilityTypeGetObject(11LL);
      uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v17 = "-[PDPeerPaymentService usingSynchronousProxy:fetchSharedPeerPaymentWebServiceContextWithHandler:]";
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  buf,  0xCu);
      }

      v6[2](v6, 0LL);
    }
  }
}

- (void)usingSynchronousProxy:(BOOL)a3 setSharedPeerPaymentWebServiceContext:(id)a4 withCompletion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  v9 = (void (**)(void))a5;
  if ((-[PKEntitlementWhitelist peerPaymentAllAccess](self->_whitelist, "peerPaymentAllAccess") & 1) != 0)
  {
    if (v6)
    {
      v10 = objc_autoreleasePoolPush();
      -[PDPeerPaymentWebServiceCoordinator updateSharedWebServiceContext:]( self->_peerPaymentWebServiceCoordinator,  "updateSharedWebServiceContext:",  v8);
      if (v9) {
        v9[2](v9);
      }
      objc_autoreleasePoolPop(v10);
    }

    else
    {
      id v13 = PDDefaultQueue();
      uint64_t v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v13);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10010EBA8;
      block[3] = &unk_100639AF0;
      block[4] = self;
      id v16 = v8;
      v17 = v9;
      dispatch_async(v14, block);
    }
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(11LL);
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v19 = "-[PDPeerPaymentService usingSynchronousProxy:setSharedPeerPaymentWebServiceContext:withCompletion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  buf,  0xCu);
    }

    if (v9) {
      v9[2](v9);
    }
  }
}

- (void)accountWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
    BOOL v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10010ECC8;
    v8[3] = &unk_10063AC90;
    v8[4] = self;
    id v9 = v4;
    id v7 = v8;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001172BC;
    block[3] = &unk_10063A830;
    id v11 = v7;
    dispatch_async(v6, block);
  }
}

- (void)preferencesWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
    BOOL v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10010EEBC;
    v8[3] = &unk_10063AC90;
    v8[4] = self;
    id v9 = v4;
    id v7 = v8;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001172BC;
    block[3] = &unk_10063A830;
    id v11 = v7;
    dispatch_async(v6, block);
  }
}

- (void)updateAccountWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
    BOOL v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10010F0AC;
    v8[3] = &unk_10063AC90;
    v8[4] = self;
    id v9 = v4;
    id v7 = v8;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001172BC;
    block[3] = &unk_10063A830;
    id v11 = v7;
    dispatch_async(v6, block);
  }
}

- (void)updateAssociatedAccountsWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
    BOOL v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10010F29C;
    v8[3] = &unk_10063AC90;
    v8[4] = self;
    id v9 = v4;
    id v7 = v8;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001172BC;
    block[3] = &unk_10063A830;
    id v11 = v7;
    dispatch_async(v6, block);
  }
}

- (void)updateAccountAndAssociatedAccountsWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
    BOOL v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10010F48C;
    v8[3] = &unk_10063AC90;
    v8[4] = self;
    id v9 = v4;
    id v7 = v8;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001172BC;
    block[3] = &unk_10063A830;
    id v11 = v7;
    dispatch_async(v6, block);
  }
}

- (void)updatePreferencesWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
    BOOL v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10010F67C;
    v8[3] = &unk_10063AC90;
    v8[4] = self;
    id v9 = v4;
    id v7 = v8;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001172BC;
    block[3] = &unk_10063A830;
    id v11 = v7;
    dispatch_async(v6, block);
  }
}

- (void)updateMockAccountBalanceByAddingAmount:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
    id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10010F894;
    v11[3] = &unk_100639AF0;
    v11[4] = self;
    id v12 = v6;
    id v13 = v7;
    v10 = v11;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001172BC;
    block[3] = &unk_10063A830;
    id v15 = v10;
    dispatch_async(v9, block);
  }
}

- (void)deleteAccountWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10010FA80;
  v9[3] = &unk_10063AC90;
  v9[4] = self;
  id v10 = v4;
  id v7 = v9;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001172BC;
  block[3] = &unk_10063A830;
  id v12 = v7;
  id v8 = v4;
  dispatch_async(v6, block);
}

- (void)deletePreferencesWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10010FC6C;
  v9[3] = &unk_10063AC90;
  v9[4] = self;
  id v10 = v4;
  id v7 = v9;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001172BC;
  block[3] = &unk_10063A830;
  id v12 = v7;
  id v8 = v4;
  dispatch_async(v6, block);
}

- (void)setPreferences:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10010FE84;
  v13[3] = &unk_100639AF0;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v10 = v13;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001172BC;
  block[3] = &unk_10063A830;
  id v17 = v10;
  id v11 = v7;
  id v12 = v6;
  dispatch_async(v9, block);
}

- (void)registrationStatusWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
    id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10011007C;
    v8[3] = &unk_10063AC90;
    v8[4] = self;
    id v9 = v4;
    id v7 = v8;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001172BC;
    block[3] = &unk_10063A830;
    id v11 = v7;
    dispatch_async(v6, block);
  }
}

- (void)presentIdentityVerificationFlowWithResponseData:(id)a3 orientation:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (-[PKEntitlementWhitelist peerPaymentAllAccess](self->_whitelist, "peerPaymentAllAccess"))
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_100110374;
    v18[3] = &unk_100644B58;
    v18[4] = self;
    id v19 = v9;
    id v20 = v10;
    id v11 = objc_retainBlock(v18);
    id v12 = v11;
    if (v8)
    {
      ((void (*)(void *, id))v11[2])(v11, v8);
    }

    else
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue(-[PDPeerPaymentService peerPaymentWebServiceCoordinator](self, "peerPaymentWebServiceCoordinator"));
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472LL;
      v16[2] = sub_1001104D0;
      v16[3] = &unk_100644B80;
      id v17 = v12;
      [v15 identityVerificationResponseWithCompletion:v16];
    }
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(0LL);
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v22 = "-[PDPeerPaymentService presentIdentityVerificationFlowWithResponseData:orientation:completion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  buf,  0xCu);
    }

    if (v10) {
      (*((void (**)(id, void))v10 + 2))(v10, 0LL);
    }
  }
}

- (void)presentRegistrationFlowWithAccount:(id)a3 amount:(id)a4 state:(unint64_t)a5 senderAddress:(id)a6 orientation:(id)a7 hostSceneIdentifier:(id)a8 hostSceneBundleIdentifier:(id)a9 completion:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  if (-[PKEntitlementWhitelist peerPaymentAllAccess](self->_whitelist, "peerPaymentAllAccess"))
  {
    id v23 = PDDefaultQueue();
    v24 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v23);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10011073C;
    block[3] = &unk_100644BA8;
    void block[4] = self;
    id v28 = v16;
    id v29 = v17;
    unint64_t v35 = a5;
    id v30 = v18;
    id v31 = v19;
    id v32 = v20;
    id v33 = v21;
    id v34 = v22;
    dispatch_async(v24, block);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(0LL);
    v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v37 = "-[PDPeerPaymentService presentRegistrationFlowWithAccount:amount:state:senderAddress:orientation:hostSceneId"
            "entifier:hostSceneBundleIdentifier:completion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  buf,  0xCu);
    }

    if (v22) {
      (*((void (**)(id, void))v22 + 2))(v22, 0LL);
    }
  }
}

- (void)presentPeerPaymentTermsAndConditionsWithTermsURL:(id)a3 termsIdentifier:(id)a4 passUniqueID:(id)a5 orientation:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (-[PKEntitlementWhitelist peerPaymentAllAccess](self->_whitelist, "peerPaymentAllAccess"))
  {
    id v17 = PDDefaultQueue();
    id v18 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v17);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_100110A08;
    v21[3] = &unk_10063AD70;
    id v22 = v12;
    id v23 = v13;
    v24 = self;
    id v25 = v14;
    id v26 = v15;
    id v27 = v16;
    dispatch_async(v18, v21);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(0LL);
    id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v29 = "-[PDPeerPaymentService presentPeerPaymentTermsAndConditionsWithTermsURL:termsIdentifier:passUniqueID:orienta"
            "tion:completion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  buf,  0xCu);
    }

    if (v16) {
      (*((void (**)(id, void))v16 + 2))(v16, 0LL);
    }
  }
}

- (void)receivedPeerPaymentMessageData:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  if (-[PKEntitlementWhitelist peerPaymentAllAccess](self->_whitelist, "peerPaymentAllAccess"))
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
    id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_100110C44;
    v20[3] = &unk_100639AF0;
    v20[4] = self;
    id v21 = v6;
    id v22 = v7;
    id v10 = v20;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001172BC;
    block[3] = &unk_10063A830;
    id v24 = v10;
    dispatch_async(v9, block);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(0LL);
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100441B78(v12, v13, v14, v15, v16, v17, v18, v19);
    }

    if (v7) {
      v7[2](v7);
    }
  }
}

- (void)updateMessageReceivedDate:(id)a3 forTransactionWithIdentifier:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(void))a5;
  if (-[PKEntitlementWhitelist peerPaymentAllAccess](self->_whitelist, "peerPaymentAllAccess"))
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
    id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_10011117C;
    v23[3] = &unk_10063B440;
    v23[4] = self;
    id v24 = v8;
    id v25 = v9;
    id v26 = v10;
    uint64_t v13 = v23;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001172BC;
    block[3] = &unk_10063A830;
    id v28 = v13;
    dispatch_async(v12, block);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(0LL);
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_100441BAC(v15, v16, v17, v18, v19, v20, v21, v22);
    }

    if (v10) {
      v10[2](v10);
    }
  }
}

- (void)balanceForPass:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[PKEntitlementWhitelist peerPaymentAllAccess](self->_whitelist, "peerPaymentAllAccess"))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PDPeerPaymentService peerPaymentWebServiceCoordinator](self, "peerPaymentWebServiceCoordinator"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_10011142C;
    v9[3] = &unk_10063A880;
    id v10 = v6;
    id v11 = v7;
    [v8 accountWithPreventingServerFetch:1 completion:v9];
  }

  else if (v7)
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0LL);
  }
}

- (void)lastUsedAlternateFundingSourcePassUniqueIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
    id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_1001115AC;
    v8[3] = &unk_10063AC90;
    v8[4] = self;
    id v9 = v4;
    id v7 = v8;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001172BC;
    block[3] = &unk_10063A830;
    id v11 = v7;
    dispatch_async(v6, block);
  }
}

- (void)setLastUsedAlternateFundingSourcePassUniqueIdentifier:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100111798;
  v13[3] = &unk_100639AF0;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v10 = v13;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001172BC;
  block[3] = &unk_10063A830;
  id v17 = v10;
  id v11 = v7;
  id v12 = v6;
  dispatch_async(v9, block);
}

- (void)downloadPassIfNecessaryWithCompletion:(id)a3
{
  id v4 = a3;
  if (-[PKEntitlementWhitelist peerPaymentAllAccess](self->_whitelist, "peerPaymentAllAccess"))
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
    id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_1001119D0;
    v8[3] = &unk_10063AC90;
    v8[4] = self;
    id v9 = v4;
    id v7 = v8;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001172BC;
    block[3] = &unk_10063A830;
    id v11 = v7;
    dispatch_async(v6, block);
  }

  else if (v4)
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0LL);
  }
}

- (void)registerDeviceWithCompletion:(id)a3
{
  id v4 = a3;
  if (-[PKEntitlementWhitelist peerPaymentAllAccess](self->_whitelist, "peerPaymentAllAccess"))
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
    id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100111B14;
    v8[3] = &unk_10063AC90;
    v8[4] = self;
    id v9 = v4;
    id v7 = v8;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001172BC;
    block[3] = &unk_10063A830;
    id v11 = v7;
    dispatch_async(v6, block);
  }

  else if (v4)
  {
    (*((void (**)(id, void, void))v4 + 2))(v4, 0LL, 0LL);
  }
}

- (void)registerDeviceWithForceReregister:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  if (-[PKEntitlementWhitelist peerPaymentAllAccess](self->_whitelist, "peerPaymentAllAccess"))
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
    id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_100111CC4;
    v10[3] = &unk_100644C20;
    v10[4] = self;
    BOOL v12 = a3;
    id v11 = v6;
    id v9 = v10;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001172BC;
    block[3] = &unk_10063A830;
    id v14 = v9;
    dispatch_async(v8, block);
  }

  else if (v6)
  {
    (*((void (**)(id, void, void))v6 + 2))(v6, 0LL, 0LL);
  }
}

- (void)registerDeviceWithRegistrationURL:(id)a3 pushToken:(id)a4 forceReregister:(BOOL)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (-[PKEntitlementWhitelist peerPaymentAllAccess](self->_whitelist, "peerPaymentAllAccess"))
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
    id v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_100111ECC;
    v16[3] = &unk_10063DA48;
    void v16[4] = self;
    id v17 = v10;
    id v18 = v11;
    BOOL v20 = a5;
    id v19 = v12;
    id v15 = v16;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001172BC;
    block[3] = &unk_10063A830;
    id v22 = v15;
    dispatch_async(v14, block);
  }

  else if (v12)
  {
    (*((void (**)(id, void, void))v12 + 2))(v12, 0LL, 0LL);
  }
}

- (void)unregisterDeviceWithCompletion:(id)a3
{
  id v4 = a3;
  if (-[PKEntitlementWhitelist peerPaymentAllAccess](self->_whitelist, "peerPaymentAllAccess"))
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
    id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100112018;
    v8[3] = &unk_10063AC90;
    v8[4] = self;
    id v9 = v4;
    id v7 = v8;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001172BC;
    block[3] = &unk_10063A830;
    id v11 = v7;
    dispatch_async(v6, block);
  }

  else if (v4)
  {
    (*((void (**)(id, void, void))v4 + 2))(v4, 0LL, 0LL);
  }
}

- (void)initalizeCloudStoreIfNecessaryWithHandler:(id)a3
{
  id v4 = a3;
  if (-[PKEntitlementWhitelist peerPaymentAllAccess](self->_whitelist, "peerPaymentAllAccess"))
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
    id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_1001121B4;
    v8[3] = &unk_10063AC90;
    v8[4] = self;
    id v9 = v4;
    id v7 = v8;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001172BC;
    block[3] = &unk_10063A830;
    id v11 = v7;
    dispatch_async(v6, block);
  }

  else if (v4)
  {
    (*((void (**)(id, void, void))v4 + 2))(v4, 0LL, 0LL);
  }
}

- (void)cloudStoreStatusWithCompletion:(id)a3
{
  id v4 = a3;
  if (-[PKEntitlementWhitelist peerPaymentAllAccess](self->_whitelist, "peerPaymentAllAccess"))
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
    id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100112354;
    v8[3] = &unk_10063AC90;
    v8[4] = self;
    id v9 = v4;
    id v7 = v8;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001172BC;
    block[3] = &unk_10063A830;
    id v11 = v7;
    dispatch_async(v6, block);
  }

  else if (v4)
  {
    (*((void (**)(id, void, void, void))v4 + 2))(v4, 0LL, 0LL, 0LL);
  }
}

- (void)checkTLKsMissingWithCompletion:(id)a3
{
  id v4 = a3;
  if (-[PKEntitlementWhitelist peerPaymentAllAccess](self->_whitelist, "peerPaymentAllAccess"))
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
    id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_1001124F0;
    v8[3] = &unk_10063AC90;
    v8[4] = self;
    id v9 = v4;
    id v7 = v8;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001172BC;
    block[3] = &unk_10063A830;
    id v11 = v7;
    dispatch_async(v6, block);
  }

  else if (v4)
  {
    (*((void (**)(id, void, void))v4 + 2))(v4, 0LL, 0LL);
  }
}

- (void)resetApplePayManateeViewWithCompletion:(id)a3
{
  id v4 = a3;
  if (-[PKEntitlementWhitelist peerPaymentAllAccess](self->_whitelist, "peerPaymentAllAccess"))
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
    id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10011268C;
    v8[3] = &unk_10063AC90;
    v8[4] = self;
    id v9 = v4;
    id v7 = v8;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001172BC;
    block[3] = &unk_10063A830;
    id v11 = v7;
    dispatch_async(v6, block);
  }

  else if (v4)
  {
    (*((void (**)(id, void, void))v4 + 2))(v4, 0LL, 0LL);
  }
}

- (void)remoteRegistrationRequest:(id)a3 forHandle:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (-[PKEntitlementWhitelist peerPaymentAllAccess](self->_whitelist, "peerPaymentAllAccess"))
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
    id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_10011286C;
    v14[3] = &unk_10063B440;
    v14[4] = self;
    id v15 = v8;
    id v16 = v9;
    id v17 = v10;
    uint64_t v13 = v14;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001172BC;
    block[3] = &unk_10063A830;
    id v19 = v13;
    dispatch_async(v12, block);
  }

  else if (v10)
  {
    (*((void (**)(id, void))v10 + 2))(v10, 0LL);
  }
}

- (void)peerPaymentPendingRequestsForRequestTokens:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100112A18;
  v13[3] = &unk_100639AF0;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v10 = v13;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001172BC;
  block[3] = &unk_10063A830;
  id v17 = v10;
  id v11 = v7;
  id v12 = v6;
  dispatch_async(v9, block);
}

- (void)peerPaymentPendingRequestsForPeerPaymentAccountWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100112C08;
  v9[3] = &unk_10063AC90;
  void v9[4] = self;
  id v10 = v4;
  id v7 = v9;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001172BC;
  block[3] = &unk_10063A830;
  id v12 = v7;
  id v8 = v4;
  dispatch_async(v6, block);
}

- (void)insertOrUpdatePeerPaymentPendingRequests:(id)a3 shouldScheduleNotifications:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100112E2C;
  v15[3] = &unk_10063B100;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  BOOL v18 = a4;
  id v12 = v15;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001172BC;
  block[3] = &unk_10063A830;
  id v20 = v12;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, block);
}

- (void)deletePeerPaymentPendingRequestsForRequestTokens:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100113050;
  v13[3] = &unk_100639AF0;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v10 = v13;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001172BC;
  block[3] = &unk_10063A830;
  id v17 = v10;
  id v11 = v7;
  id v12 = v6;
  dispatch_async(v9, block);
}

- (void)deletePeerPaymentPendingRequestsForPeerPaymentAccountWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100113240;
  v9[3] = &unk_10063AC90;
  void v9[4] = self;
  id v10 = v4;
  id v7 = v9;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001172BC;
  block[3] = &unk_10063A830;
  id v12 = v7;
  id v8 = v4;
  dispatch_async(v6, block);
}

- (void)recurringPaymentsWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100113430;
  v9[3] = &unk_10063AC90;
  void v9[4] = self;
  id v10 = v4;
  id v7 = v9;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001172BC;
  block[3] = &unk_10063A830;
  id v12 = v7;
  id v8 = v4;
  dispatch_async(v6, block);
}

- (void)updateAutoReloadAmount:(id)a3 threshold:(id)a4 identifier:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
  id v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_10011369C;
  v21[3] = &unk_10063CD88;
  void v21[4] = self;
  id v22 = v10;
  id v23 = v11;
  id v24 = v12;
  id v25 = v13;
  id v16 = v21;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001172BC;
  block[3] = &unk_10063A830;
  id v27 = v16;
  id v17 = v13;
  id v18 = v12;
  id v19 = v11;
  id v20 = v10;
  dispatch_async(v15, block);
}

- (void)updateRecurringPaymentsWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100113890;
  v9[3] = &unk_10063AC90;
  void v9[4] = self;
  id v10 = v4;
  id v7 = v9;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001172BC;
  block[3] = &unk_10063A830;
  id v12 = v7;
  id v8 = v4;
  dispatch_async(v6, block);
}

- (void)insertOrUpdateRecurringPayments:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100113AB0;
  v13[3] = &unk_100639AF0;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v10 = v13;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001172BC;
  block[3] = &unk_10063A830;
  id v17 = v10;
  id v11 = v7;
  id v12 = v6;
  dispatch_async(v9, block);
}

- (void)deleteRecurringPaymentsForIdentifiers:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100113CC8;
  v13[3] = &unk_100639AF0;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v10 = v13;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001172BC;
  block[3] = &unk_10063A830;
  id v17 = v10;
  id v11 = v7;
  id v12 = v6;
  dispatch_async(v9, block);
}

- (void)deleteAllRecurringPaymentsWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100113EB8;
  v9[3] = &unk_10063AC90;
  void v9[4] = self;
  id v10 = v4;
  id v7 = v9;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001172BC;
  block[3] = &unk_10063A830;
  id v12 = v7;
  id v8 = v4;
  dispatch_async(v6, block);
}

- (void)performRecurringPaymentAction:(unint64_t)a3 identifier:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1001140D8;
  v15[3] = &unk_10063C928;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  unint64_t v18 = a3;
  id v12 = v15;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001172BC;
  block[3] = &unk_10063A830;
  id v20 = v12;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, block);
}

- (void)updateRecurringPaymentMemo:(id)a3 identifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
  id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10011431C;
  v17[3] = &unk_10063B440;
  v17[4] = self;
  id v18 = v8;
  id v19 = v9;
  id v20 = v10;
  id v13 = v17;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001172BC;
  block[3] = &unk_10063A830;
  id v22 = v13;
  id v14 = v10;
  id v15 = v9;
  id v16 = v8;
  dispatch_async(v12, block);
}

- (void)updateRecurringPaymentStatus:(unint64_t)a3 identifier:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100114540;
  v15[3] = &unk_10063C928;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  unint64_t v18 = a3;
  id v12 = v15;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001172BC;
  block[3] = &unk_10063A830;
  id v20 = v12;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, block);
}

- (void)hasRecurringPayments:(id)a3
{
  id v4 = a3;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100114734;
  v9[3] = &unk_10063AC90;
  void v9[4] = self;
  id v10 = v4;
  id v7 = v9;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001172BC;
  block[3] = &unk_10063A830;
  id v12 = v7;
  id v8 = v4;
  dispatch_async(v6, block);
}

- (void)_removeNotificationsForPeerPaymentRecurringPaymentsWithIdentifiers:(id)a3
{
  id v4 = a3;
  uint64_t Object = PKLogFacilityTypeGetObject(11LL);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Removing notifications for peer payment recurring payment identifiers: %@",  buf,  0xCu);
  }

  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      id v11 = 0LL;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = (void *)objc_claimAutoreleasedReturnValue( +[PDPeerPaymentRecurringPaymentUpcomingPaymentNotification notificationIdentifierForRecurringPaymentIdentifier:]( &OBJC_CLASS___PDPeerPaymentRecurringPaymentUpcomingPaymentNotification,  "notificationIdentifierForRecurringPaymentIdentifier:",  *(void *)(*((void *)&v13 + 1) + 8LL * (void)v11),  (void)v13));
        -[PDUserNotificationManager removeUserNotificationWithIdentifier:]( self->_userNotificationManager,  "removeUserNotificationWithIdentifier:",  v12);

        id v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v9);
  }
}

- (void)_removeAllNotificationsForPeerPaymentRecurringPayments
{
  uint64_t Object = PKLogFacilityTypeGetObject(11LL);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Removing all notifications for peer payment recurring payments",  v5,  2u);
  }

  -[PDUserNotificationManager removeUserNotificationsOfType:]( self->_userNotificationManager,  "removeUserNotificationsOfType:",  73LL);
}

- (void)encryptionCertificateForDestination:(unint64_t)a3 forceUpdate:(BOOL)a4 completion:(id)a5
{
  id v8 = a5;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
  uint64_t v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100114B3C;
  v13[3] = &unk_10063C478;
  id v14 = v8;
  unint64_t v15 = a3;
  BOOL v16 = a4;
  v13[4] = self;
  id v11 = v13;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001172BC;
  block[3] = &unk_10063A830;
  id v18 = v11;
  id v12 = v8;
  dispatch_async(v10, block);
}

- (void)encryptData:(id)a3 usingCertificateWithDestination:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100114D5C;
  v15[3] = &unk_10063C928;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  unint64_t v18 = a4;
  id v12 = v15;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001172BC;
  block[3] = &unk_10063A830;
  id v20 = v12;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, block);
}

- (void)presentSenderFlowWithHost:(unint64_t)a3 userInfo:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (-[PKEntitlementWhitelist peerPaymentAllAccess](self->_whitelist, "peerPaymentAllAccess"))
  {
    id v10 = PDDefaultQueue();
    id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v10);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_100114FEC;
    v14[3] = &unk_10063C928;
    v14[4] = self;
    unint64_t v17 = a3;
    id v15 = v8;
    id v16 = v9;
    dispatch_async(v11, v14);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(0LL);
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v19 = "-[PDPeerPaymentService presentSenderFlowWithHost:userInfo:completion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  buf,  0xCu);
    }

    if (v9) {
      (*((void (**)(id, void))v9 + 2))(v9, 0LL);
    }
  }
}

- (void)presentReceiverFlowWithOrientation:(id)a3 host:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (-[PKEntitlementWhitelist peerPaymentAllAccess](self->_whitelist, "peerPaymentAllAccess"))
  {
    id v10 = PDDefaultQueue();
    id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v10);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_100115204;
    v14[3] = &unk_10063C928;
    v14[4] = self;
    id v15 = v8;
    unint64_t v17 = a4;
    id v16 = v9;
    dispatch_async(v11, v14);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(0LL);
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v19 = "-[PDPeerPaymentService presentReceiverFlowWithOrientation:host:completion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  buf,  0xCu);
    }

    if (v9) {
      (*((void (**)(id, void))v9 + 2))(v9, 0LL);
    }
  }
}

- (void)insertOrUpdateDeviceOriginatedNearbyPeerPaymentTransactionWithIdentifier:(id)a3 memo:(id)a4 counterpartAppearanceData:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
  id v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_1001153F0;
  v21[3] = &unk_10063CD88;
  void v21[4] = self;
  id v22 = v10;
  id v23 = v11;
  id v24 = v12;
  id v25 = v13;
  id v16 = v21;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001172BC;
  block[3] = &unk_10063A830;
  id v27 = v16;
  id v17 = v13;
  id v18 = v12;
  id v19 = v11;
  id v20 = v10;
  dispatch_async(v15, block);
}

- (void)insertOrUpdateNearbyPeerPaymentSetupNotificationWithTransactionIdentifier:(id)a3 amount:(id)a4 currency:(id)a5 senderName:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
  id v18 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_10011567C;
  v25[3] = &unk_10063AD70;
  v25[4] = self;
  id v26 = v12;
  id v27 = v13;
  id v28 = v14;
  id v29 = v15;
  id v30 = v16;
  id v19 = v25;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001172BC;
  block[3] = &unk_10063A830;
  id v32 = v19;
  id v20 = v16;
  id v21 = v15;
  id v22 = v14;
  id v23 = v13;
  id v24 = v12;
  dispatch_async(v18, block);
}

- (void)counterpartImageDataWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100115984;
  v9[3] = &unk_10063AC90;
  void v9[4] = self;
  id v10 = v4;
  id v7 = v9;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001172BC;
  block[3] = &unk_10063A830;
  id v12 = v7;
  id v8 = v4;
  dispatch_async(v6, block);
}

- (void)counterpartImageDataWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100115BB8;
  v13[3] = &unk_100639AF0;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v10 = v13;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001172BC;
  block[3] = &unk_10063A830;
  id v17 = v10;
  id v11 = v7;
  id v12 = v6;
  dispatch_async(v9, block);
}

- (void)counterpartImageDataForTransactionWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100115DEC;
  v13[3] = &unk_100639AF0;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v10 = v13;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001172BC;
  block[3] = &unk_10063A830;
  id v17 = v10;
  id v11 = v7;
  id v12 = v6;
  dispatch_async(v9, block);
}

- (void)deleteAllCounterpartImageDataWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100115FF4;
  v9[3] = &unk_10063AC90;
  void v9[4] = self;
  id v10 = v4;
  id v7 = v9;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001172BC;
  block[3] = &unk_10063A830;
  id v12 = v7;
  id v8 = v4;
  dispatch_async(v6, block);
}

- (void)reportFailureDiagnostic:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100116210;
  v13[3] = &unk_100639AF0;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v10 = v13;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001172BC;
  block[3] = &unk_10063A830;
  id v17 = v10;
  id v11 = v7;
  id v12 = v6;
  dispatch_async(v9, block);
}

- (id)_displayNameForAddress:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[PKContactResolver defaultContactResolver]( &OBJC_CLASS___PKContactResolver,  "defaultContactResolver"));
    v5 = (void *)objc_claimAutoreleasedReturnValue([v4 contactForHandle:v3]);
    id v6 = (id)objc_claimAutoreleasedReturnValue( +[PKPeerPaymentCounterpartHandleFormatter displayNameForCounterpartHandle:contact:]( &OBJC_CLASS___PKPeerPaymentCounterpartHandleFormatter,  "displayNameForCounterpartHandle:contact:",  v3,  v5));
    if (!v6) {
      id v6 = v3;
    }
  }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

- (void)_scheduleNotificationsForPeerPaymentPendingRequests:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v7)
  {
    id v8 = v7;
    char v9 = 0;
    uint64_t v10 = *(void *)v23;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v6);
        }
        id v12 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)i);
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 expiryDate]);
        BOOL v14 = v13 == 0LL;

        v9 |= v14;
        id v15 = (void *)objc_claimAutoreleasedReturnValue([v12 requestToken]);
        [v5 addObject:v15];
      }

      id v8 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }

    while (v8);
  }

  else
  {
    char v9 = 0;
  }

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_1001165C4;
  v21[3] = &unk_10063ABB8;
  void v21[4] = self;
  id v16 = objc_retainBlock(v21);
  id v17 = v16;
  if ((v9 & 1) != 0)
  {
    peerPaymentWebServiceCoordinator = self->_peerPaymentWebServiceCoordinator;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_1001169F8;
    v19[3] = &unk_10063F520;
    v19[4] = self;
    id v20 = v16;
    -[PDPeerPaymentWebServiceCoordinator peerPaymentPendingRequestsForRequests:completion:]( peerPaymentWebServiceCoordinator,  "peerPaymentPendingRequestsForRequests:completion:",  v6,  v19);
  }

  else
  {
    ((void (*)(void *, id))v16[2])(v16, v6);
  }
}

- (void)_removeAllNotificationsForPeerPaymentPendingRequests
{
  uint64_t Object = PKLogFacilityTypeGetObject(0LL);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Removing all notifications for peer payment pending requests",  buf,  2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDPeerPaymentService peerPaymentAccountManager](self, "peerPaymentAccountManager"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100116C9C;
  v6[3] = &unk_10063ABB8;
  v6[4] = self;
  [v5 peerPaymentPendingRequestsForPeerPaymentAccountWithCompletion:v6];
}

- (void)_removeNotificationsForPeerPaymentPendingRequestWithRequestTokens:(id)a3
{
  id v4 = a3;
  uint64_t Object = PKLogFacilityTypeGetObject(0LL);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Removing notifications for peer payment pending requests with tokens: %@",  buf,  0xCu);
  }

  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      id v11 = 0LL;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = (void *)objc_claimAutoreleasedReturnValue( +[PDPeerPaymentPendingRequestReceivedUserNotification notificationIdentifierForRequestToken:]( &OBJC_CLASS___PDPeerPaymentPendingRequestReceivedUserNotification,  "notificationIdentifierForRequestToken:",  *(void *)(*((void *)&v13 + 1) + 8LL * (void)v11),  (void)v13));
        -[PDUserNotificationManager removeUserNotificationWithIdentifier:]( self->_userNotificationManager,  "removeUserNotificationWithIdentifier:",  v12);

        id v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v9);
  }
}

- (void)_notifyPendingRequestsChangedObservers
{
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100117010;
  v6[3] = &unk_100639300;
  v6[4] = self;
  v5 = v6;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001172BC;
  block[3] = &unk_10063A830;
  id v8 = v5;
  dispatch_async(v4, block);
}

- (void)_notifyRecurringPaymentsChangedObservers
{
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10011712C;
  v6[3] = &unk_100639300;
  v6[4] = self;
  v5 = v6;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001172BC;
  block[3] = &unk_10063A830;
  id v8 = v5;
  dispatch_async(v4, block);
}

- (void)peerPaymentAccountManagerPendingRequestsChanged
{
}

- (void)peerPaymentAccountManagerRecurringPaymentsChanged
{
}

- (void)peerPaymentWebServiceCoordinatorPendingRequestsChanged
{
}

- (void)peerPaymentWebServiceCoordinatorRecurringPaymentsChanged
{
}

- (PDPeerPaymentAccountManager)peerPaymentAccountManager
{
  return self->_peerPaymentAccountManager;
}

- (PDPeerPaymentWebServiceCoordinator)peerPaymentWebServiceCoordinator
{
  return self->_peerPaymentWebServiceCoordinator;
}

- (PDDatabaseManager)databaseManager
{
  return self->_databaseManager;
}

- (void)setDatabaseManager:(id)a3
{
}

- (PDUserNotificationManager)userNotificationManager
{
  return self->_userNotificationManager;
}

- (void)setUserNotificationManager:(id)a3
{
}

- (PKSharingIDSManager)idsSharingManager
{
  return self->_idsSharingManager;
}

- (void).cxx_destruct
{
}

@end