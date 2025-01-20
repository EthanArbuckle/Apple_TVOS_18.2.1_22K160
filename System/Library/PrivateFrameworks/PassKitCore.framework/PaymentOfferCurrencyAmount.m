@interface PaymentOfferCurrencyAmount
+ (id)_commonDictionaryForCurrencyAmount:(id)a3;
+ (id)_currencyAmountForCriteriaPID:(int64_t)a3 criteriaType:(unint64_t)a4 amountType:(unint64_t)a5 inDatabase:(id)a6;
+ (id)_currencyAmountsWithQuery:(id)a3;
+ (id)_predicateForCriteriaPID:(int64_t)a3 criteriaType:(unint64_t)a4;
+ (id)_predicateForCriteriaPID:(int64_t)a3 criteriaType:(unint64_t)a4 amountType:(unint64_t)a5;
+ (id)currencyAmountForInstallmentCriteriaPID:(int64_t)a3 type:(unint64_t)a4 inDatabase:(id)a5;
+ (id)currencyAmountForRewardsCriteriaPID:(int64_t)a3 type:(unint64_t)a4 inDatabase:(id)a5;
+ (id)databaseTable;
+ (void)_deletePaymentOfferCurrencyAmountForCriteriaPID:(int64_t)a3 criteriaType:(unint64_t)a4 inDatabase:(id)a5;
+ (void)_deletePaymentOfferCurrencyAmountForCriteriaPID:(int64_t)a3 criteriaType:(unint64_t)a4 type:(unint64_t)a5 inDatabase:(id)a6;
+ (void)_insertOrUpdateCurrencyAmounts:(id)a3 forCriteriaPID:(int64_t)a4 criteriaType:(unint64_t)a5 amountType:(unint64_t)a6 inDatabase:(id)a7;
+ (void)deletePaymentOfferCurrencyAmountForInstallmentCriteriaPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deletePaymentOfferCurrencyAmountForRewardsCriteriaPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)insertOrUpdateCurrencyAmounts:(id)a3 forInstallmentCriteriaPID:(int64_t)a4 type:(unint64_t)a5 inDatabase:(id)a6;
+ (void)insertOrUpdateCurrencyAmounts:(id)a3 forRewardsCriteriaPID:(int64_t)a4 type:(unint64_t)a5 inDatabase:(id)a6;
@end

@implementation PaymentOfferCurrencyAmount

+ (id)databaseTable
{
  return @"pig";
}

+ (void)_insertOrUpdateCurrencyAmounts:(id)a3 forCriteriaPID:(int64_t)a4 criteriaType:(unint64_t)a5 amountType:(unint64_t)a6 inDatabase:(id)a7
{
  id v12 = a3;
  id v13 = a7;
  int64_t v14 = a4;
  int64_t v15 = a4;
  unint64_t v16 = a5;
  unint64_t v17 = a5;
  unint64_t v18 = a6;
  id v30 = v13;
  objc_msgSend(a1, "_deletePaymentOfferCurrencyAmountForCriteriaPID:criteriaType:type:inDatabase:", v15, v17, a6);
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  id obj = v12;
  id v19 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v19)
  {
    id v21 = v19;
    uint64_t v22 = *(void *)v32;
    do
    {
      v23 = 0LL;
      do
      {
        if (*(void *)v32 != v22) {
          objc_enumerationMutation(obj);
        }
        id v24 = objc_msgSend( (id)objc_opt_class(a1, v20),  "_commonDictionaryForCurrencyAmount:",  *(void *)(*((void *)&v31 + 1) + 8 * (void)v23));
        v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v14));
        [v25 safelySetObject:v26 forKey:@"i_pid"];

        v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  v18));
        [v25 safelySetObject:v27 forKey:@"a"];

        v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  v16));
        [v25 safelySetObject:v28 forKey:@"d"];

        v23 = (char *)v23 + 1;
      }

      while (v21 != v23);
      id v21 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
    }

    while (v21);
  }
}

+ (void)insertOrUpdateCurrencyAmounts:(id)a3 forInstallmentCriteriaPID:(int64_t)a4 type:(unint64_t)a5 inDatabase:(id)a6
{
}

+ (void)insertOrUpdateCurrencyAmounts:(id)a3 forRewardsCriteriaPID:(int64_t)a4 type:(unint64_t)a5 inDatabase:(id)a6
{
}

+ (void)_deletePaymentOfferCurrencyAmountForCriteriaPID:(int64_t)a3 criteriaType:(unint64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForCriteriaPID:a3 criteriaType:a4]);
  id v10 = (id)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v8 predicate:v9]);

  [v10 deleteAllEntities];
}

+ (void)_deletePaymentOfferCurrencyAmountForCriteriaPID:(int64_t)a3 criteriaType:(unint64_t)a4 type:(unint64_t)a5 inDatabase:(id)a6
{
  id v10 = a6;
  v11 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForCriteriaPID:a3 criteriaType:a4 amountType:a5]);
  id v12 = (id)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v10 predicate:v11]);

  [v12 deleteAllEntities];
}

+ (void)deletePaymentOfferCurrencyAmountForInstallmentCriteriaPID:(int64_t)a3 inDatabase:(id)a4
{
}

+ (void)deletePaymentOfferCurrencyAmountForRewardsCriteriaPID:(int64_t)a3 inDatabase:(id)a4
{
}

+ (id)_currencyAmountForCriteriaPID:(int64_t)a3 criteriaType:(unint64_t)a4 amountType:(unint64_t)a5 inDatabase:(id)a6
{
  id v10 = a6;
  v11 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForCriteriaPID:a3 criteriaType:a4 amountType:a5]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v10 predicate:v11]);

  id v13 = (void *)objc_claimAutoreleasedReturnValue([a1 _currencyAmountsWithQuery:v12]);
  return v13;
}

+ (id)currencyAmountForInstallmentCriteriaPID:(int64_t)a3 type:(unint64_t)a4 inDatabase:(id)a5
{
  return _[a1 _currencyAmountForCriteriaPID:a3 criteriaType:1 amountType:a4 inDatabase:a5];
}

+ (id)currencyAmountForRewardsCriteriaPID:(int64_t)a3 type:(unint64_t)a4 inDatabase:(id)a5
{
  return _[a1 _currencyAmountForCriteriaPID:a3 criteriaType:2 amountType:a4 inDatabase:a5];
}

+ (id)_currencyAmountsWithQuery:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472LL;
  v11 = sub_10032195C;
  id v12 = &unk_10063BCB0;
  id v13 = (id)objc_claimAutoreleasedReturnValue([v3 database]);
  v5 = v4;
  int64_t v14 = v5;
  id v6 = v13;
  [v3 enumeratePersistentIDsUsingBlock:&v9];

  if (-[NSMutableArray count](v5, "count", v9, v10, v11, v12)) {
    id v7 = -[NSMutableArray copy](v5, "copy");
  }
  else {
    id v7 = 0LL;
  }

  return v7;
}

+ (id)_predicateForCriteriaPID:(int64_t)a3 criteriaType:(unint64_t)a4
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"i_pid",  v5));

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a4));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"d",  v7));

  v12[0] = v6;
  v12[1] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v12, 2LL));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v9));

  return v10;
}

+ (id)_predicateForCriteriaPID:(int64_t)a3 criteriaType:(unint64_t)a4 amountType:(unint64_t)a5
{
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"i_pid",  v7));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a4));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"d",  v9));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a5));
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"a",  v11));

  v16[0] = v8;
  v16[1] = v10;
  v16[2] = v12;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v16, 3LL));
  int64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v13));

  return v14;
}

+ (id)_commonDictionaryForCurrencyAmount:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 amount]);
  uint64_t v6 = PKCurrencyDecimalToStorageNumber(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v7, @"b");

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 currency]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v8, @"c");

  return v4;
}

@end