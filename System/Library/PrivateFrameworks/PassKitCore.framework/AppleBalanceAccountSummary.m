@interface AppleBalanceAccountSummary
+ (id)_commonDictionaryForAppleBalanceAccountSummary:(id)a3;
+ (id)_predicateForAppleBalanceAccountDetailsPID:(int64_t)a3;
+ (id)_propertySettersForAppleBalanceAccountSummary;
+ (id)appleBalanceAccountSummaryForAppleBalanceAccountDetailsPID:(int64_t)a3 inDatabase:(id)a4;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertAppleBalanceAccountSummary:(id)a3 forAppleBalanceAccountDetailsPID:(int64_t)a4 inDatabase:(id)a5;
+ (void)deleteAppleBalanceAccountSummaryForAppleBalanceAccountDetailsPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)updateAppleBalanceAccountSummary:(id)a3 forAppleBalanceAccountDetailsPID:(int64_t)a4 inDatabase:(id)a5;
- (AppleBalanceAccountSummary)initWithAppleBalanceAccountSummary:(id)a3 forAppleBalanceAccountDetailsPID:(int64_t)a4 inDatabase:(id)a5;
- (id)appleBalanceAccountSummary;
- (void)updateWithAppleBalanceAccountSummary:(id)a3;
@end

@implementation AppleBalanceAccountSummary

+ (id)databaseTable
{
  return @"celery";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class(&OBJC_CLASS___AppleBalanceAccountDetails, a2) == a3) {
    return @"pid";
  }
  else {
    return 0LL;
  }
}

- (AppleBalanceAccountSummary)initWithAppleBalanceAccountSummary:(id)a3 forAppleBalanceAccountDetailsPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v11 = objc_msgSend((id)objc_opt_class(self, v10), "_commonDictionaryForAppleBalanceAccountSummary:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  [v12 setObjectOrNull:v13 forKey:@"a"];

  v14 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v12, v8);
  v15 = v14;

  return v15;
}

+ (id)insertAppleBalanceAccountSummary:(id)a3 forAppleBalanceAccountDetailsPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [objc_alloc((Class)a1) initWithAppleBalanceAccountSummary:v9 forAppleBalanceAccountDetailsPID:a4 inDatabase:v8];

  return v10;
}

+ (void)deleteAppleBalanceAccountSummaryForAppleBalanceAccountDetailsPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAppleBalanceAccountDetailsPID:a3]);
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  [v8 deleteFromDatabase];
}

+ (id)appleBalanceAccountSummaryForAppleBalanceAccountDetailsPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAppleBalanceAccountDetailsPID:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 appleBalanceAccountSummary]);
  return v9;
}

+ (void)updateAppleBalanceAccountSummary:(id)a3 forAppleBalanceAccountDetailsPID:(int64_t)a4 inDatabase:(id)a5
{
  id v12 = a3;
  id v8 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAppleBalanceAccountDetailsPID:a4]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v8 predicate:v9]);

  if (v10) {
    [v10 updateWithAppleBalanceAccountSummary:v12];
  }
  else {
    id v11 =  +[AppleBalanceAccountSummary insertAppleBalanceAccountSummary:forAppleBalanceAccountDetailsPID:inDatabase:]( &OBJC_CLASS___AppleBalanceAccountSummary,  "insertAppleBalanceAccountSummary:forAppleBalanceAccountDetailsPID:inDatabase:",  v12,  a4,  v8);
  }
}

- (void)updateWithAppleBalanceAccountSummary:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend((id)objc_opt_class(self, v5), "_commonDictionaryForAppleBalanceAccountSummary:", v4);
  id v7 = (id)objc_claimAutoreleasedReturnValue(v6);

  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v7);
}

+ (id)_predicateForAppleBalanceAccountDetailsPID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"a",  v3));

  return v4;
}

+ (id)_propertySettersForAppleBalanceAccountSummary
{
  v3 = @"b";
  id v4 = &stru_10064AE58;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v4,  &v3,  1LL));
}

- (id)appleBalanceAccountSummary
{
  v3 = objc_alloc_init(&OBJC_CLASS___PKAppleBalanceAccountSummary);
  id v5 = objc_msgSend((id)objc_opt_class(self, v4), "_propertySettersForAppleBalanceAccountSummary");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1001C2150;
  v13[3] = &unk_100638EF0;
  v13[4] = self;
  id v14 = v6;
  id v8 = v3;
  v15 = v8;
  id v9 = v6;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v7, v13);

  id v10 = v15;
  id v11 = v8;

  return v11;
}

+ (id)_commonDictionaryForAppleBalanceAccountSummary:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 currentBalance]);

  uint64_t v6 = PKCurrencyDecimalToStorageNumber(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v7, @"b");

  return v4;
}

@end