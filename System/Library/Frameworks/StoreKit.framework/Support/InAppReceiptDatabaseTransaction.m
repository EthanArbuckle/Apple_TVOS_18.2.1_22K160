@interface InAppReceiptDatabaseTransaction
- (BOOL)cacheLegacyTransactionsForBundleID:(id)a3 transactions:(id)a4 logKey:(id)a5;
- (BOOL)clearLegacyTransactionsLastUpdatedForBundleID:(id)a3;
- (BOOL)reconcileUnfinishedTransactionIDs:(id)a3 forBundleID:(id)a4 logKey:(id)a5;
- (BOOL)removeCachedLegacyTransactionWithID:(id)a3 forBundleID:(id)a4;
- (BOOL)removeCachedLegacyTransactionsForBundleID:(id)a3;
- (BOOL)removeReceiptsForBundleID:(id)a3;
- (BOOL)removeStatusesForBundleID:(id)a3;
- (BOOL)resetLegacyTransactionsLastUpdatedForBundleID:(id)a3;
- (BOOL)setAppTransaction:(id)a3 forBundleID:(id)a4 bundleVersion:(id)a5 token:(id)a6;
- (BOOL)setFinishedForTransactionID:(id)a3 bundleID:(id)a4 logKey:(id)a5;
- (BOOL)setLegacyTransactionsLastUpdatedForBundleID:(id)a3 token:(id)a4;
- (BOOL)setRevision:(id)a3 includesFinishedConsumables:(BOOL)a4 token:(id)a5 forBundleID:(id)a6;
- (BOOL)setSubscriptionRenewalInfo:(id)a3 forGroupID:(id)a4 bundleID:(id)a5 gracePeriodExpirationDate:(id)a6 logKey:(id)a7;
- (BOOL)setTransactionInfo:(id)a3 unfinishedIDs:(id)a4 forBundleID:(id)a5 logKey:(id)a6 containsSubscriptions:(BOOL *)a7;
@end

@implementation InAppReceiptDatabaseTransaction

- (BOOL)cacheLegacyTransactionsForBundleID:(id)a3 transactions:(id)a4 logKey:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v38 = a5;
  v40 = v7;
  if (v7)
  {
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    __int128 v43 = 0u;
    __int128 v44 = 0u;
    id v9 = [v8 countByEnumeratingWithState:&v43 objects:v53 count:16];
    if (v9)
    {
      id v11 = v9;
      uint64_t v12 = *(void *)v44;
      unsigned __int8 v13 = 1;
      *(void *)&__int128 v10 = 138543874LL;
      __int128 v37 = v10;
      id obj = v8;
      do
      {
        v14 = 0LL;
        do
        {
          if (*(void *)v44 != v12) {
            objc_enumerationMutation(obj);
          }
          v15 = *(void **)(*((void *)&v43 + 1) + 8LL * (void)v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", @"tid", v37));
          if ([v16 length])
          {
            v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  12LL));
            [v17 setObject:v40 forKeyedSubscript:@"bundle_id"];
            [v17 setObject:v16 forKeyedSubscript:@"transaction_id"];
            v18 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:@"otid"]);
            [v17 setObject:v18 forKeyedSubscript:@"original_transaction_id"];

            v19 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:off_100328138[0]]);
            [v17 setObject:v19 forKeyedSubscript:@"product_id"];

            v20 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:off_100327F60[0]]);
            [v17 setObject:v20 forKeyedSubscript:@"item_id"];

            v21 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:@"odate"]);
            [v17 setObject:v21 forKeyedSubscript:@"transaction_date"];

            v22 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:@"date"]);
            [v17 setObject:v22 forKeyedSubscript:@"original_transaction_date"];

            v23 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:@"rcpt"]);
            [v17 setObject:v23 forKeyedSubscript:@"receipt"];

            v24 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:off_100328140[0]]);
            [v17 setObject:v24 forKeyedSubscript:@"quantity"];

            v25 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:off_100328148[0]]);
            [v17 setObject:v25 forKeyedSubscript:@"request_data"];

            v26 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:off_1003280A8[0]]);
            [v17 setObject:v26 forKeyedSubscript:@"transaction_receipt"];

            v27 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:@"assets"]);
            if (v27)
            {
              uint64_t v28 = objc_opt_class(&OBJC_CLASS___NSArray);
              if ((objc_opt_isKindOfClass(v27, v28) & 1) != 0)
              {
                id v42 = 0LL;
                v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v27,  1LL,  &v42));
                id v30 = v42;
                v31 = v30;
                if (!v29 || v30)
                {
                  if (qword_10032ECF8 != -1) {
                    dispatch_once(&qword_10032ECF8, &stru_1002E9C98);
                  }
                  v32 = (os_log_s *)qword_10032ECD8;
                  if (os_log_type_enabled((os_log_t)qword_10032ECD8, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = v37;
                    v48 = self;
                    __int16 v49 = 2114;
                    id v50 = v38;
                    __int16 v51 = 2114;
                    v52 = v31;
                    _os_log_error_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_ERROR,  "[%{public}@][%{public}@] Error caching assets: %{public}@",  buf,  0x20u);
                  }

                  unsigned __int8 v13 = 0;
                }

                [v17 setObject:v29 forKeyedSubscript:@"assets"];
              }
            }

            v33 = objc_alloc(&OBJC_CLASS___InAppPendingTransactionsDatabaseEntity);
            v34 = (void *)objc_claimAutoreleasedReturnValue(-[InAppReceiptDatabaseSession connection](self, "connection"));
            v35 = -[SQLiteEntity initWithPropertyValues:onConnection:]( v33,  "initWithPropertyValues:onConnection:",  v17,  v34);

            if ((v13 & 1) != 0) {
              unsigned __int8 v13 = -[SQLiteEntity existsInDatabase](v35, "existsInDatabase");
            }
            else {
              unsigned __int8 v13 = 0;
            }
          }

          v14 = (char *)v14 + 1;
        }

        while (v11 != v14);
        id v8 = obj;
        id v11 = [obj countByEnumeratingWithState:&v43 objects:v53 count:16];
      }

      while (v11);
    }

    else
    {
      unsigned __int8 v13 = 1;
    }
  }

  else
  {
    if (qword_10032ECF8 != -1) {
      dispatch_once(&qword_10032ECF8, &stru_1002E9C98);
    }
    if (os_log_type_enabled((os_log_t)qword_10032ECD8, OS_LOG_TYPE_ERROR)) {
      sub_10026307C();
    }
    unsigned __int8 v13 = 0;
  }

  return v13 & 1;
}

- (BOOL)clearLegacyTransactionsLastUpdatedForBundleID:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"bundle_id",  a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[InAppReceiptDatabaseSession connection](self, "connection"));
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryOnConnection:predicate:]( &OBJC_CLASS___InAppPendingTransactionsPropertiesDatabaseEntity,  "queryOnConnection:predicate:",  v5,  v4));

  LOBYTE(v5) = [v6 deleteAllEntities];
  return (char)v5;
}

- (BOOL)reconcileUnfinishedTransactionIDs:(id)a3 forBundleID:(id)a4 logKey:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  unsigned __int8 v29 = -[InAppReceiptDatabaseSession cacheIncludesFinishedConsumablesForBundleID:]( self,  "cacheIncludesFinishedConsumablesForBundleID:",  v10);
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:value:comparisonType:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:value:comparisonType:",  @"bundle_id",  v10,  1LL));

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"is_finished",  &__kCFBooleanFalse));
  if ([v8 count])
  {
    unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue([v8 allObjects]);
    id v28 = v9;
    v14 = v12;
    v15 = v11;
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteContainsPredicate containsPredicateWithProperty:values:]( &OBJC_CLASS___SQLiteContainsPredicate,  "containsPredicateWithProperty:values:",  @"transaction_id",  v13));

    v38[0] = v14;
    v38[1] = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v38, 2LL));
    v18 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAnyPredicates:",  v17));

    v37[0] = v15;
    v37[1] = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v37, 2LL));
    v20 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v19));

    id v11 = v15;
    uint64_t v12 = v14;
    id v9 = v28;
  }

  else
  {
    v36[0] = v11;
    v36[1] = v12;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v36, 2LL));
    v20 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v21));
  }

  v35[0] = @"transaction_id";
  v35[1] = @"product_type";
  v35[2] = @"is_finished";
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v35, 3LL));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[InAppReceiptDatabaseSession connection](self, "connection"));
  v24 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryOnConnection:predicate:]( &OBJC_CLASS___InAppTransactionEntity,  "queryOnConnection:predicate:",  v23,  v20));

  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = sub_10006C1B8;
  v30[3] = &unk_1002E9C50;
  id v31 = v8;
  v32 = self;
  unsigned __int8 v34 = v29;
  id v33 = v9;
  id v25 = v9;
  id v26 = v8;
  [v24 enumeratePersistentIDsAndProperties:v22 usingBlock:v30];

  return 1;
}

- (BOOL)removeCachedLegacyTransactionsForBundleID:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"bundle_id",  a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[InAppReceiptDatabaseSession connection](self, "connection"));
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryOnConnection:predicate:]( &OBJC_CLASS___InAppPendingTransactionsDatabaseEntity,  "queryOnConnection:predicate:",  v5,  v4));

  LOBYTE(v5) = [v6 deleteAllEntities];
  return (char)v5;
}

- (BOOL)removeCachedLegacyTransactionWithID:(id)a3 forBundleID:(id)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"bundle_id",  a4));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"transaction_id",  v6));

  v14[0] = v7;
  v14[1] = v8;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v14, 2LL));
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v9));

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[InAppReceiptDatabaseSession connection](self, "connection"));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryOnConnection:predicate:]( &OBJC_CLASS___InAppPendingTransactionsDatabaseEntity,  "queryOnConnection:predicate:",  v11,  v10));

  LOBYTE(v11) = [v12 deleteAllEntities];
  return (char)v11;
}

- (BOOL)removeReceiptsForBundleID:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"bundle_id",  v4));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[InAppReceiptDatabaseSession connection](self, "connection"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryOnConnection:predicate:]( &OBJC_CLASS___InAppReceiptPropertiesDatabaseEntity,  "queryOnConnection:predicate:",  v6,  v5));

  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"bundle_id",  v4));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[InAppReceiptDatabaseSession connection](self, "connection"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryOnConnection:predicate:]( &OBJC_CLASS___InAppTransactionEntity,  "queryOnConnection:predicate:",  v9,  v8));

  else {
    unsigned __int8 v11 = 0;
  }

  return v11;
}

- (BOOL)removeStatusesForBundleID:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"bundle_id",  a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[InAppReceiptDatabaseSession connection](self, "connection"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryOnConnection:predicate:]( &OBJC_CLASS___InAppSubscriptionStatusDatabaseEntity,  "queryOnConnection:predicate:",  v5,  v4));

  LOBYTE(v5) = [v6 deleteAllEntities];
  return (char)v5;
}

- (BOOL)setAppTransaction:(id)a3 forBundleID:(id)a4 bundleVersion:(id)a5 token:(id)a6
{
  v20[0] = @"bundle_id";
  v20[1] = @"bundle_version";
  v21[0] = a4;
  v21[1] = a5;
  v20[2] = @"last_updated";
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  v21[2] = v14;
  v21[3] = v13;
  v20[3] = @"receipt";
  v20[4] = @"token";
  v21[4] = v10;
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v21,  v20,  5LL));

  v16 = objc_alloc(&OBJC_CLASS___AppTransactionDatabaseEntity);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[InAppReceiptDatabaseSession connection](self, "connection"));
  v18 = -[SQLiteEntity initWithPropertyValues:onConnection:](v16, "initWithPropertyValues:onConnection:", v15, v17);

  LOBYTE(v17) = -[SQLiteEntity existsInDatabase](v18, "existsInDatabase");
  return (char)v17;
}

- (BOOL)setFinishedForTransactionID:(id)a3 bundleID:(id)a4 logKey:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  unsigned __int8 v11 = -[InAppReceiptDatabaseSession cacheIncludesFinishedConsumablesForBundleID:]( self,  "cacheIncludesFinishedConsumablesForBundleID:",  v9);
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:value:comparisonType:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:value:comparisonType:",  @"bundle_id",  v9,  1LL));

  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:value:comparisonType:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:value:comparisonType:",  @"transaction_id",  v10,  1LL));
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:value:comparisonType:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:value:comparisonType:",  @"is_finished",  &__kCFBooleanFalse,  1LL));
  v26[0] = v12;
  v26[1] = v13;
  v26[2] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v26, 3LL));
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v15));

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[InAppReceiptDatabaseSession connection](self, "connection"));
  v18 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryOnConnection:predicate:]( &OBJC_CLASS___InAppTransactionEntity,  "queryOnConnection:predicate:",  v17,  v16));

  id v25 = @"product_type";
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v25, 1LL));
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_10006CAB0;
  v22[3] = &unk_1002E9C78;
  unsigned __int8 v24 = v11;
  v22[4] = self;
  id v23 = v8;
  id v20 = v8;
  [v18 enumeratePersistentIDsAndProperties:v19 usingBlock:v22];

  return 1;
}

- (BOOL)setLegacyTransactionsLastUpdatedForBundleID:(id)a3 token:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  3LL));
  [v8 setObject:v7 forKeyedSubscript:@"bundle_id"];

  [v8 setObject:v6 forKeyedSubscript:@"token"];
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  [v8 setObject:v9 forKeyedSubscript:@"last_updated"];

  id v10 = objc_alloc(&OBJC_CLASS___InAppPendingTransactionsPropertiesDatabaseEntity);
  unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue(-[InAppReceiptDatabaseSession connection](self, "connection"));
  id v12 = -[SQLiteEntity initWithPropertyValues:onConnection:](v10, "initWithPropertyValues:onConnection:", v8, v11);

  LOBYTE(v11) = -[SQLiteEntity existsInDatabase](v12, "existsInDatabase");
  return (char)v11;
}

- (BOOL)resetLegacyTransactionsLastUpdatedForBundleID:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"bundle_id",  a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[InAppReceiptDatabaseSession connection](self, "connection"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity anyOnConnection:predicate:]( &OBJC_CLASS___InAppPendingTransactionsPropertiesDatabaseEntity,  "anyOnConnection:predicate:",  v5,  v4));

  uint64_t v7 = objc_opt_class(&OBJC_CLASS___InAppPendingTransactionsPropertiesDatabaseEntity);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](&OBJC_CLASS___NSDate, "distantPast"));
    unsigned __int8 v9 = [v6 setValue:v8 forProperty:@"last_updated"];
  }

  else
  {
    unsigned __int8 v9 = 1;
  }

  return v9;
}

- (BOOL)setTransactionInfo:(id)a3 unfinishedIDs:(id)a4 forBundleID:(id)a5 logKey:(id)a6 containsSubscriptions:(BOOL *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v67 = a5;
  id v62 = a6;
  if (a7) {
    *a7 = 0;
  }
  __int128 v73 = 0u;
  __int128 v74 = 0u;
  __int128 v71 = 0u;
  __int128 v72 = 0u;
  id v14 = v12;
  id v68 = [v14 countByEnumeratingWithState:&v71 objects:v79 count:16];
  if (!v68)
  {
    LOBYTE(v17) = 1;
    goto LABEL_65;
  }

  v61 = a7;
  uint64_t v16 = *(void *)v72;
  *(void *)&__int128 v15 = 138543362LL;
  __int128 v60 = v15;
  v64 = self;
  LODWORD(v17) = 1;
  id v65 = v14;
  id v66 = v13;
  uint64_t v63 = *(void *)v72;
  while (2)
  {
    v18 = 0LL;
    do
    {
      int v69 = (int)v17;
      if (*(void *)v72 != v16) {
        objc_enumerationMutation(v14);
      }
      v19 = *(void **)(*((void *)&v71 + 1) + 8LL * (void)v18);
      id v70 = 0LL;
      id v20 = sub_100025C04(v19, (uint64_t)&v70);
      v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      id v22 = v70;
      if (v22)
      {
        id v23 = v22;
        if (qword_10032ECF8 != -1) {
          dispatch_once(&qword_10032ECF8, &stru_1002E9C98);
        }
        unsigned __int8 v24 = (os_log_s *)qword_10032ECD8;
        if (os_log_type_enabled((os_log_t)qword_10032ECD8, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          id v76 = v62;
          __int16 v77 = 2114;
          v78 = v23;
          _os_log_error_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "[%{public}@] Error parsing payload from transaction: %{public}@",  buf,  0x16u);
        }

        LODWORD(v17) = 0;
        id v25 = v21;
        goto LABEL_49;
      }

      id v25 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKeyedSubscript:@"transactionId"]);
      uint64_t v26 = objc_opt_class(&OBJC_CLASS___NSString);
      if ((objc_opt_isKindOfClass(v25, v26) & 1) == 0)
      {
        if (qword_10032ECF8 != -1) {
          dispatch_once(&qword_10032ECF8, &stru_1002E9C98);
        }
        __int128 v37 = (os_log_s *)qword_10032ECD8;
        if (os_log_type_enabled((os_log_t)qword_10032ECD8, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v60;
          id v76 = v62;
          _os_log_error_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_ERROR,  "[%{public}@] Invalid transaction payload. ID = nil",  buf,  0xCu);
        }

        LODWORD(v17) = 0;
        id v23 = v21;
        goto LABEL_49;
      }

      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
      [v27 setObject:v25 forKeyedSubscript:@"transaction_id"];
      id v28 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKeyedSubscript:@"bundleId"]);
      [v27 setObject:v28 forKeyedSubscript:@"bundle_id"];

      unsigned __int8 v29 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKeyedSubscript:@"productId"]);
      [v27 setObject:v29 forKeyedSubscript:@"product_id"];

      uint64_t v30 = objc_claimAutoreleasedReturnValue([v21 objectForKeyedSubscript:@"isUpgraded"]);
      id v31 = (void *)v30;
      if (v30) {
        v32 = (void *)v30;
      }
      else {
        v32 = &__kCFBooleanFalse;
      }
      objc_msgSend(v27, "setObject:forKeyedSubscript:", v32, @"is_upgraded", v60);

      if (v13)
      {
        id v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [v13 containsObject:v25] ^ 1));
        [v27 setObject:v33 forKeyedSubscript:@"is_finished"];
      }

      unsigned __int8 v34 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKeyedSubscript:@"type"]);
      if ([v34 isEqual:@"Consumable"])
      {
        v35 = v27;
        v36 = &off_1003028A0;
      }

      else if ([v34 isEqual:@"Non-Consumable"])
      {
        v35 = v27;
        v36 = &off_1003028B8;
      }

      else
      {
        if ([v34 isEqual:@"Auto-Renewable Subscription"])
        {
          [v27 setObject:&off_1003028D0 forKeyedSubscript:@"product_type"];
          if (v61) {
            BOOL *v61 = 1;
          }
          goto LABEL_30;
        }

        if ([v34 isEqual:@"Non-Renewing Subscription"])
        {
          v35 = v27;
          v36 = &off_1003028E8;
        }

        else
        {
          v35 = v27;
          v36 = &off_100302900;
        }
      }

      [v35 setObject:v36 forKeyedSubscript:@"product_type"];
LABEL_30:
      id v38 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKeyedSubscript:@"purchaseDate"]);
      uint64_t v39 = objc_opt_class(&OBJC_CLASS___NSNumber);
      if ((objc_opt_isKindOfClass(v38, v39) & 1) != 0)
      {
        v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSince1970:]( NSDate,  "dateWithTimeIntervalSince1970:",  (double)(uint64_t)[v38 longLongValue] / 1000.0));
        [v27 setObject:v40 forKeyedSubscript:@"transaction_date"];
      }

      v41 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKeyedSubscript:@"revocationDate"]);

      uint64_t v42 = objc_opt_class(&OBJC_CLASS___NSNumber);
      if ((objc_opt_isKindOfClass(v41, v42) & 1) != 0)
      {
        __int128 v43 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSince1970:]( NSDate,  "dateWithTimeIntervalSince1970:",  (double)(uint64_t)[v41 longLongValue] / 1000.0));
        [v27 setObject:v43 forKeyedSubscript:@"revocation_date"];
      }

      __int128 v44 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKeyedSubscript:@"expiresDate"]);

      uint64_t v45 = objc_opt_class(&OBJC_CLASS___NSNumber);
      if ((objc_opt_isKindOfClass(v44, v45) & 1) != 0)
      {
        __int128 v46 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSince1970:]( NSDate,  "dateWithTimeIntervalSince1970:",  (double)(uint64_t)[v44 longLongValue] / 1000.0));
        [v27 setObject:v46 forKeyedSubscript:@"expiration_date"];
      }

      [v27 setObject:v19 forKeyedSubscript:@"receipt"];
      v17 = (void *)objc_claimAutoreleasedReturnValue( -[InAppReceiptDatabaseSession transactionForID:bundleID:]( self,  "transactionForID:bundleID:",  v25,  v67));
      if (v17)
      {
        if (qword_10032ECF8 != -1) {
          dispatch_once(&qword_10032ECF8, &stru_1002E9C98);
        }
        v47 = (os_log_s *)qword_10032ECD8;
        if (os_log_type_enabled((os_log_t)qword_10032ECD8, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138543619;
          id v76 = v62;
          __int16 v77 = 2113;
          v78 = v25;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_DEBUG,  "[%{public}@] Updating transaction info for %{private}@",  buf,  0x16u);
        }

        v48 = objc_alloc(&OBJC_CLASS___InAppTransactionEntity);
        id v49 = [v17 databaseID];
        id v50 = (void *)objc_claimAutoreleasedReturnValue(-[InAppReceiptDatabaseSession connection](self, "connection"));
        __int16 v51 = -[SQLiteEntity initWithPersistentID:onConnection:](v48, "initWithPersistentID:onConnection:", v49, v50);

        unsigned int v52 = -[SQLiteEntity setValuesWithDictionary:](v51, "setValuesWithDictionary:", v27);
      }

      else
      {
        if (qword_10032ECF8 != -1) {
          dispatch_once(&qword_10032ECF8, &stru_1002E9C98);
        }
        v53 = (os_log_s *)qword_10032ECD8;
        if (os_log_type_enabled((os_log_t)qword_10032ECD8, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138543619;
          id v76 = v62;
          __int16 v77 = 2113;
          v78 = v25;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_DEBUG,  "[%{public}@] Writing new transaction info for %{private}@",  buf,  0x16u);
        }

        v54 = objc_alloc(&OBJC_CLASS___InAppTransactionEntity);
        v55 = (void *)objc_claimAutoreleasedReturnValue(-[InAppReceiptDatabaseSession connection](self, "connection"));
        __int16 v51 = -[SQLiteEntity initWithPropertyValues:onConnection:]( v54,  "initWithPropertyValues:onConnection:",  v27,  v55);

        unsigned int v52 = -[SQLiteEntity existsInDatabase](v51, "existsInDatabase");
      }

      unsigned int v56 = v52;

      if ((v69 & v56 & 1) == 0)
      {
        if (qword_10032ECF8 != -1) {
          dispatch_once(&qword_10032ECF8, &stru_1002E9C98);
        }
        v58 = (os_log_s *)qword_10032ECD8;
        if (os_log_type_enabled((os_log_t)qword_10032ECD8, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543619;
          id v76 = v62;
          __int16 v77 = 2113;
          v78 = v25;
          _os_log_error_impl( (void *)&_mh_execute_header,  v58,  OS_LOG_TYPE_ERROR,  "[%{public}@] Could not write transaction info for %{private}@",  buf,  0x16u);
        }

        LOBYTE(v17) = 0;
        id v14 = v65;
        id v13 = v66;
        goto LABEL_65;
      }

      LODWORD(v17) = 1;
      id v23 = v21;
      id v14 = v65;
      id v13 = v66;
      uint64_t v16 = v63;
      self = v64;
LABEL_49:

      v18 = (char *)v18 + 1;
    }

    while (v68 != v18);
    id v57 = [v14 countByEnumeratingWithState:&v71 objects:v79 count:16];
    id v68 = v57;
    if (v57) {
      continue;
    }
    break;
  }

- (BOOL)setRevision:(id)a3 includesFinishedConsumables:(BOOL)a4 token:(id)a5 forBundleID:(id)a6
{
  BOOL v7 = a4;
  v21[0] = a6;
  v20[0] = @"bundle_id";
  v20[1] = @"finished_consumables";
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v7));
  v21[1] = v13;
  v21[2] = v12;
  v20[2] = @"revision";
  v20[3] = @"token";
  v21[3] = v11;
  v20[4] = @"last_updated";
  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  v21[4] = v14;
  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v21,  v20,  5LL));

  uint64_t v16 = objc_alloc(&OBJC_CLASS___InAppReceiptPropertiesDatabaseEntity);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[InAppReceiptDatabaseSession connection](self, "connection"));
  v18 = -[SQLiteEntity initWithPropertyValues:onConnection:](v16, "initWithPropertyValues:onConnection:", v15, v17);

  LOBYTE(v17) = -[SQLiteEntity existsInDatabase](v18, "existsInDatabase");
  return (char)v17;
}

- (BOOL)setSubscriptionRenewalInfo:(id)a3 forGroupID:(id)a4 bundleID:(id)a5 gracePeriodExpirationDate:(id)a6 logKey:(id)a7
{
  id v11 = a3;
  id v36 = a4;
  id v38 = a5;
  id v37 = a6;
  id v35 = a7;
  id v12 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  id obj = v11;
  id v13 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v42;
    do
    {
      for (i = 0LL; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v42 != v15) {
          objc_enumerationMutation(obj);
        }
        v17 = *(void **)(*((void *)&v41 + 1) + 8LL * (void)i);
        v18 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
        v19 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:@"status"]);
        -[NSMutableDictionary setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v19, @"status");

        id v20 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:@"signedRenewalInfo"]);
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v18,  "setObject:forKeyedSubscript:",  v20,  @"signedRenewalInfo");

        -[NSMutableArray addObject:](v12, "addObject:", v18);
      }

      id v14 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
    }

    while (v14);
  }

  id v40 = 0LL;
  v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v12,  1LL,  &v40));
  id v22 = v40;
  if (v22)
  {
    unsigned __int8 v24 = v37;
    id v23 = v38;
    if (qword_10032ECF8 != -1) {
      dispatch_once(&qword_10032ECF8, &stru_1002E9C98);
    }
    id v25 = v35;
    uint64_t v26 = v36;
    if (os_log_type_enabled((os_log_t)qword_10032ECD8, OS_LOG_TYPE_ERROR)) {
      sub_1002631A4();
    }
    unsigned __int8 v27 = 0;
  }

  else
  {
    id v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  5LL));
    id v23 = v38;
    [v28 setObject:v38 forKeyedSubscript:@"bundle_id"];
    uint64_t v26 = v36;
    [v28 setObject:v36 forKeyedSubscript:@"subscription_group_id"];
    unsigned __int8 v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
    [v28 setObject:v29 forKeyedSubscript:@"last_updated"];

    [v28 setObject:v21 forKeyedSubscript:@"renewal_info"];
    unsigned __int8 v24 = v37;
    [v28 setObject:v37 forKeyedSubscript:@"grace_period_expiration_date"];
    uint64_t v30 = objc_alloc(&OBJC_CLASS___InAppSubscriptionStatusDatabaseEntity);
    id v31 = (void *)objc_claimAutoreleasedReturnValue(-[InAppReceiptDatabaseSession connection](self, "connection"));
    v32 = -[SQLiteEntity initWithPropertyValues:onConnection:](v30, "initWithPropertyValues:onConnection:", v28, v31);

    unsigned __int8 v27 = -[SQLiteEntity existsInDatabase](v32, "existsInDatabase");
    id v25 = v35;
  }

  return v27;
}

@end