@interface PayLaterAccountProductEligibleSpend
+ (id)_commonDictionaryForProductEligibleSpend:(id)a3;
+ (id)_predicateForProductPID:(int64_t)a3;
+ (id)_propertySettersForPayLaterAccountProductEligibleSpend;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertOrUpdatePayLaterProductEligibleSpend:(id)a3 forPayLaterAccountProductPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)payLaterProductEligibleSpendForProductPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deletePayLaterProductEligibleSpendForPayLaterProductPID:(int64_t)a3 inDatabase:(id)a4;
- (BOOL)deleteFromDatabase;
- (PayLaterAccountProductEligibleSpend)initWithAccountProductEligibleSpend:(id)a3 forPayLaterAccountProductPID:(int64_t)a4 inDatabase:(id)a5;
- (id)_availableToSpend;
- (id)eligbleSpend;
- (void)updateWitProductEligibleSpend:(id)a3;
@end

@implementation PayLaterAccountProductEligibleSpend

+ (id)databaseTable
{
  return @"quinoa";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class(&OBJC_CLASS___PayLaterAccountProduct, a2) == a3) {
    return @"a";
  }
  else {
    return 0LL;
  }
}

- (PayLaterAccountProductEligibleSpend)initWithAccountProductEligibleSpend:(id)a3 forPayLaterAccountProductPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v11 = objc_msgSend((id)objc_opt_class(self, v10), "_commonDictionaryForProductEligibleSpend:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  [v12 setObjectOrNull:v13 forKey:@"a"];

  v14 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v12, v8);
  v15 = v14;

  return v15;
}

+ (id)insertOrUpdatePayLaterProductEligibleSpend:(id)a3 forPayLaterAccountProductPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v8)
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForProductPID:a4]);
    id v11 = (id)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v9 predicate:v10]);

    if (v11) {
      [v11 updateWitProductEligibleSpend:v8];
    }
    else {
      id v11 = objc_msgSend( objc_alloc((Class)objc_opt_class(a1, v12)),  "initWithAccountProductEligibleSpend:forPayLaterAccountProductPID:inDatabase:",  v8,  a4,  v9);
    }
    id v13 = [v11 persistentID];
    v14 = (void *)objc_claimAutoreleasedReturnValue([v8 financingOptions]);
    id v15 =  +[PayLaterFinancingOption insertOrUpdatePayLaterFinancingOptions:forEligibleSpendPID:inDatabase:]( &OBJC_CLASS___PayLaterFinancingOption,  "insertOrUpdatePayLaterFinancingOptions:forEligibleSpendPID:inDatabase:",  v14,  v13,  v9);
  }

  else
  {
    [a1 deletePayLaterProductEligibleSpendForPayLaterProductPID:a4 inDatabase:v9];
    id v11 = 0LL;
  }

  return v11;
}

+ (void)deletePayLaterProductEligibleSpendForPayLaterProductPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForProductPID:a3]);
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  [v8 deleteFromDatabase];
}

+ (id)payLaterProductEligibleSpendForProductPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForProductPID:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 eligbleSpend]);
  return v9;
}

- (BOOL)deleteFromDatabase
{
  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  +[PayLaterFinancingOption deletePayLaterPayLaterFinancingOptionsForEligibleSpendPID:inDatabase:]( &OBJC_CLASS___PayLaterFinancingOption,  "deletePayLaterPayLaterFinancingOptionsForEligibleSpendPID:inDatabase:",  -[SQLiteEntity persistentID](v2, "persistentID"),  v3);
  v5.receiver = v2;
  v5.super_class = (Class)&OBJC_CLASS___PayLaterAccountProductEligibleSpend;
  LOBYTE(v2) = -[SQLiteEntity deleteFromDatabase](&v5, "deleteFromDatabase");

  return (char)v2;
}

- (void)updateWitProductEligibleSpend:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend((id)objc_opt_class(self, v5), "_commonDictionaryForProductEligibleSpend:", v4);
  id v11 = (id)objc_claimAutoreleasedReturnValue(v6);
  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 financingOptions]);

  int64_t v8 = -[SQLiteEntity persistentID](self, "persistentID");
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  id v10 =  +[PayLaterFinancingOption insertOrUpdatePayLaterFinancingOptions:forEligibleSpendPID:inDatabase:]( &OBJC_CLASS___PayLaterFinancingOption,  "insertOrUpdatePayLaterFinancingOptions:forEligibleSpendPID:inDatabase:",  v7,  v8,  v9);
}

+ (id)_predicateForProductPID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"a",  v3));

  return v4;
}

+ (id)_propertySettersForPayLaterAccountProductEligibleSpend
{
  v3 = @"b";
  id v4 = &stru_10063D610;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v4,  &v3,  1LL));
}

- (id)eligbleSpend
{
  v3 = objc_alloc_init(&OBJC_CLASS___PKPayLaterAccountProductEligibleSpend);
  id v5 = objc_msgSend((id)objc_opt_class(self, v4), "_propertySettersForPayLaterAccountProductEligibleSpend");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100061AA0;
  v16[3] = &unk_100638EF0;
  v16[4] = self;
  id v17 = v6;
  int64_t v8 = v3;
  v18 = v8;
  id v9 = v6;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v7, v16);

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[PayLaterAccountProductEligibleSpend _availableToSpend](self, "_availableToSpend"));
  -[PKPayLaterAccountProductEligibleSpend setAvailableToSpend:](v8, "setAvailableToSpend:", v10);

  int64_t v11 = -[SQLiteEntity persistentID](self, "persistentID");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[PayLaterFinancingOption payLaterPayLaterFinancingOptionsForEligibleSpendPID:inDatabase:]( &OBJC_CLASS___PayLaterFinancingOption,  "payLaterPayLaterFinancingOptionsForEligibleSpendPID:inDatabase:",  v11,  v12));

  -[PKPayLaterAccountProductEligibleSpend setFinancingOptions:](v8, "setFinancingOptions:", v13);
  v14 = v8;

  return v14;
}

- (id)_availableToSpend
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"c"));
  uint64_t v4 = PKCurrencyStorageNumberToCurrencyDecimal(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  uint64_t v6 = objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"d"));
  v7 = (void *)v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    id v10 = 0LL;
  }

  else
  {
    uint64_t v9 = PKCurrencyAmountMake(v5, v6);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  }

  return v10;
}

+ (id)_commonDictionaryForProductEligibleSpend:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 expirationDate]);
  uint64_t v6 = (void *)_SQLValueForDate(v5);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v6, @"b");

  v7 = (void *)objc_claimAutoreleasedReturnValue([v3 availableToSpend]);
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v7 amount]);
  uint64_t v9 = PKCurrencyDecimalToStorageNumber(v8);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v10, @"c");

  int64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v3 availableToSpend]);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 currency]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v12, @"d");

  return v4;
}

@end