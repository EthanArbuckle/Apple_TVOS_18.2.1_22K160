@interface AppleBalancePromotionConfiguration
+ (id)_commonDictionaryForAppleBalancePromotionConfiguration:(id)a3;
+ (id)_predicateForAccountPID:(int64_t)a3;
+ (id)_propertySettersForAppleBalancePromotionConfiguration;
+ (id)appleBalancePromotionConfigurationForAccountPID:(int64_t)a3 inDatabase:(id)a4;
+ (id)databaseTable;
+ (id)deleteAppleBalancePromotionConfigurationForAccountPID:(int64_t)a3 inDatabase:(id)a4;
+ (id)insertAppleBalancePromotionConfiguration:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)insertOrUpdateAppleBalancePromotionConfiguration:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5;
- (AppleBalancePromotionConfiguration)initWithAppleBalancePromotionConfiguration:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5;
- (id)appleBalancePromotionConfiguration;
- (void)updateWithAppleBalancePromotionConfiguration:(id)a3;
@end

@implementation AppleBalancePromotionConfiguration

+ (id)databaseTable
{
  return @"apple_balance_dtu_promotion_configuration";
}

- (AppleBalancePromotionConfiguration)initWithAppleBalancePromotionConfiguration:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v11 = objc_msgSend((id)objc_opt_class(self, v10), "_commonDictionaryForAppleBalancePromotionConfiguration:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  [v12 setObjectOrNull:v13 forKey:@"a"];

  v14 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v12, v8);
  v15 = v14;

  return v15;
}

+ (id)insertAppleBalancePromotionConfiguration:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5
{
  if (a3)
  {
    id v8 = a5;
    id v9 = a3;
    id v10 = [objc_alloc((Class)a1) initWithAppleBalancePromotionConfiguration:v9 forAccountPID:a4 inDatabase:v8];
  }

  else
  {
    id v10 = 0LL;
  }

  return v10;
}

+ (id)deleteAppleBalancePromotionConfigurationForAccountPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountPID:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 appleBalancePromotionConfiguration]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 uniqueIdentifier]);

  else {
    id v11 = 0LL;
  }
  id v12 = v11;

  return v12;
}

+ (id)insertOrUpdateAppleBalancePromotionConfiguration:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountPID:a4]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v8 predicate:v10]);

  if (v11) {
    [v11 updateWithAppleBalancePromotionConfiguration:v9];
  }
  else {
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[AppleBalancePromotionConfiguration insertAppleBalancePromotionConfiguration:forAccountPID:inDatabase:]( &OBJC_CLASS___AppleBalancePromotionConfiguration,  "insertAppleBalancePromotionConfiguration:forAccountPID:inDatabase:",  v9,  a4,  v8));
  }

  return v11;
}

- (void)updateWithAppleBalancePromotionConfiguration:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend((id)objc_opt_class(self, v5), "_commonDictionaryForAppleBalancePromotionConfiguration:", v4);
  id v7 = (id)objc_claimAutoreleasedReturnValue(v6);

  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v7);
}

+ (id)appleBalancePromotionConfigurationForAccountPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountPID:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 appleBalancePromotionConfiguration]);
  return v9;
}

- (id)appleBalancePromotionConfiguration
{
  v3 = objc_alloc_init(&OBJC_CLASS___PKAppleBalancePromotionConfiguration);
  id v5 = objc_msgSend((id)objc_opt_class(self, v4), "_propertySettersForAppleBalancePromotionConfiguration");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100293ECC;
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

+ (id)_propertySettersForAppleBalancePromotionConfiguration
{
  v3[0] = @"b";
  v3[1] = @"c";
  v4[0] = &stru_100651B88;
  v4[1] = &stru_100651BA8;
  v3[2] = @"d";
  v3[3] = @"e";
  v4[2] = &stru_100651BC8;
  v4[3] = &stru_100651BE8;
  v3[4] = @"f";
  v3[5] = @"g";
  v4[4] = &stru_100651C08;
  v4[5] = &stru_100651C28;
  v3[6] = @"h";
  v3[7] = @"i";
  v4[6] = &stru_100651C48;
  v4[7] = &stru_100651C68;
  v3[8] = @"j";
  v3[9] = @"k";
  v4[8] = &stru_100651C88;
  v4[9] = &stru_100651CA8;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  10LL));
}

+ (id)_predicateForAccountPID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"a",  v3));

  return v4;
}

+ (id)_commonDictionaryForAppleBalancePromotionConfiguration:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v3 promotionType]));
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v5, @"b");

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 programIdentifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v6, @"c");

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 versionIdentifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v7, @"d");

  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v3 generationIdentifier]));
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v8, @"e");

  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v3 stamp]));
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v9, @"f");

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v3 bonusMinAmount]);
  uint64_t v11 = PKCurrencyDecimalToStorageNumber(v10);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v12, @"g");

  v13 = (void *)objc_claimAutoreleasedReturnValue([v3 bonusMaxAmount]);
  uint64_t v14 = PKCurrencyDecimalToStorageNumber(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v15, @"h");

  v16 = (void *)objc_claimAutoreleasedReturnValue([v3 offerText]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v16, @"i");

  v17 = (void *)objc_claimAutoreleasedReturnValue([v3 conditionText]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v17, @"j");

  v18 = (void *)objc_claimAutoreleasedReturnValue([v3 lastUpdatedDate]);
  v19 = (void *)_SQLValueForDate(v18);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v19, @"k");

  return v4;
}

@end