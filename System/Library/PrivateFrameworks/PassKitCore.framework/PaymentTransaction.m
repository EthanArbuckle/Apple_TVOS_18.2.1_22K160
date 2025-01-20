@interface PaymentTransaction
+ (BOOL)hasAnyTransactionsInDatabase:(id)a3;
+ (BOOL)hasAnyTransactionsInDatabase:(id)a3 withMapsBrandIdentifiers:(id)a4;
+ (BOOL)hasAnyTransactionsInDatabase:(id)a3 withMapsBrandIdentifiers:(id)a4 forTransactionSourceIdentifiers:(id)a5;
+ (BOOL)hasAnyTransactionsInDatabase:(id)a3 withMapsBrandIdentifiers:(id)a4 forTransactionSourceIdentifiers:(id)a5 startDate:(id)a6 endDate:(id)a7;
+ (BOOL)hasAnyTransactionsInDatabase:(id)a3 withMapsIdentifiers:(id)a4;
+ (BOOL)hasAnyTransactionsInDatabase:(id)a3 withMapsIdentifiers:(id)a4 forTransactionSourceIdentifiers:(id)a5;
+ (BOOL)hasAnyTransactionsInDatabase:(id)a3 withMapsIdentifiers:(id)a4 forTransactionSourceIdentifiers:(id)a5 startDate:(id)a6 endDate:(id)a7;
+ (BOOL)hasAnyTransactionsInDatabase:(id)a3 withMerchantIdentifiers:(id)a4;
+ (BOOL)hasAnyTransactionsInDatabase:(id)a3 withMerchantIdentifiers:(id)a4 forTransactionSourceIdentifiers:(id)a5;
+ (BOOL)hasAnyTransactionsInDatabase:(id)a3 withMerchantIdentifiers:(id)a4 forTransactionSourceIdentifiers:(id)a5 startDate:(id)a6 endDate:(id)a7;
+ (BOOL)hasAnyTransactionsInDatabase:(id)a3 withTransactionType:(int64_t)a4;
+ (BOOL)hasPaymentTransactionInDatabase:(id)a3 forTransactionSourceIdentifiers:(id)a4 withTransactionSource:(unint64_t)a5;
+ (BOOL)hasTransactionsMissingWorldRegionEligibleForProcessingInDatabase:(id)a3;
+ (BOOL)setNeedsSyncWithFinanceForAllTransactionsInDatabase:(id)a3;
+ (id)anyInDatabase:(id)a3 withIdentifier:(id)a4;
+ (id)anyInDatabase:(id)a3 withPID:(id)a4;
+ (id)anyInDatabase:(id)a3 withPaymentHash:(id)a4 withTransactionSource:(unint64_t)a5 withNotificationServiceData:(unint64_t)a6 transactionSourceIdentifiers:(id)a7;
+ (id)anyInDatabase:(id)a3 withReferenceIdentifier:(id)a4;
+ (id)anyInDatabase:(id)a3 withServiceIdentifier:(id)a4 accountIdentifier:(id)a5 accountType:(int64_t)a6;
+ (id)anyInDatabase:(id)a3 withServiceIdentifier:(id)a4 forTransactionSourceIdentifier:(id)a5;
+ (id)anyInDatabase:(id)a3 withTransactionSourceIdentifier:(id)a4;
+ (id)approvedPaymentTransactionsInDatabase:(id)a3 forTransactionSourceIdentifiers:(id)a4 withTransactionSource:(unint64_t)a5 withBackingData:(unint64_t)a6 startDate:(id)a7 endDate:(id)a8 orderedByDate:(int64_t)a9 limit:(int64_t)a10;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)closestPendingTransactionInDatabase:(id)a3 fromTransactionDate:(id)a4 withNotificationServiceData:(unint64_t)a5 forMerchantName:(id)a6 forTransactionSourceIdentifiers:(id)a7;
+ (id)closestTransactionInDatabase:(id)a3 fromTransaction:(id)a4 forTransactionSourceIdentifiers:(id)a5;
+ (id)databaseTable;
+ (id)disambiguatedSQLForProperty:(id)a3;
+ (id)insertPaymentTransaction:(id)a3 withTransactionSource:(id)a4 inDatabase:(id)a5;
+ (id)installmentPlanTransactionsInDatabase:(id)a3 forTransactionSourceIdentifiers:(id)a4;
+ (id)installmentTransactionsInDatabase:(id)a3 forTransactionSourceIdentifiers:(id)a4 installmentPlan:(id)a5 redeemed:(BOOL)a6 withRedemptionType:(unint64_t)a7 startDate:(id)a8 endDate:(id)a9;
+ (id)issuerInstallmentTransactionsInDatabase:(id)a3 transactionSourceIdentifiers:(id)a4;
+ (id)issuerInstallmentTransactionsInDatabase:(id)a3 transactionSourceIdentifiers:(id)a4 transactionPaymentHashes:(id)a5;
+ (id)mostRecentActiveTransactionInDatabase:(id)a3;
+ (id)paymentTransactionsForTokenizedTransactionsWithRegionsInDatabase:(id)a3;
+ (id)paymentTransactionsInDatabase:(id)a3 forPredicate:(id)a4 limit:(int64_t)a5;
+ (id)paymentTransactionsInDatabase:(id)a3 forRequest:(id)a4;
+ (id)paymentTransactionsInDatabase:(id)a3 forTransactionSourceIdentifiers:(id)a4;
+ (id)paymentTransactionsInDatabase:(id)a3 forTransactionSourceIdentifiers:(id)a4 withRedemptionType:(unint64_t)a5 startDate:(id)a6 endDate:(id)a7;
+ (id)paymentTransactionsInDatabase:(id)a3 forTransactionSourceIdentifiers:(id)a4 withTransactionSource:(unint64_t)a5 withBackingData:(unint64_t)a6 startDate:(id)a7 endDate:(id)a8 orderedByDate:(int64_t)a9 limit:(int64_t)a10;
+ (id)paymentTransactionsInDatabase:(id)a3 matchingMapsBrandIdentifier:(unint64_t)a4 forTransactionSourceIdentifiers:(id)a5;
+ (id)paymentTransactionsInDatabase:(id)a3 matchingMapsMerchantIdentifier:(unint64_t)a4 forTransactionSourceIdentifiers:(id)a5;
+ (id)paymentTransactionsInDatabase:(id)a3 matchingMapsMerchantIdentifierWithoutRegion:(unint64_t)a4 limit:(unint64_t)a5;
+ (id)paymentTransactionsInDatabase:(id)a3 matchingMerchant:(id)a4 forTransactionSourceIdentifiers:(id)a5 withTransactionSource:(unint64_t)a6 withBackingData:(unint64_t)a7 limit:(int64_t)a8;
+ (id)paymentTransactionsInDatabase:(id)a3 matchingPeerPaymentCounterpartHandles:(id)a4 forPeerPaymentSubtype:(int64_t)a5 forTransactionSourceIdentifiers:(id)a6 withTransactionSource:(unint64_t)a7 withBackingData:(unint64_t)a8 limit:(int64_t)a9;
+ (id)paymentTransactionsInDatabase:(id)a3 matchingPeerPaymentCounterpartHandles:(id)a4 forTransactionSourceIdentifiers:(id)a5 withTransactionSource:(unint64_t)a6 withBackingData:(unint64_t)a7 limit:(int64_t)a8;
+ (id)paymentTransactionsInDatabase:(id)a3 missingWorldRegionWithLimit:(unint64_t)a4 onlyEligibleForProcessing:(BOOL)a5;
+ (id)paymentTransactionsInDatabase:(id)a3 originatedOnDevice:(BOOL)a4 forTransactionSourceIdentifiers:(id)a5;
+ (id)paymentTransactionsInDatabase:(id)a3 withFullPaymentHashes:(id)a4 transactionSourceIdentifiers:(id)a5;
+ (id)paymentTransactionsInDatabase:(id)a3 withIdentifiers:(id)a4 regions:(id *)a5 tags:(id *)a6;
+ (id)paymentTransactionsInDatabase:(id)a3 withMerchantCategory:(int64_t)a4 forTransactionSourceIdentifiers:(id)a5 withTransactionSource:(unint64_t)a6 withBackingData:(unint64_t)a7 startDate:(id)a8 endDate:(id)a9 limit:(int64_t)a10;
+ (id)paymentTransactionsInDatabase:(id)a3 withPIDs:(id)a4;
+ (id)paymentTransactionsInDatabase:(id)a3 withServiceIdentifier:(id)a4;
+ (id)paymentTransactionsInDatabase:(id)a3 withTransactionSource:(unint64_t)a4 withBackingData:(unint64_t)a5 limit:(int64_t)a6;
+ (id)paymentTransactionsInDatabase:(id)a3 withTransactionType:(int64_t)a4 forTransactionSourceIdentifiers:(id)a5 withTransactionSource:(unint64_t)a6 withBackingData:(unint64_t)a7 startDate:(id)a8 endDate:(id)a9 limit:(int64_t)a10;
+ (id)paymentTransactionsInDatabase:(id)a3 withTransactionTypes:(id)a4 withTransactionSource:(unint64_t)a5 withBackingData:(unint64_t)a6 limit:(int64_t)a7;
+ (id)paymentTransactionsRequiringReviewInDatabase:(id)a3 forAccountIdentifier:(id)a4;
+ (id)peerPaymentCounterpartHandlesforSource:(id)a3 excludingPaymentMode:(unint64_t)a4 startDate:(id)a5 endDate:(id)a6 inDatabase:(id)a7;
+ (id)peerPaymentCounterpartHandlesforSource:(id)a3 startDate:(id)a4 endDate:(id)a5 inDatabase:(id)a6;
+ (id)pendingPaymentTransactionsInDatabase:(id)a3 forTransactionSourceIdentifiers:(id)a4 withTransactionSource:(unint64_t)a5 withBackingData:(unint64_t)a6 startDate:(id)a7 endDate:(id)a8 orderedByDate:(int64_t)a9 limit:(int64_t)a10;
+ (id)predicateForRequest:(id)a3;
+ (id)regionIdentifiersInDatabase:(id)a3 matchingName:(id)a4 types:(id)a5 localeIdentifier:(id)a6 withRequest:(id)a7 limit:(unint64_t)a8;
+ (id)rewardsTierSummaryForTransactionSourceIdentifiers:(id)a3 currencyCode:(id)a4 startDate:(id)a5 endDate:(id)a6 inDatabase:(id)a7;
+ (id)rewardsValuesForUnit:(unint64_t)a3 inDatabase:(id)a4;
+ (id)transactionReceiptUniqueIDsInDatabase:(id)a3;
+ (id)transactionServiceIdentifiersInDatabase:(id)a3 withTransactionType:(int64_t)a4 withPeerPaymentSubtype:(int64_t)a5 forTransactionSourceIdentifiers:(id)a6 withTransactionSource:(unint64_t)a7 withBackingData:(unint64_t)a8 startDate:(id)a9 endDate:(id)a10;
+ (id)transactionsForAdjustmentType:(int64_t)a3 limit:(int64_t)a4 inDatabase:(id)a5;
+ (id)transactionsInDatabase:(id)a3 forInstallmentPlanIdentifier:(id)a4;
+ (id)transactionsRequiringMerchantCleanupInDatabase:(id)a3 forTransactionSourceIdentifiers:(id)a4 withLastReprocessingDateBeforeDate:(id)a5 transactionDateWithinWindow:(double)a6;
+ (id)transactionsThatNeedSyncToFinanceWithAccountIdentifiers:(id)a3 withLimit:(int64_t)a4 inDatabase:(id)a5;
+ (id)truncateEntitiesForTransactionSourceIdentifiers:(id)a3 withNotificationServiceData:(unint64_t)a4 suppressedFromUI:(unint64_t)a5 inDatabase:(id)a6 toCount:(int64_t)a7;
+ (int64_t)countInDatabase:(id)a3 forTransactionSourceIdentifiers:(id)a4 withTransactionSource:(unint64_t)a5 withBackingData:(unint64_t)a6 startDate:(id)a7 endDate:(id)a8;
+ (unint64_t)countInDatabase:(id)a3 forRequest:(id)a4;
+ (unint64_t)countInDatabase:(id)a3 forTransactionSourceIdentifiers:(id)a4 withPeerPaymentCounterpartHandles:(id)a5 forPeerPaymentSubtype:(int64_t)a6 startDate:(id)a7 endDate:(id)a8;
+ (unint64_t)countInDatabase:(id)a3 forTransactionSourceIdentifiers:(id)a4 withPeerPaymentCounterpartHandles:(id)a5 startDate:(id)a6 endDate:(id)a7;
+ (unint64_t)numberOfPaymentTransactionsInDatabase:(id)a3 forTransactionSourceIdentifiers:(id)a4 withNotificationServiceData:(unint64_t)a5 newerThanDate:(id)a6;
+ (unint64_t)numberOfPaymentTransactionsInDatabaseWithAssociatedReceipt:(id)a3;
+ (unint64_t)suppressionBehaviorForTransactionSourceIdentifier:(id)a3 serviceIdentifier:(id)a4 inDatabase:(id)a5;
+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4;
+ (void)allPassTransactionIdentifiersInDatabase:(id)a3 batchHandler:(id)a4;
+ (void)allPassTransactionIdentifiersWithAccountIdentifiers:(id)a3 inDatabase:(id)a4 batchHandler:(id)a5;
+ (void)deleteEntitiesForTransactionSource:(id)a3 inDatabase:(id)a4;
+ (void)deleteEntitiesWithPIDs:(id)a3 inDatabase:(id)a4;
+ (void)deleteIssuerInstallmentTransactionsInDatabase:(id)a3 transactionSourceIdentifiers:(id)a4;
+ (void)resetNeedsSyncWithFinanceForTransactionWithPID:(id)a3 updateSequenceNumber:(int64_t)a4 inDatabase:(id)a5;
+ (void)setNeedsSyncWithFinanceForTransactionsWithAccountIdentifier:(id)a3 inDatabase:(id)a4;
+ (void)totalAmount:(id *)a3 forTransactionsWithRequest:(id)a4 count:(unint64_t *)a5 inDatabase:(id)a6;
+ (void)updateTransactionsWithTransactionSource:(id)a3 toTransactionSource:(id)a4 inDatabase:(id)a5;
- (BOOL)deleteFromDatabase;
- (id)accountIdentifier;
- (id)dbPaymentTransactionArchive;
- (id)identifier;
- (id)passUniqueIdentifier;
- (id)paymentApplication;
- (id)paymentTransaction;
- (id)serviceIdentifier;
- (id)transactionAuthenticationResult;
- (id)transactionDate;
- (id)transactionSourceIdentifier;
- (int64_t)accountType;
- (int64_t)transactionType;
- (void)removeMapsDataForIssueReportIdentifier:(id)a3;
- (void)replaceWithPaymentTransaction:(id)a3;
- (void)updateRedemptionType:(unint64_t)a3;
- (void)updateRequiresMerchantReprocessing:(BOOL)a3;
- (void)updateSuppressBehavior:(unint64_t)a3;
- (void)updateWithMerchant:(id)a3;
- (void)updateWithPaymentTransaction:(id)a3;
- (void)updateWithPaymentTransactionSource:(id)a3;
@end

@implementation PaymentTransaction

+ (id)databaseTable
{
  return @"payment_transaction";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class(&OBJC_CLASS___TransactionSource, a2) == a3) {
    return @"source_pid";
  }
  if ((Class)objc_opt_class(&OBJC_CLASS___PaymentTransactionArchive, v4) == a3) {
    return @"archive_pid";
  }
  if ((Class)objc_opt_class(&OBJC_CLASS___MapsMerchant, v5) == a3) {
    return @"maps_merchant_pid";
  }
  if ((Class)objc_opt_class(&OBJC_CLASS___MapsBrand, v6) == a3) {
    return @"u";
  }
  return 0LL;
}

+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (__CFString *)v5;
  v148 = v7;
  if (v7 == @"transaction_source.pid") {
    goto LABEL_8;
  }
  if (v7)
  {
    unsigned __int8 v8 = [@"transaction_source.pid" isEqualToString:v7];

    if ((v8 & 1) != 0) {
      goto LABEL_8;
    }
    v9 = v148;
    if (v9 == @"transaction_source.identifier"
      || (v10 = v9,
          unsigned __int8 v11 = [@"transaction_source.identifier" isEqualToString:v9],
          v10,
          (v11 & 1) != 0)
      || (v12 = v10, v12 == @"transaction_source.type")
      || (v13 = v12,
          unsigned __int8 v14 = [@"transaction_source.type" isEqualToString:v12],
          v13,
          (v14 & 1) != 0))
    {
LABEL_8:
      v15 = @"JOIN transaction_source ON transaction_source.pid = payment_transaction.source_pid";
LABEL_9:
      [v6 addObject:v15];
      goto LABEL_10;
    }

    v16 = v13;
    if (v16 == @"payment_transaction_archive.pid"
      || (v17 = v16,
          unsigned __int8 v18 = [@"payment_transaction_archive.pid" isEqualToString:v16],
          v17,
          (v18 & 1) != 0))
    {
      v15 = @"JOIN payment_transaction_archive ON payment_transaction_archive.pid = payment_transaction.archive_pid";
      goto LABEL_9;
    }

    v19 = v17;
    if (v19 == @"maps_merchant.c") {
      goto LABEL_20;
    }
    v20 = v19;
    unsigned __int8 v21 = [@"maps_merchant.c" isEqualToString:v19];

    if ((v21 & 1) != 0) {
      goto LABEL_20;
    }
    v22 = v20;
    if (v22 == @"maps_merchant.identifier"
      || (v23 = v22,
          unsigned __int8 v24 = [@"maps_merchant.identifier" isEqualToString:v22],
          v23,
          (v24 & 1) != 0)
      || (v25 = v23, v25 == @"maps_merchant.name")
      || (v26 = v25,
          unsigned __int8 v27 = [@"maps_merchant.name" isEqualToString:v25],
          v26,
          (v27 & 1) != 0))
    {
LABEL_20:
      v15 = @"LEFT JOIN maps_merchant on maps_merchant.pid = payment_transaction.maps_merchant_pid";
      goto LABEL_9;
    }

    v28 = v26;
    if (v28 == @"plantains.a") {
      goto LABEL_27;
    }
    v29 = v28;
    unsigned __int8 v30 = [@"plantains.a" isEqualToString:v28];

    if ((v30 & 1) != 0) {
      goto LABEL_27;
    }
    v31 = v29;
    if (v31 == @"plantains.c"
      || (v32 = v31,
          unsigned __int8 v33 = [@"plantains.c" isEqualToString:v31],
          v32,
          (v33 & 1) != 0)
      || (v34 = v32, v34 == @"plantains.g")
      || (v35 = v34,
          unsigned __int8 v36 = [@"plantains.g" isEqualToString:v34],
          v35,
          (v36 & 1) != 0))
    {
LABEL_27:
      v15 = @"LEFT JOIN plantains on plantains.pid = payment_transaction.u";
      goto LABEL_9;
    }

    v37 = v35;
    if (v37 == @"mangos.d"
      || (v38 = v37,
          unsigned __int8 v39 = [@"mangos.d" isEqualToString:v37],
          v38,
          (v39 & 1) != 0)
      || (v40 = v38, v40 == @"mangos.c")
      || (v41 = v40,
          unsigned __int8 v42 = [@"mangos.c" isEqualToString:v40],
          v41,
          (v42 & 1) != 0))
    {
      v15 = @"LEFT JOIN mangos on mangos.a = payment_transaction.pid";
      goto LABEL_9;
    }

    v43 = v41;
    if (v43 == @"grapes.d"
      || (v44 = v43,
          unsigned __int8 v45 = [@"grapes.d" isEqualToString:v43],
          v44,
          (v45 & 1) != 0))
    {
      v46 = @"JOIN grapes on avocados.a = grapes.pid";
      v47 = @"JOIN avocados on cantaloupes.a = avocados.pid";
      v48 = @"JOIN cantaloupes on cantaloupes.b = payment_transaction.service_identifier";
LABEL_36:
      [v6 addObject:v48];
      [v6 addObject:v47];
      v15 = v46;
      goto LABEL_9;
    }

    v49 = v44;
    if (v49 == @"tomatoes.g"
      || (v50 = v49,
          unsigned __int8 v51 = [@"tomatoes.g" isEqualToString:v49],
          v50,
          (v51 & 1) != 0))
    {
      v15 = @"LEFT JOIN tomatoes on (tomatoes.pid = (SELECT MIN(tomatoes_.pid) FROM tomatoes tomatoes_ WHERE (tomatoes_.f = payment_transaction.service_identifier) LIMIT 1))";
      goto LABEL_9;
    }

    v52 = v50;
    if (v52 == @"gooseberry.c"
      || (v53 = v52,
          unsigned __int8 v54 = [@"gooseberry.c" isEqualToString:v52],
          v53,
          (v54 & 1) != 0))
    {
      v15 = @"LEFT JOIN gooseberry on gooseberry.transaction_source_pid = payment_transaction.source_pid";
      goto LABEL_9;
    }

    v55 = v53;
    if (v55 == @"world_region_mapping_left.world_region_pid") {
      goto LABEL_51;
    }
    v56 = v55;
    unsigned __int8 v57 = [@"world_region_mapping_left.world_region_pid" isEqualToString:v55];

    if ((v57 & 1) != 0) {
      goto LABEL_51;
    }
    v58 = v56;
    if (v58 == @"world_region_mapping_left.match_try_count") {
      goto LABEL_51;
    }
    v59 = v58;
    unsigned __int8 v60 = [@"world_region_mapping_left.match_try_count" isEqualToString:v58];

    if ((v60 & 1) != 0) {
      goto LABEL_51;
    }
    v61 = v59;
    if (v61 == @"world_region_mapping_left.last_modified_date"
      || (v62 = v61,
          unsigned __int8 v63 = [@"world_region_mapping_left.last_modified_date" isEqualToString:v61],  v62,  (v63 & 1) != 0)
      || (v64 = v62, v64 == @"world_region_left.identifier")
      || (v65 = v64,
          unsigned __int8 v66 = [@"world_region_left.identifier" isEqualToString:v64],
          v65,
          (v66 & 1) != 0))
    {
LABEL_51:
      v15 = @"LEFT JOIN world_region_mapping AS world_region_mapping_left ON world_region_mapping_left.payment_transaction_pid = payment_transaction.pid LEFT JOIN world_region AS world_region_left ON world_region_left.pid = world_region_mapping_left.world_region_pid";
      goto LABEL_9;
    }

    v67 = v65;
    if (v67 == @"world_region_mapping.world_region_pid") {
      goto LABEL_64;
    }
    v68 = v67;
    unsigned __int8 v69 = [@"world_region_mapping.world_region_pid" isEqualToString:v67];

    if ((v69 & 1) != 0) {
      goto LABEL_64;
    }
    v70 = v68;
    if (v70 == @"world_region.identifier") {
      goto LABEL_64;
    }
    v71 = v70;
    unsigned __int8 v72 = [@"world_region.identifier" isEqualToString:v70];

    if ((v72 & 1) != 0) {
      goto LABEL_64;
    }
    v73 = v71;
    if (v73 == @"world_region.type") {
      goto LABEL_64;
    }
    v74 = v73;
    unsigned __int8 v75 = [@"world_region.type" isEqualToString:v73];

    if ((v75 & 1) != 0) {
      goto LABEL_64;
    }
    v76 = v74;
    if (v76 == @"world_region_localized_content.name") {
      goto LABEL_64;
    }
    v77 = v76;
    unsigned __int8 v78 = [@"world_region_localized_content.name" isEqualToString:v76];

    if ((v78 & 1) != 0) {
      goto LABEL_64;
    }
    v79 = v77;
    if (v79 == @"world_region_localized_content.locale_identifier"
      || (v80 = v79,
          unsigned __int8 v81 = [@"world_region_localized_content.locale_identifier" isEqualToString:v79],  v80,  (v81 & 1) != 0)
      || (v82 = v80, v82 == @"world_region_localized_content.status")
      || (v83 = v82,
          unsigned __int8 v84 = [@"world_region_localized_content.status" isEqualToString:v82],
          v83,
          (v84 & 1) != 0))
    {
LABEL_64:
      v46 = @"JOIN world_region_localized_content ON world_region_localized_content.world_region_pid = world_region.pid";
      v47 = @"JOIN world_region AS world_region ON world_region.pid = world_region_mapping.world_region_pid";
      v48 = @"JOIN world_region_mapping ON world_region_mapping.payment_transaction_pid = payment_transaction.pid";
      goto LABEL_36;
    }

    v85 = v83;
    if (v85 == @"payment_transaction_tag.payment_transaction_pid") {
      goto LABEL_73;
    }
    v86 = v85;
    unsigned __int8 v87 = [@"payment_transaction_tag.payment_transaction_pid" isEqualToString:v85];

    if ((v87 & 1) != 0) {
      goto LABEL_73;
    }
    v88 = v86;
    if (v88 == @"payment_transaction_tag.type") {
      goto LABEL_73;
    }
    v89 = v88;
    unsigned __int8 v90 = [@"payment_transaction_tag.type" isEqualToString:v88];

    if ((v90 & 1) != 0) {
      goto LABEL_73;
    }
    v91 = v89;
    if (v91 == @"payment_transaction_tag.localized_title"
      || (v92 = v91,
          unsigned __int8 v93 = [@"payment_transaction_tag.localized_title" isEqualToString:v91],
          v92,
          (v93 & 1) != 0)
      || (v94 = v92, v94 == @"payment_transaction_tag.locale_identifier")
      || (v95 = v94,
          unsigned __int8 v96 = [@"payment_transaction_tag.locale_identifier" isEqualToString:v94],  v95,  (v96 & 1) != 0))
    {
LABEL_73:
      v15 = @"JOIN payment_transaction_tag on payment_transaction_tag.payment_transaction_pid = payment_transaction.pid";
      goto LABEL_9;
    }

    v97 = v95;
    if (v97 == @"apples.c") {
      goto LABEL_88;
    }
    v98 = v97;
    unsigned __int8 v99 = [@"apples.c" isEqualToString:v97];

    if ((v99 & 1) != 0) {
      goto LABEL_88;
    }
    v100 = v98;
    if (v100 == @"apples.d") {
      goto LABEL_88;
    }
    v101 = v100;
    unsigned __int8 v102 = [@"apples.d" isEqualToString:v100];

    if ((v102 & 1) != 0) {
      goto LABEL_88;
    }
    v103 = v101;
    if (v103 == @"apples.e") {
      goto LABEL_88;
    }
    v104 = v103;
    unsigned __int8 v105 = [@"apples.e" isEqualToString:v103];

    if ((v105 & 1) != 0) {
      goto LABEL_88;
    }
    v106 = v104;
    if (v106 == @"apples.g") {
      goto LABEL_88;
    }
    v107 = v106;
    unsigned __int8 v108 = [@"apples.g" isEqualToString:v106];

    if ((v108 & 1) != 0) {
      goto LABEL_88;
    }
    v109 = v107;
    if (v109 == @"apples.h") {
      goto LABEL_88;
    }
    v110 = v109;
    unsigned __int8 v111 = [@"apples.h" isEqualToString:v109];

    if ((v111 & 1) != 0) {
      goto LABEL_88;
    }
    v112 = v110;
    if (v112 == @"apples.k"
      || (v113 = v112,
          unsigned __int8 v114 = [@"apples.k" isEqualToString:v112],
          v113,
          (v114 & 1) != 0)
      || (v115 = v113, v115 == @"apples.m")
      || (v116 = v115,
          unsigned __int8 v117 = [@"apples.m" isEqualToString:v115],
          v116,
          (v117 & 1) != 0))
    {
LABEL_88:
      v15 = @"JOIN apples on apples.b = payment_transaction.pid";
      goto LABEL_9;
    }

    v118 = v116;
    if (v118 == @"pears.a"
      || (v119 = v118,
          unsigned __int8 v120 = [@"pears.a" isEqualToString:v118],
          v119,
          (v120 & 1) != 0)
      || (v121 = v119, v121 == @"pears.pid")
      || (v122 = v121,
          unsigned __int8 v123 = [@"pears.pid" isEqualToString:v121],
          v122,
          (v123 & 1) != 0))
    {
      v15 = @"JOIN pears on pears.a = payment_transaction.account_identifier";
      goto LABEL_9;
    }

    v124 = v122;
    if (v124 == @"payment_transaction_authentication.pid") {
      goto LABEL_108;
    }
    v125 = v124;
    unsigned __int8 v126 = [@"payment_transaction_authentication.pid" isEqualToString:v124];

    if ((v126 & 1) != 0) {
      goto LABEL_108;
    }
    v127 = v125;
    if (v127 == @"payment_transaction_authentication.complete") {
      goto LABEL_108;
    }
    v128 = v127;
    unsigned __int8 v129 = [@"payment_transaction_authentication.complete" isEqualToString:v127];

    if ((v129 & 1) != 0) {
      goto LABEL_108;
    }
    v130 = v128;
    if (v130 == @"payment_transaction_authentication.processed_auth_mechanisms") {
      goto LABEL_108;
    }
    v131 = v130;
    unsigned __int8 v132 = [@"payment_transaction_authentication.processed_auth_mechanisms" isEqualToString:v130];

    if ((v132 & 1) != 0) {
      goto LABEL_108;
    }
    v133 = v131;
    if (v133 == @"payment_transaction_authentication.data_collected_auth_mechanisms") {
      goto LABEL_108;
    }
    v134 = v133;
    unsigned __int8 v135 = [@"payment_transaction_authentication.data_collected_auth_mechanisms" isEqualToString:v133];

    if ((v135 & 1) != 0) {
      goto LABEL_108;
    }
    v136 = v134;
    if (v136 == @"payment_transaction_authentication.auth_data_payment_pin") {
      goto LABEL_108;
    }
    v137 = v136;
    unsigned __int8 v138 = [@"payment_transaction_authentication.auth_data_payment_pin" isEqualToString:v136];

    if ((v138 & 1) != 0) {
      goto LABEL_108;
    }
    v139 = v137;
    if (v139 == @"payment_transaction_authentication.auth_data_user_confirmation"
      || (v140 = v139,
          unsigned __int8 v141 = [@"payment_transaction_authentication.auth_data_user_confirmation" isEqualToString:v139],  v140,  (v141 & 1) != 0)
      || (v142 = v140, v142 == @"payment_transaction_authentication.auth_data_transaction_signature")
      || (v143 = v142,
          unsigned __int8 v144 = [@"payment_transaction_authentication.auth_data_transaction_signature" isEqualToString:v142],  v143,  (v144 & 1) != 0))
    {
LABEL_108:
      v15 = @"LEFT JOIN payment_transaction_authentication on payment_transaction_authentication.payment_transaction_pid = payment_transaction.pid";
      goto LABEL_9;
    }

    v145 = v143;
    if (v145 == @"zucchini.m"
      || (v146 = v145,
          unsigned __int8 v147 = [@"zucchini.m" isEqualToString:v145],
          v146,
          (v147 & 1) != 0))
    {
      v15 = @"JOIN zucchini on zucchini.e == payment_transaction.service_identifier";
      goto LABEL_9;
    }
  }

+ (id)disambiguatedSQLForProperty:(id)a3
{
  uint64_t v4 = (__CFString *)a3;
  id v5 = v4;
  if (v4 == @"count"
    || v4
    && ((unsigned __int8 v6 = -[__CFString isEqualToString:](v4, "isEqualToString:", @"count"),
         v5,
         (v6 & 1) != 0)
     || (v7 = v5, v7 == @"COUNT(*) as count")
     || (unsigned __int8 v8 = v7,
         unsigned int v9 = -[__CFString isEqualToString:](v7, "isEqualToString:", @"COUNT(*) as count"),
         v8,
         v9)))
  {
    v10 = v5;
  }

  else
  {
    v14.receiver = a1;
    v14.super_class = (Class)&OBJC_METACLASS___PaymentTransaction;
    id v11 = objc_msgSendSuper2(&v14, "disambiguatedSQLForProperty:", v5);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue(v11);
  }

  v12 = v10;

  return v12;
}

+ (id)insertPaymentTransaction:(id)a3 withTransactionSource:(id)a4 inDatabase:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = sub_1003F17AC(objc_alloc(&OBJC_CLASS___PaymentTransaction), v9, v8, v7);

  return v10;
}

+ (id)truncateEntitiesForTransactionSourceIdentifiers:(id)a3 withNotificationServiceData:(unint64_t)a4 suppressedFromUI:(unint64_t)a5 inDatabase:(id)a6 toCount:(int64_t)a7
{
  id v12 = a6;
  id v13 = sub_1003F4640((uint64_t)a1, a3);
  objc_super v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  id v15 = sub_1003F47B8((uint64_t)a1, a4);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  if (a5 == 2)
  {
    id v18 = a1;
    int v19 = 0;
LABEL_7:
    id v20 = sub_1003F4844((uint64_t)v18, v19);
    uint64_t v17 = objc_claimAutoreleasedReturnValue(v20);
    goto LABEL_8;
  }

  if (a5 == 1)
  {
    id v18 = a1;
    int v19 = 1;
    goto LABEL_7;
  }

  if (a5)
  {
    unsigned __int8 v21 = 0LL;
    goto LABEL_10;
  }

  uint64_t v17 = objc_claimAutoreleasedReturnValue(+[SQLiteBooleanPredicate truePredicate](&OBJC_CLASS___SQLiteBooleanPredicate, "truePredicate"));
LABEL_8:
  unsigned __int8 v21 = (void *)v17;
LABEL_10:
  v37[0] = v14;
  v37[1] = v16;
  v37[2] = v21;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v37, 3LL));
  v23 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v22));

  unsigned __int8 v36 = @"transaction_date";
  unsigned __int8 v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v36, 1LL));
  v35 = @"DESC";
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v35, 1LL));
  v26 = (void *)objc_claimAutoreleasedReturnValue( [a1 queryWithDatabase:v12 predicate:v23 orderingProperties:v24 orderingDirections:v25]);

  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  v31[2] = sub_1003F497C;
  v31[3] = &unk_100643FD8;
  unsigned __int8 v33 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  int64_t v34 = a7;
  id v32 = v12;
  unsigned __int8 v27 = v33;
  id v28 = v12;
  [v26 enumeratePersistentIDsUsingBlock:v31];
  id v29 = -[NSMutableSet copy](v27, "copy");

  return v29;
}

+ (void)deleteEntitiesForTransactionSource:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = sub_1003F4AB8((uint64_t)a1, (uint64_t)[a3 persistentID]);
  id v9 = (id)objc_claimAutoreleasedReturnValue(v7);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v9]);

  [v8 deleteAllEntities];
}

+ (void)deleteEntitiesWithPIDs:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue( +[SQLiteContainsPredicate containsPredicateWithProperty:values:]( &OBJC_CLASS___SQLiteContainsPredicate,  "containsPredicateWithProperty:values:",  @"pid",  a3));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

- (BOOL)deleteFromDatabase
{
  v3 = objc_autoreleasePoolPush();
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  +[PaymentTransactionFee deleteEntitiesForPaymentTransaction:inDatabase:]( &OBJC_CLASS___PaymentTransactionFee,  "deleteEntitiesForPaymentTransaction:inDatabase:",  self,  v4);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  +[PaymentTransactionReward deleteEntitiesForPaymentTransaction:inDatabase:]( &OBJC_CLASS___PaymentTransactionReward,  "deleteEntitiesForPaymentTransaction:inDatabase:",  self,  v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  +[PaymentTransactionQuestion deleteEntitiesForPaymentTransaction:inDatabase:]( &OBJC_CLASS___PaymentTransactionQuestion,  "deleteEntitiesForPaymentTransaction:inDatabase:",  self,  v6);

  int64_t v7 = -[SQLiteEntity persistentID](self, "persistentID");
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  +[PaymentTransactionAmount deleteEntitiesForPaymentTransactionPID:inDatabase:]( &OBJC_CLASS___PaymentTransactionAmount,  "deleteEntitiesForPaymentTransactionPID:inDatabase:",  v7,  v8);

  int64_t v9 = -[SQLiteEntity persistentID](self, "persistentID");
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  +[TransactionCommutePlanUnit deleteEntitiesForPaymentTransactionPID:inDatabase:]( &OBJC_CLASS___TransactionCommutePlanUnit,  "deleteEntitiesForPaymentTransactionPID:inDatabase:",  v9,  v10);

  int64_t v11 = -[SQLiteEntity persistentID](self, "persistentID");
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  +[PaymentTransactionTag deleteEntitiesForPaymentTransactionPID:inDatabase:]( &OBJC_CLASS___PaymentTransactionTag,  "deleteEntitiesForPaymentTransactionPID:inDatabase:",  v11,  v12);

  uint64_t v70 = 0LL;
  v71 = &v70;
  uint64_t v72 = 0x3032000000LL;
  v73 = sub_1003F5278;
  v74 = sub_1003F5288;
  id v75 = 0LL;
  uint64_t v64 = 0LL;
  v65 = &v64;
  uint64_t v66 = 0x3032000000LL;
  v67 = sub_1003F5278;
  v68 = sub_1003F5288;
  id v69 = 0LL;
  uint64_t v58 = 0LL;
  v59 = &v58;
  uint64_t v60 = 0x3032000000LL;
  v61 = sub_1003F5278;
  v62 = sub_1003F5288;
  id v63 = 0LL;
  uint64_t v52 = 0LL;
  v53 = &v52;
  uint64_t v54 = 0x3032000000LL;
  v55 = sub_1003F5278;
  v56 = sub_1003F5288;
  id v57 = 0LL;
  uint64_t v46 = 0LL;
  v47 = &v46;
  uint64_t v48 = 0x3032000000LL;
  v49 = sub_1003F5278;
  v50 = sub_1003F5288;
  id v51 = 0LL;
  v77[0] = @"archive_pid";
  v77[1] = @"identifier";
  v77[2] = @"account_identifier";
  v77[3] = @"maps_merchant_pid";
  v77[4] = @"u";
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v77, 5LL));
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472LL;
  v45[2] = sub_1003F5290;
  v45[3] = &unk_10065D428;
  v45[4] = &v70;
  v45[5] = &v64;
  v45[6] = &v58;
  v45[7] = &v52;
  v45[8] = &v46;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v13, v45);
  id v14 = [(id)v71[5] longValue];
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  +[PaymentTransactionArchive deleteArchiveForPID:inDatabase:]( &OBJC_CLASS___PaymentTransactionArchive,  "deleteArchiveForPID:inDatabase:",  v14,  v15);

  if (v65[5] && v59[5])
  {
    v16 = objc_alloc_init(&OBJC_CLASS___PKPaymentTransactionToDeleteFromFinance);
    -[PKPaymentTransactionToDeleteFromFinance setTransactionIdentifier:](v16, "setTransactionIdentifier:", v65[5]);
    -[PKPaymentTransactionToDeleteFromFinance setAccountIdentifier:](v16, "setAccountIdentifier:", v59[5]);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
    +[PaymentTransactionToDeleteFromFinance insertPaymentTransactionToDeleteFromFinance:inDatabase:]( &OBJC_CLASS___PaymentTransactionToDeleteFromFinance,  "insertPaymentTransactionToDeleteFromFinance:inDatabase:",  v16,  v17);
  }

  int64_t v18 = -[SQLiteEntity persistentID](self, "persistentID");
  int v19 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  +[TransactionReleasedData deleteEntitiesForPaymentTransactionPID:inDatabase:]( &OBJC_CLASS___TransactionReleasedData,  "deleteEntitiesForPaymentTransactionPID:inDatabase:",  v18,  v19);

  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  id v20 = sub_1003F5310(self);
  unsigned __int8 v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  id v22 = [v21 countByEnumeratingWithState:&v41 objects:v76 count:16];
  if (v22)
  {
    uint64_t v23 = *(void *)v42;
    do
    {
      unsigned __int8 v24 = 0LL;
      do
      {
        if (*(void *)v42 != v23) {
          objc_enumerationMutation(v21);
        }
        v25 = *(void **)(*((void *)&v41 + 1) + 8LL * (void)v24);
        v40[0] = _NSConcreteStackBlock;
        v40[1] = 3221225472LL;
        v40[2] = sub_1003F5368;
        v40[3] = &unk_100652990;
        v40[4] = self;
        [v25 enumerateKeysAndObjectsUsingBlock:v40];
        unsigned __int8 v24 = (char *)v24 + 1;
      }

      while (v22 != v24);
      id v22 = [v21 countByEnumeratingWithState:&v41 objects:v76 count:16];
    }

    while (v22);
  }

  if (v53[5])
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
    id v27 = sub_1003F53E0((uint64_t)&OBJC_CLASS___PaymentTransaction, (void *)v53[5]);
    id v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    id v29 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryWithDatabase:predicate:orderingProperties:orderingDirections:limit:]( &OBJC_CLASS___PaymentTransaction,  "queryWithDatabase:predicate:orderingProperties:orderingDirections:limit:",  v26,  v28,  0LL,  0LL,  2LL));

    if ((uint64_t)[v29 countOfEntities] <= 1)
    {
      unsigned __int8 v30 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
      v31 = (void *)objc_claimAutoreleasedReturnValue( +[MapsMerchant anyInDatabase:withPID:]( &OBJC_CLASS___MapsMerchant,  "anyInDatabase:withPID:",  v30,  v53[5]));

      [v31 deleteFromDatabase];
    }
  }

  if (v47[5])
  {
    id v32 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
    id v33 = sub_1003F5434((uint64_t)&OBJC_CLASS___PaymentTransaction, (void *)v47[5]);
    int64_t v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
    v35 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryWithDatabase:predicate:orderingProperties:orderingDirections:limit:]( &OBJC_CLASS___PaymentTransaction,  "queryWithDatabase:predicate:orderingProperties:orderingDirections:limit:",  v32,  v34,  0LL,  0LL,  2LL));

    if ((uint64_t)[v35 countOfEntities] <= 1)
    {
      unsigned __int8 v36 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
      v37 = (void *)objc_claimAutoreleasedReturnValue( +[MapsBrand anyInDatabase:withPID:]( &OBJC_CLASS___MapsBrand,  "anyInDatabase:withPID:",  v36,  v47[5]));

      [v37 deleteFromDatabase];
    }
  }

  _Block_object_dispose(&v46, 8);
  _Block_object_dispose(&v52, 8);

  _Block_object_dispose(&v58, 8);
  _Block_object_dispose(&v64, 8);

  _Block_object_dispose(&v70, 8);
  objc_autoreleasePoolPop(v3);
  v39.receiver = self;
  v39.super_class = (Class)&OBJC_CLASS___PaymentTransaction;
  return -[SQLiteEntity deleteFromDatabase](&v39, "deleteFromDatabase");
}

+ (id)anyInDatabase:(id)a3 withPID:(id)a4
{
  id v6 = a3;
  id v7 = sub_1003F54F0((uint64_t)a1, a4);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  int64_t v9 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v8]);

  return v9;
}

+ (id)anyInDatabase:(id)a3 withTransactionSourceIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = sub_1003F55AC((uint64_t)a1, a4);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  int64_t v9 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v8]);

  return v9;
}

+ (id)anyInDatabase:(id)a3 withServiceIdentifier:(id)a4 accountIdentifier:(id)a5 accountType:(int64_t)a6
{
  id v10 = a4;
  id v11 = a3;
  id v12 = sub_1003F5750((uint64_t)a1, a5);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  id v14 = sub_1003F57A4((uint64_t)a1, a6);
  id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  id v16 = sub_1003F5808((uint64_t)a1, v10);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(v16);

  v22[0] = v13;
  v22[1] = v15;
  v22[2] = v17;
  int64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v22, 3LL));
  int v19 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v18));

  id v20 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v11 predicate:v19]);
  return v20;
}

+ (id)anyInDatabase:(id)a3 withServiceIdentifier:(id)a4 forTransactionSourceIdentifier:(id)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = sub_1003F55AC((uint64_t)a1, a5);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  id v12 = sub_1003F5808((uint64_t)a1, v8);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  v18[0] = v11;
  v18[1] = v13;
  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v18, 2LL));
  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v14));

  id v16 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v9 predicate:v15]);
  return v16;
}

+ (id)anyInDatabase:(id)a3 withIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = sub_1003F59DC((uint64_t)a1, a4);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v8]);

  return v9;
}

+ (id)anyInDatabase:(id)a3 withReferenceIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = sub_1003F5A98((uint64_t)a1, a4);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v8]);

  return v9;
}

+ (BOOL)hasAnyTransactionsInDatabase:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[SQLiteBooleanPredicate truePredicate](&OBJC_CLASS___SQLiteBooleanPredicate, "truePredicate"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( [a1 queryWithDatabase:v4 predicate:v5 orderingProperties:0 orderingDirections:0 limit:1]);

  LOBYTE(v5) = (uint64_t)[v6 countOfEntities] > 0;
  return (char)v5;
}

+ (BOOL)hasAnyTransactionsInDatabase:(id)a3 withMerchantIdentifiers:(id)a4
{
  return [a1 hasAnyTransactionsInDatabase:a3 withMerchantIdentifiers:a4 forTransactionSourceIdentifiers:0];
}

+ (BOOL)hasAnyTransactionsInDatabase:(id)a3 withMerchantIdentifiers:(id)a4 forTransactionSourceIdentifiers:(id)a5
{
  return [a1 hasAnyTransactionsInDatabase:a3 withMerchantIdentifiers:a4 forTransactionSourceIdentifiers:a5 startDate:0 endDate:0];
}

+ (BOOL)hasAnyTransactionsInDatabase:(id)a3 withMerchantIdentifiers:(id)a4 forTransactionSourceIdentifiers:(id)a5 startDate:(id)a6 endDate:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  unint64_t v14 = (unint64_t)a6;
  unint64_t v15 = (unint64_t)a7;
  id v16 = a4;
  uint64_t v17 = objc_alloc(&OBJC_CLASS___NSMutableArray);
  id v18 = sub_1003F5E04((uint64_t)a1, v16);
  int v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

  unsigned __int8 v36 = v19;
  id v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v36, 1LL));
  unsigned __int8 v21 = -[NSMutableArray initWithArray:](v17, "initWithArray:", v20);

  if ([v13 count])
  {
    id v22 = sub_1003F4640((uint64_t)a1, v13);
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    -[NSMutableArray addObject:](v21, "addObject:", v23);
  }

  if (v14)
  {
    id v24 = sub_1003F5E58((uint64_t)a1, (void *)v14);
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    -[NSMutableArray addObject:](v21, "addObject:", v25);
  }

  if (v15)
  {
    id v26 = sub_1003F5EE4((uint64_t)a1, (void *)v15);
    id v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    -[NSMutableArray addObject:](v21, "addObject:", v27);
  }

  id v28 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v21));
  if (v14 | v15)
  {
    v35 = @"transaction_date";
    id v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v35, 1LL));
    int64_t v34 = @"DESC";
    unsigned __int8 v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v34, 1LL));
    v31 = (void *)objc_claimAutoreleasedReturnValue( [a1 queryWithDatabase:v12 predicate:v28 orderingProperties:v29 orderingDirections:v30 limit:1]);
  }

  else
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue( [a1 queryWithDatabase:v12 predicate:v28 orderingProperties:0 orderingDirections:0 limit:1]);
  }

  BOOL v32 = (uint64_t)[v31 countOfEntities] > 0;

  return v32;
}

+ (BOOL)hasAnyTransactionsInDatabase:(id)a3 withMapsIdentifiers:(id)a4
{
  return [a1 hasAnyTransactionsInDatabase:a3 withMapsIdentifiers:a4 forTransactionSourceIdentifiers:0];
}

+ (BOOL)hasAnyTransactionsInDatabase:(id)a3 withMapsIdentifiers:(id)a4 forTransactionSourceIdentifiers:(id)a5
{
  return [a1 hasAnyTransactionsInDatabase:a3 withMapsIdentifiers:a4 forTransactionSourceIdentifiers:a5 startDate:0 endDate:0];
}

+ (BOOL)hasAnyTransactionsInDatabase:(id)a3 withMapsIdentifiers:(id)a4 forTransactionSourceIdentifiers:(id)a5 startDate:(id)a6 endDate:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  unint64_t v14 = (unint64_t)a6;
  unint64_t v15 = (unint64_t)a7;
  id v16 = a4;
  uint64_t v17 = objc_alloc(&OBJC_CLASS___NSMutableArray);
  id v18 = sub_1003F6200((uint64_t)a1, v16);
  int v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

  unsigned __int8 v36 = v19;
  id v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v36, 1LL));
  unsigned __int8 v21 = -[NSMutableArray initWithArray:](v17, "initWithArray:", v20);

  if ([v13 count])
  {
    id v22 = sub_1003F4640((uint64_t)a1, v13);
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    -[NSMutableArray addObject:](v21, "addObject:", v23);
  }

  if (v14)
  {
    id v24 = sub_1003F5E58((uint64_t)a1, (void *)v14);
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    -[NSMutableArray addObject:](v21, "addObject:", v25);
  }

  if (v15)
  {
    id v26 = sub_1003F5EE4((uint64_t)a1, (void *)v15);
    id v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    -[NSMutableArray addObject:](v21, "addObject:", v27);
  }

  id v28 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v21));
  if (v14 | v15)
  {
    v35 = @"transaction_date";
    id v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v35, 1LL));
    int64_t v34 = @"DESC";
    unsigned __int8 v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v34, 1LL));
    v31 = (void *)objc_claimAutoreleasedReturnValue( [a1 queryWithDatabase:v12 predicate:v28 orderingProperties:v29 orderingDirections:v30 limit:1]);
  }

  else
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue( [a1 queryWithDatabase:v12 predicate:v28 orderingProperties:0 orderingDirections:0 limit:1]);
  }

  BOOL v32 = (uint64_t)[v31 countOfEntities] > 0;

  return v32;
}

+ (BOOL)hasAnyTransactionsInDatabase:(id)a3 withMapsBrandIdentifiers:(id)a4
{
  return [a1 hasAnyTransactionsInDatabase:a3 withMapsBrandIdentifiers:a4 forTransactionSourceIdentifiers:0];
}

+ (BOOL)hasAnyTransactionsInDatabase:(id)a3 withMapsBrandIdentifiers:(id)a4 forTransactionSourceIdentifiers:(id)a5
{
  return [a1 hasAnyTransactionsInDatabase:a3 withMapsBrandIdentifiers:a4 forTransactionSourceIdentifiers:a5 startDate:0 endDate:0];
}

+ (BOOL)hasAnyTransactionsInDatabase:(id)a3 withMapsBrandIdentifiers:(id)a4 forTransactionSourceIdentifiers:(id)a5 startDate:(id)a6 endDate:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  unint64_t v14 = (unint64_t)a6;
  unint64_t v15 = (unint64_t)a7;
  id v16 = a4;
  uint64_t v17 = objc_alloc(&OBJC_CLASS___NSMutableArray);
  id v18 = sub_1003F64E4((uint64_t)a1, v16);
  int v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

  unsigned __int8 v36 = v19;
  id v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v36, 1LL));
  unsigned __int8 v21 = -[NSMutableArray initWithArray:](v17, "initWithArray:", v20);

  if ([v13 count])
  {
    id v22 = sub_1003F4640((uint64_t)a1, v13);
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    -[NSMutableArray addObject:](v21, "addObject:", v23);
  }

  if (v14)
  {
    id v24 = sub_1003F5E58((uint64_t)a1, (void *)v14);
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    -[NSMutableArray addObject:](v21, "addObject:", v25);
  }

  if (v15)
  {
    id v26 = sub_1003F5EE4((uint64_t)a1, (void *)v15);
    id v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    -[NSMutableArray addObject:](v21, "addObject:", v27);
  }

  id v28 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v21));
  if (v14 | v15)
  {
    v35 = @"transaction_date";
    id v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v35, 1LL));
    int64_t v34 = @"DESC";
    unsigned __int8 v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v34, 1LL));
    v31 = (void *)objc_claimAutoreleasedReturnValue( [a1 queryWithDatabase:v12 predicate:v28 orderingProperties:v29 orderingDirections:v30 limit:1]);
  }

  else
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue( [a1 queryWithDatabase:v12 predicate:v28 orderingProperties:0 orderingDirections:0 limit:1]);
  }

  BOOL v32 = (uint64_t)[v31 countOfEntities] > 0;

  return v32;
}

+ (BOOL)hasAnyTransactionsInDatabase:(id)a3 withTransactionType:(int64_t)a4
{
  id v6 = a3;
  id v7 = sub_1003F65C0((uint64_t)a1, a4);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = (void *)objc_claimAutoreleasedReturnValue( [a1 queryWithDatabase:v6 predicate:v8 orderingProperties:0 orderingDirections:0 limit:1]);

  LOBYTE(v8) = (uint64_t)[v9 countOfEntities] > 0;
  return (char)v8;
}

+ (id)mostRecentActiveTransactionInDatabase:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:notEqualToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:notEqualToValue:",  @"transaction_status",  &off_1006908D8));
  id v6 = sub_1003F6864((uint64_t)a1, 1LL);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v27[0] = v5;
  v27[1] = v7;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v27, 2LL));
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v8));

  id v26 = @"transaction_date";
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v26, 1LL));
  v25 = @"DESC";
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v25, 1LL));
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryWithDatabase:predicate:orderingProperties:orderingDirections:limit:]( &OBJC_CLASS___PaymentTransaction,  "queryWithDatabase:predicate:orderingProperties:orderingDirections:limit:",  v4,  v9,  v10,  v11,  1LL));

  uint64_t v19 = 0LL;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  id v22 = sub_1003F5278;
  uint64_t v23 = sub_1003F5288;
  id v24 = 0LL;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1003F6A38;
  v16[3] = &unk_100658628;
  id v18 = &v19;
  id v13 = v4;
  id v17 = v13;
  [v12 enumeratePersistentIDsUsingBlock:v16];
  id v14 = (id)v20[5];

  _Block_object_dispose(&v19, 8);
  return v14;
}

+ (id)anyInDatabase:(id)a3 withPaymentHash:(id)a4 withTransactionSource:(unint64_t)a5 withNotificationServiceData:(unint64_t)a6 transactionSourceIdentifiers:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  if ([v13 length])
  {
    id v15 = sub_1003F4640((uint64_t)a1, v14);
    id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v27[0] = v16;
    id v17 = sub_1003F6C2C((uint64_t)a1, a5, 1);
    id v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v27[1] = v18;
    id v19 = sub_1003F47B8((uint64_t)a1, a6);
    id v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    void v27[2] = v20;
    id v21 = sub_1003F6DB4((uint64_t)a1, v13);
    id v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    v27[3] = v22;
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v27, 4LL));

    id v24 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v23));
    v25 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v12 predicate:v24]);
  }

  else
  {
    v25 = 0LL;
  }

  return v25;
}

+ (void)deleteIssuerInstallmentTransactionsInDatabase:(id)a3 transactionSourceIdentifiers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 count])
  {
    id v8 = sub_1003F4640((uint64_t)a1, v7);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v14[0] = v9;
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"iit",  &__kCFBooleanTrue));
    v14[1] = v10;
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v14, 2LL));

    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v11));
    id v13 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v12]);
    [v13 deleteAllEntities];
  }
}

+ (id)issuerInstallmentTransactionsInDatabase:(id)a3 transactionSourceIdentifiers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 count])
  {
    id v8 = sub_1003F4640((uint64_t)a1, v7);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v17[0] = v9;
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"iit",  &__kCFBooleanTrue));
    v17[1] = v10;
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v17, 2LL));

    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v11));
    id v13 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v12]);
    id v14 = sub_1003F7224((uint64_t)a1, v13);
    id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  }

  else
  {
    id v15 = 0LL;
  }

  return v15;
}

+ (id)issuerInstallmentTransactionsInDatabase:(id)a3 transactionSourceIdentifiers:(id)a4 transactionPaymentHashes:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v10 count])
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"iit",  &__kCFBooleanTrue));
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteContainsPredicate containsPredicateWithProperty:values:]( &OBJC_CLASS___SQLiteContainsPredicate,  "containsPredicateWithProperty:values:",  @"payment_hash",  v10,  v11));
    v21[1] = v12;
    id v13 = sub_1003F4640((uint64_t)a1, v9);
    id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v21[2] = v14;
    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v21, 3LL));

    id v16 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v15));
    id v17 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v8 predicate:v16]);
    id v18 = sub_1003F7224((uint64_t)a1, v17);
    id v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  }

  else
  {
    id v19 = &__NSArray0__struct;
  }

  return v19;
}

+ (id)paymentTransactionsInDatabase:(id)a3 withIdentifiers:(id)a4 regions:(id *)a5 tags:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v11 count]);
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id v13 = v11;
  id v14 = [v13 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v26;
    do
    {
      id v17 = 0LL;
      do
      {
        if (*(void *)v26 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = sub_1003F59DC((uint64_t)a1, *(void **)(*((void *)&v25 + 1) + 8LL * (void)v17));
        id v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
        -[NSMutableArray addObject:](v12, "addObject:", v19, (void)v25);

        id v17 = (char *)v17 + 1;
      }

      while (v15 != v17);
      id v15 = [v13 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }

    while (v15);
  }

  id v20 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAnyPredicates:",  v12));
  id v21 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v10 predicate:v20]);

  id v22 = sub_1003F75B4((uint64_t)a1, v21, a5, a6);
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(v22);

  return v23;
}

+ (id)paymentTransactionsInDatabase:(id)a3 withFullPaymentHashes:(id)a4 transactionSourceIdentifiers:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v10 count])
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteContainsPredicate containsPredicateWithProperty:values:]( &OBJC_CLASS___SQLiteContainsPredicate,  "containsPredicateWithProperty:values:",  @"payment_hash",  v9));
    v20[0] = v11;
    id v12 = sub_1003F4640((uint64_t)a1, v10);
    id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v20[1] = v13;
    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v20, 2LL));
    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v14));

    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v8 predicate:v15]);
    id v17 = sub_1003F7224((uint64_t)a1, v16);
    id v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  }

  else
  {
    id v18 = 0LL;
  }

  return v18;
}

+ (id)closestTransactionInDatabase:(id)a3 fromTransaction:(id)a4 forTransactionSourceIdentifiers:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v13 = sub_1003F47B8((uint64_t)a1, 2LL);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  -[NSMutableArray addObject:](v12, "addObject:", v14);

  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteNullPredicate isNullPredicateWithProperty:]( &OBJC_CLASS___SQLiteNullPredicate,  "isNullPredicateWithProperty:",  @"service_identifier"));
  -[NSMutableArray addObject:](v12, "addObject:", v15);

  id v16 = sub_1003F4640((uint64_t)a1, v11);
  id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  -[NSMutableArray addObject:](v12, "addObject:", v17);

  v71 = v10;
  uint64_t v72 = (void *)objc_claimAutoreleasedReturnValue([v10 transactionDate]);
  id v18 = sub_1003F7F48((uint64_t)a1, v72, 600.0);
  id v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  -[NSMutableArray addObject:](v12, "addObject:", v19);

  id v69 = v12;
  id v20 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v12));
  id v66 = a1;
  v68 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v9 predicate:v20]);
  id v21 = sub_1003F7224((uint64_t)a1, v68);
  id v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v22));

  uint64_t Object = PKLogFacilityTypeGetObject(23LL);
  __int128 v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    double v82 = COERCE_DOUBLE([v23 count]);
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Found %lu close transactions", buf, 0xCu);
  }

  if ([v23 count])
  {
    oslog = v25;
    __int128 v26 = (void *)objc_claimAutoreleasedReturnValue([v71 amount]);
    id v64 = v11;
    v61 = v26;
    if (v26)
    {
      __int128 v27 = v23;
      __int128 v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDecimalNumber notANumber](&OBJC_CLASS___NSDecimalNumber, "notANumber"));
      LODWORD(v26) = [v26 compare:v28] != 0;

      uint64_t v23 = v27;
    }

    id v63 = v20;
    id v65 = v9;
    uint64_t v70 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    __int128 v77 = 0u;
    __int128 v78 = 0u;
    __int128 v79 = 0u;
    __int128 v80 = 0u;
    v62 = v23;
    id v29 = v23;
    id v30 = [v29 countByEnumeratingWithState:&v77 objects:v86 count:16];
    if (v30)
    {
      id v31 = v30;
      BOOL v32 = 0LL;
      uint64_t v33 = *(void *)v78;
      do
      {
        for (i = 0LL; i != v31; i = (char *)i + 1)
        {
          if (*(void *)v78 != v33) {
            objc_enumerationMutation(v29);
          }
          v35 = *(void **)(*((void *)&v77 + 1) + 8LL * (void)i);
          if ((_DWORD)v26)
          {
            unsigned __int8 v36 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v77 + 1) + 8 * (void)i) amount]);
            v37 = (void *)objc_claimAutoreleasedReturnValue([v71 amount]);
            int v38 = PKEqualObjects(v36, v37);

            if (v38) {
              -[NSMutableSet addObject:](v70, "addObject:", v35);
            }
          }

          objc_super v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "transactionDate", v61));
          [v72 timeIntervalSinceDate:v39];
          double v41 = fabs(v40);

          if (!v32 || v41 < v5)
          {
            id v42 = v35;

            double v5 = v41;
            BOOL v32 = v42;
          }
        }

        id v31 = [v29 countByEnumeratingWithState:&v77 objects:v86 count:16];
      }

      while (v31);
    }

    else
    {
      BOOL v32 = 0LL;
    }

    __int128 v44 = oslog;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      id v45 = -[NSMutableSet count](v70, "count");
      *(_DWORD *)buf = 134217984;
      double v82 = *(double *)&v45;
      _os_log_impl( (void *)&_mh_execute_header,  oslog,  OS_LOG_TYPE_DEFAULT,  "Transactions matching on amount: %lu",  buf,  0xCu);
    }

    id v11 = v64;
    id v9 = v65;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      double v82 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  oslog,  OS_LOG_TYPE_DEFAULT,  "Shortest interval for matched transaction %.2f",  buf,  0xCu);
    }

    if (-[NSMutableSet containsObject:](v70, "containsObject:", v32))
    {
      id v46 = v32;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  oslog,  OS_LOG_TYPE_DEFAULT,  "Picked transaction with matching amount and shortest interval",  buf,  2u);
      }

      v47 = @"YES";
    }

    else if (-[NSMutableSet count](v70, "count"))
    {

      __int128 v75 = 0u;
      __int128 v76 = 0u;
      __int128 v73 = 0u;
      __int128 v74 = 0u;
      uint64_t v48 = v70;
      id v49 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v48,  "countByEnumeratingWithState:objects:count:",  &v73,  v85,  16LL);
      if (v49)
      {
        id v50 = v49;
        id v51 = 0LL;
        uint64_t v52 = *(void *)v74;
        double v5 = 0.0;
        do
        {
          for (j = 0LL; j != v50; j = (char *)j + 1)
          {
            if (*(void *)v74 != v52) {
              objc_enumerationMutation(v48);
            }
            uint64_t v54 = *(void **)(*((void *)&v73 + 1) + 8LL * (void)j);
            v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "transactionDate", v61));
            [v72 timeIntervalSinceDate:v55];
            double v57 = fabs(v56);

            if (!v51 || v57 < v5)
            {
              id v58 = v54;

              double v5 = v57;
              id v51 = v58;
            }
          }

          id v50 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v48,  "countByEnumeratingWithState:objects:count:",  &v73,  v85,  16LL);
        }

        while (v50);
      }

      else
      {
        id v51 = 0LL;
        double v5 = 0.0;
      }

      id v46 = v51;
      __int128 v44 = oslog;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  oslog,  OS_LOG_TYPE_DEFAULT,  "Picked closest transaction with matching amount",  buf,  2u);
      }

      v47 = @"YES";
      id v11 = v64;
    }

    else
    {
      id v46 = v32;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  oslog,  OS_LOG_TYPE_DEFAULT,  "Picked transaction with shortest interval",  buf,  2u);
      }

      v47 = @"NO";
    }

    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      double v82 = v5;
      __int16 v83 = 2114;
      unsigned __int8 v84 = v47;
      _os_log_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_DEFAULT,  "Matched transaction time interval %.2f, same amount %{public}@",  buf,  0x16u);
    }

    if (v46)
    {
      v59 = (void *)objc_claimAutoreleasedReturnValue([v46 identifier]);
      __int128 v43 = (void *)objc_claimAutoreleasedReturnValue([v66 anyInDatabase:v65 withIdentifier:v59]);
    }

    else
    {
      __int128 v43 = 0LL;
    }

    id v20 = v63;

    uint64_t v23 = v62;
  }

  else
  {
    __int128 v43 = 0LL;
  }

  return v43;
}

+ (id)closestPendingTransactionInDatabase:(id)a3 fromTransactionDate:(id)a4 withNotificationServiceData:(unint64_t)a5 forMerchantName:(id)a6 forTransactionSourceIdentifiers:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a4;
  id v15 = a3;
  id v16 = sub_1003F47B8((uint64_t)a1, a5);
  id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  v26[0] = v17;
  id v18 = sub_1003F81E8((uint64_t)a1, 0LL);
  id v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  v26[1] = v19;
  id v20 = sub_1003F824C((uint64_t)a1, v13);
  id v21 = (void *)objc_claimAutoreleasedReturnValue(v20);

  v26[2] = v21;
  id v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v26, 3LL));

  uint64_t v23 = sub_1003F82A0((uint64_t)a1, v15, v14, v12, v22, 7200.0);
  id v24 = (void *)objc_claimAutoreleasedReturnValue(v23);

  return v24;
}

+ (id)paymentTransactionsInDatabase:(id)a3 withServiceIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = sub_1003F5808((uint64_t)a1, a4);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryWithDatabase:predicate:]( &OBJC_CLASS___PaymentTransaction,  "queryWithDatabase:predicate:",  v6,  v8));

  id v10 = sub_1003F7224((uint64_t)a1, v9);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v11));

  return v12;
}

+ (id)transactionsForAdjustmentType:(int64_t)a3 limit:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = sub_1003F86A0((uint64_t)a1, a3);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryWithDatabase:predicate:orderingProperties:orderingDirections:limit:]( &OBJC_CLASS___PaymentTransaction,  "queryWithDatabase:predicate:orderingProperties:orderingDirections:limit:",  v8,  v10,  0LL,  0LL,  a4));

  id v12 = sub_1003F7224((uint64_t)a1, v11);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  return v13;
}

+ (id)paymentTransactionsInDatabase:(id)a3 withPIDs:(id)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteContainsPredicate containsPredicateWithProperty:values:]( &OBJC_CLASS___SQLiteContainsPredicate,  "containsPredicateWithProperty:values:",  @"pid",  a4));
  id v15 = @"transaction_date";
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v15, 1LL));
  id v14 = @"DESC";
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v14, 1LL));
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryWithDatabase:predicate:orderingProperties:orderingDirections:]( &OBJC_CLASS___PaymentTransaction,  "queryWithDatabase:predicate:orderingProperties:orderingDirections:",  v6,  v7,  v8,  v9));

  id v11 = sub_1003F7224((uint64_t)a1, v10);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  return v12;
}

+ (id)paymentTransactionsInDatabase:(id)a3 forTransactionSourceIdentifiers:(id)a4 withTransactionSource:(unint64_t)a5 withBackingData:(unint64_t)a6 startDate:(id)a7 endDate:(id)a8 orderedByDate:(int64_t)a9 limit:(int64_t)a10
{
  id v16 = a3;
  id v17 = sub_1003F8704((uint64_t)a1, a4, a5, a6, a7, a8);
  id v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  __int128 v28 = @"transaction_date";
  id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v28, 1LL));
  id v20 = SQLiteOrderAscending;
  if (a9 != -1) {
    id v20 = &SQLiteOrderDescending;
  }
  __int128 v27 = *v20;
  id v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v27, 1LL));
  id v22 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryWithDatabase:predicate:orderingProperties:orderingDirections:limit:]( &OBJC_CLASS___PaymentTransaction,  "queryWithDatabase:predicate:orderingProperties:orderingDirections:limit:",  v16,  v18,  v19,  v21,  a10));

  id v23 = sub_1003F7224((uint64_t)a1, v22);
  id v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  __int128 v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v24));

  return v25;
}

+ (id)approvedPaymentTransactionsInDatabase:(id)a3 forTransactionSourceIdentifiers:(id)a4 withTransactionSource:(unint64_t)a5 withBackingData:(unint64_t)a6 startDate:(id)a7 endDate:(id)a8 orderedByDate:(int64_t)a9 limit:(int64_t)a10
{
  id v16 = a8;
  id v17 = a7;
  id v42 = a3;
  id v18 = sub_1003F4640((uint64_t)a1, a4);
  id v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  v45[0] = v19;
  id v20 = sub_1003F6C2C((uint64_t)a1, a5, 0);
  id v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  v45[1] = v21;
  id v22 = sub_1003F6864((uint64_t)a1, a6);
  id v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  v45[2] = v23;
  id v24 = sub_1003F81E8((uint64_t)a1, 1LL);
  __int128 v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  v45[3] = v25;
  id v26 = sub_1003F8DB0((uint64_t)a1, v17);
  __int128 v27 = (void *)objc_claimAutoreleasedReturnValue(v26);

  v45[4] = v27;
  id v28 = sub_1003F8E3C((uint64_t)a1, v16);
  id v29 = (void *)objc_claimAutoreleasedReturnValue(v28);

  v45[5] = v29;
  id v30 = sub_1003F4844((uint64_t)a1, 0);
  id v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
  v45[6] = v31;
  BOOL v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v45, 7LL));

  uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v32));
  __int128 v44 = @"transaction_date";
  int64_t v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v44, 1LL));
  v35 = SQLiteOrderAscending;
  if (a9 != -1) {
    v35 = &SQLiteOrderDescending;
  }
  __int128 v43 = *v35;
  unsigned __int8 v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v43, 1LL));
  v37 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryWithDatabase:predicate:orderingProperties:orderingDirections:limit:]( &OBJC_CLASS___PaymentTransaction,  "queryWithDatabase:predicate:orderingProperties:orderingDirections:limit:",  v42,  v33,  v34,  v36,  a10));

  id v38 = sub_1003F7224((uint64_t)a1, v37);
  objc_super v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
  double v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v39));

  return v40;
}

+ (id)pendingPaymentTransactionsInDatabase:(id)a3 forTransactionSourceIdentifiers:(id)a4 withTransactionSource:(unint64_t)a5 withBackingData:(unint64_t)a6 startDate:(id)a7 endDate:(id)a8 orderedByDate:(int64_t)a9 limit:(int64_t)a10
{
  id v16 = a8;
  id v17 = a7;
  id v18 = a4;
  id v45 = a3;
  id v19 = sub_1003F81E8((uint64_t)a1, 0LL);
  id v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  v50[0] = v20;
  id v21 = sub_1003F81E8((uint64_t)a1, 8LL);
  id v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  v50[1] = v22;
  id v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v50, 2LL));
  id v24 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAnyPredicates:",  v23));

  id v25 = sub_1003F4640((uint64_t)a1, v18);
  id v26 = (void *)objc_claimAutoreleasedReturnValue(v25);

  v49[0] = v26;
  id v27 = sub_1003F6C2C((uint64_t)a1, a5, 0);
  id v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
  v49[1] = v28;
  id v29 = sub_1003F6864((uint64_t)a1, a6);
  id v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
  v49[2] = v30;
  id v31 = sub_1003F5E58((uint64_t)a1, v17);
  BOOL v32 = (void *)objc_claimAutoreleasedReturnValue(v31);

  v49[3] = v32;
  id v33 = sub_1003F5EE4((uint64_t)a1, v16);
  int64_t v34 = (void *)objc_claimAutoreleasedReturnValue(v33);

  v49[4] = v34;
  v49[5] = v24;
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v49, 6LL));

  unsigned __int8 v36 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v35));
  uint64_t v48 = @"transaction_date";
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v48, 1LL));
  id v38 = SQLiteOrderAscending;
  if (a9 != -1) {
    id v38 = &SQLiteOrderDescending;
  }
  v47 = *v38;
  objc_super v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v47, 1LL, v45));
  double v40 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryWithDatabase:predicate:orderingProperties:orderingDirections:limit:]( &OBJC_CLASS___PaymentTransaction,  "queryWithDatabase:predicate:orderingProperties:orderingDirections:limit:",  v46,  v36,  v37,  v39,  a10));

  id v41 = sub_1003F7224((uint64_t)a1, v40);
  id v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
  __int128 v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v42));

  return v43;
}

+ (int64_t)countInDatabase:(id)a3 forTransactionSourceIdentifiers:(id)a4 withTransactionSource:(unint64_t)a5 withBackingData:(unint64_t)a6 startDate:(id)a7 endDate:(id)a8
{
  id v14 = a3;
  id v15 = sub_1003F8704((uint64_t)a1, a4, a5, a6, a7, a8);
  id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  id v17 = [a1 countInDatabase:v14 predicate:v16];

  return (int64_t)v17;
}

+ (id)paymentTransactionsInDatabase:(id)a3 withTransactionSource:(unint64_t)a4 withBackingData:(unint64_t)a5 limit:(int64_t)a6
{
  id v10 = a3;
  id v11 = sub_1003F9394((uint64_t)a1, a4, a5);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  id v21 = @"transaction_date";
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v21, 1LL));
  id v20 = @"DESC";
  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v20, 1LL));
  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryWithDatabase:predicate:orderingProperties:orderingDirections:limit:]( &OBJC_CLASS___PaymentTransaction,  "queryWithDatabase:predicate:orderingProperties:orderingDirections:limit:",  v10,  v12,  v13,  v14,  a6));

  id v16 = sub_1003F7224((uint64_t)a1, v15);
  id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v17));

  return v18;
}

+ (id)paymentTransactionsInDatabase:(id)a3 withTransactionTypes:(id)a4 withTransactionSource:(unint64_t)a5 withBackingData:(unint64_t)a6 limit:(int64_t)a7
{
  id v12 = a3;
  id v13 = sub_1003F9624((uint64_t)a1, a4);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v29[0] = v14;
  id v15 = sub_1003F9394((uint64_t)a1, a5, a6);
  id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v29[1] = v16;
  id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v29, 2LL));

  id v18 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v17));
  id v20 = (void *)objc_opt_class(a1, v19);
  id v28 = @"transaction_date";
  id v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v28, 1LL));
  id v27 = @"DESC";
  id v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v27, 1LL));
  id v23 = (void *)objc_claimAutoreleasedReturnValue( [v20 queryWithDatabase:v12 predicate:v18 orderingProperties:v21 orderingDirections:v22 limit:a7]);

  id v24 = sub_1003F7224((uint64_t)a1, v23);
  id v25 = (void *)objc_claimAutoreleasedReturnValue(v24);

  return v25;
}

+ (id)paymentTransactionsInDatabase:(id)a3 matchingPeerPaymentCounterpartHandles:(id)a4 forTransactionSourceIdentifiers:(id)a5 withTransactionSource:(unint64_t)a6 withBackingData:(unint64_t)a7 limit:(int64_t)a8
{
  id v14 = a5;
  id v15 = a3;
  id v16 = sub_1003F9A0C((uint64_t)a1, a4);
  id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  v38[0] = v17;
  id v18 = sub_1003F6C2C((uint64_t)a1, a6, 0);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  v38[1] = v19;
  id v20 = sub_1003F6864((uint64_t)a1, a7);
  id v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  v38[2] = v21;
  id v22 = sub_1003F4844((uint64_t)a1, 0);
  id v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  v38[3] = v23;
  id v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v38, 4LL));

  if ([v14 count])
  {
    id v25 = sub_1003F4640((uint64_t)a1, v14);
    id v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    uint64_t v27 = objc_claimAutoreleasedReturnValue([v24 arrayByAddingObject:v26]);

    id v24 = (void *)v27;
  }

  id v28 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v24));
  v37 = @"transaction_date";
  id v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v37, 1LL));
  unsigned __int8 v36 = @"DESC";
  id v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v36, 1LL));
  id v31 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryWithDatabase:predicate:orderingProperties:orderingDirections:limit:]( &OBJC_CLASS___PaymentTransaction,  "queryWithDatabase:predicate:orderingProperties:orderingDirections:limit:",  v15,  v28,  v29,  v30,  a8));

  id v32 = sub_1003F7224((uint64_t)a1, v31);
  id v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
  int64_t v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v33));

  return v34;
}

+ (id)paymentTransactionsInDatabase:(id)a3 matchingPeerPaymentCounterpartHandles:(id)a4 forPeerPaymentSubtype:(int64_t)a5 forTransactionSourceIdentifiers:(id)a6 withTransactionSource:(unint64_t)a7 withBackingData:(unint64_t)a8 limit:(int64_t)a9
{
  id v15 = a6;
  id v16 = a3;
  id v17 = sub_1003F9A0C((uint64_t)a1, a4);
  id v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v41[0] = v18;
  id v19 = sub_1003F9DEC((uint64_t)a1, a5);
  id v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  v41[1] = v20;
  id v21 = sub_1003F6C2C((uint64_t)a1, a7, 0);
  id v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  v41[2] = v22;
  id v23 = sub_1003F6864((uint64_t)a1, a8);
  id v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  v41[3] = v24;
  id v25 = sub_1003F4844((uint64_t)a1, 0);
  id v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
  v41[4] = v26;
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v41, 5LL));

  if ([v15 count])
  {
    id v28 = sub_1003F4640((uint64_t)a1, v15);
    id v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    uint64_t v30 = objc_claimAutoreleasedReturnValue([v27 arrayByAddingObject:v29]);

    uint64_t v27 = (void *)v30;
  }

  id v31 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v27));
  double v40 = @"transaction_date";
  id v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v40, 1LL));
  objc_super v39 = @"DESC";
  id v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v39, 1LL));
  int64_t v34 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryWithDatabase:predicate:orderingProperties:orderingDirections:limit:]( &OBJC_CLASS___PaymentTransaction,  "queryWithDatabase:predicate:orderingProperties:orderingDirections:limit:",  v16,  v31,  v32,  v33,  a9));

  id v35 = sub_1003F7224((uint64_t)a1, v34);
  unsigned __int8 v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v36));

  return v37;
}

+ (id)paymentTransactionsInDatabase:(id)a3 matchingMapsBrandIdentifier:(unint64_t)a4 forTransactionSourceIdentifiers:(id)a5
{
  id v8 = a3;
  id v9 = sub_1003F4640((uint64_t)a1, a5);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v20[0] = v10;
  id v11 = sub_1003F9F90((uint64_t)a1, a4);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v20[1] = v12;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v20, 2LL));

  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v13));
  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryWithDatabase:predicate:]( &OBJC_CLASS___PaymentTransaction,  "queryWithDatabase:predicate:",  v8,  v14));

  id v16 = sub_1003F7224((uint64_t)a1, v15);
  id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v17));

  return v18;
}

+ (id)paymentTransactionsInDatabase:(id)a3 matchingMapsMerchantIdentifier:(unint64_t)a4 forTransactionSourceIdentifiers:(id)a5
{
  id v8 = a3;
  id v9 = sub_1003F4640((uint64_t)a1, a5);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v20[0] = v10;
  id v11 = sub_1003FA134((uint64_t)a1, a4);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v20[1] = v12;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v20, 2LL));

  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v13));
  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryWithDatabase:predicate:]( &OBJC_CLASS___PaymentTransaction,  "queryWithDatabase:predicate:",  v8,  v14));

  id v16 = sub_1003F7224((uint64_t)a1, v15);
  id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v17));

  return v18;
}

+ (id)paymentTransactionsInDatabase:(id)a3 matchingMapsMerchantIdentifierWithoutRegion:(unint64_t)a4 limit:(unint64_t)a5
{
  id v8 = a3;
  id v9 = sub_1003FA134((uint64_t)a1, a4);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v19[0] = v10;
  objc_opt_self(a1);
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteNullPredicate isNullPredicateWithProperty:]( &OBJC_CLASS___SQLiteNullPredicate,  "isNullPredicateWithProperty:",  @"world_region_mapping_left.world_region_pid"));
  v19[1] = v11;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v19, 2LL));

  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v12));
  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryWithDatabase:predicate:orderingProperties:orderingDirections:limit:]( &OBJC_CLASS___PaymentTransaction,  "queryWithDatabase:predicate:orderingProperties:orderingDirections:limit:",  v8,  v13,  0LL,  0LL,  a5));

  id v15 = sub_1003F7224((uint64_t)a1, v14);
  id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v16));

  return v17;
}

+ (id)paymentTransactionsInDatabase:(id)a3 matchingMerchant:(id)a4 forTransactionSourceIdentifiers:(id)a5 withTransactionSource:(unint64_t)a6 withBackingData:(unint64_t)a7 limit:(int64_t)a8
{
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  if ([v14 count])
  {
    id v18 = sub_1003F4640((uint64_t)a1, v14);
    id v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    -[NSMutableArray addObject:](v17, "addObject:", v19);
  }

  id v20 = sub_1003F6C2C((uint64_t)a1, a6, 0);
  id v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  -[NSMutableArray addObject:](v17, "addObject:", v21);

  id v22 = sub_1003F6864((uint64_t)a1, a7);
  id v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  -[NSMutableArray addObject:](v17, "addObject:", v23);

  id v24 = sub_1003F4844((uint64_t)a1, 0);
  id v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  -[NSMutableArray addObject:](v17, "addObject:", v25);

  id v26 = sub_1003FA554((uint64_t)a1, v15);
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(v26);

  -[NSMutableArray addObject:](v17, "addObject:", v27);
  id v28 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v17));
  v37 = @"transaction_date";
  id v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v37, 1LL));
  unsigned __int8 v36 = @"DESC";
  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v36, 1LL));
  id v31 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryWithDatabase:predicate:orderingProperties:orderingDirections:limit:]( &OBJC_CLASS___PaymentTransaction,  "queryWithDatabase:predicate:orderingProperties:orderingDirections:limit:",  v16,  v28,  v29,  v30,  a8));

  id v32 = sub_1003F7224((uint64_t)a1, v31);
  id v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
  int64_t v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v33));

  return v34;
}

+ (unint64_t)countInDatabase:(id)a3 forTransactionSourceIdentifiers:(id)a4 withPeerPaymentCounterpartHandles:(id)a5 startDate:(id)a6 endDate:(id)a7
{
  id v12 = a4;
  id v13 = a7;
  id v14 = a6;
  id v15 = a5;
  id v16 = a3;
  id v17 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  if ([v12 count])
  {
    id v18 = sub_1003F4640((uint64_t)a1, v12);
    id v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    -[NSMutableArray addObject:](v17, "addObject:", v19);
  }

  id v20 = sub_1003F4844((uint64_t)a1, 0);
  id v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  -[NSMutableArray addObject:](v17, "addObject:", v21);

  id v22 = sub_1003F6864((uint64_t)a1, 1LL);
  id v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  -[NSMutableArray addObject:](v17, "addObject:", v23);

  id v24 = sub_1003F9A0C((uint64_t)a1, v15);
  id v25 = (void *)objc_claimAutoreleasedReturnValue(v24);

  -[NSMutableArray addObject:](v17, "addObject:", v25);
  id v26 = sub_1003F5E58((uint64_t)a1, v14);
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(v26);

  -[NSMutableArray addObject:](v17, "addObject:", v27);
  id v28 = sub_1003F5EE4((uint64_t)a1, v13);
  id v29 = (void *)objc_claimAutoreleasedReturnValue(v28);

  -[NSMutableArray addObject:](v17, "addObject:", v29);
  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v17));
  id v31 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryWithDatabase:predicate:]( &OBJC_CLASS___PaymentTransaction,  "queryWithDatabase:predicate:",  v16,  v30));

  id v32 = [v31 countOfEntities];
  return (unint64_t)v32;
}

+ (unint64_t)countInDatabase:(id)a3 forTransactionSourceIdentifiers:(id)a4 withPeerPaymentCounterpartHandles:(id)a5 forPeerPaymentSubtype:(int64_t)a6 startDate:(id)a7 endDate:(id)a8
{
  id v14 = a4;
  id v15 = a8;
  id v16 = a7;
  id v17 = a5;
  id v18 = a3;
  id v19 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  if ([v14 count])
  {
    id v20 = sub_1003F4640((uint64_t)a1, v14);
    id v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    -[NSMutableArray addObject:](v19, "addObject:", v21);
  }

  id v22 = sub_1003F4844((uint64_t)a1, 0);
  id v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  -[NSMutableArray addObject:](v19, "addObject:", v23);

  id v24 = sub_1003F6864((uint64_t)a1, 1LL);
  id v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  -[NSMutableArray addObject:](v19, "addObject:", v25);

  id v26 = sub_1003F9A0C((uint64_t)a1, v17);
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(v26);

  -[NSMutableArray addObject:](v19, "addObject:", v27);
  id v28 = sub_1003F5E58((uint64_t)a1, v16);
  id v29 = (void *)objc_claimAutoreleasedReturnValue(v28);

  -[NSMutableArray addObject:](v19, "addObject:", v29);
  id v30 = sub_1003F5EE4((uint64_t)a1, v15);
  id v31 = (void *)objc_claimAutoreleasedReturnValue(v30);

  -[NSMutableArray addObject:](v19, "addObject:", v31);
  id v32 = sub_1003F9DEC((uint64_t)a1, a6);
  id v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
  -[NSMutableArray addObject:](v19, "addObject:", v33);

  int64_t v34 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v19));
  id v35 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryWithDatabase:predicate:]( &OBJC_CLASS___PaymentTransaction,  "queryWithDatabase:predicate:",  v18,  v34));

  id v36 = [v35 countOfEntities];
  return (unint64_t)v36;
}

+ (id)peerPaymentCounterpartHandlesforSource:(id)a3 startDate:(id)a4 endDate:(id)a5 inDatabase:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = (void *)objc_claimAutoreleasedReturnValue([a1 databaseTable]);
  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"SELECT %@, MAX(%@) as total FROM %@ WHERE %@ IS NOT NULL AND %@ != '' ",  @"peer_payment_counterpart_handle",  @"transaction_date",  v14,  @"peer_payment_counterpart_handle",  @"peer_payment_counterpart_handle"));

  if (v11)
  {
    uint64_t v16 = objc_claimAutoreleasedReturnValue([v15 stringByAppendingString:@"AND transaction_date > ? "]);

    id v15 = (void *)v16;
  }

  if (v12)
  {
    uint64_t v17 = objc_claimAutoreleasedReturnValue([v15 stringByAppendingString:@"AND transaction_date < ? "]);

    id v15 = (void *)v17;
  }

  if (v10)
  {
    uint64_t v18 = objc_claimAutoreleasedReturnValue([v15 stringByAppendingString:@"AND source_pid = ? "]);

    id v15 = (void *)v18;
  }

  id v19 = (void *)objc_claimAutoreleasedReturnValue( [v15 stringByAppendingFormat:@"GROUP BY %@ ORDER BY MAX(%@) DESC", @"peer_payment_counterpart_handle", @"transaction_date"]);

  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_1003FB018;
  void v26[3] = &unk_100658378;
  id v27 = v11;
  id v28 = v12;
  id v29 = v10;
  id v30 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v20 = v30;
  id v21 = v10;
  id v22 = v12;
  id v23 = v11;
  sub_1002CCDBC((uint64_t)v13, v19, v26);

  id v24 = -[NSMutableArray copy](v20, "copy");
  return v24;
}

+ (id)peerPaymentCounterpartHandlesforSource:(id)a3 excludingPaymentMode:(unint64_t)a4 startDate:(id)a5 endDate:(id)a6 inDatabase:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([a1 databaseTable]);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"SELECT %@, MAX(%@) as total FROM %@ WHERE %@ IS NOT NULL AND %@ != '' ",  @"peer_payment_counterpart_handle",  @"transaction_date",  v16,  @"peer_payment_counterpart_handle",  @"peer_payment_counterpart_handle"));

  if (v13)
  {
    uint64_t v18 = objc_claimAutoreleasedReturnValue([v17 stringByAppendingString:@"AND transaction_date > ? "]);

    uint64_t v17 = (void *)v18;
  }

  if (v14)
  {
    uint64_t v19 = objc_claimAutoreleasedReturnValue([v17 stringByAppendingString:@"AND transaction_date < ? "]);

    uint64_t v17 = (void *)v19;
  }

  if (v12)
  {
    uint64_t v20 = objc_claimAutoreleasedReturnValue([v17 stringByAppendingString:@"AND source_pid = ? "]);

    uint64_t v17 = (void *)v20;
  }

  id v21 = (void *)objc_claimAutoreleasedReturnValue([v17 stringByAppendingString:@"AND ca != ? "]);

  id v22 = (void *)objc_claimAutoreleasedReturnValue( [v21 stringByAppendingFormat:@"GROUP BY %@ ORDER BY MAX(%@) DESC", @"peer_payment_counterpart_handle", @"transaction_date"]);
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472LL;
  void v29[2] = sub_1003FB318;
  v29[3] = &unk_10065D450;
  id v30 = v13;
  id v31 = v14;
  id v33 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  unint64_t v34 = a4;
  id v32 = v12;
  id v23 = v33;
  id v24 = v12;
  id v25 = v14;
  id v26 = v13;
  sub_1002CCDBC((uint64_t)v15, v22, v29);

  id v27 = -[NSMutableArray copy](v23, "copy");
  return v27;
}

+ (id)paymentTransactionsInDatabase:(id)a3 withMerchantCategory:(int64_t)a4 forTransactionSourceIdentifiers:(id)a5 withTransactionSource:(unint64_t)a6 withBackingData:(unint64_t)a7 startDate:(id)a8 endDate:(id)a9 limit:(int64_t)a10
{
  id v17 = a9;
  id v18 = a8;
  id v19 = a5;
  id v45 = a3;
  id v20 = sub_1003FB690((uint64_t)a1, a4);
  id v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  v48[0] = v21;
  id v22 = sub_1003F4640((uint64_t)a1, v19);
  id v23 = (void *)objc_claimAutoreleasedReturnValue(v22);

  v48[1] = v23;
  id v24 = sub_1003F6C2C((uint64_t)a1, a6, 0);
  id v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  v48[2] = v25;
  id v26 = sub_1003F6864((uint64_t)a1, a7);
  id v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
  v48[3] = v27;
  id v28 = sub_1003F5E58((uint64_t)a1, v18);
  id v29 = (void *)objc_claimAutoreleasedReturnValue(v28);

  v48[4] = v29;
  id v30 = sub_1003F5EE4((uint64_t)a1, v17);
  id v31 = (void *)objc_claimAutoreleasedReturnValue(v30);

  v48[5] = v31;
  id v32 = sub_1003F4844((uint64_t)a1, 0);
  id v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
  v48[6] = v33;
  unint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v48, 7LL));

  id v35 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v34));
  v37 = (void *)objc_opt_class(a1, v36);
  v47 = @"transaction_date";
  id v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v47, 1LL));
  id v46 = @"DESC";
  objc_super v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v46, 1LL));
  double v40 = (void *)objc_claimAutoreleasedReturnValue( [v37 queryWithDatabase:v45 predicate:v35 orderingProperties:v38 orderingDirections:v39 limit:a10]);

  id v41 = sub_1003F7224((uint64_t)a1, v40);
  id v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
  __int128 v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v42));

  return v43;
}

+ (id)paymentTransactionsInDatabase:(id)a3 withTransactionType:(int64_t)a4 forTransactionSourceIdentifiers:(id)a5 withTransactionSource:(unint64_t)a6 withBackingData:(unint64_t)a7 startDate:(id)a8 endDate:(id)a9 limit:(int64_t)a10
{
  id v17 = a9;
  id v18 = a8;
  id v19 = a5;
  id v45 = a3;
  id v20 = sub_1003F65C0((uint64_t)a1, a4);
  id v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  v48[0] = v21;
  id v22 = sub_1003F4640((uint64_t)a1, v19);
  id v23 = (void *)objc_claimAutoreleasedReturnValue(v22);

  v48[1] = v23;
  id v24 = sub_1003F6C2C((uint64_t)a1, a6, 0);
  id v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  v48[2] = v25;
  id v26 = sub_1003F6864((uint64_t)a1, a7);
  id v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
  v48[3] = v27;
  id v28 = sub_1003F5E58((uint64_t)a1, v18);
  id v29 = (void *)objc_claimAutoreleasedReturnValue(v28);

  v48[4] = v29;
  id v30 = sub_1003F5EE4((uint64_t)a1, v17);
  id v31 = (void *)objc_claimAutoreleasedReturnValue(v30);

  v48[5] = v31;
  id v32 = sub_1003F4844((uint64_t)a1, 0);
  id v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
  v48[6] = v33;
  unint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v48, 7LL));

  id v35 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v34));
  v37 = (void *)objc_opt_class(a1, v36);
  v47 = @"transaction_date";
  id v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v47, 1LL));
  id v46 = @"DESC";
  objc_super v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v46, 1LL));
  double v40 = (void *)objc_claimAutoreleasedReturnValue( [v37 queryWithDatabase:v45 predicate:v35 orderingProperties:v38 orderingDirections:v39 limit:a10]);

  id v41 = sub_1003F7224((uint64_t)a1, v40);
  id v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
  __int128 v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v42));

  return v43;
}

+ (id)transactionServiceIdentifiersInDatabase:(id)a3 withTransactionType:(int64_t)a4 withPeerPaymentSubtype:(int64_t)a5 forTransactionSourceIdentifiers:(id)a6 withTransactionSource:(unint64_t)a7 withBackingData:(unint64_t)a8 startDate:(id)a9 endDate:(id)a10
{
  id v17 = a10;
  id v18 = a9;
  id v19 = a6;
  id v48 = a3;
  id v20 = sub_1003F65C0((uint64_t)a1, a4);
  id v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  v54[0] = v21;
  id v22 = sub_1003F9DEC((uint64_t)a1, a5);
  id v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  v54[1] = v23;
  id v24 = sub_1003F4640((uint64_t)a1, v19);
  id v25 = (void *)objc_claimAutoreleasedReturnValue(v24);

  v54[2] = v25;
  id v26 = sub_1003F6C2C((uint64_t)a1, a7, 0);
  id v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
  v54[3] = v27;
  id v28 = sub_1003F6864((uint64_t)a1, a8);
  id v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
  v54[4] = v29;
  id v30 = sub_1003F5E58((uint64_t)a1, v18);
  id v31 = (void *)objc_claimAutoreleasedReturnValue(v30);

  v54[5] = v31;
  id v32 = sub_1003F5EE4((uint64_t)a1, v17);
  id v33 = (void *)objc_claimAutoreleasedReturnValue(v32);

  v54[6] = v33;
  id v34 = sub_1003F4844((uint64_t)a1, 0);
  id v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
  v54[7] = v35;
  uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v54, 8LL));

  v37 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v36));
  objc_super v39 = (void *)objc_opt_class(a1, v38);
  v53 = @"transaction_date";
  double v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v53, 1LL));
  uint64_t v52 = @"DESC";
  id v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v52, 1LL));
  id v42 = (void *)objc_claimAutoreleasedReturnValue( [v39 queryWithDatabase:v48 predicate:v37 orderingProperties:v40 orderingDirections:v41]);

  __int128 v43 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  id v51 = @"service_identifier";
  __int128 v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v51, 1LL));
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472LL;
  v49[2] = sub_1003FBE78;
  v49[3] = &unk_10063C0D0;
  id v50 = v43;
  id v45 = v43;
  [v42 enumeratePersistentIDsAndProperties:v44 usingBlock:v49];

  id v46 = -[NSMutableSet copy](v45, "copy");
  return v46;
}

+ (id)paymentTransactionsInDatabase:(id)a3 forTransactionSourceIdentifiers:(id)a4 withRedemptionType:(unint64_t)a5 startDate:(id)a6 endDate:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a3;
  id v15 = sub_1003F4640((uint64_t)a1, a4);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v36[0] = v16;
  id v17 = sub_1003FC134((uint64_t)a1, v13);
  id v18 = (void *)objc_claimAutoreleasedReturnValue(v17);

  v36[1] = v18;
  id v19 = sub_1003FC1C0((uint64_t)a1, v12);
  id v20 = (void *)objc_claimAutoreleasedReturnValue(v19);

  v36[2] = v20;
  id v21 = sub_1003FC24C((uint64_t)a1, a5);
  id v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  v36[3] = v22;
  id v23 = sub_1003F4844((uint64_t)a1, 0);
  id v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  v36[4] = v24;
  id v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v36, 5LL));

  id v26 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v25));
  id v35 = @"grapes.d";
  id v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v35, 1LL));
  id v34 = @"DESC";
  id v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v34, 1LL));
  id v29 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryWithDatabase:predicate:orderingProperties:orderingDirections:limit:]( &OBJC_CLASS___PaymentTransaction,  "queryWithDatabase:predicate:orderingProperties:orderingDirections:limit:",  v14,  v26,  v27,  v28,  0LL));

  id v30 = sub_1003F7224((uint64_t)a1, v29);
  id v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
  id v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v31));

  return v32;
}

+ (id)paymentTransactionsInDatabase:(id)a3 forRequest:(id)a4
{
  id v5 = sub_1003FC2B0((uint64_t)a1, a3, a4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = sub_1003F7224((uint64_t)a1, v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  return v8;
}

+ (unint64_t)countInDatabase:(id)a3 forRequest:(id)a4
{
  unint64_t v9 = 0LL;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 predicateForRequest:a4]);
  sub_1003FC4C0((uint64_t)a1, &v9, 0LL, 0LL, v7, v6);

  return v9;
}

+ (id)paymentTransactionsInDatabase:(id)a3 forPredicate:(id)a4 limit:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t Object = PKLogFacilityTypeGetObject(23LL);
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v23 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Searching for predicate: %@", buf, 0xCu);
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "passd_sqlPredicateForSelect"));
  id v21 = @"transaction_date";
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v21, 1LL));
  id v20 = @"DESC";
  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v20, 1LL));
  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryWithDatabase:predicate:orderingProperties:orderingDirections:limit:]( &OBJC_CLASS___PaymentTransaction,  "queryWithDatabase:predicate:orderingProperties:orderingDirections:limit:",  v8,  v12,  v13,  v14,  a5));

  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 description]);
    *(_DWORD *)buf = 138412290;
    id v23 = v16;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "SQL Query: %@", buf, 0xCu);
  }

  id v17 = sub_1003F7224((uint64_t)a1, v15);
  id v18 = (void *)objc_claimAutoreleasedReturnValue(v17);

  return v18;
}

+ (void)totalAmount:(id *)a3 forTransactionsWithRequest:(id)a4 count:(unint64_t *)a5 inDatabase:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  id v13 = (id)objc_claimAutoreleasedReturnValue([v11 currencyCode]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([a1 predicateForRequest:v11]);

  sub_1003FC4C0((uint64_t)a1, a5, a3, v13, v12, v10);
}

+ (id)predicateForRequest:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 transactionSourceIdentifiers]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 transactionTypes]);
  v148 = (void *)objc_claimAutoreleasedReturnValue([v4 transactionSources]);
  unsigned __int8 v147 = (void *)objc_claimAutoreleasedReturnValue([v4 transactionStatuses]);
  id v133 = [v4 peerPaymentSubType];
  id v134 = [v4 topUpSubtype];
  id v135 = [v4 peerPaymentPaymentMode];
  v150 = (void *)objc_claimAutoreleasedReturnValue([v4 merchant]);
  id v130 = [v4 merchantCategory];
  v146 = (void *)objc_claimAutoreleasedReturnValue([v4 regions]);
  v145 = (void *)objc_claimAutoreleasedReturnValue([v4 tags]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 startDate]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 endDate]);
  unsigned __int8 v144 = (void *)objc_claimAutoreleasedReturnValue([v4 startStatusChangeDate]);
  uint64_t v149 = objc_claimAutoreleasedReturnValue([v4 endStatusChangeDate]);
  unsigned __int8 v138 = (void *)objc_claimAutoreleasedReturnValue([v4 currencyCode]);
  v140 = (void *)objc_claimAutoreleasedReturnValue([v4 amount]);
  id v129 = [v4 amountComparison];
  id v132 = [v4 rewardsValueUnit];
  v142 = (void *)objc_claimAutoreleasedReturnValue([v4 rewardsValue]);
  uint64_t v141 = objc_claimAutoreleasedReturnValue([v4 panIdentifier]);
  v143 = (void *)objc_claimAutoreleasedReturnValue([v4 fundingSourceTypes]);
  unsigned int v131 = [v4 disputesOnly];
  id v9 = objc_alloc(&OBJC_CLASS___NSMutableArray);
  id v10 = sub_1003F6864((uint64_t)a1, 1LL);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v137 = v7;
  id v12 = sub_1003F5E58((uint64_t)a1, v7);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v136 = v8;
  id v14 = sub_1003F5EE4((uint64_t)a1, v8);
  id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  id v16 = sub_1003F4844((uint64_t)a1, 0);
  id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  v151 = -[NSMutableArray initWithObjects:](v9, "initWithObjects:", v11, v13, v15, v17, 0LL);

  v139 = v6;
  if ([v6 count])
  {
    v127 = v5;
    id v128 = v4;
    v154 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v180 = 0u;
    __int128 v181 = 0u;
    __int128 v182 = 0u;
    __int128 v183 = 0u;
    id obj = v6;
    id v155 = [obj countByEnumeratingWithState:&v180 objects:v193 count:16];
    if (v155)
    {
      uint64_t v18 = *(void *)v181;
      id v19 = &OBJC_CLASS___SQLitePropertyPredicate;
      uint64_t v152 = *(void *)v181;
      do
      {
        for (i = 0LL; i != v155; i = (char *)i + 1)
        {
          if (*(void *)v181 != v18) {
            objc_enumerationMutation(obj);
          }
          id v21 = [*(id *)(*((void *)&v180 + 1) + 8 * (void)i) integerValue];
          id v22 = sub_1003F65C0((uint64_t)a1, (uint64_t)v21);
          id v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
          if (v21 == (id)5)
          {
            id v27 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"transaction_type",  &off_1006908F0));
            objc_opt_self(a1);
            id v28 = (void *)objc_claimAutoreleasedReturnValue([&v19[6] isNotNullPredicateWithProperty:@"ab"]);
            id v29 = a1;
            id v30 = v19;
            v191[0] = v27;
            v191[1] = v28;
            id v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v191,  2LL));
            id v32 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v31));

            v190[0] = v23;
            v190[1] = v32;
            id v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v190,  2LL));
            id v34 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAnyPredicates:",  v33));
            -[NSMutableArray addObject:](v154, "addObject:", v34);

            id v19 = v30;
            a1 = v29;
            uint64_t v18 = v152;
          }

          else if (v21)
          {
            -[NSMutableArray addObject:](v154, "addObject:", v23);
          }

          else
          {
            objc_opt_self(a1);
            id v24 = (void *)objc_claimAutoreleasedReturnValue([&v19[6] isNullPredicateWithProperty:@"ab"]);
            v192[0] = v23;
            v192[1] = v24;
            id v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v192,  2LL));
            id v26 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v25));

            -[NSMutableArray addObject:](v154, "addObject:", v26);
          }
        }

        id v155 = [obj countByEnumeratingWithState:&v180 objects:v193 count:16];
      }

      while (v155);
    }

    id v35 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAnyPredicates:",  v154));
    -[NSMutableArray addObject:](v151, "addObject:", v35);

    id v5 = v127;
    id v4 = v128;
  }

  if ([v148 count])
  {
    uint64_t v36 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v176 = 0u;
    __int128 v177 = 0u;
    __int128 v178 = 0u;
    __int128 v179 = 0u;
    id v37 = v148;
    id v38 = [v37 countByEnumeratingWithState:&v176 objects:v189 count:16];
    if (v38)
    {
      id v39 = v38;
      uint64_t v40 = *(void *)v177;
      do
      {
        for (j = 0LL; j != v39; j = (char *)j + 1)
        {
          if (*(void *)v177 != v40) {
            objc_enumerationMutation(v37);
          }
          id v42 = sub_1003FD728( (uint64_t)a1,  (uint64_t)[*(id *)(*((void *)&v176 + 1) + 8 * (void)j) integerValue]);
          __int128 v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
          -[NSMutableArray addObject:](v36, "addObject:", v43);
        }

        id v39 = [v37 countByEnumeratingWithState:&v176 objects:v189 count:16];
      }

      while (v39);
    }

    __int128 v44 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAnyPredicates:",  v36));
    -[NSMutableArray addObject:](v151, "addObject:", v44);
  }

  id v45 = v151;
  if ([v147 count])
  {
    id v46 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v172 = 0u;
    __int128 v173 = 0u;
    __int128 v174 = 0u;
    __int128 v175 = 0u;
    id v47 = v147;
    id v48 = [v47 countByEnumeratingWithState:&v172 objects:v188 count:16];
    if (v48)
    {
      id v49 = v48;
      uint64_t v50 = *(void *)v173;
      do
      {
        for (k = 0LL; k != v49; k = (char *)k + 1)
        {
          if (*(void *)v173 != v50) {
            objc_enumerationMutation(v47);
          }
          id v52 = sub_1003F81E8( (uint64_t)a1,  (uint64_t)[*(id *)(*((void *)&v172 + 1) + 8 * (void)k) integerValue]);
          v53 = (void *)objc_claimAutoreleasedReturnValue(v52);
          -[NSMutableArray addObject:](v46, "addObject:", v53);
        }

        id v49 = [v47 countByEnumeratingWithState:&v172 objects:v188 count:16];
      }

      while (v49);
    }

    uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAnyPredicates:",  v46));
    id v45 = v151;
    -[NSMutableArray addObject:](v151, "addObject:", v54);
  }

  if ([v5 count])
  {
    id v55 = sub_1003F4640((uint64_t)a1, v5);
    double v56 = (void *)objc_claimAutoreleasedReturnValue(v55);
    -[NSMutableArray addObject:](v45, "addObject:", v56);
  }

  id v58 = (void *)v149;
  double v57 = v150;
  if (v150)
  {
    id v59 = sub_1003FA554((uint64_t)a1, v150);
    uint64_t v60 = (void *)objc_claimAutoreleasedReturnValue(v59);
    -[NSMutableArray addObject:](v45, "addObject:", v60);
  }

  if (v130)
  {
    id v61 = sub_1003FB690((uint64_t)a1, (uint64_t)v130);
    v62 = (void *)objc_claimAutoreleasedReturnValue(v61);
    -[NSMutableArray addObject:](v45, "addObject:", v62);
  }

  if ([v146 count])
  {
    id v63 = +[PKWorldRegion mostConstrainingTypeInRegions:]( &OBJC_CLASS___PKWorldRegion,  "mostConstrainingTypeInRegions:",  v146);
    id v64 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v168 = 0u;
    __int128 v169 = 0u;
    __int128 v170 = 0u;
    __int128 v171 = 0u;
    id v65 = v146;
    id v66 = [v65 countByEnumeratingWithState:&v168 objects:v187 count:16];
    if (v66)
    {
      id v67 = v66;
      uint64_t v68 = *(void *)v169;
      do
      {
        for (m = 0LL; m != v67; m = (char *)m + 1)
        {
          if (*(void *)v169 != v68) {
            objc_enumerationMutation(v65);
          }
          uint64_t v70 = *(void **)(*((void *)&v168 + 1) + 8LL * (void)m);
          if ([v70 type] == v63)
          {
            v71 = (void *)objc_claimAutoreleasedReturnValue([v70 identifier]);
            -[NSMutableArray addObject:](v64, "addObject:", v71);
          }
        }

        id v67 = [v65 countByEnumeratingWithState:&v168 objects:v187 count:16];
      }

      while (v67);
    }

    id v72 = -[NSMutableArray count](v64, "count");
    if ((unint64_t)v72 < 2)
    {
      double v57 = v150;
      id v45 = v151;
      if (v72 != (id)1)
      {
LABEL_61:

        id v58 = (void *)v149;
        goto LABEL_62;
      }

      __int128 v73 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](v64, "firstObject"));
      id v82 = sub_1003FD85C((uint64_t)a1, v73);
      unsigned __int8 v81 = (void *)objc_claimAutoreleasedReturnValue(v82);
    }

    else
    {
      __int128 v73 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      __int128 v164 = 0u;
      __int128 v165 = 0u;
      __int128 v166 = 0u;
      __int128 v167 = 0u;
      __int128 v74 = v64;
      id v75 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v74,  "countByEnumeratingWithState:objects:count:",  &v164,  v186,  16LL);
      if (v75)
      {
        id v76 = v75;
        uint64_t v77 = *(void *)v165;
        do
        {
          for (n = 0LL; n != v76; n = (char *)n + 1)
          {
            if (*(void *)v165 != v77) {
              objc_enumerationMutation(v74);
            }
            id v79 = sub_1003FD85C((uint64_t)a1, *(void **)(*((void *)&v164 + 1) + 8LL * (void)n));
            __int128 v80 = (void *)objc_claimAutoreleasedReturnValue(v79);
            -[NSMutableArray addObject:](v73, "addObject:", v80);
          }

          id v76 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v74,  "countByEnumeratingWithState:objects:count:",  &v164,  v186,  16LL);
        }

        while (v76);
      }

      unsigned __int8 v81 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAnyPredicates:",  v73));
      double v57 = v150;
      id v45 = v151;
    }

    -[NSMutableArray addObject:](v45, "addObject:", v81);

    goto LABEL_61;
  }

+ (id)installmentPlanTransactionsInDatabase:(id)a3 forTransactionSourceIdentifiers:(id)a4
{
  id v6 = a3;
  id v7 = sub_1003F4640((uint64_t)a1, a4);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v18[0] = v8;
  id v9 = sub_1003F65C0((uint64_t)a1, 14LL);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v18[1] = v10;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v18, 2LL));

  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v11));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v12]);

  id v14 = sub_1003F7224((uint64_t)a1, v13);
  id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v15));

  return v16;
}

+ (id)installmentTransactionsInDatabase:(id)a3 forTransactionSourceIdentifiers:(id)a4 installmentPlan:(id)a5 redeemed:(BOOL)a6 withRedemptionType:(unint64_t)a7 startDate:(id)a8 endDate:(id)a9
{
  id v46 = a3;
  id v45 = a4;
  id v13 = a5;
  id v43 = a8;
  id v42 = a9;
  id v14 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  __int128 v44 = v13;
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v13 lineItems]);
  id v16 = [v15 countByEnumeratingWithState:&v47 objects:v52 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v48;
    do
    {
      id v19 = 0LL;
      do
      {
        if (*(void *)v48 != v18) {
          objc_enumerationMutation(v15);
        }
        id v20 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v47 + 1) + 8 * (void)v19) identifier]);
        if (v20)
        {
          id v21 = sub_1003FE3A8((uint64_t)a1, v20);
          id v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
          -[NSMutableArray addObject:](v14, "addObject:", v22);
        }

        id v19 = (char *)v19 + 1;
      }

      while (v17 != v19);
      id v17 = [v15 countByEnumeratingWithState:&v47 objects:v52 count:16];
    }

    while (v17);
  }

  if (-[NSMutableArray count](v14, "count"))
  {
    id v41 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAnyPredicates:",  v14));
    v51[0] = v41;
    id v23 = v45;
    id v24 = sub_1003F4640((uint64_t)a1, v45);
    id v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    v51[1] = v25;
    id v26 = v43;
    id v27 = sub_1003FC134((uint64_t)a1, v43);
    id v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    v51[2] = v28;
    id v29 = v42;
    id v30 = sub_1003FC1C0((uint64_t)a1, v42);
    id v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
    v51[3] = v31;
    id v32 = sub_1003F65C0((uint64_t)a1, 14LL);
    id v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
    v51[4] = v33;
    id v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v51, 5LL));

    id v35 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v34));
    uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v46 predicate:v35]);
    id v37 = sub_1003F7224((uint64_t)a1, v36);
    id v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
    id v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v38));
  }

  else
  {
    id v39 = 0LL;
    id v23 = v45;
    id v29 = v42;
    id v26 = v43;
  }

  return v39;
}

+ (id)paymentTransactionsRequiringReviewInDatabase:(id)a3 forAccountIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = sub_1003F5750((uint64_t)a1, a4);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v19[0] = v8;
  id v9 = sub_1003FE550((uint64_t)a1);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v19[1] = v10;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v19, 2LL));

  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v11));
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryWithDatabase:predicate:]( &OBJC_CLASS___PaymentTransaction,  "queryWithDatabase:predicate:",  v6,  v12));

  id v14 = sub_1003F7224((uint64_t)a1, v13);
  id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v15));

  id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectsPassingTest:&stru_10065D490]);
  return v17;
}

+ (id)paymentTransactionsInDatabase:(id)a3 missingWorldRegionWithLimit:(unint64_t)a4 onlyEligibleForProcessing:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = sub_1003FE7C4((uint64_t)a1, v5);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryWithDatabase:predicate:orderingProperties:orderingDirections:limit:]( &OBJC_CLASS___PaymentTransaction,  "queryWithDatabase:predicate:orderingProperties:orderingDirections:limit:",  v8,  v10,  0LL,  0LL,  a4));

  id v12 = sub_1003F7224((uint64_t)a1, v11);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v13));

  return v14;
}

+ (BOOL)hasTransactionsMissingWorldRegionEligibleForProcessingInDatabase:(id)a3
{
  id v4 = a3;
  id v5 = sub_1003FE7C4((uint64_t)a1, 1);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryWithDatabase:predicate:orderingProperties:orderingDirections:limit:]( &OBJC_CLASS___PaymentTransaction,  "queryWithDatabase:predicate:orderingProperties:orderingDirections:limit:",  v4,  v6,  0LL,  0LL,  1LL));

  LOBYTE(v6) = (uint64_t)[v7 countOfEntities] > 0;
  return (char)v6;
}

+ (id)paymentTransactionsForTokenizedTransactionsWithRegionsInDatabase:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  id v6 = sub_1003FD728((uint64_t)a1, 7LL);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v21[0] = v7;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:notEqualToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:notEqualToValue:",  @"transaction_source",  &off_100690908));
  v21[1] = v8;
  objc_opt_self(a1);
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteNullPredicate isNotNullPredicateWithProperty:]( &OBJC_CLASS___SQLiteNullPredicate,  "isNotNullPredicateWithProperty:",  @"world_region_mapping.world_region_pid"));
  v21[2] = v9;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v21, 3LL));
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v10));

  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryWithDatabase:predicate:orderingProperties:orderingDirections:limit:]( &OBJC_CLASS___PaymentTransaction,  "queryWithDatabase:predicate:orderingProperties:orderingDirections:limit:",  v4,  v11,  0LL,  0LL,  1LL));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  void v18[2] = sub_1003FEEE4;
  v18[3] = &unk_10063BCB0;
  id v13 = v5;
  id v19 = v13;
  id v20 = v4;
  id v14 = v4;
  [v12 enumeratePersistentIDsUsingBlock:v18];
  id v15 = v20;
  id v16 = v13;

  return v16;
}

+ (id)regionIdentifiersInDatabase:(id)a3 matchingName:(id)a4 types:(id)a5 localeIdentifier:(id)a6 withRequest:(id)a7 limit:(unint64_t)a8
{
  id v48 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = objc_alloc(&OBJC_CLASS___NSArray);
  objc_opt_self(a1);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"world_region_localized_content.status",  &off_100690938));
  __int128 v47 = v13;
  id v19 = sub_1003FF53C((uint64_t)a1, v13);
  id v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  id v46 = v15;
  id v21 = sub_1003FF6A8((uint64_t)a1, v15);
  id v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  id v23 = (void *)objc_claimAutoreleasedReturnValue([a1 predicateForRequest:v16]);
  id v24 = -[NSArray initWithObjects:](v17, "initWithObjects:", v18, v20, v22, v23, 0LL);

  if ([v14 count])
  {
    id v25 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v51 = 0u;
    __int128 v52 = 0u;
    __int128 v53 = 0u;
    __int128 v54 = 0u;
    id v26 = v14;
    id v27 = [v26 countByEnumeratingWithState:&v51 objects:v59 count:16];
    if (v27)
    {
      id v28 = v27;
      uint64_t v29 = *(void *)v52;
      do
      {
        for (i = 0LL; i != v28; i = (char *)i + 1)
        {
          if (*(void *)v52 != v29) {
            objc_enumerationMutation(v26);
          }
          id v31 = sub_1003FF6FC( (uint64_t)a1,  (uint64_t)[*(id *)(*((void *)&v51 + 1) + 8 * (void)i) integerValue]);
          id v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
          -[NSMutableArray addObject:](v25, "addObject:", v32);
        }

        id v28 = [v26 countByEnumeratingWithState:&v51 objects:v59 count:16];
      }

      while (v28);
    }

    id v33 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAnyPredicates:",  v25));
    uint64_t v34 = objc_claimAutoreleasedReturnValue(-[NSArray arrayByAddingObject:](v24, "arrayByAddingObject:", v33));

    id v24 = (NSArray *)v34;
  }

  id v35 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v24));
  id v58 = @"count";
  uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v58, 1LL));
  double v57 = @"DESC";
  id v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v57, 1LL));
  double v56 = @"world_region.identifier";
  id v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v56, 1LL));
  id v39 = (void *)objc_claimAutoreleasedReturnValue( [a1 queryWithDatabase:v48 predicate:v35 orderingProperties:v36 orderingDirections:v37 limit:a8 groupingProperties:v38]);

  uint64_t v40 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  v55[0] = @"world_region.identifier";
  v55[1] = @"COUNT(*) as count";
  id v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v55, 2LL));
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472LL;
  v49[2] = sub_1003FF760;
  v49[3] = &unk_10063C0D0;
  __int128 v50 = v40;
  id v42 = v40;
  [v39 enumeratePersistentIDsAndProperties:v41 usingBlock:v49];

  id v43 = -[NSMutableSet copy](v42, "copy");
  return v43;
}

+ (id)paymentTransactionsInDatabase:(id)a3 originatedOnDevice:(BOOL)a4 forTransactionSourceIdentifiers:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = objc_alloc(&OBJC_CLASS___NSArray);
  id v11 = sub_1003FF89C((uint64_t)a1, v5);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  id v13 = sub_1003F4640((uint64_t)a1, v8);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

  id v15 = -[NSArray initWithObjects:](v10, "initWithObjects:", v12, v14, 0LL);
  id v16 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v15));
  id v17 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v9 predicate:v16]);

  id v18 = sub_1003F7224((uint64_t)a1, v17);
  id v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  id v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v19));

  return v20;
}

+ (unint64_t)numberOfPaymentTransactionsInDatabase:(id)a3 forTransactionSourceIdentifiers:(id)a4 withNotificationServiceData:(unint64_t)a5 newerThanDate:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  id v13 = objc_alloc(&OBJC_CLASS___NSArray);
  id v14 = sub_1003F47B8((uint64_t)a1, a5);
  id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  id v16 = sub_1003F4640((uint64_t)a1, v11);
  id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);

  id v18 = sub_1003FFA30((uint64_t)a1, v10);
  id v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

  id v20 = sub_1003F4844((uint64_t)a1, 0);
  id v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  id v22 = -[NSArray initWithObjects:](v13, "initWithObjects:", v15, v17, v19, v21, 0LL);

  id v23 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v22));
  id v24 = [a1 countInDatabase:v12 predicate:v23];

  return (unint64_t)v24;
}

+ (unint64_t)numberOfPaymentTransactionsInDatabaseWithAssociatedReceipt:(id)a3
{
  id v4 = a3;
  id v5 = sub_1003FFB18((uint64_t)a1);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = [a1 countInDatabase:v4 predicate:v6];

  return (unint64_t)v7;
}

+ (id)transactionReceiptUniqueIDsInDatabase:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  id v6 = sub_1003FFB18((uint64_t)a1);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v4 predicate:v7]);

  v18[0] = @"receipt_provider_identifier";
  v18[1] = @"receipt_identifier";
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v18, 2LL));
  id v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472LL;
  id v15 = sub_1003FFD44;
  id v16 = &unk_10063C0D0;
  id v10 = v5;
  id v17 = v10;
  [v8 enumeratePersistentIDsAndProperties:v9 usingBlock:&v13];

  if (-[NSMutableSet count](v10, "count", v13, v14, v15, v16)) {
    id v11 = -[NSMutableSet copy](v10, "copy");
  }
  else {
    id v11 = 0LL;
  }

  return v11;
}

+ (BOOL)hasPaymentTransactionInDatabase:(id)a3 forTransactionSourceIdentifiers:(id)a4 withTransactionSource:(unint64_t)a5
{
  id v8 = a3;
  id v9 = sub_1003F4640((uint64_t)a1, a4);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  id v19 = v10;
  id v11 = sub_1003FD728((uint64_t)a1, a5);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  id v20 = v12;
  id v13 = sub_1003F4844((uint64_t)a1, 0);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  id v21 = v14;
  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v19, 3LL));

  id v16 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v15,  v19,  v20));
  id v17 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryWithDatabase:predicate:orderingProperties:orderingDirections:limit:]( &OBJC_CLASS___PaymentTransaction,  "queryWithDatabase:predicate:orderingProperties:orderingDirections:limit:",  v8,  v16,  0LL,  0LL,  1LL));

  LOBYTE(v8) = (uint64_t)[v17 countOfEntities] > 0;
  return (char)v8;
}

+ (id)transactionsRequiringMerchantCleanupInDatabase:(id)a3 forTransactionSourceIdentifiers:(id)a4 withLastReprocessingDateBeforeDate:(id)a5 transactionDateWithinWindow:(double)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v14 = sub_1003F4640((uint64_t)a1, v11);
  id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

  -[NSMutableArray addObject:](v13, "addObject:", v15);
  id v16 = sub_1004001D0((uint64_t)a1, 1LL);
  id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  -[NSMutableArray addObject:](v13, "addObject:", v17);

  id v18 = sub_100400234((uint64_t)a1);
  id v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  -[NSMutableArray addObject:](v13, "addObject:", v19);

  if (v10)
  {
    id v20 = sub_100400310((uint64_t)a1, v10);
    id v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    -[NSMutableArray addObject:](v13, "addObject:", v21);
  }

  if (a6 > 0.0)
  {
    id v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    id v23 = sub_1003F7F48((uint64_t)a1, v22, a6);
    id v24 = (void *)objc_claimAutoreleasedReturnValue(v23);

    id v25 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteNullPredicate isNullPredicateWithProperty:]( &OBJC_CLASS___SQLiteNullPredicate,  "isNullPredicateWithProperty:",  @"last_merchant_reprocessing_date"));
    v34[0] = v24;
    v34[1] = v25;
    id v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v34, 2LL));
    id v27 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAnyPredicates:",  v26));
    -[NSMutableArray addObject:](v13, "addObject:", v27);
  }

  id v28 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v13));
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v12 predicate:v28]);

  id v30 = sub_1003F7224((uint64_t)a1, v29);
  id v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
  id v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v31));

  return v32;
}

+ (id)transactionsInDatabase:(id)a3 forInstallmentPlanIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = sub_1003F65C0((uint64_t)a1, 13LL);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  id v10 = sub_1003F5A98((uint64_t)a1, v6);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  v19[0] = v9;
  v19[1] = v11;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v19, 2LL));
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v12));

  id v14 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v7 predicate:v13]);
  id v15 = sub_1003F7224((uint64_t)a1, v14);
  id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v16));

  return v17;
}

+ (void)allPassTransactionIdentifiersInDatabase:(id)a3 batchHandler:(id)a4
{
}

+ (void)allPassTransactionIdentifiersWithAccountIdentifiers:(id)a3 inDatabase:(id)a4 batchHandler:(id)a5
{
  if (a5) {
    sub_100400594((uint64_t)a1, a3, a4, 0x8000000000000000LL, a5);
  }
}

+ (id)paymentTransactionsInDatabase:(id)a3 forTransactionSourceIdentifiers:(id)a4
{
  id v6 = a3;
  id v7 = sub_1003F4640((uint64_t)a1, a4);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = sub_100400D5C((uint64_t)a1, v6, v8);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  return v10;
}

+ (void)updateTransactionsWithTransactionSource:(id)a3 toTransactionSource:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t Object = PKLogFacilityTypeGetObject(6LL);
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
    *(_DWORD *)buf = 138412546;
    id v27 = v13;
    __int16 v28 = 2112;
    uint64_t v29 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Updating transaction with old transaction source identifier %@ to new transaction source identifier %@",  buf,  0x16u);
  }

  id v15 = [v9 persistentID];
  id v16 = sub_1003F4AB8((uint64_t)a1, (uint64_t)[v8 persistentID]);
  id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  id v18 = (void *)objc_claimAutoreleasedReturnValue( [a1 queryWithDatabase:v10 predicate:v17 orderingProperties:&__NSArray0__struct orderingDirections:&__NSArray0__struct]);

  id v25 = @"identifier";
  id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v25, 1LL));
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_100400FF0;
  void v21[3] = &unk_10065D508;
  id v22 = v10;
  id v23 = a1;
  id v24 = v15;
  id v20 = v10;
  [v18 enumeratePersistentIDsAndProperties:v19 usingBlock:v21];
}

+ (id)rewardsValuesForUnit:(unint64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  if (a3 == 1)
  {
    id v7 = @"eligible_eligible_rewards_percent_aggregate";
  }

  else
  {
    if (a3 != 2)
    {
      id v11 = 0LL;
      goto LABEL_10;
    }

    id v7 = @"eligible_rewards_cash_aggregate";
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 databaseTable]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"SELECT DISTINCT %@ FROM %@ WHERE %@ IS NOT NULL",  v7,  v8,  v7));

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1004011C0;
  v13[3] = &unk_100653140;
  id v10 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  id v14 = v10;
  sub_1002CCDBC((uint64_t)v6, v9, v13);
  if (-[NSMutableSet count](v10, "count")) {
    id v11 = -[NSMutableSet copy](v10, "copy");
  }
  else {
    id v11 = 0LL;
  }

LABEL_10:
  return v11;
}

+ (id)rewardsTierSummaryForTransactionSourceIdentifiers:(id)a3 currencyCode:(id)a4 startDate:(id)a5 endDate:(id)a6 inDatabase:(id)a7
{
  id v67 = a3;
  id v73 = a4;
  id v66 = a5;
  id v65 = a6;
  id v64 = a7;
  __int128 v74 = (void *)objc_claimAutoreleasedReturnValue([a1 databaseTable]);
  id v72 = (void *)objc_claimAutoreleasedReturnValue(+[PaymentTransactionReward databaseTable](&OBJC_CLASS___PaymentTransactionReward, "databaseTable"));
  v71 = (void *)objc_claimAutoreleasedReturnValue(+[TransactionSource databaseTable](&OBJC_CLASS___TransactionSource, "databaseTable"));
  id v69 = (void *)objc_claimAutoreleasedReturnValue(+[AccountEnhancedMerchant databaseTable](&OBJC_CLASS___AccountEnhancedMerchant, "databaseTable"));
  uint64_t v68 = (void *)objc_claimAutoreleasedReturnValue( +[AccountEnhancedMerchantProgramIdentifier databaseTable]( &OBJC_CLASS___AccountEnhancedMerchantProgramIdentifier,  "databaseTable"));
  uint64_t v70 = (void *)objc_claimAutoreleasedReturnValue(+[Account databaseTable](&OBJC_CLASS___Account, "databaseTable"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"SELECT     %@ AS %@,     %@ AS %@,     %@ AS %@,     %@ AS %@,     %@ AS %@,     %@ AS %@,     %@ AS %@,     %@ AS %@,     max(%@) NOT NULL AS %@ ",  @"apples.e",  @"rewardAmount",  @"apples.c",  @"rewardType",  @"apples.g",  @"rewardEligibleValue",  @"apples.h",  @"rewardEligibleUnit",  @"apples.pid",  @"rewardPid",  @"apples.b",  @"transactionPid",  @"apples.k",  @"promotionIdentifier",  @"apples.m",  @"programIdentifier",  @"mirabelle.b",  @"hasEnhancedMerchantProgramIdentifier"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 stringByAppendingFormat:@"FROM %@ ", v74]);

  id v14 = (void *)objc_claimAutoreleasedReturnValue( [v13 stringByAppendingFormat:@"JOIN %@ ON %@ = %@.%@ ", v72, @"apples.b", v74, @"pid"]);
  id v15 = (void *)objc_claimAutoreleasedReturnValue( [v14 stringByAppendingFormat:@"JOIN %@ ON %@ = %@.%@ ", v71, @"transaction_source.pid", v74, @"source_pid"]);

  id v16 = (void *)objc_claimAutoreleasedReturnValue( [v15 stringByAppendingFormat:@"JOIN %@ ON %@ = %@.%@ ", v70, @"pears.a", v74, @"account_identifier"]);
  id v17 = (void *)objc_claimAutoreleasedReturnValue( [v16 stringByAppendingFormat:@"LEFT JOIN %@ ON %@ = %@ ", v69, @"quince.a", @"pears.pid"]);

  id v18 = (void *)objc_claimAutoreleasedReturnValue( [v17 stringByAppendingFormat:@"LEFT JOIN %@ ON %@ = %@ AND %@ = %@ ", v68, @"mirabelle.a", @"quince.pid", @"mirabelle.b", @"apples.m"]);
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 stringByAppendingString:@"WHERE "]);

  if ((uint64_t)[v67 count] >= 1)
  {
    id v20 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v67 count]);
    __int128 v110 = 0u;
    __int128 v111 = 0u;
    __int128 v112 = 0u;
    __int128 v113 = 0u;
    id v21 = v67;
    id v22 = [v21 countByEnumeratingWithState:&v110 objects:v114 count:16];
    if (v22)
    {
      uint64_t v23 = *(void *)v111;
      do
      {
        for (i = 0LL; i != v22; i = (char *)i + 1)
        {
          if (*(void *)v111 != v23) {
            objc_enumerationMutation(v21);
          }
          id v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"'%@'",  *(void *)(*((void *)&v110 + 1) + 8LL * (void)i)));
          -[NSMutableArray addObject:](v20, "addObject:", v25);
        }

        id v22 = [v21 countByEnumeratingWithState:&v110 objects:v114 count:16];
      }

      while (v22);
    }

    id v26 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray componentsJoinedByString:](v20, "componentsJoinedByString:", @", "));
    id v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"(%@)", v26));

    uint64_t v28 = objc_claimAutoreleasedReturnValue( [v19 stringByAppendingFormat:@"%@ IN %@ AND ", @"transaction_source.identifier", v27]);
    id v19 = (void *)v28;
  }

  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue( [v19 stringByAppendingFormat:@"(%@.%@ = ? OR %@.%@ = ?) AND %@.%@ = ? AND %@ = ? AND %@.%@ = '%@' ", v74, @"transaction_type", v74, @"transaction_type", v74, @"transaction_status", @"apples.d", v74, @"currency_code", v73]);

  if (v66)
  {
    uint64_t v30 = objc_claimAutoreleasedReturnValue([v29 stringByAppendingFormat:@"AND %@.%@ >= ? ", v74, @"transaction_date"]);

    uint64_t v29 = (void *)v30;
  }

  if (v65)
  {
    uint64_t v31 = objc_claimAutoreleasedReturnValue([v29 stringByAppendingFormat:@"AND %@.%@ <= ? ", v74, @"transaction_date"]);

    uint64_t v29 = (void *)v31;
  }

  id v63 = (void *)objc_claimAutoreleasedReturnValue([v29 stringByAppendingFormat:@"GROUP BY %@ ", @"rewardPid"]);

  uint64_t v60 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ AS (%@)",  @"AllRewardsVirtualTable",  v63));
  id v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"SELECT     %@.%@ AS %@,     %@.%@ AS %@ ",  @"AllRewardsTableA",  @"rewardPid",  @"enhancedMerchantRewardPidA",  @"AllRewardsTableB",  @"rewardPid",  @"enhancedMerchantRewardPidB"));
  id v33 = (void *)objc_claimAutoreleasedReturnValue( [v32 stringByAppendingFormat:@"FROM     %@ AS %@     JOIN %@ AS %@ ON %@.%@ = %@.%@ ", @"AllRewardsVirtualTable", @"AllRewardsTableA", @"AllRewardsVirtualTable", @"AllRewardsTableB", @"AllRewardsTableA", @"transactionPid", @"AllRewardsTableB", @"transactionPid"]);

  uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue( [v33 stringByAppendingFormat:@"AND %@.%@ = ? AND %@.%@ = ? AND %@.%@ = ? AND %@.%@ = ? AND %@.%@ = ? AND %@.%@ = ? AND %@.%@ IS NULL AND (%@.%@ IS NULL OR %@.%@ IS 1) ", @"AllRewardsTableA", @"rewardEligibleUnit", @"AllRewardsTableA", @"rewardEligibleValue", @"AllRewardsTableA", @"rewardType", @"AllRewardsTableB", @"rewardEligibleUnit", @"AllRewardsTableB", @"rewardEligibleValue", @"AllRewardsTableB", @"rewardType", @"AllRewardsTableA", @"promotionIdentifier", @"AllRewardsTableA", @"programIdentifier", @"AllRewardsTableA", @"hasEnhancedMerchantProgramIdentifier"]);
  v62 = (void *)objc_claimAutoreleasedReturnValue( [v34 stringByAppendingFormat:@"GROUP BY %@.%@ ", @"AllRewardsTableA", @"transactionPid"]);

  id v59 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ AS (%@)",  @"EnhancedMerchantRewardsVirtualTable",  v62));
  id v61 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"SELECT     %@ AS %@ FROM     %@ UNION SELECT     %@ FROM     %@ ",  @"enhancedMerchantRewardPidA",  @"enhancedMerchantRewardPid",  @"EnhancedMerchantRewardsVirtualTable",  @"enhancedMerchantRewardPidB",  @"EnhancedMerchantRewardsVirtualTable"));
  id v58 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ AS (%@)",  @"EnhancedMerchantRewardsPidsTable",  v61));
  id v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"SELECT    sum(%@.%@),     %@.%@,     %@.%@,     %@.%@,     %@.%@ IS NOT NULL AS %@ ",  @"AllRewardsTableFinal",  @"rewardAmount",  @"AllRewardsTableFinal",  @"rewardType",  @"AllRewardsTableFinal",  @"rewardEligibleValue",  @"AllRewardsTableFinal",  @"rewardEligibleUnit",  @"EnhancedMerchantRewardsPidsTableFinal",  @"enhancedMerchantRewardPid",  @"isEnhancedMerchantReward"));
  uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue( [v35 stringByAppendingFormat:@"FROM %@ AS %@ ", @"AllRewardsVirtualTable", @"AllRewardsTableFinal"]);

  id v37 = (void *)objc_claimAutoreleasedReturnValue( [v36 stringByAppendingFormat:@"LEFT JOIN %@ AS %@ ON %@.%@ = %@.%@ ", @"EnhancedMerchantRewardsPidsTable", @"EnhancedMerchantRewardsPidsTableFinal", @"AllRewardsTableFinal", @"rewardPid", @"EnhancedMerchantRewardsPidsTableFinal", @"enhancedMerchantRewardPid"]);
  id v38 = (void *)objc_claimAutoreleasedReturnValue( [v37 stringByAppendingFormat:@"GROUP BY %@.%@, %@.%@, %@.%@, %@ ", @"AllRewardsTableFinal", @"rewardEligibleUnit", @"AllRewardsTableFinal", @"rewardEligibleValue", @"AllRewardsTableFinal", @"rewardType", @"isEnhancedMerchantReward"]);

  uint64_t v39 = objc_claimAutoreleasedReturnValue( [v38 stringByAppendingFormat:@"ORDER BY %@, %@.%@, %@.%@, %@.%@ ASC", @"isEnhancedMerchantReward", @"AllRewardsTableFinal", @"rewardType", @"AllRewardsTableFinal", @"rewardEligibleUnit", @"AllRewardsTableFinal", @"rewardEligibleValue"]);
  uint64_t v40 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"WITH %@, %@, %@ %@",  v60,  v59,  v58,  v39));
  id v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSDecimalNumber zero](&OBJC_CLASS___NSDecimalNumber, "zero"));
  double v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSDecimalNumber one](&OBJC_CLASS___NSDecimalNumber, "one"));
  id v42 = -[NSDecimalNumber initWithMantissa:exponent:isNegative:]( objc_alloc(&OBJC_CLASS___NSDecimalNumber),  "initWithMantissa:exponent:isNegative:",  2LL,  0LL,  0LL);
  id v43 = -[NSDecimalNumber initWithMantissa:exponent:isNegative:]( objc_alloc(&OBJC_CLASS___NSDecimalNumber),  "initWithMantissa:exponent:isNegative:",  3LL,  0LL,  0LL);
  __int128 v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  double v56 = (void *)v39;
  uint64_t v104 = 0LL;
  unsigned __int8 v105 = &v104;
  uint64_t v106 = 0x3032000000LL;
  id v107 = sub_1003F5278;
  unsigned __int8 v108 = sub_1003F5288;
  id v109 = v41;
  uint64_t v98 = 0LL;
  unsigned __int8 v99 = &v98;
  uint64_t v100 = 0x3032000000LL;
  v101 = sub_1003F5278;
  id v102 = sub_1003F5288;
  id v103 = v109;
  id v45 = (void *)v40;
  uint64_t v92 = 0LL;
  id v93 = &v92;
  uint64_t v94 = 0x3032000000LL;
  uint64_t v95 = sub_1003F5278;
  unsigned __int8 v96 = sub_1003F5288;
  id v97 = v103;
  uint64_t v86 = 0LL;
  id v87 = &v86;
  uint64_t v88 = 0x3032000000LL;
  v89 = sub_1003F5278;
  id v90 = sub_1003F5288;
  id v55 = v97;
  id v91 = v55;
  v75[0] = _NSConcreteStackBlock;
  v75[1] = 3221225472LL;
  v75[2] = sub_100401E34;
  v75[3] = &unk_10065D530;
  id v46 = v66;
  id v76 = v46;
  id v47 = v65;
  id v77 = v47;
  id v48 = v57;
  id v78 = v48;
  __int128 v49 = v42;
  id v79 = v49;
  id v50 = v44;
  id v80 = v50;
  __int128 v51 = v43;
  unsigned __int8 v81 = v51;
  id v82 = &v92;
  __int16 v83 = &v86;
  id v84 = &v104;
  v85 = &v98;
  sub_1002CCDBC((uint64_t)v64, v45, v75);
  id v52 = objc_alloc(&OBJC_CLASS___PKAccountRewardsTierSummary);
  id v53 = [v52 initWithStartDate:v46 endDate:v47 currencyCode:v73 onePercentTotal:v105[5] twoPercentTotal:v99[5] threePercentTotal:v93[5] specialTotal:v87[5]];

  _Block_object_dispose(&v86, 8);
  _Block_object_dispose(&v92, 8);

  _Block_object_dispose(&v98, 8);
  _Block_object_dispose(&v104, 8);

  return v53;
}

- (void)replaceWithPaymentTransaction:(id)a3
{
  id v15 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v15 paymentHash]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 uppercaseString]);

  unsigned int v6 = [v15 hasNotificationServiceData];
  if (v5)
  {
    if (v6)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"payment_hash"));

      if (!v7)
      {
        id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
        [v8 setObjectOrNull:v5 forKey:@"payment_hash"];
        if ([v15 technologyType] == (id)1)
        {
          id v9 = (void *)objc_claimAutoreleasedReturnValue([v15 paymentHash]);
          id v10 = sub_1003F3008(v9);
          id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

          id v12 = (void *)objc_claimAutoreleasedReturnValue([v15 paymentHash]);
          id v13 = sub_1003F3058(v12);
          id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

          if (v11
            && ([v11 isEqualToString:@"00000000000000000000000000000000"] & 1) == 0)
          {
            [v8 setObjectOrNull:v11 forKey:@"payment_hash_component_1"];
          }

          if (v14
            && ([v14 isEqualToString:@"00000000000000000000000000000000"] & 1) == 0)
          {
            [v8 setObjectOrNull:v14 forKey:@"payment_hash_component_2"];
          }
        }

        -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v8);
      }
    }
  }

  -[PaymentTransaction updateWithPaymentTransaction:](self, "updateWithPaymentTransaction:", v15);
}

- (void)updateWithPaymentTransaction:(id)a3
{
  id v274 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"transaction_source"));
  id v6 = [v5 integerValue];

  id v7 = [v274 transactionSource];
  if (v7) {
    id v8 = v7;
  }
  else {
    id v8 = v6;
  }
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"transaction_type"));
  id v10 = [v9 integerValue];

  id v11 = [v274 transactionType];
  if (v11) {
    id v12 = v11;
  }
  else {
    id v12 = v10;
  }
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"requires_location"));
  unsigned int v264 = [v13 BOOLValue];

  unsigned int v261 = [v274 requiresLocation];
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"transaction_status"));
  id v15 = [v14 integerValue];

  id v16 = [v274 transactionStatus];
  if (v16) {
    id v17 = v16;
  }
  else {
    id v17 = v15;
  }
  id v255 = v17;
  id v18 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"transaction_declined_reason"));
  id v19 = [v18 integerValue];

  id v20 = [v274 transactionDeclinedReason];
  if (v20) {
    id v21 = v20;
  }
  else {
    id v21 = v19;
  }
  id v239 = v21;
  id v22 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"has_notification_service_data"));
  unsigned int v245 = [v22 BOOLValue];

  unsigned int v243 = [v274 hasNotificationServiceData];
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"processed_for_location"));
  unsigned int v241 = [v23 BOOLValue];

  unsigned int v230 = [v274 processedForLocation];
  id v24 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"processed_for_merchant_cleanup"));
  unsigned int v228 = [v24 BOOLValue];

  unsigned int v226 = [v274 processedForMerchantCleanup];
  id v25 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"processed_for_stations"));
  unsigned int v26 = [v25 BOOLValue];

  unsigned int v27 = [v274 processedForStations];
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"should_suppress_date"));
  unsigned int v237 = [v28 BOOLValue];

  unsigned int v235 = [v274 shouldSuppressDate];
  unsigned int v233 = [v274 requiresMerchantReprocessing];
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"n"));
  unsigned int v229 = [v29 BOOLValue];

  unsigned int v227 = [v274 originatedByDevice];
  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"fuzzy_matched"));
  unsigned int v225 = [v30 BOOLValue];

  unsigned int v224 = [v274 isFuzzyMatched];
  uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"interest_reassessment"));
  unsigned int v223 = [v31 BOOLValue];

  unsigned int v32 = [v274 interestReassessment];
  uint64_t v33 = objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"associated_statement_identifiers"));
  uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue([v274 associatedStatementIdentifiers]);
  uint64_t v35 = objc_claimAutoreleasedReturnValue([v34 componentsJoinedByString:@","]);
  uint64_t v36 = (void *)v35;
  if (v35) {
    id v37 = (void *)v35;
  }
  else {
    id v37 = (void *)v33;
  }
  id v273 = v37;

  id v38 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"technology_type"));
  id v39 = [v38 integerValue];

  id v40 = [v274 technologyType];
  if (v40) {
    id v41 = v40;
  }
  else {
    id v41 = v39;
  }
  id v232 = v41;
  id v42 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"locality"));
  id v43 = (void *)objc_claimAutoreleasedReturnValue([v274 locality]);
  id v259 = v8;
  if ([v43 length])
  {
    id v272 = (id)objc_claimAutoreleasedReturnValue([v274 locality]);
  }

  else
  {
    id v272 = v42;
  }

  __int128 v44 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"administrative_area"));
  id v45 = (void *)objc_claimAutoreleasedReturnValue([v274 administrativeArea]);
  unsigned int v221 = v27;
  if ([v45 length])
  {
    id v271 = (id)objc_claimAutoreleasedReturnValue([v274 administrativeArea]);
  }

  else
  {
    id v271 = v44;
  }

  id v46 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"af"));
  id v47 = (void *)objc_claimAutoreleasedReturnValue([v274 timeZone]);
  v253 = v42;
  if (v47)
  {
    id v48 = (void *)objc_claimAutoreleasedReturnValue([v274 timeZone]);
    id v270 = (id)objc_claimAutoreleasedReturnValue([v48 name]);
  }

  else
  {
    id v270 = v46;
  }

  __int128 v49 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"peer_payment_memo"));
  id v50 = (void *)objc_claimAutoreleasedReturnValue([v274 peerPaymentMemo]);
  unsigned int v222 = v26;
  if ([v50 length])
  {
    id v269 = (id)objc_claimAutoreleasedReturnValue([v274 peerPaymentMemo]);
  }

  else
  {
    id v269 = v49;
  }

  __int128 v51 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"cb"));
  id v52 = (void *)objc_claimAutoreleasedReturnValue([v274 peerPaymentCounterpartImageRecordIdentifier]);
  v249 = v51;
  if ([v52 length])
  {
    id v268 = (id)objc_claimAutoreleasedReturnValue([v274 peerPaymentCounterpartImageRecordIdentifier]);
  }

  else
  {
    id v268 = v51;
  }

  id v53 = (void *)objc_claimAutoreleasedReturnValue( -[SQLiteEntity valueForProperty:]( self,  "valueForProperty:",  @"secondary_funding_source_fpan_identifier"));
  __int128 v54 = (void *)objc_claimAutoreleasedReturnValue([v274 secondaryFundingSourceFPANIdentifier]);
  id v257 = v12;
  if ([v54 length])
  {
    id v267 = (id)objc_claimAutoreleasedReturnValue([v274 secondaryFundingSourceFPANIdentifier]);
  }

  else
  {
    id v267 = v53;
  }

  id v55 = (void *)objc_claimAutoreleasedReturnValue( -[SQLiteEntity valueForProperty:]( self,  "valueForProperty:",  @"secondary_funding_source_description"));
  double v56 = (void *)objc_claimAutoreleasedReturnValue([v274 secondaryFundingSourceDescription]);
  v254 = (void *)v33;
  v251 = v46;
  v252 = v44;
  v250 = v49;
  v247 = v55;
  v248 = v53;
  if ([v56 length])
  {
    id v266 = (id)objc_claimAutoreleasedReturnValue([v274 secondaryFundingSourceDescription]);
  }

  else
  {
    id v266 = v55;
  }

  uint64_t v57 = v261 | v264;
  int v58 = v243 | v245;
  uint64_t v59 = v230 | v241;

  uint64_t v60 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"secondary_funding_source_type"));
  id v61 = [v60 integerValue];

  id v62 = [v274 secondaryFundingSourceType];
  if (v62) {
    id v63 = v62;
  }
  else {
    id v63 = v61;
  }
  id v231 = v63;
  id v64 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"issue_report_identifier"));
  id v65 = (void *)objc_claimAutoreleasedReturnValue([v274 issueReportIdentifier]);
  v246 = v64;
  unsigned int v262 = v58;
  if ([v65 length])
  {
    id v265 = (id)objc_claimAutoreleasedReturnValue([v274 issueReportIdentifier]);
  }

  else
  {
    id v265 = v64;
  }

  uint64_t v66 = v32 | v223;

  id v67 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"transaction_date"));
  uint64_t v68 = (void *)_DateForSQLValue(v67);

  id v69 = (void *)objc_claimAutoreleasedReturnValue([v274 transactionDate]);
  v244 = v68;
  if (v69)
  {
    id v70 = (id)objc_claimAutoreleasedReturnValue([v274 transactionDate]);
  }

  else
  {
    id v70 = v68;
  }

  [v4 setObjectOrNull:v70 forKey:@"transaction_date"];
  v71 = (void *)objc_claimAutoreleasedReturnValue([v274 transactionStatusChangedDate]);
  [v4 setObjectOrNull:v71 forKey:@"transaction_status_changed_date"];

  id v72 = (void *)objc_claimAutoreleasedReturnValue([v274 expirationDate]);
  [v4 setObjectOrNull:v72 forKey:@"expiration_date"];

  id v73 = (void *)objc_claimAutoreleasedReturnValue([v274 cityCode]);
  [v4 setObjectOrNull:v73 forKey:@"city_code"];

  [v4 setInteger:v232 forKey:@"technology_type"];
  [v4 setInteger:v259 forKey:@"transaction_source"];
  [v4 setInteger:v257 forKey:@"transaction_type"];
  [v4 setInteger:v255 forKey:@"transaction_status"];
  [v4 setInteger:v239 forKey:@"transaction_declined_reason"];
  [v4 setBool:v57 forKey:@"requires_location"];
  [v4 setBool:v262 forKey:@"has_notification_service_data"];
  [v4 setBool:v59 forKey:@"processed_for_location"];
  [v4 setBool:v226 | v228 forKey:@"processed_for_merchant_cleanup"];
  [v4 setBool:v233 forKey:@"requires_merchant_reprocessing"];
  __int128 v74 = (void *)objc_claimAutoreleasedReturnValue([v274 lastMerchantReprocessingDate]);

  if (v74)
  {
    id v75 = (void *)objc_claimAutoreleasedReturnValue([v274 lastMerchantReprocessingDate]);
    id v76 = (void *)_SQLValueForDate(v75);
    [v4 setObjectOrNull:v76 forKey:@"last_merchant_reprocessing_date"];
  }

  v242 = v70;
  [v4 setBool:v227 | v229 forKey:@"n"];
  [v4 setBool:v224 | v225 forKey:@"fuzzy_matched"];
  [v4 setObjectOrNull:v273 forKey:@"associated_statement_identifiers"];
  [v4 setBool:v66 forKey:@"interest_reassessment"];
  objc_msgSend(v4, "setInteger:forKey:", objc_msgSend(v274, "updateSequenceNumber"), @"update_sequence_number");
  objc_msgSend(v4, "setBool:forKey:", objc_msgSend(v274, "needsSyncWithFinance"), @"needs_sync_to_finance");
  [v4 safelySetObject:v272 forKey:@"locality"];
  [v4 safelySetObject:v271 forKey:@"administrative_area"];
  [v4 safelySetObject:v270 forKey:@"af"];
  [v274 locationLatitude];
  if (v77 != 0.0 || ([v274 locationLongitude], v78 != 0.0))
  {
    [v274 locationHorizontalAccuracy];
    if (v79 > 0.0)
    {
      id v80 = (void *)objc_claimAutoreleasedReturnValue([v274 locationDate]);
      [v4 setObject:v80 forKey:@"location_date"];

      [v274 locationLatitude];
      objc_msgSend(v4, "setDouble:forKey:", @"location_latitude");
      [v274 locationLongitude];
      objc_msgSend(v4, "setDouble:forKey:", @"location_longitude");
      [v274 locationAltitude];
      objc_msgSend(v4, "setDouble:forKey:", @"location_altitude");
      [v274 locationHorizontalAccuracy];
      objc_msgSend(v4, "setDouble:forKey:", @"location_horizontal_accuracy");
      [v274 locationVerticalAccuracy];
      objc_msgSend(v4, "setDouble:forKey:", @"location_vertical_accuracy");
      objc_msgSend(v4, "setBool:forKey:", objc_msgSend(v274, "isCoarseLocation"), @"is_coarse_location");
    }
  }

  unsigned __int8 v81 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v274 transitType]));
  [v4 setObject:v81 forKeyedSubscript:@"transit_type"];

  id v82 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v274 transitModifiers]));
  [v4 setObject:v82 forKeyedSubscript:@"transit_modifiers"];

  __int16 v83 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v274 enRoute]));
  [v4 setObject:v83 forKeyedSubscript:@"en_route"];

  uint64_t v84 = objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"station_code_provider"));
  uint64_t v85 = objc_claimAutoreleasedReturnValue([v274 stationCodeProvider]);
  uint64_t v86 = objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"start_station_code"));
  uint64_t v87 = objc_claimAutoreleasedReturnValue([v274 startStationCode]);
  uint64_t v260 = objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"end_station_code"));
  uint64_t v88 = objc_claimAutoreleasedReturnValue([v274 endStationCode]);
  [v4 setObjectOrNull:v85 forKey:@"station_code_provider"];
  v258 = (void *)v87;
  uint64_t v89 = v87;
  id v90 = (void *)v86;
  [v4 setObjectOrNull:v89 forKey:@"start_station_code"];
  v256 = (void *)v88;
  uint64_t v91 = v88;
  uint64_t v92 = (void *)v84;
  [v4 setObjectOrNull:v91 forKey:@"end_station_code"];
  if (v84
    && v86 | v260
    && PKEqualObjects(v84, v85)
    && PKEqualObjects(v86, v258)
    && PKEqualObjects(v260, v256))
  {
    id v93 = (void *)objc_claimAutoreleasedReturnValue([v274 startStation]);
    if (v93)
    {
      [v4 setObject:v93 forKey:@"start_station"];
      [v274 startStationLatitude];
      objc_msgSend(v4, "setDouble:forKey:", @"start_station_latitude");
      [v274 startStationLongitude];
      objc_msgSend(v4, "setDouble:forKey:", @"start_station_longitude");
    }

    uint64_t v94 = v221 | v222;
    uint64_t v95 = (void *)objc_claimAutoreleasedReturnValue([v274 endStation]);
    unsigned int v96 = v262;
    if (v95)
    {
      [v4 setObject:v95 forKey:@"end_station"];
      [v274 endStationLatitude];
      objc_msgSend(v4, "setDouble:forKey:", @"end_station_latitude");
      [v274 endStationLongitude];
      objc_msgSend(v4, "setDouble:forKey:", @"end_station_longitude");
    }
  }

  else
  {
    id v97 = (void *)objc_claimAutoreleasedReturnValue([v274 startStation]);
    [v4 setObjectOrNull:v97 forKey:@"start_station"];

    [v274 startStationLatitude];
    objc_msgSend(v4, "setDouble:forKey:", @"start_station_latitude");
    [v274 startStationLongitude];
    objc_msgSend(v4, "setDouble:forKey:", @"start_station_longitude");
    uint64_t v98 = (void *)objc_claimAutoreleasedReturnValue([v274 endStation]);
    [v4 setObjectOrNull:v98 forKey:@"end_station"];

    [v274 endStationLatitude];
    objc_msgSend(v4, "setDouble:forKey:", @"end_station_latitude");
    [v274 endStationLongitude];
    objc_msgSend(v4, "setDouble:forKey:", @"end_station_longitude");
    if (v85) {
      uint64_t v94 = (uint64_t)[v274 processedForStations];
    }
    else {
      uint64_t v94 = 1LL;
    }
    unsigned int v96 = v262;
  }

  [v4 setBool:v94 forKey:@"processed_for_stations"];
  [v4 setBool:v235 | v237 forKey:@"should_suppress_date"];
  [v4 setObjectOrNull:v265 forKey:@"issue_report_identifier"];
  unsigned __int8 v99 = (void *)objc_claimAutoreleasedReturnValue([v274 amount]);
  uint64_t v100 = v99;
  if (v99) {
    char v101 = v96;
  }
  else {
    char v101 = 1;
  }
  if ((v101 & 1) != 0)
  {

    id v102 = v274;
    if (!v100) {
      goto LABEL_75;
    }
    goto LABEL_74;
  }

  __int128 v111 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"amount"));

  id v102 = v274;
  if (!v111)
  {
LABEL_74:
    id v103 = (void *)objc_claimAutoreleasedReturnValue([v274 amount]);
    uint64_t v104 = PKCurrencyDecimalToStorageNumber(v103);
    unsigned __int8 v105 = (void *)objc_claimAutoreleasedReturnValue(v104);
    [v4 setObjectOrNull:v105 forKey:@"amount"];

    id v102 = v274;
  }

- (void)updateWithPaymentTransactionSource:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PaymentTransaction transactionSourceIdentifier](self, "transactionSourceIdentifier"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[TransactionSource anyInDatabase:withIdentifier:]( &OBJC_CLASS___TransactionSource,  "anyInDatabase:withIdentifier:",  self->super._database,  v5));
  uint64_t v7 = objc_claimAutoreleasedReturnValue( +[TransactionSource anyInDatabase:withIdentifier:]( &OBJC_CLASS___TransactionSource,  "anyInDatabase:withIdentifier:",  self->super._database,  v4));
  id v8 = (void *)v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  char v10 = v9 || [v6 type] != (id)3 || objc_msgSend(v8, "type") != 0;
  if ([v5 length] && objc_msgSend(v4, "length"))
  {
    id v11 = v5;
    id v12 = v4;
    id v13 = v12;
    if (v11 == v12)
    {

LABEL_19:
      goto LABEL_20;
    }

    if (v12 && v11) {
      v10 |= [v11 isEqualToString:v12];
    }

    if ((v10 & 1) == 0)
    {
      uint64_t Object = PKLogFacilityTypeGetObject(23LL);
      id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        id v16 = (void *)objc_claimAutoreleasedReturnValue(-[PaymentTransaction identifier](self, "identifier"));
        int v17 = 138412802;
        id v18 = v11;
        __int16 v19 = 2112;
        id v20 = v13;
        __int16 v21 = 2112;
        id v22 = v16;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Updating transaction source identifier from %@ to %@ for transaction with identifier %@",  (uint8_t *)&v17,  0x20u);
      }

      id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v8 persistentID]));
      -[SQLiteEntity setValue:forProperty:](self, "setValue:forProperty:", v13, @"source_pid");
      goto LABEL_19;
    }
  }

- (void)updateSuppressBehavior:(unint64_t)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  -[SQLiteEntity setValue:forProperty:](self, "setValue:forProperty:", v4, @"ac");
}

- (void)updateRequiresMerchantReprocessing:(BOOL)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a3));
  -[SQLiteEntity setValue:forProperty:](self, "setValue:forProperty:", v4, @"requires_merchant_reprocessing");
}

+ (unint64_t)suppressionBehaviorForTransactionSourceIdentifier:(id)a3 serviceIdentifier:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = sub_1003F5808((uint64_t)a1, v9);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v27[0] = v12;
  id v13 = sub_1003F55AC((uint64_t)a1, v8);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v27[1] = v14;
  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v27, 2LL));
  id v16 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v15));

  int v17 = (void *)objc_claimAutoreleasedReturnValue( [a1 queryWithDatabase:v10 predicate:v16 orderingProperties:0 orderingDirections:0 limit:1]);
  uint64_t v22 = 0LL;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x2020000000LL;
  uint64_t v25 = 0LL;
  unsigned int v26 = @"ac";
  id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v26, 1LL));
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_10040477C;
  void v21[3] = &unk_10063E828;
  void v21[4] = &v22;
  [v17 enumeratePersistentIDsAndProperties:v18 usingBlock:v21];

  unint64_t v19 = v23[3];
  _Block_object_dispose(&v22, 8);

  return v19;
}

- (void)updateRedemptionType:(unint64_t)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  -[SQLiteEntity setValue:forProperty:](self, "setValue:forProperty:", v4, @"ad");
}

- (void)updateWithMerchant:(id)a3
{
  id v27 = a3;
  if ([v27 isValid])
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v27 name]);
    [v4 safelySetObject:v5 forKey:@"merchant_name"];

    id v6 = (void *)objc_claimAutoreleasedReturnValue([v27 rawName]);
    [v4 safelySetObject:v6 forKey:@"merchant_raw_name"];

    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v27 industryCategory]);
    [v4 safelySetObject:v7 forKey:@"merchant_industry_category"];

    id v8 = (void *)objc_claimAutoreleasedReturnValue([v27 rawCANL]);
    [v4 safelySetObject:v8 forKey:@"f"];

    id v9 = (void *)objc_claimAutoreleasedReturnValue([v27 rawCity]);
    [v4 safelySetObject:v9 forKey:@"g"];

    id v10 = (void *)objc_claimAutoreleasedReturnValue([v27 rawState]);
    [v4 safelySetObject:v10 forKey:@"h"];

    id v11 = (void *)objc_claimAutoreleasedReturnValue([v27 rawCountry]);
    [v4 safelySetObject:v11 forKey:@"i"];

    id v12 = (void *)objc_claimAutoreleasedReturnValue([v27 city]);
    [v4 safelySetObject:v12 forKey:@"j"];

    id v13 = (void *)objc_claimAutoreleasedReturnValue([v27 state]);
    [v4 safelySetObject:v13 forKey:@"k"];

    id v14 = (void *)objc_claimAutoreleasedReturnValue([v27 zip]);
    [v4 safelySetObject:v14 forKey:@"l"];

    id v15 = (void *)objc_claimAutoreleasedReturnValue([v27 merchantIdentifier]);
    [v4 safelySetObject:v15 forKey:@"t"];

    id v16 = (void *)objc_claimAutoreleasedReturnValue([v27 fallbackLogoImageURL]);
    int v17 = (void *)_SQLValueForURL(v16);
    [v4 safelySetObject:v17 forKey:@"merchant_fallback_logo_image_url"];

    objc_msgSend(v4, "setInteger:forKey:", objc_msgSend(v27, "cleanConfidenceLevel"), @"m");
    objc_msgSend(v4, "setInteger:forKey:", objc_msgSend(v27, "industryCode"), @"merchant_industry_code");
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v27 fallbackDetailedCategory]);

    if (v18)
    {
      unint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v27 fallbackDetailedCategory]);
      [v4 safelySetObject:v19 forKey:@"y"];
    }

    if ([v27 fallbackcategory]) {
      objc_msgSend(v4, "setInteger:forKey:", objc_msgSend(v27, "fallbackcategory"), @"x");
    }
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v27 originURL]);

    if (v20)
    {
      __int16 v21 = (void *)objc_claimAutoreleasedReturnValue([v27 originURL]);
      uint64_t v22 = (void *)_SQLValueForURL(v21);
      [v4 setObject:v22 forKey:@"p"];
    }

    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v27 webMerchantIdentifier]);

    if (v23)
    {
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v27 webMerchantIdentifier]);
      [v4 safelySetObject:v24 forKey:@"ag"];
    }

    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v27 webMerchantName]);

    if (v25)
    {
      unsigned int v26 = (void *)objc_claimAutoreleasedReturnValue([v27 webMerchantName]);
      [v4 safelySetObject:v26 forKey:@"ah"];
    }

    if ([v27 adamIdentifier]) {
      objc_msgSend(v4, "setInteger:forKey:", objc_msgSend(v27, "adamIdentifier"), @"q");
    }
    -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v4);
  }
}

- (void)removeMapsDataForIssueReportIdentifier:(id)a3
{
  id v5 = a3;
  -[SQLiteEntity setValue:forProperty:]( self,  "setValue:forProperty:",  &__kCFBooleanTrue,  @"use_raw_merchant_data");
  -[SQLiteEntity setValue:forProperty:]( self,  "setValue:forProperty:",  &__kCFBooleanTrue,  @"requires_merchant_reprocessing");
  -[SQLiteEntity setValue:forProperty:](self, "setValue:forProperty:", 0LL, @"last_merchant_reprocessing_date");
  id v4 = v5;
  if (v5)
  {
    -[SQLiteEntity setValue:forProperty:](self, "setValue:forProperty:", v5, @"issue_report_identifier");
    id v4 = v5;
  }
}

- (id)paymentTransaction
{
  v3 = objc_autoreleasePoolPush();
  id v4 = (id *)sub_1004052C4(objc_alloc(&OBJC_CLASS___PaymentTransactionDeserializationContext), 0);
  id v5 = sub_1004055C4(v4, self);
  sub_100405728((uint64_t)v4, self->super._database);

  objc_autoreleasePoolPop(v3);
  return v5;
}

- (id)identifier
{
  return -[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"identifier");
}

- (id)serviceIdentifier
{
  return -[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"service_identifier");
}

- (id)transactionDate
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"transaction_date"));
  v3 = (void *)_DateForSQLValue(v2);

  return v3;
}

- (id)accountIdentifier
{
  return -[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"account_identifier");
}

- (id)paymentApplication
{
  id v3 = sub_1004059CC(self);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[PaymentApplication anyInDatabase:withTransactionSourcePID:]( PaymentApplication,  "anyInDatabase:withTransactionSourcePID:",  v5,  [v4 persistentID]));

  return v6;
}

- (id)transactionSourceIdentifier
{
  id v2 = sub_1004059CC(self);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);

  return v4;
}

- (id)dbPaymentTransactionArchive
{
  return +[PaymentTransactionArchive anyInDatabase:forTransaction:]( &OBJC_CLASS___PaymentTransactionArchive,  "anyInDatabase:forTransaction:",  self->super._database);
}

- (int64_t)transactionType
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"transaction_type"));
  id v3 = [v2 integerValue];

  return (int64_t)v3;
}

- (id)passUniqueIdentifier
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[PaymentTransaction paymentApplication](self, "paymentApplication"));
  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[Pass anyInDatabase:withPersistentID:]( Pass,  "anyInDatabase:withPersistentID:",  v4,  [v3 passPID]));

    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 uniqueID]);
  }

  else
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PaymentTransaction transactionSourceIdentifier](self, "transactionSourceIdentifier"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[TransactionSource anyInDatabase:withIdentifier:]( &OBJC_CLASS___TransactionSource,  "anyInDatabase:withIdentifier:",  v7,  v8));

    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[Pass anyInDatabase:withTransactionSourcePID:]( Pass,  "anyInDatabase:withTransactionSourcePID:",  v9,  [v5 persistentID]));

    id v6 = (void *)objc_claimAutoreleasedReturnValue([v10 uniqueID]);
  }

  return v6;
}

- (int64_t)accountType
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"account_type"));
  id v3 = [v2 integerValue];

  return (int64_t)v3;
}

- (id)transactionAuthenticationResult
{
  id v3 = (void *)sub_100405D58((uint64_t)&OBJC_CLASS___PaymentTransaction);
  id v4 = objc_alloc_init(&OBJC_CLASS___PKTransactionAuthenticationResult);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 allKeys]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100405E0C;
  v13[3] = &unk_100638EF0;
  void v13[4] = self;
  id v14 = v3;
  id v6 = v4;
  id v15 = v6;
  id v7 = v3;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v5, v13);

  id v8 = sub_100405E64((PKTransactionAuthenticationContext *)self);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  -[PKTransactionAuthenticationResult setAuthenticationContext:](v6, "setAuthenticationContext:", v9);

  id v10 = v15;
  id v11 = v6;

  return v11;
}

+ (void)resetNeedsSyncWithFinanceForTransactionWithPID:(id)a3 updateSequenceNumber:(int64_t)a4 inDatabase:(id)a5
{
  id v7 = a3;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10040613C;
  v10[3] = &unk_100647810;
  id v11 = a5;
  id v12 = v7;
  int64_t v13 = a4;
  id v8 = v7;
  id v9 = v11;
  sub_1002CCC5C((uint64_t)v9, v10);
}

+ (BOOL)setNeedsSyncWithFinanceForAllTransactionsInDatabase:(id)a3
{
  uint64_t v10 = 0LL;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000LL;
  char v13 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1004062B0;
  v6[3] = &unk_10065D558;
  id v9 = a1;
  id v3 = a3;
  id v7 = v3;
  id v8 = &v10;
  sub_1002CCC5C((uint64_t)v3, v6);
  char v4 = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return v4;
}

+ (void)setNeedsSyncWithFinanceForTransactionsWithAccountIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10040644C;
  v9[3] = &unk_100647810;
  id v11 = a4;
  id v12 = a1;
  id v10 = v6;
  id v7 = v11;
  id v8 = v6;
  sub_1002CCC5C((uint64_t)v7, v9);
}

+ (id)transactionsThatNeedSyncToFinanceWithAccountIdentifiers:(id)a3 withLimit:(int64_t)a4 inDatabase:(id)a5
{
  id v7 = a3;
  id v28 = a5;
  id v8 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  id v9 = v7;
  id v10 = [v9 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v30;
    do
    {
      char v13 = 0LL;
      do
      {
        if (*(void *)v30 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = sub_1003F5750((uint64_t)a1, *(void **)(*((void *)&v29 + 1) + 8LL * (void)v13));
        id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
        -[NSMutableArray addObject:](v8, "addObject:", v15);

        char v13 = (char *)v13 + 1;
      }

      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }

    while (v11);
  }

  unsigned int v26 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAnyPredicates:",  v8));
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"needs_sync_to_finance",  &off_100690950));
  id v16 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:notEqualToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:notEqualToValue:",  @"account_type",  &off_1006908F0));
  int v17 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteNullPredicate isNotNullPredicateWithProperty:]( &OBJC_CLASS___SQLiteNullPredicate,  "isNotNullPredicateWithProperty:",  @"currency_code"));
  id v18 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteNullPredicate isNotNullPredicateWithProperty:]( &OBJC_CLASS___SQLiteNullPredicate,  "isNotNullPredicateWithProperty:",  @"identifier"));
  v33[0] = v25;
  v33[1] = v26;
  v33[2] = v16;
  v33[3] = v17;
  v33[4] = v18;
  unint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v33, 5LL));
  id v20 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v19));

  __int16 v21 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryWithDatabase:predicate:orderingProperties:orderingDirections:limit:]( &OBJC_CLASS___PaymentTransaction,  "queryWithDatabase:predicate:orderingProperties:orderingDirections:limit:",  v28,  v20,  0LL,  0LL,  a4));
  uint64_t v22 = sub_1004052C4(objc_alloc(&OBJC_CLASS___PaymentTransactionDeserializationContext), 0);
  uint64_t v23 = sub_100406838(v22, v21);
  sub_100405728((uint64_t)v22, v28);

  return v23;
}

@end