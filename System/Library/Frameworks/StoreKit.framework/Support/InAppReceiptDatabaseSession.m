@interface InAppReceiptDatabaseSession
- (BOOL)cacheIncludesFinishedConsumablesForBundleID:(id)a3;
- (BOOL)hasTransactionWithSubscriptionOfferType:(unsigned __int8)a3 forSubscriptionGroupID:(id)a4 bundleID:(id)a5;
- (BOOL)isTransactionFinishedForID:(id)a3 bundleID:(id)a4;
- (InAppReceiptDatabaseSession)initWithConnection:(id)a3;
- (SQLiteConnection)connection;
- (id)_inAppPendingTransactionsPropertyForKey:(id)a3 bundleID:(id)a4;
- (id)_latestTransactionReceiptForUnarchivedRenewalInfo:(id)a3 subscriptionGroupID:(id)a4 bundleID:(id)a5 outProductID:(id *)a6;
- (id)_propertyForKey:(id)a3 bundleID:(id)a4;
- (id)_statusesForRenewalInfoBlob:(id)a3 subscriptionGroupID:(id)a4 bundleID:(id)a5;
- (id)accountTokenForBundleID:(id)a3;
- (id)appTransactionForBundleID:(id)a3 bundleVersion:(id)a4 accountToken:(id)a5;
- (id)currentRevisionForBundleID:(id)a3;
- (id)lastUpdatedForBundleID:(id)a3;
- (id)pendingLegacyTransactionsAccountTokenForBundleID:(id)a3;
- (id)pendingLegacyTransactionsForBundleID:(id)a3 logKey:(id)a4 error:(id *)a5;
- (id)pendingLegacyTransactionsLastUpdatedForBundleID:(id)a3;
- (id)statusHashesForBundleID:(id)a3;
- (id)subscriptionStatusForSubscriptionGroupID:(id)a3 bundleID:(id)a4;
- (id)transactionForID:(id)a3 bundleID:(id)a4;
- (id)transactionHashesForBundleID:(id)a3 totalCount:(unint64_t *)a4;
- (void)_enumerateSubscriptionStatusForBundleID:(id)a3 alsoMatchingPredicate:(id)a4 ignoreEmptyStatus:(BOOL)a5 usingBlock:(id)a6;
- (void)enumerateCurrentReceiptsForProductID:(id)a3 bundleID:(id)a4 usingBlock:(id)a5;
- (void)enumerateReceiptsForProductID:(id)a3 bundleID:(id)a4 usingBlock:(id)a5;
- (void)enumerateReceiptsForSubscriptionsInGracePeriodForBundleID:(id)a3 usingBlock:(id)a4;
- (void)enumerateSubscriptionStatusForBundleID:(id)a3 usingBlock:(id)a4;
- (void)enumerateUnfinishedTransactionReceiptsForBundleID:(id)a3 usingBlock:(id)a4;
@end

@implementation InAppReceiptDatabaseSession

- (InAppReceiptDatabaseSession)initWithConnection:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___InAppReceiptDatabaseSession;
  v6 = -[InAppReceiptDatabaseSession init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_connection, a3);
  }

  return v7;
}

- (id)accountTokenForBundleID:(id)a3
{
  return -[InAppReceiptDatabaseSession _propertyForKey:bundleID:](self, "_propertyForKey:bundleID:", @"token", a3);
}

- (BOOL)cacheIncludesFinishedConsumablesForBundleID:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[InAppReceiptDatabaseSession _propertyForKey:bundleID:]( self,  "_propertyForKey:bundleID:",  @"finished_consumables",  a3));
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (id)appTransactionForBundleID:(id)a3 bundleVersion:(id)a4 accountToken:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:value:comparisonType:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:value:comparisonType:",  @"bundle_id",  v8,  1LL));
  [v11 addObject:v12];
  if (v9)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:value:comparisonType:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:value:comparisonType:",  @"bundle_version",  v9,  1LL));
    [v11 addObject:v13];
  }

  if (v10)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:value:comparisonType:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:value:comparisonType:",  @"token",  v10,  1LL));
    [v11 addObject:v14];
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v11));
  v28 = @"receipt";
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v28, 1LL));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[InAppReceiptDatabaseSession connection](self, "connection"));
  v18 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryOnConnection:predicate:]( &OBJC_CLASS___AppTransactionDatabaseEntity,  "queryOnConnection:predicate:",  v17,  v15));

  uint64_t v22 = 0LL;
  v23 = &v22;
  uint64_t v24 = 0x3032000000LL;
  v25 = sub_10002E92C;
  v26 = sub_10002E93C;
  id v27 = 0LL;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_10002E944;
  v21[3] = &unk_1002E8038;
  v21[4] = &v22;
  [v18 enumeratePersistentIDsAndProperties:v16 usingBlock:v21];
  id v19 = (id)v23[5];
  _Block_object_dispose(&v22, 8);

  return v19;
}

- (id)currentRevisionForBundleID:(id)a3
{
  return -[InAppReceiptDatabaseSession _propertyForKey:bundleID:]( self,  "_propertyForKey:bundleID:",  @"revision",  a3);
}

- (void)enumerateCurrentReceiptsForProductID:(id)a3 bundleID:(id)a4 usingBlock:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v35 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:value:comparisonType:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:value:comparisonType:",  @"bundle_id",  v8,  1LL));
  [v9 addObject:v10];

  if ([v7 length])
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:value:comparisonType:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:value:comparisonType:",  @"product_id",  v7,  1LL));
    [v9 addObject:v11];
  }

  v37 = v7;
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteNullPredicate isNullPredicateWithProperty:]( &OBJC_CLASS___SQLiteNullPredicate,  "isNullPredicateWithProperty:",  @"revocation_date"));
  [v9 addObject:v12];

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[SecureClock now](&OBJC_CLASS___SecureClock, "now"));
  if (!v13)
  {
    if (qword_10032E2A0 != -1) {
      dispatch_once(&qword_10032E2A0, &stru_1002E81E8);
    }
    if (os_log_type_enabled((os_log_t)qword_10032E258, OS_LOG_TYPE_ERROR)) {
      sub_10025DC68();
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteNullPredicate isNullPredicateWithProperty:]( &OBJC_CLASS___SQLiteNullPredicate,  "isNullPredicateWithProperty:",  @"expiration_date"));
  v49[0] = v14;
  [v13 timeIntervalSinceReferenceDate];
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:value:comparisonType:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:value:comparisonType:",  @"expiration_date",  v15,  5LL));
  v49[1] = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v49, 2LL));
  v18 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAnyPredicates:",  v17));
  [v9 addObject:v18];

  id v19 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"product_type",  &off_100302798));
  v48[0] = v19;
  v20 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"product_type",  &off_1003027B0));
  v48[1] = v20;
  v21 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"product_type",  &off_1003027C8));
  v48[2] = v21;
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v48, 3LL));
  v23 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAnyPredicates:",  v22));
  [v9 addObject:v23];

  v34 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v9));
  v47[0] = @"product_id";
  v47[1] = @"receipt";
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v47, 2LL));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[InAppReceiptDatabaseSession connection](self, "connection"));
  v46 = @"transaction_date";
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v46, 1LL));
  v45 = @"DESC";
  id v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v45, 1LL));
  v28 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryOnConnection:predicate:orderingProperties:orderingDirections:]( &OBJC_CLASS___InAppTransactionEntity,  "queryOnConnection:predicate:orderingProperties:orderingDirections:",  v25,  v34,  v26,  v27));

  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472LL;
  v41[2] = sub_10002EEDC;
  v41[3] = &unk_1002E8060;
  id v42 = v13;
  v29 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  v43 = v29;
  id v30 = v35;
  id v44 = v30;
  id v31 = v13;
  [v28 enumeratePersistentIDsAndProperties:v24 usingBlock:v41];
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472LL;
  v38[2] = sub_10002F16C;
  v38[3] = &unk_1002E8088;
  v39 = v29;
  id v40 = v30;
  id v32 = v30;
  v33 = v29;
  -[InAppReceiptDatabaseSession enumerateReceiptsForSubscriptionsInGracePeriodForBundleID:usingBlock:]( self,  "enumerateReceiptsForSubscriptionsInGracePeriodForBundleID:usingBlock:",  v8,  v38);
}

- (void)enumerateReceiptsForProductID:(id)a3 bundleID:(id)a4 usingBlock:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:value:comparisonType:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:value:comparisonType:",  @"bundle_id",  a4,  1LL));
  if ([v8 length])
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:value:comparisonType:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:value:comparisonType:",  @"product_id",  v8,  1LL));
    v25[0] = v10;
    v25[1] = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v25, 2LL));
    id v13 = (id)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v12));
  }

  else
  {
    id v13 = v10;
  }

  uint64_t v24 = @"receipt";
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v24, 1LL));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[InAppReceiptDatabaseSession connection](self, "connection"));
  v23 = @"transaction_date";
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v23, 1LL));
  uint64_t v22 = @"DESC";
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v22, 1LL));
  v18 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryOnConnection:predicate:orderingProperties:orderingDirections:]( &OBJC_CLASS___InAppTransactionEntity,  "queryOnConnection:predicate:orderingProperties:orderingDirections:",  v15,  v13,  v16,  v17));

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_10002F448;
  v20[3] = &unk_1002E80B0;
  id v21 = v9;
  id v19 = v9;
  [v18 enumeratePersistentIDsAndProperties:v14 usingBlock:v20];
}

- (void)enumerateReceiptsForSubscriptionsInGracePeriodForBundleID:(id)a3 usingBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"bundle_id",  v6));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[SecureClock now](&OBJC_CLASS___SecureClock, "now"));
  if (!v9)
  {
    if (qword_10032E2A0 != -1) {
      dispatch_once(&qword_10032E2A0, &stru_1002E81E8);
    }
    if (os_log_type_enabled((os_log_t)qword_10032E280, OS_LOG_TYPE_ERROR)) {
      sub_10025DC68();
    }
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  }

  [v9 timeIntervalSinceReferenceDate];
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:value:comparisonType:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:value:comparisonType:",  @"grace_period_expiration_date",  v10,  5LL));

  v24[0] = v8;
  v24[1] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v24, 2LL));
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v12));

  v23 = @"renewal_info";
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v23, 1LL));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[InAppReceiptDatabaseSession connection](self, "connection"));
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryOnConnection:predicate:]( &OBJC_CLASS___InAppSubscriptionStatusDatabaseEntity,  "queryOnConnection:predicate:",  v15,  v13));

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_10002F740;
  v19[3] = &unk_1002E8060;
  id v20 = v6;
  id v21 = self;
  id v22 = v7;
  id v17 = v7;
  id v18 = v6;
  [v16 enumeratePersistentIDsAndProperties:v14 usingBlock:v19];
}

- (void)enumerateUnfinishedTransactionReceiptsForBundleID:(id)a3 usingBlock:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:value:comparisonType:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:value:comparisonType:",  @"bundle_id",  a3,  1LL));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:value:comparisonType:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:value:comparisonType:",  @"is_finished",  &__kCFBooleanFalse,  1LL));
  v22[0] = v7;
  v22[1] = v8;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v22, 2LL));
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v9));

  id v21 = @"receipt";
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v21, 1LL));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[InAppReceiptDatabaseSession connection](self, "connection"));
  id v20 = @"transaction_date";
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v20, 1LL));
  id v19 = @"DESC";
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v19, 1LL));
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryOnConnection:predicate:orderingProperties:orderingDirections:]( &OBJC_CLASS___InAppTransactionEntity,  "queryOnConnection:predicate:orderingProperties:orderingDirections:",  v12,  v10,  v13,  v14));

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10002FE18;
  v17[3] = &unk_1002E80B0;
  id v18 = v6;
  id v16 = v6;
  [v15 enumeratePersistentIDsAndProperties:v11 usingBlock:v17];
}

- (BOOL)isTransactionFinishedForID:(id)a3 bundleID:(id)a4
{
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[InAppReceiptDatabaseSession transactionForID:bundleID:](self, "transactionForID:bundleID:", a3, a4));
  id v5 = v4;
  if (v4) {
    unsigned __int8 v6 = [v4 isFinished];
  }
  else {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (BOOL)hasTransactionWithSubscriptionOfferType:(unsigned __int8)a3 forSubscriptionGroupID:(id)a4 bundleID:(id)a5
{
  uint64_t v6 = a3;
  id v35 = a4;
  id v32 = a5;
  v34 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"bundle_id"));
  v33 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"product_type",  &off_1003027C8));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](&OBJC_CLASS___NSNumber, "numberWithUnsignedChar:", v6));
  v37 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"receipt",  v7));

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[SQLiteFunction extractJWSPayload](&OBJC_CLASS____TtC9storekitd14SQLiteFunction, "extractJWSPayload"));
  v49[0] = v8;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteExtractJSONTransform extractJSONAtKey:]( &OBJC_CLASS____TtC9storekitd26SQLiteExtractJSONTransform,  "extractJSONAtKey:",  @"offerType"));
  v49[1] = v9;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v49, 2LL));
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteSequentialValueTransform composingTransforms:]( &OBJC_CLASS____TtC9storekitd30SQLiteSequentialValueTransform,  "composingTransforms:",  v10));
  [v37 setTransform:v11];

  v12 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"receipt",  v35));
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[SQLiteFunction extractJWSPayload](&OBJC_CLASS____TtC9storekitd14SQLiteFunction, "extractJWSPayload"));
  v48[0] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteExtractJSONTransform extractJSONAtKey:]( &OBJC_CLASS____TtC9storekitd26SQLiteExtractJSONTransform,  "extractJSONAtKey:",  @"subscriptionGroupIdentifier"));
  v48[1] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v48, 2LL));
  id v16 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteSequentialValueTransform composingTransforms:]( &OBJC_CLASS____TtC9storekitd30SQLiteSequentialValueTransform,  "composingTransforms:",  v15));
  [v12 setTransform:v16];

  v47[0] = v34;
  v47[1] = v33;
  void v47[2] = v37;
  v47[3] = v12;
  id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v47, 4LL));
  id v18 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v17));

  id v19 = (void *)objc_claimAutoreleasedReturnValue(-[InAppReceiptDatabaseSession connection](self, "connection"));
  id v20 = (void *)objc_claimAutoreleasedReturnValue(+[SQLiteFunction extractJWSPayload](&OBJC_CLASS____TtC9storekitd14SQLiteFunction, "extractJWSPayload"));
  [v19 addFunction:v20];

  id v21 = (void *)objc_claimAutoreleasedReturnValue(-[InAppReceiptDatabaseSession connection](self, "connection"));
  v46 = @"transaction_date";
  id v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v46, 1LL));
  v45 = @"ASC";
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v45, 1LL));
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryOnConnection:predicate:orderingProperties:orderingDirections:]( &OBJC_CLASS___InAppTransactionEntity,  "queryOnConnection:predicate:orderingProperties:orderingDirections:",  v21,  v18,  v22,  v23));

  v25 = (void *)objc_claimAutoreleasedReturnValue([v24 queryDescriptor]);
  [v25 setLimitCount:1];

  uint64_t v41 = 0LL;
  id v42 = &v41;
  uint64_t v43 = 0x2020000000LL;
  char v44 = 0;
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472LL;
  v38[2] = sub_100030378;
  v38[3] = &unk_1002E80D8;
  id v26 = v32;
  id v39 = v26;
  id v40 = &v41;
  [v24 enumerateMemoryEntitiesUsingBlock:v38];
  id v27 = (void *)objc_claimAutoreleasedReturnValue(-[InAppReceiptDatabaseSession connection](self, "connection"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[SQLiteFunction extractJWSPayload](&OBJC_CLASS____TtC9storekitd14SQLiteFunction, "extractJWSPayload"));
  v29 = (void *)objc_claimAutoreleasedReturnValue([v28 name]);
  id v30 = (void *)objc_claimAutoreleasedReturnValue(+[SQLiteFunction extractJWSPayload](&OBJC_CLASS____TtC9storekitd14SQLiteFunction, "extractJWSPayload"));
  objc_msgSend(v27, "removeFunctionNamed:withArgumentCount:", v29, objc_msgSend(v30, "argumentCount"));

  LOBYTE(v27) = *((_BYTE *)v42 + 24) == 0;
  _Block_object_dispose(&v41, 8);

  return (char)v27;
}

- (id)lastUpdatedForBundleID:(id)a3
{
  return -[InAppReceiptDatabaseSession _propertyForKey:bundleID:]( self,  "_propertyForKey:bundleID:",  @"last_updated",  a3);
}

- (id)subscriptionStatusForSubscriptionGroupID:(id)a3 bundleID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:value:comparisonType:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:value:comparisonType:",  @"subscription_group_id",  v6,  1LL));
  uint64_t v12 = 0LL;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  v15 = sub_10002E92C;
  id v16 = sub_10002E93C;
  id v17 = 0LL;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000305B8;
  v11[3] = &unk_1002E8100;
  v11[4] = &v12;
  -[InAppReceiptDatabaseSession _enumerateSubscriptionStatusForBundleID:alsoMatchingPredicate:ignoreEmptyStatus:usingBlock:]( self,  "_enumerateSubscriptionStatusForBundleID:alsoMatchingPredicate:ignoreEmptyStatus:usingBlock:",  v7,  v8,  1LL,  v11);
  id v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

- (void)enumerateSubscriptionStatusForBundleID:(id)a3 usingBlock:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100030650;
  v7[3] = &unk_1002E7270;
  id v8 = a4;
  id v6 = v8;
  -[InAppReceiptDatabaseSession _enumerateSubscriptionStatusForBundleID:alsoMatchingPredicate:ignoreEmptyStatus:usingBlock:]( self,  "_enumerateSubscriptionStatusForBundleID:alsoMatchingPredicate:ignoreEmptyStatus:usingBlock:",  a3,  0LL,  0LL,  v7);
}

- (id)transactionForID:(id)a3 bundleID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:value:comparisonType:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:value:comparisonType:",  @"bundle_id",  v7,  1LL));
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:value:comparisonType:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:value:comparisonType:",  @"transaction_id",  v6,  1LL));
  v23[0] = v8;
  v23[1] = v9;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v23, 2LL));
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v10));

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[InAppReceiptDatabaseSession connection](self, "connection"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteMemoryEntity queryOnConnection:predicate:]( &OBJC_CLASS___InAppTransaction,  "queryOnConnection:predicate:",  v12,  v11));

  uint64_t v17 = 0LL;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000LL;
  id v20 = sub_10002E92C;
  id v21 = sub_10002E93C;
  id v22 = 0LL;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100030860;
  v16[3] = &unk_1002E8128;
  v16[4] = &v17;
  [v13 enumerateMemoryEntitiesUsingBlock:v16];
  id v14 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v14;
}

- (id)pendingLegacyTransactionsForBundleID:(id)a3 logKey:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v19 = 0LL;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  id v22 = sub_10002E92C;
  v23 = sub_10002E93C;
  uint64_t v24 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:value:comparisonType:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:value:comparisonType:",  @"bundle_id",  v7,  1LL));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[InAppReceiptDatabaseSession connection](self, "connection"));
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryOnConnection:predicate:]( &OBJC_CLASS___InAppPendingTransactionsDatabaseEntity,  "queryOnConnection:predicate:",  v10,  v9));

  v25[0] = @"transaction_id";
  v25[1] = @"original_transaction_id";
  void v25[2] = @"product_id";
  v25[3] = @"item_id";
  v25[4] = @"transaction_date";
  v25[5] = @"original_transaction_date";
  v25[6] = @"quantity";
  v25[7] = @"request_data";
  v25[8] = @"transaction_receipt";
  v25[9] = @"receipt";
  v25[10] = @"assets";
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v25, 11LL));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100030B18;
  v16[3] = &unk_1002E8150;
  id v13 = v7;
  id v17 = v13;
  id v18 = &v19;
  [v11 enumeratePersistentIDsAndProperties:v12 usingBlock:v16];
  id v14 = (id)v20[5];

  _Block_object_dispose(&v19, 8);
  return v14;
}

- (id)pendingLegacyTransactionsAccountTokenForBundleID:(id)a3
{
  return -[InAppReceiptDatabaseSession _inAppPendingTransactionsPropertyForKey:bundleID:]( self,  "_inAppPendingTransactionsPropertyForKey:bundleID:",  @"token",  a3);
}

- (id)pendingLegacyTransactionsLastUpdatedForBundleID:(id)a3
{
  return -[InAppReceiptDatabaseSession _inAppPendingTransactionsPropertyForKey:bundleID:]( self,  "_inAppPendingTransactionsPropertyForKey:bundleID:",  @"last_updated",  a3);
}

- (id)statusHashesForBundleID:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"bundle_id",  v4));

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[InAppReceiptDatabaseSession connection](self, "connection"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryOnConnection:predicate:]( &OBJC_CLASS___InAppSubscriptionStatusDatabaseEntity,  "queryOnConnection:predicate:",  v7,  v6));
  id v14 = @"renewal_info";
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v14, 1LL));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10003105C;
  v12[3] = &unk_1002E6970;
  id v10 = v5;
  id v13 = v10;
  [v8 enumeratePersistentIDsAndProperties:v9 usingBlock:v12];

  return v10;
}

- (id)transactionHashesForBundleID:(id)a3 totalCount:(unint64_t *)a4
{
  id v6 = a3;
  uint64_t v18 = 0LL;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000LL;
  uint64_t v21 = 0LL;
  id v7 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"bundle_id",  v6));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[InAppReceiptDatabaseSession connection](self, "connection"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryOnConnection:predicate:]( &OBJC_CLASS___InAppTransactionEntity,  "queryOnConnection:predicate:",  v9,  v8));
  id v22 = @"receipt";
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v22, 1LL));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1000312E8;
  v14[3] = &unk_1002E8178;
  id v16 = &v18;
  uint64_t v12 = v7;
  v15 = v12;
  id v17 = a4;
  [v10 enumeratePersistentIDsAndProperties:v11 usingBlock:v14];

  if (a4) {
    *a4 = v19[3];
  }

  _Block_object_dispose(&v18, 8);
  return v12;
}

- (id)_inAppPendingTransactionsPropertyForKey:(id)a3 bundleID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:value:comparisonType:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:value:comparisonType:",  @"bundle_id",  v7,  1LL));
  uint64_t v18 = 0LL;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000LL;
  uint64_t v21 = sub_10002E92C;
  id v22 = sub_10002E93C;
  id v23 = 0LL;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[InAppReceiptDatabaseSession connection](self, "connection"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryOnConnection:predicate:]( &OBJC_CLASS___InAppPendingTransactionsPropertiesDatabaseEntity,  "queryOnConnection:predicate:",  v9,  v8));

  id v24 = v6;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v24, 1LL));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000315B0;
  v15[3] = &unk_1002E81A0;
  id v17 = &v18;
  id v12 = v6;
  id v16 = v12;
  [v10 enumeratePersistentIDsAndProperties:v11 usingBlock:v15];

  id v13 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return v13;
}

- (id)_propertyForKey:(id)a3 bundleID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:value:comparisonType:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:value:comparisonType:",  @"bundle_id",  v7,  1LL));
  uint64_t v18 = 0LL;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000LL;
  uint64_t v21 = sub_10002E92C;
  id v22 = sub_10002E93C;
  id v23 = 0LL;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[InAppReceiptDatabaseSession connection](self, "connection"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryOnConnection:predicate:]( &OBJC_CLASS___InAppReceiptPropertiesDatabaseEntity,  "queryOnConnection:predicate:",  v9,  v8));

  id v24 = v6;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v24, 1LL));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000317C0;
  v15[3] = &unk_1002E81A0;
  id v17 = &v18;
  id v12 = v6;
  id v16 = v12;
  [v10 enumeratePersistentIDsAndProperties:v11 usingBlock:v15];

  id v13 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return v13;
}

- (id)_statusesForRenewalInfoBlob:(id)a3 subscriptionGroupID:(id)a4 bundleID:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v28 = 0LL;
  id v10 = sub_100026EC4(a3, &v28);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  id v12 = v28;
  if (v12)
  {
    if (qword_10032E2A0 != -1) {
      dispatch_once(&qword_10032E2A0, &stru_1002E81E8);
    }
    if (os_log_type_enabled((os_log_t)qword_10032E280, OS_LOG_TYPE_ERROR)) {
      sub_10025DEE4((uint64_t)v8);
    }
    id v23 = 0LL;
  }

  else
  {
    id v22 = v11;
    id v23 = (id)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v11 count]));
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    id v13 = v11;
    id v14 = [v13 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v25;
      do
      {
        for (i = 0LL; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v25 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void **)(*((void *)&v24 + 1) + 8LL * (void)i);
          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( -[InAppReceiptDatabaseSession _latestTransactionReceiptForUnarchivedRenewalInfo:subscriptionGroupID:bundleID:outProductID:]( self,  "_latestTransactionReceiptForUnarchivedRenewalInfo:subscriptionGroupID:bundleID:outProductID:",  v18,  v8,  v9,  0LL));
          if (v19)
          {
            id v20 = [v18 mutableCopy];
            [v20 setObject:v19 forKeyedSubscript:@"signedTransactionInfo"];
            [v23 addObject:v20];
          }
        }

        id v15 = [v13 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }

      while (v15);
    }

    id v12 = 0LL;
    v11 = v22;
  }

  return v23;
}

- (id)_latestTransactionReceiptForUnarchivedRenewalInfo:(id)a3 subscriptionGroupID:(id)a4 bundleID:(id)a5 outProductID:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"signedRenewalInfo"]);
  id v28 = 0LL;
  id v14 = sub_100025C04(v13, (uint64_t)&v28);
  id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  id v16 = v28;
  if (v16)
  {
    if (qword_10032E2A0 != -1) {
      dispatch_once(&qword_10032E2A0, &stru_1002E81E8);
    }
    if (os_log_type_enabled((os_log_t)qword_10032E280, OS_LOG_TYPE_ERROR)) {
      sub_10025E014((uint64_t)v11);
    }
    id v17 = 0LL;
  }

  else
  {
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:@"productId"]);
    uint64_t v19 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v18, v19) & 1) != 0)
    {
      uint64_t v22 = 0LL;
      id v23 = &v22;
      uint64_t v24 = 0x3032000000LL;
      __int128 v25 = sub_10002E92C;
      __int128 v26 = sub_10002E93C;
      id v27 = 0LL;
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472LL;
      v21[2] = sub_100031CFC;
      v21[3] = &unk_1002E7650;
      v21[4] = &v22;
      -[InAppReceiptDatabaseSession enumerateReceiptsForProductID:bundleID:usingBlock:]( self,  "enumerateReceiptsForProductID:bundleID:usingBlock:",  v18,  v12,  v21);
      if ([(id)v23[5] length])
      {
        if (a6) {
          *a6 = v18;
        }
        id v17 = (id)v23[5];
      }

      else
      {
        if (qword_10032E2A0 != -1) {
          dispatch_once(&qword_10032E2A0, &stru_1002E81E8);
        }
        if (os_log_type_enabled((os_log_t)qword_10032E280, OS_LOG_TYPE_ERROR)) {
          sub_10025DF4C();
        }
        id v17 = 0LL;
      }

      _Block_object_dispose(&v22, 8);
    }

    else
    {
      if (qword_10032E2A0 != -1) {
        dispatch_once(&qword_10032E2A0, &stru_1002E81E8);
      }
      if (os_log_type_enabled((os_log_t)qword_10032E280, OS_LOG_TYPE_ERROR)) {
        sub_10025DFAC((uint64_t)v11);
      }
      id v17 = 0LL;
    }
  }

  return v17;
}

- (void)_enumerateSubscriptionStatusForBundleID:(id)a3 alsoMatchingPredicate:(id)a4 ignoreEmptyStatus:(BOOL)a5 usingBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v13 = objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"bundle_id",  v10));
  id v14 = (void *)v13;
  if (v11)
  {
    v27[0] = v13;
    v27[1] = v11;
    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v27, 2LL));
    uint64_t v16 = objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v15));

    id v14 = (void *)v16;
  }

  v26[0] = @"subscription_group_id";
  v26[1] = @"last_updated";
  v26[2] = @"renewal_info";
  id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v26, 3LL));
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[InAppReceiptDatabaseSession connection](self, "connection"));
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryOnConnection:predicate:]( &OBJC_CLASS___InAppSubscriptionStatusDatabaseEntity,  "queryOnConnection:predicate:",  v18,  v14));

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  void v22[2] = sub_100031F2C;
  v22[3] = &unk_1002E81C8;
  v22[4] = self;
  id v23 = v10;
  BOOL v25 = a5;
  id v24 = v12;
  id v20 = v12;
  id v21 = v10;
  [v19 enumeratePersistentIDsAndProperties:v17 usingBlock:v22];
}

- (SQLiteConnection)connection
{
  return (SQLiteConnection *)objc_getProperty(self, a2, 8LL, 1);
}

- (void).cxx_destruct
{
}

@end