@interface PayLaterFinancingOptionInstallment
+ (id)_installmentsForQuery:(id)a3;
+ (id)_predicateForFinancingOptionPID:(int64_t)a3;
+ (id)_propertySettersForPayLaterFinancingOptionInstallment;
+ (id)_propertyValuesForPayLaterFinancingOptionInstallment:(id)a3;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertOrUpdatePayLaterFinancingOptionInstallments:(id)a3 forFinancingOptionPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)payLaterFinancingOptionInstallmentsForFinancingOptionPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deletePayLaterFinancingOptionInstallmentsForFinancingOptionPID:(int64_t)a3 inDatabase:(id)a4;
- (PayLaterFinancingOptionInstallment)initWithPayLaterFinancingOptionInstallment:(id)a3 forFinancingOptionPID:(int64_t)a4 inDatabase:(id)a5;
- (id)_dueAmount;
@end

@implementation PayLaterFinancingOptionInstallment

+ (id)databaseTable
{
  return @"guanabana";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class(&OBJC_CLASS___PayLaterFinancingOption, a2) == a3) {
    return @"a";
  }
  else {
    return 0LL;
  }
}

- (PayLaterFinancingOptionInstallment)initWithPayLaterFinancingOptionInstallment:(id)a3 forFinancingOptionPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v11 = objc_msgSend((id)objc_opt_class(self, v10), "_propertyValuesForPayLaterFinancingOptionInstallment:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  id v13 = [v12 mutableCopy];
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  [v13 setObjectOrNull:v14 forKey:@"a"];

  v15 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v13, v8);
  return v15;
}

+ (id)insertOrUpdatePayLaterFinancingOptionInstallments:(id)a3 forFinancingOptionPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  [a1 deletePayLaterFinancingOptionInstallmentsForFinancingOptionPID:a4 inDatabase:v9];
  uint64_t v10 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v8 count]);
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v11 = v8;
  id v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v22;
    do
    {
      v15 = 0LL;
      do
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v21 + 1) + 8LL * (void)v15);
        id v17 = objc_alloc((Class)a1);
        id v18 = objc_msgSend( v17,  "initWithPayLaterFinancingOptionInstallment:forFinancingOptionPID:inDatabase:",  v16,  a4,  v9,  (void)v21);
        -[NSMutableArray safelyAddObject:](v10, "safelyAddObject:", v18);

        v15 = (char *)v15 + 1;
      }

      while (v13 != v15);
      id v13 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }

    while (v13);
  }

  id v19 = -[NSMutableArray copy](v10, "copy");
  return v19;
}

+ (id)payLaterFinancingOptionInstallmentsForFinancingOptionPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForFinancingOptionPID:a3]);
  uint64_t v14 = @"d";
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v14, 1LL));
  id v13 = @"ASC";
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v13, 1LL));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7 orderingProperties:v8 orderingDirections:v9]);

  id v11 = (void *)objc_claimAutoreleasedReturnValue([a1 _installmentsForQuery:v10]);
  return v11;
}

+ (id)_installmentsForQuery:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 database]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a1 _propertySettersForPayLaterFinancingOptionInstallment]);
  v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
  uint64_t v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472LL;
  uint64_t v16 = sub_1003852D4;
  id v17 = &unk_100638F18;
  id v18 = v5;
  id v19 = v6;
  v20 = v7;
  id v21 = a1;
  id v9 = v7;
  id v10 = v6;
  id v11 = v5;
  [v4 enumeratePersistentIDsAndProperties:v8 usingBlock:&v14];

  id v12 = -[NSMutableArray copy](v9, "copy", v14, v15, v16, v17);
  return v12;
}

+ (void)deletePayLaterFinancingOptionInstallmentsForFinancingOptionPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForFinancingOptionPID:a3]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

- (id)_dueAmount
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"b"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"c"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"bc"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"cc"));
  uint64_t v7 = PKCurrencyStorageNumberToCurrencyDecimal(v3);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  uint64_t v9 = PKCurrencyStorageNumberToCurrencyDecimal(v4);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  id v11 = 0LL;
  if (v8 && v5)
  {
    uint64_t v12 = PKCurrencyAmountMake(v8, v5);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(v12);
  }

  id v13 = 0LL;
  if (v10 && v6)
  {
    uint64_t v14 = PKCurrencyAmountMake(v10, v6);
    id v13 = (void *)objc_claimAutoreleasedReturnValue(v14);
  }

  if (v11)
  {
    id v15 = [[PKPayLaterFinancingAmount alloc] initWithCurrencyAmount:v11];
    [v15 setMerchantCurrencyAmount:v13];
  }

  else
  {
    id v15 = 0LL;
  }

  return v15;
}

+ (id)_predicateForFinancingOptionPID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"a",  v3));

  return v4;
}

+ (id)_propertyValuesForPayLaterFinancingOptionInstallment:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 dueAmount]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 currencyAmount]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 amount]);
  uint64_t v8 = PKCurrencyDecimalToStorageNumber(v7);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v9, @"b");

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 currencyAmount]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 currency]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v11, @"bc");

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v5 merchantCurrencyAmount]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 amount]);
  uint64_t v14 = PKCurrencyDecimalToStorageNumber(v13);
  id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v15, @"c");

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v5 merchantCurrencyAmount]);
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 currency]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v17, @"cc");

  id v18 = (void *)objc_claimAutoreleasedReturnValue([v3 dueDate]);
  id v19 = (void *)_SQLValueForDate(v18);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v19, @"d");

  id v20 = -[NSMutableDictionary copy](v4, "copy");
  return v20;
}

+ (id)_propertySettersForPayLaterFinancingOptionInstallment
{
  id v3 = @"d";
  id v4 = &stru_100658D70;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v4,  &v3,  1LL));
}

@end