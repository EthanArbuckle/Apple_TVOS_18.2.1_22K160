@interface PaymentBalance
+ (id)_paymentBalancesInDatabase:(id)a3 passPredicate:(id)a4;
+ (id)_predicateForIdentifier:(id)a3;
+ (id)_predicateForPassWithUniqueIdentifier:(id)a3;
+ (id)_predicateForPaymentPass:(id)a3;
+ (id)_predicateForPaymentPassWithPID:(unint64_t)a3;
+ (id)_propertySettersForPaymentBalanceWithEffectiveProperties:(id *)a3 indices:(id *)a4;
+ (id)anyInDatabase:(id)a3 withIdentifier:(id)a4 forPassWithUniqueIdentifier:(id)a5;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertPaymentBalance:(id)a3 withPaymentPass:(id)a4 inDatabase:(id)a5;
+ (id)paymentBalancesInDatabase:(id)a3 forPass:(id)a4;
+ (id)paymentBalancesInDatabase:(id)a3 forPassPID:(unint64_t)a4;
+ (id)paymentBalancesInDatabase:(id)a3 forPassWithUniqueIdentifier:(id)a4;
+ (int64_t)countInDatabase:(id)a3 forPassWithUniqueIdentifier:(id)a4;
+ (void)_updateBalance:(id)a3 value:(id)a4 currencyCode:(id)a5 exponent:(int64_t)a6;
+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4;
+ (void)deleteEntitiesForPass:(id)a3 inDatabase:(id)a4;
+ (void)truncateEntitiesForPass:(id)a3 inDatabase:(id)a4 toCount:(int64_t)a5;
- (BOOL)isPrimaryBalance;
- (PaymentBalance)initWithPaymentBalance:(id)a3 paymentPass:(id)a4 inDatabase:(id)a5;
- (id)identifier;
- (id)passUniqueIdentifier;
- (id)paymentBalance;
@end

@implementation PaymentBalance

- (PaymentBalance)initWithPaymentBalance:(id)a3 paymentPass:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue([v8 identifiers]);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 anyObject]);
  if ((unint64_t)[v11 count] > 1 || objc_msgSend(v8, "isComposed"))
  {
    uint64_t Object = PKLogFacilityTypeGetObject(0LL);
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v32 = v11;
    }

    v15 = 0LL;
  }

  else
  {
    v14 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    id v16 = [v8 exponent];
    id v29 = v16;
    if ([v8 isCurrency])
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue([v8 value]);
      uint64_t v18 = PKCurrencyDecimalToStorageNumber(v17);
      v28 = (void *)objc_claimAutoreleasedReturnValue(v18);
    }

    else
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue([v8 value]);
      v19 = (void *)objc_claimAutoreleasedReturnValue([v17 decimalNumberByMultiplyingByPowerOf10:(__int16)v16]);
      v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v19 longLongValue]));
    }

    v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v9 persistentID]));
    -[os_log_s setObjectOrNull:forKey:](v14, "setObjectOrNull:forKey:", v20, @"pass_pid");

    v21 = (void *)objc_claimAutoreleasedReturnValue([v8 preformattedString]);
    -[os_log_s setObjectOrNull:forKey:](v14, "setObjectOrNull:forKey:", v21, @"preformatted_string");

    -[os_log_s setObjectOrNull:forKey:](v14, "setObjectOrNull:forKey:", v12, @"identifier");
    -[os_log_s setBool:forKey:](v14, "setBool:forKey:", [v8 isPrimary], @"is_primary_balance");
    -[os_log_s setObjectOrNull:forKey:](v14, "setObjectOrNull:forKey:", v28, @"value");
    v22 = (void *)objc_claimAutoreleasedReturnValue([v8 currencyCode]);
    -[os_log_s setObjectOrNull:forKey:](v14, "setObjectOrNull:forKey:", v22, @"currency_code");

    -[os_log_s setInteger:forKey:](v14, "setInteger:forKey:", v29, @"exponent");
    v23 = (void *)objc_claimAutoreleasedReturnValue([v8 lastUpdateDate]);
    v24 = (void *)_SQLValueForDate(v23);
    -[os_log_s setObjectOrNull:forKey:](v14, "setObjectOrNull:forKey:", v24, @"last_updated_date");

    v25 = (void *)objc_claimAutoreleasedReturnValue([v8 localizedTitle]);
    -[os_log_s setObjectOrNull:forKey:](v14, "setObjectOrNull:forKey:", v25, @"localized_title");

    v26 = (void *)objc_claimAutoreleasedReturnValue([v8 localizedDescription]);
    -[os_log_s setObjectOrNull:forKey:](v14, "setObjectOrNull:forKey:", v26, @"localized_description");

    v30.receiver = self;
    v30.super_class = (Class)&OBJC_CLASS___PaymentBalance;
    self = -[SQLiteEntity initWithPropertyValues:inDatabase:](&v30, "initWithPropertyValues:inDatabase:", v14, v10);

    v15 = self;
  }

  return v15;
}

+ (id)databaseTable
{
  return @"payment_balance";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class(&OBJC_CLASS___Pass, a2) == a3) {
    return @"pass_pid";
  }
  else {
    return 0LL;
  }
}

+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4
{
  id v5 = a4;
  id v9 = @"pass.unique_id";
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL));
  unsigned int v8 = objc_msgSend(v7, "containsObject:", v6, v9);

  if (v8) {
    [v5 addObject:@"JOIN pass ON pass.pid = payment_balance.pass_pid"];
  }
}

+ (id)insertPaymentBalance:(id)a3 withPaymentPass:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [objc_alloc((Class)a1) initWithPaymentBalance:v10 paymentPass:v9 inDatabase:v8];

  return v11;
}

+ (void)deleteEntitiesForPass:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForPaymentPass:a3]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

+ (void)truncateEntitiesForPass:(id)a3 inDatabase:(id)a4 toCount:(int64_t)a5
{
  id v8 = a4;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPaymentPass:a3]);
  uint64_t v18 = @"last_updated_date";
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v18, 1LL));
  v17 = @"DESC";
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v17, 1LL));
  v12 = (void *)objc_claimAutoreleasedReturnValue( [a1 queryWithDatabase:v8 predicate:v9 orderingProperties:v10 orderingDirections:v11]);

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1002BD4E8;
  v14[3] = &unk_100651A08;
  id v15 = v8;
  int64_t v16 = a5;
  id v13 = v8;
  [v12 enumeratePersistentIDsUsingBlock:v14];
}

+ (id)anyInDatabase:(id)a3 withIdentifier:(id)a4 forPassWithUniqueIdentifier:(id)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPassWithUniqueIdentifier:a5]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForIdentifier:v8]);

  v16[0] = v10;
  v16[1] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v16, 2LL));
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v12));

  v14 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v9 predicate:v13]);
  return v14;
}

+ (int64_t)countInDatabase:(id)a3 forPassWithUniqueIdentifier:(id)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPassWithUniqueIdentifier:a4]);
  id v8 = [a1 countInDatabase:v6 predicate:v7];

  return (int64_t)v8;
}

+ (id)paymentBalancesInDatabase:(id)a3 forPass:(id)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPaymentPass:a4]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _paymentBalancesInDatabase:v6 passPredicate:v7]);

  return v8;
}

+ (id)paymentBalancesInDatabase:(id)a3 forPassWithUniqueIdentifier:(id)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPassWithUniqueIdentifier:a4]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _paymentBalancesInDatabase:v6 passPredicate:v7]);

  return v8;
}

+ (id)paymentBalancesInDatabase:(id)a3 forPassPID:(unint64_t)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPaymentPassWithPID:a4]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _paymentBalancesInDatabase:v6 passPredicate:v7]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 allObjects]);
  return v9;
}

+ (id)_paymentBalancesInDatabase:(id)a3 passPredicate:(id)a4
{
  v26 = @"last_updated_date";
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v26, 1LL));
  v25 = @"DESC";
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v25, 1LL));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v7 predicate:v6 orderingProperties:v8 orderingDirections:v9]);

  id v24 = 0LL;
  __int128 v22 = 0uLL;
  uint64_t v23 = 0LL;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[PaymentBalance _propertySettersForPaymentBalanceWithEffectiveProperties:indices:]( &OBJC_CLASS___PaymentBalance,  "_propertySettersForPaymentBalanceWithEffectiveProperties:indices:",  &v24,  &v22));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  id v13 = v24;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_1002BD9EC;
  v17[3] = &unk_100652BB8;
  id v18 = v12;
  id v19 = a1;
  __int128 v20 = v22;
  uint64_t v21 = v23;
  v17[4] = v11;
  id v14 = v12;
  [v10 enumeratePersistentIDsAndProperties:v13 usingBlock:v17];
  id v15 = [v14 copy];

  return v15;
}

- (id)paymentBalance
{
  v3 = objc_alloc_init(&OBJC_CLASS___PKPaymentBalance);
  uint64_t v15 = 0LL;
  id v16 = 0LL;
  __int128 v14 = 0uLL;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[PaymentBalance _propertySettersForPaymentBalanceWithEffectiveProperties:indices:]( &OBJC_CLASS___PaymentBalance,  "_propertySettersForPaymentBalanceWithEffectiveProperties:indices:",  &v16,  &v14));
  id v5 = v16;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1002BDB80;
  v10[3] = &unk_10064D5A8;
  v10[4] = v4;
  id v6 = v3;
  id v11 = v6;
  __int128 v12 = v14;
  uint64_t v13 = v15;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v5, v10);
  id v7 = v11;
  id v8 = v6;

  return v8;
}

- (BOOL)isPrimaryBalance
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"is_primary_balance"));
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (id)identifier
{
  return -[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"identifier");
}

- (id)passUniqueIdentifier
{
  return -[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"pass.unique_id");
}

+ (id)_predicateForPaymentPassWithPID:(unint64_t)a3
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"pass_pid",  v3));

  return v4;
}

+ (id)_predicateForIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"identifier",  a3);
}

+ (id)_predicateForPaymentPass:(id)a3
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [a3 persistentID]));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"pass_pid",  v3));

  return v4;
}

+ (id)_predicateForPassWithUniqueIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"pass.unique_id",  a3);
}

+ (id)_propertySettersForPaymentBalanceWithEffectiveProperties:(id *)a3 indices:(id *)a4
{
  v4 = 0LL;
  if (a3 && a4)
  {
    v12[0] = @"identifier";
    v12[1] = @"localized_title";
    v13[0] = &stru_100652BF8;
    v13[1] = &stru_100652C18;
    v12[2] = @"localized_description";
    v12[3] = @"preformatted_string";
    v13[2] = &stru_100652C38;
    v13[3] = &stru_100652C58;
    v12[4] = @"last_updated_date";
    v12[5] = @"is_primary_balance";
    v13[4] = &stru_100652C78;
    v13[5] = &stru_100652C98;
    v12[6] = @"currency_code";
    v12[7] = @"exponent";
    v13[6] = &stru_100652CB8;
    v13[7] = &stru_100652CD8;
    v12[8] = @"value";
    v13[8] = &stru_100652CF8;
    v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v13,  v12,  9LL));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 allKeys]);
    id v8 = [v7 mutableCopy];

    a4->var1 = (int64_t)[v8 count];
    [v8 addObject:@"currency_code"];
    a4->var2 = (int64_t)[v8 count];
    [v8 addObject:@"exponent"];
    a4->var0 = (int64_t)[v8 count];
    [v8 addObject:@"value"];
    id v9 = [v8 copy];
    id v10 = *a3;
    *a3 = v9;
  }

  return v4;
}

+ (void)_updateBalance:(id)a3 value:(id)a4 currencyCode:(id)a5 exponent:(int64_t)a6
{
  id v14 = a3;
  id v9 = a4;
  id v10 = a5;
  [v14 setCurrencyCode:v10];
  [v14 setExponent:a6];
  if (v9)
  {
    if (v10 && ![v10 isEqualToString:PKNoCurrencyCode])
    {
      uint64_t v13 = PKCurrencyStorageNumberToCurrencyDecimal(v9);
      __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(v13);
    }

    else
    {
      id v11 = -[NSDecimalNumber initWithLongLong:]( [NSDecimalNumber alloc],  "initWithLongLong:",  [v9 longLongValue]);
      __int128 v12 = (void *)objc_claimAutoreleasedReturnValue( -[NSDecimalNumber decimalNumberByMultiplyingByPowerOf10:]( v11,  "decimalNumberByMultiplyingByPowerOf10:",  (__int16)-(__int16)a6));
    }

    [v14 setValue:v12];
  }
}

@end