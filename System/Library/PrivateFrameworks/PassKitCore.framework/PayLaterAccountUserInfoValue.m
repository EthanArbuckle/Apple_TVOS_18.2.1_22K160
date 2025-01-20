@interface PayLaterAccountUserInfoValue
+ (id)_commonDictionaryForAccountUserInfoValue:(id)a3;
+ (id)_predicateForPID:(int64_t)a3;
+ (id)_predicateForUserInfoPID:(int64_t)a3;
+ (id)_propertySettersForPayLaterAccountUserInfoValue;
+ (id)databaseTable;
+ (id)insertPayLaterAccountUserInfoValue:(id)a3 userInfoPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)payLaterAccountUserInfoValueForPID:(id)a3 inDatabase:(id)a4;
+ (void)deletePayLaterAccountUserInfoValueForUserInfoPID:(int64_t)a3 inDatabase:(id)a4;
- (BOOL)deleteFromDatabase;
- (PayLaterAccountUserInfoValue)initWithPayLaterAccountUserInfoValue:(id)a3 userInfoPID:(int64_t)a4 inDatabase:(id)a5;
- (id)_currencyAmount;
- (id)userInfoValue;
@end

@implementation PayLaterAccountUserInfoValue

+ (id)databaseTable
{
  return @"splitpea";
}

- (PayLaterAccountUserInfoValue)initWithPayLaterAccountUserInfoValue:(id)a3 userInfoPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v11 = objc_msgSend((id)objc_opt_class(self, v10), "_commonDictionaryForAccountUserInfoValue:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  [v12 setObjectOrNull:v13 forKey:@"a"];

  v14 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v12, v8);
  v15 = v14;

  return v15;
}

+ (id)insertPayLaterAccountUserInfoValue:(id)a3 userInfoPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v11 = objc_msgSend( objc_alloc((Class)objc_opt_class(a1, v10)),  "initWithPayLaterAccountUserInfoValue:userInfoPID:inDatabase:",  v9,  a4,  v8);

  return v11;
}

+ (void)deletePayLaterAccountUserInfoValueForUserInfoPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForUserInfoPID:a3]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

- (BOOL)deleteFromDatabase
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PayLaterAccountUserInfoValue;
  return -[SQLiteEntity deleteFromDatabase](&v3, "deleteFromDatabase");
}

+ (id)payLaterAccountUserInfoValueForPID:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_predicateForPID:", objc_msgSend(a3, "longLongValue")));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 userInfoValue]);
  return v9;
}

+ (id)_predicateForPID:(int64_t)a3
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"pid",  v3));

  return v4;
}

+ (id)_predicateForUserInfoPID:(int64_t)a3
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"a",  v3));

  return v4;
}

+ (id)_propertySettersForPayLaterAccountUserInfoValue
{
  v3[0] = @"b";
  v3[1] = @"c";
  v4[0] = &stru_1006540F8;
  v4[1] = &stru_100654118;
  v3[2] = @"f";
  v3[3] = @"g";
  v4[2] = &stru_100654138;
  v4[3] = &stru_100654158;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  4LL));
}

- (id)userInfoValue
{
  objc_super v3 = objc_alloc_init(&OBJC_CLASS___PKPayLaterAccountUserInfoValue);
  id v5 = objc_msgSend((id)objc_opt_class(self, v4), "_propertySettersForPayLaterAccountUserInfoValue");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1002DB0D8;
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

- (id)_currencyAmount
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"d"));
  uint64_t v4 = PKCurrencyStorageNumberToCurrencyDecimal(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  uint64_t v6 = objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"e"));
  v7 = (void *)v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    uint64_t v10 = 0LL;
  }

  else
  {
    uint64_t v9 = PKCurrencyAmountMake(v5, v6);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  }

  return v10;
}

+ (id)_commonDictionaryForAccountUserInfoValue:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 text]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v5, @"b");

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v3 date]);
  v7 = (void *)_SQLValueForDate(v6);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v7, @"c");

  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v3 currencyAmount]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 amount]);
  uint64_t v10 = PKCurrencyDecimalToStorageNumber(v9);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v11, @"d");

  v12 = (void *)objc_claimAutoreleasedReturnValue([v3 currencyAmount]);
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 currency]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v13, @"e");

  id v14 = (void *)objc_claimAutoreleasedReturnValue([v3 odiAttribute]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v14, @"f");

  id v15 = [v3 hasHiddenValue];
  -[NSMutableDictionary setBool:forKey:](v4, "setBool:forKey:", v15, @"g");
  return v4;
}

@end