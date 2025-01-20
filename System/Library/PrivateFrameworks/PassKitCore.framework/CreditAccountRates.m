@interface CreditAccountRates
+ (id)_predicateForCreditAccountDetailsPID:(int64_t)a3;
+ (id)_predicateForCreditTermsUpdatePID:(int64_t)a3;
+ (id)_propertySettersForCreditAccountRates;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)creditAccountRatesForCreditAccountDetailsPID:(int64_t)a3 inDatabase:(id)a4;
+ (id)creditAccountRatesForCreditTermsUpdatePID:(int64_t)a3 inDatabase:(id)a4;
+ (id)databaseTable;
+ (id)insertAccountRates:(id)a3 forCreditAccountDetailsPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)insertAccountRates:(id)a3 forCreditTermsUpdatePID:(int64_t)a4 inDatabase:(id)a5;
+ (void)deleteCreditAccountRatesForCreditAccountDetailsPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deleteCreditAccountRatesForCreditTermsUpdatePID:(int64_t)a3 inDatabase:(id)a4;
+ (void)updateCreditAccountRates:(id)a3 forCreditAccountDetailsPID:(int64_t)a4 inDatabase:(id)a5;
- (CreditAccountRates)initWithCreditAccountRates:(id)a3 forCreditAccountDetailsPID:(int64_t)a4 inDatabase:(id)a5;
- (CreditAccountRates)initWithCreditAccountRates:(id)a3 forCreditTermsUpdatePID:(int64_t)a4 inDatabase:(id)a5;
- (id)creditAccountRates;
- (void)updateWithCreditAccountRates:(id)a3;
@end

@implementation CreditAccountRates

+ (id)databaseTable
{
  return @"cucumbers";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class(&OBJC_CLASS___CreditAccountDetails, a2) == a3) {
    return @"a";
  }
  if ((Class)objc_opt_class(&OBJC_CLASS___AccountCreditTermsUpdate, v4) == a3) {
    return @"c";
  }
  return 0LL;
}

- (CreditAccountRates)initWithCreditAccountRates:(id)a3 forCreditAccountDetailsPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  [v10 setObjectOrNull:v11 forKey:@"a"];

  v12 = (void *)objc_claimAutoreleasedReturnValue([v9 aprForPurchases]);
  v13 = +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  PKPercentageDecimalToStorageInteger(v12));
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  [v10 setObjectOrNull:v14 forKey:@"b"];

  v15 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v10, v8);
  return v15;
}

- (CreditAccountRates)initWithCreditAccountRates:(id)a3 forCreditTermsUpdatePID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  [v10 setObjectOrNull:v11 forKey:@"c"];

  v12 = (void *)objc_claimAutoreleasedReturnValue([v9 aprForPurchases]);
  v13 = +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  PKPercentageDecimalToStorageInteger(v12));
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  [v10 setObjectOrNull:v14 forKey:@"b"];

  v15 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v10, v8);
  return v15;
}

+ (id)insertAccountRates:(id)a3 forCreditAccountDetailsPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [objc_alloc((Class)a1) initWithCreditAccountRates:v9 forCreditAccountDetailsPID:a4 inDatabase:v8];

  return v10;
}

+ (id)insertAccountRates:(id)a3 forCreditTermsUpdatePID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [objc_alloc((Class)a1) initWithCreditAccountRates:v9 forCreditTermsUpdatePID:a4 inDatabase:v8];

  return v10;
}

+ (void)deleteCreditAccountRatesForCreditAccountDetailsPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForCreditAccountDetailsPID:a3]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

+ (void)deleteCreditAccountRatesForCreditTermsUpdatePID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForCreditTermsUpdatePID:a3]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

+ (id)creditAccountRatesForCreditAccountDetailsPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForCreditAccountDetailsPID:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 creditAccountRates]);
  return v9;
}

+ (id)creditAccountRatesForCreditTermsUpdatePID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForCreditTermsUpdatePID:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 creditAccountRates]);
  return v9;
}

+ (void)updateCreditAccountRates:(id)a3 forCreditAccountDetailsPID:(int64_t)a4 inDatabase:(id)a5
{
  id v12 = a3;
  id v8 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForCreditAccountDetailsPID:a4]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v8 predicate:v9]);

  if (v10) {
    [v10 updateWithCreditAccountRates:v12];
  }
  else {
    id v11 =  +[CreditAccountRates insertAccountRates:forCreditAccountDetailsPID:inDatabase:]( &OBJC_CLASS___CreditAccountRates,  "insertAccountRates:forCreditAccountDetailsPID:inDatabase:",  v12,  a4,  v8);
  }
}

- (void)updateWithCreditAccountRates:(id)a3
{
  id v4 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 aprForPurchases]);

  id v6 = +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  PKPercentageDecimalToStorageInteger(v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  [v8 setObjectOrNull:v7 forKey:@"b"];

  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v8);
}

+ (id)_predicateForCreditAccountDetailsPID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"a",  v3));

  return v4;
}

+ (id)_predicateForCreditTermsUpdatePID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"c",  v3));

  return v4;
}

+ (id)_propertySettersForCreditAccountRates
{
  v3 = @"b";
  id v4 = &stru_10064A168;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v4,  &v3,  1LL));
}

- (id)creditAccountRates
{
  v3 = objc_alloc_init(&OBJC_CLASS___PKCreditAccountRates);
  id v5 = objc_msgSend((id)objc_opt_class(self, v4), "_propertySettersForCreditAccountRates");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1001B5CAC;
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

@end