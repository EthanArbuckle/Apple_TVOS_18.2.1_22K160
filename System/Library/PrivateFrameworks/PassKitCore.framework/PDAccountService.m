@interface PDAccountService
- (PDAccountManager)accountManager;
- (PDAccountService)initWithConnection:(id)a3;
- (PDAccountService)initWithConnection:(id)a3 server:(id)a4;
- (PDAccountStatementMetadataProcessor)statementMetadataProcessor;
- (void)accountBalancesForAccountIdentifier:(id)a3 startDate:(id)a4 endDate:(id)a5 type:(unint64_t)a6 completion:(id)a7;
- (void)accountEnhancedMerchantBehaviorForAccountWithIdentifier:(id)a3 completion:(id)a4;
- (void)accountEnhancedMerchantsForAccountWithIdentifier:(id)a3 completion:(id)a4;
- (void)accountEntityOrderingsForAccountWithIdentifier:(id)a3 entityType:(unint64_t)a4 completion:(id)a5;
- (void)accountForPassWithUniqueID:(id)a3 completion:(id)a4;
- (void)accountHoldsForAccountIdentifier:(id)a3 completion:(id)a4;
- (void)accountManager:(id)a3 accountUsersChanged:(id)a4 oldUsers:(id)a5 accountIdentifier:(id)a6;
- (void)accountManager:(id)a3 creditRecoveryPaymentPlansChangedForAccountIdentifier:(id)a4;
- (void)accountManager:(id)a3 didAddAccount:(id)a4;
- (void)accountManager:(id)a3 didAddFinancingPlan:(id)a4 accountIdentifier:(id)a5;
- (void)accountManager:(id)a3 didRemoveAccount:(id)a4;
- (void)accountManager:(id)a3 didRemoveAppleBalancePromotionWithUniqueIdentifier:(id)a4 forAccountIdentifier:(id)a5;
- (void)accountManager:(id)a3 didRemoveFinancingPlan:(id)a4 accountIdentifier:(id)a5;
- (void)accountManager:(id)a3 didUpdateAccount:(id)a4 oldAccount:(id)a5;
- (void)accountManager:(id)a3 didUpdateAppleBalancePromotion:(id)a4 forAccountIdentifier:(id)a5;
- (void)accountManager:(id)a3 didUpdateEnhancedMerchants:(id)a4 accountIdentifier:(id)a5 lastUpdate:(id)a6;
- (void)accountManager:(id)a3 didUpdateFinancingPlan:(id)a4 oldFinancingPlan:(id)a5 accountIdentifier:(id)a6;
- (void)accountManager:(id)a3 didUpdateInStoreTopUpToken:(id)a4 forAccountIdentifier:(id)a5;
- (void)accountManager:(id)a3 didUpdatePayLaterCardMagnitudes:(id)a4 forAccountIdentifier:(id)a5;
- (void)accountManager:(id)a3 didUpdatePaymentFundingSources:(id)a4 accountIdentifier:(id)a5;
- (void)accountManager:(id)a3 didUpdatePromotions:(id)a4 oldPromotions:(id)a5 accountIdentifier:(id)a6;
- (void)accountManager:(id)a3 physicalCardsChanged:(id)a4 accountIdentifier:(id)a5;
- (void)accountManager:(id)a3 scheduledPaymentsChangedForAccountIdentifier:(id)a4;
- (void)accountManager:(id)a3 statementsChangedForAccountIdentifier:(id)a4;
- (void)accountPendingFamilyMembersForAccountIdentifier:(id)a3 completion:(id)a4;
- (void)accountPromotionBehaviorForAccountWithIdentifier:(id)a3 completion:(id)a4;
- (void)accountPromotionsForAccountWithIdentifier:(id)a3 completion:(id)a4;
- (void)accountStatementMetadataForAllAccountsWithCompletion:(id)a3;
- (void)accountStatementMetadataForStatementIdentifier:(id)a3 accountIdentifier:(id)a4 completion:(id)a5;
- (void)accountUsersForAccountWithIdentifier:(id)a3 completion:(id)a4;
- (void)accountWithIdentifier:(id)a3 completion:(id)a4;
- (void)accountWithVirtualCardIdentifier:(id)a3 completion:(id)a4;
- (void)accountsForProvisioningWithCompletion:(id)a3;
- (void)accountsWithCompletion:(id)a3;
- (void)accountsWithPassLocallyProvisionedWithCompletion:(id)a3;
- (void)activatePhysicalCardWithActivationCode:(id)a3 completion:(id)a4;
- (void)activatePhysicalCardWithIdentifier:(id)a3 activationCode:(id)a4 completion:(id)a5;
- (void)appleBalancePromotionForAccountWithIdentifier:(id)a3 completion:(id)a4;
- (void)attemptAppleBalanceSetupWithCompletion:(id)a3;
- (void)backgroundProvisionInProgressForFeature:(unint64_t)a3 withCompletion:(id)a4;
- (void)beginPhysicalCardAction:(id)a3 onPhysicalCardWithIdentifier:(id)a4 forAccountWithIdentifier:(id)a5 accountUserAltDSID:(id)a6 deviceMetadata:(id)a7 completion:(id)a8;
- (void)beginPhysicalCardRequestWithOrder:(id)a3 forAccountWithIdentifier:(id)a4 accountUserAltDSID:(id)a5 deviceMetadata:(id)a6 completion:(id)a7;
- (void)billPaymentSelectedSuggestedAmountDataEventsForAccountIdentifier:(id)a3 withStartDate:(id)a4 endDate:(id)a5 completion:(id)a6;
- (void)billPaymentSelectedSuggestedAmountDataEventsForAccountIdentifier:(id)a3 withStatementIdentifier:(id)a4 completion:(id)a5;
- (void)cancelFinancingPlanWithIdentifier:(id)a3 accountIdentifier:(id)a4 cancellationReasonIdentifier:(id)a5 cancellationReasonDescription:(id)a6 completion:(id)a7;
- (void)cardCredentialsForVirtualCard:(id)a3 authorization:(id)a4 action:(int64_t)a5 completion:(id)a6;
- (void)completePhysicalCardActionRequest:(id)a3 withSignature:(id)a4 completion:(id)a5;
- (void)completePhysicalCardRequest:(id)a3 withSignature:(id)a4 completion:(id)a5;
- (void)createVirtualCard:(int64_t)a3 forAccountIdentifier:(id)a4 completion:(id)a5;
- (void)creditRecoveryPaymentPlanInformationForAccountIdentifier:(id)a3 allowFetchFromServer:(BOOL)a4 completion:(id)a5;
- (void)creditRecoveryPaymentPlansForAccountIdentifier:(id)a3 allowFetchFromServer:(BOOL)a4 completion:(id)a5;
- (void)creditStatementsForAccountIdentifier:(id)a3 completion:(id)a4;
- (void)creditStatementsForStatementIdentifiers:(id)a3 accountIdentifier:(id)a4 completion:(id)a5;
- (void)dailyCashEligibleDestinationsForAccountWithIdentifier:(id)a3 completion:(id)a4;
- (void)defaultAccountForFeature:(unint64_t)a3 completion:(id)a4;
- (void)deleteAccountEnhancedMerchant:(id)a3 forAccountWithIdentifier:(id)a4 completion:(id)a5;
- (void)deleteAccountPromotion:(id)a3 forAccountWithIdentifier:(id)a4 completion:(id)a5;
- (void)deleteAccountStatementMetadataForStatementIdentifier:(id)a3 accountIdentifier:(id)a4 completion:(id)a5;
- (void)deleteAccountUserWithAltDSID:(id)a3 forAccountWithIdentifier:(id)a4 completion:(id)a5;
- (void)deleteAccountWithIdentifier:(id)a3 completion:(id)a4;
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
- (void)didAddAccountPendingFamilyMembers:(id)a3;
- (void)eventsForAccountIdentifier:(id)a3 completion:(id)a4;
- (void)eventsForAccountIdentifier:(id)a3 types:(id)a4 startDate:(id)a5 endDate:(id)a6 orderedByDate:(int64_t)a7 limit:(unint64_t)a8 completion:(id)a9;
- (void)exportTransactionDataForAccountIdentifier:(id)a3 withFileFormat:(id)a4 beginDate:(id)a5 endDate:(id)a6 productTimeZone:(id)a7 completion:(id)a8;
- (void)fetchKeychainCredentialForVirtualCardIdentifier:(id)a3 forAccountIdentifier:(id)a4 completion:(id)a5;
- (void)financingPlanForPlanIdentifier:(id)a3 completion:(id)a4;
- (void)financingPlanInstallmentsDueDateRangeForAccountIdentifier:(id)a3 financingPlanStates:(id)a4 completion:(id)a5;
- (void)financingPlansForAllAccountsWithCompletion:(id)a3;
- (void)financingPlansWithQueries:(id)a3 completion:(id)a4;
- (void)inStoreTopUpTokenForAccountWithIdentifier:(id)a3 completion:(id)a4;
- (void)inactivatePhysicalCardForFeatureIdentifier:(unint64_t)a3 completion:(id)a4;
- (void)insertDailyCashNotificationForAccountIdentifier:(id)a3 completion:(id)a4;
- (void)insertEvents:(id)a3 withAccountidentifier:(id)a4 completion:(id)a5;
- (void)insertOrUpdateAccountEnhancedMerchants:(id)a3 accountIdentifier:(id)a4 completion:(id)a5;
- (void)insertOrUpdateAccountPromotions:(id)a3 accountIdentifier:(id)a4 completion:(id)a5;
- (void)insertOrUpdateInStoreTopUpToken:(id)a3 accountIdentifier:(id)a4 completion:(id)a5;
- (void)insertOrUpdateLocalAccount:(id)a3 completion:(id)a4;
- (void)insertOrUpdateLocalFinancingPlans:(id)a3 accountIdentifier:(id)a4 completion:(id)a5;
- (void)insertSummaryNotificationForAccountIdentifier:(id)a3 summaryType:(int64_t)a4 completion:(id)a5;
- (void)invalidateTopUpTokenWithIdentifier:(id)a3 forAccountWithIdentifier:(id)a4 completion:(id)a5;
- (void)lastRedemptionEventToDestination:(unint64_t)a3 forAccountIdentifier:(id)a4 altDSID:(id)a5 completion:(id)a6;
- (void)lastUsedInAppFundingSourceForAccountIdentifier:(id)a3 completion:(id)a4;
- (void)markUserViewedIntroduction:(BOOL)a3 forInstallmentIdentifiers:(id)a4 accountIdentifier:(id)a5 completion:(id)a6;
- (void)noteSecurityCodeActivityWithAction:(int64_t)a3 forSecurityCodeIdentifier:(id)a4 forVirtualCardIdentifier:(id)a5 forAccountIdentifier:(id)a6 completion:(id)a7;
- (void)noteVirtualCardAutoFilledBySafari:(id)a3 completion:(id)a4;
- (void)payLaterCardMagnitudesForAccountIdentifier:(id)a3 completion:(id)a4;
- (void)paymentFundingSourceForIdentifier:(id)a3 accountIdentifier:(id)a4 completion:(id)a5;
- (void)paymentFundingSourcesForAccountIdentifier:(id)a3 completion:(id)a4;
- (void)performAccountAction:(id)a3 withAccountIdentifier:(id)a4 accountUserAltDSID:(id)a5 completion:(id)a6;
- (void)performVirtualCardAction:(int64_t)a3 forVirtualCardIdentifier:(id)a4 forAccountIdentifier:(id)a5 completion:(id)a6;
- (void)physicalCardForFeatureIdentifier:(unint64_t)a3 activationCode:(id)a4 completion:(id)a5;
- (void)physicalCardsForAccountWithIdentifier:(id)a3 completion:(id)a4;
- (void)processPhysicalCardExpirationMessaging:(id)a3 physicalCards:(id)a4 account:(id)a5;
- (void)reprocessPayLaterFinancingPlansForMerchantCleanup:(id)a3;
- (void)resetAccountBalancesForAccountIdentifier:(id)a3 completion:(id)a4;
- (void)rewardsTierSummaryForTransactionSourceIdentifiers:(id)a3 currencyCode:(id)a4 startDate:(id)a5 endDate:(id)a6 completion:(id)a7;
- (void)savingsStatementsForAccountIdentifier:(id)a3 completion:(id)a4;
- (void)scheduleSetupReminderForAccountWithIdentifier:(id)a3 completion:(id)a4;
- (void)scheduledPaymentsWithAccountIdentifier:(id)a3 includeFailedRecurringPayments:(BOOL)a4 allowFetchFromServer:(BOOL)a5 completion:(id)a6;
- (void)setAccountManager:(id)a3;
- (void)setStatementMetadataProcessor:(id)a3;
- (void)sharedAccountCloudStoreWithAccountIdentifier:(id)a3 completion:(id)a4;
- (void)taxFormsForAccountIdentifier:(id)a3 completion:(id)a4;
- (void)termsWithIdentifier:(id)a3 accepted:(BOOL)a4 withAccountIdentifier:(id)a5 completion:(id)a6;
- (void)triggerCloudStoreZoneCreationForAccount:(id)a3 withCompletion:(id)a4;
- (void)triggerStatementMetadataProcessingForAccountIdentifier:(id)a3 statementIdentifier:(id)a4 completion:(id)a5;
- (void)updateAccountBalancesForAccountIdentifier:(id)a3 startDate:(id)a4 endDate:(id)a5 type:(unint64_t)a6 completion:(id)a7;
- (void)updateAccountEnhancedMerchantsForAccountWithIdentifier:(id)a3 completion:(id)a4;
- (void)updateAccountEnhancedMerchantsForAccountWithIdentifier:(id)a3 cooldownLevel:(unint64_t)a4 completion:(id)a5;
- (void)updateAccountEnhancedMerchantsForAccountWithIdentifier:(id)a3 ignoreErrorBackoff:(BOOL)a4 cooldownLevel:(unint64_t)a5 completion:(id)a6;
- (void)updateAccountPromotionsForAccountWithIdentifier:(id)a3 completion:(id)a4;
- (void)updateAccountPromotionsForAccountWithIdentifier:(id)a3 ignoreErrorBackoff:(BOOL)a4 observeCooldownPeriod:(BOOL)a5 completion:(id)a6;
- (void)updateAccountPromotionsForAccountWithIdentifier:(id)a3 observeCooldownPeriod:(BOOL)a4 completion:(id)a5;
- (void)updateAccountStatementMetadataForStatementIdentifier:(id)a3 accountIdentifier:(id)a4 completion:(id)a5;
- (void)updateAccountUserNotificationSettings:(id)a3 forAccountUserWithAltDSID:(id)a4 forAccountWithIdentifier:(id)a5 completion:(id)a6;
- (void)updateAccountUserPreferences:(id)a3 forAccountUserWithAltDSID:(id)a4 forAccountWithIdentifier:(id)a5 completion:(id)a6;
- (void)updateAccountUsersForAccountWithIdentifier:(id)a3 completion:(id)a4;
- (void)updateAccountWithIdentifier:(id)a3 extended:(BOOL)a4 completion:(id)a5;
- (void)updateAccountsWithCompletion:(id)a3;
- (void)updateCreditRecoveryPaymentPlansForAccountIdentifier:(id)a3 completion:(id)a4;
- (void)updateCreditStatementsForAccountIdentifier:(id)a3 completion:(id)a4;
- (void)updateFinancingPlansForAccountWithIdentifier:(id)a3 pageOffset:(unint64_t)a4 limit:(unint64_t)a5 ignoreLastUpdatedDate:(BOOL)a6 forceFetch:(BOOL)a7 completion:(id)a8;
- (void)updateImpressionCount:(int64_t)a3 promotionProgramIdentifier:(id)a4 accountIdentifier:(id)a5 completion:(id)a6;
- (void)updateImpressionCountsForPromotions:(id)a3 accountIdentifier:(id)a4 completion:(id)a5;
- (void)updateLastUsedInAppFundingSource:(id)a3 accountIdentifier:(id)a4;
- (void)updateMockAccountWithAccount:(id)a3 completion:(id)a4;
- (void)updatePaymentFundingSourcesForAccountIdentifier:(id)a3 force:(BOOL)a4 completion:(id)a5;
- (void)updatePhysicalCardsForAccountWithIdentifier:(id)a3 force:(BOOL)a4 completion:(id)a5;
- (void)updateSavingsStatementsForAccountIdentifier:(id)a3 completion:(id)a4;
- (void)updateScheduledPaymentsWithAccount:(id)a3 completion:(id)a4;
- (void)updateSharedAccountCloudStoreWithAccountIdentifier:(id)a3 completion:(id)a4;
- (void)updateTaxFormsForAccountIdentifier:(id)a3 completion:(id)a4;
- (void)updateUserInfoForAccountIdentifier:(id)a3 contact:(id)a4 completion:(id)a5;
- (void)updateVirtualCardsWithAccountIdentifier:(id)a3 completion:(id)a4;
- (void)updateWalletBadgeCountWithCompletion:(id)a3;
- (void)userInfoForAccountIdentifier:(id)a3 forceFetch:(BOOL)a4 completion:(id)a5;
- (void)validateAppleBalanceSecurityRequirementsWithCompletion:(id)a3;
- (void)virtualCardsInKeychainWithCompletion:(id)a3;
- (void)writeVirtualCardToKeychain:(id)a3 completion:(id)a4;
@end

@implementation PDAccountService

- (PDAccountService)initWithConnection:(id)a3
{
  return 0LL;
}

- (PDAccountService)initWithConnection:(id)a3 server:(id)a4
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___PDAccountService;
  v6 = -[PDAccountService initWithConnection:](&v14, "initWithConnection:", v5);
  if (v6)
  {
    v7 = -[PKEntitlementWhitelist initWithConnection:]( objc_alloc(&OBJC_CLASS___PKEntitlementWhitelist),  "initWithConnection:",  v5);
    whitelist = v6->_whitelist;
    v6->_whitelist = v7;

    v6->_entitledForAccountUse = -[PKEntitlementWhitelist paymentAllAccess]( v6->_whitelist,  "paymentAllAccess");
    uint64_t v9 = PKAccountServiceInterface();
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    [v5 setRemoteObjectInterface:v10];

    uint64_t v11 = PDAccountServiceInterface();
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    [v5 setExportedInterface:v12];

    [v5 setExportedObject:v6];
  }

  return v6;
}

- (void)setAccountManager:(id)a3
{
  id v5 = (PDAccountManager *)a3;
  accountManager = self->_accountManager;
  if (accountManager != v5)
  {
    v7 = v5;
    if (accountManager) {
      -[PDAccountManager unregisterObserver:](accountManager, "unregisterObserver:", self);
    }
    objc_storeStrong((id *)&self->_accountManager, a3);
    -[PDAccountManager registerObserver:](self->_accountManager, "registerObserver:", self);
    id v5 = v7;
  }
}

- (void)accountsWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if (self->_entitledForAccountUse)
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472LL;
      v7[2] = sub_1001C2E34;
      v7[3] = &unk_1006415E8;
      id v8 = v4;
      [v5 accountsWithCompletion:v7];
    }

    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKAccountErrorDomain,  1LL,  0LL));
      (*((void (**)(id, void, void *))v4 + 2))(v4, 0LL, v6);
    }
  }
}

- (void)accountsForProvisioningWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if (self->_entitledForAccountUse)
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472LL;
      v7[2] = sub_1001C2F2C;
      v7[3] = &unk_1006390A0;
      id v8 = v4;
      [v5 accountsForProvisioningWithCompletion:v7];
    }

    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKAccountErrorDomain,  1LL,  0LL));
      (*((void (**)(id, void, void, void *))v4 + 2))(v4, 0LL, 0LL, v6);
    }
  }
}

- (void)accountsWithPassLocallyProvisionedWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if (self->_entitledForAccountUse)
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472LL;
      v7[2] = sub_1001C3020;
      v7[3] = &unk_1006415E8;
      id v8 = v4;
      [v5 accountsWithPassLocallyProvisionedWithCompletion:v7];
    }

    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKAccountErrorDomain,  1LL,  0LL));
      (*((void (**)(id, void, void *))v4 + 2))(v4, 0LL, v6);
    }
  }
}

- (void)accountWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if (self->_entitledForAccountUse)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472LL;
      v10[2] = sub_1001C3130;
      v10[3] = &unk_10064AE80;
      id v11 = v7;
      [v8 accountWithIdentifier:v6 completion:v10];
    }

    else
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKAccountErrorDomain,  1LL,  0LL));
      (*((void (**)(id, void, void *))v7 + 2))(v7, 0LL, v9);
    }
  }
}

- (void)accountWithVirtualCardIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if (self->_entitledForAccountUse)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472LL;
      v10[2] = sub_1001C3240;
      v10[3] = &unk_10064AE80;
      id v11 = v7;
      [v8 accountWithVirtualCardIdentifier:v6 completion:v10];
    }

    else
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKAccountErrorDomain,  1LL,  0LL));
      (*((void (**)(id, void, void *))v7 + 2))(v7, 0LL, v9);
    }
  }
}

- (void)accountForPassWithUniqueID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7 && self->_entitledForAccountUse)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_1001C330C;
    v9[3] = &unk_10064AE80;
    id v10 = v7;
    [v8 accountForPassWithUniqueID:v6 completion:v9];
  }
}

- (void)updateMockAccountWithAccount:(id)a3 completion:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (v6 && self->_entitledForAccountUse)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
    [v7 updateMockAccountWithAccount:v8 completion:v6];
  }
}

- (void)deleteAccountWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if (self->_entitledForAccountUse)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472LL;
      v10[2] = sub_1001C3488;
      v10[3] = &unk_1006424D0;
      id v11 = v7;
      [v8 deleteAccountWithIdentifier:v6 completion:v10];
    }

    else
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKAccountErrorDomain,  1LL,  0LL));
      (*((void (**)(id, void *))v7 + 2))(v7, v9);
    }
  }
}

- (void)deleteLocalAccountWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if (self->_entitledForAccountUse)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472LL;
      v10[2] = sub_1001C3590;
      v10[3] = &unk_10063A830;
      id v11 = v7;
      [v8 deleteLocalAccountWithIdentifier:v6 completion:v10];
    }

    else
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKAccountErrorDomain,  1LL,  0LL));
      (*((void (**)(id, void *))v7 + 2))(v7, v9);
    }
  }
}

- (void)insertOrUpdateLocalAccount:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7 && self->_entitledForAccountUse)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_1001C365C;
    v9[3] = &unk_10064AE80;
    id v10 = v7;
    [v8 insertOrUpdateLocalAccount:v6 completion:v9];
  }
}

- (void)insertOrUpdateLocalFinancingPlans:(id)a3 accountIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10 && self->_entitledForAccountUse)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1001C3738;
    v12[3] = &unk_1006415E8;
    id v13 = v10;
    [v11 insertOrUpdateLocalFinancingPlans:v8 accountIdentifier:v9 completion:v12];
  }
}

- (void)defaultAccountForFeature:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    if (self->_entitledForAccountUse)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472LL;
      v9[2] = sub_1001C3838;
      v9[3] = &unk_10064AE80;
      id v10 = v6;
      [v7 defaultAccountForFeature:a3 completion:v9];
    }

    else
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKAccountErrorDomain,  1LL,  0LL));
      (*((void (**)(id, void, void *))v6 + 2))(v6, 0LL, v8);
    }
  }
}

- (void)termsWithIdentifier:(id)a3 accepted:(BOOL)a4 withAccountIdentifier:(id)a5 completion:(id)a6
{
  BOOL v8 = a4;
  id v13 = a3;
  id v10 = a5;
  id v11 = (void (**)(id, void *))a6;
  if (v11)
  {
    if (self->_entitledForAccountUse)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
      [v12 termsWithIdentifier:v13 accepted:v8 withAccountIdentifier:v10 completion:v11];
    }

    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKAccountErrorDomain,  1LL,  0LL));
      v11[2](v11, v12);
    }
  }
}

- (void)performAccountAction:(id)a3 withAccountIdentifier:(id)a4 accountUserAltDSID:(id)a5 completion:(id)a6
{
  id v14 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = (void (**)(id, void, void *))a6;
  if (v12)
  {
    if (self->_entitledForAccountUse)
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
      [v13 performAccountAction:v14 withAccountIdentifier:v10 accountUserAltDSID:v11 completion:v12];
    }

    else
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKAccountErrorDomain,  1LL,  0LL));
      v12[2](v12, 0LL, v13);
    }
  }
}

- (void)updateAccountWithIdentifier:(id)a3 extended:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v10 = a3;
  BOOL v8 = (void (**)(id, void, void *))a5;
  if (v8)
  {
    if (self->_entitledForAccountUse)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
      [v9 updateAccountWithIdentifier:v10 extended:v6 completion:v8];
    }

    else
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKAccountErrorDomain,  1LL,  0LL));
      v8[2](v8, 0LL, v9);
    }
  }
}

- (void)updateAccountsWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void, void *))a3;
  if (v4)
  {
    BOOL v6 = v4;
    if (self->_entitledForAccountUse)
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
      [v5 updateAccountsWithCompletion:v6];
    }

    else
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKAccountErrorDomain,  1LL,  0LL));
      v6[2](v6, 0LL, v5);
    }

    id v4 = v6;
  }
}

- (void)updateAccountUsersForAccountWithIdentifier:(id)a3 completion:(id)a4
{
  id v10 = a3;
  if (self->_entitledForAccountUse)
  {
    id v6 = a4;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
    [v7 updateAccountUsersForAccountWithIdentifier:v10 completion:v6];
  }

  else
  {
    uint64_t v8 = PKAccountErrorDomain;
    id v9 = a4;
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v8,  1LL,  0LL));
    (*((void (**)(id, void, void *))a4 + 2))(v9, 0LL, v7);
  }
}

- (void)accountUsersForAccountWithIdentifier:(id)a3 completion:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    if (self->_entitledForAccountUse)
    {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
      [v8 accountUsersForAccountWithIdentifier:v9 completion:v7];
    }

    else
    {
      (*((void (**)(id, void))v6 + 2))(v6, 0LL);
    }
  }
}

- (void)deleteAccountUserWithAltDSID:(id)a3 forAccountWithIdentifier:(id)a4 completion:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, void *))a5;
  if (v9)
  {
    if (self->_entitledForAccountUse)
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
      [v10 deleteAccountUserWithAltDSID:v11 forAccountWithIdentifier:v8 completion:v9];
    }

    else
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKAccountErrorDomain,  1LL,  0LL));
      v9[2](v9, v10);
    }
  }
}

- (void)updateAccountUserPreferences:(id)a3 forAccountUserWithAltDSID:(id)a4 forAccountWithIdentifier:(id)a5 completion:(id)a6
{
  id v14 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = (void (**)(id, void, void *))a6;
  if (v12)
  {
    if (self->_entitledForAccountUse)
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
      [v13 updateAccountUserPreferences:v14 forAccountUserWithAltDSID:v10 forAccountWithIdentifier:v11 completion:v12];
    }

    else
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKAccountErrorDomain,  1LL,  0LL));
      v12[2](v12, 0LL, v13);
    }
  }
}

- (void)updateAccountUserNotificationSettings:(id)a3 forAccountUserWithAltDSID:(id)a4 forAccountWithIdentifier:(id)a5 completion:(id)a6
{
  id v16 = a3;
  id v10 = a4;
  id v11 = a5;
  if (self->_entitledForAccountUse)
  {
    id v12 = a6;
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
    [v13 updateAccountUserNotificationSettings:v16 forAccountUserWithAltDSID:v10 forAccountWithIdentifier:v11 completion:v12];
  }

  else
  {
    uint64_t v14 = PKAccountErrorDomain;
    id v15 = a6;
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v14,  1LL,  0LL));
    (*((void (**)(id, void, void *))a6 + 2))(v15, 0LL, v13);
  }
}

- (void)userInfoForAccountIdentifier:(id)a3 forceFetch:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v10 = a3;
  id v8 = (void (**)(id, void, void *))a5;
  if (v8)
  {
    if (self->_entitledForAccountUse)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
      [v9 userInfoForAccountIdentifier:v10 forceFetch:v6 completion:v8];
    }

    else
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKAccountErrorDomain,  1LL,  0LL));
      v8[2](v8, 0LL, v9);
    }
  }
}

- (void)updateUserInfoForAccountIdentifier:(id)a3 contact:(id)a4 completion:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, void, void *))a5;
  if (v9)
  {
    if (self->_entitledForAccountUse)
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
      [v10 updateUserInfoForAccountIdentifier:v11 contact:v8 completion:v9];
    }

    else
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKAccountErrorDomain,  1LL,  0LL));
      v9[2](v9, 0LL, v10);
    }
  }
}

- (void)deleteBeneficiaryWithIdentifier:(id)a3 accountIdentifier:(id)a4 completion:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, void *))a5;
  if (v9)
  {
    if (self->_entitledForAccountUse)
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
      [v10 deleteBeneficiaryWithIdentifier:v11 accountIdentifier:v8 completion:v9];
    }

    else
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKAccountErrorDomain,  1LL,  0LL));
      v9[2](v9, v10);
    }
  }
}

- (void)paymentFundingSourcesForAccountIdentifier:(id)a3 completion:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (v6 && self->_entitledForAccountUse)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
    [v7 paymentFundingSourcesForAccountIdentifier:v8 completion:v6];
  }
}

- (void)paymentFundingSourceForIdentifier:(id)a3 accountIdentifier:(id)a4 completion:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  if (v9)
  {
    if (self->_entitledForAccountUse)
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
      [v11 paymentFundingSourceForIdentifier:v12 accountIdentifier:v8 completion:v10];
    }

    else
    {
      (*((void (**)(id, void))v9 + 2))(v9, 0LL);
    }
  }
}

- (void)updatePaymentFundingSourcesForAccountIdentifier:(id)a3 force:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v10 = a3;
  id v8 = (void (**)(id, void, void *))a5;
  if (v8)
  {
    if (self->_entitledForAccountUse)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
      [v9 updatePaymentFundingSourcesForAccountIdentifier:v10 force:v6 completion:v8];
    }

    else
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKAccountErrorDomain,  1LL,  0LL));
      v8[2](v8, 0LL, v9);
    }
  }
}

- (void)lastUsedInAppFundingSourceForAccountIdentifier:(id)a3 completion:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    if (self->_entitledForAccountUse)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
      [v8 lastUsedInAppFundingSourceForAccountIdentifier:v9 completion:v7];
    }

    else
    {
      (*((void (**)(id, void))v6 + 2))(v6, 0LL);
    }
  }
}

- (void)updateLastUsedInAppFundingSource:(id)a3 accountIdentifier:(id)a4
{
  if (self->_entitledForAccountUse)
  {
    id v6 = a4;
    id v7 = a3;
    id v8 = (id)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
    [v8 updateLastUsedInAppFundingSource:v7 accountIdentifier:v6];
  }

- (void)eventsForAccountIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if (self->_entitledForAccountUse)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472LL;
      v10[2] = sub_1001C45AC;
      v10[3] = &unk_10063C428;
      id v11 = v7;
      [v8 eventsForAccountIdentifier:v6 completion:v10];
    }

    else
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKAccountErrorDomain,  1LL,  0LL));
      (*((void (**)(id, void, void *))v7 + 2))(v7, 0LL, v9);
    }
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
    if (self->_entitledForAccountUse)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472LL;
      v22[2] = sub_1001C471C;
      v22[3] = &unk_1006415E8;
      id v23 = v19;
      [v20 eventsForAccountIdentifier:v15 types:v16 startDate:v17 endDate:v18 orderedByDate:a7 limit:a8 completion:v22];
    }

    else
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKAccountErrorDomain,  1LL,  0LL));
      (*((void (**)(id, void, void *))v19 + 2))(v19, 0LL, v21);
    }
  }
}

- (void)deleteEventsWithAccountIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void (**)(void, void))v7;
  if (self->_entitledForAccountUse)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1001C4828;
    v11[3] = &unk_10063A830;
    id v12 = v8;
    [v9 deleteEventsWithAccountIdentifier:v6 completion:v11];
  }

  else if (v7)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKAccountErrorDomain,  1LL,  0LL));
    ((void (**)(void, void *))v8)[2](v8, v10);
  }
}

- (void)deleteEventWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void (**)(void, void))v7;
  if (self->_entitledForAccountUse)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1001C493C;
    v11[3] = &unk_10063A830;
    id v12 = v8;
    [v9 deleteEventWithIdentifier:v6 completion:v11];
  }

  else if (v7)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKAccountErrorDomain,  1LL,  0LL));
    ((void (**)(void, void *))v8)[2](v8, v10);
  }
}

- (void)insertEvents:(id)a3 withAccountidentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void (**)(void, void))v10;
  if (self->_entitledForAccountUse)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_1001C4A60;
    v14[3] = &unk_10063A830;
    id v15 = v11;
    [v12 insertEvents:v8 completion:v14];
  }

  else if (v10)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKAccountErrorDomain,  1LL,  0LL));
    ((void (**)(void, void *))v11)[2](v11, v13);
  }
}

- (void)deleteEventsWithAccountIdentifier:(id)a3 excludingTypes:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void (**)(void, void))v10;
  if (self->_entitledForAccountUse)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_1001C4B88;
    v14[3] = &unk_10063A830;
    id v15 = v11;
    [v12 deleteEventsWithAccountIdentifier:v8 excludingTypes:v9 completion:v14];
  }

  else if (v10)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKAccountErrorDomain,  1LL,  0LL));
    ((void (**)(void, void *))v11)[2](v11, v13);
  }
}

- (void)updateCreditStatementsForAccountIdentifier:(id)a3 completion:(id)a4
{
  id v10 = a3;
  if (self->_entitledForAccountUse)
  {
    id v6 = a4;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
    [v7 updateCreditStatementsForAccountIdentifier:v10 completion:v6];
  }

  else
  {
    uint64_t v8 = PKAccountErrorDomain;
    id v9 = a4;
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v8,  1LL,  0LL));
    (*((void (**)(id, void, void *))a4 + 2))(v9, 0LL, v7);
  }
}

- (void)creditStatementsForAccountIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_entitledForAccountUse)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_1001C4D64;
    v10[3] = &unk_10064AEA8;
    id v11 = v7;
    [v8 creditStatementsForAccountIdentifier:v6 completion:v10];
  }

  else
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKAccountErrorDomain,  1LL,  0LL));
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0LL, v9);
  }
}

- (void)creditStatementsForStatementIdentifiers:(id)a3 accountIdentifier:(id)a4 completion:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  if (self->_entitledForAccountUse)
  {
    id v9 = a5;
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
    [v10 creditStatementsForStatementIdentifiers:v13 accountIdentifier:v8 completion:v9];
  }

  else
  {
    uint64_t v11 = PKAccountErrorDomain;
    id v12 = a5;
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v11,  1LL,  0LL));
    (*((void (**)(id, void, void *))a5 + 2))(v12, 0LL, v10);
  }
}

- (void)accountStatementMetadataForAllAccountsWithCompletion:(id)a3
{
  if (self->_entitledForAccountUse)
  {
    id v5 = a3;
    id v8 = (id)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
    [v8 accountStatementMetadataForAllAccountsWithCompletion:v5];
  }

  else
  {
    uint64_t v6 = PKAccountErrorDomain;
    id v7 = a3;
    id v8 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v6,  1LL,  0LL));
    (*((void (**)(id, void))a3 + 2))(v7, 0LL);
  }
}

- (void)accountStatementMetadataForStatementIdentifier:(id)a3 accountIdentifier:(id)a4 completion:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  if (self->_entitledForAccountUse)
  {
    id v9 = a5;
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
    [v10 accountStatementMetadataForStatementIdentifier:v13 accountIdentifier:v8 completion:v9];
  }

  else
  {
    uint64_t v11 = PKAccountErrorDomain;
    id v12 = a5;
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v11,  1LL,  0LL));
    (*((void (**)(id, void, void *))a5 + 2))(v12, 0LL, v10);
  }
}

- (void)updateAccountStatementMetadataForStatementIdentifier:(id)a3 accountIdentifier:(id)a4 completion:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  if (self->_entitledForAccountUse)
  {
    id v9 = a5;
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
    [v10 updateAccountStatementMetadataForStatementIdentifier:v13 accountIdentifier:v8 trigger:1 completion:v9];
  }

  else
  {
    uint64_t v11 = PKAccountErrorDomain;
    id v12 = a5;
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v11,  1LL,  0LL));
    (*((void (**)(id, void, void *))a5 + 2))(v12, 0LL, v10);
  }
}

- (void)deleteAccountStatementMetadataForStatementIdentifier:(id)a3 accountIdentifier:(id)a4 completion:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  if (self->_entitledForAccountUse)
  {
    id v9 = a5;
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
    [v10 deleteAccountStatementMetadataForStatementIdentifier:v13 accountIdentifier:v8 completion:v9];
  }

  else
  {
    uint64_t v11 = PKAccountErrorDomain;
    id v12 = a5;
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v11,  1LL,  0LL));
    (*((void (**)(id, void *))a5 + 2))(v12, v10);
  }
}

- (void)triggerStatementMetadataProcessingForAccountIdentifier:(id)a3 statementIdentifier:(id)a4 completion:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  if (self->_entitledForAccountUse)
  {
    id v9 = a5;
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountService statementMetadataProcessor](self, "statementMetadataProcessor"));
    [v10 triggerStatementMetadataProcessingForAccountIdentifier:v13 statementIdentifier:v8 completion:v9];
  }

  else
  {
    uint64_t v11 = PKAccountErrorDomain;
    id v12 = a5;
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v11,  1LL,  0LL));
    (*((void (**)(id, void, void *))a5 + 2))(v12, 0LL, v10);
  }
}

- (void)updateSavingsStatementsForAccountIdentifier:(id)a3 completion:(id)a4
{
  id v10 = a3;
  if (self->_entitledForAccountUse)
  {
    id v6 = a4;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
    [v7 updateSavingsStatementsForAccountIdentifier:v10 completion:v6];
  }

  else
  {
    uint64_t v8 = PKAccountErrorDomain;
    id v9 = a4;
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v8,  1LL,  0LL));
    (*((void (**)(id, void, void *))a4 + 2))(v9, 0LL, v7);
  }
}

- (void)savingsStatementsForAccountIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_entitledForAccountUse)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_1001C560C;
    v10[3] = &unk_1006415E8;
    id v11 = v7;
    [v8 savingsStatementsForAccountIdentifier:v6 completion:v10];
  }

  else
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKAccountErrorDomain,  1LL,  0LL));
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0LL, v9);
  }
}

- (void)updateTaxFormsForAccountIdentifier:(id)a3 completion:(id)a4
{
  id v10 = a3;
  if (self->_entitledForAccountUse)
  {
    id v6 = a4;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
    [v7 updateTaxFormsForAccountIdentifier:v10 completion:v6];
  }

  else
  {
    uint64_t v8 = PKAccountErrorDomain;
    id v9 = a4;
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v8,  1LL,  0LL));
    (*((void (**)(id, void, void *))a4 + 2))(v9, 0LL, v7);
  }
}

- (void)taxFormsForAccountIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_entitledForAccountUse)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_1001C57E8;
    v10[3] = &unk_1006415E8;
    id v11 = v7;
    [v8 taxFormsForAccountIdentifier:v6 completion:v10];
  }

  else
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKAccountErrorDomain,  1LL,  0LL));
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0LL, v9);
  }
}

- (void)lastRedemptionEventToDestination:(unint64_t)a3 forAccountIdentifier:(id)a4 altDSID:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v12)
  {
    if (self->_entitledForAccountUse)
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472LL;
      v15[2] = sub_1001C5924;
      v15[3] = &unk_10064AED0;
      id v16 = v12;
      [v13 lastRedemptionEventToDestination:a3 forAccountIdentifier:v10 altDSID:v11 completion:v15];
    }

    else
    {
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKAccountErrorDomain,  1LL,  0LL));
      (*((void (**)(id, void, void *))v12 + 2))(v12, 0LL, v14);
    }
  }
}

- (void)createVirtualCard:(int64_t)a3 forAccountIdentifier:(id)a4 completion:(id)a5
{
  id v10 = a4;
  id v8 = a5;
  if (v8)
  {
    if (self->_entitledForAccountUse)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
      [v9 createVirtualCard:a3 forAccountIdentifier:v10 completion:v8];
    }

    else
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKAccountErrorDomain,  1LL,  0LL));
      (*((void (**)(id, void, void, void *))v8 + 2))(v8, 0LL, 0LL, v9);
    }
  }
}

- (void)performVirtualCardAction:(int64_t)a3 forVirtualCardIdentifier:(id)a4 forAccountIdentifier:(id)a5 completion:(id)a6
{
  id v13 = a4;
  id v10 = a5;
  id v11 = a6;
  if (v11)
  {
    if (self->_entitledForAccountUse)
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
      [v12 performVirtualCardAction:a3 forVirtualCardIdentifier:v13 forAccountIdentifier:v10 completion:v11];
    }

    else
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKAccountErrorDomain,  1LL,  0LL));
      (*((void (**)(id, void, void, void *))v11 + 2))(v11, 0LL, 0LL, v12);
    }
  }
}

- (void)updateVirtualCardsWithAccountIdentifier:(id)a3 completion:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (v6)
  {
    if (self->_entitledForAccountUse)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
      [v7 updateVirtualCardsWithAccountIdentifier:v8 completion:v6];
    }

    else
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKAccountErrorDomain,  1LL,  0LL));
      (*((void (**)(id, void, void, void *))v6 + 2))(v6, 0LL, 0LL, v7);
    }
  }
}

- (void)cardCredentialsForVirtualCard:(id)a3 authorization:(id)a4 action:(int64_t)a5 completion:(id)a6
{
  id v13 = a3;
  id v10 = a4;
  id v11 = (void (**)(id, void, void *))a6;
  if (v11)
  {
    if (self->_entitledForAccountUse)
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
      [v12 cardCredentialsForVirtualCard:v13 authorization:v10 action:a5 completion:v11];
    }

    else
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKAccountErrorDomain,  1LL,  0LL));
      v11[2](v11, 0LL, v12);
    }
  }
}

- (void)noteVirtualCardAutoFilledBySafari:(id)a3 completion:(id)a4
{
  id v8 = a3;
  id v6 = (void (**)(id, void *))a4;
  if (v6)
  {
    if (self->_entitledForAccountUse)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
      [v7 noteVirtualCardAutoFilledBySafari:v8 completion:v6];
    }

    else
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKAccountErrorDomain,  1LL,  0LL));
      v6[2](v6, v7);
    }
  }
}

- (void)fetchKeychainCredentialForVirtualCardIdentifier:(id)a3 forAccountIdentifier:(id)a4 completion:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, void *))a5;
  if (v9)
  {
    if (self->_entitledForAccountUse)
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
      [v10 fetchKeychainCredentialForVirtualCardIdentifier:v11 forAccountIdentifier:v8 completion:v9];
    }

    else
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKAccountErrorDomain,  1LL,  0LL));
      v9[2](v9, v10);
    }
  }
}

- (void)virtualCardsInKeychainWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = (void (**)(void, void))v4;
  if (v4)
  {
    if (self->_entitledForAccountUse)
    {
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472LL;
      v8[2] = sub_1001C5F14;
      v8[3] = &unk_10064AEA8;
      id v9 = v4;
      +[PKVirtualCard queryKeychainForVirtualCards:](&OBJC_CLASS___PKVirtualCard, "queryKeychainForVirtualCards:", v8);
    }

    else
    {
      uint64_t Object = PKLogFacilityTypeGetObject(14LL);
      id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        id v11 = "-[PDAccountService virtualCardsInKeychainWithCompletion:]";
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  buf,  0xCu);
      }

      v5[2](v5, 0LL);
    }
  }
}

- (void)writeVirtualCardToKeychain:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(void))a4;
  uint64_t Object = PKLogFacilityTypeGetObject(14LL);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315138;
    id v11 = "-[PDAccountService writeVirtualCardToKeychain:completion:]";
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Writing virtual card to keychain for method: %s",  (uint8_t *)&v10,  0xCu);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 keychainCardCredentials]);
  if (v9) {
    [v5 writeKeychainVirtualCardToKeychain];
  }
  if (v6) {
    v6[2](v6);
  }
}

- (void)noteSecurityCodeActivityWithAction:(int64_t)a3 forSecurityCodeIdentifier:(id)a4 forVirtualCardIdentifier:(id)a5 forAccountIdentifier:(id)a6 completion:(id)a7
{
  id v16 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = (void (**)(id, void, void *))a7;
  if (v14)
  {
    if (self->_entitledForAccountUse)
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
      [v15 noteSecurityCodeActivityWithAction:a3 forSecurityCodeIdentifier:v16 forVirtualCardIdentifier:v12 forAccountIdentifier:v13 completion:v14];
    }

    else
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKAccountErrorDomain,  1LL,  0LL));
      v14[2](v14, 0LL, v15);
    }
  }
}

- (void)physicalCardsForAccountWithIdentifier:(id)a3 completion:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    if (self->_entitledForAccountUse)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
      [v8 physicalCardsForAccountWithIdentifier:v9 completion:v7];
    }

    else
    {
      (*((void (**)(id, void))v6 + 2))(v6, 0LL);
    }
  }
}

- (void)updatePhysicalCardsForAccountWithIdentifier:(id)a3 force:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v10 = a3;
  id v8 = (void (**)(id, void, void *))a5;
  if (v8)
  {
    if (self->_entitledForAccountUse)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
      [v9 updatePhysicalCardsForAccountWithIdentifier:v10 force:v6 completion:v8];
    }

    else
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKAccountErrorDomain,  1LL,  0LL));
      v8[2](v8, 0LL, v9);
    }
  }
}

- (void)beginPhysicalCardRequestWithOrder:(id)a3 forAccountWithIdentifier:(id)a4 accountUserAltDSID:(id)a5 deviceMetadata:(id)a6 completion:(id)a7
{
  id v17 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (v15)
  {
    if (self->_entitledForAccountUse)
    {
      id v16 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
      [v16 beginPhysicalCardRequestWithOrder:v17 forAccountWithIdentifier:v12 accountUserAltDSID:v13 deviceMetadata:v14 completion:v15];
    }

    else
    {
      id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKAccountErrorDomain,  1LL,  0LL));
      (*((void (**)(id, void, void, void, void, void *))v15 + 2))(v15, 0LL, 0LL, 0LL, 0LL, v16);
    }
  }
}

- (void)completePhysicalCardRequest:(id)a3 withSignature:(id)a4 completion:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v9)
  {
    if (self->_entitledForAccountUse)
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
      [v10 completePhysicalCardRequest:v11 withSignature:v8 completion:v9];
    }

    else
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKAccountErrorDomain,  1LL,  0LL));
      (*((void (**)(id, void, void, void *))v9 + 2))(v9, 0LL, 0LL, v10);
    }
  }
}

- (void)beginPhysicalCardAction:(id)a3 onPhysicalCardWithIdentifier:(id)a4 forAccountWithIdentifier:(id)a5 accountUserAltDSID:(id)a6 deviceMetadata:(id)a7 completion:(id)a8
{
  id v20 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  if (v18)
  {
    if (self->_entitledForAccountUse)
    {
      id v19 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
      [v19 beginPhysicalCardAction:v20 onPhysicalCardWithIdentifier:v14 forAccountWithIdentifier:v15 accountUserAltDSID:v16 deviceMetadata:v17 completion:v18];
    }

    else
    {
      id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKAccountErrorDomain,  1LL,  0LL));
      (*((void (**)(id, void, void, void, void, void *))v18 + 2))(v18, 0LL, 0LL, 0LL, 0LL, v19);
    }
  }
}

- (void)completePhysicalCardActionRequest:(id)a3 withSignature:(id)a4 completion:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v9)
  {
    if (self->_entitledForAccountUse)
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
      [v10 completePhysicalCardActionRequest:v11 withSignature:v8 completion:v9];
    }

    else
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKAccountErrorDomain,  1LL,  0LL));
      (*((void (**)(id, void, void, void *))v9 + 2))(v9, 0LL, 0LL, v10);
    }
  }
}

- (void)activatePhysicalCardWithActivationCode:(id)a3 completion:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    if (self->_entitledForAccountUse)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
      [v8 activatePhysicalCardWithActivationCode:v9 completion:v7];
    }

    else
    {
      (*((void (**)(id, void))v6 + 2))(v6, 0LL);
    }
  }
}

- (void)inactivatePhysicalCardForFeatureIdentifier:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    id v8 = v6;
    if (self->_entitledForAccountUse)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
      [v7 inactivePhysicalCardForFeatureIdentifier:a3 completion:v8];
    }

    else
    {
      (*((void (**)(id, void))v6 + 2))(v6, 0LL);
    }

    id v6 = v8;
  }
}

- (void)physicalCardForFeatureIdentifier:(unint64_t)a3 activationCode:(id)a4 completion:(id)a5
{
  id v11 = a4;
  id v8 = a5;
  id v9 = v8;
  if (v8)
  {
    if (self->_entitledForAccountUse)
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
      [v10 physicalCardForFeatureIdentifier:a3 activationCode:v11 completion:v9];
    }

    else
    {
      (*((void (**)(id, void))v8 + 2))(v8, 0LL);
    }
  }
}

- (void)activatePhysicalCardWithIdentifier:(id)a3 activationCode:(id)a4 completion:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  if (v9)
  {
    if (self->_entitledForAccountUse)
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
      [v11 activatePhysicalCardWithIdentifier:v12 activationCode:v8 completion:v10];
    }

    else
    {
      (*((void (**)(id, uint64_t))v9 + 2))(v9, 3LL);
    }
  }
}

- (void)processPhysicalCardExpirationMessaging:(id)a3 physicalCards:(id)a4 account:(id)a5
{
  if (self->_entitledForAccountUse)
  {
    id v8 = a5;
    id v9 = a4;
    id v10 = a3;
    id v11 = (id)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
    [v11 processPhysicalCardExpirationMessaging:v10 physicalCards:v9 account:v8];
  }

- (void)billPaymentSelectedSuggestedAmountDataEventsForAccountIdentifier:(id)a3 withStatementIdentifier:(id)a4 completion:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, void, void *))a5;
  if (v9)
  {
    if (self->_entitledForAccountUse)
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
      [v10 billPaymentSelectedSuggestedAmountDataEventsForAccountIdentifier:v11 withStatementIdentifier:v8 completion:v9];
    }

    else
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKAccountErrorDomain,  1LL,  0LL));
      v9[2](v9, 0LL, v10);
    }
  }
}

- (void)billPaymentSelectedSuggestedAmountDataEventsForAccountIdentifier:(id)a3 withStartDate:(id)a4 endDate:(id)a5 completion:(id)a6
{
  id v14 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = (void (**)(id, void, void *))a6;
  if (v12)
  {
    if (self->_entitledForAccountUse)
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
      [v13 billPaymentSelectedSuggestedAmountDataEventsForAccountIdentifier:v14 withStartDate:v10 endDate:v11 completion:v12];
    }

    else
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKAccountErrorDomain,  1LL,  0LL));
      v12[2](v12, 0LL, v13);
    }
  }
}

- (void)updateScheduledPaymentsWithAccount:(id)a3 completion:(id)a4
{
  id v10 = a3;
  if (self->_entitledForAccountUse)
  {
    id v6 = a4;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
    [v7 updateScheduledPaymentsWithAccount:v10 completion:v6];
  }

  else
  {
    uint64_t v8 = PKAccountErrorDomain;
    id v9 = a4;
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v8,  1LL,  0LL));
    (*((void (**)(id, void, void *))a4 + 2))(v9, 0LL, v7);
  }
}

- (void)scheduledPaymentsWithAccountIdentifier:(id)a3 includeFailedRecurringPayments:(BOOL)a4 allowFetchFromServer:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v14 = a3;
  if (self->_entitledForAccountUse)
  {
    id v10 = a6;
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
    [v11 scheduledPaymentsWithAccountIdentifier:v14 includeFailedRecurringPayments:v8 allowFetchFromServer:v7 completion:v10];
  }

  else
  {
    uint64_t v12 = PKAccountErrorDomain;
    id v13 = a6;
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v12,  1LL,  0LL));
    (*((void (**)(id, void, void *))a6 + 2))(v13, 0LL, v11);
  }
}

- (void)scheduleSetupReminderForAccountWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = v7;
  if (self->_entitledForAccountUse)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_1001C6E1C;
    v10[3] = &unk_10063A830;
    id v11 = v8;
    [v9 scheduleSetupReminderForAccountWithIdentifier:v6 completion:v10];
  }

  else if (v7)
  {
    (*((void (**)(id))v7 + 2))(v7);
  }
}

- (void)insertSummaryNotificationForAccountIdentifier:(id)a3 summaryType:(int64_t)a4 completion:(id)a5
{
  id v12 = a3;
  if (self->_entitledForAccountUse)
  {
    id v8 = a5;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
    [v9 insertSummaryNotificationForAccountIdentifier:v12 summaryType:a4 completion:v8];
  }

  else
  {
    uint64_t v10 = PKAccountErrorDomain;
    id v11 = a5;
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v10,  1LL,  0LL));
    (*((void (**)(id, void *))a5 + 2))(v11, v9);
  }
}

- (void)insertDailyCashNotificationForAccountIdentifier:(id)a3 completion:(id)a4
{
  id v10 = a3;
  if (self->_entitledForAccountUse)
  {
    id v6 = a4;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
    [v7 insertDailyCashNotificationForAccountIdentifier:v10 completion:v6];
  }

  else
  {
    uint64_t v8 = PKAccountErrorDomain;
    id v9 = a4;
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v8,  1LL,  0LL));
    (*((void (**)(id, void *))a4 + 2))(v9, v7);
  }
}

- (void)markUserViewedIntroduction:(BOOL)a3 forInstallmentIdentifiers:(id)a4 accountIdentifier:(id)a5 completion:(id)a6
{
  BOOL v8 = a3;
  id v15 = a4;
  id v10 = a5;
  if (self->_entitledForAccountUse)
  {
    id v11 = a6;
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
    [v12 markUserViewedIntroduction:v8 forInstallmentIdentifiers:v15 accountIdentifier:v10 completion:v11];
  }

  else
  {
    uint64_t v13 = PKAccountErrorDomain;
    id v14 = a6;
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v13,  1LL,  0LL));
    (*((void (**)(id, void *))a6 + 2))(v14, v12);
  }
}

- (void)exportTransactionDataForAccountIdentifier:(id)a3 withFileFormat:(id)a4 beginDate:(id)a5 endDate:(id)a6 productTimeZone:(id)a7 completion:(id)a8
{
  id v22 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  if (self->_entitledForAccountUse)
  {
    id v18 = a8;
    id v19 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
    [v19 exportTransactionDataForAccountIdentifier:v22 withFileFormat:v14 beginDate:v15 endDate:v16 productTimeZone:v17 completion:v18];
  }

  else
  {
    uint64_t v20 = PKAccountErrorDomain;
    id v21 = a8;
    id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v20,  1LL,  0LL));
    (*((void (**)(id, void, void *))a8 + 2))(v21, 0LL, v19);
  }
}

- (void)sharedAccountCloudStoreWithAccountIdentifier:(id)a3 completion:(id)a4
{
  id v9 = a3;
  if (self->_entitledForAccountUse)
  {
    id v6 = a4;
    id v7 = (id)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
    [v7 sharedAccountCloudStoreWithAccountIdentifier:v9 completion:v6];
  }

  else
  {
    BOOL v8 = (void (*)(void))*((void *)a4 + 2);
    id v7 = a4;
    v8();
  }
}

- (void)updateSharedAccountCloudStoreWithAccountIdentifier:(id)a3 completion:(id)a4
{
  id v10 = a3;
  if (self->_entitledForAccountUse)
  {
    id v6 = a4;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
    [v7 updateSharedAccountCloudStoreWithAccountIdentifier:v10 completion:v6];
  }

  else
  {
    uint64_t v8 = PKAccountErrorDomain;
    id v9 = a4;
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v8,  1LL,  0LL));
    (*((void (**)(id, void, void *))a4 + 2))(v9, 0LL, v7);
  }
}

- (void)didAddAccountPendingFamilyMembers:(id)a3
{
  if (self->_entitledForAccountUse)
  {
    id v4 = a3;
    id v5 = (id)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
    [v5 didAddAccountPendingFamilyMembers:v4];
  }

- (void)accountPendingFamilyMembersForAccountIdentifier:(id)a3 completion:(id)a4
{
  id v10 = a3;
  if (self->_entitledForAccountUse)
  {
    id v6 = a4;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
    [v7 accountPendingFamilyMembersForAccountIdentifier:v10 completion:v6];
  }

  else
  {
    uint64_t v8 = PKAccountErrorDomain;
    id v9 = a4;
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v8,  1LL,  0LL));
    (*((void (**)(id, void, void *))a4 + 2))(v9, 0LL, v7);
  }
}

- (void)accountBalancesForAccountIdentifier:(id)a3 startDate:(id)a4 endDate:(id)a5 type:(unint64_t)a6 completion:(id)a7
{
  id v18 = a3;
  id v12 = a4;
  id v13 = a5;
  if (self->_entitledForAccountUse)
  {
    id v14 = a7;
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
    [v15 accountBalancesForAccountIdentifier:v18 startDate:v12 endDate:v13 type:a6 completion:v14];
  }

  else
  {
    uint64_t v16 = PKAccountErrorDomain;
    id v17 = a7;
    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v16,  1LL,  0LL));
    (*((void (**)(id, void, void *))a7 + 2))(v17, 0LL, v15);
  }
}

- (void)updateAccountBalancesForAccountIdentifier:(id)a3 startDate:(id)a4 endDate:(id)a5 type:(unint64_t)a6 completion:(id)a7
{
  id v18 = a3;
  id v12 = a4;
  id v13 = a5;
  if (self->_entitledForAccountUse)
  {
    id v14 = a7;
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
    [v15 updateAccountBalancesForAccountIdentifier:v18 startDate:v12 endDate:v13 type:a6 completion:v14];
  }

  else
  {
    uint64_t v16 = PKAccountErrorDomain;
    id v17 = a7;
    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v16,  1LL,  0LL));
    (*((void (**)(id, void, void *))a7 + 2))(v17, 0LL, v15);
  }
}

- (void)resetAccountBalancesForAccountIdentifier:(id)a3 completion:(id)a4
{
  id v10 = a3;
  if (self->_entitledForAccountUse)
  {
    id v6 = a4;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
    [v7 resetAccountBalancesForAccountIdentifier:v10 completion:v6];
  }

  else
  {
    uint64_t v8 = PKAccountErrorDomain;
    id v9 = a4;
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v8,  1LL,  0LL));
    (*((void (**)(id, void *))a4 + 2))(v9, v7);
  }
}

- (void)updateFinancingPlansForAccountWithIdentifier:(id)a3 pageOffset:(unint64_t)a4 limit:(unint64_t)a5 ignoreLastUpdatedDate:(BOOL)a6 forceFetch:(BOOL)a7 completion:(id)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  id v18 = a3;
  if (self->_entitledForAccountUse)
  {
    id v14 = a8;
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
    [v15 updateFinancingPlansForAccountWithIdentifier:v18 pageOffset:a4 limit:a5 ignoreLastUpdatedDate:v10 forceFetch:v9 completion:v14];
  }

  else
  {
    uint64_t v16 = PKAccountErrorDomain;
    id v17 = a8;
    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v16,  1LL,  0LL));
    (*((void (**)(id, void, void *))a8 + 2))(v17, 0LL, v15);
  }
}

- (void)cancelFinancingPlanWithIdentifier:(id)a3 accountIdentifier:(id)a4 cancellationReasonIdentifier:(id)a5 cancellationReasonDescription:(id)a6 completion:(id)a7
{
  id v18 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  uint64_t v16 = (void (**)(void, void))v15;
  if (self->_entitledForAccountUse)
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
    [v17 cancelFinancingPlanWithIdentifier:v18 accountIdentifier:v12 cancellationReasonIdentifier:v13 cancellationReasonDescription:v14 completion:v16];
LABEL_5:

    goto LABEL_6;
  }

  if (v15)
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKAccountErrorDomain,  1LL,  0LL));
    ((void (**)(void, void *))v16)[2](v16, v17);
    goto LABEL_5;
  }

- (void)financingPlansForAllAccountsWithCompletion:(id)a3
{
  if (self->_entitledForAccountUse)
  {
    id v4 = a3;
    id v6 = (id)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
    [v6 financingPlansForAllAccountsWithCompletion:v4];
  }

  else
  {
    id v5 = (void (*)(void))*((void *)a3 + 2);
    id v6 = a3;
    v5();
  }
}

- (void)financingPlansWithQueries:(id)a3 completion:(id)a4
{
  id v9 = a3;
  if (self->_entitledForAccountUse)
  {
    id v6 = a4;
    id v7 = (id)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
    [v7 financingPlansWithQueries:v9 completion:v6];
  }

  else
  {
    uint64_t v8 = (void (*)(void))*((void *)a4 + 2);
    id v7 = a4;
    v8();
  }
}

- (void)financingPlanInstallmentsDueDateRangeForAccountIdentifier:(id)a3 financingPlanStates:(id)a4 completion:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  id v9 = a5;
  BOOL v10 = v9;
  if (self->_entitledForAccountUse)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
    [v11 financingPlanInstallmentsDueDateRangeForAccountIdentifier:v12 financingPlanStates:v8 completion:v10];
  }

  else if (v9)
  {
    (*((void (**)(id, void, void))v9 + 2))(v9, 0LL, 0LL);
  }
}

- (void)financingPlanForPlanIdentifier:(id)a3 completion:(id)a4
{
  id v9 = a3;
  if (self->_entitledForAccountUse)
  {
    id v6 = a4;
    id v7 = (id)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
    [v7 financingPlanForPlanIdentifier:v9 completion:v6];
  }

  else
  {
    id v8 = (void (*)(void))*((void *)a4 + 2);
    id v7 = a4;
    v8();
  }
}

- (void)reprocessPayLaterFinancingPlansForMerchantCleanup:(id)a3
{
  id v4 = (void (**)(void))a3;
  if (self->_entitledForAccountUse)
  {
    id v6 = v4;
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
    [v5 reprocessPayLaterFinancingPlansForMerchantCleanup:v6];

LABEL_5:
    id v4 = v6;
    goto LABEL_6;
  }

  if (v4)
  {
    id v6 = v4;
    v4[2]();
    goto LABEL_5;
  }

- (void)deleteFinancingPlansForAllAccountsWithCompletion:(id)a3
{
  id v4 = (void (**)(void))a3;
  if (self->_entitledForAccountUse)
  {
    id v6 = v4;
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
    [v5 deleteFinancingPlansForAllAccountsWithCompletion:v6];

LABEL_5:
    id v4 = v6;
    goto LABEL_6;
  }

  if (v4)
  {
    id v6 = v4;
    v4[2]();
    goto LABEL_5;
  }

- (void)deleteFinancingPlansForAccountIdentifier:(id)a3 completion:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = v6;
  if (self->_entitledForAccountUse)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
    [v8 deleteFinancingPlansForAccountIdentifier:v9 completion:v7];
  }

  else if (v6)
  {
    (*((void (**)(id))v6 + 2))(v6);
  }
}

- (void)deleteFinancingPlanWithIdentifier:(id)a3 accountIdentifier:(id)a4 completion:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  id v9 = a5;
  BOOL v10 = v9;
  if (self->_entitledForAccountUse)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
    [v11 deleteFinancingPlanWithIdentifier:v12 accountIdentifier:v8 completion:v10];
  }

  else if (v9)
  {
    (*((void (**)(id))v9 + 2))(v9);
  }
}

- (void)payLaterCardMagnitudesForAccountIdentifier:(id)a3 completion:(id)a4
{
  id v9 = a3;
  if (self->_entitledForAccountUse)
  {
    id v6 = a4;
    id v7 = (id)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
    [v7 payLaterCardMagnitudesForAccountIdentifier:v9 completion:v6];
  }

  else
  {
    id v8 = (void (*)(void))*((void *)a4 + 2);
    id v7 = a4;
    v8();
  }
}

- (void)attemptAppleBalanceSetupWithCompletion:(id)a3
{
  id v4 = (void (**)(id, uint64_t))a3;
  unsigned int v5 = -[PKEntitlementWhitelist appleMediaServicesPrivate](self->_whitelist, "appleMediaServicesPrivate");
  uint64_t Object = PKLogFacilityTypeGetObject(14LL);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (!v5)
  {
    if (v8)
    {
      int v12 = 136315138;
      id v13 = "-[PDAccountService attemptAppleBalanceSetupWithCompletion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  (uint8_t *)&v12,  0xCu);
    }

    uint64_t v10 = PKDisplayableErrorCustom( @"Missing entitlement",  @"Cannot provision apple balance pass because the entitlement is missing",  0LL,  0LL);
    uint64_t v11 = objc_claimAutoreleasedReturnValue(v10);
LABEL_9:
    id v9 = (void *)v11;
    v4[2](v4, v11);
    goto LABEL_10;
  }

  if (v8)
  {
    LOWORD(v12) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Attempting to provision account and pass for apple balance",  (uint8_t *)&v12,  2u);
  }

  if (!self->_entitledForAccountUse)
  {
    if (!v4) {
      goto LABEL_11;
    }
    uint64_t v11 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKAccountErrorDomain,  1LL,  0LL));
    goto LABEL_9;
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
  [v9 attemptAppleBalanceSetupWithCompletion:v4];
LABEL_10:

LABEL_11:
}

- (void)validateAppleBalanceSecurityRequirementsWithCompletion:(id)a3
{
  id v4 = a3;
  if (self->_entitledForAccountUse)
  {
    id v6 = v4;
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
    [v5 validateAppleBalanceSecurityRequirementsWithCompletion:v6];
LABEL_5:

    id v4 = v6;
    goto LABEL_6;
  }

  if (v4)
  {
    id v6 = v4;
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKAccountErrorDomain,  1LL,  0LL));
    (*((void (**)(id, void, void *))v6 + 2))(v6, 0LL, v5);
    goto LABEL_5;
  }

- (void)triggerCloudStoreZoneCreationForAccount:(id)a3 withCompletion:(id)a4
{
  id v9 = a3;
  if (self->_entitledForAccountUse)
  {
    id v6 = a4;
    id v7 = (id)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
    [v7 triggerCloudStoreZoneCreationForAccount:v9 withCompletion:v6];
  }

  else
  {
    BOOL v8 = (void (*)(void))*((void *)a4 + 2);
    id v7 = a4;
    v8();
  }
}

- (void)backgroundProvisionInProgressForFeature:(unint64_t)a3 withCompletion:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    id v9 = v6;
    if (self->_entitledForAccountUse)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
      id v8 = [v7 backgroundProvisionInProgressForFeature:a3];

      id v6 = v9;
    }

    else
    {
      id v8 = 0LL;
    }

    (*((void (**)(id, id))v6 + 2))(v9, v8);
    id v6 = v9;
  }
}

- (void)invalidateTopUpTokenWithIdentifier:(id)a3 forAccountWithIdentifier:(id)a4 completion:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, void *))a5;
  if (v9)
  {
    if (self->_entitledForAccountUse)
    {
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
      [v10 invalidateTopUpTokenWithIdentifier:v11 forAccountWithIdentifier:v8 completion:v9];
    }

    else
    {
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKAccountErrorDomain,  1LL,  0LL));
      v9[2](v9, v10);
    }
  }
}

- (void)appleBalancePromotionForAccountWithIdentifier:(id)a3 completion:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    if (self->_entitledForAccountUse)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
      [v8 appleBalancePromotionForAccountWithIdentifier:v9 completion:v7];
    }

    else
    {
      (*((void (**)(id, void))v6 + 2))(v6, 0LL);
    }
  }
}

- (void)deleteAppleBalancePromotionForAccountWithIdentifier:(id)a3 completion:(id)a4
{
  id v8 = a3;
  id v6 = (void (**)(id, void *))a4;
  if (v6)
  {
    if (self->_entitledForAccountUse)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
      [v7 deleteAppleBalancePromotionForAccountWithIdentifier:v8 completion:v6];
    }

    else
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKAccountErrorDomain,  1LL,  0LL));
      v6[2](v6, v7);
    }
  }
}

- (void)inStoreTopUpTokenForAccountWithIdentifier:(id)a3 completion:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    if (self->_entitledForAccountUse)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
      [v8 inStoreTopUpTokenForAccountWithIdentifier:v9 completion:v7];
    }

    else
    {
      (*((void (**)(id, void))v6 + 2))(v6, 0LL);
    }
  }
}

- (void)insertOrUpdateInStoreTopUpToken:(id)a3 accountIdentifier:(id)a4 completion:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, void *))a5;
  if (v9)
  {
    if (self->_entitledForAccountUse)
    {
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
      [v10 insertOrUpdateInStoreTopUpToken:v11 accountIdentifier:v8 completion:v9];
    }

    else
    {
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKAccountErrorDomain,  1LL,  0LL));
      v9[2](v9, v10);
    }
  }
}

- (void)deleteInStoreTopUpTokenForAccountWithIdentifier:(id)a3 completion:(id)a4
{
  id v8 = a3;
  id v6 = (void (**)(id, void *))a4;
  if (v6)
  {
    if (self->_entitledForAccountUse)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
      [v7 deleteInStoreTopUpTokenForAccountWithIdentifier:v8 completion:v6];
    }

    else
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKAccountErrorDomain,  1LL,  0LL));
      v6[2](v6, v7);
    }
  }
}

- (void)dailyCashEligibleDestinationsForAccountWithIdentifier:(id)a3 completion:(id)a4
{
  id v10 = a3;
  if (self->_entitledForAccountUse)
  {
    id v6 = a4;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
    [v7 dailyCashEligibleDestinationsForAccountWithIdentifier:v10 completion:v6];
  }

  else
  {
    uint64_t v8 = PKAccountErrorDomain;
    id v9 = a4;
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v8,  1LL,  0LL));
    (*((void (**)(id, void, void *))a4 + 2))(v9, 0LL, v7);
  }
}

- (void)accountHoldsForAccountIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_entitledForAccountUse)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_1001C8700;
    v10[3] = &unk_1006415E8;
    id v11 = v7;
    [v8 accountHoldsForAccountIdentifier:v6 completion:v10];
  }

  else
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKAccountErrorDomain,  1LL,  0LL));
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0LL, v9);
  }
}

- (void)rewardsTierSummaryForTransactionSourceIdentifiers:(id)a3 currencyCode:(id)a4 startDate:(id)a5 endDate:(id)a6 completion:(id)a7
{
  id v18 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  uint64_t v16 = v15;
  if (self->_entitledForAccountUse)
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
    [v17 rewardsTierSummaryForTransactionSourceIdentifiers:v18 currencyCode:v12 startDate:v13 endDate:v14 completion:v16];
  }

  else if (v15)
  {
    (*((void (**)(id, void))v15 + 2))(v15, 0LL);
  }
}

- (void)updateAccountPromotionsForAccountWithIdentifier:(id)a3 observeCooldownPeriod:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v12 = a3;
  if (self->_entitledForAccountUse)
  {
    id v8 = a5;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
    [v9 updateAccountPromotionsForAccountWithIdentifier:v12 observeCooldownPeriod:v6 completion:v8];
  }

  else
  {
    uint64_t v10 = PKAccountErrorDomain;
    id v11 = a5;
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v10,  1LL,  0LL));
    (*((void (**)(id, void, void *))a5 + 2))(v11, 0LL, v9);
  }
}

- (void)updateAccountPromotionsForAccountWithIdentifier:(id)a3 completion:(id)a4
{
  id v10 = a3;
  if (self->_entitledForAccountUse)
  {
    id v6 = a4;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
    [v7 updateAccountPromotionsForAccountWithIdentifier:v10 completion:v6];
  }

  else
  {
    uint64_t v8 = PKAccountErrorDomain;
    id v9 = a4;
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v8,  1LL,  0LL));
    (*((void (**)(id, void, void *))a4 + 2))(v9, 0LL, v7);
  }
}

- (void)updateAccountPromotionsForAccountWithIdentifier:(id)a3 ignoreErrorBackoff:(BOOL)a4 observeCooldownPeriod:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v14 = a3;
  if (self->_entitledForAccountUse)
  {
    id v10 = a6;
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
    [v11 updateAccountPromotionsForAccountWithIdentifier:v14 ignoreErrorBackoff:v8 observeCooldownPeriod:v7 completion:v10];
  }

  else
  {
    uint64_t v12 = PKAccountErrorDomain;
    id v13 = a6;
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v12,  1LL,  0LL));
    (*((void (**)(id, void, void *))a6 + 2))(v13, 0LL, v11);
  }
}

- (void)insertOrUpdateAccountPromotions:(id)a3 accountIdentifier:(id)a4 completion:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  if (self->_entitledForAccountUse)
  {
    id v9 = a5;
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
    [v10 insertOrUpdateAccountPromotions:v13 accountIdentifier:v8 completion:v9];
  }

  else
  {
    uint64_t v11 = PKAccountErrorDomain;
    id v12 = a5;
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v11,  1LL,  0LL));
    (*((void (**)(id, void *))a5 + 2))(v12, v10);
  }
}

- (void)accountPromotionsForAccountWithIdentifier:(id)a3 completion:(id)a4
{
  id v9 = a3;
  if (self->_entitledForAccountUse)
  {
    id v6 = a4;
    id v7 = (id)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
    [v7 accountPromotionsForAccountWithIdentifier:v9 completion:v6];
  }

  else
  {
    id v8 = (void (*)(void))*((void *)a4 + 2);
    id v7 = a4;
    v8();
  }
}

- (void)deleteAccountPromotion:(id)a3 forAccountWithIdentifier:(id)a4 completion:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  if (self->_entitledForAccountUse)
  {
    id v9 = a5;
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
    [v10 deleteAccountPromotion:v13 forAccountWithIdentifier:v8 completion:v9];
  }

  else
  {
    uint64_t v11 = PKAccountErrorDomain;
    id v12 = a5;
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v11,  1LL,  0LL));
    (*((void (**)(id, void *))a5 + 2))(v12, v10);
  }
}

- (void)updateImpressionCountsForPromotions:(id)a3 accountIdentifier:(id)a4 completion:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  if (self->_entitledForAccountUse)
  {
    id v9 = a5;
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
    [v10 updateImpressionCountsForPromotions:v13 accountIdentifier:v8 completion:v9];
  }

  else
  {
    uint64_t v11 = PKAccountErrorDomain;
    id v12 = a5;
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v11,  1LL,  0LL));
    (*((void (**)(id, void *))a5 + 2))(v12, v10);
  }
}

- (void)updateImpressionCount:(int64_t)a3 promotionProgramIdentifier:(id)a4 accountIdentifier:(id)a5 completion:(id)a6
{
  id v15 = a4;
  id v10 = a5;
  if (self->_entitledForAccountUse)
  {
    id v11 = a6;
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
    [v12 updateImpressionCount:a3 promotionProgramIdentifier:v15 accountIdentifier:v10 completion:v11];
  }

  else
  {
    uint64_t v13 = PKAccountErrorDomain;
    id v14 = a6;
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v13,  1LL,  0LL));
    (*((void (**)(id, void *))a6 + 2))(v14, v12);
  }
}

- (void)accountPromotionBehaviorForAccountWithIdentifier:(id)a3 completion:(id)a4
{
  id v9 = a3;
  if (self->_entitledForAccountUse)
  {
    id v6 = a4;
    id v7 = (id)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
    [v7 accountPromotionBehaviorForAccountWithIdentifier:v9 completion:v6];
  }

  else
  {
    id v8 = (void (*)(void))*((void *)a4 + 2);
    id v7 = a4;
    v8();
  }
}

- (void)updateAccountEnhancedMerchantsForAccountWithIdentifier:(id)a3 cooldownLevel:(unint64_t)a4 completion:(id)a5
{
  id v12 = a3;
  if (self->_entitledForAccountUse)
  {
    id v8 = a5;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
    [v9 updateAccountEnhancedMerchantsForAccountWithIdentifier:v12 cooldownLevel:a4 completion:v8];
  }

  else
  {
    uint64_t v10 = PKAccountErrorDomain;
    id v11 = a5;
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v10,  1LL,  0LL));
    (*((void (**)(id, void, void *))a5 + 2))(v11, 0LL, v9);
  }
}

- (void)updateAccountEnhancedMerchantsForAccountWithIdentifier:(id)a3 completion:(id)a4
{
  id v10 = a3;
  if (self->_entitledForAccountUse)
  {
    id v6 = a4;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
    [v7 updateAccountEnhancedMerchantsForAccountWithIdentifier:v10 completion:v6];
  }

  else
  {
    uint64_t v8 = PKAccountErrorDomain;
    id v9 = a4;
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v8,  1LL,  0LL));
    (*((void (**)(id, void, void *))a4 + 2))(v9, 0LL, v7);
  }
}

- (void)updateAccountEnhancedMerchantsForAccountWithIdentifier:(id)a3 ignoreErrorBackoff:(BOOL)a4 cooldownLevel:(unint64_t)a5 completion:(id)a6
{
  BOOL v8 = a4;
  id v13 = a3;
  id v10 = a6;
  id v11 = (void (**)(void, void, void, void))v10;
  if (self->_entitledForAccountUse)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
    [v12 updateAccountEnhancedMerchantsForAccountWithIdentifier:v13 ignoreErrorBackoff:v8 cooldownLevel:a5 completion:v11];
LABEL_5:

    goto LABEL_6;
  }

  if (v10)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKAccountErrorDomain,  1LL,  0LL));
    ((void (**)(void, void, void *, void))v11)[2](v11, 0LL, v12, 0LL);
    goto LABEL_5;
  }

- (void)insertOrUpdateAccountEnhancedMerchants:(id)a3 accountIdentifier:(id)a4 completion:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  if (self->_entitledForAccountUse)
  {
    id v9 = a5;
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
    [v10 insertOrUpdateAccountEnhancedMerchants:v13 accountIdentifier:v8 completion:v9];
  }

  else
  {
    uint64_t v11 = PKAccountErrorDomain;
    id v12 = a5;
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v11,  1LL,  0LL));
    (*((void (**)(id, void *))a5 + 2))(v12, v10);
  }
}

- (void)accountEnhancedMerchantsForAccountWithIdentifier:(id)a3 completion:(id)a4
{
  id v9 = a3;
  if (self->_entitledForAccountUse)
  {
    id v6 = a4;
    id v7 = (id)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
    [v7 accountEnhancedMerchantsForAccountWithIdentifier:v9 completion:v6];
  }

  else
  {
    id v8 = (void (*)(void))*((void *)a4 + 2);
    id v7 = a4;
    v8();
  }
}

- (void)deleteAccountEnhancedMerchant:(id)a3 forAccountWithIdentifier:(id)a4 completion:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  if (self->_entitledForAccountUse)
  {
    id v9 = a5;
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
    [v10 deleteAccountEnhancedMerchant:v13 forAccountWithIdentifier:v8 completion:v9];
  }

  else
  {
    uint64_t v11 = PKAccountErrorDomain;
    id v12 = a5;
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v11,  1LL,  0LL));
    (*((void (**)(id, void *))a5 + 2))(v12, v10);
  }
}

- (void)accountEnhancedMerchantBehaviorForAccountWithIdentifier:(id)a3 completion:(id)a4
{
  id v9 = a3;
  if (self->_entitledForAccountUse)
  {
    id v6 = a4;
    id v7 = (id)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
    [v7 accountEnhancedMerchantBehaviorForAccountWithIdentifier:v9 completion:v6];
  }

  else
  {
    id v8 = (void (*)(void))*((void *)a4 + 2);
    id v7 = a4;
    v8();
  }
}

- (void)updateCreditRecoveryPaymentPlansForAccountIdentifier:(id)a3 completion:(id)a4
{
  id v10 = a3;
  if (self->_entitledForAccountUse)
  {
    id v6 = a4;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
    [v7 updateCreditRecoveryPaymentPlansForAccountIdentifier:v10 completion:v6];
  }

  else
  {
    uint64_t v8 = PKAccountErrorDomain;
    id v9 = a4;
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v8,  1LL,  0LL));
    (*((void (**)(id, void, void *))a4 + 2))(v9, 0LL, v7);
  }
}

- (void)creditRecoveryPaymentPlansForAccountIdentifier:(id)a3 allowFetchFromServer:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v11 = a3;
  if (self->_entitledForAccountUse)
  {
    id v8 = a5;
    id v9 = (id)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
    [v9 creditRecoveryPaymentPlansForAccountIdentifier:v11 allowFetchFromServer:v6 completion:v8];
  }

  else
  {
    id v10 = (void (*)(void))*((void *)a5 + 2);
    id v9 = a5;
    v10();
  }
}

- (void)creditRecoveryPaymentPlanInformationForAccountIdentifier:(id)a3 allowFetchFromServer:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v11 = a3;
  if (self->_entitledForAccountUse)
  {
    id v8 = a5;
    id v9 = (id)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
    [v9 creditRecoveryPaymentPlanInformationForAccountIdentifier:v11 allowFetchFromServer:v6 completion:v8];
  }

  else
  {
    id v10 = (void (*)(void))*((void *)a5 + 2);
    id v9 = a5;
    v10();
  }
}

- (void)accountEntityOrderingsForAccountWithIdentifier:(id)a3 entityType:(unint64_t)a4 completion:(id)a5
{
  id v11 = a3;
  if (self->_entitledForAccountUse)
  {
    id v8 = a5;
    id v9 = (id)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
    [v9 accountEntityOrderingsForAccountWithIdentifier:v11 entityType:a4 completion:v8];
  }

  else
  {
    id v10 = (void (*)(void))*((void *)a5 + 2);
    id v9 = a5;
    v10();
  }
}

- (void)updateWalletBadgeCountWithCompletion:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (!self->_entitledForAccountUse)
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0LL);
    goto LABEL_5;
  }

  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountService accountManager](self, "accountManager"));
  [v5 updateWalletBadgeCount];

  BOOL v6 = v7;
  if (v7)
  {
    (*((void (**)(id, uint64_t))v7 + 2))(v7, 1LL);
LABEL_5:
    BOOL v6 = v7;
  }
}

- (void)accountManager:(id)a3 didAddAccount:(id)a4
{
  if (self->_entitledForAccountUse)
  {
    id v5 = a4;
    id v6 = (id)objc_claimAutoreleasedReturnValue(-[PDAccountService remoteObjectProxy](self, "remoteObjectProxy"));
    [v6 accountAdded:v5];
  }

- (void)accountManager:(id)a3 didRemoveAccount:(id)a4
{
  if (self->_entitledForAccountUse)
  {
    id v5 = a4;
    id v6 = (id)objc_claimAutoreleasedReturnValue(-[PDAccountService remoteObjectProxy](self, "remoteObjectProxy"));
    [v6 accountRemoved:v5];
  }

- (void)accountManager:(id)a3 didUpdateAccount:(id)a4 oldAccount:(id)a5
{
  if (self->_entitledForAccountUse)
  {
    id v6 = a4;
    id v7 = (id)objc_claimAutoreleasedReturnValue(-[PDAccountService remoteObjectProxy](self, "remoteObjectProxy"));
    [v7 accountChanged:v6];
  }

- (void)accountManager:(id)a3 statementsChangedForAccountIdentifier:(id)a4
{
  if (self->_entitledForAccountUse)
  {
    id v5 = a4;
    id v6 = (id)objc_claimAutoreleasedReturnValue(-[PDAccountService remoteObjectProxy](self, "remoteObjectProxy"));
    [v6 statementsChangedForAccountIdentifier:v5];
  }

- (void)accountManager:(id)a3 scheduledPaymentsChangedForAccountIdentifier:(id)a4
{
  if (self->_entitledForAccountUse)
  {
    id v5 = a4;
    id v6 = (id)objc_claimAutoreleasedReturnValue(-[PDAccountService remoteObjectProxy](self, "remoteObjectProxy"));
    [v6 scheduledPaymentsChangedForAccountIdentifier:v5];
  }

- (void)accountManager:(id)a3 didUpdatePaymentFundingSources:(id)a4 accountIdentifier:(id)a5
{
  if (self->_entitledForAccountUse)
  {
    id v7 = a5;
    id v8 = a4;
    id v9 = (id)objc_claimAutoreleasedReturnValue(-[PDAccountService remoteObjectProxy](self, "remoteObjectProxy"));
    [v9 didUpdatePaymentFundingSources:v8 accountIdentifier:v7];
  }

- (void)accountManager:(id)a3 accountUsersChanged:(id)a4 oldUsers:(id)a5 accountIdentifier:(id)a6
{
  if (self->_entitledForAccountUse)
  {
    id v8 = a6;
    id v9 = a4;
    id v10 = (id)objc_claimAutoreleasedReturnValue(-[PDAccountService remoteObjectProxy](self, "remoteObjectProxy"));
    [v10 accountUsersChanged:v9 forAccountIdentifier:v8];
  }

- (void)accountManager:(id)a3 physicalCardsChanged:(id)a4 accountIdentifier:(id)a5
{
  if (self->_entitledForAccountUse)
  {
    id v7 = a5;
    id v8 = a4;
    id v9 = (id)objc_claimAutoreleasedReturnValue(-[PDAccountService remoteObjectProxy](self, "remoteObjectProxy"));
    [v9 physicalCardsChanged:v8 forAccountIdentifier:v7];
  }

- (void)accountManager:(id)a3 didAddFinancingPlan:(id)a4 accountIdentifier:(id)a5
{
  if (self->_entitledForAccountUse)
  {
    id v7 = a5;
    id v8 = a4;
    id v9 = (id)objc_claimAutoreleasedReturnValue(-[PDAccountService remoteObjectProxy](self, "remoteObjectProxy"));
    [v9 accountFinancingPlanAdded:v8 accountIdentifier:v7];
  }

- (void)accountManager:(id)a3 didUpdateFinancingPlan:(id)a4 oldFinancingPlan:(id)a5 accountIdentifier:(id)a6
{
  if (self->_entitledForAccountUse)
  {
    id v9 = a6;
    id v10 = a5;
    id v11 = a4;
    id v12 = (id)objc_claimAutoreleasedReturnValue(-[PDAccountService remoteObjectProxy](self, "remoteObjectProxy"));
    [v12 accountFinancingPlanUpdated:v11 oldFinancingPlan:v10 accountIdentifier:v9];
  }

- (void)accountManager:(id)a3 didRemoveFinancingPlan:(id)a4 accountIdentifier:(id)a5
{
  if (self->_entitledForAccountUse)
  {
    id v7 = a5;
    id v8 = a4;
    id v9 = (id)objc_claimAutoreleasedReturnValue(-[PDAccountService remoteObjectProxy](self, "remoteObjectProxy"));
    [v9 accountFinancingPlanRemoved:v8 accountIdentifier:v7];
  }

- (void)accountManager:(id)a3 didUpdatePayLaterCardMagnitudes:(id)a4 forAccountIdentifier:(id)a5
{
  if (self->_entitledForAccountUse)
  {
    id v7 = a5;
    id v8 = a4;
    id v9 = (id)objc_claimAutoreleasedReturnValue(-[PDAccountService remoteObjectProxy](self, "remoteObjectProxy"));
    [v9 payLaterCardMagnitudesChanged:v8 forAccountIdentifier:v7];
  }

- (void)accountManager:(id)a3 didUpdatePromotions:(id)a4 oldPromotions:(id)a5 accountIdentifier:(id)a6
{
  if (self->_entitledForAccountUse)
  {
    id v8 = a6;
    id v9 = a4;
    id v10 = (id)objc_claimAutoreleasedReturnValue(-[PDAccountService remoteObjectProxy](self, "remoteObjectProxy"));
    [v10 didUpdateAccountPromotions:v9 accountIdentifier:v8];
  }

- (void)accountManager:(id)a3 didUpdateEnhancedMerchants:(id)a4 accountIdentifier:(id)a5 lastUpdate:(id)a6
{
  if (self->_entitledForAccountUse)
  {
    id v9 = a6;
    id v10 = a5;
    id v11 = a4;
    id v12 = (id)objc_claimAutoreleasedReturnValue(-[PDAccountService remoteObjectProxy](self, "remoteObjectProxy"));
    [v12 didUpdateAccountEnhancedMerchants:v11 accountIdentifier:v10 lastUpdate:v9];
  }

- (void)accountManager:(id)a3 creditRecoveryPaymentPlansChangedForAccountIdentifier:(id)a4
{
  if (self->_entitledForAccountUse)
  {
    id v5 = a4;
    id v6 = (id)objc_claimAutoreleasedReturnValue(-[PDAccountService remoteObjectProxy](self, "remoteObjectProxy"));
    [v6 creditRecoveryPaymentPlansChangedForAccountIdentifier:v5];
  }

- (void)accountManager:(id)a3 didUpdateAppleBalancePromotion:(id)a4 forAccountIdentifier:(id)a5
{
  if (self->_entitledForAccountUse)
  {
    id v7 = a5;
    id v8 = a4;
    id v9 = (id)objc_claimAutoreleasedReturnValue(-[PDAccountService remoteObjectProxy](self, "remoteObjectProxy"));
    [v9 didUpdateAppleBalancePromotion:v8 forAccountIdentifier:v7];
  }

- (void)accountManager:(id)a3 didRemoveAppleBalancePromotionWithUniqueIdentifier:(id)a4 forAccountIdentifier:(id)a5
{
  if (self->_entitledForAccountUse)
  {
    id v7 = a5;
    id v8 = a4;
    id v9 = (id)objc_claimAutoreleasedReturnValue(-[PDAccountService remoteObjectProxy](self, "remoteObjectProxy"));
    [v9 didRemoveAppleBalancePromotionWithUniqueIdentifier:v8 forAccountIdentifier:v7];
  }

- (void)accountManager:(id)a3 didUpdateInStoreTopUpToken:(id)a4 forAccountIdentifier:(id)a5
{
  if (self->_entitledForAccountUse)
  {
    id v7 = a5;
    id v8 = a4;
    id v9 = (id)objc_claimAutoreleasedReturnValue(-[PDAccountService remoteObjectProxy](self, "remoteObjectProxy"));
    [v9 didUpdateInStoreTopUpToken:v8 forAccountIdentifier:v7];
  }

- (PDAccountManager)accountManager
{
  return self->_accountManager;
}

- (PDAccountStatementMetadataProcessor)statementMetadataProcessor
{
  return self->_statementMetadataProcessor;
}

- (void)setStatementMetadataProcessor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end