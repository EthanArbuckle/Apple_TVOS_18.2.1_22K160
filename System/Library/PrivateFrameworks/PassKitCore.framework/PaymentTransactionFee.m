@interface PaymentTransactionFee
+ (id)_feesFromFeeItems:(id)a3;
+ (id)_paymentTransactionFeesInDatabase:(id)a3 matchingPredicate:(id)a4;
+ (id)_paymentTransactionFeesWithQuery:(id)a3;
+ (id)_predicateForFeeWithIdentifier:(id)a3;
+ (id)_predicateForPaymentTransaction:(id)a3;
+ (id)_predicateForPaymentTransactionIdentifier:(id)a3;
+ (id)_predicateForPaymentTransactionPID:(int64_t)a3;
+ (id)_predicateForPaymentTransactionPIDs:(id)a3;
+ (id)_propertySettersForPaymentTransactionFeeItem;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)paymentTransactionFeesInDatabase:(id)a3 forPaymentTransaction:(id)a4;
+ (id)paymentTransactionFeesInDatabase:(id)a3 forPaymentTransactionIdentifier:(id)a4;
+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4;
+ (void)associateFeesToPaymentTransactions:(id)a3 inDatabase:(id)a4;
+ (void)deleteEntitiesForPaymentTransaction:(id)a3 inDatabase:(id)a4;
+ (void)deleteEntitiesForPaymentTransactionPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)updatePaymentTransactionFees:(id)a3 forPaymentTransaction:(id)a4 inDatabase:(id)a5;
- (PaymentTransactionFee)initWithPaymentTransactionFeeItem:(id)a3 paymentTransaction:(id)a4 inDatabase:(id)a5;
- (id)feeItem;
- (void)updateWithPaymentTransactionFeeItem:(id)a3;
@end

@implementation PaymentTransactionFee

- (PaymentTransactionFee)initWithPaymentTransactionFeeItem:(id)a3 paymentTransaction:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v10 currencyAmount]);
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 amount]);
  uint64_t v14 = PKCurrencyDecimalToStorageNumber(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

  v16 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);
  [v11 setObjectOrNull:v16 forKey:@"identifier"];

  objc_msgSend(v11, "setInteger:forKey:", objc_msgSend(v10, "type"), @"type");
  v17 = (void *)objc_claimAutoreleasedReturnValue([v10 currencyAmount]);
  v18 = (void *)objc_claimAutoreleasedReturnValue([v17 currency]);
  [v11 setObjectOrNull:v18 forKey:@"currency"];

  [v11 setObjectOrNull:v15 forKey:@"amount"];
  v19 = (void *)objc_claimAutoreleasedReturnValue([v10 localizedDisplayName]);

  [v11 setObjectOrNull:v19 forKey:@"localized_display_name"];
  id v20 = [v9 persistentID];

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v20));
  [v11 setObject:v21 forKey:@"payment_transaction_pid"];

  v22 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v11, v8);
  return v22;
}

+ (id)databaseTable
{
  return @"payment_transaction_fee";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class(&OBJC_CLASS___PaymentTransaction, a2) == a3) {
    return @"payment_transaction_pid";
  }
  else {
    return 0LL;
  }
}

+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4
{
  id v5 = a4;
  id v9 = @"payment_transaction.identifier";
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL));
  unsigned int v8 = objc_msgSend(v7, "containsObject:", v6, v9);

  if (v8) {
    [v5 addObject:@"JOIN payment_transaction ON payment_transaction.pid = payment_transaction_fee.payment_transaction_pid"];
  }
}

- (void)updateWithPaymentTransactionFeeItem:(id)a3
{
  id v4 = a3;
  id v13 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 currencyAmount]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 amount]);
  uint64_t v7 = PKCurrencyDecimalToStorageNumber(v6);
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 currencyAmount]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 currency]);
  [v13 setObjectOrNull:v10 forKey:@"currency"];

  v11 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedDisplayName]);
  [v13 setObjectOrNull:v11 forKey:@"localized_display_name"];

  [v13 setObjectOrNull:v8 forKey:@"amount"];
  id v12 = [v4 type];

  [v13 setInteger:v12 forKey:@"type"];
  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v13);
}

+ (void)updatePaymentTransactionFees:(id)a3 forPaymentTransaction:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v38 = a5;
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  v34 = v9;
  v36 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPaymentTransaction:v9]);
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  v33 = v8;
  id obj = (id)objc_claimAutoreleasedReturnValue([v8 fees]);
  id v10 = [obj countByEnumeratingWithState:&v39 objects:v47 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v40;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v40 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void **)(*((void *)&v39 + 1) + 8LL * (void)i);
        v15 = (void *)objc_claimAutoreleasedReturnValue([v14 identifier]);
        v16 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForFeeWithIdentifier:v15]);
        v46[0] = v16;
        v46[1] = v36;
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v46, 2LL));
        v18 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v17));
        id v19 = (id)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v38 predicate:v18]);

        uint64_t Object = PKLogFacilityTypeGetObject(11LL);
        v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
        BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
        if (v19)
        {
          if (v22)
          {
            v23 = (void *)objc_claimAutoreleasedReturnValue([v14 identifier]);
            *(_DWORD *)buf = 138412290;
            v45 = v23;
            _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Updating payment transaction fee with identifier: %@",  buf,  0xCu);
          }

          [v19 updateWithPaymentTransactionFeeItem:v14];
        }

        else
        {
          if (v22)
          {
            v24 = (void *)objc_claimAutoreleasedReturnValue([v14 identifier]);
            *(_DWORD *)buf = 138412290;
            v45 = v24;
            _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Inserting payment transaction fee with identifier: %@",  buf,  0xCu);
          }

          id v19 = [objc_alloc((Class)a1) initWithPaymentTransactionFeeItem:v14 paymentTransaction:v34 inDatabase:v38];
        }

        v25 = (void *)objc_claimAutoreleasedReturnValue([v14 identifier]);
        [v37 addObject:v25];
      }

      id v11 = [obj countByEnumeratingWithState:&v39 objects:v47 count:16];
    }

    while (v11);
  }

  v26 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteContainsPredicate doesNotContainPredicateWithProperty:values:]( &OBJC_CLASS___SQLiteContainsPredicate,  "doesNotContainPredicateWithProperty:values:",  @"identifier",  v37));
  v43[0] = v26;
  v43[1] = v36;
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v43, 2LL));
  v28 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v27));

  v29 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v38 predicate:v28]);
  if (([v29 deleteAllEntities] & 1) == 0)
  {
    uint64_t v30 = PKLogFacilityTypeGetObject(11LL);
    v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue([v34 identifier]);
      *(_DWORD *)buf = 138412290;
      v45 = v32;
      _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "Failed to delete obsolete payment transaction fees for %@",  buf,  0xCu);
    }
  }
}

+ (void)deleteEntitiesForPaymentTransaction:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForPaymentTransaction:a3]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

+ (void)deleteEntitiesForPaymentTransactionPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForPaymentTransactionPID:a3]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

+ (id)paymentTransactionFeesInDatabase:(id)a3 forPaymentTransaction:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPaymentTransaction:a4]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _paymentTransactionFeesInDatabase:v6 matchingPredicate:v7]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _feesFromFeeItems:v8]);
  return v9;
}

+ (id)paymentTransactionFeesInDatabase:(id)a3 forPaymentTransactionIdentifier:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPaymentTransactionIdentifier:a4]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _paymentTransactionFeesInDatabase:v6 matchingPredicate:v7]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _feesFromFeeItems:v8]);
  return v9;
}

+ (void)associateFeesToPaymentTransactions:(id)a3 inDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v30 = v6;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPaymentTransactionPIDs:v8]);
  v29 = v7;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryWithDatabase:predicate:]( &OBJC_CLASS___PaymentTransactionFee,  "queryWithDatabase:predicate:",  v7,  v9));

  id v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([a1 _propertySettersForPaymentTransactionFeeItem]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 allKeys]);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 arrayByAddingObject:@"payment_transaction_pid"]);
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472LL;
  v35[2] = sub_1003969AC;
  v35[3] = &unk_100639BF0;
  id v38 = a1;
  id v27 = v12;
  id v36 = v27;
  v15 = v11;
  v37 = v15;
  v28 = v10;
  [v10 enumeratePersistentIDsAndProperties:v14 usingBlock:v35];

  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  v16 = v15;
  id v17 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v16,  "countByEnumeratingWithState:objects:count:",  &v31,  v39,  16LL);
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v32;
    do
    {
      for (i = 0LL; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v32 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void *)(*((void *)&v31 + 1) + 8LL * (void)i);
        BOOL v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKey:", v21, v27));
        id v23 = objc_alloc(&OBJC_CLASS___PKPaymentTransactionFees);
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v16, "objectForKey:", v21));
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v24));
        id v26 = [v23 initWithFeeItems:v25];
        [v22 setFees:v26];
      }

      id v18 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v16,  "countByEnumeratingWithState:objects:count:",  &v31,  v39,  16LL);
    }

    while (v18);
  }
}

- (id)feeItem
{
  v3 = objc_alloc_init(&OBJC_CLASS___PKPaymentTransactionFeeItem);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[PaymentTransactionFee _propertySettersForPaymentTransactionFeeItem]( &OBJC_CLASS___PaymentTransactionFee,  "_propertySettersForPaymentTransactionFeeItem"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allKeys]);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100396C04;
  v11[3] = &unk_100639EE8;
  id v12 = v4;
  id v6 = v3;
  id v13 = v6;
  id v7 = v4;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v5, v11);

  id v8 = v13;
  id v9 = v6;

  return v9;
}

+ (id)_paymentTransactionFeesInDatabase:(id)a3 matchingPredicate:(id)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryWithDatabase:predicate:]( &OBJC_CLASS___PaymentTransactionFee,  "queryWithDatabase:predicate:",  a3,  a4));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a1 _paymentTransactionFeesWithQuery:v5]);

  return v6;
}

+ (id)_paymentTransactionFeesWithQuery:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([a1 _propertySettersForPaymentTransactionFeeItem]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 allKeys]);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100396E58;
  v12[3] = &unk_100639BF0;
  id v14 = v6;
  id v15 = a1;
  id v13 = v5;
  id v8 = v6;
  id v9 = v5;
  [v4 enumeratePersistentIDsAndProperties:v7 usingBlock:v12];

  id v10 = [v8 copy];
  return v10;
}

+ (id)_predicateForFeeWithIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"identifier",  a3);
}

+ (id)_predicateForPaymentTransactionPID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"payment_transaction_pid",  v3));

  return v4;
}

+ (id)_predicateForPaymentTransactionIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"payment_transaction.identifier",  a3);
}

+ (id)_predicateForPaymentTransaction:(id)a3
{
  return objc_msgSend(a1, "_predicateForPaymentTransactionPID:", objc_msgSend(a3, "persistentID"));
}

+ (id)_feesFromFeeItems:(id)a3
{
  id v3 = a3;
  if ([v3 count]) {
    id v4 = [[PKPaymentTransactionFees alloc] initWithFeeItems:v3];
  }
  else {
    id v4 = 0LL;
  }

  return v4;
}

+ (id)_predicateForPaymentTransactionPIDs:(id)a3
{
  return +[SQLiteContainsPredicate containsPredicateWithProperty:values:]( &OBJC_CLASS___SQLiteContainsPredicate,  "containsPredicateWithProperty:values:",  @"payment_transaction_pid",  a3);
}

+ (id)_propertySettersForPaymentTransactionFeeItem
{
  v3[0] = @"identifier";
  v3[1] = @"type";
  v4[0] = &stru_100659A90;
  v4[1] = &stru_100659AB0;
  v3[2] = @"localized_display_name";
  v3[3] = @"currency";
  v4[2] = &stru_100659AD0;
  v4[3] = &stru_100659AF0;
  v3[4] = @"amount";
  v4[4] = &stru_100659B10;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  5LL));
}

@end