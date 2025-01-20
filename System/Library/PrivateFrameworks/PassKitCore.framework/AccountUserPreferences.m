@interface AccountUserPreferences
+ (id)_predicateForAccountUserPID:(id)a3;
+ (id)_propertySettersForAccountUserPreferences;
+ (id)_propertyValuesForAccountUserPreferences:(id)a3;
+ (id)anyInDatabase:(id)a3 forAccountUserPID:(id)a4;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertOrUpdateAccountUserPreferences:(id)a3 forAccountUserPID:(id)a4 inDatabase:(id)a5;
- (AccountUserPreferences)initWithAccountUserPreferences:(id)a3 accountUserPID:(id)a4 inDatabase:(id)a5;
- (id)accountUserPreferences;
- (void)updateWithAccountUserPreferences:(id)a3;
@end

@implementation AccountUserPreferences

+ (id)databaseTable
{
  return @"prickly_pear";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class(&OBJC_CLASS___AccountUser, a2) == a3) {
    return @"a";
  }
  else {
    return 0LL;
  }
}

+ (id)insertOrUpdateAccountUserPreferences:(id)a3 forAccountUserPID:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v10 forAccountUserPID:v9]);
  if (v11)
  {
    id v12 = v11;
    [v11 updateWithAccountUserPreferences:v8];
  }

  else
  {
    id v12 = [objc_alloc((Class)a1) initWithAccountUserPreferences:v8 accountUserPID:v9 inDatabase:v10];
  }

  return v12;
}

- (AccountUserPreferences)initWithAccountUserPreferences:(id)a3 accountUserPID:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v12 = objc_msgSend((id)objc_opt_class(self, v11), "_propertyValuesForAccountUserPreferences:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  id v14 = [v13 mutableCopy];
  [v14 setObjectOrNull:v9 forKey:@"a"];

  v15 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v14, v8);
  return v15;
}

- (void)updateWithAccountUserPreferences:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend((id)objc_opt_class(self, v5), "_propertyValuesForAccountUserPreferences:", v4);
  id v7 = (id)objc_claimAutoreleasedReturnValue(v6);

  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v7);
}

+ (id)anyInDatabase:(id)a3 forAccountUserPID:(id)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountUserPID:a4]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  return v8;
}

- (id)accountUserPreferences
{
  v3 = objc_alloc_init(&OBJC_CLASS___PKAccountUserPreferences);
  id v5 = objc_msgSend((id)objc_opt_class(self, v4), "_propertySettersForAccountUserPreferences");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1003D4440;
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

+ (id)_predicateForAccountUserPID:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"a",  a3);
}

+ (id)_propertyValuesForAccountUserPreferences:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setBool:forKey:]( v4,  "setBool:forKey:",  [v3 transactionSpendLimitEnabled],  @"b");
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 transactionSpendLimitAmount]);
  uint64_t v6 = PKCurrencyDecimalToStorageNumber(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v7, @"c");

  -[NSMutableDictionary setBool:forKey:]( v4,  "setBool:forKey:",  [v3 monthlySpendLimitEnabled],  @"d");
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 monthlySpendLimitAmount]);
  uint64_t v9 = PKCurrencyDecimalToStorageNumber(v8);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v10, @"e");

  -[NSMutableDictionary setBool:forKey:](v4, "setBool:forKey:", [v3 spendingEnabled], @"f");
  id v11 = [v3 showAvailableCredit];

  -[NSMutableDictionary setBool:forKey:](v4, "setBool:forKey:", v11, @"g");
  id v12 = -[NSMutableDictionary copy](v4, "copy");

  return v12;
}

+ (id)_propertySettersForAccountUserPreferences
{
  v3[0] = @"b";
  v3[1] = @"c";
  v4[0] = &stru_10065C220;
  v4[1] = &stru_10065C240;
  v3[2] = @"d";
  v3[3] = @"e";
  v4[2] = &stru_10065C260;
  v4[3] = &stru_10065C280;
  v3[4] = @"f";
  v3[5] = @"g";
  v4[4] = &stru_10065C2A0;
  v4[5] = &stru_10065C2C0;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  6LL));
}

@end