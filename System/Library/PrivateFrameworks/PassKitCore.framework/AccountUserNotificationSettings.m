@interface AccountUserNotificationSettings
+ (id)_predicateForAccountUserPID:(id)a3;
+ (id)_propertySettersForAccountUserNotificationSettings;
+ (id)_propertyValuesForAccountUserNotificationSettings:(id)a3;
+ (id)anyInDatabase:(id)a3 forAccountUserPID:(id)a4;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertOrUpdateAccountUserNotificationSettings:(id)a3 forAccountUserPID:(id)a4 inDatabase:(id)a5;
- (AccountUserNotificationSettings)initWithAccountUserNotificationSettings:(id)a3 accountUserPID:(id)a4 inDatabase:(id)a5;
- (id)accountUserNotificationSettings;
- (void)updateWithAccountUserNotificationSettings:(id)a3;
@end

@implementation AccountUserNotificationSettings

+ (id)databaseTable
{
  return @"mulberry";
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

+ (id)insertOrUpdateAccountUserNotificationSettings:(id)a3 forAccountUserPID:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v10 forAccountUserPID:v9]);
  if (v11)
  {
    id v12 = v11;
    [v11 updateWithAccountUserNotificationSettings:v8];
  }

  else
  {
    id v12 = [objc_alloc((Class)a1) initWithAccountUserNotificationSettings:v8 accountUserPID:v9 inDatabase:v10];
  }

  return v12;
}

- (AccountUserNotificationSettings)initWithAccountUserNotificationSettings:(id)a3 accountUserPID:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v12 = objc_msgSend((id)objc_opt_class(self, v11), "_propertyValuesForAccountUserNotificationSettings:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  id v14 = [v13 mutableCopy];
  [v14 setObjectOrNull:v9 forKey:@"a"];

  v15 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v14, v8);
  return v15;
}

- (void)updateWithAccountUserNotificationSettings:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend((id)objc_opt_class(self, v5), "_propertyValuesForAccountUserNotificationSettings:", v4);
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

- (id)accountUserNotificationSettings
{
  v3 = objc_alloc_init(&OBJC_CLASS___PKAccountUserNotificationSettings);
  id v5 = objc_msgSend((id)objc_opt_class(self, v4), "_propertySettersForAccountUserNotificationSettings");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1002EB150;
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

+ (id)_propertyValuesForAccountUserNotificationSettings:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setBool:forKey:]( v4,  "setBool:forKey:",  [v3 transactionNotificationsEnabled],  @"b");
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 transactionNotificationThreshold]);
  uint64_t v6 = PKCurrencyDecimalToStorageNumber(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v7, @"c");

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 monthlySpendNotificationThreshold]);
  uint64_t v9 = PKCurrencyDecimalToStorageNumber(v8);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v10, @"d");

  id v11 = -[NSMutableDictionary copy](v4, "copy");
  return v11;
}

+ (id)_propertySettersForAccountUserNotificationSettings
{
  v3[0] = @"b";
  v3[1] = @"c";
  v4[0] = &stru_100654970;
  v4[1] = &stru_100654990;
  v3[2] = @"d";
  v4[2] = &stru_1006549B0;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  3LL));
}

@end