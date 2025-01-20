@interface CreditAccountUserActivity
+ (BOOL)deleteCreditAccountUserActivityForCreditAccountSummaryPID:(id)a3 inDatabase:(id)a4;
+ (id)_accountUserActivityWithQuery:(id)a3;
+ (id)_predicateForAccountSummaryPID:(id)a3;
+ (id)_predicateForAccountUserAltDSID:(id)a3;
+ (id)_propertySettersForAccountUserActivity;
+ (id)_propertyValuesForAccountUserActivity:(id)a3;
+ (id)anyInDatabase:(id)a3 withCreditAccountSummaryPID:(id)a4 accountUserAltDSID:(id)a5;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)creditAccountUserActivityForCreditAccountSummaryPID:(id)a3 inDatabase:(id)a4;
+ (id)databaseTable;
+ (id)insertOrUpdateCreditAccountUserActivity:(id)a3 forCreditAccountSummaryPID:(id)a4 inDatabase:(id)a5;
- (CreditAccountUserActivity)initWithAccountUserActivity:(id)a3 forCreditAccountSummaryPID:(id)a4 inDatabase:(id)a5;
- (id)accountUserActivity;
- (void)updateWithAccountUserAcitivty:(id)a3;
@end

@implementation CreditAccountUserActivity

+ (id)databaseTable
{
  return @"breadfruit";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class(&OBJC_CLASS___CreditAccountSummary, a2) == a3) {
    return @"a";
  }
  else {
    return 0LL;
  }
}

+ (id)insertOrUpdateCreditAccountUserActivity:(id)a3 forCreditAccountSummaryPID:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = -[NSMutableSet initWithCapacity:]( [NSMutableSet alloc],  "initWithCapacity:",  [v8 count]);
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  id obj = v8;
  id v12 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v30;
    do
    {
      for (i = 0LL; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v30 != v14) {
          objc_enumerationMutation(obj);
        }
        v16 = *(void **)(*((void *)&v29 + 1) + 8LL * (void)i);
        v17 = (void *)objc_claimAutoreleasedReturnValue([v16 accountUserAltDSID]);
        id v18 = (id)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v10 withCreditAccountSummaryPID:v9 accountUserAltDSID:v17]);

        if (v18)
        {
          [v18 updateWithAccountUserAcitivty:v16];
        }

        else
        {
          id v18 = [objc_alloc((Class)a1) initWithAccountUserActivity:v16 forCreditAccountSummaryPID:v9 inDatabase:v10];
          if (!v18) {
            continue;
          }
        }

        v19 = (void *)objc_claimAutoreleasedReturnValue([v18 accountUserActivity]);
        -[NSMutableSet addObject:](v11, "addObject:", v19);
      }

      id v13 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
    }

    while (v13);
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet pk_setByApplyingBlock:](v11, "pk_setByApplyingBlock:", &stru_10064DBF8));
  v21 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteContainsPredicate doesNotContainPredicateWithProperty:values:]( &OBJC_CLASS___SQLiteContainsPredicate,  "doesNotContainPredicateWithProperty:values:",  @"b",  v20));
  v33[0] = v21;
  v22 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountSummaryPID:v9]);
  v33[1] = v22;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v33, 2LL));
  v24 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v23));

  v25 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v10 predicate:v24]);
  [v25 deleteAllEntities];
  id v26 = -[NSMutableSet copy](v11, "copy");

  return v26;
}

- (CreditAccountUserActivity)initWithAccountUserActivity:(id)a3 forCreditAccountSummaryPID:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v12 = objc_msgSend((id)objc_opt_class(self, v11), "_propertyValuesForAccountUserActivity:", v10);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  id v14 = [v13 mutableCopy];
  [v14 setObjectOrNull:v9 forKey:@"a"];

  v15 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v14, v8);
  return v15;
}

- (void)updateWithAccountUserAcitivty:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend((id)objc_opt_class(self, v5), "_propertyValuesForAccountUserActivity:", v4);
  id v7 = (id)objc_claimAutoreleasedReturnValue(v6);

  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v7);
}

+ (id)creditAccountUserActivityForCreditAccountSummaryPID:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountSummaryPID:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _accountUserActivityWithQuery:v8]);
  return v9;
}

+ (id)anyInDatabase:(id)a3 withCreditAccountSummaryPID:(id)a4 accountUserAltDSID:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountSummaryPID:a4]);
  v16[0] = v10;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountUserAltDSID:v8]);

  v16[1] = v11;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v16, 2LL));
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v12));

  id v14 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v9 predicate:v13]);
  return v14;
}

- (id)accountUserActivity
{
  v3 = objc_alloc_init(&OBJC_CLASS___PKCreditAccountUserActivity);
  id v5 = objc_msgSend((id)objc_opt_class(self, v4), "_propertySettersForAccountUserActivity");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10022D51C;
  v13[3] = &unk_100638EF0;
  v13[4] = self;
  id v14 = v6;
  id v8 = v3;
  v15 = v8;
  id v9 = v6;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v7, v13);

  id v10 = v15;
  uint64_t v11 = v8;

  return v11;
}

+ (BOOL)deleteCreditAccountUserActivityForCreditAccountSummaryPID:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountSummaryPID:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);

  LOBYTE(v7) = [v8 deleteAllEntities];
  return (char)v7;
}

+ (id)_predicateForAccountSummaryPID:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"a",  a3);
}

+ (id)_predicateForAccountUserAltDSID:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"b",  a3);
}

+ (id)_accountUserActivityWithQuery:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([a1 _propertySettersForAccountUserActivity]);
  id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 allKeys]);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10022D724;
  v12[3] = &unk_100639BF0;
  id v15 = a1;
  id v13 = v5;
  id v8 = v6;
  id v14 = v8;
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

+ (id)_propertyValuesForAccountUserActivity:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 accountUserAltDSID]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v5, @"b");

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 purchases]);
  uint64_t v7 = PKCurrencyDecimalToStorageNumber(v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v8, @"c");

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v3 pendingPurchases]);
  uint64_t v10 = PKCurrencyDecimalToStorageNumber(v9);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v11, @"d");

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v3 rewardsBalance]);
  uint64_t v13 = PKCurrencyDecimalToStorageNumber(v12);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v14, @"e");

  id v15 = (void *)objc_claimAutoreleasedReturnValue([v3 rewardsEarned]);
  uint64_t v16 = PKCurrencyDecimalToStorageNumber(v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v17, @"f");

  id v18 = (void *)objc_claimAutoreleasedReturnValue([v3 rewardsRedeemed]);
  uint64_t v19 = PKCurrencyDecimalToStorageNumber(v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v20, @"g");

  v21 = (void *)objc_claimAutoreleasedReturnValue([v3 adjustedPurchases]);
  uint64_t v22 = PKCurrencyDecimalToStorageNumber(v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v23, @"h");

  id v24 = -[NSMutableDictionary copy](v4, "copy");
  return v24;
}

+ (id)_propertySettersForAccountUserActivity
{
  v3[0] = @"b";
  v3[1] = @"c";
  v4[0] = &stru_10064DC38;
  v4[1] = &stru_10064DC58;
  v3[2] = @"d";
  v3[3] = @"e";
  v4[2] = &stru_10064DC78;
  v4[3] = &stru_10064DC98;
  v3[4] = @"f";
  v3[5] = @"g";
  v4[4] = &stru_10064DCB8;
  v4[5] = &stru_10064DCD8;
  v3[6] = @"h";
  v4[6] = &stru_10064DCF8;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  7LL));
}

@end