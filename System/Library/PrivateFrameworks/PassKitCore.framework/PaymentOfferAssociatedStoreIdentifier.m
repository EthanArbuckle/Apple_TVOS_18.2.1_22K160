@interface PaymentOfferAssociatedStoreIdentifier
+ (id)_associatedStoreIdentifiersWithQuery:(id)a3;
+ (id)_commonDictionaryAssociatedStoreIdentifier:(id)a3;
+ (id)_predicateForInstallmentCriteriaPID:(int64_t)a3;
+ (id)associatedStoreIdentifiersForInstallmentCriteriaPID:(int64_t)a3 inDatabase:(id)a4;
+ (id)databaseTable;
+ (void)deletePaymentOfferCurrencyAmountForInstallmentCriteriaPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)insertOrUpdateAssociatedStoreIdentifiers:(id)a3 forInstallmentCriteriaPID:(int64_t)a4 inDatabase:(id)a5;
@end

@implementation PaymentOfferAssociatedStoreIdentifier

+ (id)databaseTable
{
  return @"dog";
}

+ (void)insertOrUpdateAssociatedStoreIdentifiers:(id)a3 forInstallmentCriteriaPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  [a1 deletePaymentOfferCurrencyAmountForInstallmentCriteriaPID:a4 inDatabase:v9];
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id obj = v8;
  id v10 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    id v12 = v10;
    uint64_t v13 = *(void *)v20;
    do
    {
      v14 = 0LL;
      do
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(obj);
        }
        id v15 = objc_msgSend( (id)objc_opt_class(a1, v11),  "_commonDictionaryAssociatedStoreIdentifier:",  *(void *)(*((void *)&v19 + 1) + 8 * (void)v14));
        v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
        [v16 safelySetObject:v17 forKey:@"i_pid"];

        v14 = (char *)v14 + 1;
      }

      while (v12 != v14);
      id v12 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }

    while (v12);
  }
}

+ (void)deletePaymentOfferCurrencyAmountForInstallmentCriteriaPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForInstallmentCriteriaPID:a3]);
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);

  [v8 deleteAllEntities];
}

+ (id)associatedStoreIdentifiersForInstallmentCriteriaPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForInstallmentCriteriaPID:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _associatedStoreIdentifiersWithQuery:v8]);
  return v9;
}

+ (id)_associatedStoreIdentifiersWithQuery:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  uint64_t v11 = @"a";
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v11, 1LL));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000D8A3C;
  v9[3] = &unk_10063C0D0;
  id v6 = v4;
  id v10 = v6;
  [v3 enumeratePersistentIDsAndProperties:v5 usingBlock:v9];

  if (-[NSMutableSet count](v6, "count")) {
    id v7 = -[NSMutableSet copy](v6, "copy");
  }
  else {
    id v7 = 0LL;
  }

  return v7;
}

+ (id)_predicateForInstallmentCriteriaPID:(int64_t)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"i_pid",  v3));

  return v4;
}

+ (id)_commonDictionaryAssociatedStoreIdentifier:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v3, @"a");

  return v4;
}

@end