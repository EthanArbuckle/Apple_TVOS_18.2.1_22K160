@interface TransitAppletStateBalance
+ (id)_postProcessValue:(id)a3;
+ (id)_predicateForIdentifier:(id)a3;
+ (id)_predicateForPassWithUniqueIdentifier:(id)a3;
+ (id)_predicateForPaymentPassPID:(int64_t)a3;
+ (id)_predicateForTransitAppletStatePID:(int64_t)a3;
+ (id)_propertySettersForBalanceItem;
+ (id)anyInDatabase:(id)a3 withIdentifier:(id)a4 forPassWithUniqueIdentifier:(id)a5 andTransitAppletStatePID:(int64_t)a6;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertTransitAppletBalance:(id)a3 withPaymentPassPID:(int64_t)a4 withTransitAppletStatePID:(int64_t)a5 inDatabase:(id)a6;
+ (id)insertTransitAppletBalances:(id)a3 withPaymentPassPID:(int64_t)a4 withTransitAppletStatePID:(int64_t)a5 inDatabase:(id)a6;
+ (id)transitAppletBalancesInDatabase:(id)a3 forPaymentPassPID:(int64_t)a4 andTransitAppletStatePID:(int64_t)a5;
+ (id)transitAppletStateBalancesInDatabase:(id)a3 forPaymentPassPID:(int64_t)a4 andTransitAppletStatePID:(int64_t)a5;
+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4;
+ (void)deleteEntitiesForPaymentPassPID:(int64_t)a3 andTransitAppletStatePID:(int64_t)a4 inDatabase:(id)a5;
+ (void)updateWithTransitAppletBalances:(id)a3 forPaymentPassPID:(int64_t)a4 andTransitAppletStatePID:(int64_t)a5 inDatabase:(id)a6;
- (TransitAppletStateBalance)initWithTransitAppletBalance:(id)a3 withPaymentPassPID:(int64_t)a4 withTransitAppletStatePID:(int64_t)a5 inDatabase:(id)a6;
- (id)_valuesDictionaryForTransitAppletBalance:(id)a3 paymentPassPID:(int64_t)a4 transitAppletStatePID:(int64_t)a5;
- (id)balance;
@end

@implementation TransitAppletStateBalance

- (TransitAppletStateBalance)initWithTransitAppletBalance:(id)a3 withPaymentPassPID:(int64_t)a4 withTransitAppletStatePID:(int64_t)a5 inDatabase:(id)a6
{
  id v10 = a6;
  v11 = (void *)objc_claimAutoreleasedReturnValue( -[TransitAppletStateBalance _valuesDictionaryForTransitAppletBalance:paymentPassPID:transitAppletStatePID:]( self,  "_valuesDictionaryForTransitAppletBalance:paymentPassPID:transitAppletStatePID:",  a3,  a4,  a5));
  v12 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v11, v10);

  return v12;
}

+ (id)databaseTable
{
  return @"transit_applet_state_balance";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class(&OBJC_CLASS___Pass, a2) == a3) {
    return @"pass_pid";
  }
  if ((Class)objc_opt_class(&OBJC_CLASS___TransitAppletState, v4) == a3) {
    return @"transit_applet_state_pid";
  }
  return 0LL;
}

+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4
{
  id v6 = a3;
  id v5 = a4;
  if (([v6 isEqualToString:@"transit_applet_state.pid"] & 1) != 0
    || [v6 isEqualToString:@"transit_applet_state_pid"])
  {
    [v5 addObject:@"JOIN transit_applet_state ON transit_applet_state_balance.transit_applet_state_pid = transit_applet_state.pid"];
  }

  if (([v6 isEqualToString:@"pass.pid"] & 1) != 0
    || [v6 isEqualToString:@"pass.unique_id"])
  {
    [v5 addObject:@"JOIN pass ON pass.pid = transit_applet_state_balance.pass_pid"];
  }
}

+ (id)insertTransitAppletBalance:(id)a3 withPaymentPassPID:(int64_t)a4 withTransitAppletStatePID:(int64_t)a5 inDatabase:(id)a6
{
  id v10 = a6;
  id v11 = a3;
  id v12 = [objc_alloc((Class)a1) initWithTransitAppletBalance:v11 withPaymentPassPID:a4 withTransitAppletStatePID:a5 inDatabase:v10];

  return v12;
}

+ (id)insertTransitAppletBalances:(id)a3 withPaymentPassPID:(int64_t)a4 withTransitAppletStatePID:(int64_t)a5 inDatabase:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  id v11 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id v12 = v9;
  id v13 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v23;
    do
    {
      v16 = 0LL;
      do
      {
        if (*(void *)v23 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v22 + 1) + 8LL * (void)v16);
        v18 = objc_alloc(&OBJC_CLASS___TransitAppletStateBalance);
        v19 = -[TransitAppletStateBalance initWithTransitAppletBalance:withPaymentPassPID:withTransitAppletStatePID:inDatabase:]( v18,  "initWithTransitAppletBalance:withPaymentPassPID:withTransitAppletStatePID:inDatabase:",  v17,  a4,  a5,  v10,  (void)v22);
        -[NSMutableArray safelyAddObject:](v11, "safelyAddObject:", v19);

        v16 = (char *)v16 + 1;
      }

      while (v14 != v16);
      id v14 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }

    while (v14);
  }

  id v20 = -[NSMutableArray copy](v11, "copy");
  return v20;
}

+ (void)updateWithTransitAppletBalances:(id)a3 forPaymentPassPID:(int64_t)a4 andTransitAppletStatePID:(int64_t)a5 inDatabase:(id)a6
{
  id v11 = a3;
  id v9 = a6;
  if (v11 && [v11 count])
  {
    +[TransitAppletStateBalance deleteEntitiesForPaymentPassPID:andTransitAppletStatePID:inDatabase:]( &OBJC_CLASS___TransitAppletStateBalance,  "deleteEntitiesForPaymentPassPID:andTransitAppletStatePID:inDatabase:",  a4,  a5,  v9);
    id v10 =  +[TransitAppletStateBalance insertTransitAppletBalances:withPaymentPassPID:withTransitAppletStatePID:inDatabase:]( &OBJC_CLASS___TransitAppletStateBalance,  "insertTransitAppletBalances:withPaymentPassPID:withTransitAppletStatePID:inDatabase:",  v11,  a4,  a5,  v9);
  }
}

+ (void)deleteEntitiesForPaymentPassPID:(int64_t)a3 andTransitAppletStatePID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPaymentPassPID:a3]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForTransitAppletStatePID:a4]);
  v14[0] = v9;
  v14[1] = v10;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v14, 2LL));
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v11));

  id v13 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v8 predicate:v12]);
  [v13 deleteAllEntities];
}

+ (id)anyInDatabase:(id)a3 withIdentifier:(id)a4 forPassWithUniqueIdentifier:(id)a5 andTransitAppletStatePID:(int64_t)a6
{
  id v10 = a5;
  id v11 = a3;
  id v12 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForIdentifier:a4]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPassWithUniqueIdentifier:v10]);

  id v14 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForTransitAppletStatePID:a6]);
  v19[0] = v12;
  v19[1] = v13;
  v19[2] = v14;
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v19, 3LL));
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v15));

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v11 predicate:v16]);
  return v17;
}

+ (id)transitAppletStateBalancesInDatabase:(id)a3 forPaymentPassPID:(int64_t)a4 andTransitAppletStatePID:(int64_t)a5
{
  id v8 = a3;
  id v9 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPaymentPassPID:a4]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForTransitAppletStatePID:a5]);
  v28[0] = v10;
  v28[1] = v11;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v28, 2LL));
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v12));

  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryWithDatabase:predicate:]( &OBJC_CLASS___TransitAppletStateBalance,  "queryWithDatabase:predicate:",  v8,  v13));
  v27[0] = @"transit_applet_state.pid";
  v27[1] = @"pass.pid";
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v27, 2LL));
  id v20 = _NSConcreteStackBlock;
  uint64_t v21 = 3221225472LL;
  __int128 v22 = sub_100338068;
  __int128 v23 = &unk_100639BF0;
  __int128 v25 = v9;
  id v26 = a1;
  id v24 = v8;
  v16 = v9;
  id v17 = v8;
  [v14 enumeratePersistentIDsAndProperties:v15 usingBlock:&v20];

  id v18 = -[NSMutableArray copy](v16, "copy", v20, v21, v22, v23);
  return v18;
}

+ (id)transitAppletBalancesInDatabase:(id)a3 forPaymentPassPID:(int64_t)a4 andTransitAppletStatePID:(int64_t)a5
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue( [a1 transitAppletStateBalancesInDatabase:a3 forPaymentPassPID:a4 andTransitAppletStatePID:a5]);
  id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      id v11 = 0LL;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * (void)v11), "balance", (void)v15));
        -[NSMutableArray addObject:](v6, "addObject:", v12);

        id v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v9);
  }

  id v13 = -[NSMutableArray copy](v6, "copy");
  return v13;
}

- (id)balance
{
  v3 = objc_alloc_init(&OBJC_CLASS___PKTransitAppletBalance);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[TransitAppletStateBalance _propertySettersForBalanceItem]( &OBJC_CLASS___TransitAppletStateBalance,  "_propertySettersForBalanceItem"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allKeys]);
  uint64_t v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472LL;
  id v12 = sub_1003382D8;
  id v13 = &unk_100639EE8;
  id v14 = v4;
  __int128 v15 = v3;
  id v6 = v3;
  id v7 = v4;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v5, &v10);

  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[TransitAppletStateBalance _postProcessValue:]( &OBJC_CLASS___TransitAppletStateBalance,  "_postProcessValue:",  v6,  v10,  v11,  v12,  v13));
  return v8;
}

- (id)_valuesDictionaryForTransitAppletBalance:(id)a3 paymentPassPID:(int64_t)a4 transitAppletStatePID:(int64_t)a5
{
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v9 = [v7 exponent];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v7 balance]);
  if ([v7 isCurrency])
  {
    uint64_t v12 = PKCurrencyDecimalToStorageNumber(v10);
    uint64_t v13 = objc_claimAutoreleasedReturnValue(v12);
  }

  else
  {
    if (!v10 || (uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSDecimalNumber, v11), (objc_opt_isKindOfClass(v10, v14) & 1) == 0))
    {
      __int128 v15 = 0LL;
      goto LABEL_8;
    }

    uint64_t v13 = objc_claimAutoreleasedReturnValue([v10 decimalNumberByMultiplyingByPowerOf10:(__int16)v9]);
  }

  __int128 v15 = (void *)v13;
LABEL_8:
  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a5));
  [v8 setObject:v16 forKey:@"transit_applet_state_pid"];

  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  [v8 setObject:v17 forKey:@"pass_pid"];

  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
  [v8 setObjectOrNull:v18 forKey:@"identifier"];

  v19 = (void *)objc_claimAutoreleasedReturnValue([v7 currency]);
  [v8 setObjectOrNull:v19 forKey:@"currency"];

  [v8 setInteger:v9 forKey:@"exponent"];
  [v8 setObjectOrNull:v15 forKey:@"balance"];
  id v20 = (void *)objc_claimAutoreleasedReturnValue([v7 expirationDate]);
  uint64_t v21 = (void *)_SQLValueForDate(v20);
  [v8 setObjectOrNull:v21 forKey:@"expiration_date"];

  id v22 = [v8 copy];
  return v22;
}

+ (id)_predicateForIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"identifier",  a3);
}

+ (id)_predicateForPaymentPassPID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"pass_pid",  v3));

  return v4;
}

+ (id)_predicateForTransitAppletStatePID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"transit_applet_state_pid",  v3));

  return v4;
}

+ (id)_predicateForPassWithUniqueIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"pass.unique_id",  a3);
}

+ (id)_propertySettersForBalanceItem
{
  v3[0] = @"identifier";
  v3[1] = @"currency";
  v4[0] = &stru_100657938;
  v4[1] = &stru_100657958;
  v3[2] = @"exponent";
  v3[3] = @"balance";
  v4[2] = &stru_100657978;
  v4[3] = &stru_100657998;
  v3[4] = @"expiration_date";
  v4[4] = &stru_1006579B8;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  5LL));
}

+ (id)_postProcessValue:(id)a3
{
  id v3 = a3;
  if ([v3 isCurrency])
  {
    uint64_t v4 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue([v3 balance]);
    uint64_t v5 = PKCurrencyStorageNumberToCurrencyDecimal(v4);
    uint64_t v6 = objc_claimAutoreleasedReturnValue(v5);
  }

  else
  {
    id v7 = objc_alloc(&OBJC_CLASS___NSDecimalNumber);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 balance]);
    uint64_t v4 = -[NSDecimalNumber initWithLongLong:](v7, "initWithLongLong:", [v8 longLongValue]);

    uint64_t v6 = objc_claimAutoreleasedReturnValue( -[NSDecimalNumber decimalNumberByMultiplyingByPowerOf10:]( v4,  "decimalNumberByMultiplyingByPowerOf10:",  (__int16)-(uint64_t)[v3 exponent]));
  }

  id v9 = (void *)v6;
  [v3 setBalance:v6];

  return v3;
}

@end