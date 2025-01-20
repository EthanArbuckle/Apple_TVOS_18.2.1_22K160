@interface AccountFetchPeriods
+ (id)_predicateForAccountPID:(id)a3;
+ (id)_propertyDictionaryForAccountFetchPeriods:(id)a3;
+ (id)_propertyValuesForAccountFetchPeriods;
+ (id)accountFetchPeriodsForAccountPID:(int64_t)a3 inDatabase:(id)a4;
+ (id)anyInDatabase:(id)a3 forAccountPID:(int64_t)a4;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertOrUpdateAccountFetchPeriods:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5;
+ (void)deleteAccountFetchPeriodsForAccountPID:(int64_t)a3 inDatabase:(id)a4;
- (AccountFetchPeriods)initWithAccountFetchPeriods:(id)a3 accountPID:(int64_t)a4 inDatabase:(id)a5;
- (id)accountFetchPeriods;
- (void)updateWithAccountFetchPeriods:(id)a3;
@end

@implementation AccountFetchPeriods

+ (id)databaseTable
{
  return @"account_fetch_periods";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class(&OBJC_CLASS___Account, a2) == a3) {
    return @"account_pid";
  }
  else {
    return 0LL;
  }
}

+ (id)insertOrUpdateAccountFetchPeriods:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v9 forAccountPID:a4]);
  if (v10)
  {
    id v11 = v10;
    [v10 updateWithAccountFetchPeriods:v8];
  }

  else
  {
    id v11 = [objc_alloc((Class)a1) initWithAccountFetchPeriods:v8 accountPID:a4 inDatabase:v9];
  }

  return v11;
}

- (AccountFetchPeriods)initWithAccountFetchPeriods:(id)a3 accountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v11 = objc_msgSend((id)objc_opt_class(self, v10), "_propertyDictionaryForAccountFetchPeriods:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  id v13 = [v12 mutableCopy];
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  [v13 setObjectOrNull:v14 forKey:@"account_pid"];

  v15 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v13, v8);
  return v15;
}

- (void)updateWithAccountFetchPeriods:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend((id)objc_opt_class(self, v5), "_propertyDictionaryForAccountFetchPeriods:", v4);
  id v7 = (id)objc_claimAutoreleasedReturnValue(v6);

  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v7);
}

+ (id)anyInDatabase:(id)a3 forAccountPID:(int64_t)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountPID:v7]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v8]);

  return v9;
}

+ (id)accountFetchPeriodsForAccountPID:(int64_t)a3 inDatabase:(id)a4
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:a4 forAccountPID:a3]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 accountFetchPeriods]);

  return v5;
}

- (id)accountFetchPeriods
{
  v3 = objc_alloc_init(&OBJC_CLASS___PKAccountFetchPeriods);
  id v5 = objc_msgSend((id)objc_opt_class(self, v4), "_propertyValuesForAccountFetchPeriods");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1003E82E4;
  v13[3] = &unk_100638EF0;
  v13[4] = self;
  id v14 = v6;
  id v8 = v3;
  v15 = v8;
  id v9 = v6;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v7, v13);

  uint64_t v10 = v15;
  id v11 = v8;

  return v11;
}

+ (void)deleteAccountFetchPeriodsForAccountPID:(int64_t)a3 inDatabase:(id)a4
{
  id v4 = (id)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:a4 forAccountPID:a3]);
  [v4 deleteFromDatabase];
}

+ (id)_predicateForAccountPID:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"account_pid",  a3);
}

+ (id)_propertyDictionaryForAccountFetchPeriods:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 blockedEndpoints]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 allObjects]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 componentsJoinedByString:@","]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v7, @"blocked_endpoints");

  [v3 accountFetchPeriod];
  -[NSMutableDictionary setInteger:forKey:](v4, "setInteger:forKey:", (uint64_t)v8, @"account_fetch_period");
  [v3 extendedAccountFetchPeriod];
  -[NSMutableDictionary setInteger:forKey:]( v4,  "setInteger:forKey:",  (uint64_t)v9,  @"extended_account_fetch_period");
  [v3 usersFetchPeriod];
  -[NSMutableDictionary setInteger:forKey:](v4, "setInteger:forKey:", (uint64_t)v10, @"a");
  [v3 sharedCloudStoreModelFetchPeriod];
  -[NSMutableDictionary setInteger:forKey:](v4, "setInteger:forKey:", (uint64_t)v11, @"b");
  [v3 financingPlansFetchPeriod];
  -[NSMutableDictionary setInteger:forKey:](v4, "setInteger:forKey:", (uint64_t)v12, @"c");
  [v3 fundingSourcesFetchPeriod];
  -[NSMutableDictionary setInteger:forKey:]( v4,  "setInteger:forKey:",  (uint64_t)v13,  @"funding_sources_fetch_period");
  [v3 recoveryPaymentPlansFetchPeriod];
  -[NSMutableDictionary setInteger:forKey:]( v4,  "setInteger:forKey:",  (uint64_t)v14,  @"recovery_payment_plans_fetch_period");
  [v3 physicalCardsFetchPeriod];
  double v16 = v15;

  -[NSMutableDictionary setInteger:forKey:]( v4,  "setInteger:forKey:",  (uint64_t)v16,  @"physical_cards_fetch_period");
  id v17 = -[NSMutableDictionary copy](v4, "copy");

  return v17;
}

+ (id)_propertyValuesForAccountFetchPeriods
{
  v3[0] = @"blocked_endpoints";
  v3[1] = @"account_fetch_period";
  v4[0] = &stru_10065CDC0;
  v4[1] = &stru_10065CE00;
  v3[2] = @"extended_account_fetch_period";
  v3[3] = @"a";
  v4[2] = &stru_10065CE20;
  v4[3] = &stru_10065CE40;
  v3[4] = @"b";
  v3[5] = @"c";
  v4[4] = &stru_10065CE60;
  v4[5] = &stru_10065CE80;
  v3[6] = @"funding_sources_fetch_period";
  v3[7] = @"recovery_payment_plans_fetch_period";
  v4[6] = &stru_10065CEA0;
  v4[7] = &stru_10065CEC0;
  v3[8] = @"physical_cards_fetch_period";
  v4[8] = &stru_10065CEE0;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  9LL));
}

@end