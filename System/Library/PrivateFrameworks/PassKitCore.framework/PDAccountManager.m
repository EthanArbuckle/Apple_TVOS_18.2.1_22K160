@interface PDAccountManager
- (BOOL)_accountSupportsTransactionsWithoutPass:(id)a3;
- (BOOL)_shouldDownloadCreditStatementsForAccountIdentifier:(id)a3;
- (BOOL)_shouldDownloadCreditStatementsForLastStatementDownload:(id)a3 now:(id)a4;
- (BOOL)_shouldDownloadScheduledPaymentsForAccountIdentifier:(id)a3;
- (BOOL)_shouldFetchUpdatedUserInfo:(id)a3;
- (BOOL)_shouldProactivelyFetchAccountUsersForAccount:(id)a3 users:(id)a4;
- (BOOL)_shouldProactivelyFetchEndpoint:(unint64_t)a3 dirty:(BOOL)a4 lastUpdated:(id)a5 fetchPeriodEndpoint:(unint64_t)a6 account:(id)a7;
- (BOOL)_shouldProactivelyFetchEndpoint:(unint64_t)a3 metadataType:(unint64_t)a4 fetchPeriodEndpoint:(unint64_t)a5 account:(id)a6;
- (BOOL)backgroundProvisionInProgressForFeature:(unint64_t)a3;
- (PDAccountManager)initWithPushNotificationManager:(id)a3 paymentWebServiceCoordinator:(id)a4 databaseManager:(id)a5 userNotificationManager:(id)a6 payLaterMerchantProcessor:(id)a7 cloudStoreNotificationCoordinator:(id)a8 deviceEnvironmentStore:(id)a9 databaseRecreated:(BOOL)a10;
- (PDAccountNotificationController)accountNotificationController;
- (id)_amsController;
- (id)_cacheKeyForCreditStatementsWithAccountIdentifier:(id)a3;
- (id)_cacheKeyForScheduledPaymentsWithAccountIdentifier:(id)a3;
- (id)_cacheKeyForUserInfoWithAccountIdentifier:(id)a3;
- (id)_expirationMessagingStartDateForMessagingInfo:(id)a3 account:(id)a4 now:(id)a5;
- (id)_familyMemberAssociatedWithInviteEmail:(id)a3 familyMembers:(id)a4;
- (id)_mockAccountUsers;
- (id)_mockCreditAccountInitialStateWithEvents:(id *)a3;
- (id)_mockInstallmentForAccount:(id)a3 events:(id *)a4;
- (id)_mockPhysicalCards;
- (id)_mockSavingsAccount;
- (id)_promoRewardsMerchantNamesFromDate:(id)a3 toDate:(id)a4 accountIdentifier:(id)a5 altDSID:(id)a6 rewardPercentage:(id *)a7;
- (id)_queue_accountWithIdentifier:(id)a3;
- (id)_queue_insertOrReplaceAccount:(id)a3 extended:(BOOL)a4 deleteSensitiveData:(BOOL)a5;
- (id)_queue_processFinancingPlans:(id)a3 accountIdentifier:(id)a4 updateReasons:(unint64_t)a5;
- (id)_rewardsAmountFromDate:(id)a3 toDate:(id)a4 accountIdentifier:(id)a5 altDSID:(id)a6 rewardTypes:(id *)a7;
- (id)_setupNotificationIdentifierForAccountIdentifier:(id)a3;
- (id)defaultAccountForFeature:(unint64_t)a3 forAccounts:(id)a4;
- (id)pushNotificationTopics;
- (unint64_t)_queueIndexOfAccountWithIdentifier:(id)a3;
- (void)_accessObserversWithHandler:(id)a3;
- (void)_accountsAreInDirtyWithFeatureFailures:(id)a3 completion:(id)a4;
- (void)_addAccountManagerFetchRequest:(id)a3;
- (void)_cleanupSavingsAccountPreferences:(id)a3;
- (void)_creditStatementsForAccountIdentifier:(id)a3 completion:(id)a4;
- (void)_creditUserInfoForAccountIdentifier:(id)a3 forceFetch:(BOOL)a4 completion:(id)a5;
- (void)_downloadCreditStatementsForAccountIdentifier:(id)a3 withCompletion:(id)a4;
- (void)_executeDecryptionRequests;
- (void)_executeFetchRequest:(id)a3 completion:(id)a4;
- (void)_executeNextAccountManagerFetchIfPossibleForRequestIdentifier:(id)a3;
- (void)_fetchCreditUserInfoForAccountIdentifier:(id)a3 completion:(id)a4;
- (void)_handlePhysicalCardActionResponse:(id)a3 forAccountIdentifier:(id)a4 completion:(id)a5;
- (void)_handlePhysicalCardRequestResponse:(id)a3 forAccountIdentifier:(id)a4 completion:(id)a5;
- (void)_insertOrUpdateAccountServicingTokenNotificationWithAccount:(id)a3 notificationUserInfo:(id)a4;
- (void)_managerFetch_cancelFinancingPlanWithRequest:(id)a3 completion:(id)a4;
- (void)_managerFetch_createdZoneWithRequest:(id)a3 completion:(id)a4;
- (void)_managerFetch_exportTransactionsWithRequest:(id)a3 completion:(id)a4;
- (void)_managerFetch_performVirtualCardActionWithRequest:(id)a3 completion:(id)a4;
- (void)_managerFetch_sendAccountReport:(id)a3 completion:(id)a4;
- (void)_managerFetch_sharedAccountCloudStoreWithRequest:(id)a3 completion:(id)a4;
- (void)_managerFetch_updateAccountUsersWithRequest:(id)a3 completion:(id)a4;
- (void)_managerFetch_updateAccountWithRequest:(id)a3 completion:(id)a4;
- (void)_managerFetch_updateAccountsWithRequest:(id)a3 completion:(id)a4;
- (void)_managerFetch_updateBalancesWithRequest:(id)a3 completion:(id)a4;
- (void)_managerFetch_updateCreditRecoveryPaymentPlansWithRequest:(id)a3 completion:(id)a4;
- (void)_managerFetch_updateEnhancedMerchantsWithRequest:(id)a3 completion:(id)a4;
- (void)_managerFetch_updateFinancingPlansWithRequest:(id)a3 completion:(id)a4;
- (void)_managerFetch_updateFundingSourcesWithRequest:(id)a3 completion:(id)a4;
- (void)_managerFetch_updatePhysicalCardsWithRequest:(id)a3 completion:(id)a4;
- (void)_managerFetch_updatePromotionsWithRequest:(id)a3 completion:(id)a4;
- (void)_notifyPhysicalCardsChangedWithAccountEvent:(id)a3;
- (void)_paymentWebServiceContextChanged;
- (void)_processAddedAccounts:(id)a3;
- (void)_processChangedAccounts:(id)a3;
- (void)_processDeletedAccounts:(id)a3;
- (void)_processPaymentFailed:(id)a3;
- (void)_processPhysicalCardsFromExtendedAccountResponse:(id)a3 accountIdentifier:(id)a4;
- (void)_processRewardsAddedEvent:(id)a3;
- (void)_processRewardsRedemptionEvent:(id)a3;
- (void)_processUserInfoUpdateEvent:(id)a3;
- (void)_processVirtualCardStatusUpdateEvent:(id)a3;
- (void)_publishStatementsChangedForAccountIdentifier:(id)a3;
- (void)_queueDecryptionRequest:(id)a3;
- (void)_queue_deleteAccounts;
- (void)_queue_fetchNextPaginatedRequestIfNecessaryFromPreviousResponse:(id)a3 newRequest:(id)a4;
- (void)_queue_mergeAccounts:(id)a3 featureFailures:(id)a4;
- (void)_queue_updateAccountsWithPayload:(id)a3;
- (void)_queue_updateAppleBalancePromotionsIfNeccessaryForAccount:(id)a3 currentPromotion:(id)a4;
- (void)_queue_updateEnhancedMerchantsIfNecessaryForAccount:(id)a3;
- (void)_queue_updateFinancingPlansIfNeccessaryForAccount:(id)a3;
- (void)_queue_updatePaymentFundingSourcesIfNecessaryForAccount:(id)a3;
- (void)_queue_updatePhysicalCardsIfNecessaryForAccount:(id)a3;
- (void)_queue_updatePromotionsIfNecessaryForAccount:(id)a3;
- (void)_queue_updateSharedAccountCloudStoreIfNeccessaryForAccount:(id)a3 completion:(id)a4;
- (void)_queue_writeFinancingPlanUpdateIfPossibleWithOldFinancingPlan:(id)a3 newFinancingPlan:(id)a4;
- (void)_savingsUserInfoForAccountIdentifier:(id)a3 completion:(id)a4;
- (void)_triggerProvisionPassToWatchWithCompletion:(id)a3;
- (void)_updateAccountEnhancedMerchantsForAccountWithIdentifier:(id)a3 ignoreErrorBackoff:(BOOL)a4 cooldownLevel:(unint64_t)a5 completion:(id)a6;
- (void)_updateAccountPromotionsForAccountWithIdentifier:(id)a3 ignoreErrorBackoff:(BOOL)a4 observeCooldownPeriod:(BOOL)a5 completion:(id)a6;
- (void)_updateAccountUsersForAccountWithIdentifier:(id)a3 fromPush:(BOOL)a4 completion:(id)a5;
- (void)_updateCreditRecoveryPaymentPlansForAccountIdentifier:(id)a3 force:(BOOL)a4 completion:(id)a5;
- (void)_updateFinancingPlansForAccountWithIdentifier:(id)a3 pageOffset:(unint64_t)a4 limit:(unint64_t)a5 ignoreLastUpdatedDate:(BOOL)a6 fromPush:(BOOL)a7 completion:(id)a8;
- (void)_updatePhysicalCardsForAccountIdentifier:(id)a3 force:(BOOL)a4 completion:(id)a5;
- (void)_updatePushTopics;
- (void)_updateSharedAccountCloudStoreWithAccountIdentifier:(id)a3 fromPush:(BOOL)a4 completion:(id)a5;
- (void)accountBalancesForAccountIdentifier:(id)a3 startDate:(id)a4 endDate:(id)a5 type:(unint64_t)a6 completion:(id)a7;
- (void)accountEnhancedMerchantBehaviorForAccountWithIdentifier:(id)a3 completion:(id)a4;
- (void)accountEnhancedMerchantsForAccountWithIdentifier:(id)a3 completion:(id)a4;
- (void)accountEntityOrderingsForAccountWithIdentifier:(id)a3 entityType:(unint64_t)a4 completion:(id)a5;
- (void)accountForPassWithUniqueID:(id)a3 completion:(id)a4;
- (void)accountHoldsForAccountIdentifier:(id)a3 completion:(id)a4;
- (void)accountIsInDirtyStateWithIdentifier:(id)a3 completion:(id)a4;
- (void)accountPendingFamilyMembersForAccountIdentifier:(id)a3 completion:(id)a4;
- (void)accountPromotionBehaviorForAccountWithIdentifier:(id)a3 completion:(id)a4;
- (void)accountPromotionsForAccountWithIdentifier:(id)a3 completion:(id)a4;
- (void)accountStatementMetadataForAllAccountsWithCompletion:(id)a3;
- (void)accountStatementMetadataForStatementIdentifier:(id)a3 accountIdentifier:(id)a4 completion:(id)a5;
- (void)accountUsersByAccountIdentifierForFeature:(unint64_t)a3 completion:(id)a4;
- (void)accountUsersForAccountWithIdentifier:(id)a3 completion:(id)a4;
- (void)accountWithIdentifier:(id)a3 completion:(id)a4;
- (void)accountWithVirtualCardIdentifier:(id)a3 completion:(id)a4;
- (void)accountsAreInDirtyStateWithCompletion:(id)a3;
- (void)accountsForFeature:(unint64_t)a3 completion:(id)a4;
- (void)accountsForProvisioningWithCompletion:(id)a3;
- (void)accountsWithCompletion:(id)a3;
- (void)accountsWithPassLocallyProvisionedWithCompletion:(id)a3;
- (void)activatePhysicalCardWithActivationCode:(id)a3 completion:(id)a4;
- (void)activatePhysicalCardWithIdentifier:(id)a3 activationCode:(id)a4 completion:(id)a5;
- (void)appleBalancePromotionForAccountWithIdentifier:(id)a3 completion:(id)a4;
- (void)applyPushNotificationToken:(id)a3;
- (void)attemptAppleBalanceSetupWithCompletion:(id)a3;
- (void)beginPhysicalCardAction:(id)a3 onPhysicalCardWithIdentifier:(id)a4 forAccountWithIdentifier:(id)a5 accountUserAltDSID:(id)a6 deviceMetadata:(id)a7 completion:(id)a8;
- (void)beginPhysicalCardRequestWithOrder:(id)a3 forAccountWithIdentifier:(id)a4 accountUserAltDSID:(id)a5 deviceMetadata:(id)a6 completion:(id)a7;
- (void)billPaymentSelectedSuggestedAmountDataEventsForAccountIdentifier:(id)a3 withStartDate:(id)a4 endDate:(id)a5 completion:(id)a6;
- (void)billPaymentSelectedSuggestedAmountDataEventsForAccountIdentifier:(id)a3 withStatementIdentifier:(id)a4 completion:(id)a5;
- (void)cancelFinancingPlanWithIdentifier:(id)a3 accountIdentifier:(id)a4 cancellationReasonIdentifier:(id)a5 cancellationReasonDescription:(id)a6 completion:(id)a7;
- (void)cardCredentialsForVirtualCard:(id)a3 authorization:(id)a4 action:(int64_t)a5 completion:(id)a6;
- (void)cloudStoreNotificationCoordinator:(id)a3 createdZoneWithName:(id)a4 forContainerName:(id)a5 scope:(int64_t)a6;
- (void)completePhysicalCardActionRequest:(id)a3 withSignature:(id)a4 completion:(id)a5;
- (void)completePhysicalCardRequest:(id)a3 withSignature:(id)a4 completion:(id)a5;
- (void)createVirtualCard:(int64_t)a3 forAccountIdentifier:(id)a4 completion:(id)a5;
- (void)creditRecoveryPaymentPlanInformationForAccountIdentifier:(id)a3 allowFetchFromServer:(BOOL)a4 completion:(id)a5;
- (void)creditRecoveryPaymentPlansForAccountIdentifier:(id)a3 allowFetchFromServer:(BOOL)a4 completion:(id)a5;
- (void)creditStatementsForAccountIdentifier:(id)a3 completion:(id)a4;
- (void)creditStatementsForStatementIdentifiers:(id)a3 accountIdentifier:(id)a4 completion:(id)a5;
- (void)dailyCashEligibleDestinationsForAccountWithIdentifier:(id)a3 completion:(id)a4;
- (void)dailyCashNotificationForStartDate:(id)a3 endDate:(id)a4 accountIdentifier:(id)a5 completion:(id)a6;
- (void)databaseRestored;
- (void)dealloc;
- (void)defaultAccountForFeature:(unint64_t)a3 completion:(id)a4;
- (void)deleteAccountEnhancedMerchant:(id)a3 forAccountWithIdentifier:(id)a4 completion:(id)a5;
- (void)deleteAccountPromotion:(id)a3 forAccountWithIdentifier:(id)a4 completion:(id)a5;
- (void)deleteAccountStatementMetadataForStatementIdentifier:(id)a3 accountIdentifier:(id)a4 completion:(id)a5;
- (void)deleteAccountUserWithAltDSID:(id)a3 forAccountWithIdentifier:(id)a4 completion:(id)a5;
- (void)deleteAccountWithIdentifier:(id)a3 completion:(id)a4;
- (void)deleteAccountsWithCompletion:(id)a3;
- (void)deleteAppleBalancePromotionForAccountWithIdentifier:(id)a3 completion:(id)a4;
- (void)deleteBeneficiaryWithIdentifier:(id)a3 accountIdentifier:(id)a4 completion:(id)a5;
- (void)deleteEventWithIdentifier:(id)a3 completion:(id)a4;
- (void)deleteEventsWithAccountIdentifier:(id)a3 completion:(id)a4;
- (void)deleteEventsWithAccountIdentifier:(id)a3 excludingTypes:(id)a4 completion:(id)a5;
- (void)deleteFinancingPlanWithIdentifier:(id)a3 accountIdentifier:(id)a4 completion:(id)a5;
- (void)deleteFinancingPlansForAccountIdentifier:(id)a3 completion:(id)a4;
- (void)deleteFinancingPlansForAllAccountsWithCompletion:(id)a3;
- (void)deleteInStoreTopUpTokenForAccountWithIdentifier:(id)a3 completion:(id)a4;
- (void)deleteLocalAccountWithIdentifier:(id)a3 completion:(id)a4;
- (void)deleteVirtualCardEncryptedDataForAccountIdentifier:(id)a3 completion:(id)a4;
- (void)didAddAccountPendingFamilyMembers:(id)a3;
- (void)environmentStore:(id)a3 storedEnvironment:(id)a4 differsFromCurrent:(id)a5 commitBlock:(id)a6;
- (void)eventWithIdentifier:(id)a3 completion:(id)a4;
- (void)eventsForAccountIdentifier:(id)a3 completion:(id)a4;
- (void)eventsForAccountIdentifier:(id)a3 types:(id)a4 startDate:(id)a5 endDate:(id)a6 orderedByDate:(int64_t)a7 limit:(unint64_t)a8 completion:(id)a9;
- (void)exportTransactionDataForAccountIdentifier:(id)a3 withFileFormat:(id)a4 beginDate:(id)a5 endDate:(id)a6 productTimeZone:(id)a7 completion:(id)a8;
- (void)familyCircleManagerDidUpdateFamilyMembers:(id)a3;
- (void)fetchAllVirtualCardsForAccountIdentifier:(id)a3 completion:(id)a4;
- (void)fetchKeychainCredentialForVirtualCardIdentifier:(id)a3 forAccountIdentifier:(id)a4 completion:(id)a5;
- (void)financingPlanForPlanIdentifier:(id)a3 completion:(id)a4;
- (void)financingPlanInstallmentsDueDateRangeForAccountIdentifier:(id)a3 financingPlanStates:(id)a4 completion:(id)a5;
- (void)financingPlansForAccountIdentifier:(id)a3 completion:(id)a4;
- (void)financingPlansForAllAccountsWithCompletion:(id)a3;
- (void)financingPlansWithQueries:(id)a3 completion:(id)a4;
- (void)handlePushNotificationForTopic:(id)a3 userInfo:(id)a4;
- (void)inStoreTopUpTokenForAccountWithIdentifier:(id)a3 completion:(id)a4;
- (void)inactivePhysicalCardForFeatureIdentifier:(unint64_t)a3 completion:(id)a4;
- (void)insertAccountBalanceUpdateNotificationForAccount:(id)a3 updateAmount:(id)a4;
- (void)insertDailyCashNotificationForAccountIdentifier:(id)a3 completion:(id)a4;
- (void)insertEvents:(id)a3 completion:(id)a4;
- (void)insertOrReplaceAccount:(id)a3 extended:(BOOL)a4 deleteSensitiveData:(BOOL)a5 completion:(id)a6;
- (void)insertOrUpdateAccountEnhancedMerchants:(id)a3 accountIdentifier:(id)a4 completion:(id)a5;
- (void)insertOrUpdateAccountPromotions:(id)a3 accountIdentifier:(id)a4 completion:(id)a5;
- (void)insertOrUpdateAppleBalancePromotion:(id)a3 accountIdentifier:(id)a4 completion:(id)a5;
- (void)insertOrUpdateInStoreTopUpToken:(id)a3 accountIdentifier:(id)a4 completion:(id)a5;
- (void)insertOrUpdateLocalAccount:(id)a3 completion:(id)a4;
- (void)insertOrUpdateLocalAccountFinancingPlans:(id)a3 forAccountWithIdentifier:(id)a4 completion:(id)a5;
- (void)insertOrUpdateLocalAccountUser:(id)a3 forAccountWithIdentifier:(id)a4 completion:(id)a5;
- (void)insertOrUpdateLocalFinancingPlans:(id)a3 accountIdentifier:(id)a4 completion:(id)a5;
- (void)insertSummaryNotificationForAccountIdentifier:(id)a3 summaryType:(int64_t)a4 completion:(id)a5;
- (void)invalidateTopUpTokenWithIdentifier:(id)a3 forAccountWithIdentifier:(id)a4 completion:(id)a5;
- (void)lastRedemptionEventToDestination:(unint64_t)a3 forAccountIdentifier:(id)a4 altDSID:(id)a5 completion:(id)a6;
- (void)lastUsedInAppFundingSourceForAccountIdentifier:(id)a3 completion:(id)a4;
- (void)markUserViewedIntroduction:(BOOL)a3 forInstallmentIdentifiers:(id)a4 accountIdentifier:(id)a5 completion:(id)a6;
- (void)mergeAccounts:(id)a3 completion:(id)a4;
- (void)noteAccountDeletionWithCompletion:(id)a3;
- (void)noteSecurityCodeActivityWithAction:(int64_t)a3 forSecurityCodeIdentifier:(id)a4 forVirtualCardIdentifier:(id)a5 forAccountIdentifier:(id)a6 completion:(id)a7;
- (void)noteVirtualCardAutoFilledBySafari:(id)a3 completion:(id)a4;
- (void)passAdded:(id)a3;
- (void)passRemoved:(id)a3;
- (void)payLaterCardMagnitudesForAccountIdentifier:(id)a3 completion:(id)a4;
- (void)payLaterMerchantProcessor:(id)a3 didProcessPayLaterMerchant:(id)a4 forFinancingPlan:(id)a5;
- (void)paymentFundingSourceForIdentifier:(id)a3 accountIdentifier:(id)a4 completion:(id)a5;
- (void)paymentFundingSourcesForAccountIdentifier:(id)a3 completion:(id)a4;
- (void)paymentWebServiceCoordinatorWebServiceDidChange:(id)a3;
- (void)performAccountAction:(id)a3 withAccountIdentifier:(id)a4 accountUserAltDSID:(id)a5 completion:(id)a6;
- (void)performVirtualCardAction:(int64_t)a3 forVirtualCardIdentifier:(id)a4 forAccountIdentifier:(id)a5 completion:(id)a6;
- (void)physicalCardForFeatureIdentifier:(unint64_t)a3 activationCode:(id)a4 completion:(id)a5;
- (void)physicalCardsByAccountIdentifierForFeature:(unint64_t)a3 completion:(id)a4;
- (void)physicalCardsForAccountWithIdentifier:(id)a3 completion:(id)a4;
- (void)postAccountChangedNotification;
- (void)processPhysicalCardExpirationMessaging:(id)a3 physicalCards:(id)a4 account:(id)a5;
- (void)promptDetailsForVirtualCard:(id)a3 showNotification:(BOOL)a4;
- (void)recomputePayLaterCardMagntiudesForAccountIdentifier:(id)a3;
- (void)registerObserver:(id)a3;
- (void)reprocessPayLaterFinancingPlansForMerchantCleanup:(id)a3;
- (void)resetAccountBalancesForAccountIdentifier:(id)a3 completion:(id)a4;
- (void)resolveAccountStorefrontCountryMismatchForAccount:(id)a3 newCountryCode:(id)a4 completion:(id)a5;
- (void)rewardsTierSummaryForTransactionSourceIdentifiers:(id)a3 currencyCode:(id)a4 startDate:(id)a5 endDate:(id)a6 completion:(id)a7;
- (void)savingsStatementsForAccountIdentifier:(id)a3 completion:(id)a4;
- (void)scheduleSetupReminderForAccountWithIdentifier:(id)a3 completion:(id)a4;
- (void)scheduledPaymentsWithAccountIdentifier:(id)a3 includeFailedRecurringPayments:(BOOL)a4 allowFetchFromServer:(BOOL)a5 completion:(id)a6;
- (void)sendAccountReport:(id)a3 trigger:(unint64_t)a4 completion:(id)a5;
- (void)setAccountNotificationController:(id)a3;
- (void)sharedAccountCloudStoreWithAccountIdentifier:(id)a3 completion:(id)a4;
- (void)taxFormsForAccountIdentifier:(id)a3 completion:(id)a4;
- (void)termsWithIdentifier:(id)a3 accepted:(BOOL)a4 withAccountIdentifier:(id)a5 completion:(id)a6;
- (void)triggerCloudStoreZoneCreationForAccount:(id)a3 withCompletion:(id)a4;
- (void)unregisterObserver:(id)a3;
- (void)updateAccount:(id)a3 completion:(id)a4;
- (void)updateAccountBalancesForAccountIdentifier:(id)a3 startDate:(id)a4 endDate:(id)a5 type:(unint64_t)a6 completion:(id)a7;
- (void)updateAccountEnhancedMerchantsForAccountWithIdentifier:(id)a3 completion:(id)a4;
- (void)updateAccountEnhancedMerchantsForAccountWithIdentifier:(id)a3 cooldownLevel:(unint64_t)a4 completion:(id)a5;
- (void)updateAccountEnhancedMerchantsForAccountWithIdentifier:(id)a3 ignoreErrorBackoff:(BOOL)a4 completion:(id)a5;
- (void)updateAccountPromotionsForAccountWithIdentifier:(id)a3 completion:(id)a4;
- (void)updateAccountPromotionsForAccountWithIdentifier:(id)a3 ignoreErrorBackoff:(BOOL)a4 completion:(id)a5;
- (void)updateAccountPromotionsForAccountWithIdentifier:(id)a3 observeCooldownPeriod:(BOOL)a4 completion:(id)a5;
- (void)updateAccountStatementMetadataForStatementIdentifier:(id)a3 accountIdentifier:(id)a4 trigger:(unint64_t)a5 completion:(id)a6;
- (void)updateAccountUserNotificationSettings:(id)a3 forAccountUserWithAltDSID:(id)a4 forAccountWithIdentifier:(id)a5 completion:(id)a6;
- (void)updateAccountUserPreferences:(id)a3 forAccountUserWithAltDSID:(id)a4 forAccountWithIdentifier:(id)a5 completion:(id)a6;
- (void)updateAccountUsersForAccountWithIdentifier:(id)a3 completion:(id)a4;
- (void)updateAccountWithIdentifier:(id)a3 completion:(id)a4;
- (void)updateAccountWithIdentifier:(id)a3 extended:(BOOL)a4 completion:(id)a5;
- (void)updateAccountsWithCompletion:(id)a3;
- (void)updateCreditRecoveryPaymentPlansForAccountIdentifier:(id)a3 completion:(id)a4;
- (void)updateCreditStatementsForAccountIdentifier:(id)a3 completion:(id)a4;
- (void)updateImpressionCount:(int64_t)a3 promotionProgramIdentifier:(id)a4 accountIdentifier:(id)a5 completion:(id)a6;
- (void)updateImpressionCountsForPromotions:(id)a3 accountIdentifier:(id)a4 completion:(id)a5;
- (void)updateLastUsedInAppFundingSource:(id)a3 accountIdentifier:(id)a4;
- (void)updateMockAccountWithAccount:(id)a3 completion:(id)a4;
- (void)updatePaymentFundingSourcesForAccountIdentifier:(id)a3 force:(BOOL)a4 completion:(id)a5;
- (void)updateSavingsStatementsForAccountIdentifier:(id)a3 completion:(id)a4;
- (void)updateScheduledPaymentsWithAccount:(id)a3 completion:(id)a4;
- (void)updateSharedAccountCloudStoreWithAccountIdentifier:(id)a3 completion:(id)a4;
- (void)updateTaxFormsForAccountIdentifier:(id)a3 completion:(id)a4;
- (void)updateUserInfoForAccountIdentifier:(id)a3 contact:(id)a4 completion:(id)a5;
- (void)updateVirtualCardsWithAccountIdentifier:(id)a3 completion:(id)a4;
- (void)updateWalletBadgeCount;
- (void)userInfoForAccountIdentifier:(id)a3 forceFetch:(BOOL)a4 completion:(id)a5;
- (void)validateAppleBalanceSecurityRequirementsWithCompletion:(id)a3;
@end

@implementation PDAccountManager

- (PDAccountManager)initWithPushNotificationManager:(id)a3 paymentWebServiceCoordinator:(id)a4 databaseManager:(id)a5 userNotificationManager:(id)a6 payLaterMerchantProcessor:(id)a7 cloudStoreNotificationCoordinator:(id)a8 deviceEnvironmentStore:(id)a9 databaseRecreated:(BOOL)a10
{
  id v17 = a3;
  id obj = a4;
  id v18 = a4;
  id v19 = a5;
  id v143 = a6;
  id v144 = a7;
  id v142 = a7;
  id v141 = a8;
  id v140 = a9;
  v171.receiver = self;
  v171.super_class = (Class)&OBJC_CLASS___PDAccountManager;
  v20 = -[PDAccountManager init](&v171, "init");
  v21 = v20;
  if (v20)
  {
    id v137 = v19;
    id v133 = v18;
    id v134 = v17;
    v20->_databaseWillRestore = a10;
    v20->_lockPushTopics._os_unfair_lock_opaque = 0;
    uint64_t v22 = ((uint64_t (*)(void))PKUIOnlyDemoModeEnabled)();
    if ((v22 & 1) != 0 || PKStoreDemoModeEnabled(v22, v23))
    {
      v24 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      accounts = v21->_accounts;
      v21->_accounts = v24;
    }

    else
    {
      accounts = (NSMutableArray *)objc_claimAutoreleasedReturnValue([v19 accounts]);
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray allObjects](accounts, "allObjects"));
      uint64_t v27 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](&OBJC_CLASS___NSMutableArray, "arrayWithArray:", v26));
      v28 = v21->_accounts;
      v21->_accounts = (NSMutableArray *)v27;
    }

    v29 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    fetchRequests = v21->_fetchRequests;
    v21->_fetchRequests = v29;

    v31 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    currentRequests = v21->_currentRequests;
    v21->_currentRequests = v31;

    v33 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    decryptionRequests = v21->_decryptionRequests;
    v21->_decryptionRequests = v33;

    v21->_fetchRequestLock._os_unfair_lock_opaque = 0;
    v21->_backgroundProvisioningLock._os_unfair_lock_opaque = 0;
    v35 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    zoneCreationCompletions = v21->_zoneCreationCompletions;
    v21->_zoneCreationCompletions = v35;

    v21->_zoneCreationCompletionsLock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v21->_userNotificationManager, a6);
    objc_storeStrong((id *)&v21->_pushNotificationManager, a3);
    objc_storeStrong((id *)&v21->_cloudStoreNotificationCoordinator, a8);
    p_databaseManager = (void **)&v21->_databaseManager;
    objc_storeStrong((id *)&v21->_databaseManager, a5);
    objc_storeStrong((id *)&v21->_deviceEnvironmentStore, a9);
    objc_storeStrong((id *)&v21->_paymentWebServiceCoordinator, obj);
    -[PDPaymentWebServiceCoordinator registerObserver:](v21->_paymentWebServiceCoordinator, "registerObserver:", v21);
    v38 = (void *)objc_claimAutoreleasedReturnValue( -[PDPaymentWebServiceCoordinator sharedWebServiceContext]( v21->_paymentWebServiceCoordinator,  "sharedWebServiceContext"));
    v39 = (void *)objc_claimAutoreleasedReturnValue([v38 regions]);

    v40 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    __int128 v167 = 0u;
    __int128 v168 = 0u;
    __int128 v169 = 0u;
    __int128 v170 = 0u;
    id v41 = v39;
    id v42 = [v41 countByEnumeratingWithState:&v167 objects:v177 count:16];
    if (v42)
    {
      id v43 = v42;
      uint64_t v44 = *(void *)v168;
      do
      {
        for (i = 0LL; i != v43; i = (char *)i + 1)
        {
          if (*(void *)v168 != v44) {
            objc_enumerationMutation(v41);
          }
          uint64_t v46 = *(void *)(*((void *)&v167 + 1) + 8LL * (void)i);
          v47 = (void *)objc_claimAutoreleasedReturnValue([v41 objectForKey:v46]);
          v48 = v47;
          if (v21->_hasAccounts) {
            unsigned __int8 v49 = 1;
          }
          else {
            unsigned __int8 v49 = [v47 hasAccounts];
          }
          v21->_hasAccounts = v49;
          v50 = (void *)objc_claimAutoreleasedReturnValue([v48 accountServiceURL]);
          if (v50) {
            -[NSMutableDictionary setObject:forKey:](v40, "setObject:forKey:", v50, v46);
          }
        }

        id v43 = [v41 countByEnumeratingWithState:&v167 objects:v177 count:16];
      }

      while (v43);
    }

    v51 = (NSDictionary *)-[NSMutableDictionary copy](v40, "copy");
    accountServiceURLs = v21->_accountServiceURLs;
    v21->_accountServiceURLs = v51;

    -[PDDeviceEnvironmentStore registerClient:withIdentifier:]( v21->_deviceEnvironmentStore,  "registerClient:withIdentifier:",  v21,  1LL);
    dispatch_queue_attr_t v53 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v54 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v53);
    dispatch_queue_t v55 = dispatch_queue_create("com.apple.passd.accountmanager.work", v54);
    workQueue = v21->_workQueue;
    v21->_workQueue = (OS_dispatch_queue *)v55;

    v132 = v54;
    dispatch_queue_t v57 = dispatch_queue_create("com.apple.passd.accountmanager.reply", v54);
    replyQueue = v21->_replyQueue;
    v21->_replyQueue = (OS_dispatch_queue *)v57;

    -[PDPushNotificationManager registerConsumer:](v21->_pushNotificationManager, "registerConsumer:", v21);
    -[PDAccountManager _updatePushTopics](v21, "_updatePushTopics");
    uint64_t v59 = objc_claimAutoreleasedReturnValue( +[NSHashTable pk_weakObjectsHashTableUsingPointerPersonality]( &OBJC_CLASS___NSHashTable,  "pk_weakObjectsHashTableUsingPointerPersonality"));
    observers = v21->_observers;
    v21->_observers = (NSHashTable *)v59;

    v21->_lockObservers._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v21->_payLaterMerchantProcessor, v144);
    uint64_t v61 = PKUIOnlyDemoModeEnabled(-[PDPayLaterMerchantProcessor registerObserver:](v21->_payLaterMerchantProcessor, "registerObserver:", v21));
    id obja = v41;
    v136 = v40;
    if ((v61 & 1) != 0 || PKStoreDemoModeEnabled(v61, v62))
    {
      id v166 = 0LL;
      v63 = (void *)objc_claimAutoreleasedReturnValue( -[PDAccountManager _mockCreditAccountInitialStateWithEvents:]( v21,  "_mockCreditAccountInitialStateWithEvents:",  &v166));
      id v131 = v166;
      v135 = v63;
      v64 = (void *)objc_claimAutoreleasedReturnValue([v63 associatedPassUniqueID]);
      v65 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager passWithUniqueIdentifier:]( v21->_databaseManager,  "passWithUniqueIdentifier:",  v64));
      v66 = (void *)objc_claimAutoreleasedReturnValue([v65 paymentPass]);

      v130 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager transactionSourceIdentifiersForPassUniqueIdentifier:]( v21->_databaseManager,  "transactionSourceIdentifiersForPassUniqueIdentifier:",  v64));
      v67 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager transactionsForTransactionSourceIdentifiers:withTransactionType:withTransactionSource:withBackingData:startDate:endDate:limit:]( v21->_databaseManager,  "transactionsForTransactionSourceIdentifiers:withTransactionType:withTransactionSource:withBackin gData:startDate:endDate:limit:",  0LL));
      __int128 v162 = 0u;
      __int128 v163 = 0u;
      __int128 v164 = 0u;
      __int128 v165 = 0u;
      id v145 = v67;
      id v68 = [v67 countByEnumeratingWithState:&v162 objects:v176 count:16];
      if (v68)
      {
        id v69 = v68;
        uint64_t v70 = *(void *)v163;
        do
        {
          for (j = 0LL; j != v69; j = (char *)j + 1)
          {
            if (*(void *)v163 != v70) {
              objc_enumerationMutation(v145);
            }
            uint64_t v72 = *(void *)(*((void *)&v162 + 1) + 8LL * (void)j);
            v73 = *p_databaseManager;
            v74 = (void *)objc_claimAutoreleasedReturnValue([v66 devicePrimaryPaymentApplication]);
            id v75 =  [v73 insertOrUpdatePaymentTransaction:v72 withPassUniqueIdentifier:v64 paymentApplication:v74 insertionMode:2 perform Truncation:0 insertedTransaction:0];
          }

          id v69 = [v145 countByEnumeratingWithState:&v162 objects:v176 count:16];
        }

        while (v69);
      }

      v76 = *p_databaseManager;
      v77 = (void *)objc_claimAutoreleasedReturnValue([v135 accountIdentifier]);
      v78 = (void *)objc_claimAutoreleasedReturnValue( [v76 accountEventsForAccountIdentifier:v77 altDSID:0 types:&off_100691010 startDate:0 endDate:0 orderedByDate:1 limit:0]);

      __int128 v160 = 0u;
      __int128 v161 = 0u;
      __int128 v158 = 0u;
      __int128 v159 = 0u;
      id v79 = v78;
      id v80 = [v79 countByEnumeratingWithState:&v158 objects:v175 count:16];
      if (v80)
      {
        id v81 = v80;
        uint64_t v82 = *(void *)v159;
        do
        {
          for (k = 0LL; k != v81; k = (char *)k + 1)
          {
            if (*(void *)v159 != v82) {
              objc_enumerationMutation(v79);
            }
            v84 = *p_databaseManager;
            v85 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v158 + 1) + 8 * (void)k) identifier]);
            [v84 deleteAccountEventWithIdentifier:v85];
          }

          id v81 = [v79 countByEnumeratingWithState:&v158 objects:v175 count:16];
        }

        while (v81);
      }

      databaseManager = v21->_databaseManager;
      v87 = (void *)objc_claimAutoreleasedReturnValue([v135 accountIdentifier]);
      id v88 =  -[PDDatabaseManager insertOrUpdateAccountUsers:forAccountWithIdentifier:]( databaseManager,  "insertOrUpdateAccountUsers:forAccountWithIdentifier:",  0LL,  v87);

      v89 = v21->_databaseManager;
      v90 = (void *)objc_claimAutoreleasedReturnValue([v135 accountIdentifier]);
      id v91 =  -[PDDatabaseManager replacePhysicalCards:forAccountWithIdentifier:]( v89,  "replacePhysicalCards:forAccountWithIdentifier:",  0LL,  v90);

      v155[0] = _NSConcreteStackBlock;
      v155[1] = 3221225472LL;
      v155[2] = sub_1001D1374;
      v155[3] = &unk_1006392B0;
      v156 = v21;
      id v157 = v135;
      id v92 = v135;
      -[PDAccountManager insertEvents:completion:](v156, "insertEvents:completion:", v131, v155);

      v40 = v136;
      id v41 = obja;
    }

    if (PKAppleBalanceDemoAccountEnabled())
    {
      v93 = (void *)objc_claimAutoreleasedReturnValue( +[PKAppleBalanceMockUtilities mockAppleBalanceAccount]( &OBJC_CLASS___PKAppleBalanceMockUtilities,  "mockAppleBalanceAccount"));
      v94 = v21->_databaseManager;
      v95 = (void *)objc_claimAutoreleasedReturnValue([v93 accountIdentifier]);
      id v96 =  -[PDDatabaseManager insertOrUpdateAccountUsers:forAccountWithIdentifier:]( v94,  "insertOrUpdateAccountUsers:forAccountWithIdentifier:",  0LL,  v95);

      -[PDAccountManager insertOrReplaceAccount:extended:deleteSensitiveData:completion:]( v21,  "insertOrReplaceAccount:extended:deleteSensitiveData:completion:",  v93,  1LL,  0LL,  0LL);
      id v41 = obja;
      v97 = (void *)objc_claimAutoreleasedReturnValue( +[PKAppleBalanceMockUtilities mockPromotion]( &OBJC_CLASS___PKAppleBalanceMockUtilities,  "mockPromotion"));
      v98 = (void *)objc_claimAutoreleasedReturnValue([v93 accountIdentifier]);
      -[PDAccountManager insertOrUpdateAppleBalancePromotion:accountIdentifier:completion:]( v21,  "insertOrUpdateAppleBalancePromotion:accountIdentifier:completion:",  v97,  v98,  0LL);
    }

    if (PKSavingsDemoAccountEnabled())
    {
      v99 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountManager _mockSavingsAccount](v21, "_mockSavingsAccount"));
      v100 = v21->_databaseManager;
      v101 = (void *)objc_claimAutoreleasedReturnValue([v99 accountIdentifier]);
      id v102 =  -[PDDatabaseManager insertOrUpdateAccountUsers:forAccountWithIdentifier:]( v100,  "insertOrUpdateAccountUsers:forAccountWithIdentifier:",  0LL,  v101);

      -[PDAccountManager insertOrReplaceAccount:extended:deleteSensitiveData:completion:]( v21,  "insertOrReplaceAccount:extended:deleteSensitiveData:completion:",  v99,  1LL,  0LL,  0LL);
      v103 = v21->_databaseManager;
      id v146 = v99;
      v104 = (void *)objc_claimAutoreleasedReturnValue([v99 accountIdentifier]);
      -[PDDatabaseManager deleteSavingsAccountStatementsForAccount:]( v103,  "deleteSavingsAccountStatementsForAccount:",  v104);

      v105 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      v106 = (void *)objc_claimAutoreleasedReturnValue( +[PKSavingsMockUtilities savingsAccountStatementsArray2]( &OBJC_CLASS___PKSavingsMockUtilities,  "savingsAccountStatementsArray2"));
      __int128 v151 = 0u;
      __int128 v152 = 0u;
      __int128 v153 = 0u;
      __int128 v154 = 0u;
      id v107 = [v106 countByEnumeratingWithState:&v151 objects:v174 count:16];
      if (v107)
      {
        id v108 = v107;
        uint64_t v109 = *(void *)v152;
        do
        {
          for (m = 0LL; m != v108; m = (char *)m + 1)
          {
            if (*(void *)v152 != v109) {
              objc_enumerationMutation(v106);
            }
            v111 = -[PKSavingsAccountStatement initWithDictionary:]( objc_alloc(&OBJC_CLASS___PKSavingsAccountStatement),  "initWithDictionary:",  *(void *)(*((void *)&v151 + 1) + 8LL * (void)m));
            -[NSMutableArray addObject:](v105, "addObject:", v111);
          }

          id v108 = [v106 countByEnumeratingWithState:&v151 objects:v174 count:16];
        }

        while (v108);
      }

      v112 = *p_databaseManager;
      v113 = (void *)objc_claimAutoreleasedReturnValue([v146 accountIdentifier]);
      [v112 insertOrUpdateSavingsAccountStatements:v105 forAccountIdentifier:v113];

      v114 = *p_databaseManager;
      v115 = (void *)objc_claimAutoreleasedReturnValue([v146 accountIdentifier]);
      [v114 deleteAccountTaxFormsWithoutPDFForAccount:v115];

      v116 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      v117 = (void *)objc_claimAutoreleasedReturnValue( +[PKSavingsMockUtilities savingsAccountTaxFormsArray2]( &OBJC_CLASS___PKSavingsMockUtilities,  "savingsAccountTaxFormsArray2"));
      __int128 v147 = 0u;
      __int128 v148 = 0u;
      __int128 v149 = 0u;
      __int128 v150 = 0u;
      id v118 = [v117 countByEnumeratingWithState:&v147 objects:v173 count:16];
      if (v118)
      {
        id v119 = v118;
        uint64_t v120 = *(void *)v148;
        do
        {
          for (n = 0LL; n != v119; n = (char *)n + 1)
          {
            if (*(void *)v148 != v120) {
              objc_enumerationMutation(v117);
            }
            v122 = -[PKAccountTaxForm initWithDictionary:]( objc_alloc(&OBJC_CLASS___PKAccountTaxForm),  "initWithDictionary:",  *(void *)(*((void *)&v147 + 1) + 8LL * (void)n));
            -[NSMutableArray addObject:](v116, "addObject:", v122);
          }

          id v119 = [v117 countByEnumeratingWithState:&v147 objects:v173 count:16];
        }

        while (v119);
      }

      v123 = *p_databaseManager;
      v124 = (void *)objc_claimAutoreleasedReturnValue([v146 accountIdentifier]);
      [v123 insertOrUpdateAccountTaxForms:v116 forAccountIdentifier:v124];

      v125 = (void *)objc_claimAutoreleasedReturnValue(+[PKSavingsMockUtilities transfer](&OBJC_CLASS___PKSavingsMockUtilities, "transfer"));
      v126 = *p_databaseManager;
      v172 = v125;
      v127 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v172, 1LL));
      id v128 = [v126 setTransfers:v127 forAccount:v146];

      v40 = v136;
      id v41 = obja;
    }

    else
    {
      -[PDAccountManager deleteLocalAccountWithIdentifier:completion:]( v21,  "deleteLocalAccountWithIdentifier:completion:",  @"savings-account-mock",  0LL);
    }

    id v18 = v133;
    id v17 = v134;
    id v19 = v137;
  }

  return v21;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PDAccountManager;
  -[PDAccountManager dealloc](&v3, "dealloc");
}

- (void)_paymentWebServiceContextChanged
{
  uint64_t Object = PKLogFacilityTypeGetObject(14LL);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Payment Web Service context changed in PDAccountManager",  buf,  2u);
  }

  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001D15B8;
  block[3] = &unk_100639300;
  block[4] = self;
  dispatch_async((dispatch_queue_t)workQueue, block);
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
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSHashTable allObjects](self->_observers, "allObjects"));
    os_unfair_lock_unlock(&self->_lockObservers);
    replyQueue = self->_replyQueue;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_1001D1C20;
    v8[3] = &unk_10063AC90;
    id v9 = v5;
    id v10 = v4;
    id v7 = v5;
    dispatch_async((dispatch_queue_t)replyQueue, v8);
  }
}

- (void)databaseRestored
{
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001D1D6C;
  block[3] = &unk_100639300;
  block[4] = self;
  dispatch_async((dispatch_queue_t)workQueue, block);
}

- (void)_queue_mergeAccounts:(id)a3 featureFailures:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v85 = v6;
  id v77 = [v6 mutableCopy];
  id v75 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v79 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v76 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v8 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v116 = 0u;
  __int128 v117 = 0u;
  __int128 v118 = 0u;
  __int128 v119 = 0u;
  v90 = self;
  id obj = self->_accounts;
  id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v116,  v135,  16LL);
  v84 = v7;
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v117;
    uint64_t v80 = *(void *)v117;
    uint64_t v82 = v8;
    do
    {
      v12 = 0LL;
      id v86 = v10;
      do
      {
        if (*(void *)v117 != v11) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v116 + 1) + 8LL * (void)v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "errorForFeature:", objc_msgSend(v13, "feature")));
        if (v14)
        {
          -[NSMutableArray addObject:](v8, "addObject:", v13);
        }

        else
        {
          __int128 v114 = 0u;
          __int128 v115 = 0u;
          __int128 v112 = 0u;
          __int128 v113 = 0u;
          id v15 = v85;
          id v16 = [v15 countByEnumeratingWithState:&v112 objects:v134 count:16];
          if (v16)
          {
            id v17 = v16;
            uint64_t v18 = *(void *)v113;
LABEL_10:
            uint64_t v19 = 0LL;
            while (1)
            {
              if (*(void *)v113 != v18) {
                objc_enumerationMutation(v15);
              }
              v20 = *(void **)(*((void *)&v112 + 1) + 8 * v19);
              v21 = (void *)objc_claimAutoreleasedReturnValue([v13 accountIdentifier]);
              uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v20 accountIdentifier]);
              id v23 = v21;
              id v24 = v22;
              if (v23 == v24) {
                break;
              }
              v25 = v24;
              if (v23 && v24)
              {
                unsigned __int8 v26 = [v23 isEqualToString:v24];

                if ((v26 & 1) != 0) {
                  goto LABEL_23;
                }
              }

              else
              {
              }

              if (v17 == (id)++v19)
              {
                id v17 = [v15 countByEnumeratingWithState:&v112 objects:v134 count:16];
                if (v17) {
                  goto LABEL_10;
                }
                goto LABEL_21;
              }
            }

LABEL_23:
            id v27 = v20;

            if (!v27) {
              goto LABEL_26;
            }
            [v77 removeObject:v27];
            v8 = v82;
            id v10 = v86;
            if ([v27 state] == (id)5)
            {
              -[NSMutableArray addObject:](v79, "addObject:", v13);
              goto LABEL_30;
            }

            -[NSMutableArray addObject:](v82, "addObject:", v27);
            v29 = (void *)objc_claimAutoreleasedReturnValue([v13 transactionSourceIdentifier]);
            [v27 setTransactionSourceIdentifier:v29];

            uint64_t v11 = v80;
            v14 = 0LL;
            if (([v27 isContentEqualToAccount:v13] & 1) == 0)
            {
              v133[0] = v13;
              v133[1] = v27;
              v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v133,  2LL));
              -[NSMutableArray addObject:](v76, "addObject:", v30);
            }

            id v7 = v84;
          }

          else
          {
LABEL_21:

LABEL_26:
            v8 = v82;
            id v10 = v86;
            else {
              v28 = v79;
            }
            -[NSMutableArray addObject:](v28, "addObject:", v13);
            id v27 = 0LL;
LABEL_30:
            id v7 = v84;
            uint64_t v11 = v80;
            v14 = 0LL;
          }
        }

        v12 = (char *)v12 + 1;
      }

      while (v12 != v10);
      id v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v116,  v135,  16LL);
      id v10 = v31;
    }

    while (v31);
  }

  __int128 v110 = 0u;
  __int128 v111 = 0u;
  __int128 v108 = 0u;
  __int128 v109 = 0u;
  id v32 = v77;
  id v33 = [v32 countByEnumeratingWithState:&v108 objects:v132 count:16];
  if (v33)
  {
    id v34 = v33;
    uint64_t v35 = *(void *)v109;
    do
    {
      for (i = 0LL; i != v34; i = (char *)i + 1)
      {
        if (*(void *)v109 != v35) {
          objc_enumerationMutation(v32);
        }
        v37 = *(void **)(*((void *)&v108 + 1) + 8LL * (void)i);
        if ([v37 state] != (id)5)
        {
          -[NSMutableArray addObject:](v75, "addObject:", v37);
          -[NSMutableArray addObject:](v8, "addObject:", v37);
        }
      }

      id v34 = [v32 countByEnumeratingWithState:&v108 objects:v132 count:16];
    }

    while (v34);
  }

  uint64_t v38 = objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  __int128 v104 = 0u;
  __int128 v105 = 0u;
  __int128 v106 = 0u;
  __int128 v107 = 0u;
  v39 = v8;
  id v40 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v39,  "countByEnumeratingWithState:objects:count:",  &v104,  v131,  16LL);
  if (v40)
  {
    id v41 = v40;
    uint64_t v42 = *(void *)v105;
    do
    {
      for (j = 0LL; j != v41; j = (char *)j + 1)
      {
        if (*(void *)v105 != v42) {
          objc_enumerationMutation(v39);
        }
        [*(id *)(*((void *)&v104 + 1) + 8 * (void)j) setLastUpdated:v38];
      }

      id v41 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v39,  "countByEnumeratingWithState:objects:count:",  &v104,  v131,  16LL);
    }

    while (v41);
  }

  id v81 = (void *)v38;
  v83 = v32;

  v78 = v39;
  uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue(-[PDDatabaseManager setAccounts:](v90->_databaseManager, "setAccounts:", v39));
  uint64_t v45 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](&OBJC_CLASS___NSMutableArray, "arrayWithArray:", v44));
  accounts = v90->_accounts;
  v90->_accounts = (NSMutableArray *)v45;

  __int128 v102 = 0u;
  __int128 v103 = 0u;
  __int128 v100 = 0u;
  __int128 v101 = 0u;
  v87 = v75;
  id v91 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v87,  "countByEnumeratingWithState:objects:count:",  &v100,  v130,  16LL);
  if (v91)
  {
    id obja = *(id *)v101;
    do
    {
      for (k = 0LL; k != v91; k = (char *)k + 1)
      {
        if (*(id *)v101 != obja) {
          objc_enumerationMutation(v87);
        }
        v48 = *(void **)(*((void *)&v100 + 1) + 8LL * (void)k);
        __int128 v96 = 0u;
        __int128 v97 = 0u;
        __int128 v98 = 0u;
        __int128 v99 = 0u;
        unsigned __int8 v49 = v90->_accounts;
        id v50 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v49,  "countByEnumeratingWithState:objects:count:",  &v96,  v129,  16LL);
        if (v50)
        {
          id v51 = v50;
          uint64_t v52 = *(void *)v97;
          do
          {
            for (m = 0LL; m != v51; m = (char *)m + 1)
            {
              if (*(void *)v97 != v52) {
                objc_enumerationMutation(v49);
              }
              v54 = *(void **)(*((void *)&v96 + 1) + 8LL * (void)m);
              dispatch_queue_t v55 = (void *)objc_claimAutoreleasedReturnValue([v54 accountIdentifier]);
              v56 = (void *)objc_claimAutoreleasedReturnValue([v48 accountIdentifier]);
              id v57 = v55;
              id v58 = v56;
              if (v57 == v58)
              {

LABEL_73:
                id v57 = (id)objc_claimAutoreleasedReturnValue([v54 transactionSourceIdentifier]);
                [v48 setTransactionSourceIdentifier:v57];
LABEL_74:

                continue;
              }

              uint64_t v59 = v58;
              if (v57) {
                BOOL v60 = v58 == 0LL;
              }
              else {
                BOOL v60 = 1;
              }
              if (v60)
              {

                goto LABEL_74;
              }

              unsigned __int8 v61 = [v57 isEqualToString:v58];

              if ((v61 & 1) != 0) {
                goto LABEL_73;
              }
            }

            id v51 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v49,  "countByEnumeratingWithState:objects:count:",  &v96,  v129,  16LL);
          }

          while (v51);
        }
      }

      id v91 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v87,  "countByEnumeratingWithState:objects:count:",  &v100,  v130,  16LL);
    }

    while (v91);
  }

  uint64_t Object = PKLogFacilityTypeGetObject(14LL);
  v63 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
  {
    id v64 = -[NSMutableArray count](v90->_accounts, "count");
    id v65 = -[NSMutableArray count](v87, "count");
    id v66 = -[NSMutableArray count](v79, "count");
    id v67 = -[NSMutableArray count](v76, "count");
    *(_DWORD *)buf = 134218752;
    id v122 = v64;
    __int16 v123 = 2048;
    id v124 = v65;
    __int16 v125 = 2048;
    id v126 = v66;
    __int16 v127 = 2048;
    id v128 = v67;
    _os_log_impl( (void *)&_mh_execute_header,  v63,  OS_LOG_TYPE_DEFAULT,  "Accounts merged, total accounts: %lu, added: %lu, deleted: %lu, changed: %lu",  buf,  0x2Au);
  }

  __int128 v94 = 0u;
  __int128 v95 = 0u;
  __int128 v92 = 0u;
  __int128 v93 = 0u;
  id v68 = v90->_accounts;
  id v69 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v68,  "countByEnumeratingWithState:objects:count:",  &v92,  v120,  16LL);
  if (v69)
  {
    id v70 = v69;
    uint64_t v71 = *(void *)v93;
    do
    {
      for (n = 0LL; n != v70; n = (char *)n + 1)
      {
        if (*(void *)v93 != v71) {
          objc_enumerationMutation(v68);
        }
        v73 = *(void **)(*((void *)&v92 + 1) + 8LL * (void)n);
        if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
        {
          v74 = (void *)objc_claimAutoreleasedReturnValue([v73 accountIdentifier]);
          *(_DWORD *)buf = 138412546;
          id v122 = v74;
          __int16 v123 = 2112;
          id v124 = v73;
          _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEFAULT, "Account %@: %@", buf, 0x16u);
        }
      }

      id v70 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v68,  "countByEnumeratingWithState:objects:count:",  &v92,  v120,  16LL);
    }

    while (v70);
  }

  -[PDAccountManager _processAddedAccounts:](v90, "_processAddedAccounts:", v87);
  -[PDAccountManager _processDeletedAccounts:](v90, "_processDeletedAccounts:", v79);
  -[PDAccountManager _processChangedAccounts:](v90, "_processChangedAccounts:", v76);
  if (-[NSMutableArray count](v87, "count")
    || -[NSMutableArray count](v79, "count")
    || -[NSMutableArray count](v76, "count"))
  {
    -[PDAccountManager postAccountChangedNotification](v90, "postAccountChangedNotification");
  }
}

- (void)mergeAccounts:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001D2868;
  block[3] = &unk_100639AF0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)workQueue, block);
}

- (void)insertOrReplaceAccount:(id)a3 extended:(BOOL)a4 deleteSensitiveData:(BOOL)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  if (v10)
  {
    workQueue = self->_workQueue;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1001D29C4;
    v13[3] = &unk_10064B210;
    v13[4] = self;
    id v14 = v10;
    BOOL v16 = a4;
    BOOL v17 = a5;
    id v15 = v11;
    dispatch_async((dispatch_queue_t)workQueue, v13);
  }
}

- (id)_queue_insertOrReplaceAccount:(id)a3 extended:(BOOL)a4 deleteSensitiveData:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 accountIdentifier]);
  unint64_t v10 = -[PDAccountManager _queueIndexOfAccountWithIdentifier:](self, "_queueIndexOfAccountWithIdentifier:", v9);

  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v11 = (id)objc_claimAutoreleasedReturnValue(-[PDDatabaseManager insertOrUpdateAccount:](self->_databaseManager, "insertOrUpdateAccount:", v8));
    if (!v11)
    {
      uint64_t Object = PKLogFacilityTypeGetObject(14LL);
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v8 accountIdentifier]);
        *(_DWORD *)buf = 138412290;
        uint64_t v38 = v14;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Failed to save account %@ in database.",  buf,  0xCu);
      }

      id v11 = v8;
    }

    -[NSMutableArray addObject:](self->_accounts, "addObject:", v11);
    id v36 = v11;
    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v36, 1LL));
    -[PDAccountManager _processAddedAccounts:](self, "_processAddedAccounts:", v15);
    BOOL v16 = 0LL;
LABEL_23:

    -[PDAccountManager postAccountChangedNotification](self, "postAccountChangedNotification");
    goto LABEL_24;
  }

  BOOL v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_accounts, "objectAtIndex:", v10));
  if (!a4 && [v8 supportsExtendedFetch])
  {
    BOOL v17 = (void *)objc_claimAutoreleasedReturnValue([v8 creditDetails]);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v16 creditDetails]);
    uint64_t v19 = v18;
    if (v17 && v18)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue([v18 virtualCards]);
      [v17 setVirtualCards:v20];

      v21 = (void *)objc_claimAutoreleasedReturnValue([v19 installmentPlans]);
      [v17 setInstallmentPlans:v21];

      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v17 accountSummary]);
      id v23 = (void *)objc_claimAutoreleasedReturnValue([v19 accountSummary]);
      objc_msgSend(v22, "setAutoPayEnabled:", objc_msgSend(v23, "autoPayEnabled"));

      id v24 = (void *)objc_claimAutoreleasedReturnValue([v17 accountSummary]);
      v25 = (void *)objc_claimAutoreleasedReturnValue([v19 accountSummary]);
      unsigned __int8 v26 = (void *)objc_claimAutoreleasedReturnValue([v25 currentStatement]);
      [v24 setCurrentStatement:v26];
    }
  }

  if (([v16 isEqual:v8] & 1) == 0)
  {
    databaseManager = self->_databaseManager;
    if (v5) {
      uint64_t v28 = objc_claimAutoreleasedReturnValue( -[PDDatabaseManager deleteVirtualCardEncryptedDataForAccount:]( databaseManager,  "deleteVirtualCardEncryptedDataForAccount:",  v8));
    }
    else {
      uint64_t v28 = objc_claimAutoreleasedReturnValue(-[PDDatabaseManager insertOrUpdateAccount:](databaseManager, "insertOrUpdateAccount:", v8));
    }
    id v11 = (id)v28;
    if (!v28)
    {
      uint64_t v29 = PKLogFacilityTypeGetObject(14LL);
      v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        id v31 = (void *)objc_claimAutoreleasedReturnValue([v8 accountIdentifier]);
        *(_DWORD *)buf = 138412290;
        uint64_t v38 = v31;
        _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "Failed to save account %@ in database.",  buf,  0xCu);
      }

      id v11 = v8;
    }

    -[NSMutableArray replaceObjectAtIndex:withObject:](self->_accounts, "replaceObjectAtIndex:withObject:", v10, v11);
    v34[0] = v16;
    v34[1] = v11;
    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v34, 2LL));
    uint64_t v35 = v15;
    id v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v35, 1LL));
    -[PDAccountManager _processChangedAccounts:](self, "_processChangedAccounts:", v32);

    goto LABEL_23;
  }

  id v11 = 0LL;
LABEL_24:

  return v11;
}

- (void)deleteLocalAccountWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    workQueue = self->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001D2EBC;
    block[3] = &unk_100639AF0;
    block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async((dispatch_queue_t)workQueue, block);
  }
}

- (void)insertOrUpdateLocalAccount:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_1001D30E0;
    v9[3] = &unk_10063C6A8;
    id v11 = v7;
    v9[4] = self;
    id v10 = v6;
    -[PDAccountManager insertOrReplaceAccount:extended:deleteSensitiveData:completion:]( self,  "insertOrReplaceAccount:extended:deleteSensitiveData:completion:",  v10,  1LL,  0LL,  v9);
  }

  else if (v7)
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0LL);
  }
}

- (void)insertOrUpdateLocalFinancingPlans:(id)a3 accountIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 count])
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1001D32EC;
    v11[3] = &unk_10064B238;
    v11[4] = self;
    id v12 = v10;
    -[PDAccountManager insertOrUpdateLocalAccountFinancingPlans:forAccountWithIdentifier:completion:]( self,  "insertOrUpdateLocalAccountFinancingPlans:forAccountWithIdentifier:completion:",  v8,  v9,  v11);
  }

  else if (v10)
  {
    (*((void (**)(id, void))v10 + 2))(v10, 0LL);
  }
}

- (void)noteAccountDeletionWithCompletion:(id)a3
{
  id v7 = a3;
  +[PKVirtualCard deleteAllLocalKeychainVirtualCards](&OBJC_CLASS___PKVirtualCard, "deleteAllLocalKeychainVirtualCards");
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(-32768LL, 0LL);
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
  PKForceRefreshBAACertificateAndKey(v5, &stru_10064B258);

  id v6 =  +[PKPaymentSession startApplePayTrustSessionWithCompletion:]( &OBJC_CLASS___PKPaymentSession,  "startApplePayTrustSessionWithCompletion:",  &stru_10064B298);
  -[PDAccountManager deleteAccountsWithCompletion:](self, "deleteAccountsWithCompletion:", v7);
}

- (void)deleteAccountsWithCompletion:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001D35D0;
  v7[3] = &unk_10063AC90;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)workQueue, v7);
}

- (void)updateMockAccountWithAccount:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = PKUIOnlyDemoModeEnabled(v7);
  if ((v8 & 1) != 0 || PKStoreDemoModeEnabled(v8, v9))
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_1001D3720;
    v10[3] = &unk_10063C6A8;
    id v12 = v7;
    v10[4] = self;
    id v11 = v6;
    -[PDAccountManager insertOrReplaceAccount:extended:deleteSensitiveData:completion:]( self,  "insertOrReplaceAccount:extended:deleteSensitiveData:completion:",  v11,  1LL,  0LL,  v10);
  }
}

- (void)_queue_deleteAccounts
{
  id v3 = -[NSMutableArray copy](self->_accounts, "copy");
  -[PDDatabaseManager deleteAllAccounts](self->_databaseManager, "deleteAllAccounts");
  -[NSMutableArray removeAllObjects](self->_accounts, "removeAllObjects");
  -[PDAccountManager postAccountChangedNotification](self, "postAccountChangedNotification");
  -[PDAccountManager _processDeletedAccounts:](self, "_processDeletedAccounts:", v3);
}

- (void)_processAddedAccounts:(id)a3
{
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472LL;
  v38[2] = sub_1001D3BDC;
  v38[3] = &unk_10064B2C0;
  id v4 = a3;
  id v39 = v4;
  id v40 = self;
  -[PDAccountManager _accessObserversWithHandler:](self, "_accessObserversWithHandler:", v38);
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  id obj = v4;
  id v5 = [obj countByEnumeratingWithState:&v34 objects:v41 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v35;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v35 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v34 + 1) + 8LL * (void)i);
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 accountIdentifier]);
        v32[0] = _NSConcreteStackBlock;
        v32[1] = 3221225472LL;
        v32[2] = sub_1001D3D08;
        v32[3] = &unk_10064B2E8;
        id v11 = v10;
        id v33 = v11;
        -[PDAccountManager userInfoForAccountIdentifier:forceFetch:completion:]( self,  "userInfoForAccountIdentifier:forceFetch:completion:",  v11,  0LL,  v32);
        v30[0] = _NSConcreteStackBlock;
        v30[1] = 3221225472LL;
        v30[2] = sub_1001D3DC8;
        v30[3] = &unk_10064B310;
        id v12 = v11;
        id v31 = v12;
        -[PDAccountManager updateScheduledPaymentsWithAccount:completion:]( self,  "updateScheduledPaymentsWithAccount:completion:",  v9,  v30);
        v28[0] = _NSConcreteStackBlock;
        v28[1] = 3221225472LL;
        v28[2] = sub_1001D3E88;
        v28[3] = &unk_10064B338;
        id v13 = v12;
        id v29 = v13;
        -[PDAccountManager updatePhysicalCardsForAccountWithIdentifier:force:completion:]( self,  "updatePhysicalCardsForAccountWithIdentifier:force:completion:",  v13,  0LL,  v28);
        if ([v9 isSharedAccount])
        {
          v26[0] = _NSConcreteStackBlock;
          v26[1] = 3221225472LL;
          v26[2] = sub_1001D3F48;
          v26[3] = &unk_10064B360;
          id v14 = v13;
          id v27 = v14;
          -[PDAccountManager updateSharedAccountCloudStoreWithAccountIdentifier:completion:]( self,  "updateSharedAccountCloudStoreWithAccountIdentifier:completion:",  v14,  v26);
          v24[0] = _NSConcreteStackBlock;
          v24[1] = 3221225472LL;
          v24[2] = sub_1001D4008;
          v24[3] = &unk_10064B338;
          id v25 = v14;
          -[PDAccountManager updateAccountUsersForAccountWithIdentifier:completion:]( self,  "updateAccountUsersForAccountWithIdentifier:completion:",  v25,  v24);
        }

        id v15 = [v9 feature];
        if (v15 == (id)5)
        {
          -[PDAccountManager _cleanupSavingsAccountPreferences:](self, "_cleanupSavingsAccountPreferences:", v9);
        }

        else if (v15 == (id)2)
        {
          if ([v9 showCardPromotions])
          {
            v22[0] = _NSConcreteStackBlock;
            v22[1] = 3221225472LL;
            v22[2] = sub_1001D40C8;
            v22[3] = &unk_10064B310;
            id v23 = v13;
            -[PDAccountManager updateAccountPromotionsForAccountWithIdentifier:completion:]( self,  "updateAccountPromotionsForAccountWithIdentifier:completion:",  v23,  v22);
          }

          if ([v9 showEnhancedMerchants])
          {
            v20[0] = _NSConcreteStackBlock;
            v20[1] = 3221225472LL;
            v20[2] = sub_1001D4188;
            v20[3] = &unk_10064B310;
            id v21 = v13;
            -[PDAccountManager updateAccountEnhancedMerchantsForAccountWithIdentifier:completion:]( self,  "updateAccountEnhancedMerchantsForAccountWithIdentifier:completion:",  v21,  v20);
          }
        }

        BOOL v16 = (void *)objc_claimAutoreleasedReturnValue([v9 creditDetails]);
        BOOL v17 = (void *)objc_claimAutoreleasedReturnValue([v16 accountSummary]);
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 currentStatement]);

        if (v18) {
          -[PDAccountManager _publishStatementsChangedForAccountIdentifier:]( self,  "_publishStatementsChangedForAccountIdentifier:",  v13);
        }
      }

      id v6 = [obj countByEnumeratingWithState:&v34 objects:v41 count:16];
    }

    while (v6);
  }

  if ([obj count]) {
    -[PDAccountManager _updatePushTopics](self, "_updatePushTopics");
  }
}

- (void)_processChangedAccounts:(id)a3
{
  v139[0] = _NSConcreteStackBlock;
  v139[1] = 3221225472LL;
  v139[2] = sub_1001D4DDC;
  v139[3] = &unk_10064B2C0;
  id v4 = a3;
  id v140 = v4;
  id v141 = self;
  __int128 v106 = self;
  -[PDAccountManager _accessObserversWithHandler:](self, "_accessObserversWithHandler:", v139);
  __int128 v137 = 0u;
  __int128 v138 = 0u;
  __int128 v135 = 0u;
  __int128 v136 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v135 objects:v148 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v136;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v136 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v135 + 1) + 8LL * (void)i);
        if ([v10 count] == (id)2)
        {
          id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectAtIndexedSubscript:0]);
          id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 objectAtIndexedSubscript:1]);
          id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 creditDetails]);
          id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 accountSummary]);
          id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 currentStatement]);

          BOOL v16 = (void *)objc_claimAutoreleasedReturnValue([v12 creditDetails]);
          BOOL v17 = (void *)objc_claimAutoreleasedReturnValue([v16 accountSummary]);
          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 currentStatement]);

          if ((PKEqualObjects(v15, v18) & 1) == 0)
          {
            uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 accountIdentifier]);
            -[PDAccountManager _publishStatementsChangedForAccountIdentifier:]( v106,  "_publishStatementsChangedForAccountIdentifier:",  v19);
          }
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v135 objects:v148 count:16];
    }

    while (v7);
  }

  __int128 v133 = 0u;
  __int128 v134 = 0u;
  __int128 v131 = 0u;
  __int128 v132 = 0u;
  id obj = v5;
  id v20 = [obj countByEnumeratingWithState:&v131 objects:v147 count:16];
  if (v20)
  {
    id v22 = v20;
    uint64_t v23 = *(void *)v132;
    uint64_t v95 = PKAccountVirtualCardIdentifierKey;
    *(void *)&__int128 v21 = 138412290LL;
    __int128 v94 = v21;
    uint64_t v96 = *(void *)v132;
    do
    {
      id v24 = 0LL;
      id v97 = v22;
      do
      {
        if (*(void *)v132 != v23) {
          objc_enumerationMutation(obj);
        }
        id v25 = *(void **)(*((void *)&v131 + 1) + 8LL * (void)v24);
        if (objc_msgSend(v25, "count", v94) == (id)2)
        {
          unsigned __int8 v26 = (void *)objc_claimAutoreleasedReturnValue([v25 objectAtIndexedSubscript:0]);
          id v27 = (void *)objc_claimAutoreleasedReturnValue([v25 objectAtIndexedSubscript:1]);
          databaseManager = v106->_databaseManager;
          id v29 = (void *)objc_claimAutoreleasedReturnValue([v27 associatedPassUniqueID]);
          -[PDDatabaseManager recomputeCategoryVisualizationMagnitudesForPassUniqueID:withStyle:]( databaseManager,  "recomputeCategoryVisualizationMagnitudesForPassUniqueID:withStyle:",  v29,  0LL);

          v30 = (void *)objc_claimAutoreleasedReturnValue([v27 creditDetails]);
          id v31 = (void *)objc_claimAutoreleasedReturnValue([v30 virtualCards]);

          __int128 v107 = v26;
          id v32 = (void *)objc_claimAutoreleasedReturnValue([v26 creditDetails]);
          id v33 = (void *)objc_claimAutoreleasedReturnValue([v32 virtualCards]);

          __int128 v34 = (void *)objc_claimAutoreleasedReturnValue([v31 valueForKey:v95]);
          __int128 v35 = (void *)objc_claimAutoreleasedReturnValue([v33 valueForKey:v95]);
          __int128 v101 = v33;
          __int128 v102 = v24;
          __int128 v105 = v27;
          __int128 v100 = v35;
          if (PKAccountStateIsTerminal([v27 state])
            && (PKAccountStateIsTerminal([v107 state]) & 1) == 0)
          {
            __int128 v129 = 0u;
            __int128 v130 = 0u;
            __int128 v127 = 0u;
            __int128 v128 = 0u;
            id v84 = v33;
            id v85 = [v84 countByEnumeratingWithState:&v127 objects:v146 count:16];
            if (v85)
            {
              id v86 = v85;
              uint64_t v87 = *(void *)v128;
              do
              {
                for (j = 0LL; j != v86; j = (char *)j + 1)
                {
                  if (*(void *)v128 != v87) {
                    objc_enumerationMutation(v84);
                  }
                  v89 = *(void **)(*((void *)&v127 + 1) + 8LL * (void)j);
                  v90 = (void *)objc_claimAutoreleasedReturnValue([v89 keychainVirtualCard]);

                  if (v90)
                  {
                    uint64_t Object = PKLogFacilityTypeGetObject(14LL);
                    __int128 v92 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
                    if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl( (void *)&_mh_execute_header,  v92,  OS_LOG_TYPE_DEFAULT,  "Account in terminal state: removing virtual card from Keychain",  buf,  2u);
                    }

                    [v89 deleteKeychainVirtualCard];
                  }
                }

                id v86 = [v84 countByEnumeratingWithState:&v127 objects:v146 count:16];
              }

              while (v86);
            }

            dispatch_queue_t v55 = v105;
            if ([v105 feature] == (id)5)
            {
              -[PDAccountManager _cleanupSavingsAccountPreferences:](v106, "_cleanupSavingsAccountPreferences:", v105);
              PKSavingsSetHasDismissedClosedAccountMessage(2LL);
            }
          }

          else
          {
            if ([v35 isEqualToSet:v34])
            {
              __int128 v121 = 0u;
              __int128 v122 = 0u;
              __int128 v119 = 0u;
              __int128 v120 = 0u;
              id v36 = v33;
              id v37 = [v36 countByEnumeratingWithState:&v119 objects:v144 count:16];
              if (v37)
              {
                id v38 = v37;
                uint64_t v39 = *(void *)v120;
                do
                {
                  for (k = 0LL; k != v38; k = (char *)k + 1)
                  {
                    if (*(void *)v120 != v39) {
                      objc_enumerationMutation(v36);
                    }
                    id v41 = *(void **)(*((void *)&v119 + 1) + 8LL * (void)k);
                    v118[0] = _NSConcreteStackBlock;
                    v118[1] = 3221225472LL;
                    v118[2] = sub_1001D4F4C;
                    v118[3] = &unk_10064B388;
                    v118[4] = v41;
                    uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "pk_anyObjectPassingTest:", v118));
                    if ([v41 hasSensitiveCredentials])
                    {
                      [v42 supportsLocalStorage];
                    }

                    else
                    {
                      unsigned __int8 v43 = [v42 hasSensitiveCredentials];
                      if ([v42 supportsLocalStorage] && (v43 & 1) == 0)
                      {
                        uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue([v41 identifier]);
                        uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue([v107 accountIdentifier]);
                        -[PDAccountManager performVirtualCardAction:forVirtualCardIdentifier:forAccountIdentifier:completion:]( v106,  "performVirtualCardAction:forVirtualCardIdentifier:forAccountIdentifier:completion:",  1LL,  v44,  v45,  &stru_10064B3C8);
                      }
                    }
                  }

                  id v38 = [v36 countByEnumeratingWithState:&v119 objects:v144 count:16];
                }

                while (v38);
              }
            }

            else
            {
              uint64_t v46 = PKLogFacilityTypeGetObject(14LL);
              v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
              if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_DEFAULT,  "Reconciling deletion of virtual cards in keychain",  buf,  2u);
              }

              __int128 v125 = 0u;
              __int128 v126 = 0u;
              __int128 v123 = 0u;
              __int128 v124 = 0u;
              id v36 = v33;
              id v48 = [v36 countByEnumeratingWithState:&v123 objects:v145 count:16];
              if (v48)
              {
                id v49 = v48;
                uint64_t v50 = *(void *)v124;
                do
                {
                  for (m = 0LL; m != v49; m = (char *)m + 1)
                  {
                    if (*(void *)v124 != v50) {
                      objc_enumerationMutation(v36);
                    }
                    uint64_t v52 = *(void **)(*((void *)&v123 + 1) + 8LL * (void)m);
                    dispatch_queue_attr_t v53 = (void *)objc_claimAutoreleasedReturnValue([v52 identifier]);
                    if ([v34 containsObject:v53])
                    {
                    }

                    else
                    {
                      v54 = (void *)objc_claimAutoreleasedReturnValue([v52 keychainVirtualCard]);

                      if (v54) {
                        [v52 deleteKeychainVirtualCard];
                      }
                    }
                  }

                  id v49 = [v36 countByEnumeratingWithState:&v123 objects:v145 count:16];
                }

                while (v49);
              }
            }

            dispatch_queue_t v55 = v105;
          }

          v56 = (void *)objc_claimAutoreleasedReturnValue([v107 creditDetails]);
          id v57 = (void *)objc_claimAutoreleasedReturnValue([v55 creditDetails]);
          id v58 = [v107 state];
          id v103 = [v55 state];
          uint64_t v59 = (void *)objc_claimAutoreleasedReturnValue([v56 cardBalance]);
          BOOL v60 = (void *)objc_claimAutoreleasedReturnValue([v57 cardBalance]);
          unsigned int v99 = [v59 isEqual:v60];

          __int128 v104 = v56;
          unsigned __int8 v61 = (void *)objc_claimAutoreleasedReturnValue([v56 accountSummary]);
          uint64_t v62 = (void *)objc_claimAutoreleasedReturnValue([v61 creditLimit]);
          v63 = (void *)objc_claimAutoreleasedReturnValue([v57 accountSummary]);
          id v64 = (void *)objc_claimAutoreleasedReturnValue([v63 creditLimit]);
          unsigned int v65 = [v62 isEqual:v64];

          id v66 = v58;
          if (!v99 || !v65 || v58 != v103)
          {
            id v67 = @"State Changed";
            if (v58 == v103) {
              id v67 = 0LL;
            }
            if (!v65) {
              id v67 = @"Limit Changed";
            }
            if (v99) {
              id v68 = v67;
            }
            else {
              id v68 = @"Balance Changed";
            }
            id v69 = PDUtilityQueue();
            id v70 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v69);
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472LL;
            block[2] = sub_1001D5048;
            block[3] = &unk_100639300;
            __int128 v117 = (__CFString *)v68;
            dispatch_async(v70, block);
          }

          uint64_t v71 = (void *)objc_claimAutoreleasedReturnValue([v104 accountSummary]);
          unsigned int v72 = [v71 recoveryPaymentPlansSupported];

          v73 = (void *)objc_claimAutoreleasedReturnValue([v57 accountSummary]);
          unsigned int v74 = [v73 recoveryPaymentPlansSupported];

          int v75 = v72 ^ 1;
          uint64_t v23 = v96;
          id v24 = v102;
          if (((v72 ^ 1) & v74 & 1) != 0 || v66 != v103)
          {
            v76 = (void *)objc_claimAutoreleasedReturnValue([v105 accountIdentifier]);
            v114[0] = _NSConcreteStackBlock;
            v114[1] = 3221225472LL;
            v114[2] = sub_1001D506C;
            v114[3] = &unk_10064B310;
            id v115 = v105;
            -[PDAccountManager _updateCreditRecoveryPaymentPlansForAccountIdentifier:force:completion:]( v106,  "_updateCreditRecoveryPaymentPlansForAccountIdentifier:force:completion:",  v76,  1LL,  v114);
          }

          if (((v75 | v74) & 1) == 0)
          {
            v112[0] = _NSConcreteStackBlock;
            v112[1] = 3221225472LL;
            v112[2] = sub_1001D514C;
            v112[3] = &unk_10064B2C0;
            v112[4] = v106;
            id v113 = v105;
            -[PDAccountManager _accessObserversWithHandler:](v106, "_accessObserversWithHandler:", v112);
          }

          unsigned __int8 v77 = [v107 isSharedAccount];
          unsigned int v78 = [v105 isSharedAccount];
          id v22 = v97;
          if ((v77 & 1) == 0 && v78)
          {
            id v79 = (void *)objc_claimAutoreleasedReturnValue([v105 accountIdentifier]);
            uint64_t v80 = PKLogFacilityTypeGetObject(14LL);
            id v81 = (os_log_s *)objc_claimAutoreleasedReturnValue(v80);
            if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v94;
              id v143 = v79;
              _os_log_impl( (void *)&_mh_execute_header,  v81,  OS_LOG_TYPE_DEFAULT,  "Updating shared account cloud store for account %@ since it just became a shared account",  buf,  0xCu);
            }

            v110[0] = _NSConcreteStackBlock;
            v110[1] = 3221225472LL;
            v110[2] = sub_1001D51B0;
            v110[3] = &unk_10064B360;
            id v82 = v79;
            id v111 = v82;
            -[PDAccountManager updateSharedAccountCloudStoreWithAccountIdentifier:completion:]( v106,  "updateSharedAccountCloudStoreWithAccountIdentifier:completion:",  v82,  v110);
            if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v94;
              id v143 = v82;
              _os_log_impl( (void *)&_mh_execute_header,  v81,  OS_LOG_TYPE_DEFAULT,  "Updating account users of account %@ since it just became a shared account",  buf,  0xCu);
            }

            v108[0] = _NSConcreteStackBlock;
            v108[1] = 3221225472LL;
            v108[2] = sub_1001D5270;
            v108[3] = &unk_10064B338;
            id v109 = v82;
            id v83 = v82;
            -[PDAccountManager updateAccountUsersForAccountWithIdentifier:completion:]( v106,  "updateAccountUsersForAccountWithIdentifier:completion:",  v83,  v108);
          }
        }

        id v24 = (char *)v24 + 1;
      }

      while (v24 != v22);
      id v93 = [obj countByEnumeratingWithState:&v131 objects:v147 count:16];
      id v22 = v93;
    }

    while (v93);
  }

  if ([obj count]) {
    -[PDAccountManager _updatePushTopics](v106, "_updatePushTopics");
  }
}

- (void)_processDeletedAccounts:(id)a3
{
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_1001D5500;
  v19[3] = &unk_10064B2C0;
  id v4 = a3;
  id v20 = v4;
  __int128 v21 = self;
  -[PDAccountManager _accessObserversWithHandler:](self, "_accessObserversWithHandler:", v19);
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v22 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        if (objc_msgSend(v10, "feature", (void)v15) == (id)5) {
          -[PDAccountManager _cleanupSavingsAccountPreferences:](self, "_cleanupSavingsAccountPreferences:", 0LL);
        }
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 creditDetails]);
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 accountSummary]);
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 currentStatement]);

        if (v13)
        {
          id v14 = (void *)objc_claimAutoreleasedReturnValue([v10 accountIdentifier]);
          -[PDAccountManager _publishStatementsChangedForAccountIdentifier:]( self,  "_publishStatementsChangedForAccountIdentifier:",  v14);
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v15 objects:v22 count:16];
    }

    while (v7);
  }

  if ([v5 count]) {
    -[PDAccountManager _updatePushTopics](self, "_updatePushTopics");
  }
}

- (void)dailyCashNotificationForStartDate:(id)a3 endDate:(id)a4 accountIdentifier:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = v13;
  if (v13)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_1001D5720;
    v15[3] = &unk_10064B418;
    v15[4] = self;
    id v19 = v13;
    id v16 = v10;
    id v17 = v11;
    id v18 = v12;
    -[PDAccountManager accountWithIdentifier:completion:](self, "accountWithIdentifier:completion:", v18, v15);
  }
}

- (id)_promoRewardsMerchantNamesFromDate:(id)a3 toDate:(id)a4 accountIdentifier:(id)a5 altDSID:(id)a6 rewardPercentage:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  uint64_t v50 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  uint64_t v15 = objc_claimAutoreleasedReturnValue(+[NSDecimalNumber zero](&OBJC_CLASS___NSDecimalNumber, "zero"));
  context = objc_autoreleasePoolPush();
  id v41 = v14;
  unsigned __int8 v43 = v12;
  uint64_t v44 = v11;
  id v16 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager accountEventsForAccountIdentifier:altDSID:types:startDate:endDate:orderedByDate:limit:]( self->_databaseManager,  "accountEventsForAccountIdentifier:altDSID:types:startDate:endDate:orderedByDate:limit:",  v13,  v14,  &off_100691028,  v11,  v12,  1LL,  0LL));
  __int128 v60 = 0u;
  __int128 v61 = 0u;
  __int128 v62 = 0u;
  __int128 v63 = 0u;
  id obj = v16;
  id v47 = [v16 countByEnumeratingWithState:&v60 objects:v65 count:16];
  id v17 = 0LL;
  if (!v47)
  {
    id v18 = (void *)v15;
    goto LABEL_33;
  }

  uint64_t v46 = *(void *)v61;
  id v51 = self;
  id v52 = v13;
  id v18 = (void *)v15;
  do
  {
    uint64_t v19 = 0LL;
    do
    {
      if (*(void *)v61 != v46) {
        objc_enumerationMutation(obj);
      }
      uint64_t v49 = v19;
      v54 = *(void **)(*((void *)&v60 + 1) + 8 * v19);
      id v20 = (void *)objc_claimAutoreleasedReturnValue([v54 items]);
      __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v20 anyObject]);

      __int128 v58 = 0u;
      __int128 v59 = 0u;
      __int128 v56 = 0u;
      __int128 v57 = 0u;
      id v48 = v21;
      id v55 = (id)objc_claimAutoreleasedReturnValue([v21 transactionIdentifiers]);
      id v22 = [v55 countByEnumeratingWithState:&v56 objects:v64 count:16];
      if (v22)
      {
        id v23 = v22;
        uint64_t v24 = *(void *)v57;
        uint64_t v53 = *(void *)v57;
        do
        {
          for (i = 0LL; i != v23; i = (char *)i + 1)
          {
            if (*(void *)v57 != v24) {
              objc_enumerationMutation(v55);
            }
            unsigned __int8 v26 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager transactionWithServiceIdentifier:accountIdentifier:accountType:]( self->_databaseManager,  "transactionWithServiceIdentifier:accountIdentifier:accountType:",  *(void *)(*((void *)&v56 + 1) + 8LL * (void)i),  v13,  2LL));
            id v27 = v26;
            if (v26)
            {
              uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v26 rewards]);
              if (([v28 containsItemOfType:5] & 1) != 0
                || [v28 containsItemOfType:1])
              {
                id v29 = (void *)objc_claimAutoreleasedReturnValue([v54 date]);
                v30 = v29;
                if (!v17 || [v29 compare:v17] == (id)1)
                {
                  id v31 = v30;

                  id v17 = v31;
                }

                id v32 = (void *)objc_claimAutoreleasedReturnValue([v28 totalEligibleValueForUnit:1]);
                id v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSDecimalNumber zero](&OBJC_CLASS___NSDecimalNumber, "zero"));

                if (v18 == v33)
                {
                  id v34 = v32;
LABEL_21:
                  id v35 = v34;
                }

                else
                {
                  if (v18 != v32)
                  {
                    id v34 = (id)objc_claimAutoreleasedReturnValue(+[NSDecimalNumber notANumber](&OBJC_CLASS___NSDecimalNumber, "notANumber"));
                    goto LABEL_21;
                  }

                  id v35 = v18;
                }

                id v36 = (void *)objc_claimAutoreleasedReturnValue([v27 merchant]);
                id v37 = (void *)objc_claimAutoreleasedReturnValue([v36 displayName]);

                if (v37) {
                  -[NSMutableSet addObject:](v50, "addObject:", v37);
                }

                self = v51;
                id v13 = v52;
                id v18 = v35;
                uint64_t v24 = v53;
              }
            }
          }

          id v23 = [v55 countByEnumeratingWithState:&v56 objects:v64 count:16];
        }

        while (v23);
      }

      uint64_t v19 = v49 + 1;
    }

    while ((id)(v49 + 1) != v47);
    id v47 = [obj countByEnumeratingWithState:&v60 objects:v65 count:16];
  }

  while (v47);
LABEL_33:

  objc_autoreleasePoolPop(context);
  if (a7) {
    objc_storeStrong(a7, v18);
  }
  id v38 = -[NSMutableSet copy](v50, "copy");

  return v38;
}

- (id)_rewardsAmountFromDate:(id)a3 toDate:(id)a4 accountIdentifier:(id)a5 altDSID:(id)a6 rewardTypes:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDecimalNumber zero](&OBJC_CLASS___NSDecimalNumber, "zero"));
  uint64_t v45 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  context = objc_autoreleasePoolPush();
  id v40 = v14;
  uint64_t v42 = v13;
  unsigned __int8 v43 = v12;
  uint64_t v44 = v11;
  id v16 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager accountEventsForAccountIdentifier:altDSID:types:startDate:endDate:orderedByDate:limit:]( self->_databaseManager,  "accountEventsForAccountIdentifier:altDSID:types:startDate:endDate:orderedByDate:limit:",  v13,  v14,  &off_100691040,  v11,  v12,  1LL,  0LL));
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  id v17 = [v16 countByEnumeratingWithState:&v47 objects:v51 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v46 = 0LL;
    uint64_t v19 = *(void *)v48;
    do
    {
      for (i = 0LL; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v48 != v19) {
          objc_enumerationMutation(v16);
        }
        __int128 v21 = *(void **)(*((void *)&v47 + 1) + 8LL * (void)i);
        id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 items]);
        id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 anyObject]);

        if (v23)
        {
          uint64_t v25 = objc_opt_class(&OBJC_CLASS___PKAccountRewards, v24);
          if ((objc_opt_isKindOfClass(v23, v25) & 1) != 0)
          {
            unsigned __int8 v26 = (__CFString *)(id)objc_claimAutoreleasedReturnValue([v23 status]);
            if (v26 == @"success"
              || (id v27 = v26) != 0LL
              && (unsigned int v28 = -[__CFString isEqualToString:](v26, "isEqualToString:", @"success"),
                  v27,
                  v27,
                  v28))
            {
              id v29 = (void *)objc_claimAutoreleasedReturnValue([v23 currencyAmount]);
              v30 = (void *)objc_claimAutoreleasedReturnValue([v29 amount]);

              if (v30)
              {
                uint64_t v31 = objc_claimAutoreleasedReturnValue([v15 decimalNumberByAdding:v30]);

                id v32 = (void *)objc_claimAutoreleasedReturnValue([v21 date]);
                id v33 = v32;
                if (!v46 || [v32 compare:v46] == (id)1)
                {
                  id v34 = v33;

                  uint64_t v46 = v34;
                }

                id v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v23 type]));
                -[NSMutableSet pk_safelyAddObject:](v45, "pk_safelyAddObject:", v35);

                uint64_t v15 = (void *)v31;
              }
            }
          }
        }
      }

      id v18 = [v16 countByEnumeratingWithState:&v47 objects:v51 count:16];
    }

    while (v18);
  }

  else
  {
    uint64_t v46 = 0LL;
  }

  objc_autoreleasePoolPop(context);
  id v36 = -[NSMutableSet count](v45, "count");
  if (a7 && v36) {
    *a7 = -[NSMutableSet copy](v45, "copy");
  }
  id v37 = v15;

  return v37;
}

- (void)accountsAreInDirtyStateWithCompletion:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001D65D4;
  v7[3] = &unk_10063AC90;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)workQueue, v7);
}

- (void)_accountsAreInDirtyWithFeatureFailures:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001D6870;
  block[3] = &unk_100639AF0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)workQueue, block);
}

- (void)accountIsInDirtyStateWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001D6B38;
  block[3] = &unk_100639AF0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)workQueue, block);
}

- (unint64_t)_queueIndexOfAccountWithIdentifier:(id)a3
{
  id v4 = a3;
  if (-[NSMutableArray count](self->_accounts, "count"))
  {
    unint64_t v5 = 0LL;
    while (1)
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_accounts, "objectAtIndex:", v5));
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 accountIdentifier]);
      unsigned __int8 v8 = [v4 isEqualToString:v7];

      if ((v8 & 1) != 0) {
        break;
      }
    }
  }

  else
  {
LABEL_5:
    unint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v5;
}

- (void)postAccountChangedNotification
{
  id v2 = (id)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter"));
  [v2 postNotificationName:PKAccountServiceAccountsChangedDistributedNotification object:0];
}

- (BOOL)_accountSupportsTransactionsWithoutPass:(id)a3
{
  return [a3 type] == (id)4;
}

- (id)_mockCreditAccountInitialStateWithEvents:(id *)a3
{
  id v3 = objc_alloc_init(&OBJC_CLASS___PKAccount);
  -[PKAccount setAccountIdentifier:](v3, "setAccountIdentifier:", @"1234567890");
  uint64_t v4 = PKCurrentUserAltDSID(-[PKAccount setSharedAccount:](v3, "setSharedAccount:", 1LL));
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  -[PKAccount setAltDSID:](v3, "setAltDSID:", v5);

  -[PKAccount setFeature:](v3, "setFeature:", 2LL);
  -[PKAccount setType:](v3, "setType:", 1LL);
  -[PKAccount setState:](v3, "setState:", 1LL);
  id v97 = v3;
  -[PKAccount setAccessLevel:](v3, "setAccessLevel:", 1LL);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  -[PKAccount setLastUpdated:](v3, "setLastUpdated:", v6);

  id v7 = objc_alloc_init(&OBJC_CLASS___PKCreditAccountDetails);
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  -7257600.0));
  -[PKCreditAccountDetails setCreatedDate:](v7, "setCreatedDate:", v8);

  -[PKCreditAccountDetails setCountryCode:](v7, "setCountryCode:", @"US");
  -[PKCreditAccountDetails setCurrencyCode:](v7, "setCurrencyCode:", @"USD");
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSTimeZone timeZoneWithName:]( &OBJC_CLASS___NSTimeZone,  "timeZoneWithName:",  @"America/New_York"));
  -[PKCreditAccountDetails setProductTimeZone:](v7, "setProductTimeZone:", v9);

  -[PKCreditAccountDetails setCardType:](v7, "setCardType:", 3LL);
  -[PKCreditAccountDetails setAssociatedPassTypeIdentifier:]( v7,  "setAssociatedPassTypeIdentifier:",  @"paymentpass.com.apple.wallet.dev");
  __int128 v101 = v7;
  -[PKCreditAccountDetails setAssociatedPassSerialNumber:]( v7,  "setAssociatedPassSerialNumber:",  @"00001111122223333444332211113344321");
  id v10 = objc_alloc_init(&OBJC_CLASS___PKVirtualCard);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 UUIDString]);
  -[PKVirtualCard setIdentifier:](v10, "setIdentifier:", v12);

  -[PKVirtualCard setCardholderName:](v10, "setCardholderName:", @"John Appleseed");
  -[PKVirtualCard setState:](v10, "setState:", 1LL);
  -[PKVirtualCard setType:](v10, "setType:", 1LL);
  -[PKVirtualCard setFPANSuffix:](v10, "setFPANSuffix:", @"5619");
  -[PKVirtualCard setExpiration:](v10, "setExpiration:", @"03/27");
  -[PKVirtualCard setHasDynamicSecurityCode:](v10, "setHasDynamicSecurityCode:", 1LL);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 UUIDString]);
  -[PKVirtualCard setSecurityCodeIdentifier:](v10, "setSecurityCodeIdentifier:", v14);

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", 3600.0));
  -[PKVirtualCard setSecurityCodeExpiration:](v10, "setSecurityCodeExpiration:", v15);

  id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  -[PKVirtualCard setLastUpdatedDate:](v10, "setLastUpdatedDate:", v16);

  __int128 v94 = v10;
  id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v10));
  -[PKCreditAccountDetails setVirtualCards:](v7, "setVirtualCards:", v17);

  id v18 = objc_alloc_init(&OBJC_CLASS___PKCreditAccountSummary);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDecimalNumber decimalNumberWithString:]( &OBJC_CLASS___NSDecimalNumber,  "decimalNumberWithString:",  @"10000.00"));
  -[PKCreditAccountSummary setCreditLimit:](v18, "setCreditLimit:", v19);

  id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDecimalNumber decimalNumberWithString:]( &OBJC_CLASS___NSDecimalNumber,  "decimalNumberWithString:",  @"8317.45"));
  -[PKCreditAccountSummary setAvailableCredit:](v18, "setAvailableCredit:", v20);

  __int128 v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDecimalNumber decimalNumberWithString:]( &OBJC_CLASS___NSDecimalNumber,  "decimalNumberWithString:",  @"1682.55"));
  -[PKCreditAccountSummary setCurrentBalance:](v18, "setCurrentBalance:", v21);

  id v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDecimalNumber zero](&OBJC_CLASS___NSDecimalNumber, "zero"));
  -[PKCreditAccountSummary setRewardsBalance:](v18, "setRewardsBalance:", v22);

  id v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSDecimalNumber decimalNumberWithString:]( &OBJC_CLASS___NSDecimalNumber,  "decimalNumberWithString:",  @"1243.45"));
  -[PKCreditAccountSummary setRemainingStatementBalance:](v18, "setRemainingStatementBalance:", v23);

  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSDecimalNumber decimalNumberWithString:]( &OBJC_CLASS___NSDecimalNumber,  "decimalNumberWithString:",  @"25.00"));
  -[PKCreditAccountSummary setRemainingMinimumPayment:](v18, "setRemainingMinimumPayment:", v24);

  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  uint64_t v26 = PKEndOfMonth(v25);
  id v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
  -[PKCreditAccountSummary setPaymentDueDate:](v18, "setPaymentDueDate:", v27);

  -[PKCreditAccountSummary setLastPaymentDate:](v18, "setLastPaymentDate:", 0LL);
  -[PKCreditAccountSummary setAutoPayEnabled:](v18, "setAutoPayEnabled:", 0LL);
  -[PKCreditAccountSummary setCyclesPastDue:](v18, "setCyclesPastDue:", 0LL);
  -[PKCreditAccountSummary setBalanceStatus:](v18, "setBalanceStatus:", 1LL);
  -[PKCreditAccountSummary setRequiresDebtCollectionNotices:](v18, "setRequiresDebtCollectionNotices:", 0LL);
  unsigned int v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDecimalNumber zero](&OBJC_CLASS___NSDecimalNumber, "zero"));
  -[PKCreditAccountSummary setUnpostedInterest:](v18, "setUnpostedInterest:", v28);

  -[PKCreditAccountSummary setUnpostedInterestTimestamp:](v18, "setUnpostedInterestTimestamp:", 0LL);
  -[PKCreditAccountSummary setInGrace:](v18, "setInGrace:", 1LL);
  id v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSDecimalNumber zero](&OBJC_CLASS___NSDecimalNumber, "zero"));
  -[PKCreditAccountSummary setChargeOffPreventionAmount:](v18, "setChargeOffPreventionAmount:", v29);

  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSDecimalNumber zero](&OBJC_CLASS___NSDecimalNumber, "zero"));
  -[PKCreditAccountSummary setPastDueAmount:](v18, "setPastDueAmount:", v30);

  uint64_t v31 = objc_alloc_init(&OBJC_CLASS___PKCreditAccountBalanceSummary);
  id v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  -[PKCreditAccountBalanceSummary setOpeningDate:](v31, "setOpeningDate:", v32);

  id v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  uint64_t v34 = PKEndOfMonth(v33);
  id v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
  -[PKCreditAccountBalanceSummary setClosingDate:](v31, "setClosingDate:", v35);

  id v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSDecimalNumber decimalNumberWithString:]( &OBJC_CLASS___NSDecimalNumber,  "decimalNumberWithString:",  @"5317.45"));
  -[PKCreditAccountBalanceSummary setPurchases:](v31, "setPurchases:", v36);

  id v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSDecimalNumber zero](&OBJC_CLASS___NSDecimalNumber, "zero"));
  -[PKCreditAccountBalanceSummary setPendingPurchases:](v31, "setPendingPurchases:", v37);

  id v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSDecimalNumber zero](&OBJC_CLASS___NSDecimalNumber, "zero"));
  -[PKCreditAccountBalanceSummary setBalanceTransfers:](v31, "setBalanceTransfers:", v38);

  uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSDecimalNumber zero](&OBJC_CLASS___NSDecimalNumber, "zero"));
  -[PKCreditAccountBalanceSummary setInterestCharged:](v31, "setInterestCharged:", v39);

  id v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSDecimalNumber zero](&OBJC_CLASS___NSDecimalNumber, "zero"));
  -[PKCreditAccountBalanceSummary setFeesCharged:](v31, "setFeesCharged:", v40);

  id v41 = (void *)objc_claimAutoreleasedReturnValue( +[NSDecimalNumber decimalNumberWithString:]( &OBJC_CLASS___NSDecimalNumber,  "decimalNumberWithString:",  @"1576.16"));
  -[PKCreditAccountBalanceSummary setPaymentsAndCredits:](v31, "setPaymentsAndCredits:", v41);

  uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSDecimalNumber zero](&OBJC_CLASS___NSDecimalNumber, "zero"));
  -[PKCreditAccountBalanceSummary setRewardsEarned:](v31, "setRewardsEarned:", v42);

  unsigned __int8 v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSDecimalNumber zero](&OBJC_CLASS___NSDecimalNumber, "zero"));
  -[PKCreditAccountBalanceSummary setRewardsRedeemed:](v31, "setRewardsRedeemed:", v43);

  __int128 v100 = v18;
  id v93 = v31;
  -[PKCreditAccountSummary setBalanceSummary:](v18, "setBalanceSummary:", v31);
  uint64_t v44 = objc_alloc_init(&OBJC_CLASS___PKCreditAccountStatement);
  uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue([v45 UUIDString]);
  -[PKCreditAccountStatement setIdentifier:](v44, "setIdentifier:", v46);

  __int128 v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  uint64_t v48 = PKStartOfMonth(v47);
  __int128 v49 = (void *)objc_claimAutoreleasedReturnValue(v48);
  -[PKCreditAccountStatement setOpeningDate:](v44, "setOpeningDate:", v49);

  __int128 v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  uint64_t v51 = PKEndOfMonth(v50);
  id v52 = (void *)objc_claimAutoreleasedReturnValue(v51);
  -[PKCreditAccountStatement setClosingDate:](v44, "setClosingDate:", v52);

  uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  uint64_t Month = PKEndOfNextMonth();
  id v55 = (void *)objc_claimAutoreleasedReturnValue(Month);
  -[PKCreditAccountStatement setPaymentDueDate:](v44, "setPaymentDueDate:", v55);

  -[PKCreditAccountStatement setCurrencyCode:](v44, "setCurrencyCode:", @"USD");
  __int128 v56 = (void *)objc_claimAutoreleasedReturnValue( +[NSDecimalNumber decimalNumberWithString:]( &OBJC_CLASS___NSDecimalNumber,  "decimalNumberWithString:",  @"1243.45"));
  -[PKCreditAccountStatement setStatementBalance:](v44, "setStatementBalance:", v56);

  __int128 v57 = (void *)objc_claimAutoreleasedReturnValue( +[NSDecimalNumber decimalNumberWithString:]( &OBJC_CLASS___NSDecimalNumber,  "decimalNumberWithString:",  @"10.00"));
  -[PKCreditAccountStatement setMinimumDue:](v44, "setMinimumDue:", v57);

  __int128 v58 = (void *)objc_claimAutoreleasedReturnValue( +[NSDecimalNumber decimalNumberWithString:]( &OBJC_CLASS___NSDecimalNumber,  "decimalNumberWithString:",  @"1576.16"));
  -[PKCreditAccountStatement setPurchases:](v44, "setPurchases:", v58);

  __int128 v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSDecimalNumber zero](&OBJC_CLASS___NSDecimalNumber, "zero"));
  -[PKCreditAccountStatement setFeesCharged:](v44, "setFeesCharged:", v59);

  __int128 v60 = (void *)objc_claimAutoreleasedReturnValue( +[NSDecimalNumber decimalNumberWithString:]( &OBJC_CLASS___NSDecimalNumber,  "decimalNumberWithString:",  @"20.00"));
  -[PKCreditAccountStatement setInterestCharged:](v44, "setInterestCharged:", v60);

  __int128 v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSDecimalNumber zero](&OBJC_CLASS___NSDecimalNumber, "zero"));
  -[PKCreditAccountStatement setBalanceTransfers:](v44, "setBalanceTransfers:", v61);

  __int128 v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSDecimalNumber zero](&OBJC_CLASS___NSDecimalNumber, "zero"));
  -[PKCreditAccountStatement setPaymentsAndCredits:](v44, "setPaymentsAndCredits:", v62);

  __int128 v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSDecimalNumber zero](&OBJC_CLASS___NSDecimalNumber, "zero"));
  -[PKCreditAccountStatement setRewardsBalance:](v44, "setRewardsBalance:", v63);

  id v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSDecimalNumber zero](&OBJC_CLASS___NSDecimalNumber, "zero"));
  -[PKCreditAccountStatement setRewardsEarned:](v44, "setRewardsEarned:", v64);

  unsigned int v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSDecimalNumber zero](&OBJC_CLASS___NSDecimalNumber, "zero"));
  -[PKCreditAccountStatement setRewardsRedeemed:](v44, "setRewardsRedeemed:", v65);

  id v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSDecimalNumber zero](&OBJC_CLASS___NSDecimalNumber, "zero"));
  -[PKCreditAccountStatement setRewardsYTD:](v44, "setRewardsYTD:", v66);

  id v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSDecimalNumber zero](&OBJC_CLASS___NSDecimalNumber, "zero"));
  -[PKCreditAccountStatement setRewardsLifetime:](v44, "setRewardsLifetime:", v67);

  v90 = v44;
  -[PKCreditAccountSummary setCurrentStatement:](v18, "setCurrentStatement:", v44);
  unsigned int v99 = objc_alloc_init(&OBJC_CLASS___PKCreditAccountRates);
  id v68 = (void *)objc_claimAutoreleasedReturnValue( +[NSDecimalNumber decimalNumberWithString:]( &OBJC_CLASS___NSDecimalNumber,  "decimalNumberWithString:",  @".1824"));
  -[PKCreditAccountRates setAprForPurchases:](v99, "setAprForPurchases:", v68);

  id v69 = objc_alloc_init(&OBJC_CLASS___PKCreditAccountFeatureDescriptor);
  -[PKCreditAccountFeatureDescriptor setIdentifier:]( v69,  "setIdentifier:",  PKCreditAccountFeatureDescriptorIdentifierSchedulePayment);
  id v70 = (void *)objc_claimAutoreleasedReturnValue( +[NSDecimalNumber decimalNumberWithString:]( &OBJC_CLASS___NSDecimalNumber,  "decimalNumberWithString:",  @"0.01"));
  -[PKCreditAccountFeatureDescriptor setMinimumAmount:](v69, "setMinimumAmount:", v70);

  uint64_t v71 = (void *)objc_claimAutoreleasedReturnValue( +[NSDecimalNumber decimalNumberWithString:]( &OBJC_CLASS___NSDecimalNumber,  "decimalNumberWithString:",  @"100000"));
  -[PKCreditAccountFeatureDescriptor setMaximumAmount:](v69, "setMaximumAmount:", v71);

  -[PKCreditAccountFeatureDescriptor setMerchantIdentifier:]( v69,  "setMerchantIdentifier:",  @"com.apple.creditservices");
  v104[0] = PKPaymentNetworkVisa;
  v104[1] = PKPaymentNetworkMasterCard;
  v104[2] = PKPaymentNetworkAmex;
  v104[3] = PKPaymentNetworkDiscover;
  unsigned int v72 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v104, 4LL));
  -[PKCreditAccountFeatureDescriptor setSupportedNetworks:](v69, "setSupportedNetworks:", v72);

  -[PKCreditAccountFeatureDescriptor setMerchantCapabilities:](v69, "setMerchantCapabilities:", 8LL);
  -[PKCreditAccountFeatureDescriptor setPaymentFundingSourceTypes:](v69, "setPaymentFundingSourceTypes:", 3LL);
  -[PKCreditAccountFeatureDescriptor setPaymentFrequencies:](v69, "setPaymentFrequencies:", 0LL);
  -[PKCreditAccountFeatureDescriptor setPaymentTermsIdentifier:](v69, "setPaymentTermsIdentifier:", 0LL);
  __int128 v98 = objc_alloc_init(&OBJC_CLASS___PKCreditAccountFeatureDescriptor);
  -[PKCreditAccountFeatureDescriptor setIdentifier:]( v98,  "setIdentifier:",  PKCreditAccountFeatureDescriptorIdentifierShowAccountSummary);
  v73 = objc_alloc_init(&OBJC_CLASS___PKCreditAccountFeatureDescriptor);
  -[PKCreditAccountFeatureDescriptor setIdentifier:]( v73,  "setIdentifier:",  PKCreditAccountFeatureDescriptorIdentifierScheduleRecurringPayments);
  unsigned int v74 = (void *)objc_claimAutoreleasedReturnValue( +[NSDecimalNumber decimalNumberWithString:]( &OBJC_CLASS___NSDecimalNumber,  "decimalNumberWithString:",  @"0.01"));
  -[PKCreditAccountFeatureDescriptor setMinimumAmount:](v73, "setMinimumAmount:", v74);

  int v75 = (void *)objc_claimAutoreleasedReturnValue( +[NSDecimalNumber decimalNumberWithString:]( &OBJC_CLASS___NSDecimalNumber,  "decimalNumberWithString:",  @"100000"));
  -[PKCreditAccountFeatureDescriptor setMaximumAmount:](v73, "setMaximumAmount:", v75);

  -[PKCreditAccountFeatureDescriptor setMerchantIdentifier:]( v73,  "setMerchantIdentifier:",  @"com.apple.creditservices");
  v103[0] = PKPaymentNetworkVisa;
  v103[1] = PKPaymentNetworkMasterCard;
  v103[2] = PKPaymentNetworkAmex;
  v103[3] = PKPaymentNetworkDiscover;
  v76 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v103, 4LL));
  -[PKCreditAccountFeatureDescriptor setSupportedNetworks:](v73, "setSupportedNetworks:", v76);

  -[PKCreditAccountFeatureDescriptor setMerchantCapabilities:](v73, "setMerchantCapabilities:", 8LL);
  -[PKCreditAccountFeatureDescriptor setPaymentFundingSourceTypes:](v73, "setPaymentFundingSourceTypes:", 3LL);
  -[PKCreditAccountFeatureDescriptor setPaymentFrequencies:](v73, "setPaymentFrequencies:", 0LL);
  -[PKCreditAccountFeatureDescriptor setPaymentTermsIdentifier:](v73, "setPaymentTermsIdentifier:", 0LL);
  unsigned __int8 v77 = objc_alloc_init(&OBJC_CLASS___PKCreditAccountFeatureDescriptor);
  -[PKCreditAccountFeatureDescriptor setIdentifier:]( v77,  "setIdentifier:",  PKAccountFeatureDescriptorIdentifierAddFundingSource);
  unsigned int v78 = objc_alloc_init(&OBJC_CLASS___PKCreditAccountFeatureDescriptor);
  -[PKCreditAccountFeatureDescriptor setIdentifier:]( v78,  "setIdentifier:",  PKCreditAccountFeatureDescriptorIdentifierShowVirtualCard);
  id v79 = objc_alloc_init(&OBJC_CLASS___PKCreditAccountFeatureDescriptor);
  -[PKCreditAccountFeatureDescriptor setIdentifier:]( v79,  "setIdentifier:",  PKCreditAccountFeatureDescriptorIdentifierDynamicSecurityCodes);
  uint64_t v80 = objc_alloc_init(&OBJC_CLASS___PKCreditAccountFeatureDescriptor);
  -[PKCreditAccountFeatureDescriptor setIdentifier:]( v80,  "setIdentifier:",  PKAccountFeatureDescriptorIdentifierShowNotifications);
  id v81 = objc_alloc_init(&OBJC_CLASS___PKCreditAccountFeatureDescriptor);
  -[PKCreditAccountFeatureDescriptor setIdentifier:]( v81,  "setIdentifier:",  PKCreditAccountFeatureDescriptorIdentifierRedeemRewards);
  -[PKCreditAccountFeatureDescriptor setSupportedDestinations:](v81, "setSupportedDestinations:", &off_100691058);
  id v82 = (void *)objc_claimAutoreleasedReturnValue( +[NSDecimalNumber decimalNumberWithString:]( &OBJC_CLASS___NSDecimalNumber,  "decimalNumberWithString:",  @"1.15"));
  -[PKCreditAccountFeatureDescriptor setSavingsAPY:](v81, "setSavingsAPY:", v82);

  -[PKCreditAccountDetails setAccountSummary:](v101, "setAccountSummary:", v100);
  -[PKCreditAccountDetails setRates:](v101, "setRates:", v99);
  id v83 = [[PKAccountDetails alloc] initWithCreditDetails:v101];
  -[PKAccount setDetails:](v97, "setDetails:", v83);

  id v91 = v79;
  __int128 v92 = v77;
  id v84 = (void *)objc_claimAutoreleasedReturnValue( +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v69,  v98,  v73,  v77,  v78,  v79,  v80,  v81,  0LL));
  -[PKAccount setSupportedFeatures:](v97, "setSupportedFeatures:", v84);

  id v85 = (void *)objc_claimAutoreleasedReturnValue(-[PKAccount creditDetails](v97, "creditDetails"));
  id v102 = 0LL;
  id v86 = (void *)objc_claimAutoreleasedReturnValue( -[PDAccountManager _mockInstallmentForAccount:events:]( self,  "_mockInstallmentForAccount:events:",  v97,  &v102));
  id v87 = v102;
  id v88 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v86));
  [v85 setInstallmentPlans:v88];

  if (a3) {
    *a3 = v87;
  }

  return v97;
}

- (id)_mockAccountUsers
{
  uint64_t v2 = PKCurrentUserAltDSID(self);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  if (v3)
  {
    uint64_t v4 = objc_alloc_init(&OBJC_CLASS___PKAccountUser);
    -[PKAccountUser setFirstName:](v4, "setFirstName:", @"Lani");
    -[PKAccountUser setLastName:](v4, "setLastName:", @"Martinez");
    -[PKAccountUser setAppleID:](v4, "setAppleID:", @"ars.im027@icloud.com");
    unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[PKAccountUser appleID](v4, "appleID"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v5));
    -[PKAccountUser setAddressableHandles:](v4, "setAddressableHandles:", v6);

    -[PKAccountUser setAltDSID:](v4, "setAltDSID:", v3);
    -[PKAccountUser setAccessLevel:](v4, "setAccessLevel:", 1LL);
    -[PKAccountUser setAccountState:](v4, "setAccountState:", 1LL);
    id v7 = objc_alloc_init(&OBJC_CLASS___PKAccountUser);
    -[PKAccountUser setFirstName:](v7, "setFirstName:", @"Tu");
    -[PKAccountUser setLastName:](v7, "setLastName:", @"Nguyen");
    -[PKAccountUser setAppleID:](v7, "setAppleID:", @"ars.im010@icloud.com");
    unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(-[PKAccountUser appleID](v7, "appleID"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v8));
    -[PKAccountUser setAddressableHandles:](v7, "setAddressableHandles:", v9);

    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@-2", v3));
    -[PKAccountUser setAltDSID:](v7, "setAltDSID:", v10);

    -[PKAccountUser setAccessLevel:](v7, "setAccessLevel:", 1LL);
    -[PKAccountUser setAccountState:](v7, "setAccountState:", 1LL);
    id v11 = objc_alloc_init(&OBJC_CLASS___PKAccountUser);
    -[PKAccountUser setFirstName:](v11, "setFirstName:", @"Tamara");
    -[PKAccountUser setLastName:](v11, "setLastName:", @"Nguyen");
    -[PKAccountUser setAppleID:](v11, "setAppleID:", @"ars.im029@icloud.com");
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[PKAccountUser appleID](v11, "appleID"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v12));
    -[PKAccountUser setAddressableHandles:](v11, "setAddressableHandles:", v13);

    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@-3", v3));
    -[PKAccountUser setAltDSID:](v11, "setAltDSID:", v14);

    -[PKAccountUser setAccessLevel:](v11, "setAccessLevel:", 2LL);
    -[PKAccountUser setAccountState:](v11, "setAccountState:", 1LL);
    uint64_t v15 = -[NSSet initWithObjects:](objc_alloc(&OBJC_CLASS___NSSet), "initWithObjects:", v4, v7, v11, 0LL);
  }

  else
  {
    uint64_t v15 = 0LL;
  }

  return v15;
}

- (id)_mockPhysicalCards
{
  uint64_t v2 = PKCurrentUserAltDSID(self);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  if (v3)
  {
    uint64_t v4 = objc_alloc_init(&OBJC_CLASS___PKPhysicalCard);
    unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 UUIDString]);
    -[PKPhysicalCard setIdentifier:](v4, "setIdentifier:", v6);

    -[PKPhysicalCard setState:](v4, "setState:", 2LL);
    -[PKPhysicalCard setNameOnCard:](v4, "setNameOnCard:", @"John Appleseed");
    -[PKPhysicalCard setFPANSuffix:](v4, "setFPANSuffix:", @"1234");
    -[PKPhysicalCard setAccountUserAltDSID:](v4, "setAccountUserAltDSID:", v3);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    -[PKPhysicalCard setLastUpdated:](v4, "setLastUpdated:", v7);

    unsigned __int8 v8 = -[NSSet initWithObjects:](objc_alloc(&OBJC_CLASS___NSSet), "initWithObjects:", v4, 0LL);
  }

  else
  {
    unsigned __int8 v8 = 0LL;
  }

  return v8;
}

- (id)_mockInstallmentForAccount:(id)a3 events:(id *)a4
{
  id v75 = a3;
  uint64_t v5 = PKNumberInstallmentDemoPayments();
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  unsigned int v72 = a4;
  v73 = v6;
  if (v6) {
    uint64_t v7 = (uint64_t)[v6 integerValue];
  }
  else {
    uint64_t v7 = 4LL;
  }
  else {
    uint64_t v8 = v7 & ~(v7 >> 63);
  }
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v75 creditDetails]);
  id v10 = (__CFString *)objc_claimAutoreleasedReturnValue([v9 currencyCode]);

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v75 creditDetails]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 currencyCode]);
  id v13 = @"USD";
  if (v12) {
    id v13 = v10;
  }
  uint64_t v80 = v13;

  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar autoupdatingCurrentCalendar](&OBJC_CLASS___NSCalendar, "autoupdatingCurrentCalendar"));
  id v16 = objc_alloc_init(&OBJC_CLASS___NSDateComponents);
  -[NSDateComponents setHour:](v16, "setHour:", -10LL);
  unsigned int v78 = v15;
  uint64_t v71 = v16;
  v76 = (void *)objc_claimAutoreleasedReturnValue([v15 dateByAddingComponents:v16 toDate:v14 options:0]);

  id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDecimalNumber decimalNumberWithString:]( &OBJC_CLASS___NSDecimalNumber,  "decimalNumberWithString:",  @"31.20"));
  unint64_t v77 = v8;
  id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v8));
  uint64_t v19 = v18;
  if (v18)
  {
    [v18 decimalValue];
  }

  else
  {
    v84[0] = 0LL;
    v84[1] = 0LL;
    int v85 = 0;
  }

  id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDecimalNumber decimalNumberWithDecimal:]( &OBJC_CLASS___NSDecimalNumber,  "decimalNumberWithDecimal:",  v84));
  uint64_t v21 = objc_claimAutoreleasedReturnValue([v17 decimalNumberByMultiplyingBy:v20]);

  id v22 = objc_alloc_init(&OBJC_CLASS___PKCreditInstallmentPlan);
  -[PKCreditInstallmentPlan setIdentifier:](v22, "setIdentifier:", @"demo-installment-plan-id1");
  -[PKCreditInstallmentPlan setState:](v22, "setState:", 2LL);
  -[PKCreditInstallmentPlan setDuration:](v22, "setDuration:", 24LL);
  -[PKCreditInstallmentPlan setCurrencyCode:](v22, "setCurrencyCode:", v80);
  id v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSDecimalNumber decimalNumberWithString:]( &OBJC_CLASS___NSDecimalNumber,  "decimalNumberWithString:",  @"749.60"));
  -[PKCreditInstallmentPlan setTotalAmount:](v22, "setTotalAmount:", v23);

  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSDecimalNumber decimalNumberWithString:]( &OBJC_CLASS___NSDecimalNumber,  "decimalNumberWithString:",  @"749.60"));
  -[PKCreditInstallmentPlan setTotalProductAmount:](v22, "setTotalProductAmount:", v24);

  -[PKCreditInstallmentPlan setPeriodType:](v22, "setPeriodType:", 1LL);
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDecimalNumber zero](&OBJC_CLASS___NSDecimalNumber, "zero"));
  -[PKCreditInstallmentPlan setApr:](v22, "setApr:", v25);

  uint64_t v26 = objc_alloc_init(&OBJC_CLASS___PKInstallmentPlanSummary);
  id v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSDecimalNumber decimalNumberWithString:]( &OBJC_CLASS___NSDecimalNumber,  "decimalNumberWithString:",  @"1100"));
  -[PKInstallmentPlanSummary setCurrentBalance:](v26, "setCurrentBalance:", v27);

  -[PKInstallmentPlanSummary setCurrencyCode:](v26, "setCurrencyCode:", v80);
  id v70 = v17;
  -[PKInstallmentPlanSummary setMinimumDue:](v26, "setMinimumDue:", v17);
  id v68 = (void *)v21;
  -[PKInstallmentPlanSummary setPaymentsToDateAmount:](v26, "setPaymentsToDateAmount:", v21);
  id v67 = v26;
  -[PKCreditInstallmentPlan setSummary:](v22, "setSummary:", v26);
  unsigned int v28 = objc_alloc_init(&OBJC_CLASS___PKInstallmentPlanMerchant);
  -[PKInstallmentPlanMerchant setIdentifier:](v28, "setIdentifier:", @"demo-installment-merchant-id1");
  -[PKInstallmentPlanMerchant setName:](v28, "setName:", @"Apple Store");
  -[PKInstallmentPlanMerchant setCategoryCode:](v28, "setCategoryCode:", 2842LL);
  -[PKInstallmentPlanMerchant setCity:](v28, "setCity:", @"Cupertino");
  -[PKInstallmentPlanMerchant setState:](v28, "setState:", @"CA");
  -[PKInstallmentPlanMerchant setPostalCode:](v28, "setPostalCode:", @"95014");
  -[PKInstallmentPlanMerchant setCountry:](v28, "setCountry:", @"US");
  id v66 = v28;
  -[PKCreditInstallmentPlan setMerchant:](v22, "setMerchant:", v28);
  id v29 = objc_alloc_init(&OBJC_CLASS___PKCreditInstallmentPlanProduct);
  -[PKCreditInstallmentPlanProduct setIdentifier:](v29, "setIdentifier:", @"demo-installment-product-id1");
  -[PKCreditInstallmentPlanProduct setModel:](v29, "setModel:", @"iPhone 11 Pro");
  -[PKCreditInstallmentPlanProduct setCapacity:](v29, "setCapacity:", @"128GB");
  -[PKCreditInstallmentPlanProduct setColor:](v29, "setColor:", @"Space Grey");
  -[PKCreditInstallmentPlanProduct setUpgradeEligible:](v29, "setUpgradeEligible:", 1LL);
  -[PKCreditInstallmentPlanProduct setWarrantyYears:](v29, "setWarrantyYears:", 2LL);
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", @"AppleCare+"));
  -[PKCreditInstallmentPlanProduct setFeatures:](v29, "setFeatures:", v30);

  uint64_t v31 = PKSerialNumber();
  id v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
  -[PKCreditInstallmentPlanProduct setSerialNumber:](v29, "setSerialNumber:", v32);

  -[PKCreditInstallmentPlanProduct setIconURLs:](v29, "setIconURLs:", &off_100691248);
  -[PKCreditInstallmentPlanProduct setSplashImageURLs:](v29, "setSplashImageURLs:", &off_100691270);
  unsigned int v65 = v29;
  -[PKCreditInstallmentPlan setProduct:](v22, "setProduct:", v29);
  id v33 = objc_alloc_init(&OBJC_CLASS___PKCreditInstallmentPlanLineItem);
  -[PKCreditInstallmentPlanLineItem setType:](v33, "setType:", 1LL);
  uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSDecimalNumber decimalNumberWithString:]( &OBJC_CLASS___NSDecimalNumber,  "decimalNumberWithString:",  @"1100"));
  -[PKCreditInstallmentPlanLineItem setAmount:](v33, "setAmount:", v34);

  -[PKCreditInstallmentPlanLineItem setDuration:](v33, "setDuration:", 24LL);
  id v64 = v33;
  v89 = v33;
  id v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v89, 1LL));
  -[PKCreditInstallmentPlan setLineItems:](v22, "setLineItems:", v35);

  id v36 = (void *)objc_claimAutoreleasedReturnValue([v75 creditDetails]);
  id v69 = v22;
  id v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v22));
  [v36 setInstallmentPlans:v37];

  unsigned int v74 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  id v79 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  for (unint64_t i = 0LL; i != 24; ++i)
  {
    uint64_t v39 = objc_alloc_init(&OBJC_CLASS___NSDateComponents);
    -[NSDateComponents setMonth:](v39, "setMonth:", i - v77);
    id v81 = v39;
    id v40 = (void *)objc_claimAutoreleasedReturnValue([v78 dateByAddingComponents:v39 toDate:v76 options:0]);
    uint64_t v41 = PKEndOfMonth(v40);
    uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
    uint64_t v43 = PKStartOfMonth(v40);
    id v83 = (void *)objc_claimAutoreleasedReturnValue(v43);
    uint64_t Month = PKStartOfNextMonth(v42);
    id v82 = (void *)objc_claimAutoreleasedReturnValue(Month);
    uint64_t v45 = 0LL;
    uint64_t v46 = 0LL;
    if (i < v77)
    {
      uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"demo-installment-statement-id%ld",  i));
      v87[0] = @"identifier";
      v87[1] = @"statementBalance";
      v88[0] = v46;
      v88[1] = @"1325";
      v87[2] = @"minimumDue";
      v87[3] = @"purchases";
      v88[2] = @"25";
      v88[3] = @"1300";
      v87[4] = @"balanceTransfers";
      v87[5] = @"interestCharged";
      v88[4] = @"0.0";
      v88[5] = @"12.3";
      v87[6] = @"feesCharged";
      v87[7] = @"paymentsAndCredits";
      v88[6] = @"0.0";
      v88[7] = @"425";
      v87[8] = @"rewardsBalance";
      v87[9] = @"rewardsEarned";
      v88[8] = @"2.56";
      v88[9] = @"6.7";
      v87[10] = @"rewardsRedeemed";
      v87[11] = @"rewardsYTD";
      v88[10] = @"12.4";
      v88[11] = @"76.4";
      v87[12] = @"rewardsLifetime";
      v87[13] = @"currencyCode";
      v88[12] = @"120.4";
      v88[13] = v80;
      __int128 v47 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v88,  v87,  14LL));
      uint64_t v45 = -[PKCreditAccountStatement initWithDictionary:]( objc_alloc(&OBJC_CLASS___PKCreditAccountStatement),  "initWithDictionary:",  v47);
      -[PKCreditAccountStatement setClosingDate:](v45, "setClosingDate:", v42);
      -[PKCreditAccountStatement setOpeningDate:](v45, "setOpeningDate:", v83);
      -[PKCreditAccountStatement setPaymentDueDate:](v45, "setPaymentDueDate:", v82);
      uint64_t v48 = objc_alloc_init(&OBJC_CLASS___PKAccountEvent);
      -[PKAccountEvent setType:](v48, "setType:", 3LL);
      __int128 v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
      __int128 v50 = (void *)objc_claimAutoreleasedReturnValue([v49 UUIDString]);
      -[PKAccountEvent setIdentifier:](v48, "setIdentifier:", v50);

      uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue([v75 accountIdentifier]);
      -[PKAccountEvent setAccountIdentifier:](v48, "setAccountIdentifier:", v51);

      id v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v45));
      -[PKAccountEvent setItems:](v48, "setItems:", v52);

      uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue([v42 dateByAddingTimeInterval:600.0]);
      -[PKAccountEvent setDate:](v48, "setDate:", v53);

      v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
      id v55 = (void *)objc_claimAutoreleasedReturnValue([v54 UUIDString]);
      -[PKAccountEvent setIdentifier:](v48, "setIdentifier:", v55);

      -[NSMutableSet addObject:](v74, "addObject:", v48);
    }

    __int128 v56 = objc_alloc_init(&OBJC_CLASS___PKCreditInstallmentPlanPayment);
    __int128 v57 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"demo-installment-payment-id%ld",  i));
    if (i > 4) {
      __int128 v58 = 0LL;
    }
    else {
      __int128 v58 = (void *)objc_claimAutoreleasedReturnValue( +[NSDecimalNumber decimalNumberWithString:]( &OBJC_CLASS___NSDecimalNumber,  "decimalNumberWithString:",  @"31.20"));
    }
    -[PKCreditInstallmentPlanPayment setIdentifier:](v56, "setIdentifier:", v57);
    -[PKCreditInstallmentPlanPayment setStatementIdentifier:](v56, "setStatementIdentifier:", v46);
    -[PKCreditInstallmentPlanPayment setStatement:](v56, "setStatement:", v45);
    -[PKCreditInstallmentPlanPayment setCurrencyCode:](v56, "setCurrencyCode:", v80);
    __int128 v59 = (void *)objc_claimAutoreleasedReturnValue( +[NSDecimalNumber decimalNumberWithString:]( &OBJC_CLASS___NSDecimalNumber,  "decimalNumberWithString:",  @"31.20"));
    -[PKCreditInstallmentPlanPayment setAmountDue:](v56, "setAmountDue:", v59);

    -[PKCreditInstallmentPlanPayment setAmountPaid:](v56, "setAmountPaid:", v58);
    -[PKCreditInstallmentPlanPayment setDueDate:](v56, "setDueDate:", v42);
    __int128 v60 = objc_alloc_init(&OBJC_CLASS___PKCreditInstallmentPlanLineItem);
    -[PKCreditInstallmentPlanLineItem setType:](v60, "setType:", 1LL);
    __int128 v61 = (void *)objc_claimAutoreleasedReturnValue( +[NSDecimalNumber decimalNumberWithString:]( &OBJC_CLASS___NSDecimalNumber,  "decimalNumberWithString:",  @"31.20"));
    -[PKCreditInstallmentPlanLineItem setAmount:](v60, "setAmount:", v61);

    -[PKCreditInstallmentPlanLineItem setDuration:](v60, "setDuration:", 24LL);
    id v86 = v60;
    __int128 v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v86, 1LL));
    -[PKCreditInstallmentPlanPayment setLineItems:](v56, "setLineItems:", v62);

    -[NSMutableArray addObject:](v79, "addObject:", v56);
  }

  -[PKCreditInstallmentPlan setPayments:](v69, "setPayments:", v79);
  if (v72) {
    *unsigned int v72 = -[NSMutableSet copy](v74, "copy");
  }

  return v69;
}

- (id)_mockSavingsAccount
{
  uint64_t v2 = objc_alloc_init(&OBJC_CLASS___PKAccount);
  -[PKAccount setAccountIdentifier:](v2, "setAccountIdentifier:", @"savings-account-mock");
  -[PKAccount setFeature:](v2, "setFeature:", 5LL);
  -[PKAccount setType:](v2, "setType:", 4LL);
  -[PKAccount setState:](v2, "setState:", 1LL);
  -[PKAccount setAccessLevel:](v2, "setAccessLevel:", 1LL);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v37 = v2;
  -[PKAccount setLastUpdated:](v2, "setLastUpdated:", v3);

  uint64_t v4 = objc_alloc_init(&OBJC_CLASS___PKSavingsAccountDetails);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  -[PKSavingsAccountDetails setLastUpdatedDate:](v4, "setLastUpdatedDate:", v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  -7257600.0));
  -[PKSavingsAccountDetails setCreatedDate:](v4, "setCreatedDate:", v6);

  -[PKSavingsAccountDetails setCountryCode:](v4, "setCountryCode:", @"US");
  -[PKSavingsAccountDetails setCurrencyCode:](v4, "setCurrencyCode:", @"USD");
  -[PKSavingsAccountDetails setRoutingNumber:](v4, "setRoutingNumber:", @"121202211");
  -[PKSavingsAccountDetails setAccountNumber:](v4, "setAccountNumber:", @"927392017351");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSTimeZone timeZoneWithName:]( &OBJC_CLASS___NSTimeZone,  "timeZoneWithName:",  @"America/New_York"));
  -[PKSavingsAccountDetails setProductTimeZone:](v4, "setProductTimeZone:", v7);

  -[PKSavingsAccountDetails setTermsAcceptanceRequired:](v4, "setTermsAcceptanceRequired:", 0LL);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", @"https://www.apple.com"));
  -[PKSavingsAccountDetails setPrivacyPolicyURL:](v4, "setPrivacyPolicyURL:", v8);

  -[PKSavingsAccountDetails setBusinessChatIdentifier:]( v4,  "setBusinessChatIdentifier:",  @"1234567890-1234567890-1234567890");
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", @"https://www.apple.com"));
  -[PKSavingsAccountDetails setContactWebsite:](v4, "setContactWebsite:", v9);

  -[PKSavingsAccountDetails setContactNumber:](v4, "setContactNumber:", @"1-877-255-5923");
  -[PKSavingsAccountDetails setTermsIdentifier:](v4, "setTermsIdentifier:", @"someTermsIdentifier");
  id v10 = objc_alloc_init(&OBJC_CLASS___PKSavingsAccountSummary);
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDecimalNumber decimalNumberWithString:]( &OBJC_CLASS___NSDecimalNumber,  "decimalNumberWithString:",  @"510.00"));
  -[PKSavingsAccountSummary setCurrentBalance:](v10, "setCurrentBalance:", v11);

  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDecimalNumber decimalNumberWithString:]( &OBJC_CLASS___NSDecimalNumber,  "decimalNumberWithString:",  @"500.00"));
  -[PKSavingsAccountSummary setAvailableBalance:](v10, "setAvailableBalance:", v12);

  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDecimalNumber decimalNumberWithString:]( &OBJC_CLASS___NSDecimalNumber,  "decimalNumberWithString:",  @"12.55"));
  -[PKSavingsAccountSummary setPendingBalance:](v10, "setPendingBalance:", v13);

  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDecimalNumber decimalNumberWithString:]( &OBJC_CLASS___NSDecimalNumber,  "decimalNumberWithString:",  @"85.32"));
  -[PKSavingsAccountSummary setInterestYTD:](v10, "setInterestYTD:", v14);

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDecimalNumber decimalNumberWithString:]( &OBJC_CLASS___NSDecimalNumber,  "decimalNumberWithString:",  @"263.29"));
  -[PKSavingsAccountSummary setInterestTotal:](v10, "setInterestTotal:", v15);

  id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDecimalNumber decimalNumberWithString:]( &OBJC_CLASS___NSDecimalNumber,  "decimalNumberWithString:",  @"1.05"));
  -[PKSavingsAccountSummary setAPY:](v10, "setAPY:", v16);

  id v38 = v4;
  -[PKSavingsAccountDetails setAccountSummary:](v4, "setAccountSummary:", v10);
  id v17 = [[PKAccountDetails alloc] initWithSavingsDetails:v4];
  -[PKAccount setDetails:](v2, "setDetails:", v17);

  id v36 = objc_alloc_init(&OBJC_CLASS___PKSavingsAccountFeatureDescriptor);
  -[PKSavingsAccountFeatureDescriptor setIdentifier:]( v36,  "setIdentifier:",  PKSavingsAccountFeatureDescriptorIdentifierViewTaxDocuments);
  id v18 = objc_alloc_init(&OBJC_CLASS___PKSavingsAccountFeatureDescriptor);
  -[PKSavingsAccountFeatureDescriptor setIdentifier:]( v18,  "setIdentifier:",  PKSavingsAccountFeatureDescriptorIdentifierShowAccountSummary);
  uint64_t v19 = objc_alloc_init(&OBJC_CLASS___PKSavingsAccountFeatureDescriptor);
  -[PKSavingsAccountFeatureDescriptor setIdentifier:]( v19,  "setIdentifier:",  PKSavingsAccountFeatureDescriptorIdentifierOneTimeDeposit);
  id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDecimalNumber decimalNumberWithString:]( &OBJC_CLASS___NSDecimalNumber,  "decimalNumberWithString:",  @"0.01"));
  -[PKSavingsAccountFeatureDescriptor setMinimumAmount:](v19, "setMinimumAmount:", v20);

  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDecimalNumber decimalNumberWithString:]( &OBJC_CLASS___NSDecimalNumber,  "decimalNumberWithString:",  @"250000"));
  -[PKSavingsAccountFeatureDescriptor setMaximumAmount:](v19, "setMaximumAmount:", v21);

  -[PKSavingsAccountFeatureDescriptor setTransferTermsIdentifier:]( v19,  "setTransferTermsIdentifier:",  @"123-2421445-25745-24124");
  -[PKSavingsAccountFeatureDescriptor setFundingSourceTypes:](v19, "setFundingSourceTypes:", 3LL);
  -[PKSavingsAccountFeatureDescriptor setTransferFrequencies:](v19, "setTransferFrequencies:", 2LL);
  id v22 = objc_alloc_init(&OBJC_CLASS___PKSavingsAccountFeatureDescriptor);
  -[PKSavingsAccountFeatureDescriptor setIdentifier:]( v22,  "setIdentifier:",  PKSavingsAccountFeatureDescriptorIdentifierOneTimeWithdrawal);
  id v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSDecimalNumber decimalNumberWithString:]( &OBJC_CLASS___NSDecimalNumber,  "decimalNumberWithString:",  @"0.01"));
  -[PKSavingsAccountFeatureDescriptor setMinimumAmount:](v22, "setMinimumAmount:", v23);

  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSDecimalNumber decimalNumberWithString:]( &OBJC_CLASS___NSDecimalNumber,  "decimalNumberWithString:",  @"250000"));
  -[PKSavingsAccountFeatureDescriptor setMaximumAmount:](v22, "setMaximumAmount:", v24);

  -[PKSavingsAccountFeatureDescriptor setTransferTermsIdentifier:]( v22,  "setTransferTermsIdentifier:",  @"123-2421445-25745-24124");
  -[PKSavingsAccountFeatureDescriptor setFundingSourceTypes:](v22, "setFundingSourceTypes:", 3LL);
  -[PKSavingsAccountFeatureDescriptor setTransferFrequencies:](v22, "setTransferFrequencies:", 2LL);
  uint64_t v25 = objc_alloc_init(&OBJC_CLASS___PKSavingsAccountFeatureDescriptor);
  -[PKSavingsAccountFeatureDescriptor setIdentifier:]( v25,  "setIdentifier:",  PKSavingsAccountFeatureDescriptorIdentifierOneTimeDepositWithAppleCash);
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSDecimalNumber decimalNumberWithString:]( &OBJC_CLASS___NSDecimalNumber,  "decimalNumberWithString:",  @"1.00"));
  -[PKSavingsAccountFeatureDescriptor setMinimumAmount:](v25, "setMinimumAmount:", v26);

  id v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSDecimalNumber decimalNumberWithString:]( &OBJC_CLASS___NSDecimalNumber,  "decimalNumberWithString:",  @"10000"));
  -[PKSavingsAccountFeatureDescriptor setMaximumAmount:](v25, "setMaximumAmount:", v27);

  -[PKSavingsAccountFeatureDescriptor setTransferTermsIdentifier:]( v25,  "setTransferTermsIdentifier:",  @"123-2421445-25745-24124");
  -[PKSavingsAccountFeatureDescriptor setFundingSourceTypes:](v25, "setFundingSourceTypes:", 2LL);
  -[PKSavingsAccountFeatureDescriptor setTransferFrequencies:](v25, "setTransferFrequencies:", 2LL);
  unsigned int v28 = objc_alloc_init(&OBJC_CLASS___PKSavingsAccountFeatureDescriptor);
  -[PKSavingsAccountFeatureDescriptor setIdentifier:]( v28,  "setIdentifier:",  PKSavingsAccountFeatureDescriptorIdentifierOneTimeWithdrawalWithAppleCash);
  id v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSDecimalNumber decimalNumberWithString:]( &OBJC_CLASS___NSDecimalNumber,  "decimalNumberWithString:",  @"1.00"));
  -[PKSavingsAccountFeatureDescriptor setMinimumAmount:](v28, "setMinimumAmount:", v29);

  v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSDecimalNumber decimalNumberWithString:]( &OBJC_CLASS___NSDecimalNumber,  "decimalNumberWithString:",  @"10000"));
  -[PKSavingsAccountFeatureDescriptor setMaximumAmount:](v28, "setMaximumAmount:", v30);

  -[PKSavingsAccountFeatureDescriptor setTransferTermsIdentifier:]( v28,  "setTransferTermsIdentifier:",  @"123-2421445-25745-24124");
  -[PKSavingsAccountFeatureDescriptor setFundingSourceTypes:](v28, "setFundingSourceTypes:", 2LL);
  -[PKSavingsAccountFeatureDescriptor setTransferFrequencies:](v28, "setTransferFrequencies:", 2LL);
  uint64_t v31 = objc_alloc_init(&OBJC_CLASS___PKSavingsAccountFeatureDescriptor);
  -[PKSavingsAccountFeatureDescriptor setIdentifier:]( v31,  "setIdentifier:",  PKSavingsAccountFeatureDescriptorIdentifierExportTransactionData);
  -[PKSavingsAccountFeatureDescriptor setSupportedFileFormatsForTransactionData:]( v31,  "setSupportedFileFormatsForTransactionData:",  &off_100691070);
  id v32 = objc_alloc_init(&OBJC_CLASS___PKSavingsAccountFeatureDescriptor);
  -[PKSavingsAccountFeatureDescriptor setIdentifier:]( v32,  "setIdentifier:",  PKSavingsAccountFeatureDescriptorIdentifierViewStatement);
  id v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableSet setWithObjects:]( &OBJC_CLASS___NSMutableSet,  "setWithObjects:",  v36,  v18,  v19,  v22,  v25,  v28,  v31,  v32,  0LL));
  id v34 = [v33 copy];
  -[PKAccount setSupportedFeatures:](v37, "setSupportedFeatures:", v34);

  return v37;
}

- (void)passAdded:(id)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a3 associatedAccountServiceAccountIdentifier]);
  uint64_t v5 = v4;
  if (v4)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_1001D906C;
    v6[3] = &unk_100639868;
    v6[4] = self;
    id v7 = v4;
    -[PDAccountManager accountWithIdentifier:completion:](self, "accountWithIdentifier:completion:", v7, v6);
  }
}

- (void)passRemoved:(id)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a3 associatedAccountServiceAccountIdentifier]);
  uint64_t v5 = v4;
  if (v4)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1001D928C;
    v12[3] = &unk_100639300;
    id v6 = v4;
    id v13 = v6;
    -[PDAccountManager deleteVirtualCardEncryptedDataForAccountIdentifier:completion:]( self,  "deleteVirtualCardEncryptedDataForAccountIdentifier:completion:",  v6,  v12);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_1001D9334;
    v10[3] = &unk_100639300;
    id v7 = v6;
    id v11 = v7;
    -[PDAccountManager deleteFinancingPlansForAccountIdentifier:completion:]( self,  "deleteFinancingPlansForAccountIdentifier:completion:",  v7,  v10);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_1001D93DC;
    v8[3] = &unk_100639868;
    void v8[4] = self;
    id v9 = v7;
    -[PDAccountManager accountWithIdentifier:completion:](self, "accountWithIdentifier:completion:", v9, v8);
  }
}

- (void)accountsForProvisioningWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    workQueue = self->_workQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1001D9844;
    v7[3] = &unk_10063AC90;
    v7[4] = self;
    id v8 = v4;
    dispatch_async((dispatch_queue_t)workQueue, v7);
  }
}

- (void)accountsWithPassLocallyProvisionedWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    workQueue = self->_workQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1001D9D60;
    v7[3] = &unk_10063AC90;
    v7[4] = self;
    id v8 = v4;
    dispatch_async((dispatch_queue_t)workQueue, v7);
  }
}

- (void)accountsWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    workQueue = self->_workQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1001D9FB8;
    v7[3] = &unk_10063AC90;
    v7[4] = self;
    id v8 = v4;
    dispatch_async((dispatch_queue_t)workQueue, v7);
  }
}

- (void)accountWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    workQueue = self->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001DA1F4;
    block[3] = &unk_100639AF0;
    void block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async((dispatch_queue_t)workQueue, block);
  }
}

- (id)_queue_accountWithIdentifier:(id)a3
{
  id v4 = a3;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  uint64_t v5 = self->_accounts;
  id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
  if (v6)
  {
    uint64_t v7 = *(void *)v16;
    while (2)
    {
      for (unint64_t i = 0LL; i != v6; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        id v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "accountIdentifier", (void)v15));
        id v11 = v4;
        id v12 = v11;
        if (v10 == v11)
        {

LABEL_16:
          id v6 = [v9 copy];
          goto LABEL_17;
        }

        if (v4 && v10)
        {
          unsigned __int8 v13 = [v10 isEqualToString:v11];

          if ((v13 & 1) != 0) {
            goto LABEL_16;
          }
        }

        else
        {
        }
      }

      id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
      if (v6) {
        continue;
      }
      break;
    }
  }

- (void)accountsForFeature:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  uint64_t v7 = v6;
  if (v6)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_1001DA57C;
    v8[3] = &unk_10064B440;
    unint64_t v10 = a3;
    id v9 = v6;
    -[PDAccountManager accountsWithCompletion:](self, "accountsWithCompletion:", v8);
  }
}

- (void)accountWithVirtualCardIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    workQueue = self->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001DA778;
    block[3] = &unk_100639AF0;
    void block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async((dispatch_queue_t)workQueue, block);
  }
}

- (void)accountForPassWithUniqueID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    workQueue = self->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001DA9A0;
    block[3] = &unk_100639AF0;
    void block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async((dispatch_queue_t)workQueue, block);
  }
}

- (void)updateAccount:(id)a3 completion:(id)a4
{
}

- (void)updateAccountsWithCompletion:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    uint64_t v5 = objc_alloc_init(&OBJC_CLASS___PDAccountManagerAllAccountsRequest);
    -[PDAccountManagerAllAccountsRequest addCompletion:](v5, "addCompletion:", v4);

    -[PDAccountManager _addAccountManagerFetchRequest:](self, "_addAccountManagerFetchRequest:", v5);
  }

- (void)_managerFetch_updateAccountsWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t Object = PKLogFacilityTypeGetObject(14LL);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Updating accounts", buf, 2u);
  }

  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472LL;
  v42[2] = sub_1001DAE64;
  v42[3] = &unk_10063C3B0;
  id v10 = v7;
  v42[4] = self;
  id v43 = v10;
  id v11 = objc_retainBlock(v42);
  uint64_t v12 = PKUIOnlyDemoModeEnabled(v11);
  if ((v12 & 1) != 0 || PKStoreDemoModeEnabled(v12, v13))
  {
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472LL;
    v40[2] = sub_1001DAF08;
    v40[3] = &unk_10063F520;
    v40[4] = self;
    id v41 = v11;
    id v14 = v11;
    -[PDAccountManager accountsWithCompletion:](self, "accountsWithCompletion:", v40);
  }

  else
  {
    id v15 = -[NSMutableArray count](self->_accounts, "count");
    v38[0] = 0LL;
    v38[1] = v38;
    v38[2] = 0x2020000000LL;
    char v39 = 0;
    *(void *)buf = 0LL;
    id v33 = buf;
    uint64_t v34 = 0x3032000000LL;
    id v35 = sub_1001DB0CC;
    id v36 = sub_1001DB0DC;
    id v37 = 0LL;
    v30[0] = 0LL;
    v30[1] = v30;
    v30[2] = 0x3032000000LL;
    v30[3] = sub_1001DB0CC;
    void v30[4] = sub_1001DB0DC;
    id v31 = 0LL;
    __int128 v16 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v17 = v16;
    BOOL v18 = v15 == 0LL;
    workQueue = self->_workQueue;
    char v20 = !v18;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001DB0E4;
    block[3] = &unk_10064B580;
    void block[4] = self;
    uint64_t v24 = v16;
    id v27 = v30;
    unsigned int v28 = buf;
    char v29 = v20;
    id v25 = v11;
    uint64_t v26 = v38;
    uint64_t v21 = v11;
    id v22 = v17;
    dispatch_async((dispatch_queue_t)workQueue, block);

    _Block_object_dispose(v30, 8);
    _Block_object_dispose(buf, 8);

    _Block_object_dispose(v38, 8);
  }
}

- (void)updateAccountWithIdentifier:(id)a3 completion:(id)a4
{
}

- (void)updateAccountWithIdentifier:(id)a3 extended:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v9)
  {
    if (v8)
    {
      workQueue = self->_workQueue;
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472LL;
      v12[2] = sub_1001DBBEC;
      v12[3] = &unk_10063B100;
      void v12[4] = self;
      id v13 = v8;
      BOOL v15 = a4;
      id v14 = v9;
      dispatch_async((dispatch_queue_t)workQueue, v12);
    }

    else
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKAccountErrorDomain,  3LL,  0LL));
      (*((void (**)(id, void, void *))v9 + 2))(v9, 0LL, v11);
    }
  }
}

- (void)lastUsedInAppFundingSourceForAccountIdentifier:(id)a3 completion:(id)a4
{
  id v8 = a3;
  uint64_t v5 = (void (**)(id, void *))a4;
  if (v5)
  {
    if (v8)
    {
      uint64_t v6 = PDLastUsedInAppFundingSourceForAccountIdentifier();
      id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
      v5[2](v5, v7);
    }

    else
    {
      v5[2](v5, 0LL);
    }
  }
}

- (void)updateLastUsedInAppFundingSource:(id)a3 accountIdentifier:(id)a4
{
  if (a4) {
    PDSetLastUsedInAppFundingSource(a4, a3);
  }
}

- (void)updateAccountUsersForAccountWithIdentifier:(id)a3 completion:(id)a4
{
}

- (void)_updateAccountUsersForAccountWithIdentifier:(id)a3 fromPush:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = -[PDAccountManagerUsersRequest initWithAccountIdentifier:fromPush:]( objc_alloc(&OBJC_CLASS___PDAccountManagerUsersRequest),  "initWithAccountIdentifier:fromPush:",  v9,  v5);

  -[PDAccountManagerUsersRequest addCompletion:](v10, "addCompletion:", v8);
  -[PDAccountManager _addAccountManagerFetchRequest:](self, "_addAccountManagerFetchRequest:", v10);
}

- (BOOL)_shouldProactivelyFetchAccountUsersForAccount:(id)a3 users:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v7)
  {
    id v8 = v7;
    char v9 = 0;
    id v10 = 0LL;
    uint64_t v11 = *(void *)v23;
    do
    {
      for (unint64_t i = 0LL; i != v8; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v6);
        }
        id v13 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)i);
        unsigned __int8 v14 = [v13 isDirty];
        if (!v10
          || (BOOL v15 = (void *)objc_claimAutoreleasedReturnValue([v13 lastUpdated]),
              [v15 timeIntervalSinceDate:v10],
              double v17 = v16,
              v15,
              v17 < 0.0))
        {
          uint64_t v18 = objc_claimAutoreleasedReturnValue([v13 lastUpdated]);

          id v10 = (void *)v18;
        }

        v9 |= v14;
      }

      id v8 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }

    while (v8);
  }

  else
  {
    char v9 = 0;
    id v10 = 0LL;
  }

  BOOL v19 = -[PDAccountManager _shouldProactivelyFetchEndpoint:dirty:lastUpdated:fetchPeriodEndpoint:account:]( self,  "_shouldProactivelyFetchEndpoint:dirty:lastUpdated:fetchPeriodEndpoint:account:",  3LL,  v9 & 1,  v10,  3LL,  v5);

  return v19;
}

- (void)_managerFetch_updateAccountUsersWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 accountIdentifier]);
  if (v8)
  {
    workQueue = self->_workQueue;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1001DC2B4;
    v11[3] = &unk_10063CD60;
    id v14 = v7;
    v11[4] = self;
    id v12 = v8;
    id v13 = v6;
    dispatch_async((dispatch_queue_t)workQueue, v11);
  }

  else if (v7)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKAccountErrorDomain,  3LL,  0LL));
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0LL, v10);
  }
}

- (void)_queue_updateSharedAccountCloudStoreIfNeccessaryForAccount:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 accountIdentifier]);
  char v9 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager sharedAccountCloudStoreForAccountIdentifier:]( self->_databaseManager,  "sharedAccountCloudStoreForAccountIdentifier:",  v8));
  id v10 = [v9 isDirty];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v9 lastUpdated]);
  LODWORD(v10) = -[PDAccountManager _shouldProactivelyFetchEndpoint:dirty:lastUpdated:fetchPeriodEndpoint:account:]( self,  "_shouldProactivelyFetchEndpoint:dirty:lastUpdated:fetchPeriodEndpoint:account:",  4LL,  v10,  v11,  4LL,  v7);

  if ((_DWORD)v10)
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_1001DCEEC;
    v19[3] = &unk_10064B648;
    id v12 = (id *)v20;
    id v13 = v8;
    v20[0] = v13;
    v20[1] = self;
    id v21 = v6;
    id v14 = v6;
    -[PDAccountManager updateSharedAccountCloudStoreWithAccountIdentifier:completion:]( self,  "updateSharedAccountCloudStoreWithAccountIdentifier:completion:",  v13,  v19);
  }

  else
  {
    replyQueue = self->_replyQueue;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_1001DCFF8;
    v17[3] = &unk_10063A830;
    id v12 = &v18;
    id v18 = v6;
    id v16 = v6;
    dispatch_async((dispatch_queue_t)replyQueue, v17);
  }
}

- (void)accountUsersForAccountWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_1001DD0B8;
    v9[3] = &unk_10064B698;
    v9[4] = self;
    id v11 = v7;
    id v10 = v6;
    -[PDAccountManager accountWithIdentifier:completion:](self, "accountWithIdentifier:completion:", v10, v9);
  }
}

- (void)accountUsersByAccountIdentifierForFeature:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_1001DD62C;
    v8[3] = &unk_10064B6C0;
    void v8[4] = self;
    unint64_t v10 = a3;
    id v9 = v6;
    -[PDAccountManager accountsWithCompletion:](self, "accountsWithCompletion:", v8);
  }
}

- (void)physicalCardsByAccountIdentifierForFeature:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_1001DD84C;
    v8[3] = &unk_10064B6C0;
    unint64_t v10 = a3;
    void v8[4] = self;
    id v9 = v6;
    -[PDAccountManager accountsWithCompletion:](self, "accountsWithCompletion:", v8);
  }
}

- (void)deleteAccountUserWithAltDSID:(id)a3 forAccountWithIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1001DDAA8;
  v12[3] = &unk_10064B620;
  id v13 = a4;
  id v14 = v8;
  BOOL v15 = self;
  id v16 = a5;
  id v9 = v16;
  id v10 = v8;
  id v11 = v13;
  -[PDAccountManager accountWithIdentifier:completion:](self, "accountWithIdentifier:completion:", v11, v12);
}

- (void)updateAccountUserPreferences:(id)a3 forAccountUserWithAltDSID:(id)a4 forAccountWithIdentifier:(id)a5 completion:(id)a6
{
  id v10 = a3;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1001DDD10;
  v15[3] = &unk_10064B788;
  v15[4] = self;
  id v16 = a4;
  id v17 = a5;
  id v18 = v10;
  id v19 = a6;
  id v11 = v19;
  id v12 = v10;
  id v13 = v17;
  id v14 = v16;
  -[PDAccountManager accountWithIdentifier:completion:](self, "accountWithIdentifier:completion:", v13, v15);
}

- (void)updateAccountUserNotificationSettings:(id)a3 forAccountUserWithAltDSID:(id)a4 forAccountWithIdentifier:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001DE0DC;
  block[3] = &unk_10063CD88;
  void block[4] = self;
  id v20 = v11;
  id v21 = v12;
  id v22 = v10;
  id v23 = v13;
  id v15 = v13;
  id v16 = v10;
  id v17 = v12;
  id v18 = v11;
  dispatch_async((dispatch_queue_t)workQueue, block);
}

- (void)insertOrUpdateLocalAccountUser:(id)a3 forAccountWithIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8 && v9)
  {
    workQueue = self->_workQueue;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1001DE300;
    v12[3] = &unk_10063B440;
    void v12[4] = self;
    id v13 = v9;
    id v14 = v8;
    id v15 = v10;
    dispatch_async((dispatch_queue_t)workQueue, v12);
  }
}

- (void)_managerFetch_updateAccountWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 accountIdentifier]);
  unsigned __int8 v9 = [v7 fetchExtendedAccount];

  uint64_t Object = PKLogFacilityTypeGetObject(14LL);
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v33 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Updating account with identifier %@",  buf,  0xCu);
  }

  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472LL;
  v29[2] = sub_1001DE704;
  v29[3] = &unk_10064B800;
  id v12 = v6;
  id v31 = v12;
  v29[4] = self;
  id v13 = v8;
  id v30 = v13;
  id v14 = objc_retainBlock(v29);
  uint64_t v15 = PKUIOnlyDemoModeEnabled(v14);
  if ((v15 & 1) == 0 && (PKStoreDemoModeEnabled(v15, v16) & 1) == 0)
  {
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_1001DE7B4;
    v24[3] = &unk_10064B878;
    unsigned __int8 v28 = v9;
    id v25 = v13;
    uint64_t v26 = self;
    id v27 = v14;
    -[PDAccountManager accountWithIdentifier:completion:](self, "accountWithIdentifier:completion:", v25, v24);

    id v20 = v25;
    goto LABEL_10;
  }

  id v17 = (__CFString *)v13;
  id v18 = v17;
  if (v17 == @"1234567890"
    || v17
    && (unsigned int v19 = -[__CFString isEqualToString:](v17, "isEqualToString:", @"1234567890"),
        v18,
        v19))
  {
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_1001DEC98;
    v21[3] = &unk_10064B8A0;
    v21[4] = self;
    unsigned __int8 v23 = v9;
    id v22 = v14;
    -[PDAccountManager accountWithIdentifier:completion:](self, "accountWithIdentifier:completion:", v18, v21);
    id v20 = v22;
LABEL_10:
  }
}

- (void)_processPhysicalCardsFromExtendedAccountResponse:(id)a3 accountIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a3 physicalCards]);
  if ([v7 count])
  {
    workQueue = self->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001DEE50;
    block[3] = &unk_100639350;
    void block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async((dispatch_queue_t)workQueue, block);
  }
}

- (void)deleteAccountWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t Object = PKLogFacilityTypeGetObject(14LL);
  unsigned __int8 v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Delete account with identifier %@", buf, 0xCu);
  }

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1001DF254;
  v12[3] = &unk_10064B940;
  void v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  -[PDAccountManager accountWithIdentifier:completion:](self, "accountWithIdentifier:completion:", v11, v12);
}

- (void)defaultAccountForFeature:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_1001DF690;
    v8[3] = &unk_10064B968;
    void v8[4] = self;
    id v9 = v6;
    unint64_t v10 = a3;
    -[PDAccountManager accountsWithCompletion:](self, "accountsWithCompletion:", v8);
  }
}

- (id)defaultAccountForFeature:(unint64_t)a3 forAccounts:(id)a4
{
  id v5 = a4;
  id v6 = v5;
  if (a3)
  {
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    id v7 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v7)
    {
      id v8 = v7;
      id v9 = 0LL;
      uint64_t v10 = *(void *)v21;
      while (1)
      {
        for (unint64_t i = 0LL; i != v8; unint64_t i = (char *)i + 1)
        {
          if (*(void *)v21 != v10) {
            objc_enumerationMutation(v6);
          }
          id v12 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)i);
          if ([v12 feature] == (id)a3)
          {
            if (!v9)
            {
              id v9 = v12;
              continue;
            }

            unint64_t v13 = sub_1001DF8A4(v9);
            unint64_t v14 = sub_1001DF8A4(v12);
            if (v13 != v14)
            {
              if (v14 >= v13) {
                continue;
              }
LABEL_16:
              id v18 = v12;

              id v9 = v18;
              continue;
            }

            uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v12 lastUpdated]);
            id v16 = (void *)objc_claimAutoreleasedReturnValue([v9 lastUpdated]);
            id v17 = [v15 compare:v16];

            if (PKAccountStateIsTerminal([v9 state])
              && (PKAccountStateIsTerminal([v12 state]) & 1) == 0
              || v17 == (id)1)
            {
              goto LABEL_16;
            }
          }
        }

        id v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (!v8) {
          goto LABEL_21;
        }
      }
    }
  }

  id v9 = 0LL;
LABEL_21:

  return v9;
}

- (void)performAccountAction:(id)a3 withAccountIdentifier:(id)a4 accountUserAltDSID:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = PKUIOnlyDemoModeEnabled(v13);
  if ((v14 & 1) == 0 && (PKStoreDemoModeEnabled(v14, v15) & 1) == 0)
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_1001DFA88;
    v19[3] = &unk_10064B788;
    id v20 = v11;
    id v21 = v12;
    id v22 = v10;
    __int128 v23 = self;
    id v24 = v13;
    -[PDAccountManager accountWithIdentifier:completion:](self, "accountWithIdentifier:completion:", v20, v19);

    goto LABEL_11;
  }

  id v16 = (__CFString *)v11;
  id v17 = v16;
  if (v16 == @"1234567890")
  {
    unsigned int v18 = 1;
  }

  else
  {
    if (!v16) {
      goto LABEL_11;
    }
    unsigned int v18 = -[__CFString isEqualToString:](v16, "isEqualToString:", @"1234567890");
  }

  if (v13 && v18) {
    (*((void (**)(id, void, void))v13 + 2))(v13, 0LL, 0LL);
  }
LABEL_11:
}

- (void)termsWithIdentifier:(id)a3 accepted:(BOOL)a4 withAccountIdentifier:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = (void (**)(id, void))a6;
  uint64_t v13 = PKUIOnlyDemoModeEnabled(v12);
  if ((v13 & 1) != 0 || (PKStoreDemoModeEnabled(v13, v14) & 1) != 0)
  {
    if (v12) {
      v12[2](v12, 0LL);
    }
  }

  else
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_1001DFF40;
    v15[3] = &unk_10064B9E0;
    id v16 = v11;
    BOOL v20 = a4;
    id v17 = v10;
    unsigned int v18 = self;
    unsigned int v19 = v12;
    -[PDAccountManager accountWithIdentifier:completion:](self, "accountWithIdentifier:completion:", v16, v15);
  }
}

- (void)userInfoForAccountIdentifier:(id)a3 forceFetch:(BOOL)a4 completion:(id)a5
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1001E021C;
  v10[3] = &unk_10064BA58;
  id v11 = a3;
  id v12 = a5;
  void v10[4] = self;
  BOOL v13 = a4;
  id v8 = v11;
  id v9 = v12;
  -[PDAccountManager accountWithIdentifier:completion:](self, "accountWithIdentifier:completion:", v8, v10);
}

- (void)_creditUserInfoForAccountIdentifier:(id)a3 forceFetch:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager primaryAccountIdentifierForAssociatedAccountIdentifier:]( self->_databaseManager,  "primaryAccountIdentifierForAssociatedAccountIdentifier:",  v8));
  if (v10)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[PKPaymentOptionsDefaults defaults](&OBJC_CLASS___PKPaymentOptionsDefaults, "defaults"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 defaultBillingAddressForPrimaryAccountIdentifier:v10]);
    if (!v12)
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 defaultBillingAddressForPrimaryAccountIdentifier:v8]);
      if (v12)
      {
        [v11 setDefaultBillingAddress:v12 forPrimaryAccountIdentifier:v10];
        [v11 deleteDefaultBillingAddressForPrimaryAccountIdentifier:v8];
      }
    }

    BOOL v13 = (void *)objc_claimAutoreleasedReturnValue( -[PDAccountManager _cacheKeyForUserInfoWithAccountIdentifier:]( self,  "_cacheKeyForUserInfoWithAccountIdentifier:",  v8));
    int BoolForKey = PKSharedCacheGetBoolForKey(v13, v14);
    if (!v12 || a4 || BoolForKey)
    {
      uint64_t Object = PKLogFacilityTypeGetObject(14LL);
      unsigned int v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Updating account user info", buf, 2u);
      }

      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472LL;
      void v20[2] = sub_1001E06D8;
      v20[3] = &unk_10064BA80;
      id v21 = v12;
      id v22 = v13;
      id v23 = v9;
      -[PDAccountManager _fetchCreditUserInfoForAccountIdentifier:completion:]( self,  "_fetchCreditUserInfoForAccountIdentifier:completion:",  v8,  v20);
    }

    else if (v9)
    {
      (*((void (**)(id, void *, void))v9 + 2))(v9, v12, 0LL);
    }
  }

  else if (v9)
  {
    uint64_t v16 = PKLogFacilityTypeGetObject(14LL);
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Cannot get userInfo for nil primaryAccountIdentifier",  buf,  2u);
    }

    (*((void (**)(id, void, void))v9 + 2))(v9, 0LL, 0LL);
  }
}

- (void)updateUserInfoForAccountIdentifier:(id)a3 contact:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1001E0830;
    v11[3] = &unk_10064B620;
    v11[4] = self;
    id v12 = v8;
    id v13 = v9;
    id v14 = v10;
    -[PDAccountManager accountWithIdentifier:completion:](self, "accountWithIdentifier:completion:", v12, v11);
  }
}

- (void)_fetchCreditUserInfoForAccountIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void (**)(void, void, void))v7;
  if (v7)
  {
    uint64_t v9 = PKUIOnlyDemoModeEnabled(v7);
    if ((v9 & 1) != 0 || (PKStoreDemoModeEnabled(v9, v10) & 1) != 0)
    {
      id v11 = (__CFString *)v6;
      if (v11 == @"1234567890"
        || (id v12 = v11) != 0LL
        && (unsigned int v13 = -[__CFString isEqualToString:](v11, "isEqualToString:", @"1234567890"),
            v12,
            v13))
      {
        id v14 = objc_alloc_init(&OBJC_CLASS___CNMutableContact);
        -[CNMutableContact setGivenName:](v14, "setGivenName:", @"John");
        -[CNMutableContact setFamilyName:](v14, "setFamilyName:", @"Appleseed");
        uint64_t v15 = objc_alloc_init(&OBJC_CLASS___CNMutablePostalAddress);
        -[CNMutablePostalAddress setStreet:](v15, "setStreet:", @"1 Apple Park Way");
        -[CNMutablePostalAddress setCity:](v15, "setCity:", @"Cupertino");
        -[CNMutablePostalAddress setState:](v15, "setState:", @"CA");
        -[CNMutablePostalAddress setCountry:](v15, "setCountry:", @"US");
        -[CNMutablePostalAddress setPostalCode:](v15, "setPostalCode:", @"95014");
        id v16 = -[CNMutablePostalAddress copy](v15, "copy");
        id v17 = (void *)objc_claimAutoreleasedReturnValue( +[CNLabeledValue labeledValueWithLabel:value:]( &OBJC_CLASS___CNLabeledValue,  "labeledValueWithLabel:value:",  CNLabelHome,  v16));

        id v23 = v17;
        unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v23, 1LL));
        -[CNMutableContact setPostalAddresses:](v14, "setPostalAddresses:", v18);

        id v19 = -[CNMutableContact copy](v14, "copy");
        ((void (**)(void, id, void))v8)[2](v8, v19, 0LL);
      }
    }

    else
    {
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472LL;
      void v20[2] = sub_1001E0F1C;
      v20[3] = &unk_10064B940;
      void v20[4] = self;
      id v21 = v6;
      id v22 = v8;
      -[PDAccountManager accountWithIdentifier:completion:](self, "accountWithIdentifier:completion:", v21, v20);
    }
  }
}

- (BOOL)_shouldFetchUpdatedUserInfo:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[PDAccountManager _cacheKeyForUserInfoWithAccountIdentifier:]( self,  "_cacheKeyForUserInfoWithAccountIdentifier:",  a3));
  char BoolForKey = PKSharedCacheGetBoolForKey(v3, v4);

  return BoolForKey;
}

- (id)_cacheKeyForUserInfoWithAccountIdentifier:(id)a3
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%@",  PKSharedCacheLastUserInfoUpdateKey,  a3);
}

- (void)_savingsUserInfoForAccountIdentifier:(id)a3 completion:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001E13C4;
  v7[3] = &unk_10064B940;
  id v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  -[PDAccountManager accountWithIdentifier:completion:](v8, "accountWithIdentifier:completion:", v6, v7);
}

- (void)_insertOrUpdateAccountServicingTokenNotificationWithAccount:(id)a3 notificationUserInfo:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 PKStringForKey:@"token"]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 PKDateForKey:@"expirationDate"]);

  if (v7 && v8)
  {
    id v9 = -[PDAccountServicingTokenUserNotification initWithAccount:servicingToken:expirationDate:]( objc_alloc(&OBJC_CLASS___PDAccountServicingTokenUserNotification),  "initWithAccount:servicingToken:expirationDate:",  v10,  v7,  v8);
    -[PDUserNotificationManager insertUserNotification:](self->_userNotificationManager, "insertUserNotification:", v9);
  }
}

- (void)_cleanupSavingsAccountPreferences:(id)a3
{
  id v4 = [a3 state];
  if (v4 == (id)1) {
    goto LABEL_2;
  }
  if (!a3 || v4 == (id)4)
  {
    PKSavingsSetHasDismissedEducationInterestMessage(0LL);
    PKSavingsSetPreviousAPYForUpdateMessage(0LL);
    PKSavingsSetHideCashTransferMessage(0LL);
    PKSavingsSetHasDismissedFixRewardsMessage(0LL);
    if (!a3)
    {
      id v4 = 0LL;
LABEL_2:
      PKSavingsSetHasDismissedClosedAccountMessage(v4);
      PKSavingsSetHasDismissedPendingApplicationMessage(0LL);
    }
  }

- (void)deleteBeneficiaryWithIdentifier:(id)a3 accountIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1001E185C;
  v12[3] = &unk_10064BB70;
  id v13 = a4;
  id v14 = v8;
  uint64_t v15 = self;
  id v16 = a5;
  id v9 = v8;
  id v10 = v13;
  id v11 = v16;
  -[PDAccountManager accountWithIdentifier:completion:](self, "accountWithIdentifier:completion:", v10, v12);
}

- (void)insertEvents:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001E1AC4;
  block[3] = &unk_100639AF0;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)workQueue, block);
}

- (void)eventsForAccountIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    workQueue = self->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001E22A0;
    block[3] = &unk_100639AF0;
    void block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async((dispatch_queue_t)workQueue, block);
  }
}

- (void)eventsForAccountIdentifier:(id)a3 types:(id)a4 startDate:(id)a5 endDate:(id)a6 orderedByDate:(int64_t)a7 limit:(unint64_t)a8 completion:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a9;
  if (v19)
  {
    workQueue = self->_workQueue;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_1001E2488;
    v21[3] = &unk_10064BBC0;
    v21[4] = self;
    id v22 = v15;
    id v23 = v16;
    id v24 = v17;
    id v25 = v18;
    int64_t v27 = a7;
    unint64_t v28 = a8;
    id v26 = v19;
    dispatch_async((dispatch_queue_t)workQueue, v21);
  }
}

- (void)eventWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    workQueue = self->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001E2600;
    block[3] = &unk_100639AF0;
    void block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async((dispatch_queue_t)workQueue, block);
  }
}

- (void)deleteEventsWithAccountIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001E2760;
  block[3] = &unk_100639AF0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)workQueue, block);
}

- (void)deleteEventWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001E2AA0;
  block[3] = &unk_100639AF0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)workQueue, block);
}

- (void)deleteEventsWithAccountIdentifier:(id)a3 excludingTypes:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  workQueue = self->_workQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1001E2D08;
  v15[3] = &unk_10063B440;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async((dispatch_queue_t)workQueue, v15);
}

- (void)lastRedemptionEventToDestination:(unint64_t)a3 forAccountIdentifier:(id)a4 altDSID:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v12)
  {
    workQueue = self->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001E3080;
    block[3] = &unk_10063B150;
    void block[4] = self;
    unint64_t v18 = a3;
    id v15 = v10;
    id v16 = v11;
    id v17 = v12;
    dispatch_async((dispatch_queue_t)workQueue, block);
  }
}

- (void)_processRewardsRedemptionEvent:(id)a3
{
  id v91 = a3;
  if (([v91 updateReasonIsInitialDownload] & 1) == 0)
  {
    uint64_t v4 = PKSharedCacheFirstTimeDailyCashKey;
    if (!PKSharedCacheGetIntegerForKey(PKSharedCacheFirstTimeDailyCashKey))
    {
      databaseManager = self->_databaseManager;
      id v6 = (void *)objc_claimAutoreleasedReturnValue([v91 accountIdentifier]);
      id v7 = -[PDDatabaseManager successfulRedemptionEventsToPeerPaymentForAccountIdentifier:]( databaseManager,  "successfulRedemptionEventsToPeerPaymentForAccountIdentifier:",  v6);

      if (v7)
      {
        if (v7 == (id)1) {
          id v8 = &off_100690200;
        }
        else {
          id v8 = &off_1006901B8;
        }
        PKSharedCacheSetObjectForKey(v8, v4);
      }
    }
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v91 items]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 anyObject]);

  if (v10)
  {
    uint64_t v12 = objc_opt_class(&OBJC_CLASS___PKAccountRewards, v11);
    if ((objc_opt_isKindOfClass(v10, v12) & 1) != 0)
    {
      id v13 = (__CFString *)(id)objc_claimAutoreleasedReturnValue([v10 status]);
      if (v13 == @"success"
        || (id v14 = v13) != 0LL
        && (unsigned int v15 = -[__CFString isEqualToString:](v13, "isEqualToString:", @"success"),
            v14,
            v14,
            v15))
      {
        v89 = (void *)objc_claimAutoreleasedReturnValue([v91 accountIdentifier]);
        id v88 = (void *)objc_claimAutoreleasedReturnValue(-[PDDatabaseManager accountWithIdentifier:](self->_databaseManager, "accountWithIdentifier:"));
        id v87 = (void *)objc_claimAutoreleasedReturnValue([v88 associatedPassUniqueID]);
        id v16 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager transactionSourceIdentifiersForPassUniqueIdentifier:]( self->_databaseManager,  "transactionSourceIdentifiersForPassUniqueIdentifier:"));
        __int128 v94 = (void *)objc_claimAutoreleasedReturnValue([v16 anyObject]);

        id v17 = self->_databaseManager;
        unint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v91 identifier]);
        id v19 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager transactionWithReferenceIdentifier:]( v17,  "transactionWithReferenceIdentifier:",  v18));

        id v93 = self;
        if (v19)
        {
          if ([v19 suppressBehavior] == (id)1)
          {
LABEL_53:
            id v86 = v19;
            id v51 = [v10 type];
            __int128 v99 = 0u;
            __int128 v100 = 0u;
            __int128 v101 = 0u;
            __int128 v102 = 0u;
            v90 = v10;
            id v52 = (void *)objc_claimAutoreleasedReturnValue([v10 transactionIdentifiers]);
            id v53 = [v52 countByEnumeratingWithState:&v99 objects:v116 count:16];
            if (v53)
            {
              id v54 = v53;
              uint64_t v55 = *(void *)v100;
              do
              {
                for (unint64_t i = 0LL; i != v54; unint64_t i = (char *)i + 1)
                {
                  if (*(void *)v100 != v55) {
                    objc_enumerationMutation(v52);
                  }
                  __int128 v57 = *(void **)(*((void *)&v99 + 1) + 8LL * (void)i);
                  __int128 v58 = objc_autoreleasePoolPush();
                  __int128 v59 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager transactionWithServiceIdentifier:transactionSourceIdentifier:]( self->_databaseManager,  "transactionWithServiceIdentifier:transactionSourceIdentifier:",  v57,  v94));
                  __int128 v60 = v59;
                  if (v59 && [v59 redemptionType] != v51)
                  {
                    uint64_t Object = PKLogFacilityTypeGetObject(14LL);
                    __int128 v62 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
                    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412290;
                      id v112 = v57;
                      _os_log_impl( (void *)&_mh_execute_header,  v62,  OS_LOG_TYPE_DEFAULT,  "Updating redemption type for transaction %@",  buf,  0xCu);
                    }

                    self = v93;
                    id v63 =  -[PDDatabaseManager updateRedemptionType:forPaymentTransaction:sourceIdentifier:]( v93->_databaseManager,  "updateRedemptionType:forPaymentTransaction:sourceIdentifier:",  v51,  v60,  v94);
                  }

                  objc_autoreleasePoolPop(v58);
                }

                id v54 = [v52 countByEnumeratingWithState:&v99 objects:v116 count:16];
              }

              while (v54);
            }

            __int128 v97 = 0u;
            __int128 v98 = 0u;
            __int128 v95 = 0u;
            __int128 v96 = 0u;
            id obj = (void *)objc_claimAutoreleasedReturnValue([v90 rewardsAddedIdentifiers]);
            id v64 = [obj countByEnumeratingWithState:&v95 objects:v115 count:16];
            unsigned int v65 = &_s10Foundation22_convertErrorToNSErrorySo0E0Cs0C0_pF_ptr;
            if (v64)
            {
              id v66 = v64;
              uint64_t v67 = *(void *)v96;
              do
              {
                for (j = 0LL; j != v66; j = (char *)j + 1)
                {
                  if (*(void *)v96 != v67) {
                    objc_enumerationMutation(obj);
                  }
                  id v69 = *(void **)(*((void *)&v95 + 1) + 8LL * (void)j);
                  id v70 = objc_autoreleasePoolPush();
                  uint64_t v71 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager accountEventWithIdentifier:]( self->_databaseManager,  "accountEventWithIdentifier:",  v69));
                  unsigned int v72 = v71;
                  if (v71)
                  {
                    v73 = (void *)objc_claimAutoreleasedReturnValue([v71 items]);
                    unsigned int v74 = (void *)objc_claimAutoreleasedReturnValue([v73 anyObject]);

                    uint64_t v76 = objc_opt_class(v65[464], v75);
                    if ((objc_opt_isKindOfClass(v74, v76) & 1) != 0 && ![v74 type])
                    {
                      uint64_t v78 = PKLogFacilityTypeGetObject(14LL);
                      id v79 = (os_log_s *)objc_claimAutoreleasedReturnValue(v78);
                      if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
                      {
                        uint64_t v80 = PKAccountRewardRedemptionTypeToString(v51);
                        id v81 = (void *)objc_claimAutoreleasedReturnValue(v80);
                        *(_DWORD *)buf = 138412546;
                        id v112 = v81;
                        __int16 v113 = 2112;
                        __int128 v114 = v69;
                        _os_log_impl( (void *)&_mh_execute_header,  v79,  OS_LOG_TYPE_DEFAULT,  "Updating redemption type to %@ for event %@",  buf,  0x16u);

                        unsigned int v65 = &_s10Foundation22_convertErrorToNSErrorySo0E0Cs0C0_pF_ptr;
                      }

                      [v74 setType:v51];
                      self = v93;
                      -[PDDatabaseManager insertOrUpdateAccountEvent:]( v93->_databaseManager,  "insertOrUpdateAccountEvent:",  v72);
                    }

                    else
                    {
                      self = v93;
                    }
                  }

                  else
                  {
                    uint64_t v77 = PKLogFacilityTypeGetObject(14LL);
                    unsigned int v74 = (void *)objc_claimAutoreleasedReturnValue(v77);
                    if (os_log_type_enabled((os_log_t)v74, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412290;
                      id v112 = v69;
                      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v74,  OS_LOG_TYPE_DEFAULT,  "Could not find rewards added with identifier %@",  buf,  0xCu);
                    }
                  }

                  objc_autoreleasePoolPop(v70);
                }

                id v66 = [obj countByEnumeratingWithState:&v95 objects:v115 count:16];
              }

              while (v66);
            }

            id v10 = v90;
            goto LABEL_84;
          }

          BOOL v20 = (void *)objc_claimAutoreleasedReturnValue([v10 transactionIdentifiers]);
          if ([v20 count])
          {
          }

          else
          {
            id v25 = (void *)objc_claimAutoreleasedReturnValue([v10 rewardsAddedIdentifiers]);
            id v26 = [v25 count];

            if (!v26)
            {
              uint64_t v82 = PKLogFacilityTypeGetObject(14LL);
              id v83 = (os_log_s *)objc_claimAutoreleasedReturnValue(v82);
              if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                id v112 = v91;
                _os_log_impl( (void *)&_mh_execute_header,  v83,  OS_LOG_TYPE_DEFAULT,  "Disbursement has no associated transactions or added events: %@",  buf,  0xCu);
              }

              userNotificationManager = self->_userNotificationManager;
              int v85 = (void *)objc_claimAutoreleasedReturnValue( +[PDPassPaymentTransactionUserNotification notificationIdentifierForPaymentTransaction:]( &OBJC_CLASS___PDPassPaymentTransactionUserNotification,  "notificationIdentifierForPaymentTransaction:",  v19));
              -[PDUserNotificationManager removeUserNotificationWithIdentifier:]( userNotificationManager,  "removeUserNotificationWithIdentifier:",  v85);

              goto LABEL_53;
            }
          }

          __int128 v109 = 0u;
          __int128 v110 = 0u;
          __int128 v107 = 0u;
          __int128 v108 = 0u;
          int64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v10 transactionIdentifiers]);
          id v28 = [v27 countByEnumeratingWithState:&v107 objects:v118 count:16];
          if (v28)
          {
            id v29 = v28;
            uint64_t v30 = *(void *)v108;
            while (2)
            {
              for (k = 0LL; k != v29; k = (char *)k + 1)
              {
                if (*(void *)v108 != v30) {
                  objc_enumerationMutation(v27);
                }
                id v32 = *(void **)(*((void *)&v107 + 1) + 8LL * (void)k);
                id v33 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager ambiguousTransactionWithServiceIdentifier:]( self->_databaseManager,  "ambiguousTransactionWithServiceIdentifier:",  v32));

                if (!v33)
                {
                  uint64_t v35 = PKLogFacilityTypeGetObject(23LL);
                  id v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
                  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    id v112 = v32;
                    _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "No card transaction for identifier: %@",  buf,  0xCu);
                  }

                  char v34 = 1;
                  self = v93;
                  goto LABEL_34;
                }

                self = v93;
              }

              id v29 = [v27 countByEnumeratingWithState:&v107 objects:v118 count:16];
              if (v29) {
                continue;
              }
              break;
            }
          }

          char v34 = 0;
LABEL_34:

          __int128 v105 = 0u;
          __int128 v106 = 0u;
          __int128 v103 = 0u;
          __int128 v104 = 0u;
          id v37 = (void *)objc_claimAutoreleasedReturnValue([v10 rewardsAddedIdentifiers]);
          id v38 = [v37 countByEnumeratingWithState:&v103 objects:v117 count:16];
          if (v38)
          {
            id v39 = v38;
            uint64_t v40 = *(void *)v104;
            while (2)
            {
              for (m = 0LL; m != v39; m = (char *)m + 1)
              {
                if (*(void *)v104 != v40) {
                  objc_enumerationMutation(v37);
                }
                uint64_t v42 = *(void **)(*((void *)&v103 + 1) + 8LL * (void)m);
                id v43 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager accountEventWithIdentifier:]( self->_databaseManager,  "accountEventWithIdentifier:",  v42));

                if (!v43)
                {
                  uint64_t v48 = PKLogFacilityTypeGetObject(23LL);
                  __int128 v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
                  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    id v112 = v42;
                    _os_log_impl( (void *)&_mh_execute_header,  v49,  OS_LOG_TYPE_DEFAULT,  "No rewards added event for identifier: %@",  buf,  0xCu);
                  }

                  self = v93;
                  goto LABEL_49;
                }

                self = v93;
              }

              id v39 = [v37 countByEnumeratingWithState:&v103 objects:v117 count:16];
              if (v39) {
                continue;
              }
              break;
            }
          }

          if ((v34 & 1) == 0)
          {
            uint64_t v44 = PKLogFacilityTypeGetObject(14LL);
            uint64_t v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
            if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue([v19 serviceIdentifier]);
              *(_DWORD *)buf = 138412290;
              id v112 = v46;
              _os_log_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_DEFAULT,  "Suppressing transaction from UI: %@",  buf,  0xCu);
            }

            id v47 =  -[PDDatabaseManager updateSuppressBehavior:forPaymentTransaction:sourceIdentifier:]( self->_databaseManager,  "updateSuppressBehavior:forPaymentTransaction:sourceIdentifier:",  1LL,  v19,  v94);
            goto LABEL_53;
          }

- (void)_processRewardsAddedEvent:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 items]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 anyObject]);

  uint64_t v8 = objc_opt_class(&OBJC_CLASS___PKAccountRewards, v7);
  if ((objc_opt_isKindOfClass(v6, v8) & 1) != 0 && ![v6 type])
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager redemptionAccountEventWithRewardsAddedIdentifier:]( self->_databaseManager,  "redemptionAccountEventWithRewardsAddedIdentifier:",  v9));
    uint64_t v11 = v10;
    if (v10 && [v10 type] == (id)1)
    {
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 items]);
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 anyObject]);

      uint64_t v15 = objc_opt_class(&OBJC_CLASS___PKAccountRewards, v14);
      if ((objc_opt_isKindOfClass(v13, v15) & 1) != 0 && [v13 type])
      {
        objc_msgSend(v6, "setType:", objc_msgSend(v13, "type"));
        -[PDDatabaseManager insertOrUpdateAccountEvent:](self->_databaseManager, "insertOrUpdateAccountEvent:", v4);
      }

      databaseManager = self->_databaseManager;
      id v17 = (void *)objc_claimAutoreleasedReturnValue([v11 identifier]);
      unint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager transactionWithReferenceIdentifier:]( databaseManager,  "transactionWithReferenceIdentifier:",  v17));

      if (v18)
      {
        uint64_t Object = PKLogFacilityTypeGetObject(14LL);
        BOOL v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v18 serviceIdentifier]);
          int v26 = 138412290;
          int64_t v27 = v21;
          _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Suppressing transaction from UI following rewards added event: %@",  (uint8_t *)&v26,  0xCu);
        }

        id v22 = self->_databaseManager;
        id v23 = (void *)objc_claimAutoreleasedReturnValue([v18 transactionSourceIdentifier]);
        id v24 =  -[PDDatabaseManager updateSuppressBehavior:forPaymentTransaction:sourceIdentifier:]( v22,  "updateSuppressBehavior:forPaymentTransaction:sourceIdentifier:",  1LL,  v18,  v23);
      }
    }

    else
    {
      uint64_t v25 = PKLogFacilityTypeGetObject(14LL);
      id v13 = (void *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_DEFAULT))
      {
        int v26 = 138412290;
        int64_t v27 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v13,  OS_LOG_TYPE_DEFAULT,  "Could not find redemption event for rewards added: %@",  (uint8_t *)&v26,  0xCu);
      }
    }
  }
}

- (void)_processUserInfoUpdateEvent:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 items]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 anyObject]);

  uint64_t v8 = objc_opt_class(&OBJC_CLASS___PKAccountUserInfoUpdate, v7);
  if ((objc_opt_isKindOfClass(v6, v8) & 1) != 0)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 updatedDate]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 accountIdentifier]);
    uint64_t Object = PKLogFacilityTypeGetObject(14LL);
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "User info event update received", buf, 2u);
    }

    [v9 timeIntervalSinceNow];
    if (v13 > -300.0)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v15 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "User info event update deferred to next view of account details",  v15,  2u);
      }

      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( -[PDAccountManager _cacheKeyForUserInfoWithAccountIdentifier:]( self,  "_cacheKeyForUserInfoWithAccountIdentifier:",  v10));
      PKSharedCacheSetBoolForKey(1LL, v14);
    }
  }
}

- (void)_processPaymentFailed:(id)a3
{
  id v9 = a3;
  unsigned __int8 v3 = [v9 updateReasonIsInitialDownload];
  id v4 = v9;
  if ((v3 & 1) == 0)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v9 items]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 anyObject]);

    uint64_t v8 = objc_opt_class(&OBJC_CLASS___PKAccountPayment, v7);
    if ((objc_opt_isKindOfClass(v6, v8) & 1) != 0) {
      PKSharedCacheSetBoolForKey(1LL, PKSharedCachePaymentFailedKey);
    }

    id v4 = v9;
  }
}

- (void)_processVirtualCardStatusUpdateEvent:(id)a3
{
  id v3 = a3;
  if (([v3 updateReasonIsInitialDownload] & 1) == 0)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 items]);
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 anyObject]);

    uint64_t v7 = objc_opt_class(&OBJC_CLASS___PKAccountVirtualCardStatusUpdate, v6);
    if ((objc_opt_isKindOfClass(v5, v7) & 1) == 0)
    {
LABEL_13:

      goto LABEL_14;
    }

    uint64_t v8 = (char *)[v5 reason];
    uint64_t Object = PKLogFacilityTypeGetObject(14LL);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t updated = PKStringFromAccountVirtualCardStatusUpdateReason(v8);
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(updated);
      *(_DWORD *)buf = 138412290;
      id v22 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Virtual card event update received of type: %@",  buf,  0xCu);
    }

    double v13 = (void *)objc_claimAutoreleasedReturnValue([v5 updatedVirtualCards]);
    if ((unint64_t)(v8 - 2) >= 3)
    {
      if (v8 != (char *)1)
      {
LABEL_12:

        goto LABEL_13;
      }

      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v3 accountIdentifier]);
      PKAppleCardSetShouldShowVPANUpdatedMessage(v14, 1LL);
    }

    if ([v13 count] == (id)1)
    {
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v13 firstObject]);
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 lastUpdatedDate]);
      [v16 timeIntervalSinceNow];
      double v18 = v17;

      if (v18 > -172800.0)
      {
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472LL;
        v19[2] = sub_1001E4204;
        v19[3] = &unk_10064B338;
        id v20 = v15;
        +[PKVirtualCard queryKeychainForVirtualCards:]( &OBJC_CLASS___PKVirtualCard,  "queryKeychainForVirtualCards:",  v19);
      }
    }

    goto LABEL_12;
  }

- (void)_notifyPhysicalCardsChangedWithAccountEvent:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 accountIdentifier]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager physicalCardsForAccountWithIdentifier:]( self->_databaseManager,  "physicalCardsForAccountWithIdentifier:",  v4));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1001E443C;
  v8[3] = &unk_10064B8F0;
  void v8[4] = self;
  id v9 = v5;
  id v10 = v4;
  id v6 = v4;
  id v7 = v5;
  -[PDAccountManager _accessObserversWithHandler:](self, "_accessObserversWithHandler:", v8);
}

- (void)processPhysicalCardExpirationMessaging:(id)a3 physicalCards:(id)a4 account:(id)a5
{
  id v66 = a3;
  id v8 = a4;
  id v70 = a5;
  uint64_t v9 = objc_claimAutoreleasedReturnValue([v70 accountIdentifier]);
  uint64_t v71 = self;
  id v68 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager passUniqueIdentifierWithAssociatedAccountIdentifier:]( self->_databaseManager,  "passUniqueIdentifierWithAssociatedAccountIdentifier:",  v9));
  uint64_t Object = PKLogFacilityTypeGetObject(14LL);
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v85 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Updating physical card expiration messaging for account %@",  buf,  0xCu);
  }

  oslog = v11;
  unsigned int v74 = (void *)v9;

  __int128 v82 = 0u;
  __int128 v83 = 0u;
  __int128 v80 = 0u;
  __int128 v81 = 0u;
  id obj = v8;
  id v12 = [obj countByEnumeratingWithState:&v80 objects:v89 count:16];
  if (!v12)
  {
    uint64_t v14 = 0LL;
    unsigned int v72 = 0LL;
    goto LABEL_31;
  }

  id v13 = v12;
  unsigned int v72 = 0LL;
  uint64_t v14 = 0LL;
  uint64_t v15 = *(void *)v81;
  while (2)
  {
    id v16 = 0LL;
    do
    {
      if (*(void *)v81 != v15) {
        objc_enumerationMutation(obj);
      }
      double v17 = *(void **)(*((void *)&v80 + 1) + 8LL * (void)v16);
      uint64_t v18 = objc_claimAutoreleasedReturnValue([v17 accountUserAltDSID]);
      id v19 = (void *)v18;
      if (!v18) {
        goto LABEL_14;
      }
      uint64_t v20 = PKCurrentUserAltDSID(v18);
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      id v22 = v19;
      id v23 = v21;
      if (v22 == v23)
      {

LABEL_14:
        int v26 = (char *)[v17 state];
        if ((unint64_t)(v26 - 2) >= 3)
        {
          if (v26 != (char *)5)
          {
            if (v26 == (char *)1)
            {
              if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl( (void *)&_mh_execute_header,  oslog,  OS_LOG_TYPE_DEFAULT,  "User has unactivated physical card, not showing messaging",  buf,  2u);
              }

              id v75 = obj;
LABEL_105:
              id v31 = v70;
              id v32 = v74;
              goto LABEL_106;
            }

            goto LABEL_17;
          }

          int64_t v27 = -[NSCalendar initWithCalendarIdentifier:]( objc_alloc(&OBJC_CLASS___NSCalendar),  "initWithCalendarIdentifier:",  NSCalendarIdentifierGregorian);
          id v28 = (void *)objc_claimAutoreleasedReturnValue([v70 productTimeZone]);
          -[NSCalendar setTimeZone:](v27, "setTimeZone:", v28);

          if ([v17 isExpiredInCalendar:v27])
          {
            id v29 = v17;

            unsigned int v72 = v29;
          }
        }

        else
        {
          int64_t v27 = v14;
          uint64_t v14 = v17;
        }

LABEL_17:
        if (v14 && v72)
        {

          goto LABEL_31;
        }

        goto LABEL_24;
      }

      id v24 = v23;
      if (!v23)
      {

        goto LABEL_24;
      }

      unsigned __int8 v25 = [v22 isEqualToString:v23];

      if ((v25 & 1) != 0) {
        goto LABEL_14;
      }
LABEL_24:

      id v16 = (char *)v16 + 1;
    }

    while (v13 != v16);
    id v30 = [obj countByEnumeratingWithState:&v80 objects:v89 count:16];
    id v13 = v30;
    if (v30) {
      continue;
    }
    break;
  }

- (id)_expirationMessagingStartDateForMessagingInfo:(id)a3 account:(id)a4 now:(id)a5
{
  id v6 = a3;
  id v7 = a5;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"));
  uint64_t v9 = (char *)[v6 scatterInterval];
  else {
    uint64_t v10 = (uint64_t)v9;
  }
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v7 dateByAddingTimeInterval:(double)v10]);
  if ((char *)[v8 component:32 fromDate:v11] - 7 >= (char *)0xC)
  {

LABEL_9:
    uint64_t v14 = objc_alloc_init(&OBJC_CLASS___NSDateComponents);
    -[NSDateComponents setHour:](v14, "setHour:", 7LL);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v8 nextDateAfterDate:v7 matchingComponents:v14 options:0]);
    id v16 = [v15 dateByAddingTimeInterval:(double)arc4random_uniform(0xA8C0u)];
    id v13 = (void *)objc_claimAutoreleasedReturnValue(v16);

    goto LABEL_10;
  }

  id v12 = [v7 dateByAddingTimeInterval:(double)arc4random_uniform(v10)];
  id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  if (!v13) {
    goto LABEL_9;
  }
LABEL_10:

  return v13;
}

- (void)updateCreditStatementsForAccountIdentifier:(id)a3 completion:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001E4FCC;
  v7[3] = &unk_10064BBE8;
  id v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  -[PDAccountManager _downloadCreditStatementsForAccountIdentifier:withCompletion:]( v8,  "_downloadCreditStatementsForAccountIdentifier:withCompletion:",  v6,  v7);
}

- (void)creditStatementsForAccountIdentifier:(id)a3 completion:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1001E53D8;
  v6[3] = &unk_10064B7D8;
  id v7 = self;
  id v8 = a4;
  id v5 = v8;
  -[PDAccountManager accountWithIdentifier:completion:](v7, "accountWithIdentifier:completion:", a3, v6);
}

- (void)creditStatementsForStatementIdentifiers:(id)a3 accountIdentifier:(id)a4 completion:(id)a5
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1001E5868;
  v10[3] = &unk_10064BC38;
  id v11 = a3;
  id v12 = a5;
  void v10[4] = self;
  id v8 = v11;
  id v9 = v12;
  -[PDAccountManager accountWithIdentifier:completion:](self, "accountWithIdentifier:completion:", a4, v10);
}

- (void)_creditStatementsForAccountIdentifier:(id)a3 completion:(id)a4
{
  id v8 = a3;
  id v6 = (void (**)(id, void *, void))a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager creditAccountStatementsForAccountIdentifier:]( self->_databaseManager,  "creditAccountStatementsForAccountIdentifier:",  v8));
  if (v6) {
    v6[2](v6, v7, 0LL);
  }
  if (-[PDAccountManager _shouldDownloadCreditStatementsForAccountIdentifier:]( self,  "_shouldDownloadCreditStatementsForAccountIdentifier:",  v8))
  {
    -[PDAccountManager updateCreditStatementsForAccountIdentifier:completion:]( self,  "updateCreditStatementsForAccountIdentifier:completion:",  v8,  0LL);
  }
}

- (void)_publishStatementsChangedForAccountIdentifier:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1001E5C80;
  v4[3] = &unk_10064B2C0;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  -[PDAccountManager _accessObserversWithHandler:](v5, "_accessObserversWithHandler:", v4);
}

- (id)_cacheKeyForCreditStatementsWithAccountIdentifier:(id)a3
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%@",  PKSharedCacheLastCreditStatementDownloadKey,  a3);
}

- (BOOL)_shouldDownloadCreditStatementsForAccountIdentifier:(id)a3
{
  id v3 = self;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[PDAccountManager _cacheKeyForCreditStatementsWithAccountIdentifier:]( self,  "_cacheKeyForCreditStatementsWithAccountIdentifier:",  a3));
  uint64_t DateForKey = PKSharedCacheGetDateForKey();
  id v6 = (void *)objc_claimAutoreleasedReturnValue(DateForKey);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  LOBYTE(v3) = -[PDAccountManager _shouldDownloadCreditStatementsForLastStatementDownload:now:]( v3,  "_shouldDownloadCreditStatementsForLastStatementDownload:now:",  v6,  v7);

  return (char)v3;
}

- (BOOL)_shouldDownloadCreditStatementsForLastStatementDownload:(id)a3 now:(id)a4
{
  if (!a3) {
    return 1;
  }
  id v5 = a4;
  id v6 = a3;
  id v7 = -[NSCalendar initWithCalendarIdentifier:]( objc_alloc(&OBJC_CLASS___NSCalendar),  "initWithCalendarIdentifier:",  NSCalendarIdentifierGregorian);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSCalendar components:fromDate:](v7, "components:fromDate:", 12LL, v6));

  id v9 = [v8 year];
  id v10 = [v8 month];
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSCalendar components:fromDate:](v7, "components:fromDate:", 28LL, v5));

  id v12 = [v11 year];
  id v13 = [v11 month];
  uint64_t v14 = (uint64_t)[v11 day];
  BOOL v16 = (uint64_t)v12 > (uint64_t)v9 || (uint64_t)v13 > (uint64_t)v10;
  BOOL v17 = v14 >= 2 && v16;

  return v17;
}

- (void)_downloadCreditStatementsForAccountIdentifier:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void (**)(void, void, void))v7;
  if (v7)
  {
    uint64_t v9 = PKUIOnlyDemoModeEnabled(v7);
    if ((v9 & 1) != 0 || (PKStoreDemoModeEnabled(v9, v10) & 1) != 0)
    {
      id v11 = (__CFString *)v6;
      if (v11 == @"1234567890"
        || (id v12 = v11) != 0LL
        && (unsigned int v13 = -[__CFString isEqualToString:](v11, "isEqualToString:", @"1234567890"),
            v12,
            v13))
      {
        v8[2](v8, 0LL, 0LL);
      }
    }

    else
    {
      uint64_t Object = PKLogFacilityTypeGetObject(14LL);
      uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v21 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Downloading credit statements for account %@",  buf,  0xCu);
      }

      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472LL;
      v16[2] = sub_1001E6004;
      v16[3] = &unk_10064B940;
      id v17 = v6;
      uint64_t v18 = self;
      id v19 = v8;
      -[PDAccountManager accountWithIdentifier:completion:](self, "accountWithIdentifier:completion:", v17, v16);
    }
  }
}

- (void)updateSavingsStatementsForAccountIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001E6314;
  block[3] = &unk_100639AF0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)workQueue, block);
}

- (void)savingsStatementsForAccountIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001E68A4;
  block[3] = &unk_100639AF0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)workQueue, block);
}

- (void)updateTaxFormsForAccountIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001E6A10;
  block[3] = &unk_100639AF0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)workQueue, block);
}

- (void)taxFormsForAccountIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001E6F44;
  block[3] = &unk_100639AF0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)workQueue, block);
}

- (void)createVirtualCard:(int64_t)a3 forAccountIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if ((PKBAAUtilitiesAvailable() & 1) != 0)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1001E7160;
    v13[3] = &unk_10064BDA0;
    id v15 = v9;
    v13[4] = self;
    id v14 = v8;
    int64_t v16 = a3;
    -[PDAccountManager accountWithIdentifier:completion:](self, "accountWithIdentifier:completion:", v14, v13);

    id v10 = v15;
LABEL_7:

    goto LABEL_8;
  }

  uint64_t Object = PKLogFacilityTypeGetObject(14LL);
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Error calling create virtual card, BAA utilities unavailable",  buf,  2u);
  }

  if (v9)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKAccountErrorDomain,  8LL,  0LL));
    (*((void (**)(id, void, void, void *))v9 + 2))(v9, 0LL, 0LL, v10);
    goto LABEL_7;
  }

- (void)performVirtualCardAction:(int64_t)a3 forVirtualCardIdentifier:(id)a4 forAccountIdentifier:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = -[PDAccountManagerVirtualCardActionRequest initWithAccountIdentifier:]( objc_alloc(&OBJC_CLASS___PDAccountManagerVirtualCardActionRequest),  "initWithAccountIdentifier:",  v11);

  -[PDAccountManagerVirtualCardActionRequest setVirtualCardIdentifier:](v13, "setVirtualCardIdentifier:", v12);
  -[PDAccountManagerVirtualCardActionRequest setAction:](v13, "setAction:", a3);
  -[PDAccountManagerVirtualCardActionRequest addCompletion:](v13, "addCompletion:", v10);

  -[PDAccountManager _addAccountManagerFetchRequest:](self, "_addAccountManagerFetchRequest:", v13);
}

- (void)_managerFetch_performVirtualCardActionWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((PKBAAUtilitiesAvailable() & 1) != 0)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 accountIdentifier]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 virtualCardIdentifier]);
    id v10 = [v6 action];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_1001E7C30;
    v15[3] = &unk_10064BEB8;
    void v15[4] = self;
    id v16 = v9;
    id v18 = v7;
    id v19 = v10;
    id v17 = v8;
    id v11 = v8;
    id v12 = v9;
    -[PDAccountManager accountWithIdentifier:completion:](self, "accountWithIdentifier:completion:", v11, v15);

LABEL_7:
    goto LABEL_8;
  }

  uint64_t Object = PKLogFacilityTypeGetObject(14LL);
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Error calling virtual card action, BAA utilities unavailable",  buf,  2u);
  }

  if (v7)
  {
    id v12 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKAccountErrorDomain,  8LL,  0LL));
    (*((void (**)(id, void, void, id))v7 + 2))(v7, 0LL, 0LL, v12);
    goto LABEL_7;
  }

- (void)updateVirtualCardsWithAccountIdentifier:(id)a3 completion:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1001E87AC;
  v8[3] = &unk_10064BC38;
  id v9 = a3;
  id v10 = a4;
  void v8[4] = self;
  id v6 = v9;
  id v7 = v10;
  -[PDAccountManager accountWithIdentifier:completion:](self, "accountWithIdentifier:completion:", v6, v8);
}

- (void)cardCredentialsForVirtualCard:(id)a3 authorization:(id)a4 action:(int64_t)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = v12;
  if (v11 && v12)
  {
    unsigned int v14 = [v10 hasSensitiveCredentials];
    if ([v10 hasDynamicSecurityCode])
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v10 securityCodeExpiration]);
      BOOL v17 = [v15 compare:v16] == (id)1;

      if (!v14) {
        goto LABEL_11;
      }
    }

    else
    {
      BOOL v17 = 0;
      if (!v14)
      {
LABEL_11:
        uint64_t Object = PKLogFacilityTypeGetObject(14LL);
        uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          id v21 = @"NO";
          if (v14) {
            id v22 = @"YES";
          }
          else {
            id v22 = @"NO";
          }
          if (v17) {
            id v21 = @"YES";
          }
          *(_DWORD *)buf = 138412546;
          id v38 = v22;
          __int16 v39 = 2112;
          uint64_t v40 = v21;
          _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Virtual card hasSensitiveCredentials: %@, hasExpiredDynamicSecurityCode: %@; try fetching",
            buf,
            0x16u);
        }

        id v23 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);
        id v24 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager accountWithVirtualCardIdentifier:]( self->_databaseManager,  "accountWithVirtualCardIdentifier:",  v23));
        unsigned __int8 v25 = (void *)objc_claimAutoreleasedReturnValue([v24 accountIdentifier]);
        v32[0] = _NSConcreteStackBlock;
        v32[1] = 3221225472LL;
        v32[2] = sub_1001E903C;
        v32[3] = &unk_10064BF30;
        void v32[4] = self;
        id v33 = v11;
        int64_t v36 = a5;
        id v35 = v13;
        id v34 = v10;
        -[PDAccountManager performVirtualCardAction:forVirtualCardIdentifier:forAccountIdentifier:completion:]( self,  "performVirtualCardAction:forVirtualCardIdentifier:forAccountIdentifier:completion:",  1LL,  v23,  v25,  v32);

        goto LABEL_19;
      }
    }

    if (!v17)
    {
      workQueue = self->_workQueue;
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472LL;
      v26[2] = sub_1001E9300;
      v26[3] = &unk_100649A18;
      id v27 = v10;
      id v28 = v11;
      int64_t v31 = a5;
      id v29 = self;
      id v30 = v13;
      dispatch_async((dispatch_queue_t)workQueue, v26);

      goto LABEL_19;
    }

    goto LABEL_11;
  }

  if (v12) {
    (*((void (**)(id, void, void))v12 + 2))(v12, 0LL, 0LL);
  }
LABEL_19:
}

- (void)_queueDecryptionRequest:(id)a3
{
  id v4 = a3;
  uint64_t Object = PKLogFacilityTypeGetObject(14LL);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 virtualCard]);
    int v8 = 138412290;
    id v9 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Adding virtual card decryption request \nvirtual card: %@",  (uint8_t *)&v8,  0xCu);
  }

  -[NSMutableArray addObject:](self->_decryptionRequests, "addObject:", v4);
  -[PDAccountManager _executeDecryptionRequests](self, "_executeDecryptionRequests");
}

- (void)_executeDecryptionRequests
{
  if (!self->_processingVirtualCardDecryptionRequest && -[NSMutableArray count](self->_decryptionRequests, "count"))
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->_decryptionRequests, "firstObject"));
    if (v3)
    {
      self->_processingVirtualCardDecryptionRequest = 1;
      objc_initWeak(&location, self);
      v13[0] = 0LL;
      v13[1] = v13;
      v13[2] = 0x3032000000LL;
      v13[3] = sub_1001DB0CC;
      v13[4] = sub_1001DB0DC;
      id v14 = (id)objc_claimAutoreleasedReturnValue([v3 virtualCard]);
      id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 authorization]);
      id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 completion]);
      replyQueue = self->_replyQueue;
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472LL;
      v8[2] = sub_1001E9604;
      v8[3] = &unk_10064BFC0;
      void v8[4] = self;
      objc_copyWeak(&v12, &location);
      id v7 = v5;
      id v10 = v7;
      id v11 = v13;
      id v9 = v3;
      PKPersistentBAACertificateAndKey(v4, replyQueue, v8);

      objc_destroyWeak(&v12);
      _Block_object_dispose(v13, 8);

      objc_destroyWeak(&location);
    }
  }

- (void)fetchKeychainCredentialForVirtualCardIdentifier:(id)a3 forAccountIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ((PKBAAUtilitiesAvailable() & 1) != 0)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_1001EA110;
    v14[3] = &unk_10064BB70;
    id v17 = v10;
    v14[4] = self;
    id v15 = v8;
    id v16 = v9;
    -[PDAccountManager accountWithIdentifier:completion:](self, "accountWithIdentifier:completion:", v16, v14);

    id v11 = v17;
LABEL_7:

    goto LABEL_8;
  }

  uint64_t Object = PKLogFacilityTypeGetObject(14LL);
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Error calling legacy virtual card, BAA utilities unavailable",  buf,  2u);
  }

  if (v10)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKAccountErrorDomain,  8LL,  0LL));
    (*((void (**)(id, void *))v10 + 2))(v10, v11);
    goto LABEL_7;
  }

- (void)promptDetailsForVirtualCard:(id)a3 showNotification:(BOOL)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1001EAC28;
  v6[3] = &unk_10064C088;
  BOOL v9 = a4;
  id v7 = a3;
  id v8 = self;
  id v5 = v7;
  -[PDAccountManager accountWithVirtualCardIdentifier:completion:]( self,  "accountWithVirtualCardIdentifier:completion:",  v5,  v6);
}

- (void)deleteVirtualCardEncryptedDataForAccountIdentifier:(id)a3 completion:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1001EAD78;
  v6[3] = &unk_100639AC8;
  id v7 = self;
  id v8 = a4;
  id v5 = v8;
  -[PDAccountManager accountWithIdentifier:completion:](v7, "accountWithIdentifier:completion:", a3, v6);
}

- (void)noteVirtualCardAutoFilledBySafari:(id)a3 completion:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1001EAFD8;
  v8[3] = &unk_1006415C0;
  id v9 = a3;
  id v10 = self;
  id v11 = a4;
  id v6 = v11;
  id v7 = v9;
  -[PDAccountManager accountsWithCompletion:](self, "accountsWithCompletion:", v8);
}

- (void)fetchAllVirtualCardsForAccountIdentifier:(id)a3 completion:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001EB45C;
  v7[3] = &unk_10064B940;
  id v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  -[PDAccountManager accountWithIdentifier:completion:](v8, "accountWithIdentifier:completion:", v6, v7);
}

- (void)noteSecurityCodeActivityWithAction:(int64_t)a3 forSecurityCodeIdentifier:(id)a4 forVirtualCardIdentifier:(id)a5 forAccountIdentifier:(id)a6 completion:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_1001EB8A8;
  v18[3] = &unk_10064C170;
  v18[4] = self;
  id v19 = a6;
  id v20 = v13;
  id v21 = v12;
  id v22 = a7;
  int64_t v23 = a3;
  id v14 = v22;
  id v15 = v12;
  id v16 = v13;
  id v17 = v19;
  -[PDAccountManager accountWithIdentifier:completion:](self, "accountWithIdentifier:completion:", v17, v18);
}

- (void)physicalCardsForAccountWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    if (v6)
    {
      workQueue = self->_workQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1001EBF00;
      block[3] = &unk_100639AF0;
      void block[4] = self;
      id v11 = v6;
      id v12 = v8;
      dispatch_async((dispatch_queue_t)workQueue, block);
    }

    else
    {
      (*((void (**)(id, void))v7 + 2))(v7, 0LL);
    }
  }
}

- (void)_queue_updatePhysicalCardsIfNecessaryForAccount:(id)a3
{
  id v4 = a3;
  if (v4
    && -[PDAccountManager _shouldProactivelyFetchEndpoint:metadataType:fetchPeriodEndpoint:account:]( self,  "_shouldProactivelyFetchEndpoint:metadataType:fetchPeriodEndpoint:account:",  10LL,  7LL,  9LL,  v4))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 accountIdentifier]);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_1001EC09C;
    v6[3] = &unk_10064B338;
    id v7 = v4;
    -[PDAccountManager _updatePhysicalCardsForAccountIdentifier:force:completion:]( self,  "_updatePhysicalCardsForAccountIdentifier:force:completion:",  v5,  0LL,  v6);
  }
}

- (void)_updatePhysicalCardsForAccountIdentifier:(id)a3 force:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = -[PDAccountManagerPhysicalCardsRequest initWithAccountIdentifier:force:]( objc_alloc(&OBJC_CLASS___PDAccountManagerPhysicalCardsRequest),  "initWithAccountIdentifier:force:",  v9,  v5);

  -[PDAccountManagerPhysicalCardsRequest addCompletion:](v10, "addCompletion:", v8);
  -[PDAccountManager _addAccountManagerFetchRequest:](self, "_addAccountManagerFetchRequest:", v10);
}

- (void)_managerFetch_updatePhysicalCardsWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 accountIdentifier]);
  uint64_t Object = PKLogFacilityTypeGetObject(14LL);
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v20 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Fetching physical cards for account with identifier %@",  buf,  0xCu);
  }

  if (v8)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1001EC41C;
    v13[3] = &unk_10064C210;
    v13[4] = self;
    id v14 = v8;
    id v16 = v7;
    id v15 = v6;
    -[PDAccountManager accountWithIdentifier:completion:](self, "accountWithIdentifier:completion:", v14, v13);

    id v11 = v14;
LABEL_7:

    goto LABEL_8;
  }

  if (v7)
  {
    replyQueue = self->_replyQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001EC3B8;
    block[3] = &unk_10063A830;
    id v18 = v7;
    dispatch_async((dispatch_queue_t)replyQueue, block);
    id v11 = v18;
    goto LABEL_7;
  }

- (void)beginPhysicalCardRequestWithOrder:(id)a3 forAccountWithIdentifier:(id)a4 accountUserAltDSID:(id)a5 deviceMetadata:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  void v20[2] = sub_1001ED07C;
  v20[3] = &unk_10064C2B0;
  id v21 = v13;
  id v22 = v12;
  id v23 = a6;
  id v24 = v14;
  unsigned __int8 v25 = self;
  id v26 = a7;
  id v15 = v26;
  id v16 = v14;
  id v17 = v23;
  id v18 = v12;
  id v19 = v13;
  -[PDAccountManager accountWithIdentifier:completion:](self, "accountWithIdentifier:completion:", v19, v20);
}

- (void)completePhysicalCardRequest:(id)a3 withSignature:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  id v11 = [[PKAccountWebServiceApplePayTrustRequest alloc] initWithApplePayTrustProtocol:v8];
  [v11 setSignature:v10];

  paymentWebServiceCoordinator = self->_paymentWebServiceCoordinator;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1001ED508;
  v16[3] = &unk_100646D90;
  id v17 = v11;
  id v18 = self;
  id v19 = v8;
  id v20 = v9;
  id v13 = v9;
  id v14 = v8;
  id v15 = v11;
  -[PDPaymentWebServiceCoordinator performHandlerOnSharedWebServiceQueue:]( paymentWebServiceCoordinator,  "performHandlerOnSharedWebServiceQueue:",  v16);
}

- (void)_handlePhysicalCardRequestResponse:(id)a3 forAccountIdentifier:(id)a4 completion:(id)a5
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1001ED764;
  v11[3] = &unk_10064B620;
  id v12 = a3;
  id v13 = self;
  id v14 = a4;
  id v15 = a5;
  id v8 = v15;
  id v9 = v14;
  id v10 = v12;
  -[PDAccountManager accountWithIdentifier:completion:](self, "accountWithIdentifier:completion:", v9, v11);
}

- (void)_handlePhysicalCardActionResponse:(id)a3 forAccountIdentifier:(id)a4 completion:(id)a5
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1001EDA74;
  v11[3] = &unk_10064B620;
  id v12 = a3;
  id v13 = self;
  id v14 = a4;
  id v15 = a5;
  id v8 = v15;
  id v9 = v14;
  id v10 = v12;
  -[PDAccountManager accountWithIdentifier:completion:](self, "accountWithIdentifier:completion:", v9, v11);
}

- (void)beginPhysicalCardAction:(id)a3 onPhysicalCardWithIdentifier:(id)a4 forAccountWithIdentifier:(id)a5 accountUserAltDSID:(id)a6 deviceMetadata:(id)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_1001EDDFC;
  v24[3] = &unk_10064C350;
  id v25 = v14;
  id v26 = v15;
  id v27 = v16;
  id v28 = a7;
  id v29 = v17;
  id v30 = self;
  id v31 = a8;
  id v18 = v31;
  id v19 = v17;
  id v20 = v28;
  id v21 = v16;
  id v22 = v15;
  id v23 = v14;
  -[PDAccountManager accountWithIdentifier:completion:](self, "accountWithIdentifier:completion:", v21, v24);
}

- (void)completePhysicalCardActionRequest:(id)a3 withSignature:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  id v11 = [[PKAccountWebServiceApplePayTrustRequest alloc] initWithApplePayTrustProtocol:v8];
  [v11 setSignature:v10];

  paymentWebServiceCoordinator = self->_paymentWebServiceCoordinator;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1001EE294;
  v16[3] = &unk_100646D90;
  id v17 = v11;
  id v18 = self;
  id v19 = v8;
  id v20 = v9;
  id v13 = v9;
  id v14 = v8;
  id v15 = v11;
  -[PDPaymentWebServiceCoordinator performHandlerOnSharedWebServiceQueue:]( paymentWebServiceCoordinator,  "performHandlerOnSharedWebServiceQueue:",  v16);
}

- (void)activatePhysicalCardWithActivationCode:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_1001EE4D4;
    v8[3] = &unk_10064C3A0;
    void v8[4] = self;
    id v9 = v6;
    id v10 = v7;
    -[PDAccountManager inactivePhysicalCardForFeatureIdentifier:completion:]( self,  "inactivePhysicalCardForFeatureIdentifier:completion:",  2LL,  v8);
  }
}

- (void)inactivePhysicalCardForFeatureIdentifier:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_1001EE630;
    v8[3] = &unk_100639AC8;
    void v8[4] = self;
    id v9 = v6;
    -[PDAccountManager defaultAccountForFeature:completion:](self, "defaultAccountForFeature:completion:", a3, v8);
  }
}

- (void)physicalCardForFeatureIdentifier:(unint64_t)a3 activationCode:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (v9)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(14LL);
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = PKFeatureIdentifierToString(a3);
      id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      *(_DWORD *)buf = 138412546;
      id v19 = v8;
      __int16 v20 = 2112;
      id v21 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "physicalCardForFeatureIdentifier called with rawActivationCode %@, feature: %@",  buf,  0x16u);
    }

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_1001EE920;
    v14[3] = &unk_10064BC38;
    id v17 = v9;
    id v15 = v8;
    id v16 = self;
    -[PDAccountManager defaultAccountForFeature:completion:](self, "defaultAccountForFeature:completion:", a3, v14);
  }
}

- (void)activatePhysicalCardWithIdentifier:(id)a3 activationCode:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    if ([v9 containsString:@"wallet://activate/nfc"])
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLComponents componentsWithString:]( &OBJC_CLASS___NSURLComponents,  "componentsWithString:",  v9));
      __int128 v41 = 0u;
      __int128 v42 = 0u;
      __int128 v43 = 0u;
      __int128 v44 = 0u;
      id v12 = (id)objc_claimAutoreleasedReturnValue([v11 queryItems]);
      id v13 = [v12 countByEnumeratingWithState:&v41 objects:v45 count:16];
      if (v13)
      {
        id v14 = v13;
        id v33 = v11;
        id v34 = self;
        id v15 = v9;
        id v35 = v8;
        uint64_t v16 = *(void *)v42;
        while (2)
        {
          for (unint64_t i = 0LL; i != v14; unint64_t i = (char *)i + 1)
          {
            if (*(void *)v42 != v16) {
              objc_enumerationMutation(v12);
            }
            id v18 = *(void **)(*((void *)&v41 + 1) + 8LL * (void)i);
            id v19 = (__CFString *)(id)objc_claimAutoreleasedReturnValue([v18 name]);
            if (v19 != @"uid")
            {
              __int16 v20 = v19;
              if (!v19) {
                continue;
              }
              unsigned int v21 = -[__CFString isEqualToString:](v19, "isEqualToString:", @"uid");

              if (!v21) {
                continue;
              }
            }

            id v9 = (id)objc_claimAutoreleasedReturnValue([v18 value]);

            self = v34;
            id v8 = v35;
            goto LABEL_15;
          }

          id v14 = [v12 countByEnumeratingWithState:&v41 objects:v45 count:16];
          if (v14) {
            continue;
          }
          break;
        }

        self = v34;
        id v8 = v35;
        id v9 = v15;
LABEL_15:
        id v11 = v33;
      }
    }

    id v22 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager accountWithPhysicalCardIdentifier:]( self->_databaseManager,  "accountWithPhysicalCardIdentifier:",  v8));
    databaseManager = self->_databaseManager;
    id v24 = (void *)objc_claimAutoreleasedReturnValue([v22 accountIdentifier]);
    id v25 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager physicalCardsForAccountWithIdentifier:]( databaseManager,  "physicalCardsForAccountWithIdentifier:",  v24));

    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472LL;
    v39[2] = sub_1001EEFE4;
    v39[3] = &unk_10064B8C8;
    id v26 = v8;
    id v40 = v26;
    uint64_t v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "pk_anyObjectPassingTest:", v39));
    id v28 = (void *)v27;
    if (v22 && v27)
    {
      id v29 = [[PKPhysicalCardAction alloc] initWithActionType:4];
      [v29 setActivationCode:v9];
      id v36 = v9;
      id v30 = (void *)objc_claimAutoreleasedReturnValue([v22 accountIdentifier]);
      id v31 = v8;
      id v32 = (void *)objc_claimAutoreleasedReturnValue([v28 accountUserAltDSID]);
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472LL;
      v37[2] = sub_1001EF064;
      v37[3] = &unk_10064C3C8;
      id v38 = v10;
      -[PDAccountManager beginPhysicalCardAction:onPhysicalCardWithIdentifier:forAccountWithIdentifier:accountUserAltDSID:deviceMetadata:completion:]( self,  "beginPhysicalCardAction:onPhysicalCardWithIdentifier:forAccountWithIdentifier:accountUserAltDSID:deviceMetadata:completion:",  v29,  v26,  v30,  v32,  0LL,  v37);

      id v8 = v31;
      id v9 = v36;
    }

    else
    {
      (*((void (**)(id, uint64_t))v10 + 2))(v10, 2LL);
    }
  }
}

- (void)billPaymentSelectedSuggestedAmountDataEventsForAccountIdentifier:(id)a3 withStatementIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    workQueue = self->_workQueue;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1001EF29C;
    v12[3] = &unk_10063B440;
    void v12[4] = self;
    id v13 = v8;
    id v14 = v9;
    id v15 = v10;
    dispatch_async((dispatch_queue_t)workQueue, v12);
  }
}

- (void)billPaymentSelectedSuggestedAmountDataEventsForAccountIdentifier:(id)a3 withStartDate:(id)a4 endDate:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v13)
  {
    workQueue = self->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001EF484;
    block[3] = &unk_10063CD88;
    void block[4] = self;
    id v16 = v10;
    id v17 = v11;
    id v18 = v12;
    id v19 = v13;
    dispatch_async((dispatch_queue_t)workQueue, block);
  }
}

- (void)scheduledPaymentsWithAccountIdentifier:(id)a3 includeFailedRecurringPayments:(BOOL)a4 allowFetchFromServer:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = (void (**)(id, void *, void))a6;
  id v12 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager scheduledPaymentsWithAccountIdentifier:includeFailedRecurringPayments:]( self->_databaseManager,  "scheduledPaymentsWithAccountIdentifier:includeFailedRecurringPayments:",  v10,  v8));
  if (v11) {
    v11[2](v11, v12, 0LL);
  }
  if (v7
    && -[PDAccountManager _shouldDownloadScheduledPaymentsForAccountIdentifier:]( self,  "_shouldDownloadScheduledPaymentsForAccountIdentifier:",  v10))
  {
    uint64_t Object = PKLogFacilityTypeGetObject(14LL);
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Downloading scheduled payments for account %@",  buf,  0xCu);
    }

    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_1001EF6D8;
    v15[3] = &unk_10063A2F0;
    void v15[4] = self;
    -[PDAccountManager accountWithIdentifier:completion:](self, "accountWithIdentifier:completion:", v10, v15);
  }
}

- (void)updateScheduledPaymentsWithAccount:(id)a3 completion:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001EF798;
  v7[3] = &unk_10064BC38;
  id v9 = self;
  id v10 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a3 accountIdentifier]);
  id v5 = v8;
  id v6 = v10;
  -[PDAccountManager accountWithIdentifier:completion:](v9, "accountWithIdentifier:completion:", v5, v7);
}

- (id)_cacheKeyForScheduledPaymentsWithAccountIdentifier:(id)a3
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%@",  PKSharedCacheLastScheduledPaymentsDownloadKey,  a3);
}

- (BOOL)_shouldDownloadScheduledPaymentsForAccountIdentifier:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[PDAccountManager _cacheKeyForScheduledPaymentsWithAccountIdentifier:]( self,  "_cacheKeyForScheduledPaymentsWithAccountIdentifier:",  a3));
  uint64_t DateForKey = PKSharedCacheGetDateForKey();
  id v5 = (void *)objc_claimAutoreleasedReturnValue(DateForKey);
  id v6 = v5;
  if (v5)
  {
    [v5 timeIntervalSinceNow];
    BOOL v8 = fabs(v7) >= 86400.0;
  }

  else
  {
    BOOL v8 = 1;
  }

  return v8;
}

- (void)accountHoldsForAccountIdentifier:(id)a3 completion:(id)a4
{
  double v7 = (void (**)(id, void *))a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager placedHoldsWithAccountIdentifier:]( self->_databaseManager,  "placedHoldsWithAccountIdentifier:",  a3));
  if (v7) {
    v7[2](v7, v6);
  }
}

- (void)scheduleSetupReminderForAccountWithIdentifier:(id)a3 completion:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001F0070;
  v7[3] = &unk_10064B940;
  BOOL v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  -[PDAccountManager accountWithIdentifier:completion:](v8, "accountWithIdentifier:completion:", v6, v7);
}

- (id)_setupNotificationIdentifierForAccountIdentifier:(id)a3
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@",  @"accountSetup-",  a3);
}

- (void)insertSummaryNotificationForAccountIdentifier:(id)a3 summaryType:(int64_t)a4 completion:(id)a5
{
  id v9 = a5;
  -[PDAccountNotificationController insertSummaryNotificationForAccountIdentifier:summaryType:]( self->_accountNotificationController,  "insertSummaryNotificationForAccountIdentifier:summaryType:",  a3,  a4);
  BOOL v8 = v9;
  if (v9)
  {
    (*((void (**)(id, void))v9 + 2))(v9, 0LL);
    BOOL v8 = v9;
  }
}

- (void)insertDailyCashNotificationForAccountIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a4;
  accountNotificationController = self->_accountNotificationController;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1001F03F8;
  v9[3] = &unk_10063A830;
  id v10 = v6;
  id v8 = v6;
  -[PDAccountNotificationController updateDailyCashNotificationsForAccountIdentifier:date:completion:]( accountNotificationController,  "updateDailyCashNotificationsForAccountIdentifier:date:completion:",  a3,  0LL,  v9);
}

- (void)markUserViewedIntroduction:(BOOL)a3 forInstallmentIdentifiers:(id)a4 accountIdentifier:(id)a5 completion:(id)a6
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1001F04CC;
  v11[3] = &unk_10064B878;
  id v12 = self;
  id v13 = a4;
  BOOL v15 = a3;
  id v14 = a6;
  id v9 = v14;
  id v10 = v13;
  -[PDAccountManager accountWithIdentifier:completion:](v12, "accountWithIdentifier:completion:", a5, v11);
}

- (void)exportTransactionDataForAccountIdentifier:(id)a3 withFileFormat:(id)a4 beginDate:(id)a5 endDate:(id)a6 productTimeZone:(id)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_1001F090C;
  v24[3] = &unk_10064C468;
  id v29 = a7;
  id v30 = a8;
  void v24[4] = self;
  id v25 = v14;
  id v26 = v16;
  id v27 = v17;
  id v28 = v15;
  id v18 = v29;
  id v19 = v15;
  id v20 = v17;
  id v21 = v16;
  id v22 = v14;
  id v23 = v30;
  -[PDAccountManager accountWithIdentifier:completion:](self, "accountWithIdentifier:completion:", v22, v24);
}

- (void)updateAccountStatementMetadataForStatementIdentifier:(id)a3 accountIdentifier:(id)a4 trigger:(unint64_t)a5 completion:(id)a6
{
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1001F0C04;
  v12[3] = &unk_10064C4B8;
  id v13 = self;
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  unint64_t v17 = a5;
  id v9 = v15;
  id v10 = v14;
  id v11 = v16;
  -[PDAccountManager accountWithIdentifier:completion:](v13, "accountWithIdentifier:completion:", v9, v12);
}

- (void)deleteAccountStatementMetadataForStatementIdentifier:(id)a3 accountIdentifier:(id)a4 completion:(id)a5
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1001F1184;
  v10[3] = &unk_100641D48;
  id v11 = self;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v7 = v14;
  id v8 = v13;
  id v9 = v12;
  -[PDAccountManager accountsWithCompletion:](v11, "accountsWithCompletion:", v10);
}

- (void)accountStatementMetadataForAllAccountsWithCompletion:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1001F13C8;
  v4[3] = &unk_10063F520;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  -[PDAccountManager accountsWithCompletion:](v5, "accountsWithCompletion:", v4);
}

- (void)accountStatementMetadataForStatementIdentifier:(id)a3 accountIdentifier:(id)a4 completion:(id)a5
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1001F1764;
  v10[3] = &unk_1006436F8;
  id v11 = self;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v7 = v13;
  id v8 = v12;
  id v9 = v14;
  -[PDAccountManager accountWithIdentifier:completion:](v11, "accountWithIdentifier:completion:", v7, v10);
}

- (void)_managerFetch_exportTransactionsWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 accountIdentifier]);
  id v9 = v8;
  if (v8)
  {
    workQueue = self->_workQueue;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1001F1AC0;
    v12[3] = &unk_10063BA88;
    void v12[4] = self;
    id v13 = v8;
    id v15 = v7;
    id v14 = v6;
    dispatch_async((dispatch_queue_t)workQueue, v12);
  }

  else if (v7)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKAccountErrorDomain,  3LL,  0LL));
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0LL, v11);
  }
}

- (void)cloudStoreNotificationCoordinator:(id)a3 createdZoneWithName:(id)a4 forContainerName:(id)a5 scope:(int64_t)a6
{
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = PKCurrentCloudStoreApplePayContainerName();
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  id v13 = v10;
  id v14 = v12;
  if (v14 == v13)
  {
  }

  else
  {
    id v15 = v14;
    if (!v13 || !v14)
    {

      goto LABEL_23;
    }

    unsigned int v16 = [v13 isEqualToString:v14];

    if (!v16) {
      goto LABEL_23;
    }
  }

  if (a6 == 2)
  {
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472LL;
    v39[2] = sub_1001F248C;
    v39[3] = &unk_10064C508;
    id v17 = v9;
    id v40 = v17;
    id v41 = v13;
    __int128 v42 = self;
    id v18 = objc_retainBlock(v39);
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472LL;
    v38[2] = sub_1001F2580;
    void v38[3] = &unk_10064C558;
    void v38[4] = self;
    id v19 = objc_retainBlock(v38);
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472LL;
    v35[2] = sub_1001F27B0;
    v35[3] = &unk_1006392B0;
    id v20 = v17;
    id v36 = v20;
    id v37 = self;
    id v21 = objc_retainBlock(v35);
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472LL;
    v32[2] = sub_1001F2A20;
    v32[3] = &unk_100644BD0;
    void v32[4] = self;
    id v22 = v20;
    id v33 = v22;
    id v23 = v18;
    id v34 = v23;
    id v24 = objc_retainBlock(v32);
    uint64_t Object = PKLogFacilityTypeGetObject(14LL);
    id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v44 = v22;
      _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "PDAccountManager: The %@ zone was created.",  buf,  0xCu);
    }

    id v30 = 0LL;
    uint64_t v31 = 0LL;
    +[PKCloudStoreZone zoneValueForZoneName:outZoneType:outAccountIdentifier:altDSID:]( &OBJC_CLASS___PKCloudStoreZone,  "zoneValueForZoneName:outZoneType:outAccountIdentifier:altDSID:",  v22,  &v31,  &v30,  0LL);
    id v27 = v30;
    switch(v31)
    {
      case 0LL:
      case 3LL:
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v44 = v22;
          _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Not alerting account service of created zoneName %@",  buf,  0xCu);
        }

        break;
      case 1LL:
        ((void (*)(void *, uint64_t))v24[2])(v24, 2LL);
        break;
      case 2LL:
      case 4LL:
      case 5LL:
      case 6LL:
      case 8LL:
        ((void (*)(void *, id))v23[2])(v23, v27);
        break;
      case 7LL:
        ((void (*)(void *, uint64_t))v19[2])(v19, 4LL);
        ((void (*)(void *))v21[2])(v21);
        break;
      default:
        break;
    }
  }

  else
  {
    uint64_t v28 = PKLogFacilityTypeGetObject(14LL);
    id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v44 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "Ignoring zone creation for zoneName %@",  buf,  0xCu);
    }
  }

- (void)_managerFetch_createdZoneWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 zoneAccountIdentifier]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 zoneName]);
  if (v8)
  {
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    void v20[2] = sub_1001F2DBC;
    v20[3] = &unk_10064C5C8;
    id v10 = (id *)v21;
    v21[0] = v6;
    v21[1] = self;
    id v24 = v7;
    id v11 = v8;
    id v22 = v11;
    id v12 = v9;
    id v23 = v12;
    id v13 = objc_retainBlock(v20);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_1001F32C8;
    v16[3] = &unk_10064B940;
    id v17 = v12;
    id v18 = self;
    id v19 = v13;
    id v14 = v13;
    -[PDAccountManager accountWithIdentifier:completion:](self, "accountWithIdentifier:completion:", v11, v16);

LABEL_5:
    goto LABEL_6;
  }

  if (v7)
  {
    replyQueue = self->_replyQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001F2D58;
    block[3] = &unk_10063A830;
    id v10 = &v26;
    id v26 = v7;
    dispatch_async((dispatch_queue_t)replyQueue, block);
    goto LABEL_5;
  }

- (void)sharedAccountCloudStoreWithAccountIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    if (v6)
    {
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472LL;
      v11[2] = sub_1001F3600;
      v11[3] = &unk_10064B698;
      void v11[4] = self;
      id v13 = v7;
      id v12 = v6;
      -[PDAccountManager accountWithIdentifier:completion:](self, "accountWithIdentifier:completion:", v12, v11);

      id v9 = v13;
    }

    else
    {
      replyQueue = self->_replyQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1001F35F0;
      block[3] = &unk_10063A830;
      id v15 = v7;
      dispatch_async((dispatch_queue_t)replyQueue, block);
      id v9 = v15;
    }
  }
}

- (void)updateSharedAccountCloudStoreWithAccountIdentifier:(id)a3 completion:(id)a4
{
}

- (void)_updateSharedAccountCloudStoreWithAccountIdentifier:(id)a3 fromPush:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = -[PDAccountManagerSharedAccountCloudStoreRequest initWithAccountIdentifier:fromPush:]( objc_alloc(&OBJC_CLASS___PDAccountManagerSharedAccountCloudStoreRequest),  "initWithAccountIdentifier:fromPush:",  v9,  v5);

  -[PDAccountManagerSharedAccountCloudStoreRequest addCompletion:](v10, "addCompletion:", v8);
  -[PDAccountManager _addAccountManagerFetchRequest:](self, "_addAccountManagerFetchRequest:", v10);
}

- (void)_managerFetch_sharedAccountCloudStoreWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 accountIdentifier]);
  if (v8)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(14LL);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Updating shared account cloud store for account identifier %@",  buf,  0xCu);
    }

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1001F3B78;
    v13[3] = &unk_10064C210;
    v13[4] = self;
    id v14 = v8;
    id v16 = v7;
    id v15 = v6;
    -[PDAccountManager accountWithIdentifier:completion:](self, "accountWithIdentifier:completion:", v14, v13);

    id v11 = v14;
    goto LABEL_7;
  }

  if (v7)
  {
    replyQueue = self->_replyQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001F3B14;
    block[3] = &unk_10063A830;
    id v18 = v7;
    dispatch_async((dispatch_queue_t)replyQueue, block);
    id v11 = v18;
LABEL_7:
  }
}

- (void)paymentFundingSourcesForAccountIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    if (v6)
    {
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472LL;
      v11[2] = sub_1001F44E4;
      v11[3] = &unk_10064B940;
      void v11[4] = self;
      id v12 = v6;
      id v13 = v8;
      -[PDAccountManager accountWithIdentifier:completion:](self, "accountWithIdentifier:completion:", v12, v11);

      id v9 = v12;
    }

    else
    {
      replyQueue = self->_replyQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1001F44D4;
      block[3] = &unk_10063A830;
      id v15 = v7;
      dispatch_async((dispatch_queue_t)replyQueue, block);
      id v9 = v15;
    }
  }
}

- (void)paymentFundingSourceForIdentifier:(id)a3 accountIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v10;
  if (v10)
  {
    if (v8)
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472LL;
      v14[2] = sub_1001F4794;
      v14[3] = &unk_10064B620;
      void v14[4] = self;
      id v15 = v8;
      id v16 = v9;
      id v17 = v11;
      -[PDAccountManager accountWithIdentifier:completion:](self, "accountWithIdentifier:completion:", v16, v14);

      id v12 = v15;
    }

    else
    {
      replyQueue = self->_replyQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1001F4784;
      block[3] = &unk_10063A830;
      id v19 = v10;
      dispatch_async((dispatch_queue_t)replyQueue, block);
      id v12 = v19;
    }
  }
}

- (void)updatePaymentFundingSourcesForAccountIdentifier:(id)a3 force:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = -[PDAccountManagerFundingSourcesRequest initWithAccountIdentifier:force:]( objc_alloc(&OBJC_CLASS___PDAccountManagerFundingSourcesRequest),  "initWithAccountIdentifier:force:",  v9,  v5);

  -[PDAccountManagerFundingSourcesRequest addCompletion:](v10, "addCompletion:", v8);
  -[PDAccountManager _addAccountManagerFetchRequest:](self, "_addAccountManagerFetchRequest:", v10);
}

- (void)_managerFetch_updateFundingSourcesWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 accountIdentifier]);
  if (v8)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(14LL);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Updating funding sources for account identifier %@",  buf,  0xCu);
    }

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1001F4BC0;
    v13[3] = &unk_10064C210;
    v13[4] = self;
    id v14 = v8;
    id v16 = v7;
    id v15 = v6;
    -[PDAccountManager accountWithIdentifier:completion:](self, "accountWithIdentifier:completion:", v14, v13);

    id v11 = v14;
    goto LABEL_7;
  }

  if (v7)
  {
    replyQueue = self->_replyQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001F4B5C;
    block[3] = &unk_10063A830;
    id v18 = v7;
    dispatch_async((dispatch_queue_t)replyQueue, block);
    id v11 = v18;
LABEL_7:
  }
}

- (void)_queue_updatePaymentFundingSourcesIfNecessaryForAccount:(id)a3
{
  id v4 = a3;
  if (v4
    && -[PDAccountManager _shouldProactivelyFetchEndpoint:metadataType:fetchPeriodEndpoint:account:]( self,  "_shouldProactivelyFetchEndpoint:metadataType:fetchPeriodEndpoint:account:",  6LL,  2LL,  6LL,  v4))
  {
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 accountIdentifier]);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_1001F55EC;
    v6[3] = &unk_10064B310;
    id v7 = v4;
    -[PDAccountManager updatePaymentFundingSourcesForAccountIdentifier:force:completion:]( self,  "updatePaymentFundingSourcesForAccountIdentifier:force:completion:",  v5,  0LL,  v6);
  }
}

- (void)didAddAccountPendingFamilyMembers:(id)a3
{
  id v4 = a3;
  replyQueue = self->_replyQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001F5748;
  v7[3] = &unk_1006392B0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)replyQueue, v7);
}

- (void)accountPendingFamilyMembersForAccountIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    replyQueue = self->_replyQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001F5800;
    block[3] = &unk_10063C6A8;
    id v12 = v7;
    void block[4] = self;
    id v11 = v6;
    dispatch_async((dispatch_queue_t)replyQueue, block);
  }
}

- (void)accountBalancesForAccountIdentifier:(id)a3 startDate:(id)a4 endDate:(id)a5 type:(unint64_t)a6 completion:(id)a7
{
  if (a7)
  {
    databaseManager = self->_databaseManager;
    id v12 = (void (**)(id, id, void))a7;
    id v13 = (id)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager accountBalancesForAccountIdentifier:startDate:endDate:type:limit:]( databaseManager,  "accountBalancesForAccountIdentifier:startDate:endDate:type:limit:",  a3,  a4,  a5,  a6,  0LL));
    v12[2](v12, v13, 0LL);
  }

- (void)updateAccountBalancesForAccountIdentifier:(id)a3 startDate:(id)a4 endDate:(id)a5 type:(unint64_t)a6 completion:(id)a7
{
  id v12 = a3;
  id v52 = a4;
  id v13 = a5;
  id v14 = a7;
  if (v14)
  {
    id v50 = v14;
    id v15 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager accountBalancesForAccountIdentifier:startDate:endDate:type:limit:]( self->_databaseManager,  "accountBalancesForAccountIdentifier:startDate:endDate:type:limit:",  v12,  v52,  0LL,  1LL,  1LL));
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 firstObject]);
    id v51 = (void *)objc_claimAutoreleasedReturnValue([v16 date]);

    if (!v51 || (id v17 = [v51 compare:v52], v18 = v51, v17 != (id)1)) {
      id v18 = v52;
    }
    id v19 = v18;
    if (a6 == 2)
    {
      if (v51)
      {
        [v51 timeIntervalSinceNow];
        unsigned int v20 = fabs(v21) > 600.0;
      }

      else
      {
        unsigned int v20 = 1;
      }
    }

    else if (a6 == 1 && ([v51 isToday] & 1) == 0)
    {
      unsigned int v20 = [v51 isYesterday] ^ 1;
    }

    else
    {
      unsigned int v20 = 0;
    }

    uint64_t v68 = 0LL;
    unsigned int v69 = &v68;
    uint64_t v70 = 0x3032000000LL;
    uint64_t v71 = sub_1001DB0CC;
    unsigned int v72 = sub_1001DB0DC;
    id v73 = (id)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager accountEndpointMetadataForAccountIdentifier:endpoint:]( self->_databaseManager,  "accountEndpointMetadataForAccountIdentifier:endpoint:",  v12,  5LL));
    if (v20)
    {
      id v22 = (void *)v69[5];
      if (!v22)
      {
        id v23 = -[PDAccountWebServiceEndpointMetadata initWithAccountIdentifier:endpoint:]( objc_alloc(&OBJC_CLASS___PDAccountWebServiceEndpointMetadata),  "initWithAccountIdentifier:endpoint:",  v12,  5LL);
        id v24 = (void *)v69[5];
        v69[5] = (uint64_t)v23;

        id v22 = (void *)v69[5];
      }

      id v25 = (void *)objc_claimAutoreleasedReturnValue([v22 lastUpdated]);
      id v26 = v25;
      if (v25 && ([v25 timeIntervalSinceNow], fabs(v27) < 600.0))
      {
        uint64_t Object = PKLogFacilityTypeGetObject(14LL);
        id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v26;
          _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "Not fetching balances because recent fetch at %@",  buf,  0xCu);
        }

        int v30 = 0;
      }

      else
      {
        int v30 = 1;
      }

      if ([v19 compare:v13] == (id)1)
      {
        uint64_t v31 = PKLogFacilityTypeGetObject(14LL);
        id v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v19;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v13;
          _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "Start date %@ after end date %@",  buf,  0x16u);
        }
      }

      else
      {

        if (v30)
        {
          id v33 = objc_alloc_init(&OBJC_CLASS___PKAsyncUnaryOperationComposer);
          BOOL v49 = (void *)objc_claimAutoreleasedReturnValue( +[NSCalendar calendarWithIdentifier:]( &OBJC_CLASS___NSCalendar,  "calendarWithIdentifier:",  NSCalendarIdentifierGregorian));
          id v34 = (void *)objc_claimAutoreleasedReturnValue([v49 dateByAddingUnit:16 value:365 toDate:v19 options:0]);
          uint64_t v35 = PKEndOfDay();
          id v36 = (void *)objc_claimAutoreleasedReturnValue(v35);

          *(void *)buf = 0LL;
          *(void *)&uint8_t buf[8] = buf;
          *(void *)&uint8_t buf[16] = 0x3032000000LL;
          id v75 = sub_1001DB0CC;
          __int128 v76 = sub_1001DB0DC;
          id v77 = 0LL;
          while ([v36 compare:v13])
          {
            if ([v36 compare:v13] == (id)1)
            {
              id v37 = v13;

              id v36 = v37;
            }

            id v38 = v19;
            id v39 = v36;
            v61[0] = _NSConcreteStackBlock;
            v61[1] = 3221225472LL;
            v61[2] = sub_1001F5FB0;
            v61[3] = &unk_10064C668;
            id v40 = v38;
            id v62 = v40;
            id v41 = v39;
            id v63 = v41;
            id v42 = v12;
            id v66 = buf;
            unint64_t v67 = a6;
            id v64 = v42;
            unsigned int v65 = self;
            [v33 addOperation:v61];
            id v36 = v13;
            id v19 = v40;
            if (v41 != v13)
            {
              id v19 = (id)objc_claimAutoreleasedReturnValue([v41 dateByAddingTimeInterval:1.0]);

              __int128 v43 = (void *)objc_claimAutoreleasedReturnValue([v49 dateByAddingUnit:16 value:365 toDate:v19 options:0]);
              uint64_t v44 = PKEndOfDay();
              id v36 = (void *)objc_claimAutoreleasedReturnValue(v44);
            }
          }

          id v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
          v53[0] = _NSConcreteStackBlock;
          v53[1] = 3221225472LL;
          v53[2] = sub_1001F6540;
          v53[3] = &unk_10064C690;
          uint64_t v58 = &v68;
          __int128 v59 = buf;
          id v57 = v50;
          v53[4] = self;
          id v54 = v12;
          id v55 = v52;
          id v56 = v13;
          unint64_t v60 = a6;
          id v48 = [v33 evaluateWithInput:v47 completion:v53];

          _Block_object_dispose(buf, 8);
          goto LABEL_37;
        }
      }
    }

    uint64_t v45 = PKLogFacilityTypeGetObject(14LL);
    uint64_t v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v19;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v13;
      *(_WORD *)&buf[22] = 2112;
      id v75 = (uint64_t (*)(uint64_t, uint64_t))v51;
      _os_log_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_DEFAULT,  "Not requesting balances from %@ to %@, most recent from %@",  buf,  0x20u);
    }

    id v33 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKAccountErrorDomain,  9LL,  0LL));
    (*((void (**)(id, void, id))v50 + 2))(v50, 0LL, v33);
LABEL_37:

    _Block_object_dispose(&v68, 8);
    id v14 = v50;
  }
}

- (void)resetAccountBalancesForAccountIdentifier:(id)a3 completion:(id)a4
{
  databaseManager = self->_databaseManager;
  id v8 = (void (**)(id, void))a4;
  id v7 = a3;
  -[PDDatabaseManager resetAccountBalancesForAccountIdentifier:]( databaseManager,  "resetAccountBalancesForAccountIdentifier:",  v7);
  -[PDDatabaseManager deleteAccountEndpointMetadataForAccountIdentifier:endpoint:]( self->_databaseManager,  "deleteAccountEndpointMetadataForAccountIdentifier:endpoint:",  v7,  5LL);

  v8[2](v8, 0LL);
}

- (void)_updateFinancingPlansForAccountWithIdentifier:(id)a3 pageOffset:(unint64_t)a4 limit:(unint64_t)a5 ignoreLastUpdatedDate:(BOOL)a6 fromPush:(BOOL)a7 completion:(id)a8
{
  BOOL v8 = a7;
  BOOL v9 = a6;
  id v12 = a8;
  id v13 = a3;
  id v14 = -[PDAccountManagerFinancingPlansRequest initWithAccountIdentifier:fromPush:]( objc_alloc(&OBJC_CLASS___PDAccountManagerFinancingPlansRequest),  "initWithAccountIdentifier:fromPush:",  v13,  v8);

  if (PKPayLaterIgnoreLastUpdatedDate())
  {
    uint64_t Object = PKLogFacilityTypeGetObject(14LL);
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v17 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "PKPayLaterIgnoreLastUpdatedDate flag is set",  v17,  2u);
    }

    BOOL v9 = 1LL;
  }

  -[PDAccountManagerFinancingPlansRequest setIgnoreLastUpdatedDate:](v14, "setIgnoreLastUpdatedDate:", v9);
  -[PDAccountManagerFinancingPlansRequest addCompletion:](v14, "addCompletion:", v12);

  -[PDAccountManager _addAccountManagerFetchRequest:](self, "_addAccountManagerFetchRequest:", v14);
}

- (void)_managerFetch_updateFinancingPlansWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v6 accountIdentifier]);
  BOOL v9 = v8;
  if (v8)
  {
    workQueue = self->_workQueue;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1001F6890;
    v12[3] = &unk_10063BA88;
    void v12[4] = self;
    id v13 = v8;
    id v15 = v7;
    id v14 = v6;
    dispatch_async((dispatch_queue_t)workQueue, v12);
  }

  else if (v7)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKAccountErrorDomain,  3LL,  0LL));
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0LL, v11);
  }
}

- (id)_queue_processFinancingPlans:(id)a3 accountIdentifier:(id)a4 updateReasons:(unint64_t)a5
{
  id v8 = a3;
  id v41 = a4;
  BOOL v9 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v38 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v52 = 0u;
  __int128 v53 = 0u;
  __int128 v54 = 0u;
  __int128 v55 = 0u;
  id obj = v8;
  id v10 = [obj countByEnumeratingWithState:&v52 objects:v58 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v53;
    uint64_t v35 = &v44;
    id v36 = &v43;
    uint64_t v37 = *(void *)v53;
    do
    {
      id v13 = 0LL;
      id v39 = v11;
      do
      {
        if (*(void *)v53 != v12) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(void **)(*((void *)&v52 + 1) + 8LL * (void)v13);
        databaseManager = self->_databaseManager;
        id v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "planIdentifier", v35, v36));
        id v17 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager financingPlanWithIdentifier:]( databaseManager,  "financingPlanWithIdentifier:",  v16));

        if ([v14 state] != (id)7)
        {
          unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager insertOrUpdateFinancingPlan:forAccountIdentifier:]( self->_databaseManager,  "insertOrUpdateFinancingPlan:forAccountIdentifier:",  v14,  v41));
          unint64_t v21 = a5;
          [v20 addUpdateReasons:a5];
          id v22 = v9;
          -[NSMutableArray safelyAddObject:](v9, "safelyAddObject:", v20);
          -[PDAccountManager _queue_writeFinancingPlanUpdateIfPossibleWithOldFinancingPlan:newFinancingPlan:]( self,  "_queue_writeFinancingPlanUpdateIfPossibleWithOldFinancingPlan:newFinancingPlan:",  v17,  v20);
          id v23 = (void *)objc_claimAutoreleasedReturnValue([v20 merchant]);
          id v24 = (void *)objc_claimAutoreleasedReturnValue([v17 merchant]);
          if (v24) {
            BOOL v25 = 1;
          }
          else {
            BOOL v25 = v23 == 0LL;
          }
          if (!v25 || ([v23 payLaterMerchantDictionaryIsEqual:v24] & 1) == 0)
          {
            id v26 = (void *)objc_claimAutoreleasedReturnValue([v20 planIdentifier]);
            uint64_t Object = PKLogFacilityTypeGetObject(14LL);
            uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v57 = v26;
              _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "Merchant data did change for plan %@. Setting requiresMerchantReprocessing to true.",  buf,  0xCu);
            }

            [v23 setRequiresMerchantReprocessing:1];
            -[PDDatabaseManager updateProcessedPayLaterMerchant:forFinancingPlanIdentifier:]( self->_databaseManager,  "updateProcessedPayLaterMerchant:forFinancingPlanIdentifier:",  v23,  v26);
            uint64_t v29 = objc_claimAutoreleasedReturnValue( -[PDDatabaseManager financingPlanWithIdentifier:]( self->_databaseManager,  "financingPlanWithIdentifier:",  v26));

            unsigned int v20 = (void *)v29;
          }

          if (v20 && !v17)
          {
            v46[0] = _NSConcreteStackBlock;
            v46[1] = 3221225472LL;
            v46[2] = sub_1001F7944;
            v46[3] = &unk_10064B8F0;
            v46[4] = self;
            id v47 = v20;
            id v48 = v41;
            -[PDAccountManager _accessObserversWithHandler:](self, "_accessObserversWithHandler:", v46);
            int v30 = &v48;
            uint64_t v31 = &v47;
            goto LABEL_24;
          }

          if (v20 && v17)
          {
            v42[0] = _NSConcreteStackBlock;
            v42[1] = 3221225472LL;
            v42[2] = sub_1001F7994;
            v42[3] = &unk_10064B5A8;
            v42[4] = self;
            id v43 = v20;
            id v44 = v17;
            id v45 = v41;
            -[PDAccountManager _accessObserversWithHandler:](self, "_accessObserversWithHandler:", v42);

            int v30 = v35;
            uint64_t v31 = v36;
LABEL_24:
          }

          -[NSMutableArray safelyAddObject:](v38, "safelyAddObject:", v20);

          BOOL v9 = v22;
          a5 = v21;
          id v11 = v39;
          uint64_t v12 = v37;
          goto LABEL_29;
        }

        [v17 addUpdateReasons:a5];
        -[NSMutableArray safelyAddObject:](v9, "safelyAddObject:", v14);
        -[PDAccountManager _queue_writeFinancingPlanUpdateIfPossibleWithOldFinancingPlan:newFinancingPlan:]( self,  "_queue_writeFinancingPlanUpdateIfPossibleWithOldFinancingPlan:newFinancingPlan:",  v17,  0LL);
        id v18 = self->_databaseManager;
        if (v14) {
          id v19 = v14;
        }
        else {
          id v19 = v17;
        }
        id v32 = (void *)objc_claimAutoreleasedReturnValue([v19 planIdentifier]);
        -[PDDatabaseManager deleteFinancingPlanWithIdentifier:forAccountIdentifier:]( v18,  "deleteFinancingPlanWithIdentifier:forAccountIdentifier:",  v32,  v41);

        if (v17)
        {
          v49[0] = _NSConcreteStackBlock;
          v49[1] = 3221225472LL;
          v49[2] = sub_1001F78F4;
          v49[3] = &unk_10064B8F0;
          v49[4] = self;
          id v50 = v17;
          id v51 = v41;
          -[PDAccountManager _accessObserversWithHandler:](self, "_accessObserversWithHandler:", v49);
        }

- (void)_queue_writeFinancingPlanUpdateIfPossibleWithOldFinancingPlan:(id)a3 newFinancingPlan:(id)a4
{
  unint64_t v5 = (unint64_t)a3;
  unint64_t v6 = (unint64_t)a4;
  if (PKPayLaterSaveFinancingPlanJSONOnUpdate() && v5 | v6)
  {
    uint64_t v7 = PKPayLaterFinancingPlanUpdatesDirectory();
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    uint64_t v11 = PKISO8601DateStringFromDate();
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

    id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 path]);
    unsigned __int8 v14 = [v9 fileExistsAtPath:v13];

    if ((v14 & 1) == 0) {
      [v9 createDirectoryAtURL:v8 withIntermediateDirectories:1 attributes:0 error:0];
    }
    v49[0] = _NSConcreteStackBlock;
    v49[1] = 3221225472LL;
    v49[2] = sub_1001F7E50;
    v49[3] = &unk_10064C730;
    id v37 = v12;
    id v50 = v37;
    id v51 = v8;
    id v15 = v9;
    id v52 = v15;
    id v16 = objc_retainBlock(v49);
    ((void (*)(void *, unint64_t, uint64_t))v16[2])(v16, v5, 1LL);
    id v36 = v16;
    unint64_t v38 = v6;
    ((void (*)(void *, unint64_t, void))v16[2])(v16, v6, 0LL);
    id v41 = v8;
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v8 path]);
    id v42 = v15;
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v15 contentsOfDirectoryAtPath:v17 error:0]);

    id v43 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    id v39 = v18;
    if ((unint64_t)[v18 count] >= 0x33)
    {
      unint64_t v35 = v5;
      __int128 v47 = 0u;
      __int128 v48 = 0u;
      __int128 v45 = 0u;
      __int128 v46 = 0u;
      id obj = v18;
      id v19 = [obj countByEnumeratingWithState:&v45 objects:v57 count:16];
      if (v19)
      {
        id v20 = v19;
        uint64_t v21 = *(void *)v46;
        do
        {
          for (unint64_t i = 0LL; i != v20; unint64_t i = (char *)i + 1)
          {
            if (*(void *)v46 != v21) {
              objc_enumerationMutation(obj);
            }
            id v23 = (void *)objc_claimAutoreleasedReturnValue( [v41 URLByAppendingPathComponent:*(void *)(*((void *)&v45 + 1) + 8 * (void)i)]);
            id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 path]);

            BOOL v25 = (void *)objc_claimAutoreleasedReturnValue([v42 attributesOfItemAtPath:v24 error:0]);
            id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 objectForKey:NSFileCreationDate]);
            double v27 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
            -[NSMutableDictionary safelySetObject:forKey:](v27, "safelySetObject:forKey:", v26, NSFileCreationDate);
            -[NSMutableDictionary safelySetObject:forKey:](v27, "safelySetObject:forKey:", v24, @"FilePath");
            -[NSMutableArray addObject:](v43, "addObject:", v27);
          }

          id v20 = [obj countByEnumeratingWithState:&v45 objects:v57 count:16];
        }

        while (v20);
      }

      -[NSMutableArray sortUsingComparator:](v43, "sortUsingComparator:", &stru_10064C770);
      uint64_t v28 = (uint64_t)[obj count] - 50;
      unint64_t v5 = v35;
      if (v28 >= 1)
      {
        for (uint64_t j = 0LL; j != v28; ++j)
        {
          int v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](v43, "objectAtIndexedSubscript:", j));
          uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v30 objectForKeyedSubscript:@"FilePath"]);
          id v44 = 0LL;
          [v42 removeItemAtPath:v31 error:&v44];
          id v32 = v44;
          if (v32)
          {
            uint64_t Object = PKLogFacilityTypeGetObject(14LL);
            id v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              __int128 v54 = v31;
              __int16 v55 = 2112;
              id v56 = v32;
              _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "Error removing file at path %@:, error: %@",  buf,  0x16u);
            }
          }
        }
      }
    }

    unint64_t v6 = v38;
  }
}

- (void)financingPlansForAllAccountsWithCompletion:(id)a3
{
  id v4 = a3;
  unint64_t v5 = v4;
  if (v4)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_1001F81DC;
    v6[3] = &unk_10063F520;
    void v6[4] = self;
    id v7 = v4;
    -[PDAccountManager accountsWithCompletion:](self, "accountsWithCompletion:", v6);
  }
}

- (void)financingPlansWithQueries:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    uint64_t v21 = v7;
    id v9 = objc_alloc_init(&OBJC_CLASS___PKAsyncUnaryOperationComposer);
    id v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    id v22 = v6;
    id obj = v6;
    id v11 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v32;
      do
      {
        for (unint64_t i = 0LL; i != v12; unint64_t i = (char *)i + 1)
        {
          if (*(void *)v32 != v13) {
            objc_enumerationMutation(obj);
          }
          id v15 = *(void **)(*((void *)&v31 + 1) + 8LL * (void)i);
          id v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "accountIdentifier", v21));
          v27[0] = _NSConcreteStackBlock;
          v27[1] = 3221225472LL;
          v27[2] = sub_1001F86F8;
          v27[3] = &unk_10063BAD8;
          v27[4] = self;
          id v28 = v16;
          uint64_t v29 = v15;
          int v30 = v10;
          id v17 = v16;
          [v9 addOperation:v27];
        }

        id v12 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
      }

      while (v12);
    }

    id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_1001F89E0;
    v24[3] = &unk_10063F600;
    void v24[4] = self;
    id v8 = v21;
    BOOL v25 = v10;
    id v26 = v21;
    id v19 = v10;
    id v20 = [v9 evaluateWithInput:v18 completion:v24];

    id v6 = v22;
  }
}

- (void)financingPlansForAccountIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_1001F8B5C;
    v8[3] = &unk_10064B940;
    void v8[4] = self;
    id v9 = v6;
    id v10 = v7;
    -[PDAccountManager accountWithIdentifier:completion:](self, "accountWithIdentifier:completion:", v9, v8);
  }
}

- (void)financingPlanForPlanIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    workQueue = self->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001F8D80;
    block[3] = &unk_100639AF0;
    void block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async((dispatch_queue_t)workQueue, block);
  }
}

- (void)financingPlanInstallmentsDueDateRangeForAccountIdentifier:(id)a3 financingPlanStates:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1001F8F10;
    v11[3] = &unk_10064B620;
    void v11[4] = self;
    id v12 = v8;
    id v13 = v9;
    id v14 = v10;
    -[PDAccountManager accountWithIdentifier:completion:](self, "accountWithIdentifier:completion:", v12, v11);
  }
}

- (void)reprocessPayLaterFinancingPlansForMerchantCleanup:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001F9150;
  v7[3] = &unk_10063AC90;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)workQueue, v7);
}

- (void)deleteFinancingPlansForAllAccountsWithCompletion:(id)a3
{
  id v4 = a3;
  unint64_t v5 = v4;
  if (v4)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_1001F92D0;
    v6[3] = &unk_10063F520;
    void v6[4] = self;
    id v7 = v4;
    -[PDAccountManager accountsWithCompletion:](self, "accountsWithCompletion:", v6);
  }
}

- (void)cancelFinancingPlanWithIdentifier:(id)a3 accountIdentifier:(id)a4 cancellationReasonIdentifier:(id)a5 cancellationReasonDescription:(id)a6 completion:(id)a7
{
  id v17 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = (void (**)(id, PDAccountManagerFinancingPlanCancellationRequest *))a7;
  if (v17 && v12)
  {
    id v16 = -[PDAccountManagerFinancingPlanCancellationRequest initWithAccountIdentifier:planIdentifier:cancellationReasonIdentifier:cancellationReasonDescription:]( objc_alloc(&OBJC_CLASS___PDAccountManagerFinancingPlanCancellationRequest),  "initWithAccountIdentifier:planIdentifier:cancellationReasonIdentifier:cancellationReasonDescription:",  v12,  v17,  v13,  v14);
    -[PDAccountManagerFinancingPlanCancellationRequest addCompletion:](v16, "addCompletion:", v15);
    -[PDAccountManager _addAccountManagerFetchRequest:](self, "_addAccountManagerFetchRequest:", v16);
LABEL_6:

    goto LABEL_7;
  }

  if (v15)
  {
    id v16 = (PDAccountManagerFinancingPlanCancellationRequest *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKAccountErrorDomain,  3LL,  0LL));
    v15[2](v15, v16);
    goto LABEL_6;
  }

- (void)_managerFetch_cancelFinancingPlanWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 accountIdentifier]);
  id v9 = v8;
  if (v8)
  {
    workQueue = self->_workQueue;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1001F98B0;
    v12[3] = &unk_10063BA88;
    void v12[4] = self;
    id v13 = v8;
    id v15 = v7;
    id v14 = v6;
    dispatch_async((dispatch_queue_t)workQueue, v12);
  }

  else if (v7)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKAccountErrorDomain,  3LL,  0LL));
    (*((void (**)(id, void *))v7 + 2))(v7, v11);
  }
}

- (void)deleteFinancingPlansForAccountIdentifier:(id)a3 completion:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1001F9FC0;
  v6[3] = &unk_100639AC8;
  id v7 = self;
  id v8 = a4;
  id v5 = v8;
  -[PDAccountManager accountWithIdentifier:completion:](v7, "accountWithIdentifier:completion:", a3, v6);
}

- (void)deleteFinancingPlanWithIdentifier:(id)a3 accountIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  workQueue = self->_workQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1001FA3D4;
  v15[3] = &unk_10063B440;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async((dispatch_queue_t)workQueue, v15);
}

- (void)recomputePayLaterCardMagntiudesForAccountIdentifier:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001FA5C0;
  v7[3] = &unk_1006392B0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)workQueue, v7);
}

- (void)payLaterCardMagnitudesForAccountIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001FA75C;
  block[3] = &unk_100639AF0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)workQueue, block);
}

- (void)_queue_updateFinancingPlansIfNeccessaryForAccount:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 accountIdentifier]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager accountEndpointMetadataForAccountIdentifier:endpoint:]( self->_databaseManager,  "accountEndpointMetadataForAccountIdentifier:endpoint:",  v6,  1LL));
    id v8 = [v7 isDirty];
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 localLastUpdated]);
    LODWORD(v8) = -[PDAccountManager _shouldProactivelyFetchEndpoint:dirty:lastUpdated:fetchPeriodEndpoint:account:]( self,  "_shouldProactivelyFetchEndpoint:dirty:lastUpdated:fetchPeriodEndpoint:account:",  5LL,  v8,  v9,  5LL,  v5);

    if ((_DWORD)v8)
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 accountIdentifier]);
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472LL;
      v11[2] = sub_1001FA944;
      v11[3] = &unk_10064B310;
      id v12 = v6;
      -[PDAccountManager _updateFinancingPlansForAccountWithIdentifier:pageOffset:limit:ignoreLastUpdatedDate:fromPush:completion:]( self,  "_updateFinancingPlansForAccountWithIdentifier:pageOffset:limit:ignoreLastUpdatedDate:fromPush:completion:",  v10,  0LL,  0LL,  0LL,  0LL,  v11);
    }
  }
}

- (void)insertOrUpdateLocalAccountFinancingPlans:(id)a3 forAccountWithIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v10;
  if (v9)
  {
    workQueue = self->_workQueue;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1001FAAF0;
    v13[3] = &unk_10063B440;
    v13[4] = self;
    id v14 = v8;
    id v15 = v9;
    id v16 = v11;
    dispatch_async((dispatch_queue_t)workQueue, v13);
  }

  else if (v10)
  {
    (*((void (**)(id, void))v10 + 2))(v10, 0LL);
  }
}

- (void)payLaterMerchantProcessor:(id)a3 didProcessPayLaterMerchant:(id)a4 forFinancingPlan:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001FAC54;
  block[3] = &unk_100639350;
  id v13 = v8;
  id v14 = v7;
  id v15 = self;
  id v10 = v7;
  id v11 = v8;
  dispatch_async((dispatch_queue_t)workQueue, block);
}

- (void)environmentStore:(id)a3 storedEnvironment:(id)a4 differsFromCurrent:(id)a5 commitBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(void))a6;
  if ([v12 localeDiffersFromEnvironment:v11])
  {
    objc_initWeak(&location, self);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_1001FAF00;
    v14[3] = &unk_10064C810;
    objc_copyWeak(&v15, &location);
    -[PDAccountManager defaultAccountForFeature:completion:](self, "defaultAccountForFeature:completion:", 4LL, v14);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

  v13[2](v13);
}

- (void)rewardsTierSummaryForTransactionSourceIdentifiers:(id)a3 currencyCode:(id)a4 startDate:(id)a5 endDate:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  workQueue = self->_workQueue;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_1001FB0E0;
  v23[3] = &unk_10063AD70;
  v23[4] = self;
  id v24 = v12;
  id v25 = v13;
  id v26 = v14;
  id v27 = v15;
  id v28 = v16;
  id v18 = v16;
  id v19 = v15;
  id v20 = v14;
  id v21 = v13;
  id v22 = v12;
  dispatch_async((dispatch_queue_t)workQueue, v23);
}

- (void)sendAccountReport:(id)a3 trigger:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = (void (**)(void, void))v9;
  if (v8)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 accountIdentifier]);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1001FB2BC;
    v13[3] = &unk_10064C838;
    v13[4] = self;
    id v14 = v8;
    id v15 = v10;
    unint64_t v16 = a4;
    -[PDAccountManager accountWithIdentifier:completion:](self, "accountWithIdentifier:completion:", v11, v13);
  }

  else if (v9)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKAccountErrorDomain,  3LL,  0LL));
    ((void (**)(void, void *))v10)[2](v10, v12);
  }
}

- (void)_managerFetch_sendAccountReport:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 accountIdentifier]);
  id v9 = v8;
  if (v8)
  {
    workQueue = self->_workQueue;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1001FB6F4;
    v12[3] = &unk_10063BA88;
    void v12[4] = self;
    id v13 = v8;
    id v15 = v7;
    id v14 = v6;
    dispatch_async((dispatch_queue_t)workQueue, v12);
  }

  else if (v7)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKAccountErrorDomain,  3LL,  0LL));
    (*((void (**)(id, void *))v7 + 2))(v7, v11);
  }
}

- (void)updateAccountPromotionsForAccountWithIdentifier:(id)a3 observeCooldownPeriod:(BOOL)a4 completion:(id)a5
{
}

- (void)updateAccountPromotionsForAccountWithIdentifier:(id)a3 completion:(id)a4
{
}

- (void)updateAccountPromotionsForAccountWithIdentifier:(id)a3 ignoreErrorBackoff:(BOOL)a4 completion:(id)a5
{
}

- (void)_updateAccountPromotionsForAccountWithIdentifier:(id)a3 ignoreErrorBackoff:(BOOL)a4 observeCooldownPeriod:(BOOL)a5 completion:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  id v10 = a6;
  id v11 = a3;
  id v12 = -[PDAccountManagerPromotionsRequest initWithAccountIdentifier:ignoreErrorBackoff:observeCooldownPeriod:]( objc_alloc(&OBJC_CLASS___PDAccountManagerPromotionsRequest),  "initWithAccountIdentifier:ignoreErrorBackoff:observeCooldownPeriod:",  v11,  v7,  v6);

  -[PDAccountManagerPromotionsRequest addCompletion:](v12, "addCompletion:", v10);
  -[PDAccountManager _addAccountManagerFetchRequest:](self, "_addAccountManagerFetchRequest:", v12);
}

- (void)insertOrUpdateAccountPromotions:(id)a3 accountIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = v8;
  if (a3 && a4)
  {
    -[PDDatabaseManager insertOrUpdateAccountPromotions:accountIdentifier:]( self->_databaseManager,  "insertOrUpdateAccountPromotions:accountIdentifier:",  a3,  a4);
    replyQueue = self->_replyQueue;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1001FBDB8;
    v13[3] = &unk_10063A830;
    id v11 = &v14;
    id v14 = v9;
    id v12 = v13;
  }

  else
  {
    replyQueue = self->_replyQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001FBDA8;
    block[3] = &unk_10063A830;
    id v11 = &v16;
    id v16 = v8;
    id v12 = block;
  }

  dispatch_async((dispatch_queue_t)replyQueue, v12);
}

- (void)accountPromotionsForAccountWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    if (v6)
    {
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472LL;
      v11[2] = sub_1001FBED8;
      v11[3] = &unk_10064B940;
      void v11[4] = self;
      id v12 = v6;
      id v13 = v8;
      -[PDAccountManager accountWithIdentifier:completion:](self, "accountWithIdentifier:completion:", v12, v11);

      id v9 = v12;
    }

    else
    {
      replyQueue = self->_replyQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1001FBEC8;
      block[3] = &unk_10063A830;
      id v15 = v7;
      dispatch_async((dispatch_queue_t)replyQueue, block);
      id v9 = v15;
    }
  }
}

- (void)deleteAccountPromotion:(id)a3 forAccountWithIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  workQueue = self->_workQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1001FC118;
  v15[3] = &unk_10063B440;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async((dispatch_queue_t)workQueue, v15);
}

- (void)updateImpressionCountsForPromotions:(id)a3 accountIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v9 && [v8 count])
  {
    -[PDDatabaseManager updateImpressionCountsForPromotions:accountIdentifier:]( self->_databaseManager,  "updateImpressionCountsForPromotions:accountIdentifier:",  v8,  v9);
    replyQueue = self->_replyQueue;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_1001FC334;
    v16[3] = &unk_10063A830;
    id v12 = &v17;
    id v17 = v10;
    id v13 = v10;
    id v14 = v16;
  }

  else
  {
    replyQueue = self->_replyQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001FC2D4;
    block[3] = &unk_10063A830;
    id v12 = &v19;
    id v19 = v10;
    id v15 = v10;
    id v14 = block;
  }

  dispatch_async((dispatch_queue_t)replyQueue, v14);
}

- (void)updateImpressionCount:(int64_t)a3 promotionProgramIdentifier:(id)a4 accountIdentifier:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = v10;
  if (a4 && a5)
  {
    -[PDDatabaseManager updateImpressionCount:promotionProgramIdentifier:accountIdentifier:]( self->_databaseManager,  "updateImpressionCount:promotionProgramIdentifier:accountIdentifier:",  a3,  a4,  a5);
    replyQueue = self->_replyQueue;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_1001FC4A8;
    v15[3] = &unk_10063A830;
    id v13 = &v16;
    id v16 = v11;
    id v14 = v15;
  }

  else
  {
    replyQueue = self->_replyQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001FC448;
    block[3] = &unk_10063A830;
    id v13 = &v18;
    id v18 = v10;
    id v14 = block;
  }

  dispatch_async((dispatch_queue_t)replyQueue, v14);
}

- (void)_managerFetch_updatePromotionsWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 accountIdentifier]);
  id v9 = v8;
  if (v8)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1001FC648;
    v12[3] = &unk_10064C210;
    void v12[4] = self;
    id v13 = v8;
    id v15 = v7;
    id v14 = v6;
    -[PDAccountManager accountWithIdentifier:completion:](self, "accountWithIdentifier:completion:", v13, v12);

    id v10 = v13;
LABEL_5:

    goto LABEL_6;
  }

  if (v7)
  {
    replyQueue = self->_replyQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001FC5E4;
    block[3] = &unk_10063A830;
    id v17 = v7;
    dispatch_async((dispatch_queue_t)replyQueue, block);
    id v10 = v17;
    goto LABEL_5;
  }

- (void)_queue_updatePromotionsIfNecessaryForAccount:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 accountIdentifier]);
    if ([v5 showCardPromotions])
    {
      uint64_t v7 = PDAccountEndpointBackOffAccountTypeFromFeatureIdentifier([v5 feature]);
      id v8 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager accountEndpointMetadataForAccountIdentifier:endpoint:]( self->_databaseManager,  "accountEndpointMetadataForAccountIdentifier:endpoint:",  v6,  3LL));
      if ([v8 isDirty])
      {
        id v9 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager nextPossibleFetchDateForAccountType:endpointType:accountIdentifier:]( self->_databaseManager,  "nextPossibleFetchDateForAccountType:endpointType:accountIdentifier:",  v7,  7LL,  v6));
        if (v9
          && (id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date")),
              [v10 timeIntervalSinceDate:v9],
              double v12 = v11,
              v10,
              v12 > 0.0))
        {
          uint64_t Object = PKLogFacilityTypeGetObject(14LL);
          id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v21 = v6;
            _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Fetching promotions that are dirty for account %@",  buf,  0xCu);
          }

          v18[0] = _NSConcreteStackBlock;
          v18[1] = 3221225472LL;
          v18[2] = sub_1001FD7A4;
          v18[3] = &unk_10064B310;
          id v19 = v6;
          -[PDAccountManager _updateAccountPromotionsForAccountWithIdentifier:ignoreErrorBackoff:observeCooldownPeriod:completion:]( self,  "_updateAccountPromotionsForAccountWithIdentifier:ignoreErrorBackoff:observeCooldownPeriod:completion:",  v19,  0LL,  0LL,  v18);
          id v9 = v19;
        }

        else
        {
          uint64_t v16 = PKLogFacilityTypeGetObject(14LL);
          id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            id v21 = v6;
            __int16 v22 = 2112;
            id v23 = v9;
            _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Not fetching promotions that are dirty for account %@ since the next possible fetch date is %@",  buf,  0x16u);
          }
        }
      }
    }

    else
    {
      uint64_t v15 = PKLogFacilityTypeGetObject(14LL);
      id v8 = (void *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v21 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v8,  OS_LOG_TYPE_DEFAULT,  "Not fetching promotions for account %@ because it is not a supported feature on this account",  buf,  0xCu);
      }
    }
  }
}

- (void)accountPromotionBehaviorForAccountWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    if (v6)
    {
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472LL;
      v11[2] = sub_1001FD974;
      v11[3] = &unk_10064B940;
      void v11[4] = self;
      id v12 = v6;
      id v13 = v8;
      -[PDAccountManager accountWithIdentifier:completion:](self, "accountWithIdentifier:completion:", v12, v11);

      id v9 = v12;
    }

    else
    {
      replyQueue = self->_replyQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1001FD964;
      block[3] = &unk_10063A830;
      id v15 = v7;
      dispatch_async((dispatch_queue_t)replyQueue, block);
      id v9 = v15;
    }
  }
}

- (void)updateAccountEnhancedMerchantsForAccountWithIdentifier:(id)a3 cooldownLevel:(unint64_t)a4 completion:(id)a5
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1001FDB4C;
  v9[3] = &unk_10064C940;
  id v10 = a5;
  id v8 = v10;
  -[PDAccountManager _updateAccountEnhancedMerchantsForAccountWithIdentifier:ignoreErrorBackoff:cooldownLevel:completion:]( self,  "_updateAccountEnhancedMerchantsForAccountWithIdentifier:ignoreErrorBackoff:cooldownLevel:completion:",  a3,  0LL,  a4,  v9);
}

- (void)updateAccountEnhancedMerchantsForAccountWithIdentifier:(id)a3 completion:(id)a4
{
}

- (void)updateAccountEnhancedMerchantsForAccountWithIdentifier:(id)a3 ignoreErrorBackoff:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1001FDC00;
  v9[3] = &unk_10064C940;
  id v10 = a5;
  id v8 = v10;
  -[PDAccountManager _updateAccountEnhancedMerchantsForAccountWithIdentifier:ignoreErrorBackoff:cooldownLevel:completion:]( self,  "_updateAccountEnhancedMerchantsForAccountWithIdentifier:ignoreErrorBackoff:cooldownLevel:completion:",  a3,  v5,  0LL,  v9);
}

- (void)_updateAccountEnhancedMerchantsForAccountWithIdentifier:(id)a3 ignoreErrorBackoff:(BOOL)a4 cooldownLevel:(unint64_t)a5 completion:(id)a6
{
  BOOL v7 = a4;
  id v10 = a6;
  id v11 = a3;
  id v12 = -[PDAccountManagerEnhancedMerchantsRequest initWithAccountIdentifier:ignoreErrorBackoff:cooldownLevel:]( objc_alloc(&OBJC_CLASS___PDAccountManagerEnhancedMerchantsRequest),  "initWithAccountIdentifier:ignoreErrorBackoff:cooldownLevel:",  v11,  v7,  a5);

  -[PDAccountManagerEnhancedMerchantsRequest addCompletion:](v12, "addCompletion:", v10);
  -[PDAccountManager _addAccountManagerFetchRequest:](self, "_addAccountManagerFetchRequest:", v12);
}

- (void)insertOrUpdateAccountEnhancedMerchants:(id)a3 accountIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = v8;
  if (a3 && a4)
  {
    -[PDDatabaseManager insertOrUpdateAccountEnhancedMerchants:accountIdentifier:]( self->_databaseManager,  "insertOrUpdateAccountEnhancedMerchants:accountIdentifier:",  a3,  a4);
    replyQueue = self->_replyQueue;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1001FDDB4;
    v13[3] = &unk_10063A830;
    id v11 = &v14;
    id v14 = v9;
    id v12 = v13;
  }

  else
  {
    replyQueue = self->_replyQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001FDDA4;
    block[3] = &unk_10063A830;
    id v11 = &v16;
    id v16 = v8;
    id v12 = block;
  }

  dispatch_async((dispatch_queue_t)replyQueue, v12);
}

- (void)accountEnhancedMerchantsForAccountWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    if (v6)
    {
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472LL;
      v11[2] = sub_1001FDED4;
      v11[3] = &unk_10064B940;
      void v11[4] = self;
      id v12 = v6;
      id v13 = v8;
      -[PDAccountManager accountWithIdentifier:completion:](self, "accountWithIdentifier:completion:", v12, v11);

      id v9 = v12;
    }

    else
    {
      replyQueue = self->_replyQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1001FDEC4;
      block[3] = &unk_10063A830;
      id v15 = v7;
      dispatch_async((dispatch_queue_t)replyQueue, block);
      id v9 = v15;
    }
  }
}

- (void)deleteAccountEnhancedMerchant:(id)a3 forAccountWithIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  workQueue = self->_workQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1001FE114;
  v15[3] = &unk_10063B440;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async((dispatch_queue_t)workQueue, v15);
}

- (void)_managerFetch_updateEnhancedMerchantsWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 accountIdentifier]);
  id v9 = v8;
  if (v8)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1001FE348;
    v12[3] = &unk_10064C210;
    void v12[4] = self;
    id v13 = v8;
    id v15 = v7;
    id v14 = v6;
    -[PDAccountManager accountWithIdentifier:completion:](self, "accountWithIdentifier:completion:", v13, v12);

    id v10 = v13;
LABEL_5:

    goto LABEL_6;
  }

  if (v7)
  {
    replyQueue = self->_replyQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001FE2E0;
    block[3] = &unk_10063A830;
    id v17 = v7;
    dispatch_async((dispatch_queue_t)replyQueue, block);
    id v10 = v17;
    goto LABEL_5;
  }

- (void)_managerFetch_updateBalancesWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_1001FF244;
    v9[3] = &unk_10064C210;
    void v9[4] = self;
    id v10 = (id)objc_claimAutoreleasedReturnValue([v6 accountIdentifier]);
    id v12 = v7;
    id v11 = v6;
    id v8 = v10;
    -[PDAccountManager accountWithIdentifier:completion:](self, "accountWithIdentifier:completion:", v8, v9);
  }
}

- (void)_queue_updateEnhancedMerchantsIfNecessaryForAccount:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (v4)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 accountIdentifier]);
    if ([v5 showEnhancedMerchants])
    {
      uint64_t v7 = PDAccountEndpointBackOffAccountTypeFromFeatureIdentifier([v5 feature]);
      id v8 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager accountEndpointMetadataForAccountIdentifier:endpoint:]( self->_databaseManager,  "accountEndpointMetadataForAccountIdentifier:endpoint:",  v6,  4LL));
      if ([v8 isDirty])
      {
        id v9 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager nextPossibleFetchDateForAccountType:endpointType:accountIdentifier:]( self->_databaseManager,  "nextPossibleFetchDateForAccountType:endpointType:accountIdentifier:",  v7,  8LL,  v6));
        if (v9
          && (id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date")),
              [v10 timeIntervalSinceDate:v9],
              double v12 = v11,
              v10,
              v12 > 0.0))
        {
          uint64_t Object = PKLogFacilityTypeGetObject(14LL);
          id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v21 = v6;
            _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Fetching enhanced merchants that are dirty for account %@",  buf,  0xCu);
          }

          v18[0] = _NSConcreteStackBlock;
          v18[1] = 3221225472LL;
          v18[2] = sub_1001FF8E0;
          v18[3] = &unk_10064CA58;
          id v19 = v6;
          -[PDAccountManager _updateAccountEnhancedMerchantsForAccountWithIdentifier:ignoreErrorBackoff:cooldownLevel:completion:]( self,  "_updateAccountEnhancedMerchantsForAccountWithIdentifier:ignoreErrorBackoff:cooldownLevel:completion:",  v19,  0LL,  0LL,  v18);
          id v9 = v19;
        }

        else
        {
          uint64_t v16 = PKLogFacilityTypeGetObject(14LL);
          id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            id v21 = v6;
            __int16 v22 = 2112;
            id v23 = v9;
            _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Not fetching enhanced merchants that are dirty for account %@ since the next possible fetch date is %@",  buf,  0x16u);
          }
        }
      }
    }

    else
    {
      uint64_t v15 = PKLogFacilityTypeGetObject(14LL);
      id v8 = (void *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v21 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v8,  OS_LOG_TYPE_DEFAULT,  "Not fetching enhanced merchants for account %@ because it is not a supported feature on this account",  buf,  0xCu);
      }
    }
  }
}

- (void)accountEnhancedMerchantBehaviorForAccountWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    if (v6)
    {
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472LL;
      v11[2] = sub_1001FFAB0;
      v11[3] = &unk_10064B940;
      void v11[4] = self;
      id v12 = v6;
      id v13 = v8;
      -[PDAccountManager accountWithIdentifier:completion:](self, "accountWithIdentifier:completion:", v12, v11);

      id v9 = v12;
    }

    else
    {
      replyQueue = self->_replyQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1001FFAA0;
      block[3] = &unk_10063A830;
      id v15 = v7;
      dispatch_async((dispatch_queue_t)replyQueue, block);
      id v9 = v15;
    }
  }
}

- (void)updateCreditRecoveryPaymentPlansForAccountIdentifier:(id)a3 completion:(id)a4
{
}

- (void)creditRecoveryPaymentPlansForAccountIdentifier:(id)a3 allowFetchFromServer:(BOOL)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = v8;
  if (v8)
  {
    replyQueue = self->_replyQueue;
    if (v7)
    {
      id v13 = _NSConcreteStackBlock;
      double v11 = sub_1001FFCC4;
      id v12 = &v13;
    }

    else
    {
      id v14 = _NSConcreteStackBlock;
      double v11 = sub_1001FFCB4;
      id v12 = &v14;
    }

    v12[1] = (void **)3221225472LL;
    v12[2] = (void **)v11;
    v12[3] = (void **)&unk_10063A830;
    void v12[4] = (void **)v8;
    dispatch_async((dispatch_queue_t)replyQueue, v12);
  }
}

- (void)creditRecoveryPaymentPlanInformationForAccountIdentifier:(id)a3 allowFetchFromServer:(BOOL)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = v8;
  if (v8)
  {
    replyQueue = self->_replyQueue;
    if (v7)
    {
      id v13 = _NSConcreteStackBlock;
      double v11 = sub_1001FFD9C;
      id v12 = &v13;
    }

    else
    {
      id v14 = _NSConcreteStackBlock;
      double v11 = sub_1001FFD88;
      id v12 = &v14;
    }

    v12[1] = (void **)3221225472LL;
    v12[2] = (void **)v11;
    v12[3] = (void **)&unk_10063A830;
    void v12[4] = (void **)v8;
    dispatch_async((dispatch_queue_t)replyQueue, v12);
  }
}

- (void)_updateCreditRecoveryPaymentPlansForAccountIdentifier:(id)a3 force:(BOOL)a4 completion:(id)a5
{
  id v6 = a5;
  replyQueue = self->_replyQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001FFE30;
  block[3] = &unk_10063A830;
  id v10 = v6;
  id v8 = v6;
  dispatch_async((dispatch_queue_t)replyQueue, block);
}

- (void)_managerFetch_updateCreditRecoveryPaymentPlansWithRequest:(id)a3 completion:(id)a4
{
  id v5 = a4;
  replyQueue = self->_replyQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001FFEC0;
  block[3] = &unk_10063A830;
  id v9 = v5;
  id v7 = v5;
  dispatch_async((dispatch_queue_t)replyQueue, block);
}

- (void)accountEntityOrderingsForAccountWithIdentifier:(id)a3 entityType:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = v9;
  if (v9)
  {
    if (v8 && a4)
    {
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472LL;
      v13[2] = sub_1001FFFF8;
      v13[3] = &unk_10064C838;
      void v13[4] = self;
      id v14 = v8;
      unint64_t v16 = a4;
      id v15 = v10;
      -[PDAccountManager accountWithIdentifier:completion:](self, "accountWithIdentifier:completion:", v14, v13);

      double v11 = v14;
    }

    else
    {
      replyQueue = self->_replyQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1001FFFE8;
      block[3] = &unk_10063A830;
      id v18 = v9;
      dispatch_async((dispatch_queue_t)replyQueue, block);
      double v11 = v18;
    }
  }
}

- (BOOL)_shouldProactivelyFetchEndpoint:(unint64_t)a3 metadataType:(unint64_t)a4 fetchPeriodEndpoint:(unint64_t)a5 account:(id)a6
{
  id v10 = a6;
  double v11 = (void *)objc_claimAutoreleasedReturnValue([v10 accountIdentifier]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager accountEndpointMetadataForAccountIdentifier:endpoint:]( self->_databaseManager,  "accountEndpointMetadataForAccountIdentifier:endpoint:",  v11,  a4));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 lastUpdated]);
  LOBYTE(a5) = -[PDAccountManager _shouldProactivelyFetchEndpoint:dirty:lastUpdated:fetchPeriodEndpoint:account:]( self,  "_shouldProactivelyFetchEndpoint:dirty:lastUpdated:fetchPeriodEndpoint:account:",  a3,  [v12 isDirty],  v13,  a5,  v10);

  return a5;
}

- (BOOL)_shouldProactivelyFetchEndpoint:(unint64_t)a3 dirty:(BOOL)a4 lastUpdated:(id)a5 fetchPeriodEndpoint:(unint64_t)a6 account:(id)a7
{
  BOOL v9 = a4;
  id v12 = (os_log_s *)a5;
  id v13 = a7;
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 fetchPeriods]);
  unsigned __int8 v15 = [v14 endpointIsBlocked:a6];
  [v14 fetchPeriodForEndpoint:a6];
  unsigned int v16 = +[PKAccountFetchPeriods isLastUpdatedOutOfDate:fetchPeriod:]( &OBJC_CLASS___PKAccountFetchPeriods,  "isLastUpdatedOutOfDate:fetchPeriod:",  v12);
  uint64_t v17 = PDAccountEndpointBackOffAccountTypeFromFeatureIdentifier([v13 feature]);
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v13 accountIdentifier]);

  if ((v15 & 1) != 0)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(14LL);
    id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      id v21 = PDAccountEndpointBackOffEndpointTypeToString(a3);
      __int16 v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
      int v43 = 138412546;
      id v44 = v22;
      __int16 v45 = 2112;
      __int128 v46 = v18;
      id v23 = "Not proactively fetching %@ endpoint for account %@ since the endpoint is blocked";
      id v24 = v20;
      uint32_t v25 = 22;
LABEL_16:
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, v23, (uint8_t *)&v43, v25);

      goto LABEL_17;
    }

    goto LABEL_17;
  }

  if (v9)
  {
    id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager nextPossibleFetchDateForAccountType:endpointType:accountIdentifier:]( self->_databaseManager,  "nextPossibleFetchDateForAccountType:endpointType:accountIdentifier:",  v17,  a3,  v18));
    if (v20
      && (id v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date")),
          [v26 timeIntervalSinceDate:v20],
          double v28 = v27,
          v26,
          v28 <= 0.0))
    {
      uint64_t v39 = PKLogFacilityTypeGetObject(14LL);
      int v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        id v40 = PDAccountEndpointBackOffEndpointTypeToString(a3);
        id v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
        int v43 = 138412802;
        id v44 = v41;
        __int16 v45 = 2112;
        __int128 v46 = v18;
        __int16 v47 = 2112;
        __int128 v48 = v20;
        _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "Not proactively fetching %@ endpoint which is dirty for account %@ since the next possible fetch date is %@",  (uint8_t *)&v43,  0x20u);
      }

      BOOL v33 = 0;
    }

    else
    {
      uint64_t v29 = PKLogFacilityTypeGetObject(14LL);
      int v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        __int128 v31 = PDAccountEndpointBackOffEndpointTypeToString(a3);
        __int128 v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
        int v43 = 138412546;
        id v44 = v32;
        __int16 v45 = 2112;
        __int128 v46 = v18;
        _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "Proactively fetching %@ endpoint which is dirty for account %@",  (uint8_t *)&v43,  0x16u);
      }

      BOOL v33 = 1;
    }
  }

  else
  {
    uint64_t v34 = PKLogFacilityTypeGetObject(14LL);
    id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
    BOOL v35 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
    if (!v16)
    {
      if (v35)
      {
        unint64_t v38 = PDAccountEndpointBackOffEndpointTypeToString(a3);
        __int16 v22 = (void *)objc_claimAutoreleasedReturnValue(v38);
        int v43 = 138412802;
        id v44 = v22;
        __int16 v45 = 2112;
        __int128 v46 = v18;
        __int16 v47 = 2112;
        __int128 v48 = v12;
        id v23 = "Not proactively fetching %@ endpoint for account %@ since endpoint is not dirty and not out of date. Last "
              "fetch date was %@";
        id v24 = v20;
        uint32_t v25 = 32;
        goto LABEL_16;
      }

- (void)_addAccountManagerFetchRequest:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray requestIdentifier](v4, "requestIdentifier"));
  uint64_t Object = PKLogFacilityTypeGetObject(14LL);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Account manager request incoming %@", buf, 0xCu);
  }

  os_unfair_lock_lock(&self->_fetchRequestLock);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_fetchRequests, "objectForKey:", v5));
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  BOOL v9 = v8;
  id v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v16,  v24,  16LL);
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v17;
    while (2)
    {
      for (unint64_t i = 0LL; i != v11; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        if (objc_msgSend(v14, "coalesceWithRequest:", v4, (void)v16))
        {
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            id v21 = v4;
            __int16 v22 = 2112;
            id v23 = v14;
            _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Account manager request coalesced %@ onto existing request %@",  buf,  0x16u);
          }

          id v7 = (os_log_s *)v4;
          unsigned __int8 v15 = v9;
          goto LABEL_20;
        }
      }

      id v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v16,  v24,  16LL);
      if (v11) {
        continue;
      }
      break;
    }
  }

  if (v4)
  {
    unsigned __int8 v15 = v9;
    if (!v9)
    {
      unsigned __int8 v15 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      -[NSMutableDictionary setObject:forKey:](self->_fetchRequests, "setObject:forKey:", v15, v5);
    }

    -[NSMutableArray addObject:](v15, "addObject:", v4, (void)v16);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Account manager request queued %@", buf, 0xCu);
    }

    BOOL v9 = v4;
LABEL_20:

    BOOL v9 = v15;
  }

  os_unfair_lock_unlock(&self->_fetchRequestLock);
  -[PDAccountManager _executeNextAccountManagerFetchIfPossibleForRequestIdentifier:]( self,  "_executeNextAccountManagerFetchIfPossibleForRequestIdentifier:",  v5);
}

- (void)_executeNextAccountManagerFetchIfPossibleForRequestIdentifier:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_fetchRequestLock);
  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_currentRequests, "objectForKey:", v4));
  if (v5)
  {
    id v6 = (void *)v5;
    os_unfair_lock_unlock(&self->_fetchRequestLock);
  }

  else
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_fetchRequests, "objectForKey:", v4));
    uint64_t v8 = objc_claimAutoreleasedReturnValue([v7 firstObject]);
    if (v8)
    {
      BOOL v9 = (void *)v8;
      [v7 removeObjectAtIndex:0];
      currentRequests = self->_currentRequests;
      id v11 = v9;
      -[NSMutableDictionary setObject:forKey:](currentRequests, "setObject:forKey:", v11, v4);

      os_unfair_lock_unlock(&self->_fetchRequestLock);
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472LL;
      v12[2] = sub_100200968;
      v12[3] = &unk_1006392B0;
      void v12[4] = self;
      id v13 = v4;
      -[PDAccountManager _executeFetchRequest:completion:](self, "_executeFetchRequest:completion:", v11, v12);
    }

    else
    {

      os_unfair_lock_unlock(&self->_fetchRequestLock);
    }
  }
}

- (void)_executeFetchRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v77[0] = _NSConcreteStackBlock;
  v77[1] = 3221225472LL;
  v77[2] = sub_10020101C;
  v77[3] = &unk_10063AC90;
  v77[4] = self;
  id v7 = a4;
  id v78 = v7;
  uint64_t v8 = objc_retainBlock(v77);
  uint64_t Object = PKLogFacilityTypeGetObject(14LL);
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v80 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Account manager request started %@", buf, 0xCu);
  }

  switch((unint64_t)[v6 requestType])
  {
    case 0uLL:
      id v11 = v6;
      v74[0] = _NSConcreteStackBlock;
      v74[1] = 3221225472LL;
      v74[2] = sub_1002010A0;
      v74[3] = &unk_1006390F0;
      uint64_t v12 = &v75;
      id v75 = v11;
      id v13 = (id *)&v76;
      __int128 v76 = v8;
      -[PDAccountManager _managerFetch_updateAccountsWithRequest:completion:]( self,  "_managerFetch_updateAccountsWithRequest:completion:",  v11,  v74);
      goto LABEL_20;
    case 1uLL:
      id v14 = v6;
      v71[0] = _NSConcreteStackBlock;
      v71[1] = 3221225472LL;
      v71[2] = sub_1002010D4;
      v71[3] = &unk_10064CA80;
      uint64_t v12 = &v72;
      id v72 = v14;
      id v13 = (id *)&v73;
      id v73 = v8;
      -[PDAccountManager _managerFetch_updateAccountWithRequest:completion:]( self,  "_managerFetch_updateAccountWithRequest:completion:",  v14,  v71);
      goto LABEL_20;
    case 2uLL:
      id v15 = v6;
      v68[0] = _NSConcreteStackBlock;
      v68[1] = 3221225472LL;
      v68[2] = sub_100201108;
      v68[3] = &unk_10064CAA8;
      uint64_t v12 = &v69;
      id v69 = v15;
      id v13 = (id *)&v70;
      uint64_t v70 = v8;
      -[PDAccountManager _managerFetch_performVirtualCardActionWithRequest:completion:]( self,  "_managerFetch_performVirtualCardActionWithRequest:completion:",  v15,  v68);
      goto LABEL_20;
    case 3uLL:
      id v16 = v6;
      v65[0] = _NSConcreteStackBlock;
      v65[1] = 3221225472LL;
      v65[2] = sub_100201140;
      v65[3] = &unk_10064CAD0;
      uint64_t v12 = &v66;
      id v66 = v16;
      id v13 = (id *)&v67;
      unint64_t v67 = v8;
      -[PDAccountManager _managerFetch_updateAccountUsersWithRequest:completion:]( self,  "_managerFetch_updateAccountUsersWithRequest:completion:",  v16,  v65);
      goto LABEL_20;
    case 4uLL:
      id v17 = v6;
      v62[0] = _NSConcreteStackBlock;
      v62[1] = 3221225472LL;
      v62[2] = sub_100201174;
      v62[3] = &unk_10064CAF8;
      uint64_t v12 = &v63;
      id v63 = v17;
      id v13 = (id *)&v64;
      id v64 = v8;
      -[PDAccountManager _managerFetch_sharedAccountCloudStoreWithRequest:completion:]( self,  "_managerFetch_sharedAccountCloudStoreWithRequest:completion:",  v17,  v62);
      goto LABEL_20;
    case 5uLL:
      id v18 = v6;
      v59[0] = _NSConcreteStackBlock;
      v59[1] = 3221225472LL;
      v59[2] = sub_1002011A8;
      v59[3] = &unk_10063B468;
      uint64_t v12 = &v60;
      id v60 = v18;
      id v13 = (id *)&v61;
      __int128 v61 = v8;
      -[PDAccountManager _managerFetch_createdZoneWithRequest:completion:]( self,  "_managerFetch_createdZoneWithRequest:completion:",  v18,  v59);
      goto LABEL_20;
    case 6uLL:
      id v19 = v6;
      v56[0] = _NSConcreteStackBlock;
      v56[1] = 3221225472LL;
      v56[2] = sub_1002011DC;
      v56[3] = &unk_1006390F0;
      uint64_t v12 = &v57;
      id v57 = v19;
      id v13 = (id *)&v58;
      uint64_t v58 = v8;
      -[PDAccountManager _managerFetch_updateFinancingPlansWithRequest:completion:]( self,  "_managerFetch_updateFinancingPlansWithRequest:completion:",  v19,  v56);
      goto LABEL_20;
    case 7uLL:
      id v20 = v6;
      v53[0] = _NSConcreteStackBlock;
      v53[1] = 3221225472LL;
      v53[2] = sub_100201210;
      v53[3] = &unk_1006390F0;
      uint64_t v12 = &v54;
      id v54 = v20;
      id v13 = (id *)&v55;
      __int16 v55 = v8;
      -[PDAccountManager _managerFetch_updateFundingSourcesWithRequest:completion:]( self,  "_managerFetch_updateFundingSourcesWithRequest:completion:",  v20,  v53);
      goto LABEL_20;
    case 8uLL:
      id v21 = v6;
      v50[0] = _NSConcreteStackBlock;
      v50[1] = 3221225472LL;
      v50[2] = sub_100201244;
      v50[3] = &unk_1006390F0;
      uint64_t v12 = &v51;
      id v51 = v21;
      id v13 = (id *)&v52;
      id v52 = v8;
      -[PDAccountManager _managerFetch_updatePromotionsWithRequest:completion:]( self,  "_managerFetch_updatePromotionsWithRequest:completion:",  v21,  v50);
      goto LABEL_20;
    case 9uLL:
      id v22 = v6;
      v47[0] = _NSConcreteStackBlock;
      v47[1] = 3221225472LL;
      v47[2] = sub_100201278;
      v47[3] = &unk_10064CB20;
      uint64_t v12 = &v48;
      id v48 = v22;
      id v13 = (id *)&v49;
      BOOL v49 = v8;
      -[PDAccountManager _managerFetch_updateEnhancedMerchantsWithRequest:completion:]( self,  "_managerFetch_updateEnhancedMerchantsWithRequest:completion:",  v22,  v47);
      goto LABEL_20;
    case 0xAuLL:
      id v23 = v6;
      v44[0] = _NSConcreteStackBlock;
      v44[1] = 3221225472LL;
      v44[2] = sub_1002012B0;
      v44[3] = &unk_1006390F0;
      uint64_t v12 = &v45;
      id v45 = v23;
      id v13 = (id *)&v46;
      __int128 v46 = v8;
      -[PDAccountManager _managerFetch_updateBalancesWithRequest:completion:]( self,  "_managerFetch_updateBalancesWithRequest:completion:",  v23,  v44);
      goto LABEL_20;
    case 0xBuLL:
      id v24 = v6;
      v41[0] = _NSConcreteStackBlock;
      v41[1] = 3221225472LL;
      v41[2] = sub_1002012E4;
      v41[3] = &unk_100648088;
      uint64_t v12 = &v42;
      id v42 = v24;
      id v13 = (id *)&v43;
      int v43 = v8;
      -[PDAccountManager _managerFetch_sendAccountReport:completion:]( self,  "_managerFetch_sendAccountReport:completion:",  v24,  v41);
      goto LABEL_20;
    case 0xCuLL:
      id v25 = v6;
      v38[0] = _NSConcreteStackBlock;
      v38[1] = 3221225472LL;
      v38[2] = sub_100201314;
      void v38[3] = &unk_10064C490;
      uint64_t v12 = &v39;
      id v39 = v25;
      id v13 = (id *)&v40;
      id v40 = v8;
      -[PDAccountManager _managerFetch_exportTransactionsWithRequest:completion:]( self,  "_managerFetch_exportTransactionsWithRequest:completion:",  v25,  v38);
      goto LABEL_20;
    case 0xDuLL:
      id v26 = v6;
      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472LL;
      v35[2] = sub_100201348;
      v35[3] = &unk_100648088;
      uint64_t v12 = &v36;
      id v36 = v26;
      id v13 = (id *)&v37;
      id v37 = v8;
      -[PDAccountManager _managerFetch_cancelFinancingPlanWithRequest:completion:]( self,  "_managerFetch_cancelFinancingPlanWithRequest:completion:",  v26,  v35);
      goto LABEL_20;
    case 0xEuLL:
      id v27 = v6;
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472LL;
      v32[2] = sub_100201378;
      v32[3] = &unk_1006390F0;
      uint64_t v12 = &v33;
      id v33 = v27;
      id v13 = (id *)&v34;
      uint64_t v34 = v8;
      -[PDAccountManager _managerFetch_updateCreditRecoveryPaymentPlansWithRequest:completion:]( self,  "_managerFetch_updateCreditRecoveryPaymentPlansWithRequest:completion:",  v27,  v32);
      goto LABEL_20;
    case 0xFuLL:
      id v28 = v6;
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472LL;
      v29[2] = sub_1002013AC;
      v29[3] = &unk_10064CAD0;
      uint64_t v12 = &v30;
      id v30 = v28;
      id v13 = (id *)&v31;
      __int128 v31 = v8;
      -[PDAccountManager _managerFetch_updatePhysicalCardsWithRequest:completion:]( self,  "_managerFetch_updatePhysicalCardsWithRequest:completion:",  v28,  v29);
LABEL_20:

      break;
    default:
      break;
  }
}

- (void)_queue_fetchNextPaginatedRequestIfNecessaryFromPreviousResponse:(id)a3 newRequest:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if (a3 && v6 && [a3 moreComing])
  {
    uint64_t Object = PKLogFacilityTypeGetObject(14LL);
    BOOL v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Performing paginated request %@ because moreComing is true",  (uint8_t *)&v10,  0xCu);
    }

    -[PDAccountManager _addAccountManagerFetchRequest:](self, "_addAccountManagerFetchRequest:", v7);
  }
}

- (void)_updatePushTopics
{
  id v3 = objc_alloc(&OBJC_CLASS___NSMutableSet);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[PDPaymentWebServiceCoordinator accountServicePushTopics]( self->_paymentWebServiceCoordinator,  "accountServicePushTopics"));
  uint64_t v5 = -[NSMutableSet initWithSet:](v3, "initWithSet:", v4);

  os_unfair_lock_t lock = &self->_lockPushTopics;
  os_unfair_lock_lock(&self->_lockPushTopics);
  id v34 = -[NSSet copy](self->_accountServicePushNotificationTopics, "copy");
  id v33 = -[NSDictionary copy](self->_additionalPushNotificationTopics, "copy");
  if (!-[NSMutableSet count](v5, "count")) {
    -[NSMutableSet addObject:](v5, "addObject:", @"com.apple.account.service");
  }
  id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  BOOL v35 = self;
  id v7 = self->_accounts;
  id v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v36,  v40,  16LL);
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v37;
    do
    {
      for (unint64_t i = 0LL; i != v9; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v37 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v36 + 1) + 8LL * (void)i);
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 additionalPushTopics]);
        id v14 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
        id v15 = (void *)objc_claimAutoreleasedReturnValue([v13 account]);
        -[NSMutableArray safelyAddObject:](v14, "safelyAddObject:", v15);

        id v16 = (void *)objc_claimAutoreleasedReturnValue([v13 extendedAccount]);
        -[NSMutableArray safelyAddObject:](v14, "safelyAddObject:", v16);

        id v17 = (void *)objc_claimAutoreleasedReturnValue([v13 payments]);
        -[NSMutableArray safelyAddObject:](v14, "safelyAddObject:", v17);

        id v18 = (void *)objc_claimAutoreleasedReturnValue([v13 users]);
        -[NSMutableArray safelyAddObject:](v14, "safelyAddObject:", v18);

        id v19 = (void *)objc_claimAutoreleasedReturnValue([v13 sharedAccountCloudStore]);
        -[NSMutableArray safelyAddObject:](v14, "safelyAddObject:", v19);

        id v20 = (void *)objc_claimAutoreleasedReturnValue([v13 financingPlans]);
        -[NSMutableArray safelyAddObject:](v14, "safelyAddObject:", v20);

        id v21 = (void *)objc_claimAutoreleasedReturnValue([v13 physicalCards]);
        -[NSMutableArray safelyAddObject:](v14, "safelyAddObject:", v21);

        id v22 = (void *)objc_claimAutoreleasedReturnValue([v13 virtualCards]);
        -[NSMutableArray safelyAddObject:](v14, "safelyAddObject:", v22);

        id v23 = (void *)objc_claimAutoreleasedReturnValue([v13 servicingToken]);
        -[NSMutableArray safelyAddObject:](v14, "safelyAddObject:", v23);

        id v24 = (void *)objc_claimAutoreleasedReturnValue([v13 fundingSources]);
        -[NSMutableArray safelyAddObject:](v14, "safelyAddObject:", v24);

        id v25 = (void *)objc_claimAutoreleasedReturnValue([v13 creditRecoveryPaymentPlans]);
        -[NSMutableArray safelyAddObject:](v14, "safelyAddObject:", v25);

        id v26 = (void *)objc_claimAutoreleasedReturnValue([v12 accountIdentifier]);
        -[NSMutableDictionary setObject:forKey:](v6, "setObject:forKey:", v14, v26);
      }

      id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v36,  v40,  16LL);
    }

    while (v9);
  }

  id v27 = (NSDictionary *)-[NSMutableDictionary copy](v6, "copy");
  additionalPushNotificationTopics = v35->_additionalPushNotificationTopics;
  v35->_additionalPushNotificationTopics = v27;

  uint64_t v29 = (NSSet *)-[NSMutableSet copy](v5, "copy");
  accountServicePushNotificationTopics = v35->_accountServicePushNotificationTopics;
  v35->_accountServicePushNotificationTopics = v29;

  if (PKEqualObjects(v34, v35->_accountServicePushNotificationTopics))
  {
    char v31 = PKEqualObjects(v33, v35->_additionalPushNotificationTopics);
    os_unfair_lock_unlock(lock);

    if ((v31 & 1) != 0) {
      goto LABEL_15;
    }
  }

  else
  {
    os_unfair_lock_unlock(lock);
  }

  -[PDPushNotificationManager recalculatePushTopics](v35->_pushNotificationManager, "recalculatePushTopics");
LABEL_15:
}

- (id)pushNotificationTopics
{
  p_lockPushTopics = &self->_lockPushTopics;
  os_unfair_lock_lock(&self->_lockPushTopics);
  accountServicePushNotificationTopics = self->_accountServicePushNotificationTopics;
  if (accountServicePushNotificationTopics) {
    uint64_t v5 = (NSMutableSet *)-[NSSet mutableCopy](accountServicePushNotificationTopics, "mutableCopy");
  }
  else {
    uint64_t v5 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  }
  additionalPushNotificationTopics = self->_additionalPushNotificationTopics;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1002019C4;
  v12[3] = &unk_100643450;
  id v7 = v5;
  id v13 = v7;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:]( additionalPushNotificationTopics,  "enumerateKeysAndObjectsUsingBlock:",  v12);
  os_unfair_lock_unlock(p_lockPushTopics);

  uint64_t Object = PKLogFacilityTypeGetObject(14LL);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Account push topics: %@", buf, 0xCu);
  }

  id v10 = -[NSMutableSet copy](v7, "copy");
  return v10;
}

- (void)handlePushNotificationForTopic:(id)a3 userInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t Object = PKLogFacilityTypeGetObject(14LL);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v25 = v6;
    __int16 v26 = 2112;
    id v27 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Received push for push topic: %@. userInfo: %@",  buf,  0x16u);
  }

  os_unfair_lock_lock(&self->_lockPushTopics);
  unsigned __int8 v10 = -[NSSet containsObject:](self->_accountServicePushNotificationTopics, "containsObject:", v6);
  os_unfair_lock_unlock(&self->_lockPushTopics);
  if ((v10 & 1) != 0
    || (id v11 = (void *)objc_claimAutoreleasedReturnValue( -[PDPaymentWebServiceCoordinator accountServicePushTopics]( self->_paymentWebServiceCoordinator,  "accountServicePushTopics")),  v12 = [v11 containsObject:v6],  v11,  v12))
  {
    workQueue = self->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100201B9C;
    block[3] = &unk_1006392B0;
    id v22 = v7;
    id v23 = self;
    id v14 = v7;
    dispatch_async((dispatch_queue_t)workQueue, block);
    id v15 = v22;
  }

  else
  {
    id v16 = self->_workQueue;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_100201BE8;
    v18[3] = &unk_100639350;
    void v18[4] = self;
    id v19 = v6;
    id v20 = v7;
    id v17 = v7;
    dispatch_async((dispatch_queue_t)v16, v18);

    id v15 = v19;
  }
}

- (void)applyPushNotificationToken:(id)a3
{
  uint64_t Object = PKLogFacilityTypeGetObject(14LL);
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received push token %@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)_queue_updateAccountsWithPayload:(id)a3
{
  id v4 = a3;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  v31[2] = sub_100203564;
  v31[3] = &unk_100639300;
  v31[4] = self;
  uint64_t v5 = objc_retainBlock(v31);
  uint64_t Object = PKLogFacilityTypeGetObject(14LL);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v33 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Updating accounts with payload %@", buf, 0xCu);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 accountIdentifier]);
  unint64_t v9 = -[PDAccountManager _queueIndexOfAccountWithIdentifier:](self, "_queueIndexOfAccountWithIdentifier:", v8);
  if (v4 && v8 && v9 != 0x7FFFFFFFFFFFFFFFLL)
  {
    switch((unint64_t)[v4 endpoint])
    {
      case 0uLL:
        goto LABEL_7;
      case 1uLL:
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v33 = v8;
          _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Updating account %@ following push",  buf,  0xCu);
        }

        v29[0] = _NSConcreteStackBlock;
        v29[1] = 3221225472LL;
        v29[2] = sub_1002035DC;
        v29[3] = &unk_10064CB48;
        id v30 = v8;
        -[PDAccountManager updateAccountWithIdentifier:extended:completion:]( self,  "updateAccountWithIdentifier:extended:completion:",  v30,  0LL,  v29);
        unsigned __int8 v10 = v30;
        goto LABEL_20;
      case 2uLL:
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v33 = v8;
          _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Updating financing plans of account %@ following push",  buf,  0xCu);
        }

        id v11 = [v4 ignoreLastUpdatedDate];
        v27[0] = _NSConcreteStackBlock;
        v27[1] = 3221225472LL;
        v27[2] = sub_100203684;
        v27[3] = &unk_10064B310;
        id v28 = v8;
        -[PDAccountManager _updateFinancingPlansForAccountWithIdentifier:pageOffset:limit:ignoreLastUpdatedDate:fromPush:completion:]( self,  "_updateFinancingPlansForAccountWithIdentifier:pageOffset:limit:ignoreLastUpdatedDate:fromPush:completion:",  v28,  0LL,  0LL,  v11,  1LL,  v27);
        unsigned __int8 v10 = v28;
        goto LABEL_20;
      case 3uLL:
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v33 = v8;
          _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Updating funding sources of account %@ following push",  buf,  0xCu);
        }

        v25[0] = _NSConcreteStackBlock;
        v25[1] = 3221225472LL;
        v25[2] = sub_100203744;
        v25[3] = &unk_10064B310;
        id v26 = v8;
        -[PDAccountManager updatePaymentFundingSourcesForAccountIdentifier:force:completion:]( self,  "updatePaymentFundingSourcesForAccountIdentifier:force:completion:",  v26,  1LL,  v25);
        unsigned __int8 v10 = v26;
        goto LABEL_20;
      case 5uLL:
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v33 = v8;
          _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Reseting cloud store zones for account %@ following push",  buf,  0xCu);
        }

        unint64_t v12 = -[PDAccountManager _queueIndexOfAccountWithIdentifier:](self, "_queueIndexOfAccountWithIdentifier:", v8);
        if (v12 == 0x7FFFFFFFFFFFFFFFLL) {
          break;
        }
        id v13 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_accounts, "objectAtIndex:", v12));
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 cloudStoreZoneNames]);
        if ([v14 count])
        {
          cloudStoreNotificationCoordinator = self->_cloudStoreNotificationCoordinator;
          v22[0] = _NSConcreteStackBlock;
          v22[1] = 3221225472LL;
          v22[2] = sub_100203804;
          v22[3] = &unk_10063DAE8;
          id v23 = v14;
          id v24 = v8;
          -[PDCloudStoreNotificationCoordinator recreateZones:completion:]( cloudStoreNotificationCoordinator,  "recreateZones:completion:",  v23,  v22);

          id v7 = v23;
        }

        else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v33 = v8;
          _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "No zones to reset on account %@ following push",  buf,  0xCu);
        }

        goto LABEL_32;
      case 6uLL:
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v33 = v8;
          _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Reset balances for account %@ following push",  buf,  0xCu);
        }

        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472LL;
        void v20[2] = sub_1002038CC;
        v20[3] = &unk_10063A790;
        id v21 = v8;
        -[PDAccountManager resetAccountBalancesForAccountIdentifier:completion:]( self,  "resetAccountBalancesForAccountIdentifier:completion:",  v21,  v20);
        unsigned __int8 v10 = v21;
LABEL_20:

        break;
      case 7uLL:
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v4 topUpTokenIdentifier]);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          id v33 = v16;
          __int16 v34 = 2112;
          BOOL v35 = v8;
          _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Invalidate top up token with identifier %@ for account %@ following push",  buf,  0x16u);
        }

        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472LL;
        v17[2] = sub_10020398C;
        v17[3] = &unk_1006489C0;
        id v18 = v16;
        id v19 = v8;
        id v13 = v16;
        -[PDAccountManager invalidateTopUpTokenWithIdentifier:forAccountWithIdentifier:completion:]( self,  "invalidateTopUpTokenWithIdentifier:forAccountWithIdentifier:completion:",  v13,  v19,  v17);

LABEL_32:
        break;
      default:
        break;
    }
  }

  else
  {
LABEL_7:
    ((void (*)(void *))v5[2])(v5);
  }
}

- (void)familyCircleManagerDidUpdateFamilyMembers:(id)a3
{
  id v4 = a3;
  uint64_t Object = PKLogFacilityTypeGetObject(14LL);
  int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "PDAccountManager: familyCircleManagerDidUpdateFamilyMembers",  buf,  2u);
  }

  id v7 = objc_alloc_init(&OBJC_CLASS___PKAsyncUnaryOperationComposer);
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager accountPendingFamilyMembersWithDisplayedNotification:]( self->_databaseManager,  "accountPendingFamilyMembersWithDisplayedNotification:",  0LL));
  unint64_t v9 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472LL;
  v33[2] = sub_100203CB8;
  v33[3] = &unk_10063BAD8;
  id v10 = v4;
  id v34 = v10;
  id v35 = v8;
  __int128 v36 = self;
  id v11 = v9;
  __int128 v37 = v11;
  id v12 = v8;
  [v7 addOperation:v33];
  id v13 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  id v14 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_100203EEC;
  v27[3] = &unk_10063E930;
  id v28 = v10;
  uint64_t v29 = v11;
  id v30 = self;
  id v15 = v13;
  char v31 = v15;
  id v16 = v14;
  __int128 v32 = v16;
  id v17 = v11;
  id v18 = v10;
  [v7 addOperation:v27];
  id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_100204270;
  v23[3] = &unk_1006453F0;
  id v24 = v15;
  id v25 = self;
  id v26 = v16;
  id v20 = v16;
  id v21 = v15;
  id v22 = [v7 evaluateWithInput:v19 completion:v23];
}

- (id)_familyMemberAssociatedWithInviteEmail:(id)a3 familyMembers:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v5 && [v6 count])
  {
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    id obj = v7;
    id v8 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v26;
      id v23 = v7;
      while (2)
      {
        for (unint64_t i = 0LL; i != v9; unint64_t i = (char *)i + 1)
        {
          if (*(void *)v26 != v10) {
            objc_enumerationMutation(obj);
          }
          id v12 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)i);
          id v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "appleID", v23));
          id v14 = v5;
          id v15 = v14;
          if (v13 == v14)
          {
            id v17 = v14;
            id v13 = v14;
LABEL_26:

LABEL_27:
LABEL_28:

LABEL_29:
            id v21 = v12;
            id v7 = v23;
            goto LABEL_30;
          }

          if (v13)
          {
            unsigned __int8 v16 = [v13 isEqualToString:v14];

            if ((v16 & 1) != 0) {
              goto LABEL_28;
            }
          }

          else
          {
          }

          id v17 = (void *)objc_claimAutoreleasedReturnValue([v12 appleIDAliases]);
          id v18 = (id)objc_claimAutoreleasedReturnValue([v12 inviteEmail]);
          id v19 = v15;
          id v15 = v19;
          if (v18 == v19)
          {

            goto LABEL_26;
          }

          if (v18)
          {
            unsigned __int8 v20 = [v18 isEqualToString:v19];

            if ((v20 & 1) != 0) {
              goto LABEL_29;
            }
          }

          else
          {
          }
        }

        id v9 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
        id v21 = 0LL;
        id v7 = v23;
        if (v9) {
          continue;
        }
        break;
      }
    }

    else
    {
      id v21 = 0LL;
    }

- (void)attemptAppleBalanceSetupWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  int v5 = PKAppleBalanceBackgroundProvisionDisabled();
  uint64_t v49 = 0LL;
  id v50 = &v49;
  uint64_t v51 = 0x3032000000LL;
  id v52 = sub_1001DB0CC;
  __int128 v53 = sub_1001DB0DC;
  uint64_t v6 = PKDisplayableErrorForCommonType(1LL, 0LL);
  id v54 = (id)objc_claimAutoreleasedReturnValue(v6);
  os_unfair_lock_lock(&self->_backgroundProvisioningLock);
  if (self->_isBackgroundProvisioningAppleBalance || (v5 & 1) != 0)
  {
    os_unfair_lock_unlock(&self->_backgroundProvisioningLock);
    uint64_t Object = PKLogFacilityTypeGetObject(14LL);
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v14)
      {
        *(_WORD *)buf = 0;
        id v15 = "Apple Balance background provision disabled in internal settings";
LABEL_11:
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v15, buf, 2u);
      }
    }

    else if (v14)
    {
      *(_WORD *)buf = 0;
      id v15 = "Apple Balance background provisioning already in progress";
      goto LABEL_11;
    }

    v4[2](v4, v50[5]);
    goto LABEL_13;
  }

  self->_isBackgroundProvisioningAppleBalance = 1;
  os_unfair_lock_unlock(&self->_backgroundProvisioningLock);
  uint64_t v7 = PKLogFacilityTypeGetObject(14LL);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Attempting background provision of Apple Balance",  buf,  2u);
  }

  id v9 = objc_alloc_init(&OBJC_CLASS___PKAsyncUnaryOperationComposer);
  *(void *)buf = 0LL;
  id v44 = buf;
  uint64_t v45 = 0x3032000000LL;
  __int128 v46 = sub_1001DB0CC;
  __int16 v47 = sub_1001DB0DC;
  id v48 = 0LL;
  v41[0] = 0LL;
  v41[1] = v41;
  v41[2] = 0x3032000000LL;
  v41[3] = sub_1001DB0CC;
  void v41[4] = sub_1001DB0DC;
  id v42 = 0LL;
  v39[0] = 0LL;
  v39[1] = v39;
  v39[2] = 0x3032000000LL;
  v39[3] = sub_1001DB0CC;
  void v39[4] = sub_1001DB0DC;
  id v40 = 0LL;
  v37[0] = 0LL;
  v37[1] = v37;
  v37[2] = 0x3032000000LL;
  v37[3] = sub_1001DB0CC;
  void v37[4] = sub_1001DB0DC;
  id v38 = 0LL;
  objc_initWeak(&location, self);
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472LL;
  void v34[2] = sub_100204DA0;
  v34[3] = &unk_10064CC30;
  objc_copyWeak(&v35, &location);
  v34[4] = self;
  v34[5] = buf;
  v34[6] = &v49;
  [v9 addOperation:v34];
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472LL;
  v32[2] = sub_100205064;
  v32[3] = &unk_10064CC80;
  objc_copyWeak(&v33, &location);
  void v32[4] = v41;
  void v32[5] = buf;
  v32[6] = &v49;
  [v9 addOperation:v32];
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  v31[2] = sub_100205260;
  v31[3] = &unk_10064CCD0;
  v31[4] = v41;
  void v31[5] = v39;
  v31[6] = buf;
  v31[7] = &v49;
  [v9 addOperation:v31];
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = sub_10020558C;
  v30[3] = &unk_10064CCF8;
  void v30[4] = v41;
  void v30[5] = v39;
  v30[6] = buf;
  [v9 addOperation:v30];
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472LL;
  v29[2] = sub_10020574C;
  v29[3] = &unk_10064CCD0;
  void v29[4] = v39;
  void v29[5] = v41;
  v29[6] = buf;
  v29[7] = &v49;
  [v9 addOperation:v29];
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_100205A08;
  v27[3] = &unk_10064CD70;
  objc_copyWeak(&v28, &location);
  void v27[4] = buf;
  void v27[5] = &v49;
  [v9 addOperation:v27];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_100205C24;
  v26[3] = &unk_10064CDC0;
  void v26[4] = v39;
  v26[5] = v41;
  v26[6] = v37;
  v26[7] = buf;
  v26[8] = &v49;
  [v9 addOperation:v26];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_100205EF4;
  v24[3] = &unk_10064CE10;
  objc_copyWeak(&v25, &location);
  void v24[4] = buf;
  [v9 addOperation:v24];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_100206088;
  v22[3] = &unk_10064CC80;
  objc_copyWeak(&v23, &location);
  void v22[4] = v37;
  v22[5] = buf;
  v22[6] = &v49;
  [v9 addOperation:v22];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  void v20[2] = sub_100206318;
  v20[3] = &unk_10064CE10;
  objc_copyWeak(&v21, &location);
  void v20[4] = buf;
  [v9 addOperation:v20];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100206464;
  v16[3] = &unk_10064CE80;
  objc_copyWeak(&v19, &location);
  id v17 = v4;
  id v18 = buf;
  id v11 = [v9 evaluateWithInput:v10 completion:v16];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&v23);
  objc_destroyWeak(&v25);
  objc_destroyWeak(&v28);
  objc_destroyWeak(&v33);
  objc_destroyWeak(&v35);
  objc_destroyWeak(&location);
  _Block_object_dispose(v37, 8);

  _Block_object_dispose(v39, 8);
  _Block_object_dispose(v41, 8);

  _Block_object_dispose(buf, 8);
LABEL_13:
  _Block_object_dispose(&v49, 8);
}

- (void)validateAppleBalanceSecurityRequirementsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___PKAsyncUnaryOperationComposer);
  v23[0] = 0LL;
  v23[1] = v23;
  v23[2] = 0x2020000000LL;
  char v24 = 1;
  v21[0] = 0LL;
  v21[1] = v21;
  void v21[2] = 0x3032000000LL;
  v21[3] = sub_1001DB0CC;
  v21[4] = sub_1001DB0DC;
  id v22 = 0LL;
  v19[0] = 0LL;
  v19[1] = v19;
  v19[2] = 0x2020000000LL;
  char v20 = 1;
  objc_initWeak(&location, self);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100206808;
  v17[3] = &unk_10064CEA8;
  void v17[4] = v23;
  [v5 addOperation:v17];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100206894;
  v15[3] = &unk_10064CC80;
  objc_copyWeak(&v16, &location);
  void v15[4] = v19;
  void v15[5] = v23;
  v15[6] = v21;
  [v5 addOperation:v15];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100206B74;
  v13[3] = &unk_10064CC80;
  objc_copyWeak(&v14, &location);
  void v13[4] = v23;
  void v13[5] = v19;
  v13[6] = v21;
  [v5 addOperation:v13];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100206E24;
  v9[3] = &unk_10064CF20;
  id v7 = v4;
  id v10 = v7;
  id v11 = v23;
  id v12 = v21;
  id v8 = [v5 evaluateWithInput:v6 completion:v9];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
  _Block_object_dispose(v19, 8);
  _Block_object_dispose(v21, 8);

  _Block_object_dispose(v23, 8);
}

- (void)triggerCloudStoreZoneCreationForAccount:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void (**)(void, void))v7;
  if (v7)
  {
    if (v6)
    {
      cloudStoreNotificationCoordinator = self->_cloudStoreNotificationCoordinator;
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 cloudStoreZoneNames]);
      LOBYTE(cloudStoreNotificationCoordinator) = -[PDCloudStoreNotificationCoordinator hasCachedCloudStoreZoneInApplePayContainerForZoneNames:]( cloudStoreNotificationCoordinator,  "hasCachedCloudStoreZoneInApplePayContainerForZoneNames:",  v10);

      if ((cloudStoreNotificationCoordinator & 1) != 0)
      {
        v8[2](v8, 1LL);
      }

      else
      {
        objc_initWeak(&location, self);
        v11[0] = _NSConcreteStackBlock;
        v11[1] = 3221225472LL;
        v11[2] = sub_100206FAC;
        v11[3] = &unk_10064CF48;
        id v12 = v6;
        objc_copyWeak(&v15, &location);
        id v13 = self;
        id v14 = v8;
        -[PDAccountManager insertOrReplaceAccount:extended:deleteSensitiveData:completion:]( self,  "insertOrReplaceAccount:extended:deleteSensitiveData:completion:",  v12,  1LL,  0LL,  v11);

        objc_destroyWeak(&v15);
        objc_destroyWeak(&location);
      }
    }

    else
    {
      (*((void (**)(id, void))v7 + 2))(v7, 0LL);
    }
  }
}

- (void)_triggerProvisionPassToWatchWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    id v6 = v3;
    int v5 = PKIsPairedWithWatch();
    id v4 = v6;
    if (v5)
    {
      (*((void (**)(id, void))v6 + 2))(v6, 0LL);
      id v4 = v6;
    }
  }
}

- (BOOL)backgroundProvisionInProgressForFeature:(unint64_t)a3
{
  if (a3 != 4) {
    return 0;
  }
  p_backgroundProvisioningLock = &self->_backgroundProvisioningLock;
  os_unfair_lock_lock(&self->_backgroundProvisioningLock);
  BOOL isBackgroundProvisioningAppleBalance = self->_isBackgroundProvisioningAppleBalance;
  os_unfair_lock_unlock(p_backgroundProvisioningLock);
  return isBackgroundProvisioningAppleBalance;
}

- (void)insertAccountBalanceUpdateNotificationForAccount:(id)a3 updateAmount:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t Object = PKLogFacilityTypeGetObject(14LL);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412546;
    id v14 = v7;
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Inserting balance update notification with amount %@ for account %@",  (uint8_t *)&v13,  0x16u);
  }

  id v10 = objc_alloc(&OBJC_CLASS___PDAccountBalanceUpdateUserNotification);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 associatedPassUniqueID]);
  id v12 = -[PDAccountBalanceUpdateUserNotification initWithAmount:forPassUniqueIdentifier:]( v10,  "initWithAmount:forPassUniqueIdentifier:",  v7,  v11);

  -[PDUserNotificationManager insertUserNotification:](self->_userNotificationManager, "insertUserNotification:", v12);
}

- (id)_amsController
{
  amsController = self->_amsController;
  if (!amsController)
  {
    id v4 = objc_alloc_init(&OBJC_CLASS___PKAMSTopUpController);
    int v5 = self->_amsController;
    self->_amsController = v4;

    amsController = self->_amsController;
  }

  return amsController;
}

- (void)_queue_updateAppleBalancePromotionsIfNeccessaryForAccount:(id)a3 currentPromotion:(id)a4
{
  id v6 = a3;
  if (v6)
  {
    id v7 = a4;
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 fetchPeriods]);
    unsigned int v9 = [v8 endpointIsBlocked:7];
    [v8 fetchPeriodForEndpoint:7];
    double v11 = v10;
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 lastUpdatedDate]);

    unsigned int v13 = +[PKAccountFetchPeriods isLastUpdatedOutOfDate:fetchPeriod:]( &OBJC_CLASS___PKAccountFetchPeriods,  "isLastUpdatedOutOfDate:fetchPeriod:",  v12,  v11);
    if (v9)
    {
      uint64_t Object = PKLogFacilityTypeGetObject(14LL);
      __int16 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Not fetching Apple Balance promotion: endpoint is blocked",  buf,  2u);
      }
    }

    else
    {
      if (!v13)
      {
LABEL_10:

        goto LABEL_11;
      }

      uint64_t v16 = PKLogFacilityTypeGetObject(14LL);
      id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Fetching Apple Balance promotion: promotion is out of date",  buf,  2u);
      }

      id v18 = (void *)objc_claimAutoreleasedReturnValue([v6 accountIdentifier]);
      id v19 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountManager _amsController](self, "_amsController"));
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472LL;
      void v20[2] = sub_1002074C0;
      v20[3] = &unk_10064CF90;
      void v20[4] = self;
      id v21 = v18;
      __int16 v15 = v18;
      [v19 requestDTUConfigurationWithCompletion:v20];
    }

    goto LABEL_10;
  }

- (void)appleBalancePromotionForAccountWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    if (v6)
    {
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472LL;
      v11[2] = sub_100207890;
      v11[3] = &unk_10064B940;
      void v11[4] = self;
      id v12 = v6;
      id v13 = v8;
      -[PDAccountManager accountWithIdentifier:completion:](self, "accountWithIdentifier:completion:", v12, v11);

      unsigned int v9 = v12;
    }

    else
    {
      replyQueue = self->_replyQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100207880;
      block[3] = &unk_10063A830;
      id v15 = v7;
      dispatch_async((dispatch_queue_t)replyQueue, block);
      unsigned int v9 = v15;
    }
  }
}

- (void)insertOrUpdateAppleBalancePromotion:(id)a3 accountIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  double v11 = v10;
  if (v8 && v9)
  {
    workQueue = self->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100207B44;
    block[3] = &unk_10063B440;
    void block[4] = self;
    id v16 = v8;
    id v17 = v9;
    id v18 = v11;
    dispatch_async((dispatch_queue_t)workQueue, block);

    id v13 = v16;
  }

  else
  {
    replyQueue = self->_replyQueue;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_100207B2C;
    void v19[3] = &unk_10063A830;
    id v20 = v10;
    dispatch_async((dispatch_queue_t)replyQueue, v19);
    id v13 = v20;
  }
}

- (void)deleteAppleBalancePromotionForAccountWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6)
  {
    workQueue = self->_workQueue;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100207DB4;
    v12[3] = &unk_100639AF0;
    void v12[4] = self;
    id v13 = v6;
    id v14 = v8;
    dispatch_async((dispatch_queue_t)workQueue, v12);

    id v10 = v13;
  }

  else
  {
    replyQueue = self->_replyQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100207D9C;
    block[3] = &unk_10063A830;
    id v16 = v7;
    dispatch_async((dispatch_queue_t)replyQueue, block);
    id v10 = v16;
  }
}

- (void)inStoreTopUpTokenForAccountWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    if (v6)
    {
      workQueue = self->_workQueue;
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472LL;
      v12[2] = sub_100208024;
      v12[3] = &unk_100639AF0;
      void v12[4] = self;
      id v13 = v6;
      id v14 = v8;
      dispatch_async((dispatch_queue_t)workQueue, v12);

      id v10 = v13;
    }

    else
    {
      replyQueue = self->_replyQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100208014;
      block[3] = &unk_10063A830;
      id v16 = v7;
      dispatch_async((dispatch_queue_t)replyQueue, block);
      id v10 = v16;
    }
  }
}

- (void)insertOrUpdateInStoreTopUpToken:(id)a3 accountIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  double v11 = v10;
  if (v10)
  {
    if (v8 && v9)
    {
      workQueue = self->_workQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100208214;
      block[3] = &unk_10063B440;
      void block[4] = self;
      id v16 = v8;
      id v17 = v9;
      id v18 = v11;
      dispatch_async((dispatch_queue_t)workQueue, block);

      id v13 = v16;
    }

    else
    {
      replyQueue = self->_replyQueue;
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472LL;
      v19[2] = sub_100208204;
      void v19[3] = &unk_10063A830;
      id v20 = v10;
      dispatch_async((dispatch_queue_t)replyQueue, v19);
      id v13 = v20;
    }
  }
}

- (void)deleteInStoreTopUpTokenForAccountWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    if (v6)
    {
      workQueue = self->_workQueue;
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472LL;
      v12[2] = sub_100208478;
      v12[3] = &unk_100639AF0;
      void v12[4] = self;
      id v13 = v6;
      id v14 = v8;
      dispatch_async((dispatch_queue_t)workQueue, v12);

      id v10 = v13;
    }

    else
    {
      replyQueue = self->_replyQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100208468;
      block[3] = &unk_10063A830;
      id v16 = v7;
      dispatch_async((dispatch_queue_t)replyQueue, block);
      id v10 = v16;
    }
  }
}

- (void)invalidateTopUpTokenWithIdentifier:(id)a3 forAccountWithIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    if (v8)
    {
      if (v9)
      {
        objc_initWeak(location, self);
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472LL;
        v15[2] = sub_1002086C4;
        v15[3] = &unk_10064CFB8;
        id v16 = v8;
        objc_copyWeak(&v19, location);
        id v17 = v9;
        id v18 = v10;
        -[PDAccountManager inStoreTopUpTokenForAccountWithIdentifier:completion:]( self,  "inStoreTopUpTokenForAccountWithIdentifier:completion:",  v17,  v15);

        objc_destroyWeak(&v19);
        objc_destroyWeak(location);
        goto LABEL_11;
      }

      uint64_t Object = PKLogFacilityTypeGetObject(14LL);
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(location[0]) = 0;
        id v13 = "Error: tried to invalidate top up token with nil account identifier";
        goto LABEL_9;
      }
    }

    else
    {
      uint64_t v11 = PKLogFacilityTypeGetObject(14LL);
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(location[0]) = 0;
        id v13 = "Error: tried to invalidate top up token with nil token identifier";
LABEL_9:
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)location, 2u);
      }
    }

    (*((void (**)(id, void))v10 + 2))(v10, 0LL);
  }

- (void)resolveAccountStorefrontCountryMismatchForAccount:(id)a3 newCountryCode:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = v10;
  if (v8 && v9)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(14LL);
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v23 = v9;
      __int16 v24 = 2112;
      id v25 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Storefront Country Mismatch: attempting to resolve mismatch for new country code %@ for account %@",  buf,  0x16u);
    }

    id v14 = (void *)objc_claimAutoreleasedReturnValue([v8 accountIdentifier]);
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v8 accountBaseURL]);
    id v16 = objc_alloc_init(&OBJC_CLASS___PKAccountWebServiceResolveStorefrontCountryMismatchRequest);
    [v16 setAccountIdentifier:v14];
    [v16 setBaseURL:v15];
    [v16 setCountryCode:v9];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v23 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Storefront Country Mismatch: deleting local account with identifier %@",  buf,  0xCu);
    }

    objc_initWeak((id *)buf, self);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_100208AF4;
    v18[3] = &unk_10064D030;
    objc_copyWeak(&v21, (id *)buf);
    id v17 = v16;
    id v19 = v17;
    id v20 = v11;
    -[PDAccountManager deleteLocalAccountWithIdentifier:completion:]( self,  "deleteLocalAccountWithIdentifier:completion:",  v14,  v18);

    objc_destroyWeak(&v21);
    objc_destroyWeak((id *)buf);
  }

  else if (v10)
  {
    (*((void (**)(id))v10 + 2))(v10);
  }
}

- (void)dailyCashEligibleDestinationsForAccountWithIdentifier:(id)a3 completion:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100208FC8;
  v8[3] = &unk_10064B940;
  id v9 = a3;
  id v10 = self;
  id v11 = a4;
  id v6 = v11;
  id v7 = v9;
  -[PDAccountManager accountWithIdentifier:completion:](self, "accountWithIdentifier:completion:", v7, v8);
}

- (void)updateWalletBadgeCount
{
}

- (void)paymentWebServiceCoordinatorWebServiceDidChange:(id)a3
{
}

- (PDAccountNotificationController)accountNotificationController
{
  return self->_accountNotificationController;
}

- (void)setAccountNotificationController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end