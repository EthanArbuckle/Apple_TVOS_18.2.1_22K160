@interface PDUserEvaluationEnvironment
+ (BOOL)isTransactionRelevant:(id)a3;
+ (id)_applePayRelevantTransactionTypes;
+ (id)availableKeysAndOperators;
- (BOOL)_hasDefaultCreditAccountTransactionOfTransactionSourceType:(unint64_t)a3;
- (BOOL)_hasPaymentOfferCriteriaOfType:(unint64_t)a3;
- (BOOL)_hasSavingsAccountAccountTransactionOfTransactionType:(int64_t)a3 fundingSourceTypes:(id)a4;
- (BOOL)anyCreditAccountStateIsClosed;
- (BOOL)anyCreditAccountStateIsRemoved;
- (BOOL)defaultCreditAccountHasActiveInstallment;
- (BOOL)defaultCreditAccountHasAutopaySetup;
- (BOOL)defaultCreditAccountHasDisputeOpen;
- (BOOL)defaultCreditAccountHasDynamicSecurityCode;
- (BOOL)defaultCreditAccountHasInAppTransaction;
- (BOOL)defaultCreditAccountHasInStoreTransaction;
- (BOOL)defaultCreditAccountHasMapsBrandIdentifier:(id)a3;
- (BOOL)defaultCreditAccountHasMapsBrandIdentifierLast30Days:(id)a3;
- (BOOL)defaultCreditAccountHasMapsIdentifier:(id)a3;
- (BOOL)defaultCreditAccountHasMapsIdentifierLast30Days:(id)a3;
- (BOOL)defaultCreditAccountHasMerchantIdentifier30Days:(id)a3;
- (BOOL)defaultCreditAccountHasMerchantIdentifier:(id)a3;
- (BOOL)defaultCreditAccountHasPhysicalCard;
- (BOOL)defaultCreditAccountHasPhysicalCardTransaction;
- (BOOL)defaultCreditAccountHasUnderageParticipant;
- (BOOL)defaultCreditAccountHasUsedInstallments;
- (BOOL)defaultCreditAccountHasVirtualCard;
- (BOOL)defaultCreditAccountHasVirtualCardTransaction;
- (BOOL)defaultCreditAccountHasWebTransaction;
- (BOOL)defaultCreditAccountInDisasterRecovery;
- (BOOL)defaultCreditAccountInGrace;
- (BOOL)defaultCreditAccountIsCoOwner;
- (BOOL)defaultCreditAccountIsShared;
- (BOOL)defaultCreditAccountPassIsDefault;
- (BOOL)defaultCreditAccountRequiresDebtCollectionNotices;
- (BOOL)defaultCreditAccountSupportsShowNotifications;
- (BOOL)familyCircleFamilyOrganizer;
- (BOOL)familyCircleHasFamily;
- (BOOL)familyCircleParent;
- (BOOL)hasActivePromotionIdentifier:(id)a3;
- (BOOL)hasActivePromotionIdentifierExpiringSoon:(id)a3;
- (BOOL)hasAppleAccountCardProvisioned;
- (BOOL)hasApplePayTransaction;
- (BOOL)hasDebitCard;
- (BOOL)hasDefaultCreditAccount;
- (BOOL)hasEverMadeIssuerInstallmentTransaction;
- (BOOL)hasEverMadePayWithRewardsTransaction;
- (BOOL)hasEverProvisionedPayLaterPass;
- (BOOL)hasIssuerInstallmentCard;
- (BOOL)hasMapsBrandIdentifier:(id)a3;
- (BOOL)hasMapsIdentifier:(id)a3;
- (BOOL)hasMerchantIdentifier:(id)a3;
- (BOOL)hasPayLaterAccount;
- (BOOL)hasPayLaterPass;
- (BOOL)hasPayWithRewardsCard;
- (BOOL)hasPaymentCard;
- (BOOL)hasPaymentTransaction;
- (BOOL)hasPeerPaymentAccount;
- (BOOL)hasPeerPaymentPassProvisioned;
- (BOOL)hasSavingsAccount;
- (BOOL)hasTransitPassForCurrentLocation;
- (BOOL)hasTransitTransaction;
- (BOOL)hasUnexpiredTransitPassForCurrentLocation;
- (BOOL)isApplePayActive;
- (BOOL)isApplePaySetupAvailable;
- (BOOL)isDeviceRegisteredWithBroker;
- (BOOL)isPrimaryAppleAccountVerified;
- (BOOL)peerPaymentAccountHasBalance;
- (BOOL)peerPaymentAccountHasContactlessTransaction;
- (BOOL)peerPaymentAccountHasSentMoneyToAnyParticipant;
- (BOOL)peerPaymentAccountHasTransaction;
- (BOOL)peerPaymentHasAutoReloadEnabled;
- (BOOL)peerPaymentHasOnlinePurchaseTransaction;
- (BOOL)peerPaymentHasP2PTransaction;
- (BOOL)peerPaymentHasReceivedDeviceTapTransactions;
- (BOOL)peerPaymentHasReceivedP2PPayment;
- (BOOL)peerPaymentHasSentDeviceTapTransaction;
- (BOOL)peerPaymentHasSentP2PPayment;
- (BOOL)peerPaymentHasSetupRecurringP2PPayment;
- (BOOL)peerPaymentHasSetupRecurringP2PPaymentForAnyParticipant;
- (BOOL)savingsAccountHasCashTransferIn;
- (BOOL)savingsAccountHasExternalTransferIn;
- (BOOL)savingsAccountHasExternalTransferOut;
- (CLPlacemark)currentPlacemark;
- (NSDecimalNumber)defaultCreditAccountAvailableCredit;
- (NSDecimalNumber)defaultCreditAccountLifetimeRewards;
- (NSSet)cardTypesWithExpressEnabled;
- (NSSet)defaultCreditAccountSupportedDestinations;
- (NSSet)discoveryCTAsCompleted;
- (NSSet)discoveryCTAsTapped;
- (NSSet)discoveryItemsDismissed;
- (NSSet)discoveryItemsExpanded;
- (NSSet)discoveryItemsWithActionedStatus;
- (NSSet)discoveryItemsWithActiveStatus;
- (NSSet)discoveryItemsWithDismissedStatus;
- (NSSet)discoveryItemsWithWaitingForTriggerStatus;
- (NSSet)enrolledAuthenticationMechanisms;
- (NSSet)expressTransitNetworksForCurrentLocation;
- (NSSet)passStyles;
- (NSSet)secureElementCardTypes;
- (NSSet)sentTransitDCINotifications;
- (NSSet)sentTransitOpenLoopRenotifiedInMarketNotifications;
- (NSSet)sentTransitOpenLoopUpgradeNotifications;
- (NSSet)supportedMarketsForCurrentLocation;
- (NSSet)supportedTransitMarketsForCurrentLocation;
- (NSSet)supportedTransitNetworksForCurrentLocation;
- (NSSet)transitNetworksPresent;
- (NSSet)transitNetworksPresentAndUnexpired;
- (NSSet)unexpiredPassStyles;
- (NSSet)unexpiredSecureElementCardTypes;
- (NSString)currentDefaultCreditApplicationState;
- (NSString)defaultCreditAccountPhysicalAppleCardStatus;
- (NSString)defaultCreditAccountRewardsDestination;
- (NSString)deviceLanguage;
- (PDUserEvaluationEnvironment)init;
- (PDUserEvaluationEnvironment)initWithAccountManager:(id)a3 applyManager:(id)a4 databaseManager:(id)a5 peerPaymentWebServiceCoordinator:(id)a6 paymentWebServiceCoordinator:(id)a7 transitNotificationService:(id)a8 familyCircleManager:(id)a9 expressPassManager:(id)a10 discoveryManager:(id)a11;
- (id)_accountUsersForAccountIdentifier:(id)a3 accessLevel:(unint64_t)a4;
- (id)_creditAccountPhysicalCardsForAccountIdentifier:(id)a3;
- (id)_creditAccountUsersForAccountIdentifier:(id)a3;
- (id)_creditAccountWithIdentifier:(id)a3;
- (id)_defaultCreditAccountAccountStatement;
- (id)_defaultCreditAccountAccountSummary;
- (id)_defaultCreditAccountCreditAccountDetails;
- (id)_defaultCreditAccountSupportedDestinations;
- (id)_familyMemberWithAltDSID:(id)a3;
- (id)_unactivatedPhysicalCardForAltDSID:(id)a3;
- (id)debugDescription;
- (id)discoveryItemStatus;
- (id)enumeratorOfDefaultCreditAccountActivePromotionIdentifiers;
- (id)enumeratorOfDefaultCreditAccountActivePromotionIdentifiersExpiringSoon;
- (id)enumeratorOfDefaultCreditAccountMapsBrandIdentifiers;
- (id)enumeratorOfDefaultCreditAccountMapsBrandIdentifiersLast30Days;
- (id)enumeratorOfDefaultCreditAccountMapsIdentifiers;
- (id)enumeratorOfDefaultCreditAccountMapsIdentifiersLast30Days;
- (id)enumeratorOfDefaultCreditAccountMerchantIdentifiers;
- (id)enumeratorOfDefaultCreditAccountMerchantIdentifiersLast30Days;
- (id)enumeratorOfMapsBrandIdentifiers;
- (id)enumeratorOfMapsIdentifiers;
- (id)enumeratorOfMerchantIdentifiers;
- (id)memberOfDefaultCreditAccountActivePromotionIdentifiers:(id)a3;
- (id)memberOfDefaultCreditAccountActivePromotionIdentifiersExpiringSoon:(id)a3;
- (id)memberOfDefaultCreditAccountMapsBrandIdentifiers:(id)a3;
- (id)memberOfDefaultCreditAccountMapsBrandIdentifiersLast30Days:(id)a3;
- (id)memberOfDefaultCreditAccountMapsIdentifiers:(id)a3;
- (id)memberOfDefaultCreditAccountMapsIdentifiersLast30Days:(id)a3;
- (id)memberOfDefaultCreditAccountMerchantIdentifiers:(id)a3;
- (id)memberOfDefaultCreditAccountMerchantIdentifiersLast30Days:(id)a3;
- (id)memberOfMapsBrandIdentifiers:(id)a3;
- (id)memberOfMapsIdentifiers:(id)a3;
- (id)memberOfMerchantIdentifiers:(id)a3;
- (int64_t)_countOfFinancingPlansOfType:(unint64_t)a3;
- (int64_t)_countOfFinancingPlansWithSate:(unint64_t)a3;
- (int64_t)currentDefaultCreditApplictionDaysSinceLastUpdated;
- (int64_t)daysSinceAppleAccountInStoreTopUp;
- (int64_t)daysSinceLastDeviceTapSendTransaction;
- (int64_t)daysSinceLastPeerPaymentTransaction;
- (int64_t)daysSinceLastTransaction;
- (int64_t)daysSinceOldestCreditCardIngestDate;
- (int64_t)daysSinceOldestPaymentPassIngestDate;
- (int64_t)daysSinceParticipantPeerPaymentAccountIdentifiedDate;
- (int64_t)daysSincePhysicalAppleCardShipmentUpdate;
- (int64_t)defaultCreditAccountAccessLevel;
- (int64_t)defaultCreditAccountBalanceStatus;
- (int64_t)defaultCreditAccountCyclesPastDue;
- (int64_t)defaultCreditAccountDaysSinceCreatedDate;
- (int64_t)defaultCreditAccountDaysSinceDisputeOpened;
- (int64_t)defaultCreditAccountDaysSinceLastTransaction;
- (int64_t)defaultCreditAccountDaysUntilActivePromotionExpires:(id)a3;
- (int64_t)defaultCreditAccountParticipantUsersCount;
- (int64_t)defaultCreditAccountSetupFeatureState;
- (int64_t)defaultCreditAccountState;
- (int64_t)defaultCreditApplicationCount;
- (int64_t)familyCircleAgeCategory;
- (int64_t)familyCircleCurrentUserAge;
- (int64_t)familyCircleDaysSinceNewestJoinedDate;
- (int64_t)familyCircleMembersCount;
- (int64_t)familyCircleMembersUnderAge;
- (int64_t)familyCircleMinimumMemberAge;
- (int64_t)payLaterDaysSinceFirstActiveLoan;
- (int64_t)payLaterNumberOfActiveLoans;
- (int64_t)payLaterNumberOfCanceledLoans;
- (int64_t)payLaterNumberOfCompleteLoans;
- (int64_t)payLaterNumberOfDelinquentLoans;
- (int64_t)payLaterNumberOfLoans;
- (int64_t)payLaterNumberOfPendingLoans;
- (int64_t)peerPaymentAccountBalanceBase;
- (int64_t)peerPaymentAccountDaysSinceCreatedDate;
- (int64_t)peerPaymentAccountDaysSinceIdentifiedDate;
- (int64_t)peerPaymentAccountStage;
- (int64_t)peerPaymentAccountState;
- (int64_t)peerPaymentAccountStateReason;
- (int64_t)peerPaymentDaysSinceLastP2PTransaction;
- (int64_t)peerPaymentDaysSinceLastP2PTransactionToAnyParticipant;
- (int64_t)peerPaymentDaysSinceLastPurchaseTransaction;
- (int64_t)peerPaymentFamilyParticipantAccounts;
- (int64_t)peerPaymentNumberOfDeviceTapTransactions;
- (int64_t)savingsAccountBinnedBalance;
- (int64_t)savingsAccountDaysSinceCreatedDate;
- (unint64_t)countOfDefaultCreditAccountActivePromotionIdentifiers;
- (unint64_t)countOfDefaultCreditAccountActivePromotionIdentifiersExpiringSoon;
- (unint64_t)countOfDefaultCreditAccountMapsBrandIdentifiers;
- (unint64_t)countOfDefaultCreditAccountMapsBrandIdentifiersLast30Days;
- (unint64_t)countOfDefaultCreditAccountMapsIdentifiers;
- (unint64_t)countOfDefaultCreditAccountMapsIdentifiersLast30Days;
- (unint64_t)countOfDefaultCreditAccountMerchantIdentifiers;
- (unint64_t)countOfDefaultCreditAccountMerchantIdentifiersLast30Days;
- (unint64_t)countOfMapsBrandIdentifiers;
- (unint64_t)countOfMapsIdentifiers;
- (unint64_t)countOfMerchantIdentifiers;
- (unint64_t)peerPaymentAccountRole;
- (void)_prefetchDataSources:(id)a3 completion:(id)a4;
- (void)preflightForKeys:(id)a3 completion:(id)a4;
- (void)updateDisputeState;
@end

@implementation PDUserEvaluationEnvironment

+ (id)availableKeysAndOperators
{
  v3[0] = @"currentRegion";
  v3[1] = @"deviceLanguage";
  v4[0] = &off_10068FC48;
  v4[1] = &off_10068FC48;
  v3[2] = @"isApplePayActive";
  v3[3] = @"isApplePaySetupAvailable";
  v4[2] = &off_10068FC60;
  v4[3] = &off_10068FC60;
  v3[4] = @"isPrimaryAppleAccountVerified";
  v3[5] = @"isDeviceRegisteredWithBroker";
  v4[4] = &off_10068FC60;
  v4[5] = &off_10068FC60;
  v3[6] = @"hasPaymentCard";
  v3[7] = @"hasDebitCard";
  v4[6] = &off_10068FC60;
  v4[7] = &off_10068FC60;
  v3[8] = @"hasApplePayTransaction";
  v3[9] = @"daysSinceLastTransaction";
  v4[8] = &off_10068FC60;
  v4[9] = &off_10068FC78;
  v3[10] = @"daysSinceOldestPaymentPassIngestDate";
  v3[11] = @"daysSinceOldestCreditCardIngestDate";
  v4[10] = &off_10068FC78;
  v4[11] = &off_10068FC78;
  v3[12] = @"defaultCreditAccountSetupFeatureState";
  v3[13] = @"hasDefaultCreditAccount";
  v4[12] = &off_10068FC78;
  v4[13] = &off_10068FC60;
  v3[14] = @"defaultCreditAccountState";
  v3[15] = @"defaultCreditAccountLifetimeRewards";
  v4[14] = &off_10068FC78;
  v4[15] = &off_10068FC78;
  v3[16] = @"defaultCreditAccountHasPhysicalCard";
  v3[17] = @"defaultCreditAccountHasVirtualCard";
  v4[16] = &off_10068FC60;
  v4[17] = &off_10068FC60;
  v3[18] = @"defaultCreditAccountHasDynamicSecurityCode";
  v3[19] = @"defaultCreditAccountRequiresDebtCollectionNotices";
  v4[18] = &off_10068FC60;
  v4[19] = &off_10068FC60;
  v3[20] = @"defaultCreditAccountBalanceStatus";
  v3[21] = @"defaultCreditAccountCyclesPastDue";
  v4[20] = &off_10068FC78;
  v4[21] = &off_10068FC78;
  v3[22] = @"defaultCreditAccountInGrace";
  v3[23] = @"defaultCreditAccountInDisasterRecovery";
  v4[22] = &off_10068FC60;
  v4[23] = &off_10068FC60;
  v3[24] = @"defaultCreditAccountHasDisputeOpen";
  v3[25] = @"defaultCreditAccountDaysSinceDisputeOpened";
  v4[24] = &off_10068FC60;
  v4[25] = &off_10068FC78;
  v3[26] = @"defaultCreditAccountAvailableCredit";
  v3[27] = @"defaultCreditAccountSupportsShowNotifications";
  v4[26] = &off_10068FC78;
  v4[27] = &off_10068FC60;
  v3[28] = @"defaultCreditAccountPassIsDefault";
  v3[29] = @"defaultCreditAccountDaysSinceLastTransaction";
  v4[28] = &off_10068FC60;
  v4[29] = &off_10068FC78;
  v3[30] = @"defaultCreditAccountHasInStoreTransaction";
  v3[31] = @"defaultCreditAccountHasInAppTransaction";
  v4[30] = &off_10068FC60;
  v4[31] = &off_10068FC60;
  v3[32] = @"defaultCreditAccountHasWebTransaction";
  v3[33] = @"defaultCreditAccountHasVirtualCardTransaction";
  v4[32] = &off_10068FC60;
  v4[33] = &off_10068FC60;
  v3[34] = @"defaultCreditAccountHasPhysicalCardTransaction";
  v3[35] = @"defaultCreditAccountDaysSinceCreatedDate";
  v4[34] = &off_10068FC60;
  v4[35] = &off_10068FC78;
  v3[36] = @"defaultCreditAccountHasActiveInstallment";
  v3[37] = @"defaultCreditAccountHasUsedInstallments";
  v4[36] = &off_10068FC60;
  v4[37] = &off_10068FC60;
  v3[38] = @"defaultCreditAccountMerchantIdentifiers";
  v3[39] = @"defaultCreditAccountMerchantIdentifiersLast30Days";
  v4[38] = &off_10068FC90;
  v4[39] = &off_10068FC90;
  v3[40] = @"defaultCreditAccountMapsIdentifiers";
  v3[41] = @"defaultCreditAccountMapsIdentifiersLast30Days";
  v4[40] = &off_10068FC90;
  v4[41] = &off_10068FC90;
  v3[42] = @"defaultCreditAccountMapsBrandIdentifiers";
  v3[43] = @"defaultCreditAccountMapsBrandIdentifiersLast30Days";
  v4[42] = &off_10068FC90;
  v4[43] = &off_10068FC90;
  v3[44] = @"defaultCreditAccountSupportedDestinations";
  v3[45] = @"defaultCreditAccountRewardsDestination";
  v4[44] = &off_10068FC90;
  v4[45] = &off_10068FC48;
  v3[46] = @"defaultCreditApplicationCount";
  v3[47] = @"currentDefaultCreditApplictionDaysSinceLastUpdated";
  v4[46] = &off_10068FC78;
  v4[47] = &off_10068FC78;
  v3[48] = @"currentDefaultCreditApplicationState";
  v3[49] = @"defaultCreditAccountIsShared";
  v4[48] = &off_10068FC48;
  v4[49] = &off_10068FC60;
  v3[50] = @"defaultCreditAccountAccessLevel";
  v3[51] = @"defaultCreditAccountIsCoOwner";
  v4[50] = &off_10068FC78;
  v4[51] = &off_10068FC60;
  v3[52] = @"defaultCreditAccountParticipantUsersCount";
  v3[53] = @"defaultCreditAccountHasUnderageParticipant";
  v4[52] = &off_10068FC78;
  v4[53] = &off_10068FC60;
  v3[54] = @"defaultCreditAccountPhysicalAppleCardStatus";
  v3[55] = @"daysSincePhysicalAppleCardShipmentUpdate";
  v4[54] = &off_10068FC48;
  v4[55] = &off_10068FC78;
  v3[56] = @"defaultCreditAccountActivePromotionIdentifiers";
  v3[57] = @"defaultCreditAccountActivePromotionIdentifiersExpiringSoon";
  v4[56] = &off_10068FC90;
  v4[57] = &off_10068FC90;
  v3[58] = @"defaultCreditAccountDaysUntilActivePromotionExpires";
  v3[59] = @"defaultCreditAccountHasAutopaySetup";
  v4[58] = &off_10068FCA8;
  v4[59] = &off_10068FC60;
  v3[60] = @"merchantIdentifiers";
  v3[61] = @"mapsIdentifiers";
  v4[60] = &off_10068FC90;
  v4[61] = &off_10068FC90;
  v3[62] = @"mapsBrandIdentifiers";
  v3[63] = @"hasPaymentTransaction";
  v4[62] = &off_10068FC90;
  v4[63] = &off_10068FC60;
  v3[64] = @"hasTransitTransaction";
  v4[64] = &off_10068FC60;
  v3[65] = @"anyCreditAccountStateIsClosed";
  v4[65] = &off_10068FC60;
  v3[66] = @"anyCreditAccountStateIsRemoved";
  v4[66] = &off_10068FC60;
  v3[67] = @"passStyles";
  v4[67] = &off_10068FC90;
  v3[68] = @"unexpiredPassStyles";
  v4[68] = &off_10068FC90;
  v3[69] = @"secureElementCardTypes";
  v4[69] = &off_10068FC90;
  v3[70] = @"unexpiredSecureElementCardTypes";
  v4[70] = &off_10068FC90;
  v3[71] = @"transitNetworksPresent";
  v4[71] = &off_10068FC90;
  v3[72] = @"transitNetworksPresentAndUnexpired";
  v4[72] = &off_10068FC90;
  v3[73] = @"hasPeerPaymentAccount";
  v4[73] = &off_10068FC60;
  v3[74] = @"hasPeerPaymentPassProvisioned";
  v4[74] = &off_10068FC60;
  v3[75] = @"peerPaymentAccountState";
  v4[75] = &off_10068FC78;
  v3[76] = @"peerPaymentAccountStage";
  v4[76] = &off_10068FC78;
  v3[77] = @"peerPaymentAccountStateReason";
  v4[77] = &off_10068FC78;
  v3[78] = @"peerPaymentAccountHasTransaction";
  v4[78] = &off_10068FC60;
  v3[79] = @"peerPaymentAccountHasContactlessTransaction";
  v4[79] = &off_10068FC60;
  v3[80] = @"peerPaymentHasOnlinePurchaseTransaction";
  v4[80] = &off_10068FC60;
  v3[81] = @"daysSinceLastPeerPaymentTransaction";
  v4[81] = &off_10068FC78;
  v3[82] = @"peerPaymentDaysSinceLastP2PTransaction";
  v4[82] = &off_10068FC78;
  v3[83] = @"peerPaymentDaysSinceLastP2PTransactionToAnyParticipant";
  v4[83] = &off_10068FC78;
  v3[84] = @"peerPaymentAccountHasBalance";
  v4[84] = &off_10068FC60;
  v3[85] = @"peerPaymentAccountBalanceBase";
  v4[85] = &off_10068FC78;
  v3[86] = @"peerPaymentHasP2PTransaction";
  v4[86] = &off_10068FC60;
  v3[87] = @"peerPaymentHasAutoReloadEnabled";
  v4[87] = &off_10068FC60;
  v3[88] = @"peerPaymentHasSetupRecurringP2PPayment";
  v4[88] = &off_10068FC60;
  v3[89] = @"peerPaymentHasSetupRecurringP2PPaymentForAnyParticipant";
  v4[89] = &off_10068FC60;
  v3[90] = @"peerPaymentDaysSinceLastPurchaseTransaction";
  v4[90] = &off_10068FC78;
  v3[91] = @"peerPaymentHasSentP2PPayment";
  v4[91] = &off_10068FC60;
  v3[92] = @"peerPaymentHasReceivedP2PPayment";
  v4[92] = &off_10068FC60;
  v3[93] = @"peerPaymentHasSentDeviceTapTransaction";
  v4[93] = &off_10068FC60;
  v3[94] = @"peerPaymentHasReceivedDeviceTapTransaction";
  v4[94] = &off_10068FC60;
  v3[95] = @"peerPaymentNumberOfDeviceTapTransactions";
  v4[95] = &off_10068FC78;
  v3[96] = @"daysSinceLastDeviceTapSendTransaction";
  v4[96] = &off_10068FC78;
  v3[97] = @"peerPaymentFamilyParticipantAccounts";
  v4[97] = &off_10068FC78;
  v3[98] = @"peerPaymentAccountRole";
  v4[98] = &off_10068FC78;
  v3[99] = @"peerPaymentAccountDaysSinceCreatedDate";
  v4[99] = &off_10068FC78;
  v3[100] = @"peerPaymentAccountDaysSinceIdentifiedDate";
  v4[100] = &off_10068FC78;
  v3[101] = @"daysSinceParticipantPeerPaymentAccountIdentifiedDate";
  v4[101] = &off_10068FC78;
  v3[102] = @"peerPaymentAccountHasSentMoneyToAnyParticipant";
  v4[102] = &off_10068FC60;
  v3[103] = @"familyCircleFamilyOrganizer";
  v4[103] = &off_10068FC60;
  v3[104] = @"familyCircleParent";
  v4[104] = &off_10068FC60;
  v3[105] = @"familyCircleHasFamily";
  v4[105] = &off_10068FC60;
  v3[106] = @"familyCircleCurrentUserAge";
  v4[106] = &off_10068FC78;
  v3[107] = @"familyCircleMembersUnderAge";
  v4[107] = &off_10068FC78;
  v3[108] = @"familyCircleMembersCount";
  v4[108] = &off_10068FC78;
  v3[109] = @"familyCircleDaysSinceNewestJoinedDate";
  v4[109] = &off_10068FC78;
  v3[110] = @"familyCircleMinimumMemberAge";
  v4[110] = &off_10068FC78;
  v3[111] = @"familyCircleAgeCategory";
  v4[111] = &off_10068FC78;
  v3[112] = @"discoveryItemsWithActiveStatus";
  v4[112] = &off_10068FCC0;
  v3[113] = @"discoveryItemsWithActionedStatus";
  v4[113] = &off_10068FCC0;
  v3[114] = @"discoveryItemsWithDismissedStatus";
  v4[114] = &off_10068FCC0;
  v3[115] = @"discoveryItemsWithWaitingForTriggerStatus";
  v4[115] = &off_10068FCC0;
  v3[116] = @"discoveryItemsExpanded";
  v4[116] = &off_10068FCC0;
  v3[117] = @"discoveryItemsDismissed";
  v4[117] = &off_10068FCC0;
  v3[118] = @"discoveryCTAsTapped";
  v4[118] = &off_10068FCC0;
  v3[119] = @"discoveryCTAsCompleted";
  v4[119] = &off_10068FCC0;
  v3[120] = @"sentTransitDCINotifications";
  v4[120] = &off_10068FCC0;
  v3[121] = @"sentTransitOpenLoopUpgradeNotifications";
  v4[121] = &off_10068FCC0;
  v3[122] = @"sentTransitOpenLoopRenotifiedInMarketNotifications";
  v4[122] = &off_10068FCC0;
  v3[123] = @"cardTypesWithExpressEnabled";
  v4[123] = &off_10068FCC0;
  v3[124] = @"supportedMarketsForCurrentLocation";
  v4[124] = &off_10068FCC0;
  v3[125] = @"supportedTransitMarketsForCurrentLocation";
  v4[125] = &off_10068FCC0;
  v3[126] = @"supportedTransitNetworksForCurrentLocation";
  v4[126] = &off_10068FCC0;
  v3[127] = @"expressTransitNetworksForCurrentLocation";
  v4[127] = &off_10068FCC0;
  v3[128] = @"hasTransitPassForCurrentLocation";
  v4[128] = &off_10068FC60;
  v3[129] = @"hasUnexpiredTransitPassForCurrentLocation";
  v4[129] = &off_10068FC60;
  v3[130] = @"currentPlacemark";
  v4[130] = &off_10068FCA8;
  v3[131] = @"currentPlacemark.ISOcountryCode";
  v4[131] = &off_10068FC48;
  v3[132] = @"currentPlacemark.postalCode";
  v4[132] = &off_10068FC48;
  v3[133] = @"currentPlacemark.administrativeArea";
  v4[133] = &off_10068FC48;
  v3[134] = @"currentPlacemark.subAdministrativeArea";
  v4[134] = &off_10068FC48;
  v3[135] = @"currentPlacemark.locality";
  v4[135] = &off_10068FC48;
  v3[136] = @"currentPlacemark.subLocality";
  v4[136] = &off_10068FC48;
  v3[137] = @"hasPayLaterAccount";
  v4[137] = &off_10068FC60;
  v3[138] = @"isPayLaterHidden";
  v4[138] = &off_10068FC60;
  v3[139] = @"hasEverProvisionedPayLaterPass";
  v4[139] = &off_10068FC60;
  v3[140] = @"hasPayLaterPass";
  v4[140] = &off_10068FC60;
  v3[141] = @"payLaterNumberOfLoans";
  v4[141] = &off_10068FC78;
  v3[142] = @"payLaterDaysSinceFirstActiveLoan";
  v4[142] = &off_10068FC78;
  v3[143] = @"payLaterNumberOfActiveLoans";
  v4[143] = &off_10068FC78;
  v3[144] = @"payLaterNumberOfPendingLoans";
  v4[144] = &off_10068FC78;
  v3[145] = @"payLaterNumberOfDelinquentLoans";
  v4[145] = &off_10068FC78;
  v3[146] = @"payLaterNumberOfCanceledLoans";
  v4[146] = &off_10068FC78;
  v3[147] = @"payLaterNumberOfCompleteLoans";
  v4[147] = &off_10068FC78;
  v3[148] = @"hasSavingsAccount";
  v4[148] = &off_10068FC60;
  v3[149] = @"savingsAccountDaysSinceCreatedDate";
  v4[149] = &off_10068FC78;
  v3[150] = @"savingsAccountHasExternalTransferIn";
  v4[150] = &off_10068FC60;
  v3[151] = @"savingsAccountHasExternalTransferOut";
  v4[151] = &off_10068FC60;
  v3[152] = @"savingsAccountHasCashTransferIn";
  v4[152] = &off_10068FC60;
  v3[153] = @"savingsAccountBinnedBalance";
  v4[153] = &off_10068FC78;
  v3[154] = @"enrolledAuthenticationMechanisms";
  v4[154] = &off_10068FC90;
  v3[155] = @"hasIssuerInstallmentCard";
  v4[155] = &off_10068FC60;
  v3[156] = @"hasEverMadeIssuerInstallmentTransaction";
  v4[156] = &off_10068FC60;
  v3[157] = @"hasRewardsCard";
  v4[157] = &off_10068FC60;
  v3[158] = @"hasEverMadeRewardsTransaction";
  v4[158] = &off_10068FC60;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  159LL));
}

+ (BOOL)isTransactionRelevant:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([a1 _applePayRelevantTransactionTypes]);
  id v6 = [v4 transactionType];

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v6));
  unsigned __int8 v8 = [v5 containsObject:v7];

  return v8;
}

+ (id)_applePayRelevantTransactionTypes
{
  return &off_100690F20;
}

- (PDUserEvaluationEnvironment)init
{
  return -[PDUserEvaluationEnvironment initWithAccountManager:applyManager:databaseManager:peerPaymentWebServiceCoordinator:paymentWebServiceCoordinator:transitNotificationService:familyCircleManager:expressPassManager:discoveryManager:]( self,  "initWithAccountManager:applyManager:databaseManager:peerPaymentWebServiceCoordinator:paymentWebServiceCoordin ator:transitNotificationService:familyCircleManager:expressPassManager:discoveryManager:",  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL);
}

- (PDUserEvaluationEnvironment)initWithAccountManager:(id)a3 applyManager:(id)a4 databaseManager:(id)a5 peerPaymentWebServiceCoordinator:(id)a6 paymentWebServiceCoordinator:(id)a7 transitNotificationService:(id)a8 familyCircleManager:(id)a9 expressPassManager:(id)a10 discoveryManager:(id)a11
{
  id v53 = a3;
  id v52 = a4;
  id v51 = a5;
  id v50 = a6;
  id v49 = a7;
  id v48 = a8;
  id v47 = a9;
  id v46 = a10;
  id v45 = a11;
  v54.receiver = self;
  v54.super_class = (Class)&OBJC_CLASS___PDUserEvaluationEnvironment;
  v18 = -[PDUserEvaluationEnvironment init](&v54, "init");
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_accountManager, a3);
    objc_storeStrong((id *)&v19->_applyManager, a4);
    objc_storeStrong((id *)&v19->_databaseManager, a5);
    objc_storeStrong((id *)&v19->_peerPaymentWebServiceCoordinator, a6);
    objc_storeStrong((id *)&v19->_paymentWebServiceCoordinator, a7);
    objc_storeStrong((id *)&v19->_transitNotificationService, a8);
    objc_storeStrong((id *)&v19->_familyCircleManager, a9);
    objc_storeStrong((id *)&v19->_expressPassManager, a10);
    objc_storeStrong((id *)&v19->_discoveryManager, a11);
    v19->_prefetchedFamilyMemberType = -1LL;
    v19->_daysSinceLastPeerPaymentP2PTransaction = -1LL;
    v19->_peerPaymentDaysSinceLastP2PTransactionToAnyParticipant = -1LL;
    v19->_peerPaymentDaysSinceLastPurchaseTransaction = -1LL;
    v19->_familyCircleCurrentUserAge = -1LL;
    v19->_familyCircleMembersUnderAge = -1LL;
    v19->_familyCircleDaysSinceNewestJoinedDate = -1LL;
    v19->_familyCircleMinimumMemberAge = -1LL;
    v19->_daysSinceOldestPaymentPassIngestDate = -1LL;
    v19->_daysSinceOldestCreditCardIngestDate = -1LL;
    v19->_payLaterDaysSinceFirstActiveLoan = -1LL;
    v19->_daysSinceLastDefaultCreditAccountTransaction = -1LL;
    v19->_daysSinceLastApplePayTransaction = -1LL;
    v19->_daysSinceLastPeerPaymentTransaction = -1LL;
    v20 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    queriedMerchantIdentifierPresence = v19->_queriedMerchantIdentifierPresence;
    v19->_queriedMerchantIdentifierPresence = v20;

    v22 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    queriedMapsIdentifierPresence = v19->_queriedMapsIdentifierPresence;
    v19->_queriedMapsIdentifierPresence = v22;

    v24 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    queriedMapsBrandIdentifierPresence = v19->_queriedMapsBrandIdentifierPresence;
    v19->_queriedMapsBrandIdentifierPresence = v24;

    v26 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    queriedDefaultCreditAccountMerchantIdentifierPresence = v19->_queriedDefaultCreditAccountMerchantIdentifierPresence;
    v19->_queriedDefaultCreditAccountMerchantIdentifierPresence = v26;

    v28 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    queriedDefaultCreditAccountMerchantIdentifierLast30DaysPresence = v19->_queriedDefaultCreditAccountMerchantIdentifierLast30DaysPresence;
    v19->_queriedDefaultCreditAccountMerchantIdentifierLast30DaysPresence = v28;

    v30 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    queriedDefaultCreditAccountMapsIdentifierPresence = v19->_queriedDefaultCreditAccountMapsIdentifierPresence;
    v19->_queriedDefaultCreditAccountMapsIdentifierPresence = v30;

    v32 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    queriedDefaultCreditAccountMapsIdentifierLast30DaysPresence = v19->_queriedDefaultCreditAccountMapsIdentifierLast30DaysPresence;
    v19->_queriedDefaultCreditAccountMapsIdentifierLast30DaysPresence = v32;

    v34 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    queriedDefaultCreditAccountMapsBrandIdentifierPresence = v19->_queriedDefaultCreditAccountMapsBrandIdentifierPresence;
    v19->_queriedDefaultCreditAccountMapsBrandIdentifierPresence = v34;

    v36 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    queriedDefaultCreditAccountMapsBrandIdentifierLast30DaysPresence = v19->_queriedDefaultCreditAccountMapsBrandIdentifierLast30DaysPresence;
    v19->_queriedDefaultCreditAccountMapsBrandIdentifierLast30DaysPresence = v36;

    v38 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    queriedDefaultCreditAccountActivePromotionIdentifiersPresence = v19->_queriedDefaultCreditAccountActivePromotionIdentifiersPresence;
    v19->_queriedDefaultCreditAccountActivePromotionIdentifiersPresence = v38;

    v40 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    queriedDefaultCreditAccountActivePromotionIdentifiersExpiringSoonPresence = v19->_queriedDefaultCreditAccountActivePromotionIdentifiersExpiringSoonPresence;
    v19->_queriedDefaultCreditAccountActivePromotionIdentifiersExpiringSoonPresence = v40;

    v42 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    queriedDefaultCreditAccountDaysUntilActivePromotionExpires = v19->_queriedDefaultCreditAccountDaysUntilActivePromotionExpires;
    v19->_queriedDefaultCreditAccountDaysUntilActivePromotionExpires = v42;

    v19->_peerPaymentDaysSinceLastDeviceTapSendTransaction = -1LL;
    *(_OWORD *)&v19->_defaultPhysicalCardStatus = xmmword_1004D6900;
    v19->_rulesNeedLocation = -[PDDiscoveryManager rulesNeedLocation](v19->_discoveryManager, "rulesNeedLocation");
    v19->_rulesNeedPlacemark = -[PDDiscoveryManager rulesNeedPlacemark](v19->_discoveryManager, "rulesNeedPlacemark");
  }

  return v19;
}

- (NSString)deviceLanguage
{
  return (NSString *)+[NSLocale pk_deviceLanguage](&OBJC_CLASS___NSLocale, "pk_deviceLanguage");
}

- (BOOL)isApplePayActive
{
  if (self->_hasQueriedApplePayActive) {
    return self->_isApplePayActive;
  }
  unsigned __int8 v4 = -[PDDatabaseManager passExistsWithPassType:](self->_databaseManager, "passExistsWithPassType:", 1LL);
  BOOL result = v4 & -[PDDatabaseManager hasAnyTransactions](self->_databaseManager, "hasAnyTransactions");
  self->_isApplePayActive = result;
  self->_hasQueriedApplePayActive = 1;
  return result;
}

- (BOOL)isApplePaySetupAvailable
{
  if (self->_hasQueriedApplePaySetUpState) {
    return self->_isApplePaySetupAvailable;
  }
  else {
    LOBYTE(v4) = 0;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue( -[PDPaymentWebServiceCoordinator sharedWebService]( self->_paymentWebServiceCoordinator,  "sharedWebService"));
  id v6 = [v5 paymentSetupSupportedInRegion];

  if (v6) {
    BOOL result = v4;
  }
  else {
    BOOL result = 0;
  }
  self->_isApplePaySetupAvailable = result;
  self->_hasQueriedApplePaySetUpState = 1;
  return result;
}

- (BOOL)isPrimaryAppleAccountVerified
{
  return PKHasVerifiedPrimaryAppleAccount(self, a2) != 0;
}

- (BOOL)isDeviceRegisteredWithBroker
{
  if (!self->_hasQueriedBrokerRegistration)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue( -[PDPaymentWebServiceCoordinator sharedWebService]( self->_paymentWebServiceCoordinator,  "sharedWebService"));
    int v4 = (void *)objc_claimAutoreleasedReturnValue([v3 context]);
    self->_isBrokerRegistered = [v4 isRegistered];

    self->_hasQueriedBrokerRegistration = 1;
  }

  return self->_isBrokerRegistered;
}

- (BOOL)hasPaymentCard
{
  if (self->_hasQueriedPaymentCards) {
    return self->_hasPaymentCard;
  }
  BOOL result = -[PDDatabaseManager passExistsWithPassType:](self->_databaseManager, "passExistsWithPassType:", 1LL);
  self->_hasPaymentCard = result;
  self->_hasQueriedPaymentCards = 1;
  return result;
}

- (BOOL)hasDebitCard
{
  if (self->_hasQueriedDebitCards) {
    return self->_hasDebitCard;
  }
  BOOL result = -[PDDatabaseManager passExistsWithPaymentType:](self->_databaseManager, "passExistsWithPaymentType:", 1LL);
  self->_hasDebitCard = result;
  self->_hasQueriedDebitCards = 1;
  return result;
}

- (BOOL)hasApplePayTransaction
{
  if (!self->_hasQueriedApplePayTransactions)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue( +[PDUserEvaluationEnvironment _applePayRelevantTransactionTypes]( &OBJC_CLASS___PDUserEvaluationEnvironment,  "_applePayRelevantTransactionTypes"));
    int v4 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager transactionsOfTypes:withTransactionSource:withBackingData:limit:]( self->_databaseManager,  "transactionsOfTypes:withTransactionSource:withBackingData:limit:",  v3,  0LL,  0LL,  1LL));
    v5 = (void *)objc_claimAutoreleasedReturnValue([v4 firstObject]);
    self->_hasApplePayTransaction = v5 != 0LL;

    self->_hasQueriedApplePayTransactions = 1;
  }

  return self->_hasApplePayTransaction;
}

- (int64_t)daysSinceLastTransaction
{
  if (!self->_hasQueriedDaysSinceLastTransaction)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue( +[PDUserEvaluationEnvironment _applePayRelevantTransactionTypes]( &OBJC_CLASS___PDUserEvaluationEnvironment,  "_applePayRelevantTransactionTypes"));
    int v4 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager transactionsOfTypes:withTransactionSource:withBackingData:limit:]( self->_databaseManager,  "transactionsOfTypes:withTransactionSource:withBackingData:limit:",  v3,  0LL,  0LL,  1LL));
    v5 = (void *)objc_claimAutoreleasedReturnValue([v4 firstObject]);
    if (v5)
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      v7 = (void *)objc_claimAutoreleasedReturnValue([v5 transactionDate]);
      [v6 timeIntervalSinceDate:v7];
      double v9 = v8;

      self->_daysSinceLastApplePayTransaction = vcvtmd_s64_f64(v9 / 86400.0);
    }

    self->_hasQueriedDaysSinceLastTransaction = 1;
  }

  return self->_daysSinceLastApplePayTransaction;
}

- (int64_t)daysSinceOldestPaymentPassIngestDate
{
  if (!self->_hasQueriedDaysSinceOldestPaymentPassIngestDate)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[PDDatabaseManager passesOfType:](self->_databaseManager, "passesOfType:", 1LL));
    int v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectsPassingTest:&stru_100644108]);

    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    id v5 = v4;
    id v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v6)
    {
      id v7 = v6;
      double v8 = 0LL;
      uint64_t v9 = *(void *)v18;
      do
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(v5);
          }
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * (void)i), "ingestedDate", (void)v17));
          if (v11 && (!v8 || [v8 compare:v11] == (id)1))
          {
            id v12 = v11;

            double v8 = v12;
          }
        }

        id v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }

      while (v7);

      if (v8)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
        [v13 timeIntervalSinceDate:v8];
        double v15 = v14;

        self->_daysSinceOldestPaymentPassIngestDate = vcvtmd_s64_f64(v15 / 86400.0);
      }
    }

    else
    {

      double v8 = 0LL;
    }

    self->_hasQueriedDaysSinceOldestPaymentPassIngestDate = 1;
  }

  return self->_daysSinceOldestPaymentPassIngestDate;
}

- (int64_t)daysSinceOldestCreditCardIngestDate
{
  if (!self->_hasQueriedDaysSinceOldestCreditCardIngestDate)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[PKAccount associatedPassUniqueID](self->_prefetchedDefaultCreditAccount, "associatedPassUniqueID"));
    int v4 = (void *)objc_claimAutoreleasedReturnValue(-[PDDatabaseManager passesOfType:](self->_databaseManager, "passesOfType:", 1LL));
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_1000FF328;
    v23[3] = &unk_100644130;
    id v5 = v3;
    id v24 = v5;
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectsPassingTest:v23]);

    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    id v7 = v6;
    id v8 = [v7 countByEnumeratingWithState:&v19 objects:v25 count:16];
    if (v8)
    {
      id v9 = v8;
      v10 = 0LL;
      uint64_t v11 = *(void *)v20;
      do
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v7);
          }
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * (void)i), "ingestedDate", (void)v19));
          if (v13 && (!v10 || [v10 compare:v13] == (id)1))
          {
            id v14 = v13;

            v10 = v14;
          }
        }

        id v9 = [v7 countByEnumeratingWithState:&v19 objects:v25 count:16];
      }

      while (v9);

      if (v10)
      {
        double v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
        [v15 timeIntervalSinceDate:v10];
        double v17 = v16;

        self->_daysSinceOldestPaymentPassIngestDate = vcvtmd_s64_f64(v17 / 86400.0);
      }
    }

    else
    {

      v10 = 0LL;
    }

    self->_hasQueriedDaysSinceOldestPaymentPassIngestDate = 1;
  }

  return self->_daysSinceOldestPaymentPassIngestDate;
}

- (int64_t)defaultCreditAccountSetupFeatureState
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  int64_t v2 = -1LL;
  uint64_t v9 = -1LL;
  prefetchedSetupFeatures = self->_prefetchedSetupFeatures;
  if (prefetchedSetupFeatures)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_1000FF494;
    v5[3] = &unk_100644158;
    v5[4] = &v6;
    -[NSArray enumerateObjectsUsingBlock:](prefetchedSetupFeatures, "enumerateObjectsUsingBlock:", v5);
    int64_t v2 = v7[3];
  }

  _Block_object_dispose(&v6, 8);
  return v2;
}

- (BOOL)hasDefaultCreditAccount
{
  return self->_prefetchedDefaultCreditAccount != 0LL;
}

- (int64_t)defaultCreditAccountState
{
  int64_t result = (int64_t)self->_prefetchedDefaultCreditAccount;
  if (result) {
    return (int64_t)[(id)result state];
  }
  return result;
}

- (NSDecimalNumber)defaultCreditAccountLifetimeRewards
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDecimalNumber zero](&OBJC_CLASS___NSDecimalNumber, "zero"));
  int v4 = (void *)objc_claimAutoreleasedReturnValue( -[PDUserEvaluationEnvironment _defaultCreditAccountAccountStatement]( self,  "_defaultCreditAccountAccountStatement"));
  id v5 = v4;
  if (v4)
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v4 rewardsLifetime]);

    v3 = (void *)v6;
  }

  return (NSDecimalNumber *)v3;
}

- (BOOL)defaultCreditAccountHasPhysicalCard
{
  prefetchedDefaultCreditAccount = self->_prefetchedDefaultCreditAccount;
  if (!prefetchedDefaultCreditAccount) {
    return 0;
  }
  int v4 = (void *)objc_claimAutoreleasedReturnValue(-[PKAccount accountIdentifier](prefetchedDefaultCreditAccount, "accountIdentifier"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[PDUserEvaluationEnvironment _creditAccountPhysicalCardsForAccountIdentifier:]( self,  "_creditAccountPhysicalCardsForAccountIdentifier:",  v4));

  if (v5) {
    BOOL v6 = [v5 count] != 0;
  }
  else {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)defaultCreditAccountHasVirtualCard
{
  int64_t v2 = (void *)objc_claimAutoreleasedReturnValue( -[PDUserEvaluationEnvironment _defaultCreditAccountCreditAccountDetails]( self,  "_defaultCreditAccountCreditAccountDetails"));
  v3 = v2;
  if (v2)
  {
    int v4 = (void *)objc_claimAutoreleasedReturnValue([v2 virtualCards]);
    id v5 = v4;
    if (v4) {
      BOOL v6 = [v4 count] != 0;
    }
    else {
      BOOL v6 = 0;
    }
  }

  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)defaultCreditAccountHasDynamicSecurityCode
{
  int64_t v2 = (void *)objc_claimAutoreleasedReturnValue( -[PDUserEvaluationEnvironment _defaultCreditAccountCreditAccountDetails]( self,  "_defaultCreditAccountCreditAccountDetails"));
  v3 = v2;
  if (v2)
  {
    int v4 = (void *)objc_claimAutoreleasedReturnValue([v2 virtualCards]);
    id v5 = v4;
    if (v4 && [v4 count])
    {
      BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v5 anyObject]);
      unsigned __int8 v7 = [v6 hasDynamicSecurityCode];
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

- (BOOL)defaultCreditAccountRequiresDebtCollectionNotices
{
  int64_t v2 = (void *)objc_claimAutoreleasedReturnValue( -[PDUserEvaluationEnvironment _defaultCreditAccountAccountSummary]( self,  "_defaultCreditAccountAccountSummary"));
  v3 = v2;
  if (v2) {
    unsigned __int8 v4 = [v2 requiresDebtCollectionNotices];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (int64_t)defaultCreditAccountBalanceStatus
{
  int64_t v2 = (void *)objc_claimAutoreleasedReturnValue( -[PDUserEvaluationEnvironment _defaultCreditAccountAccountSummary]( self,  "_defaultCreditAccountAccountSummary"));
  v3 = v2;
  if (v2) {
    id v4 = [v2 balanceStatus];
  }
  else {
    id v4 = 0LL;
  }

  return (int64_t)v4;
}

- (int64_t)defaultCreditAccountCyclesPastDue
{
  int64_t v2 = (void *)objc_claimAutoreleasedReturnValue( -[PDUserEvaluationEnvironment _defaultCreditAccountAccountSummary]( self,  "_defaultCreditAccountAccountSummary"));
  v3 = v2;
  if (v2) {
    id v4 = [v2 cyclesPastDue];
  }
  else {
    id v4 = 0LL;
  }

  return (int64_t)v4;
}

- (BOOL)defaultCreditAccountInGrace
{
  int64_t v2 = (void *)objc_claimAutoreleasedReturnValue( -[PDUserEvaluationEnvironment _defaultCreditAccountCreditAccountDetails]( self,  "_defaultCreditAccountCreditAccountDetails"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 accountSummary]);
  id v4 = v3;
  if (v3) {
    unsigned __int8 v5 = [v3 inGrace];
  }
  else {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (BOOL)defaultCreditAccountInDisasterRecovery
{
  prefetchedDefaultCreditAccount = self->_prefetchedDefaultCreditAccount;
  if (prefetchedDefaultCreditAccount) {
    LOBYTE(prefetchedDefaultCreditAccount) = -[PKAccount stateReason](prefetchedDefaultCreditAccount, "stateReason") == (id)2;
  }
  return (char)prefetchedDefaultCreditAccount;
}

- (void)updateDisputeState
{
  if (!self->_hasQueriedForDisputeState)
  {
    self->_defaultCreditAccountHasDisputeOpen = 0;
    self->_defaultCreditAccountDaysSinceDisputeOpened = -1LL;
    if (self->_prefetchedDefaultCreditAccount)
    {
      id v8 = (id)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager transactionsForAdjustmentType:limit:]( self->_databaseManager,  "transactionsForAdjustmentType:limit:",  1LL,  1LL));
      if ([v8 count])
      {
        self->_defaultCreditAccountHasDisputeOpen = 1;
        v3 = (void *)objc_claimAutoreleasedReturnValue([v8 firstObject]);
        id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 transactionDate]);
        unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
        [v5 timeIntervalSinceDate:v4];
        double v7 = v6;

        self->_defaultCreditAccountDaysSinceDisputeOpened = vcvtmd_s64_f64(v7 / 86400.0);
      }

      else
      {
        self->_defaultCreditAccountHasDisputeOpen = 0;
        self->_defaultCreditAccountDaysSinceDisputeOpened = -1LL;
      }

      self->_hasQueriedForDisputeState = 1;
    }
  }

- (BOOL)defaultCreditAccountHasDisputeOpen
{
  return self->_defaultCreditAccountHasDisputeOpen;
}

- (int64_t)defaultCreditAccountDaysSinceDisputeOpened
{
  return self->_defaultCreditAccountDaysSinceDisputeOpened;
}

- (NSDecimalNumber)defaultCreditAccountAvailableCredit
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDecimalNumber zero](&OBJC_CLASS___NSDecimalNumber, "zero"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[PDUserEvaluationEnvironment _defaultCreditAccountAccountSummary]( self,  "_defaultCreditAccountAccountSummary"));
  unsigned __int8 v5 = v4;
  if (v4)
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v4 availableCredit]);

    v3 = (void *)v6;
  }

  return (NSDecimalNumber *)v3;
}

- (BOOL)defaultCreditAccountSupportsShowNotifications
{
  prefetchedDefaultCreditAccount = self->_prefetchedDefaultCreditAccount;
  if (prefetchedDefaultCreditAccount) {
    LOBYTE(prefetchedDefaultCreditAccount) = -[PKAccount supportsShowNotifications]( prefetchedDefaultCreditAccount,  "supportsShowNotifications");
  }
  return (char)prefetchedDefaultCreditAccount;
}

- (BOOL)defaultCreditAccountPassIsDefault
{
  prefetchedDefaultCreditAccount = self->_prefetchedDefaultCreditAccount;
  if (!prefetchedDefaultCreditAccount) {
    return 0;
  }
  if (!self->_defaultPassUniqueIdentifier)
  {
    uint64_t v4 = PDUserSpecifiedDefaultPaymentPassUniqueIdentifier();
    unsigned __int8 v5 = (NSString *)objc_claimAutoreleasedReturnValue(v4);
    defaultPassUniqueIdentifier = self->_defaultPassUniqueIdentifier;
    self->_defaultPassUniqueIdentifier = v5;

    prefetchedDefaultCreditAccount = self->_prefetchedDefaultCreditAccount;
  }

  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[PKAccount associatedPassUniqueID](prefetchedDefaultCreditAccount, "associatedPassUniqueID"));
  id v8 = self->_defaultPassUniqueIdentifier;
  uint64_t v9 = v7;
  v10 = v8;
  uint64_t v11 = v10;
  if (v9 == v10)
  {
    unsigned __int8 v12 = 1;
  }

  else
  {
    unsigned __int8 v12 = 0;
    if (v9 && v10) {
      unsigned __int8 v12 = -[NSString isEqualToString:](v9, "isEqualToString:", v10);
    }
  }

  return v12;
}

- (int64_t)defaultCreditAccountDaysSinceLastTransaction
{
  int64_t result = self->_daysSinceLastDefaultCreditAccountTransaction;
  if (result < 0 && self->_prefetchedDefaultCreditAccount)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[PKAccount associatedPassUniqueID](self->_prefetchedDefaultCreditAccount, "associatedPassUniqueID"));
    unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager transactionSourceIdentifiersForPassUniqueIdentifier:]( self->_databaseManager,  "transactionSourceIdentifiersForPassUniqueIdentifier:",  v4));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager transactionsForTransactionSourceIdentifiers:withTransactionSource:withBackingData:limit:]( self->_databaseManager,  "transactionsForTransactionSourceIdentifiers:withTransactionSource:withBackingData:limit:",  v5,  0LL,  0LL,  1LL));
    if ([v6 count] == (id)1)
    {
      double v7 = (void *)objc_claimAutoreleasedReturnValue([v6 anyObject]);
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 transactionDate]);
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      [v9 timeIntervalSinceDate:v8];
      double v11 = v10;

      self->_daysSinceLastDefaultCreditAccountTransaction = vcvtmd_s64_f64(v11 / 86400.0);
    }

    return self->_daysSinceLastDefaultCreditAccountTransaction;
  }

  return result;
}

- (BOOL)defaultCreditAccountHasInStoreTransaction
{
  if (self->_hasQueriedDefaultCreditAccountInStoreTransaction) {
    return self->_hasDefaultCreditAccountInStoreTransaction;
  }
  BOOL result = -[PDUserEvaluationEnvironment _hasDefaultCreditAccountTransactionOfTransactionSourceType:]( self,  "_hasDefaultCreditAccountTransactionOfTransactionSourceType:",  1LL);
  self->_hasDefaultCreditAccountInStoreTransaction = result;
  self->_hasQueriedDefaultCreditAccountInStoreTransaction = 1;
  return result;
}

- (BOOL)defaultCreditAccountHasInAppTransaction
{
  if (self->_hasQueriedDefaultCreditAccountInAppTransaction) {
    return self->_hasDefaultCreditAccountInAppTransaction;
  }
  BOOL result = -[PDUserEvaluationEnvironment _hasDefaultCreditAccountTransactionOfTransactionSourceType:]( self,  "_hasDefaultCreditAccountTransactionOfTransactionSourceType:",  2LL);
  self->_hasDefaultCreditAccountInAppTransaction = result;
  self->_hasQueriedDefaultCreditAccountInAppTransaction = 1;
  return result;
}

- (BOOL)defaultCreditAccountHasWebTransaction
{
  if (self->_hasQueriedDefaultCreditAccountWebTransaction) {
    return self->_hasDefaultCreditAccountWebTransaction;
  }
  BOOL result = -[PDUserEvaluationEnvironment _hasDefaultCreditAccountTransactionOfTransactionSourceType:]( self,  "_hasDefaultCreditAccountTransactionOfTransactionSourceType:",  3LL);
  self->_hasDefaultCreditAccountWebTransaction = result;
  self->_hasQueriedDefaultCreditAccountWebTransaction = 1;
  return result;
}

- (BOOL)defaultCreditAccountHasVirtualCardTransaction
{
  if (self->_hasQueriedDefaultCreditAccountVirtualCardTransaction) {
    return self->_hasDefaultCreditAccountVirtualCardTransaction;
  }
  BOOL result = -[PDUserEvaluationEnvironment _hasDefaultCreditAccountTransactionOfTransactionSourceType:]( self,  "_hasDefaultCreditAccountTransactionOfTransactionSourceType:",  6LL);
  self->_hasDefaultCreditAccountVirtualCardTransaction = result;
  self->_hasQueriedDefaultCreditAccountVirtualCardTransaction = 1;
  return result;
}

- (BOOL)defaultCreditAccountHasPhysicalCardTransaction
{
  if (self->_hasQueriedDefaultCreditAccountPhysicalCardTransaction) {
    return self->_hasDefaultCreditAccountPhysicalCardTransaction;
  }
  BOOL result = -[PDUserEvaluationEnvironment _hasDefaultCreditAccountTransactionOfTransactionSourceType:]( self,  "_hasDefaultCreditAccountTransactionOfTransactionSourceType:",  5LL);
  self->_hasDefaultCreditAccountPhysicalCardTransaction = result;
  self->_hasQueriedDefaultCreditAccountPhysicalCardTransaction = 1;
  return result;
}

- (int64_t)defaultCreditAccountDaysSinceCreatedDate
{
  prefetchedDefaultCreditAccount = self->_prefetchedDefaultCreditAccount;
  if (!prefetchedDefaultCreditAccount) {
    return -1LL;
  }
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( -[PKAccount previousAccountIdentifiers]( self->_prefetchedDefaultCreditAccount,  "previousAccountIdentifiers"));
  id v5 = [v4 count];

  if (!v5) {
    goto LABEL_5;
  }
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( -[PKAccount previousAccountIdentifiers]( self->_prefetchedDefaultCreditAccount,  "previousAccountIdentifiers"));
  double v7 = (void *)objc_claimAutoreleasedReturnValue([v6 anyObject]);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PDUserEvaluationEnvironment _creditAccountWithIdentifier:](self, "_creditAccountWithIdentifier:", v7));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 creditDetails]);
  double v10 = (void *)objc_claimAutoreleasedReturnValue([v9 createdDate]);

  if (!v10)
  {
LABEL_5:
    double v11 = (void *)objc_claimAutoreleasedReturnValue(-[PKAccount creditDetails](self->_prefetchedDefaultCreditAccount, "creditDetails"));
    double v10 = (void *)objc_claimAutoreleasedReturnValue([v11 createdDate]);
  }

  unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v12 timeIntervalSinceDate:v10];
  double v14 = v13;

  int64_t v15 = vcvtmd_s64_f64(v14 / 86400.0);
  return v15;
}

- (BOOL)defaultCreditAccountHasActiveInstallment
{
  int64_t v2 = (void *)objc_claimAutoreleasedReturnValue( -[PDUserEvaluationEnvironment _defaultCreditAccountCreditAccountDetails]( self,  "_defaultCreditAccountCreditAccountDetails"));
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "installmentPlans", 0));
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        if ([*(id *)(*((void *)&v8 + 1) + 8 * (void)i) state] == (id)2)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }

      id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }

- (NSSet)defaultCreditAccountSupportedDestinations
{
  return (NSSet *)-[PDUserEvaluationEnvironment _defaultCreditAccountSupportedDestinations]( self,  "_defaultCreditAccountSupportedDestinations");
}

- (NSString)defaultCreditAccountRewardsDestination
{
  int64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[PKAccount creditDetails](self->_prefetchedDefaultCreditAccount, "creditDetails"));
  uint64_t v3 = PKAccountRewardRedemptionTypeToString([v2 rewardsDestination]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  return (NSString *)v4;
}

- (BOOL)defaultCreditAccountHasUsedInstallments
{
  int64_t v2 = (void *)objc_claimAutoreleasedReturnValue( -[PDUserEvaluationEnvironment _defaultCreditAccountCreditAccountDetails]( self,  "_defaultCreditAccountCreditAccountDetails"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 installmentPlans]);
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (BOOL)defaultCreditAccountHasAutopaySetup
{
  uint64_t v3 = objc_claimAutoreleasedReturnValue(-[PKAccount accountIdentifier](self->_prefetchedDefaultCreditAccount, "accountIdentifier"));
  BOOL v4 = (void *)v3;
  if (!self->_hasQueriedDefaultCreditAccountHasAutopaySetup && v3 != 0)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager scheduledPaymentsWithAccountIdentifier:includeFailedRecurringPayments:]( self->_databaseManager,  "scheduledPaymentsWithAccountIdentifier:includeFailedRecurringPayments:",  v3,  0LL));
    self->_BOOL hasDefaultCreditAccountAutopaySetup = objc_msgSend( v6,  "pk_containsObjectPassingTest:",  &stru_100644198);
    self->_hasQueriedDefaultCreditAccountHasAutopaySetup = 1;
  }

  BOOL hasDefaultCreditAccountAutopaySetup = self->_hasDefaultCreditAccountAutopaySetup;

  return hasDefaultCreditAccountAutopaySetup;
}

- (id)memberOfDefaultCreditAccountMerchantIdentifiers:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_queriedDefaultCreditAccountMerchantIdentifierPresence,  "objectForKeyedSubscript:",  v4));
  if (!v5)
  {
    prefetchedDefaultCreditAccount = self->_prefetchedDefaultCreditAccount;
    if (prefetchedDefaultCreditAccount)
    {
      double v7 = (void *)objc_claimAutoreleasedReturnValue(-[PKAccount associatedPassUniqueID](prefetchedDefaultCreditAccount, "associatedPassUniqueID"));
      databaseManager = self->_databaseManager;
      __int128 v9 = -[NSSet initWithObjects:](objc_alloc(&OBJC_CLASS___NSSet), "initWithObjects:", v4, 0LL);
      BOOL v10 = -[PDDatabaseManager hasAnyTransactionsWithMerchantIdentifiers:forPassUniqueIdentifier:]( databaseManager,  "hasAnyTransactionsWithMerchantIdentifiers:forPassUniqueIdentifier:",  v9,  v7);

      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v10));
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_queriedDefaultCreditAccountMerchantIdentifierPresence,  "setObject:forKeyedSubscript:",  v5,  v4);
    }

    else
    {
      uint64_t v5 = 0LL;
    }
  }

  else {
    id v11 = 0LL;
  }

  return v11;
}

- (unint64_t)countOfDefaultCreditAccountMerchantIdentifiers
{
  return (unint64_t)-[NSMutableDictionary count]( self->_queriedDefaultCreditAccountMerchantIdentifierPresence,  "count");
}

- (id)enumeratorOfDefaultCreditAccountMerchantIdentifiers
{
  queriedDefaultCreditAccountMerchantIdentifierPresence = self->_queriedDefaultCreditAccountMerchantIdentifierPresence;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary allKeysForObject:]( queriedDefaultCreditAccountMerchantIdentifierPresence,  "allKeysForObject:",  v3));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectEnumerator]);

  return v5;
}

- (id)memberOfDefaultCreditAccountMerchantIdentifiersLast30Days:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_queriedDefaultCreditAccountMerchantIdentifierLast30DaysPresence,  "objectForKeyedSubscript:",  v4));
  if (!v5)
  {
    prefetchedDefaultCreditAccount = self->_prefetchedDefaultCreditAccount;
    if (prefetchedDefaultCreditAccount)
    {
      double v7 = (void *)objc_claimAutoreleasedReturnValue(-[PKAccount associatedPassUniqueID](prefetchedDefaultCreditAccount, "associatedPassUniqueID"));
      __int128 v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  -2592000.0));
      databaseManager = self->_databaseManager;
      BOOL v10 = -[NSSet initWithObjects:](objc_alloc(&OBJC_CLASS___NSSet), "initWithObjects:", v4, 0LL);
      id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      BOOL v12 = -[PDDatabaseManager hasAnyTransactionsWithMerchantIdentifiers:forPassUniqueIdentifier:startDate:endDate:]( databaseManager,  "hasAnyTransactionsWithMerchantIdentifiers:forPassUniqueIdentifier:startDate:endDate:",  v10,  v7,  v8,  v11);

      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v12));
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_queriedDefaultCreditAccountMerchantIdentifierLast30DaysPresence,  "setObject:forKeyedSubscript:",  v5,  v4);
    }

    else
    {
      uint64_t v5 = 0LL;
    }
  }

  else {
    id v13 = 0LL;
  }

  return v13;
}

- (unint64_t)countOfDefaultCreditAccountMerchantIdentifiersLast30Days
{
  return (unint64_t)-[NSMutableDictionary count]( self->_queriedDefaultCreditAccountMerchantIdentifierLast30DaysPresence,  "count");
}

- (id)enumeratorOfDefaultCreditAccountMerchantIdentifiersLast30Days
{
  queriedDefaultCreditAccountMerchantIdentifierLast30DaysPresence = self->_queriedDefaultCreditAccountMerchantIdentifierLast30DaysPresence;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary allKeysForObject:]( queriedDefaultCreditAccountMerchantIdentifierLast30DaysPresence,  "allKeysForObject:",  v3));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectEnumerator]);

  return v5;
}

- (id)memberOfDefaultCreditAccountMapsIdentifiers:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_queriedDefaultCreditAccountMapsIdentifierPresence,  "objectForKeyedSubscript:",  v4));
  if (!v5)
  {
    prefetchedDefaultCreditAccount = self->_prefetchedDefaultCreditAccount;
    if (prefetchedDefaultCreditAccount)
    {
      double v7 = (void *)objc_claimAutoreleasedReturnValue(-[PKAccount associatedPassUniqueID](prefetchedDefaultCreditAccount, "associatedPassUniqueID"));
      databaseManager = self->_databaseManager;
      __int128 v9 = -[NSSet initWithObjects:](objc_alloc(&OBJC_CLASS___NSSet), "initWithObjects:", v4, 0LL);
      BOOL v10 = -[PDDatabaseManager hasAnyTransactionsWithMapsIdentifiers:forPassUniqueIdentifier:]( databaseManager,  "hasAnyTransactionsWithMapsIdentifiers:forPassUniqueIdentifier:",  v9,  v7);

      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v10));
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_queriedDefaultCreditAccountMapsIdentifierPresence,  "setObject:forKeyedSubscript:",  v5,  v4);
    }

    else
    {
      uint64_t v5 = 0LL;
    }
  }

  else {
    id v11 = 0LL;
  }

  return v11;
}

- (unint64_t)countOfDefaultCreditAccountMapsIdentifiers
{
  return (unint64_t)-[NSMutableDictionary count]( self->_queriedDefaultCreditAccountMapsIdentifierPresence,  "count");
}

- (id)enumeratorOfDefaultCreditAccountMapsIdentifiers
{
  queriedDefaultCreditAccountMapsIdentifierPresence = self->_queriedDefaultCreditAccountMapsIdentifierPresence;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary allKeysForObject:]( queriedDefaultCreditAccountMapsIdentifierPresence,  "allKeysForObject:",  v3));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectEnumerator]);

  return v5;
}

- (id)memberOfDefaultCreditAccountMapsIdentifiersLast30Days:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_queriedDefaultCreditAccountMapsIdentifierLast30DaysPresence,  "objectForKeyedSubscript:",  v4));
  if (!v5)
  {
    prefetchedDefaultCreditAccount = self->_prefetchedDefaultCreditAccount;
    if (prefetchedDefaultCreditAccount)
    {
      double v7 = (void *)objc_claimAutoreleasedReturnValue(-[PKAccount associatedPassUniqueID](prefetchedDefaultCreditAccount, "associatedPassUniqueID"));
      __int128 v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  -2592000.0));
      databaseManager = self->_databaseManager;
      BOOL v10 = -[NSSet initWithObjects:](objc_alloc(&OBJC_CLASS___NSSet), "initWithObjects:", v4, 0LL);
      id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      BOOL v12 = -[PDDatabaseManager hasAnyTransactionsWithMapsIdentifiers:forPassUniqueIdentifier:startDate:endDate:]( databaseManager,  "hasAnyTransactionsWithMapsIdentifiers:forPassUniqueIdentifier:startDate:endDate:",  v10,  v7,  v8,  v11);

      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v12));
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_queriedDefaultCreditAccountMapsIdentifierLast30DaysPresence,  "setObject:forKeyedSubscript:",  v5,  v4);
    }

    else
    {
      uint64_t v5 = 0LL;
    }
  }

  else {
    id v13 = 0LL;
  }

  return v13;
}

- (unint64_t)countOfDefaultCreditAccountMapsIdentifiersLast30Days
{
  return (unint64_t)-[NSMutableDictionary count]( self->_queriedDefaultCreditAccountMapsIdentifierLast30DaysPresence,  "count");
}

- (id)enumeratorOfDefaultCreditAccountMapsIdentifiersLast30Days
{
  queriedDefaultCreditAccountMapsIdentifierLast30DaysPresence = self->_queriedDefaultCreditAccountMapsIdentifierLast30DaysPresence;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary allKeysForObject:]( queriedDefaultCreditAccountMapsIdentifierLast30DaysPresence,  "allKeysForObject:",  v3));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectEnumerator]);

  return v5;
}

- (id)memberOfDefaultCreditAccountMapsBrandIdentifiers:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_queriedDefaultCreditAccountMapsBrandIdentifierPresence,  "objectForKeyedSubscript:",  v4));
  if (!v5)
  {
    prefetchedDefaultCreditAccount = self->_prefetchedDefaultCreditAccount;
    if (prefetchedDefaultCreditAccount)
    {
      double v7 = (void *)objc_claimAutoreleasedReturnValue(-[PKAccount associatedPassUniqueID](prefetchedDefaultCreditAccount, "associatedPassUniqueID"));
      databaseManager = self->_databaseManager;
      __int128 v9 = -[NSSet initWithObjects:](objc_alloc(&OBJC_CLASS___NSSet), "initWithObjects:", v4, 0LL);
      BOOL v10 = -[PDDatabaseManager hasAnyTransactionsWithMapsBrandIdentifiers:forPassUniqueIdentifier:]( databaseManager,  "hasAnyTransactionsWithMapsBrandIdentifiers:forPassUniqueIdentifier:",  v9,  v7);

      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v10));
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_queriedDefaultCreditAccountMapsBrandIdentifierPresence,  "setObject:forKeyedSubscript:",  v5,  v4);
    }

    else
    {
      uint64_t v5 = 0LL;
    }
  }

  else {
    id v11 = 0LL;
  }

  return v11;
}

- (unint64_t)countOfDefaultCreditAccountMapsBrandIdentifiers
{
  return (unint64_t)-[NSMutableDictionary count]( self->_queriedDefaultCreditAccountMapsBrandIdentifierPresence,  "count");
}

- (id)enumeratorOfDefaultCreditAccountMapsBrandIdentifiers
{
  queriedDefaultCreditAccountMapsBrandIdentifierPresence = self->_queriedDefaultCreditAccountMapsBrandIdentifierPresence;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary allKeysForObject:]( queriedDefaultCreditAccountMapsBrandIdentifierPresence,  "allKeysForObject:",  v3));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectEnumerator]);

  return v5;
}

- (id)memberOfDefaultCreditAccountMapsBrandIdentifiersLast30Days:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_queriedDefaultCreditAccountMapsBrandIdentifierLast30DaysPresence,  "objectForKeyedSubscript:",  v4));
  if (!v5)
  {
    prefetchedDefaultCreditAccount = self->_prefetchedDefaultCreditAccount;
    if (prefetchedDefaultCreditAccount)
    {
      double v7 = (void *)objc_claimAutoreleasedReturnValue(-[PKAccount associatedPassUniqueID](prefetchedDefaultCreditAccount, "associatedPassUniqueID"));
      __int128 v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  -2592000.0));
      databaseManager = self->_databaseManager;
      BOOL v10 = -[NSSet initWithObjects:](objc_alloc(&OBJC_CLASS___NSSet), "initWithObjects:", v4, 0LL);
      id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      BOOL v12 = -[PDDatabaseManager hasAnyTransactionsWithMapsBrandIdentifiers:forPassUniqueIdentifier:startDate:endDate:]( databaseManager,  "hasAnyTransactionsWithMapsBrandIdentifiers:forPassUniqueIdentifier:startDate:endDate:",  v10,  v7,  v8,  v11);

      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v12));
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_queriedDefaultCreditAccountMapsBrandIdentifierLast30DaysPresence,  "setObject:forKeyedSubscript:",  v5,  v4);
    }

    else
    {
      uint64_t v5 = 0LL;
    }
  }

  else {
    id v13 = 0LL;
  }

  return v13;
}

- (unint64_t)countOfDefaultCreditAccountMapsBrandIdentifiersLast30Days
{
  return (unint64_t)-[NSMutableDictionary count]( self->_queriedDefaultCreditAccountMapsBrandIdentifierLast30DaysPresence,  "count");
}

- (id)enumeratorOfDefaultCreditAccountMapsBrandIdentifiersLast30Days
{
  queriedDefaultCreditAccountMapsBrandIdentifierLast30DaysPresence = self->_queriedDefaultCreditAccountMapsBrandIdentifierLast30DaysPresence;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary allKeysForObject:]( queriedDefaultCreditAccountMapsBrandIdentifierLast30DaysPresence,  "allKeysForObject:",  v3));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectEnumerator]);

  return v5;
}

- (BOOL)defaultCreditAccountIsShared
{
  return -[PKAccount isSharedAccount](self->_prefetchedDefaultCreditAccount, "isSharedAccount");
}

- (int64_t)defaultCreditAccountAccessLevel
{
  return (int64_t)-[PKAccount accessLevel](self->_prefetchedDefaultCreditAccount, "accessLevel");
}

- (BOOL)defaultCreditAccountIsCoOwner
{
  return -[PKAccount isCoOwner](self->_prefetchedDefaultCreditAccount, "isCoOwner");
}

- (int64_t)defaultCreditAccountParticipantUsersCount
{
  prefetchedDefaultCreditAccount = self->_prefetchedDefaultCreditAccount;
  if (!prefetchedDefaultCreditAccount || !self->_prefetchedCreditAccountUsers) {
    return 0LL;
  }
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PKAccount accountIdentifier](prefetchedDefaultCreditAccount, "accountIdentifier"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( -[PDUserEvaluationEnvironment _accountUsersForAccountIdentifier:accessLevel:]( self,  "_accountUsersForAccountIdentifier:accessLevel:",  v4,  2LL));
  id v6 = [v5 count];

  return (int64_t)v6;
}

- (BOOL)defaultCreditAccountHasUnderageParticipant
{
  if (!self->_hasQueriedDefaultCreditAccountHasUnderageParticipant)
  {
    prefetchedDefaultCreditAccount = self->_prefetchedDefaultCreditAccount;
    if (prefetchedDefaultCreditAccount)
    {
      if (self->_prefetchedCreditAccountUsers && self->_prefetchedFamilyMembers)
      {
        uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[PKAccount accountIdentifier](prefetchedDefaultCreditAccount, "accountIdentifier"));
        __int128 v14 = 0u;
        __int128 v15 = 0u;
        __int128 v16 = 0u;
        __int128 v17 = 0u;
        id v6 = (id)objc_claimAutoreleasedReturnValue( -[PDUserEvaluationEnvironment _accountUsersForAccountIdentifier:accessLevel:]( self,  "_accountUsersForAccountIdentifier:accessLevel:",  v5,  2LL));
        id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v7)
        {
          id v8 = v7;
          uint64_t v9 = *(void *)v15;
          while (2)
          {
            for (i = 0LL; i != v8; i = (char *)i + 1)
            {
              if (*(void *)v15 != v9) {
                objc_enumerationMutation(v6);
              }
              BOOL v12 = (void *)objc_claimAutoreleasedReturnValue( -[PDUserEvaluationEnvironment _familyMemberWithAltDSID:]( self,  "_familyMemberWithAltDSID:",  v11));
              id v13 = v12;
              if (v12
                && (unint64_t)[v12 age] >= 0xD
                && (unint64_t)[v13 age] <= 0x11)
              {
                self->_defaultCreditAccountHasUnderageParticipant = 1;

                goto LABEL_18;
              }
            }

            id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
            if (v8) {
              continue;
            }
            break;
          }
        }

- (NSString)defaultCreditAccountPhysicalAppleCardStatus
{
  unint64_t defaultPhysicalCardStatus = self->_defaultPhysicalCardStatus;
  if (defaultPhysicalCardStatus > 3) {
    return (NSString *)@"ordered";
  }
  else {
    return (NSString *)*(&off_100644518 + defaultPhysicalCardStatus);
  }
}

- (int64_t)daysSincePhysicalAppleCardShipmentUpdate
{
  return self->_daysSincePhysicalAppleCardShipmentUpdate;
}

- (id)memberOfDefaultCreditAccountActivePromotionIdentifiers:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_queriedDefaultCreditAccountActivePromotionIdentifiersPresence,  "objectForKeyedSubscript:",  v4));
  uint64_t v6 = objc_claimAutoreleasedReturnValue(-[PKAccount accountIdentifier](self->_prefetchedDefaultCreditAccount, "accountIdentifier"));
  id v7 = (void *)v6;
  if (v5) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = v6 == 0;
  }
  if (!v8)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager accountPromotionForProgramIdentifier:accountIdentifier:]( self->_databaseManager,  "accountPromotionForProgramIdentifier:accountIdentifier:",  v4,  v6));
    BOOL v10 = v9;
    if (v9) {
      BOOL v11 = [v9 state] == (id)2;
    }
    else {
      BOOL v11 = 0LL;
    }
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v11));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_queriedDefaultCreditAccountActivePromotionIdentifiersPresence,  "setObject:forKeyedSubscript:",  v5,  v4);
  }

  else {
    id v12 = 0LL;
  }

  return v12;
}

- (unint64_t)countOfDefaultCreditAccountActivePromotionIdentifiers
{
  return (unint64_t)-[NSMutableDictionary count]( self->_queriedDefaultCreditAccountActivePromotionIdentifiersPresence,  "count");
}

- (id)enumeratorOfDefaultCreditAccountActivePromotionIdentifiers
{
  queriedDefaultCreditAccountActivePromotionIdentifiersPresence = self->_queriedDefaultCreditAccountActivePromotionIdentifiersPresence;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary allKeysForObject:]( queriedDefaultCreditAccountActivePromotionIdentifiersPresence,  "allKeysForObject:",  v3));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectEnumerator]);

  return v5;
}

- (id)memberOfDefaultCreditAccountActivePromotionIdentifiersExpiringSoon:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_queriedDefaultCreditAccountActivePromotionIdentifiersExpiringSoonPresence,  "objectForKeyedSubscript:",  v4));
  uint64_t v6 = objc_claimAutoreleasedReturnValue(-[PKAccount accountIdentifier](self->_prefetchedDefaultCreditAccount, "accountIdentifier"));
  id v7 = (void *)v6;
  if (v5) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = v6 == 0;
  }
  if (!v8)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager accountPromotionForProgramIdentifier:accountIdentifier:]( self->_databaseManager,  "accountPromotionForProgramIdentifier:accountIdentifier:",  v4,  v6));
    BOOL v10 = v9;
    if (v9 && [v9 state] == (id)2) {
      id v11 = [v10 expiringSoon];
    }
    else {
      id v11 = 0LL;
    }
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v11));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_queriedDefaultCreditAccountActivePromotionIdentifiersExpiringSoonPresence,  "setObject:forKeyedSubscript:",  v5,  v4);
  }

  else {
    id v12 = 0LL;
  }

  return v12;
}

- (unint64_t)countOfDefaultCreditAccountActivePromotionIdentifiersExpiringSoon
{
  return (unint64_t)-[NSMutableDictionary count]( self->_queriedDefaultCreditAccountActivePromotionIdentifiersExpiringSoonPresence,  "count");
}

- (id)enumeratorOfDefaultCreditAccountActivePromotionIdentifiersExpiringSoon
{
  queriedDefaultCreditAccountActivePromotionIdentifiersExpiringSoonPresence = self->_queriedDefaultCreditAccountActivePromotionIdentifiersExpiringSoonPresence;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary allKeysForObject:]( queriedDefaultCreditAccountActivePromotionIdentifiersExpiringSoonPresence,  "allKeysForObject:",  v3));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectEnumerator]);

  return v5;
}

- (BOOL)anyCreditAccountStateIsClosed
{
  prefetchedCreditAccounts = self->_prefetchedCreditAccounts;
  if (prefetchedCreditAccounts && !self->_hasQueriedAnyCreditAccountIsClosed)
  {
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v10 = 0u;
    __int128 v11 = 0u;
    id v4 = prefetchedCreditAccounts;
    id v5 = -[NSSet countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v11;
      while (2)
      {
        for (i = 0LL; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          if (objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * (void)i), "state", (void)v10) == (id)4)
          {
            self->_anyCreditAccountIsClosed = 1;
            goto LABEL_13;
          }
        }

        id v6 = -[NSSet countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
        if (v6) {
          continue;
        }
        break;
      }
    }

- (BOOL)anyCreditAccountStateIsRemoved
{
  prefetchedCreditAccounts = self->_prefetchedCreditAccounts;
  if (prefetchedCreditAccounts && !self->_hasQueriedAnyCreditAccountIsRemoved)
  {
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v10 = 0u;
    __int128 v11 = 0u;
    id v4 = prefetchedCreditAccounts;
    id v5 = -[NSSet countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v11;
      while (2)
      {
        for (i = 0LL; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          if (objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * (void)i), "state", (void)v10) == (id)5)
          {
            self->_anyCreditAccountIsRemoved = 1;
            goto LABEL_13;
          }
        }

        id v6 = -[NSSet countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
        if (v6) {
          continue;
        }
        break;
      }
    }

- (NSSet)passStyles
{
  passStyles = self->_passStyles;
  if (!passStyles)
  {
    id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    id v5 = self->_passStyles;
    self->_passStyles = v4;

    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PDDatabaseManager passStyles](self->_databaseManager, "passStyles", 0LL));
    id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        __int128 v10 = 0LL;
        do
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          __int128 v11 = self->_passStyles;
          uint64_t v12 = PKPassStyleToString([*(id *)(*((void *)&v15 + 1) + 8 * (void)v10) integerValue]);
          __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
          -[NSMutableSet addObject:](v11, "addObject:", v13);

          __int128 v10 = (char *)v10 + 1;
        }

        while (v8 != v10);
        id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }

      while (v8);
    }

    passStyles = self->_passStyles;
  }

  return (NSSet *)-[NSMutableSet copy](passStyles, "copy");
}

- (NSSet)unexpiredPassStyles
{
  unexpiredPassStyles = self->_unexpiredPassStyles;
  if (!unexpiredPassStyles)
  {
    id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    id v5 = self->_unexpiredPassStyles;
    self->_unexpiredPassStyles = v4;

    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PDDatabaseManager unexpiredPassStyles](self->_databaseManager, "unexpiredPassStyles", 0LL));
    id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        __int128 v10 = 0LL;
        do
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          __int128 v11 = self->_unexpiredPassStyles;
          uint64_t v12 = PKPassStyleToString([*(id *)(*((void *)&v15 + 1) + 8 * (void)v10) integerValue]);
          __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
          -[NSMutableSet addObject:](v11, "addObject:", v13);

          __int128 v10 = (char *)v10 + 1;
        }

        while (v8 != v10);
        id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }

      while (v8);
    }

    unexpiredPassStyles = self->_unexpiredPassStyles;
  }

  return (NSSet *)-[NSMutableSet copy](unexpiredPassStyles, "copy");
}

- (NSSet)secureElementCardTypes
{
  cardTypes = self->_cardTypes;
  if (!cardTypes)
  {
    id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    id v5 = self->_cardTypes;
    self->_cardTypes = v4;

    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PDDatabaseManager secureElementCardTypes](self->_databaseManager, "secureElementCardTypes", 0LL));
    id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        __int128 v10 = 0LL;
        do
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          __int128 v11 = self->_cardTypes;
          uint64_t v12 = PKPaymentCardTypeToString([*(id *)(*((void *)&v15 + 1) + 8 * (void)v10) integerValue]);
          __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
          -[NSMutableSet addObject:](v11, "addObject:", v13);

          __int128 v10 = (char *)v10 + 1;
        }

        while (v8 != v10);
        id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }

      while (v8);
    }

    cardTypes = self->_cardTypes;
  }

  return (NSSet *)-[NSMutableSet copy](cardTypes, "copy");
}

- (NSSet)unexpiredSecureElementCardTypes
{
  unexpiredCardTypes = self->_unexpiredCardTypes;
  if (!unexpiredCardTypes)
  {
    id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    id v5 = self->_unexpiredCardTypes;
    self->_unexpiredCardTypes = v4;

    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    id v6 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager unexpiredSecureElementCardTypes]( self->_databaseManager,  "unexpiredSecureElementCardTypes",  0LL));
    id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        __int128 v10 = 0LL;
        do
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          __int128 v11 = self->_unexpiredCardTypes;
          uint64_t v12 = PKPaymentCardTypeToString([*(id *)(*((void *)&v15 + 1) + 8 * (void)v10) integerValue]);
          __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
          -[NSMutableSet addObject:](v11, "addObject:", v13);

          __int128 v10 = (char *)v10 + 1;
        }

        while (v8 != v10);
        id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }

      while (v8);
    }

    unexpiredCardTypes = self->_unexpiredCardTypes;
  }

  return (NSSet *)-[NSMutableSet copy](unexpiredCardTypes, "copy");
}

- (NSSet)transitNetworksPresent
{
  transitNetworksPresent = self->_transitNetworksPresent;
  if (!transitNetworksPresent)
  {
    id v4 = (NSArray *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager transitNetworksForPassesMatchingTransitType:expired:]( self->_databaseManager,  "transitNetworksForPassesMatchingTransitType:expired:",  0LL,  0LL));
    id v5 = self->_transitNetworksPresent;
    self->_transitNetworksPresent = v4;

    transitNetworksPresent = self->_transitNetworksPresent;
  }

  return +[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", transitNetworksPresent);
}

- (NSSet)transitNetworksPresentAndUnexpired
{
  transitNetworksPresentAndUnexpired = self->_transitNetworksPresentAndUnexpired;
  if (!transitNetworksPresentAndUnexpired)
  {
    id v4 = (NSArray *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager transitNetworksForPassesMatchingTransitType:expired:]( self->_databaseManager,  "transitNetworksForPassesMatchingTransitType:expired:",  0LL,  2LL));
    id v5 = self->_transitNetworksPresentAndUnexpired;
    self->_transitNetworksPresentAndUnexpired = v4;

    transitNetworksPresentAndUnexpired = self->_transitNetworksPresentAndUnexpired;
  }

  return +[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", transitNetworksPresentAndUnexpired);
}

- (id)memberOfMerchantIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_queriedMerchantIdentifierPresence,  "objectForKeyedSubscript:",  v4));
  if (!v5)
  {
    databaseManager = self->_databaseManager;
    id v7 = -[NSSet initWithObjects:](objc_alloc(&OBJC_CLASS___NSSet), "initWithObjects:", v4, 0LL);
    BOOL v8 = -[PDDatabaseManager hasAnyTransactionsWithMerchantIdentifiers:]( databaseManager,  "hasAnyTransactionsWithMerchantIdentifiers:",  v7);

    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v8));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_queriedMerchantIdentifierPresence,  "setObject:forKeyedSubscript:",  v5,  v4);
  }

  else {
    id v9 = 0LL;
  }

  return v9;
}

- (unint64_t)countOfMerchantIdentifiers
{
  return (unint64_t)-[NSMutableDictionary count](self->_queriedMerchantIdentifierPresence, "count");
}

- (id)enumeratorOfMerchantIdentifiers
{
  queriedMerchantIdentifierPresence = self->_queriedMerchantIdentifierPresence;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeysForObject:](queriedMerchantIdentifierPresence, "allKeysForObject:", v3));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectEnumerator]);

  return v5;
}

- (id)memberOfMapsIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_queriedMapsIdentifierPresence,  "objectForKeyedSubscript:",  v4));
  if (!v5)
  {
    databaseManager = self->_databaseManager;
    id v7 = -[NSSet initWithObjects:](objc_alloc(&OBJC_CLASS___NSSet), "initWithObjects:", v4, 0LL);
    BOOL v8 = -[PDDatabaseManager hasAnyTransactionsWithMapsIdentifiers:]( databaseManager,  "hasAnyTransactionsWithMapsIdentifiers:",  v7);

    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v8));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_queriedMapsIdentifierPresence,  "setObject:forKeyedSubscript:",  v5,  v4);
  }

  else {
    id v9 = 0LL;
  }

  return v9;
}

- (unint64_t)countOfMapsIdentifiers
{
  return (unint64_t)-[NSMutableDictionary count](self->_queriedMapsIdentifierPresence, "count");
}

- (id)enumeratorOfMapsIdentifiers
{
  queriedMapsIdentifierPresence = self->_queriedMapsIdentifierPresence;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeysForObject:](queriedMapsIdentifierPresence, "allKeysForObject:", v3));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectEnumerator]);

  return v5;
}

- (id)memberOfMapsBrandIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_queriedMapsBrandIdentifierPresence,  "objectForKeyedSubscript:",  v4));
  if (!v5)
  {
    databaseManager = self->_databaseManager;
    id v7 = -[NSSet initWithObjects:](objc_alloc(&OBJC_CLASS___NSSet), "initWithObjects:", v4, 0LL);
    BOOL v8 = -[PDDatabaseManager hasAnyTransactionsWithMapsBrandIdentifiers:]( databaseManager,  "hasAnyTransactionsWithMapsBrandIdentifiers:",  v7);

    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v8));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_queriedMapsBrandIdentifierPresence,  "setObject:forKeyedSubscript:",  v5,  v4);
  }

  else {
    id v9 = 0LL;
  }

  return v9;
}

- (unint64_t)countOfMapsBrandIdentifiers
{
  return (unint64_t)-[NSMutableDictionary count](self->_queriedMapsBrandIdentifierPresence, "count");
}

- (id)enumeratorOfMapsBrandIdentifiers
{
  queriedMapsBrandIdentifierPresence = self->_queriedMapsBrandIdentifierPresence;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeysForObject:](queriedMapsBrandIdentifierPresence, "allKeysForObject:", v3));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectEnumerator]);

  return v5;
}

- (BOOL)hasPaymentTransaction
{
  if (self->_hasQueriedPaymentTransaction) {
    return self->_hasPaymentTransaction;
  }
  BOOL result = -[PDDatabaseManager hasAnyTransactionsOfType:](self->_databaseManager, "hasAnyTransactionsOfType:", 0LL);
  self->_hasPaymentTransaction = result;
  self->_hasQueriedPaymentTransaction = 1;
  return result;
}

- (BOOL)hasTransitTransaction
{
  if (self->_hasQueriedTransitTransaction) {
    return self->_hasTransitTransaction;
  }
  BOOL result = -[PDDatabaseManager hasAnyTransactionsOfType:](self->_databaseManager, "hasAnyTransactionsOfType:", 2LL);
  self->_hasTransitTransaction = result;
  self->_hasQueriedTransitTransaction = 1;
  return result;
}

- (int64_t)defaultCreditApplicationCount
{
  int64_t result = (int64_t)self->_prefetchedCreditApplications;
  if (result) {
    return (int64_t)[(id)result count];
  }
  return result;
}

- (int64_t)currentDefaultCreditApplictionDaysSinceLastUpdated
{
  if (!self->_prefetchedCurrentCreditApplication) {
    return -1LL;
  }
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PKFeatureApplication lastUpdated](self->_prefetchedCurrentCreditApplication, "lastUpdated"));
  [v3 timeIntervalSinceDate:v4];
  double v6 = v5;

  return vcvtmd_s64_f64(v6 / 86400.0);
}

- (NSString)currentDefaultCreditApplicationState
{
  return (NSString *)PKFeatureApplicationStateToString( -[PKFeatureApplication applicationState]( self->_prefetchedCurrentCreditApplication,  "applicationState"));
}

- (BOOL)hasPeerPaymentAccount
{
  return self->_prefetchedPeerPaymentAccount != 0LL;
}

- (BOOL)hasPeerPaymentPassProvisioned
{
  if (!self->_hasQueriedPeerPaymentPassProvisioned)
  {
    prefetchedPeerPaymentAccount = self->_prefetchedPeerPaymentAccount;
    if (prefetchedPeerPaymentAccount)
    {
      databaseManager = self->_databaseManager;
      double v5 = (void *)objc_claimAutoreleasedReturnValue( -[PKPeerPaymentAccount associatedPassUniqueID]( prefetchedPeerPaymentAccount,  "associatedPassUniqueID"));
      double v6 = (void *)objc_claimAutoreleasedReturnValue(-[PDDatabaseManager passWithUniqueIdentifier:](databaseManager, "passWithUniqueIdentifier:", v5));
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 paymentPass]);

      BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v7 devicePrimaryPaymentApplication]);
      self->_peerPaymentPassProvisioned = v8 != 0LL;

      self->_hasQueriedPeerPaymentPassProvisioned = 1;
    }
  }

  return self->_peerPaymentPassProvisioned;
}

- (int64_t)peerPaymentAccountState
{
  int64_t result = (int64_t)self->_prefetchedPeerPaymentAccount;
  if (result) {
    return (int64_t)[(id)result state];
  }
  return result;
}

- (int64_t)peerPaymentAccountStage
{
  int64_t result = (int64_t)self->_prefetchedPeerPaymentAccount;
  if (result) {
    return (int64_t)[(id)result stage];
  }
  return result;
}

- (int64_t)peerPaymentAccountStateReason
{
  int64_t result = (int64_t)self->_prefetchedPeerPaymentAccount;
  if (result) {
    return (int64_t)[(id)result stateReason];
  }
  return result;
}

- (BOOL)peerPaymentAccountHasTransaction
{
  if (!self->_hasQueriedPeerPaymentTransaction)
  {
    prefetchedPeerPaymentAccount = self->_prefetchedPeerPaymentAccount;
    if (prefetchedPeerPaymentAccount)
    {
      id v4 = (void *)objc_claimAutoreleasedReturnValue( -[PKPeerPaymentAccount associatedPassUniqueID]( prefetchedPeerPaymentAccount,  "associatedPassUniqueID"));
      double v5 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager transactionSourceIdentifiersForPassUniqueIdentifier:]( self->_databaseManager,  "transactionSourceIdentifiersForPassUniqueIdentifier:",  v4));
      double v6 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager transactionsForTransactionSourceIdentifiers:withTransactionSource:withBackingData:limit:]( self->_databaseManager,  "transactionsForTransactionSourceIdentifiers:withTransactionSource:withBackingData:limit:",  v5,  0LL,  0LL,  1LL));
      self->_hasPeerPaymentTransaction = [v6 count] != 0;
      self->_hasQueriedPeerPaymentTransaction = 1;
    }
  }

  return self->_hasPeerPaymentTransaction;
}

- (BOOL)peerPaymentAccountHasContactlessTransaction
{
  if (!self->_hasQueriedPeerPaymentContaclessTransaction)
  {
    prefetchedPeerPaymentAccount = self->_prefetchedPeerPaymentAccount;
    if (prefetchedPeerPaymentAccount)
    {
      id v4 = (void *)objc_claimAutoreleasedReturnValue( -[PKPeerPaymentAccount associatedPassUniqueID]( prefetchedPeerPaymentAccount,  "associatedPassUniqueID"));
      double v5 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager transactionSourceIdentifiersForPassUniqueIdentifier:]( self->_databaseManager,  "transactionSourceIdentifiersForPassUniqueIdentifier:",  v4));
      self->_hasPeerPaymentContactlessTransaction = -[PDDatabaseManager hasPaymentTransactionForTransactionSourceIdentifiers:withTransactionSource:]( self->_databaseManager,  "hasPaymentTransactionForTransactionSourceIdentifiers:withTransactionSource:",  v5,  1LL);
      self->_hasQueriedPeerPaymentContaclessTransaction = 1;
    }
  }

  return self->_hasPeerPaymentContactlessTransaction;
}

- (BOOL)peerPaymentHasOnlinePurchaseTransaction
{
  if (!self->_hasQueriedPeerPaymentOnlinePurchaseTransaction)
  {
    prefetchedPeerPaymentAccount = self->_prefetchedPeerPaymentAccount;
    if (prefetchedPeerPaymentAccount)
    {
      id v4 = (void *)objc_claimAutoreleasedReturnValue( -[PKPeerPaymentAccount associatedPassUniqueID]( prefetchedPeerPaymentAccount,  "associatedPassUniqueID"));
      double v5 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager transactionSourceIdentifiersForPassUniqueIdentifier:]( self->_databaseManager,  "transactionSourceIdentifiersForPassUniqueIdentifier:",  v4));
      unsigned __int8 v6 = -[PDDatabaseManager hasPaymentTransactionForTransactionSourceIdentifiers:withTransactionSource:]( self->_databaseManager,  "hasPaymentTransactionForTransactionSourceIdentifiers:withTransactionSource:",  v5,  3LL);
      BOOL v7 = 1;
      if ((v6 & 1) == 0) {
        BOOL v7 = -[PDDatabaseManager hasPaymentTransactionForTransactionSourceIdentifiers:withTransactionSource:]( self->_databaseManager,  "hasPaymentTransactionForTransactionSourceIdentifiers:withTransactionSource:",  v5,  2LL);
      }
      self->_hasPeerPaymentOnlinePurchaseTransaction = v7;
      self->_hasQueriedPeerPaymentOnlinePurchaseTransaction = 1;
    }
  }

  return self->_hasPeerPaymentOnlinePurchaseTransaction;
}

- (int64_t)daysSinceLastPeerPaymentTransaction
{
  if (!self->_hasQueriedPeerPaymentDaysSinceLastTransaction)
  {
    prefetchedPeerPaymentAccount = self->_prefetchedPeerPaymentAccount;
    if (prefetchedPeerPaymentAccount)
    {
      id v4 = (void *)objc_claimAutoreleasedReturnValue( -[PKPeerPaymentAccount associatedPassUniqueID]( prefetchedPeerPaymentAccount,  "associatedPassUniqueID"));
      double v5 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager transactionSourceIdentifiersForPassUniqueIdentifier:]( self->_databaseManager,  "transactionSourceIdentifiersForPassUniqueIdentifier:",  v4));
      unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager transactionsForTransactionSourceIdentifiers:withTransactionSource:withBackingData:limit:]( self->_databaseManager,  "transactionsForTransactionSourceIdentifiers:withTransactionSource:withBackingData:limit:",  v5,  0LL,  0LL,  1LL));
      BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v6 anyObject]);

      if (v7)
      {
        BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
        id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 transactionDate]);
        [v8 timeIntervalSinceDate:v9];
        double v11 = v10;

        self->_daysSinceLastPeerPaymentTransaction = vcvtmd_s64_f64(v11 / 86400.0);
      }

      self->_hasQueriedPeerPaymentDaysSinceLastTransaction = 1;
    }
  }

  return self->_daysSinceLastPeerPaymentTransaction;
}

- (int64_t)peerPaymentDaysSinceLastP2PTransaction
{
  if (!self->_hasQueriedPeerPaymentDaysSinceLastP2PTransaction)
  {
    prefetchedPeerPaymentAccount = self->_prefetchedPeerPaymentAccount;
    if (prefetchedPeerPaymentAccount)
    {
      id v4 = (void *)objc_claimAutoreleasedReturnValue( -[PKPeerPaymentAccount associatedPassUniqueID]( prefetchedPeerPaymentAccount,  "associatedPassUniqueID"));
      double v5 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager transactionSourceIdentifiersForPassUniqueIdentifier:]( self->_databaseManager,  "transactionSourceIdentifiersForPassUniqueIdentifier:",  v4));
      databaseManager = self->_databaseManager;
      BOOL v7 = (void *)objc_claimAutoreleasedReturnValue( -[PKPeerPaymentAccount transactionSourceIdentifier]( self->_prefetchedPeerPaymentAccount,  "transactionSourceIdentifier"));
      BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentAccount createdDate](self->_prefetchedPeerPaymentAccount, "createdDate"));
      id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      double v10 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager peerPaymentCounterpartHandlesForTransactionSourceIdentifier:startDate:endDate:]( databaseManager,  "peerPaymentCounterpartHandlesForTransactionSourceIdentifier:startDate:endDate:",  v7,  v8,  v9));
      double v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v10));

      if (![v11 count])
      {
LABEL_16:
        self->_hasQueriedPeerPaymentDaysSinceLastP2PTransaction = 1;

        return self->_daysSinceLastPeerPaymentP2PTransaction;
      }

      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager transactionsForTransactionSourceIdentifiers:withPeerPaymentCounterpartHandles:forPeerPaymentSubtype:withTransactionSource:withBackingData:limit:]( self->_databaseManager,  "transactionsForTransactionSourceIdentifiers:withPeerPaymentCounterpartHandles:forPeerPaymentSubt ype:withTransactionSource:withBackingData:limit:",  v5,  v11,  1LL,  0LL,  0LL,  1LL));
      __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v12 anyObject]);

      __int128 v14 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager transactionsForTransactionSourceIdentifiers:withPeerPaymentCounterpartHandles:forPeerPaymentSubtype:withTransactionSource:withBackingData:limit:]( self->_databaseManager,  "transactionsForTransactionSourceIdentifiers:withPeerPaymentCounterpartHandles:forPeerPaymentSubt ype:withTransactionSource:withBackingData:limit:",  v5,  v11,  2LL,  0LL,  0LL,  1LL));
      __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v14 anyObject]);

      if (v13 && v15)
      {
        __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
        __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v13 transactionDate]);
        [v16 timeIntervalSinceDate:v17];
        double v19 = v18;

        int64_t v20 = vcvtmd_s64_f64(v19 / 86400.0);
        __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
        __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([v15 transactionDate]);
        [v21 timeIntervalSinceDate:v22];
        double v24 = v23;

        int64_t v25 = vcvtmd_s64_f64(v24 / 86400.0);
        if (v20 < v25) {
          int64_t v25 = v20;
        }
      }

      else
      {
        if (v13)
        {
          v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
          v27 = v13;
        }

        else
        {
          if (!v15)
          {
LABEL_15:

            goto LABEL_16;
          }

          v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
          v27 = v15;
        }

        v28 = (void *)objc_claimAutoreleasedReturnValue([v27 transactionDate]);
        [v26 timeIntervalSinceDate:v28];
        double v30 = v29;

        int64_t v25 = vcvtmd_s64_f64(v30 / 86400.0);
      }

      self->_daysSinceLastPeerPaymentP2PTransaction = v25;
      goto LABEL_15;
    }
  }

  return self->_daysSinceLastPeerPaymentP2PTransaction;
}

- (int64_t)peerPaymentDaysSinceLastP2PTransactionToAnyParticipant
{
  if (!self->_hasQueriedPeerPaymentDaysSinceLastP2PTransactionToAnyParticipant)
  {
    prefetchedPeerPaymentAccount = self->_prefetchedPeerPaymentAccount;
    if (prefetchedPeerPaymentAccount)
    {
      if (self->_prefetchedFamilyMembers)
      {
        v33 = (void *)objc_claimAutoreleasedReturnValue( -[PKPeerPaymentAccount associatedPassUniqueID]( prefetchedPeerPaymentAccount,  "associatedPassUniqueID"));
        v32 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager transactionSourceIdentifiersForPassUniqueIdentifier:]( self->_databaseManager,  "transactionSourceIdentifiersForPassUniqueIdentifier:"));
        double v5 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
        __int128 v38 = 0u;
        __int128 v39 = 0u;
        __int128 v40 = 0u;
        __int128 v41 = 0u;
        unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue( -[PKPeerPaymentAccount associatedAccountInformation]( self->_prefetchedPeerPaymentAccount,  "associatedAccountInformation"));
        BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v6 associatedAccounts]);

        id v8 = [v7 countByEnumeratingWithState:&v38 objects:v43 count:16];
        if (v8)
        {
          id v9 = v8;
          uint64_t v10 = *(void *)v39;
          do
          {
            for (i = 0LL; i != v9; i = (char *)i + 1)
            {
              if (*(void *)v39 != v10) {
                objc_enumerationMutation(v7);
              }
              uint64_t v12 = *(void **)(*((void *)&v38 + 1) + 8LL * (void)i);
              if (objc_msgSend(v12, "role", v32) == (id)1)
              {
                __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v12 altDSID]);
                -[NSMutableSet addObject:](v5, "addObject:", v13);
              }
            }

            id v9 = [v7 countByEnumeratingWithState:&v38 objects:v43 count:16];
          }

          while (v9);
        }

        __int128 v14 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
        __int128 v34 = 0u;
        __int128 v35 = 0u;
        __int128 v36 = 0u;
        __int128 v37 = 0u;
        __int128 v15 = self->_prefetchedFamilyMembers;
        id v16 = -[NSArray countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v34,  v42,  16LL);
        if (v16)
        {
          id v17 = v16;
          uint64_t v18 = *(void *)v35;
          do
          {
            for (j = 0LL; j != v17; j = (char *)j + 1)
            {
              if (*(void *)v35 != v18) {
                objc_enumerationMutation(v15);
              }
              int64_t v20 = *(void **)(*((void *)&v34 + 1) + 8LL * (void)j);
              if ((objc_msgSend(v20, "isMe", v32) & 1) == 0)
              {
                __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v20 altDSID]);
                unsigned int v22 = -[NSMutableSet containsObject:](v5, "containsObject:", v21);

                if (v22)
                {
                  double v23 = (void *)objc_claimAutoreleasedReturnValue([v20 appleID]);
                  -[NSMutableSet addObject:](v14, "addObject:", v23);

                  double v24 = (void *)objc_claimAutoreleasedReturnValue([v20 appleIDAliases]);
                  int64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v24 allObjects]);
                  -[NSMutableSet addObjectsFromArray:](v14, "addObjectsFromArray:", v25);
                }
              }
            }

            id v17 = -[NSArray countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v34,  v42,  16LL);
          }

          while (v17);
        }

        if (-[NSMutableSet count](v14, "count"))
        {
          v26 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager transactionsForTransactionSourceIdentifiers:withPeerPaymentCounterpartHandles:forPeerPaymentSubtype:withTransactionSource:withBackingData:limit:]( self->_databaseManager,  "transactionsForTransactionSourceIdentifiers:withPeerPaymentCounterpartHandles:forPeerPayment Subtype:withTransactionSource:withBackingData:limit:",  v32,  v14,  1LL,  0LL,  0LL,  1LL));
          v27 = (void *)objc_claimAutoreleasedReturnValue([v26 anyObject]);

          if (v27)
          {
            v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
            double v29 = (void *)objc_claimAutoreleasedReturnValue([v27 transactionDate]);
            [v28 timeIntervalSinceDate:v29];
            double v31 = v30;

            self->_peerPaymentDaysSinceLastP2PTransactionToAnyParticipant = vcvtmd_s64_f64(v31 / 86400.0);
          }
        }

        self->_hasQueriedPeerPaymentDaysSinceLastP2PTransactionToAnyParticipant = 1;
      }
    }
  }

  return self->_peerPaymentDaysSinceLastP2PTransactionToAnyParticipant;
}

- (BOOL)peerPaymentAccountHasBalance
{
  prefetchedPeerPaymentAccount = self->_prefetchedPeerPaymentAccount;
  if (!prefetchedPeerPaymentAccount) {
    return 0;
  }
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentAccount currentBalance](prefetchedPeerPaymentAccount, "currentBalance"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 amount]);

  double v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDecimalNumber zero](&OBJC_CLASS___NSDecimalNumber, "zero"));
  BOOL v6 = [v4 compare:v5] == (id)1;

  return v6;
}

- (int64_t)peerPaymentAccountBalanceBase
{
  prefetchedPeerPaymentAccount = self->_prefetchedPeerPaymentAccount;
  if (!prefetchedPeerPaymentAccount) {
    return 0LL;
  }
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentAccount currentBalance](prefetchedPeerPaymentAccount, "currentBalance"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 currency]);
  unsigned int v5 = [v4 isEqualToString:@"USD"];

  if (v5)
  {
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v3 amountByConvertingToSmallestCommonCurrencyUnit]);
    uint64_t v7 = (uint64_t)[v6 longLongValue];

    uint64_t v8 = 50LL;
    uint64_t v9 = 20LL;
    if (v7 <= 1999) {
      uint64_t v9 = 0LL;
    }
    if (v7 <= 4999) {
      uint64_t v8 = v9;
    }
    if (v7 <= 9999) {
      int64_t v10 = v8;
    }
    else {
      int64_t v10 = 100LL;
    }
  }

  else
  {
    int64_t v10 = 0LL;
  }

  return v10;
}

- (BOOL)peerPaymentHasP2PTransaction
{
  if (!self->_hasQueriedPeerPaymentHasP2PTransaction)
  {
    prefetchedPeerPaymentAccount = self->_prefetchedPeerPaymentAccount;
    if (prefetchedPeerPaymentAccount)
    {
      id v4 = (void *)objc_claimAutoreleasedReturnValue( -[PKPeerPaymentAccount associatedPassUniqueID]( prefetchedPeerPaymentAccount,  "associatedPassUniqueID"));
      unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager transactionSourceIdentifiersForPassUniqueIdentifier:]( self->_databaseManager,  "transactionSourceIdentifiersForPassUniqueIdentifier:",  v4));
      databaseManager = self->_databaseManager;
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentAccount createdDate](self->_prefetchedPeerPaymentAccount, "createdDate"));
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager peerPaymentTransactionServiceIdentifiersForTransactionSourceIdentifiers:withPeerPaymentSubtype:withTransactionSource:withBackingData:startDate:endDate:]( databaseManager,  "peerPaymentTransactionServiceIdentifiersForTransactionSourceIdentifiers:withPeerPaymentSubtype:wi thTransactionSource:withBackingData:startDate:endDate:",  v5,  1LL,  0LL,  0LL,  v7,  v8));
      if ([v9 count])
      {
        self->_hasPeerPaymentP2PTransaction = 1;
      }

      else
      {
        int64_t v10 = self->_databaseManager;
        double v11 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentAccount createdDate](self->_prefetchedPeerPaymentAccount, "createdDate"));
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
        __int128 v13 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager peerPaymentTransactionServiceIdentifiersForTransactionSourceIdentifiers:withPeerPaymentSubtype:withTransactionSource:withBackingData:startDate:endDate:]( v10,  "peerPaymentTransactionServiceIdentifiersForTransactionSourceIdentifiers:withPeerPaymentSubtype :withTransactionSource:withBackingData:startDate:endDate:",  v5,  2LL,  0LL,  0LL,  v11,  v12));
        self->_hasPeerPaymentP2PTransaction = [v13 count] != 0;
      }

      self->_hasQueriedPeerPaymentHasP2PTransaction = 1;
    }
  }

  return self->_hasPeerPaymentP2PTransaction;
}

- (BOOL)peerPaymentHasAutoReloadEnabled
{
  if (!self->_hasQueriedPeerPaymentHasAutoReloadEnabled)
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager peerPaymentRecurringPaymentsWithType:]( self->_databaseManager,  "peerPaymentRecurringPaymentsWithType:",  3LL));
    self->_hasPeerPaymentAutoReloadEnabled = [v3 count] != 0;
    self->_hasQueriedPeerPaymentHasAutoReloadEnabled = 1;
  }

  return self->_hasPeerPaymentAutoReloadEnabled;
}

- (BOOL)peerPaymentHasSetupRecurringP2PPayment
{
  if (!self->_hasQueriedPeerPaymentHasSetupRecurringP2PPayment)
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager peerPaymentRecurringPaymentsWithType:]( self->_databaseManager,  "peerPaymentRecurringPaymentsWithType:",  1LL));
    __int128 v9 = 0u;
    __int128 v10 = 0u;
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    id v4 = v3;
    id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v10;
      while (2)
      {
        for (i = 0LL; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v10 != v6) {
            objc_enumerationMutation(v4);
          }
          if (objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * (void)i), "sentByMe", (void)v9))
          {
            LOBYTE(v5) = 1;
            goto LABEL_12;
          }
        }

        id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }

- (BOOL)peerPaymentHasSetupRecurringP2PPaymentForAnyParticipant
{
  if (!self->_hasQueriedPeerPaymentHasSetupRecurringP2PPaymentForAnyParticipant && self->_prefetchedPeerPaymentAccount)
  {
    uint64_t v3 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    id v4 = (void *)objc_claimAutoreleasedReturnValue( -[PKPeerPaymentAccount associatedAccountInformation]( self->_prefetchedPeerPaymentAccount,  "associatedAccountInformation"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 associatedAccounts]);

    id v6 = [v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v27;
      do
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v27 != v8) {
            objc_enumerationMutation(v5);
          }
          __int128 v10 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)i);
          if ([v10 role] == (id)1)
          {
            __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v10 altDSID]);
            -[NSMutableSet addObject:](v3, "addObject:", v11);
          }
        }

        id v7 = [v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }

      while (v7);
    }

    __int128 v12 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager peerPaymentRecurringPaymentsWithType:]( self->_databaseManager,  "peerPaymentRecurringPaymentsWithType:",  1LL));
    self->_hasPeerPaymentSetupRecurringP2PPaymentForAnyParticipant = 0;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    id v13 = v12;
    id v14 = [v13 countByEnumeratingWithState:&v22 objects:v30 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v23;
      do
      {
        for (j = 0LL; j != v15; j = (char *)j + 1)
        {
          if (*(void *)v23 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)j);
          double v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "recipientAltDSID", (void)v22));
          if (-[NSMutableSet containsObject:](v3, "containsObject:", v19))
          {
            unsigned int v20 = [v18 sentByMe];

            if (v20)
            {
              self->_hasPeerPaymentSetupRecurringP2PPaymentForAnyParticipant = 1;
              goto LABEL_23;
            }
          }

          else
          {
          }
        }

        id v15 = [v13 countByEnumeratingWithState:&v22 objects:v30 count:16];
      }

      while (v15);
    }

- (int64_t)peerPaymentDaysSinceLastPurchaseTransaction
{
  if (!self->_hasQueriedPeerPaymentDaysSinceLastPurchaseTransaction)
  {
    prefetchedPeerPaymentAccount = self->_prefetchedPeerPaymentAccount;
    if (prefetchedPeerPaymentAccount)
    {
      id v4 = (void *)objc_claimAutoreleasedReturnValue( -[PKPeerPaymentAccount associatedPassUniqueID]( prefetchedPeerPaymentAccount,  "associatedPassUniqueID"));
      id v5 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager transactionSourceIdentifiersForPassUniqueIdentifier:]( self->_databaseManager,  "transactionSourceIdentifiersForPassUniqueIdentifier:",  v4));
      databaseManager = self->_databaseManager;
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentAccount createdDate](self->_prefetchedPeerPaymentAccount, "createdDate"));
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      __int128 v9 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager transactionsForTransactionSourceIdentifiers:withTransactionType:withTransactionSource:withBackingData:startDate:endDate:limit:]( databaseManager,  "transactionsForTransactionSourceIdentifiers:withTransactionType:withTransactionSource:withBacking Data:startDate:endDate:limit:",  v5,  0LL,  0LL,  0LL,  v7,  v8,  1LL));
      __int128 v10 = (void *)objc_claimAutoreleasedReturnValue([v9 anyObject]);

      if (v10)
      {
        __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
        __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v10 transactionDate]);
        [v11 timeIntervalSinceDate:v12];
        double v14 = v13;

        self->_peerPaymentDaysSinceLastPurchaseTransaction = vcvtmd_s64_f64(v14 / 86400.0);
      }

      self->_hasQueriedPeerPaymentDaysSinceLastPurchaseTransaction = 1;
    }
  }

  return self->_peerPaymentDaysSinceLastPurchaseTransaction;
}

- (BOOL)peerPaymentHasSentP2PPayment
{
  if (!self->_hasQueriedPeerPaymentHasSentP2PPayment)
  {
    prefetchedPeerPaymentAccount = self->_prefetchedPeerPaymentAccount;
    if (prefetchedPeerPaymentAccount)
    {
      id v4 = (void *)objc_claimAutoreleasedReturnValue( -[PKPeerPaymentAccount associatedPassUniqueID]( prefetchedPeerPaymentAccount,  "associatedPassUniqueID"));
      id v5 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager transactionSourceIdentifiersForPassUniqueIdentifier:]( self->_databaseManager,  "transactionSourceIdentifiersForPassUniqueIdentifier:",  v4));
      databaseManager = self->_databaseManager;
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentAccount createdDate](self->_prefetchedPeerPaymentAccount, "createdDate"));
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      __int128 v9 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager peerPaymentTransactionServiceIdentifiersForTransactionSourceIdentifiers:withPeerPaymentSubtype:withTransactionSource:withBackingData:startDate:endDate:]( databaseManager,  "peerPaymentTransactionServiceIdentifiersForTransactionSourceIdentifiers:withPeerPaymentSubtype:wi thTransactionSource:withBackingData:startDate:endDate:",  v5,  1LL,  0LL,  0LL,  v7,  v8));
      self->_hasSentPeerPaymentP2PPayment = [v9 count] != 0;

      self->_hasQueriedPeerPaymentHasSentP2PPayment = 1;
    }
  }

  return self->_hasSentPeerPaymentP2PPayment;
}

- (BOOL)peerPaymentHasReceivedP2PPayment
{
  if (!self->_hasQueriedPeerPaymentHasReceivedP2PPayment)
  {
    prefetchedPeerPaymentAccount = self->_prefetchedPeerPaymentAccount;
    if (prefetchedPeerPaymentAccount)
    {
      id v4 = (void *)objc_claimAutoreleasedReturnValue( -[PKPeerPaymentAccount associatedPassUniqueID]( prefetchedPeerPaymentAccount,  "associatedPassUniqueID"));
      id v5 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager transactionSourceIdentifiersForPassUniqueIdentifier:]( self->_databaseManager,  "transactionSourceIdentifiersForPassUniqueIdentifier:",  v4));
      databaseManager = self->_databaseManager;
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentAccount createdDate](self->_prefetchedPeerPaymentAccount, "createdDate"));
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      __int128 v9 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager peerPaymentTransactionServiceIdentifiersForTransactionSourceIdentifiers:withPeerPaymentSubtype:withTransactionSource:withBackingData:startDate:endDate:]( databaseManager,  "peerPaymentTransactionServiceIdentifiersForTransactionSourceIdentifiers:withPeerPaymentSubtype:wi thTransactionSource:withBackingData:startDate:endDate:",  v5,  2LL,  0LL,  0LL,  v7,  v8));
      self->_hasReceivedPeerPaymentP2PPayment = [v9 count] != 0;

      self->_hasQueriedPeerPaymentHasReceivedP2PPayment = 1;
    }
  }

  return self->_hasReceivedPeerPaymentP2PPayment;
}

- (BOOL)peerPaymentHasSentDeviceTapTransaction
{
  if (!self->_hasQueriedPeerPaymentHasSentDeviceTapTransaction)
  {
    prefetchedPeerPaymentAccount = self->_prefetchedPeerPaymentAccount;
    if (prefetchedPeerPaymentAccount)
    {
      id v4 = (void *)objc_claimAutoreleasedReturnValue( -[PKPeerPaymentAccount associatedPassUniqueID]( prefetchedPeerPaymentAccount,  "associatedPassUniqueID"));
      id v5 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager transactionSourceIdentifiersForPassUniqueIdentifier:]( self->_databaseManager,  "transactionSourceIdentifiersForPassUniqueIdentifier:",  v4));
      if ([v5 count])
      {
        id v6 = objc_alloc_init(&OBJC_CLASS___PKPaymentTransactionRequest);
        [v6 setTransactionSourceIdentifiers:v5];
        [v6 setPeerPaymentSubType:1];
        [v6 setPeerPaymentPaymentMode:2];
        id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentAccount createdDate](self->_prefetchedPeerPaymentAccount, "createdDate"));
        [v6 setStartDate:v7];

        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
        [v6 setEndDate:v8];

        self->_hasSentPeerPaymentDeviceTapTransaction = (uint64_t)-[PDDatabaseManager transactionsCountForRequest:]( self->_databaseManager,  "transactionsCountForRequest:",  v6) > 0;
        self->_hasQueriedPeerPaymentHasSentDeviceTapTransaction = 1;
      }
    }
  }

  return self->_hasSentPeerPaymentDeviceTapTransaction;
}

- (BOOL)peerPaymentHasReceivedDeviceTapTransactions
{
  if (!self->_hasQueriedPeerPaymentHasReceivedDeviceTapTransaction)
  {
    prefetchedPeerPaymentAccount = self->_prefetchedPeerPaymentAccount;
    if (prefetchedPeerPaymentAccount)
    {
      id v4 = (void *)objc_claimAutoreleasedReturnValue( -[PKPeerPaymentAccount associatedPassUniqueID]( prefetchedPeerPaymentAccount,  "associatedPassUniqueID"));
      id v5 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager transactionSourceIdentifiersForPassUniqueIdentifier:]( self->_databaseManager,  "transactionSourceIdentifiersForPassUniqueIdentifier:",  v4));
      if ([v5 count])
      {
        id v6 = objc_alloc_init(&OBJC_CLASS___PKPaymentTransactionRequest);
        [v6 setTransactionSourceIdentifiers:v5];
        [v6 setPeerPaymentSubType:2];
        [v6 setPeerPaymentPaymentMode:2];
        id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentAccount createdDate](self->_prefetchedPeerPaymentAccount, "createdDate"));
        [v6 setStartDate:v7];

        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
        [v6 setEndDate:v8];

        self->_hasReceivedPeerPaymentDeviceTapTransaction = (uint64_t)-[PDDatabaseManager transactionsCountForRequest:]( self->_databaseManager,  "transactionsCountForRequest:",  v6) > 0;
        self->_hasQueriedPeerPaymentHasReceivedDeviceTapTransaction = 1;
      }
    }
  }

  return self->_hasReceivedPeerPaymentDeviceTapTransaction;
}

- (int64_t)peerPaymentNumberOfDeviceTapTransactions
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( -[PKPeerPaymentAccount associatedPassUniqueID]( self->_prefetchedPeerPaymentAccount,  "associatedPassUniqueID"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager transactionSourceIdentifiersForPassUniqueIdentifier:]( self->_databaseManager,  "transactionSourceIdentifiersForPassUniqueIdentifier:",  v3));
  if ([v4 count])
  {
    id v5 = objc_alloc_init(&OBJC_CLASS___PKPaymentTransactionRequest);
    [v5 setTransactionSourceIdentifiers:v4];
    [v5 setPeerPaymentPaymentMode:2];
    uint64_t v6 = -[PDDatabaseManager transactionsCountForRequest:](self->_databaseManager, "transactionsCountForRequest:", v5);
    uint64_t v7 = 3LL;
    uint64_t v8 = 2LL;
    if (v6 <= 2) {
      uint64_t v8 = v6 > 0;
    }
    if (v6 <= 5) {
      uint64_t v7 = v8;
    }
    if (v6 <= 9) {
      int64_t v9 = v7;
    }
    else {
      int64_t v9 = 4LL;
    }
  }

  else
  {
    int64_t v9 = 0LL;
  }

  return v9;
}

- (int64_t)daysSinceLastDeviceTapSendTransaction
{
  if (!self->_hasQueriedPeerPaymentDaysSinceLastDeviceTapSendTransaction)
  {
    prefetchedPeerPaymentAccount = self->_prefetchedPeerPaymentAccount;
    if (prefetchedPeerPaymentAccount)
    {
      id v4 = (void *)objc_claimAutoreleasedReturnValue( -[PKPeerPaymentAccount associatedPassUniqueID]( prefetchedPeerPaymentAccount,  "associatedPassUniqueID"));
      id v5 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager transactionSourceIdentifiersForPassUniqueIdentifier:]( self->_databaseManager,  "transactionSourceIdentifiersForPassUniqueIdentifier:",  v4));
      id v6 = objc_alloc_init(&OBJC_CLASS___PKPaymentTransactionRequest);
      [v6 setTransactionSourceIdentifiers:v5];
      [v6 setPeerPaymentSubType:1];
      [v6 setPeerPaymentPaymentMode:2];
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentAccount createdDate](self->_prefetchedPeerPaymentAccount, "createdDate"));
      [v6 setStartDate:v7];

      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      [v6 setEndDate:v8];

      [v6 setLimit:1];
      int64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDDatabaseManager transactionsForRequest:](self->_databaseManager, "transactionsForRequest:", v6));
      __int128 v10 = (void *)objc_claimAutoreleasedReturnValue([v9 firstObject]);

      if (v10)
      {
        __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
        __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v10 transactionDate]);
        [v11 timeIntervalSinceDate:v12];
        double v14 = v13;

        self->_peerPaymentDaysSinceLastDeviceTapSendTransaction = vcvtmd_s64_f64(v14 / 86400.0);
      }

      self->_hasQueriedPeerPaymentDaysSinceLastDeviceTapSendTransaction = 1;
    }
  }

  return self->_peerPaymentDaysSinceLastDeviceTapSendTransaction;
}

- (int64_t)peerPaymentFamilyParticipantAccounts
{
  prefetchedPeerPaymentAccount = self->_prefetchedPeerPaymentAccount;
  if (!prefetchedPeerPaymentAccount) {
    return 0LL;
  }
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( -[PKPeerPaymentAccount associatedAccountInformation]( prefetchedPeerPaymentAccount,  "associatedAccountInformation",  0LL));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 associatedAccounts]);

  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    int64_t v8 = 1LL;
LABEL_4:
    uint64_t v9 = 0LL;
    while (1)
    {
      if (*(void *)v12 != v7) {
        objc_enumerationMutation(v4);
      }
      if ([*(id *)(*((void *)&v11 + 1) + 8 * v9) role] == (id)1) {
        break;
      }
      if (v6 == (id)++v9)
      {
        id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v6) {
          goto LABEL_4;
        }
        goto LABEL_10;
      }
    }
  }

  else
  {
LABEL_10:
    int64_t v8 = 0LL;
  }

  return v8;
}

- (unint64_t)peerPaymentAccountRole
{
  unint64_t result = (unint64_t)self->_prefetchedPeerPaymentAccount;
  if (result) {
    return (unint64_t)[(id)result role];
  }
  return result;
}

- (int64_t)peerPaymentAccountDaysSinceCreatedDate
{
  uint64_t v3 = objc_claimAutoreleasedReturnValue(-[PKPeerPaymentAccount createdDate](self->_prefetchedPeerPaymentAccount, "createdDate"));
  id v4 = (void *)v3;
  if (self->_prefetchedPeerPaymentAccount) {
    BOOL v5 = v3 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    int64_t v9 = -1LL;
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    int64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 components:16 fromDate:v4 toDate:v7 options:0]);
    int64_t v9 = (int64_t)[v8 day];
  }

  return v9;
}

- (int64_t)peerPaymentAccountDaysSinceIdentifiedDate
{
  uint64_t v3 = objc_claimAutoreleasedReturnValue(-[PKPeerPaymentAccount identifiedDate](self->_prefetchedPeerPaymentAccount, "identifiedDate"));
  id v4 = (void *)v3;
  if (self->_prefetchedPeerPaymentAccount) {
    BOOL v5 = v3 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    int64_t v9 = -1LL;
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v6 timeIntervalSinceDate:v4];
    double v8 = v7;

    int64_t v9 = vcvtmd_s64_f64(v8 / 86400.0);
  }

  return v9;
}

- (int64_t)daysSinceParticipantPeerPaymentAccountIdentifiedDate
{
  prefetchedPeerPaymentAccount = self->_prefetchedPeerPaymentAccount;
  if (prefetchedPeerPaymentAccount)
  {
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( -[PKPeerPaymentAccount associatedAccountInformation]( prefetchedPeerPaymentAccount,  "associatedAccountInformation",  0LL));
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 associatedAccounts]);

    id v5 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (!v5)
    {
      int64_t v17 = -1LL;
      goto LABEL_18;
    }

    id v6 = v5;
    double v7 = 0LL;
    uint64_t v8 = *(void *)v20;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v4);
        }
        __int128 v10 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)i);
        if ([v10 role] == (id)1)
        {
          __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v10 identifiedDate]);
          __int128 v12 = v11;
          if (!v7 || [v11 compare:v7] == (id)1)
          {
            id v13 = v12;

            double v7 = v13;
          }
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }

    while (v6);

    if (v7)
    {
      __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      [v14 timeIntervalSinceDate:v7];
      double v16 = v15;

      int64_t v17 = vcvtmd_s64_f64(v16 / 86400.0);
      id v4 = v7;
LABEL_18:

      return v17;
    }
  }

  return -1LL;
}

- (BOOL)peerPaymentAccountHasSentMoneyToAnyParticipant
{
  if (self->_hasQueriedPeerPaymentHasSentMoneyToAnyParticipant) {
    return self->_hasSentMoneyToAnyParticipant;
  }
  if (!self->_prefetchedPeerPaymentAccount) {
    return self->_hasSentMoneyToAnyParticipant;
  }
  prefetchedFamilyMembers = self->_prefetchedFamilyMembers;
  if (!prefetchedFamilyMembers) {
    return self->_hasSentMoneyToAnyParticipant;
  }
  self->_hasQueriedPeerPaymentHasSentMoneyToAnyParticipant = 1;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  id v5 = prefetchedFamilyMembers;
  id v6 = (NSMutableSet *)-[NSArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v31,  v36,  16LL);
  if (v6)
  {
    uint64_t v7 = *(void *)v32;
    while (2)
    {
      for (i = 0LL; i != v6; i = (NSMutableSet *)((char *)i + 1))
      {
        if (*(void *)v32 != v7) {
          objc_enumerationMutation(v5);
        }
        int64_t v9 = *(void **)(*((void *)&v31 + 1) + 8LL * (void)i);
        if ([v9 isMe])
        {
          __int128 v10 = objc_alloc(&OBJC_CLASS___NSMutableSet);
          __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v9 appleIDAliases]);
          id v6 = -[NSMutableSet initWithSet:](v10, "initWithSet:", v11);

          __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v9 appleID]);
          -[NSMutableSet addObject:](v6, "addObject:", v12);

          goto LABEL_15;
        }
      }

      id v6 = (NSMutableSet *)-[NSArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v31,  v36,  16LL);
      if (v6) {
        continue;
      }
      break;
    }
  }

- (BOOL)familyCircleFamilyOrganizer
{
  if (!self->_hasQueriedFamilyCircleFamilyOrganizer)
  {
    prefetchedFamilyMembers = self->_prefetchedFamilyMembers;
    if (prefetchedFamilyMembers)
    {
      __int128 v13 = 0u;
      __int128 v14 = 0u;
      __int128 v11 = 0u;
      __int128 v12 = 0u;
      id v4 = prefetchedFamilyMembers;
      id v5 = -[NSArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
      if (v5)
      {
        uint64_t v6 = *(void *)v12;
LABEL_5:
        uint64_t v7 = 0LL;
        while (1)
        {
          if (*(void *)v12 != v6) {
            objc_enumerationMutation(v4);
          }
          uint64_t v8 = *(void **)(*((void *)&v11 + 1) + 8 * v7);
          if (v5 == (id)++v7)
          {
            id v5 = -[NSArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
            if (v5) {
              goto LABEL_5;
            }
            goto LABEL_14;
          }
        }

        int64_t v9 = v8;

        if (v9)
        {
          LOBYTE(v5) = -[NSArray isOrganizer](v9, "isOrganizer");
          id v4 = v9;
          goto LABEL_14;
        }

        LOBYTE(v5) = 0;
      }

      else
      {
LABEL_14:
      }

      self->_familyCircleFamilyOrganizer = (char)v5;
      self->_hasQueriedFamilyCircleFamilyOrganizer = 1;
    }
  }

  return self->_familyCircleFamilyOrganizer;
}

- (BOOL)familyCircleParent
{
  if (!self->_hasQueriedFamilyCircleParent)
  {
    prefetchedFamilyMembers = self->_prefetchedFamilyMembers;
    if (prefetchedFamilyMembers)
    {
      __int128 v15 = 0u;
      __int128 v16 = 0u;
      __int128 v13 = 0u;
      __int128 v14 = 0u;
      id v4 = prefetchedFamilyMembers;
      id v5 = -[NSArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
      if (v5)
      {
        id v6 = v5;
        uint64_t v7 = *(void *)v14;
        while (2)
        {
          for (i = 0LL; i != v6; i = (char *)i + 1)
          {
            if (*(void *)v14 != v7) {
              objc_enumerationMutation(v4);
            }
            int64_t v9 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
            if (objc_msgSend(v9, "isMe", (void)v13))
            {
              id v11 = v9;

              self->_hasQueriedFamilyCircleParent = 1;
              if (v11)
              {
                unsigned __int8 v10 = [v11 isParent];
              }

              else
              {
                unsigned __int8 v10 = 0;
              }

              goto LABEL_15;
            }
          }

          id v6 = -[NSArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
          if (v6) {
            continue;
          }
          break;
        }
      }

      unsigned __int8 v10 = 0;
      self->_hasQueriedFamilyCircleParent = 1;
LABEL_15:
      self->_familyCircleParent = v10;
    }
  }

  return self->_familyCircleParent;
}

- (BOOL)familyCircleHasFamily
{
  if (!self->_hasQueriedFamilyCircleHasFamily)
  {
    prefetchedFamilyMembers = self->_prefetchedFamilyMembers;
    if (prefetchedFamilyMembers)
    {
      self->_familyCircleHasFamily = -[NSArray count](prefetchedFamilyMembers, "count") != 0;
      self->_hasQueriedFamilyCircleHasFamily = 1;
    }
  }

  return self->_familyCircleHasFamily;
}

- (int64_t)familyCircleCurrentUserAge
{
  if (!self->_hasQueriedFamilyCircleCurrentUserAge)
  {
    prefetchedFamilyMembers = self->_prefetchedFamilyMembers;
    if (prefetchedFamilyMembers)
    {
      __int128 v19 = 0u;
      __int128 v20 = 0u;
      __int128 v17 = 0u;
      __int128 v18 = 0u;
      id v4 = prefetchedFamilyMembers;
      id v5 = -[NSArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v17,  v23,  16LL);
      if (v5)
      {
        uint64_t v6 = *(void *)v18;
        while (2)
        {
          for (i = 0LL; i != v5; i = (char *)i + 1)
          {
            if (*(void *)v18 != v6) {
              objc_enumerationMutation(v4);
            }
            uint64_t v8 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
            if (objc_msgSend(v8, "isMe", (void)v17))
            {
              id v5 = v8;
              goto LABEL_13;
            }
          }

          id v5 = -[NSArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v17,  v23,  16LL);
          if (v5) {
            continue;
          }
          break;
        }
      }

- (int64_t)familyCircleMembersUnderAge
{
  if (!self->_hasQueriedFamilyCircleMembersUnderAge)
  {
    prefetchedFamilyMembers = self->_prefetchedFamilyMembers;
    if (prefetchedFamilyMembers)
    {
      __int128 v14 = 0u;
      __int128 v15 = 0u;
      __int128 v12 = 0u;
      __int128 v13 = 0u;
      id v4 = prefetchedFamilyMembers;
      id v5 = -[NSArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
      if (v5)
      {
        id v6 = v5;
        int64_t v7 = 0LL;
        uint64_t v8 = *(void *)v13;
        do
        {
          for (i = 0LL; i != v6; i = (char *)i + 1)
          {
            if (*(void *)v13 != v8) {
              objc_enumerationMutation(v4);
            }
            unsigned __int8 v10 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)i);
            if ((objc_msgSend(v10, "isMe", (void)v12) & 1) == 0
              && (unint64_t)[v10 age] < 0x12)
            {
              ++v7;
            }
          }

          id v6 = -[NSArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
        }

        while (v6);
      }

      else
      {
        int64_t v7 = 0LL;
      }

      self->_familyCircleMembersUnderAge = v7;
      self->_hasQueriedFamilyCircleMembersUnderAge = 1;
    }
  }

  return self->_familyCircleMembersUnderAge;
}

- (int64_t)familyCircleMembersCount
{
  if (!self->_hasQueriedfamilyCircleMembersCount)
  {
    prefetchedFamilyMembers = self->_prefetchedFamilyMembers;
    if (prefetchedFamilyMembers)
    {
      self->_familyCircleMembersCount = -[NSArray count](prefetchedFamilyMembers, "count");
      self->_hasQueriedfamilyCircleMembersCount = 1;
    }
  }

  return self->_familyCircleMembersCount;
}

- (int64_t)familyCircleDaysSinceNewestJoinedDate
{
  prefetchedFamilyMembers = self->_prefetchedFamilyMembers;
  if (prefetchedFamilyMembers && !self->_hasQueriedFamilyCircleDaysSinceNewestJoinedDate)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue( -[NSArray pk_arrayByApplyingBlock:]( prefetchedFamilyMembers,  "pk_arrayByApplyingBlock:",  &stru_1006441D8));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 sortedArrayUsingSelector:"compare:"]);

    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 lastObject]);
    int64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 components:16 fromDate:v6 toDate:v8 options:0]);
    self->_familyCircleDaysSinceNewestJoinedDate = (int64_t)[v9 day];

    self->_hasQueriedFamilyCircleDaysSinceNewestJoinedDate = 1;
  }

  return self->_familyCircleDaysSinceNewestJoinedDate;
}

- (int64_t)familyCircleMinimumMemberAge
{
  if (!self->_hasQueriedFamilyCircleMinimumMemberAge)
  {
    prefetchedFamilyMembers = self->_prefetchedFamilyMembers;
    if (prefetchedFamilyMembers)
    {
      __int128 v14 = 0u;
      __int128 v15 = 0u;
      __int128 v12 = 0u;
      __int128 v13 = 0u;
      id v4 = prefetchedFamilyMembers;
      id v5 = -[NSArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
      if (v5)
      {
        id v6 = v5;
        uint64_t v7 = *(void *)v13;
        unint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
        do
        {
          for (i = 0LL; i != v6; i = (char *)i + 1)
          {
            if (*(void *)v13 != v7) {
              objc_enumerationMutation(v4);
            }
            unsigned __int8 v10 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)i);
          }

          id v6 = -[NSArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
        }

        while (v6);
      }

      else
      {
        unint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
      }

      self->_familyCircleMinimumMemberAge = v8;
      self->_hasQueriedFamilyCircleMinimumMemberAge = 1;
    }
  }

  return self->_familyCircleMinimumMemberAge;
}

- (int64_t)familyCircleAgeCategory
{
  if (self->_prefetchedFamilyMemberType) {
    return -1LL;
  }
  else {
    return 0LL;
  }
}

- (id)discoveryItemStatus
{
  discoveryItemStatus = self->_discoveryItemStatus;
  if (!discoveryItemStatus)
  {
    id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    id v5 = self->_discoveryItemStatus;
    self->_discoveryItemStatus = v4;

    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PDDatabaseManager discoveryItems](self->_databaseManager, "discoveryItems", 0LL));
    id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v17;
      do
      {
        for (i = 0LL; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
          __int128 v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [v11 status]));
          __int128 v13 = self->_discoveryItemStatus;
          __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v11 identifier]);
          -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v12, v14);
        }

        id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }

      while (v8);
    }

    discoveryItemStatus = self->_discoveryItemStatus;
  }

  return -[NSMutableDictionary copy](discoveryItemStatus, "copy");
}

- (NSSet)discoveryItemsWithActiveStatus
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 2LL));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PDUserEvaluationEnvironment discoveryItemStatus](self, "discoveryItemStatus"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allKeysForObject:v3]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v5));

  return (NSSet *)v6;
}

- (NSSet)discoveryItemsWithActionedStatus
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 3LL));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PDUserEvaluationEnvironment discoveryItemStatus](self, "discoveryItemStatus"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allKeysForObject:v3]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v5));

  return (NSSet *)v6;
}

- (NSSet)discoveryItemsWithDismissedStatus
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 4LL));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PDUserEvaluationEnvironment discoveryItemStatus](self, "discoveryItemStatus"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allKeysForObject:v3]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v5));

  return (NSSet *)v6;
}

- (NSSet)discoveryItemsWithWaitingForTriggerStatus
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 5LL));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PDUserEvaluationEnvironment discoveryItemStatus](self, "discoveryItemStatus"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allKeysForObject:v3]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v5));

  return (NSSet *)v6;
}

- (NSSet)discoveryItemsExpanded
{
  discoveryItemsExpanded = self->_discoveryItemsExpanded;
  if (!discoveryItemsExpanded)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue( -[PDDiscoveryManager identifiersOfTappedDiscoveryItems]( self->_discoveryManager,  "identifiersOfTappedDiscoveryItems"));
    id v5 = v4;
    if (v4) {
      id v6 = v4;
    }
    else {
      id v6 = objc_alloc_init(&OBJC_CLASS___NSSet);
    }
    id v7 = self->_discoveryItemsExpanded;
    self->_discoveryItemsExpanded = v6;

    discoveryItemsExpanded = self->_discoveryItemsExpanded;
  }

  return discoveryItemsExpanded;
}

- (NSSet)discoveryItemsDismissed
{
  discoveryItemsDismissed = self->_discoveryItemsDismissed;
  if (!discoveryItemsDismissed)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue( -[PDDiscoveryManager identifiersOfDismissedDiscoveryItems]( self->_discoveryManager,  "identifiersOfDismissedDiscoveryItems"));
    id v5 = v4;
    if (v4) {
      id v6 = v4;
    }
    else {
      id v6 = objc_alloc_init(&OBJC_CLASS___NSSet);
    }
    id v7 = self->_discoveryItemsDismissed;
    self->_discoveryItemsDismissed = v6;

    discoveryItemsDismissed = self->_discoveryItemsDismissed;
  }

  return discoveryItemsDismissed;
}

- (NSSet)discoveryCTAsTapped
{
  discoveryCTAsTapped = self->_discoveryCTAsTapped;
  if (!discoveryCTAsTapped)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue( -[PDDiscoveryManager identifiersOfTappedDiscoveryItems]( self->_discoveryManager,  "identifiersOfTappedDiscoveryItems"));
    id v5 = v4;
    if (v4) {
      id v6 = v4;
    }
    else {
      id v6 = objc_alloc_init(&OBJC_CLASS___NSSet);
    }
    id v7 = self->_discoveryCTAsTapped;
    self->_discoveryCTAsTapped = v6;

    discoveryCTAsTapped = self->_discoveryCTAsTapped;
  }

  return discoveryCTAsTapped;
}

- (NSSet)discoveryCTAsCompleted
{
  discoveryCTAsCompleted = self->_discoveryCTAsCompleted;
  if (!discoveryCTAsCompleted)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue( -[PDDiscoveryManager identifiersOfCompletedDiscoveryItems]( self->_discoveryManager,  "identifiersOfCompletedDiscoveryItems"));
    id v5 = v4;
    if (v4) {
      id v6 = v4;
    }
    else {
      id v6 = objc_alloc_init(&OBJC_CLASS___NSSet);
    }
    id v7 = self->_discoveryCTAsCompleted;
    self->_discoveryCTAsCompleted = v6;

    discoveryCTAsCompleted = self->_discoveryCTAsCompleted;
  }

  return discoveryCTAsCompleted;
}

- (BOOL)hasPayLaterAccount
{
  return self->_prefetchedPayLaterAccount != 0LL;
}

- (BOOL)hasEverProvisionedPayLaterPass
{
  if (!self->_hasQueriedHasEverProvisionedPayLaterPass)
  {
    prefetchedPayLaterAccount = self->_prefetchedPayLaterAccount;
    if (prefetchedPayLaterAccount)
    {
      self->_hasQueriedHasEverProvisionedPayLaterPass = 1;
      id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PKAccount payLaterDetails](prefetchedPayLaterAccount, "payLaterDetails"));
      self->_hasEverProvisionedPayLaterPass = [v4 hasProvisionedPass];
    }
  }

  return self->_hasEverProvisionedPayLaterPass;
}

- (BOOL)hasPayLaterPass
{
  if (!self->_hasQueriedHasPayLaterPass)
  {
    prefetchedPayLaterAccount = self->_prefetchedPayLaterAccount;
    if (prefetchedPayLaterAccount)
    {
      self->_hasQueriedHasPayLaterPass = 1;
      id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PKAccount associatedPassUniqueID](prefetchedPayLaterAccount, "associatedPassUniqueID"));
      self->_hasPayLaterPass = -[PDDatabaseManager passExistsWithUniqueID:]( self->_databaseManager,  "passExistsWithUniqueID:",  v4);
    }
  }

  return self->_hasPayLaterPass;
}

- (int64_t)payLaterNumberOfLoans
{
  if (!self->_hasQueriedPayLaterNumberOfLoans)
  {
    prefetchedPayLaterFinancingPlans = self->_prefetchedPayLaterFinancingPlans;
    if (prefetchedPayLaterFinancingPlans)
    {
      self->_payLaterNumberOfLoans = -[NSArray count](prefetchedPayLaterFinancingPlans, "count");
      self->_hasQueriedPayLaterNumberOfLoans = 1;
    }
  }

  return self->_payLaterNumberOfLoans;
}

- (int64_t)payLaterDaysSinceFirstActiveLoan
{
  if (!self->_hasQueriedPayLaterDaysSinceFirstActiveLoan)
  {
    prefetchedPayLaterFinancingPlans = self->_prefetchedPayLaterFinancingPlans;
    if (prefetchedPayLaterFinancingPlans)
    {
      id v4 = (void *)objc_claimAutoreleasedReturnValue( -[NSArray pk_objectsPassingTest:]( prefetchedPayLaterFinancingPlans,  "pk_objectsPassingTest:",  &stru_100644218));
      id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  @"planSummary.transactionDate",  1LL));
      __int128 v15 = v5;
      id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v15, 1LL));
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 sortedArrayUsingDescriptors:v6]);
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 firstObject]);

      if (v8)
      {
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
        unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue([v8 planSummary]);
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 transactionDate]);
        [v9 timeIntervalSinceDate:v11];
        double v13 = v12;

        self->_payLaterDaysSinceFirstActiveLoan = vcvtmd_s64_f64(v13 / 86400.0);
      }

      self->_hasQueriedPayLaterDaysSinceFirstActiveLoan = 1;
    }
  }

  return self->_payLaterDaysSinceFirstActiveLoan;
}

- (int64_t)payLaterNumberOfActiveLoans
{
  if (!self->_hasQueriedPayLaterNumberOfActiveLoans && self->_prefetchedPayLaterFinancingPlans)
  {
    self->_payLaterNumberOfActiveLoans = -[PDUserEvaluationEnvironment _countOfFinancingPlansWithSate:]( self,  "_countOfFinancingPlansWithSate:",  1LL);
    self->_hasQueriedPayLaterNumberOfActiveLoans = 1;
  }

  return self->_payLaterNumberOfActiveLoans;
}

- (int64_t)payLaterNumberOfPendingLoans
{
  if (!self->_hasQueriedPayLaterNumberOfPendingLoans && self->_prefetchedPayLaterFinancingPlans)
  {
    int64_t v3 = -[PDUserEvaluationEnvironment _countOfFinancingPlansWithSate:](self, "_countOfFinancingPlansWithSate:", 2LL);
    self->_payLaterNumberOfPendingLoans = -[PDUserEvaluationEnvironment _countOfFinancingPlansWithSate:]( self,  "_countOfFinancingPlansWithSate:",  3LL)
                                        + v3;
    self->_hasQueriedPayLaterNumberOfPendingLoans = 1;
  }

  return self->_payLaterNumberOfPendingLoans;
}

- (int64_t)payLaterNumberOfDelinquentLoans
{
  if (!self->_hasQueriedPayLaterNumberOfDelinquentLoans && self->_prefetchedPayLaterFinancingPlans)
  {
    self->_payLaterNumberOfDelinquentLoans = -[PDUserEvaluationEnvironment _countOfFinancingPlansWithSate:]( self,  "_countOfFinancingPlansWithSate:",  4LL);
    self->_hasQueriedPayLaterNumberOfDelinquentLoans = 1;
  }

  return self->_payLaterNumberOfDelinquentLoans;
}

- (int64_t)payLaterNumberOfCanceledLoans
{
  if (!self->_hasQueriedPayLaterNumberOfCanceledLoans && self->_prefetchedPayLaterFinancingPlans)
  {
    self->_payLaterNumberOfCanceledLoans = -[PDUserEvaluationEnvironment _countOfFinancingPlansWithSate:]( self,  "_countOfFinancingPlansWithSate:",  5LL);
    self->_hasQueriedPayLaterNumberOfCanceledLoans = 1;
  }

  return self->_payLaterNumberOfCanceledLoans;
}

- (int64_t)payLaterNumberOfCompleteLoans
{
  if (!self->_hasQueriedPayLaterNumberOfCompleteLoans && self->_prefetchedPayLaterFinancingPlans)
  {
    self->_payLaterNumberOfCompleteLoans = -[PDUserEvaluationEnvironment _countOfFinancingPlansWithSate:]( self,  "_countOfFinancingPlansWithSate:",  6LL);
    self->_hasQueriedPayLaterNumberOfCompleteLoans = 1;
  }

  return self->_payLaterNumberOfCompleteLoans;
}

- (int64_t)_countOfFinancingPlansOfType:(unint64_t)a3
{
  prefetchedPayLaterFinancingPlans = self->_prefetchedPayLaterFinancingPlans;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100104C88;
  v5[3] = &unk_100644238;
  v5[4] = a3;
  return (int64_t)-[NSArray pk_countObjectsPassingTest:]( prefetchedPayLaterFinancingPlans,  "pk_countObjectsPassingTest:",  v5);
}

- (int64_t)_countOfFinancingPlansWithSate:(unint64_t)a3
{
  prefetchedPayLaterFinancingPlans = self->_prefetchedPayLaterFinancingPlans;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100104D0C;
  v5[3] = &unk_100644238;
  v5[4] = a3;
  return (int64_t)-[NSArray pk_countObjectsPassingTest:]( prefetchedPayLaterFinancingPlans,  "pk_countObjectsPassingTest:",  v5);
}

- (BOOL)hasSavingsAccount
{
  return self->_prefetchedSavingsAccount != 0LL;
}

- (int64_t)savingsAccountDaysSinceCreatedDate
{
  uint64_t v3 = objc_claimAutoreleasedReturnValue(-[PKAccount createdDate](self->_prefetchedSavingsAccount, "createdDate"));
  id v4 = (void *)v3;
  if (self->_prefetchedSavingsAccount) {
    BOOL v5 = v3 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    int64_t v9 = -1LL;
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 components:16 fromDate:v4 toDate:v7 options:0]);
    int64_t v9 = (int64_t)[v8 day];
  }

  return v9;
}

- (BOOL)savingsAccountHasExternalTransferIn
{
  if (self->_hasQueriedSavingsAccountExternalTransferInTransaction) {
    return self->_hasSavingsAccountExternalTransferInTransaction;
  }
  BOOL result = -[PDUserEvaluationEnvironment _hasSavingsAccountAccountTransactionOfTransactionType:fundingSourceTypes:]( self,  "_hasSavingsAccountAccountTransactionOfTransactionType:fundingSourceTypes:",  6LL,  &off_100690F38);
  self->_hasSavingsAccountExternalTransferInTransaction = result;
  self->_hasQueriedSavingsAccountExternalTransferInTransaction = 1;
  return result;
}

- (BOOL)savingsAccountHasExternalTransferOut
{
  if (self->_hasQueriedSavingsAccountExternalTransferOutTransaction) {
    return self->_hasSavingsAccountExternalTransferOutTransaction;
  }
  BOOL result = -[PDUserEvaluationEnvironment _hasSavingsAccountAccountTransactionOfTransactionType:fundingSourceTypes:]( self,  "_hasSavingsAccountAccountTransactionOfTransactionType:fundingSourceTypes:",  5LL,  &off_100690F50);
  self->_hasSavingsAccountExternalTransferOutTransaction = result;
  self->_hasQueriedSavingsAccountExternalTransferOutTransaction = 1;
  return result;
}

- (BOOL)savingsAccountHasCashTransferIn
{
  if (self->_hasQueriedSavingsAccountCashTransferInTransaction) {
    return self->_hasSavingsAccountCashTransferInTransaction;
  }
  BOOL result = -[PDUserEvaluationEnvironment _hasSavingsAccountAccountTransactionOfTransactionType:fundingSourceTypes:]( self,  "_hasSavingsAccountAccountTransactionOfTransactionType:fundingSourceTypes:",  6LL,  &off_100690F68);
  self->_hasSavingsAccountCashTransferInTransaction = result;
  self->_hasQueriedSavingsAccountCashTransferInTransaction = 1;
  return result;
}

- (int64_t)savingsAccountBinnedBalance
{
  prefetchedSavingsAccount = self->_prefetchedSavingsAccount;
  if (!prefetchedSavingsAccount) {
    return -1LL;
  }
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[PKAccount savingsDetails](prefetchedSavingsAccount, "savingsDetails"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 accountSummary]);
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 currentBalance]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 currencyCode]);
  id v7 = v6;
  if (v5 && [v6 isEqualToString:@"USD"])
  {
    uint64_t v8 = PKCurrencyAmountMake(v5, v7);
    int64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue([v9 amountByConvertingToSmallestCommonCurrencyUnit]);
    uint64_t v11 = (uint64_t)[v10 longLongValue];

    if (v11 <= 14999999)
    {
      if (v11 <= 9999999)
      {
        if (v11 <= 7499999)
        {
          if (v11 <= 4999999)
          {
            if (v11 <= 1999999)
            {
              if (v11 <= 999999)
              {
                if (v11 <= 499999)
                {
                  if (v11 <= 399999)
                  {
                    if (v11 <= 299999)
                    {
                      if (v11 <= 199999)
                      {
                        if (v11 <= 149999)
                        {
                          if (v11 <= 99999)
                          {
                            if (v11 <= 74999)
                            {
                              if (v11 <= 49999)
                              {
                                if (v11 <= 24999) {
                                  int64_t v12 = 0LL;
                                }
                                else {
                                  int64_t v12 = 250LL;
                                }
                              }

                              else
                              {
                                int64_t v12 = 500LL;
                              }
                            }

                            else
                            {
                              int64_t v12 = 750LL;
                            }
                          }

                          else
                          {
                            int64_t v12 = 1000LL;
                          }
                        }

                        else
                        {
                          int64_t v12 = 1500LL;
                        }
                      }

                      else
                      {
                        int64_t v12 = 2000LL;
                      }
                    }

                    else
                    {
                      int64_t v12 = 3000LL;
                    }
                  }

                  else
                  {
                    int64_t v12 = 4000LL;
                  }
                }

                else
                {
                  int64_t v12 = 5000LL;
                }
              }

              else
              {
                int64_t v12 = 10000LL;
              }
            }

            else
            {
              int64_t v12 = 20000LL;
            }
          }

          else
          {
            int64_t v12 = 50000LL;
          }
        }

        else
        {
          int64_t v12 = 75000LL;
        }
      }

      else
      {
        int64_t v12 = 100000LL;
      }
    }

    else
    {
      int64_t v12 = 150000LL;
    }
  }

  else
  {
    int64_t v12 = -1LL;
  }

  return v12;
}

- (BOOL)_hasPaymentOfferCriteriaOfType:(unint64_t)a3
{
  prefetchedPaymentOfferCatalog = self->_prefetchedPaymentOfferCatalog;
  if (!prefetchedPaymentOfferCatalog) {
    return 0;
  }
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[PKPaymentOfferCatalog catalog](prefetchedPaymentOfferCatalog, "catalog"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1001051B8;
  v8[3] = &unk_100644258;
  v8[4] = a3;
  unsigned __int8 v6 = objc_msgSend(v5, "pk_containsObjectPassingTest:", v8);

  return v6;
}

- (BOOL)hasIssuerInstallmentCard
{
  return -[PDUserEvaluationEnvironment _hasPaymentOfferCriteriaOfType:](self, "_hasPaymentOfferCriteriaOfType:", 1LL);
}

- (BOOL)hasEverMadeIssuerInstallmentTransaction
{
  return PKSharedCacheGetBoolForKey(PKSharedCacheHasEverMadeIssuerInstallmentTransaction, a2);
}

- (BOOL)hasPayWithRewardsCard
{
  return -[PDUserEvaluationEnvironment _hasPaymentOfferCriteriaOfType:](self, "_hasPaymentOfferCriteriaOfType:", 2LL);
}

- (BOOL)hasEverMadePayWithRewardsTransaction
{
  return PKSharedCacheGetBoolForKey(PKSharedCacheHasEverMadePayWithRewardsTransaction, a2);
}

- (BOOL)hasAppleAccountCardProvisioned
{
  if (!self->_hasQueriedHasAppleAccountCard)
  {
    prefetchedAppleBalanceAccount = self->_prefetchedAppleBalanceAccount;
    if (prefetchedAppleBalanceAccount)
    {
      self->_hasQueriedHasAppleAccountCard = 1;
      id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PKAccount associatedPassUniqueID](prefetchedAppleBalanceAccount, "associatedPassUniqueID"));
      self->_hasAppleAccountCard = -[PDDatabaseManager passExistsWithUniqueID:]( self->_databaseManager,  "passExistsWithUniqueID:",  v4);
    }
  }

  return self->_hasAppleAccountCard;
}

- (int64_t)daysSinceAppleAccountInStoreTopUp
{
  if (!self->_hasQueriedDaysSinceAppleAccountInStoreTopUp)
  {
    self->_hasQueriedDaysSinceAppleAccountInStoreTopUp = 1;
    self->_daysSinceAppleAccountInStoreTopUp = -1LL;
    prefetchedAppleBalanceAccount = self->_prefetchedAppleBalanceAccount;
    if (prefetchedAppleBalanceAccount)
    {
      id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PKAccount associatedPassUniqueID](prefetchedAppleBalanceAccount, "associatedPassUniqueID"));
      BOOL v5 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager transactionSourceIdentifiersForPassUniqueIdentifier:]( self->_databaseManager,  "transactionSourceIdentifiersForPassUniqueIdentifier:",  v4));
      id v6 = objc_alloc_init(&OBJC_CLASS___PKPaymentTransactionRequest);
      [v6 setTransactionSourceIdentifiers:v5];
      [v6 setTransactionTypes:&off_100690F80];
      [v6 setTopUpSubtype:6];
      [v6 setLimit:1];
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDDatabaseManager transactionsForRequest:](self->_databaseManager, "transactionsForRequest:", v6));
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 firstObject]);

      if (v8)
      {
        int64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
        unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue([v8 transactionDate]);
        [v9 timeIntervalSinceDate:v10];
        double v12 = v11;

        self->_daysSinceAppleAccountInStoreTopUp = vcvtmd_s64_f64(v12 / 86400.0);
      }
    }
  }

  return self->_daysSinceAppleAccountInStoreTopUp;
}

- (NSSet)enrolledAuthenticationMechanisms
{
  prefetchedEnrolledAuthenticationMechanisms = self->_prefetchedEnrolledAuthenticationMechanisms;
  if (!prefetchedEnrolledAuthenticationMechanisms)
  {
    id v4 = -[NSMutableSet initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableSet), "initWithCapacity:", 4LL);
    id v6 = (NSSet *)-[NSMutableSet copy](v4, "copy");
    id v7 = self->_prefetchedEnrolledAuthenticationMechanisms;
    self->_prefetchedEnrolledAuthenticationMechanisms = v6;

    prefetchedEnrolledAuthenticationMechanisms = self->_prefetchedEnrolledAuthenticationMechanisms;
  }

  return prefetchedEnrolledAuthenticationMechanisms;
}

- (void)preflightForKeys:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v25 = a4;
  id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v29;
    do
    {
      double v11 = 0LL;
      do
      {
        if (*(void *)v29 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = PDUEEKeyFromString(*(void **)(*((void *)&v28 + 1) + 8LL * (void)v11));
        double v13 = &off_10068FD38;
        switch(v12)
        {
          case 3LL:
            double v13 = &off_10068FDB0;
            goto LABEL_25;
          case 4LL:
          case 5LL:
          case 6LL:
          case 7LL:
          case 8LL:
          case 9LL:
          case 10LL:
          case 11LL:
          case 12LL:
          case 13LL:
          case 14LL:
          case 15LL:
          case 16LL:
          case 17LL:
          case 18LL:
          case 19LL:
          case 20LL:
          case 21LL:
          case 22LL:
          case 23LL:
          case 24LL:
          case 25LL:
          case 26LL:
          case 27LL:
          case 28LL:
          case 29LL:
          case 30LL:
          case 31LL:
          case 32LL:
          case 33LL:
          case 34LL:
          case 35LL:
          case 36LL:
          case 40LL:
          case 41LL:
          case 42LL:
          case 47LL:
          case 48LL:
          case 49LL:
          case 50LL:
            -[NSMutableSet addObject:](v6, "addObject:", &off_10068FD08);
            -[NSMutableSet addObject:](v6, "addObject:", &off_10068FCF0);
            double v13 = &off_10068FD68;
            goto LABEL_25;
          case 37LL:
          case 38LL:
          case 39LL:
            goto LABEL_25;
          case 43LL:
            -[NSMutableSet addObject:](v6, "addObject:", &off_10068FDC8);
            goto LABEL_21;
          case 44LL:
            -[NSMutableSet addObject:](v6, "addObject:", &off_10068FDC8);
            __int128 v14 = v6;
            __int128 v15 = &off_10068FD08;
            goto LABEL_23;
          case 45LL:
          case 46LL:
          case 112LL:
LABEL_21:
            double v13 = &off_10068FD08;
            goto LABEL_25;
          case 51LL:
          case 52LL:
            double v13 = &off_10068FCF0;
            goto LABEL_25;
          case 64LL:
          case 65LL:
          case 66LL:
          case 67LL:
          case 68LL:
          case 69LL:
          case 70LL:
          case 71LL:
          case 72LL:
          case 73LL:
          case 75LL:
          case 76LL:
          case 78LL:
          case 79LL:
          case 80LL:
          case 81LL:
          case 83LL:
          case 84LL:
          case 85LL:
          case 86LL:
          case 87LL:
          case 88LL:
          case 89LL:
          case 90LL:
          case 91LL:
          case 92LL:
          case 93LL:
          case 94LL:
            double v13 = &off_10068FD20;
            goto LABEL_25;
          case 74LL:
          case 82LL:
            __int128 v14 = v6;
            __int128 v15 = &off_10068FD20;
LABEL_23:
            -[NSMutableSet addObject:](v14, "addObject:", v15, v25);
            goto LABEL_24;
          case 95LL:
          case 96LL:
          case 97LL:
          case 98LL:
          case 99LL:
          case 100LL:
          case 101LL:
          case 102LL:
LABEL_24:
            double v13 = &off_10068FD80;
            goto LABEL_25;
          case 103LL:
            double v13 = &off_10068FD98;
            goto LABEL_25;
          case 121LL:
          case 122LL:
          case 123LL:
            double v13 = &off_10068FD50;
            goto LABEL_25;
          case 124LL:
            double v13 = &off_10068FE10;
            goto LABEL_25;
          case 125LL:
          case 126LL:
          case 127LL:
          case 128LL:
          case 129LL:
          case 130LL:
            double v13 = &off_10068FE28;
            goto LABEL_25;
          case 131LL:
            double v13 = &off_10068FE40;
            goto LABEL_25;
          case 132LL:
          case 134LL:
          case 135LL:
            double v13 = &off_10068FDE0;
            goto LABEL_25;
          case 136LL:
          case 137LL:
          case 138LL:
          case 139LL:
          case 140LL:
          case 141LL:
          case 142LL:
            double v13 = &off_10068FDF8;
            goto LABEL_25;
          case 143LL:
          case 144LL:
          case 145LL:
          case 146LL:
          case 147LL:
          case 148LL:
            double v13 = &off_10068FE58;
            goto LABEL_25;
          case 150LL:
          case 152LL:
            double v13 = &off_10068FE70;
            goto LABEL_25;
          case 154LL:
          case 155LL:
            double v13 = &off_10068FE88;
LABEL_25:
            -[NSMutableSet addObject:](v6, "addObject:", v13, v25);
            break;
          default:
            break;
        }

        double v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v16 = [v7 countByEnumeratingWithState:&v28 objects:v32 count:16];
      id v9 = v16;
    }

    while (v16);
  }

  id v17 = -[NSMutableSet containsObject:](v6, "containsObject:", &off_10068FE28);
  if ((_DWORD)v17)
  {
    if (self->_rulesNeedLocation) {
      goto LABEL_37;
    }
    BOOL v18 = 1;
  }

  else
  {
    if (!self->_rulesNeedLocation) {
      goto LABEL_37;
    }
    BOOL v18 = 0;
  }

  self->_rulesNeedLocation = v18;
  -[PDDiscoveryManager setRulesNeedLocation:](self->_discoveryManager, "setRulesNeedLocation:", v17, v25);
LABEL_37:
  id v19 = -[NSMutableSet containsObject:](v6, "containsObject:", &off_10068FE40, v25);
  if ((_DWORD)v19)
  {
    if (self->_rulesNeedPlacemark) {
      goto LABEL_43;
    }
    BOOL v20 = 1;
  }

  else
  {
    if (!self->_rulesNeedPlacemark) {
      goto LABEL_43;
    }
    BOOL v20 = 0;
  }

  self->_rulesNeedPlacemark = v20;
  -[PDDiscoveryManager setRulesNeedPlacemark:](self->_discoveryManager, "setRulesNeedPlacemark:", v19);
LABEL_43:
  -[PDUserEvaluationEnvironment _prefetchDataSources:completion:](self, "_prefetchDataSources:completion:", v6, v26);
  if ([v7 containsObject:@"hasTransitPassForCurrentLocation"])
  {
    databaseManager = self->_databaseManager;
    __int128 v22 = (void *)objc_claimAutoreleasedReturnValue( -[PDUserEvaluationEnvironment supportedTransitNetworksForCurrentLocation]( self,  "supportedTransitNetworksForCurrentLocation"));
    self->_hasTransitPassForCurrentLocation = -[PDDatabaseManager passExistsForTransitNetworks:isTransitCard:expired:]( databaseManager,  "passExistsForTransitNetworks:isTransitCard:expired:",  v22,  1LL,  0LL);
  }

  if ([v7 containsObject:@"hasUnexpiredTransitPassForCurrentLocation"])
  {
    __int128 v23 = self->_databaseManager;
    __int128 v24 = (void *)objc_claimAutoreleasedReturnValue( -[PDUserEvaluationEnvironment supportedTransitNetworksForCurrentLocation]( self,  "supportedTransitNetworksForCurrentLocation"));
    self->_hasUnexpiredTransitPassForCurrentLocation = -[PDDatabaseManager passExistsForTransitNetworks:isTransitCard:expired:]( v23,  "passExistsForTransitNetworks:isTransitCard:expired:",  v24,  1LL,  2LL);
  }
}

- (void)_prefetchDataSources:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 anyObject]);
    uint64_t v9 = (int)[v8 intValue];
    [v6 removeObject:v8];
    objc_initWeak(&location, self);
    switch(v9)
    {
      case 1LL:
        uint64_t Object = PKLogFacilityTypeGetObject(16LL);
        double v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
          sub_100441860();
        }

        accountManager = self->_accountManager;
        v134[0] = _NSConcreteStackBlock;
        v134[1] = 3221225472LL;
        v134[2] = sub_100106490;
        v134[3] = &unk_100644280;
        double v13 = &v137;
        objc_copyWeak(&v137, &location);
        id v135 = v6;
        id v136 = v7;
        -[PDAccountManager accountsForFeature:completion:](accountManager, "accountsForFeature:completion:", 2LL, v134);

        __int128 v14 = v135;
        goto LABEL_59;
      case 2LL:
        uint64_t v41 = PKLogFacilityTypeGetObject(16LL);
        v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG)) {
          sub_10044188C();
        }

        v43 = self->_accountManager;
        v130[0] = _NSConcreteStackBlock;
        v130[1] = 3221225472LL;
        v130[2] = sub_1001064F8;
        v130[3] = &unk_1006442A8;
        double v13 = &v133;
        objc_copyWeak(&v133, &location);
        id v131 = v6;
        id v132 = v7;
        -[PDAccountManager defaultAccountForFeature:completion:](v43, "defaultAccountForFeature:completion:", 2LL, v130);

        __int128 v14 = v131;
        goto LABEL_59;
      case 3LL:
        uint64_t v15 = PKLogFacilityTypeGetObject(16LL);
        id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
          sub_1004418B8();
        }

        peerPaymentWebServiceCoordinator = self->_peerPaymentWebServiceCoordinator;
        v126[0] = _NSConcreteStackBlock;
        v126[1] = 3221225472LL;
        v126[2] = sub_100106694;
        v126[3] = &unk_1006442D0;
        double v13 = &v129;
        objc_copyWeak(&v129, &location);
        id v127 = v6;
        id v128 = v7;
        -[PDPeerPaymentWebServiceCoordinator accountWithPreventingServerFetch:completion:]( peerPaymentWebServiceCoordinator,  "accountWithPreventingServerFetch:completion:",  1LL,  v126);

        __int128 v14 = v127;
        goto LABEL_59;
      case 4LL:
        uint64_t v44 = PKLogFacilityTypeGetObject(16LL);
        id v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG)) {
          sub_1004418E4();
        }

        id v46 = (void *)objc_claimAutoreleasedReturnValue( -[PDPaymentWebServiceCoordinator paymentSetupFeaturesCoordinator]( self->_paymentWebServiceCoordinator,  "paymentSetupFeaturesCoordinator"));
        uint64_t v47 = PKPassdBundleIdentifier;
        v122[0] = _NSConcreteStackBlock;
        v122[1] = 3221225472LL;
        v122[2] = sub_1001066FC;
        v122[3] = &unk_1006442F8;
        double v13 = &v125;
        objc_copyWeak(&v125, &location);
        id v123 = v6;
        id v124 = v7;
        [v46 staticPaymentSetupFeaturesForSourceApplicationID:v47 completion:v122];

        __int128 v14 = v123;
        goto LABEL_59;
      case 5LL:
        uint64_t v18 = PKLogFacilityTypeGetObject(16LL);
        id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
          sub_100441910();
        }

        applyManager = self->_applyManager;
        v118[0] = _NSConcreteStackBlock;
        v118[1] = 3221225472LL;
        v118[2] = sub_100106764;
        v118[3] = &unk_1006442F8;
        double v13 = &v121;
        objc_copyWeak(&v121, &location);
        id v119 = v6;
        id v120 = v7;
        -[PDApplyManager applicationsWithCompletion:](applyManager, "applicationsWithCompletion:", v118);

        __int128 v14 = v119;
        goto LABEL_59;
      case 6LL:
        uint64_t v48 = PKLogFacilityTypeGetObject(16LL);
        id v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG)) {
          sub_10044193C();
        }

        transitNotificationService = self->_transitNotificationService;
        v114[0] = _NSConcreteStackBlock;
        v114[1] = 3221225472LL;
        v114[2] = sub_100106990;
        v114[3] = &unk_100644320;
        double v13 = &v117;
        objc_copyWeak(&v117, &location);
        id v115 = v6;
        id v116 = v7;
        -[PDTransitNotificationService sentTransitNotificationStateWithHandler:]( transitNotificationService,  "sentTransitNotificationStateWithHandler:",  v114);

        __int128 v14 = v115;
        goto LABEL_59;
      case 7LL:
        uint64_t v51 = PKLogFacilityTypeGetObject(16LL);
        id v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG)) {
          sub_100441968();
        }

        familyCircleManager = self->_familyCircleManager;
        v110[0] = _NSConcreteStackBlock;
        v110[1] = 3221225472LL;
        v110[2] = sub_100106A40;
        v110[3] = &unk_1006442F8;
        double v13 = &v113;
        objc_copyWeak(&v113, &location);
        id v111 = v6;
        id v112 = v7;
        -[PDFamilyCircleManager familyMembersWithCachePolicy:completion:]( familyCircleManager,  "familyMembersWithCachePolicy:completion:",  2LL,  v110);

        __int128 v14 = v111;
        goto LABEL_59;
      case 8LL:
        uint64_t v54 = PKLogFacilityTypeGetObject(16LL);
        v55 = (os_log_s *)objc_claimAutoreleasedReturnValue(v54);
        if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG)) {
          sub_100441994();
        }

        v56 = self->_familyCircleManager;
        v106[0] = _NSConcreteStackBlock;
        v106[1] = 3221225472LL;
        v106[2] = sub_100106AA8;
        v106[3] = &unk_100644348;
        double v13 = &v109;
        objc_copyWeak(&v109, &location);
        id v107 = v6;
        id v108 = v7;
        -[PDFamilyCircleManager memberTypeForCurrentUserWithCachePolicy:completion:]( v56,  "memberTypeForCurrentUserWithCachePolicy:completion:",  2LL,  v106);

        __int128 v14 = v107;
        goto LABEL_59;
      case 9LL:
        uint64_t v57 = PKLogFacilityTypeGetObject(16LL);
        v58 = (os_log_s *)objc_claimAutoreleasedReturnValue(v57);
        if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG)) {
          sub_1004419C0();
        }

        expressPassManager = self->_expressPassManager;
        v102[0] = _NSConcreteStackBlock;
        v102[1] = 3221225472LL;
        v102[2] = sub_100106AF0;
        v102[3] = &unk_100644280;
        double v13 = &v105;
        objc_copyWeak(&v105, &location);
        id v103 = v6;
        id v104 = v7;
        sub_10014C1C8((uint64_t)expressPassManager, v102);

        __int128 v14 = v103;
        goto LABEL_59;
      case 10LL:
        uint64_t v21 = PKLogFacilityTypeGetObject(16LL);
        __int128 v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
          sub_1004419EC();
        }

        __int128 v23 = self->_accountManager;
        v98[0] = _NSConcreteStackBlock;
        v98[1] = 3221225472LL;
        v98[2] = sub_100106C64;
        v98[3] = &unk_100644370;
        double v13 = &v101;
        objc_copyWeak(&v101, &location);
        id v99 = v6;
        id v100 = v7;
        -[PDAccountManager accountUsersByAccountIdentifierForFeature:completion:]( v23,  "accountUsersByAccountIdentifierForFeature:completion:",  2LL,  v98);

        __int128 v14 = v99;
        goto LABEL_59;
      case 11LL:
        uint64_t v60 = PKLogFacilityTypeGetObject(16LL);
        v61 = (os_log_s *)objc_claimAutoreleasedReturnValue(v60);
        if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG)) {
          sub_100441A9C();
        }

        id v62 = PDDefaultQueue();
        v63 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v62);
        v82[0] = _NSConcreteStackBlock;
        v82[1] = 3221225472LL;
        v82[2] = sub_100106FD8;
        v82[3] = &unk_100644488;
        v82[4] = self;
        id v83 = v6;
        id v84 = v7;
        objc_copyWeak(&v85, &location);
        dispatch_async(v63, v82);

        objc_destroyWeak(&v85);
        break;
      case 12LL:
        uint64_t v24 = PKLogFacilityTypeGetObject(16LL);
        id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
          sub_100441AC8();
        }

        id v26 = PDDefaultQueue();
        __int128 v27 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v26);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_100107810;
        block[3] = &unk_1006444D8;
        block[4] = self;
        double v13 = &v81;
        objc_copyWeak(&v81, &location);
        id v79 = v6;
        id v80 = v7;
        dispatch_async(v27, block);

        __int128 v14 = v79;
        goto LABEL_59;
      case 13LL:
        uint64_t v28 = PKLogFacilityTypeGetObject(16LL);
        __int128 v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
          sub_100441A70();
        }

        __int128 v30 = self->_accountManager;
        v86[0] = _NSConcreteStackBlock;
        v86[1] = 3221225472LL;
        v86[2] = sub_100106F70;
        v86[3] = &unk_100644370;
        double v13 = &v89;
        objc_copyWeak(&v89, &location);
        id v87 = v6;
        id v88 = v7;
        -[PDAccountManager physicalCardsByAccountIdentifierForFeature:completion:]( v30,  "physicalCardsByAccountIdentifierForFeature:completion:",  2LL,  v86);

        __int128 v14 = v87;
        goto LABEL_59;
      case 14LL:
        uint64_t v64 = PKLogFacilityTypeGetObject(16LL);
        v65 = (os_log_s *)objc_claimAutoreleasedReturnValue(v64);
        if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG)) {
          sub_100441A18();
        }

        v66 = self->_accountManager;
        v94[0] = _NSConcreteStackBlock;
        v94[1] = 3221225472LL;
        v94[2] = sub_100106CCC;
        v94[3] = &unk_1006442A8;
        double v13 = &v97;
        objc_copyWeak(&v97, &location);
        id v95 = v6;
        id v96 = v7;
        -[PDAccountManager defaultAccountForFeature:completion:](v66, "defaultAccountForFeature:completion:", 3LL, v94);

        __int128 v14 = v95;
        goto LABEL_59;
      case 15LL:
        uint64_t v31 = PKLogFacilityTypeGetObject(16LL);
        __int128 v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
          sub_100441A44();
        }

        __int128 v33 = self->_accountManager;
        v90[0] = _NSConcreteStackBlock;
        v90[1] = 3221225472LL;
        v90[2] = sub_100106F08;
        v90[3] = &unk_1006442A8;
        double v13 = &v93;
        objc_copyWeak(&v93, &location);
        id v91 = v6;
        id v92 = v7;
        -[PDAccountManager defaultAccountForFeature:completion:](v33, "defaultAccountForFeature:completion:", 3LL, v90);

        __int128 v14 = v91;
        goto LABEL_59;
      case 16LL:
        uint64_t v34 = PKLogFacilityTypeGetObject(16LL);
        __int128 v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
          sub_100441AF4();
        }

        __int128 v36 = self->_accountManager;
        v74[0] = _NSConcreteStackBlock;
        v74[1] = 3221225472LL;
        v74[2] = sub_10010793C;
        v74[3] = &unk_1006442A8;
        double v13 = &v77;
        objc_copyWeak(&v77, &location);
        id v75 = v6;
        id v76 = v7;
        -[PDAccountManager defaultAccountForFeature:completion:](v36, "defaultAccountForFeature:completion:", 5LL, v74);

        __int128 v14 = v75;
        goto LABEL_59;
      case 17LL:
        uint64_t v37 = PKLogFacilityTypeGetObject(16LL);
        __int128 v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG)) {
          sub_100441B20();
        }

        __int128 v39 = (PKPaymentOfferCatalog *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager paymentOfferCatalog]( self->_databaseManager,  "paymentOfferCatalog"));
        prefetchedPaymentOfferCatalog = self->_prefetchedPaymentOfferCatalog;
        self->_prefetchedPaymentOfferCatalog = v39;

        -[PDUserEvaluationEnvironment _prefetchDataSources:completion:]( self,  "_prefetchDataSources:completion:",  v6,  v7);
        break;
      case 18LL:
        uint64_t v67 = PKLogFacilityTypeGetObject(16LL);
        v68 = (os_log_s *)objc_claimAutoreleasedReturnValue(v67);
        if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG)) {
          sub_100441B4C();
        }

        v69 = self->_accountManager;
        v70[0] = _NSConcreteStackBlock;
        v70[1] = 3221225472LL;
        v70[2] = sub_1001079A4;
        v70[3] = &unk_1006442A8;
        double v13 = &v73;
        objc_copyWeak(&v73, &location);
        id v71 = v6;
        id v72 = v7;
        -[PDAccountManager defaultAccountForFeature:completion:](v69, "defaultAccountForFeature:completion:", 4LL, v70);

        __int128 v14 = v71;
LABEL_59:

        objc_destroyWeak(v13);
        break;
      default:
        break;
    }

    objc_destroyWeak(&location);
  }

  else if (v7)
  {
    (*((void (**)(id, uint64_t, void))v7 + 2))(v7, 1LL, 0LL);
  }
}

- (BOOL)_hasSavingsAccountAccountTransactionOfTransactionType:(int64_t)a3 fundingSourceTypes:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[PKAccount transactionSourceIdentifier]( self->_prefetchedSavingsAccount,  "transactionSourceIdentifier"));
  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v7));
    id v9 = objc_alloc_init(&OBJC_CLASS___PKPaymentTransactionRequest);
    [v9 setTransactionSourceIdentifiers:v8];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
    __int128 v14 = v10;
    double v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v14, 1LL));
    [v9 setTransactionTypes:v11];

    [v9 setFundingSourceTypes:v6];
    BOOL v12 = -[PDDatabaseManager transactionsCountForRequest:](self->_databaseManager, "transactionsCountForRequest:", v9) != 0;
  }

  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (BOOL)_hasDefaultCreditAccountTransactionOfTransactionSourceType:(unint64_t)a3
{
  prefetchedDefaultCreditAccount = self->_prefetchedDefaultCreditAccount;
  if (prefetchedDefaultCreditAccount)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PKAccount associatedPassUniqueID](prefetchedDefaultCreditAccount, "associatedPassUniqueID"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager transactionSourceIdentifiersForPassUniqueIdentifier:]( self->_databaseManager,  "transactionSourceIdentifiersForPassUniqueIdentifier:",  v6));
    LOBYTE(a3) = -[PDDatabaseManager hasPaymentTransactionForTransactionSourceIdentifiers:withTransactionSource:]( self->_databaseManager,  "hasPaymentTransactionForTransactionSourceIdentifiers:withTransactionSource:",  v7,  a3);

    LOBYTE(prefetchedDefaultCreditAccount) = a3;
  }

  return (char)prefetchedDefaultCreditAccount;
}

- (id)_defaultCreditAccountCreditAccountDetails
{
  prefetchedDefaultCreditAccount = self->_prefetchedDefaultCreditAccount;
  if (prefetchedDefaultCreditAccount)
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[PKAccount creditDetails](prefetchedDefaultCreditAccount, "creditDetails"));
    id v4 = v3;
    if (v3) {
      id v5 = v3;
    }
  }

  else
  {
    id v4 = 0LL;
  }

  return v4;
}

- (id)_defaultCreditAccountAccountSummary
{
  prefetchedDefaultCreditAccount = self->_prefetchedDefaultCreditAccount;
  if (prefetchedDefaultCreditAccount)
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[PKAccount creditDetails](prefetchedDefaultCreditAccount, "creditDetails"));
    id v4 = v3;
    if (v3)
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 accountSummary]);
      id v6 = v5;
      if (v5) {
        id v7 = v5;
      }
    }

    else
    {
      id v6 = 0LL;
    }
  }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

- (id)_defaultCreditAccountAccountStatement
{
  prefetchedDefaultCreditAccount = self->_prefetchedDefaultCreditAccount;
  if (prefetchedDefaultCreditAccount)
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[PKAccount creditDetails](prefetchedDefaultCreditAccount, "creditDetails"));
    id v4 = v3;
    if (v3)
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 accountSummary]);
      id v6 = v5;
      if (v5)
      {
        id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 currentStatement]);
        id v8 = v7;
        if (v7) {
          id v9 = v7;
        }
      }

      else
      {
        id v8 = 0LL;
      }
    }

    else
    {
      id v8 = 0LL;
    }
  }

  else
  {
    id v8 = 0LL;
  }

  return v8;
}

- (id)_defaultCreditAccountSupportedDestinations
{
  prefetchedDefaultCreditAccount = self->_prefetchedDefaultCreditAccount;
  if (prefetchedDefaultCreditAccount)
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( -[PKAccount redeemRewardsFeatureDescriptor]( prefetchedDefaultCreditAccount,  "redeemRewardsFeatureDescriptor"));
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 supportedDestinations]);

    if (v4) {
      id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v4));
    }
    else {
      id v5 = 0LL;
    }
  }

  else
  {
    id v5 = 0LL;
  }

  return v5;
}

- (id)_creditAccountWithIdentifier:(id)a3
{
  id v4 = a3;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v5 = self->_prefetchedCreditAccounts;
  id v6 = -[NSSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
  if (v6)
  {
    uint64_t v7 = *(void *)v17;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "accountIdentifier", (void)v16));
        id v11 = v4;
        id v12 = v10;
        if (v12 == v11)
        {

LABEL_16:
          id v6 = v9;
          goto LABEL_17;
        }

        double v13 = v12;
        if (v4 && v12)
        {
          unsigned __int8 v14 = [v11 isEqualToString:v12];

          if ((v14 & 1) != 0) {
            goto LABEL_16;
          }
        }

        else
        {
        }
      }

      id v6 = -[NSSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
      if (v6) {
        continue;
      }
      break;
    }
  }

- (id)_familyMemberWithAltDSID:(id)a3
{
  id v4 = a3;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v5 = self->_prefetchedFamilyMembers;
  id v6 = -[NSArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
  if (v6)
  {
    uint64_t v7 = *(void *)v17;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "altDSID", (void)v16));
        id v11 = v4;
        id v12 = v10;
        if (v12 == v11)
        {

LABEL_16:
          id v6 = v9;
          goto LABEL_17;
        }

        double v13 = v12;
        if (v4 && v12)
        {
          unsigned __int8 v14 = [v11 isEqualToString:v12];

          if ((v14 & 1) != 0) {
            goto LABEL_16;
          }
        }

        else
        {
        }
      }

      id v6 = -[NSArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
      if (v6) {
        continue;
      }
      break;
    }
  }

- (id)_creditAccountPhysicalCardsForAccountIdentifier:(id)a3
{
  if (a3) {
    return (id)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKey:]( self->_prefetchedPhysicalCards,  "objectForKey:"));
  }
  else {
    return 0LL;
  }
}

- (id)_creditAccountUsersForAccountIdentifier:(id)a3
{
  if (a3) {
    return (id)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKey:]( self->_prefetchedCreditAccountUsers,  "objectForKey:"));
  }
  else {
    return 0LL;
  }
}

- (id)_accountUsersForAccountIdentifier:(id)a3 accessLevel:(unint64_t)a4
{
  if (!a3) {
    return 0LL;
  }
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_prefetchedCreditAccountUsers, "objectForKey:"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100108138;
  v8[3] = &unk_1006444F8;
  v8[4] = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectsPassingTest:v8]);

  return v6;
}

- (id)_unactivatedPhysicalCardForAltDSID:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PKAccount accountIdentifier](self->_prefetchedDefaultCreditAccount, "accountIdentifier"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[PDUserEvaluationEnvironment _creditAccountPhysicalCardsForAccountIdentifier:]( self,  "_creditAccountPhysicalCardsForAccountIdentifier:",  v5));

  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v20;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v7);
        }
        id v11 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)i);
        id v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "accountUserAltDSID", (void)v19));
        id v13 = v4;
        id v14 = v12;
        uint64_t v15 = v14;
        if (v14 == v13)
        {
        }

        else
        {
          if (!v4 || !v14)
          {

LABEL_15:
            continue;
          }

          unsigned int v16 = [v13 isEqualToString:v14];

          if (!v16) {
            goto LABEL_15;
          }
        }

        id v17 = [v11 state];

        if (v17 == (id)1)
        {
          id v8 = v11;
          goto LABEL_18;
        }
      }

      id v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }

    while (v8);
  }

- (BOOL)defaultCreditAccountHasMerchantIdentifier:(id)a3
{
  if (!a3) {
    return 0;
  }
  uint64_t v3 = self;
  prefetchedDefaultCreditAccount = self->_prefetchedDefaultCreditAccount;
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PKAccount associatedPassUniqueID](prefetchedDefaultCreditAccount, "associatedPassUniqueID"));
  id v7 = -[NSSet initWithObjects:](objc_alloc(&OBJC_CLASS___NSSet), "initWithObjects:", v5, 0LL);

  LOBYTE(v3) = -[PDDatabaseManager hasAnyTransactionsWithMerchantIdentifiers:forPassUniqueIdentifier:]( v3->_databaseManager,  "hasAnyTransactionsWithMerchantIdentifiers:forPassUniqueIdentifier:",  v7,  v6);
  return (char)v3;
}

- (BOOL)defaultCreditAccountHasMerchantIdentifier30Days:(id)a3
{
  if (!a3) {
    return 0;
  }
  prefetchedDefaultCreditAccount = self->_prefetchedDefaultCreditAccount;
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PKAccount associatedPassUniqueID](prefetchedDefaultCreditAccount, "associatedPassUniqueID"));
  id v7 = -[NSSet initWithObjects:](objc_alloc(&OBJC_CLASS___NSSet), "initWithObjects:", v5, 0LL);

  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  -2592000.0));
  databaseManager = self->_databaseManager;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  LOBYTE(databaseManager) = -[PDDatabaseManager hasAnyTransactionsWithMerchantIdentifiers:forPassUniqueIdentifier:startDate:endDate:]( databaseManager,  "hasAnyTransactionsWithMerchantIdentifiers:forPassUniqueIdentifier:startDate:endDate:",  v7,  v6,  v8,  v10);

  return (char)databaseManager;
}

- (BOOL)defaultCreditAccountHasMapsIdentifier:(id)a3
{
  if (!a3) {
    return 0;
  }
  uint64_t v3 = self;
  prefetchedDefaultCreditAccount = self->_prefetchedDefaultCreditAccount;
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PKAccount associatedPassUniqueID](prefetchedDefaultCreditAccount, "associatedPassUniqueID"));
  id v7 = objc_alloc(&OBJC_CLASS___NSSet);
  id v8 = [v5 integerValue];

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v8));
  uint64_t v10 = -[NSSet initWithObjects:](v7, "initWithObjects:", v9, 0LL);

  LOBYTE(v3) = -[PDDatabaseManager hasAnyTransactionsWithMapsIdentifiers:forPassUniqueIdentifier:]( v3->_databaseManager,  "hasAnyTransactionsWithMapsIdentifiers:forPassUniqueIdentifier:",  v10,  v6);
  return (char)v3;
}

- (BOOL)defaultCreditAccountHasMapsIdentifierLast30Days:(id)a3
{
  if (!a3) {
    return 0;
  }
  prefetchedDefaultCreditAccount = self->_prefetchedDefaultCreditAccount;
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PKAccount associatedPassUniqueID](prefetchedDefaultCreditAccount, "associatedPassUniqueID"));
  id v7 = objc_alloc(&OBJC_CLASS___NSSet);
  id v8 = [v5 integerValue];

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v8));
  uint64_t v10 = -[NSSet initWithObjects:](v7, "initWithObjects:", v9, 0LL);

  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  -2592000.0));
  databaseManager = self->_databaseManager;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  LOBYTE(databaseManager) = -[PDDatabaseManager hasAnyTransactionsWithMapsIdentifiers:forPassUniqueIdentifier:startDate:endDate:]( databaseManager,  "hasAnyTransactionsWithMapsIdentifiers:forPassUniqueIdentifier:startDate:endDate:",  v10,  v6,  v11,  v13);

  return (char)databaseManager;
}

- (BOOL)defaultCreditAccountHasMapsBrandIdentifier:(id)a3
{
  if (!a3) {
    return 0;
  }
  uint64_t v3 = self;
  prefetchedDefaultCreditAccount = self->_prefetchedDefaultCreditAccount;
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PKAccount associatedPassUniqueID](prefetchedDefaultCreditAccount, "associatedPassUniqueID"));
  id v7 = objc_alloc(&OBJC_CLASS___NSSet);
  id v8 = [v5 integerValue];

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v8));
  uint64_t v10 = -[NSSet initWithObjects:](v7, "initWithObjects:", v9, 0LL);

  LOBYTE(v3) = -[PDDatabaseManager hasAnyTransactionsWithMapsBrandIdentifiers:forPassUniqueIdentifier:]( v3->_databaseManager,  "hasAnyTransactionsWithMapsBrandIdentifiers:forPassUniqueIdentifier:",  v10,  v6);
  return (char)v3;
}

- (BOOL)defaultCreditAccountHasMapsBrandIdentifierLast30Days:(id)a3
{
  if (!a3) {
    return 0;
  }
  prefetchedDefaultCreditAccount = self->_prefetchedDefaultCreditAccount;
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PKAccount associatedPassUniqueID](prefetchedDefaultCreditAccount, "associatedPassUniqueID"));
  id v7 = objc_alloc(&OBJC_CLASS___NSSet);
  id v8 = [v5 integerValue];

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v8));
  uint64_t v10 = -[NSSet initWithObjects:](v7, "initWithObjects:", v9, 0LL);

  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  -2592000.0));
  databaseManager = self->_databaseManager;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  LOBYTE(databaseManager) = -[PDDatabaseManager hasAnyTransactionsWithMapsBrandIdentifiers:forPassUniqueIdentifier:startDate:endDate:]( databaseManager,  "hasAnyTransactionsWithMapsBrandIdentifiers:forPassUniqueIdentifier:startDate:endDate:",  v10,  v6,  v11,  v13);

  return (char)databaseManager;
}

- (BOOL)hasActivePromotionIdentifier:(id)a3
{
  if (!a3) {
    return 0;
  }
  prefetchedDefaultCreditAccount = self->_prefetchedDefaultCreditAccount;
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PKAccount accountIdentifier](prefetchedDefaultCreditAccount, "accountIdentifier"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager accountPromotionForProgramIdentifier:accountIdentifier:]( self->_databaseManager,  "accountPromotionForProgramIdentifier:accountIdentifier:",  v5,  v6));

  if (v7) {
    BOOL v8 = [v7 state] == (id)2;
  }
  else {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)hasActivePromotionIdentifierExpiringSoon:(id)a3
{
  if (!a3) {
    return 0;
  }
  prefetchedDefaultCreditAccount = self->_prefetchedDefaultCreditAccount;
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PKAccount accountIdentifier](prefetchedDefaultCreditAccount, "accountIdentifier"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager accountPromotionForProgramIdentifier:accountIdentifier:]( self->_databaseManager,  "accountPromotionForProgramIdentifier:accountIdentifier:",  v5,  v6));

  if (v7 && [v7 state] == (id)2) {
    unsigned __int8 v8 = [v7 expiringSoon];
  }
  else {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (int64_t)defaultCreditAccountDaysUntilActivePromotionExpires:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_queriedDefaultCreditAccountDaysUntilActivePromotionExpires,  "objectForKeyedSubscript:",  v4));
    id v6 = v5;
    if (v5) {
      int64_t v7 = (int64_t)[v5 integerValue];
    }
    else {
      int64_t v7 = -1LL;
    }
    uint64_t v8 = objc_claimAutoreleasedReturnValue(-[PKAccount accountIdentifier](self->_prefetchedDefaultCreditAccount, "accountIdentifier"));
    uint64_t v9 = (void *)v8;
    if (!v6 && v8)
    {
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager accountPromotionForProgramIdentifier:accountIdentifier:]( self->_databaseManager,  "accountPromotionForProgramIdentifier:accountIdentifier:",  v4,  v8));
      id v11 = v10;
      if (v10 && [v10 state] == (id)2)
      {
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 endDate]);
        [v12 timeIntervalSinceNow];
        int64_t v7 = vcvtmd_s64_f64(v13 / 86400.0);
      }

      id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v7));
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_queriedDefaultCreditAccountDaysUntilActivePromotionExpires,  "setObject:forKeyedSubscript:",  v14,  v4);
    }
  }

  else
  {
    int64_t v7 = -1LL;
  }

  return v7;
}

- (BOOL)hasMerchantIdentifier:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = a3;
  id v5 = -[NSSet initWithObjects:](objc_alloc(&OBJC_CLASS___NSSet), "initWithObjects:", v4, 0LL);

  LOBYTE(self) = -[PDDatabaseManager hasAnyTransactionsWithMerchantIdentifiers:]( self->_databaseManager,  "hasAnyTransactionsWithMerchantIdentifiers:",  v5);
  return (char)self;
}

- (BOOL)hasMapsIdentifier:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = a3;
  id v5 = objc_alloc(&OBJC_CLASS___NSSet);
  id v6 = [v4 integerValue];

  int64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v6));
  uint64_t v8 = -[NSSet initWithObjects:](v5, "initWithObjects:", v7, 0LL);

  LOBYTE(self) = -[PDDatabaseManager hasAnyTransactionsWithMapsIdentifiers:]( self->_databaseManager,  "hasAnyTransactionsWithMapsIdentifiers:",  v8);
  return (char)self;
}

- (BOOL)hasMapsBrandIdentifier:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = a3;
  id v5 = objc_alloc(&OBJC_CLASS___NSSet);
  id v6 = [v4 integerValue];

  int64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v6));
  uint64_t v8 = -[NSSet initWithObjects:](v5, "initWithObjects:", v7, 0LL);

  LOBYTE(self) = -[PDDatabaseManager hasAnyTransactionsWithMapsBrandIdentifiers:]( self->_databaseManager,  "hasAnyTransactionsWithMapsBrandIdentifiers:",  v8);
  return (char)self;
}

- (id)debugDescription
{
  uint64_t v3 = +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"<%@: %p;\n",
         objc_opt_class(self, a2),
         self);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = v4;
  if (self->_isApplePayActive) {
    id v6 = @"YES";
  }
  else {
    id v6 = @"NO";
  }
  [v4 appendFormat:@"%@: '%@';\n", @"isApplePayActive", v6];
  objc_msgSend( v5,  "appendFormat:",  @"%@: '%@';\n",
    @"hasDefaultCreditAccount",
    self->_prefetchedDefaultCreditAccount);
  objc_msgSend( v5,  "appendFormat:",  @"%@: '%ld';\n",
    @"daysSinceOldestPaymentPassIngestDate",
    self->_daysSinceOldestPaymentPassIngestDate);
  objc_msgSend( v5,  "appendFormat:",  @"%@: '%ld';\n",
    @"daysSinceOldestCreditCardIngestDate",
    self->_daysSinceOldestPaymentPassIngestDate);
  if (self->_hasDefaultCreditAccountVirtualCardTransaction) {
    int64_t v7 = &__kCFBooleanTrue;
  }
  else {
    int64_t v7 = &__kCFBooleanFalse;
  }
  [v5 appendFormat:@"%@: '%@';\n", @"defaultCreditAccountHasVirtualCard", v7];
  objc_msgSend( v5,  "appendFormat:",  @"%@: '%ld';\n",
    @"defaultCreditAccountDaysSinceDisputeOpened",
    self->_defaultCreditAccountDaysSinceDisputeOpened);
  objc_msgSend( v5,  "appendFormat:",  @"%@: '%@';\n",
    @"defaultCreditAccountMerchantIdentifiers",
    self->_queriedDefaultCreditAccountMerchantIdentifierPresence);
  objc_msgSend( v5,  "appendFormat:",  @"%@: '%@';\n",
    @"defaultCreditAccountMerchantIdentifiersLast30Days",
    self->_queriedDefaultCreditAccountMerchantIdentifierLast30DaysPresence);
  objc_msgSend( v5,  "appendFormat:",  @"%@: '%@';\n",
    @"defaultCreditAccountMapsIdentifiers",
    self->_queriedDefaultCreditAccountMapsIdentifierPresence);
  objc_msgSend( v5,  "appendFormat:",  @"%@: '%@';\n",
    @"defaultCreditAccountMapsIdentifiersLast30Days",
    self->_queriedDefaultCreditAccountMapsIdentifierLast30DaysPresence);
  objc_msgSend( v5,  "appendFormat:",  @"%@: '%@';\n",
    @"defaultCreditAccountMapsBrandIdentifiers",
    self->_queriedDefaultCreditAccountMapsBrandIdentifierPresence);
  objc_msgSend( v5,  "appendFormat:",  @"%@: '%@';\n",
    @"defaultCreditAccountMapsBrandIdentifiersLast30Days",
    self->_queriedDefaultCreditAccountMapsBrandIdentifierLast30DaysPresence);
  objc_msgSend( v5,  "appendFormat:",  @"%@: '%@';\n",
    @"defaultCreditAccountActivePromotionIdentifiers",
    self->_queriedDefaultCreditAccountActivePromotionIdentifiersPresence);
  objc_msgSend( v5,  "appendFormat:",  @"%@: '%@';\n",
    @"defaultCreditAccountActivePromotionIdentifiersExpiringSoon",
    self->_queriedDefaultCreditAccountActivePromotionIdentifiersExpiringSoonPresence);
  objc_msgSend( v5,  "appendFormat:",  @"%@: '%@';\n",
    @"defaultCreditAccountDaysUntilActivePromotionExpires",
    self->_queriedDefaultCreditAccountDaysUntilActivePromotionExpires);
  [v5 appendFormat:@"%@: '%@';\n", @"passStyles", self->_passStyles];
  [v5 appendFormat:@"%@: '%@';\n", @"unexpiredPassStyles", self->_unexpiredPassStyles];
  [v5 appendFormat:@"%@: '%@';\n", @"secureElementCardTypes", self->_cardTypes];
  objc_msgSend( v5,  "appendFormat:",  @"%@: '%@';\n",
    @"unexpiredSecureElementCardTypes",
    self->_unexpiredCardTypes);
  objc_msgSend( v5,  "appendFormat:",  @"%@: '%@';\n",
    @"transitNetworksPresent",
    self->_transitNetworksPresent);
  objc_msgSend( v5,  "appendFormat:",  @"%@: '%@';\n",
    @"transitNetworksPresentAndUnexpired",
    self->_transitNetworksPresentAndUnexpired);
  objc_msgSend( v5,  "appendFormat:",  @"%@: '%@';\n",
    @"merchantIdentifiers",
    self->_queriedMerchantIdentifierPresence);
  objc_msgSend( v5,  "appendFormat:",  @"%@: '%@';\n",
    @"mapsIdentifiers",
    self->_queriedMapsIdentifierPresence);
  objc_msgSend( v5,  "appendFormat:",  @"%@: '%@';\n",
    @"mapsBrandIdentifiers",
    self->_queriedMapsBrandIdentifierPresence);
  if (self->_hasPaymentTransaction) {
    uint64_t v8 = &__kCFBooleanTrue;
  }
  else {
    uint64_t v8 = &__kCFBooleanFalse;
  }
  [v5 appendFormat:@"%@: '%@';\n", @"hasPaymentTransaction", v8];
  if (self->_hasTransitTransaction) {
    uint64_t v9 = &__kCFBooleanTrue;
  }
  else {
    uint64_t v9 = &__kCFBooleanFalse;
  }
  [v5 appendFormat:@"%@: '%@';\n", @"hasTransitTransaction", v9];
  objc_msgSend( v5,  "appendFormat:",  @"%@: '%@';\n",
    @"discoveryItemsExpanded",
    self->_discoveryItemsExpanded);
  objc_msgSend( v5,  "appendFormat:",  @"%@: '%@';\n",
    @"discoveryItemsDismissed",
    self->_discoveryItemsDismissed);
  [v5 appendFormat:@"%@: '%@';\n", @"discoveryCTAsTapped", self->_discoveryCTAsTapped];
  objc_msgSend( v5,  "appendFormat:",  @"%@: '%@';\n",
    @"discoveryCTAsCompleted",
    self->_discoveryCTAsCompleted);
  objc_msgSend( v5,  "appendFormat:",  @"%@: '%@';\n",
    @"supportedMarketsForCurrentLocation",
    self->_supportedMarketsForCurrentLocation);
  objc_msgSend( v5,  "appendFormat:",  @"%@: '%@';\n",
    @"supportedTransitMarketsForCurrentLocation",
    self->_supportedTransitMarketsForCurrentLocation);
  objc_msgSend( v5,  "appendFormat:",  @"%@: '%@';\n",
    @"supportedTransitNetworksForCurrentLocation",
    self->_supportedTransitNetworksForCurrentLocation);
  objc_msgSend( v5,  "appendFormat:",  @"%@: '%@';\n",
    @"expressTransitNetworksForCurrentLocation",
    self->_expressTransitNetworksForCurrentLocation);
  if (self->_hasTransitPassForCurrentLocation) {
    uint64_t v10 = @"YES";
  }
  else {
    uint64_t v10 = @"NO";
  }
  [v5 appendFormat:@"%@: '%@';\n", @"hasTransitPassForCurrentLocation", v10];
  if (self->_hasUnexpiredTransitPassForCurrentLocation) {
    id v11 = @"YES";
  }
  else {
    id v11 = @"NO";
  }
  [v5 appendFormat:@"%@: '%@';\n", @"hasUnexpiredTransitPassForCurrentLocation", v11];
  [v5 appendFormat:@"%@: '%@';\n", @"currentPlacemark", self->_currentPlacemark];
  [v5 appendFormat:@">"];
  return v5;
}

- (NSSet)sentTransitDCINotifications
{
  return self->_sentTransitDCINotifications;
}

- (NSSet)sentTransitOpenLoopUpgradeNotifications
{
  return self->_sentTransitOpenLoopUpgradeNotifications;
}

- (NSSet)sentTransitOpenLoopRenotifiedInMarketNotifications
{
  return self->_sentTransitOpenLoopRenotifiedInMarketNotifications;
}

- (NSSet)cardTypesWithExpressEnabled
{
  return self->_cardTypesWithExpressEnabled;
}

- (NSSet)supportedMarketsForCurrentLocation
{
  return self->_supportedMarketsForCurrentLocation;
}

- (NSSet)supportedTransitMarketsForCurrentLocation
{
  return self->_supportedTransitMarketsForCurrentLocation;
}

- (NSSet)supportedTransitNetworksForCurrentLocation
{
  return self->_supportedTransitNetworksForCurrentLocation;
}

- (NSSet)expressTransitNetworksForCurrentLocation
{
  return self->_expressTransitNetworksForCurrentLocation;
}

- (CLPlacemark)currentPlacemark
{
  return self->_currentPlacemark;
}

- (BOOL)hasTransitPassForCurrentLocation
{
  return self->_hasTransitPassForCurrentLocation;
}

- (BOOL)hasUnexpiredTransitPassForCurrentLocation
{
  return self->_hasUnexpiredTransitPassForCurrentLocation;
}

- (void).cxx_destruct
{
}

@end