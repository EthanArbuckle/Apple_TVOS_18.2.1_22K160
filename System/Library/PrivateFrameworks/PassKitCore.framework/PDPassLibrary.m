@interface PDPassLibrary
- (BOOL)_entitledForObject:(id)a3 forActions:(unint64_t)a4;
- (BOOL)_entitledForPassType:(unint64_t)a3 uniqueIdentifier:(id)a4 actions:(unint64_t)a5;
- (BOOL)_entitledForUniqueID:(id)a3 forActions:(unint64_t)a4;
- (BOOL)_hasPaymentPassesForNetworks:(id)a3 capabilities:(unint64_t)a4 paymentApplicationStates:(id)a5;
- (BOOL)_isConfigurationValid:(id)a3;
- (BOOL)_isWatchIssuerAppProvisioningSupported;
- (BOOL)_writePass:(id)a3 error:(id *)a4;
- (BOOL)_writePass:(id)a3 withSettings:(unint64_t)a4 error:(id *)a5;
- (BOOL)willSanitizePasses;
- (PDAccountManager)accountManager;
- (PDAppletSubcredentialManager)subcredentialManager;
- (PDAuxiliaryCapabilityManager)auxiliaryCapabilityManager;
- (PDCarKeyRequirementsChecker)carKeyRequirementsChecker;
- (PDCardFileManager)cardFileManager;
- (PDDatabaseManager)databaseManager;
- (PDDefaultPassManager)defaultPassManager;
- (PDDeviceRegistrationServiceCoordinator)deviceRegistrationServiceCoordinator;
- (PDExpressPassManager)expressPassManager;
- (PDExpressTransitUpgradeController)expressUpgradeController;
- (PDISO18013Manager)isoManager;
- (PDIssuerBindingManager)issuerBindingManager;
- (PDPassDynamicStateManager)dynamicStateManager;
- (PDPassLibrary)initWithConnection:(id)a3;
- (PDPassLibrary)initWithConnection:(id)a3 server:(id)a4;
- (PDPassLibraryDelegate)delegate;
- (PDPassLiveRenderManager)passLiveRenderManager;
- (PDPaymentWebServiceCoordinator)paymentWebServicesCoordinator;
- (PDProvisioningRequirementsChecker)provisioningRequirementsChecker;
- (PDPushProvisioningManager)pushProvisioningManager;
- (PDRelevantPassProvider)relevantPassProvider;
- (PDSpotlightIndexer)spotlightIndexer;
- (PDUserNotificationManager)userNotificationManager;
- (PDWebServicesCoordinator)webServicesCoordinator;
- (PKIDSManager)idsManager;
- (PKSecureElement)secureElement;
- (PKUsageNotificationServer)usageNotificationServer;
- (id)_entitlementFilteredPasses:(id)a3;
- (id)_filteredPasses:(id)a3 forApplicationIdentifier:(id)a4;
- (id)_filteredPasses:(id)a3 forWebDomain:(id)a4;
- (id)_inAppPrivateLabelPaymentPassesForApplicationIdentifier:(id)a3 issuerCountryCodes:(id)a4 paymentApplicationStates:(id)a5 isMultiTokensRequest:(BOOL)a6;
- (id)_inAppPrivateLabelPaymentPassesForWebDomain:(id)a3 issuerCountryCodes:(id)a4 paymentApplicationStates:(id)a5 isMultiTokensRequest:(BOOL)a6;
- (id)_sanitizePassIfNeeded:(id)a3;
- (id)remoteObjectProxy;
- (id)remoteObjectProxyWithErrorHandler:(id)a3;
- (unint64_t)_addPassesWithEnumerator:(id)a3;
- (void)_addPasses:(id)a3 withCompletion:(id)a4;
- (void)_getEncryptedServiceProviderDataForSecureElementPass:(id)a3 publicKey:(id)a4 scheme:(id)a5 completion:(id)a6;
- (void)_getPassWithUniqueID:(id)a3 handler:(id)a4;
- (void)_getServiceProviderDataForPass:(id)a3 completion:(id)a4;
- (void)_hasPassesWithSupportedNetworks:(id)a3 merchantCapabilities:(unint64_t)a4 webDomain:(id)a5 issuerCountryCodes:(id)a6 paymentApplicationStates:(id)a7 paymentRequestType:(id)a8 isMultiTokensRequest:(BOOL)a9 handler:(id)a10;
- (void)_passesWithSupportedNetworks:(id)a3 merchantCapabilities:(unint64_t)a4 webDomain:(id)a5 issuerCountryCodes:(id)a6 paymentApplicationStates:(id)a7 paymentRequestType:(id)a8 isMultiTokensRequest:(BOOL)a9 handler:(id)a10;
- (void)_paymentPassesForNetworks:(id)a3 capabilities:(unint64_t)a4 issuerCountryCodes:(id)a5 webPayment:(BOOL)a6 paymentApplicationStates:(id)a7 paymentRequestType:(id)a8 isMultiTokensRequest:(BOOL)a9 withHandler:(id)a10;
- (void)_queue_replacePass:(id)a3 handler:(id)a4;
- (void)_sanitizePasses:(id)a3;
- (void)_setBackupDefaultPaymentPassState:(id)a3;
- (void)_setBackupPassbookDeletedState:(id)a3;
- (void)_usingSynchronousProxy:(BOOL)a3 addPassesWithEnumerator:(id)a4 estimatedNumberOfPasses:(unint64_t)a5 osTransaction:(id)a6 completionHandler:(id)a7;
- (void)activated;
- (void)addPassesWithData:(id)a3 handler:(id)a4;
- (void)backupMetadataWithHandler:(id)a3;
- (void)badgeCountItemsWithCompletion:(id)a3;
- (void)canAddCarKeyPassWithConfiguration:(id)a3 completion:(id)a4;
- (void)canAddClassicApplePayCredentialWithConfiguration:(id)a3 completion:(id)a4;
- (void)canAddFelicaPassWithHandler:(id)a3;
- (void)canAddHomeKeyWithConfiguration:(id)a3 completion:(id)a4;
- (void)canAddPassesOfType:(unint64_t)a3 handler:(id)a4;
- (void)canAddPushablePassWithConfiguration:(id)a3 completion:(id)a4;
- (void)canPresentPaymentRequest:(id)a3 completion:(id)a4;
- (void)checkForTransitNotification;
- (void)clearConnectionReference;
- (void)contactlessInterfaceDidDismissFromSource:(int64_t)a3;
- (void)contactlessInterfaceDidPresentFromSource:(int64_t)a3;
- (void)countPassesOfType:(unint64_t)a3 handler:(id)a4;
- (void)dealloc;
- (void)defaultPaymentPassWithHandler:(id)a3;
- (void)deleteKeyMaterialForSubCredentialId:(id)a3;
- (void)enabledValueAddedServicePassesWithHandler:(id)a3;
- (void)expressTransitPassWithHandler:(id)a3;
- (void)fetchCurrentRelevantPassInfo:(id)a3;
- (void)fetchHasCandidatePasses:(id)a3;
- (void)forceImmediateRevocationCheck;
- (void)getArchivedObjectWithUniqueID:(id)a3 handler:(id)a4;
- (void)getContentForUniqueID:(id)a3 handler:(id)a4;
- (void)getDataForBundleResourceNamed:(id)a3 withExtension:(id)a4 objectUniqueIdentifier:(id)a5 handler:(id)a6;
- (void)getDataForBundleResources:(id)a3 objectUniqueIdentifier:(id)a4 handler:(id)a5;
- (void)getDiffForPassUpdateUserNotificationWithIdentifier:(id)a3 handler:(id)a4;
- (void)getGroupsControllerSnapshotWithOptions:(id)a3 handler:(id)a4;
- (void)getImageSetForUniqueID:(id)a3 ofType:(int64_t)a4 displayProfile:(id)a5 suffix:(id)a6 handler:(id)a7;
- (void)getManifestHashAndSettingsForPassTypeID:(id)a3 serialNumber:(id)a4 handler:(id)a5;
- (void)getMetadataForFieldWithProperties:(id)a3 handler:(id)a4;
- (void)getPassUniqueIDsForAssociatedApplicationIdentifier:(id)a3 handler:(id)a4;
- (void)getPassWithPassTypeID:(id)a3 serialNumber:(id)a4 handler:(id)a5;
- (void)getPassWithUniqueID:(id)a3 handler:(id)a4;
- (void)getPassesAndCatalogOfPassTypes:(unint64_t)a3 limitResults:(BOOL)a4 withHandler:(id)a5;
- (void)getPassesOfType:(unint64_t)a3 handler:(id)a4;
- (void)getPassesWithHandler:(id)a3;
- (void)getPassesWithReaderIdentifier:(id)a3 handler:(id)a4;
- (void)getPassesWithSearchableTransactions:(id)a3;
- (void)getPassesWithUniqueIdentifiers:(id)a3 handler:(id)a4;
- (void)hasInAppPaymentPassesForNetworks:(id)a3 capabilities:(unint64_t)a4 issuerCountryCodes:(id)a5 paymentRequestType:(id)a6 isMultiTokensRequest:(BOOL)a7 withHandler:(id)a8;
- (void)hasInAppPrivateLabelPaymentPassesForApplicationIdentifier:(id)a3 issuerCountryCodes:(id)a4 isMultiTokensRequest:(BOOL)a5 withHandler:(id)a6;
- (void)hasInAppPrivateLabelPaymentPassesForWebDomain:(id)a3 issuerCountryCodes:(id)a4 isMultiTokensRequest:(BOOL)a5 withHandler:(id)a6;
- (void)hasPassesInExpiredSectionWithHandler:(id)a3;
- (void)hasPassesOfType:(unint64_t)a3 handler:(id)a4;
- (void)hasPassesWithSupportedNetworks:(id)a3 merchantCapabilities:(unint64_t)a4 webDomain:(id)a5 issuerCountryCodes:(id)a6 paymentRequestType:(id)a7 isMultiTokensRequest:(BOOL)a8 completion:(id)a9;
- (void)hasRemoteLibraryWithHandler:(id)a3;
- (void)hasSecureElementPassesOfType:(int64_t)a3 handler:(id)a4;
- (void)iPadSupportsPasses:(id)a3;
- (void)inAppPaymentPassesForNetworks:(id)a3 capabilities:(unint64_t)a4 issuerCountryCodes:(id)a5 paymentRequestType:(id)a6 isMultiTokensRequest:(BOOL)a7 withHandler:(id)a8;
- (void)inAppPrivateLabelPaymentPassesForApplicationIdentifier:(id)a3 issuerCountryCodes:(id)a4 isMultiTokensRequest:(BOOL)a5 withHandler:(id)a6;
- (void)inAppPrivateLabelPaymentPassesForWebDomain:(id)a3 issuerCountryCodes:(id)a4 isMultiTokensRequest:(BOOL)a5 withHandler:(id)a6;
- (void)introduceDatabaseIntegrityProblem;
- (void)invalidateVehicleConnectionSessionIdentifier:(id)a3;
- (void)isPassbookVisibleWithHandler:(id)a3;
- (void)isPaymentPassActivationAvailableWithHandler:(id)a3;
- (void)isRemovingPassesOfType:(unint64_t)a3 handler:(id)a4;
- (void)isWatchIssuerAppProvisioningSupportedWithHandler:(id)a3;
- (void)issueWalletUserNotificationWithTitle:(id)a3 message:(id)a4 forPassUniqueIdentifier:(id)a5 customActionRoute:(id)a6;
- (void)issuerBindingFlowAuthenticationPerformed;
- (void)migrateDataWithHandler:(id)a3 didRestoreFromBackup:(BOOL)a4;
- (void)noteACAccountChanged:(id)a3 handler:(id)a4;
- (void)noteAppleAccountChanged:(id)a3 handler:(id)a4;
- (void)noteObjectSharedWithUniqueID:(id)a3;
- (void)notifyPassUsedWithIdentifier:(id)a3 fromSource:(int64_t)a4;
- (void)openPaymentUIWithCompletion:(id)a3;
- (void)openWalletUIWithRelevantPass:(id)a3;
- (void)passWithDPANIdentifier:(id)a3 handler:(id)a4;
- (void)passWithFPANIdentifier:(id)a3 handler:(id)a4;
- (void)passbookHasBeenDeletedWithHandler:(id)a3;
- (void)paymentPassWithAssociatedAccountIdentifier:(id)a3 completion:(id)a4;
- (void)paymentSetupFeaturesForConfiguration:(id)a3 completion:(id)a4;
- (void)peerPaymentPassUniqueIDWithHandler:(id)a3;
- (void)pendingUserNotificationsWithIdentifier:(id)a3 completion:(id)a4;
- (void)personalizePassWithUniqueIdentifier:(id)a3 contact:(id)a4 personalizationToken:(id)a5 requiredPersonalizationFields:(unint64_t)a6 personalizationSource:(unint64_t)a7 handler:(id)a8;
- (void)postUpgradedPassNotificationForMarket:(id)a3 passUniqueID:(id)a4;
- (void)prepareForBackupRestoreWithExistingPreferencesData:(id)a3 handler:(id)a4;
- (void)prepareForBackupRestoreWithRequiredFileURLs:(id)a3 destinationFileHandles:(id)a4 handler:(id)a5;
- (void)presentContactlessInterfaceForDefaultPassFromSource:(int64_t)a3 handler:(id)a4;
- (void)presentContactlessInterfaceForPassWithUniqueIdentifier:(id)a3 fromSource:(int64_t)a4 handler:(id)a5;
- (void)presentIssuerBindingFlowForIssuerData:(id)a3 signature:(id)a4 orientation:(id)a5;
- (void)presentPaymentSetupRequest:(id)a3 orientation:(id)a4 completion:(id)a5;
- (void)pushProvisioningNoncesWithCredentialCount:(unint64_t)a3 completion:(id)a4;
- (void)recoverPassWithUniqueID:(id)a3 handler:(id)a4;
- (void)removeAllScheduledActivities;
- (void)removePassWithUniqueID:(id)a3 diagnosticReason:(id)a4 handler:(id)a5;
- (void)removePassesOfType:(unint64_t)a3 withDiagnosticReason:(id)a4 handler:(id)a5;
- (void)removePassesWithUniqueIDs:(id)a3 diagnosticReason:(id)a4 handler:(id)a5;
- (void)replacePassWithPassData:(id)a3 handler:(id)a4;
- (void)rescheduleCommutePlanRenewalReminderForPassWithUniqueID:(id)a3;
- (void)resetApplePayWithDiagnosticReason:(id)a3 handler:(id)a4;
- (void)sendCatalogChanged:(id)a3;
- (void)sendDynamicStatesUpdated:(id)a3 catalog:(id)a4;
- (void)sendPassAdded:(id)a3 state:(id)a4 catalog:(id)a5;
- (void)sendPassRecovered:(id)a3 state:(id)a4 catalog:(id)a5;
- (void)sendPassRemoved:(id)a3 catalog:(id)a4;
- (void)sendPassUpdated:(id)a3 state:(id)a4 catalog:(id)a5;
- (void)sendRKEPassThroughMessage:(id)a3 forSessionIdentifier:(id)a4 withCompletion:(id)a5;
- (void)sendUserEditedCatalog:(id)a3;
- (void)sessionDidChangeConnectionStatus:(int64_t)a3;
- (void)sessionDidReceiveData:(id)a3;
- (void)setAccountManager:(id)a3;
- (void)setAuxiliaryCapabilityManager:(id)a3;
- (void)setBackupMetadata:(id)a3 handler:(id)a4;
- (void)setCarKeyRequirementsChecker:(id)a3;
- (void)setCardFileManager:(id)a3;
- (void)setDatabaseManager:(id)a3;
- (void)setDefaultPassManager:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceRegistrationServiceCoordinator:(id)a3;
- (void)setDynamicStateManager:(id)a3;
- (void)setExpressPassManager:(id)a3;
- (void)setExpressUpgradeController:(id)a3;
- (void)setIdsManager:(id)a3;
- (void)setIsoManager:(id)a3;
- (void)setIssuerBindingManager:(id)a3;
- (void)setPassLiveRenderManager:(id)a3;
- (void)setPaymentWebServicesCoordinator:(id)a3;
- (void)setProvisioningRequirementsChecker:(id)a3;
- (void)setPushProvisioningManager:(id)a3;
- (void)setRelevantPassProvider:(id)a3;
- (void)setSecureElement:(id)a3;
- (void)setSortingState:(int64_t)a3 forObjectWithUniqueID:(id)a4 withCompletion:(id)a5;
- (void)setSpotlightIndexer:(id)a3;
- (void)setSubcredentialManager:(id)a3;
- (void)setUsageNotificationServer:(id)a3;
- (void)setUserNotificationManager:(id)a3;
- (void)setWebServicesCoordinator:(id)a3;
- (void)shuffleGroups:(int)a3;
- (void)signData:(id)a3 forPassUniqueID:(id)a4 completion:(id)a5;
- (void)signData:(id)a3 signatureEntanglementMode:(unint64_t)a4 withCompletionHandler:(id)a5;
- (void)sortedTransitPassesForAppletDataFormat:(id)a3 handler:(id)a4;
- (void)sortedTransitPassesForTransitNetworkIdentifiers:(id)a3;
- (void)spotlightReindexAllContentWithAcknowledgement:(id)a3;
- (void)spotlightReindexContentWithIdentifiers:(id)a3 acknowledgement:(id)a4;
- (void)spotlightResetWithCompletion:(id)a3;
- (void)spotlightStatusWithCompletion:(id)a3;
- (void)startVehicleConnectionSessionWithPassUniqueIdentifier:(id)a3 completion:(id)a4;
- (void)submitVerificationCode:(id)a3 verificationData:(id)a4 forPassWithUniqueID:(id)a5 handler:(id)a6;
- (void)supportsSearchForPassUniqueID:(id)a3 completion:(id)a4;
- (void)unexpiredPassesOrderedByGroup:(id)a3;
- (void)updateDate:(id)a3 forPendingNotificationWithIdentifier:(id)a4;
- (void)updateIngestedDate:(id)a3 forPassWithUniqueID:(id)a4;
- (void)updateObjectWithUniqueIdentifier:(id)a3 handler:(id)a4;
- (void)updateSettings:(unint64_t)a3 forObjectWithUniqueID:(id)a4;
- (void)usingSynchronousProxy:(BOOL)a3 addISO18013Blobs:(id)a4 cardType:(int64_t)a5 completion:(id)a6;
- (void)usingSynchronousProxy:(BOOL)a3 addPassIngestionPayloads:(id)a4 withCompletionHandler:(id)a5;
- (void)usingSynchronousProxy:(BOOL)a3 addPassesContainer:(id)a4 withCompletionHandler:(id)a5;
- (void)usingSynchronousProxy:(BOOL)a3 addUnsignedPassesWithDataFileDescriptors:(id)a4 completionHandler:(id)a5;
- (void)usingSynchronousProxy:(BOOL)a3 availableHomeKeyPassesWithCompletionHandler:(id)a4;
- (void)usingSynchronousProxy:(BOOL)a3 canAddCarKeyPassWithConfiguration:(id)a4 completion:(id)a5;
- (void)usingSynchronousProxy:(BOOL)a3 canAddSecureElementPassWithConfiguration:(id)a4 completion:(id)a5;
- (void)usingSynchronousProxy:(BOOL)a3 checkFidoKeyPresenceForRelyingParty:(id)a4 relyingPartyAccountHash:(id)a5 fidoKeyHash:(id)a6 completion:(id)a7;
- (void)usingSynchronousProxy:(BOOL)a3 configureHomeAuxiliaryCapabilitiesForSerialNumber:(id)a4 homeIdentifier:(id)a5 fromUnifiedAccessDescriptor:(id)a6 andAliroDescriptor:(id)a7 completion:(id)a8;
- (void)usingSynchronousProxy:(BOOL)a3 configurePushProvisioningConfiguration:(id)a4 completion:(id)a5;
- (void)usingSynchronousProxy:(BOOL)a3 configurePushProvisioningConfigurationV2:(id)a4 completion:(id)a5;
- (void)usingSynchronousProxy:(BOOL)a3 containsPassWithPassTypeIdentifier:(id)a4 serialNumber:(id)a5 completionHandler:(id)a6;
- (void)usingSynchronousProxy:(BOOL)a3 createFidoKeyForRelyingParty:(id)a4 relyingPartyAccountHash:(id)a5 challenge:(id)a6 externalizedAuth:(id)a7 completion:(id)a8;
- (void)usingSynchronousProxy:(BOOL)a3 dynamicStateForPassUniqueID:(id)a4 handler:(id)a5;
- (void)usingSynchronousProxy:(BOOL)a3 enableExpressForPassWithPassTypeIdentifier:(id)a4 serialNumber:(id)a5 completionHandler:(id)a6;
- (void)usingSynchronousProxy:(BOOL)a3 fetchAppletSubCredentialForPassTypeIdentifier:(id)a4 serialNumber:(id)a5 completionHandler:(id)a6;
- (void)usingSynchronousProxy:(BOOL)a3 generateAuxiliaryCapabilitiesForRequirements:(id)a4 completion:(id)a5;
- (void)usingSynchronousProxy:(BOOL)a3 generateISOEncryptionCertificateForSubCredentialId:(id)a4 completion:(id)a5;
- (void)usingSynchronousProxy:(BOOL)a3 generateSEEncryptionCertificateForSubCredentialId:(id)a4 completion:(id)a5;
- (void)usingSynchronousProxy:(BOOL)a3 generateTransactionKeyWithReaderIdentifier:(id)a4 readerPublicKey:(id)a5 completion:(id)a6;
- (void)usingSynchronousProxy:(BOOL)a3 getCachedImageSetContainerForUniqueID:(id)a4 type:(int64_t)a5 withDisplayProfile:(id)a6 displayTraits:(id)a7 handler:(id)a8;
- (void)usingSynchronousProxy:(BOOL)a3 getContentForUniqueID:(id)a4 withHandler:(id)a5;
- (void)usingSynchronousProxy:(BOOL)a3 getEncryptedServiceProviderDataForUniqueID:(id)a4 completion:(id)a5;
- (void)usingSynchronousProxy:(BOOL)a3 getGroupsControllerSnapshotWithOptions:(id)a4 handler:(id)a5;
- (void)usingSynchronousProxy:(BOOL)a3 getImageSetContainerForUniqueID:(id)a4 type:(int64_t)a5 withDisplayProfile:(id)a6 suffix:(id)a7 handler:(id)a8;
- (void)usingSynchronousProxy:(BOOL)a3 getManifestHashForPassWithUniqueID:(id)a4 handler:(id)a5;
- (void)usingSynchronousProxy:(BOOL)a3 getPassForProvisioningCredentialHash:(id)a4 handler:(id)a5;
- (void)usingSynchronousProxy:(BOOL)a3 getPassesAndCatalogOfPassTypes:(unint64_t)a4 limitResults:(BOOL)a5 withHandler:(id)a6;
- (void)usingSynchronousProxy:(BOOL)a3 getPassesOfStyles:(unint64_t)a4 handler:(id)a5;
- (void)usingSynchronousProxy:(BOOL)a3 getPaymentPassesPendingActivationWithHandler:(id)a4;
- (void)usingSynchronousProxy:(BOOL)a3 getServiceProviderDataForUniqueID:(id)a4 completion:(id)a5;
- (void)usingSynchronousProxy:(BOOL)a3 longTermPrivacyKeyForCredentialGroupIdentifier:(id)a4 reuseExisting:(BOOL)a5 completion:(id)a6;
- (void)usingSynchronousProxy:(BOOL)a3 meetsProvisioningRequirements:(id)a4 completion:(id)a5;
- (void)usingSynchronousProxy:(BOOL)a3 passLocalizedStringForKey:(id)a4 uniqueID:(id)a5 completion:(id)a6;
- (void)usingSynchronousProxy:(BOOL)a3 postUpgradesAvailableNotificationForMarket:(id)a4 passUniqueID:(id)a5;
- (void)usingSynchronousProxy:(BOOL)a3 provisionHomeKeyPassForSerialNumbers:(id)a4 completionHandler:(id)a5;
- (void)usingSynchronousProxy:(BOOL)a3 replaceUnsignedPassWithDataFileDescriptor:(id)a4 completionHandler:(id)a5;
- (void)usingSynchronousProxy:(BOOL)a3 requestIssuerBoundPassesWithBindingWithData:(id)a4 automaticallyProvision:(BOOL)a5 withCompletion:(id)a6;
- (void)usingSynchronousProxy:(BOOL)a3 setLiveRenderingEnabled:(BOOL)a4 forPassUniqueID:(id)a5 handler:(id)a6;
- (void)usingSynchronousProxy:(BOOL)a3 signWithFidoKeyForRelyingParty:(id)a4 relyingPartyAccountHash:(id)a5 fidoKeyHash:(id)a6 challenge:(id)a7 publicKeyIdentifier:(id)a8 externalizedAuth:(id)a9 completion:(id)a10;
@end

@implementation PDPassLibrary

- (PDPassLibrary)initWithConnection:(id)a3
{
  return 0LL;
}

- (PDPassLibrary)initWithConnection:(id)a3 server:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___PDPassLibrary;
  v8 = -[PDPassLibrary initWithConnection:](&v21, "initWithConnection:", v6);
  if (v8)
  {
    v9 = -[PKEntitlementWhitelist initWithConnection:]( objc_alloc(&OBJC_CLASS___PKEntitlementWhitelist),  "initWithConnection:",  v6);
    whitelist = v8->_whitelist;
    v8->_whitelist = v9;

    v8->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v8->_server, a4);
    uint64_t v11 = sub_10002A820((uint64_t)v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    uint64_t v13 = sub_100016B68((uint64_t)v12);
    uint64_t v14 = objc_claimAutoreleasedReturnValue(v13);
    assertionManager = v8->_assertionManager;
    v8->_assertionManager = (PDAssertionManager *)v14;

    uint64_t v16 = PKPassLibraryInterface();
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    [v6 setRemoteObjectInterface:v17];

    uint64_t v18 = PDPassLibraryExtendedInterface();
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    [v6 setExportedInterface:v19];

    [v6 setExportedObject:v8];
  }

  return v8;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___PDPassLibrary;
  -[PDPassLibrary dealloc](&v2, "dealloc");
}

- (void)activated
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PDPassLibrary;
  -[PDPassLibrary activated](&v3, "activated");
}

- (void)setSubcredentialManager:(id)a3
{
  v5 = (PDAppletSubcredentialManager *)a3;
  subcredentialManager = self->_subcredentialManager;
  if (subcredentialManager != v5)
  {
    id v7 = v5;
    -[PDAppletSubcredentialManager unregisterObserver:](subcredentialManager, "unregisterObserver:", self);
    objc_storeStrong((id *)&self->_subcredentialManager, a3);
    -[PDAppletSubcredentialManager registerObserver:](self->_subcredentialManager, "registerObserver:", self);
    v5 = v7;
  }
}

- (void)setIssuerBindingManager:(id)a3
{
  v5 = (PDIssuerBindingManager *)a3;
  issuerBindingManager = self->_issuerBindingManager;
  if (issuerBindingManager != v5)
  {
    id v7 = v5;
    -[PDIssuerBindingManager unregisterObserver:](issuerBindingManager, "unregisterObserver:", self);
    objc_storeStrong((id *)&self->_issuerBindingManager, a3);
    -[PDIssuerBindingManager registerObserver:](self->_issuerBindingManager, "registerObserver:", self);
    v5 = v7;
  }
}

- (BOOL)willSanitizePasses
{
  else {
    return -[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess") ^ 1;
  }
}

- (void)clearConnectionReference
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_userNotifications) {
    v4 = -[NSArray initWithArray:](objc_alloc(&OBJC_CLASS___NSArray), "initWithArray:", self->_userNotifications);
  }
  else {
    v4 = 0LL;
  }
  os_unfair_lock_unlock(p_lock);
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  v5 = v4;
  id v6 = -[NSArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      v9 = 0LL;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        CFUserNotificationCancel((CFUserNotificationRef)[*(id *)(*((void *)&v11 + 1) + 8 * (void)v9) pointerValue]);
        v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = -[NSArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
    }

    while (v7);
  }

  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___PDPassLibrary;
  -[PDPassLibrary clearConnectionReference](&v10, "clearConnectionReference");
}

- (id)remoteObjectProxy
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___PDPassLibrary;
  id v2 = -[PDPassLibrary remoteObjectProxy](&v4, "remoteObjectProxy");
  return (id)objc_claimAutoreleasedReturnValue(v2);
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PDPassLibrary;
  id v3 = -[PDPassLibrary remoteObjectProxyWithErrorHandler:](&v5, "remoteObjectProxyWithErrorHandler:", a3);
  return (id)objc_claimAutoreleasedReturnValue(v3);
}

- (void)sendPassAdded:(id)a3 state:(id)a4 catalog:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  objc_super v10 = (void *)objc_claimAutoreleasedReturnValue(-[PDPassLibrary _sanitizePassIfNeeded:](self, "_sanitizePassIfNeeded:", a3));
  if (-[PKEntitlementWhitelist passesAllAccess](self->_whitelist, "passesAllAccess"))
  {
    __int128 v11 = -[NSSet initWithObjects:](objc_alloc(&OBJC_CLASS___NSSet), "initWithObjects:", v10, 0LL);
    if (v8)
    {
      __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v10 uniqueID]);
      uint64_t v16 = v12;
      id v17 = v8;
      __int128 v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v17,  &v16,  1LL));
    }

    else
    {
      __int128 v13 = &__NSDictionary0__struct;
    }

    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(-[PDPassLibrary remoteObjectProxy](self, "remoteObjectProxy"));
    [v14 catalogChanged:v9 withNewPasses:v11 states:v13];
  }

  if (-[PDPassLibrary _entitledForObject:forActions:](self, "_entitledForObject:forActions:", v10, 2LL))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[PDPassLibrary remoteObjectProxy](self, "remoteObjectProxy"));
    [v15 passAdded:v10];
  }
}

- (void)sendPassUpdated:(id)a3 state:(id)a4 catalog:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  objc_super v10 = (void *)objc_claimAutoreleasedReturnValue(-[PDPassLibrary _sanitizePassIfNeeded:](self, "_sanitizePassIfNeeded:", a3));
  if (-[PKEntitlementWhitelist passesAllAccess](self->_whitelist, "passesAllAccess"))
  {
    __int128 v11 = -[NSSet initWithObjects:](objc_alloc(&OBJC_CLASS___NSSet), "initWithObjects:", v10, 0LL);
    if (v8)
    {
      __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v10 uniqueID]);
      uint64_t v16 = v12;
      id v17 = v8;
      __int128 v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v17,  &v16,  1LL));
    }

    else
    {
      __int128 v13 = &__NSDictionary0__struct;
    }

    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(-[PDPassLibrary remoteObjectProxy](self, "remoteObjectProxy"));
    [v14 catalogChanged:v9 withNewPasses:v11 states:v13];
  }

  if (-[PDPassLibrary _entitledForObject:forActions:](self, "_entitledForObject:forActions:", v10, 2LL))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[PDPassLibrary remoteObjectProxy](self, "remoteObjectProxy"));
    [v15 passUpdated:v10];
  }
}

- (void)sendDynamicStatesUpdated:(id)a3 catalog:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (-[PKEntitlementWhitelist passesAllAccess](self->_whitelist, "passesAllAccess"))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDPassLibrary remoteObjectProxy](self, "remoteObjectProxy"));
    [v7 catalogChanged:v6 withNewPasses:0 states:v8];
  }
}

- (void)sendPassRemoved:(id)a3 catalog:(id)a4
{
  id v6 = a4;
  id v9 = (id)objc_claimAutoreleasedReturnValue(-[PDPassLibrary _sanitizePassIfNeeded:](self, "_sanitizePassIfNeeded:", a3));
  if (-[PKEntitlementWhitelist passesAllAccess](self->_whitelist, "passesAllAccess"))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDPassLibrary remoteObjectProxy](self, "remoteObjectProxy"));
    [v7 catalogChanged:v6 withNewPasses:0 states:0];
  }

  if (-[PDPassLibrary _entitledForObject:forActions:](self, "_entitledForObject:forActions:", v9, 2LL))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PDPassLibrary remoteObjectProxy](self, "remoteObjectProxy"));
    [v8 passRemoved:v9];
  }
}

- (void)sendPassRecovered:(id)a3 state:(id)a4 catalog:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  objc_super v10 = (void *)objc_claimAutoreleasedReturnValue(-[PDPassLibrary _sanitizePassIfNeeded:](self, "_sanitizePassIfNeeded:", a3));
  if (-[PKEntitlementWhitelist passesAllAccess](self->_whitelist, "passesAllAccess"))
  {
    __int128 v11 = -[NSSet initWithObjects:](objc_alloc(&OBJC_CLASS___NSSet), "initWithObjects:", v10, 0LL);
    if (v8)
    {
      __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v10 uniqueID]);
      uint64_t v16 = v12;
      id v17 = v8;
      __int128 v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v17,  &v16,  1LL));
    }

    else
    {
      __int128 v13 = &__NSDictionary0__struct;
    }

    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(-[PDPassLibrary remoteObjectProxy](self, "remoteObjectProxy"));
    [v14 catalogChanged:v9 withNewPasses:v11 states:v13];
  }

  if (-[PDPassLibrary _entitledForObject:forActions:](self, "_entitledForObject:forActions:", v10, 2LL))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[PDPassLibrary remoteObjectProxy](self, "remoteObjectProxy"));
    [v15 passRecovered:v10];
  }
}

- (void)sendCatalogChanged:(id)a3
{
  id v5 = a3;
  if (-[PKEntitlementWhitelist passesAllAccess](self->_whitelist, "passesAllAccess"))
  {
    objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[PDPassLibrary remoteObjectProxy](self, "remoteObjectProxy"));
    [v4 catalogChanged:v5 withNewPasses:0 states:0];
  }
}

- (void)getPassesWithHandler:(id)a3
{
  id v8 = (void (**)(id, void *))a3;
  if (v8)
  {
    objc_super v4 = (void *)PDOSTransactionCreate("PDPassLibrary");
    id v5 = objc_autoreleasePoolPush();
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PDDatabaseManager passes](self->_databaseManager, "passes"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDPassLibrary _entitlementFilteredPasses:](self, "_entitlementFilteredPasses:", v6));
    v8[2](v8, v7);

    objc_autoreleasePoolPop(v5);
  }
}

- (void)getPassesOfType:(unint64_t)a3 handler:(id)a4
{
  objc_super v10 = (void (**)(id, void *))a4;
  if (v10)
  {
    id v6 = (void *)PDOSTransactionCreate("PDPassLibrary");
    id v7 = objc_autoreleasePoolPush();
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PDDatabaseManager passesOfType:](self->_databaseManager, "passesOfType:", a3));
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDPassLibrary _entitlementFilteredPasses:](self, "_entitlementFilteredPasses:", v8));
    v10[2](v10, v9);

    objc_autoreleasePoolPop(v7);
  }
}

- (void)usingSynchronousProxy:(BOOL)a3 getPassesOfStyles:(unint64_t)a4 handler:(id)a5
{
  BOOL v6 = a3;
  id v8 = (void (**)(id, void *))a5;
  if (v8)
  {
    if (v6)
    {
      id v9 = (void *)PDOSTransactionCreate("PDPassLibrary");
      objc_super v10 = objc_autoreleasePoolPush();
      __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(-[PDDatabaseManager passesOfStyles:](self->_databaseManager, "passesOfStyles:", a4));
      __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(-[PDPassLibrary _entitlementFilteredPasses:](self, "_entitlementFilteredPasses:", v11));
      v8[2](v8, v12);

      objc_autoreleasePoolPop(v10);
    }

    else
    {
      id v13 = PDDefaultQueue();
      __int128 v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v13);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1000469A8;
      block[3] = &unk_10063AEB0;
      block[4] = self;
      unint64_t v17 = a4;
      uint64_t v16 = v8;
      dispatch_async(v14, block);
    }
  }
}

- (void)usingSynchronousProxy:(BOOL)a3 getPassForProvisioningCredentialHash:(id)a4 handler:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, void *))a5;
  if (v9)
  {
    if (v6)
    {
      objc_super v10 = (void *)PDOSTransactionCreate("PDPassLibrary");
      __int128 v11 = objc_autoreleasePoolPush();
      __int128 v12 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager passWithProvisioningCredentialHash:]( self->_databaseManager,  "passWithProvisioningCredentialHash:",  v8));
      id v13 = (void *)objc_claimAutoreleasedReturnValue(-[PDPassLibrary _sanitizePassIfNeeded:](self, "_sanitizePassIfNeeded:", v12));
      v9[2](v9, v13);

      objc_autoreleasePoolPop(v11);
    }

    else
    {
      id v14 = PDDefaultQueue();
      v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v14);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100046B7C;
      block[3] = &unk_100639AF0;
      block[4] = self;
      id v17 = v8;
      uint64_t v18 = v9;
      dispatch_async(v15, block);
    }
  }
}

- (void)canAddFelicaPassWithHandler:(id)a3
{
  id v3 = (void (**)(id, void))a3;
  if (v3)
  {
    id v5 = v3;
    else {
      uint64_t v4 = 0LL;
    }
    v5[2](v5, v4);
    id v3 = v5;
  }
}

- (void)submitVerificationCode:(id)a3 verificationData:(id)a4 forPassWithUniqueID:(id)a5 handler:(id)a6
{
  databaseManager = self->_databaseManager;
  id v11 = a6;
  id v12 = a4;
  id v13 = a3;
  id v16 = (id)objc_claimAutoreleasedReturnValue(-[PDDatabaseManager passWithUniqueIdentifier:](databaseManager, "passWithUniqueIdentifier:", a5));
  paymentWebServicesCoordinator = self->_paymentWebServicesCoordinator;
  v15 = (void *)objc_claimAutoreleasedReturnValue([v16 paymentPass]);
  -[PDPaymentWebServiceCoordinator submitVerificationCode:verificationData:forPass:handler:]( paymentWebServicesCoordinator,  "submitVerificationCode:verificationData:forPass:handler:",  v13,  v12,  v15,  v11);
}

- (void)openWalletUIWithRelevantPass:(id)a3
{
  id v5 = a3;
  unsigned int v6 = -[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess");
  char v7 = v6;
  if (!v5 || !v6)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if ((v7 & 1) != 0)
    {
      if (!v10) {
        goto LABEL_14;
      }
      id v11 = NSStringFromSelector(a2);
      id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      int v19 = 138412290;
      v20 = v12;
      id v13 = "%@: Relevant unique ID not passed in";
    }

    else
    {
      if (!v10) {
        goto LABEL_14;
      }
      id v14 = NSStringFromSelector(a2);
      id v12 = (void *)objc_claimAutoreleasedReturnValue(v14);
      int v19 = 138412290;
      v20 = v12;
      id v13 = "%@: Not entitled to perform";
    }

    v15 = v9;
    uint32_t v16 = 12;
LABEL_13:
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v19, v16);

    goto LABEL_14;
  }

  if (!-[PDDatabaseManager passExistsWithUniqueID:](self->_databaseManager, "passExistsWithUniqueID:", v5))
  {
    uint64_t v17 = PKLogFacilityTypeGetObject(6LL);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = NSStringFromSelector(a2);
      id v12 = (void *)objc_claimAutoreleasedReturnValue(v18);
      int v19 = 138412546;
      v20 = v12;
      __int16 v21 = 2112;
      id v22 = v5;
      id v13 = "%@: Relevant unique ID does not exist: %@";
      v15 = v9;
      uint32_t v16 = 22;
      goto LABEL_13;
    }

- (void)badgeCountItemsWithCompletion:(id)a3
{
  whitelist = self->_whitelist;
  unsigned int v6 = (void (**)(void))a3;
  if (-[PKEntitlementWhitelist badgeCountItemsAccess](whitelist, "badgeCountItemsAccess"))
  {
    id v11 = (id)objc_claimAutoreleasedReturnValue(-[PDUserNotificationManager badgeCountItems](self->_userNotificationManager, "badgeCountItems"));
    v6[2](v6);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = NSStringFromSelector(a2);
      BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      *(_DWORD *)buf = 138412290;
      id v13 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@: Not entitled to perform", buf, 0xCu);
    }

    ((void (*)(void (**)(void), void *))v6[2])(v6, &__NSArray0__struct);
  }

- (void)openPaymentUIWithCompletion:(id)a3
{
  uint64_t v4 = (void (**)(id, uint64_t))a3;
  uint64_t IsAvailable = PKStoreDemoModeEnabled();
  if ((IsAvailable & 1) != 0 || (uint64_t IsAvailable = PKSecureElementIsAvailable(IsAvailable, v6), !(_DWORD)IsAvailable))
  {
    if (PKIsHandoffClient(IsAvailable)
      && -[PKIDSManager hasRemoteDevices](self->_idsManager, "hasRemoteDevices"))
    {
      __int128 v17 = 0u;
      __int128 v18 = 0u;
      __int128 v15 = 0u;
      __int128 v16 = 0u;
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[PKIDSManager remoteDevices](self->_idsManager, "remoteDevices", 0LL));
      id v10 = [v9 countByEnumeratingWithState:&v15 objects:v21 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v16;
        do
        {
          id v13 = 0LL;
          do
          {
            if (*(void *)v16 != v12) {
              objc_enumerationMutation(v9);
            }
            id v14 =  -[PKIDSManager sendSetupRequest:appDisplayName:completion:]( self->_idsManager,  "sendSetupRequest:appDisplayName:completion:",  *(void *)(*((void *)&v15 + 1) + 8LL * (void)v13),  0LL,  0LL);
            id v13 = (char *)v13 + 1;
          }

          while (v11 != v13);
          id v11 = [v9 countByEnumeratingWithState:&v15 objects:v21 count:16];
        }

        while (v11);
      }

      if (v4) {
        v4[2](v4, 1LL);
      }
    }

    else if (v4)
    {
      v4[2](v4, 0LL);
    }
  }

  else
  {
    char v7 = (void *)objc_claimAutoreleasedReturnValue( -[PDPaymentWebServiceCoordinator sharedWebService]( self->_paymentWebServicesCoordinator,  "sharedWebService"));
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_10004722C;
    v19[3] = &unk_10063C3B0;
    id v8 = v4;
    v19[4] = self;
    v20 = v8;
    +[PKPaymentRegistrationUtilities configureWebServiceIfNecessary:completion:]( &OBJC_CLASS___PKPaymentRegistrationUtilities,  "configureWebServiceIfNecessary:completion:",  v7,  v19);

    if (v8) {
      v8[2](v8, 1LL);
    }
  }
}

- (BOOL)_isConfigurationValid:(id)a3
{
  id v4 = a3;
  id v5 = -[PKEntitlementWhitelist featuresAllAccess](self->_whitelist, "featuresAllAccess");
  if ((_DWORD)v5
    && ((uint64_t v7 = PKIsMac(v5, v6), (v7 & 1) != 0)
     || (PKIsPhone(v7, v8) & 1) != 0
     || (PKIsPad() & 1) != 0
     || (PKIsWatch() & 1) != 0
     || PKIsVision()))
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 signedFields]);
    if (v9 || (id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 signature])) != 0)
    {
    }

    else
    {
      __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v4 originatingURL]);

      if (!v16)
      {
        BOOL v12 = 1;
        goto LABEL_14;
      }
    }

    uint64_t v10 = PKValidatePaymentSetupConfiguration(v4);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    BOOL v12 = v11 == 0LL;
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 v17 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "PKPaymentSetupConfiguration cannot be processed",  v17,  2u);
    }

    BOOL v12 = 0;
  }

- (void)paymentSetupFeaturesForConfiguration:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void))a4;
  uint64_t Object = PKLogFacilityTypeGetObject(6LL);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "PDPassLibrary requesting payment setup features",  buf,  2u);
  }

  if (!v7) {
    goto LABEL_49;
  }
  if (!-[PDPassLibrary _isConfigurationValid:](self, "_isConfigurationValid:", v6)
    || (id v10 = +[PKWalletVisibility isWalletRestricted](&OBJC_CLASS___PKWalletVisibility, "isWalletRestricted"),
        (_DWORD)v10))
  {
LABEL_48:
    v7[2](v7, 0LL);
    goto LABEL_49;
  }

  uint64_t IsAvailable = PKSecureElementIsAvailable(v10, v11);
  if ((_DWORD)IsAvailable)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue( -[PDPaymentWebServiceCoordinator paymentSetupFeaturesCoordinator]( self->_paymentWebServicesCoordinator,  "paymentSetupFeaturesCoordinator"));
    unsigned int v14 = [v6 usePaymentSetupFeaturesFromCDN];
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(-[PKEntitlementWhitelist applicationID](self->_whitelist, "applicationID"));
    if (v14) {
      [v13 staticPaymentSetupFeaturesForSourceApplicationID:v15 completion:v7];
    }
    else {
      [v13 paymentSetupFeaturesForSourceApplicationID:v15 completion:v7];
    }

    goto LABEL_49;
  }

  if (!PKIsHandoffClient(IsAvailable)
    || !-[PKIDSManager hasRemoteDevices](self->_idsManager, "hasRemoteDevices"))
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Not able to return payment setup features",  buf,  2u);
    }

    goto LABEL_48;
  }

  os_log_t oslog = v9;
  v35 = v7;
  id v36 = v6;
  __int128 v16 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[PKIDSManager remoteDevices](self->_idsManager, "remoteDevices"));
  id v39 = [obj countByEnumeratingWithState:&v44 objects:v51 count:16];
  if (v39)
  {
    uint64_t v38 = *(void *)v45;
    do
    {
      for (i = 0LL; i != v39; i = (char *)i + 1)
      {
        if (*(void *)v45 != v38) {
          objc_enumerationMutation(obj);
        }
        __int128 v18 = *(void **)(*((void *)&v44 + 1) + 8LL * (void)i);
        __int128 v40 = 0u;
        __int128 v41 = 0u;
        __int128 v42 = 0u;
        __int128 v43 = 0u;
        int v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "supportedSetupFeatures", oslog));
        id v20 = [v19 countByEnumeratingWithState:&v40 objects:v50 count:16];
        if (v20)
        {
          id v21 = v20;
          uint64_t v22 = *(void *)v41;
          do
          {
            v23 = 0LL;
            do
            {
              if (*(void *)v41 != v22) {
                objc_enumerationMutation(v19);
              }
              v24 = *(void **)(*((void *)&v40 + 1) + 8LL * (void)v23);
              v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v24 type]));
              id v26 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v16, "objectForKey:", v25));
              if (!v26)
              {
                id v26 = v24;
                -[NSMutableDictionary setObject:forKey:](v16, "setObject:forKey:", v26, v25);
              }

              unint64_t v27 = (unint64_t)[v24 state];
              id v28 = [v26 state];
              if (v28 == (id)2)
              {
                if (v27 == 3) {
                  goto LABEL_29;
                }
              }

              else
              {
                if (v28 == (id)1)
                {
                  if ((v27 & 0xFFFFFFFFFFFFFFFELL) != 2) {
                    goto LABEL_30;
                  }
LABEL_29:
                  [v26 setState:v27];
                  goto LABEL_30;
                }

                if (!v28 && v27 - 1 < 3) {
                  goto LABEL_29;
                }
              }

- (void)presentPaymentSetupRequest:(id)a3 orientation:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v8 configuration]);
  if (-[PDPassLibrary _isConfigurationValid:](self, "_isConfigurationValid:", v11))
  {
    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue([v8 paymentSetupFeatures]);
    id v13 = [v12 count];

    if (v13)
    {
      if (PKIsMac(v14, v15))
      {
        -[PDPassLibrary openPaymentUIWithCompletion:](self, "openPaymentUIWithCompletion:", v10);
      }

      else if (PKPassbookIsCurrentlyDeletedByUser())
      {
        uint64_t Object = PKLogFacilityTypeGetObject(6LL);
        int v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Prompting user to install Wallet",  buf,  2u);
        }

        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472LL;
        v20[2] = sub_100047AD4;
        v20[3] = &unk_10063A830;
        id v21 = v10;
        PKShowAlertForWalletUninstalled(v20);
      }

      else
      {
        sub_1001ADA8C((uint64_t)self->_remoteInterfacePresenter, (uint64_t)v8, 0LL, (uint64_t)v9, (uint64_t)v10);
      }

      goto LABEL_9;
    }
  }

  else
  {
  }

  uint64_t v16 = PKLogFacilityTypeGetObject(6LL);
  __int128 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Not able to present payment setup features",  buf,  2u);
  }

  (*((void (**)(id, void))v10 + 2))(v10, 0LL);
LABEL_9:
}

- (void)paymentPassWithAssociatedAccountIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100047BE4;
  v13[3] = &unk_100639AF0;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v10 = v13;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10005DE84;
  block[3] = &unk_10063A830;
  id v17 = v10;
  id v11 = v7;
  id v12 = v6;
  dispatch_async(v9, block);
}

- (void)presentContactlessInterfaceForDefaultPassFromSource:(int64_t)a3 handler:(id)a4
{
  id v6 = a4;
  uint64_t v7 = PDDefaultPaymentPassUniqueIdentifier();
  id v8 = (id)objc_claimAutoreleasedReturnValue(v7);
  -[PDPassLibrary presentContactlessInterfaceForPassWithUniqueIdentifier:fromSource:handler:]( self,  "presentContactlessInterfaceForPassWithUniqueIdentifier:fromSource:handler:",  v8,  a3,  v6);
}

- (void)presentContactlessInterfaceForPassWithUniqueIdentifier:(id)a3 fromSource:(int64_t)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  unsigned int v10 = -[PKEntitlementWhitelist paymentPresentation](self->_whitelist, "paymentPresentation");
  if (v8 && a4 == 4 && !v10)
  {
    if (-[PDPassLibrary _entitledForPassType:uniqueIdentifier:actions:]( self,  "_entitledForPassType:uniqueIdentifier:actions:",  1LL,  v8,  2LL))
    {
LABEL_6:
      remoteInterfacePresenter = self->_remoteInterfacePresenter;
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472LL;
      v14[2] = sub_100047F44;
      v14[3] = &unk_10063B3A0;
      id v15 = v9;
      sub_1001AD804((uint64_t)remoteInterfacePresenter, (uint64_t)v8, a4, (uint64_t)v14);

      goto LABEL_7;
    }
  }

  else if (v10)
  {
    goto LABEL_6;
  }

  uint64_t Object = PKLogFacilityTypeGetObject(6LL);
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v17 = "-[PDPassLibrary presentContactlessInterfaceForPassWithUniqueIdentifier:fromSource:handler:]";
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  buf,  0xCu);
  }

  if (v9) {
    (*((void (**)(id, void))v9 + 2))(v9, 0LL);
  }
LABEL_7:
}

- (void)canPresentPaymentRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
    id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_100048058;
    v11[3] = &unk_10063C450;
    v11[4] = self;
    id v13 = v7;
    id v12 = v6;
    unsigned int v10 = v11;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10005DE84;
    block[3] = &unk_10063A830;
    id v15 = v10;
    dispatch_async(v9, block);
  }
}

- (void)isPaymentPassActivationAvailableWithHandler:(id)a3
{
  if (a3)
  {
    id v5 = a3;
    BOOL v4 = PKSecureElementIsAvailable() != 0;
    (*((void (**)(id, BOOL))a3 + 2))(v5, v4);
  }

- (void)getPassesAndCatalogOfPassTypes:(unint64_t)a3 limitResults:(BOOL)a4 withHandler:(id)a5
{
}

- (void)usingSynchronousProxy:(BOOL)a3 getPassesAndCatalogOfPassTypes:(unint64_t)a4 limitResults:(BOOL)a5 withHandler:(id)a6
{
  BOOL v8 = a3;
  id v10 = a6;
  if (v10)
  {
    if ((-[PKEntitlementWhitelist passesAllAccess](self->_whitelist, "passesAllAccess") & 1) != 0)
    {
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472LL;
      v19[2] = sub_100048D30;
      v19[3] = &unk_10063C478;
      v19[4] = self;
      unint64_t v21 = a4;
      BOOL v22 = a5;
      id v20 = v10;
      id v11 = objc_retainBlock(v19);
      id v12 = v11;
      if (v8)
      {
        ((void (*)(void *))v11[2])(v11);
      }

      else
      {
        id v15 = PDDefaultQueue();
        uint64_t v16 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v15);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_100048DD8;
        block[3] = &unk_10063A830;
        id v18 = v12;
        dispatch_async(v16, block);
      }
    }

    else
    {
      uint64_t Object = PKLogFacilityTypeGetObject(0LL);
      id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v24 = "-[PDPassLibrary usingSynchronousProxy:getPassesAndCatalogOfPassTypes:limitResults:withHandler:]";
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  buf,  0xCu);
      }

      (*((void (**)(id, void, void))v10 + 2))(v10, 0LL, 0LL);
    }
  }
}

- (void)getGroupsControllerSnapshotWithOptions:(id)a3 handler:(id)a4
{
}

- (void)usingSynchronousProxy:(BOOL)a3 getGroupsControllerSnapshotWithOptions:(id)a4 handler:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v9)
  {
    if ((-[PKEntitlementWhitelist passesAllAccess](self->_whitelist, "passesAllAccess") & 1) != 0)
    {
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472LL;
      v18[2] = sub_100048FC0;
      v18[3] = &unk_100639AF0;
      v18[4] = self;
      id v19 = v8;
      id v20 = v9;
      id v10 = objc_retainBlock(v18);
      id v11 = v10;
      if (v6)
      {
        ((void (*)(void *))v10[2])(v10);
      }

      else
      {
        id v14 = PDDefaultQueue();
        id v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v14);
        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3221225472LL;
        v16[2] = sub_100049134;
        v16[3] = &unk_10063A830;
        id v17 = v11;
        dispatch_async(v15, v16);
      }
    }

    else
    {
      uint64_t Object = PKLogFacilityTypeGetObject(0LL);
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        BOOL v22 = "-[PDPassLibrary usingSynchronousProxy:getGroupsControllerSnapshotWithOptions:handler:]";
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  buf,  0xCu);
      }

      (*((void (**)(id, void))v9 + 2))(v9, 0LL);
    }
  }
}

- (void)usingSynchronousProxy:(BOOL)a3 getPaymentPassesPendingActivationWithHandler:(id)a4
{
  BOOL v4 = a3;
  BOOL v6 = (void (**)(id, void *))a4;
  if (v6)
  {
    if ((-[PKEntitlementWhitelist passesAllAccess](self->_whitelist, "passesAllAccess") & 1) != 0)
    {
      if (v4)
      {
        id v7 = objc_autoreleasePoolPush();
        id v8 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager paymentPassesPendingActivation]( self->_databaseManager,  "paymentPassesPendingActivation"));
        id v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDPassLibrary _entitlementFilteredPasses:](self, "_entitlementFilteredPasses:", v8));
        v6[2](v6, v9);

        objc_autoreleasePoolPop(v7);
      }

      else
      {
        id v12 = PDDefaultQueue();
        id v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v12);
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472LL;
        v14[2] = sub_1000492E4;
        v14[3] = &unk_1006396B0;
        void v14[4] = self;
        id v15 = v6;
        dispatch_async(v13, v14);
      }
    }

    else
    {
      uint64_t Object = PKLogFacilityTypeGetObject(0LL);
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        id v17 = "-[PDPassLibrary usingSynchronousProxy:getPaymentPassesPendingActivationWithHandler:]";
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  buf,  0xCu);
      }

      v6[2](v6, 0LL);
    }
  }
}

- (void)sendUserEditedCatalog:(id)a3
{
  id v4 = a3;
  id v5 = (void *)PDOSTransactionCreate("PDPassLibrary");
  id v6 = PDDefaultQueue();
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v6);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100049408;
  block[3] = &unk_100639350;
  id v11 = v5;
  id v12 = self;
  id v13 = v4;
  id v8 = v4;
  id v9 = v5;
  dispatch_async(v7, block);
}

- (void)notifyPassUsedWithIdentifier:(id)a3 fromSource:(int64_t)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000494AC;
  v4[3] = &unk_10063C4A0;
  v4[4] = self;
  v4[5] = a4;
  -[PDPassLibrary _getPassWithUniqueID:handler:](self, "_getPassWithUniqueID:handler:", a3, v4);
}

- (void)getPassWithUniqueID:(id)a3 handler:(id)a4
{
  id v6 = (void (**)(id, void *))a4;
  if (v6)
  {
    id v11 = v6;
    id v7 = a3;
    id v8 = (void *)PDOSTransactionCreate("PDPassLibrary");
    id v9 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager passWithUniqueIdentifier:]( self->_databaseManager,  "passWithUniqueIdentifier:",  v7));

    if (-[PDPassLibrary _entitledForObject:forActions:](self, "_entitledForObject:forActions:", v9, 2LL))
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[PDPassLibrary _sanitizePassIfNeeded:](self, "_sanitizePassIfNeeded:", v9));
      v11[2](v11, v10);
    }

    else
    {
      v11[2](v11, 0LL);
    }

    id v6 = v11;
  }
}

- (void)getPassesWithReaderIdentifier:(id)a3 handler:(id)a4
{
  if (a4)
  {
    id v6 = (void (**)(id, void *))a4;
    id v7 = a3;
    id v10 = (id)PDOSTransactionCreate("PDPassLibrary");
    id v8 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager passesWithPairedReaderIdentifier:]( self->_databaseManager,  "passesWithPairedReaderIdentifier:",  v7));

    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_100049678;
    v11[3] = &unk_10063C4C8;
    v11[4] = self;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "pk_setBySafelyApplyingBlock:", v11));

    v6[2](v6, v9);
  }

- (void)hasRemoteLibraryWithHandler:(id)a3
{
  if (a3) {
    (*((void (**)(id, void))a3 + 2))(a3, 0LL);
  }
}

- (void)inAppPaymentPassesForNetworks:(id)a3 capabilities:(unint64_t)a4 issuerCountryCodes:(id)a5 paymentRequestType:(id)a6 isMultiTokensRequest:(BOOL)a7 withHandler:(id)a8
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a8;
  if (v17)
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
    id v19 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_100049864;
    v21[3] = &unk_10063C518;
    v21[4] = self;
    id v22 = v14;
    unint64_t v26 = a4;
    id v23 = v15;
    id v24 = v16;
    BOOL v27 = a7;
    id v25 = v17;
    id v20 = v21;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10005DE84;
    block[3] = &unk_10063A830;
    id v29 = v20;
    dispatch_async(v19, block);
  }
}

- (void)hasInAppPaymentPassesForNetworks:(id)a3 capabilities:(unint64_t)a4 issuerCountryCodes:(id)a5 paymentRequestType:(id)a6 isMultiTokensRequest:(BOOL)a7 withHandler:(id)a8
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a8;
  if (v17)
  {
    id v18 = PDDefaultQueue();
    id v19 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v18);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100049A7C;
    block[3] = &unk_10063C518;
    void block[4] = self;
    id v21 = v14;
    unint64_t v25 = a4;
    id v22 = v15;
    id v23 = v16;
    BOOL v26 = a7;
    id v24 = v17;
    dispatch_async(v19, block);
  }
}

- (void)hasPassesWithSupportedNetworks:(id)a3 merchantCapabilities:(unint64_t)a4 webDomain:(id)a5 issuerCountryCodes:(id)a6 paymentRequestType:(id)a7 isMultiTokensRequest:(BOOL)a8 completion:(id)a9
{
  if (a9)
  {
    LOBYTE(v9) = a8;
    -[PDPassLibrary _hasPassesWithSupportedNetworks:merchantCapabilities:webDomain:issuerCountryCodes:paymentApplicationStates:paymentRequestType:isMultiTokensRequest:handler:]( self,  "_hasPassesWithSupportedNetworks:merchantCapabilities:webDomain:issuerCountryCodes:paymentApplicationStates:payment RequestType:isMultiTokensRequest:handler:",  a3,  a4,  a5,  a6,  0LL,  a7,  v9,  a9);
  }

- (void)_hasPassesWithSupportedNetworks:(id)a3 merchantCapabilities:(unint64_t)a4 webDomain:(id)a5 issuerCountryCodes:(id)a6 paymentApplicationStates:(id)a7 paymentRequestType:(id)a8 isMultiTokensRequest:(BOOL)a9 handler:(id)a10
{
  id v16 = a3;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a10;
  accountManager = self->_accountManager;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472LL;
  v29[2] = sub_100049DFC;
  v29[3] = &unk_10063C568;
  id v30 = v17;
  id v31 = v18;
  v32 = self;
  id v33 = v16;
  id v36 = v21;
  unint64_t v37 = a4;
  id v34 = v19;
  id v35 = v20;
  BOOL v38 = a9;
  id v23 = v20;
  id v24 = v19;
  id v25 = v16;
  id v26 = v21;
  id v27 = v18;
  id v28 = v17;
  -[PDAccountManager accountsWithCompletion:](accountManager, "accountsWithCompletion:", v29);
}

- (BOOL)_hasPaymentPassesForNetworks:(id)a3 capabilities:(unint64_t)a4 paymentApplicationStates:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  else {
    unsigned int v10 = -[PKEntitlementWhitelist supportsWebPayments](self->_whitelist, "supportsWebPayments");
  }
  if (-[PKEntitlementWhitelist inAppPaymentsPrivate](self->_whitelist, "inAppPaymentsPrivate"))
  {
    databaseManager = self->_databaseManager;
  }

  else
  {
    unsigned int v14 = -[PKEntitlementWhitelist passesAllAccess](self->_whitelist, "passesAllAccess");
    if ((v10 | v14) != 1)
    {
      unsigned __int8 v13 = 0;
      goto LABEL_12;
    }

    unsigned int v15 = v14;
    databaseManager = self->_databaseManager;
    if (!v15)
    {
      id v12 = 0LL;
      goto LABEL_7;
    }
  }

  id v12 = v9;
LABEL_7:
  unsigned __int8 v13 = -[PDDatabaseManager passExistsForNonWebInAppPaymentOnNetworks:withCapabilities:paymentApplicationStates:]( databaseManager,  "passExistsForNonWebInAppPaymentOnNetworks:withCapabilities:paymentApplicationStates:",  v8,  a4,  v12);
LABEL_12:

  return v13;
}

- (void)_passesWithSupportedNetworks:(id)a3 merchantCapabilities:(unint64_t)a4 webDomain:(id)a5 issuerCountryCodes:(id)a6 paymentApplicationStates:(id)a7 paymentRequestType:(id)a8 isMultiTokensRequest:(BOOL)a9 handler:(id)a10
{
  id v16 = a3;
  id v17 = a5;
  BOOL v18 = v17 != 0LL;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_10004A17C;
  v25[3] = &unk_10063C590;
  id v26 = v16;
  id v27 = v17;
  id v28 = self;
  id v29 = a6;
  BOOL v32 = a9;
  id v30 = a7;
  id v31 = a10;
  id v19 = v31;
  id v20 = v30;
  id v21 = v29;
  id v22 = v17;
  id v23 = v16;
  LOBYTE(v24) = a9;
  -[PDPassLibrary _paymentPassesForNetworks:capabilities:issuerCountryCodes:webPayment:paymentApplicationStates:paymentRequestType:isMultiTokensRequest:withHandler:]( self,  "_paymentPassesForNetworks:capabilities:issuerCountryCodes:webPayment:paymentApplicationStates:paymentRequestType:isM ultiTokensRequest:withHandler:",  v23,  a4,  v21,  v18,  v20,  a8,  v24,  v25);
}

- (void)_paymentPassesForNetworks:(id)a3 capabilities:(unint64_t)a4 issuerCountryCodes:(id)a5 webPayment:(BOOL)a6 paymentApplicationStates:(id)a7 paymentRequestType:(id)a8 isMultiTokensRequest:(BOOL)a9 withHandler:(id)a10
{
  BOOL v12 = a6;
  id v16 = a3;
  id v17 = a5;
  id v18 = a7;
  id v34 = a8;
  id v19 = a10;
  uint64_t v38 = 0LL;
  id v39 = &v38;
  uint64_t v40 = 0x3032000000LL;
  __int128 v41 = sub_10004A470;
  __int128 v42 = sub_10004A480;
  id v43 = 0LL;
  else {
    unsigned int v20 = -[PKEntitlementWhitelist supportsWebPayments](self->_whitelist, "supportsWebPayments");
  }
  if ((-[PKEntitlementWhitelist inAppPaymentsPrivate](self->_whitelist, "inAppPaymentsPrivate") & 1) != 0)
  {
    unsigned int v21 = 1;
  }

  else
  {
    unsigned int v21 = -[PKEntitlementWhitelist passesAllAccess](self->_whitelist, "passesAllAccess");
    if ((v20 | v21) != 1) {
      goto LABEL_23;
    }
  }

  databaseManager = self->_databaseManager;
  paymentWebServicesCoordinator = self->_paymentWebServicesCoordinator;
  if (v12)
  {
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( -[PDPaymentWebServiceCoordinator sharedWebService]( paymentWebServicesCoordinator,  "sharedWebService"));
    if (v21) {
      id v25 = v17;
    }
    else {
      id v25 = 0LL;
    }
    if (v21) {
      id v26 = v18;
    }
    else {
      id v26 = 0LL;
    }
    uint64_t v27 = objc_claimAutoreleasedReturnValue( -[PDDatabaseManager passesForWebPaymentOnNetworks:withCapabilities:webService:issuerCountryCodes:paymentApplicationStates:isMultiTokensRequest:]( databaseManager,  "passesForWebPaymentOnNetworks:withCapabilities:webService:issuerCountryCodes:paymentApplicationStates:isMu ltiTokensRequest:",  v16,  a4,  v24,  v25,  v26,  a9));
  }

  else
  {
    uint64_t v28 = objc_claimAutoreleasedReturnValue(-[PDPaymentWebServiceCoordinator sharedWebService](paymentWebServicesCoordinator, "sharedWebService"));
    uint64_t v24 = (void *)v28;
    if (v21) {
      id v29 = v18;
    }
    else {
      id v29 = 0LL;
    }
    if (v21) {
      id v30 = v17;
    }
    else {
      id v30 = 0LL;
    }
    uint64_t v27 = objc_claimAutoreleasedReturnValue( -[PDDatabaseManager passesForNonWebInAppPaymentOnNetworks:withCapabilities:issuerCountryCodes:paymentApplicationStates:paymentRequestType:isMultiTokensRequest:webService:]( databaseManager,  "passesForNonWebInAppPaymentOnNetworks:withCapabilities:issuerCountryCodes:paymentApplicationStates:payment RequestType:isMultiTokensRequest:webService:",  v16,  a4,  v30,  v29,  v34,  a9,  v28));
  }

  id v31 = (void *)v39[5];
  v39[5] = v27;

LABEL_23:
  accountManager = self->_accountManager;
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472LL;
  v35[2] = sub_10004A488;
  v35[3] = &unk_10063C5E0;
  unint64_t v37 = &v38;
  id v33 = v19;
  id v36 = v33;
  -[PDAccountManager accountsWithCompletion:](accountManager, "accountsWithCompletion:", v35);

  _Block_object_dispose(&v38, 8);
}

- (id)_inAppPrivateLabelPaymentPassesForApplicationIdentifier:(id)a3 issuerCountryCodes:(id)a4 paymentApplicationStates:(id)a5 isMultiTokensRequest:(BOOL)a6
{
  BOOL v6 = a6;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (!v11)
  {
    id v11 = (id)objc_claimAutoreleasedReturnValue(-[PDPassLibrary remoteProcessApplicationIdentifier](self, "remoteProcessApplicationIdentifier"));
    if (!v11)
    {
      uint64_t Object = PKLogFacilityTypeGetObject(0LL);
      unsigned int v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        id v16 = NSStringFromSelector(a2);
        id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
        int v29 = 138412546;
        id v30 = v17;
        __int16 v31 = 1024;
        unsigned int v32 = -[PDPassLibrary remoteProcessIdentifier](self, "remoteProcessIdentifier");
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Warning: %@ failed to determine remote application identifier for remote process with pid: %i",  (uint8_t *)&v29,  0x12u);
      }

      id v11 = 0LL;
    }
  }

  else {
    unsigned int v18 = -[PKEntitlementWhitelist supportsWebPayments](self->_whitelist, "supportsWebPayments");
  }
  if ((-[PKEntitlementWhitelist inAppPaymentsPrivate](self->_whitelist, "inAppPaymentsPrivate") & 1) != 0)
  {
    unsigned int v19 = 1;
  }

  else
  {
    unsigned int v19 = -[PKEntitlementWhitelist passesAllAccess](self->_whitelist, "passesAllAccess");
    if ((v18 | v19) != 1)
    {
      uint64_t v27 = 0LL;
      goto LABEL_20;
    }
  }

  databaseManager = self->_databaseManager;
  unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", PKPaymentNetworkPrivateLabel));
  BOOL v22 = v19 == 0;
  if (v19) {
    id v23 = v12;
  }
  else {
    id v23 = 0LL;
  }
  if (v22) {
    id v24 = 0LL;
  }
  else {
    id v24 = v13;
  }
  id v25 = (void *)objc_claimAutoreleasedReturnValue( -[PDPaymentWebServiceCoordinator sharedWebService]( self->_paymentWebServicesCoordinator,  "sharedWebService"));
  id v26 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager passesForInAppPaymentOnNetworks:issuerCountryCodes:paymentApplicationStates:paymentRequestType:isMultiTokensRequest:webService:]( databaseManager,  "passesForInAppPaymentOnNetworks:issuerCountryCodes:paymentApplicationStates:paymentRequestType:isMul tiTokensRequest:webService:",  v21,  v23,  v24,  0LL,  v6,  v25));

  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue( -[PDPassLibrary _filteredPasses:forApplicationIdentifier:]( self,  "_filteredPasses:forApplicationIdentifier:",  v26,  v11));
LABEL_20:

  return v27;
}

- (id)_inAppPrivateLabelPaymentPassesForWebDomain:(id)a3 issuerCountryCodes:(id)a4 paymentApplicationStates:(id)a5 isMultiTokensRequest:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  else {
    unsigned int v13 = -[PKEntitlementWhitelist supportsWebPayments](self->_whitelist, "supportsWebPayments");
  }
  if ((-[PKEntitlementWhitelist inAppPaymentsPrivate](self->_whitelist, "inAppPaymentsPrivate") & 1) != 0)
  {
    unsigned int v14 = 1;
  }

  else
  {
    unsigned int v14 = -[PKEntitlementWhitelist passesAllAccess](self->_whitelist, "passesAllAccess");
    if ((v13 | v14) != 1)
    {
      BOOL v22 = 0LL;
      goto LABEL_15;
    }
  }

  databaseManager = self->_databaseManager;
  id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", PKPaymentNetworkPrivateLabel));
  BOOL v17 = v14 == 0;
  if (v14) {
    id v18 = v11;
  }
  else {
    id v18 = 0LL;
  }
  if (v17) {
    id v19 = 0LL;
  }
  else {
    id v19 = v12;
  }
  unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue( -[PDPaymentWebServiceCoordinator sharedWebService]( self->_paymentWebServicesCoordinator,  "sharedWebService"));
  unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager passesForInAppPaymentOnNetworks:issuerCountryCodes:paymentApplicationStates:paymentRequestType:isMultiTokensRequest:webService:]( databaseManager,  "passesForInAppPaymentOnNetworks:issuerCountryCodes:paymentApplicationStates:paymentRequestType:isMul tiTokensRequest:webService:",  v16,  v18,  v19,  0LL,  v6,  v20));

  BOOL v22 = (void *)objc_claimAutoreleasedReturnValue(-[PDPassLibrary _filteredPasses:forWebDomain:](self, "_filteredPasses:forWebDomain:", v21, v10));
LABEL_15:

  return v22;
}

- (void)inAppPrivateLabelPaymentPassesForApplicationIdentifier:(id)a3 issuerCountryCodes:(id)a4 isMultiTokensRequest:(BOOL)a5 withHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (v12)
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
    unsigned int v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_10004AB5C;
    v16[3] = &unk_10063C608;
    id v19 = v12;
    void v16[4] = self;
    id v17 = v10;
    id v18 = v11;
    BOOL v20 = a5;
    unsigned int v15 = v16;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10005DE84;
    block[3] = &unk_10063A830;
    id v22 = v15;
    dispatch_async(v14, block);
  }
}

- (void)inAppPrivateLabelPaymentPassesForWebDomain:(id)a3 issuerCountryCodes:(id)a4 isMultiTokensRequest:(BOOL)a5 withHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
  unsigned int v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_10004ACE0;
  v19[3] = &unk_10063C608;
  v19[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  BOOL v23 = a5;
  unsigned int v15 = v19;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10005DE84;
  block[3] = &unk_10063A830;
  id v25 = v15;
  id v16 = v11;
  id v17 = v10;
  id v18 = v12;
  dispatch_async(v14, block);
}

- (void)hasInAppPrivateLabelPaymentPassesForApplicationIdentifier:(id)a3 issuerCountryCodes:(id)a4 isMultiTokensRequest:(BOOL)a5 withHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (v12)
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
    unsigned int v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_10004AE64;
    v16[3] = &unk_10063C608;
    id v19 = v12;
    void v16[4] = self;
    id v17 = v10;
    id v18 = v11;
    BOOL v20 = a5;
    unsigned int v15 = v16;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10005DE84;
    block[3] = &unk_10063A830;
    id v22 = v15;
    dispatch_async(v14, block);
  }
}

- (void)hasInAppPrivateLabelPaymentPassesForWebDomain:(id)a3 issuerCountryCodes:(id)a4 isMultiTokensRequest:(BOOL)a5 withHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (v12)
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
    unsigned int v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_10004AFF0;
    v16[3] = &unk_10063C608;
    id v19 = v12;
    void v16[4] = self;
    id v17 = v10;
    id v18 = v11;
    BOOL v20 = a5;
    unsigned int v15 = v16;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10005DE84;
    block[3] = &unk_10063A830;
    id v22 = v15;
    dispatch_async(v14, block);
  }
}

- (void)getPassesWithUniqueIdentifiers:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
    id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10004B148;
    v11[3] = &unk_100639AF0;
    id v12 = v6;
    unsigned int v13 = self;
    id v14 = v7;
    id v10 = v11;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10005DE84;
    block[3] = &unk_10063A830;
    id v16 = v10;
    dispatch_async(v9, block);
  }
}

- (void)unexpiredPassesOrderedByGroup:(id)a3
{
  if (a3)
  {
    databaseManager = self->_databaseManager;
    id v4 = (void (**)(id, id))a3;
    id v5 = (id)objc_claimAutoreleasedReturnValue(-[PDDatabaseManager unexpiredPassesOrderedByGroup](databaseManager, "unexpiredPassesOrderedByGroup"));
    v4[2](v4, v5);
  }

- (void)getPassesWithSearchableTransactions:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_10004B40C;
    v14[3] = &unk_10063C658;
    dispatch_group_t v15 = dispatch_group_create();
    id v16 = self;
    id v6 = v5;
    id v17 = v6;
    id v7 = v15;
    -[PDPassLibrary getPassesOfType:handler:](self, "getPassesOfType:handler:", 1LL, v14);
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
    id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10004B5BC;
    v11[3] = &unk_100639AF0;
    void v11[4] = self;
    id v12 = v6;
    id v13 = v4;
    id v10 = v6;
    dispatch_group_notify(v7, v9, v11);
  }
}

- (void)getPassUniqueIDsForAssociatedApplicationIdentifier:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if ((-[PKEntitlementWhitelist passesAllAccess](self->_whitelist, "passesAllAccess") & 1) != 0)
    {
      dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
      id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472LL;
      v13[2] = sub_10004B7BC;
      v13[3] = &unk_100639AF0;
      v13[4] = self;
      id v14 = v6;
      id v15 = v7;
      id v10 = v13;
      *(void *)&__int128 block = _NSConcreteStackBlock;
      *((void *)&block + 1) = 3221225472LL;
      id v17 = sub_10005DE84;
      id v18 = &unk_10063A830;
      id v19 = v10;
      dispatch_async(v9, &block);
    }

    else
    {
      uint64_t Object = PKLogFacilityTypeGetObject(0LL);
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(block) = 136315138;
        *(void *)((char *)&block + 4) = "-[PDPassLibrary getPassUniqueIDsForAssociatedApplicationIdentifier:handler:]";
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  (uint8_t *)&block,  0xCu);
      }

      (*((void (**)(id, void))v7 + 2))(v7, 0LL);
    }
  }
}

- (void)getMetadataForFieldWithProperties:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(25LL, 0LL);
    id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10004BBC4;
    v11[3] = &unk_100639AF0;
    void v11[4] = self;
    id v12 = v6;
    id v13 = v7;
    id v10 = v11;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10005DE84;
    block[3] = &unk_10063A830;
    id v15 = v10;
    dispatch_async(v9, block);
  }
}

- (void)usingSynchronousProxy:(BOOL)a3 getManifestHashForPassWithUniqueID:(id)a4 handler:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, void *))a5;
  if (v9)
  {
    if ((-[PKEntitlementWhitelist passesAllAccess](self->_whitelist, "passesAllAccess") & 1) != 0)
    {
      if (v6)
      {
        id v10 = objc_autoreleasePoolPush();
        id v11 = (void *)objc_claimAutoreleasedReturnValue(-[PDCardFileManager objectWithUniqueID:](self->_cardFileManager, "objectWithUniqueID:", v8));
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 dataAccessor]);
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 manifestHash]);
        v9[2](v9, v13);

        objc_autoreleasePoolPop(v10);
      }

      else
      {
        id v16 = PDDefaultQueue();
        id v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v16);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_10004BE44;
        block[3] = &unk_10063C6A8;
        BOOL v20 = v9;
        void block[4] = self;
        id v19 = v8;
        dispatch_async(v17, block);
      }
    }

    else
    {
      uint64_t Object = PKLogFacilityTypeGetObject(0LL);
      id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        id v22 = "-[PDPassLibrary usingSynchronousProxy:getManifestHashForPassWithUniqueID:handler:]";
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  buf,  0xCu);
      }

      v9[2](v9, 0LL);
    }
  }
}

- (void)enabledValueAddedServicePassesWithHandler:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
    BOOL v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10004BF98;
    v8[3] = &unk_10063AC90;
    v8[4] = self;
    id v9 = v4;
    id v7 = v8;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10005DE84;
    block[3] = &unk_10063A830;
    id v11 = v7;
    dispatch_async(v6, block);
  }
}

- (id)_filteredPasses:(id)a3 forWebDomain:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10004C0B8;
  v8[3] = &unk_10063C6D0;
  v8[4] = self;
  id v9 = a4;
  id v5 = v9;
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([a3 objectsPassingTest:v8]);

  return v6;
}

- (id)_filteredPasses:(id)a3 forApplicationIdentifier:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10004C1D4;
  v8[3] = &unk_10063C6D0;
  v8[4] = self;
  id v9 = a4;
  id v5 = v9;
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([a3 objectsPassingTest:v8]);

  return v6;
}

- (void)hasPassesOfType:(unint64_t)a3 handler:(id)a4
{
  if (a4)
  {
    databaseManager = self->_databaseManager;
    BOOL v6 = (void (**)(id, id))a4;
    v6[2](v6, (id)-[PDDatabaseManager passExistsWithPassType:](databaseManager, "passExistsWithPassType:", a3));
  }

- (void)hasPassesInExpiredSectionWithHandler:(id)a3
{
  id v4 = (void (**)(id, BOOL))a3;
  if (v4)
  {
    BOOL v6 = v4;
    else {
      BOOL v5 = 0LL;
    }
    v6[2](v6, v5);
    id v4 = v6;
  }
}

- (void)canAddPassesOfType:(unint64_t)a3 handler:(id)a4
{
  BOOL v6 = (void (**)(id, void))a4;
  if (PKStoreDemoModeEnabled())
  {
    if (v6) {
      v6[2](v6, 0LL);
    }
    goto LABEL_37;
  }

  if (a3 == 1)
  {
    unint64_t v8 = -[PDDatabaseManager countActiveSecureElementPasses](self->_databaseManager, "countActiveSecureElementPasses");
    uint64_t v9 = PKDisableDynamicSEAllocation();
    if ((_DWORD)v9)
    {
      uint64_t v9 = PKMaxPaymentCards();
      uint64_t v11 = v9;
      BOOL v12 = v9 - 1 < v8;
    }

    else
    {
      BOOL v12 = 0;
      uint64_t v11 = -1LL;
    }

    int IsAvailable = PKSecureElementIsAvailable(v9, v10);
    unsigned int v14 = +[PKSecureElement isInFailForward](&OBJC_CLASS___PKSecureElement, "isInFailForward");
    int v15 = PKIsSRD();
    int v16 = PKIsBeneficiaryAccount();
    int v17 = v16;
    if (IsAvailable) {
      int v18 = v15;
    }
    else {
      int v18 = 1;
    }
    int v19 = v18 | v12 | v16 | v14;
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      id v22 = @"YES";
      int v27 = 138544898;
      if (v19) {
        BOOL v23 = @"NO";
      }
      else {
        BOOL v23 = @"YES";
      }
      uint64_t v28 = v23;
      __int16 v29 = 2050;
      uint64_t v30 = v11;
      if (IsAvailable) {
        id v24 = @"YES";
      }
      else {
        id v24 = @"NO";
      }
      __int16 v31 = 2048;
      if (v14) {
        id v25 = @"YES";
      }
      else {
        id v25 = @"NO";
      }
      unint64_t v32 = v8;
      __int16 v33 = 2114;
      if (v15) {
        id v26 = @"YES";
      }
      else {
        id v26 = @"NO";
      }
      id v34 = v24;
      if (!v17) {
        id v22 = @"NO";
      }
      __int16 v35 = 2114;
      id v36 = v25;
      __int16 v37 = 2114;
      uint64_t v38 = v26;
      __int16 v39 = 2114;
      uint64_t v40 = v22;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "canAddPass: %{public}@ with maxCards: %{public}ld, passCount: %ld - seAvailable: %{public}@, isInFailForward: %{ public}@ isSRD: %{public}@ isBeneficiaryAccount: %{public}@",  (uint8_t *)&v27,  0x48u);
    }

    if (v6)
    {
      uint64_t v7 = v19 ^ 1u;
      goto LABEL_36;
    }
  }

  else
  {
    if (!a3)
    {
      if (!v6) {
        goto LABEL_37;
      }
      uint64_t v7 = (+[PKWalletVisibility isWalletVisible](&OBJC_CLASS___PKWalletVisibility, "isWalletVisible") & 1) != 0
        || PKPassbookIsCurrentlyDeletedByUser() != 0;
LABEL_36:
      v6[2](v6, v7);
      goto LABEL_37;
    }

    if (v6) {
      v6[2](v6, 1LL);
    }
  }

- (void)countPassesOfType:(unint64_t)a3 handler:(id)a4
{
  uint64_t v7 = (void (**)(id, unint64_t))a4;
  if (v7)
  {
    if ((-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess") & 1) != 0
      || (-[PKEntitlementWhitelist passesOverviewAccess](self->_whitelist, "passesOverviewAccess") & 1) != 0
      || -[PKEntitlementWhitelist passesAllAccess](self->_whitelist, "passesAllAccess"))
    {
      v7[2](v7, -[PDDatabaseManager countPassesOfType:](self->_databaseManager, "countPassesOfType:", a3));
    }

    else
    {
      uint64_t Object = PKLogFacilityTypeGetObject(0LL);
      uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = NSStringFromSelector(a2);
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
        int v12 = 138412290;
        id v13 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Notice: not entitled for %@",  (uint8_t *)&v12,  0xCu);
      }

      v7[2](v7, 0LL);
    }
  }
}

- (void)defaultPaymentPassWithHandler:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
    BOOL v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10004C78C;
    v8[3] = &unk_10063AC90;
    v8[4] = self;
    id v9 = v4;
    uint64_t v7 = v8;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10005DE84;
    block[3] = &unk_10063A830;
    id v11 = v7;
    dispatch_async(v6, block);
  }
}

- (void)peerPaymentPassUniqueIDWithHandler:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  if (v4)
  {
    if (-[PKEntitlementWhitelist passesAllAccess](self->_whitelist, "passesAllAccess"))
    {
      BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDDatabaseManager peerPaymentAccount](self->_databaseManager, "peerPaymentAccount"));
      BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v5 associatedPassUniqueID]);
      v4[2](v4, v6);
    }

    else
    {
      uint64_t Object = PKLogFacilityTypeGetObject(0LL);
      unint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_10044146C();
      }

      v4[2](v4, 0LL);
    }
  }
}

- (void)expressTransitPassWithHandler:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
    BOOL v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10004C9E4;
    v8[3] = &unk_10063AC90;
    v8[4] = self;
    id v9 = v4;
    uint64_t v7 = v8;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10005DE84;
    block[3] = &unk_10063A830;
    id v11 = v7;
    dispatch_async(v6, block);
  }
}

- (void)sortedTransitPassesForTransitNetworkIdentifiers:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
    BOOL v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10004CC00;
    v8[3] = &unk_10063AC90;
    v8[4] = self;
    id v9 = v4;
    uint64_t v7 = v8;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10005DE84;
    block[3] = &unk_10063A830;
    id v11 = v7;
    dispatch_async(v6, block);
  }
}

- (void)sortedTransitPassesForAppletDataFormat:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
    id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10004D5C8;
    v11[3] = &unk_100639AF0;
    void v11[4] = self;
    id v12 = v6;
    id v13 = v7;
    uint64_t v10 = v11;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10005DE84;
    block[3] = &unk_10063A830;
    id v15 = v10;
    dispatch_async(v9, block);
  }
}

- (void)usingSynchronousProxy:(BOOL)a3 getEncryptedServiceProviderDataForUniqueID:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if (v8)
  {
    if (v7
      && [v7 length]
      && -[PDPassLibrary _entitledForUniqueID:forActions:](self, "_entitledForUniqueID:forActions:", v7, 2LL))
    {
      if ((-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess") & 1) != 0)
      {
LABEL_6:
        id v9 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager passWithUniqueIdentifier:]( self->_databaseManager,  "passWithUniqueIdentifier:",  v7));
        if ([v9 passType] == (id)1)
        {
          id v22 = (void *)objc_claimAutoreleasedReturnValue([v9 secureElementPass]);
          id v10 = objc_alloc_init(&OBJC_CLASS___PKAsyncUnaryOperationComposer);
          *(void *)&__int128 buf = 0LL;
          *((void *)&buf + 1) = &buf;
          uint64_t v45 = 0x3032000000LL;
          __int128 v46 = sub_10004A470;
          __int128 v47 = sub_10004A480;
          id v48 = 0LL;
          v42[0] = 0LL;
          v42[1] = v42;
          v42[2] = 0x3032000000LL;
          v42[3] = sub_10004A470;
          v42[4] = sub_10004A480;
          id v43 = 0LL;
          v40[0] = 0LL;
          v40[1] = v40;
          v40[2] = 0x3032000000LL;
          v40[3] = sub_10004A470;
          v40[4] = sub_10004A480;
          id v41 = 0LL;
          v38[0] = 0LL;
          v38[1] = v38;
          v38[2] = 0x3032000000LL;
          v38[3] = sub_10004A470;
          v38[4] = sub_10004A480;
          id v39 = 0LL;
          v33[0] = _NSConcreteStackBlock;
          v33[1] = 3221225472LL;
          v33[2] = sub_10004E1BC;
          v33[3] = &unk_10063C810;
          v33[4] = self;
          id v34 = v9;
          p___int128 buf = &buf;
          id v36 = v40;
          __int16 v37 = v42;
          [v10 addOperation:v33];
          v27[0] = _NSConcreteStackBlock;
          v27[1] = 3221225472LL;
          v27[2] = sub_10004E7E0;
          v27[3] = &unk_10063C860;
          v27[4] = self;
          id v11 = v22;
          id v28 = v11;
          __int16 v29 = v40;
          uint64_t v30 = v42;
          __int16 v31 = v38;
          unint64_t v32 = &buf;
          [v10 addOperation:v27];
          id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
          v23[0] = _NSConcreteStackBlock;
          v23[1] = 3221225472LL;
          v23[2] = sub_10004EA30;
          v23[3] = &unk_10063C888;
          id v25 = &buf;
          id v24 = v8;
          id v26 = v38;
          id v13 = [v10 evaluateWithInput:v12 completion:v23];

          _Block_object_dispose(v38, 8);
          _Block_object_dispose(v40, 8);

          _Block_object_dispose(v42, 8);
          _Block_object_dispose(&buf, 8);
        }

        else
        {
          uint64_t Object = PKLogFacilityTypeGetObject(0LL);
          id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(buf) = 138412290;
            *(void *)((char *)&buf + 4) = v7;
            _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Pass for unique ID %@ wasn't a secure element pass",  (uint8_t *)&buf,  0xCu);
          }

          id v11 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKPassKitErrorDomain,  -1LL,  0LL));
          (*((void (**)(id, void, id))v8 + 2))(v8, 0LL, v11);
        }

        goto LABEL_23;
      }

      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDPassLibrary remoteProcessApplicationInfo](self, "remoteProcessApplicationInfo"));
      if ([v9 isRunning] && (objc_msgSend(v9, "isVisible") & 1) != 0)
      {

        goto LABEL_6;
      }

      uint64_t v17 = PKLogFacilityTypeGetObject(0LL);
      int v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 136315138;
        *(void *)((char *)&buf + 4) = "-[PDPassLibrary usingSynchronousProxy:getEncryptedServiceProviderDataForUniqueID:completion:]";
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "%s requires the client to be running in the foreground",  (uint8_t *)&buf,  0xCu);
      }

      int v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKPassKitErrorDomain,  -1LL,  0LL));
      (*((void (**)(id, void, void *))v8 + 2))(v8, 0LL, v19);
    }

    else
    {
      uint64_t v14 = PKLogFacilityTypeGetObject(0LL);
      id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 136315138;
        *(void *)((char *)&buf + 4) = "-[PDPassLibrary usingSynchronousProxy:getEncryptedServiceProviderDataForUniqueID:completion:]";
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  (uint8_t *)&buf,  0xCu);
      }

      id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKPassKitErrorDomain,  4LL,  0LL));
      (*((void (**)(id, void, void *))v8 + 2))(v8, 0LL, v9);
    }
  }

  else
  {
    uint64_t v16 = PKLogFacilityTypeGetObject(0LL);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "-[PDPassLibrary usingSynchronousProxy:getEncryptedServiceProviderDataForUniqueID:completion:]";
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v9,  OS_LOG_TYPE_DEFAULT,  "%s requires a completion",  (uint8_t *)&buf,  0xCu);
    }
  }

- (void)usingSynchronousProxy:(BOOL)a3 getServiceProviderDataForUniqueID:(id)a4 completion:(id)a5
{
  id v7 = (char *)a4;
  id v8 = (void (**)(id, void, void *))a5;
  if (v8)
  {
    if (v7
      && [v7 length]
      && -[PDPassLibrary _entitledForUniqueID:forActions:](self, "_entitledForUniqueID:forActions:", v7, 2LL))
    {
      if ((-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess") & 1) == 0)
      {
        id v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDPassLibrary remoteProcessApplicationInfo](self, "remoteProcessApplicationInfo"));
        if (![v9 isRunning] || (objc_msgSend(v9, "isVisible") & 1) == 0)
        {
          uint64_t Object = PKLogFacilityTypeGetObject(0LL);
          uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            int v18 = 136315138;
            int v19 = "-[PDPassLibrary usingSynchronousProxy:getServiceProviderDataForUniqueID:completion:]";
            id v15 = "%s requires the client to be running in the foreground";
LABEL_20:
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v18, 0xCu);
          }

- (void)_getEncryptedServiceProviderDataForSecureElementPass:(id)a3 publicKey:(id)a4 scheme:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = (void (**)(id, void, os_log_s *))a6;
  if (v12)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(12LL);
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Cannot retrieve service provider data on this platform",  (uint8_t *)&v17,  2u);
    }

    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKPassKitErrorDomain,  -1LL,  0LL));
    v12[2](v12, 0LL, v15);
  }

  else
  {
    uint64_t v16 = PKLogFacilityTypeGetObject(6LL);
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 136315138;
      int v18 = "-[PDPassLibrary _getEncryptedServiceProviderDataForSecureElementPass:publicKey:scheme:completion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "%s requires a completion",  (uint8_t *)&v17,  0xCu);
    }
  }
}

- (void)_getServiceProviderDataForPass:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, void, os_log_s *))a4;
  if (v6)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(12LL);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Cannot retrieve service provider data on this platform",  (uint8_t *)&v11,  2u);
    }

    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKPassKitErrorDomain,  -1LL,  0LL));
    v6[2](v6, 0LL, v9);
  }

  else
  {
    uint64_t v10 = PKLogFacilityTypeGetObject(6LL);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315138;
      uint64_t v12 = "-[PDPassLibrary _getServiceProviderDataForPass:completion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s requires a completion",  (uint8_t *)&v11,  0xCu);
    }
  }
}

- (void)checkForTransitNotification
{
  if (-[PKEntitlementWhitelist passesAllAccess](self->_whitelist, "passesAllAccess"))
  {
    id v3 = PDDefaultQueue();
    id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v3);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10004F1B0;
    block[3] = &unk_100639300;
    void block[4] = self;
    dispatch_async(v4, block);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(0LL);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100441498();
    }
  }

- (void)postUpgradedPassNotificationForMarket:(id)a3 passUniqueID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[PKEntitlementWhitelist passesAllAccess](self->_whitelist, "passesAllAccess"))
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_10004F2D4;
    v10[3] = &unk_10063C8B0;
    v10[4] = self;
    id v11 = v6;
    id v12 = v7;
    -[PDPassLibrary _getPassWithUniqueID:handler:](self, "_getPassWithUniqueID:handler:", v12, v10);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(0LL);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1004414C4();
    }
  }
}

- (void)usingSynchronousProxy:(BOOL)a3 postUpgradesAvailableNotificationForMarket:(id)a4 passUniqueID:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v6)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(0LL);
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "postUpgradesAvailableNotificationForMarket:passUniqueID: does not currently support sync",  buf,  2u);
    }

- (void)passWithFPANIdentifier:(id)a3 handler:(id)a4
{
  id v9 = a3;
  BOOL v6 = (void (**)(id, void *))a4;
  if (v6)
  {
    if (-[PKEntitlementWhitelist passesAllAccess](self->_whitelist, "passesAllAccess"))
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager passWithPrimaryAccountIdentifier:]( self->_databaseManager,  "passWithPrimaryAccountIdentifier:",  v9));
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 paymentPass]);

      v6[2](v6, v8);
    }

    else
    {
      v6[2](v6, 0LL);
    }
  }
}

- (void)passWithDPANIdentifier:(id)a3 handler:(id)a4
{
  id v10 = a3;
  BOOL v6 = (void (**)(id, void *))a4;
  if (v6)
  {
    if (-[PKEntitlementWhitelist passesAllAccess](self->_whitelist, "passesAllAccess"))
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager paymentApplicationWithDPANIdentifier:]( self->_databaseManager,  "paymentApplicationWithDPANIdentifier:",  v10));
      if (v7)
      {
        id v8 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager passWithPaymentApplication:]( self->_databaseManager,  "passWithPaymentApplication:",  v7));
        id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 paymentPass]);
      }

      else
      {
        id v9 = 0LL;
      }

      v6[2](v6, v9);
    }

    else
    {
      v6[2](v6, 0LL);
    }
  }
}

- (void)isRemovingPassesOfType:(unint64_t)a3 handler:(id)a4
{
  BOOL v6 = (void (**)(id, id))a4;
  if (v6)
  {
    id v9 = v6;
    else {
      BOOL v7 = 0;
    }
    if (v7) {
      id v8 = -[PKSecureElement isDeletingAllApplets](self->_secureElement, "isDeletingAllApplets");
    }
    else {
      id v8 = 0LL;
    }
    v9[2](v9, v8);
    BOOL v6 = v9;
  }
}

- (void)hasSecureElementPassesOfType:(int64_t)a3 handler:(id)a4
{
  BOOL v6 = (void (**)(id, BOOL))a4;
  if (v6)
  {
    id v8 = v6;
    if (-[PKEntitlementWhitelist passesAllAccess](self->_whitelist, "passesAllAccess")) {
      BOOL v7 = -[PDDatabaseManager hasSecureElementPassesOfType:]( self->_databaseManager,  "hasSecureElementPassesOfType:",  a3);
    }
    else {
      BOOL v7 = 0LL;
    }
    v8[2](v8, v7);
    BOOL v6 = v8;
  }
}

- (void)isPassbookVisibleWithHandler:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    (*((void (**)(id, id))a3 + 2))( v4,  +[PKWalletVisibility isWalletVisible](&OBJC_CLASS___PKWalletVisibility, "isWalletVisible"));
  }

- (void)passbookHasBeenDeletedWithHandler:(id)a3
{
  if (a3)
  {
    id v5 = a3;
    BOOL v4 = PKPassbookIsCurrentlyDeletedByUser() != 0;
    (*((void (**)(id, BOOL))a3 + 2))(v5, v4);
  }

- (void)iPadSupportsPasses:(id)a3
{
  if (a3)
  {
    paymentWebServicesCoordinator = self->_paymentWebServicesCoordinator;
    BOOL v4 = (void (**)(id, id))a3;
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDPaymentWebServiceCoordinator sharedWebService](paymentWebServicesCoordinator, "sharedWebService"));
    id v6 = (id)objc_claimAutoreleasedReturnValue([v5 _appleAccountInformation]);

    v4[2](v4, [v6 aidaAccountAvailable]);
  }

- (void)getArchivedObjectWithUniqueID:(id)a3 handler:(id)a4
{
  id v11 = a3;
  id v6 = (void (**)(id, void *))a4;
  if (v6)
  {
    BOOL v7 = (void *)PDOSTransactionCreate("PDPassLibrary");
    id v8 = objc_autoreleasePoolPush();
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDCardFileManager objectWithUniqueID:](self->_cardFileManager, "objectWithUniqueID:", v11));
    if (-[PDPassLibrary _entitledForObject:forActions:](self, "_entitledForObject:forActions:", v9, 2LL))
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 archiveData]);
      v6[2](v6, v10);
    }

    else
    {
      v6[2](v6, 0LL);
    }

    objc_autoreleasePoolPop(v8);
  }
}

- (void)getDataForBundleResourceNamed:(id)a3 withExtension:(id)a4 objectUniqueIdentifier:(id)a5 handler:(id)a6
{
  id v17 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = (void (**)(id, void *))a6;
  if (v12)
  {
    id v13 = objc_autoreleasePoolPush();
    if (-[PDPassLibrary _entitledForUniqueID:forActions:](self, "_entitledForUniqueID:forActions:", v11, 2LL))
    {
      id v14 = (void *)PDOSTransactionCreate("PDPassLibrary");
      id v15 = (void *)objc_claimAutoreleasedReturnValue( -[PDCardFileManager dataAccessorForObjectWithUniqueID:]( self->_cardFileManager,  "dataAccessorForObjectWithUniqueID:",  v11));
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 dataForBundleResourceNamed:v17 withExtension:v10]);
      v12[2](v12, v16);
    }

    else
    {
      v12[2](v12, 0LL);
    }

    objc_autoreleasePoolPop(v13);
  }
}

- (void)getDataForBundleResources:(id)a3 objectUniqueIdentifier:(id)a4 handler:(id)a5
{
  id v14 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, void *))a5;
  if (v9)
  {
    id v10 = objc_autoreleasePoolPush();
    if (-[PDPassLibrary _entitledForUniqueID:forActions:](self, "_entitledForUniqueID:forActions:", v8, 2LL))
    {
      id v11 = (void *)PDOSTransactionCreate("PDPassLibrary");
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( -[PDCardFileManager dataAccessorForObjectWithUniqueID:]( self->_cardFileManager,  "dataAccessorForObjectWithUniqueID:",  v8));
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 dataForBundleResources:v14]);
      v9[2](v9, v13);
    }

    else
    {
      v9[2](v9, 0LL);
    }

    objc_autoreleasePoolPop(v10);
  }
}

- (void)usingSynchronousProxy:(BOOL)a3 passLocalizedStringForKey:(id)a4 uniqueID:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = (void (**)(id, void *))a6;
  if (v12)
  {
    if (!a3)
    {
      uint64_t Object = PKLogFacilityTypeGetObject(0LL);
      id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v17[0] = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "passLocalizedStringForKey does not currently support async",  (uint8_t *)v17,  2u);
      }
    }

    if (-[PDPassLibrary _entitledForUniqueID:forActions:](self, "_entitledForUniqueID:forActions:", v11, 2LL))
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue( -[PDCardFileManager dataAccessorForObjectWithUniqueID:]( self->_cardFileManager,  "dataAccessorForObjectWithUniqueID:",  v11));
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 passLocalizedStringForKey:v10]);
      v12[2](v12, v16);
    }

    else
    {
      v12[2](v12, 0LL);
    }
  }
}

- (void)getPassWithPassTypeID:(id)a3 serialNumber:(id)a4 handler:(id)a5
{
  id v8 = (void (**)(id, void *))a5;
  if (v8)
  {
    id v11 = v8;
    id v9 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager passWithPassTypeID:serialNumber:]( self->_databaseManager,  "passWithPassTypeID:serialNumber:",  a3,  a4));
    if (-[PDPassLibrary _entitledForObject:forActions:](self, "_entitledForObject:forActions:", v9, 2LL))
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[PDPassLibrary _sanitizePassIfNeeded:](self, "_sanitizePassIfNeeded:", v9));
      v11[2](v11, v10);
    }

    else
    {
      v11[2](v11, 0LL);
    }

    id v8 = v11;
  }
}

- (void)getManifestHashAndSettingsForPassTypeID:(id)a3 serialNumber:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
    uint64_t v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_10005009C;
    v14[3] = &unk_10063B440;
    void v14[4] = self;
    id v15 = v8;
    id v16 = v9;
    id v17 = v10;
    id v13 = v14;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10005DE84;
    block[3] = &unk_10063A830;
    id v19 = v13;
    dispatch_async(v12, block);
  }
}

- (void)replacePassWithPassData:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = PDDefaultQueue();
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000502D0;
  block[3] = &unk_100639AF0;
  id v13 = v6;
  id v14 = self;
  id v15 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);
}

- (void)_queue_replacePass:(id)a3 handler:(id)a4
{
  id v13 = a3;
  id v6 = (void (**)(id, BOOL))a4;
  id v7 = PDDefaultQueue();
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v7);
  dispatch_assert_queue_V2(v8);

  id v9 = objc_autoreleasePoolPush();
  if (v13 && -[PDPassLibrary _entitledForObject:forActions:](self, "_entitledForObject:forActions:", v13, 4LL))
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v13 passTypeIdentifier]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v13 serialNumber]);
    if (-[PDDatabaseManager passExistsWithPassTypeID:serialNumber:]( self->_databaseManager,  "passExistsWithPassTypeID:serialNumber:",  v10,  v11))
    {
      BOOL v12 = -[PDCardFileManager writeCard:source:error:]( self->_cardFileManager,  "writeCard:source:error:",  v13,  4LL,  0LL);
    }

    else
    {
      BOOL v12 = 0LL;
    }
  }

  else
  {
    BOOL v12 = 0LL;
  }

  objc_autoreleasePoolPop(v9);
  if (v6) {
    v6[2](v6, v12);
  }
}

- (void)getContentForUniqueID:(id)a3 handler:(id)a4
{
}

- (void)usingSynchronousProxy:(BOOL)a3 getContentForUniqueID:(id)a4 withHandler:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, void *))a5;
  if (v9)
  {
    if (-[PDPassLibrary _entitledForUniqueID:forActions:](self, "_entitledForUniqueID:forActions:", v8, 2LL))
    {
      if (v6)
      {
        id v10 = (void *)PDOSTransactionCreate("PDPassLibrary");
        id v11 = objc_autoreleasePoolPush();
        BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(-[PDCardFileManager contentForUniqueID:](self->_cardFileManager, "contentForUniqueID:", v8));
        v9[2](v9, v12);

        objc_autoreleasePoolPop(v11);
        goto LABEL_8;
      }

      cardFileManager = self->_cardFileManager;
      if (cardFileManager)
      {
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472LL;
        v14[2] = sub_100050580;
        v14[3] = &unk_10063C8D8;
        id v15 = v9;
        -[PDCardFileManager fetchContentForUniqueID:withCompletion:]( cardFileManager,  "fetchContentForUniqueID:withCompletion:",  v8,  v14);

        goto LABEL_8;
      }
    }

    v9[2](v9, 0LL);
  }

- (void)usingSynchronousProxy:(BOOL)a3 getCachedImageSetContainerForUniqueID:(id)a4 type:(int64_t)a5 withDisplayProfile:(id)a6 displayTraits:(id)a7 handler:(id)a8
{
  BOOL v12 = a3;
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  id v17 = (void (**)(id, void *))a8;
  if (v17)
  {
    if (v16 && -[PDPassLibrary _entitledForUniqueID:forActions:](self, "_entitledForUniqueID:forActions:", v14, 2LL))
    {
      if (v12)
      {
        int v18 = (void *)PDOSTransactionCreate("PDPassLibrary");
        id v19 = objc_autoreleasePoolPush();
        BOOL v20 = (void *)objc_claimAutoreleasedReturnValue( -[PDCardFileManager cachedImageSetContainerForUniqueID:type:withDisplayProfile:displayTraits:]( self->_cardFileManager,  "cachedImageSetContainerForUniqueID:type:withDisplayProfile:displayTraits:",  v14,  a5,  v15,  v16));
        v17[2](v17, v20);

        objc_autoreleasePoolPop(v19);
      }

      else
      {
        cardFileManager = self->_cardFileManager;
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472LL;
        v22[2] = sub_100050708;
        v22[3] = &unk_10063C900;
        BOOL v23 = v17;
        -[PDCardFileManager fetchCachedImageSetContainerForUniqueID:type:withDisplayProfile:displayTraits:completion:]( cardFileManager,  "fetchCachedImageSetContainerForUniqueID:type:withDisplayProfile:displayTraits:completion:",  v14,  a5,  v15,  v16,  v22);
      }
    }

    else
    {
      v17[2](v17, 0LL);
    }
  }
}

- (void)getImageSetForUniqueID:(id)a3 ofType:(int64_t)a4 displayProfile:(id)a5 suffix:(id)a6 handler:(id)a7
{
  id v12 = a7;
  id v13 = v12;
  if (v12)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_100050800;
    v14[3] = &unk_10063C900;
    id v15 = v12;
    -[PDPassLibrary usingSynchronousProxy:getImageSetContainerForUniqueID:type:withDisplayProfile:suffix:handler:]( self,  "usingSynchronousProxy:getImageSetContainerForUniqueID:type:withDisplayProfile:suffix:handler:",  0LL,  a3,  a4,  a5,  a6,  v14);
  }
}

- (void)usingSynchronousProxy:(BOOL)a3 getImageSetContainerForUniqueID:(id)a4 type:(int64_t)a5 withDisplayProfile:(id)a6 suffix:(id)a7 handler:(id)a8
{
  BOOL v12 = a3;
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  id v17 = (void (**)(id, void *))a8;
  if (v17)
  {
    if (-[PDPassLibrary _entitledForUniqueID:forActions:](self, "_entitledForUniqueID:forActions:", v14, 2LL))
    {
      if (v12)
      {
        int v18 = (void *)PDOSTransactionCreate("PDPassLibrary");
        id v19 = objc_autoreleasePoolPush();
        BOOL v20 = (void *)objc_claimAutoreleasedReturnValue( -[PDCardFileManager imageSetContainerForUniqueID:ofType:withDisplayProfile:suffix:]( self->_cardFileManager,  "imageSetContainerForUniqueID:ofType:withDisplayProfile:suffix:",  v14,  a5,  v15,  v16));
        v17[2](v17, v20);

        objc_autoreleasePoolPop(v19);
        goto LABEL_8;
      }

      cardFileManager = self->_cardFileManager;
      if (cardFileManager)
      {
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472LL;
        v22[2] = sub_1000509D0;
        v22[3] = &unk_10063C900;
        BOOL v23 = v17;
        -[PDCardFileManager fetchImageSetContainerForUniqueID:ofType:withDisplayProfile:suffix:completion:]( cardFileManager,  "fetchImageSetContainerForUniqueID:ofType:withDisplayProfile:suffix:completion:",  v14,  a5,  v15,  v16,  v22);

        goto LABEL_8;
      }
    }

    v17[2](v17, 0LL);
  }

- (void)updateSettings:(unint64_t)a3 forObjectWithUniqueID:(id)a4
{
  id v6 = a4;
  if (-[PKEntitlementWhitelist passesAllAccess](self->_whitelist, "passesAllAccess"))
  {
    id v7 = PDDefaultQueue();
    id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v7);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100050AF8;
    block[3] = &unk_10063A858;
    void block[4] = self;
    unint64_t v13 = a3;
    id v12 = v6;
    dispatch_async(v8, block);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(0LL);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10044151C();
    }
  }
}

- (void)setSortingState:(int64_t)a3 forObjectWithUniqueID:(id)a4 withCompletion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (-[PKEntitlementWhitelist passesAllAccess](self->_whitelist, "passesAllAccess"))
  {
    id v10 = PDDefaultQueue();
    id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v10);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_100050C30;
    v14[3] = &unk_10063C928;
    void v14[4] = self;
    id v15 = v8;
    int64_t v17 = a3;
    id v16 = v9;
    dispatch_async(v11, v14);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(0LL);
    unint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100441548();
    }

    if (v9) {
      (*((void (**)(id, void))v9 + 2))(v9, 0LL);
    }
  }
}

- (void)usingSynchronousProxy:(BOOL)a3 setLiveRenderingEnabled:(BOOL)a4 forPassUniqueID:(id)a5 handler:(id)a6
{
  BOOL v7 = a4;
  id v9 = a5;
  id v10 = (void (**)(id, unint64_t))a6;
  if (v10)
  {
    if ((-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess") & 1) != 0)
    {
      if (v9) {
        v10[2]( v10,  -[PDPassLiveRenderManager updateLiveRenderingEnabled:forPassUniqueID:]( self->_passLiveRenderManager,  "updateLiveRenderingEnabled:forPassUniqueID:",  v7,  v9));
      }
      else {
        v10[2](v10, 1uLL);
      }
    }

    else
    {
      uint64_t Object = PKLogFacilityTypeGetObject(0LL);
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13[0] = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "passd was asked to change live rendering by an unentitled process. Refusing.",  (uint8_t *)v13,  2u);
      }

      v10[2](v10, 0LL);
    }
  }
}

- (void)usingSynchronousProxy:(BOOL)a3 dynamicStateForPassUniqueID:(id)a4 handler:(id)a5
{
  id v7 = a4;
  id v8 = (void (**)(id, void *))a5;
  if (v8)
  {
    if ((-[PKEntitlementWhitelist passesAllAccess](self->_whitelist, "passesAllAccess") & 1) != 0)
    {
      if (v7)
      {
        id v9 = (void *)objc_claimAutoreleasedReturnValue( -[PDPassDynamicStateManager passDynamicStateForUniqueIdentifier:]( self->_dynamicStateManager,  "passDynamicStateForUniqueIdentifier:",  v7));
        v8[2](v8, v9);

        goto LABEL_9;
      }
    }

    else
    {
      uint64_t Object = PKLogFacilityTypeGetObject(0LL);
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12[0] = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "passd was asked to get dynamic state by an unentitled process. Refusing.",  (uint8_t *)v12,  2u);
      }
    }

    v8[2](v8, 0LL);
  }

- (void)rescheduleCommutePlanRenewalReminderForPassWithUniqueID:(id)a3
{
  id v4 = a3;
  if (-[PKEntitlementWhitelist passesAllAccess](self->_whitelist, "passesAllAccess"))
  {
    id v5 = PDDefaultQueue();
    id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v5);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_100050F40;
    v9[3] = &unk_1006392B0;
    v9[4] = self;
    id v10 = v4;
    dispatch_async(v6, v9);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(0LL);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100441574();
    }
  }
}

- (void)noteObjectSharedWithUniqueID:(id)a3
{
  id v4 = a3;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100051070;
  v9[3] = &unk_1006392B0;
  v9[4] = self;
  id v10 = v4;
  id v7 = v9;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10005DE84;
  block[3] = &unk_10063A830;
  id v12 = v7;
  id v8 = v4;
  dispatch_async(v6, block);
}

- (void)addPassesWithData:(id)a3 handler:(id)a4
{
  id v5 = a3;
  id v22 = a4;
  id v24 = (void *)PDOSTransactionCreate("PDPassLibrary");
  id v6 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v5 count]);
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v33;
    do
    {
      id v11 = 0LL;
      do
      {
        if (*(void *)v33 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v32 + 1) + 8LL * (void)v11);
        unint64_t v13 = objc_autoreleasePoolPush();
        id v31 = 0LL;
        id v14 = +[PKPass createWithData:warnings:error:]( &OBJC_CLASS___PKPass,  "createWithData:warnings:error:",  v12,  0LL,  &v31);
        id v15 = v31;
        if (v14)
        {
          -[NSMutableArray addObject:](v6, "addObject:", v14);
        }

        else
        {
          uint64_t Object = PKLogFacilityTypeGetObject(0LL);
          int64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
            sub_1004415A0(&buf, v30, v17);
          }
        }

        objc_autoreleasePoolPop(v13);
        id v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }

    while (v9);
  }

  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_100051360;
  v27[3] = &unk_10063C978;
  id v28 = v6;
  int v18 = v6;
  id v19 = objc_retainBlock(v27);
  id v20 = -[NSMutableArray count](v18, "count");
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_1000513F8;
  v25[3] = &unk_10063C9A0;
  id v26 = v22;
  id v21 = v22;
  -[PDPassLibrary _usingSynchronousProxy:addPassesWithEnumerator:estimatedNumberOfPasses:osTransaction:completionHandler:]( self,  "_usingSynchronousProxy:addPassesWithEnumerator:estimatedNumberOfPasses:osTransaction:completionHandler:",  0LL,  v19,  v20,  v24,  v25);
}

- (void)usingSynchronousProxy:(BOOL)a3 addPassesContainer:(id)a4 withCompletionHandler:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = (void *)PDOSTransactionCreate("PDPassLibrary");
  if (v8 && ![v8 unarchivePassesWithOptions:0 usingBlock:0])
  {
    uint64_t v14 = v11;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_1000515DC;
    v20[3] = &unk_10063C978;
    id v15 = v8;
    id v21 = v15;
    id v16 = objc_retainBlock(v20);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_100051674;
    v17[3] = &unk_10063C9F0;
    id v18 = v15;
    id v19 = v9;
    -[PDPassLibrary _usingSynchronousProxy:addPassesWithEnumerator:estimatedNumberOfPasses:osTransaction:completionHandler:]( self,  "_usingSynchronousProxy:addPassesWithEnumerator:estimatedNumberOfPasses:osTransaction:completionHandler:",  v6,  v16,  v14,  v10,  v17);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(0LL);
    unint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint8_t buf = 134217984;
      BOOL v23 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "PDPassLibrary (%p): could not extract passes from container for addPassesContainer:.",  buf,  0xCu);
    }

    (*((void (**)(id, uint64_t))v9 + 2))(v9, 2LL);
  }
}

- (void)usingSynchronousProxy:(BOOL)a3 addPassIngestionPayloads:(id)a4 withCompletionHandler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = (void *)PDOSTransactionCreate("PDPassLibrary");
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1000517C4;
  v16[3] = &unk_10063C978;
  id v17 = v7;
  id v10 = v7;
  uint64_t v11 = objc_retainBlock(v16);
  id v12 = [v10 count];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100051920;
  v14[3] = &unk_10063C9A0;
  id v15 = v8;
  id v13 = v8;
  -[PDPassLibrary _usingSynchronousProxy:addPassesWithEnumerator:estimatedNumberOfPasses:osTransaction:completionHandler:]( self,  "_usingSynchronousProxy:addPassesWithEnumerator:estimatedNumberOfPasses:osTransaction:completionHandler:",  0LL,  v11,  v12,  v9,  v14);
}

- (void)_usingSynchronousProxy:(BOOL)a3 addPassesWithEnumerator:(id)a4 estimatedNumberOfPasses:(unint64_t)a5 osTransaction:(id)a6 completionHandler:(id)a7
{
  id v11 = a4;
  id v12 = a6;
  id v13 = (void (**)(id, uint64_t))a7;
  if (PKPassbookIsCurrentlyDeletedByUser())
  {
    PKShowAlertForWalletUninstalled(0LL);
    v13[2](v13, 2LL);
  }

  else if (-[PKEntitlementWhitelist passesAddSilently](self->_whitelist, "passesAddSilently"))
  {
    id v14 = PDDefaultQueue();
    id v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v14);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100051C90;
    block[3] = &unk_10063CA18;
    void block[4] = self;
    id v39 = v11;
    uint64_t v40 = v13;
    id v38 = v12;
    dispatch_async(v15, block);
  }

  else
  {
    uint64_t v16 = PDLocalizedAppNameForPID(-[PDPassLibrary remoteProcessIdentifier](self, "remoteProcessIdentifier"));
    id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v41[0] = kCFUserNotificationAlternateButtonTitleKey;
    if (a5 == 1) {
      id v18 = @"INGESTION_ADD";
    }
    else {
      id v18 = @"INGESTION_ADD_N";
    }
    uint64_t v19 = PKLocalizedString(&v18->isa);
    id v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    v42[0] = v20;
    v41[1] = kCFUserNotificationOtherButtonTitleKey;
    uint64_t v21 = PKLocalizedString(@"REVIEW_BUTTON_TITLE");
    id v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    v42[1] = v22;
    v41[2] = kCFUserNotificationDefaultButtonTitleKey;
    uint64_t v23 = PKLocalizedString(@"INGESTION_CANCEL");
    id v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    v42[2] = v24;
    v41[3] = kCFUserNotificationAlertHeaderKey;
    uint64_t v25 = PKLocalizedString(@"ADD_PASSES_TITLE", @"%@%lu", v17, a5);
    id v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    v42[3] = v26;
    v42[4] = &__kCFBooleanTrue;
    v41[4] = PKUserNotificationDontDismissOnUnlock;
    v41[5] = PKUserNotificationAllowMenuButtonDismissal;
    void v42[5] = &__kCFBooleanTrue;
    int v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v42,  v41,  6LL));

    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472LL;
    v34[2] = sub_100051CC4;
    v34[3] = &unk_10063CA68;
    v34[4] = self;
    __int128 v35 = v13;
    id v36 = v11;
    id v28 = +[PKUserNotificationAgent presentNotificationWithParameters:responseHandler:]( &OBJC_CLASS___PKUserNotificationAgent,  "presentNotificationWithParameters:responseHandler:",  v27,  v34);
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    userNotifications = self->_userNotifications;
    if (!userNotifications)
    {
      id v31 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      __int128 v32 = self->_userNotifications;
      self->_userNotifications = v31;

      userNotifications = self->_userNotifications;
    }

    __int128 v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithPointer:](&OBJC_CLASS___NSValue, "valueWithPointer:", v28));
    -[NSMutableArray addObject:](userNotifications, "addObject:", v33);

    os_unfair_lock_unlock(p_lock);
  }
}

- (void)usingSynchronousProxy:(BOOL)a3 addUnsignedPassesWithDataFileDescriptors:(id)a4 completionHandler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if ((-[PKEntitlementWhitelist passesAddUnsigned](self->_whitelist, "passesAddUnsigned") & 1) != 0)
  {
    id v9 = PDDefaultQueue();
    id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v9);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100052030;
    block[3] = &unk_10063C450;
    id v19 = v7;
    id v20 = self;
    id v21 = v8;
    dispatch_async(v10, block);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(0LL);
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint8_t buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Attempting to add unsigned passes, but missing proper entitlement.",  buf,  2u);
    }

    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    id v13 = v7;
    id v14 = [v13 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v23;
      do
      {
        id v17 = 0LL;
        do
        {
          if (*(void *)v23 != v16) {
            objc_enumerationMutation(v13);
          }
          [*(id *)(*((void *)&v22 + 1) + 8 * (void)v17) invalidate];
          id v17 = (char *)v17 + 1;
        }

        while (v15 != v17);
        id v15 = [v13 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }

      while (v15);
    }

    if (v8) {
      (*((void (**)(id, uint64_t))v8 + 2))(v8, 2LL);
    }
  }
}

- (void)usingSynchronousProxy:(BOOL)a3 provisionHomeKeyPassForSerialNumbers:(id)a4 completionHandler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if ((-[PKEntitlementWhitelist passesAllAccess](self->_whitelist, "passesAllAccess") & 1) != 0)
  {
    id v9 = PDDefaultQueue();
    id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v9);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000526F4;
    block[3] = &unk_10063C450;
    id v15 = v7;
    uint64_t v16 = self;
    id v17 = v8;
    dispatch_async(v10, block);

    id v11 = v15;
LABEL_7:

    goto LABEL_8;
  }

  uint64_t Object = PKLogFacilityTypeGetObject(0LL);
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint8_t buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Attempting to provision HomeKeys for serialNumbers, but missing proper entitlement.",  buf,  2u);
  }

  if (v8)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKPassKitErrorDomain,  4LL,  0LL));
    (*((void (**)(id, void, void *))v8 + 2))(v8, 0LL, v11);
    goto LABEL_7;
  }

- (void)usingSynchronousProxy:(BOOL)a3 availableHomeKeyPassesWithCompletionHandler:(id)a4
{
  id v5 = a4;
  if ((-[PKEntitlementWhitelist passesAllAccess](self->_whitelist, "passesAllAccess") & 1) != 0)
  {
    id v6 = PDDefaultQueue();
    id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v6);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000537CC;
    block[3] = &unk_10063A830;
    id v12 = v5;
    dispatch_async(v7, block);

    id v8 = v12;
LABEL_7:

    goto LABEL_8;
  }

  uint64_t Object = PKLogFacilityTypeGetObject(22LL);
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint8_t buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Attempting to fetch available HomeKeys, but missing proper entitlement.",  buf,  2u);
  }

  if (v5)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKPassKitErrorDomain,  4LL,  0LL));
    (*((void (**)(id, void, void *))v5 + 2))(v5, 0LL, v8);
    goto LABEL_7;
  }

- (void)usingSynchronousProxy:(BOOL)a3 replaceUnsignedPassWithDataFileDescriptor:(id)a4 completionHandler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if ((-[PKEntitlementWhitelist passesAddUnsigned](self->_whitelist, "passesAddUnsigned") & 1) != 0)
  {
    id v9 = PDDefaultQueue();
    id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v9);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100053EC0;
    block[3] = &unk_10063C450;
    id v14 = v7;
    id v15 = self;
    id v16 = v8;
    dispatch_async(v10, block);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(0LL);
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint8_t buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Attempting to replace unsigned passes, but missing proper entitlement.",  buf,  2u);
    }

    [v7 invalidate];
    if (v8) {
      (*((void (**)(id, void))v8 + 2))(v8, 0LL);
    }
  }
}

- (void)usingSynchronousProxy:(BOOL)a3 containsPassWithPassTypeIdentifier:(id)a4 serialNumber:(id)a5 completionHandler:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  if ((-[PKEntitlementWhitelist passesAllAccess](self->_whitelist, "passesAllAccess") & 1) != 0)
  {
    id v12 = PDDefaultQueue();
    id v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v12);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_100054204;
    v16[3] = &unk_10063B440;
    void v16[4] = self;
    id v17 = v9;
    id v18 = v10;
    id v19 = v11;
    dispatch_async(v13, v16);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(0LL);
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint8_t buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Attempting to call containsPassWithPassTypeIdentifier, but missing proper entitlement.",  buf,  2u);
    }

    if (v11) {
      (*((void (**)(id, void))v11 + 2))(v11, 0LL);
    }
  }
}

- (void)usingSynchronousProxy:(BOOL)a3 enableExpressForPassWithPassTypeIdentifier:(id)a4 serialNumber:(id)a5 completionHandler:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  if (-[PKEntitlementWhitelist passesAllAccess](self->_whitelist, "passesAllAccess")
    && (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess") & 1) != 0)
  {
    id v12 = PDDefaultQueue();
    id v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v12);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_1000543A0;
    v16[3] = &unk_10063B440;
    void v16[4] = self;
    id v17 = v9;
    id v18 = v10;
    id v19 = v11;
    dispatch_async(v13, v16);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(0LL);
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint8_t buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Attempting to call enableExpressForPassWithPassTypeIdentifier, but missing proper entitlements.",  buf,  2u);
    }

    if (v11) {
      (*((void (**)(id, void))v11 + 2))(v11, 0LL);
    }
  }
}

- (void)removePassWithUniqueID:(id)a3 diagnosticReason:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = PDDefaultQueue();
  id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v11);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100054780;
  v16[3] = &unk_10063B440;
  id v17 = v8;
  id v18 = self;
  id v19 = v9;
  id v20 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  dispatch_async(v12, v16);
}

- (void)removePassesWithUniqueIDs:(id)a3 diagnosticReason:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = PDDefaultQueue();
  id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v11);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1000548F8;
  v16[3] = &unk_10063B440;
  id v17 = v8;
  id v18 = self;
  id v19 = v9;
  id v20 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  dispatch_async(v12, v16);
}

- (void)recoverPassWithUniqueID:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = PDDefaultQueue();
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100054B30;
  block[3] = &unk_100639AF0;
  id v13 = v6;
  id v14 = self;
  id v15 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);
}

- (void)removePassesOfType:(unint64_t)a3 withDiagnosticReason:(id)a4 handler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = PDDefaultQueue();
  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v10);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100054C54;
  v14[3] = &unk_10063C928;
  void v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  unint64_t v17 = a3;
  id v12 = v9;
  id v13 = v8;
  dispatch_async(v11, v14);
}

- (void)resetApplePayWithDiagnosticReason:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = PDDefaultQueue();
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100054D80;
  block[3] = &unk_100639AF0;
  void block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);
}

- (void)updateObjectWithUniqueIdentifier:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[PKEntitlementWhitelist passesAllAccess](self->_whitelist, "passesAllAccess"))
  {
    id v8 = PDDefaultQueue();
    id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v8);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100054EE0;
    block[3] = &unk_100639AF0;
    void block[4] = self;
    id v11 = v6;
    id v12 = v7;
    dispatch_async(v9, block);
  }

  else if (v7)
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0LL);
  }
}

- (void)personalizePassWithUniqueIdentifier:(id)a3 contact:(id)a4 personalizationToken:(id)a5 requiredPersonalizationFields:(unint64_t)a6 personalizationSource:(unint64_t)a7 handler:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a8;
  if (-[PKEntitlementWhitelist passesAllAccess](self->_whitelist, "passesAllAccess"))
  {
    id v18 = PDDefaultQueue();
    id v19 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v18);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10005504C;
    block[3] = &unk_10063CCE8;
    void block[4] = self;
    id v21 = v14;
    id v22 = v15;
    id v23 = v16;
    unint64_t v25 = a6;
    unint64_t v26 = a7;
    id v24 = v17;
    dispatch_async(v19, block);
  }

  else if (v17)
  {
    (*((void (**)(id, void))v17 + 2))(v17, 0LL);
  }
}

- (void)fetchHasCandidatePasses:(id)a3
{
  id v4 = a3;
  if (-[PKEntitlementWhitelist passesAllAccess](self->_whitelist, "passesAllAccess"))
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
    id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100055180;
    v8[3] = &unk_1006396B0;
    v8[4] = self;
    id v9 = v4;
    id v7 = v8;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10005DE84;
    block[3] = &unk_10063A830;
    id v11 = v7;
    dispatch_async(v6, block);
  }

  else
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0LL);
  }
}

- (void)fetchCurrentRelevantPassInfo:(id)a3
{
}

- (void)migrateDataWithHandler:(id)a3 didRestoreFromBackup:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = (void (**)(id, uint64_t))a3;
  if (-[PKEntitlementWhitelist passesAllAccess](self->_whitelist, "passesAllAccess"))
  {
    id v7 = objc_autoreleasePoolPush();
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained dataMigrationRequestedWithPassLibrary:self didRestoreFromBackup:v4];

    objc_autoreleasePoolPop(v7);
    v6[2](v6, 1LL);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(0LL);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1004415DC();
    }

    v6[2](v6, 0LL);
  }
}

- (void)setSecureElement:(id)a3
{
  id v5 = (PKSecureElement *)a3;
  if (self->_secureElement != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_secureElement, a3);
    id v5 = v6;
  }
}

- (void)signData:(id)a3 forPassUniqueID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = PDDefaultQueue();
  id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v11);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1000553D0;
  v16[3] = &unk_10063CD60;
  id v17 = v9;
  id v18 = self;
  id v19 = v8;
  id v20 = v10;
  id v13 = v8;
  id v14 = v9;
  id v15 = v10;
  dispatch_async(v12, v16);
}

- (void)usingSynchronousProxy:(BOOL)a3 createFidoKeyForRelyingParty:(id)a4 relyingPartyAccountHash:(id)a5 challenge:(id)a6 externalizedAuth:(id)a7 completion:(id)a8
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  if ((-[PKEntitlementWhitelist passesAllAccess](self->_whitelist, "passesAllAccess") & 1) != 0)
  {
    id v18 = PDDefaultQueue();
    id v19 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v18);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_100055B74;
    v23[3] = &unk_10063AD70;
    void v23[4] = self;
    id v24 = v13;
    id v25 = v14;
    id v26 = v15;
    id v27 = v16;
    id v28 = v17;
    dispatch_async(v19, v23);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(22LL);
    id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint8_t buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Attempting to create FIDO key, but missing proper entitlement.",  buf,  2u);
    }

    if (v17)
    {
      id v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKPassKitErrorDomain,  4LL,  0LL));
      (*((void (**)(id, void, void, void, void *))v17 + 2))(v17, 0LL, 0LL, 0LL, v22);
    }
  }
}

- (void)usingSynchronousProxy:(BOOL)a3 checkFidoKeyPresenceForRelyingParty:(id)a4 relyingPartyAccountHash:(id)a5 fidoKeyHash:(id)a6 completion:(id)a7
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  if ((-[PKEntitlementWhitelist passesAllAccess](self->_whitelist, "passesAllAccess") & 1) != 0)
  {
    id v15 = PDDefaultQueue();
    id v16 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v15);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100055D04;
    block[3] = &unk_10063CD88;
    void block[4] = self;
    id v20 = v11;
    id v21 = v12;
    id v22 = v13;
    id v23 = v14;
    dispatch_async(v16, block);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(22LL);
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint8_t buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Attempting to check for FIDO key, but missing proper entitlement.",  buf,  2u);
    }

    if (v14) {
      (*((void (**)(id, void))v14 + 2))(v14, 0LL);
    }
  }
}

- (void)usingSynchronousProxy:(BOOL)a3 signWithFidoKeyForRelyingParty:(id)a4 relyingPartyAccountHash:(id)a5 fidoKeyHash:(id)a6 challenge:(id)a7 publicKeyIdentifier:(id)a8 externalizedAuth:(id)a9 completion:(id)a10
{
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  id v21 = a10;
  if ((-[PKEntitlementWhitelist passesAllAccess](self->_whitelist, "passesAllAccess") & 1) != 0)
  {
    id v22 = PDDefaultQueue();
    id v23 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v22);
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = sub_100055F30;
    v27[3] = &unk_10063CDB0;
    void v27[4] = self;
    id v28 = v15;
    id v29 = v16;
    id v30 = v17;
    id v31 = v18;
    id v32 = v19;
    id v33 = v20;
    id v34 = v21;
    dispatch_async(v23, v27);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(22LL);
    id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint8_t buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Attempting to sign FIDO challenge, but missing proper entitlement.",  buf,  2u);
    }

    if (v21)
    {
      id v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKPassKitErrorDomain,  4LL,  0LL));
      (*((void (**)(id, void, void *))v21 + 2))(v21, 0LL, v26);
    }
  }
}

- (void)usingSynchronousProxy:(BOOL)a3 generateSEEncryptionCertificateForSubCredentialId:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if ((-[PKEntitlementWhitelist passesAllAccess](self->_whitelist, "passesAllAccess") & 1) != 0)
  {
    id v9 = PDDefaultQueue();
    id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v9);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000560C8;
    block[3] = &unk_100639AF0;
    void block[4] = self;
    id v15 = v7;
    id v16 = v8;
    dispatch_async(v10, block);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(22LL);
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint8_t buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Attempting to generate SE encryption cert, but missing proper entitlement.",  buf,  2u);
    }

    if (v8)
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKPassKitErrorDomain,  4LL,  0LL));
      (*((void (**)(id, void, void *))v8 + 2))(v8, 0LL, v13);
    }
  }
}

- (void)usingSynchronousProxy:(BOOL)a3 generateISOEncryptionCertificateForSubCredentialId:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if ((-[PKEntitlementWhitelist passesAllAccess](self->_whitelist, "passesAllAccess") & 1) != 0)
  {
    id v9 = PDDefaultQueue();
    id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v9);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100056240;
    block[3] = &unk_100639AF0;
    void block[4] = self;
    id v15 = v7;
    id v16 = v8;
    dispatch_async(v10, block);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(22LL);
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint8_t buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Attempting to generateISO encryption cert, but missing proper entitlement.",  buf,  2u);
    }

    if (v8)
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKPassKitErrorDomain,  4LL,  0LL));
      (*((void (**)(id, void, void, void *))v8 + 2))(v8, 0LL, 0LL, v13);
    }
  }
}

- (void)deleteKeyMaterialForSubCredentialId:(id)a3
{
  id v4 = a3;
  if ((-[PKEntitlementWhitelist passesAllAccess](self->_whitelist, "passesAllAccess") & 1) != 0)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(0LL);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint8_t buf = 138412290;
      id v14 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Deleting key material for subcredential id: %@",  buf,  0xCu);
    }

    id v7 = PDDefaultQueue();
    id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v7);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1000563D0;
    v11[3] = &unk_1006392B0;
    void v11[4] = self;
    id v12 = v4;
    dispatch_async(v8, v11);
  }

  else
  {
    uint64_t v9 = PKLogFacilityTypeGetObject(22LL);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint8_t buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Attempting to delete sub credential key material, but missing proper entitlement.",  buf,  2u);
    }
  }
}

- (void)usingSynchronousProxy:(BOOL)a3 addISO18013Blobs:(id)a4 cardType:(int64_t)a5 completion:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  if ((-[PKEntitlementWhitelist passesAllAccess](self->_whitelist, "passesAllAccess") & 1) != 0)
  {
    id v11 = PDDefaultQueue();
    id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v11);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_1000565B4;
    v16[3] = &unk_10063C928;
    void v16[4] = self;
    id v17 = v9;
    int64_t v19 = a5;
    id v18 = v10;
    dispatch_async(v12, v16);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(22LL);
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint8_t buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Attempting to addISO18013Blobs, but missing proper entitlement.",  buf,  2u);
    }

    if (v10)
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKPassKitErrorDomain,  4LL,  0LL));
      (*((void (**)(id, void *))v10 + 2))(v10, v15);
    }
  }
}

- (void)usingSynchronousProxy:(BOOL)a3 longTermPrivacyKeyForCredentialGroupIdentifier:(id)a4 reuseExisting:(BOOL)a5 completion:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  if ((-[PKEntitlementWhitelist passesAllAccess](self->_whitelist, "passesAllAccess") & 1) != 0)
  {
    id v11 = PDDefaultQueue();
    id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v11);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_100056738;
    v16[3] = &unk_10063B100;
    void v16[4] = self;
    id v17 = v9;
    BOOL v19 = a5;
    id v18 = v10;
    dispatch_async(v12, v16);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(22LL);
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint8_t buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Attempting to generateLongTermPrivacyKeyForCredentialGroupIdentifier, but missing proper entitlement.",  buf,  2u);
    }

    if (v10)
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKPassKitErrorDomain,  4LL,  0LL));
      (*((void (**)(id, void, void *))v10 + 2))(v10, 0LL, v15);
    }
  }
}

- (void)usingSynchronousProxy:(BOOL)a3 generateAuxiliaryCapabilitiesForRequirements:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if ((-[PKEntitlementWhitelist passesAllAccess](self->_whitelist, "passesAllAccess") & 1) != 0)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(0LL);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint8_t buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "GenerateAuxiliaryCapabilitiesForRequirements starting...",  buf,  2u);
    }

    id v11 = PDDefaultQueue();
    id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v11);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000568F8;
    block[3] = &unk_100639AF0;
    void block[4] = self;
    id v17 = v7;
    id v18 = v8;
    dispatch_async(v12, block);
  }

  else
  {
    uint64_t v13 = PKLogFacilityTypeGetObject(22LL);
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint8_t buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Attempting to generateLongTermPrivacyKeyForCredentialGroupIdentifier, but missing proper entitlement.",  buf,  2u);
    }

    if (v8)
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKPassKitErrorDomain,  4LL,  0LL));
      (*((void (**)(id, void, void *))v8 + 2))(v8, 0LL, v15);
    }
  }
}

- (void)signData:(id)a3 signatureEntanglementMode:(unint64_t)a4 withCompletionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ((-[PKEntitlementWhitelist passesAllAccess](self->_whitelist, "passesAllAccess") & 1) != 0
    || (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess") & 1) != 0)
  {
    id v10 = PDDefaultQueue();
    id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v10);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_100056BB8;
    v14[3] = &unk_10063C928;
    void v14[4] = self;
    id v15 = v8;
    unint64_t v17 = a4;
    id v16 = v9;
    dispatch_async(v11, v14);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(0LL);
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint8_t buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Call to signData:signatureEntanglementMode:withCompletionHandler: missing proper entitlements",  buf,  2u);
    }

    if (v9) {
      (*((void (**)(id, void, void, void))v9 + 2))(v9, 0LL, 0LL, 0LL);
    }
  }
}

- (void)isWatchIssuerAppProvisioningSupportedWithHandler:(id)a3
{
  if (a3)
  {
    id v5 = a3;
    (*((void (**)(id, BOOL))a3 + 2))( v5,  -[PDPassLibrary _isWatchIssuerAppProvisioningSupported](self, "_isWatchIssuerAppProvisioningSupported"));
  }

- (BOOL)_isWatchIssuerAppProvisioningSupported
{
  return 0;
}

- (void)backupMetadataWithHandler:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  if ((-[PKEntitlementWhitelist passesAllAccess](self->_whitelist, "passesAllAccess") & 1) != 0)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint8_t buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Preparing backup metadata", buf, 2u);
    }

    id v7 = (void *)objc_claimAutoreleasedReturnValue( -[PDDefaultPassManager defaultPaymentPassIdentifier]( self->_defaultPassManager,  "defaultPaymentPassIdentifier"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager passWithUniqueIdentifier:]( self->_databaseManager,  "passWithUniqueIdentifier:",  v7));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 paymentPass]);

    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 serialNumber]);
    int IsCurrentlyDeletedByUser = PKPassbookIsCurrentlyDeletedByUser();
    if (v10) {
      BOOL v12 = 0;
    }
    else {
      BOOL v12 = IsCurrentlyDeletedByUser == 0;
    }
    if (v12)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint8_t buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Backup skipping - no data to backup was present to backup",  buf,  2u);
      }

      id v20 = 0LL;
      id v14 = v6;
      goto LABEL_28;
    }

    int v13 = IsCurrentlyDeletedByUser;
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  2LL));
    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithObject:forKey:",  v14,  @"backupDataVersionNumberKey"));
    id v16 = v15;
    if (v10)
    {
      [v15 setObject:v10 forKeyedSubscript:@"backupDataDefaultPaymentPassSerialNumberKey"];
      if (v13)
      {
LABEL_10:
        unint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
        [v16 setObject:v17 forKeyedSubscript:@"backupDataPassbookDeletedKey"];
LABEL_23:

        id v22 = 0LL;
        id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v16,  1LL,  &v22));
        id v21 = v22;
        if (v21)
        {
          if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)uint8_t buf = 138412546;
            id v24 = v20;
            __int16 v25 = 2112;
            id v26 = v21;
            _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Error: unable to encode backup data (%@) with error: %@",  buf,  0x16u);
          }
        }

LABEL_28:
        if (v4)
        {
          v4[2](v4, v20);
          if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)uint8_t buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Backup metadata completed", buf, 2u);
          }
        }

        goto LABEL_33;
      }
    }

    else
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint8_t buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Backup skipping default payment pass serial number - none found",  buf,  2u);
      }

      if (v13) {
        goto LABEL_10;
      }
    }

    unint64_t v17 = v6;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint8_t buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Backup skipping passbook deleted - Passbook has not been deleted",  buf,  2u);
      unint64_t v17 = v6;
    }

    goto LABEL_23;
  }

  uint64_t v18 = PKLogFacilityTypeGetObject(0LL);
  BOOL v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
    sub_100441608();
  }

  if (v4) {
    v4[2](v4, 0LL);
  }
LABEL_33:
}

- (void)setBackupMetadata:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  if ((-[PKEntitlementWhitelist passesAllAccess](self->_whitelist, "passesAllAccess") & 1) != 0)
  {
    if (v6 && [v6 length])
    {
      uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSDictionary, v8);
      uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSString, v10);
      int v13 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v9,  v11,  objc_opt_class(&OBJC_CLASS___NSNumber, v12),  0LL);
      id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      id v27 = 0LL;
      id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  v14,  v6,  &v27));
      id v16 = v27;

      if (!v16 && v15 && (objc_opt_isKindOfClass(v15, v9) & 1) != 0)
      {
        id v17 = v15;
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKey:@"backupDataVersionNumberKey"]);
        id v19 = [v18 integerValue];
        if (v19 == (id)1)
        {
          -[PDPassLibrary _setBackupDefaultPaymentPassState:](self, "_setBackupDefaultPaymentPassState:", v17);
        }

        else if (v19 == (id)2)
        {
          -[PDPassLibrary _setBackupDefaultPaymentPassState:](self, "_setBackupDefaultPaymentPassState:", v17);
          -[PDPassLibrary _setBackupPassbookDeletedState:](self, "_setBackupPassbookDeletedState:", v17);
        }

        else
        {
          uint64_t Object = PKLogFacilityTypeGetObject(6LL);
          id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)uint8_t buf = 138412290;
            id v29 = v18;
            _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Error: Not able to decode metadata contents as client does not know about version number: %@",  buf,  0xCu);
          }
        }

        if (v7) {
          v7[2](v7);
        }
      }

      else
      {
        uint64_t v23 = PKLogFacilityTypeGetObject(6LL);
        id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)uint8_t buf = 138412290;
          id v29 = v16;
          _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Error: unable to decode backup data with error: %@",  buf,  0xCu);
        }

        if (v7) {
          v7[2](v7);
        }
      }

      goto LABEL_28;
    }

    uint64_t v22 = PKLogFacilityTypeGetObject(6LL);
    id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint8_t buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Error: No data returned in backup metadata call",  buf,  2u);
    }
  }

  else
  {
    uint64_t v20 = PKLogFacilityTypeGetObject(0LL);
    id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_100441634();
    }
  }

  if (v7) {
    v7[2](v7);
  }
LABEL_28:
}

- (void)prepareForBackupRestoreWithExistingPreferencesData:(id)a3 handler:(id)a4
{
  id v5 = (void (**)(void))a4;
  if ((-[PKEntitlementWhitelist passesAllAccess](self->_whitelist, "passesAllAccess") & 1) != 0)
  {
    PDWritePassdPreferencesToSafeHaven();
    if (v5) {
LABEL_3:
    }
      v5[2](v5);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(0LL);
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "passd was asked to prepare for Buddy safe-haven by an unentitled process. Refusing.",  v8,  2u);
    }

    if (v5) {
      goto LABEL_3;
    }
  }
}

- (void)prepareForBackupRestoreWithRequiredFileURLs:(id)a3 destinationFileHandles:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(void))a5;
  if ((-[PKEntitlementWhitelist passesAllAccess](self->_whitelist, "passesAllAccess") & 1) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained prepareForBackupRestoreWithRequiredFileURLs:v8 destinationFileHandles:v9 handler:v10];
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(0LL);
    int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v14 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "passd was asked to prepare for Buddy safe-haven by an unentitled process. Refusing.",  v14,  2u);
    }

    if (v10) {
      v10[2](v10);
    }
  }
}

- (void)_setBackupDefaultPaymentPassState:(id)a3
{
  uint64_t v3 = objc_claimAutoreleasedReturnValue([a3 PKStringForKey:@"backupDataDefaultPaymentPassSerialNumberKey"]);
  id v4 = (void *)v3;
  if (v3)
  {
    PKSetLastBackedUpDefaultPaymentPassSerialNumber(v3);
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      uint64_t v12 = v4;
      id v7 = "Backup matadata contained defaultPaymentPassSerialNumber: %@";
      id v8 = v6;
      uint32_t v9 = 12;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v11, v9);
    }
  }

  else
  {
    uint64_t v10 = PKLogFacilityTypeGetObject(6LL);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      id v7 = "Backup matadata did not contain defaultPaymentPassSerialNumber";
      id v8 = v6;
      uint32_t v9 = 2;
      goto LABEL_6;
    }
  }
}

- (void)_setBackupPassbookDeletedState:(id)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a3 PKNumberForKey:@"backupDataPassbookDeletedKey"]);
  id v4 = v3;
  if (v3)
  {
    PKSetLastBackupPassbookWasDeleted([v3 BOOLValue]);
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      uint64_t v12 = v4;
      id v7 = "Backup matadata contained passbook deleted: %@";
      id v8 = v6;
      uint32_t v9 = 12;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v11, v9);
    }
  }

  else
  {
    uint64_t v10 = PKLogFacilityTypeGetObject(6LL);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      id v7 = "Backup matadata did not contain passbook deleted";
      id v8 = v6;
      uint32_t v9 = 2;
      goto LABEL_6;
    }
  }
}

- (void)usingSynchronousProxy:(BOOL)a3 canAddSecureElementPassWithConfiguration:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t Object = PKLogFacilityTypeGetObject(6LL);
  int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = objc_retainBlock(v9);
    *(_DWORD *)uint8_t buf = 138412546;
    id v26 = v8;
    __int16 v27 = 2112;
    id v28 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "canAddSecureElementPassWithConfiguration: called with configuration: %@ completion: %@",  buf,  0x16u);
  }

  if (v9)
  {
    if (v8)
    {
      [v8 updateAllowManagedAppleIDWithEntitlements:self->_whitelist];
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472LL;
      v20[2] = sub_100057940;
      v20[3] = &unk_10063CE50;
      id v21 = v8;
      uint64_t v22 = self;
      id v23 = v9;
      BOOL v24 = v6;
      int v13 = objc_retainBlock(v20);
      id v14 = v13;
      if (v6)
      {
        ((void (*)(void *))v13[2])(v13);
      }

      else
      {
        id v16 = PDDefaultQueue();
        id v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v16);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_100057C68;
        block[3] = &unk_10063A830;
        id v19 = v14;
        dispatch_async(v17, block);
      }

      id v15 = v21;
    }

    else
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKPassKitErrorDomain,  1LL,  0LL));
      (*((void (**)(id, void, void *))v9 + 2))(v9, 0LL, v15);
    }
  }
}

- (void)usingSynchronousProxy:(BOOL)a3 canAddCarKeyPassWithConfiguration:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v9)
  {
    if (v6)
    {
      uint64_t Object = PKLogFacilityTypeGetObject(6LL);
      int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint8_t buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "canAddCarKeyPassWithConfiguration: synchronous not supported.",  buf,  2u);
      }
    }

    else
    {
      id v12 = PDDefaultQueue();
      int v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v12);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100057D80;
      block[3] = &unk_100639AF0;
      void block[4] = self;
      id v15 = v8;
      id v16 = v9;
      dispatch_async(v13, block);
    }
  }
}

- (void)canAddPushablePassWithConfiguration:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  if (v7)
  {
    if ((-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess") & 1) != 0
      || -[PKEntitlementWhitelist shareableCredentialProvisioning]( self->_whitelist,  "shareableCredentialProvisioning"))
    {
      -[PDPushProvisioningManager isPushProvisioningSupportedForConfiguration:completion:]( self->_pushProvisioningManager,  "isPushProvisioningSupportedForConfiguration:completion:",  v6,  v7);
    }

    else
    {
      uint64_t Object = PKLogFacilityTypeGetObject(6LL);
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)int v11 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Client is missing entitlement to support sharing secure element passes.",  v11,  2u);
      }

      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKPassKitErrorDomain,  4LL,  0LL));
      v7[2](v7, 0LL, v10);
    }
  }
}

- (void)canAddClassicApplePayCredentialWithConfiguration:(id)a3 completion:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    id v7 = a3;
    id v8 = objc_alloc_init(&OBJC_CLASS___PKProvisioningRequirementOracle);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 requirementsForAddSecureElementPassConfiguration:v7]);

    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 recoverableRequirements]);
    int v11 = (void *)objc_claimAutoreleasedReturnValue([v9 requirementsByRemovingRequirements:v10]);

    provisioningRequirementsChecker = self->_provisioningRequirementsChecker;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100057FA4;
    v13[3] = &unk_10063CE78;
    v13[4] = self;
    id v14 = v6;
    -[PDProvisioningRequirementsChecker meetsWithRequirementsContainer:completion:]( provisioningRequirementsChecker,  "meetsWithRequirementsContainer:completion:",  v11,  v13);
  }
}

- (void)canAddCarKeyPassWithConfiguration:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if ([v6 allowManagedAppleID] != (id)1)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(+[PKAppleAccountManager sharedInstance](&OBJC_CLASS___PKAppleAccountManager, "sharedInstance"));
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 appleAccountInformation]);
      unsigned int v10 = [v9 isManagedAppleAccount];

      if (v10)
      {
        uint64_t Object = PKLogFacilityTypeGetObject(22LL);
        id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v18 = 0;
          int v13 = "Apple account is MAID and app is missing MAID entitlment";
          id v14 = (uint8_t *)&v18;
LABEL_11:
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v13, v14, 2u);
          goto LABEL_12;
        }

        goto LABEL_12;
      }
    }

    if ((-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess") & 1) == 0
      && !-[PKEntitlementWhitelist secureElementPassProvisioning]( self->_whitelist,  "secureElementPassProvisioning"))
    {
      uint64_t v15 = PKLogFacilityTypeGetObject(6LL);
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v17 = 0;
        int v13 = "Client is missing entitlement to add a car key";
        id v14 = (uint8_t *)&v17;
        goto LABEL_11;
      }

- (void)canAddHomeKeyWithConfiguration:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472LL;
    v30[2] = sub_100058550;
    v30[3] = &unk_10063CEA0;
    id v9 = v7;
    id v31 = v9;
    unsigned int v10 = objc_retainBlock(v30);
    int v11 = (void *)objc_claimAutoreleasedReturnValue(+[PKAppleAccountManager sharedInstance](&OBJC_CLASS___PKAppleAccountManager, "sharedInstance"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 appleAccountInformation]);
    if ([v12 isManagedAppleAccount])
    {
      unsigned __int8 v13 = -[PKEntitlementWhitelist secureElementPassProvisioningForMAIDs]( self->_whitelist,  "secureElementPassProvisioningForMAIDs");

      if ((v13 & 1) == 0)
      {
        uint64_t Object = PKLogFacilityTypeGetObject(22LL);
        uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)uint8_t buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Apple account is MAID and app is missing MAID entitlment",  buf,  2u);
        }

        id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKPassKitErrorDomain,  4LL,  0LL));
        ((void (*)(void *, void, const __CFString *, void *))v10[2])( v10,  0LL,  @"missing proper entitlement",  v16);

        goto LABEL_24;
      }
    }

    else
    {
    }

    id v17 = -[PKEntitlementWhitelist passesAddUnsigned](self->_whitelist, "passesAddUnsigned");
    if ((v17 & 1) != 0
      || (id v17 = -[PKEntitlementWhitelist passesAllAccess](self->_whitelist, "passesAllAccess"),
          (v17 & 1) != 0))
    {
      if ((PKIsPhone(v17, v18) & 1) != 0 || (PKIsWatch() & 1) != 0)
      {
        if ((PKNearFieldSupportsSimultaneousRequestRouting() & 1) != 0)
        {
          if (+[PKWalletVisibility isWalletRestricted]( &OBJC_CLASS___PKWalletVisibility,  "isWalletRestricted"))
          {
            ((void (*)(void *, uint64_t, const __CFString *, void))v10[2])( v10,  4LL,  @"wallet is restricted",  0LL);
          }

          else
          {
            uint64_t v19 = PKIsBeneficiaryAccount();
            if ((_DWORD)v19)
            {
              ((void (*)(void *, uint64_t, const __CFString *, void))v10[2])( v10,  6LL,  @"is beneficiary account",  0LL);
            }

            else if (PKPasscodeEnabled(v19, v20))
            {
              id v21 = (void *)objc_claimAutoreleasedReturnValue( -[PDPaymentWebServiceCoordinator sharedWebService]( self->_paymentWebServicesCoordinator,  "sharedWebService"));
              uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v21 _appleAccountInformation]);

              if ([v22 aidaAccountAvailable])
              {
                id v23 = PDDefaultQueue();
                BOOL v24 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v23);
                v25[0] = _NSConcreteStackBlock;
                v25[1] = 3221225472LL;
                v25[2] = sub_1000586C0;
                v25[3] = &unk_10063CF68;
                void v25[4] = self;
                __int16 v27 = v10;
                id v26 = v6;
                id v28 = v9;
                dispatch_async(v24, v25);
              }

              else
              {
                ((void (*)(void *, uint64_t, const __CFString *, void))v10[2])( v10,  8LL,  @"no icloud",  0LL);
              }
            }

            else
            {
              ((void (*)(void *, uint64_t, const __CFString *, void))v10[2])( v10,  7LL,  @"passcode not set",  0LL);
            }
          }
        }

        else
        {
          ((void (*)(void *, uint64_t, const __CFString *, void))v10[2])( v10,  2LL,  @"unsupported device",  0LL);
        }
      }

      else
      {
        ((void (*)(void *, uint64_t, const __CFString *, void))v10[2])( v10,  1LL,  @"unsupported device family",  0LL);
      }
    }

    else
    {
      ((void (*)(void *, void, const __CFString *, void))v10[2])( v10,  0LL,  @"missing proper entitlement",  0LL);
    }

- (void)usingSynchronousProxy:(BOOL)a3 meetsProvisioningRequirements:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  if ((-[PKEntitlementWhitelist passesAllAccess](self->_whitelist, "passesAllAccess") & 1) != 0
    || (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess") & 1) != 0)
  {
    provisioningRequirementsChecker = self->_provisioningRequirementsChecker;
    if (provisioningRequirementsChecker)
    {
      if (v6)
      {
        -[PDProvisioningRequirementsChecker meetsWithRequirementsContainer:completion:]( provisioningRequirementsChecker,  "meetsWithRequirementsContainer:completion:",  v8,  v9);
      }

      else
      {
        id v15 = PDDefaultQueue();
        id v16 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v15);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_100058DD0;
        block[3] = &unk_100639AF0;
        void block[4] = self;
        id v18 = v8;
        id v19 = v9;
        dispatch_async(v16, block);
      }
    }

    else
    {
      uint64_t Object = PKLogFacilityTypeGetObject(39LL);
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint8_t buf = 0;
      }

      (*((void (**)(id, uint64_t, void))v9 + 2))(v9, 1LL, 0LL);
    }
  }

  else
  {
    uint64_t v13 = PKLogFacilityTypeGetObject(0LL);
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint8_t buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Attempting to call meetsProvisioningRequirements, but missing proper entitlement.",  buf,  2u);
    }

    (*((void (**)(id, void, void))v9 + 2))(v9, 0LL, 0LL);
  }
}

- (void)usingSynchronousProxy:(BOOL)a3 generateTransactionKeyWithReaderIdentifier:(id)a4 readerPublicKey:(id)a5 completion:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  unsigned __int8 v12 = -[PKEntitlementWhitelist passesAddUnsigned](self->_whitelist, "passesAddUnsigned");
  uint64_t Object = PKLogFacilityTypeGetObject(0LL);
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if ((v12 & 1) != 0)
  {
    if (v15)
    {
      *(_WORD *)uint8_t buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "GenerateTransactionKeyWithReaderIdentifier starting...",  buf,  2u);
    }

    id v16 = PDDefaultQueue();
    id v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v16);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_100058F80;
    v18[3] = &unk_10063B440;
    v18[4] = self;
    id v19 = v9;
    id v20 = v10;
    id v21 = v11;
    dispatch_async(v17, v18);
  }

  else
  {
    if (v15)
    {
      *(_WORD *)uint8_t buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Attempting to call generateTransactionKeyWithReaderIdentifier, but missing proper entitlement.",  buf,  2u);
    }

    if (v11) {
      (*((void (**)(id, void, void, void, void, void))v11 + 2))(v11, 0LL, 0LL, 0LL, 0LL, 0LL);
    }
  }
}

- (void)usingSynchronousProxy:(BOOL)a3 configureHomeAuxiliaryCapabilitiesForSerialNumber:(id)a4 homeIdentifier:(id)a5 fromUnifiedAccessDescriptor:(id)a6 andAliroDescriptor:(id)a7 completion:(id)a8
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  unsigned __int8 v18 = -[PKEntitlementWhitelist passesAddUnsigned](self->_whitelist, "passesAddUnsigned");
  uint64_t Object = PKLogFacilityTypeGetObject(0LL);
  id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
  if ((v18 & 1) != 0)
  {
    if (v21)
    {
      *(_WORD *)uint8_t buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "ConfigureHomeAuxiliaryCapabilitiesForSerialNumber starting...",  buf,  2u);
    }

    id v22 = PDDefaultQueue();
    id v23 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v22);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_10005941C;
    v24[3] = &unk_10063AD70;
    v24[4] = self;
    id v25 = v13;
    id v26 = v15;
    id v27 = v16;
    id v28 = v14;
    id v29 = v17;
    dispatch_async(v23, v24);
  }

  else
  {
    if (v21)
    {
      *(_WORD *)uint8_t buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Attempting to call configureHomeAuxiliaryCapabilitiesForSerialNumber, but missing proper entitlement.",  buf,  2u);
    }

    if (v17) {
      (*((void (**)(id, void, void, void, void))v17 + 2))(v17, 0LL, 0LL, 0LL, 0LL);
    }
  }
}

- (void)usingSynchronousProxy:(BOOL)a3 fetchAppletSubCredentialForPassTypeIdentifier:(id)a4 serialNumber:(id)a5 completionHandler:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  if (v11)
  {
    if ((-[PKEntitlementWhitelist passesAllAccess](self->_whitelist, "passesAllAccess") & 1) != 0)
    {
      id v12 = PDDefaultQueue();
      id v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v12);
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472LL;
      v16[2] = sub_100059EF4;
      v16[3] = &unk_10063B440;
      void v16[4] = self;
      id v17 = v9;
      id v18 = v10;
      id v19 = v11;
      dispatch_async(v13, v16);
    }

    else
    {
      uint64_t Object = PKLogFacilityTypeGetObject(0LL);
      id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint8_t buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Attempting to call fetchTransactionKeyForPassTypeIdentifier, but missing proper entitlement.",  buf,  2u);
      }

      (*((void (**)(id, void, void))v11 + 2))(v11, 0LL, 0LL);
    }
  }
}

- (void)pushProvisioningNoncesWithCredentialCount:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  if (-[PKEntitlementWhitelist shareableCredentialProvisioning]( self->_whitelist,  "shareableCredentialProvisioning"))
  {
    deviceRegistrationServiceCoordinator = self->_deviceRegistrationServiceCoordinator;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_10005A74C;
    v12[3] = &unk_10063D0A8;
    v12[4] = self;
    unint64_t v14 = a3;
    id v13 = v6;
    -[PDDeviceRegistrationServiceCoordinator performDeviceRegistrationForReason:brokerURL:action:forceApplePayRegister:forcePeerPaymentRegister:completion:]( deviceRegistrationServiceCoordinator,  "performDeviceRegistrationForReason:brokerURL:action:forceApplePayRegister:forcePeerPaymentRegister:completion:",  @"push provisioning nonces",  0LL,  1LL,  0LL,  0LL,  v12);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint8_t buf = 136315138;
      id v18 = "-[PDPassLibrary pushProvisioningNoncesWithCredentialCount:completion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  buf,  0xCu);
    }

    if (v6)
    {
      NSErrorUserInfoKey v15 = NSDebugDescriptionErrorKey;
      id v16 = @"client is not entitled";
      id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v16,  &v15,  1LL));
      id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKPassKitErrorDomain,  4LL,  v10));
      (*((void (**)(id, void, void *))v6 + 2))(v6, 0LL, v11);
    }
  }
}

- (void)usingSynchronousProxy:(BOOL)a3 configurePushProvisioningConfiguration:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10005A8D8;
  v9[3] = &unk_10063D0D0;
  id v10 = a5;
  id v8 = v10;
  -[PDPassLibrary usingSynchronousProxy:configurePushProvisioningConfigurationV2:completion:]( self,  "usingSynchronousProxy:configurePushProvisioningConfigurationV2:completion:",  v6,  a4,  v9);
}

- (void)usingSynchronousProxy:(BOOL)a3 configurePushProvisioningConfigurationV2:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = (void (**)(id, void, void *))a5;
  if (v8)
  {
    if ((-[PKEntitlementWhitelist shareableCredentialProvisioning]( self->_whitelist,  "shareableCredentialProvisioning") & 1) != 0 || (-[PKEntitlementWhitelist passesAllAccess](self->_whitelist, "passesAllAccess") & 1) != 0)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 secureElementPassConfiguration]);
      [v9 updateAllowManagedAppleIDWithEntitlements:self->_whitelist];

      -[PDPushProvisioningManager configurePushProvisioningConfiguration:completion:]( self->_pushProvisioningManager,  "configurePushProvisioningConfiguration:completion:",  v7,  v8);
    }

    else
    {
      uint64_t Object = PKLogFacilityTypeGetObject(27LL);
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint8_t buf = 136315138;
        id v17 = "-[PDPassLibrary usingSynchronousProxy:configurePushProvisioningConfigurationV2:completion:]";
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Client is missing shareable entitled for method: %s",  buf,  0xCu);
      }

      NSErrorUserInfoKey v14 = NSDebugDescriptionErrorKey;
      NSErrorUserInfoKey v15 = @"client is not entitled";
      id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v15,  &v14,  1LL));
      id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKPassKitErrorDomain,  4LL,  v12));
      v8[2](v8, 0LL, v13);
    }
  }
}

- (void)startVehicleConnectionSessionWithPassUniqueIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  if (v7)
  {
    if ((-[PKEntitlementWhitelist carKeyPassThroughAccess](self->_whitelist, "carKeyPassThroughAccess") & 1) != 0)
    {
      -[PDAppletSubcredentialManager startVehicleConnectionSessionWithPassUniqueIdentifier:completion:]( self->_subcredentialManager,  "startVehicleConnectionSessionWithPassUniqueIdentifier:completion:",  v6,  v7);
    }

    else
    {
      uint64_t Object = PKLogFacilityTypeGetObject(27LL);
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 136315138;
        id v11 = "-[PDPassLibrary startVehicleConnectionSessionWithPassUniqueIdentifier:completion:]";
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Client is missing shareable entitled for method: %s",  (uint8_t *)&v10,  0xCu);
      }

      v7[2](v7, 0LL);
    }
  }
}

- (void)sendRKEPassThroughMessage:(id)a3 forSessionIdentifier:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  int v10 = (void (**)(id, void, void *))a5;
  if ((-[PKEntitlementWhitelist carKeyPassThroughAccess](self->_whitelist, "carKeyPassThroughAccess") & 1) != 0)
  {
    -[PDAppletSubcredentialManager sendRKEPassThroughData:forSessionIdentifier:withCompletion:]( self->_subcredentialManager,  "sendRKEPassThroughData:forSessionIdentifier:withCompletion:",  v8,  v9,  v10);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(27LL);
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint8_t buf = 136315138;
      id v18 = "-[PDPassLibrary sendRKEPassThroughMessage:forSessionIdentifier:withCompletion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Client is missing shareable entitled for method: %s",  buf,  0xCu);
    }

    NSErrorUserInfoKey v15 = NSDebugDescriptionErrorKey;
    id v16 = @"client is not entitled";
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v16,  &v15,  1LL));
    NSErrorUserInfoKey v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKPassKitErrorDomain,  4LL,  v13));
    v10[2](v10, 0LL, v14);
  }
}

- (void)invalidateVehicleConnectionSessionIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if ((-[PKEntitlementWhitelist carKeyPassThroughAccess](self->_whitelist, "carKeyPassThroughAccess") & 1) != 0)
    {
      -[PDAppletSubcredentialManager invalidateVehicleConnectionSessionForIdentifier:]( self->_subcredentialManager,  "invalidateVehicleConnectionSessionForIdentifier:",  v4);
    }

    else
    {
      uint64_t Object = PKLogFacilityTypeGetObject(27LL);
      id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v7 = 136315138;
        id v8 = "-[PDPassLibrary invalidateVehicleConnectionSessionIdentifier:]";
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Client is missing shareable entitled for method: %s",  (uint8_t *)&v7,  0xCu);
      }
    }
  }
}

- (void)usingSynchronousProxy:(BOOL)a3 requestIssuerBoundPassesWithBindingWithData:(id)a4 automaticallyProvision:(BOOL)a5 withCompletion:(id)a6
{
  id v9 = a6;
  int v10 = v9;
  if (v9)
  {
    issuerBindingManager = self->_issuerBindingManager;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_10005AF3C;
    v12[3] = &unk_10063D120;
    BOOL v14 = a5;
    v12[4] = self;
    id v13 = v9;
    -[PDIssuerBindingManager requestIssuerBoundPassesWithBindingWithData:withCompletion:]( issuerBindingManager,  "requestIssuerBoundPassesWithBindingWithData:withCompletion:",  a4,  v12);
  }
}

- (void)presentIssuerBindingFlowForIssuerData:(id)a3 signature:(id)a4 orientation:(id)a5
{
  if (a3)
  {
    if (a4) {
      sub_1001ADA8C((uint64_t)self->_remoteInterfacePresenter, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, 0LL);
    }
  }

- (void)supportsSearchForPassUniqueID:(id)a3 completion:(id)a4
{
  id v25 = a3;
  id v6 = (void (**)(id, BOOL))a4;
  if (v6)
  {
    if (!-[PKEntitlementWhitelist passesAllAccess](self->_whitelist, "passesAllAccess"))
    {
      BOOL v11 = 0LL;
LABEL_26:
      v6[2](v6, v11);
      goto LABEL_27;
    }

    int v7 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager associatedAccountIdentifierForPassWithUniqueIdentifier:]( self->_databaseManager,  "associatedAccountIdentifierForPassWithUniqueIdentifier:",  v25));
    databaseManager = self->_databaseManager;
    if (v7)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDDatabaseManager dbAccountWithIdentifier:](databaseManager, "dbAccountWithIdentifier:", v7));
      if ([v9 feature] != (id)3 && objc_msgSend(v9, "feature") != (id)4)
      {
        BOOL v10 = (char *)[v9 state] - 1 < (char *)2;
LABEL_22:

        if (v10)
        {
          BOOL v24 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager primaryPaymentApplicationForPassUniqueIdentifier:]( self->_databaseManager,  "primaryPaymentApplicationForPassUniqueIdentifier:",  v25));
          BOOL v11 = (char *)[v24 state] - 9 < (char *)0xFFFFFFFFFFFFFFFELL;
        }

        else
        {
          BOOL v11 = 0LL;
        }

        goto LABEL_26;
      }

- (void)contactlessInterfaceDidPresentFromSource:(int64_t)a3
{
  if ((-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess") & 1) != 0
    || -[PKEntitlementWhitelist paymentPresentation](self->_whitelist, "paymentPresentation"))
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue(-[PDPassLibrary remoteObjectProxy](self, "remoteObjectProxy"));
    [v5 contactlessInterfaceDidPresentFromSource:a3];
  }

- (void)contactlessInterfaceDidDismissFromSource:(int64_t)a3
{
  if ((-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess") & 1) != 0
    || -[PKEntitlementWhitelist paymentPresentation](self->_whitelist, "paymentPresentation"))
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue(-[PDPassLibrary remoteObjectProxy](self, "remoteObjectProxy"));
    [v5 contactlessInterfaceDidDismissFromSource:a3];
  }

- (void)sessionDidChangeConnectionStatus:(int64_t)a3
{
  if ((-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess") & 1) != 0
    || -[PKEntitlementWhitelist carKeyPassThroughAccess](self->_whitelist, "carKeyPassThroughAccess"))
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue(-[PDPassLibrary remoteObjectProxy](self, "remoteObjectProxy"));
    [v5 vehicleConnectionDidUpdateConnectionState:a3];
  }

- (void)sessionDidReceiveData:(id)a3
{
  id v5 = a3;
  if ((-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess") & 1) != 0
    || -[PKEntitlementWhitelist carKeyPassThroughAccess](self->_whitelist, "carKeyPassThroughAccess"))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PDPassLibrary remoteObjectProxy](self, "remoteObjectProxy"));
    [v4 vehicleConnectionDidRecievePassthroughData:v5];
  }
}

- (void)issuerBindingFlowAuthenticationPerformed
{
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    id v3 = (id)objc_claimAutoreleasedReturnValue(-[PDPassLibrary remoteObjectProxy](self, "remoteObjectProxy"));
    [v3 issuerBindingAuthenticationOccured];
  }

- (id)_sanitizePassIfNeeded:(id)a3
{
  id v4 = a3;
  if (-[PDPassLibrary willSanitizePasses](self, "willSanitizePasses"))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 paymentPass]);
    [v5 sanitizePaymentApplications];
  }

  return v4;
}

- (void)_sanitizePasses:(id)a3
{
  id v4 = a3;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      id v8 = 0LL;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 =  -[PDPassLibrary _sanitizePassIfNeeded:]( self,  "_sanitizePassIfNeeded:",  *(void *)(*((void *)&v10 + 1) + 8LL * (void)v8));
        id v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v6);
  }
}

- (id)_entitlementFilteredPasses:(id)a3
{
  id v4 = a3;
  if (-[PKEntitlementWhitelist passesAllAccess](self->_whitelist, "passesAllAccess"))
  {
    -[PDPassLibrary _sanitizePasses:](self, "_sanitizePasses:", v4);
    id v5 = v4;
  }

  else
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10005B6D4;
    v8[3] = &unk_10063D148;
    v8[4] = self;
    id v5 = (id)objc_claimAutoreleasedReturnValue([v4 objectsPassingTest:v8]);
  }

  id v6 = v5;

  return v6;
}

- (BOOL)_entitledForObject:(id)a3 forActions:(unint64_t)a4
{
  id v6 = a3;
  if ((-[PKEntitlementWhitelist passesAllAccess](self->_whitelist, "passesAllAccess") & 1) != 0)
  {
    unsigned __int8 v8 = 1;
  }

  else
  {
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___PKPass, v7);
    if ((objc_opt_isKindOfClass(v6, v9) & 1) != 0)
    {
      id v10 = v6;
      __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v10 passTypeIdentifier]);
      __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v10 teamID]);
      __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v10 associatedPassTypeIdentifiers]);
      if ([v10 passType] == (id)1) {
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v10 associatedApplicationIdentifiers]);
      }
      else {
        id v14 = 0LL;
      }
      unsigned __int8 v8 = -[PKEntitlementWhitelist entitledToPerformPassAction:passTypeID:teamID:associatedPassTypeIdentifiers:associatedApplicationIdentifiers:]( self->_whitelist,  "entitledToPerformPassAction:passTypeID:teamID:associatedPassTypeIdentifiers:associatedAppl icationIdentifiers:",  a4,  v11,  v12,  v13,  v14);
    }

    else
    {
      unsigned __int8 v8 = 0;
    }
  }

  return v8;
}

- (BOOL)_entitledForUniqueID:(id)a3 forActions:(unint64_t)a4
{
  return -[PDPassLibrary _entitledForPassType:uniqueIdentifier:actions:]( self,  "_entitledForPassType:uniqueIdentifier:actions:",  -1LL,  a3,  a4);
}

- (BOOL)_entitledForPassType:(unint64_t)a3 uniqueIdentifier:(id)a4 actions:(unint64_t)a5
{
  id v8 = a4;
  if ((-[PKEntitlementWhitelist passesAllAccess](self->_whitelist, "passesAllAccess") & 1) != 0)
  {
    unsigned __int8 v9 = 1;
  }

  else
  {
    databaseManager = self->_databaseManager;
    id v19 = 0LL;
    id v20 = 0LL;
    id v17 = 0LL;
    id v18 = 0LL;
    unsigned int v11 = -[PDDatabaseManager getPassTypeID:teamID:associatedPassTypeIdentifiers:associatedApplicationIdentifiers:forUniqueID:]( databaseManager,  "getPassTypeID:teamID:associatedPassTypeIdentifiers:associatedApplicationIdentifiers:forUniqueID:",  &v20,  &v19,  &v18,  &v17,  v8);
    id v12 = v20;
    id v13 = v19;
    id v14 = v18;
    id v15 = v17;
    if (v11 && (a3 == -1LL || PKPassTypeForPassTypeIdentifier(v12) == a3)) {
      unsigned __int8 v9 = -[PKEntitlementWhitelist entitledToPerformPassAction:passTypeID:teamID:associatedPassTypeIdentifiers:associatedApplicationIdentifiers:]( self->_whitelist,  "entitledToPerformPassAction:passTypeID:teamID:associatedPassTypeIdentifiers:associatedAppl icationIdentifiers:",  a5,  v12,  v13,  v14,  v15);
    }
    else {
      unsigned __int8 v9 = 0;
    }
  }

  return v9;
}

- (void)_getPassWithUniqueID:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = PDDefaultQueue();
    unsigned __int8 v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v8);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10005BA34;
    block[3] = &unk_100639AF0;
    void block[4] = self;
    id v11 = v6;
    id v12 = v7;
    dispatch_async(v9, block);
  }
}

- (void)_addPasses:(id)a3 withCompletion:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10005BADC;
  v8[3] = &unk_10063C978;
  id v9 = a3;
  id v7 = v9;
  id v6 = (void (**)(id, void))a4;
  -[PDPassLibrary _addPassesWithEnumerator:](self, "_addPassesWithEnumerator:", v8);
  v6[2](v6, 0LL);
}

- (unint64_t)_addPassesWithEnumerator:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  uint64_t v15 = 0LL;
  unsigned int v16 = &v15;
  uint64_t v17 = 0x2020000000LL;
  uint64_t v18 = 0LL;
  uint64_t v11 = 0LL;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  char v14 = 0;
  id v5 = objc_autoreleasePoolPush();
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10005BCC4;
  v10[3] = &unk_10063D170;
  v10[4] = self;
  void v10[5] = &v11;
  v10[6] = &v15;
  v4[2](v4, v10);
  objc_autoreleasePoolPop(v5);
  if (*((_BYTE *)v12 + 24))
  {
    id v6 = objc_alloc(&OBJC_CLASS___PKTPSDiscoverabilitySignal);
    id v7 = [v6 initWithIdentifier:PKTPSDiscoverabilitySignalIdentifierPass bundleIdentifier:PKServiceBundleIdentifier context:PKTPSDiscoverabilitySignalContextPassAdded];
    [v7 donateSignalWithCompletion:&stru_10063D190];
  }

  unint64_t v8 = v16[3];
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v15, 8);

  return v8;
}

- (BOOL)_writePass:(id)a3 error:(id *)a4
{
  uint64_t v21 = 0LL;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000LL;
  char v24 = 0;
  uint64_t v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472LL;
  uint64_t v15 = sub_10005C118;
  unsigned int v16 = &unk_10063D1B8;
  id v19 = &v21;
  uint64_t v17 = self;
  id v5 = a3;
  id v18 = v5;
  id v20 = a4;
  PKTimeToPerformBlock(&v13);
  if (*((_BYTE *)v22 + 24))
  {
    uint64_t v7 = v6;
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "uniqueID", v13, v14, v15, v16, v17));
      *(_DWORD *)uint8_t buf = 138543618;
      id v26 = v10;
      __int16 v27 = 2050;
      uint64_t v28 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "PDPassLibrary: wrote pass %{public}@ in %{public}f seconds",  buf,  0x16u);
    }

    BOOL v11 = *((_BYTE *)v22 + 24) != 0;
  }

  else
  {
    BOOL v11 = 0;
  }

  _Block_object_dispose(&v21, 8);
  return v11;
}

- (BOOL)_writePass:(id)a3 withSettings:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  BOOL v9 = -[PDPassLibrary _writePass:error:](self, "_writePass:error:", v8, a5);
  if (v9)
  {
    databaseManager = self->_databaseManager;
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue([v8 uniqueID]);
    -[PDDatabaseManager updateSettings:forPassWithUniqueIdentifier:]( databaseManager,  "updateSettings:forPassWithUniqueIdentifier:",  a4,  v11);
  }

  return v9;
}

- (void)getDiffForPassUpdateUserNotificationWithIdentifier:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[PKEntitlementWhitelist passesAllAccess](self->_whitelist, "passesAllAccess"))
  {
    userNotificationManager = self->_userNotificationManager;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10005C2DC;
    v11[3] = &unk_10063D1E0;
    id v12 = v7;
    -[PDUserNotificationManager userNotificationWithIdentifier:completion:]( userNotificationManager,  "userNotificationWithIdentifier:completion:",  v6,  v11);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(0LL);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100441710();
    }

    (*((void (**)(id, void))v7 + 2))(v7, 0LL);
  }
}

- (void)introduceDatabaseIntegrityProblem
{
  id v3 = PDDefaultQueue();
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v3);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10005C390;
  block[3] = &unk_100639300;
  void block[4] = self;
  dispatch_async(v4, block);
}

- (void)updateIngestedDate:(id)a3 forPassWithUniqueID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = PDDefaultQueue();
  BOOL v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10005C4B4;
  block[3] = &unk_100639350;
  void block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);
}

- (void)noteAppleAccountChanged:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
  BOOL v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10005C64C;
  v13[3] = &unk_100639AF0;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v10 = v13;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10005DE84;
  block[3] = &unk_10063A830;
  id v17 = v10;
  id v11 = v7;
  id v12 = v6;
  dispatch_async(v9, block);
}

- (void)noteACAccountChanged:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
  BOOL v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10005CB44;
  v13[3] = &unk_100639AF0;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v10 = v13;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10005DE84;
  block[3] = &unk_10063A830;
  id v17 = v10;
  id v11 = v7;
  id v12 = v6;
  dispatch_async(v9, block);
}

- (void)shuffleGroups:(int)a3
{
  id v5 = PDDefaultQueue();
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v5);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10005CC8C;
  v7[3] = &unk_10063D208;
  v7[4] = self;
  int v8 = a3;
  dispatch_async(v6, v7);
}

- (void)issueWalletUserNotificationWithTitle:(id)a3 message:(id)a4 forPassUniqueIdentifier:(id)a5 customActionRoute:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (-[PKEntitlementWhitelist passesAllAccess](self->_whitelist, "passesAllAccess"))
  {
    id v14 = PDDefaultQueue();
    id v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v14);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10005CDF8;
    block[3] = &unk_10063AE10;
    id v17 = v10;
    id v18 = v11;
    id v19 = v12;
    id v20 = v13;
    uint64_t v21 = self;
    dispatch_async(v15, block);
  }
}

- (void)pendingUserNotificationsWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[PKEntitlementWhitelist passesAllAccess](self->_whitelist, "passesAllAccess"))
  {
    id v8 = PDDefaultQueue();
    BOOL v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v8);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10005CF34;
    block[3] = &unk_100639AF0;
    void block[4] = self;
    id v11 = v6;
    id v12 = v7;
    dispatch_async(v9, block);
  }
}

- (void)updateDate:(id)a3 forPendingNotificationWithIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[PKEntitlementWhitelist passesAllAccess](self->_whitelist, "passesAllAccess"))
  {
    id v8 = PDDefaultQueue();
    BOOL v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v8);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10005D054;
    block[3] = &unk_100639350;
    void block[4] = self;
    id v11 = v6;
    id v12 = v7;
    dispatch_async(v9, block);
  }
}

- (void)removeAllScheduledActivities
{
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  uint64_t v2 = PDScheduledActivityClients(self, a2);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = [v3 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v20;
    do
    {
      id v7 = 0LL;
      do
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v19 + 1) + 8LL * (void)v7);
        __int128 v15 = 0u;
        __int128 v16 = 0u;
        __int128 v17 = 0u;
        __int128 v18 = 0u;
        uint64_t v9 = PDScheduledActivitiesForClient(v8);
        id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
        id v11 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
        if (v11)
        {
          id v12 = v11;
          uint64_t v13 = *(void *)v16;
          do
          {
            id v14 = 0LL;
            do
            {
              if (*(void *)v16 != v13) {
                objc_enumerationMutation(v10);
              }
              PDScheduledActivityRemove(v8, *(void *)(*((void *)&v15 + 1) + 8LL * (void)v14));
              id v14 = (char *)v14 + 1;
            }

            while (v12 != v14);
            id v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
          }

          while (v12);
        }

        id v7 = (char *)v7 + 1;
      }

      while (v7 != v5);
      id v5 = [v3 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }

    while (v5);
  }
}

- (void)forceImmediateRevocationCheck
{
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10005D2B0;
  v6[3] = &unk_100639300;
  v6[4] = self;
  id v5 = v6;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10005DE84;
  block[3] = &unk_10063A830;
  id v8 = v5;
  dispatch_async(v4, block);
}

- (void)spotlightReindexAllContentWithAcknowledgement:(id)a3
{
  id v4 = a3;
  id v5 = PDDefaultQueue();
  uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v5);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10005D358;
  v8[3] = &unk_10063AC90;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

- (void)spotlightReindexContentWithIdentifiers:(id)a3 acknowledgement:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = PDDefaultQueue();
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10005D4AC;
  block[3] = &unk_100639AF0;
  void block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);
}

- (void)spotlightResetWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = PDDefaultQueue();
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v5);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10005D5DC;
  v8[3] = &unk_10063AC90;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

- (void)spotlightStatusWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = PDDefaultQueue();
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v5);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10005D7D4;
  v8[3] = &unk_10063AC90;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

- (PKSecureElement)secureElement
{
  return self->_secureElement;
}

- (PDPaymentWebServiceCoordinator)paymentWebServicesCoordinator
{
  return self->_paymentWebServicesCoordinator;
}

- (void)setPaymentWebServicesCoordinator:(id)a3
{
}

- (PDWebServicesCoordinator)webServicesCoordinator
{
  return self->_webServicesCoordinator;
}

- (void)setWebServicesCoordinator:(id)a3
{
}

- (PDCardFileManager)cardFileManager
{
  return self->_cardFileManager;
}

- (void)setCardFileManager:(id)a3
{
}

- (PDDatabaseManager)databaseManager
{
  return self->_databaseManager;
}

- (void)setDatabaseManager:(id)a3
{
}

- (PDExpressPassManager)expressPassManager
{
  return self->_expressPassManager;
}

- (void)setExpressPassManager:(id)a3
{
}

- (PDUserNotificationManager)userNotificationManager
{
  return self->_userNotificationManager;
}

- (void)setUserNotificationManager:(id)a3
{
}

- (PDRelevantPassProvider)relevantPassProvider
{
  return self->_relevantPassProvider;
}

- (void)setRelevantPassProvider:(id)a3
{
}

- (PKUsageNotificationServer)usageNotificationServer
{
  return self->_usageNotificationServer;
}

- (void)setUsageNotificationServer:(id)a3
{
}

- (PKIDSManager)idsManager
{
  return self->_idsManager;
}

- (void)setIdsManager:(id)a3
{
}

- (PDSpotlightIndexer)spotlightIndexer
{
  return self->_spotlightIndexer;
}

- (void)setSpotlightIndexer:(id)a3
{
}

- (PDExpressTransitUpgradeController)expressUpgradeController
{
  return self->_expressUpgradeController;
}

- (void)setExpressUpgradeController:(id)a3
{
}

- (PDAccountManager)accountManager
{
  return self->_accountManager;
}

- (void)setAccountManager:(id)a3
{
}

- (PDAppletSubcredentialManager)subcredentialManager
{
  return self->_subcredentialManager;
}

- (PDCarKeyRequirementsChecker)carKeyRequirementsChecker
{
  return self->_carKeyRequirementsChecker;
}

- (void)setCarKeyRequirementsChecker:(id)a3
{
}

- (PDPushProvisioningManager)pushProvisioningManager
{
  return self->_pushProvisioningManager;
}

- (void)setPushProvisioningManager:(id)a3
{
}

- (PDDefaultPassManager)defaultPassManager
{
  return self->_defaultPassManager;
}

- (void)setDefaultPassManager:(id)a3
{
}

- (PDPassDynamicStateManager)dynamicStateManager
{
  return self->_dynamicStateManager;
}

- (void)setDynamicStateManager:(id)a3
{
}

- (PDPassLiveRenderManager)passLiveRenderManager
{
  return self->_passLiveRenderManager;
}

- (void)setPassLiveRenderManager:(id)a3
{
}

- (PDISO18013Manager)isoManager
{
  return self->_isoManager;
}

- (void)setIsoManager:(id)a3
{
}

- (PDIssuerBindingManager)issuerBindingManager
{
  return self->_issuerBindingManager;
}

- (PDAuxiliaryCapabilityManager)auxiliaryCapabilityManager
{
  return self->_auxiliaryCapabilityManager;
}

- (void)setAuxiliaryCapabilityManager:(id)a3
{
}

- (PDDeviceRegistrationServiceCoordinator)deviceRegistrationServiceCoordinator
{
  return self->_deviceRegistrationServiceCoordinator;
}

- (void)setDeviceRegistrationServiceCoordinator:(id)a3
{
}

- (PDProvisioningRequirementsChecker)provisioningRequirementsChecker
{
  return self->_provisioningRequirementsChecker;
}

- (void)setProvisioningRequirementsChecker:(id)a3
{
}

- (PDPassLibraryDelegate)delegate
{
  return (PDPassLibraryDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end