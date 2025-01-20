@interface PaymentTransactionTag
+ (id)_predicateForCurrentLocale;
+ (id)_predicateForPaymentTransactionPID:(int64_t)a3;
+ (id)_propertySettersForPaymentTransactionTag;
+ (id)_tagsFromQuery:(id)a3;
+ (id)allTagsWithTitlesInDatabase:(id)a3;
+ (id)compoundTagsInDatabase:(id)a3 tagType:(unint64_t)a4 limit:(unint64_t)a5;
+ (id)databaseTable;
+ (id)paymentTransactionTagsForPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deleteAllPaymentTransactionTagsInDatabase:(id)a3;
+ (void)deleteEntitiesForPaymentTransactionPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)insertPaymentTransactionTags:(id)a3 forPaymentTransactionPID:(int64_t)a4 inDatabase:(id)a5;
@end

@implementation PaymentTransactionTag

+ (id)databaseTable
{
  return @"payment_transaction_tag";
}

+ (void)insertPaymentTransactionTags:(id)a3 forPaymentTransactionPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = sub_10007E348;
  v30[3] = &unk_10063E308;
  v25 = (objc_class *)a1;
  id v32 = a1;
  int64_t v33 = a4;
  int64_t v9 = a4;
  id v31 = a5;
  id v10 = v31;
  sub_1002CCC5C((uint64_t)v31, v30);
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  id obj = v8;
  id v11 = [obj countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v27;
    do
    {
      v14 = 0LL;
      do
      {
        if (*(void *)v27 != v13) {
          objc_enumerationMutation(obj);
        }
        v15 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)v14);
        v16 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v9));
        -[NSMutableDictionary setObject:forKey:](v16, "setObject:forKey:", v17, @"payment_transaction_pid");

        v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v15 type]));
        -[NSMutableDictionary setObject:forKey:](v16, "setObject:forKey:", v18, @"type");

        v19 = (void *)objc_claimAutoreleasedReturnValue([v15 rank]);
        uint64_t v20 = PKCurrencyDecimalToStorageNumber(v19);
        v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
        -[NSMutableDictionary setObjectOrNull:forKey:](v16, "setObjectOrNull:forKey:", v21, @"rank");

        v22 = (void *)objc_claimAutoreleasedReturnValue([v15 localizedTitle]);
        -[NSMutableDictionary setObjectOrNull:forKey:](v16, "setObjectOrNull:forKey:", v22, @"localized_title");

        v23 = (void *)objc_claimAutoreleasedReturnValue([v15 localeIdentifier]);
        -[NSMutableDictionary setObjectOrNull:forKey:](v16, "setObjectOrNull:forKey:", v23, @"locale_identifier");

        v14 = (char *)v14 + 1;
      }

      while (v12 != v14);
      id v12 = [obj countByEnumeratingWithState:&v26 objects:v34 count:16];
    }

    while (v12);
  }
}

+ (id)paymentTransactionTagsForPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForCurrentLocale]);
  v17[0] = v7;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteNullPredicate isNullPredicateWithProperty:]( &OBJC_CLASS___SQLiteNullPredicate,  "isNullPredicateWithProperty:",  @"locale_identifier"));
  v17[1] = v8;
  int64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v17, 2LL));
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAnyPredicates:",  v9));
  v18[0] = v10;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPaymentTransactionPID:a3]);
  v18[1] = v11;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v18, 2LL));
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v12));

  v14 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v13]);
  v15 = (void *)objc_claimAutoreleasedReturnValue([a1 _tagsFromQuery:v14]);

  return v15;
}

+ (id)allTagsWithTitlesInDatabase:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForCurrentLocale]);
  v10[0] = @"type";
  v10[1] = @"localized_title";
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v10, 2LL));
  v7 = (void *)objc_claimAutoreleasedReturnValue( [a1 queryWithDatabase:v4 predicate:v5 orderingProperties:0 orderingDirections:0 limit:0 groupingProperties:v6]);

  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _tagsFromQuery:v7]);
  return v8;
}

+ (id)compoundTagsInDatabase:(id)a3 tagType:(unint64_t)a4 limit:(unint64_t)a5
{
  id v8 = a3;
  int64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a4));
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"type",  v9));
  v15[0] = @"type";
  v15[1] = @"localized_title";
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v15, 2LL));
  id v12 = (void *)objc_claimAutoreleasedReturnValue( [a1 queryWithDatabase:v8 predicate:v10 orderingProperties:0 orderingDirections:0 limit:a5 groupingProperties:v11]);

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([a1 _tagsFromQuery:v12]);
  return v13;
}

+ (id)_tagsFromQuery:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([a1 _propertySettersForPaymentTransactionTag]);
  id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 allKeys]);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10007E820;
  v12[3] = &unk_100639BF0;
  id v15 = a1;
  id v13 = v5;
  id v8 = v6;
  v14 = v8;
  id v9 = v5;
  [v4 enumeratePersistentIDsAndProperties:v7 usingBlock:v12];

  if (-[NSMutableSet count](v8, "count")) {
    id v10 = -[NSMutableSet copy](v8, "copy");
  }
  else {
    id v10 = 0LL;
  }

  return v10;
}

+ (void)deleteEntitiesForPaymentTransactionPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForPaymentTransactionPID:a3]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

+ (void)deleteAllPaymentTransactionTagsInDatabase:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SQLiteBooleanPredicate truePredicate](&OBJC_CLASS___SQLiteBooleanPredicate, "truePredicate"));
  id v6 = (id)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v4 predicate:v5]);

  [v6 deleteAllEntities];
}

+ (id)_predicateForCurrentLocale
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](&OBJC_CLASS___NSLocale, "currentLocale"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 localeIdentifier]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"locale_identifier",  v3));

  return v4;
}

+ (id)_predicateForPaymentTransactionPID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"payment_transaction_pid",  v3));

  return v4;
}

+ (id)_propertySettersForPaymentTransactionTag
{
  v3[0] = @"type";
  v3[1] = @"rank";
  v4[0] = &stru_10063E348;
  v4[1] = &stru_10063E368;
  v3[2] = @"localized_title";
  v3[3] = @"locale_identifier";
  v4[2] = &stru_10063E388;
  v4[3] = &stru_10063E3A8;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  4LL));
}

@end