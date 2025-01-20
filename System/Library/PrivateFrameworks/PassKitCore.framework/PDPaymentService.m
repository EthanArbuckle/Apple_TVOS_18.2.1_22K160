@interface PDPaymentService
- (PDAccountManager)accountManager;
- (PDAppletSubcredentialManager)subcredentialManager;
- (PDApplicationMessageManager)applicationMessageManager;
- (PDApplyManager)applyManager;
- (PDAuxiliaryCapabilityManager)auxiliaryCapabilityManager;
- (PDAuxiliaryPassInformationManager)auxiliaryPassInformationManager;
- (PDBarcodeCredentialManager)barcodeCredentialManager;
- (PDCardFileManager)cardFileManager;
- (PDCloudStoreNotificationCoordinator)cloudStoreNotificationCoordinator;
- (PDDatabaseManager)databaseManager;
- (PDDefaultPassManager)defaultPassManager;
- (PDDevicePasscodeManager)devicePasscodeManager;
- (PDExpressPassManager)expressPassManager;
- (PDFamilyCircleManager)familyMemberManager;
- (PDISO18013Manager)iso18013Manager;
- (PDIssuerBindingManager)issuerBindingManager;
- (PDMapsBrandAndMerchantUpdater)mapsBrandAndMerchantUpdater;
- (PDNFCInitiatedPairingManager)nfcPairingManager;
- (PDNotificationServiceCoordinator)notificationServiceCoordinator;
- (PDPassTileManager)passTileManager;
- (PDPaymentOffersManager)paymentOffersManager;
- (PDPaymentService)initWithConnection:(id)a3;
- (PDPaymentService)initWithConnection:(id)a3 server:(id)a4;
- (PDPaymentTransactionProcessor)paymentTransactionProcessor;
- (PDPaymentUserCommunicationManager)paymentUserCommunicationManager;
- (PDPaymentWebServiceCoordinator)paymentWebServiceCoordinator;
- (PDPeerPaymentWebServiceCoordinator)peerPaymentWebServicesCoordinator;
- (PDPendingProvisioningManager)pendingProvisioningManager;
- (PDPushNotificationManager)pushNotificationManager;
- (PDPushProvisioningManager)pushProvisioningManager;
- (PDSharingManager)sharingManager;
- (PDTransactionAuthenticationManager)transactionAuthenticationManager;
- (PDTransactionReceiptFileManager)transactionReceiptFileManager;
- (PDTransitStateManager)transitStateManager;
- (PDUserNotificationManager)userNotificationManager;
- (PDXPCEventPublisher)passKitEventPublisher;
- (PKSecureElement)secureElement;
- (PKSharingIDSManager)idsSharingManager;
- (PKTapToRadarDelegate)tapToRadarDelegate;
- (id)remoteObjectProxy;
- (id)remoteObjectProxyWithErrorHandler:(id)a3;
- (void)_requestUpdatesForTransactionSourceIdentifiers:(id)a3;
- (void)_updateApplicationsForType:(int64_t)a3 completion:(id)a4;
- (void)_vpanCardCredentialsForVPANID:(id)a3 authorization:(id)a4 merchantHost:(id)a5 regenerate:(BOOL)a6 hasRefreshedBAACertificate:(BOOL)a7 completion:(id)a8;
- (void)_vpanVirtualCards:(id)a3;
- (void)acceptCarKeyShareForMessage:(id)a3 activationCode:(id)a4 completion:(id)a5;
- (void)accountAttestationAnonymizationSaltWithCompletion:(id)a3;
- (void)activated;
- (void)addPassShare:(id)a3 onCredentialWithIdentifier:(id)a4 withCompletion:(id)a5;
- (void)addPendingProvisioning:(id)a3;
- (void)addPendingProvisionings:(id)a3 completion:(id)a4;
- (void)addPlaceholderPassWithConfiguration:(id)a3 completion:(id)a4;
- (void)allPaymentApplicationUsageSummariesWithCompletion:(id)a3;
- (void)ambiguousPassUniqueIdentifierForTransactionWithServiceIdentifier:(id)a3 completion:(id)a4;
- (void)ambiguousTransactionWithServiceIdentifier:(id)a3 completion:(id)a4;
- (void)applyManager:(id)a3 didAddApplication:(id)a4;
- (void)applyManager:(id)a3 didRemoveApplication:(id)a4;
- (void)applyManager:(id)a3 didUpdateApplication:(id)a4 oldApplication:(id)a5;
- (void)approvedTransactionsForTransactionSourceIdentifiers:(id)a3 withTransactionSource:(unint64_t)a4 withBackingData:(unint64_t)a5 startDate:(id)a6 endDate:(id)a7 limit:(int64_t)a8 completion:(id)a9;
- (void)archiveMessageWithIdentifier:(id)a3 handler:(id)a4;
- (void)augmentedProductForInstallmentConfiguration:(id)a3 experimentDetails:(id)a4 withCompletion:(id)a5;
- (void)balanceReminderThresholdForBalanceIdentifier:(id)a3 withPassUniqueIdentifier:(id)a4 handler:(id)a5;
- (void)balancesForPaymentPassWithUniqueIdentifier:(id)a3 handler:(id)a4;
- (void)cacheSharingMessageFromMailboxAddress:(id)a3 message:(id)a4;
- (void)canAcceptInvitation:(id)a3 withCompletion:(id)a4;
- (void)cancelAutoTopUpForPassWithUniqueIdentifier:(id)a3 balanceIdentifiers:(id)a4 handler:(id)a5;
- (void)cashbackByPeriodForTransactionSourceIdentifiers:(id)a3 withStartDate:(id)a4 endDate:(id)a5 calendar:(id)a6 calendarUnit:(unint64_t)a7 type:(unint64_t)a8 completion:(id)a9;
- (void)categoryVisualizationMagnitudesForPassUniqueID:(id)a3 completion:(id)a4;
- (void)changePasscodeFrom:(id)a3 toPasscode:(id)a4 completion:(id)a5;
- (void)checkAllAuxiliaryRegistrationRequirements;
- (void)checkInvitationStatusForMailboxAddress:(id)a3 completion:(id)a4;
- (void)clearProvisioningSupportDataOfType:(unint64_t)a3 completion:(id)a4;
- (void)clearSafariCardImportNotificationHistoryWithCompletion:(id)a3;
- (void)clearSafariCardImportNotificationsWithCompletion:(id)a3;
- (void)commutePlanReminderForCommutePlanIdentifier:(id)a3 withPassUniqueIdentifier:(id)a4 handler:(id)a5;
- (void)conflictingExpressPassIdentifiersForPassConfiguration:(id)a3 withCompletion:(id)a4;
- (void)conflictingExpressPassIdentifiersForPassConfiguration:(id)a3 withReferenceExpressState:(id)a4 completion:(id)a5;
- (void)conflictingExpressPassIdentifiersForPassInformation:(id)a3 withCompletion:(id)a4;
- (void)conflictingExpressPassIdentifiersForPassInformation:(id)a3 withReferenceExpressState:(id)a4 completion:(id)a5;
- (void)consistencyCheckWithHandler:(id)a3;
- (void)createShareForPartialShareInvitation:(id)a3 authorization:(id)a4 completion:(id)a5;
- (void)createShareInvitationForPartialShareInvitation:(id)a3 existingTransportIdentifier:(id)a4 authorization:(id)a5 completion:(id)a6;
- (void)createSingleUseShareURLWithMessage:(id)a3 timeToLive:(unint64_t)a4 completion:(id)a5;
- (void)credentialWithIdentifier:(id)a3 completion:(id)a4;
- (void)currentPasscodeMeetsUpgradedPasscodePolicy:(id)a3;
- (void)currentSecureElementSnapshot:(id)a3;
- (void)dealloc;
- (void)declineRelatedSharingInvitationsIfNecessary:(id)a3 withCompletion:(id)a4;
- (void)defaultPaymentApplicationForPassUniqueIdentifier:(id)a3 handler:(id)a4;
- (void)defaultPaymentPassIngestionSpecificIdentifier:(id)a3;
- (void)defaultPaymentPassUniqueIdentifier:(id)a3;
- (void)deleteAllMessagesForPaymentPassWithUniqueIdentifier:(id)a3 handler:(id)a4;
- (void)deleteAllTransactionsForTransactionSourceIdentifiers:(id)a3 handler:(id)a4;
- (void)deleteIssuerInstallmentTransactionsForPassUniqueID:(id)a3 completion:(id)a4;
- (void)deletePaymentRewardsRedemptionsForPassUniqueIdentifier:(id)a3 completion:(id)a4;
- (void)deletePaymentTransactionWithIdentifier:(id)a3 handler:(id)a4;
- (void)deletePaymentTransactionsWithIdentifiers:(id)a3 handler:(id)a4;
- (void)deleteReservation:(id)a3 completion:(id)a4;
- (void)deleteSharingMessage:(id)a3;
- (void)deleteTransactionReceiptWithUniqueID:(id)a3 completion:(id)a4;
- (void)didReceiveActivationCodeFailureForCredentialIdentifier:(id)a3 attemptsRemaining:(unint64_t)a4 completion:(id)a5;
- (void)didReceiveDeviceSharingCapabilities:(id)a3 forHandle:(id)a4;
- (void)didReceiveSharingInvitationRequest:(id)a3 withCompletion:(id)a4;
- (void)didReceiveSharingInvitationWithIdentifier:(id)a3 fromOriginatorIDSHandle:(id)a4 sharingSessionIdentifier:(id)a5 metadata:(id)a6 completion:(id)a7;
- (void)didUpdateSharingInvitationWithIdentifier:(id)a3 reason:(int64_t)a4 completion:(id)a5;
- (void)displayTapToRadarAlertForRequest:(id)a3 completion:(id)a4;
- (void)displayableEntitlementsForPassIdentifier:(id)a3 completion:(id)a4;
- (void)displayableSharesForPassIdentifier:(id)a3 completion:(id)a4;
- (void)downloadAllPaymentPassesWithHandler:(id)a3;
- (void)enforceUpgradedPasscodePolicyWithCompletion:(id)a3;
- (void)expressPassConfigurationWithPassUniqueIdentifier:(id)a3 handler:(id)a4;
- (void)expressPassConfigurationsWithCardType:(int64_t)a3 handler:(id)a4;
- (void)expressPassesInformationWithAutomaticSelectionTechnologyType:(int64_t)a3 handler:(id)a4;
- (void)familyCircleManagerDidUpdateFamilyMembers:(id)a3;
- (void)familyMembersIgnoringCache:(BOOL)a3 completion:(id)a4;
- (void)featureApplicationWithIdentifier:(id)a3 completion:(id)a4;
- (void)featureApplicationWithReferenceIdentifier:(id)a3 completion:(id)a4;
- (void)featureApplicationsForAccountIdentifier:(id)a3 completion:(id)a4;
- (void)featureApplicationsForAccountUserInvitationWithCompletion:(id)a3;
- (void)featureApplicationsForProvisioningWithCompletion:(id)a3;
- (void)featureApplicationsWithCompletion:(id)a3;
- (void)fetchBarcodesForPassUniqueIdentifier:(id)a3 sessionExchangeToken:(id)a4 withCompletion:(id)a5;
- (void)fieldDetectorManager:(id)a3 didEnterFieldWithProperties:(id)a4;
- (void)fieldDetectorManagerDidExitField:(id)a3;
- (void)finishedKeyExchangeForCredential:(id)a3 withCompletion:(id)a4;
- (void)generateUnderlyingKeyReportWithCompletion:(id)a3;
- (void)hasActiveExternallySharedPasses:(id)a3;
- (void)hasSharesForPassIdentifier:(id)a3 completion:(id)a4;
- (void)hasTransactionsForTransactionSourceIdentifiers:(id)a3 completion:(id)a4;
- (void)initializeSecureElement:(id)a3;
- (void)initializeSecureElementIfNecessaryWithHandler:(id)a3;
- (void)insertOrUpdatePaymentRewardsRedemption:(id)a3 withPassUniqueIdentifier:(id)a4 completion:(id)a5;
- (void)insertOrUpdatePaymentTransaction:(id)a3 forPassUniqueIdentifier:(id)a4 paymentApplication:(id)a5 completion:(id)a6;
- (void)insertOrUpdatePaymentTransaction:(id)a3 forTransactionSourceIdentifier:(id)a4 completion:(id)a5;
- (void)insertOrUpdateValueAddedServiceTransaction:(id)a3 forPassUniqueIdentifier:(id)a4 paymentTransaction:(id)a5 handler:(id)a6;
- (void)installmentPlanTransactionsForTransactionSourceIdentifiers:(id)a3 accountIdentifier:(id)a4 redeemed:(BOOL)a5 withRedemptionType:(unint64_t)a6 startDate:(id)a7 endDate:(id)a8 completion:(id)a9;
- (void)installmentPlansWithTransactionReferenceIdentifier:(id)a3 completion:(id)a4;
- (void)installmentTransactionsForInstallmentPlanIdentifier:(id)a3 completion:(id)a4;
- (void)invalidateAuxiliaryCapabilityCertificatesForPassUniqueIdentifier:(id)a3 completion:(id)a4;
- (void)isExpressModeEnabledForRemotePassUniqueIdentifier:(id)a3 handler:(id)a4;
- (void)isPassExpressWithUniqueIdentifier:(id)a3 completion:(id)a4;
- (void)issuerInstallmentTransactionsForPassUniqueID:(id)a3 completion:(id)a4;
- (void)issuerInstallmentTransactionsForTransactionSourceIdentifiers:(id)a3 paymentHashes:(id)a4 completion:(id)a5;
- (void)logoImageDataForURL:(id)a3 completion:(id)a4;
- (void)mapsMerchantWithIdentifier:(unint64_t)a3 resultProviderIdentifier:(int)a4 completion:(id)a5;
- (void)mapsMerchantsWithCompletion:(id)a3;
- (void)markAuthenticationCompleteForTransactionIdentifier:(id)a3 completion:(id)a4;
- (void)memberTypeForCurrentUserWithCompletion:(id)a3;
- (void)merchantForPassUniqueIdentifier:(id)a3 withAuxiliaryPassInformationItem:(id)a4 completion:(id)a5;
- (void)messagesAppLaunchTokenForPassWithUniqueIdentifier:(id)a3 handler:(id)a4;
- (void)messagesForPaymentPassWithUniqueIdentifier:(id)a3 handler:(id)a4;
- (void)notifyForSafariCardImportConsentWithCompletion:(id)a3;
- (void)notifyForSafariCardImportWithCredentials:(id)a3 withCompletion:(id)a4;
- (void)outstandingExpressTransactionState:(id)a3;
- (void)passOwnershipTokenWithIdentifier:(id)a3 completion:(id)a4;
- (void)passSharesForCredentialIdentifier:(id)a3 completion:(id)a4;
- (void)passUniqueIdentifierForTransactionWithIdentifier:(id)a3 completion:(id)a4;
- (void)passUniqueIdentifierForTransactionWithServiceIdentifier:(id)a3 transactionSourceIdentifier:(id)a4 completion:(id)a5;
- (void)passbookUIServiceDidLaunch:(id)a3;
- (void)paymentDeviceFieldPropertiesWithHandler:(id)a3;
- (void)paymentOffersCatalogWithCompletion:(id)a3;
- (void)paymentPassForVPANID:(id)a3 andLoadImages:(BOOL)a4 completion:(id)a5;
- (void)paymentRewardsBalanceWithIdentifier:(id)a3 completion:(id)a4;
- (void)paymentRewardsBalancesWithPassUniqueIdentifier:(id)a3 completion:(id)a4;
- (void)paymentRewardsRedemptionForPaymentHash:(id)a3 completion:(id)a4;
- (void)paymentRewardsRedemptionsForPassUniqueIdentifier:(id)a3 limit:(int64_t)a4 completion:(id)a5;
- (void)paymentRewardsRedemptionsForPassUniqueIdentifier:(id)a3 paymentHashes:(id)a4 completion:(id)a5;
- (void)paymentWebServiceCoordinator:(id)a3 didDownloadTransactionReceipt:(id)a4 forTransactionWithIdentifier:(id)a5;
- (void)peerPaymentCounterpartHandlesForTransactionSourceIdentifier:(id)a3 startDate:(id)a4 endDate:(id)a5 completion:(id)a6;
- (void)pendingFamilyMembersIgnoringCache:(BOOL)a3 completion:(id)a4;
- (void)pendingShareActivationForShareIdentifier:(id)a3 completion:(id)a4;
- (void)pendingTransactionsForTransactionSourceIdentifiers:(id)a3 withTransactionSource:(unint64_t)a4 withBackingData:(unint64_t)a5 startDate:(id)a6 endDate:(id)a7 limit:(int64_t)a8 completion:(id)a9;
- (void)performDeviceCheckInWithCompletion:(id)a3;
- (void)performProductActionRequest:(id)a3 completion:(id)a4;
- (void)photosForFamilyMembersWithDSIDs:(id)a3 completion:(id)a4;
- (void)plansForPaymentPassWithUniqueIdentifier:(id)a3 handler:(id)a4;
- (void)prepareIdentityProvisioningForTargetDeviceIdentifier:(id)a3 completion:(id)a4;
- (void)prepareProvisioningTarget:(id)a3 checkFamilyCircle:(BOOL)a4 completion:(id)a5;
- (void)prewarmCreateShareForPassIdentifier:(id)a3 completion:(id)a4;
- (void)processSharingCLICommands:(id)a3 completion:(id)a4;
- (void)processTransitTransactionEventWithHistory:(id)a3 transactionDate:(id)a4 forPaymentApplication:(id)a5 withPassUniqueIdentifier:(id)a6 expressTransactionState:(id)a7;
- (void)processedAuthenticationMechanism:(unint64_t)a3 forTransactionIdentifier:(id)a4 completion:(id)a5;
- (void)productsWithCompletion:(id)a3;
- (void)productsWithRequest:(id)a3 completion:(id)a4;
- (void)provideEncryptedPushProvisioningTarget:(id)a3 sharingInstanceIdentifier:(id)a4 completion:(id)a5;
- (void)provisionIdentityPassWithPassMetadata:(id)a3 targetDeviceIdentifier:(id)a4 credentialIdentifier:(id)a5 attestations:(id)a6 completion:(id)a7;
- (void)provisionIdentityPassWithPassMetadata:(id)a3 targetDeviceIdentifier:(id)a4 credentialIdentifier:(id)a5 attestations:(id)a6 supplementalData:(id)a7 completion:(id)a8;
- (void)pushProvisioningSharingIdentifiers:(id)a3;
- (void)queueIdentityPassProvisioningWithPassMetadata:(id)a3 targetDeviceIdentifier:(id)a4 credentialIdentifier:(id)a5 supplementalData:(id)a6 completion:(id)a7;
- (void)rangingSuspensionReasonForCredential:(id)a3 forPaymentApplicationID:(id)a4 completion:(id)a5;
- (void)recomputeCategoryVisualizationMangitudesForPassUniqueID:(id)a3 style:(int64_t)a4;
- (void)recordPaymentApplicationUsageForPassUniqueIdentifier:(id)a3 paymentApplicationIdentifier:(id)a4;
- (void)redeemPaymentShareableCredential:(id)a3 completion:(id)a4;
- (void)redeemProvisioningSharingIdentifier:(id)a3 completion:(id)a4;
- (void)regenerateVPANCardCredentialsForVPANID:(id)a3 authorization:(id)a4 completion:(id)a5;
- (void)regionsMatchingName:(id)a3 types:(id)a4 completion:(id)a5;
- (void)regionsWithIdentifiers:(id)a3 completion:(id)a4;
- (void)registerAuxiliaryCapabilityForPassUniqueIdentifier:(id)a3 sessionExchangeToken:(id)a4 withCompletion:(id)a5;
- (void)registerCredentialsWithIdentifiers:(id)a3 completion:(id)a4;
- (void)rejectShareForMailboxAddress:(id)a3;
- (void)relinquishInvitation:(id)a3 completion:(id)a4;
- (void)removeExpressPassWithUniqueIdentifier:(id)a3 completion:(id)a4;
- (void)removeExpressPassesWithCardType:(int64_t)a3 completion:(id)a4;
- (void)removeMapsDataForTransactionWithIdentifier:(id)a3 forTransactionSourceIdentifier:(id)a4 issueReportIdentifier:(id)a5 completion:(id)a6;
- (void)removePaymentOffersCatalog;
- (void)removePendingProvisioningOfType:(id)a3 withUniqueIdentifier:(id)a4 completion:(id)a5;
- (void)removeProductsCache;
- (void)removeSharingInvitationReceiptWithIdentifiers:(id)a3 onCredential:(id)a4 completion:(id)a5;
- (void)removeSharingInvitationWithIdentifier:(id)a3 withCompletion:(id)a4;
- (void)requestBackgroundRegistrationForCredentialWithIdentifier:(id)a3 completion:(id)a4;
- (void)requestNotificationAuthorizationIfNecessaryWithCompletion:(id)a3;
- (void)requestNotificationAuthorizationWithCompletion:(id)a3;
- (void)requiresUpgradedPasscodeWithCompletion:(id)a3;
- (void)reserveStorageForAppletTypes:(id)a3 metadata:(id)a4 completion:(id)a5;
- (void)retrieveDecryptedBarcodeCredentialForPassUniqueIdentifier:(id)a3 authorization:(id)a4 sessionExchangeToken:(id)a5 withCompletion:(id)a6;
- (void)retrieveDecryptedBarcodeCredentialForPassUniqueIdentifier:(id)a3 authorization:(id)a4 withCompletion:(id)a5;
- (void)retrievePINEncryptionCertificateForPassUniqueIdentifier:(id)a3 sessionExchangeToken:(id)a4 withCompletion:(id)a5;
- (void)retrievePINEncryptionCertificateForPassUniqueIdentifier:(id)a3 withCompletion:(id)a4;
- (void)retrievePendingProvisioningOfType:(id)a3 withUniqueIdentifier:(id)a4 completion:(id)a5;
- (void)retrievePendingProvisioningsWithType:(id)a3 completion:(id)a4;
- (void)retrieveShareInvitationForMailboxAddress:(id)a3 completion:(id)a4;
- (void)revokeCredentialsWithIdentifiers:(id)a3 completion:(id)a4;
- (void)revokeCredentialsWithReaderIdentifiers:(id)a3 completion:(id)a4;
- (void)revokeShareForPassIdentifier:(id)a3 share:(id)a4 shouldCascade:(BOOL)a5 completion:(id)a6;
- (void)revokeSharesForPassIdentifier:(id)a3 shares:(id)a4 shouldCascade:(BOOL)a5 completion:(id)a6;
- (void)sanitizeExpressPasses;
- (void)saveProvisioningSupportData:(id)a3 completion:(id)a4;
- (void)scheduleDeviceCheckInWithStartTimeOffset:(double)a3;
- (void)scheduleDeviceUpgradeTasksIfNecessaryWithRandomizeStartDate:(BOOL)a3;
- (void)scheduleSetupReminders:(id)a3;
- (void)sendAllPassTransactions;
- (void)sendCredential:(id)a3 forPaymentApplication:(id)a4 didUpdateRangingSuspensionReasons:(unint64_t)a5;
- (void)sendDeviceSharingCapabilitiesRequestForHandle:(id)a3 completion:(id)a4;
- (void)sendDidReceivePendingProvisioningUpdate:(id)a3;
- (void)sendDidRecieveCredentialInvitation:(id)a3;
- (void)sendDidRemoveTransactionsWithSourceIdentifierMapping:(id)a3;
- (void)sendDidUpdateApplicationMessages:(id)a3;
- (void)sendDidUpdateDefaultPaymentPassWithUniqueIdentifier:(id)a3;
- (void)sendPassWithUniqueIdentifier:(id)a3 didReceiveValueAddedServiceTransaction:(id)a4;
- (void)sendPassWithUniqueIdentifier:(id)a3 didUpdateTiles:(id)a4 forContext:(int64_t)a5;
- (void)sendPaymentPassWithUniqueIdentifier:(id)a3 didEnableMessageService:(BOOL)a4;
- (void)sendPaymentPassWithUniqueIdentifier:(id)a3 didEnableTransactionService:(BOOL)a4;
- (void)sendPaymentPassWithUniqueIdentifier:(id)a3 didReceiveBalanceUpdate:(id)a4;
- (void)sendPaymentPassWithUniqueIdentifier:(id)a3 didReceiveMessage:(id)a4;
- (void)sendPaymentPassWithUniqueIdentifier:(id)a3 didReceivePlanUpdate:(id)a4;
- (void)sendPaymentPassWithUniqueIdentifier:(id)a3 didUpdateBalanceReminder:(id)a4 forBalanceWithIdentifier:(id)a5;
- (void)sendPaymentPassWithUniqueIdentifier:(id)a3 didUpdateCategoryVisualizationWithStyle:(int64_t)a4;
- (void)sendPaymentPassWithUniqueIdentifier:(id)a3 didUpdateWithTransitProperties:(id)a4;
- (void)sendSharesDidUpdateWithPaymentPassWithUniqueIdentifier:(id)a3;
- (void)sendSharingMessageTo:(id)a3 message:(id)a4 completion:(id)a5;
- (void)sendTransactionSourceIdentifier:(id)a3 didReceiveTransaction:(id)a4;
- (void)sendTransactionSourceIdentifier:(id)a3 didRemoveTransactionWithIdentifier:(id)a4;
- (void)setAccountAttestationAnonymizationSalt:(id)a3 withCompletion:(id)a4;
- (void)setAccountManager:(id)a3;
- (void)setApplicationMessageManager:(id)a3;
- (void)setApplyManager:(id)a3;
- (void)setAuxiliaryCapabilityManager:(id)a3;
- (void)setAuxiliaryPassInformationManager:(id)a3;
- (void)setBalanceReminder:(id)a3 forBalanceIdentifier:(id)a4 withPassUniqueIdentifier:(id)a5 handler:(id)a6;
- (void)setBarcodeCredentialManager:(id)a3;
- (void)setCardFileManager:(id)a3;
- (void)setCloudStoreNotificationCoordinator:(id)a3;
- (void)setCommutePlanReminder:(id)a3 forCommutePlanIdentifier:(id)a4 withPassUniqueIdentifier:(id)a5 handler:(id)a6;
- (void)setDatabaseManager:(id)a3;
- (void)setDefaultExpressFelicaTransitPassIdentifier:(id)a3 withCredential:(id)a4 completion:(id)a5;
- (void)setDefaultExpressTransitPassIdentifier:(id)a3 withCredential:(id)a4 completion:(id)a5;
- (void)setDefaultPassManager:(id)a3;
- (void)setDefaultPaymentApplication:(id)a3 forPassUniqueIdentifier:(id)a4 handler:(id)a5;
- (void)setDefaultPaymentPassUniqueIdentifier:(id)a3 handler:(id)a4;
- (void)setDeviceCheckInContextBuildVersion:(id)a3 outstandingAction:(int64_t)a4 forRegion:(id)a5;
- (void)setDevicePasscodeManager:(id)a3;
- (void)setDeviceUpgradeTasksContextBuildVersion:(id)a3 upgradeTaskVersion:(int64_t)a4 retryCount:(int64_t)a5;
- (void)setDoubleClickAllowed:(BOOL)a3 completion:(id)a4;
- (void)setExpressPassManager:(id)a3;
- (void)setExpressWithPassConfiguration:(id)a3 credential:(id)a4 completion:(id)a5;
- (void)setExpressWithPassInformation:(id)a3 credential:(id)a4 completion:(id)a5;
- (void)setFamilyMemberManager:(id)a3;
- (void)setIdsSharingManager:(id)a3;
- (void)setIso18013Manager:(id)a3;
- (void)setIssuerBindingManager:(id)a3;
- (void)setMapsBrandAndMerchantUpdater:(id)a3;
- (void)setNFCPairingManager:(id)a3;
- (void)setNFCPayloadState:(unint64_t)a3 forPass:(id)a4;
- (void)setNotificationServiceCoordinator:(id)a3;
- (void)setPassKitEventPublisher:(id)a3;
- (void)setPassTileManager:(id)a3;
- (void)setPaymentApplicationRangingSuspensionReason:(unint64_t)a3 forPassUniqueIdentifier:(id)a4 completion:(id)a5;
- (void)setPaymentOffersManager:(id)a3;
- (void)setPaymentTransactionProcessor:(id)a3;
- (void)setPaymentUserCommunicationManager:(id)a3;
- (void)setPaymentWebServiceCoordinator:(id)a3;
- (void)setPeerPaymentWebServicesCoordinator:(id)a3;
- (void)setPendingProvisioningManager:(id)a3;
- (void)setPushNotificationManager:(id)a3;
- (void)setPushProvisioningManager:(id)a3;
- (void)setSecureElement:(id)a3;
- (void)setSharingManager:(id)a3;
- (void)setSubcredentialManager:(id)a3;
- (void)setTapToRadarDelegate:(id)a3;
- (void)setTransactionAuthenticationManager:(id)a3;
- (void)setTransactionReceiptFileManager:(id)a3;
- (void)setTransitStateManager:(id)a3;
- (void)setUserNotificationManager:(id)a3;
- (void)sharingCapabilitiesForPassIdentifier:(id)a3 completion:(id)a4;
- (void)sharingInvitationWasInvalidated:(id)a3 withCredentialIdentifier:(id)a4 error:(id)a5 completion:(id)a6;
- (void)simulateDefaultExpressTransitPassIdentifier:(id)a3 forExpressMode:(id)a4 handler:(id)a5;
- (void)simulateEnableBiometricsForPass:(id)a3;
- (void)simulateExpressTransactionForPassUniqueIdentifier:(id)a3 withCompletion:(id)a4;
- (void)simulateNotificationOfType:(unint64_t)a3 userInfo:(id)a4 handler:(id)a5;
- (void)simulatePaymentPushTopic:(id)a3 handler:(id)a4;
- (void)simulateSecureEvent:(id)a3;
- (void)simulateVehicleInitiatedPairingWithTCIs:(id)a3 brandCode:(int64_t)a4 handler:(id)a5;
- (void)startBackgroundVerificationObserverForPass:(id)a3 verificationMethod:(id)a4;
- (void)statusForShareableCredentials:(id)a3 completion:(id)a4;
- (void)storePassOwnershipToken:(id)a3 withIdentifier:(id)a4;
- (void)storeTransactionReceiptData:(id)a3 completion:(id)a4;
- (void)subcredentialInvitationsWithCompletion:(id)a3;
- (void)submitApplyRequest:(id)a3 completion:(id)a4;
- (void)submitBarcodePaymentEvent:(id)a3 forPassUniqueIdentifier:(id)a4 sessionExchangeToken:(id)a5 withCompletion:(id)a6;
- (void)submitBarcodePaymentEvent:(id)a3 forPassUniqueIdentifier:(id)a4 withCompletion:(id)a5;
- (void)submitDeleteRequest:(id)a3 completion:(id)a4;
- (void)submitDocumentRequest:(id)a3 completion:(id)a4;
- (void)submitEncryptedPIN:(id)a3 forTransactionIdentifier:(id)a4 completion:(id)a5;
- (void)submitEncryptedPIN:(id)a3 forTransactionIdentifier:(id)a4 sessionExchangeToken:(id)a5 completion:(id)a6;
- (void)submitTermsRequest:(id)a3 completion:(id)a4;
- (void)submitTransactionAnswerForTransaction:(id)a3 questionType:(unint64_t)a4 answer:(id)a5 completion:(id)a6;
- (void)submitTransactionSignatureForTransactionIdentifier:(id)a3 sessionExchangeToken:(id)a4 completion:(id)a5;
- (void)submitUserConfirmation:(BOOL)a3 forTransactionIdentifier:(id)a4 completion:(id)a5;
- (void)submitUserConfirmation:(BOOL)a3 forTransactionIdentifier:(id)a4 sessionExchangeToken:(id)a5 completion:(id)a6;
- (void)submitVerificationCode:(id)a3 verificationData:(id)a4 forDPANIdentifier:(id)a5 handler:(id)a6;
- (void)submitVerificationRequest:(id)a3 completion:(id)a4;
- (void)suggestPaymentSafariCredentialImport:(id)a3 withCompletion:(id)a4;
- (void)transactionCountByPeriodForRequest:(id)a3 calendar:(id)a4 unit:(unint64_t)a5 includePurchaseTotal:(BOOL)a6 completion:(id)a7;
- (void)transactionReceiptForTransactionWithIdentifier:(id)a3 updateIfNecessary:(BOOL)a4 completion:(id)a5;
- (void)transactionReceiptWithUniqueID:(id)a3 completion:(id)a4;
- (void)transactionSourceTypeForTransactionSourceIdentifier:(id)a3 completion:(id)a4;
- (void)transactionTagsForTransactionWithIdentifier:(id)a3 completion:(id)a4;
- (void)transactionWithReferenceIdentifier:(id)a3 completion:(id)a4;
- (void)transactionWithServiceIdentifier:(id)a3 transactionSourceIdentifier:(id)a4 completion:(id)a5;
- (void)transactionWithTransactionIdentifier:(id)a3 completion:(id)a4;
- (void)transactionsAppLaunchTokenForPassWithUniqueIdentifier:(id)a3 handler:(id)a4;
- (void)transactionsForPredicate:(id)a3 limit:(int64_t)a4 completion:(id)a5;
- (void)transactionsForRequest:(id)a3 completion:(id)a4;
- (void)transactionsForTransactionSourceIdentifiers:(id)a3 matchingMerchant:(id)a4 withTransactionSource:(unint64_t)a5 withBackingData:(unint64_t)a6 limit:(int64_t)a7 completion:(id)a8;
- (void)transactionsForTransactionSourceIdentifiers:(id)a3 withMerchantCategory:(int64_t)a4 withTransactionSource:(unint64_t)a5 withBackingData:(unint64_t)a6 startDate:(id)a7 endDate:(id)a8 limit:(int64_t)a9 completion:(id)a10;
- (void)transactionsForTransactionSourceIdentifiers:(id)a3 withPeerPaymentCounterpartHandles:(id)a4 withTransactionSource:(unint64_t)a5 withBackingData:(unint64_t)a6 limit:(int64_t)a7 completion:(id)a8;
- (void)transactionsForTransactionSourceIdentifiers:(id)a3 withTransactionSource:(unint64_t)a4 withBackingData:(unint64_t)a5 limit:(int64_t)a6 completion:(id)a7;
- (void)transactionsForTransactionSourceIdentifiers:(id)a3 withTransactionSource:(unint64_t)a4 withBackingData:(unint64_t)a5 startDate:(id)a6 endDate:(id)a7 limit:(int64_t)a8 completion:(id)a9;
- (void)transactionsForTransactionSourceIdentifiers:(id)a3 withTransactionSource:(unint64_t)a4 withBackingData:(unint64_t)a5 startDate:(id)a6 endDate:(id)a7 orderedByDate:(int64_t)a8 limit:(int64_t)a9 completion:(id)a10;
- (void)transactionsForTransactionSourceIdentifiers:(id)a3 withTransactionType:(int64_t)a4 withTransactionSource:(unint64_t)a5 withBackingData:(unint64_t)a6 startDate:(id)a7 endDate:(id)a8 limit:(int64_t)a9 completion:(id)a10;
- (void)transactionsRequiringReviewForAccountWithIdentifier:(id)a3 completion:(id)a4;
- (void)transactionsTotalAmountForRequest:(id)a3 completion:(id)a4;
- (void)transactionsWithFullPaymentHashes:(id)a3 transactionSourceIdentifiers:(id)a4 completion:(id)a5;
- (void)transactionsWithTransactionIdentifiers:(id)a3 completion:(id)a4;
- (void)transactionsWithTransactionSource:(unint64_t)a3 withBackingData:(unint64_t)a4 limit:(int64_t)a5 completion:(id)a6;
- (void)transitStateWithPassUniqueIdentifier:(id)a3 paymentApplication:(id)a4 handler:(id)a5;
- (void)unscheduleDeviceCheckIn;
- (void)unscheduleDeviceUpgradeTaskActivity;
- (void)updateAllMapsBrandAndMerchantDataWithCompletion:(id)a3;
- (void)updateCardholderNameFromSafari:(id)a3 forVirtualCardWithIdentifier:(id)a4 completion:(id)a5;
- (void)updateDateLastUsedBySafari:(id)a3 forVirtualCardWithIdentifier:(id)a4 completion:(id)a5;
- (void)updateFeatureApplicationsForAccountIdentifier:(id)a3 completion:(id)a4;
- (void)updateMetadataOnPassWithIdentifier:(id)a3 credential:(id)a4 completion:(id)a5;
- (void)updateNotificationForProductIdentifier:(id)a3 configuration:(id)a4 localizedNotificationTitle:(id)a5 localizedNotificationMessage:(id)a6 completion:(id)a7;
- (void)updatePaymentOffersCatalogWithCompletion:(id)a3;
- (void)updatePaymentRewardsBalancesWithPassUniqueIdentifier:(id)a3 completion:(id)a4;
- (void)updatePaymentRewardsRedemptionsWithPassUniqueIdentifier:(id)a3 limit:(int64_t)a4 completion:(id)a5;
- (void)updateShareForPassIdentifier:(id)a3 share:(id)a4 authorization:(id)a5 completion:(id)a6;
- (void)userNotificationActionPerformed:(unint64_t)a3 applicationMessageContentIdentifier:(id)a4 completion:(id)a5;
- (void)userNotificationActionPerformed:(unint64_t)a3 notificationIdentifier:(id)a4 completion:(id)a5;
- (void)usingSynchronousProxy:(BOOL)a3 applicationMessagesWithCompletion:(id)a4;
- (void)usingSynchronousProxy:(BOOL)a3 entitlementsForPassIdentifier:(id)a4 completion:(id)a5;
- (void)usingSynchronousProxy:(BOOL)a3 expressPassConfigurationsWithHandler:(id)a4;
- (void)usingSynchronousProxy:(BOOL)a3 fetchSharedPaymentWebServiceContextWithCompletion:(id)a4;
- (void)usingSynchronousProxy:(BOOL)a3 handleStandaloneTransaction:(id)a4 withCompletion:(id)a5;
- (void)usingSynchronousProxy:(BOOL)a3 hasPendingProvisioningsOfTypes:(id)a4 completion:(id)a5;
- (void)usingSynchronousProxy:(BOOL)a3 removeApplicationMessageWithKey:(id)a4 completion:(id)a5;
- (void)usingSynchronousProxy:(BOOL)a3 removeApplicationMessagesWithKeys:(id)a4 completion:(id)a5;
- (void)usingSynchronousProxy:(BOOL)a3 setSharedPaymentWebServiceContext:(id)a4 withCompletion:(id)a5;
- (void)usingSynchronousProxy:(BOOL)a3 tappedApplicationMessageWithKey:(id)a4 completion:(id)a5;
- (void)usingSynchronousProxy:(BOOL)a3 tilesForPassWithUniqueIdentifer:(id)a4 context:(int64_t)a5 completion:(id)a6;
- (void)usingSynchronousProxy:(BOOL)a3 updateFinanceKitApplicationMessagesWithCompletion:(id)a4;
- (void)valueAddedServiceTransactionWithIdentifier:(id)a3 handler:(id)a4;
- (void)valueAddedServiceTransactionsForPassWithUniqueIdentifier:(id)a3 limit:(int64_t)a4 handler:(id)a5;
- (void)valueAddedServiceTransactionsForPaymentTransaction:(id)a3 handler:(id)a4;
- (void)vpanCardCredentialsForVPANID:(id)a3 authorization:(id)a4 merchantHost:(id)a5 completion:(id)a6;
- (void)vpanCardCredentialsForVPANID:(id)a3 authorization:(id)a4 merchantHost:(id)a5 regenerate:(BOOL)a6 completion:(id)a7;
- (void)vpanVirtualCards:(id)a3;
- (void)willPassWithUniqueIdentifierAutomaticallyBecomeDefault:(id)a3 completion:(id)a4;
@end

@implementation PDPaymentService

- (PDPaymentService)initWithConnection:(id)a3
{
  return 0LL;
}

- (PDPaymentService)initWithConnection:(id)a3 server:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___PDPaymentService;
  v8 = -[PDPaymentService initWithConnection:](&v24, "initWithConnection:", v6);
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

    uint64_t v16 = sub_100016B5C((uint64_t)v12);
    uint64_t v17 = objc_claimAutoreleasedReturnValue(v16);
    fieldDetectorManager = v8->_fieldDetectorManager;
    v8->_fieldDetectorManager = (PDFieldDetectorManager *)v17;

    uint64_t v19 = PKPaymentServiceInterface();
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    [v6 setRemoteObjectInterface:v20];

    uint64_t v21 = PDPaymentServiceExtendedInterface();
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    [v6 setExportedInterface:v22];

    [v6 setExportedObject:v8];
  }

  return v8;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PDPaymentService;
  -[PDPaymentService dealloc](&v3, "dealloc");
}

- (void)activated
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PDPaymentService;
  -[PDPaymentService activated](&v3, "activated");
}

- (id)remoteObjectProxy
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___PDPaymentService;
  id v2 = -[PDPaymentService remoteObjectProxy](&v4, "remoteObjectProxy");
  return (id)objc_claimAutoreleasedReturnValue(v2);
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PDPaymentService;
  id v3 = -[PDPaymentService remoteObjectProxyWithErrorHandler:](&v5, "remoteObjectProxyWithErrorHandler:", a3);
  return (id)objc_claimAutoreleasedReturnValue(v3);
}

- (void)setApplyManager:(id)a3
{
  objc_super v5 = (PDApplyManager *)a3;
  applyManager = self->_applyManager;
  if (applyManager != v5)
  {
    id v7 = v5;
    if (applyManager) {
      -[PDApplyManager unregisterObserver:](applyManager, "unregisterObserver:", self);
    }
    objc_storeStrong((id *)&self->_applyManager, a3);
    -[PDApplyManager registerObserver:](self->_applyManager, "registerObserver:", self);
    objc_super v5 = v7;
  }
}

- (void)setFamilyMemberManager:(id)a3
{
  objc_super v5 = (PDFamilyCircleManager *)a3;
  familyMemberManager = self->_familyMemberManager;
  if (familyMemberManager != v5)
  {
    id v7 = v5;
    if (familyMemberManager) {
      -[PDFamilyCircleManager removeObserver:](familyMemberManager, "removeObserver:", self);
    }
    objc_storeStrong((id *)&self->_familyMemberManager, a3);
    -[PDFamilyCircleManager addObserver:](self->_familyMemberManager, "addObserver:", self);
    objc_super v5 = v7;
  }
}

- (void)setPaymentWebServiceCoordinator:(id)a3
{
  objc_super v5 = (PDPaymentWebServiceCoordinator *)a3;
  paymentWebServiceCoordinator = self->_paymentWebServiceCoordinator;
  if (paymentWebServiceCoordinator != v5)
  {
    id v7 = v5;
    if (paymentWebServiceCoordinator) {
      -[PDPaymentWebServiceCoordinator unregisterObserver:](paymentWebServiceCoordinator, "unregisterObserver:", self);
    }
    objc_storeStrong((id *)&self->_paymentWebServiceCoordinator, a3);
    -[PDPaymentWebServiceCoordinator registerObserver:](self->_paymentWebServiceCoordinator, "registerObserver:", self);
    objc_super v5 = v7;
  }
}

- (void)setIdsSharingManager:(id)a3
{
  objc_super v5 = (PKSharingIDSManager *)a3;
  p_idsSharingManager = &self->_idsSharingManager;
  idsSharingManager = self->_idsSharingManager;
  v8 = v5;
  if (idsSharingManager != v5)
  {
    if (idsSharingManager) {
      -[PKSharingIDSManager removeDelegate:](idsSharingManager, "removeDelegate:", self);
    }
    objc_storeStrong((id *)&self->_idsSharingManager, a3);
    if (*p_idsSharingManager) {
      -[PKSharingIDSManager addDelegate:](*p_idsSharingManager, "addDelegate:", self);
    }
  }
}

- (void)paymentWebServiceCoordinator:(id)a3 didDownloadTransactionReceipt:(id)a4 forTransactionWithIdentifier:(id)a5
{
  id v9 = a4;
  id v7 = a5;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PDPaymentService remoteObjectProxy](self, "remoteObjectProxy"));
    [v8 transactionWithIdentifier:v7 didDownloadTransactionReceipt:v9];
  }
}

- (void)applyManager:(id)a3 didAddApplication:(id)a4
{
  id v6 = a4;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDPaymentService remoteObjectProxy](self, "remoteObjectProxy"));
    [v5 featureApplicationAdded:v6];
  }
}

- (void)applyManager:(id)a3 didRemoveApplication:(id)a4
{
  id v6 = a4;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDPaymentService remoteObjectProxy](self, "remoteObjectProxy"));
    [v5 featureApplicationRemoved:v6];
  }
}

- (void)applyManager:(id)a3 didUpdateApplication:(id)a4 oldApplication:(id)a5
{
  id v7 = a4;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PDPaymentService remoteObjectProxy](self, "remoteObjectProxy"));
    [v6 featureApplicationChanged:v7];
  }
}

- (void)familyCircleManagerDidUpdateFamilyMembers:(id)a3
{
  id v4 = a3;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_100298BFC;
    v5[3] = &unk_10063ABB8;
    v5[4] = self;
    [v4 familyMembersWithCachePolicy:0 completion:v5];
  }
}

- (void)setDoubleClickAllowed:(BOOL)a3 completion:(id)a4
{
  objc_super v5 = (void (**)(void))a4;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    PDSetDoubleClickAllowed();
    if (!v5) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }

  uint64_t Object = PKLogFacilityTypeGetObject(6LL);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    id v9 = "-[PDPaymentService setDoubleClickAllowed:completion:]";
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  (uint8_t *)&v8,  0xCu);
  }

  if (v5) {
LABEL_7:
  }
    v5[2](v5);
LABEL_8:
}

- (void)paymentDeviceFieldPropertiesWithHandler:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
    id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100298E18;
    v8[3] = &unk_10063AC90;
    v8[4] = self;
    id v9 = v4;
    id v7 = v8;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1002B85E0;
    block[3] = &unk_10063A830;
    id v11 = v7;
    dispatch_async(v6, block);
  }
}

- (void)defaultPaymentPassUniqueIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
    id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100298FEC;
    v8[3] = &unk_10063AC90;
    v8[4] = self;
    id v9 = v4;
    id v7 = v8;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1002B85E0;
    block[3] = &unk_10063A830;
    id v11 = v7;
    dispatch_async(v6, block);
  }
}

- (void)setDefaultPaymentPassUniqueIdentifier:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1002991E8;
  v13[3] = &unk_100639AF0;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  v10 = v13;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002B85E0;
  block[3] = &unk_10063A830;
  id v17 = v10;
  id v11 = v7;
  id v12 = v6;
  dispatch_async(v9, block);
}

- (void)defaultPaymentPassIngestionSpecificIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
    id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_1002993BC;
    v8[3] = &unk_10063AC90;
    v8[4] = self;
    id v9 = v4;
    id v7 = v8;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1002B85E0;
    block[3] = &unk_10063A830;
    id v11 = v7;
    dispatch_async(v6, block);
  }
}

- (void)setDefaultExpressTransitPassIdentifier:(id)a3 withCredential:(id)a4 completion:(id)a5
{
  id v8 = a5;
  databaseManager = self->_databaseManager;
  id v10 = a4;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[PDDatabaseManager passWithUniqueIdentifier:](databaseManager, "passWithUniqueIdentifier:", a3));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 paymentPass]);

  id v13 = -[PKExpressPassInformation initForPaymentPass:withTechologyTest:]( objc_alloc(&OBJC_CLASS___PKExpressPassInformation),  "initForPaymentPass:withTechologyTest:",  v12,  &stru_100652258);
  id v14 = -[PKExpressPassConfiguration initWithPassInformation:forSecureElementPass:]( objc_alloc(&OBJC_CLASS___PKExpressPassConfiguration),  "initWithPassInformation:forSecureElementPass:",  v13,  v12);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100299698;
  v17[3] = &unk_100652280;
  id v18 = v13;
  id v19 = v8;
  id v15 = v13;
  id v16 = v8;
  -[PDPaymentService setExpressWithPassConfiguration:credential:completion:]( self,  "setExpressWithPassConfiguration:credential:completion:",  v14,  v10,  v17);
}

- (void)setDefaultExpressFelicaTransitPassIdentifier:(id)a3 withCredential:(id)a4 completion:(id)a5
{
}

- (void)isExpressModeEnabledForRemotePassUniqueIdentifier:(id)a3 handler:(id)a4
{
  id v7 = a3;
  id v6 = (void (**)(id, void))a4;
  if (v6)
  {
    v6[2](v6, 0LL);
  }
}

- (void)expressPassConfigurationWithPassUniqueIdentifier:(id)a3 handler:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (v6)
  {
    if (v8
      && ((-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess") & 1) != 0
       || -[PKEntitlementWhitelist paymentConfiguration](self->_whitelist, "paymentConfiguration"))
      && (expressPassManager = self->_expressPassManager) != 0LL)
    {
      sub_10014BA34((uint64_t)expressPassManager, v8, v6);
    }

    else
    {
      (*((void (**)(id, void))v6 + 2))(v6, 0LL);
    }
  }
}

- (void)expressPassConfigurationsWithCardType:(int64_t)a3 handler:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    id v8 = v6;
    if (((-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess") & 1) != 0
       || -[PKEntitlementWhitelist paymentConfiguration](self->_whitelist, "paymentConfiguration"))
      && (expressPassManager = self->_expressPassManager) != 0LL)
    {
      sub_10014BBB0((uint64_t)expressPassManager, a3, v8);
    }

    else
    {
      (*((void (**)(id, void))v8 + 2))(v8, 0LL);
    }

    id v6 = v8;
  }
}

- (void)expressPassesInformationWithAutomaticSelectionTechnologyType:(int64_t)a3 handler:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    id v8 = v6;
    if (((-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess") & 1) != 0
       || -[PKEntitlementWhitelist paymentConfiguration](self->_whitelist, "paymentConfiguration"))
      && (expressPassManager = self->_expressPassManager) != 0LL)
    {
      sub_10014BDF8((uint64_t)expressPassManager, a3, v8);
    }

    else
    {
      (*((void (**)(id, void))v8 + 2))(v8, 0LL);
    }

    id v6 = v8;
  }
}

- (void)usingSynchronousProxy:(BOOL)a3 expressPassConfigurationsWithHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = (void (**)(id, void *))a4;
  if (v6)
  {
    id v10 = v6;
    if (((-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess") & 1) != 0
       || -[PKEntitlementWhitelist paymentConfiguration](self->_whitelist, "paymentConfiguration"))
      && (expressPassManager = (os_unfair_lock_s *)self->_expressPassManager) != 0LL)
    {
      if (v4)
      {
        id v8 = sub_10014C2F0(expressPassManager);
        id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
        v10[2](v10, v9);
      }

      else
      {
        sub_10014C1C8((uint64_t)expressPassManager, v10);
      }
    }

    else
    {
      v10[2](v10, 0LL);
    }

    id v6 = v10;
  }
}

- (void)conflictingExpressPassIdentifiersForPassConfiguration:(id)a3 withCompletion:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (v6)
  {
    if (((-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess") & 1) != 0
       || (-[PKEntitlementWhitelist paymentConfiguration](self->_whitelist, "paymentConfiguration") & 1) != 0
       || -[PKEntitlementWhitelist paymentConfiguration](self->_whitelist, "paymentConfiguration"))
      && (expressPassManager = self->_expressPassManager) != 0LL)
    {
      sub_10014C3C0((uint64_t)expressPassManager, v8, v6);
    }

    else
    {
      (*((void (**)(id, void))v6 + 2))(v6, 0LL);
    }
  }
}

- (void)conflictingExpressPassIdentifiersForPassInformation:(id)a3 withCompletion:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if (v6)
  {
    if (((-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess") & 1) != 0
       || (-[PKEntitlementWhitelist paymentConfiguration](self->_whitelist, "paymentConfiguration") & 1) != 0
       || -[PKEntitlementWhitelist paymentConfiguration](self->_whitelist, "paymentConfiguration"))
      && self->_expressPassManager
      && (databaseManager = self->_databaseManager) != 0LL)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v11 passUniqueIdentifier]);
      id v9 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager paymentApplicationsForPassUniqueIdentifier:]( databaseManager,  "paymentApplicationsForPassUniqueIdentifier:",  v8));

      id v10 = -[PKExpressPassConfiguration initWithPassInformation:forPaymentApplications:]( objc_alloc(&OBJC_CLASS___PKExpressPassConfiguration),  "initWithPassInformation:forPaymentApplications:",  v11,  v9);
      sub_10014C3C0((uint64_t)self->_expressPassManager, v10, v6);
    }

    else
    {
      (*((void (**)(id, void))v6 + 2))(v6, 0LL);
    }
  }
}

- (void)conflictingExpressPassIdentifiersForPassConfiguration:(id)a3 withReferenceExpressState:(id)a4 completion:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v9)
  {
    if (((-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess") & 1) != 0
       || (-[PKEntitlementWhitelist paymentConfiguration](self->_whitelist, "paymentConfiguration") & 1) != 0
       || -[PKEntitlementWhitelist paymentConfiguration](self->_whitelist, "paymentConfiguration"))
      && (expressPassManager = self->_expressPassManager) != 0LL)
    {
      sub_10014C5F4((uint64_t)expressPassManager, v11, v8, v9);
    }

    else
    {
      (*((void (**)(id, void))v9 + 2))(v9, 0LL);
    }
  }
}

- (void)conflictingExpressPassIdentifiersForPassInformation:(id)a3 withReferenceExpressState:(id)a4 completion:(id)a5
{
  id v15 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v9)
  {
    if (((-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess") & 1) != 0
       || (-[PKEntitlementWhitelist paymentConfiguration](self->_whitelist, "paymentConfiguration") & 1) != 0
       || -[PKEntitlementWhitelist paymentConfiguration](self->_whitelist, "paymentConfiguration"))
      && self->_expressPassManager
      && (databaseManager = self->_databaseManager) != 0LL)
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v15 passUniqueIdentifier]);
      id v12 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager paymentApplicationsForPassUniqueIdentifier:]( databaseManager,  "paymentApplicationsForPassUniqueIdentifier:",  v11));

      id v13 = -[PKExpressPassConfiguration initWithPassInformation:forPaymentApplications:]( objc_alloc(&OBJC_CLASS___PKExpressPassConfiguration),  "initWithPassInformation:forPaymentApplications:",  v15,  v12);
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472LL;
      v16[2] = sub_100299DD8;
      v16[3] = &unk_1006522A8;
      v16[4] = self;
      id v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "pk_setBySafelyApplyingBlock:", v16));
      sub_10014C5F4((uint64_t)self->_expressPassManager, v13, v14, v9);
    }

    else
    {
      (*((void (**)(id, void))v9 + 2))(v9, 0LL);
    }
  }
}

- (void)setExpressWithPassConfiguration:(id)a3 credential:(id)a4 completion:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  if (((-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess") & 1) != 0
     || (-[PKEntitlementWhitelist paymentConfiguration](self->_whitelist, "paymentConfiguration") & 1) != 0
     || -[PKEntitlementWhitelist paymentConfiguration](self->_whitelist, "paymentConfiguration"))
    && (expressPassManager = self->_expressPassManager) != 0LL)
  {
    sub_10014C9F8((uint64_t)expressPassManager, v11, v8, v9);
  }

  else if (v9)
  {
    (*((void (**)(id, void, void))v9 + 2))(v9, 0LL, 0LL);
  }
}

- (void)setExpressWithPassInformation:(id)a3 credential:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (((-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess") & 1) != 0
     || (-[PKEntitlementWhitelist paymentConfiguration](self->_whitelist, "paymentConfiguration") & 1) != 0
     || -[PKEntitlementWhitelist paymentConfiguration](self->_whitelist, "paymentConfiguration"))
    && self->_expressPassManager
    && (databaseManager = self->_databaseManager) != 0LL)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 passUniqueIdentifier]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[PDDatabaseManager passWithUniqueIdentifier:](databaseManager, "passWithUniqueIdentifier:", v12));
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 secureElementPass]);

    id v15 = objc_alloc(&OBJC_CLASS___PKExpressPassConfiguration);
    if (v14) {
      id v16 = -[PKExpressPassConfiguration initWithPassInformation:forSecureElementPass:]( v15,  "initWithPassInformation:forSecureElementPass:",  v8,  v14);
    }
    else {
      id v16 = -[PKExpressPassConfiguration initWithPassInformation:isNFCExpressEnabled:isUWBExpressEnabled:]( v15,  "initWithPassInformation:isNFCExpressEnabled:isUWBExpressEnabled:",  v8,  1LL,  0LL);
    }
    id v17 = v16;
    expressPassManager = self->_expressPassManager;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_10029A0BC;
    v19[3] = &unk_100645ED8;
    id v20 = v10;
    sub_10014C9F8((uint64_t)expressPassManager, v17, v9, v19);
  }

  else if (v10)
  {
    (*((void (**)(id, void, void))v10 + 2))(v10, 0LL, 0LL);
  }
}

- (void)removeExpressPassesWithCardType:(int64_t)a3 completion:(id)a4
{
  id v8 = a4;
  if ((-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess") & 1) != 0
    || -[PKEntitlementWhitelist paymentConfiguration](self->_whitelist, "paymentConfiguration"))
  {
    expressPassManager = self->_expressPassManager;
    if (expressPassManager)
    {
      sub_10014CE0C((uint64_t)expressPassManager, a3, v8);
LABEL_7:
      id v7 = v8;
      goto LABEL_8;
    }
  }

  id v7 = v8;
  if (v8)
  {
    (*((void (**)(id, void, void))v8 + 2))(v8, 0LL, 0LL);
    goto LABEL_7;
  }

- (void)removeExpressPassWithUniqueIdentifier:(id)a3 completion:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (((-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess") & 1) != 0
     || -[PKEntitlementWhitelist paymentConfiguration](self->_whitelist, "paymentConfiguration"))
    && (expressPassManager = self->_expressPassManager) != 0LL)
  {
    sub_10014D11C((uint64_t)expressPassManager, v8, v6);
  }

  else if (v6)
  {
    (*((void (**)(id, void, void))v6 + 2))(v6, 0LL, 0LL);
  }
}

- (void)isPassExpressWithUniqueIdentifier:(id)a3 completion:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (v6)
  {
    if (v8
      && ((-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess") & 1) != 0
       || -[PKEntitlementWhitelist paymentConfiguration](self->_whitelist, "paymentConfiguration"))
      && (expressPassManager = self->_expressPassManager) != 0LL)
    {
      sub_10014B8A4((uint64_t)expressPassManager, v8, v6);
    }

    else
    {
      (*((void (**)(id, void))v6 + 2))(v6, 0LL);
    }
  }
}

- (void)simulateDefaultExpressTransitPassIdentifier:(id)a3 forExpressMode:(id)a4 handler:(id)a5
{
  id v7 = a3;
  id v8 = (void (**)(void))a5;
  if (-[PKEntitlementWhitelist passesAllAccess](self->_whitelist, "passesAllAccess")
    && self->_expressPassManager)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager passWithUniqueIdentifier:]( self->_databaseManager,  "passWithUniqueIdentifier:",  v7));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 paymentPass]);

    id v11 = -[PKExpressPassInformation initForPaymentPass:withTechologyTest:]( objc_alloc(&OBJC_CLASS___PKExpressPassInformation),  "initForPaymentPass:withTechologyTest:",  v10,  0LL);
    if (v11 && self->_expressPassManager)
    {
      id v12 = -[PKExpressPassConfiguration initWithPassInformation:forSecureElementPass:]( objc_alloc(&OBJC_CLASS___PKExpressPassConfiguration),  "initWithPassInformation:forSecureElementPass:",  v11,  v10);
      expressPassManager = self->_expressPassManager;
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472LL;
      v16[2] = sub_10029A4F8;
      v16[3] = &unk_100645ED8;
      id v17 = v8;
      sub_10014C9F8((uint64_t)expressPassManager, v12, 0LL, v16);
    }

    else if (v8)
    {
      v8[2](v8);
    }
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v19 = "-[PDPaymentService simulateDefaultExpressTransitPassIdentifier:forExpressMode:handler:]";
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  buf,  0xCu);
    }

    if (v8) {
      v8[2](v8);
    }
  }
}

- (void)usingSynchronousProxy:(BOOL)a3 fetchSharedPaymentWebServiceContextWithCompletion:(id)a4
{
  BOOL v4 = a3;
  id v6 = (void (**)(id, void *))a4;
  if (v6)
  {
    if ((-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess") & 1) != 0)
    {
      if (v4)
      {
        id v7 = objc_autoreleasePoolPush();
        id v8 = (void *)objc_claimAutoreleasedReturnValue( -[PDPaymentWebServiceCoordinator sharedWebServiceContext]( self->_paymentWebServiceCoordinator,  "sharedWebServiceContext"));
        v6[2](v6, v8);

        objc_autoreleasePoolPop(v7);
      }

      else
      {
        id v11 = PDDefaultQueue();
        id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v11);
        v13[0] = _NSConcreteStackBlock;
        v13[1] = 3221225472LL;
        v13[2] = sub_10029A698;
        v13[3] = &unk_1006396B0;
        v13[4] = self;
        id v14 = v6;
        dispatch_async(v12, v13);
      }
    }

    else
    {
      uint64_t Object = PKLogFacilityTypeGetObject(6LL);
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        id v16 = "-[PDPaymentService usingSynchronousProxy:fetchSharedPaymentWebServiceContextWithCompletion:]";
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  buf,  0xCu);
      }

      v6[2](v6, 0LL);
    }
  }
}

- (void)usingSynchronousProxy:(BOOL)a3 setSharedPaymentWebServiceContext:(id)a4 withCompletion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = (void (**)(void))a5;
  if ((-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess") & 1) != 0)
  {
    if (v6)
    {
      id v10 = objc_autoreleasePoolPush();
      -[PDPaymentWebServiceCoordinator updateSharedWebServiceContext:]( self->_paymentWebServiceCoordinator,  "updateSharedWebServiceContext:",  v8);
      if (v9) {
        v9[2](v9);
      }
      objc_autoreleasePoolPop(v10);
    }

    else
    {
      id v13 = PDDefaultQueue();
      id v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v13);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10029A88C;
      block[3] = &unk_100639AF0;
      void block[4] = self;
      id v16 = v8;
      id v17 = v9;
      dispatch_async(v14, block);
    }
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v19 = "-[PDPaymentService usingSynchronousProxy:setSharedPaymentWebServiceContext:withCompletion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  buf,  0xCu);
    }

    if (v9) {
      v9[2](v9);
    }
  }
}

- (void)transactionsAppLaunchTokenForPassWithUniqueIdentifier:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = PDDefaultQueue();
    id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v8);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10029A98C;
    block[3] = &unk_100639AF0;
    void block[4] = self;
    id v11 = v6;
    id v12 = v7;
    dispatch_async(v9, block);
  }
}

- (void)messagesAppLaunchTokenForPassWithUniqueIdentifier:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = PDDefaultQueue();
    id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v8);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10029AB5C;
    block[3] = &unk_100639AF0;
    void block[4] = self;
    id v11 = v6;
    id v12 = v7;
    dispatch_async(v9, block);
  }
}

- (void)usingSynchronousProxy:(BOOL)a3 applicationMessagesWithCompletion:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    if ((-[PKEntitlementWhitelist passesAllAccess](self->_whitelist, "passesAllAccess") & 1) != 0
      || (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess") & 1) != 0)
    {
      id v7 = objc_alloc_init(&OBJC_CLASS___PKAsyncUnaryOperationComposer);
      id v8 = v7;
      v18[0] = 0LL;
      v18[1] = v18;
      v18[2] = 0x3032000000LL;
      v18[3] = sub_10029AE5C;
      v18[4] = sub_10029AE6C;
      id v19 = 0LL;
      v16[0] = 0LL;
      v16[1] = v16;
      v16[2] = 0x3032000000LL;
      v16[3] = sub_10029AE5C;
      void v16[4] = sub_10029AE6C;
      id v17 = 0LL;
      if (!a3) {
        [v7 addOperation:&stru_100652308];
      }
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472LL;
      v15[2] = sub_10029AF38;
      v15[3] = &unk_100646ED0;
      v15[5] = v18;
      v15[6] = v16;
      v15[4] = self;
      [v8 addOperation:v15];
      id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472LL;
      v11[2] = sub_10029AFDC;
      v11[3] = &unk_10064CF20;
      id v12 = v6;
      id v13 = v16;
      id v14 = v18;
      id v10 = [v8 evaluateWithInput:v9 completion:v11];

      _Block_object_dispose(v16, 8);
      _Block_object_dispose(v18, 8);
    }

    else
    {
      (*((void (**)(id, void))v6 + 2))(v6, 0LL);
    }
  }
}

- (void)usingSynchronousProxy:(BOOL)a3 tappedApplicationMessageWithKey:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = (void (**)(void))a5;
  if ((-[PKEntitlementWhitelist passesAllAccess](self->_whitelist, "passesAllAccess") & 1) != 0
    || (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess") & 1) != 0)
  {
    id v10 = objc_alloc_init(&OBJC_CLASS___PKAsyncUnaryOperationComposer);
    id v11 = 0LL;
    v19[0] = 0LL;
    v19[1] = v19;
    v19[2] = 0x3032000000LL;
    v19[3] = sub_10029AE5C;
    void v19[4] = sub_10029AE6C;
    if (!v9) {
      id v11 = (void *)PDOSTransactionCreate("PDPaymentService");
    }
    id v20 = v11;
    if (!a3) {
      [v10 addOperation:&stru_100652328];
    }
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_10029B2E4;
    v17[3] = &unk_10063CB08;
    void v17[4] = self;
    id v18 = v8;
    [v10 addOperation:v17];
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_10029B358;
    v14[3] = &unk_100639778;
    id v15 = v9;
    id v16 = v19;
    id v13 = [v10 evaluateWithInput:v12 completion:v14];

    _Block_object_dispose(v19, 8);
  }

  else if (v9)
  {
    v9[2](v9);
  }
}

- (void)usingSynchronousProxy:(BOOL)a3 removeApplicationMessageWithKey:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = (void (**)(void))a5;
  if ((-[PKEntitlementWhitelist passesAllAccess](self->_whitelist, "passesAllAccess") & 1) != 0
    || (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess") & 1) != 0)
  {
    id v10 = objc_alloc_init(&OBJC_CLASS___PKAsyncUnaryOperationComposer);
    id v11 = 0LL;
    v19[0] = 0LL;
    v19[1] = v19;
    v19[2] = 0x3032000000LL;
    v19[3] = sub_10029AE5C;
    void v19[4] = sub_10029AE6C;
    if (!v9) {
      id v11 = (void *)PDOSTransactionCreate("PDPaymentService");
    }
    id v20 = v11;
    if (!a3) {
      [v10 addOperation:&stru_100652348];
    }
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_10029B628;
    v17[3] = &unk_10063CB08;
    void v17[4] = self;
    id v18 = v8;
    [v10 addOperation:v17];
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_10029B69C;
    v14[3] = &unk_100639778;
    id v15 = v9;
    id v16 = v19;
    id v13 = [v10 evaluateWithInput:v12 completion:v14];

    _Block_object_dispose(v19, 8);
  }

  else if (v9)
  {
    v9[2](v9);
  }
}

- (void)usingSynchronousProxy:(BOOL)a3 removeApplicationMessagesWithKeys:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = (void (**)(void))a5;
  if ((-[PKEntitlementWhitelist passesAllAccess](self->_whitelist, "passesAllAccess") & 1) != 0
    || (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess") & 1) != 0)
  {
    id v10 = objc_alloc_init(&OBJC_CLASS___PKAsyncUnaryOperationComposer);
    id v11 = 0LL;
    v19[0] = 0LL;
    v19[1] = v19;
    v19[2] = 0x3032000000LL;
    v19[3] = sub_10029AE5C;
    void v19[4] = sub_10029AE6C;
    if (!v9) {
      id v11 = (void *)PDOSTransactionCreate("PDPaymentService");
    }
    id v20 = v11;
    if (!a3) {
      [v10 addOperation:&stru_100652368];
    }
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_10029B96C;
    v17[3] = &unk_10063CB08;
    void v17[4] = self;
    id v18 = v8;
    [v10 addOperation:v17];
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_10029B9E0;
    v14[3] = &unk_100639778;
    id v15 = v9;
    id v16 = v19;
    id v13 = [v10 evaluateWithInput:v12 completion:v14];

    _Block_object_dispose(v19, 8);
  }

  else if (v9)
  {
    v9[2](v9);
  }
}

- (void)usingSynchronousProxy:(BOOL)a3 tilesForPassWithUniqueIdentifer:(id)a4 context:(int64_t)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  if (v11)
  {
    if (v10
      && ((-[PKEntitlementWhitelist passesAllAccess](self->_whitelist, "passesAllAccess") & 1) != 0
       || (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess") & 1) != 0))
    {
      id v12 = objc_alloc_init(&OBJC_CLASS___PKAsyncUnaryOperationComposer);
      id v13 = v12;
      if (!a3) {
        [v12 addOperation:&stru_100652388];
      }
      v27[0] = 0LL;
      v27[1] = v27;
      v27[2] = 0x3032000000LL;
      v27[3] = sub_10029AE5C;
      v27[4] = sub_10029AE6C;
      id v28 = 0LL;
      v25[0] = 0LL;
      v25[1] = v25;
      v25[2] = 0x3032000000LL;
      v25[3] = sub_10029AE5C;
      v25[4] = sub_10029AE6C;
      id v26 = 0LL;
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472LL;
      v20[2] = sub_10029BCF4;
      v20[3] = &unk_1006523B0;
      v22 = v27;
      v23 = v25;
      v20[4] = self;
      id v21 = v10;
      int64_t v24 = a5;
      [v13 addOperation:v20];
      id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472LL;
      v16[2] = sub_10029BDA0;
      v16[3] = &unk_10064CF20;
      id v17 = v11;
      id v18 = v25;
      id v19 = v27;
      id v15 = [v13 evaluateWithInput:v14 completion:v16];

      _Block_object_dispose(v25, 8);
      _Block_object_dispose(v27, 8);
    }

    else
    {
      (*((void (**)(id, void))v11 + 2))(v11, 0LL);
    }
  }
}

- (void)usingSynchronousProxy:(BOOL)a3 updateFinanceKitApplicationMessagesWithCompletion:(id)a4
{
  id v6 = (void (**)(void))a4;
  if ((-[PKEntitlementWhitelist passesAllAccess](self->_whitelist, "passesAllAccess") & 1) != 0
    || (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess") & 1) != 0)
  {
    id v7 = objc_alloc_init(&OBJC_CLASS___PKAsyncUnaryOperationComposer);
    id v8 = 0LL;
    v14[0] = 0LL;
    v14[1] = v14;
    v14[2] = 0x3032000000LL;
    v14[3] = sub_10029AE5C;
    void v14[4] = sub_10029AE6C;
    if (!v6) {
      id v8 = (void *)PDOSTransactionCreate("PDPaymentService");
    }
    id v15 = v8;
    if (!a3) {
      [v7 addOperation:&stru_1006523D0];
    }
    [v7 addOperation:&stru_1006523F0];
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10029C070;
    v11[3] = &unk_100639778;
    id v12 = v6;
    id v13 = v14;
    id v10 = [v7 evaluateWithInput:v9 completion:v11];

    _Block_object_dispose(v14, 8);
  }

  else if (v6)
  {
    v6[2](v6);
  }
}

- (void)submitVerificationCode:(id)a3 verificationData:(id)a4 forDPANIdentifier:(id)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = PDDefaultQueue();
  id v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v14);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10029C1B0;
  block[3] = &unk_10063CD88;
  void block[4] = self;
  id v21 = v10;
  id v22 = v12;
  id v23 = v11;
  id v24 = v13;
  id v16 = v13;
  id v17 = v11;
  id v18 = v12;
  id v19 = v10;
  dispatch_async(v15, block);
}

- (void)transactionCountByPeriodForRequest:(id)a3 calendar:(id)a4 unit:(unint64_t)a5 includePurchaseTotal:(BOOL)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  if (v14)
  {
    id v15 = PDDefaultQueue();
    id v16 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v15);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_10029C5F0;
    v17[3] = &unk_10063D9F8;
    void v17[4] = self;
    id v18 = v12;
    id v19 = v13;
    unint64_t v21 = a5;
    BOOL v22 = a6;
    id v20 = v14;
    dispatch_async(v16, v17);
  }
}

- (void)cashbackByPeriodForTransactionSourceIdentifiers:(id)a3 withStartDate:(id)a4 endDate:(id)a5 calendar:(id)a6 calendarUnit:(unint64_t)a7 type:(unint64_t)a8 completion:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a9;
  if (v19)
  {
    id v20 = PDDefaultQueue();
    unint64_t v21 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v20);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_10029C834;
    v22[3] = &unk_10064BBC0;
    v22[4] = self;
    id v23 = v15;
    id v24 = v16;
    id v25 = v17;
    id v26 = v18;
    unint64_t v28 = a7;
    unint64_t v29 = a8;
    id v27 = v19;
    dispatch_async(v21, v22);
  }
}

- (void)peerPaymentCounterpartHandlesForTransactionSourceIdentifier:(id)a3 startDate:(id)a4 endDate:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v13)
  {
    id v14 = PDDefaultQueue();
    id v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v14);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10029CA3C;
    block[3] = &unk_10063CD88;
    void block[4] = self;
    id v17 = v10;
    id v18 = v11;
    id v19 = v12;
    id v20 = v13;
    dispatch_async(v15, block);
  }
}

- (void)hasTransactionsForTransactionSourceIdentifiers:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = PDDefaultQueue();
    id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v8);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10029CBF4;
    block[3] = &unk_100639AF0;
    void block[4] = self;
    id v11 = v6;
    id v12 = v7;
    dispatch_async(v9, block);
  }
}

- (void)transactionsForTransactionSourceIdentifiers:(id)a3 withTransactionSource:(unint64_t)a4 withBackingData:(unint64_t)a5 startDate:(id)a6 endDate:(id)a7 limit:(int64_t)a8 completion:(id)a9
{
}

- (void)transactionsForTransactionSourceIdentifiers:(id)a3 withTransactionSource:(unint64_t)a4 withBackingData:(unint64_t)a5 startDate:(id)a6 endDate:(id)a7 orderedByDate:(int64_t)a8 limit:(int64_t)a9 completion:(id)a10
{
  id v16 = a3;
  id v17 = a6;
  id v18 = a7;
  id v19 = a10;
  if (v19)
  {
    id v20 = PDDefaultQueue();
    unint64_t v21 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v20);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10029CE40;
    block[3] = &unk_100652418;
    void block[4] = self;
    id v23 = v16;
    unint64_t v27 = a4;
    unint64_t v28 = a5;
    id v24 = v17;
    id v25 = v18;
    int64_t v29 = a8;
    int64_t v30 = a9;
    id v26 = v19;
    dispatch_async(v21, block);
  }
}

- (void)transactionsForTransactionSourceIdentifiers:(id)a3 withPeerPaymentCounterpartHandles:(id)a4 withTransactionSource:(unint64_t)a5 withBackingData:(unint64_t)a6 limit:(int64_t)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a8;
  if (v16)
  {
    id v17 = PDDefaultQueue();
    id v18 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v17);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10029D050;
    block[3] = &unk_100652440;
    void block[4] = self;
    id v20 = v14;
    id v21 = v15;
    unint64_t v23 = a5;
    unint64_t v24 = a6;
    int64_t v25 = a7;
    id v22 = v16;
    dispatch_async(v18, block);
  }
}

- (void)transactionsForTransactionSourceIdentifiers:(id)a3 matchingMerchant:(id)a4 withTransactionSource:(unint64_t)a5 withBackingData:(unint64_t)a6 limit:(int64_t)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a8;
  if (v16)
  {
    id v17 = PDDefaultQueue();
    id v18 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v17);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10029D25C;
    block[3] = &unk_100652440;
    void block[4] = self;
    id v20 = v14;
    id v21 = v15;
    unint64_t v23 = a5;
    unint64_t v24 = a6;
    int64_t v25 = a7;
    id v22 = v16;
    dispatch_async(v18, block);
  }
}

- (void)transactionsForTransactionSourceIdentifiers:(id)a3 withMerchantCategory:(int64_t)a4 withTransactionSource:(unint64_t)a5 withBackingData:(unint64_t)a6 startDate:(id)a7 endDate:(id)a8 limit:(int64_t)a9 completion:(id)a10
{
  id v16 = a3;
  id v17 = a7;
  id v18 = a8;
  id v19 = a10;
  if (v19)
  {
    id v20 = PDDefaultQueue();
    id v21 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v20);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10029D498;
    block[3] = &unk_100652418;
    void block[4] = self;
    id v23 = v16;
    int64_t v27 = a4;
    unint64_t v28 = a5;
    unint64_t v29 = a6;
    id v24 = v17;
    id v25 = v18;
    int64_t v30 = a9;
    id v26 = v19;
    dispatch_async(v21, block);
  }
}

- (void)transactionsForTransactionSourceIdentifiers:(id)a3 withTransactionType:(int64_t)a4 withTransactionSource:(unint64_t)a5 withBackingData:(unint64_t)a6 startDate:(id)a7 endDate:(id)a8 limit:(int64_t)a9 completion:(id)a10
{
  id v16 = a3;
  id v17 = a7;
  id v18 = a8;
  id v19 = a10;
  if (v19)
  {
    id v20 = PDDefaultQueue();
    id v21 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v20);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10029D6D0;
    block[3] = &unk_100652418;
    void block[4] = self;
    id v23 = v16;
    int64_t v27 = a4;
    unint64_t v28 = a5;
    unint64_t v29 = a6;
    id v24 = v17;
    id v25 = v18;
    int64_t v30 = a9;
    id v26 = v19;
    dispatch_async(v21, block);
  }
}

- (void)approvedTransactionsForTransactionSourceIdentifiers:(id)a3 withTransactionSource:(unint64_t)a4 withBackingData:(unint64_t)a5 startDate:(id)a6 endDate:(id)a7 limit:(int64_t)a8 completion:(id)a9
{
  id v15 = a3;
  id v16 = a6;
  id v17 = a7;
  id v18 = a9;
  if (v18)
  {
    id v19 = PDDefaultQueue();
    id v20 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v19);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_10029D900;
    v21[3] = &unk_100652468;
    v21[4] = self;
    id v22 = v15;
    unint64_t v26 = a4;
    unint64_t v27 = a5;
    id v23 = v16;
    id v24 = v17;
    int64_t v28 = a8;
    id v25 = v18;
    dispatch_async(v20, v21);
  }
}

- (void)pendingTransactionsForTransactionSourceIdentifiers:(id)a3 withTransactionSource:(unint64_t)a4 withBackingData:(unint64_t)a5 startDate:(id)a6 endDate:(id)a7 limit:(int64_t)a8 completion:(id)a9
{
  id v15 = a3;
  id v16 = a6;
  id v17 = a7;
  id v18 = a9;
  if (v18)
  {
    id v19 = PDDefaultQueue();
    id v20 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v19);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_10029DB3C;
    v21[3] = &unk_100652468;
    v21[4] = self;
    id v22 = v15;
    unint64_t v26 = a4;
    unint64_t v27 = a5;
    id v23 = v16;
    id v24 = v17;
    int64_t v28 = a8;
    id v25 = v18;
    dispatch_async(v20, v21);
  }
}

- (void)transactionsForTransactionSourceIdentifiers:(id)a3 withTransactionSource:(unint64_t)a4 withBackingData:(unint64_t)a5 limit:(int64_t)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a7;
  if (v13)
  {
    id v14 = PDDefaultQueue();
    id v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v14);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_10029DD30;
    v16[3] = &unk_100652490;
    void v16[4] = self;
    id v17 = v12;
    unint64_t v19 = a4;
    unint64_t v20 = a5;
    int64_t v21 = a6;
    id v18 = v13;
    dispatch_async(v15, v16);
  }
}

- (void)transactionsWithTransactionSource:(unint64_t)a3 withBackingData:(unint64_t)a4 limit:(int64_t)a5 completion:(id)a6
{
  id v10 = a6;
  if (v10)
  {
    id v11 = PDDefaultQueue();
    id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v11);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10029DE68;
    block[3] = &unk_1006524B8;
    void block[4] = self;
    unint64_t v15 = a3;
    unint64_t v16 = a4;
    int64_t v17 = a5;
    id v14 = v10;
    dispatch_async(v12, block);
  }
}

- (void)transactionWithTransactionIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = PDDefaultQueue();
    id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v8);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10029E024;
    block[3] = &unk_100639AF0;
    void block[4] = self;
    id v11 = v6;
    id v12 = v7;
    dispatch_async(v9, block);
  }
}

- (void)transactionsWithTransactionIdentifiers:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = PDDefaultQueue();
    id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v8);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10029E1E8;
    block[3] = &unk_100639AF0;
    void block[4] = self;
    id v11 = v6;
    id v12 = v7;
    dispatch_async(v9, block);
  }
}

- (void)transactionsWithFullPaymentHashes:(id)a3 transactionSourceIdentifiers:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    id v11 = PDDefaultQueue();
    id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v11);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_10029E494;
    v13[3] = &unk_10063B440;
    v13[4] = self;
    id v14 = v8;
    id v15 = v9;
    id v16 = v10;
    dispatch_async(v12, v13);
  }
}

- (void)transactionSourceTypeForTransactionSourceIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = PDDefaultQueue();
    id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v8);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10029E65C;
    block[3] = &unk_100639AF0;
    void block[4] = self;
    id v11 = v6;
    id v12 = v7;
    dispatch_async(v9, block);
  }
}

- (void)transactionWithServiceIdentifier:(id)a3 transactionSourceIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    id v11 = PDDefaultQueue();
    id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v11);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_10029E83C;
    v13[3] = &unk_10063B440;
    v13[4] = self;
    id v14 = v8;
    id v15 = v9;
    id v16 = v10;
    dispatch_async(v12, v13);
  }
}

- (void)transactionWithReferenceIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = PDDefaultQueue();
    id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v8);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10029EA04;
    block[3] = &unk_100639AF0;
    void block[4] = self;
    id v11 = v6;
    id v12 = v7;
    dispatch_async(v9, block);
  }
}

- (void)installmentTransactionsForInstallmentPlanIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = PDDefaultQueue();
    id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v8);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10029EBC8;
    block[3] = &unk_100639AF0;
    void block[4] = self;
    id v11 = v6;
    id v12 = v7;
    dispatch_async(v9, block);
  }
}

- (void)installmentPlansWithTransactionReferenceIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = PDDefaultQueue();
    id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v8);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10029ED7C;
    block[3] = &unk_100639AF0;
    void block[4] = self;
    id v11 = v6;
    id v12 = v7;
    dispatch_async(v9, block);
  }
}

- (void)installmentPlanTransactionsForTransactionSourceIdentifiers:(id)a3 accountIdentifier:(id)a4 redeemed:(BOOL)a5 withRedemptionType:(unint64_t)a6 startDate:(id)a7 endDate:(id)a8 completion:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  if (v19)
  {
    id v20 = PDDefaultQueue();
    int64_t v21 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v20);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_10029EFB8;
    v22[3] = &unk_1006524E0;
    v22[4] = self;
    id v23 = v15;
    BOOL v29 = a5;
    id v24 = v16;
    unint64_t v28 = a6;
    id v25 = v17;
    id v26 = v18;
    id v27 = v19;
    dispatch_async(v21, v22);
  }
}

- (void)transactionsForRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = PDDefaultQueue();
    id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v8);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10029F17C;
    block[3] = &unk_100639AF0;
    void block[4] = self;
    id v11 = v6;
    id v12 = v7;
    dispatch_async(v9, block);
  }
}

- (void)transactionsTotalAmountForRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = PDDefaultQueue();
    id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v8);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10029F358;
    block[3] = &unk_100639AF0;
    void block[4] = self;
    id v11 = v6;
    id v12 = v7;
    dispatch_async(v9, block);
  }
}

- (void)logoImageDataForURL:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = PDDefaultQueue();
    id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v8);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10029F514;
    block[3] = &unk_100639AF0;
    void block[4] = self;
    id v11 = v6;
    id v12 = v7;
    dispatch_async(v9, block);
  }
}

- (void)transactionsForPredicate:(id)a3 limit:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v9)
  {
    id v10 = PDDefaultQueue();
    id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v10);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_10029F77C;
    v12[3] = &unk_10063C928;
    v12[4] = self;
    id v13 = v8;
    int64_t v15 = a4;
    id v14 = v9;
    dispatch_async(v11, v12);
  }
}

- (void)passUniqueIdentifierForTransactionWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = PDDefaultQueue();
    id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v8);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10029F934;
    block[3] = &unk_100639AF0;
    void block[4] = self;
    id v11 = v6;
    id v12 = v7;
    dispatch_async(v9, block);
  }
}

- (void)ambiguousPassUniqueIdentifierForTransactionWithServiceIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = PDDefaultQueue();
    id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v8);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10029FAF8;
    block[3] = &unk_100639AF0;
    void block[4] = self;
    id v11 = v6;
    id v12 = v7;
    dispatch_async(v9, block);
  }
}

- (void)passUniqueIdentifierForTransactionWithServiceIdentifier:(id)a3 transactionSourceIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    id v11 = PDDefaultQueue();
    id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v11);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_10029FCE4;
    v13[3] = &unk_10063B440;
    v13[4] = self;
    id v14 = v8;
    id v15 = v9;
    id v16 = v10;
    dispatch_async(v12, v13);
  }
}

- (void)ambiguousTransactionWithServiceIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = PDDefaultQueue();
    id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v8);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10029FEAC;
    block[3] = &unk_100639AF0;
    void block[4] = self;
    id v11 = v6;
    id v12 = v7;
    dispatch_async(v9, block);
  }
}

- (void)mapsMerchantsWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = PDDefaultQueue();
    id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v5);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1002A0050;
    v7[3] = &unk_10063AC90;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(v6, v7);
  }
}

- (void)valueAddedServiceTransactionsForPassWithUniqueIdentifier:(id)a3 limit:(int64_t)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v9)
  {
    id v10 = PDDefaultQueue();
    id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v10);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1002A0224;
    v12[3] = &unk_10063C928;
    v12[4] = self;
    id v13 = v8;
    int64_t v15 = a4;
    id v14 = v9;
    dispatch_async(v11, v12);
  }
}

- (void)valueAddedServiceTransactionsForPaymentTransaction:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = PDDefaultQueue();
    id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v8);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1002A03DC;
    block[3] = &unk_100639AF0;
    void block[4] = self;
    id v11 = v6;
    id v12 = v7;
    dispatch_async(v9, block);
  }
}

- (void)valueAddedServiceTransactionWithIdentifier:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = PDDefaultQueue();
    id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v8);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1002A0590;
    block[3] = &unk_100639AF0;
    void block[4] = self;
    id v11 = v6;
    id v12 = v7;
    dispatch_async(v9, block);
  }
}

- (void)messagesForPaymentPassWithUniqueIdentifier:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = PDDefaultQueue();
    id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v8);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1002A0744;
    block[3] = &unk_100639AF0;
    void block[4] = self;
    id v11 = v6;
    id v12 = v7;
    dispatch_async(v9, block);
  }
}

- (void)balancesForPaymentPassWithUniqueIdentifier:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = PDDefaultQueue();
    id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v8);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1002A0934;
    block[3] = &unk_100639AF0;
    void block[4] = self;
    id v11 = v6;
    id v12 = v7;
    dispatch_async(v9, block);
  }
}

- (void)plansForPaymentPassWithUniqueIdentifier:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = PDDefaultQueue();
    id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v8);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1002A0B24;
    block[3] = &unk_100639AF0;
    void block[4] = self;
    id v11 = v6;
    id v12 = v7;
    dispatch_async(v9, block);
  }
}

- (void)balanceReminderThresholdForBalanceIdentifier:(id)a3 withPassUniqueIdentifier:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = PDDefaultQueue();
  id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v11);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1002A0D3C;
  v16[3] = &unk_10063B440;
  void v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  dispatch_async(v12, v16);
}

- (void)setBalanceReminder:(id)a3 forBalanceIdentifier:(id)a4 withPassUniqueIdentifier:(id)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = PDDefaultQueue();
  id v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v14);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002A0F44;
  block[3] = &unk_10063CD88;
  void block[4] = self;
  id v21 = v10;
  id v22 = v11;
  id v23 = v12;
  id v24 = v13;
  id v16 = v13;
  id v17 = v12;
  id v18 = v11;
  id v19 = v10;
  dispatch_async(v15, block);
}

- (void)cancelAutoTopUpForPassWithUniqueIdentifier:(id)a3 balanceIdentifiers:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = PDDefaultQueue();
  id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v11);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1002A149C;
  v16[3] = &unk_10063B440;
  void v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  dispatch_async(v12, v16);
}

- (void)commutePlanReminderForCommutePlanIdentifier:(id)a3 withPassUniqueIdentifier:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = PDDefaultQueue();
  id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v11);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1002A18A8;
  v16[3] = &unk_10063B440;
  void v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  dispatch_async(v12, v16);
}

- (void)setCommutePlanReminder:(id)a3 forCommutePlanIdentifier:(id)a4 withPassUniqueIdentifier:(id)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = PDDefaultQueue();
  id v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v14);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002A1AB0;
  block[3] = &unk_10063CD88;
  void block[4] = self;
  id v21 = v10;
  id v22 = v11;
  id v23 = v12;
  id v24 = v13;
  id v16 = v13;
  id v17 = v12;
  id v18 = v11;
  id v19 = v10;
  dispatch_async(v15, block);
}

- (void)deletePaymentTransactionWithIdentifier:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = PDDefaultQueue();
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002A1C60;
  block[3] = &unk_100639AF0;
  void block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);
}

- (void)deletePaymentTransactionsWithIdentifiers:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = PDDefaultQueue();
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002A1E04;
  block[3] = &unk_100639AF0;
  void block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);
}

- (void)deleteAllTransactionsForTransactionSourceIdentifiers:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = PDDefaultQueue();
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002A1FA8;
  block[3] = &unk_100639AF0;
  void block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);
}

- (void)deleteAllMessagesForPaymentPassWithUniqueIdentifier:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = PDDefaultQueue();
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002A2228;
  block[3] = &unk_100639AF0;
  void block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);
}

- (void)archiveMessageWithIdentifier:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = PDDefaultQueue();
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002A23CC;
  block[3] = &unk_100639AF0;
  void block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);
}

- (void)insertOrUpdatePaymentTransaction:(id)a3 forTransactionSourceIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = PDDefaultQueue();
  id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v11);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1002A2598;
  v16[3] = &unk_10063B440;
  void v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  dispatch_async(v12, v16);
}

- (void)insertOrUpdatePaymentTransaction:(id)a3 forPassUniqueIdentifier:(id)a4 paymentApplication:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = PDDefaultQueue();
  id v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v14);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002A282C;
  block[3] = &unk_10063CD88;
  void block[4] = self;
  id v21 = v10;
  id v22 = v12;
  id v23 = v11;
  id v24 = v13;
  id v16 = v13;
  id v17 = v11;
  id v18 = v12;
  id v19 = v10;
  dispatch_async(v15, block);
}

- (void)removeMapsDataForTransactionWithIdentifier:(id)a3 forTransactionSourceIdentifier:(id)a4 issueReportIdentifier:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = PDDefaultQueue();
  id v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v14);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002A2BA4;
  block[3] = &unk_10063CD88;
  void block[4] = self;
  id v21 = v10;
  id v22 = v11;
  id v23 = v12;
  id v24 = v13;
  id v16 = v13;
  id v17 = v12;
  id v18 = v11;
  id v19 = v10;
  dispatch_async(v15, block);
}

- (void)sanitizeExpressPasses
{
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    expressPassManager = self->_expressPassManager;
    if (expressPassManager) {
      -[PDExpressPassManager secureElementExpressConfigurationNeedsUpdate]_0((uint64_t)expressPassManager);
    }
  }

- (void)processTransitTransactionEventWithHistory:(id)a3 transactionDate:(id)a4 forPaymentApplication:(id)a5 withPassUniqueIdentifier:(id)a6 expressTransactionState:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess")
    && self->_transitStateManager)
  {
    id v17 = PKAggDKeyPaymentTransactionOtherCard;
    uint64_t v18 = PDDefaultPaymentPassUniqueIdentifier();
    id v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    id v20 = v15;
    id v21 = v19;
    if (v21 == v20)
    {
    }

    else
    {
      id v22 = v21;
      if (!v20 || !v21)
      {

        goto LABEL_14;
      }

      unsigned int v25 = [v20 isEqualToString:v21];

      if (!v25) {
        goto LABEL_15;
      }
    }

    id v22 = v17;
    id v17 = PKAggDKeyPaymentTransactionDefaultCard;
LABEL_14:

LABEL_15:
    PKAnalyticsSendEvent(v17, 0LL);
    -[PDTransitStateManager processTransactionEventWithHistory:transactionDate:forPaymentApplication:withPassUniqueIdentifier:expressTransactionState:]( self->_transitStateManager,  "processTransactionEventWithHistory:transactionDate:forPaymentApplication:withPassUniqueIdentifier:expressTransactionState:",  v12,  v13,  v14,  v20,  v16);

    goto LABEL_16;
  }

  uint64_t Object = PKLogFacilityTypeGetObject(6LL);
  id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v27 = "-[PDPaymentService processTransitTransactionEventWithHistory:transactionDate:forPaymentApplication:withPassUni"
          "queIdentifier:expressTransactionState:]";
    _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  buf,  0xCu);
  }

LABEL_16:
}

- (void)recordPaymentApplicationUsageForPassUniqueIdentifier:(id)a3 paymentApplicationIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess") & 1) == 0)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 136315138;
      id v16 = "-[PDPaymentService recordPaymentApplicationUsageForPassUniqueIdentifier:paymentApplicationIdentifier:]";
      id v13 = "Client is not entitled for method: %s";
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v15, 0xCu);
    }

- (void)allPaymentApplicationUsageSummariesWithCompletion:(id)a3
{
  whitelist = self->_whitelist;
  id v5 = (void (**)(void))a3;
  if ((-[PKEntitlementWhitelist paymentAllAccess](whitelist, "paymentAllAccess") & 1) != 0)
  {
    id v8 = (id)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager allPaymentApplicationUsageSummaries]( self->_databaseManager,  "allPaymentApplicationUsageSummaries"));
    v5[2](v5);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v10 = "-[PDPaymentService allPaymentApplicationUsageSummariesWithCompletion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  buf,  0xCu);
    }

    ((void (*)(void (**)(void), void))v5[2])(v5, 0LL);
  }

- (void)transitStateWithPassUniqueIdentifier:(id)a3 paymentApplication:(id)a4 handler:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, void))a5;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess")
    && (transitStateManager = self->_transitStateManager) != 0LL)
  {
    -[PDTransitStateManager transitAppletStateWithPassUniqueIdentifier:paymentApplication:completion:]( transitStateManager,  "transitAppletStateWithPassUniqueIdentifier:paymentApplication:completion:",  v11,  v8,  v9);
  }

  else if (v9)
  {
    v9[2](v9, 0LL);
  }
}

- (void)outstandingExpressTransactionState:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v6 = v4;
    if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess")
      && (expressPassManager = self->_expressPassManager) != 0LL)
    {
      sub_10014DD94((uint64_t)expressPassManager, v6);
    }

    else
    {
      (*((void (**)(id, void))v6 + 2))(v6, 0LL);
    }

    id v4 = v6;
  }
}

- (void)insertOrUpdateValueAddedServiceTransaction:(id)a3 forPassUniqueIdentifier:(id)a4 paymentTransaction:(id)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = PDDefaultQueue();
  int v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v14);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002A33FC;
  block[3] = &unk_10063CD88;
  void block[4] = self;
  id v21 = v10;
  id v22 = v11;
  id v23 = v12;
  id v24 = v13;
  id v16 = v13;
  id v17 = v12;
  id v18 = v11;
  id v19 = v10;
  dispatch_async(v15, block);
}

- (void)setDefaultPaymentApplication:(id)a3 forPassUniqueIdentifier:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
  id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_1002A37C4;
  v17[3] = &unk_10063B440;
  void v17[4] = self;
  id v18 = v8;
  id v19 = v9;
  id v20 = v10;
  id v13 = v17;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002B85E0;
  block[3] = &unk_10063A830;
  id v22 = v13;
  id v14 = v10;
  id v15 = v9;
  id v16 = v8;
  dispatch_async(v12, block);
}

- (void)defaultPaymentApplicationForPassUniqueIdentifier:(id)a3 handler:(id)a4
{
  id v6 = a3;
  if (a4)
  {
    whitelist = self->_whitelist;
    id v8 = (void (**)(id, void *))a4;
    if (-[PKEntitlementWhitelist paymentAllAccess](whitelist, "paymentAllAccess"))
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager defaultPaymentApplicationForPassUniqueIdentifier:]( self->_databaseManager,  "defaultPaymentApplicationForPassUniqueIdentifier:",  v6));
    }

    else
    {
      uint64_t Object = PKLogFacilityTypeGetObject(6LL);
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 136315138;
        id v13 = "-[PDPaymentService defaultPaymentApplicationForPassUniqueIdentifier:handler:]";
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  (uint8_t *)&v12,  0xCu);
      }

      id v9 = 0LL;
    }

    v8[2](v8, v9);
  }
}

- (void)initializeSecureElementIfNecessaryWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = PDDefaultQueue();
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v5);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1002A3A80;
  v8[3] = &unk_10063AC90;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

- (void)initializeSecureElement:(id)a3
{
  id v4 = a3;
  id v5 = PDDefaultQueue();
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v5);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1002A3C3C;
  v8[3] = &unk_10063AC90;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

- (void)simulatePaymentPushTopic:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = PDDefaultQueue();
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002A3E98;
  block[3] = &unk_100639AF0;
  void block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);
}

- (void)simulateVehicleInitiatedPairingWithTCIs:(id)a3 brandCode:(int64_t)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = PDDefaultQueue();
  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v10);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1002A4048;
  v14[3] = &unk_10063C928;
  void v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  int64_t v17 = a4;
  id v12 = v9;
  id v13 = v8;
  dispatch_async(v11, v14);
}

- (void)simulateNotificationOfType:(unint64_t)a3 userInfo:(id)a4 handler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = PDDefaultQueue();
  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v10);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1002A41FC;
  v14[3] = &unk_10063C928;
  void v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  unint64_t v17 = a3;
  id v12 = v9;
  id v13 = v8;
  dispatch_async(v11, v14);
}

- (void)downloadAllPaymentPassesWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = PDDefaultQueue();
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v5);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1002A5834;
  v8[3] = &unk_10063AC90;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

- (void)consistencyCheckWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = PDDefaultQueue();
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v5);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1002A59B4;
  v8[3] = &unk_10063AC90;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

- (void)scheduleSetupReminders:(id)a3
{
  id v4 = a3;
  id v5 = PDDefaultQueue();
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v5);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1002A5B34;
  v8[3] = &unk_10063AC90;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

- (void)scheduleDeviceCheckInWithStartTimeOffset:(double)a3
{
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess")) {
    -[PDPaymentWebServiceCoordinator scheduleDeviceCheckInWithStartTimeOffset:]( self->_paymentWebServiceCoordinator,  "scheduleDeviceCheckInWithStartTimeOffset:",  a3);
  }
}

- (void)unscheduleDeviceCheckIn
{
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess")) {
    -[PDPaymentWebServiceCoordinator unscheduleDeviceCheckIn]( self->_paymentWebServiceCoordinator,  "unscheduleDeviceCheckIn");
  }
}

- (void)removeProductsCache
{
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Warning: Forcibly removing products cache",  v6,  2u);
    }

    id v5 = (void *)objc_claimAutoreleasedReturnValue( -[PDPaymentWebServiceCoordinator paymentSetupFeaturesCoordinator]( self->_paymentWebServiceCoordinator,  "paymentSetupFeaturesCoordinator"));
    [v5 clearPaymentSetupFeatures];
  }

- (void)requestNotificationAuthorizationIfNecessaryWithCompletion:(id)a3
{
  id v4 = a3;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    -[PDUserNotificationManager requestNotificationAuthorizationIfNecessaryWithCompletion:]( self->_userNotificationManager,  "requestNotificationAuthorizationIfNecessaryWithCompletion:",  v4);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315138;
      id v8 = "-[PDPaymentService requestNotificationAuthorizationIfNecessaryWithCompletion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  (uint8_t *)&v7,  0xCu);
    }
  }
}

- (void)requestNotificationAuthorizationWithCompletion:(id)a3
{
  id v4 = a3;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    -[PDUserNotificationManager requestNotificationAuthorizationWithCompletion:]( self->_userNotificationManager,  "requestNotificationAuthorizationWithCompletion:",  v4);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315138;
      id v8 = "-[PDPaymentService requestNotificationAuthorizationWithCompletion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  (uint8_t *)&v7,  0xCu);
    }
  }
}

- (void)userNotificationActionPerformed:(unint64_t)a3 applicationMessageContentIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = (void (**)(void))a5;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    -[PDUserNotificationManager userNotificationActionPerformed:applicationMessageContentIdentifier:]( self->_userNotificationManager,  "userNotificationActionPerformed:applicationMessageContentIdentifier:",  a3,  v8);
    if (!v9) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }

  uint64_t Object = PKLogFacilityTypeGetObject(6LL);
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315138;
    id v13 = "-[PDPaymentService userNotificationActionPerformed:applicationMessageContentIdentifier:completion:]";
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  (uint8_t *)&v12,  0xCu);
  }

  if (v9) {
LABEL_7:
  }
    v9[2](v9);
LABEL_8:
}

- (void)userNotificationActionPerformed:(unint64_t)a3 notificationIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = (void (**)(void))a5;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    -[PDSharingManager userNotificationActionPerformed:notificationIdentifier:]( self->_sharingManager,  "userNotificationActionPerformed:notificationIdentifier:",  a3,  v8);
    if (!v9) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }

  uint64_t Object = PKLogFacilityTypeGetObject(6LL);
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315138;
    id v13 = "-[PDPaymentService userNotificationActionPerformed:notificationIdentifier:completion:]";
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  (uint8_t *)&v12,  0xCu);
  }

  if (v9) {
LABEL_7:
  }
    v9[2](v9);
LABEL_8:
}

- (void)passbookUIServiceDidLaunch:(id)a3
{
  id v4 = (void (**)(void))a3;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    nullsub_41(self->_remoteInterfacePresenter, v5);
    if (!v4) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }

  uint64_t Object = PKLogFacilityTypeGetObject(6LL);
  int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    id v9 = "-[PDPaymentService passbookUIServiceDidLaunch:]";
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  (uint8_t *)&v8,  0xCu);
  }

  if (v4) {
LABEL_7:
  }
    v4[2](v4);
LABEL_8:
}

- (void)simulateExpressTransactionForPassUniqueIdentifier:(id)a3 withCompletion:(id)a4
{
  id v6 = (char *)a3;
  int v7 = (void (**)(void))a4;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    int has_internal_ui = os_variant_has_internal_ui(PKOSVariantSubsystem);
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (has_internal_ui)
    {
      if (v11)
      {
        int v14 = 138412290;
        id v15 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "PDPassLibrary: simulating express transaction for %@.",  (uint8_t *)&v14,  0xCu);
      }

      sub_10014AF04((uint64_t)self->_expressPassManager, v6);
      if (!v7) {
        goto LABEL_11;
      }
LABEL_10:
      v7[2](v7);
      goto LABEL_11;
    }

    if (v11)
    {
      int v14 = 136315138;
      id v15 = "-[PDPaymentService simulateExpressTransactionForPassUniqueIdentifier:withCompletion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "PDPassLibrary (%s): not internal.",  (uint8_t *)&v14,  0xCu);
    }

    if (v7) {
      goto LABEL_10;
    }
  }

  else
  {
    uint64_t v12 = PKLogFacilityTypeGetObject(6LL);
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 136315138;
      id v15 = "-[PDPaymentService simulateExpressTransactionForPassUniqueIdentifier:withCompletion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "PDPassLibrary (%s): not entitled.",  (uint8_t *)&v14,  0xCu);
    }

    if (v7) {
      goto LABEL_10;
    }
  }

- (void)usingSynchronousProxy:(BOOL)a3 handleStandaloneTransaction:(id)a4 withCompletion:(id)a5
{
  id v7 = a4;
  int v8 = (void (**)(void))a5;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    if (v7) {
      sub_10014B360((uint64_t)self->_expressPassManager, v7);
    }
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315138;
      uint64_t v12 = "-[PDPaymentService usingSynchronousProxy:handleStandaloneTransaction:withCompletion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "PDPaymentService: client is not entitled for method: %s.",  (uint8_t *)&v11,  0xCu);
    }
  }

  if (v8) {
    v8[2](v8);
  }
}

- (void)startBackgroundVerificationObserverForPass:(id)a3 verificationMethod:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if (-[PKEntitlementWhitelist passesAllAccess](self->_whitelist, "passesAllAccess")) {
    -[PDPaymentWebServiceCoordinator startBackgroundVerificationObserverForPass:verificationMethod:]( self->_paymentWebServiceCoordinator,  "startBackgroundVerificationObserverForPass:verificationMethod:",  v7,  v6);
  }
}

- (void)augmentedProductForInstallmentConfiguration:(id)a3 experimentDetails:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void))a5;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    -[PDApplyManager augmentedProductForInstallmentConfiguration:experimentDetails:withCompletion:]( self->_applyManager,  "augmentedProductForInstallmentConfiguration:experimentDetails:withCompletion:",  v8,  v9,  v10);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(13LL);
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 136315138;
      int v14 = "-[PDPaymentService augmentedProductForInstallmentConfiguration:experimentDetails:withCompletion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  (uint8_t *)&v13,  0xCu);
    }

    if (v10) {
      v10[2](v10, 0LL);
    }
  }
}

- (void)featureApplicationsWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    -[PDApplyManager applicationsWithCompletion:](self->_applyManager, "applicationsWithCompletion:", v4);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(13LL);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315138;
      id v8 = "-[PDPaymentService featureApplicationsWithCompletion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  (uint8_t *)&v7,  0xCu);
    }

    if (v4) {
      v4[2](v4, 0LL);
    }
  }
}

- (void)featureApplicationsForAccountIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  int v7 = (void (**)(id, void))a4;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    -[PDApplyManager applicationsForAccountIdentifier:withCompletion:]( self->_applyManager,  "applicationsForAccountIdentifier:withCompletion:",  v6,  v7);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(13LL);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315138;
      int v11 = "-[PDPaymentService featureApplicationsForAccountIdentifier:completion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  (uint8_t *)&v10,  0xCu);
    }

    if (v7) {
      v7[2](v7, 0LL);
    }
  }
}

- (void)updateFeatureApplicationsForAccountIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    -[PDApplyManager updateApplicationsForAccountWithIdentifier:completion:]( self->_applyManager,  "updateApplicationsForAccountWithIdentifier:completion:",  v6,  v7);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(13LL);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315138;
      int v11 = "-[PDPaymentService updateFeatureApplicationsForAccountIdentifier:completion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  (uint8_t *)&v10,  0xCu);
    }

    if (v7) {
      (*((void (**)(id, void, void))v7 + 2))(v7, 0LL, 0LL);
    }
  }
}

- (void)featureApplicationWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    -[PDApplyManager applicationWithIdentifier:completion:]( self->_applyManager,  "applicationWithIdentifier:completion:",  v6,  v7);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(13LL);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315138;
      int v11 = "-[PDPaymentService featureApplicationWithIdentifier:completion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  (uint8_t *)&v10,  0xCu);
    }

    if (v7) {
      v7[2](v7, 0LL);
    }
  }
}

- (void)featureApplicationsForProvisioningWithCompletion:(id)a3
{
  id v4 = a3;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    -[PDPaymentService _updateApplicationsForType:completion:](self, "_updateApplicationsForType:completion:", 1LL, v4);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(13LL);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315138;
      id v8 = "-[PDPaymentService featureApplicationsForProvisioningWithCompletion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  (uint8_t *)&v7,  0xCu);
    }

    if (v4) {
      (*((void (**)(id, void, void))v4 + 2))(v4, 0LL, 0LL);
    }
  }
}

- (void)featureApplicationsForAccountUserInvitationWithCompletion:(id)a3
{
  id v4 = a3;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    applyManager = self->_applyManager;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_1002A6EBC;
    v9[3] = &unk_1006415E8;
    id v10 = v4;
    -[PDApplyManager applicationsWithCompletion:](applyManager, "applicationsWithCompletion:", v9);
    id v6 = v10;
LABEL_7:

    goto LABEL_8;
  }

  uint64_t Object = PKLogFacilityTypeGetObject(13LL);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v12 = "-[PDPaymentService featureApplicationsForAccountUserInvitationWithCompletion:]";
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  buf,  0xCu);
  }

  if (v4)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKPassKitErrorDomain,  4LL,  0LL));
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0LL, v6);
    goto LABEL_7;
  }

- (void)_updateApplicationsForType:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  applyManager = self->_applyManager;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1002A6FBC;
  v9[3] = &unk_1006525B8;
  id v10 = v6;
  int64_t v11 = a3;
  id v8 = v6;
  -[PDApplyManager updateApplicationsWithCompletion:](applyManager, "updateApplicationsWithCompletion:", v9);
}

- (void)featureApplicationWithReferenceIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  int v7 = (void (**)(id, void))a4;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    -[PDApplyManager applicationWithReferenceIdentifier:completion:]( self->_applyManager,  "applicationWithReferenceIdentifier:completion:",  v6,  v7);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(13LL);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315138;
      int64_t v11 = "-[PDPaymentService featureApplicationWithReferenceIdentifier:completion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  (uint8_t *)&v10,  0xCu);
    }

    if (v7) {
      v7[2](v7, 0LL);
    }
  }
}

- (void)submitApplyRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    -[PDApplyManager submitApplyRequest:completion:](self->_applyManager, "submitApplyRequest:completion:", v6, v7);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(13LL);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315138;
      int64_t v11 = "-[PDPaymentService submitApplyRequest:completion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  (uint8_t *)&v10,  0xCu);
    }

    if (v7) {
      (*((void (**)(id, void, void))v7 + 2))(v7, 0LL, 0LL);
    }
  }
}

- (void)submitDocumentRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    -[PDApplyManager submitDocumentRequest:completion:]( self->_applyManager,  "submitDocumentRequest:completion:",  v6,  v7);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(13LL);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315138;
      int64_t v11 = "-[PDPaymentService submitDocumentRequest:completion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  (uint8_t *)&v10,  0xCu);
    }

    if (v7) {
      (*((void (**)(id, void, void))v7 + 2))(v7, 0LL, 0LL);
    }
  }
}

- (void)submitVerificationRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    -[PDApplyManager submitVerificationRequest:completion:]( self->_applyManager,  "submitVerificationRequest:completion:",  v6,  v7);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(13LL);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315138;
      int64_t v11 = "-[PDPaymentService submitVerificationRequest:completion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  (uint8_t *)&v10,  0xCu);
    }

    if (v7) {
      (*((void (**)(id, void, void))v7 + 2))(v7, 0LL, 0LL);
    }
  }
}

- (void)submitTermsRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    -[PDApplyManager submitTermsRequest:completion:](self->_applyManager, "submitTermsRequest:completion:", v6, v7);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(13LL);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315138;
      int64_t v11 = "-[PDPaymentService submitTermsRequest:completion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  (uint8_t *)&v10,  0xCu);
    }

    if (v7) {
      (*((void (**)(id, void, void))v7 + 2))(v7, 0LL, 0LL);
    }
  }
}

- (void)submitDeleteRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    -[PDApplyManager submitDeleteRequest:completion:](self->_applyManager, "submitDeleteRequest:completion:", v6, v7);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(13LL);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315138;
      int64_t v11 = "-[PDPaymentService submitDeleteRequest:completion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  (uint8_t *)&v10,  0xCu);
    }

    if (v7) {
      v7[2](v7, 0LL);
    }
  }
}

- (void)submitTransactionAnswerForTransaction:(id)a3 questionType:(unint64_t)a4 answer:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    id v28 = v10;
    int v13 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager transactionWithTransactionIdentifier:]( self->_databaseManager,  "transactionWithTransactionIdentifier:",  v10));
    int v14 = (void *)objc_claimAutoreleasedReturnValue([v13 transactionSourceIdentifier]);
    id v15 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager accountUserWithTransactionSourceIdentifier:]( self->_databaseManager,  "accountUserWithTransactionSourceIdentifier:",  v14));
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v13 accountIdentifier]);
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = PKPaymentTransactionQuestionTypeToString(a4);
      id v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
      *(_DWORD *)buf = 138413314;
      v38 = (const char *)v13;
      __int16 v39 = 2112;
      id v40 = v28;
      __int16 v41 = 2112;
      v42 = v16;
      __int16 v43 = 2112;
      v44 = v20;
      __int16 v45 = 2112;
      id v46 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Submitting transaction answer for transaction %@, transactionSourceIdentifier %@, accountIdentifier %@, question Type %@, answer %@",  buf,  0x34u);
    }

    accountManager = self->_accountManager;
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472LL;
    v29[2] = sub_1002A79E8;
    v29[3] = &unk_100652630;
    v29[4] = self;
    unint64_t v36 = a4;
    id v30 = v11;
    id v31 = v13;
    id v32 = v16;
    id v33 = v15;
    id v34 = v14;
    id v35 = v12;
    id v22 = v14;
    id v23 = v15;
    id v24 = v16;
    id v25 = v13;
    -[PDAccountManager accountWithIdentifier:completion:](accountManager, "accountWithIdentifier:completion:", v24, v29);

    id v10 = v28;
  }

  else
  {
    uint64_t v26 = PKLogFacilityTypeGetObject(6LL);
    id v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v38 = "-[PDPaymentService submitTransactionAnswerForTransaction:questionType:answer:completion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  buf,  0xCu);
    }

    if (v12) {
      (*((void (**)(id, void))v12 + 2))(v12, 0LL);
    }
  }
}

- (void)transactionsRequiringReviewForAccountWithIdentifier:(id)a3 completion:(id)a4
{
  id v8 = a3;
  id v6 = (void (**)(id, void *))a4;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager transactionsRequiringReviewForAccountWithIdentifier:]( self->_databaseManager,  "transactionsRequiringReviewForAccountWithIdentifier:",  v8));
    v6[2](v6, v7);
  }
}

- (void)categoryVisualizationMagnitudesForPassUniqueID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  if (v7)
  {
    if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager categoryVisualizationMagnitudesForPassUniqueID:]( self->_databaseManager,  "categoryVisualizationMagnitudesForPassUniqueID:",  v6));
      v7[2](v7, v8);
    }

    else
    {
      uint64_t Object = PKLogFacilityTypeGetObject(6LL);
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 136315138;
        id v12 = "-[PDPaymentService categoryVisualizationMagnitudesForPassUniqueID:completion:]";
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  (uint8_t *)&v11,  0xCu);
      }

      v7[2](v7, 0LL);
    }
  }
}

- (void)recomputeCategoryVisualizationMangitudesForPassUniqueID:(id)a3 style:(int64_t)a4
{
  id v6 = a3;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    -[PDDatabaseManager recomputeCategoryVisualizationMagnitudesForPassUniqueID:withStyle:]( self->_databaseManager,  "recomputeCategoryVisualizationMagnitudesForPassUniqueID:withStyle:",  v6,  a4);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315138;
      id v10 = "-[PDPaymentService recomputeCategoryVisualizationMangitudesForPassUniqueID:style:]";
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  (uint8_t *)&v9,  0xCu);
    }
  }
}

- (void)_requestUpdatesForTransactionSourceIdentifiers:(id)a3
{
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id obj = a3;
  id v4 = [obj countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      id v7 = 0LL;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v12 + 1) + 8LL * (void)v7);
        int v9 = (void *)objc_claimAutoreleasedReturnValue( -[PDCloudStoreNotificationCoordinator applePayContainer]( self->_cloudStoreNotificationCoordinator,  "applePayContainer"));
        v11[0] = _NSConcreteStackBlock;
        v11[1] = 3221225472LL;
        v11[2] = sub_1002A8154;
        v11[3] = &unk_1006426D8;
        void v11[4] = self;
        v11[5] = v8;
        [v9 canSyncTransactionFromCloudKitForTransactionSourceIdentifier:v8 completion:v11];

        id v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [obj countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v5);
  }
}

- (void)displayTapToRadarAlertForRequest:(id)a3 completion:(id)a4
{
  p_tapToRadarDelegate = &self->_tapToRadarDelegate;
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_tapToRadarDelegate);
  [WeakRetained displayTapToRadarAlertForRequest:v7 completion:v6];
}

- (void)accountAttestationAnonymizationSaltWithCompletion:(id)a3
{
  id v4 = a3;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    -[PDPaymentWebServiceCoordinator accountAttestationAnonymizationSaltWithCompletion:]( self->_paymentWebServiceCoordinator,  "accountAttestationAnonymizationSaltWithCompletion:",  v4);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315138;
      uint64_t v8 = "-[PDPaymentService accountAttestationAnonymizationSaltWithCompletion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  (uint8_t *)&v7,  0xCu);
    }

    if (v4) {
      (*((void (**)(id, void, void))v4 + 2))(v4, 0LL, 0LL);
    }
  }
}

- (void)setAccountAttestationAnonymizationSalt:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  int v7 = (void (**)(id, void))a4;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    -[PDPaymentWebServiceCoordinator setAccountAttestationAnonymizationSalt:withCompletion:]( self->_paymentWebServiceCoordinator,  "setAccountAttestationAnonymizationSalt:withCompletion:",  v6,  v7);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315138;
      int v11 = "-[PDPaymentService setAccountAttestationAnonymizationSalt:withCompletion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  (uint8_t *)&v10,  0xCu);
    }

    if (v7) {
      v7[2](v7, 0LL);
    }
  }
}

- (void)suggestPaymentSafariCredentialImport:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  int v7 = (void (**)(id, uint64_t, void))a4;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    uint64_t v8 = PKSafariCredentialProvisioningConsented();
    if (v8 == 1)
    {
      -[PDPaymentService notifyForSafariCardImportWithCredentials:withCompletion:]( self,  "notifyForSafariCardImportWithCredentials:withCompletion:",  v6,  v7);
    }

    else if (v8)
    {
      uint64_t Object = PKLogFacilityTypeGetObject(6LL);
      __int128 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v14) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Explicitly requested to not check credential eligibility",  (uint8_t *)&v14,  2u);
      }

      if (v7) {
        v7[2](v7, 1LL, 0LL);
      }
    }

    else
    {
      -[PDPaymentService notifyForSafariCardImportConsentWithCompletion:]( self,  "notifyForSafariCardImportConsentWithCompletion:",  v7);
    }
  }

  else
  {
    uint64_t v9 = PKLogFacilityTypeGetObject(6LL);
    int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 136315138;
      __int128 v15 = "-[PDPaymentService suggestPaymentSafariCredentialImport:withCompletion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  (uint8_t *)&v14,  0xCu);
    }

    if (v7)
    {
      int v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKPassKitErrorDomain,  4LL,  0LL));
      ((void (**)(id, uint64_t, void *))v7)[2](v7, 0LL, v11);
    }
  }
}

- (void)notifyForSafariCardImportConsentWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void, void *))a3;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    -[PDPaymentUserCommunicationManager sendSafariCredentialImportConsentNotificationWithCompletion:]( self->_paymentUserCommunicationManager,  "sendSafariCredentialImportConsentNotificationWithCompletion:",  v4);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315138;
      uint64_t v9 = "-[PDPaymentService notifyForSafariCardImportConsentWithCompletion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  (uint8_t *)&v8,  0xCu);
    }

    if (v4)
    {
      int v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKPassKitErrorDomain,  4LL,  0LL));
      v4[2](v4, 0LL, v7);
    }
  }
}

- (void)notifyForSafariCardImportWithCredentials:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  int v7 = (void (**)(id, void, void *))a4;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    -[PDPaymentUserCommunicationManager sendSafariCredentialImportNotificationForCredentials:withCompletion:]( self->_paymentUserCommunicationManager,  "sendSafariCredentialImportNotificationForCredentials:withCompletion:",  v6,  v7);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315138;
      __int128 v12 = "-[PDPaymentService notifyForSafariCardImportWithCredentials:withCompletion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  (uint8_t *)&v11,  0xCu);
    }

    if (v7)
    {
      int v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKPassKitErrorDomain,  4LL,  0LL));
      v7[2](v7, 0LL, v10);
    }
  }
}

- (void)clearSafariCardImportNotificationsWithCompletion:(id)a3
{
  id v4 = (void (**)(id, uint64_t, void))a3;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    -[PDPaymentUserCommunicationManager clearSafariCredentialImportMessages]( self->_paymentUserCommunicationManager,  "clearSafariCredentialImportMessages");
    if (v4) {
      v4[2](v4, 1LL, 0LL);
    }
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315138;
      uint64_t v9 = "-[PDPaymentService clearSafariCardImportNotificationsWithCompletion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  (uint8_t *)&v8,  0xCu);
    }

    if (v4)
    {
      int v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKPassKitErrorDomain,  4LL,  0LL));
      ((void (**)(id, uint64_t, void *))v4)[2](v4, 0LL, v7);
    }
  }
}

- (void)clearSafariCardImportNotificationHistoryWithCompletion:(id)a3
{
  id v4 = (void (**)(id, uint64_t, void))a3;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    -[PDPaymentUserCommunicationManager clearSafariCredentialImportNotifiedIdentifiers]( self->_paymentUserCommunicationManager,  "clearSafariCredentialImportNotifiedIdentifiers");
    if (v4) {
      v4[2](v4, 1LL, 0LL);
    }
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315138;
      uint64_t v9 = "-[PDPaymentService clearSafariCardImportNotificationHistoryWithCompletion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  (uint8_t *)&v8,  0xCu);
    }

    if (v4)
    {
      int v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKPassKitErrorDomain,  4LL,  0LL));
      ((void (**)(id, uint64_t, void *))v4)[2](v4, 0LL, v7);
    }
  }
}

- (void)sendDeviceSharingCapabilitiesRequestForHandle:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
    uint64_t v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1002A8C54;
    v11[3] = &unk_100639AF0;
    void v11[4] = self;
    id v12 = v6;
    id v13 = v7;
    int v10 = v11;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1002B85E0;
    block[3] = &unk_10063A830;
    id v15 = v10;
    dispatch_async(v9, block);
  }

  else if (v7)
  {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0LL, 0LL);
  }
}

- (void)addPlaceholderPassWithConfiguration:(id)a3 completion:(id)a4
{
  id v6 = (char *)a3;
  id v7 = (void (**)(id, void *))a4;
  if (!-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      BOOL v29 = "-[PDPaymentService addPlaceholderPassWithConfiguration:completion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  buf,  0xCu);
    }

LABEL_12:
    id v22 = 0LL;
    if (!v7) {
      goto LABEL_14;
    }
LABEL_13:
    id v25 = (void *)PDOSTransactionCreate("PDPaymentService");
    uint64_t v26 = objc_autoreleasePoolPush();
    v7[2](v7, v22);
    objc_autoreleasePoolPop(v26);

    goto LABEL_14;
  }

  if (!v6) {
    goto LABEL_12;
  }
  int v8 = objc_autoreleasePoolPush();
  uint64_t v9 = PKLogFacilityTypeGetObject(22LL);
  int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    BOOL v29 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Adding placeholder pass with config: %@",  buf,  0xCu);
  }

  uint64_t v11 = PKPassKitCoreBundle();
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 resourceURL]);
  int v14 = (void *)objc_claimAutoreleasedReturnValue([v13 URLByAppendingPathComponent:PKCredentialPlaceholderPassName]);

  uint64_t v15 = PKPassFromPlaceholderConfiguration(v6, v14);
  id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  unint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 paymentPass]);

  if (v17)
  {
    id v27 = 0LL;
    unsigned int v18 = -[PDCardFileManager writeCard:source:error:]( self->_cardFileManager,  "writeCard:source:error:",  v17,  1LL,  &v27);
    uint64_t v19 = v27;
    if (!v18 || v27)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        BOOL v29 = v19;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Failed to add placeholder pass: %@",  buf,  0xCu);
      }

      id v22 = 0LL;
    }

    else
    {
      databaseManager = self->_databaseManager;
      uint64_t v21 = objc_claimAutoreleasedReturnValue([v17 uniqueID]);
      int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager passWithUniqueIdentifier:]( databaseManager,  "passWithUniqueIdentifier:",  v21));
      id v22 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s paymentPass](v10, "paymentPass"));

      unint64_t v17 = (void *)v21;
    }
  }

  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Failed to add placeholder pass: unable to generate pass",  buf,  2u);
    }

    id v22 = 0LL;
  }

  objc_autoreleasePoolPop(v8);
  if (v7) {
    goto LABEL_13;
  }
LABEL_14:
}

- (void)subcredentialInvitationsWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDAppletSubcredentialManager invitations](self->_subcredentialManager, "invitations"));
    if (!v4) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }

  uint64_t Object = PKLogFacilityTypeGetObject(6LL);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    uint64_t v9 = "-[PDPaymentService subcredentialInvitationsWithCompletion:]";
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  (uint8_t *)&v8,  0xCu);
  }

  id v5 = 0LL;
  if (v4) {
LABEL_7:
  }
    v4[2](v4, v5);
LABEL_8:
}

- (void)updateMetadataOnPassWithIdentifier:(id)a3 credential:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  int v10 = (void (**)(id, void))a5;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    -[PDAppletSubcredentialManager updateMetadataOnPassWithIdentifier:credential:completion:]( self->_subcredentialManager,  "updateMetadataOnPassWithIdentifier:credential:completion:",  v8,  v9,  v10);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 136315138;
      int v14 = "-[PDPaymentService updateMetadataOnPassWithIdentifier:credential:completion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  (uint8_t *)&v13,  0xCu);
    }

    if (v10) {
      v10[2](v10, 0LL);
    }
  }
}

- (void)registerCredentialsWithIdentifiers:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v14 = a4;
  id v6 = dispatch_group_create();
  v31[0] = 0LL;
  v31[1] = v31;
  v31[2] = 0x3032000000LL;
  v31[3] = sub_10029AE5C;
  v31[4] = sub_10029AE6C;
  id v32 = -[NSMutableSet initWithCapacity:]( [NSMutableSet alloc],  "initWithCapacity:",  [v5 count]);
  v29[0] = 0LL;
  v29[1] = v29;
  v29[2] = 0x3032000000LL;
  v29[3] = sub_10029AE5C;
  v29[4] = sub_10029AE6C;
  id v30 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id obj = v5;
  id v7 = [obj countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v26;
    do
    {
      id v9 = 0LL;
      do
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v25 + 1) + 8LL * (void)v9);
        dispatch_group_enter(v6);
        subcredentialManager = self->_subcredentialManager;
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472LL;
        v21[2] = sub_1002A9528;
        v21[3] = &unk_100652680;
        id v23 = v31;
        id v24 = v29;
        id v22 = v6;
        -[PDAppletSubcredentialManager requestRegistrationForCredentialWithIdentifier:completion:]( subcredentialManager,  "requestRegistrationForCredentialWithIdentifier:completion:",  v10,  v21);

        id v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [obj countByEnumeratingWithState:&v25 objects:v33 count:16];
    }

    while (v7);
  }

  if (v14)
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
    int v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1002A95A4;
    block[3] = &unk_100648798;
    id v18 = v14;
    uint64_t v19 = v31;
    id v20 = v29;
    dispatch_group_notify(v6, v13, block);
  }

  _Block_object_dispose(v29, 8);

  _Block_object_dispose(v31, 8);
}

- (void)revokeCredentialsWithIdentifiers:(id)a3 completion:(id)a4
{
  subcredentialManager = self->_subcredentialManager;
  id v6 = a4;
  id v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "pk_setByApplyingBlock:", &stru_1006526A0));
  -[PDAppletSubcredentialManager revokeSubcredentials:withCompletion:]( subcredentialManager,  "revokeSubcredentials:withCompletion:",  v7,  v6);
}

- (void)revokeCredentialsWithReaderIdentifiers:(id)a3 completion:(id)a4
{
}

- (void)addPassShare:(id)a3 onCredentialWithIdentifier:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, BOOL))a5;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    BOOL v11 = -[PDAppletSubcredentialManager addPassShare:onCredentialWithIdentifier:]( self->_subcredentialManager,  "addPassShare:onCredentialWithIdentifier:",  v8,  v9);
    if (!v10) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }

  uint64_t Object = PKLogFacilityTypeGetObject(6LL);
  int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315138;
    uint64_t v15 = "-[PDPaymentService addPassShare:onCredentialWithIdentifier:withCompletion:]";
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  (uint8_t *)&v14,  0xCu);
  }

  BOOL v11 = 0LL;
  if (v10) {
LABEL_7:
  }
    v10[2](v10, v11);
LABEL_8:
}

- (void)declineRelatedSharingInvitationsIfNecessary:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    -[PDAppletSubcredentialManager declineRelatedSharingInvitationsIfNecessary:withCompletion:]( self->_subcredentialManager,  "declineRelatedSharingInvitationsIfNecessary:withCompletion:",  v6,  v7);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315138;
      BOOL v11 = "-[PDPaymentService declineRelatedSharingInvitationsIfNecessary:withCompletion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  (uint8_t *)&v10,  0xCu);
    }

    if (v7) {
      v7[2](v7, 0LL);
    }
  }
}

- (void)removeSharingInvitationReceiptWithIdentifiers:(id)a3 onCredential:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  int v10 = (void (**)(id, BOOL))a5;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    BOOL v11 = -[PDAppletSubcredentialManager removeSharingInvitationReceiptWithIdentifiers:onCredential:]( self->_subcredentialManager,  "removeSharingInvitationReceiptWithIdentifiers:onCredential:",  v8,  v9);
    if (!v10) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }

  uint64_t Object = PKLogFacilityTypeGetObject(6LL);
  int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315138;
    uint64_t v15 = "-[PDPaymentService removeSharingInvitationReceiptWithIdentifiers:onCredential:completion:]";
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  (uint8_t *)&v14,  0xCu);
  }

  BOOL v11 = 0LL;
  if (v10) {
LABEL_7:
  }
    v10[2](v10, v11);
LABEL_8:
}

- (void)removeSharingInvitationWithIdentifier:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, BOOL))a4;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    BOOL v8 = -[PDAppletSubcredentialManager removeSharingInvitationWithIdentifier:]( self->_subcredentialManager,  "removeSharingInvitationWithIdentifier:",  v6);
    if (!v7) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }

  uint64_t Object = PKLogFacilityTypeGetObject(6LL);
  int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315138;
    id v12 = "-[PDPaymentService removeSharingInvitationWithIdentifier:withCompletion:]";
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  (uint8_t *)&v11,  0xCu);
  }

  BOOL v8 = 0LL;
  if (v7) {
LABEL_7:
  }
    v7[2](v7, v8);
LABEL_8:
}

- (void)requestBackgroundRegistrationForCredentialWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id))a4;
  id v8 = -[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess");
  if ((_DWORD)v8)
  {
    -[PDAppletSubcredentialManager requestBackgroundRegistrationForCredentialWithIdentifier:]( self->_subcredentialManager,  "requestBackgroundRegistrationForCredentialWithIdentifier:",  v6);
    if (!v7) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }

  uint64_t Object = PKLogFacilityTypeGetObject(6LL);
  int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315138;
    id v12 = "-[PDPaymentService requestBackgroundRegistrationForCredentialWithIdentifier:completion:]";
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  (uint8_t *)&v11,  0xCu);
  }

  if (v7) {
LABEL_7:
  }
    v7[2](v7, v8);
LABEL_8:
}

- (void)canAcceptInvitation:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  if (v7)
  {
    if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
    {
      -[PDAppletSubcredentialManager canAcceptInvitation:withCompletion:]( self->_subcredentialManager,  "canAcceptInvitation:withCompletion:",  v6,  v7);
    }

    else
    {
      uint64_t Object = PKLogFacilityTypeGetObject(6LL);
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 136315138;
        id v12 = "-[PDPaymentService canAcceptInvitation:withCompletion:]";
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  (uint8_t *)&v11,  0xCu);
      }

      int v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKPassKitErrorDomain,  4LL,  0LL));
      v7[2](v7, v10);
    }
  }
}

- (void)credentialWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager appletSubcredentialWithIdentifier:]( self->_databaseManager,  "appletSubcredentialWithIdentifier:",  v6));
    if (!v7) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }

  uint64_t Object = PKLogFacilityTypeGetObject(6LL);
  int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315138;
    id v12 = "-[PDPaymentService credentialWithIdentifier:completion:]";
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  (uint8_t *)&v11,  0xCu);
  }

  id v8 = 0LL;
  if (v7) {
LABEL_7:
  }
    v7[2](v7, v8);
LABEL_8:
}

- (void)passSharesForCredentialIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess") & 1) != 0)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager passUniqueIdentifierWithCredentialIdentifier:]( self->_databaseManager,  "passUniqueIdentifierWithCredentialIdentifier:",  v6));
    -[PDSharingManager sharesForPassIdentifier:completion:]( self->_sharingManager,  "sharesForPassIdentifier:completion:",  v8,  v7);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315138;
      id v12 = "-[PDPaymentService passSharesForCredentialIdentifier:completion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  (uint8_t *)&v11,  0xCu);
    }
  }
}

- (void)sharingInvitationWasInvalidated:(id)a3 withCredentialIdentifier:(id)a4 error:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  int v13 = (void (**)(id, BOOL))a6;
  if ((-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess") & 1) != 0
    || -[PKEntitlementWhitelist credentialStateAccess](self->_whitelist, "credentialStateAccess"))
  {
    BOOL v14 = -[PDAppletSubcredentialManager sharingInvitationReceiptWasInvalidated:withCredentialIdentifier:error:]( self->_subcredentialManager,  "sharingInvitationReceiptWasInvalidated:withCredentialIdentifier:error:",  v10,  v11,  v12);
    if (v13) {
LABEL_4:
    }
      v13[2](v13, v14);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 136315138;
      id v18 = "-[PDPaymentService sharingInvitationWasInvalidated:withCredentialIdentifier:error:completion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  (uint8_t *)&v17,  0xCu);
    }

    BOOL v14 = 0LL;
    if (v13) {
      goto LABEL_4;
    }
  }
}

- (void)finishedKeyExchangeForCredential:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  if ((-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess") & 1) != 0
    || -[PKEntitlementWhitelist credentialStateAccess](self->_whitelist, "credentialStateAccess"))
  {
    -[PDAppletSubcredentialManager trackSharedCredential:withCompletion:]( self->_subcredentialManager,  "trackSharedCredential:withCompletion:",  v6,  v7);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315138;
      id v11 = "-[PDPaymentService finishedKeyExchangeForCredential:withCompletion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  (uint8_t *)&v10,  0xCu);
    }

    if (v7) {
      v7[2](v7, 0LL);
    }
  }
}

- (void)didReceiveSharingInvitationWithIdentifier:(id)a3 fromOriginatorIDSHandle:(id)a4 sharingSessionIdentifier:(id)a5 metadata:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = (void (**)(id, BOOL))a7;
  if ((-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess") & 1) != 0
    || -[PKEntitlementWhitelist credentialStateAccess](self->_whitelist, "credentialStateAccess"))
  {
    BOOL v17 = -[PDAppletSubcredentialManager didReceiveSharingInvitationWithIdentifier:fromOriginatorIDSHandle:sharingSessionIdentifier:metadata:]( self->_subcredentialManager,  "didReceiveSharingInvitationWithIdentifier:fromOriginatorIDSHandle:sharingSessionIdentifier:metadata:",  v12,  v13,  v14,  v15);
    if (v16) {
LABEL_4:
    }
      v16[2](v16, v17);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 136315138;
      uint64_t v21 = "-[PDPaymentService didReceiveSharingInvitationWithIdentifier:fromOriginatorIDSHandle:sharingSessionIdentifie"
            "r:metadata:completion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  (uint8_t *)&v20,  0xCu);
    }

    BOOL v17 = 0LL;
    if (v16) {
      goto LABEL_4;
    }
  }
}

- (void)didReceiveSharingInvitationRequest:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, BOOL))a4;
  if ((-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess") & 1) != 0
    || -[PKEntitlementWhitelist credentialStateAccess](self->_whitelist, "credentialStateAccess"))
  {
    BOOL v8 = -[PDAppletSubcredentialManager handleSharingInvitationRequest:]( self->_subcredentialManager,  "handleSharingInvitationRequest:",  v6);
    if (v7) {
LABEL_4:
    }
      v7[2](v7, v8);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315138;
      id v12 = "-[PDPaymentService didReceiveSharingInvitationRequest:withCompletion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  (uint8_t *)&v11,  0xCu);
    }

    BOOL v8 = 0LL;
    if (v7) {
      goto LABEL_4;
    }
  }
}

- (void)didUpdateSharingInvitationWithIdentifier:(id)a3 reason:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = (void (**)(id, BOOL))a5;
  if ((-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess") & 1) != 0
    || -[PKEntitlementWhitelist credentialStateAccess](self->_whitelist, "credentialStateAccess"))
  {
    BOOL v10 = -[PDAppletSubcredentialManager didUpdateSharingInvitationWithIdentifier:reason:]( self->_subcredentialManager,  "didUpdateSharingInvitationWithIdentifier:reason:",  v8,  a4);
    if (v9) {
LABEL_4:
    }
      v9[2](v9, v10);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 136315138;
      id v14 = "-[PDPaymentService didUpdateSharingInvitationWithIdentifier:reason:completion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  (uint8_t *)&v13,  0xCu);
    }

    BOOL v10 = 0LL;
    if (v9) {
      goto LABEL_4;
    }
  }
}

- (void)rangingSuspensionReasonForCredential:(id)a3 forPaymentApplicationID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = (void (**)(id, unint64_t))a5;
  if ((-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess") & 1) != 0
    || -[PKEntitlementWhitelist credentialStateAccess](self->_whitelist, "credentialStateAccess"))
  {
    unint64_t v11 = -[PDDatabaseManager rangingSuspensionReasonForAppletSubcredential:forPaymentApplicationID:]( self->_databaseManager,  "rangingSuspensionReasonForAppletSubcredential:forPaymentApplicationID:",  v8,  v9);
    if (v10) {
LABEL_4:
    }
      v10[2](v10, v11);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 136315138;
      id v15 = "-[PDPaymentService rangingSuspensionReasonForCredential:forPaymentApplicationID:completion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  (uint8_t *)&v14,  0xCu);
    }

    unint64_t v11 = 0LL;
    if (v10) {
      goto LABEL_4;
    }
  }
}

- (void)setPaymentApplicationRangingSuspensionReason:(unint64_t)a3 forPassUniqueIdentifier:(id)a4 completion:(id)a5
{
  databaseManager = self->_databaseManager;
  id v9 = (void (**)(id, uint64_t))a5;
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(-[PDDatabaseManager passWithUniqueIdentifier:](databaseManager, "passWithUniqueIdentifier:", a4));
  id v16 = (id)objc_claimAutoreleasedReturnValue([v10 secureElementPass]);

  unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v16 devicePrimaryPaymentApplication]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 subcredentials]);
  int v13 = (void *)objc_claimAutoreleasedReturnValue([v12 anyObject]);

  int v14 = self->_databaseManager;
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v11 applicationIdentifier]);
  -[PDDatabaseManager updateRangingSuspensionReasons:onCredential:forPaymentApplicationID:]( v14,  "updateRangingSuspensionReasons:onCredential:forPaymentApplicationID:",  a3,  v13,  v15);

  -[PDPaymentService sendCredential:forPaymentApplication:didUpdateRangingSuspensionReasons:]( self,  "sendCredential:forPaymentApplication:didUpdateRangingSuspensionReasons:",  v13,  v11,  a3);
  v9[2](v9, 1LL);
}

- (void)pushProvisioningSharingIdentifiers:(id)a3
{
  id v4 = a3;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    -[PDPushProvisioningManager pushProvisioningSharingIdentifiers:]( self->_pushProvisioningManager,  "pushProvisioningSharingIdentifiers:",  v4);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315138;
      id v8 = "-[PDPaymentService pushProvisioningSharingIdentifiers:]";
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  (uint8_t *)&v7,  0xCu);
    }

    if (v4) {
      (*((void (**)(id, void, void))v4 + 2))(v4, 0LL, 0LL);
    }
  }
}

- (void)saveProvisioningSupportData:(id)a3 completion:(id)a4
{
  id v6 = a3;
  int v7 = (void (**)(id, void))a4;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    id v8 = objc_alloc_init(&OBJC_CLASS___PDProvisioningSupportDataManager);
    -[PDProvisioningSupportDataManager saveWithSupportData:completion:](v8, "saveWithSupportData:completion:", v6, v7);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    BOOL v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315138;
      id v12 = "-[PDPaymentService saveProvisioningSupportData:completion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  (uint8_t *)&v11,  0xCu);
    }

    if (v7) {
      v7[2](v7, 0LL);
    }
  }
}

- (void)clearProvisioningSupportDataOfType:(unint64_t)a3 completion:(id)a4
{
  id v6 = (void (**)(void))a4;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    int v7 = objc_alloc_init(&OBJC_CLASS___PDProvisioningSupportDataManager);
    -[PDProvisioningSupportDataManager clearKnownSupportDataOfType:](v7, "clearKnownSupportDataOfType:", a3);

    if (!v6) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }

  uint64_t Object = PKLogFacilityTypeGetObject(6LL);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315138;
    int v11 = "-[PDPaymentService clearProvisioningSupportDataOfType:completion:]";
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  (uint8_t *)&v10,  0xCu);
  }

  if (v6) {
LABEL_7:
  }
    v6[2](v6);
LABEL_8:
}

- (void)statusForShareableCredentials:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    -[PDPushProvisioningManager statusForShareableCredentials:completion:]( self->_pushProvisioningManager,  "statusForShareableCredentials:completion:",  v6,  v7);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315138;
      int v11 = "-[PDPaymentService statusForShareableCredentials:completion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  (uint8_t *)&v10,  0xCu);
    }

    if (v7) {
      (*((void (**)(id, void, id, void))v7 + 2))(v7, 0LL, v6, 0LL);
    }
  }
}

- (void)provideEncryptedPushProvisioningTarget:(id)a3 sharingInstanceIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  int v10 = (void (**)(id, void))a5;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    -[PDPushProvisioningManager provideEncryptedPushProvisioningTarget:sharingInstanceIdentifier:withCompletion:]( self->_pushProvisioningManager,  "provideEncryptedPushProvisioningTarget:sharingInstanceIdentifier:withCompletion:",  v8,  v9,  v10);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 136315138;
      int v14 = "-[PDPaymentService provideEncryptedPushProvisioningTarget:sharingInstanceIdentifier:completion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  (uint8_t *)&v13,  0xCu);
    }

    if (v10) {
      v10[2](v10, 0LL);
    }
  }
}

- (void)prepareProvisioningTarget:(id)a3 checkFamilyCircle:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    -[PDPushProvisioningManager prepareProvisioningTarget:checkFamilyCircle:completion:]( self->_pushProvisioningManager,  "prepareProvisioningTarget:checkFamilyCircle:completion:",  v8,  v6,  v9);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315138;
      int v13 = "-[PDPaymentService prepareProvisioningTarget:checkFamilyCircle:completion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  (uint8_t *)&v12,  0xCu);
    }

    if (v9) {
      (*((void (**)(id, void, void, void))v9 + 2))(v9, 0LL, 0LL, 0LL);
    }
  }
}

- (void)redeemPaymentShareableCredential:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    -[PDPushProvisioningManager redeemPaymentShareableCredential:completion:]( self->_pushProvisioningManager,  "redeemPaymentShareableCredential:completion:",  v6,  v7);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315138;
      int v11 = "-[PDPaymentService redeemPaymentShareableCredential:completion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  (uint8_t *)&v10,  0xCu);
    }

    if (v7) {
      (*((void (**)(id, void, void, void, void))v7 + 2))(v7, 0LL, 0LL, 0LL, 0LL);
    }
  }
}

- (void)redeemProvisioningSharingIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    -[PDPushProvisioningManager redeemProvisioningSharingIdentifier:completion:]( self->_pushProvisioningManager,  "redeemProvisioningSharingIdentifier:completion:",  v6,  v7);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315138;
      int v11 = "-[PDPaymentService redeemProvisioningSharingIdentifier:completion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  (uint8_t *)&v10,  0xCu);
    }

    if (v7) {
      (*((void (**)(id, void, void, void))v7 + 2))(v7, 0LL, 0LL, 0LL);
    }
  }
}

- (void)currentSecureElementSnapshot:(id)a3
{
  id v4 = a3;
  if ((-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess") & 1) != 0)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1002AB230;
    v7[3] = &unk_1006526C8;
    id v8 = v4;
    +[PKProvisioningSEStorageSnapshot getCurrentSnapshot:]( &OBJC_CLASS___PKProvisioningSEStorageSnapshot,  "getCurrentSnapshot:",  v7);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      int v10 = "-[PDPaymentService currentSecureElementSnapshot:]";
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  buf,  0xCu);
    }

    if (v4) {
      (*((void (**)(id, void, void))v4 + 2))(v4, 0LL, 0LL);
    }
  }
}

- (void)reserveStorageForAppletTypes:(id)a3 metadata:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ((-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess") & 1) != 0)
  {
    int v11 = (void *)objc_claimAutoreleasedReturnValue( -[PDPaymentWebServiceCoordinator sharedWebService]( self->_paymentWebServiceCoordinator,  "sharedWebService"));
    id v12 = [[PKProvisioningSEStorageManager alloc] initWithWebService:v11];
    [v12 reserveStorageForAppletTypes:v8 metadata:v9 completion:v10];
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 136315138;
      id v16 = "-[PDPaymentService reserveStorageForAppletTypes:metadata:completion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  (uint8_t *)&v15,  0xCu);
    }

    if (v10) {
      (*((void (**)(id, void, void, void))v10 + 2))(v10, 0LL, 0LL, 0LL);
    }
  }
}

- (void)deleteReservation:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  if ((-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess") & 1) != 0)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( -[PDPaymentWebServiceCoordinator sharedWebService]( self->_paymentWebServiceCoordinator,  "sharedWebService"));
    id v9 = [[PKProvisioningSEStorageManager alloc] initWithWebService:v8];
    [v9 deleteReservation:v6 completion:v7];
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315138;
      int v13 = "-[PDPaymentService deleteReservation:completion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  (uint8_t *)&v12,  0xCu);
    }

    if (v7) {
      v7[2](v7);
    }
  }
}

- (void)performDeviceCheckInWithCompletion:(id)a3
{
  id v4 = a3;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    -[PDPaymentWebServiceCoordinator performDeviceCheckInWithCompletion:]( self->_paymentWebServiceCoordinator,  "performDeviceCheckInWithCompletion:",  v4);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315138;
      id v8 = "-[PDPaymentService performDeviceCheckInWithCompletion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  (uint8_t *)&v7,  0xCu);
    }

    if (v4) {
      (*((void (**)(id, void, void))v4 + 2))(v4, 0LL, 0LL);
    }
  }
}

- (void)setDeviceCheckInContextBuildVersion:(id)a3 outstandingAction:(int64_t)a4 forRegion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    -[PDPaymentWebServiceCoordinator setDeviceCheckInContextBuildVersion:outstandingAction:forRegion:]( self->_paymentWebServiceCoordinator,  "setDeviceCheckInContextBuildVersion:outstandingAction:forRegion:",  v8,  a4,  v9);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315138;
      int v13 = "-[PDPaymentService setDeviceCheckInContextBuildVersion:outstandingAction:forRegion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  (uint8_t *)&v12,  0xCu);
    }
  }
}

- (void)unscheduleDeviceUpgradeTaskActivity
{
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    -[PDPaymentWebServiceCoordinator unscheduleDeviceUpgradeTaskActivity]( self->_paymentWebServiceCoordinator,  "unscheduleDeviceUpgradeTaskActivity");
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315138;
      id v6 = "-[PDPaymentService unscheduleDeviceUpgradeTaskActivity]";
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  (uint8_t *)&v5,  0xCu);
    }
  }

- (void)scheduleDeviceUpgradeTasksIfNecessaryWithRandomizeStartDate:(BOOL)a3
{
  BOOL v3 = a3;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    -[PDPaymentWebServiceCoordinator scheduleDeviceUpgradeTasksIfNecessaryWithRandomizeStartDate:]( self->_paymentWebServiceCoordinator,  "scheduleDeviceUpgradeTasksIfNecessaryWithRandomizeStartDate:",  v3);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315138;
      id v8 = "-[PDPaymentService scheduleDeviceUpgradeTasksIfNecessaryWithRandomizeStartDate:]";
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  (uint8_t *)&v7,  0xCu);
    }
  }

- (void)setDeviceUpgradeTasksContextBuildVersion:(id)a3 upgradeTaskVersion:(int64_t)a4 retryCount:(int64_t)a5
{
  id v8 = a3;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    -[PDPaymentWebServiceCoordinator setDeviceUpgradeTasksContextBuildVersion:upgradeTaskVersion:retryCount:]( self->_paymentWebServiceCoordinator,  "setDeviceUpgradeTasksContextBuildVersion:upgradeTaskVersion:retryCount:",  v8,  a4,  a5);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315138;
      int v12 = "-[PDPaymentService setDeviceUpgradeTasksContextBuildVersion:upgradeTaskVersion:retryCount:]";
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  (uint8_t *)&v11,  0xCu);
    }
  }
}

- (void)storePassOwnershipToken:(id)a3 withIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    id v8 = PDUtilityQueue();
    id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v8);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1002ABB1C;
    v12[3] = &unk_1006392B0;
    int v13 = (os_log_s *)v6;
    id v14 = v7;
    dispatch_async(v9, v12);

    id v10 = v13;
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v16 = "-[PDPaymentService storePassOwnershipToken:withIdentifier:]";
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  buf,  0xCu);
    }
  }
}

- (void)passOwnershipTokenWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    if (v6)
    {
      id v8 = [[PKPassOwnershipToken alloc] initWithIdentifier:v6];
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 ownershipToken]);

      if (!v7)
      {
LABEL_5:

        goto LABEL_10;
      }
    }

    else
    {
      id v9 = 0LL;
      if (!v7) {
        goto LABEL_5;
      }
    }

    v7[2](v7, v9);
    goto LABEL_5;
  }

  uint64_t Object = PKLogFacilityTypeGetObject(6LL);
  int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315138;
    int v13 = "-[PDPaymentService passOwnershipTokenWithIdentifier:completion:]";
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  (uint8_t *)&v12,  0xCu);
  }

  if (v7) {
    v7[2](v7, 0LL);
  }
LABEL_10:
}

- (void)updateAllMapsBrandAndMerchantDataWithCompletion:(id)a3
{
  id v4 = (void (**)(void))a3;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    v38 = v4;
    int v5 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    __int16 v39 = self;
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PDDatabaseManager mapsMerchants](self->_databaseManager, "mapsMerchants"));
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    __int128 v47 = 0u;
    __int128 v48 = 0u;
    id obj = v6;
    id v7 = [v6 countByEnumeratingWithState:&v45 objects:v54 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v46;
      do
      {
        for (i = 0LL; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v46 != v9) {
            objc_enumerationMutation(obj);
          }
          int v11 = *(void **)(*((void *)&v45 + 1) + 8LL * (void)i);
          int v12 = (const char *)[v11 identifier];
          if (v12)
          {
            int v13 = v12;
            id v14 = [v11 resultProviderIdentifier];
            [v11 locationLatitude];
            CLLocationDegrees v16 = v15;
            [v11 locationLongitude];
            CLLocationCoordinate2D v18 = CLLocationCoordinate2DMake(v16, v17);
            uint64_t v19 = -[PDMapsBrandAndMerchantUpdaterConfiguration initWithMUID:resultProviderID:coordinate:]( objc_alloc(&OBJC_CLASS___PDMapsBrandAndMerchantUpdaterConfiguration),  "initWithMUID:resultProviderID:coordinate:",  v13,  v14,  v18.latitude,  v18.longitude);
            -[NSMutableSet addObject:](v5, "addObject:", v19);
            uint64_t Object = PKLogFacilityTypeGetObject(6LL);
            uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134218240;
              v51 = v13;
              __int16 v52 = 2048;
              uint64_t v53 = (int)v14;
              _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Updating maps merchant mapsMerchantMUID %ld, mapsMerchantResultProviderID %ld ",  buf,  0x16u);
            }
          }
        }

        id v8 = [obj countByEnumeratingWithState:&v45 objects:v54 count:16];
      }

      while (v8);
    }

    id v22 = (void *)objc_claimAutoreleasedReturnValue(-[PDDatabaseManager mapsBrands](v39->_databaseManager, "mapsBrands"));
    __int128 v41 = 0u;
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    __int128 v44 = 0u;
    id v23 = [v22 countByEnumeratingWithState:&v41 objects:v49 count:16];
    if (v23)
    {
      id v24 = v23;
      uint64_t v25 = *(void *)v42;
      do
      {
        for (j = 0LL; j != v24; j = (char *)j + 1)
        {
          if (*(void *)v42 != v25) {
            objc_enumerationMutation(v22);
          }
          __int128 v27 = *(void **)(*((void *)&v41 + 1) + 8LL * (void)j);
          __int128 v28 = (const char *)[v27 identifier];
          if (v28)
          {
            BOOL v29 = v28;
            id v30 = [v27 resultProviderIdentifier];
            CLLocationCoordinate2D v31 = CLLocationCoordinate2DMake(0.0, 0.0);
            id v32 = -[PDMapsBrandAndMerchantUpdaterConfiguration initWithMUID:resultProviderID:coordinate:]( objc_alloc(&OBJC_CLASS___PDMapsBrandAndMerchantUpdaterConfiguration),  "initWithMUID:resultProviderID:coordinate:",  v29,  v30,  v31.latitude,  v31.longitude);
            -[NSMutableSet addObject:](v5, "addObject:", v32);
            uint64_t v33 = PKLogFacilityTypeGetObject(6LL);
            id v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134218240;
              v51 = v29;
              __int16 v52 = 2048;
              uint64_t v53 = (int)v30;
              _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "Updating maps brand mapsMerchantMUID %ld, mapsMerchantResultProviderID %ld ",  buf,  0x16u);
            }
          }
        }

        id v24 = [v22 countByEnumeratingWithState:&v41 objects:v49 count:16];
      }

      while (v24);
    }

    if (-[NSMutableSet count](v5, "count"))
    {
      mapsBrandAndMerchantUpdater = v39->_mapsBrandAndMerchantUpdater;
      id v36 = -[NSMutableSet copy](v5, "copy");
      -[PDMapsBrandAndMerchantUpdater updateMapsDataForConfigurations:]( mapsBrandAndMerchantUpdater,  "updateMapsDataForConfigurations:",  v36);
    }

    id v4 = v38;
    if (v38) {
      v38[2](v38);
    }
  }

  else
  {
    uint64_t v37 = PKLogFacilityTypeGetObject(6LL);
    int v5 = (NSMutableSet *)objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v51 = "-[PDPaymentService updateAllMapsBrandAndMerchantDataWithCompletion:]";
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v5,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  buf,  0xCu);
    }
  }
}

- (void)mapsMerchantWithIdentifier:(unint64_t)a3 resultProviderIdentifier:(int)a4 completion:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v8 = (void (**)(id, void))a5;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    uint64_t v9 = -[PDMapsBrandAndMerchantUpdaterConfiguration initWithMUID:resultProviderID:coordinate:]( objc_alloc(&OBJC_CLASS___PDMapsBrandAndMerchantUpdaterConfiguration),  "initWithMUID:resultProviderID:coordinate:",  a3,  v5,  kCLLocationCoordinate2DInvalid.latitude,  kCLLocationCoordinate2DInvalid.longitude);
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 134218240;
      double v15 = (const char *)a3;
      __int16 v16 = 2048;
      uint64_t v17 = (int)v5;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Updating maps merchant mapsMerchantMUID %ld, mapsMerchantResultProviderID %ld ",  (uint8_t *)&v14,  0x16u);
    }

    -[PDMapsBrandAndMerchantUpdater updateMapsDataForConfiguration:completion:]( self->_mapsBrandAndMerchantUpdater,  "updateMapsDataForConfiguration:completion:",  v9,  v8);
  }

  else
  {
    uint64_t v12 = PKLogFacilityTypeGetObject(6LL);
    int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 136315138;
      double v15 = "-[PDPaymentService mapsMerchantWithIdentifier:resultProviderIdentifier:completion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  (uint8_t *)&v14,  0xCu);
    }

    if (v8) {
      v8[2](v8, 0LL);
    }
  }
}

- (void)enforceUpgradedPasscodePolicyWithCompletion:(id)a3
{
  id v4 = a3;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    id v5 = PDDefaultQueue();
    id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v5);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_1002AC424;
    v8[3] = &unk_10063AC90;
    v8[4] = self;
    id v9 = v4;
    dispatch_async(v6, v8);
  }

  else if (v4)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKPassKitErrorDomain,  4LL,  0LL));
    (*((void (**)(id, uint64_t, void *))v4 + 2))(v4, 1LL, v7);
  }
}

- (void)currentPasscodeMeetsUpgradedPasscodePolicy:(id)a3
{
  id v4 = a3;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    id v5 = PDDefaultQueue();
    id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v5);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_1002AC5B0;
    v8[3] = &unk_10063AC90;
    v8[4] = self;
    id v9 = v4;
    dispatch_async(v6, v8);
  }

  else if (v4)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKPassKitErrorDomain,  4LL,  0LL));
    (*((void (**)(id, uint64_t, void *))v4 + 2))(v4, 1LL, v7);
  }
}

- (void)requiresUpgradedPasscodeWithCompletion:(id)a3
{
  id v4 = a3;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    id v5 = PDDefaultQueue();
    id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v5);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_1002AC7F8;
    v10[3] = &unk_10063AC90;
    v10[4] = self;
    id v11 = v4;
    dispatch_async(v6, v10);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      int v13 = "-[PDPaymentService requiresUpgradedPasscodeWithCompletion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  buf,  0xCu);
    }

    if (v4)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKPassKitErrorDomain,  4LL,  0LL));
      (*((void (**)(id, void, void *))v4 + 2))(v4, 0LL, v9);
    }
  }
}

- (void)changePasscodeFrom:(id)a3 toPasscode:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    id v11 = PDDefaultQueue();
    uint64_t v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v11);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_1002ACAA8;
    v16[3] = &unk_10063B440;
    void v16[4] = self;
    id v17 = v8;
    id v18 = v9;
    id v19 = v10;
    dispatch_async(v12, v16);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v21 = "-[PDPaymentService changePasscodeFrom:toPasscode:completion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  buf,  0xCu);
    }

    if (v10)
    {
      double v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKPassKitErrorDomain,  4LL,  0LL));
      (*((void (**)(id, void, void *))v10 + 2))(v10, 0LL, v15);
    }
  }
}

- (void)transactionReceiptWithUniqueID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
    {
      id v8 = PDDefaultQueue();
      id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v8);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1002ACCB8;
      block[3] = &unk_100639AF0;
      void block[4] = self;
      id v13 = v6;
      id v14 = v7;
      dispatch_async(v9, block);
    }

    else
    {
      uint64_t Object = PKLogFacilityTypeGetObject(6LL);
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        __int16 v16 = "-[PDPaymentService transactionReceiptWithUniqueID:completion:]";
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  buf,  0xCu);
      }

      (*((void (**)(id, void))v7 + 2))(v7, 0LL);
    }
  }
}

- (void)storeTransactionReceiptData:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    id v8 = PDDefaultQueue();
    id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v8);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1002ACE88;
    block[3] = &unk_100639AF0;
    id v13 = v6;
    id v14 = self;
    id v15 = v7;
    dispatch_async(v9, block);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v17 = "-[PDPaymentService storeTransactionReceiptData:completion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  buf,  0xCu);
    }

    if (v7) {
      (*((void (**)(id, void))v7 + 2))(v7, 0LL);
    }
  }
}

- (void)deleteTransactionReceiptWithUniqueID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    id v8 = PDDefaultQueue();
    id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v8);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1002AD160;
    block[3] = &unk_100639AF0;
    void block[4] = self;
    id v13 = v6;
    id v14 = v7;
    dispatch_async(v9, block);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v16 = "-[PDPaymentService deleteTransactionReceiptWithUniqueID:completion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  buf,  0xCu);
    }

    if (v7) {
      (*((void (**)(id, void))v7 + 2))(v7, 0LL);
    }
  }
}

- (void)transactionReceiptForTransactionWithIdentifier:(id)a3 updateIfNecessary:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    id v10 = PDDefaultQueue();
    id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v10);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_1002AD324;
    v14[3] = &unk_10063B100;
    void v14[4] = self;
    id v15 = v8;
    BOOL v17 = a4;
    id v16 = v9;
    dispatch_async(v11, v14);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v19 = "-[PDPaymentService transactionReceiptForTransactionWithIdentifier:updateIfNecessary:completion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  buf,  0xCu);
    }

    if (v9) {
      (*((void (**)(id, void))v9 + 2))(v9, 0LL);
    }
  }
}

- (void)transactionTagsForTransactionWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    id v8 = PDDefaultQueue();
    id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v8);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1002AD66C;
    block[3] = &unk_10063C6A8;
    id v14 = v7;
    void block[4] = self;
    id v13 = v6;
    dispatch_async(v9, block);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v16 = "-[PDPaymentService transactionTagsForTransactionWithIdentifier:completion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  buf,  0xCu);
    }

    if (v7) {
      (*((void (**)(id, void))v7 + 2))(v7, 0LL);
    }
  }
}

- (void)registerAuxiliaryCapabilityForPassUniqueIdentifier:(id)a3 sessionExchangeToken:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    id v11 = PDDefaultQueue();
    uint64_t v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v11);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_1002AD890;
    v16[3] = &unk_10063B440;
    void v16[4] = self;
    id v17 = v8;
    id v18 = v9;
    id v19 = v10;
    dispatch_async(v12, v16);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v21 = "-[PDPaymentService registerAuxiliaryCapabilityForPassUniqueIdentifier:sessionExchangeToken:withCompletion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  buf,  0xCu);
    }

    if (v10)
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKPassKitErrorDomain,  4LL,  0LL));
      (*((void (**)(id, void *))v10 + 2))(v10, v15);
    }
  }
}

- (void)checkAllAuxiliaryRegistrationRequirements
{
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    id v3 = PDDefaultQueue();
    id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v3);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1002ADA40;
    block[3] = &unk_100639300;
    void block[4] = self;
    dispatch_async(v4, block);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v9 = "-[PDPaymentService checkAllAuxiliaryRegistrationRequirements]";
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  buf,  0xCu);
    }
  }

- (void)invalidateAuxiliaryCapabilityCertificatesForPassUniqueIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    id v8 = PDDefaultQueue();
    id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v8);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1002ADBB8;
    block[3] = &unk_100639AF0;
    void block[4] = self;
    id v13 = v6;
    id v14 = v7;
    dispatch_async(v9, block);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v16 = "-[PDPaymentService invalidateAuxiliaryCapabilityCertificatesForPassUniqueIdentifier:completion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  buf,  0xCu);
    }

    if (v7) {
      v7[2](v7);
    }
  }
}

- (void)fetchBarcodesForPassUniqueIdentifier:(id)a3 sessionExchangeToken:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    id v11 = PDDefaultQueue();
    uint64_t v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v11);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_1002ADDAC;
    v16[3] = &unk_10063B440;
    void v16[4] = self;
    id v17 = v8;
    id v18 = v9;
    id v19 = v10;
    dispatch_async(v12, v16);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v21 = "-[PDPaymentService fetchBarcodesForPassUniqueIdentifier:sessionExchangeToken:withCompletion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  buf,  0xCu);
    }

    if (v10)
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKPassKitErrorDomain,  4LL,  0LL));
      (*((void (**)(id, void, void *))v10 + 2))(v10, 0LL, v15);
    }
  }
}

- (void)retrieveDecryptedBarcodeCredentialForPassUniqueIdentifier:(id)a3 authorization:(id)a4 sessionExchangeToken:(id)a5 withCompletion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    id v14 = PDDefaultQueue();
    id v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v14);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1002AE038;
    block[3] = &unk_10063CD88;
    void block[4] = self;
    id v20 = v10;
    id v21 = v11;
    id v22 = v12;
    id v23 = v13;
    dispatch_async(v15, block);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v25 = "-[PDPaymentService retrieveDecryptedBarcodeCredentialForPassUniqueIdentifier:authorization:sessionExchangeTo"
            "ken:withCompletion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  buf,  0xCu);
    }

    if (v13)
    {
      id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKPassKitErrorDomain,  4LL,  0LL));
      (*((void (**)(id, void, void, void *))v13 + 2))(v13, 0LL, 0LL, v18);
    }
  }
}

- (void)retrieveDecryptedBarcodeCredentialForPassUniqueIdentifier:(id)a3 authorization:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    id v11 = PDDefaultQueue();
    id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v11);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_1002AE2A8;
    v16[3] = &unk_10063B440;
    void v16[4] = self;
    id v17 = v8;
    id v18 = v9;
    id v19 = v10;
    dispatch_async(v12, v16);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v21 = "-[PDPaymentService retrieveDecryptedBarcodeCredentialForPassUniqueIdentifier:authorization:withCompletion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  buf,  0xCu);
    }

    if (v10)
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKPassKitErrorDomain,  4LL,  0LL));
      (*((void (**)(id, void, void, void *))v10 + 2))(v10, 0LL, 0LL, v15);
    }
  }
}

- (void)retrievePINEncryptionCertificateForPassUniqueIdentifier:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    id v8 = PDDefaultQueue();
    id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v8);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1002AE4BC;
    block[3] = &unk_100639AF0;
    void block[4] = self;
    id v13 = v6;
    id v14 = v7;
    dispatch_async(v9, block);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v16 = "-[PDPaymentService retrievePINEncryptionCertificateForPassUniqueIdentifier:withCompletion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  buf,  0xCu);
    }

    if (v7) {
      (*((void (**)(id, void))v7 + 2))(v7, 0LL);
    }
  }
}

- (void)retrievePINEncryptionCertificateForPassUniqueIdentifier:(id)a3 sessionExchangeToken:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    id v11 = PDDefaultQueue();
    id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v11);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_1002AE684;
    v15[3] = &unk_10063B440;
    v15[4] = self;
    id v16 = v8;
    id v17 = v9;
    id v18 = v10;
    dispatch_async(v12, v15);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v20 = "-[PDPaymentService retrievePINEncryptionCertificateForPassUniqueIdentifier:sessionExchangeToken:withCompletion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  buf,  0xCu);
    }

    if (v10) {
      (*((void (**)(id, void))v10 + 2))(v10, 0LL);
    }
  }
}

- (void)processedAuthenticationMechanism:(unint64_t)a3 forTransactionIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = (void (**)(void))a5;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    id v10 = PDDefaultQueue();
    id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v10);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_1002AE834;
    v14[3] = &unk_10063C928;
    void v14[4] = self;
    unint64_t v17 = a3;
    id v15 = v8;
    id v16 = v9;
    dispatch_async(v11, v14);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v19 = "-[PDPaymentService processedAuthenticationMechanism:forTransactionIdentifier:completion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  buf,  0xCu);
    }

    if (v9) {
      v9[2](v9);
    }
  }
}

- (void)markAuthenticationCompleteForTransactionIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    id v8 = PDDefaultQueue();
    id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v8);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1002AE9D0;
    block[3] = &unk_100639AF0;
    void block[4] = self;
    id v13 = v6;
    id v14 = v7;
    dispatch_async(v9, block);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v16 = "-[PDPaymentService markAuthenticationCompleteForTransactionIdentifier:completion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  buf,  0xCu);
    }

    if (v7) {
      v7[2](v7);
    }
  }
}

- (void)submitUserConfirmation:(BOOL)a3 forTransactionIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    id v10 = PDDefaultQueue();
    id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v10);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_1002AEBAC;
    v15[3] = &unk_10063B100;
    v15[4] = self;
    BOOL v18 = a3;
    id v16 = v8;
    id v17 = v9;
    dispatch_async(v11, v15);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v20 = "-[PDPaymentService submitUserConfirmation:forTransactionIdentifier:completion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  buf,  0xCu);
    }

    if (v9)
    {
      id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKPassKitErrorDomain,  4LL,  0LL));
      (*((void (**)(id, void, void *))v9 + 2))(v9, 0LL, v14);
    }
  }
}

- (void)submitUserConfirmation:(BOOL)a3 forTransactionIdentifier:(id)a4 sessionExchangeToken:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    id v13 = PDDefaultQueue();
    id v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v13);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1002AEE1C;
    block[3] = &unk_10063DA48;
    void block[4] = self;
    BOOL v22 = a3;
    id v19 = v10;
    id v20 = v11;
    id v21 = v12;
    dispatch_async(v14, block);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v24 = "-[PDPaymentService submitUserConfirmation:forTransactionIdentifier:sessionExchangeToken:completion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  buf,  0xCu);
    }

    if (v12)
    {
      id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKPassKitErrorDomain,  4LL,  0LL));
      (*((void (**)(id, void, void *))v12 + 2))(v12, 0LL, v17);
    }
  }
}

- (void)submitEncryptedPIN:(id)a3 forTransactionIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    id v11 = PDDefaultQueue();
    id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v11);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_1002AF088;
    v16[3] = &unk_10063B440;
    void v16[4] = self;
    id v17 = v8;
    id v18 = v9;
    id v19 = v10;
    dispatch_async(v12, v16);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v21 = "-[PDPaymentService submitEncryptedPIN:forTransactionIdentifier:completion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  buf,  0xCu);
    }

    if (v10)
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKPassKitErrorDomain,  4LL,  0LL));
      (*((void (**)(id, void, void *))v10 + 2))(v10, 0LL, v15);
    }
  }
}

- (void)submitEncryptedPIN:(id)a3 forTransactionIdentifier:(id)a4 sessionExchangeToken:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    id v14 = PDDefaultQueue();
    id v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v14);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1002AF310;
    block[3] = &unk_10063CD88;
    void block[4] = self;
    id v20 = v10;
    id v21 = v11;
    id v22 = v12;
    id v23 = v13;
    dispatch_async(v15, block);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v25 = "-[PDPaymentService submitEncryptedPIN:forTransactionIdentifier:sessionExchangeToken:completion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  buf,  0xCu);
    }

    if (v13)
    {
      id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKPassKitErrorDomain,  4LL,  0LL));
      (*((void (**)(id, void, void *))v13 + 2))(v13, 0LL, v18);
    }
  }
}

- (void)submitTransactionSignatureForTransactionIdentifier:(id)a3 sessionExchangeToken:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    id v11 = PDDefaultQueue();
    id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v11);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_1002AF578;
    v16[3] = &unk_10063B440;
    void v16[4] = self;
    id v17 = v8;
    id v18 = v9;
    id v19 = v10;
    dispatch_async(v12, v16);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v21 = "-[PDPaymentService submitTransactionSignatureForTransactionIdentifier:sessionExchangeToken:completion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  buf,  0xCu);
    }

    if (v10)
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKPassKitErrorDomain,  4LL,  0LL));
      (*((void (**)(id, void, void *))v10 + 2))(v10, 0LL, v15);
    }
  }
}

- (void)submitBarcodePaymentEvent:(id)a3 forPassUniqueIdentifier:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(void))a5;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    id v11 = PDDefaultQueue();
    id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v11);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_1002AF7AC;
    v15[3] = &unk_10063B440;
    v15[4] = self;
    id v16 = v8;
    id v17 = v9;
    id v18 = v10;
    dispatch_async(v12, v15);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v20 = "-[PDPaymentService submitBarcodePaymentEvent:forPassUniqueIdentifier:withCompletion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  buf,  0xCu);
    }

    if (v10) {
      v10[2](v10);
    }
  }
}

- (void)submitBarcodePaymentEvent:(id)a3 forPassUniqueIdentifier:(id)a4 sessionExchangeToken:(id)a5 withCompletion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(void))a6;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    id v14 = PDDefaultQueue();
    id v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v14);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1002AF990;
    block[3] = &unk_10063CD88;
    void block[4] = self;
    id v19 = v10;
    id v20 = v11;
    id v21 = v12;
    id v22 = v13;
    dispatch_async(v15, block);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v24 = "-[PDPaymentService submitBarcodePaymentEvent:forPassUniqueIdentifier:sessionExchangeToken:withCompletion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  buf,  0xCu);
    }

    if (v13) {
      v13[2](v13);
    }
  }
}

- (void)fieldDetectorManager:(id)a3 didEnterFieldWithProperties:(id)a4
{
  id v6 = a4;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDPaymentService remoteObjectProxy](self, "remoteObjectProxy"));
    [v5 paymentDeviceDidEnterFieldWithProperties:v6];
  }
}

- (void)fieldDetectorManagerDidExitField:(id)a3
{
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess", a3))
  {
    id v4 = (id)objc_claimAutoreleasedReturnValue(-[PDPaymentService remoteObjectProxy](self, "remoteObjectProxy"));
    [v4 paymentDeviceDidExitField];
  }

- (void)familyMembersIgnoringCache:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v7 = (void (**)(id, void))a4;
  if ((-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess") & 1) != 0
    || -[PKEntitlementWhitelist passesEntangledAccess](self->_whitelist, "passesEntangledAccess"))
  {
    -[PDFamilyCircleManager familyMembersWithCachePolicy:completion:]( self->_familyMemberManager,  "familyMembersWithCachePolicy:completion:",  v4,  v7);
  }

  else if (v7)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(0LL);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10044208C(a2);
    }

    v7[2](v7, 0LL);
  }
}

- (void)memberTypeForCurrentUserWithCompletion:(id)a3
{
  id v5 = (void (**)(id, uint64_t))a3;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    -[PDFamilyCircleManager memberTypeForCurrentUserWithCachePolicy:completion:]( self->_familyMemberManager,  "memberTypeForCurrentUserWithCachePolicy:completion:",  0LL,  v5);
  }

  else if (v5)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(0LL);
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10044208C(a2);
    }

    v5[2](v5, -1LL);
  }
}

- (void)pendingFamilyMembersIgnoringCache:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v7 = (void (**)(id, void))a4;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    -[PDFamilyCircleManager pendingFamilyMembersWithCachePolicy:completion:]( self->_familyMemberManager,  "pendingFamilyMembersWithCachePolicy:completion:",  v4,  v7);
  }

  else if (v7)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(0LL);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10044208C(a2);
    }

    v7[2](v7, 0LL);
  }
}

- (void)photosForFamilyMembersWithDSIDs:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, void))a4;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    -[PDFamilyCircleManager photosForFamilyMembersWithDSIDs:completion:]( self->_familyMemberManager,  "photosForFamilyMembersWithDSIDs:completion:",  v7,  v8);
  }

  else if (v8)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(0LL);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10044208C(a2);
    }

    v8[2](v8, 0LL);
  }
}

- (void)prepareIdentityProvisioningForTargetDeviceIdentifier:(id)a3 completion:(id)a4
{
  id v5 = a4;
  if ((-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess") & 1) != 0)
  {
    id v6 = objc_alloc_init(&OBJC_CLASS___PKAsyncUnaryOperationComposer);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_1002AFF70;
    v16[3] = &unk_10063EC90;
    __int128 v17 = 0u;
    id v18 = self;
    [v6 addOperation:v16];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1002B02A8;
    v13[3] = &unk_10063EC90;
    __int128 v14 = 0u;
    id v15 = self;
    [v6 addOperation:v13];
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1002B0528;
    v11[3] = &unk_10063F4B8;
    id v12 = v5;
    id v8 = [v6 evaluateWithInput:v7 completion:v11];
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v20 = "-[PDPaymentService prepareIdentityProvisioningForTargetDeviceIdentifier:completion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  buf,  0xCu);
    }

    id v6 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKPassKitErrorDomain,  4LL,  0LL));
    (*((void (**)(id, id))v5 + 2))(v5, v6);
  }
}

- (void)provisionIdentityPassWithPassMetadata:(id)a3 targetDeviceIdentifier:(id)a4 credentialIdentifier:(id)a5 attestations:(id)a6 completion:(id)a7
{
}

- (void)provisionIdentityPassWithPassMetadata:(id)a3 targetDeviceIdentifier:(id)a4 credentialIdentifier:(id)a5 attestations:(id)a6 supplementalData:(id)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = (void (**)(id, void, void *))a8;
  if ((-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess") & 1) != 0)
  {
    if (v18)
    {
      id v19 = 0LL;
      if (a4)
      {
LABEL_4:
        id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKIdentityProvisioningErrorDomain,  4LL,  0LL));
        v18[2](v18, 0LL, v20);

        goto LABEL_14;
      }
    }

    else
    {
      id v19 = (id)PDOSTransactionCreate("PDPaymentService");
      if (a4) {
        goto LABEL_4;
      }
    }

    uint64_t Object = PKLogFacilityTypeGetObject(39LL);
    id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Provisioning identity pass to current device",  buf,  2u);
    }

    id v25 = [[PKPaymentIdentityCredential alloc] initWithShareablePassMetadata:v14 isoCredentialIdentifier:v15];
    [v25 setAttestations:v16];
    if (v17)
    {
      __int128 v26 = (void *)objc_claimAutoreleasedReturnValue( +[PKIdentityProvisioningSupplementalData createWithData:]( &OBJC_CLASS___PKIdentityProvisioningSupplementalData,  "createWithData:",  v17));
      __int128 v27 = (void *)objc_claimAutoreleasedReturnValue([v26 passTypeIdentifier]);
      [v25 setPassTypeIdentifier:v27];

      __int128 v28 = (void *)objc_claimAutoreleasedReturnValue([v26 passSerialNumber]);
      [v25 setPassSerialNumber:v28];

      BOOL v29 = (void *)objc_claimAutoreleasedReturnValue([v26 accountKeyIdentifier]);
      [v25 setAccountKeyIdentifier:v29];
    }

    id v30 = objc_alloc(&OBJC_CLASS___PKPaymentProvisioningController);
    CLLocationCoordinate2D v31 = (void *)objc_claimAutoreleasedReturnValue( -[PDPaymentWebServiceCoordinator sharedWebService]( self->_paymentWebServiceCoordinator,  "sharedWebService"));
    id v32 = -[PKPaymentProvisioningController initWithWebService:localPaymentService:]( v30,  "initWithWebService:localPaymentService:",  v31,  0LL);

    -[PKPaymentProvisioningController setCloudStoreCoordinator:]( v32,  "setCloudStoreCoordinator:",  self->_cloudStoreNotificationCoordinator);
    id v33 = [[PKProvisioningContext alloc] initWithEnvironment:0 provisioningController:v32 groupsController:0];
    [v33 setIsBackground:1];
    id v34 = [[PKProvisioningBackgroundCoordinator alloc] initWithSetupContext:v33 credential:v25 previouslyAcceptedTerms:1];
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472LL;
    v36[2] = sub_1002B0998;
    v36[3] = &unk_100652740;
    __int16 v39 = v18;
    id v37 = v34;
    id v19 = v19;
    id v38 = v19;
    id v35 = v34;
    [v35 startWithCompletion:v36];
  }

  else
  {
    uint64_t v21 = PKLogFacilityTypeGetObject(6LL);
    id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      __int128 v41 = "-[PDPaymentService provisionIdentityPassWithPassMetadata:targetDeviceIdentifier:credentialIdentifier:attesta"
            "tions:supplementalData:completion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  buf,  0xCu);
    }

    id v19 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKPassKitErrorDomain,  4LL,  0LL));
    v18[2](v18, 0LL, v19);
  }

- (void)queueIdentityPassProvisioningWithPassMetadata:(id)a3 targetDeviceIdentifier:(id)a4 credentialIdentifier:(id)a5 supplementalData:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if ((-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess") & 1) != 0)
  {
    id v17 = -[PKPendingIdentityCredential initWithShareableMetadata:]( objc_alloc(&OBJC_CLASS___PKPendingIdentityCredential),  "initWithShareableMetadata:",  v12);
    -[PKPendingIdentityCredential setCredentialIdentifier:](v17, "setCredentialIdentifier:", v14);
    -[PKPendingIdentityCredential setShouldAutoProvision:](v17, "setShouldAutoProvision:", 1LL);
    if (v15)
    {
      id v18 = (void *)objc_claimAutoreleasedReturnValue( +[PKIdentityProvisioningSupplementalData createWithData:]( &OBJC_CLASS___PKIdentityProvisioningSupplementalData,  "createWithData:",  v15));
      id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 passTypeIdentifier]);
      -[PKPendingIdentityCredential setPassTypeIdentifier:](v17, "setPassTypeIdentifier:", v19);

      id v20 = (void *)objc_claimAutoreleasedReturnValue([v18 passSerialNumber]);
      -[PKPendingIdentityCredential setPassSerialNumber:](v17, "setPassSerialNumber:", v20);

      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v18 accountKeyIdentifier]);
      -[PKPendingIdentityCredential setAccountKeyIdentifier:](v17, "setAccountKeyIdentifier:", v21);
    }

    if (v13)
    {
      id v22 = (void *)objc_claimAutoreleasedReturnValue( -[PDPaymentWebServiceCoordinator sharedWebService]( self->_paymentWebServiceCoordinator,  "sharedWebService"));
      id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 targetDevice]);
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472LL;
      v26[2] = sub_1002B0D44;
      v26[3] = &unk_100652790;
      id v32 = v16;
      v26[4] = self;
      id v27 = v12;
      id v28 = v13;
      id v29 = v14;
      id v30 = v15;
      id v17 = v17;
      CLLocationCoordinate2D v31 = v17;
      [v23 generateIdentityProvisioningAttestationsWithISOCredential:v29 pairingID:v28 completion:v26];
    }

    else
    {
      -[PDPendingProvisioningManager storePendingProvisioning:]( self->_pendingProvisioningManager,  "storePendingProvisioning:",  v17);
      (*((void (**)(id, void))v16 + 2))(v16, 0LL);
    }
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v34 = "-[PDPaymentService queueIdentityPassProvisioningWithPassMetadata:targetDeviceIdentifier:credentialIdentifier"
            ":supplementalData:completion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  buf,  0xCu);
    }

    id v17 = (PKPendingIdentityCredential *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKPassKitErrorDomain,  4LL,  0LL));
    (*((void (**)(id, PKPendingIdentityCredential *))v16 + 2))(v16, v17);
  }
}

- (void)updateNotificationForProductIdentifier:(id)a3 configuration:(id)a4 localizedNotificationTitle:(id)a5 localizedNotificationMessage:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (v16)
  {
    if ((-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess") & 1) != 0)
    {
      *(void *)&__int128 buf = 0LL;
      *((void *)&buf + 1) = &buf;
      uint64_t v36 = 0x3032000000LL;
      id v37 = sub_10029AE5C;
      id v38 = sub_10029AE6C;
      id v39 = 0LL;
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472LL;
      v29[2] = sub_1002B1448;
      v29[3] = &unk_1006527B8;
      id v30 = v14;
      id v31 = v15;
      id v32 = self;
      id v17 = v16;
      id v33 = v17;
      p___int128 buf = &buf;
      id v18 = objc_retainBlock(v29);
      id v19 = v18;
      if (v12)
      {
        ((void (*)(void *, id))v18[2])(v18, v12);
      }

      else
      {
        id v23 = objc_alloc_init(&OBJC_CLASS___PKPaymentAvailableProductsRequest);
        [v23 addDiagnosticReason:@"Remote Notification Update"];
        id v24 = (void *)objc_claimAutoreleasedReturnValue( -[PDPaymentWebServiceCoordinator paymentSetupFeaturesCoordinator]( self->_paymentWebServiceCoordinator,  "paymentSetupFeaturesCoordinator"));
        v25[0] = _NSConcreteStackBlock;
        v25[1] = 3221225472LL;
        v25[2] = sub_1002B1564;
        v25[3] = &unk_1006527E0;
        id v26 = v13;
        id v27 = v17;
        id v28 = v19;
        [v24 productsWithRequest:v23 completion:v25];
      }

      _Block_object_dispose(&buf, 8);
    }

    else
    {
      uint64_t Object = PKLogFacilityTypeGetObject(6LL);
      uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 136315138;
        *(void *)((char *)&buf + 4) = "-[PDPaymentService updateNotificationForProductIdentifier:configuration:localize"
                                        "dNotificationTitle:localizedNotificationMessage:completion:]";
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  (uint8_t *)&buf,  0xCu);
      }

      id v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKPassKitErrorDomain,  4LL,  0LL));
      (*((void (**)(id, void *))v16 + 2))(v16, v22);
    }
  }
}

- (void)didReceiveDeviceSharingCapabilities:(id)a3 forHandle:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[PDPaymentService remoteObjectProxy](self, "remoteObjectProxy"));
  [v8 didReceiveDeviceSharingCapabilities:v7 forHandle:v6];
}

- (void)processSharingCLICommands:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess") & 1) != 0)
  {
    id v8 = PDDefaultQueue();
    id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v8);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1002B1A6C;
    block[3] = &unk_100639AF0;
    void block[4] = self;
    id v11 = v6;
    id v12 = v7;
    dispatch_async(v9, block);
  }

  else
  {
    (*((void (**)(id, const __CFString *))v7 + 2))(v7, @"Client not entitled");
  }
}

- (void)checkInvitationStatusForMailboxAddress:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if (v6)
  {
    if ((-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess") & 1) != 0
      || (-[PKEntitlementWhitelist sharingAllAccess](self->_whitelist, "sharingAllAccess") & 1) != 0)
    {
      -[PDSharingManager checkInvitationStatusForMailboxAddress:completion:]( self->_sharingManager,  "checkInvitationStatusForMailboxAddress:completion:",  v7,  v6);
    }

    else
    {
      (*((void (**)(id, void, void))v6 + 2))(v6, 0LL, 0LL);
    }
  }
}

- (void)retrieveShareInvitationForMailboxAddress:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if (v6)
  {
    if ((-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess") & 1) != 0
      || (-[PKEntitlementWhitelist sharingAllAccess](self->_whitelist, "sharingAllAccess") & 1) != 0)
    {
      -[PDSharingManager retrieveShareInvitationForMailboxAddress:completion:]( self->_sharingManager,  "retrieveShareInvitationForMailboxAddress:completion:",  v7,  v6);
    }

    else
    {
      (*((void (**)(id, void, void))v6 + 2))(v6, 0LL, 0LL);
    }
  }
}

- (void)relinquishInvitation:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  if ((-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess") & 1) != 0
    || (-[PKEntitlementWhitelist sharingAllAccess](self->_whitelist, "sharingAllAccess") & 1) != 0)
  {
    -[PDSharingManager relinquishInvitation:completion:]( self->_sharingManager,  "relinquishInvitation:completion:",  v6,  v7);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315138;
      id v11 = "-[PDPaymentService relinquishInvitation:completion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  (uint8_t *)&v10,  0xCu);
    }

    if (v7) {
      v7[2](v7, 0LL);
    }
  }
}

- (void)prewarmCreateShareForPassIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v6 = (void (**)(id, void))a4;
  if (v6)
  {
    if ((-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess") & 1) != 0) {
      -[PDSharingManager prewarmCreateShareForPassIdentifier:completion:]( self->_sharingManager,  "prewarmCreateShareForPassIdentifier:completion:",  v7,  v6);
    }
    else {
      v6[2](v6, 0LL);
    }
  }
}

- (void)createShareForPartialShareInvitation:(id)a3 authorization:(id)a4 completion:(id)a5
{
  id v10 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v9)
  {
    if ((-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess") & 1) != 0) {
      -[PDSharingManager createShareForPartialShareInvitation:authorization:completion:]( self->_sharingManager,  "createShareForPartialShareInvitation:authorization:completion:",  v10,  v8,  v9);
    }
    else {
      (*((void (**)(id, void, void))v9 + 2))(v9, 0LL, 0LL);
    }
  }
}

- (void)createShareInvitationForPartialShareInvitation:(id)a3 existingTransportIdentifier:(id)a4 authorization:(id)a5 completion:(id)a6
{
  id v13 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v12)
  {
    if ((-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess") & 1) != 0) {
      -[PDSharingManager createShareInvitationForPartialShareInvitation:existingTransportIdentifier:authorization:completion:]( self->_sharingManager,  "createShareInvitationForPartialShareInvitation:existingTransportIdentifier:authorization:completion:",  v13,  v10,  v11,  v12);
    }
    else {
      (*((void (**)(id, void, void, void))v12 + 2))(v12, 0LL, 0LL, 0LL);
    }
  }
}

- (void)acceptCarKeyShareForMessage:(id)a3 activationCode:(id)a4 completion:(id)a5
{
  id v10 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v9)
  {
    if ((-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess") & 1) != 0
      || (-[PKEntitlementWhitelist sharingAllAccess](self->_whitelist, "sharingAllAccess") & 1) != 0)
    {
      -[PDSharingManager acceptCarKeyShareForMessage:activationCode:completion:]( self->_sharingManager,  "acceptCarKeyShareForMessage:activationCode:completion:",  v10,  v8,  v9);
    }

    else
    {
      (*((void (**)(id, void, void))v9 + 2))(v9, 0LL, 0LL);
    }
  }
}

- (void)cacheSharingMessageFromMailboxAddress:(id)a3 message:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if ((-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess") & 1) != 0
    || -[PKEntitlementWhitelist sharingAllAccess](self->_whitelist, "sharingAllAccess"))
  {
    -[PDSharingManager cacheSharingMessageFromMailboxAddress:message:]( self->_sharingManager,  "cacheSharingMessageFromMailboxAddress:message:",  v7,  v6);
  }
}

- (void)deleteSharingMessage:(id)a3
{
  id v4 = a3;
  if ((-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess") & 1) != 0
    || -[PKEntitlementWhitelist sharingAllAccess](self->_whitelist, "sharingAllAccess"))
  {
    -[PDSharingManager deleteSharingMessage:](self->_sharingManager, "deleteSharingMessage:", v4);
  }
}

- (void)createSingleUseShareURLWithMessage:(id)a3 timeToLive:(unint64_t)a4 completion:(id)a5
{
  id v9 = a3;
  id v8 = a5;
  if (v8)
  {
    if ((-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess") & 1) != 0
      || (-[PKEntitlementWhitelist sharingAllAccess](self->_whitelist, "sharingAllAccess") & 1) != 0)
    {
      -[PDSharingManager createSingleUseShareURLWithMessage:timeToLive:completion:]( self->_sharingManager,  "createSingleUseShareURLWithMessage:timeToLive:completion:",  v9,  a4,  v8);
    }

    else
    {
      (*((void (**)(id, void, void))v8 + 2))(v8, 0LL, 0LL);
    }
  }
}

- (void)updateShareForPassIdentifier:(id)a3 share:(id)a4 authorization:(id)a5 completion:(id)a6
{
  id v13 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v12)
  {
    if ((-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess") & 1) != 0) {
      -[PDSharingManager updateShareForPassIdentifier:share:authorization:completion:]( self->_sharingManager,  "updateShareForPassIdentifier:share:authorization:completion:",  v13,  v10,  v11,  v12);
    }
    else {
      (*((void (**)(id, void, void))v12 + 2))(v12, 0LL, 0LL);
    }
  }
}

- (void)revokeShareForPassIdentifier:(id)a3 share:(id)a4 shouldCascade:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v12 = a3;
  id v10 = a4;
  id v11 = a6;
  if (v11)
  {
    if ((-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess") & 1) != 0) {
      -[PDSharingManager revokeShareForPassIdentifier:share:shouldCascade:completion:]( self->_sharingManager,  "revokeShareForPassIdentifier:share:shouldCascade:completion:",  v12,  v10,  v7,  v11);
    }
    else {
      (*((void (**)(id, void, void))v11 + 2))(v11, 0LL, 0LL);
    }
  }
}

- (void)revokeSharesForPassIdentifier:(id)a3 shares:(id)a4 shouldCascade:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v12 = a3;
  id v10 = a4;
  id v11 = a6;
  if (v11)
  {
    if ((-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess") & 1) != 0) {
      -[PDSharingManager revokeSharesForPassIdentifier:shares:shouldCascade:completion:]( self->_sharingManager,  "revokeSharesForPassIdentifier:shares:shouldCascade:completion:",  v12,  v10,  v7,  v11);
    }
    else {
      (*((void (**)(id, void, void))v11 + 2))(v11, 0LL, 0LL);
    }
  }
}

- (void)rejectShareForMailboxAddress:(id)a3
{
  id v4 = a3;
}

- (void)sendSharingMessageTo:(id)a3 message:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    if ((-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess") & 1) != 0
      || (-[PKEntitlementWhitelist sharingAllAccess](self->_whitelist, "sharingAllAccess") & 1) != 0
      || (-[PKEntitlementWhitelist credentialStateAccess](self->_whitelist, "credentialStateAccess") & 1) != 0)
    {
      sharingManager = self->_sharingManager;
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472LL;
      v14[2] = sub_1002B24F0;
      v14[3] = &unk_100639688;
      id v15 = v10;
      -[PDSharingManager sendSharingMessageTo:message:completion:]( sharingManager,  "sendSharingMessageTo:message:completion:",  v8,  v9,  v14);
    }

    else
    {
      uint64_t Object = PKLogFacilityTypeGetObject(6LL);
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 136315138;
        id v17 = "-[PDPaymentService sendSharingMessageTo:message:completion:]";
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  buf,  0xCu);
      }

      (*((void (**)(id, void, void))v10 + 2))(v10, 0LL, 0LL);
    }
  }
}

- (void)didReceiveActivationCodeFailureForCredentialIdentifier:(id)a3 attemptsRemaining:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = (void (**)(id, void))a5;
  if (v9)
  {
    if ((-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess") & 1) != 0
      || (-[PKEntitlementWhitelist sharingAllAccess](self->_whitelist, "sharingAllAccess") & 1) != 0
      || (-[PKEntitlementWhitelist credentialStateAccess](self->_whitelist, "credentialStateAccess") & 1) != 0)
    {
      -[PDSharingManager didReceiveActivationCodeFailureForCredentialIdentifier:attemptsRemaining:completion:]( self->_sharingManager,  "didReceiveActivationCodeFailureForCredentialIdentifier:attemptsRemaining:completion:",  v8,  a4,  v9);
    }

    else
    {
      uint64_t Object = PKLogFacilityTypeGetObject(6LL);
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 136315138;
        id v13 = "-[PDPaymentService didReceiveActivationCodeFailureForCredentialIdentifier:attemptsRemaining:completion:]";
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  (uint8_t *)&v12,  0xCu);
      }

      v9[2](v9, 0LL);
    }
  }
}

- (void)pendingShareActivationForShareIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  BOOL v7 = (void (**)(id, void))a4;
  if (v7)
  {
    if ((-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess") & 1) != 0
      || (-[PKEntitlementWhitelist sharingAllAccess](self->_whitelist, "sharingAllAccess") & 1) != 0
      || (-[PKEntitlementWhitelist credentialStateAccess](self->_whitelist, "credentialStateAccess") & 1) != 0)
    {
      -[PDSharingManager pendingShareActivationForShareIdentifier:completion:]( self->_sharingManager,  "pendingShareActivationForShareIdentifier:completion:",  v6,  v7);
    }

    else
    {
      uint64_t Object = PKLogFacilityTypeGetObject(6LL);
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 136315138;
        id v11 = "-[PDPaymentService pendingShareActivationForShareIdentifier:completion:]";
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  (uint8_t *)&v10,  0xCu);
      }

      v7[2](v7, 0LL);
    }
  }
}

- (void)usingSynchronousProxy:(BOOL)a3 entitlementsForPassIdentifier:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = (void (**)(id, os_log_s *))a5;
  if ((-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess") & 1) != 0)
  {
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[PDSharingManager entitlementsForPassIdentifier:]( self->_sharingManager,  "entitlementsForPassIdentifier:",  v7));
    v8[2](v8, v9);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315138;
      int v12 = "-[PDPaymentService usingSynchronousProxy:entitlementsForPassIdentifier:completion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  (uint8_t *)&v11,  0xCu);
    }
  }
}

- (void)displayableEntitlementsForPassIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v6 = (void (**)(id, void))a4;
  if (v6)
  {
    if ((-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess") & 1) != 0) {
      -[PDSharingManager displayableEntitlementsForPassIdentifier:completion:]( self->_sharingManager,  "displayableEntitlementsForPassIdentifier:completion:",  v7,  v6);
    }
    else {
      v6[2](v6, 0LL);
    }
  }
}

- (void)displayableSharesForPassIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v6 = (void (**)(id, void))a4;
  if (v6)
  {
    if ((-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess") & 1) != 0) {
      -[PDSharingManager displayableSharesForPassIdentifier:completion:]( self->_sharingManager,  "displayableSharesForPassIdentifier:completion:",  v7,  v6);
    }
    else {
      v6[2](v6, 0LL);
    }
  }
}

- (void)hasSharesForPassIdentifier:(id)a3 completion:(id)a4
{
  id v8 = a3;
  id v6 = (void (**)(id, BOOL))a4;
  if (v6)
  {
    else {
      BOOL v7 = 0LL;
    }
    v6[2](v6, v7);
  }
}

- (void)sharingCapabilitiesForPassIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v6 = (void (**)(id, BOOL, BOOL))a4;
  if (v6)
  {
    if ((-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess") & 1) != 0
      || (-[PKEntitlementWhitelist sharingAllAccess](self->_whitelist, "sharingAllAccess") & 1) != 0)
    {
      v6[2]( v6,  -[PDSharingManager hasSharesForPassIdentifier:](self->_sharingManager, "hasSharesForPassIdentifier:", v7),  -[PDSharingManager hasShareableEntitlementsForPassIdentifier:]( self->_sharingManager,  "hasShareableEntitlementsForPassIdentifier:",  v7));
    }

    else
    {
      v6[2](v6, 0, 0);
    }
  }
}

- (void)hasActiveExternallySharedPasses:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if ((-[PKEntitlementWhitelist passesAllAccess](self->_whitelist, "passesAllAccess") & 1) != 0
      || (-[PKEntitlementWhitelist passesEntangledAccess](self->_whitelist, "passesEntangledAccess") & 1) != 0)
    {
      *(void *)&__int128 buf = 0LL;
      *((void *)&buf + 1) = &buf;
      uint64_t v17 = 0x2020000000LL;
      char v18 = 0;
      id v5 = objc_alloc_init(&OBJC_CLASS___PKAsyncUnaryOperationComposer);
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472LL;
      v15[2] = sub_1002B2D10;
      v15[3] = &unk_100639728;
      v15[4] = self;
      void v15[5] = &buf;
      [v5 addOperation:v15];
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472LL;
      v14[2] = sub_1002B2E3C;
      v14[3] = &unk_10063BBC8;
      void v14[4] = self;
      void v14[5] = &buf;
      [v5 addOperation:v14];
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472LL;
      v13[2] = sub_1002B32B8;
      v13[3] = &unk_10063BBC8;
      void v13[4] = self;
      void v13[5] = &buf;
      [v5 addOperation:v13];
      id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472LL;
      v10[2] = sub_1002B34CC;
      v10[3] = &unk_100639778;
      id v11 = v4;
      p___int128 buf = &buf;
      id v7 = [v5 evaluateWithInput:v6 completion:v10];

      _Block_object_dispose(&buf, 8);
    }

    else
    {
      uint64_t Object = PKLogFacilityTypeGetObject(6LL);
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 136315138;
        *(void *)((char *)&buf + 4) = "-[PDPaymentService hasActiveExternallySharedPasses:]";
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  (uint8_t *)&buf,  0xCu);
      }

      (*((void (**)(id, void))v4 + 2))(v4, 0LL);
    }
  }
}

- (void)addPendingProvisioning:(id)a3
{
  id v4 = a3;
  if ((-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess") & 1) != 0)
  {
    -[PDPendingProvisioningManager storePendingProvisioning:]( self->_pendingProvisioningManager,  "storePendingProvisioning:",  v4);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315138;
      id v8 = "-[PDPaymentService addPendingProvisioning:]";
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Not entitled for method: %s",  (uint8_t *)&v7,  0xCu);
    }
  }
}

- (void)addPendingProvisionings:(id)a3 completion:(id)a4
{
  id v6 = a3;
  int v7 = (void (**)(id, void))a4;
  if ((-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess") & 1) != 0)
  {
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    id v8 = v6;
    id v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        int v12 = 0LL;
        do
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          -[PDPendingProvisioningManager storePendingProvisioning:]( self->_pendingProvisioningManager,  "storePendingProvisioning:",  *(void *)(*((void *)&v15 + 1) + 8LL * (void)v12),  (void)v15);
          int v12 = (char *)v12 + 1;
        }

        while (v10 != v12);
        id v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }

      while (v10);
    }

    v7[2](v7, 0LL);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 136315138;
      uint64_t v21 = "-[PDPaymentService addPendingProvisionings:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Not entitled for method: %s", buf, 0xCu);
    }
  }
}

- (void)retrievePendingProvisioningsWithType:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess") & 1) != 0)
  {
    id v8 = PDDefaultQueue();
    id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v8);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1002B38D0;
    block[3] = &unk_100639AF0;
    void block[4] = self;
    id v13 = v6;
    id v14 = v7;
    dispatch_async(v9, block);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 136315138;
      __int128 v16 = "-[PDPaymentService retrievePendingProvisioningsWithType:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Not entitled for method: %s", buf, 0xCu);
    }

    (*((void (**)(id, void))v7 + 2))(v7, 0LL);
  }
}

- (void)usingSynchronousProxy:(BOOL)a3 hasPendingProvisioningsOfTypes:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, BOOL))a5;
  if ((-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess") & 1) != 0)
  {
    if (v6)
    {
      v9[2]( v9,  -[PDPendingProvisioningManager hasPendingProvisioningsOfTypes:]( self->_pendingProvisioningManager,  "hasPendingProvisioningsOfTypes:",  v8));
    }

    else
    {
      id v12 = PDDefaultQueue();
      id v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v12);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1002B3AB4;
      block[3] = &unk_10063C6A8;
      __int128 v16 = v9;
      void block[4] = self;
      id v15 = v8;
      dispatch_async(v13, block);
    }
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 136315138;
      __int128 v18 = "-[PDPaymentService usingSynchronousProxy:hasPendingProvisioningsOfTypes:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Not entitled for method: %s", buf, 0xCu);
    }

    v9[2](v9, 0);
  }
}

- (void)retrievePendingProvisioningOfType:(id)a3 withUniqueIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ((-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess") & 1) != 0)
  {
    id v11 = PDDefaultQueue();
    id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v11);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_1002B3C7C;
    v15[3] = &unk_10063CD60;
    id v18 = v10;
    v15[4] = self;
    id v16 = v8;
    id v17 = v9;
    dispatch_async(v12, v15);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 136315138;
      id v20 = "-[PDPaymentService retrievePendingProvisioningOfType:withUniqueIdentifier:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Not entitled for method: %s", buf, 0xCu);
    }

    (*((void (**)(id, void))v10 + 2))(v10, 0LL);
  }
}

- (void)removePendingProvisioningOfType:(id)a3 withUniqueIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ((-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess") & 1) != 0)
  {
    id v11 = PDDefaultQueue();
    id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v11);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_1002B3E60;
    v15[3] = &unk_10063CD60;
    id v18 = v10;
    v15[4] = self;
    id v16 = v8;
    id v17 = v9;
    dispatch_async(v12, v15);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 136315138;
      id v20 = "-[PDPaymentService removePendingProvisioningOfType:withUniqueIdentifier:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Not entitled for method: %s", buf, 0xCu);
    }

    (*((void (**)(id, void))v10 + 2))(v10, 0LL);
  }
}

- (void)vpanVirtualCards:(id)a3
{
  id v5 = a3;
  if ((-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess") & 1) != 0)
  {
    paymentWebServiceCoordinator = self->_paymentWebServiceCoordinator;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_1002B3F9C;
    v9[3] = &unk_100652850;
    void v9[4] = self;
    id v10 = v5;
    -[PDPaymentWebServiceCoordinator paymentHardwareStatusWithType:completion:]( paymentWebServiceCoordinator,  "paymentHardwareStatusWithType:completion:",  1LL,  v9);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(0LL);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10044208C(a2);
    }

    if (v5) {
      (*((void (**)(id, void, void))v5 + 2))(v5, 0LL, 0LL);
    }
  }
}

- (void)_vpanVirtualCards:(id)a3
{
  id v30 = (void (**)(id, id, void))a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDDatabaseManager passesWithActiveVPAN](self->_databaseManager, "passesWithActiveVPAN"));
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v42 objects:v48 count:16];
  if (v6)
  {
    id v7 = v6;
    id v32 = v5;
    uint64_t v33 = *(void *)v43;
    id v31 = v4;
    do
    {
      id v8 = 0LL;
      do
      {
        if (*(void *)v43 != v33) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v42 + 1) + 8LL * (void)v8);
        id v10 = (void *)objc_claimAutoreleasedReturnValue(-[PKSecureElement secureElementIdentifiers](self->_secureElement, "secureElementIdentifiers"));
        [v9 updateDevicePaymentApplicationsWithSecureElementIdentifiers:v10];

        cardFileManager = self->_cardFileManager;
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 uniqueID]);
        id v13 = (void *)objc_claimAutoreleasedReturnValue( -[PDCardFileManager dataAccessorForObjectWithUniqueID:]( cardFileManager,  "dataAccessorForObjectWithUniqueID:",  v12));
        [v9 setDataAccessor:v13];

        id v14 = (void *)objc_claimAutoreleasedReturnValue( -[PDPaymentWebServiceCoordinator sharedWebService]( self->_paymentWebServiceCoordinator,  "sharedWebService"));
        id v15 = (void *)objc_claimAutoreleasedReturnValue( +[PKVirtualCard cardsForPaymentPass:accordingToWebService:]( &OBJC_CLASS___PKVirtualCard,  "cardsForPaymentPass:accordingToWebService:",  v9,  v14));

        id v16 = (void *)objc_claimAutoreleasedReturnValue(-[PDDatabaseManager peerPaymentAccount](self->_databaseManager, "peerPaymentAccount"));
        id v17 = (char *)[v16 state];
        if (_os_feature_enabled_impl("Wallet", "CashVPANInSafari") && (unint64_t)(v17 - 1) <= 1)
        {
          id v18 = (void *)objc_claimAutoreleasedReturnValue([v16 currentBalance]);
          __int128 v38 = 0u;
          __int128 v39 = 0u;
          __int128 v40 = 0u;
          __int128 v41 = 0u;
          id v19 = v15;
          id v20 = [v19 countByEnumeratingWithState:&v38 objects:v47 count:16];
          if (v20)
          {
            id v21 = v20;
            uint64_t v22 = *(void *)v39;
            do
            {
              for (i = 0LL; i != v21; i = (char *)i + 1)
              {
                if (*(void *)v39 != v22) {
                  objc_enumerationMutation(v19);
                }
                [*(id *)(*((void *)&v38 + 1) + 8 * (void)i) setBalance:v18];
              }

              id v21 = [v19 countByEnumeratingWithState:&v38 objects:v47 count:16];
            }

            while (v21);
          }

          id v5 = v32;
          id v4 = v31;
LABEL_18:
          -[NSMutableSet unionSet:](v4, "unionSet:", v15);
          goto LABEL_19;
        }

LABEL_19:
        id v8 = (char *)v8 + 1;
      }

      while (v8 != v7);
      id v24 = [v5 countByEnumeratingWithState:&v42 objects:v48 count:16];
      id v7 = v24;
    }

    while (v24);
  }

  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  id v25 = v4;
  id v26 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v25,  "countByEnumeratingWithState:objects:count:",  &v34,  v46,  16LL);
  if (v26)
  {
    id v27 = v26;
    uint64_t v28 = *(void *)v35;
    do
    {
      for (j = 0LL; j != v27; j = (char *)j + 1)
      {
        if (*(void *)v35 != v28) {
          objc_enumerationMutation(v25);
        }
        -[PDDatabaseManager updateVirtualCardWithMetadata:]( self->_databaseManager,  "updateVirtualCardWithMetadata:",  *(void *)(*((void *)&v34 + 1) + 8LL * (void)j));
      }

      id v27 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v25,  "countByEnumeratingWithState:objects:count:",  &v34,  v46,  16LL);
    }

    while (v27);
  }

  v30[2](v30, v25, 0LL);
}

- (void)regenerateVPANCardCredentialsForVPANID:(id)a3 authorization:(id)a4 completion:(id)a5
{
}

- (void)vpanCardCredentialsForVPANID:(id)a3 authorization:(id)a4 merchantHost:(id)a5 completion:(id)a6
{
}

- (void)vpanCardCredentialsForVPANID:(id)a3 authorization:(id)a4 merchantHost:(id)a5 regenerate:(BOOL)a6 completion:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  if ((-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess") & 1) != 0)
  {
    paymentWebServiceCoordinator = self->_paymentWebServiceCoordinator;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_1002B4600;
    v20[3] = &unk_100652878;
    v20[4] = self;
    id v21 = v13;
    id v22 = v14;
    id v23 = v15;
    BOOL v25 = a6;
    id v24 = v16;
    -[PDPaymentWebServiceCoordinator paymentHardwareStatusWithType:completion:]( paymentWebServiceCoordinator,  "paymentHardwareStatusWithType:completion:",  1LL,  v20);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(0LL);
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_10044208C(a2);
    }

    if (v16) {
      (*((void (**)(id, void, void))v16 + 2))(v16, 0LL, 0LL);
    }
  }
}

- (void)_vpanCardCredentialsForVPANID:(id)a3 authorization:(id)a4 merchantHost:(id)a5 regenerate:(BOOL)a6 hasRefreshedBAACertificate:(BOOL)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a8;
  id v18 = (void *)objc_claimAutoreleasedReturnValue(-[PDDatabaseManager passWithVPANIdentifier:](self->_databaseManager, "passWithVPANIdentifier:", v14));
  if (v18)
  {
    id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    unsigned __int8 v20 = [v19 BOOLForKey:@"PKHasEverDoneVPAN"];

    if ((v20 & 1) != 0)
    {
      paymentWebServiceCoordinator = self->_paymentWebServiceCoordinator;
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472LL;
      v31[2] = sub_1002B4B18;
      v31[3] = &unk_100652940;
      id v32 = v18;
      id v37 = v17;
      id v33 = v15;
      __int128 v34 = self;
      id v35 = v14;
      id v36 = v16;
      BOOL v38 = a6;
      BOOL v39 = a7;
      -[PDPaymentWebServiceCoordinator performHandlerOnSharedWebServiceQueue:]( paymentWebServiceCoordinator,  "performHandlerOnSharedWebServiceQueue:",  v31);

      id v22 = v32;
    }

    else
    {
      uint64_t Object = PKLogFacilityTypeGetObject(6LL);
      id v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "First time doing VPAN: Refreshing BAA context",  buf,  2u);
      }

      dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
      id v29 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
      v40[0] = _NSConcreteStackBlock;
      v40[1] = 3221225472LL;
      v40[2] = sub_1002B4A94;
      v40[3] = &unk_100650D50;
      v40[4] = self;
      id v41 = v14;
      id v42 = v15;
      id v43 = v16;
      BOOL v45 = a6;
      BOOL v46 = a7;
      id v44 = v17;
      PKForceRefreshBAACertificateAndKey(v29, v40);

      id v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
      [v30 setBool:1 forKey:@"PKHasEverDoneVPAN"];

      id v22 = v41;
    }
  }

  else
  {
    uint64_t v23 = PKLogFacilityTypeGetObject(6LL);
    id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412290;
      id v48 = v14;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "No pass found with VPANID: %@", buf, 0xCu);
    }

    BOOL v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKPassKitErrorDomain,  -1LL,  0LL));
    (*((void (**)(id, void, void *))v17 + 2))(v17, 0LL, v25);
  }
}

- (void)paymentPassForVPANID:(id)a3 andLoadImages:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v9 = a3;
  id v10 = (void (**)(id, void *))a5;
  if ((-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess") & 1) != 0)
  {
    if (v10)
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager passWithVPANIdentifier:]( self->_databaseManager,  "passWithVPANIdentifier:",  v9));
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 paymentPass]);

      if (v12) {
        BOOL v13 = !v6;
      }
      else {
        BOOL v13 = 1;
      }
      if (v13)
      {
        v10[2](v10, v12);
      }

      else
      {
        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3221225472LL;
        v16[2] = sub_1002B55F0;
        v16[3] = &unk_1006396B0;
        id v18 = v10;
        id v17 = v12;
        [v17 loadImageSetAsync:0 preheat:1 withCompletion:v16];
      }
    }
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(0LL);
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10044208C(a2);
    }

    if (v10) {
      v10[2](v10, 0LL);
    }
  }
}

- (void)updateDateLastUsedBySafari:(id)a3 forVirtualCardWithIdentifier:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = (void (**)(id, void))a5;
  if ((-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess") & 1) != 0)
  {
    if (v11)
    {
      -[PDDatabaseManager updateDateLastUsedBySafari:forVirtualCardWithIdentifier:]( self->_databaseManager,  "updateDateLastUsedBySafari:forVirtualCardWithIdentifier:",  v9,  v10);
LABEL_7:
      v11[2](v11, 0LL);
    }
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(0LL);
    BOOL v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10044208C(a2);
    }

    if (v11) {
      goto LABEL_7;
    }
  }
}

- (void)updateCardholderNameFromSafari:(id)a3 forVirtualCardWithIdentifier:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = (void (**)(id, void))a5;
  if ((-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess") & 1) != 0)
  {
    if (v11)
    {
      -[PDDatabaseManager updateCardholderNameFromSafari:forVirtualCardWithIdentifier:]( self->_databaseManager,  "updateCardholderNameFromSafari:forVirtualCardWithIdentifier:",  v9,  v10);
LABEL_7:
      v11[2](v11, 0LL);
    }
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(0LL);
    BOOL v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10044208C(a2);
    }

    if (v11) {
      goto LABEL_7;
    }
  }
}

- (void)paymentOffersCatalogWithCompletion:(id)a3
{
  id v5 = (void (**)(id, void *))a3;
  if ((-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess") & 1) != 0)
  {
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(-[PDPaymentOffersManager paymentOfferCatalog](self->_paymentOffersManager, "paymentOfferCatalog"));
    v5[2](v5, v6);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(0LL);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10044208C(a2);
    }

    if (v5) {
      v5[2](v5, 0LL);
    }
  }
}

- (void)updatePaymentOffersCatalogWithCompletion:(id)a3
{
  id v5 = (void (**)(id, void, void *))a3;
  if ((-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess") & 1) != 0)
  {
    -[PDPaymentOffersManager updatePaymentOffersCatalogWithCompletion:]( self->_paymentOffersManager,  "updatePaymentOffersCatalogWithCompletion:",  v5);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(0LL);
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10044208C(a2);
    }

    if (v5)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKPassKitErrorDomain,  4LL,  0LL));
      v5[2](v5, 0LL, v8);
    }
  }
}

- (void)removePaymentOffersCatalog
{
  if ((-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess") & 1) != 0)
  {
    -[PDPaymentOffersManager removePaymentOffersCatalog](self->_paymentOffersManager, "removePaymentOffersCatalog");
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(0LL);
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10044208C(a2);
    }
  }

- (void)issuerInstallmentTransactionsForPassUniqueID:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, void, void *))a4;
  if ((-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess") & 1) != 0)
  {
    -[PDPaymentOffersManager issuerInstallmentTransactionsForPassUniqueID:completion:]( self->_paymentOffersManager,  "issuerInstallmentTransactionsForPassUniqueID:completion:",  v7,  v8);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(0LL);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10044208C(a2);
    }

    if (v8)
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKPassKitErrorDomain,  4LL,  0LL));
      v8[2](v8, 0LL, v11);
    }
  }
}

- (void)issuerInstallmentTransactionsForTransactionSourceIdentifiers:(id)a3 paymentHashes:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = (void (**)(id, void, void *))a5;
  if ((-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess") & 1) != 0)
  {
    -[PDPaymentOffersManager issuerInstallmentTransactionsForTransactionSourceIdentifiers:paymentHashes:completion:]( self->_paymentOffersManager,  "issuerInstallmentTransactionsForTransactionSourceIdentifiers:paymentHashes:completion:",  v9,  v10,  v11);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(0LL);
    BOOL v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10044208C(a2);
    }

    if (v11)
    {
      id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKPassKitErrorDomain,  4LL,  0LL));
      v11[2](v11, 0LL, v14);
    }
  }
}

- (void)deleteIssuerInstallmentTransactionsForPassUniqueID:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, void *))a4;
  if ((-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess") & 1) != 0)
  {
    -[PDPaymentOffersManager deleteIssuerInstallmentTransactionsForPassUniqueID:completion:]( self->_paymentOffersManager,  "deleteIssuerInstallmentTransactionsForPassUniqueID:completion:",  v7,  v8);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(0LL);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10044208C(a2);
    }

    if (v8)
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKPassKitErrorDomain,  4LL,  0LL));
      v8[2](v8, v11);
    }
  }
}

- (void)paymentRewardsRedemptionsForPassUniqueIdentifier:(id)a3 paymentHashes:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = (void (**)(id, void, void *))a5;
  if ((-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess") & 1) != 0)
  {
    -[PDPaymentOffersManager paymentRewardsRedemptionsForPassUniqueIdentifier:paymentHashes:completion:]( self->_paymentOffersManager,  "paymentRewardsRedemptionsForPassUniqueIdentifier:paymentHashes:completion:",  v9,  v10,  v11);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(0LL);
    BOOL v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10044208C(a2);
    }

    if (v11)
    {
      id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKPassKitErrorDomain,  4LL,  0LL));
      v11[2](v11, 0LL, v14);
    }
  }
}

- (void)updatePaymentRewardsBalancesWithPassUniqueIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, void, void *))a4;
  if ((-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess") & 1) != 0)
  {
    -[PDPaymentOffersManager updatePaymentRewardsBalancesWithPassUniqueIdentifier:completion:]( self->_paymentOffersManager,  "updatePaymentRewardsBalancesWithPassUniqueIdentifier:completion:",  v7,  v8);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(0LL);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10044208C(a2);
    }

    if (v8)
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKPassKitErrorDomain,  4LL,  0LL));
      v8[2](v8, 0LL, v11);
    }
  }
}

- (void)paymentRewardsBalanceWithIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, void *))a4;
  if (v8)
  {
    if ((-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess") & 1) != 0)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue( -[PDPaymentOffersManager paymentRewardsBalanceWithIdentifier:]( self->_paymentOffersManager,  "paymentRewardsBalanceWithIdentifier:",  v7));
      v8[2](v8, v9);
    }

    else
    {
      uint64_t Object = PKLogFacilityTypeGetObject(0LL);
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_10044208C(a2);
      }

      v8[2](v8, 0LL);
    }
  }
}

- (void)paymentRewardsBalancesWithPassUniqueIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, void *))a4;
  if (v8)
  {
    if ((-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess") & 1) != 0)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue( -[PDPaymentOffersManager paymentRewardsBalancesWithPassUniqueIdentifier:]( self->_paymentOffersManager,  "paymentRewardsBalancesWithPassUniqueIdentifier:",  v7));
      v8[2](v8, v9);
    }

    else
    {
      uint64_t Object = PKLogFacilityTypeGetObject(0LL);
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_10044208C(a2);
      }

      v8[2](v8, 0LL);
    }
  }
}

- (void)updatePaymentRewardsRedemptionsWithPassUniqueIdentifier:(id)a3 limit:(int64_t)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = (void (**)(id, void, void *))a5;
  if ((-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess") & 1) != 0)
  {
    -[PDPaymentOffersManager updatePaymentRewardsRedemptionsWithPassUniqueIdentifier:limit:completion:]( self->_paymentOffersManager,  "updatePaymentRewardsRedemptionsWithPassUniqueIdentifier:limit:completion:",  v9,  a4,  v10);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(0LL);
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10044208C(a2);
    }

    if (v10)
    {
      BOOL v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKPassKitErrorDomain,  4LL,  0LL));
      v10[2](v10, 0LL, v13);
    }
  }
}

- (void)paymentRewardsRedemptionsForPassUniqueIdentifier:(id)a3 limit:(int64_t)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = (void (**)(id, void *))a5;
  if (v10)
  {
    if ((-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess") & 1) != 0)
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue( -[PDPaymentOffersManager paymentRewardsRedemptionsForPassUniqueIdentifier:limit:]( self->_paymentOffersManager,  "paymentRewardsRedemptionsForPassUniqueIdentifier:limit:",  v9,  a4));
      v10[2](v10, v11);
    }

    else
    {
      uint64_t Object = PKLogFacilityTypeGetObject(0LL);
      BOOL v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_10044208C(a2);
      }

      v10[2](v10, 0LL);
    }
  }
}

- (void)paymentRewardsRedemptionForPaymentHash:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, void *))a4;
  if (v8)
  {
    if ((-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess") & 1) != 0)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager paymentRewardsRedemptionWithPaymentHash:]( self->_databaseManager,  "paymentRewardsRedemptionWithPaymentHash:",  v7));
      v8[2](v8, v9);
    }

    else
    {
      uint64_t Object = PKLogFacilityTypeGetObject(0LL);
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_10044208C(a2);
      }

      v8[2](v8, 0LL);
    }
  }
}

- (void)insertOrUpdatePaymentRewardsRedemption:(id)a3 withPassUniqueIdentifier:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = (void (**)(void))a5;
  if (v11)
  {
    if ((-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess") & 1) != 0)
    {
      -[PDPaymentOffersManager insertOrUpdatePaymentRewardsRedemption:withPassUniqueIdentifier:]( self->_paymentOffersManager,  "insertOrUpdatePaymentRewardsRedemption:withPassUniqueIdentifier:",  v9,  v10);
    }

    else
    {
      uint64_t Object = PKLogFacilityTypeGetObject(0LL);
      BOOL v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_10044208C(a2);
      }
    }

    v11[2](v11);
  }
}

- (void)deletePaymentRewardsRedemptionsForPassUniqueIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(void))a4;
  if (v8)
  {
    if ((-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess") & 1) != 0)
    {
      -[PDDatabaseManager deletePaymentRewardsRedemptionsForPassUniqueIdentifier:]( self->_databaseManager,  "deletePaymentRewardsRedemptionsForPassUniqueIdentifier:",  v7);
      -[PDDatabaseManager deletePassEndpointMetadataForPassUniqueID:type:]( self->_databaseManager,  "deletePassEndpointMetadataForPassUniqueID:type:",  v7,  2LL);
    }

    else
    {
      uint64_t Object = PKLogFacilityTypeGetObject(0LL);
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_10044208C(a2);
      }
    }

    v8[2](v8);
  }
}

- (void)merchantForPassUniqueIdentifier:(id)a3 withAuxiliaryPassInformationItem:(id)a4 completion:(id)a5
{
}

- (void)generateUnderlyingKeyReportWithCompletion:(id)a3
{
  id v5 = (void (**)(id, id))a3;
  if ((-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess") & 1) != 0)
  {
    if (v5)
    {
      BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(-[PDDatabaseManager passesOfType:](self->_databaseManager, "passesOfType:", -1LL));
      id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      id v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      __int128 v29 = 0u;
      __int128 v30 = 0u;
      __int128 v31 = 0u;
      __int128 v32 = 0u;
      id v9 = v6;
      id v10 = [v9 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v30;
        do
        {
          for (i = 0LL; i != v11; i = (char *)i + 1)
          {
            if (*(void *)v30 != v12) {
              objc_enumerationMutation(v9);
            }
            id v14 = *(void **)(*((void *)&v29 + 1) + 8LL * (void)i);
            id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 fidoProfile]);
            if (v15)
            {
              id v16 = (void *)objc_claimAutoreleasedReturnValue([v14 uniqueID]);
              -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", v16, v15);
            }
          }

          id v11 = [v9 countByEnumeratingWithState:&v29 objects:v33 count:16];
        }

        while (v11);
      }

      id v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v7, "allKeys"));
      secureElement = self->_secureElement;
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472LL;
      v25[2] = sub_1002B66EC;
      v25[3] = &unk_100652968;
      id v26 = v17;
      id v27 = v8;
      uint64_t v28 = v7;
      id v19 = v7;
      unsigned __int8 v20 = v8;
      id v21 = v17;
      -[PKSecureElement checkMultipleFidoKeyPresenceForFIDOProfiles:completion:]( secureElement,  "checkMultipleFidoKeyPresenceForFIDOProfiles:completion:",  v21,  v25);
      id v22 = -[NSMutableDictionary copy](v20, "copy");
      v5[2](v5, v22);
    }
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(0LL);
    id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_10044208C(a2);
    }

    if (v5) {
      v5[2](v5, 0LL);
    }
  }
}

- (void)simulateEnableBiometricsForPass:(id)a3
{
  id v6 = a3;
  int has_internal_ui = os_variant_has_internal_ui(PKOSVariantSubsystem);
  id v5 = v6;
  if (v6 && has_internal_ui)
  {
    nullsub_41(self->_remoteInterfacePresenter, v6);
    id v5 = v6;
  }
}

- (void)setNFCPayloadState:(unint64_t)a3 forPass:(id)a4
{
  id v8 = a4;
  if (os_variant_has_internal_ui(PKOSVariantSubsystem))
  {
    issuerBindingManager = self->_issuerBindingManager;
    id v7 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager passWithUniqueIdentifier:]( self->_databaseManager,  "passWithUniqueIdentifier:",  v8));
    -[PDIssuerBindingManager updateNFCPayloadState:forPass:]( issuerBindingManager,  "updateNFCPayloadState:forPass:",  a3,  v7);
  }
}

- (void)simulateSecureEvent:(id)a3
{
  id v5 = a3;
  int has_internal_ui = os_variant_has_internal_ui(PKOSVariantSubsystem);
  if (v5 && has_internal_ui)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_1002B69C8;
    v6[3] = &unk_100652990;
    id empty = xpc_dictionary_create_empty();
    id v4 = empty;
    [v5 enumerateKeysAndObjectsUsingBlock:v6];
    PDNFSecureXPCSimulateSecureEvent(v4);
  }
}

- (void)sendPassWithUniqueIdentifier:(id)a3 didReceiveValueAddedServiceTransaction:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDPaymentService remoteObjectProxy](self, "remoteObjectProxy"));
    [v7 passWithUniqueIdentifier:v8 didReceiveValueAddedServiceTransaction:v6];
  }
}

- (void)sendDidUpdateApplicationMessages:(id)a3
{
  id v5 = a3;
  if ((-[PKEntitlementWhitelist passesAllAccess](self->_whitelist, "passesAllAccess") & 1) != 0
    || -[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PDPaymentService remoteObjectProxy](self, "remoteObjectProxy"));
    [v4 didUpdateApplicationMessages:v5];
  }
}

- (void)sendPaymentPassWithUniqueIdentifier:(id)a3 didReceiveMessage:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDPaymentService remoteObjectProxy](self, "remoteObjectProxy"));
    [v7 paymentPassWithUniqueIdentifier:v8 didReceiveMessage:v6];
  }
}

- (void)sendPassWithUniqueIdentifier:(id)a3 didUpdateTiles:(id)a4 forContext:(int64_t)a5
{
  id v10 = a3;
  id v8 = a4;
  if ((-[PKEntitlementWhitelist passesAllAccess](self->_whitelist, "passesAllAccess") & 1) != 0
    || -[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDPaymentService remoteObjectProxy](self, "remoteObjectProxy"));
    [v9 passWithUniqueIdentifier:v10 didUpdateTiles:v8 forContext:a5];
  }
}

- (void)sendPaymentPassWithUniqueIdentifier:(id)a3 didReceiveBalanceUpdate:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDPaymentService remoteObjectProxy](self, "remoteObjectProxy"));
    [v7 paymentPassWithUniqueIdentifier:v8 didReceiveBalanceUpdate:v6];
  }
}

- (void)sendPaymentPassWithUniqueIdentifier:(id)a3 didReceivePlanUpdate:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDPaymentService remoteObjectProxy](self, "remoteObjectProxy"));
    [v7 paymentPassWithUniqueIdentifier:v8 didReceivePlanUpdate:v6];
  }
}

- (void)sendPaymentPassWithUniqueIdentifier:(id)a3 didUpdateBalanceReminder:(id)a4 forBalanceWithIdentifier:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[PDPaymentService remoteObjectProxy](self, "remoteObjectProxy"));
    [v10 paymentPassWithUniqueIdentifier:v11 didUpdateBalanceReminder:v8 forBalanceWithIdentifier:v9];
  }
}

- (void)sendDidReceivePendingProvisioningUpdate:(id)a3
{
  id v5 = a3;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PDPaymentService remoteObjectProxy](self, "remoteObjectProxy"));
    [v4 didReceivePendingProvisioningUpdate:v5];
  }
}

- (void)sendTransactionSourceIdentifier:(id)a3 didRemoveTransactionWithIdentifier:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDPaymentService remoteObjectProxy](self, "remoteObjectProxy"));
    [v7 transactionSourceIdentifier:v8 didRemoveTransactionWithIdentifier:v6];
  }
}

- (void)sendDidRemoveTransactionsWithSourceIdentifierMapping:(id)a3
{
  id v5 = a3;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PDPaymentService remoteObjectProxy](self, "remoteObjectProxy"));
    [v4 didRemoveTransactionsWithSourceIdentifierMapping:v5];
  }
}

- (void)sendTransactionSourceIdentifier:(id)a3 didReceiveTransaction:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDPaymentService remoteObjectProxy](self, "remoteObjectProxy"));
    [v7 transactionSourceIdentifier:v8 didReceiveTransaction:v6];
  }
}

- (void)sendPaymentPassWithUniqueIdentifier:(id)a3 didEnableMessageService:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  if ((-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess") & 1) != 0
    || -[PKEntitlementWhitelist paymentConfiguration](self->_whitelist, "paymentConfiguration"))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PDPaymentService remoteObjectProxy](self, "remoteObjectProxy"));
    [v6 paymentPassWithUniqueIdentifier:v7 didEnableMessageService:v4];
  }
}

- (void)sendPaymentPassWithUniqueIdentifier:(id)a3 didEnableTransactionService:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  if ((-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess") & 1) != 0
    || -[PKEntitlementWhitelist paymentConfiguration](self->_whitelist, "paymentConfiguration"))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PDPaymentService remoteObjectProxy](self, "remoteObjectProxy"));
    [v6 paymentPassWithUniqueIdentifier:v7 didEnableTransactionService:v4];
  }
}

- (void)sendDidUpdateDefaultPaymentPassWithUniqueIdentifier:(id)a3
{
  id v5 = a3;
  if ((-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess") & 1) != 0
    || -[PKEntitlementWhitelist paymentConfiguration](self->_whitelist, "paymentConfiguration"))
  {
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[PDPaymentService remoteObjectProxy](self, "remoteObjectProxy"));
    [v4 didUpdateDefaultPaymentPassWithUniqueIdentifier:v5];
  }
}

- (void)sendPaymentPassWithUniqueIdentifier:(id)a3 didUpdateWithTransitProperties:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDPaymentService remoteObjectProxy](self, "remoteObjectProxy"));
    [v7 paymentPassWithUniqueIdentifier:v8 didUpdateWithTransitPassProperties:v6];
  }
}

- (void)sendPaymentPassWithUniqueIdentifier:(id)a3 didUpdateCategoryVisualizationWithStyle:(int64_t)a4
{
  id v7 = a3;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PDPaymentService remoteObjectProxy](self, "remoteObjectProxy"));
    [v6 paymentPassWithUniqueIdentifier:v7 didUpdateCategoryVisualizationWithStyle:a4];
  }
}

- (void)sendDidRecieveCredentialInvitation:(id)a3
{
  id v5 = a3;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[PDPaymentService remoteObjectProxy](self, "remoteObjectProxy"));
    [v4 didRecieveCredentialInvitation:v5];
  }
}

- (void)sendSharesDidUpdateWithPaymentPassWithUniqueIdentifier:(id)a3
{
  id v5 = a3;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[PDPaymentService remoteObjectProxy](self, "remoteObjectProxy"));
    [v4 sharesDidUpdateWithPaymentPassWithUniqueIdentifier:v5];
  }
}

- (void)sendCredential:(id)a3 forPaymentApplication:(id)a4 didUpdateRangingSuspensionReasons:(unint64_t)a5
{
  id v10 = a3;
  id v8 = a4;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDPaymentService remoteObjectProxy](self, "remoteObjectProxy"));
    [v9 credential:v10 forPaymentApplication:v8 didUpdateRangingSuspensionReasons:a5];
  }
}

- (void)productsWithRequest:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[PKEntitlementWhitelist applicationID](self->_whitelist, "applicationID"));
    [v7 setSourceApplicationIdentifier:v9];

    id v10 = (void *)objc_claimAutoreleasedReturnValue( -[PDPaymentWebServiceCoordinator paymentSetupFeaturesCoordinator]( self->_paymentWebServiceCoordinator,  "paymentSetupFeaturesCoordinator"));
    [v10 productsWithRequest:v7 completion:v8];
  }

  else if (v8)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(0LL);
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10044208C(a2);
    }

    (*((void (**)(id, void, void))v8 + 2))(v8, 0LL, 0LL);
  }
}

- (void)productsWithCompletion:(id)a3
{
  id v5 = a3;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    id v6 = objc_alloc_init(&OBJC_CLASS___PKPaymentAvailableProductsRequest);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PKEntitlementWhitelist applicationID](self->_whitelist, "applicationID"));
    [v6 setSourceApplicationIdentifier:v7];

    id v8 = (void *)objc_claimAutoreleasedReturnValue( -[PDPaymentWebServiceCoordinator paymentSetupFeaturesCoordinator]( self->_paymentWebServiceCoordinator,  "paymentSetupFeaturesCoordinator"));
    [v8 productsWithRequest:v6 completion:v5];
  }

  else if (v5)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(0LL);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10044208C(a2);
    }

    (*((void (**)(id, void, void))v5 + 2))(v5, 0LL, 0LL);
  }
}

- (void)performProductActionRequest:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[PKEntitlementWhitelist applicationID](self->_whitelist, "applicationID"));
    [v7 setSourceApplicationIdentifier:v9];

    id v10 = (void *)objc_claimAutoreleasedReturnValue( -[PDPaymentWebServiceCoordinator paymentSetupFeaturesCoordinator]( self->_paymentWebServiceCoordinator,  "paymentSetupFeaturesCoordinator"));
    [v10 performProductActionRequest:v7 completion:v8];
  }

  else if (v8)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(0LL);
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10044208C(a2);
    }

    (*((void (**)(id, void, void))v8 + 2))(v8, 0LL, 0LL);
  }
}

- (void)willPassWithUniqueIdentifierAutomaticallyBecomeDefault:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, void))a4;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    -[PDDefaultPassManager willPassWithUniqueIdentifierAutomaticallyBecomeDefault:completion:]( self->_defaultPassManager,  "willPassWithUniqueIdentifierAutomaticallyBecomeDefault:completion:",  v7,  v8);
  }

  else if (v8)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(0LL);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10044208C(a2);
    }

    v8[2](v8, 0LL);
  }
}

- (void)sendAllPassTransactions
{
  if (!-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    uint64_t Object = PKLogFacilityTypeGetObject(0LL);
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10044208C(a2);
    }
    goto LABEL_7;
  }

  if (self->_gatheringAllTransactions)
  {
    uint64_t v4 = PKLogFacilityTypeGetObject(0LL);
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100442104(v5);
    }
LABEL_7:

    return;
  }

  self->_gatheringAllTransactions = 1;
  databaseManager = self->_databaseManager;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1002B77F0;
  v8[3] = &unk_1006529B8;
  v8[4] = self;
  -[PDDatabaseManager allPassTransactionIdentifiersWithBatchHandler:]( databaseManager,  "allPassTransactionIdentifiersWithBatchHandler:",  v8);
}

- (void)regionsMatchingName:(id)a3 types:(id)a4 completion:(id)a5
{
  id v14 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, void *))a5;
  if (v9)
  {
    if ((-[PKEntitlementWhitelist searchAllAccess](self->_whitelist, "searchAllAccess") & 1) != 0)
    {
      databaseManager = self->_databaseManager;
      id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](&OBJC_CLASS___NSLocale, "currentLocale"));
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 localeIdentifier]);
      BOOL v13 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager regionsMatchingName:types:localeIdentifier:]( databaseManager,  "regionsMatchingName:types:localeIdentifier:",  v14,  v8,  v12));

      v9[2](v9, v13);
    }

    else
    {
      v9[2](v9, &__NSArray0__struct);
    }
  }
}

- (void)regionsWithIdentifiers:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  if (v7)
  {
    if ((-[PKEntitlementWhitelist searchAllAccess](self->_whitelist, "searchAllAccess") & 1) != 0)
    {
      id v18 = v7;
      id v21 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      __int128 v22 = 0u;
      __int128 v23 = 0u;
      __int128 v24 = 0u;
      __int128 v25 = 0u;
      id v19 = v6;
      id obj = v6;
      id v8 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v8)
      {
        id v9 = v8;
        uint64_t v10 = *(void *)v23;
        do
        {
          id v11 = 0LL;
          do
          {
            if (*(void *)v23 != v10) {
              objc_enumerationMutation(obj);
            }
            uint64_t v12 = *(void *)(*((void *)&v22 + 1) + 8LL * (void)v11);
            databaseManager = self->_databaseManager;
            id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](&OBJC_CLASS___NSLocale, "currentLocale", v18));
            id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 localeIdentifier]);
            id v16 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager worldRegionWithIdentifier:localeIdentifier:]( databaseManager,  "worldRegionWithIdentifier:localeIdentifier:",  v12,  v15));

            if (v16) {
              -[NSMutableArray addObject:](v21, "addObject:", v16);
            }

            id v11 = (char *)v11 + 1;
          }

          while (v9 != v11);
          id v9 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
        }

        while (v9);
      }

      id v17 = -[NSMutableArray copy](v21, "copy");
      id v7 = v18;
      v18[2](v18, v17);

      id v6 = v19;
    }

    else
    {
      v7[2](v7, &__NSArray0__struct);
    }
  }
}

- (PDNotificationServiceCoordinator)notificationServiceCoordinator
{
  return self->_notificationServiceCoordinator;
}

- (void)setNotificationServiceCoordinator:(id)a3
{
}

- (PDCloudStoreNotificationCoordinator)cloudStoreNotificationCoordinator
{
  return self->_cloudStoreNotificationCoordinator;
}

- (void)setCloudStoreNotificationCoordinator:(id)a3
{
}

- (PDPeerPaymentWebServiceCoordinator)peerPaymentWebServicesCoordinator
{
  return self->_peerPaymentWebServicesCoordinator;
}

- (void)setPeerPaymentWebServicesCoordinator:(id)a3
{
}

- (PDPaymentWebServiceCoordinator)paymentWebServiceCoordinator
{
  return self->_paymentWebServiceCoordinator;
}

- (PDFamilyCircleManager)familyMemberManager
{
  return self->_familyMemberManager;
}

- (PDPaymentTransactionProcessor)paymentTransactionProcessor
{
  return self->_paymentTransactionProcessor;
}

- (void)setPaymentTransactionProcessor:(id)a3
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

- (PDTransitStateManager)transitStateManager
{
  return self->_transitStateManager;
}

- (void)setTransitStateManager:(id)a3
{
}

- (PDUserNotificationManager)userNotificationManager
{
  return self->_userNotificationManager;
}

- (void)setUserNotificationManager:(id)a3
{
}

- (PKSecureElement)secureElement
{
  return self->_secureElement;
}

- (void)setSecureElement:(id)a3
{
}

- (PDDefaultPassManager)defaultPassManager
{
  return self->_defaultPassManager;
}

- (void)setDefaultPassManager:(id)a3
{
}

- (PDPushNotificationManager)pushNotificationManager
{
  return self->_pushNotificationManager;
}

- (void)setPushNotificationManager:(id)a3
{
}

- (PDDevicePasscodeManager)devicePasscodeManager
{
  return self->_devicePasscodeManager;
}

- (void)setDevicePasscodeManager:(id)a3
{
}

- (PDApplyManager)applyManager
{
  return self->_applyManager;
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

- (void)setSubcredentialManager:(id)a3
{
}

- (PDNFCInitiatedPairingManager)nfcPairingManager
{
  return self->_nfcPairingManager;
}

- (void)setNFCPairingManager:(id)a3
{
}

- (PDCardFileManager)cardFileManager
{
  return self->_cardFileManager;
}

- (void)setCardFileManager:(id)a3
{
}

- (PDPassTileManager)passTileManager
{
  return self->_passTileManager;
}

- (void)setPassTileManager:(id)a3
{
}

- (PDMapsBrandAndMerchantUpdater)mapsBrandAndMerchantUpdater
{
  return self->_mapsBrandAndMerchantUpdater;
}

- (void)setMapsBrandAndMerchantUpdater:(id)a3
{
}

- (PDPushProvisioningManager)pushProvisioningManager
{
  return self->_pushProvisioningManager;
}

- (void)setPushProvisioningManager:(id)a3
{
}

- (PDIssuerBindingManager)issuerBindingManager
{
  return self->_issuerBindingManager;
}

- (void)setIssuerBindingManager:(id)a3
{
}

- (PDBarcodeCredentialManager)barcodeCredentialManager
{
  return self->_barcodeCredentialManager;
}

- (void)setBarcodeCredentialManager:(id)a3
{
}

- (PDTransactionAuthenticationManager)transactionAuthenticationManager
{
  return self->_transactionAuthenticationManager;
}

- (void)setTransactionAuthenticationManager:(id)a3
{
}

- (PKTapToRadarDelegate)tapToRadarDelegate
{
  return (PKTapToRadarDelegate *)objc_loadWeakRetained((id *)&self->_tapToRadarDelegate);
}

- (void)setTapToRadarDelegate:(id)a3
{
}

- (PDPaymentOffersManager)paymentOffersManager
{
  return self->_paymentOffersManager;
}

- (void)setPaymentOffersManager:(id)a3
{
}

- (PDTransactionReceiptFileManager)transactionReceiptFileManager
{
  return self->_transactionReceiptFileManager;
}

- (void)setTransactionReceiptFileManager:(id)a3
{
}

- (PKSharingIDSManager)idsSharingManager
{
  return self->_idsSharingManager;
}

- (PDISO18013Manager)iso18013Manager
{
  return self->_iso18013Manager;
}

- (void)setIso18013Manager:(id)a3
{
}

- (PDSharingManager)sharingManager
{
  return self->_sharingManager;
}

- (void)setSharingManager:(id)a3
{
}

- (PDPendingProvisioningManager)pendingProvisioningManager
{
  return self->_pendingProvisioningManager;
}

- (void)setPendingProvisioningManager:(id)a3
{
}

- (PDAuxiliaryCapabilityManager)auxiliaryCapabilityManager
{
  return self->_auxiliaryCapabilityManager;
}

- (void)setAuxiliaryCapabilityManager:(id)a3
{
}

- (PDApplicationMessageManager)applicationMessageManager
{
  return self->_applicationMessageManager;
}

- (void)setApplicationMessageManager:(id)a3
{
}

- (PDPaymentUserCommunicationManager)paymentUserCommunicationManager
{
  return self->_paymentUserCommunicationManager;
}

- (void)setPaymentUserCommunicationManager:(id)a3
{
}

- (PDAuxiliaryPassInformationManager)auxiliaryPassInformationManager
{
  return self->_auxiliaryPassInformationManager;
}

- (void)setAuxiliaryPassInformationManager:(id)a3
{
}

- (PDXPCEventPublisher)passKitEventPublisher
{
  return self->_passKitEventPublisher;
}

- (void)setPassKitEventPublisher:(id)a3
{
}

- (void).cxx_destruct
{
}

@end