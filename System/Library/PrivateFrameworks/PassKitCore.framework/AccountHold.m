@interface AccountHold
+ (id)_accountHoldWithIdentifier:(id)a3 inDatabase:(id)a4;
+ (id)_commonDictionaryForHold:(id)a3;
+ (id)_holdsFromQuery:(id)a3;
+ (id)_predicateForEventPID:(int64_t)a3;
+ (id)_predicateForHoldIdentifier:(id)a3;
+ (id)_predicateForPlacedHoldsWithAccountIdentifier:(id)a3;
+ (id)_propertySettersForHold;
+ (id)databaseTable;
+ (id)holdsWithEventPID:(int64_t)a3 inDatabase:(id)a4;
+ (id)insertOrUpdateHold:(id)a3 forEventPID:(int64_t)a4 accountIdentifier:(id)a5 inDatabase:(id)a6;
+ (id)placedHoldsWithAccountIdentifier:(id)a3 inDatabase:(id)a4;
+ (void)deleteHoldWithEventPID:(int64_t)a3 inDatabase:(id)a4;
- (id)hold;
@end

@implementation AccountHold

+ (id)databaseTable
{
  return @"lemon";
}

+ (id)insertOrUpdateHold:(id)a3 forEventPID:(int64_t)a4 accountIdentifier:(id)a5 inDatabase:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v13 = (void *)objc_claimAutoreleasedReturnValue([a1 _commonDictionaryForHold:v10]);
  v14 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);
  v15 = (void *)objc_claimAutoreleasedReturnValue([a1 _accountHoldWithIdentifier:v14 inDatabase:v12]);

  if (v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue([v15 hold]);
    if ([v16 state] == (id)2)
    {
      id v17 = [v10 state];

      if (v17 != (id)2)
      {
        uint64_t Object = PKLogFacilityTypeGetObject(14LL);
        v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v24 = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Dropping account hold as the state cannot change from removed.",  v24,  2u);
        }

        goto LABEL_10;
      }
    }

    else
    {
    }

    [v15 setValuesWithDictionary:v13];
LABEL_10:
    id v21 = v15;
    goto LABEL_11;
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  [v13 setObject:v20 forKey:@"a"];

  [v13 setObject:v11 forKey:@"b"];
  id v21 = [objc_alloc((Class)a1) initWithPropertyValues:v13 inDatabase:v12];
LABEL_11:
  v22 = v21;

  return v22;
}

+ (id)_commonDictionaryForHold:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
  [v4 setObject:v5 forKey:@"c"];

  objc_msgSend(v4, "setInteger:forKey:", objc_msgSend(v3, "type"), @"d");
  objc_msgSend(v4, "setInteger:forKey:", objc_msgSend(v3, "state"), @"e");
  v6 = (void *)objc_claimAutoreleasedReturnValue([v3 currencyAmount]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 amount]);
  uint64_t v8 = PKCurrencyDecimalToStorageNumber();
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  [v4 setObjectOrNull:v9 forKey:@"f"];
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v3 currencyAmount]);

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 currency]);
  [v4 setObject:v11 forKey:@"g"];

  return v4;
}

+ (id)placedHoldsWithAccountIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPlacedHoldsWithAccountIdentifier:a3]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);

  v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _holdsFromQuery:v8]);
  return v9;
}

+ (id)holdsWithEventPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForEventPID:a3]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);

  v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _holdsFromQuery:v8]);
  return v9;
}

+ (id)_accountHoldWithIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForHoldIdentifier:a3]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  return v8;
}

+ (id)_holdsFromQuery:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  v16 = @"pid";
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v16, 1LL));
  id v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472LL;
  id v12 = sub_100013724;
  v13 = &unk_100639E18;
  id v14 = v3;
  v15 = v4;
  id v6 = v4;
  id v7 = v3;
  [v7 enumeratePersistentIDsAndProperties:v5 usingBlock:&v10];

  id v8 = -[NSMutableSet copy](v6, "copy", v10, v11, v12, v13);
  return v8;
}

+ (void)deleteHoldWithEventPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForEventPID:a3]);
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);

  [v8 deleteAllEntities];
}

+ (id)_predicateForHoldIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"c",  a3);
}

+ (id)_predicateForPlacedHoldsWithAccountIdentifier:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"b",  a3));
  v8[0] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"e",  &off_10068F9F0));
  v8[1] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v8, 2LL));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v5));

  return v6;
}

+ (id)_predicateForEventPID:(int64_t)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"a",  v3));

  return v4;
}

+ (id)_propertySettersForHold
{
  v3[0] = @"c";
  v3[1] = @"d";
  v4[0] = &stru_100639E58;
  v4[1] = &stru_100639E78;
  v3[2] = @"e";
  v4[2] = &stru_100639E98;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  3LL));
}

- (id)hold
{
  id v3 = objc_alloc_init(&OBJC_CLASS___PKAccountHold);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[AccountHold _propertySettersForHold](&OBJC_CLASS___AccountHold, "_propertySettersForHold"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allKeys]);
  id v6 = [v5 mutableCopy];

  id v7 = [v6 count];
  [v6 addObject:@"f"];
  id v8 = [v6 count];
  [v6 addObject:@"g"];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100013BDC;
  v14[3] = &unk_100639EC0;
  id v15 = v4;
  v9 = v3;
  v16 = v9;
  id v17 = v8;
  id v18 = v7;
  id v10 = v4;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v6, v14);
  uint64_t v11 = v16;
  id v12 = v9;

  return v12;
}

@end