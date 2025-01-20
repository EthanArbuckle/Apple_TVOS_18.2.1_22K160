@interface PDPaymentWebServiceTargetDevice
- (BOOL)_willPassWithUniqueIdentifierAutomaticallyBecomeDefault:(id)a3;
- (BOOL)canAddPaymentPass;
- (BOOL)canAddSecureElementPassWithConfiguration:(id)a3;
- (BOOL)isDeviceInRestrictedMode;
- (BOOL)meetsProvisioningRequirements:(id)a3 missingRequirements:(id *)a4;
- (BOOL)secureElementIsProductionSigned;
- (BOOL)supportsExpressForAutomaticSelectionTechnologyType:(int64_t)a3;
- (NSString)secureElementIdentifier;
- (PDPaymentWebServiceTargetDevice)initWithDataSource:(id)a3;
- (PKOSVersionRequirement)deviceVersion;
- (PKPaymentDataProviderDelegate)delegate;
- (PKPaymentWebService)paymentWebService;
- (id)defaultPaymentApplicationForPassUniqueIdentifier:(id)a3;
- (id)entitlementsForPassIdentifier:(id)a3;
- (id)passWithPassTypeIdentifier:(id)a3 serialNumber:(id)a4;
- (id)passWithUniqueID:(id)a3;
- (id)passesWithReaderIdentifier:(id)a3;
- (id)paymentPasses;
- (id)paymentWebService:(id)a3 passesOfType:(unint64_t)a4;
- (id)peerPaymentPassUniqueID;
- (id)upgradeRequestForPass:(id)a3;
- (void)_accountAttestationAnonymizationSaltWithCompletion:(id)a3;
- (void)_addPass:(id)a3 properties:(id)a4 completion:(id)a5;
- (void)_addPassShare:(id)a3 onCredentialWithIdentifier:(id)a4 completion:(id)a5;
- (void)_cachedFeatureApplicationsForProvisioningWithCompletion:(id)a3;
- (void)_canAcceptInvitation:(id)a3 withCompletion:(id)a4;
- (void)_conflictingExpressPassIdentifiersForPassConfiguration:(id)a3 withCompletion:(id)a4;
- (void)_conflictingExpressPassIdentifiersForPassConfiguration:(id)a3 withReferenceExpressState:(id)a4 completion:(id)a5;
- (void)_consistencyCheck;
- (void)_credentialWithIdentifier:(id)a3 completion:(id)a4;
- (void)_declineRelatedSharingInvitationsIfNecessary:(id)a3 withCompletion:(id)a4;
- (void)_downloadAllPaymentPasses;
- (void)_enforceUpgradedPasscodePolicyWithCompletion:(id)a3;
- (void)_featureApplicationsForProvisioningWithCompletion:(id)a3;
- (void)_initializeSecureElement:(id)a3;
- (void)_initializeSecureElementIfNecessaryWithCompletion:(id)a3;
- (void)_matchingInvitationOnDevice:(id)a3 withTimeout:(unint64_t)a4 completion:(id)a5;
- (void)_passOwnershipTokenWithIdentifier:(id)a3 completion:(id)a4;
- (void)_passSharesForCredentialIdentifier:(id)a3 completion:(id)a4;
- (void)_paymentHardwareStatusWithType:(unint64_t)a3 completion:(id)a4;
- (void)_performDeviceCheckInWithCompletion:(id)a3;
- (void)_performProductActionRequest:(id)a3 completion:(id)a4;
- (void)_removeExpressPassWithUniqueIdentifier:(id)a3 completion:(id)a4;
- (void)_removePassWithUniqueID:(id)a3 diagnosticReason:(id)a4;
- (void)_removeSharingInvitation:(id)a3 withCompletion:(id)a4;
- (void)_removeSharingInvitationReceiptWithIdentifiers:(id)a3 onCredential:(id)a4 completion:(id)a5;
- (void)_requestBackgroundRegistrationForCredentialWithIdentifier:(id)a3 completion:(id)a4;
- (void)_sanitizeExpressPasses;
- (void)_setAccountAttestationAnonymizationSalt:(id)a3 withCompletion:(id)a4;
- (void)_setDefaultPaymentPassUniqueIdentifier:(id)a3;
- (void)_setExpressWithPassConfiguration:(id)a3 credential:(id)a4 handler:(id)a5;
- (void)_startBackgroundVerificationObserverForPass:(id)a3 verificationMethod:(id)a4;
- (void)_storePassOwnershipToken:(id)a3 withIdentifier:(id)a4;
- (void)_subcredentialInvitationsWithCompletion:(id)a3;
- (void)_updateMetadataOnPassWithIdentifier:(id)a3 credential:(id)a4 completion:(id)a5;
- (void)accountWithIdentifier:(id)a3 completion:(id)a4;
- (void)addISO18013Blobs:(id)a3 cardType:(int64_t)a4 completion:(id)a5;
- (void)addPendingProvisionings:(id)a3 completion:(id)a4;
- (void)checkFidoKeyPresenceForRelyingParty:(id)a3 relyingPartyAccountHash:(id)a4 fidoKeyHash:(id)a5 completion:(id)a6;
- (void)clearProvisioningSupportDataOfType:(unint64_t)a3 completion:(id)a4;
- (void)createFidoKeyForRelyingParty:(id)a3 relyingPartyAccountHash:(id)a4 challenge:(id)a5 externalizedAuth:(id)a6 completion:(id)a7;
- (void)currentPasscodeMeetsUpgradedPasscodePolicy:(id)a3;
- (void)deleteKeyMaterialForSubCredentialId:(id)a3;
- (void)deleteReservation:(id)a3 completion:(id)a4;
- (void)displayableEntitlementsForPassIdentifier:(id)a3 completion:(id)a4;
- (void)displayableSharesForPassIdentifier:(id)a3 completion:(id)a4;
- (void)familyMembersWithCompletion:(id)a3;
- (void)generateAuxiliaryCapabilitiesForRequirements:(id)a3 completion:(id)a4;
- (void)generateISOEncryptionCertificateForSubCredentialId:(id)a3 completion:(id)a4;
- (void)generateSEEncryptionCertificateForSubCredentialId:(id)a3 completion:(id)a4;
- (void)longTermPrivacyKeyForCredentialGroupIdentifier:(id)a3 reuseExisting:(BOOL)a4 completion:(id)a5;
- (void)meetsProvisioningRequirements:(id)a3 completion:(id)a4;
- (void)notePasscodeUpgradeFlowDidEnd;
- (void)notePasscodeUpgradeFlowWillBeginWithCompletion:(id)a3;
- (void)noteProvisioningDidBegin;
- (void)noteProvisioningDidEnd;
- (void)paymentWebService:(id)a3 canAddSecureElementPassWithConfiguration:(id)a4 completion:(id)a5;
- (void)paymentWebService:(id)a3 requestPassUpgrade:(id)a4 pass:(id)a5 completion:(id)a6;
- (void)paymentWebService:(id)a3 updateAccountWithIdentifier:(id)a4 completion:(id)a5;
- (void)performDeviceRegistrationReturningContextForReason:(id)a3 brokerURL:(id)a4 completion:(id)a5;
- (void)prepareProvisioningTarget:(id)a3 checkFamilyCircle:(BOOL)a4 completion:(id)a5;
- (void)productsWithRequest:(id)a3 completion:(id)a4;
- (void)rejectShareForMailboxAddress:(id)a3;
- (void)removePass:(id)a3;
- (void)reserveStorageForAppletTypes:(id)a3 metadata:(id)a4 completion:(id)a5;
- (void)retrievePendingProvisioningsWithType:(id)a3 completion:(id)a4;
- (void)revokeCredentialsWithReaderIdentifiers:(id)a3 completion:(id)a4;
- (void)saveProvisioningSupportData:(id)a3 completion:(id)a4;
- (void)setDefaultPaymentApplication:(id)a3 forPassUniqueIdentifier:(id)a4 completion:(id)a5;
- (void)setDefaultPaymentPassIdentifier:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setOrderManagementDisabled:(BOOL)a3;
- (void)setOrderManagementNotificationsDisabled:(BOOL)a3;
- (void)setPaymentHandoffDisabled:(BOOL)a3;
- (void)signWithFidoKeyForRelyingParty:(id)a3 relyingPartyAccountHash:(id)a4 fidoKeyHash:(id)a5 challenge:(id)a6 publicKeyIdentifier:(id)a7 externalizedAuth:(id)a8 completion:(id)a9;
- (void)triggerCloudStoreZoneCreationForAccount:(id)a3 withCompletion:(id)a4;
- (void)updatedAccountsForProvisioningWithCompletion:(id)a3;
@end

@implementation PDPaymentWebServiceTargetDevice

- (PDPaymentWebServiceTargetDevice)initWithDataSource:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___PDPaymentWebServiceTargetDevice;
  v5 = -[PDPaymentWebServiceTargetDevice init](&v11, "init");
  if (v5)
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue(+[PKSecureElement sharedSecureElement](&OBJC_CLASS___PKSecureElement, "sharedSecureElement"));
    secureElement = v5->_secureElement;
    v5->_secureElement = (PKSecureElement *)v6;

    objc_storeWeak((id *)&v5->_dataSource, v4);
    v5->_lock._os_unfair_lock_opaque = 0;
    v5->_provisioningAssertionCount = 0LL;
    v5->_passcodeUpdateAssertionCount = 0LL;
    v8 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    passcodeUpdateCompletions = v5->_passcodeUpdateCompletions;
    v5->_passcodeUpdateCompletions = v8;
  }

  return v5;
}

- (void)_addPass:(id)a3 properties:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = PDDefaultQueue();
  v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v11);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1002DB50C;
  v16[3] = &unk_10063B440;
  id v17 = v8;
  id v18 = v9;
  v19 = self;
  id v20 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  dispatch_async(v12, v16);
}

- (void)_startBackgroundVerificationObserverForPass:(id)a3 verificationMethod:(id)a4
{
  p_dataSource = &self->_dataSource;
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained paymentWebServiceCoordinator]);
  [v8 startBackgroundVerificationObserverForPass:v7 verificationMethod:v6];
}

- (void)paymentWebService:(id)a3 requestPassUpgrade:(id)a4 pass:(id)a5 completion:(id)a6
{
  id v18 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v12)
  {
    p_dataSource = &self->_dataSource;
    id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
    id v15 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained upgradeController]);

    if (v15)
    {
      id v16 = objc_loadWeakRetained((id *)p_dataSource);
      id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 upgradeController]);
      [v17 requestPassUpgrade:v10 pass:v11 diagnosticReason:@"User upgrade" completion:v12];
    }
  }
}

- (void)_setExpressWithPassConfiguration:(id)a3 credential:(id)a4 handler:(id)a5
{
  p_dataSource = &self->_dataSource;
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained expressPassManager]);
  sub_10014C9F8((uint64_t)v11, v10, v9, v8);
}

- (void)_conflictingExpressPassIdentifiersForPassConfiguration:(id)a3 withCompletion:(id)a4
{
  if (a4)
  {
    p_dataSource = &self->_dataSource;
    id v6 = a4;
    id v7 = a3;
    id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained expressPassManager]);
    sub_10014C3C0((uint64_t)v8, v7, v6);
  }

- (void)_conflictingExpressPassIdentifiersForPassConfiguration:(id)a3 withReferenceExpressState:(id)a4 completion:(id)a5
{
  if (a5)
  {
    p_dataSource = &self->_dataSource;
    id v8 = a5;
    id v9 = a4;
    id v10 = a3;
    id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained expressPassManager]);
    sub_10014C5F4((uint64_t)v11, v10, v9, v8);
  }

- (void)_sanitizeExpressPasses
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  v2 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained expressPassManager]);
  -[PDExpressPassManager secureElementExpressConfigurationNeedsUpdate]_0((uint64_t)v2);
}

- (id)upgradeRequestForPass:(id)a3
{
  id v4 = a3;
  id v5 = [[PKExpressPassController alloc] initWithPaymentDataProvider:self passLibraryDataProvider:self isForWatch:0];
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 expressModeUpgradeRequestForPass:v4]);

  return v6;
}

- (void)_removeExpressPassWithUniqueIdentifier:(id)a3 completion:(id)a4
{
  p_dataSource = &self->_dataSource;
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained expressPassManager]);
  sub_10014D11C((uint64_t)v8, v7, v6);
}

- (void)_downloadAllPaymentPasses
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  v2 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained paymentWebServiceCoordinator]);
  [v2 initiateDevicePassesDownload];
}

- (void)_removePassWithUniqueID:(id)a3 diagnosticReason:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  p_dataSource = &self->_dataSource;
  id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained databaseManager]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 passWithUniqueIdentifier:v15]);

  if (v10)
  {
    if ([v10 passType] == (id)1) {
      uint64_t v11 = 6LL;
    }
    else {
      uint64_t v11 = 3LL;
    }
    uint64_t v12 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[WebServiceTargetDevice] %@",  v6));

    id v13 = objc_loadWeakRetained((id *)p_dataSource);
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 cardFileManager]);
    [v14 deleteCardWithUniqueID:v15 forReason:v11 withDiagnosticReason:v12];

    id v6 = (id)v12;
  }
}

- (void)_cachedFeatureApplicationsForProvisioningWithCompletion:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained applyManager]);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1002DBD2C;
  v8[3] = &unk_1006415E8;
  id v9 = v4;
  id v7 = v4;
  [v6 applicationsWithCompletion:v8];
}

- (void)_featureApplicationsForProvisioningWithCompletion:(id)a3
{
  p_dataSource = &self->_dataSource;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained applyManager]);
  [v5 updateApplicationsWithCompletion:v4];
}

- (void)_accountAttestationAnonymizationSaltWithCompletion:(id)a3
{
  p_dataSource = &self->_dataSource;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained paymentWebServiceCoordinator]);
  [v5 accountAttestationAnonymizationSaltWithCompletion:v4];
}

- (void)_setAccountAttestationAnonymizationSalt:(id)a3 withCompletion:(id)a4
{
  p_dataSource = &self->_dataSource;
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained paymentWebServiceCoordinator]);
  [v8 setAccountAttestationAnonymizationSalt:v7 withCompletion:v6];
}

- (void)_enforceUpgradedPasscodePolicyWithCompletion:(id)a3
{
  p_dataSource = &self->_dataSource;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained devicePasscodeManager]);
  [v5 enforceUpgradedPasscodePolicyWithCompletion:v4];
}

- (void)currentPasscodeMeetsUpgradedPasscodePolicy:(id)a3
{
  p_dataSource = &self->_dataSource;
  id v4 = (void (**)(id, id, id))a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained devicePasscodeManager]);
  id v9 = 0LL;
  id v7 = [v6 currentPasscodeMeetsUpgradedPasscodePolicy:&v9];
  id v8 = v9;

  v4[2](v4, v7, v8);
}

- (void)notePasscodeUpgradeFlowWillBeginWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    unint64_t passcodeUpdateAssertionCount = self->_passcodeUpdateAssertionCount;
    self->_unint64_t passcodeUpdateAssertionCount = passcodeUpdateAssertionCount + 1;
    passcodeUpdateAssertionIdentifier = self->_passcodeUpdateAssertionIdentifier;
    if (passcodeUpdateAssertionCount) {
      BOOL v8 = passcodeUpdateAssertionIdentifier == 0LL;
    }
    else {
      BOOL v8 = 0;
    }
    if (v8)
    {
      passcodeUpdateCompletions = self->_passcodeUpdateCompletions;
      id v11 = objc_retainBlock(v4);
      -[NSMutableArray addObject:](passcodeUpdateCompletions, "addObject:", v11);

      os_unfair_lock_unlock(p_lock);
    }

    else if (passcodeUpdateAssertionCount)
    {
      BOOL v9 = passcodeUpdateAssertionIdentifier != 0LL;
      os_unfair_lock_unlock(p_lock);
      (*((void (**)(id, BOOL, void))v4 + 2))(v4, v9, 0LL);
    }

    else
    {
      uint64_t v12 = self->_passcodeUpdateCompletions;
      id v13 = objc_retainBlock(v4);
      -[NSMutableArray addObject:](v12, "addObject:", v13);

      os_unfair_lock_unlock(&self->_lock);
      id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 UUIDString]);

      id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
      id v17 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained assertionManager]);
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472LL;
      v19[2] = sub_1002DC198;
      v19[3] = &unk_1006426D8;
      v19[4] = self;
      id v20 = v15;
      id v18 = v15;
      [v17 acquireAssertionOfType:6 withIdentifier:v18 reason:@"background provisioning" handler:v19];
    }
  }
}

- (void)notePasscodeUpgradeFlowDidEnd
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t v4 = self->_passcodeUpdateAssertionCount - 1;
  self->_unint64_t passcodeUpdateAssertionCount = v4;
  id v5 = -[NSString copy](self->_passcodeUpdateAssertionIdentifier, "copy");
  id v10 = v5;
  if (v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v5 == 0LL;
  }
  if (v6)
  {
    os_unfair_lock_unlock(p_lock);
  }

  else
  {
    passcodeUpdateAssertionIdentifier = self->_passcodeUpdateAssertionIdentifier;
    self->_passcodeUpdateAssertionIdentifier = 0LL;

    os_unfair_lock_unlock(p_lock);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained assertionManager]);
    [v9 invalidateAssertionOfType:6 withIdentifier:v10 handler:0];
  }
}

- (void)_updateMetadataOnPassWithIdentifier:(id)a3 credential:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained subcredentialManager]);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1002DC4C8;
  v15[3] = &unk_10063E0E8;
  id v16 = v8;
  id v17 = v9;
  v15[4] = self;
  id v13 = v8;
  id v14 = v9;
  [v12 updateMetadataOnPassWithIdentifier:v13 credential:v10 completion:v15];
}

- (void)_addPassShare:(id)a3 onCredentialWithIdentifier:(id)a4 completion:(id)a5
{
  id v14 = a5;
  id v8 = a4;
  id v9 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained subcredentialManager]);
  id v12 = [v11 addPassShare:v9 onCredentialWithIdentifier:v8];

  id v13 = v14;
  if (v14)
  {
    (*((void (**)(id, id))v14 + 2))(v14, v12);
    id v13 = v14;
  }
}

- (void)_removeSharingInvitationReceiptWithIdentifiers:(id)a3 onCredential:(id)a4 completion:(id)a5
{
  id v14 = a5;
  id v8 = a4;
  id v9 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained subcredentialManager]);
  id v12 = [v11 removeSharingInvitationReceiptWithIdentifiers:v9 onCredential:v8];

  id v13 = v14;
  if (v14)
  {
    (*((void (**)(id, id))v14 + 2))(v14, v12);
    id v13 = v14;
  }
}

- (void)_declineRelatedSharingInvitationsIfNecessary:(id)a3 withCompletion:(id)a4
{
  p_dataSource = &self->_dataSource;
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained subcredentialManager]);
  [v8 declineRelatedSharingInvitationsIfNecessary:v7 withCompletion:v6];
}

- (void)_removeSharingInvitation:(id)a3 withCompletion:(id)a4
{
  id v12 = a4;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained subcredentialManager]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);

  id v10 = [v8 removeSharingInvitationWithIdentifier:v9];
  id v11 = v12;
  if (v12)
  {
    (*((void (**)(id, id))v12 + 2))(v12, v10);
    id v11 = v12;
  }
}

- (void)_requestBackgroundRegistrationForCredentialWithIdentifier:(id)a3 completion:(id)a4
{
  id v10 = a4;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained subcredentialManager]);
  [v8 requestBackgroundRegistrationForCredentialWithIdentifier:v6];

  id v9 = v10;
  if (v10)
  {
    (*((void (**)(id, uint64_t))v10 + 2))(v10, 1LL);
    id v9 = v10;
  }
}

- (void)_canAcceptInvitation:(id)a3 withCompletion:(id)a4
{
  p_dataSource = &self->_dataSource;
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained subcredentialManager]);
  [v8 canAcceptInvitation:v7 withCompletion:v6];
}

- (void)_credentialWithIdentifier:(id)a3 completion:(id)a4
{
  if (a4)
  {
    p_dataSource = &self->_dataSource;
    id v7 = a4;
    id v8 = a3;
    id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained databaseManager]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 appletSubcredentialWithIdentifier:v8]);

    (*((void (**)(id, void *))a4 + 2))(v7, v10);
  }

- (void)_subcredentialInvitationsWithCompletion:(id)a3
{
  if (a3)
  {
    p_dataSource = &self->_dataSource;
    id v5 = a3;
    id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained subcredentialManager]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 invitations]);
    (*((void (**)(id, void *))a3 + 2))(v5, v7);
  }

- (void)_matchingInvitationOnDevice:(id)a3 withTimeout:(unint64_t)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = (void (**)(id, id, void))a5;
  if (v8)
  {
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "subcredentialManager", 0));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 invitations]);

    id v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v17;
      while (2)
      {
        for (i = 0LL; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v17 != v13) {
            objc_enumerationMutation(v11);
          }
          id v15 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
          if ([v7 isSameInvitationAsInvitation:v15])
          {
            id v12 = v15;
            goto LABEL_12;
          }
        }

        id v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }

- (void)_passSharesForCredentialIdentifier:(id)a3 completion:(id)a4
{
  p_dataSource = &self->_dataSource;
  id v7 = (void (**)(void))a4;
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained databaseManager]);
  id v11 = (id)objc_claimAutoreleasedReturnValue([v10 passUniqueIdentifierWithCredentialIdentifier:v8]);

  if (v11) {
    -[PDPaymentWebServiceTargetDevice displayableSharesForPassIdentifier:completion:]( self,  "displayableSharesForPassIdentifier:completion:",  v11,  v7);
  }
  else {
    v7[2](v7);
  }
}

- (id)entitlementsForPassIdentifier:(id)a3
{
  p_dataSource = &self->_dataSource;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained sharingManager]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 entitlementsForPassIdentifier:v4]);

  return v7;
}

- (void)displayableSharesForPassIdentifier:(id)a3 completion:(id)a4
{
  p_dataSource = &self->_dataSource;
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained sharingManager]);
  [v8 displayableSharesForPassIdentifier:v7 completion:v6];
}

- (void)displayableEntitlementsForPassIdentifier:(id)a3 completion:(id)a4
{
  p_dataSource = &self->_dataSource;
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained sharingManager]);
  [v8 displayableEntitlementsForPassIdentifier:v7 completion:v6];
}

- (void)rejectShareForMailboxAddress:(id)a3
{
  p_dataSource = &self->_dataSource;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained sharingManager]);
  [v5 rejectShareForMailboxAddress:v4];
}

- (void)_setDefaultPaymentPassUniqueIdentifier:(id)a3
{
  p_dataSource = &self->_dataSource;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained defaultPassManager]);
  [v5 updateDefaultPaymentPassIdentifier:v4];
}

- (void)_performDeviceCheckInWithCompletion:(id)a3
{
  p_dataSource = &self->_dataSource;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained paymentWebServiceCoordinator]);
  [v5 performDeviceCheckInWithCompletion:v4];
}

- (void)_storePassOwnershipToken:(id)a3 withIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = PDUtilityQueue();
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v7);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1002DCFB0;
  v11[3] = &unk_1006392B0;
  id v12 = v5;
  id v13 = v6;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v8, v11);
}

- (void)_passOwnershipTokenWithIdentifier:(id)a3 completion:(id)a4
{
  if (a4)
  {
    id v6 = a4;
    id v7 = a3;
    id v9 = [[PKPassOwnershipToken alloc] initWithIdentifier:v7];

    id v8 = (void *)objc_claimAutoreleasedReturnValue([v9 ownershipToken]);
    (*((void (**)(id, void *))a4 + 2))(v6, v8);
  }

- (void)productsWithRequest:(id)a3 completion:(id)a4
{
  p_dataSource = &self->_dataSource;
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained paymentWebServiceCoordinator]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 paymentSetupFeaturesCoordinator]);
  [v9 productsWithRequest:v7 completion:v6];
}

- (void)_performProductActionRequest:(id)a3 completion:(id)a4
{
  p_dataSource = &self->_dataSource;
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained paymentWebServiceCoordinator]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 paymentSetupFeaturesCoordinator]);
  [v9 performProductActionRequest:v7 completion:v6];
}

- (BOOL)_willPassWithUniqueIdentifierAutomaticallyBecomeDefault:(id)a3
{
  id v4 = a3;
  uint64_t v17 = 0LL;
  __int128 v18 = &v17;
  uint64_t v19 = 0x2020000000LL;
  char v20 = 0;
  p_dataSource = &self->_dataSource;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained defaultPassManager]);

  if (v7)
  {
    dispatch_semaphore_t v8 = dispatch_semaphore_create(0LL);
    id v9 = objc_loadWeakRetained((id *)p_dataSource);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 defaultPassManager]);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_1002DD380;
    v14[3] = &unk_1006541A0;
    __int128 v16 = &v17;
    id v11 = v8;
    id v15 = v11;
    [v10 willPassWithUniqueIdentifierAutomaticallyBecomeDefault:v4 completion:v14];

    dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
  }

  char v12 = *((_BYTE *)v18 + 24);

  _Block_object_dispose(&v17, 8);
  return v12;
}

- (void)_consistencyCheck
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  v2 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained paymentWebServiceCoordinator]);
  [v2 initiateConsistencyCheck];
}

- (void)_initializeSecureElementIfNecessaryWithCompletion:(id)a3
{
}

- (void)_initializeSecureElement:(id)a3
{
  id v4 = a3;
  secureElement = self->_secureElement;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1002DD478;
  v7[3] = &unk_100652530;
  id v8 = v4;
  id v6 = v4;
  -[PKSecureElement initializeSecureElementQueuingServerConnection:withCompletion:]( secureElement,  "initializeSecureElementQueuingServerConnection:withCompletion:",  1LL,  v7);
}

- (void)performDeviceRegistrationReturningContextForReason:(id)a3 brokerURL:(id)a4 completion:(id)a5
{
  p_dataSource = &self->_dataSource;
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  id v12 = (id)objc_claimAutoreleasedReturnValue([WeakRetained registrationCoordinator]);

  [v12 performDeviceRegistrationForReason:v10 brokerURL:v9 action:1 forceApplePayRegister:v9 != 0 forcePeerPaymentRegister:0 completion:v8];
}

- (void)_paymentHardwareStatusWithType:(unint64_t)a3 completion:(id)a4
{
  p_dataSource = &self->_dataSource;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained paymentWebServiceCoordinator]);
  [v7 paymentHardwareStatusWithType:a3 completion:v6];
}

- (void)saveProvisioningSupportData:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init(&OBJC_CLASS___PDProvisioningSupportDataManager);
  -[PDProvisioningSupportDataManager saveWithSupportData:completion:](v7, "saveWithSupportData:completion:", v6, v5);
}

- (void)clearProvisioningSupportDataOfType:(unint64_t)a3 completion:(id)a4
{
  id v7 = a4;
  id v5 = objc_alloc_init(&OBJC_CLASS___PDProvisioningSupportDataManager);
  -[PDProvisioningSupportDataManager clearKnownSupportDataOfType:](v5, "clearKnownSupportDataOfType:", a3);

  id v6 = v7;
  if (v7)
  {
    (*((void (**)(id))v7 + 2))(v7);
    id v6 = v7;
  }
}

- (PKOSVersionRequirement)deviceVersion
{
  return (PKOSVersionRequirement *)+[PKOSVersionRequirement fromDeviceVersion]( &OBJC_CLASS___PKOSVersionRequirement,  "fromDeviceVersion");
}

- (BOOL)supportsExpressForAutomaticSelectionTechnologyType:(int64_t)a3
{
  return +[PKSecureElement supportsExpressForAutomaticSelectionTechnologyType:]( &OBJC_CLASS___PKSecureElement,  "supportsExpressForAutomaticSelectionTechnologyType:",  a3);
}

- (id)defaultPaymentApplicationForPassUniqueIdentifier:(id)a3
{
  p_dataSource = &self->_dataSource;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained databaseManager]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 defaultPaymentApplicationForPassUniqueIdentifier:v4]);

  return v7;
}

- (void)setDefaultPaymentApplication:(id)a3 forPassUniqueIdentifier:(id)a4 completion:(id)a5
{
  p_dataSource = &self->_dataSource;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained databaseManager]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 setDefaultPaymentApplication:v11 forPassUniqueIdentifier:v10]);

  (*((void (**)(id, void *))a5 + 2))(v9, v13);
}

- (void)setPaymentHandoffDisabled:(BOOL)a3
{
}

- (void)setOrderManagementDisabled:(BOOL)a3
{
}

- (void)setOrderManagementNotificationsDisabled:(BOOL)a3
{
}

- (BOOL)canAddSecureElementPassWithConfiguration:(id)a3
{
  return 1;
}

- (id)passWithPassTypeIdentifier:(id)a3 serialNumber:(id)a4
{
  p_dataSource = &self->_dataSource;
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained databaseManager]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 passWithPassTypeID:v7 serialNumber:v6]);

  return v10;
}

- (id)passWithUniqueID:(id)a3
{
  p_dataSource = &self->_dataSource;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained databaseManager]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 passWithUniqueIdentifier:v4]);

  return v7;
}

- (id)passesWithReaderIdentifier:(id)a3
{
  p_dataSource = &self->_dataSource;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained databaseManager]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 passesWithPairedReaderIdentifier:v4]);

  return v7;
}

- (id)paymentPasses
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  v3 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained databaseManager]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 passesOfType:1]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allObjects]);

  return v5;
}

- (id)peerPaymentPassUniqueID
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  v3 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained databaseManager]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 peerPaymentAccount]);

  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 associatedPassUniqueID]);
  return v5;
}

- (void)removePass:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue([a3 uniqueID]);
  -[PDPaymentWebServiceTargetDevice _removePassWithUniqueID:diagnosticReason:]( self,  "_removePassWithUniqueID:diagnosticReason:",  v4,  @"passd target device");
}

- (BOOL)canAddPaymentPass
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained databaseManager]);
  id v5 = [v4 countActiveSecureElementPasses];

  unint64_t v6 = PKDisableDynamicSEAllocation();
  if ((_DWORD)v6)
  {
    unint64_t v6 = PKMaxPaymentCards();
    uint64_t v7 = v6;
    if (v6) {
      BOOL v8 = v6 >= (unint64_t)v5;
    }
    else {
      BOOL v8 = 0;
    }
    int v9 = v8;
  }

  else
  {
    int v9 = 0;
    uint64_t v7 = -1LL;
  }

  int IsAvailable = PKSecureElementIsAvailable(v6);
  unsigned int v11 = +[PKSecureElement isInFailForward](&OBJC_CLASS___PKSecureElement, "isInFailForward");
  int v12 = PKIsSRD();
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[PDPaymentWebServiceTargetDevice appleAccountInformation](self, "appleAccountInformation"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 aaAlternateDSID]);
  int v15 = PKIsBeneficiaryAccountWithAltDsid();

  if (IsAvailable) {
    int v16 = v12;
  }
  else {
    int v16 = 1;
  }
  int v17 = v16 | v9 | v15 | v11;
  uint64_t Object = PKLogFacilityTypeGetObject(6LL);
  uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    char v20 = @"YES";
    int v26 = 138544898;
    if (v17) {
      v21 = @"NO";
    }
    else {
      v21 = @"YES";
    }
    v27 = v21;
    __int16 v28 = 2048;
    uint64_t v29 = v7;
    if (IsAvailable) {
      v22 = @"YES";
    }
    else {
      v22 = @"NO";
    }
    __int16 v30 = 2048;
    if (v11) {
      v23 = @"YES";
    }
    else {
      v23 = @"NO";
    }
    id v31 = v5;
    if (v12) {
      v24 = @"YES";
    }
    else {
      v24 = @"NO";
    }
    __int16 v32 = 2114;
    if (!v15) {
      char v20 = @"NO";
    }
    v33 = v22;
    __int16 v34 = 2114;
    v35 = v23;
    __int16 v36 = 2114;
    v37 = v24;
    __int16 v38 = 2114;
    v39 = v20;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "canAddPass: %{public}@ with maxCards: %ld, passCount: %ld - seAvailable: %{public}@, isInFailForward: %{public}@ i sSRD: %{public}@ isBeneficiaryAccount: %{public}@",  (uint8_t *)&v26,  0x48u);
  }

  return v17 ^ 1;
}

- (void)setDefaultPaymentPassIdentifier:(id)a3
{
}

- (BOOL)isDeviceInRestrictedMode
{
  v2 = objc_alloc_init(&OBJC_CLASS___PKSecureElement);
  unsigned __int8 v3 = -[PKSecureElement isInRestrictedMode](v2, "isInRestrictedMode");

  return v3;
}

- (PKPaymentWebService)paymentWebService
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained paymentWebServiceCoordinator]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 sharedWebService]);

  return (PKPaymentWebService *)v4;
}

- (NSString)secureElementIdentifier
{
  v2 = objc_alloc_init(&OBJC_CLASS___PKSecureElement);
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[PKSecureElement primarySecureElementIdentifier](v2, "primarySecureElementIdentifier"));

  return (NSString *)v3;
}

- (BOOL)secureElementIsProductionSigned
{
  v2 = objc_alloc_init(&OBJC_CLASS___PKSecureElement);
  unsigned __int8 v3 = -[PKSecureElement isProductionSigned](v2, "isProductionSigned");

  return v3;
}

- (void)noteProvisioningDidBegin
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t provisioningAssertionCount = self->_provisioningAssertionCount;
  self->_unint64_t provisioningAssertionCount = provisioningAssertionCount + 1;
  os_unfair_lock_unlock(p_lock);
  if (!provisioningAssertionCount)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 UUIDString]);

    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained assertionManager]);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_1002DDE60;
    v10[3] = &unk_1006426D8;
    v10[4] = self;
    id v11 = v6;
    id v9 = v6;
    [v8 acquireAssertionOfType:1 withIdentifier:v9 reason:@"background provisioning" handler:v10];
  }

- (void)noteProvisioningDidEnd
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t v4 = self->_provisioningAssertionCount - 1;
  self->_unint64_t provisioningAssertionCount = v4;
  id v5 = -[NSString copy](self->_provisioningAssertionIdentifier, "copy");
  id v10 = v5;
  if (v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v5 == 0LL;
  }
  if (v6)
  {
    os_unfair_lock_unlock(p_lock);
  }

  else
  {
    provisioningAssertionIdentifier = self->_provisioningAssertionIdentifier;
    self->_provisioningAssertionIdentifier = 0LL;

    os_unfair_lock_unlock(p_lock);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained assertionManager]);
    [v9 invalidateAssertionOfType:1 withIdentifier:v10 handler:0];
  }
}

- (void)familyMembersWithCompletion:(id)a3
{
  p_dataSource = &self->_dataSource;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained familyCircleManager]);
  [v5 familyMembersWithCachePolicy:1 completion:v4];
}

- (void)createFidoKeyForRelyingParty:(id)a3 relyingPartyAccountHash:(id)a4 challenge:(id)a5 externalizedAuth:(id)a6 completion:(id)a7
{
}

- (void)checkFidoKeyPresenceForRelyingParty:(id)a3 relyingPartyAccountHash:(id)a4 fidoKeyHash:(id)a5 completion:(id)a6
{
}

- (void)signWithFidoKeyForRelyingParty:(id)a3 relyingPartyAccountHash:(id)a4 fidoKeyHash:(id)a5 challenge:(id)a6 publicKeyIdentifier:(id)a7 externalizedAuth:(id)a8 completion:(id)a9
{
}

- (void)generateSEEncryptionCertificateForSubCredentialId:(id)a3 completion:(id)a4
{
}

- (void)generateISOEncryptionCertificateForSubCredentialId:(id)a3 completion:(id)a4
{
  p_dataSource = &self->_dataSource;
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained isoManager]);
  [v8 generateISOEncryptionCertificateForSubCredentialId:v7 completion:v6];
}

- (void)addISO18013Blobs:(id)a3 cardType:(int64_t)a4 completion:(id)a5
{
  p_dataSource = &self->_dataSource;
  id v8 = a5;
  id v9 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained isoManager]);
  [v10 addISO18013Blobs:v9 cardType:a4 completion:v8];
}

- (void)deleteKeyMaterialForSubCredentialId:(id)a3
{
  p_dataSource = &self->_dataSource;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained isoManager]);
  id v7 = -[NSSet initWithObjects:](objc_alloc(&OBJC_CLASS___NSSet), "initWithObjects:", v4, 0LL);
  [v6 deleteSubCredentialIdentifiers:v7 cardType:3];

  id v9 = objc_loadWeakRetained((id *)p_dataSource);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v9 subcredentialManager]);
  [v8 revokeSubcredentialForIdentifier:v4 withCompletion:0];
}

- (void)revokeCredentialsWithReaderIdentifiers:(id)a3 completion:(id)a4
{
  p_dataSource = &self->_dataSource;
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained subcredentialManager]);
  [v8 revokeSubcredentialsForReaderIdentifiers:v7 withCompletion:v6];
}

- (void)retrievePendingProvisioningsWithType:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = PDDefaultQueue();
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002DE34C;
  block[3] = &unk_100639AF0;
  block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);
}

- (void)longTermPrivacyKeyForCredentialGroupIdentifier:(id)a3 reuseExisting:(BOOL)a4 completion:(id)a5
{
}

- (void)triggerCloudStoreZoneCreationForAccount:(id)a3 withCompletion:(id)a4
{
  p_dataSource = &self->_dataSource;
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained accountManager]);
  [v8 triggerCloudStoreZoneCreationForAccount:v7 withCompletion:v6];
}

- (void)meetsProvisioningRequirements:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = PDDefaultQueue();
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002DE50C;
  block[3] = &unk_100639AF0;
  block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);
}

- (BOOL)meetsProvisioningRequirements:(id)a3 missingRequirements:(id *)a4
{
  id v6 = a3;
  uint64_t v18 = 0LL;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000LL;
  uint64_t v12 = 0LL;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  int v15 = sub_1002DE6B0;
  int v16 = sub_1002DE6C0;
  id v17 = 0LL;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained provisioningRequirementsChecker]);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1002DE6C8;
  v11[3] = &unk_1006541C8;
  void v11[4] = &v18;
  v11[5] = &v12;
  [v8 meetsWithRequirementsContainer:v6 completion:v11];

  if (a4) {
    *a4 = (id) v13[5];
  }
  char v9 = *((_BYTE *)v19 + 24);
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
  return v9;
}

- (void)accountWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  char v9 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained accountManager]);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1002DE7AC;
  v11[3] = &unk_10064AE80;
  id v12 = v6;
  id v10 = v6;
  [v9 accountWithIdentifier:v7 completion:v11];
}

- (void)paymentWebService:(id)a3 updateAccountWithIdentifier:(id)a4 completion:(id)a5
{
  p_dataSource = &self->_dataSource;
  id v7 = a5;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  char v9 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained accountManager]);
  [v9 updateAccountWithIdentifier:v8 extended:0 completion:v7];
}

- (void)updatedAccountsForProvisioningWithCompletion:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained accountManager]);

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1002DE8F4;
  v9[3] = &unk_1006390F0;
  id v10 = v6;
  id v11 = v4;
  id v7 = v4;
  id v8 = v6;
  [v8 updateAccountsWithCompletion:v9];
}

- (id)paymentWebService:(id)a3 passesOfType:(unint64_t)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained databaseManager]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 passesOfType:a4]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 allObjects]);

  return v8;
}

- (void)reserveStorageForAppletTypes:(id)a3 metadata:(id)a4 completion:(id)a5
{
  p_dataSource = &self->_dataSource;
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained paymentWebServiceCoordinator]);
  id v14 = (id)objc_claimAutoreleasedReturnValue([v12 sharedWebService]);

  id v13 = [[PKProvisioningSEStorageManager alloc] initWithWebService:v14];
  [v13 reserveStorageForAppletTypes:v10 metadata:v9 completion:v8];
}

- (void)deleteReservation:(id)a3 completion:(id)a4
{
  p_dataSource = &self->_dataSource;
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained paymentWebServiceCoordinator]);
  id v11 = (id)objc_claimAutoreleasedReturnValue([v9 sharedWebService]);

  id v10 = [[PKProvisioningSEStorageManager alloc] initWithWebService:v11];
  [v10 deleteReservation:v7 completion:v6];
}

- (void)generateAuxiliaryCapabilitiesForRequirements:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained auxiliaryCapabilityManager]);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1002DEBA4;
  v11[3] = &unk_10063CDD8;
  id v12 = v6;
  id v10 = v6;
  [v9 registerLocalAuxiliaryCapabilities:v7 withPass:0 completion:v11];
}

- (void)addPendingProvisionings:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      id v11 = 0LL;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8LL * (void)v11);
        id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
        id v14 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained pendingProvisioningManager]);
        [v14 storePendingProvisioning:v12];

        id v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v9);
  }

  v7[2](v7, 0LL);
}

- (void)paymentWebService:(id)a3 canAddSecureElementPassWithConfiguration:(id)a4 completion:(id)a5
{
}

- (void)prepareProvisioningTarget:(id)a3 checkFamilyCircle:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  p_dataSource = &self->_dataSource;
  id v8 = a5;
  id v9 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained pushProvisioningManager]);
  [v10 prepareProvisioningTarget:v9 checkFamilyCircle:v5 completion:v8];
}

- (PKPaymentDataProviderDelegate)delegate
{
  return (PKPaymentDataProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end