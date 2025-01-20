@interface PDServer
- (BOOL)defaultPassManagerCanUpdateDefaultPass:(id)a3;
- (BOOL)deviceAvailableForContinuityPayments:(id)a3;
- (BOOL)fieldDetectorManagerShouldSuppressFieldEvents:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)resetApplePayWithType:(int64_t)a3 diagnosticReason:(id)a4;
- (BOOL)shouldWritePass:(id)a3 source:(int64_t)a4 error:(id *)a5;
- (CGImage)thumbnailImageForPassIdentifier:(id)a3 size:(CGSize)a4 manager:(id)a5;
- (PDServer)init;
- (id)createCurrentNotificationRegistrationState;
- (id)defaultPaymentPassForContinuityDiscovery:(id)a3;
- (id)missingRemoteAssetsPersistentStoreItemsWithMaximumDownloadRetriesCount:(unint64_t)a3;
- (id)passUniqueIdentifierforTransactionSourceIdentifier:(id)a3;
- (id)paymentApplicationForDPANIdentifier:(id)a3;
- (id)paymentApplicationForTransactionSource:(id)a3;
- (id)paymentPassesForContinuityDiscovery:(id)a3;
- (id)paymentTransactionForIdentifier:(id)a3;
- (id)storedPasses;
- (id)trueUniqueIDs;
- (id)webServiceConfigurationForContinuityPayments:(id)a3;
- (unint64_t)missingRemoteAssetsPersistentStoreItemsCountWithMaximumDownloadRetriesCount:(unint64_t)a3;
- (void)accountForPaymentPass:(id)a3 manager:(id)a4 completion:(id)a5;
- (void)accountManager:(id)a3 didAddAccount:(id)a4;
- (void)accountManager:(id)a3 didAddAccountEvent:(id)a4;
- (void)accountManager:(id)a3 didRemoveAccount:(id)a4;
- (void)accountManager:(id)a3 didUpdateAccount:(id)a4 oldAccount:(id)a5;
- (void)accountManager:(id)a3 didUpdateAccountEvent:(id)a4;
- (void)applePayCloudStoreContainer:(id)a3 didFinishTransactionFetchForPassUniqueID:(id)a4;
- (void)appletSubcredentialManager:(id)a3 didTerminateProvisioningForCredential:(id)a4;
- (void)appletSubcredentialManager:(id)a3 didUpdateCredential:(id)a4 onPassWithIdentifier:(id)a5 oldShares:(id)a6;
- (void)appletSubcredentialManager:(id)a3 didUpdateRangingSuspensionReasons:(unint64_t)a4 forCredential:(id)a5 forPaymentApplication:(id)a6;
- (void)applicationMessageManager:(id)a3 didUpdateMessages:(id)a4;
- (void)bindingStateChangedForPass:(id)a3;
- (void)cardFileManager:(id)a3 didFailToDecryptRemoteAssets:(id)a4 forPass:(id)a5;
- (void)cardFileManager:(id)a3 didUpdateRemoteAssetsForPassWithUniqueID:(id)a4;
- (void)catalogOfRecordWritten:(id)a3 source:(int64_t)a4;
- (void)checkForTransitNotification;
- (void)dataMigrationRequestedWithPassLibrary:(id)a3 didRestoreFromBackup:(BOOL)a4;
- (void)dealloc;
- (void)defaultPassManager:(id)a3 didUpdateDefaultPaymentPassWithUniqueIdentifier:(id)a4;
- (void)didAddCredentialInvitation:(id)a3;
- (void)didReceivePromptForVirtualCard:(id)a3 showNotification:(BOOL)a4;
- (void)didRemoveTransactionsWithSourceIdentifierMapping:(id)a3;
- (void)didRequestToRegister:(id)a3 fromDestination:(id)a4;
- (void)displayTapToRadarAlertForRequest:(id)a3 completion:(id)a4;
- (void)dynamicStateManager:(id)a3 dynamicStatesDidUpdate:(id)a4;
- (void)expressPassManager:(id)a3 didFinishExpressTransactionWithState:(id)a4;
- (void)expressPassManager:(id)a3 didUpdateExpressPassConfigurations:(id)a4;
- (void)handleContinuityPaymentBulletinActionWithIdentifier:(id)a3 manager:(id)a4;
- (void)handleDatabaseIntegrityProblem;
- (void)handleNotificationWithName:(id)a3 event:(id)a4 forStream:(int64_t)a5;
- (void)handlerDetailsForConfiguration:(id)a3 completion:(id)a4;
- (void)inAppPaymentService:(id)a3 registerPaymentListenerEndpoint:(id)a4 forHostIdentifier:(id)a5 processIdentifier:(int)a6 completion:(id)a7;
- (void)inAppPaymentService:(id)a3 retrievePaymentListenerEndpointForHostIdentifier:(id)a4 completion:(id)a5;
- (void)incrementMissingRemoteAssetsPersistentStoreItemDownloadRetriesCountWithUniqueID:(id)a3;
- (void)insertOrReplaceMissingRemoteAssetsPersistentStoreItemWithUniqueID:(id)a3;
- (void)introduceDatabaseIntegrityProblem;
- (void)issueSecureElementPassStateChangeNotificationForNewPasses:(id)a3;
- (void)markPassWithUniqueIdentifiersForDeletion:(id)a3;
- (void)mutateTrueUniqueIDs:(id)a3;
- (void)noteACAccountChanged:(id)a3 handler:(id)a4;
- (void)noteAutomaticallyPresentSettingsChangedForPassWithUniqueIdentifier:(id)a3;
- (void)noteLockScreenSettingsChangedForPassWithUniqueIdentifier:(id)a3;
- (void)notePassWithUniqueID:(id)a3 isRevoked:(BOOL)a4;
- (void)noteSettingsChangedForPassWithUniqueIdentifier:(id)a3 newSettings:(unint64_t)a4;
- (void)nukeStuff;
- (void)passDidUpdateTransactionSourceIdentifierWithPassUniqueIdentifier:(id)a3;
- (void)passTileManager:(id)a3 didUpdateTiles:(id)a4 forPassUniqueID:(id)a5 forContext:(int64_t)a6;
- (void)passUniqueIdentifiersMovedToExpired:(id)a3;
- (void)passWithUniqueIdentifier:(id)a3 didReceiveValueAddedServiceTransaction:(id)a4;
- (void)passWithUniqueIdentifierDidDisappear:(id)a3 forReason:(unint64_t)a4 withDiagnosticReason:(id)a5;
- (void)passWithUniqueIdentifierWillDisappear:(id)a3 forReason:(unint64_t)a4 withDiagnosticReason:(id)a5;
- (void)passWritten:(id)a3 withDaemonData:(id)a4 diff:(id)a5 fromSource:(int64_t)a6;
- (void)paymentPass:(id)a3 didUpdatePaymentApplications:(id)a4 toPaymentApplications:(id)a5;
- (void)paymentPassWithUniqueIdentifier:(id)a3 didEnableDailyCashNotifications:(BOOL)a4;
- (void)paymentPassWithUniqueIdentifier:(id)a3 didEnableMessageService:(BOOL)a4;
- (void)paymentPassWithUniqueIdentifier:(id)a3 didEnableTransactionService:(BOOL)a4;
- (void)paymentPassWithUniqueIdentifier:(id)a3 didReceiveMessage:(id)a4;
- (void)paymentPassWithUniqueIdentifier:(id)a3 didRecomputeCategoryVisualizationMagnitudes:(id)a4 withStyle:(int64_t)a5;
- (void)paymentPassWithUniqueIdentifier:(id)a3 didResolvePendingTransitTransactionAmountsWithTransaction:(id)a4 paymentApplication:(id)a5 balance:(id)a6;
- (void)paymentPassWithUniqueIdentifier:(id)a3 didUpdateBalanceReminder:(id)a4 forBalanceWithIdentifier:(id)a5;
- (void)paymentPassWithUniqueIdentifier:(id)a3 didUpdateBalancesFrom:(id)a4 toBalances:(id)a5;
- (void)paymentPassWithUniqueIdentifier:(id)a3 didUpdateDefaultPaymentApplication:(id)a4;
- (void)paymentPassWithUniqueIdentifier:(id)a3 didUpdateFromTransitProperties:(id)a4 toTransitProperties:(id)a5;
- (void)paymentPassWithUniqueIdentifier:(id)a3 didUpdateToPlans:(id)a4;
- (void)paymentTransactionProcessorDidActivate:(id)a3;
- (void)paymentTransactionProcessorDidDeactivate:(id)a3;
- (void)paymentTransactionUpdated:(id)a3 forTransactionSourceIdentifier:(id)a4;
- (void)peerPaymentWebServiceCoordinator:(id)a3 didUpdateAccount:(id)a4 oldAccount:(id)a5;
- (void)peerPaymentWebServiceCoordinatorDidDeleteAccount;
- (void)pendingProvisioningManagerDidFinishProvisioningWithReceipts:(id)a3;
- (void)pendingProvisioningsDidChangeWithPendingProvisionings:(id)a3;
- (void)placemarkFound:(id)a3 forTransaction:(id)a4;
- (void)postUpgradedPassNotificationForMarket:(id)a3 pass:(id)a4;
- (void)postUpgradesAvailableNotificationForMarket:(id)a3 pass:(id)a4;
- (void)prepareForBackupRestoreWithRequiredFileURLs:(id)a3 destinationFileHandles:(id)a4 handler:(id)a5;
- (void)primaryAppleAccountWasAdded:(id)a3;
- (void)primaryAppleAccountWasDeleted:(id)a3;
- (void)primaryAppleAccountWasUpdated:(id)a3 handler:(id)a4;
- (void)readTrueTransactionReceiptUniqueiDs:(id)a3;
- (void)readTrueUniqueIDs:(id)a3;
- (void)recoverPassWithUniqueID:(id)a3;
- (void)registerDatabaseObject:(id)a3;
- (void)removeMissingRemoteAssetsPersistentStoreItemWithUniqueID:(id)a3;
- (void)removePassesOfType:(unint64_t)a3 withDiagnosticReason:(id)a4;
- (void)rescheduleCommutePlanRenewalRemindersForPaymentPassWithUniqueIdentifier:(id)a3;
- (void)secureElementPairingDidChangeForReason:(unint64_t)a3;
- (void)sharesDidUpdateWithPaymentPassWithUniqueIdentifier:(id)a3;
- (void)supportedPaymentSetupFeatures:(id)a3 completion:(id)a4;
- (void)transactionReceiptFileManager:(id)a3 didDeleteTransactionReceiptWithUniqueID:(id)a4;
- (void)transactionReceiptFileManager:(id)a3 didWriteTransactionReceipt:(id)a4;
- (void)transactionSourceIdentifier:(id)a3 didReceiveTransaction:(id)a4 oldTransaction:(id)a5;
- (void)transactionSourceIdentifier:(id)a3 didRemoveTransactionWithIdentifier:(id)a4;
- (void)transactionSourceIdentifier:(id)a3 willRemoveTransaction:(id)a4;
- (void)updateRequiresMerchantReprocessing:(BOOL)a3 forTransactionWithIdentifier:(id)a4;
- (void)willRemoveTransactionsWithSourceIdentifierMapping:(id)a3;
@end

@implementation PDServer

- (PDServer)init
{
  return 0LL;
}

- (void)dealloc
{
  for (uint64_t i = 0LL; i != 45; i += 5LL)
  {
    v4 = (void *)qword_100707788[i];
    qword_100707788[i] = 0LL;

    v5 = (void *)qword_100707788[i + 4];
    qword_100707788[i + 4] = 0LL;
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v7 removeObserver:self];

  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___PDServer;
  -[PDServer dealloc](&v8, "dealloc");
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a4;
  v7 = v6;
  uint64_t v8 = -1LL;
  v9 = (void **)qword_100707788;
  do
  {
    id v11 = *v9;
    v9 += 5;
    id v10 = v11;
  }

  while (v11 != a3 && v8++ != 7);
  if (v10 == a3) {
    unsigned __int8 v13 = v8;
  }
  else {
    unsigned __int8 v13 = 9;
  }
  if (v13 <= 8u)
  {
    id v14 = [v6 processIdentifier];
    uint64_t Object = PKLogFacilityTypeGetObject(4LL);
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      sub_100441348((uint64_t)v14, v16, v17, v18, v19, v20, v21, v22);
    }

    sub_100019B04((uint64_t)self, (uint64_t)v14);
    sub_100019CB4((uint64_t)self, v7, v13);
  }

  return v13 < 9u;
}

- (BOOL)shouldWritePass:(id)a3 source:(int64_t)a4 error:(id *)a5
{
  id v6 = a3;
  if ([v6 passType] || !PKIsManagedAppleID())
  {
    LOBYTE(a5) = 1;
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(0LL);
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 uniqueID]);
      int v14 = 138412290;
      v15 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Managed Apple Account cannot support pass with unique ID: %@",  (uint8_t *)&v14,  0xCu);
    }

    if (a5)
    {
      uint64_t v11 = PKDisplayableErrorForCommonType(11LL, 0LL);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      id v13 = *a5;
      *a5 = v12;

      LOBYTE(a5) = 0;
    }
  }

  return (char)a5;
}

- (void)passWritten:(id)a3 withDaemonData:(id)a4 diff:(id)a5 fromSource:(int64_t)a6
{
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = (const __CFString *)a5;
  id v92 = [v9 passType];
  v12 = (void *)objc_claimAutoreleasedReturnValue([v9 uniqueID]);
  id v13 = v11;
  if (v92 == (id)1) {
    id v14 = (id)objc_claimAutoreleasedReturnValue([v9 paymentPass]);
  }
  else {
    id v14 = 0LL;
  }
  id v104 = 0LL;
  v15 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager passSharesForPassUniqueIdentifier:]( self->_databaseManager,  "passSharesForPassUniqueIdentifier:",  v12));
  v16 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager passEntitlementsForPassUniqueIdentifier:]( self->_databaseManager,  "passEntitlementsForPassUniqueIdentifier:",  v12));
  v94 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager auxiliaryItemIdentifiersForPassUniqueIdentifier:]( self->_databaseManager,  "auxiliaryItemIdentifiersForPassUniqueIdentifier:",  v12));
  os_unfair_lock_lock(&self->_installedPassesLock);
  -[NSMutableSet addObject:](self->_installedPassUniqueIDs, "addObject:", v12);
  os_unfair_lock_unlock(&self->_installedPassesLock);
  unsigned int v17 = -[PDDatabaseManager passExistsWithUniqueID:](self->_databaseManager, "passExistsWithUniqueID:", v12);
  uint64_t Object = PKLogFacilityTypeGetObject(0LL);
  uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
  if (!v17)
  {
    if (v20)
    {
      *(_DWORD *)buf = 138412546;
      v108 = v12;
      __int16 v109 = 2048;
      int64_t v110 = a6;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "PDServer (pass): inserting pass %@ for %ld.",  buf,  0x16u);
    }

    uint64_t v21 = (__CFString *)v13;
    if (!-[PDDatabaseManager insertPass:withDaemonData:source:]( self->_databaseManager,  "insertPass:withDaemonData:source:",  v9,  v10,  a6))
    {
      uint64_t v22 = v10;
      goto LABEL_106;
    }

    v27 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager passWithUniqueIdentifier:]( self->_databaseManager,  "passWithUniqueIdentifier:",  v12));

    v89 = v12;
    v28 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager passAnnotationsForPassUniqueIdentifier:]( self->_databaseManager,  "passAnnotationsForPassUniqueIdentifier:",  v12));
    id v23 = v92;
    v88 = v16;
    if (v92 == (id)1)
    {
      v29 = v27;
      if ([v27 passType] == (id)1) {
        v30 = v27;
      }
      else {
        v30 = 0LL;
      }
    }

    else
    {
      v29 = v27;
      v30 = 0LL;
    }

    uint64_t v22 = v10;
    id v33 = v30;

    v24 = v15;
    if (v29)
    {
      v34 = (void *)objc_claimAutoreleasedReturnValue( -[PDPassDynamicStateManager passDynamicStateForUniqueIdentifier:]( self->_dynamicStateManager,  "passDynamicStateForUniqueIdentifier:",  v89));
      id v35 = [v29 copy];
      if (v35) {
        sub_10001B1E8((uint64_t)self, v35, v34, a6);
      }

      id v23 = v92;
    }

    if (v23 == (id)1 && v33)
    {
      -[PDPaymentWebServiceCoordinator passAdded:](self->_paymentWebServiceCoordinator, "passAdded:", v33);
      -[PDAccountManager passAdded:](self->_accountManager, "passAdded:", v33);
      -[PDPaymentOffersManager passAdded:](self->_paymentOffersManager, "passAdded:", v33);
      -[PDAccountStatementMetadataProcessor passAdded:](self->_accountStatementMetadataProcessor, "passAdded:", v33);
    }

    else if (!v23 && [v29 supportsLifecycleUpdates])
    {
      if (v28)
      {
        [v28 sortingState];
        uint64_t v36 = 1LL;
      }

      else
      {
        uint64_t v36 = 0LL;
      }

      -[PDWebServicesCoordinator sendPassLifecycleEventForUniqueIdentifier:state:]( self->_webServicesCoordinator,  "sendPassLifecycleEventForUniqueIdentifier:state:",  v89,  v36);
    }

    id v31 = 0LL;
    uint64_t v38 = 2LL;
LABEL_52:
    uint64_t v85 = v38;
    -[PDPassSignalManager donateSignalForPass:completion:]( self->_passSignalManager,  "donateSignalForPass:completion:",  v29,  &stru_10063A1F8);
    v90 = v31;
    v91 = v24;
    if (!v33)
    {
      id v93 = 0LL;
      id v43 = 0LL;
LABEL_92:
      sub_10033B388((uint64_t)self->_passTileManager, v29, v22);
      -[PDSpotlightIndexer passAddedOrUpdated:](self->_spotlightIndexer, "passAddedOrUpdated:", v29);
      -[PDIssuerBindingManager passAddedOrUpdated:passAdded:]( self->_issuerBindingManager,  "passAddedOrUpdated:passAdded:",  v29,  v104 == 0LL);
      unprotectedManagers = self->_unprotectedManagers;
      if (unprotectedManagers) {
        notificationStreamManager = unprotectedManagers->_notificationStreamManager;
      }
      else {
        notificationStreamManager = 0LL;
      }
      -[PDNotificationStreamManager recalculateNotificationNames]( notificationStreamManager,  "recalculateNotificationNames");
      -[PDUserNotificationManager updateWalletBadgeCount](self->_userNotificationManager, "updateWalletBadgeCount");
      -[PDUserNotificationManager updatePassAssetsWithPassUniqueID:]( self->_userNotificationManager,  "updatePassAssetsWithPassUniqueID:",  v89);
      unsigned int v73 = -[PDDatabaseManager settingEnabled:forPassWithUniqueIdentifier:]( self->_databaseManager,  "settingEnabled:forPassWithUniqueIdentifier:",  128LL,  v89);
      if (v23 == (id)1)
      {
        unsigned int v74 = -[PDDatabaseManager settingEnabled:forPassWithUniqueIdentifier:]( self->_databaseManager,  "settingEnabled:forPassWithUniqueIdentifier:",  8LL,  v89);
        char v75 = 0;
        int v76 = v74 ^ 1;
      }

      else
      {
        unsigned __int8 v77 = +[PKWalletVisibility isWalletVisible]( &OBJC_CLASS___PKWalletVisibility,  "isWalletVisible");
        int v76 = 0;
        char v75 = v77 ^ 1;
      }

      if (a6 != 2 && ((v73 | v76) & 1) == 0 && (v75 & 1) == 0)
      {
        uint64_t v78 = PKLogFacilityTypeGetObject(0LL);
        v79 = (os_log_s *)objc_claimAutoreleasedReturnValue(v78);
        if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v108 = v89;
          _os_log_impl( (void *)&_mh_execute_header,  v79,  OS_LOG_TYPE_DEFAULT,  "PDServer: issuing insert/update user notification for pass %@.",  buf,  0xCu);
        }

        v80 = -[PDPassUpdateUserNotification initWithPassDiff:]( objc_alloc(&OBJC_CLASS___PDPassUpdateUserNotification),  "initWithPassDiff:",  v21);
        -[PDUserNotification setReissueBannerOnUpdate:](v80, "setReissueBannerOnUpdate:", 1LL);
        -[PDUserNotificationManager insertUserNotification:]( self->_userNotificationManager,  "insertUserNotification:",  v80);
      }

      -[PDDefaultPassManager updateContactlessPassesAvailability]( self->_defaultPassManager,  "updateContactlessPassesAvailability");
      if (v23 == (id)1) {
        -[PDDefaultPassManager updateDefaultPaymentPassIfNeeded]( self->_defaultPassManager,  "updateDefaultPaymentPassIfNeeded");
      }
      v96[0] = _NSConcreteStackBlock;
      v96[1] = 3221225472LL;
      v96[2] = sub_10001B4FC;
      v96[3] = &unk_10063A220;
      id v14 = v33;
      id v97 = v14;
      v98 = self;
      id v100 = v93;
      id v101 = v43;
      int64_t v102 = a6;
      uint64_t v103 = v85;
      id v9 = v29;
      id v99 = v9;
      sub_100018978(v96);

      v16 = v88;
      v12 = v89;
      v15 = v91;
      goto LABEL_106;
    }

    uint64_t v39 = objc_claimAutoreleasedReturnValue(-[PKSecureElement secureElementIdentifiers](self->_secureElement, "secureElementIdentifiers"));
    v40 = (void *)objc_claimAutoreleasedReturnValue([v33 primaryPaymentApplicationForSecureElementIdentifiers:v39]);
    v41 = (void *)objc_claimAutoreleasedReturnValue([v31 primaryPaymentApplicationForSecureElementIdentifiers:v39]);
    if (v40) {
      id v42 = [v40 state];
    }
    else {
      id v42 = 0LL;
    }
    v82 = v21;
    v83 = v22;
    v81 = v29;
    v84 = (void *)v39;
    v86 = v41;
    id v44 = v42;
    if (v41) {
      id v93 = [v41 state];
    }
    else {
      id v93 = 0LL;
    }
    uint64_t v45 = PKAggDKeyPaymentPassPropertiesPassInjested;
    v105[0] = @"primary-payment-method-type";
    v87 = v40;
    v46 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v40 paymentType]));
    v106[0] = v46;
    v105[1] = @"has-transaction-service";
    v47 = (void *)objc_claimAutoreleasedReturnValue([v33 transactionServiceURL]);
    v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v47 != 0LL));
    v106[1] = v48;
    v105[2] = @"has-message-service";
    v49 = (void *)objc_claimAutoreleasedReturnValue([v33 messageServiceURL]);
    v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v49 != 0LL));
    v106[2] = v50;
    v51 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v106,  v105,  3LL));
    PKAnalyticsSendEvent(v45, v51);

    id v43 = v44;
    if (v44 == (id)6 && v93 != (id)6) {
      PKAnalyticsSendEvent(PKAggDKeyPaymentLifecycleSuspendIssuer, 0LL);
    }
    uint64_t v52 = PKLogFacilityTypeGetObject(6LL);
    v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
    BOOL v54 = os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT);
    v55 = v90;
    v56 = v91;
    if (v43 == v93)
    {
      v57 = v82;
      v58 = v83;
      id v23 = v92;
      if (!v54) {
        goto LABEL_77;
      }
      uint64_t v66 = objc_claimAutoreleasedReturnValue([v87 stateAsString]);
      v60 = (void *)v66;
      v67 = @"none";
      if (v66) {
        v67 = (const __CFString *)v66;
      }
      *(_DWORD *)buf = 138412546;
      v108 = v89;
      __int16 v109 = 2114;
      int64_t v110 = (int64_t)v67;
      _os_log_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_DEFAULT,  "PDServer (pass): secure element pass %@ maintained primary application state %{public}@.",  buf,  0x16u);
    }

    else
    {
      v57 = v82;
      v58 = v83;
      id v23 = v92;
      if (!v54) {
        goto LABEL_77;
      }
      uint64_t v59 = objc_claimAutoreleasedReturnValue([v86 stateAsString]);
      v60 = (void *)v59;
      if (v59) {
        v61 = (const __CFString *)v59;
      }
      else {
        v61 = @"none";
      }
      uint64_t v62 = objc_claimAutoreleasedReturnValue([v87 stateAsString]);
      id v63 = v43;
      v64 = (void *)v62;
      *(_DWORD *)buf = 138412802;
      if (v62) {
        v65 = (const __CFString *)v62;
      }
      else {
        v65 = @"none";
      }
      v108 = v89;
      __int16 v109 = 2114;
      int64_t v110 = (int64_t)v61;
      v56 = v91;
      id v23 = v92;
      __int16 v111 = 2114;
      v112 = v65;
      _os_log_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_DEFAULT,  "PDServer (pass): secure element pass %@ updated primary application state: %{public}@ -> %{public}@.",  buf,  0x20u);

      id v43 = v63;
      v55 = v90;
    }

LABEL_77:
    if (v43 && v43 != (id)7) {
      PKSetNeedsLostModeExitAuth(0LL);
    }
    v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    PDSetLastPaymentPassInsertionOrRemovalDate();

    uint64_t v21 = v57;
    if (v87) {
      id v43 = [v33 effectiveContactlessPaymentApplicationState];
    }
    uint64_t v22 = v58;
    if (v86) {
      id v93 = [v55 effectiveContactlessPaymentApplicationState];
    }
    -[PDAppletSubcredentialManager passAddedOrUpdated:oldPass:oldShares:]( self->_subcredentialManager,  "passAddedOrUpdated:oldPass:oldShares:",  v33,  v55,  v56);
    -[PDDatabaseManager recomputeBalancesForPaymentPass:]( self->_databaseManager,  "recomputeBalancesForPaymentPass:",  v33);
    -[PDDatabaseManager resolvePendingTransitTransactionAmountsWithPaymentPass:]( self->_databaseManager,  "resolvePendingTransitTransactionAmountsWithPaymentPass:",  v33);
    -[PDAuxiliaryCapabilityManager passAddedOrUpdated:oldPass:]( self->_auxiliaryCapabilityManager,  "passAddedOrUpdated:oldPass:",  v33,  v55);
    -[PDBarcodeCredentialManager passAddedOrUpdated:](self->_barcodeCredentialManager, "passAddedOrUpdated:", v33);
    sharingManager = self->_sharingManager;
    if (v55)
    {
      -[PDSharingManager passUpdated:oldPass:oldShares:oldEntitlements:]( sharingManager,  "passUpdated:oldPass:oldShares:oldEntitlements:",  v33,  v55,  v56,  v88);
      v29 = v81;
      if ([v33 contactlessActivationGroupingType] != (id)2) {
        sub_10014C79C((uint64_t)self->_expressPassManager, v33);
      }
    }

    else
    {
      -[PDSharingManager passAdded:](sharingManager, "passAdded:", v33);
      v29 = v81;
    }

    if (v93 == (id)2 && v43 == (id)1)
    {
      v70 = objc_alloc_init(&OBJC_CLASS___PDProvisioningSupportDataManager);
      -[PDProvisioningSupportDataManager applyPostPersonalizedSupportDataIfNecessaryToPass:]( v70,  "applyPostPersonalizedSupportDataIfNecessaryToPass:",  v33);
    }

    -[PDAuxiliaryPassInformationManager didInsertOrUpdatePass:oldPass:oldAuxiliaryInformationIdentifiers:]( self->_auxPassInformationManager,  "didInsertOrUpdatePass:oldPass:oldAuxiliaryInformationIdentifiers:",  v33,  v55,  v94);
    -[PDPassVerificationManager passAddedOrUpdated:](self->_passVerificationManager, "passAddedOrUpdated:", v33);

    goto LABEL_92;
  }

  uint64_t v21 = (__CFString *)v13;
  if (v20)
  {
    *(_DWORD *)buf = 138412802;
    v108 = v12;
    __int16 v109 = 2048;
    int64_t v110 = a6;
    __int16 v111 = 2112;
    v112 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "PDServer (pass): updating pass %@ for %ld:\n\t%@.",  buf,  0x20u);
  }

  uint64_t v22 = v10;
  if (-[PDDatabaseManager updatePass:withDaemonData:oldPass:fromSource:]( self->_databaseManager,  "updatePass:withDaemonData:oldPass:fromSource:",  v9,  v10,  &v104,  a6))
  {
    id v23 = v92;
    v24 = v15;
    if (v92 == (id)1)
    {
      id v25 = [v104 passType];
      id v26 = v104;
      if (v25 != (id)1) {
        id v26 = 0LL;
      }
    }

    else
    {
      id v26 = 0LL;
    }

    id v31 = v26;
    v89 = v12;
    v29 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager passWithUniqueIdentifier:]( self->_databaseManager,  "passWithUniqueIdentifier:",  v12));

    v88 = v16;
    if (v92 == (id)1)
    {
      if ([v29 passType] == (id)1) {
        v32 = v29;
      }
      else {
        v32 = 0LL;
      }
    }

    else
    {
      v32 = 0LL;
    }

    id v33 = v32;

    if (v29)
    {
      id v37 = [v29 copy];
      if (v37) {
        sub_10001AE28((uint64_t)self, v37);
      }
    }

    uint64_t v38 = 1LL;
    goto LABEL_52;
  }

- (void)passWithUniqueIdentifierWillDisappear:(id)a3 forReason:(unint64_t)a4 withDiagnosticReason:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v8)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager passWithUniqueIdentifier:]( self->_databaseManager,  "passWithUniqueIdentifier:",  v8));
    if (v10)
    {
      -[PDDatabaseManager prepareToDeletePassWithUniqueIdentifier:]( self->_databaseManager,  "prepareToDeletePassWithUniqueIdentifier:",  v8);
      -[PDUserNotificationManager removeUserNotificationsForPassUniqueIdentifier:]( self->_userNotificationManager,  "removeUserNotificationsForPassUniqueIdentifier:",  v8);
      -[PDUserNotificationManager removeNotificationAssetsForPassWithUniqueIdentifier:]( self->_userNotificationManager,  "removeNotificationAssetsForPassWithUniqueIdentifier:",  v8);
      if ([v10 passType] == (id)1)
      {
        v24 = v10;
        id v11 = v10;
        id v25 = v9;
        -[PDPaymentWebServiceCoordinator passWillBeRemoved:withDiagnosticReason:]( self->_paymentWebServiceCoordinator,  "passWillBeRemoved:withDiagnosticReason:",  v11,  v9);
        -[PDAppletSubcredentialManager passWillBeRemoved:](self->_subcredentialManager, "passWillBeRemoved:", v11);
        -[PDAuxiliaryCapabilityManager passWillBeRemoved:](self->_auxiliaryCapabilityManager, "passWillBeRemoved:", v11);
        -[PDAuxiliaryPassInformationManager passWillBeRemoved:]( self->_auxPassInformationManager,  "passWillBeRemoved:",  v11);
        -[PDSharingManager passWillBeRemoved:](self->_sharingManager, "passWillBeRemoved:", v11);
        -[PDPassVerificationManager passWillBeRemoved:](self->_passVerificationManager, "passWillBeRemoved:", v11);
        -[PDBarcodeCredentialManager passWillBeRemoved:](self->_barcodeCredentialManager, "passWillBeRemoved:", v11);
        -[PDISO18013Manager passWillBeRemoved:](self->_iso18013Manager, "passWillBeRemoved:", v11);
        id v23 = v11;
        v12 = (void *)objc_claimAutoreleasedReturnValue([v11 devicePaymentApplications]);
        id v13 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
        id v14 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
        __int128 v26 = 0u;
        __int128 v27 = 0u;
        __int128 v28 = 0u;
        __int128 v29 = 0u;
        id v15 = v12;
        id v16 = [v15 countByEnumeratingWithState:&v26 objects:v30 count:16];
        if (v16)
        {
          id v17 = v16;
          uint64_t v18 = *(void *)v27;
          do
          {
            for (uint64_t i = 0LL; i != v17; uint64_t i = (char *)i + 1)
            {
              if (*(void *)v27 != v18) {
                objc_enumerationMutation(v15);
              }
              BOOL v20 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)i);
              if (PKPaymentApplicationStateIndicatesAppletPresence([v20 state]))
              {
                uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 subcredentials]);
                if ([v21 count])
                {
                  -[NSMutableSet unionSet:](v14, "unionSet:", v21);
                }

                else
                {
                  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v20 applicationIdentifier]);
                  -[NSMutableArray addObject:](v13, "addObject:", v22);
                }
              }
            }

            id v17 = [v15 countByEnumeratingWithState:&v26 objects:v30 count:16];
          }

          while (v17);
        }

        if (-[NSMutableArray count](v13, "count")) {
          -[PKSecureElement markAppletsWithIdentifiersForDeletion:completion:]( self->_secureElement,  "markAppletsWithIdentifiersForDeletion:completion:",  v13,  0LL);
        }
        id v9 = v25;
        if (-[NSMutableSet count](v14, "count")) {
          -[PDAppletSubcredentialManager revokeSubcredentials:withCompletion:]( self->_subcredentialManager,  "revokeSubcredentials:withCompletion:",  v14,  0LL);
        }

        id v10 = v24;
      }

      else
      {
        if (a4 != 1 && a4 != 8 && [v10 supportsLifecycleUpdates]) {
          -[PDWebServicesCoordinator sendPassLifecycleEventForUniqueIdentifier:state:]( self->_webServicesCoordinator,  "sendPassLifecycleEventForUniqueIdentifier:state:",  v8,  2LL);
        }
      }
    }
  }
}

- (void)passWithUniqueIdentifierDidDisappear:(id)a3 forReason:(unint64_t)a4 withDiagnosticReason:(id)a5
{
  id v7 = a3;
  if (v7)
  {
    id v22 = v7;
    id v8 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager passWithUniqueIdentifier:]( self->_databaseManager,  "passWithUniqueIdentifier:",  v7));
    if (v8)
    {
      os_unfair_lock_lock(&self->_installedPassesLock);
      -[NSMutableSet removeObject:](self->_installedPassUniqueIDs, "removeObject:", v22);
      os_unfair_lock_unlock(&self->_installedPassesLock);
      -[PDDatabaseManager deletePassWithUniqueIdentifier:]( self->_databaseManager,  "deletePassWithUniqueIdentifier:",  v22);
      -[PDPassSignalManager removeSignalForPass:completion:]( self->_passSignalManager,  "removeSignalForPass:completion:",  v8,  &stru_10063A240);
      if ([v8 passType] == (id)1)
      {
        id v9 = (void *)objc_claimAutoreleasedReturnValue( -[PDCloudStoreNotificationCoordinator applePayContainer]( self->_cloudStoreCoordinator,  "applePayContainer"));
        [v9 passDidDisappear:v8];

        -[PDCloudStoreTransactionSourceController passDidDisappear:]( self->_cloudStoreTransactionSourceController,  "passDidDisappear:",  v8);
        id v10 = v8;
        if ((a4 & 0xFFFFFFFFFFFFFFFELL) == 6)
        {
          -[PDDefaultPassManager updateDefaultPaymentPassIfNeeded]( self->_defaultPassManager,  "updateDefaultPaymentPassIfNeeded");
          expressPassManager = self->_expressPassManager;
          v12 = (void *)objc_claimAutoreleasedReturnValue([v10 devicePaymentApplications]);
          id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](&OBJC_CLASS___NSSet, "set"));
          id v14 = (void *)objc_claimAutoreleasedReturnValue([v10 uniqueID]);
          sub_10014B65C((uint64_t)expressPassManager, v12, v13, v14);
        }

        else if (a4 == 5)
        {
          -[PDDefaultPassManager clearDefaultPaymentPassIfNeeded]( self->_defaultPassManager,  "clearDefaultPaymentPassIfNeeded");
          sub_10014ACF0((uint64_t)self->_expressPassManager);
        }

        -[PDAccountManager passRemoved:](self->_accountManager, "passRemoved:", v10);
        -[PDAccountStatementMetadataProcessor passRemoved:]( self->_accountStatementMetadataProcessor,  "passRemoved:",  v10);
        -[PDPaymentOffersManager passRemoved:](self->_paymentOffersManager, "passRemoved:", v10);
        id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
        PDSetLastPaymentPassInsertionOrRemovalDate();

        uint64_t v16 = AMPEnrollmentDismissedKeyForPass(v10);
        id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
        PKSharedCacheRemoveObjectForKey(v17);

        if ([v10 associatedAccountFeatureIdentifier] == (id)2)
        {
          id v18 = PDUtilityQueue();
          uint64_t v19 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v18);
          dispatch_async(v19, &stru_10063A260);
        }
      }

      sub_10001C1E8((uint64_t)self, v8);
      unprotectedManagers = self->_unprotectedManagers;
      if (unprotectedManagers) {
        notificationStreamManager = unprotectedManagers->_notificationStreamManager;
      }
      else {
        notificationStreamManager = 0LL;
      }
      -[PDNotificationStreamManager recalculateNotificationNames]( notificationStreamManager,  "recalculateNotificationNames");
      -[PDUserNotificationManager updateWalletBadgeCount](self->_userNotificationManager, "updateWalletBadgeCount");
      -[PDSpotlightIndexer passDidDisappear:](self->_spotlightIndexer, "passDidDisappear:", v8);
      -[PDDefaultPassManager updateContactlessPassesAvailability]( self->_defaultPassManager,  "updateContactlessPassesAvailability");
      -[PDIssuerBindingManager passRemoved:](self->_issuerBindingManager, "passRemoved:", v8);
      sub_10033B4E4((uint64_t)self->_passTileManager, v8);
      -[PDDevicePasscodeManager updateUpgradedPasscodePolicyEnforcementWithCompletion:]( self->_devicePasscodeManager,  "updateUpgradedPasscodePolicyEnforcementWithCompletion:",  &stru_10063A2A0);
    }

    id v7 = v22;
  }
}

- (void)cardFileManager:(id)a3 didUpdateRemoteAssetsForPassWithUniqueID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t Object = PKLogFacilityTypeGetObject(0LL);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "PDServer: received pass with uniqueID:%@ did update remote assets. sending notification",  (uint8_t *)&v11,  0xCu);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager passWithUniqueIdentifier:]( self->_databaseManager,  "passWithUniqueIdentifier:",  v7));
  if (v10) {
    sub_10001AE28((uint64_t)self, v10);
  }
}

- (void)catalogOfRecordWritten:(id)a3 source:(int64_t)a4
{
}

- (void)notePassWithUniqueID:(id)a3 isRevoked:(BOOL)a4
{
  BOOL v4 = a4;
  id v10 = a3;
  unsigned int v6 = -[PDDatabaseManager uniqueIDIsRevoked:](self->_databaseManager, "uniqueIDIsRevoked:", v10);
  id v7 = v10;
  if (v6 != v4)
  {
    unsigned int v8 = v6;
    -[PDDatabaseManager updateRevocationStatus:forUniqueID:]( self->_databaseManager,  "updateRevocationStatus:forUniqueID:",  v4,  v10);
    id v9 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager passWithUniqueIdentifier:]( self->_databaseManager,  "passWithUniqueIdentifier:",  v10));
    if (v9) {
      sub_10001AE28((uint64_t)self, v9);
    }
    if (v8 && !v4) {
      -[PDCardFileManager scheduleImmediateRevocationCheck](self->_cardFileManager, "scheduleImmediateRevocationCheck");
    }

    id v7 = v10;
  }
}

- (void)cardFileManager:(id)a3 didFailToDecryptRemoteAssets:(id)a4 forPass:(id)a5
{
  id v8 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a5 secureElementPass]);
  if (v7) {
    -[PDAuxiliaryCapabilityManager didFailToDecryptRemoteAssets:forPass:]( self->_auxiliaryCapabilityManager,  "didFailToDecryptRemoteAssets:forPass:",  v8,  v7);
  }
}

- (void)transactionReceiptFileManager:(id)a3 didWriteTransactionReceipt:(id)a4
{
  id v4 =  -[PDDatabaseManager insertOrUpdateTransactionReceipt:]( self->_databaseManager,  "insertOrUpdateTransactionReceipt:",  a4);
}

- (void)transactionReceiptFileManager:(id)a3 didDeleteTransactionReceiptWithUniqueID:(id)a4
{
}

- (void)registerDatabaseObject:(id)a3
{
}

- (void)noteLockScreenSettingsChangedForPassWithUniqueIdentifier:(id)a3
{
  unprotectedManagers = self->_unprotectedManagers;
  if (unprotectedManagers) {
    notificationStreamManager = unprotectedManagers->_notificationStreamManager;
  }
  else {
    notificationStreamManager = 0LL;
  }
  id v5 = a3;
  -[PDNotificationStreamManager recalculateNotificationNames](notificationStreamManager, "recalculateNotificationNames");
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter"));
  uint64_t v7 = PKPassLockScreenSettingDidChangeNotification;
  uint64_t v9 = PKPassLibraryUniqueIDUserInfoKey;
  id v10 = v5;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v10,  &v9,  1LL));

  [v6 postNotificationName:v7 object:0 userInfo:v8];
}

- (void)noteAutomaticallyPresentSettingsChangedForPassWithUniqueIdentifier:(id)a3
{
  defaultPassManager = self->_defaultPassManager;
  id v4 = a3;
  -[PDDefaultPassManager updateContactlessPassesAvailability](defaultPassManager, "updateContactlessPassesAvailability");
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter"));
  uint64_t v6 = PKPassAutomaticPresentationSettingsDidChangeNotification;
  uint64_t v8 = PKPassLibraryUniqueIDUserInfoKey;
  id v9 = v4;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v9,  &v8,  1LL));

  [v5 postNotificationName:v6 object:0 userInfo:v7];
}

- (void)noteSettingsChangedForPassWithUniqueIdentifier:(id)a3 newSettings:(unint64_t)a4
{
  id v5 = a3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter"));
  uint64_t v7 = PKPassSettingsDidChangeNotification;
  v10[0] = PKPassLibraryUniqueIDUserInfoKey;
  v10[1] = PKPassLibrarySettingsUserInfoKey;
  v11[0] = v5;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a4));
  v11[1] = v8;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v11,  v10,  2LL));

  [v6 postNotificationName:v7 object:0 userInfo:v9];
}

- (void)handleDatabaseIntegrityProblem
{
  uint64_t Object = PKLogFacilityTypeGetObject(0LL);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Database integrity problem found.", buf, 2u);
  }

  BOOL v5 = sub_10001CB0C((uint64_t)self);
  BOOL v6 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v6)
    {
      __int16 v10 = 0;
      uint64_t v7 = "Database integrity problem resolved.";
      uint64_t v8 = (uint8_t *)&v10;
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, v7, v8, 2u);
    }
  }

  else if (v6)
  {
    __int16 v9 = 0;
    uint64_t v7 = "Database integrity resolution interrupted by data migrator.";
    uint64_t v8 = (uint8_t *)&v9;
    goto LABEL_8;
  }
}

- (void)passDidUpdateTransactionSourceIdentifierWithPassUniqueIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = PDDefaultQueue();
  BOOL v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v5);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10001D4B8;
  v8[3] = &unk_1006392B0;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

- (id)trueUniqueIDs
{
  return self->_installedPassUniqueIDs;
}

- (void)readTrueUniqueIDs:(id)a3
{
  if (a3)
  {
    p_installedPassesLock = &self->_installedPassesLock;
    id v5 = (void (**)(id, NSMutableSet *))a3;
    os_unfair_lock_lock(p_installedPassesLock);
    v5[2](v5, self->_installedPassUniqueIDs);

    os_unfair_lock_unlock(p_installedPassesLock);
  }

- (void)readTrueTransactionReceiptUniqueiDs:(id)a3
{
  if (a3)
  {
    transactionReceiptFileManager = self->_transactionReceiptFileManager;
    id v5 = a3;
    id v6 = (id)objc_claimAutoreleasedReturnValue(-[PDTransactionReceiptFileManager uniqueIDs](transactionReceiptFileManager, "uniqueIDs"));
    (*((void (**)(id, id))a3 + 2))(v5, v6);
  }

- (void)mutateTrueUniqueIDs:(id)a3
{
  if (a3)
  {
    p_installedPassesLock = &self->_installedPassesLock;
    id v5 = (void (**)(id, NSMutableSet *))a3;
    os_unfair_lock_lock(p_installedPassesLock);
    v5[2](v5, self->_installedPassUniqueIDs);

    os_unfair_lock_unlock(p_installedPassesLock);
  }

- (id)storedPasses
{
  return -[PDCardFileManager passes](self->_cardFileManager, "passes");
}

- (void)paymentPass:(id)a3 didUpdatePaymentApplications:(id)a4 toPaymentApplications:(id)a5
{
  id v8 = a3;
  secureElement = self->_secureElement;
  id v10 = a5;
  id v11 = a4;
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472LL;
  v47[2] = sub_10001DB74;
  v47[3] = &unk_10063A2C8;
  id v12 = (id)objc_claimAutoreleasedReturnValue(-[PKSecureElement secureElementIdentifiers](secureElement, "secureElementIdentifiers"));
  id v48 = v12;
  id v13 = objc_retainBlock(v47);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v11 objectsPassingTest:v13]);

  id v15 = (void *)objc_claimAutoreleasedReturnValue([v10 objectsPassingTest:v13]);
  expressPassManager = self->_expressPassManager;
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v8 uniqueID]);
  sub_10014B65C((uint64_t)expressPassManager, v14, v15, v17);

  id v18 = (void *)objc_claimAutoreleasedReturnValue([v8 deviceContactlessPaymentApplications]);
  if ((unint64_t)[v18 count] >= 2)
  {
    databaseManager = self->_databaseManager;
    BOOL v20 = (void *)objc_claimAutoreleasedReturnValue([v8 uniqueID]);
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager defaultPaymentApplicationForPassUniqueIdentifier:]( databaseManager,  "defaultPaymentApplicationForPassUniqueIdentifier:",  v20));

    if (!v21)
    {
      uint64_t v39 = v15;
      v40 = v13;
      id v41 = v12;
      id v22 = (void *)objc_claimAutoreleasedReturnValue([v8 devicePrimaryContactlessPaymentApplication]);
      __int128 v43 = 0u;
      __int128 v44 = 0u;
      __int128 v45 = 0u;
      __int128 v46 = 0u;
      uint64_t v38 = v18;
      id v23 = v18;
      id v24 = [v23 countByEnumeratingWithState:&v43 objects:v49 count:16];
      if (v24)
      {
        id v25 = v24;
        uint64_t v26 = *(void *)v44;
        do
        {
          for (uint64_t i = 0LL; i != v25; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v44 != v26) {
              objc_enumerationMutation(v23);
            }
            __int128 v28 = *(void **)(*((void *)&v43 + 1) + 8LL * (void)i);
            id v29 = [v28 contactlessPriority];
            if ((uint64_t)v29 > (uint64_t)[v22 contactlessPriority])
            {
              id v30 = v28;

              id v22 = v30;
            }
          }

          id v25 = [v23 countByEnumeratingWithState:&v43 objects:v49 count:16];
        }

        while (v25);
      }

      id v31 = self->_databaseManager;
      v32 = (void *)objc_claimAutoreleasedReturnValue([v8 uniqueID]);
      id v33 =  -[PDDatabaseManager setDefaultPaymentApplication:forPassUniqueIdentifier:]( v31,  "setDefaultPaymentApplication:forPassUniqueIdentifier:",  v22,  v32);

      id v13 = v40;
      id v12 = v41;
      id v18 = v38;
      id v15 = v39;
    }
  }

  if (![v14 count] && objc_msgSend(v15, "count"))
  {
    cloudStoreTransactionSourceController = self->_cloudStoreTransactionSourceController;
    id v35 = (void *)objc_claimAutoreleasedReturnValue([v15 anyObject]);
    -[PDCloudStoreTransactionSourceController didAddPaymentApplication:forPaymentPass:]( cloudStoreTransactionSourceController,  "didAddPaymentApplication:forPaymentPass:",  v35,  v8);

    uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue([v8 associatedAccountServiceAccountIdentifier]);
    if (v36)
    {
      accountManager = self->_accountManager;
      v42[0] = _NSConcreteStackBlock;
      v42[1] = 3221225472LL;
      v42[2] = sub_10001DBD4;
      v42[3] = &unk_10063A2F0;
      v42[4] = self;
      -[PDAccountManager accountWithIdentifier:completion:]( accountManager,  "accountWithIdentifier:completion:",  v36,  v42);
    }
  }

  -[PDISO18013Manager handlePaymentPassUpdateFrom:priorPaymentApplications:completion:]( self->_iso18013Manager,  "handlePaymentPassUpdateFrom:priorPaymentApplications:completion:",  v8,  v14,  0LL);
  -[PDPaymentUserCommunicationManager handlePaymentPassDidUpdatePaymentApplications:fromPaymentApplications:withCompletion:]( self->_paymentUserCommunicationManager,  "handlePaymentPassDidUpdatePaymentApplications:fromPaymentApplications:withCompletion:",  v8,  v14,  0LL);
}

- (void)transactionSourceIdentifier:(id)a3 didReceiveTransaction:(id)a4 oldTransaction:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = sub_10001EB68((uint64_t)self);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v156[0] = _NSConcreteStackBlock;
  v156[1] = 3221225472LL;
  v156[2] = sub_10001EBD4;
  v156[3] = &unk_10063A318;
  id v13 = v8;
  id v14 = v10;
  id v15 = v13;
  id v157 = v13;
  id v16 = v9;
  id v158 = v16;
  [v12 enumerateObjectsUsingBlock:v156];

  -[PDTransactionAuthenticationManager transactionSourceIdentifier:didReceiveTransaction:oldTransaction:]( self->_transactionAuthenticationManager,  "transactionSourceIdentifier:didReceiveTransaction:oldTransaction:",  v15,  v16,  v10);
  -[PDBarcodeCredentialManager transactionSourceIdentifier:didReceiveTransaction:oldTransaction:]( self->_barcodeCredentialManager,  "transactionSourceIdentifier:didReceiveTransaction:oldTransaction:",  v15,  v16,  v10);
  -[PDSpotlightIndexer transactionSourceIdentifier:didReceiveTransaction:oldTransaction:]( self->_spotlightIndexer,  "transactionSourceIdentifier:didReceiveTransaction:oldTransaction:",  v15,  v16,  v10);
  -[PDTransactionNotificationController paymentTransactionUpdated:existingPaymentTransaction:transactionSourceIdentifier:]( self->_transactionNotificationController,  "paymentTransactionUpdated:existingPaymentTransaction:transactionSourceIdentifier:",  v16,  v10,  v15);
  if ([v16 isIssuerInstallmentTransaction]
    && [v16 hasNotificationServiceData])
  {
    PKSharedCacheSetBoolForKey(1LL, PKSharedCacheHasEverMadeIssuerInstallmentTransaction);
  }

  uint64_t v17 = objc_claimAutoreleasedReturnValue([v16 paymentRewardsRedemption]);
  if (v17)
  {
    id v18 = (void *)v17;
    unsigned int v19 = [v16 hasNotificationServiceData];

    if (v19) {
      PKSharedCacheSetBoolForKey(1LL, PKSharedCacheHasEverMadePayWithRewardsTransaction);
    }
  }

  unsigned int v20 = [v16 updateReasonIsInitialDownload];
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager passUniqueIdentifierForTransactionSourceIdentifier:]( self->_databaseManager,  "passUniqueIdentifierForTransactionSourceIdentifier:",  v15));
  if (v21)
  {
    id v22 = (void *)objc_claimAutoreleasedReturnValue([v16 identifier]);
    char v23 = v22 ? v20 : 1;

    if ((v23 & 1) == 0)
    {
      id v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter"));
      v169[0] = PKDistributedNotificationTransactionIdentifierKey;
      id v25 = (void *)objc_claimAutoreleasedReturnValue([v16 identifier]);
      v170[0] = v25;
      v170[1] = v21;
      v169[1] = PKDistributedNotificationTransactionPassUniqueIDKey;
      v169[2] = PKDistributedNotificationTransactionSourceTransactionIdentifierKey;
      v170[2] = v15;
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v170,  v169,  3LL));

      uint64_t Object = PKLogFacilityTypeGetObject(11LL);
      __int128 v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "posting PKDistributedNotificationPaymentTransactionReceived",  buf,  2u);
      }

      [v24 postNotificationName:PKDistributedNotificationPaymentTransactionReceived object:0 userInfo:v26];
    }
  }

  unsigned int v142 = v20;
  if ((v20 & 1) != 0) {
    goto LABEL_51;
  }
  if ([v16 deviceScoreIdentifiersRequired]
    && ([v16 deviceScoreIdentifiersSubmitted] & 1) == 0)
  {
    id v29 = (void *)objc_claimAutoreleasedReturnValue([v16 sendDeviceScoreIdentifier]);
    if (v29)
    {
    }

    else
    {
      id v30 = (void *)objc_claimAutoreleasedReturnValue([v16 requestDeviceScoreIdentifier]);

      if (!v30) {
        goto LABEL_30;
      }
    }

    PKAnalyticsSendEvent(PKAggDKeyPeerPaymentDeviceScoreSubmissionRequested, 0LL);
    id v31 = (void *)objc_claimAutoreleasedReturnValue([v16 serviceIdentifier]);
    if ([v31 length]
      && (-[NSMutableSet containsObject:]( self->_transactionDeviceScoreSubmissionsInProgess,  "containsObject:",  v31) & 1) == 0)
    {
      uint64_t v34 = PKLogFacilityTypeGetObject(11LL);
      id v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v162 = (uint64_t)v31;
        _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "Submitting device score for transaction with service identifier %@",  buf,  0xCu);
      }

      -[NSMutableSet addObject:](self->_transactionDeviceScoreSubmissionsInProgess, "addObject:", v31);
      peerPaymentWebServiceCoordinator = self->_peerPaymentWebServiceCoordinator;
      v152[0] = _NSConcreteStackBlock;
      v152[1] = 3221225472LL;
      v152[2] = sub_10001EBE0;
      v152[3] = &unk_10063A340;
      v152[4] = self;
      id v153 = v31;
      id v154 = v16;
      id v155 = v15;
      -[PDPeerPaymentWebServiceCoordinator submitDeviceScoreIdentifiersForTransaction:completion:]( peerPaymentWebServiceCoordinator,  "submitDeviceScoreIdentifiersForTransaction:completion:",  v154,  v152);
    }

    else
    {
      uint64_t v32 = PKLogFacilityTypeGetObject(11LL);
      id v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v162 = (uint64_t)v31;
        _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "Not submitting device score for transaction with service identifier %@, because another request is in progress.",  buf,  0xCu);
      }
    }
  }

- (void)paymentPassWithUniqueIdentifier:(id)a3 didRecomputeCategoryVisualizationMagnitudes:(id)a4 withStyle:(int64_t)a5
{
  id v7 = a3;
  id v8 = sub_10001EB68((uint64_t)self);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  void v11[2] = sub_10001F77C;
  v11[3] = &unk_10063A3D0;
  id v12 = v7;
  int64_t v13 = a5;
  id v10 = v7;
  [v9 enumerateObjectsUsingBlock:v11];
}

- (void)didAddCredentialInvitation:(id)a3
{
  id v4 = a3;
  id v5 = sub_10001EB68((uint64_t)self);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10001F818;
  v8[3] = &unk_10063A3F8;
  id v9 = v4;
  id v7 = v4;
  [v6 enumerateObjectsUsingBlock:v8];
}

- (void)appletSubcredentialManager:(id)a3 didUpdateCredential:(id)a4 onPassWithIdentifier:(id)a5 oldShares:(id)a6
{
  id v11 = a6;
  id v8 = a5;
  -[PDServer sharesDidUpdateWithPaymentPassWithUniqueIdentifier:]( self,  "sharesDidUpdateWithPaymentPassWithUniqueIdentifier:",  v8);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDDatabaseManager passWithUniqueIdentifier:](self->_databaseManager, "passWithUniqueIdentifier:", v8));

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 secureElementPass]);
  if (v10)
  {
    -[PDPendingProvisioningManager passAddedOrUpdated:](self->_pendingProvisioningManager, "passAddedOrUpdated:", v10);
    if (v11) {
      -[PDSharingManager passUpdated:oldShares:](self->_sharingManager, "passUpdated:oldShares:", v10, v11);
    }
  }
}

- (void)appletSubcredentialManager:(id)a3 didUpdateRangingSuspensionReasons:(unint64_t)a4 forCredential:(id)a5 forPaymentApplication:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  id v11 = sub_10001EB68((uint64_t)self);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10001F98C;
  v15[3] = &unk_10063A420;
  id v16 = v9;
  id v17 = v10;
  unint64_t v18 = a4;
  id v13 = v10;
  id v14 = v9;
  [v12 enumerateObjectsUsingBlock:v15];
}

- (void)appletSubcredentialManager:(id)a3 didTerminateProvisioningForCredential:(id)a4
{
  sharingManager = self->_sharingManager;
  id v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "identifier", a3));
  -[PDSharingManager didReceiveActivationCodeFailureForCredentialIdentifier:attemptsRemaining:completion:]( sharingManager,  "didReceiveActivationCodeFailureForCredentialIdentifier:attemptsRemaining:completion:",  v5,  0LL,  &stru_10063A440);
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didEnableDailyCashNotifications:(BOOL)a4
{
  accountManager = self->_accountManager;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10001FA4C;
  v5[3] = &unk_10063A2F0;
  v5[4] = self;
  -[PDAccountManager defaultAccountForFeature:completion:]( accountManager,  "defaultAccountForFeature:completion:",  2LL,  v5);
}

- (void)transactionSourceIdentifier:(id)a3 willRemoveTransaction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 associatedReceiptUniqueID]);
  if (v8)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 serviceIdentifier]);
      int v12 = 138412290;
      id v13 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Deleting receipt for transaction %@ since transaction is being removed from the database",  (uint8_t *)&v12,  0xCu);
    }

    -[PDTransactionReceiptFileManager deleteTransactionReceiptWithUniqueID:]( self->_transactionReceiptFileManager,  "deleteTransactionReceiptWithUniqueID:",  v8);
  }

  -[PDTransactionNotificationController paymentTransactionRemoved:transactionSourceIdentifier:]( self->_transactionNotificationController,  "paymentTransactionRemoved:transactionSourceIdentifier:",  v7,  v6);
}

- (void)willRemoveTransactionsWithSourceIdentifierMapping:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10001FC5C;
  v3[3] = &unk_10063A468;
  v3[4] = self;
  [a3 enumerateKeysAndObjectsUsingBlock:v3];
}

- (void)transactionSourceIdentifier:(id)a3 didRemoveTransactionWithIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_10001EB68((uint64_t)self);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10001FE30;
  v12[3] = &unk_10063A318;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  [v9 enumerateObjectsUsingBlock:v12];

  sub_10001FE3C((uint64_t)self, v11, v10);
}

- (void)didRemoveTransactionsWithSourceIdentifierMapping:(id)a3
{
  id v4 = a3;
  id v5 = sub_10001EB68((uint64_t)self);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100020044;
  v9[3] = &unk_10063A3F8;
  id v10 = v4;
  id v7 = v4;
  [v6 enumerateObjectsUsingBlock:v9];

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100020050;
  v8[3] = &unk_10063A468;
  void v8[4] = self;
  [v7 enumerateKeysAndObjectsUsingBlock:v8];
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didReceiveMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_10001EB68((uint64_t)self);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100020214;
  v12[3] = &unk_10063A318;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  [v9 enumerateObjectsUsingBlock:v12];
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didUpdateBalancesFrom:(id)a4 toBalances:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = sub_10001EB68((uint64_t)self);
  int v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = sub_100020450;
  v30[3] = &unk_10063A318;
  id v13 = v8;
  id v31 = v13;
  id v14 = v10;
  id v32 = v14;
  [v12 enumerateObjectsUsingBlock:v30];
  if (v9)
  {
    id v24 = v14;
    id v25 = v12;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    id v15 = v14;
    id v16 = [v15 countByEnumeratingWithState:&v26 objects:v33 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v27;
      do
      {
        for (uint64_t i = 0LL; i != v17; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v27 != v18) {
            objc_enumerationMutation(v15);
          }
          unsigned int v20 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)i);
          uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "identifiers", v24, v25, (void)v26));
          id v22 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v21]);

          if (v22) {
            sub_1000204B8((uint64_t)self, v13, v22, v20);
          }
        }

        id v17 = [v15 countByEnumeratingWithState:&v26 objects:v33 count:16];
      }

      while (v17);
    }

    id v14 = v24;
    int v12 = v25;
  }

  if (v13)
  {
    sub_10033DE48((uint64_t)self->_balanceManager, v13);
    -[PDPassDynamicStateManager setDidUpdateDynamicStateForPassUniqueID:]( self->_dynamicStateManager,  "setDidUpdateDynamicStateForPassUniqueID:",  v13);
    char v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter"));
    [v23 postNotificationName:PKDistributedNotificationBalanceUpdateReceivedForPass object:v13 userInfo:0];
  }
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didUpdateToPlans:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_10001EB68((uint64_t)self);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100020688;
  v13[3] = &unk_10063A318;
  id v12 = v6;
  id v14 = v12;
  id v10 = v7;
  id v15 = v10;
  [v9 enumerateObjectsUsingBlock:v13];

  if (v12)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter"));
    [v11 postNotificationName:PKDistributedNotificationPlanUpdateReceivedForPass object:v12 userInfo:0];
  }
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didUpdateBalanceReminder:(id)a4 forBalanceWithIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = sub_10001EB68((uint64_t)self);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  uint64_t v18 = _NSConcreteStackBlock;
  uint64_t v19 = 3221225472LL;
  unsigned int v20 = sub_100020824;
  uint64_t v21 = &unk_10063A490;
  id v13 = v8;
  id v22 = v13;
  id v14 = v9;
  id v23 = v14;
  id v15 = v10;
  id v24 = v15;
  [v12 enumerateObjectsUsingBlock:&v18];

  if (v13)
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter",  v18,  v19,  v20,  v21,  v22,  v23));
    v25[0] = PKDistributedNotificationBalanceReminderUpdateBalanceIdentifierKey;
    v25[1] = PKDistributedNotificationBalanceReminderUpdatePassUniqueIDKey;
    v26[0] = v15;
    v26[1] = v13;
    id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v26,  v25,  2LL));
    [v16 postNotificationName:PKDistributedNotificationBalanceReminderUpdateReceived object:0 userInfo:v17];
  }
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didResolvePendingTransitTransactionAmountsWithTransaction:(id)a4 paymentApplication:(id)a5 balance:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = -[PDPassTransitTransactionUserNotification initWithPaymentTransaction:forPassUniqueIdentifier:paymentApplication:balance:]( objc_alloc(&OBJC_CLASS___PDPassTransitTransactionUserNotification),  "initWithPaymentTransaction:forPassUniqueIdentifier:paymentApplication:balance:",  v13,  v10,  v12,  v11);

  uint64_t Object = PKLogFacilityTypeGetObject(12LL);
  id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138412290;
    id v18 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Inserting PDPassTransitTransactionUserNotification for pass with unique identifier: %@, having resolved pending tr ansit transaction amounts",  (uint8_t *)&v17,  0xCu);
  }

  -[PDUserNotificationManager insertUserNotification:](self->_userNotificationManager, "insertUserNotification:", v14);
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didEnableTransactionService:(BOOL)a4
{
  id v6 = a3;
  id v7 = sub_10001EB68((uint64_t)self);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  void v10[2] = sub_100021244;
  v10[3] = &unk_10063A4E0;
  id v11 = v6;
  BOOL v12 = a4;
  id v9 = v6;
  [v8 enumerateObjectsUsingBlock:v10];
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didEnableMessageService:(BOOL)a4
{
  id v6 = a3;
  id v7 = sub_10001EB68((uint64_t)self);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  void v10[2] = sub_1000212F4;
  v10[3] = &unk_10063A4E0;
  id v11 = v6;
  BOOL v12 = a4;
  id v9 = v6;
  [v8 enumerateObjectsUsingBlock:v10];
}

- (void)passWithUniqueIdentifier:(id)a3 didReceiveValueAddedServiceTransaction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_10001EB68((uint64_t)self);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100021470;
  v16[3] = &unk_10063A318;
  id v15 = v6;
  id v17 = v15;
  id v10 = v7;
  id v18 = v10;
  [v9 enumerateObjectsUsingBlock:v16];

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);
  if (v11)
  {
    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);
    [v13 setObject:v14 forKey:PKDistributedNotificationTransactionIdentifierKey];

    if (v15) {
      [v13 setObject:v15 forKey:PKDistributedNotificationTransactionPassUniqueIDKey];
    }
    [v12 postNotificationName:PKDistributedNotificationValueAddedServiceTransactionReceived object:0 userInfo:v13];
  }
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didUpdateFromTransitProperties:(id)a4 toTransitProperties:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = sub_10001EB68((uint64_t)self);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_1000215F4;
  v19[3] = &unk_10063A318;
  id v11 = v7;
  id v20 = v11;
  id v12 = v8;
  id v21 = v12;
  [v10 enumerateObjectsUsingBlock:v19];

  if (v11)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter"));
    [v13 postNotificationName:PKDistributedNotificationTransitPropertiesUpdatedForPass object:v11 userInfo:0];
  }

  -[PDTransactionNotificationController transitPropertiesUpdated:forPassUniqueIdentifier:]( self->_transactionNotificationController,  "transitPropertiesUpdated:forPassUniqueIdentifier:",  v12,  v11);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v12 enrouteTransitTypes]);
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 lastObject]);
  id v16 = [v15 integerValue];

  userNotificationManager = self->_userNotificationManager;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_100021600;
  v18[3] = &unk_10063A508;
  v18[4] = self;
  v18[5] = v16;
  -[PDUserNotificationManager userNotificationsForPassUniqueIdentifier:ofType:completion:]( userNotificationManager,  "userNotificationsForPassUniqueIdentifier:ofType:completion:",  v11,  6LL,  v18);
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didUpdateDefaultPaymentApplication:(id)a4
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter"));
  [v5 postNotificationName:PKDistributedNotificationDefaultPaymentApplicationChangedForPass object:v4 userInfo:0];
}

- (void)passUniqueIdentifiersMovedToExpired:(id)a3
{
  id v4 = a3;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0LL; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8LL * (void)i);
        id v10 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager passWithUniqueIdentifier:]( self->_databaseManager,  "passWithUniqueIdentifier:",  v9));
        if ([v10 supportsLifecycleUpdates]) {
          -[PDWebServicesCoordinator sendPassLifecycleEventForUniqueIdentifier:state:]( self->_webServicesCoordinator,  "sendPassLifecycleEventForUniqueIdentifier:state:",  v9,  1LL);
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v6);
  }
}

- (void)removePassesOfType:(unint64_t)a3 withDiagnosticReason:(id)a4
{
  id v6 = a4;
  if (a3 == 1)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(0LL);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "PDServer: removing all secure element passes...",  buf,  2u);
    }

    uint64_t v11 = 5LL;
    goto LABEL_13;
  }

  if (a3)
  {
    if (a3 != -1LL) {
      goto LABEL_38;
    }
    uint64_t v7 = PKLogFacilityTypeGetObject(0LL);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v9 = "PDServer: removing all passes...";
LABEL_11:
      uint64_t v11 = 2LL;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v9, buf, 2u);
      goto LABEL_13;
    }
  }

  else
  {
    uint64_t v12 = PKLogFacilityTypeGetObject(0LL);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v9 = "PDServer: removing all barcode passes...";
      goto LABEL_11;
    }
  }

  uint64_t v11 = 2LL;
LABEL_13:

  int v14 = atomic_load(&self->_initializationState);
  if (v14 == 1)
  {
    if (a3 + 1 >= 2)
    {
      if (a3 == 1) {
        sub_100021C44((uint64_t)self, v13, v6, 0LL, v11);
      }
    }

    else
    {
      id v15 = objc_autoreleasePoolPush();
      __int128 v34 = 0u;
      __int128 v35 = 0u;
      __int128 v36 = 0u;
      __int128 v37 = 0u;
      id v16 = (void *)objc_claimAutoreleasedReturnValue(-[PDDatabaseManager passUniqueIDsOfType:](self->_databaseManager, "passUniqueIDsOfType:", 0LL));
      id v17 = [v16 countByEnumeratingWithState:&v34 objects:v40 count:16];
      if (v17)
      {
        id v18 = v17;
        uint64_t v19 = *(void *)v35;
        do
        {
          for (uint64_t i = 0LL; i != v18; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v35 != v19) {
              objc_enumerationMutation(v16);
            }
            -[PDCardFileManager deleteCardWithUniqueID:forReason:withDiagnosticReason:]( self->_cardFileManager,  "deleteCardWithUniqueID:forReason:withDiagnosticReason:",  *(void *)(*((void *)&v34 + 1) + 8LL * (void)i),  v11,  v6);
          }

          id v18 = [v16 countByEnumeratingWithState:&v34 objects:v40 count:16];
        }

        while (v18);
      }

      objc_autoreleasePoolPop(v15);
      if (a3 == 1 || a3 == -1LL)
      {
        sub_100021C44((uint64_t)self, v21, v6, 0LL, v11);
        if (a3 == -1LL)
        {
          id v22 = objc_autoreleasePoolPush();
          __int128 v30 = 0u;
          __int128 v31 = 0u;
          __int128 v32 = 0u;
          __int128 v33 = 0u;
          id v23 = (void *)objc_claimAutoreleasedReturnValue(-[PDDatabaseManager passUniqueIDs](self->_databaseManager, "passUniqueIDs", 0LL));
          id v24 = [v23 countByEnumeratingWithState:&v30 objects:v39 count:16];
          if (v24)
          {
            id v25 = v24;
            uint64_t v26 = *(void *)v31;
            do
            {
              for (j = 0LL; j != v25; j = (char *)j + 1)
              {
                if (*(void *)v31 != v26) {
                  objc_enumerationMutation(v23);
                }
                -[PDCardFileManager deleteCardWithUniqueID:forReason:withDiagnosticReason:]( self->_cardFileManager,  "deleteCardWithUniqueID:forReason:withDiagnosticReason:",  *(void *)(*((void *)&v30 + 1) + 8LL * (void)j),  v11,  v6);
              }

              id v25 = [v23 countByEnumeratingWithState:&v30 objects:v39 count:16];
            }

            while (v25);
          }

          objc_autoreleasePoolPop(v22);
        }
      }
    }
  }

  else
  {
    uint64_t v28 = PKLogFacilityTypeGetObject(0LL);
    __int128 v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "PDServer: passd is not active - ignoring pass removal request.",  buf,  2u);
    }
  }

- (void)recoverPassWithUniqueID:(id)a3
{
  id v11 = a3;
  id v4 = objc_autoreleasePoolPush();
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager passWithUniqueIdentifier:]( self->_databaseManager,  "passWithUniqueIdentifier:",  v11));
  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager passAnnotationsForPassUniqueIdentifier:]( self->_databaseManager,  "passAnnotationsForPassUniqueIdentifier:",  v11));
    uint64_t v7 = v6;
    if (v6 && [v6 sortingState] == (id)1)
    {
      -[PDDatabaseManager updatePassAnnotationsForPassWithUniqueIdentifier:withSortingState:]( self->_databaseManager,  "updatePassAnnotationsForPassWithUniqueIdentifier:withSortingState:",  v11,  2LL);
      dynamicStateManager = self->_dynamicStateManager;
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v5 uniqueID]);
      id v10 = (void *)objc_claimAutoreleasedReturnValue( -[PDPassDynamicStateManager passDynamicStateForUniqueIdentifier:]( dynamicStateManager,  "passDynamicStateForUniqueIdentifier:",  v9));

      sub_100021FCC((uint64_t)self, v5, v10);
      if ([v5 supportsLifecycleUpdates]) {
        -[PDWebServicesCoordinator sendPassLifecycleEventForUniqueIdentifier:state:]( self->_webServicesCoordinator,  "sendPassLifecycleEventForUniqueIdentifier:state:",  v11,  0LL);
      }
    }
  }

  objc_autoreleasePoolPop(v4);
}

- (void)noteACAccountChanged:(id)a3 handler:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(void))a4;
  switch((unint64_t)[v6 operation])
  {
    case 0uLL:
      uint64_t Object = PKLogFacilityTypeGetObject(0LL);
      uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "passd was asked to respond to account change that is unsupported.",  buf,  2u);
      }

      if (v7) {
        v7[2](v7);
      }
      break;
    case 1uLL:
      uint64_t v19 = PKLogFacilityTypeGetObject(0LL);
      id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "passd was asked to respond to account addition.",  buf,  2u);
      }

      id v21 = PDDefaultQueue();
      id v22 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v21);
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472LL;
      v29[2] = sub_1000224D0;
      v29[3] = &unk_100639AF0;
      v29[4] = self;
      id v30 = v6;
      __int128 v31 = v7;
      dispatch_async(v22, v29);

      int v14 = v30;
      goto LABEL_15;
    case 2uLL:
      uint64_t v10 = PKLogFacilityTypeGetObject(0LL);
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "passd was asked to respond to account update.",  buf,  2u);
      }

      id v12 = PDDefaultQueue();
      uint64_t v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v12);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100022558;
      block[3] = &unk_100639AF0;
      block[4] = self;
      id v27 = v6;
      uint64_t v28 = v7;
      dispatch_async(v13, block);

      int v14 = v27;
      goto LABEL_15;
    case 3uLL:
      uint64_t v15 = PKLogFacilityTypeGetObject(0LL);
      id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "passd was asked to respond to account deletetion.",  buf,  2u);
      }

      id v17 = PDDefaultQueue();
      id v18 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v17);
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472LL;
      v23[2] = sub_1000225E4;
      v23[3] = &unk_100639AF0;
      v23[4] = self;
      id v24 = v6;
      id v25 = v7;
      dispatch_async(v18, v23);

      int v14 = v24;
LABEL_15:

      break;
    default:
      break;
  }
}

- (void)primaryAppleAccountWasAdded:(id)a3
{
}

- (void)primaryAppleAccountWasUpdated:(id)a3 handler:(id)a4
{
  id v7 = a3;
  id v6 = (void (**)(void))a4;
  PKDisableCloudKitEnvironmentChangeHandling(0LL);
  if ([v7 didEnablementOfWalletDataclassChange])
  {
    -[PDCloudStoreNotificationCoordinator noteCloudSyncPassesSwitchChanged]( self->_cloudStoreCoordinator,  "noteCloudSyncPassesSwitchChanged");
    +[PKWalletVisibility updateWalletVisibility](&OBJC_CLASS___PKWalletVisibility, "updateWalletVisibility");
  }

  -[PDPaymentWebServiceCoordinator noteAccountChanged](self->_paymentWebServiceCoordinator, "noteAccountChanged");
  if (v6) {
    v6[2](v6);
  }
}

- (void)primaryAppleAccountWasDeleted:(id)a3
{
}

- (void)prepareForBackupRestoreWithRequiredFileURLs:(id)a3 destinationFileHandles:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(void))a5;
  uint64_t Object = PKLogFacilityTypeGetObject(0LL);
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Starting backup of preferences file", buf, 2u);
  }

  PDWritePassdPreferencesToSafeHaven();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Finished backup of preferences file", buf, 2u);
  }

  databaseManager = self->_databaseManager;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100023008;
  v16[3] = &unk_1006392B0;
  id v17 = v8;
  id v18 = v9;
  id v14 = v9;
  id v15 = v8;
  -[PDDatabaseManager accessDatabaseUsingBlock:](databaseManager, "accessDatabaseUsingBlock:", v16);
  if (v10) {
    v10[2](v10);
  }
}

- (void)nukeStuff
{
}

- (void)dataMigrationRequestedWithPassLibrary:(id)a3 didRestoreFromBackup:(BOOL)a4
{
  double Current = CFAbsoluteTimeGetCurrent();
  uint64_t Object = PKLogFacilityTypeGetObject(0LL);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    sub_1004413B0();
  }

  p_migrationState = &self->_migrationState;
  atomic_store(1u, &self->_migrationState);
  id v10 = PDDefaultQueue();
  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v10);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000236B4;
  block[3] = &unk_100639238;
  block[4] = self;
  BOOL v22 = a4;
  *(double *)&void block[5] = Current;
  dispatch_sync(v11, block);

  do
    int v12 = __ldaxr(p_migrationState);
  while (__stlxr(0, p_migrationState));
  if (v12 == 2)
  {
    uint64_t v13 = (void *)PDOSTransactionCreate("PDServer");
    id v14 = PDDefaultQueue();
    id v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v14);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_100024A0C;
    v18[3] = &unk_1006392B0;
    id v19 = v13;
    id v20 = self;
    id v16 = v13;
    dispatch_async(v15, v18);
  }

  -[PDPassSignalManager donateAllPassSignalsIfNeccessaryWithCompletion:]( self->_passSignalManager,  "donateAllPassSignalsIfNeccessaryWithCompletion:",  &stru_10063A648);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    CFAbsoluteTime v17 = CFAbsoluteTimeGetCurrent();
    *(_DWORD *)buf = 134217984;
    double v24 = v17 - Current;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Migration finished in %0.3fs.", buf, 0xCu);
  }
}

- (void)introduceDatabaseIntegrityProblem
{
  if (-[PDDatabaseManager numberOfRealPasses](self->_databaseManager, "numberOfRealPasses") >= 4)
  {
    do
    {
      if (!arc4random_uniform(2u)) {
        break;
      }
      -[PDDatabaseManager introduceMissingUniqueID](self->_databaseManager, "introduceMissingUniqueID");
    }

    while (-[PDDatabaseManager numberOfRealPasses](self->_databaseManager, "numberOfRealPasses") > 3);
  }

  while (arc4random_uniform(2u))
    -[PDDatabaseManager introduceExtraneousUniqueID](self->_databaseManager, "introduceExtraneousUniqueID");
  while (arc4random_uniform(2u))
    -[PDDatabaseManager introduceDuplicateUniqueID](self->_databaseManager, "introduceDuplicateUniqueID");
  exit(0);
}

- (void)issueSecureElementPassStateChangeNotificationForNewPasses:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "pk_objectsPassingTest:", &stru_10063A6B0));
  id v5 = [v4 count];
  if (v5)
  {
    if (v5 == (id)1)
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectAtIndexedSubscript:0]);
      paymentWebServiceCoordinator = self->_paymentWebServiceCoordinator;
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472LL;
      v14[2] = sub_100025324;
      v14[3] = &unk_10063A700;
      v14[4] = self;
      id v15 = v6;
      id v8 = v6;
      -[PDPaymentWebServiceCoordinator performHandlerOnSharedWebServiceQueue:]( paymentWebServiceCoordinator,  "performHandlerOnSharedWebServiceQueue:",  v14);
    }

    else
    {
      expressPassManager = self->_expressPassManager;
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472LL;
      void v10[2] = sub_100025440;
      v10[3] = &unk_10063A768;
      int v12 = self;
      id v13 = v5;
      id v11 = v4;
      sub_10014C1C8((uint64_t)expressPassManager, v10);
      id v8 = v11;
    }
  }
}

- (void)rescheduleCommutePlanRenewalRemindersForPaymentPassWithUniqueIdentifier:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PDDatabaseManager passWithUniqueIdentifier:](self->_databaseManager, "passWithUniqueIdentifier:", a3));
  id v5 = (id)objc_claimAutoreleasedReturnValue([v4 paymentPass]);

  sub_10001B780((uint64_t)self, v5);
}

- (void)checkForTransitNotification
{
}

- (void)postUpgradedPassNotificationForMarket:(id)a3 pass:(id)a4
{
}

- (void)postUpgradesAvailableNotificationForMarket:(id)a3 pass:(id)a4
{
}

- (void)didRequestToRegister:(id)a3 fromDestination:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"request to register device over IDS"));
  deviceRegistrationServiceCoordinator = self->_deviceRegistrationServiceCoordinator;
  id v10 = [v7 registerBroker];
  id v11 = [v7 registerPeerPayment];

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100025790;
  v13[3] = &unk_100639558;
  id v14 = v6;
  id v15 = self;
  id v12 = v6;
  -[PDDeviceRegistrationServiceCoordinator performDeviceRegistrationForReason:brokerURL:action:forceApplePayRegister:forcePeerPaymentRegister:completion:]( deviceRegistrationServiceCoordinator,  "performDeviceRegistrationForReason:brokerURL:action:forceApplePayRegister:forcePeerPaymentRegister:completion:",  v8,  0LL,  1LL,  v10,  v11,  v13);
}

- (void)handlerDetailsForConfiguration:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t Object = PKLogFacilityTypeGetObject(9LL);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Getting current user and handle user info for configuration %@",  (uint8_t *)&buf,  0xCu);
  }

  uint64_t v10 = objc_claimAutoreleasedReturnValue([v6 handle]);
  id v11 = (void *)v10;
  if (v7)
  {
    if (v6 && v10)
    {
      id v12 = [v6 sharingGroup];
      if (v12 == (id)1)
      {
        char v13 = 0;
        goto LABEL_12;
      }

      if (v12 == (id)2)
      {
        char v13 = 1;
LABEL_12:
        *(void *)&__int128 buf = 0LL;
        *((void *)&buf + 1) = &buf;
        uint64_t v42 = 0x3032000000LL;
        id v43 = sub_100025D44;
        id v44 = sub_100025D54;
        id v45 = 0LL;
        v39[0] = 0LL;
        v39[1] = v39;
        v39[2] = 0x3032000000LL;
        v39[3] = sub_100025D44;
        v39[4] = sub_100025D54;
        id v40 = 0LL;
        v37[0] = 0LL;
        v37[1] = v37;
        v37[2] = 0x3032000000LL;
        v37[3] = sub_100025D44;
        v37[4] = sub_100025D54;
        id v38 = 0LL;
        v35[0] = 0LL;
        v35[1] = v35;
        v35[2] = 0x3032000000LL;
        v35[3] = sub_100025D44;
        v35[4] = sub_100025D54;
        id v36 = 0LL;
        id v14 = objc_alloc_init(&OBJC_CLASS___PKAsyncUnaryOperationComposer);
        v31[0] = _NSConcreteStackBlock;
        v31[1] = 3221225472LL;
        v31[2] = sub_100025D5C;
        v31[3] = &unk_100639750;
        v31[4] = self;
        id v15 = v11;
        id v32 = v15;
        __int128 v33 = v39;
        p___int128 buf = &buf;
        [v14 addOperation:v31];

        if ((v13 & 1) != 0)
        {
          v24[0] = _NSConcreteStackBlock;
          v24[1] = 3221225472LL;
          v24[2] = sub_10002601C;
          v24[3] = &unk_10063A7E0;
          uint64_t v28 = v39;
          id v25 = v6;
          uint64_t v26 = self;
          id v27 = v15;
          __int128 v29 = v35;
          id v30 = v37;
          [v14 addOperation:v24];
        }

        id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472LL;
        v18[2] = sub_1000262B0;
        v18[3] = &unk_10063A808;
        id v20 = &buf;
        id v21 = v37;
        BOOL v22 = v39;
        id v23 = v35;
        id v19 = v7;
        id v17 = [v14 evaluateWithInput:v16 completion:v18];

        _Block_object_dispose(v35, 8);
        _Block_object_dispose(v37, 8);

        _Block_object_dispose(v39, 8);
        _Block_object_dispose(&buf, 8);

        goto LABEL_16;
      }
    }

    (*((void (**)(id, void, void))v7 + 2))(v7, 0LL, 0LL);
  }

- (id)paymentApplicationForTransactionSource:(id)a3
{
  return -[PDDatabaseManager paymentApplicationForTransactionSourceIdentifier:]( self->_databaseManager,  "paymentApplicationForTransactionSourceIdentifier:",  a3);
}

- (id)passUniqueIdentifierforTransactionSourceIdentifier:(id)a3
{
  return -[PDDatabaseManager passUniqueIdentifierForTransactionSourceIdentifier:]( self->_databaseManager,  "passUniqueIdentifierForTransactionSourceIdentifier:",  a3);
}

- (id)paymentApplicationForDPANIdentifier:(id)a3
{
  return -[PDDatabaseManager paymentApplicationWithDPANIdentifier:]( self->_databaseManager,  "paymentApplicationWithDPANIdentifier:",  a3);
}

- (id)paymentTransactionForIdentifier:(id)a3
{
  return -[PDDatabaseManager paymentTransactionForIdentifier:]( self->_databaseManager,  "paymentTransactionForIdentifier:",  a3);
}

- (void)updateRequiresMerchantReprocessing:(BOOL)a3 forTransactionWithIdentifier:(id)a4
{
}

- (void)inAppPaymentService:(id)a3 registerPaymentListenerEndpoint:(id)a4 forHostIdentifier:(id)a5 processIdentifier:(int)a6 completion:(id)a7
{
  uint64_t v8 = *(void *)&a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  paymentHostEndpointRegistry = self->_paymentHostEndpointRegistry;
  if (!v13)
  {
    id v21 =  -[PKPaymentHostEndpointRegistry takeListenerEndpointForHostIdentifier:]( paymentHostEndpointRegistry,  "takeListenerEndpointForHostIdentifier:",  v14);
    if (!v15) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }

  -[PKPaymentHostEndpointRegistry addListenerEndpoint:forHostIdentifier:processIdentifier:]( paymentHostEndpointRegistry,  "addListenerEndpoint:forHostIdentifier:processIdentifier:",  v13,  v14,  v8);
  uint64_t Object = PKLogFacilityTypeGetObject(6LL);
  id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138412290;
    id v25 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "registerPaymentListenerEndpoint saved listenerEndpoint: %@",  buf,  0xCu);
  }

  if (v15)
  {
LABEL_5:
    id v19 = PDDefaultQueue();
    id v20 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v19);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100026578;
    block[3] = &unk_10063A830;
    id v23 = v15;
    dispatch_async(v20, block);
  }

- (void)inAppPaymentService:(id)a3 retrievePaymentListenerEndpointForHostIdentifier:(id)a4 completion:(id)a5
{
  id v7 = a5;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( -[PKPaymentHostEndpointRegistry takeListenerEndpointForHostIdentifier:]( self->_paymentHostEndpointRegistry,  "takeListenerEndpointForHostIdentifier:",  a4));
  uint64_t Object = PKLogFacilityTypeGetObject(6LL);
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138412290;
    id v17 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "takeListenerEndpointForHostIdentifier returns listenerEndpoint: %@",  buf,  0xCu);
  }

  if (v7)
  {
    id v11 = PDDefaultQueue();
    id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v11);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1000266C8;
    v13[3] = &unk_1006396B0;
    id v15 = v7;
    id v14 = v8;
    dispatch_async(v12, v13);
  }
}

- (void)handleContinuityPaymentBulletinActionWithIdentifier:(id)a3 manager:(id)a4
{
  uint64_t Object = PKLogFacilityTypeGetObject(8LL);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received continuity notification", v6, 2u);
  }
}

- (id)createCurrentNotificationRegistrationState
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  if (!atomic_load(&self->_fileProtectionState)) {
    -[NSMutableSet addObject:](v3, "addObject:", PDDarwinNotificationMobileKeyBagFirstUnlock);
  }
  if (!atomic_load(&self->_iCloudRestoreState)) {
    -[NSMutableSet addObject:](v3, "addObject:", off_1007037B0());
  }
  if (!-[NSMutableSet count](v3, "count"))
  {
    if (PKSecureElementIsAvailable(0LL, v7))
    {
      -[NSMutableSet addObject:](v3, "addObject:", PDDarwinNotificationEventPasswordChanged);
      -[NSMutableSet addObject:](v3, "addObject:", PKDarwinNotificationEventDeveloperImageMounted);
      -[NSMutableSet addObject:](v3, "addObject:", PKDarwinNotificationEventDidEnterField);
      if (-[PDDatabaseManager passExistsWithPassType:](self->_databaseManager, "passExistsWithPassType:", 1LL))
      {
        -[NSMutableSet addObject:](v3, "addObject:", PKDarwinNotificationEventLostModeStateChanged);
        -[NSMutableSet addObject:](v3, "addObject:", PDDarwinNotificationEventBluetoothPowerChanged);
      }
    }
  }

  if (-[NSMutableSet count](v3, "count") || -[NSMutableSet count](v4, "count"))
  {
    uint64_t v8 = objc_alloc_init(&OBJC_CLASS___PDNotificationStreamRegistrationState);
    -[PDNotificationStreamRegistrationState setNotificationNames:forStream:]( v8,  "setNotificationNames:forStream:",  v3,  0LL);
    -[PDNotificationStreamRegistrationState setNotificationNames:forStream:]( v8,  "setNotificationNames:forStream:",  v4,  1LL);
  }

  else
  {
    uint64_t v8 = 0LL;
  }

  return v8;
}

- (void)handleNotificationWithName:(id)a3 event:(id)a4 forStream:(int64_t)a5
{
  id v7 = a3;
  id v8 = PDDefaultQueue();
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002694C;
  block[3] = &unk_10063A858;
  id v13 = self;
  int64_t v14 = a5;
  id v12 = v7;
  id v10 = v7;
  dispatch_async(v9, block);
}

- (void)paymentTransactionUpdated:(id)a3 forTransactionSourceIdentifier:(id)a4
{
  id v8 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager insertOrUpdatePaymentTransaction:withTransactionSourceIdentifier:insertionMode:performTruncation:insertedTransaction:]( self->_databaseManager,  "insertOrUpdatePaymentTransaction:withTransactionSourceIdentifier:insertionMode:performTruncation:inse rtedTransaction:",  a3));
  unsigned __int8 v7 = [v6 updateReasonIsInitialDownload];
  if ([v6 fullyProcessed] && (v7 & 1) == 0) {
    -[PDAccountNotificationController paymentTransactionUpdated:forTransactionSourceIdentifier:]( self->_accountNotificationController,  "paymentTransactionUpdated:forTransactionSourceIdentifier:",  v6,  v8);
  }
}

- (void)paymentTransactionProcessorDidActivate:(id)a3
{
  p_transactionProcesssorActiveLock = &self->_transactionProcesssorActiveLock;
  os_unfair_lock_lock(&self->_transactionProcesssorActiveLock);
  if (!self->_transactionProcesssorOSTransaction)
  {
    id v5 = (OS_os_transaction *)PDOSTransactionCreate("PDServer.transaction_processor.active");
    transactionProcesssorOSTransaction = self->_transactionProcesssorOSTransaction;
    self->_transactionProcesssorOSTransaction = v5;
  }

  os_unfair_lock_unlock(p_transactionProcesssorActiveLock);
}

- (void)paymentTransactionProcessorDidDeactivate:(id)a3
{
  p_transactionProcesssorActiveLock = &self->_transactionProcesssorActiveLock;
  os_unfair_lock_lock(&self->_transactionProcesssorActiveLock);
  transactionProcesssorOSTransaction = self->_transactionProcesssorOSTransaction;
  self->_transactionProcesssorOSTransaction = 0LL;

  os_unfair_lock_unlock(p_transactionProcesssorActiveLock);
}

- (void)placemarkFound:(id)a3 forTransaction:(id)a4
{
  spotlightIndexer = self->_spotlightIndexer;
  if (spotlightIndexer) {
    -[PDSpotlightIndexer placemarkFound:forTransaction:](spotlightIndexer, "placemarkFound:forTransaction:", a3, a4);
  }
}

- (id)paymentPassesForContinuityDiscovery:(id)a3
{
  uint64_t Object = PKLogFacilityTypeGetObject(8LL);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received request for payment passes", v9, 2u);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PDDatabaseManager passesOfType:](self->_databaseManager, "passesOfType:", 1LL));
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allObjects]);

  return v7;
}

- (id)defaultPaymentPassForContinuityDiscovery:(id)a3
{
  databaseManager = self->_databaseManager;
  uint64_t v5 = PDDefaultPaymentPassUniqueIdentifier();
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v7 = objc_claimAutoreleasedReturnValue(-[PDDatabaseManager passWithUniqueIdentifier:](databaseManager, "passWithUniqueIdentifier:", v6));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([(id)v7 paymentPass]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 devicePrimaryInAppPaymentApplication]);
  LOBYTE(v7) = [v9 supportsInAppPayment];

  if ((v7 & 1) == 0)
  {
    id v10 = self->_databaseManager;
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[PKPaymentRequest availableNetworks](&OBJC_CLASS___PKPaymentRequest, "availableNetworks"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v11));
    id v13 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager passesForInAppPaymentOnNetworks:issuerCountryCodes:paymentApplicationStates:paymentRequestType:isMultiTokensRequest:webService:]( v10,  "passesForInAppPaymentOnNetworks:issuerCountryCodes:paymentApplicationStates:paymentRequestType:isM ultiTokensRequest:webService:",  v12,  0LL,  0LL,  0LL,  0LL,  0LL));

    int64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  @"ingestedDate",  1LL));
    id v20 = v14;
    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v20, 1LL));
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v13 sortedArrayUsingDescriptors:v15]);
    id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v16));

    if ([v17 count]) {
      uint64_t v18 = objc_claimAutoreleasedReturnValue([v17 anyObject]);
    }
    else {
      uint64_t v18 = 0LL;
    }

    id v8 = (void *)v18;
  }

  return v8;
}

- (void)accountForPaymentPass:(id)a3 manager:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if ([v7 hasAssociatedPeerPaymentAccount])
  {
    peerPaymentWebServiceCoordinator = self->_peerPaymentWebServiceCoordinator;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    void v10[2] = sub_100027378;
    v10[3] = &unk_10063A880;
    id v11 = v7;
    id v12 = v8;
    -[PDPeerPaymentWebServiceCoordinator accountWithPreventingServerFetch:completion:]( peerPaymentWebServiceCoordinator,  "accountWithPreventingServerFetch:completion:",  0LL,  v10);
  }

  else
  {
    (*((void (**)(id, void))v8 + 2))(v8, 0LL);
  }
}

- (void)supportedPaymentSetupFeatures:(id)a3 completion:(id)a4
{
  id v9 = a3;
  id v6 = (void (**)(id, void))a4;
  if (v6)
  {
    paymentWebServiceCoordinator = self->_paymentWebServiceCoordinator;
    if (paymentWebServiceCoordinator)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue( -[PDPaymentWebServiceCoordinator paymentSetupFeaturesCoordinator]( paymentWebServiceCoordinator,  "paymentSetupFeaturesCoordinator"));
      [v8 staticPaymentSetupFeaturesForSourceApplicationID:PKPassdBundleIdentifier completion:v6];
    }

    else
    {
      v6[2](v6, 0LL);
    }
  }
}

- (BOOL)deviceAvailableForContinuityPayments:(id)a3
{
  id v4 = a3;
  unprotectedManagers = self->_unprotectedManagers;
  if (unprotectedManagers && (id v6 = unprotectedManagers->_remoteInterfacePresenter) != 0LL)
  {
    id v7 = v6;
    if ((sub_1001ADB34() & 1) != 0) {
      LOBYTE(v8) = 1;
    }
    else {
      LOBYTE(v8) = sub_1001ADB34();
    }
  }

  else
  {
    id v7 = 0LL;
    unsigned int v8 = +[PKSecureElement isInFailForward](&OBJC_CLASS___PKSecureElement, "isInFailForward") ^ 1;
  }

  return v8;
}

- (id)webServiceConfigurationForContinuityPayments:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[PDPaymentWebServiceCoordinator sharedWebServiceContext]( self->_paymentWebServiceCoordinator,  "sharedWebServiceContext",  a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 configuration]);

  return v4;
}

- (CGImage)thumbnailImageForPassIdentifier:(id)a3 size:(CGSize)a4 manager:(id)a5
{
  double height = a4.height;
  double width = a4.width;
  id v9 = a3;
  id v10 = a5;
  uint64_t Object = PKLogFacilityTypeGetObject(8LL);
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 138412290;
    id v20 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Received request for thumbnail image for pass: %@",  (uint8_t *)&v19,  0xCu);
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager passWithUniqueIdentifier:]( self->_databaseManager,  "passWithUniqueIdentifier:",  v9));
  if (v13)
  {
    int64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[PKImageResizingConstraints constraintsWithAspectFillToSize:]( &OBJC_CLASS___PKImageResizingConstraints,  "constraintsWithAspectFillToSize:",  width,  height));
    [v14 setOutputScale:1.0];
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v13 frontFaceImage]);
    id v16 = objc_claimAutoreleasedReturnValue([v15 resizedImageWithConstraints:v14]);
    id v17 = CGImageRetain((CGImageRef)[v16 imageRef]);

    if (v17) {
      id v17 = CFAutorelease(v17);
    }
  }

  else
  {
    id v17 = 0LL;
  }

  return (CGImage *)v17;
}

- (void)didReceivePromptForVirtualCard:(id)a3 showNotification:(BOOL)a4
{
}

- (void)markPassWithUniqueIdentifiersForDeletion:(id)a3
{
  id v4 = a3;
  id v5 = PDDefaultQueue();
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v5);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000277D0;
  v8[3] = &unk_1006392B0;
  id v9 = v4;
  id v10 = self;
  id v7 = v4;
  dispatch_async(v6, v8);
}

- (void)secureElementPairingDidChangeForReason:(unint64_t)a3
{
  id v5 = PDDefaultQueue();
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v5);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100027954;
  v7[3] = &unk_10063A8A8;
  v7[4] = self;
  v7[5] = a3;
  dispatch_async(v6, v7);
}

- (BOOL)fieldDetectorManagerShouldSuppressFieldEvents:(id)a3
{
  unprotectedManagers = self->_unprotectedManagers;
  if (unprotectedManagers) {
    assertionManager = unprotectedManagers->_assertionManager;
  }
  else {
    assertionManager = 0LL;
  }
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDAssertionManager assertionsOfType:](assertionManager, "assertionsOfType:", 3LL));
  BOOL v6 = [v5 count] != 0;

  return v6;
}

- (void)expressPassManager:(id)a3 didUpdateExpressPassConfigurations:(id)a4
{
  id v5 = a4;
  id v6 = PDDefaultQueue();
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v6);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100027A4C;
  v9[3] = &unk_1006392B0;
  void v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  dispatch_async(v7, v9);
}

- (void)expressPassManager:(id)a3 didFinishExpressTransactionWithState:(id)a4
{
  id v5 = a4;
  id v10 = (id)objc_claimAutoreleasedReturnValue([v5 passUniqueIdentifier]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 applicationIdentifier]);

  if (v10 && v6)
  {
    id v7 = objc_alloc(&OBJC_CLASS___PKPaymentApplicationUsageSummary);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
    id v9 = -[PKPaymentApplicationUsageSummary initWithPassUniqueIdentifier:paymentApplicationIdentifier:lastUsed:]( v7,  "initWithPassUniqueIdentifier:paymentApplicationIdentifier:lastUsed:",  v10,  v6,  v8);

    -[PDDatabaseManager insertPaymentApplicationUsageSummary:]( self->_databaseManager,  "insertPaymentApplicationUsageSummary:",  v9);
  }
}

- (void)defaultPassManager:(id)a3 didUpdateDefaultPaymentPassWithUniqueIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = sub_10001EB68((uint64_t)self);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100027BD8;
  v9[3] = &unk_10063A3F8;
  id v10 = v5;
  id v8 = v5;
  [v7 enumerateObjectsUsingBlock:v9];

  -[PDTransitNotificationService updateRegistrationForTriggerEvents]( self->_transitNotificationService,  "updateRegistrationForTriggerEvents");
}

- (BOOL)defaultPassManagerCanUpdateDefaultPass:(id)a3
{
  v3 = self;
  uint64_t v4 = PKPendingProvisioningBackgroundProvisioningInBuddyTypes(self, a2, a3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  LOBYTE(v3) = !-[PDPendingProvisioningManager hasPendingProvisioningsOfTypes:]( v3->_pendingProvisioningManager,  "hasPendingProvisioningsOfTypes:",  v5);

  return (char)v3;
}

- (void)applePayCloudStoreContainer:(id)a3 didFinishTransactionFetchForPassUniqueID:(id)a4
{
  if (a4)
  {
    id v5 = a4;
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter"));
    uint64_t v8 = PKDistributedNotificationTransactionPassUniqueIDKey;
    id v9 = v5;
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v9,  &v8,  1LL));
    [v6 postNotificationName:PKDistributedNotificationTransactionsFetchCompleted object:0 userInfo:v7];
    -[PDDatabaseManager recomputeCategoryVisualizationMagnitudesForPassUniqueID:withStyle:]( self->_databaseManager,  "recomputeCategoryVisualizationMagnitudesForPassUniqueID:withStyle:",  v5,  0LL);
    -[PDSpotlightIndexer transactionFetchCompletedForPassUniqueID:]( self->_spotlightIndexer,  "transactionFetchCompletedForPassUniqueID:",  v5);
  }

- (void)accountManager:(id)a3 didUpdateAccount:(id)a4 oldAccount:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  sub_10001D6B4(self, v9, v8);
  -[PDSpotlightIndexer accountManager:didUpdateAccount:oldAccount:]( self->_spotlightIndexer,  "accountManager:didUpdateAccount:oldAccount:",  v10,  v9,  v8);
}

- (void)accountManager:(id)a3 didAddAccount:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  sub_10001D6B4(self, v6, 0LL);
  -[PDSpotlightIndexer accountManager:didAddAccount:](self->_spotlightIndexer, "accountManager:didAddAccount:", v7, v6);
}

- (void)accountManager:(id)a3 didRemoveAccount:(id)a4
{
}

- (void)accountManager:(id)a3 didAddAccountEvent:(id)a4
{
}

- (void)accountManager:(id)a3 didUpdateAccountEvent:(id)a4
{
}

- (void)peerPaymentWebServiceCoordinator:(id)a3 didUpdateAccount:(id)a4 oldAccount:(id)a5
{
}

- (void)peerPaymentWebServiceCoordinatorDidDeleteAccount
{
  uint64_t Object = PKLogFacilityTypeGetObject(0LL);
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "PDServer: executing peerPaymentWebServiceCoordinatorDidDeleteAccount",  v4,  2u);
  }
}

- (void)incrementMissingRemoteAssetsPersistentStoreItemDownloadRetriesCountWithUniqueID:(id)a3
{
}

- (void)insertOrReplaceMissingRemoteAssetsPersistentStoreItemWithUniqueID:(id)a3
{
}

- (unint64_t)missingRemoteAssetsPersistentStoreItemsCountWithMaximumDownloadRetriesCount:(unint64_t)a3
{
  return -[PDDatabaseManager missingRemoteAssetsPersistentStoreItemsCountWithMaximumDownloadRetriesCount:]( self->_databaseManager,  "missingRemoteAssetsPersistentStoreItemsCountWithMaximumDownloadRetriesCount:",  a3);
}

- (id)missingRemoteAssetsPersistentStoreItemsWithMaximumDownloadRetriesCount:(unint64_t)a3
{
  return -[PDDatabaseManager missingRemoteAssetsPersistentStoreItemsWithMaximumDownloadRetriesCount:]( self->_databaseManager,  "missingRemoteAssetsPersistentStoreItemsWithMaximumDownloadRetriesCount:",  a3);
}

- (void)removeMissingRemoteAssetsPersistentStoreItemWithUniqueID:(id)a3
{
}

- (void)sharesDidUpdateWithPaymentPassWithUniqueIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = sub_10001EB68((uint64_t)self);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  void v10[2] = sub_100027FA4;
  v10[3] = &unk_10063A3F8;
  id v9 = v4;
  id v11 = v9;
  [v6 enumerateObjectsUsingBlock:v10];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDDatabaseManager passWithUniqueIdentifier:](self->_databaseManager, "passWithUniqueIdentifier:", v9));
  if (v7) {
    sub_10001AE28((uint64_t)self, v7);
  }
  if (v9)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter"));
    [v8 postNotificationName:PKDistributedNotificationCredentialUpdateReceivedForPass object:v9 userInfo:0];
  }
}

- (void)displayTapToRadarAlertForRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 reason]);
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    if (v7) {
      v7[2](v7, 0LL);
    }
  }

  else
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager tapToRadarPromptWithReason:]( self->_databaseManager,  "tapToRadarPromptWithReason:",  v8));
    uint64_t Object = PKLogFacilityTypeGetObject(0LL);
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412546;
      id v28 = v8;
      __int16 v29 = 2112;
      id v30 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Last tap to radar prompt for reason %@: %@",  buf,  0x16u);
    }

    int64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v10 lastPromptDate]);
    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    id v16 = v15;
    if (v14 && ([v15 timeIntervalSinceDate:v14], v17 <= 86400.0))
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 138412546;
        id v28 = v14;
        __int16 v29 = 2112;
        id v30 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Not presenting tap to radar prompt since it was displayed less than 30 minutes ago, %@. %@",  buf,  0x16u);
      }

      if (v7) {
        v7[2](v7, 0LL);
      }
    }

    else
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 138412290;
        id v28 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Presenting tap to radar request alert: %@",  buf,  0xCu);
      }

      -[PDDatabaseManager noteTapToRadarPromptedForReason:lastPromptDate:]( self->_databaseManager,  "noteTapToRadarPromptedForReason:lastPromptDate:",  v8,  v16);
      uint64_t v18 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      uint64_t v19 = objc_claimAutoreleasedReturnValue([v6 alertHeader]);
      id v20 = (void *)v19;
      if (v19) {
        id v21 = (const __CFString *)v19;
      }
      else {
        id v21 = @"Wallet Problem Detected";
      }
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v18,  "setObject:forKeyedSubscript:",  v21,  kCFUserNotificationAlertHeaderKey);

      BOOL v22 = (void *)objc_claimAutoreleasedReturnValue([v6 alertMessage]);
      if (v22)
      {
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v18,  "setObject:forKeyedSubscript:",  v22,  kCFUserNotificationAlertMessageKey);
      }

      else
      {
        id v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"A problem has been detected with Wallet:\n\"%@\"",  v8));
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v18,  "setObject:forKeyedSubscript:",  v23,  kCFUserNotificationAlertMessageKey);
      }

      -[NSMutableDictionary setObject:forKeyedSubscript:]( v18,  "setObject:forKeyedSubscript:",  @"File a radar",  kCFUserNotificationDefaultButtonTitleKey);
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v18,  "setObject:forKeyedSubscript:",  @"Not now",  kCFUserNotificationOtherButtonTitleKey);
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472LL;
      v24[2] = sub_100028378;
      v24[3] = &unk_10063A8D0;
      id v25 = v6;
      id v26 = v8;
      +[PKUserNotificationAgent presentNotificationWithParameters:responseHandler:]( &OBJC_CLASS___PKUserNotificationAgent,  "presentNotificationWithParameters:responseHandler:",  v18,  v24);
      if (v7) {
        v7[2](v7, 1LL);
      }
    }
  }
}

- (void)applicationMessageManager:(id)a3 didUpdateMessages:(id)a4
{
  id v5 = a4;
  id v6 = sub_10001EB68((uint64_t)self);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000285C0;
  v9[3] = &unk_10063A3F8;
  id v10 = v5;
  id v8 = v5;
  [v7 enumerateObjectsUsingBlock:v9];

  -[PDUserNotificationManager updateWalletBadgeCount](self->_userNotificationManager, "updateWalletBadgeCount");
}

- (void)passTileManager:(id)a3 didUpdateTiles:(id)a4 forPassUniqueID:(id)a5 forContext:(int64_t)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = sub_10001EB68((uint64_t)self);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10002868C;
  v15[3] = &unk_10063A420;
  id v16 = v10;
  id v17 = v9;
  int64_t v18 = a6;
  id v13 = v9;
  id v14 = v10;
  [v12 enumerateObjectsUsingBlock:v15];
}

- (void)dynamicStateManager:(id)a3 dynamicStatesDidUpdate:(id)a4
{
  id v5 = a4;
  id v6 = PDDefaultQueue();
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v6);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100028730;
  v9[3] = &unk_1006392B0;
  id v10 = v5;
  id v11 = self;
  id v8 = v5;
  dispatch_async(v7, v9);
}

- (void)bindingStateChangedForPass:(id)a3
{
  id v4 = [a3 copy];
  if (v4)
  {
    id v5 = v4;
    sub_10001AE28((uint64_t)self, v4);
    id v4 = v5;
  }
}

- (BOOL)resetApplePayWithType:(int64_t)a3 diagnosticReason:(id)a4
{
  if (self) {
    LOBYTE(self) = sub_100021C44((uint64_t)self, (uint64_t)a2, a4, 0LL, 5LL);
  }
  return (char)self;
}

- (void)pendingProvisioningsDidChangeWithPendingProvisionings:(id)a3
{
  id v4 = a3;
  id v5 = sub_10001EB68((uint64_t)self);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10002A5E4;
  v8[3] = &unk_10063A3F8;
  id v9 = v4;
  id v7 = v4;
  [v6 enumerateObjectsUsingBlock:v8];
}

- (void)pendingProvisioningManagerDidFinishProvisioningWithReceipts:(id)a3
{
  id v4 = a3;
  id v20 = self;
  -[PDDefaultPassManager updateDefaultPaymentPassIfNeeded]( self->_defaultPassManager,  "updateDefaultPaymentPassIfNeeded");
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id obj = v4;
  id v5 = [obj countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v5)
  {
    id v7 = v5;
    uint64_t v8 = *(void *)v22;
    id v9 = (void *)PKPassLibraryPendingProvisioningFinishedNotification;
    id v10 = (void *)PKPassLibraryPendingProvisioningFinishedReceiptKey;
    *(void *)&__int128 v6 = 138412290LL;
    __int128 v18 = v6;
    do
    {
      for (uint64_t i = 0LL; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v21 + 1) + 8LL * (void)i);
        id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v12,  1LL,  0LL,  v18));
        if (v13)
        {
          xpc_object_t v14 = xpc_dictionary_create(0LL, 0LL, 0LL);
          xpc_dictionary_set_string(v14, "Name", (const char *)[v9 UTF8String]);
          id v15 = (const char *)[v10 UTF8String];
          id v16 = v13;
          xpc_dictionary_set_data(v14, v15, [v16 bytes], (size_t)objc_msgSend(v16, "length"));
          -[PDXPCEventPublisher sendEvent:completion:](v20->_passKitEventPublisher, "sendEvent:completion:", v14, 0LL);
        }

        else
        {
          uint64_t Object = PKLogFacilityTypeGetObject(36LL);
          xpc_object_t v14 = (xpc_object_t)objc_claimAutoreleasedReturnValue(Object);
          if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)__int128 buf = v18;
            uint64_t v26 = v12;
            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v14,  OS_LOG_TYPE_DEFAULT,  "Failed to archive pending provisioning receipt: %@",  buf,  0xCu);
          }
        }
      }

      id v7 = [obj countByEnumeratingWithState:&v21 objects:v27 count:16];
    }

    while (v7);
  }
}

- (void).cxx_destruct
{
}

@end