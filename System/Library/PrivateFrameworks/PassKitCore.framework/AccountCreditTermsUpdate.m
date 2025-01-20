@interface AccountCreditTermsUpdate
+ (id)_predicateForEventPID:(int64_t)a3;
+ (id)_propertySettersForAccountCreditTermsUpdate;
+ (id)creditTermsUpdatesWithEventPID:(int64_t)a3 inDatabase:(id)a4;
+ (id)databaseTable;
+ (id)insertCreditTermsUpdate:(id)a3 forEventPID:(int64_t)a4 inDatabase:(id)a5;
+ (void)deleteCreditTermsUpdatesWithEventPID:(int64_t)a3 inDatabase:(id)a4;
- (BOOL)deleteFromDatabase;
- (id)creditLimit;
- (id)creditTermsUpdate;
@end

@implementation AccountCreditTermsUpdate

+ (id)creditTermsUpdatesWithEventPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForEventPID:a3]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  v21 = @"pid";
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v21, 1LL));
  v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472LL;
  v17 = sub_10037AD04;
  v18 = &unk_100639E18;
  id v19 = v6;
  id v20 = v9;
  id v11 = v9;
  id v12 = v6;
  [v8 enumeratePersistentIDsAndProperties:v10 usingBlock:&v15];

  id v13 = objc_msgSend(v11, "copy", v15, v16, v17, v18);
  return v13;
}

+ (id)insertCreditTermsUpdate:(id)a3 forEventPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 creditLimit]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 amount]);
  uint64_t v13 = PKCurrencyDecimalToStorageNumber(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

  [v10 setObjectOrNull:v14 forKey:@"f"];
  v15 = (void *)objc_claimAutoreleasedReturnValue([v8 creditLimit]);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 currency]);
  [v10 setObjectOrNull:v16 forKey:@"g"];

  v17 = (void *)objc_claimAutoreleasedReturnValue([v8 requestIdentifier]);
  [v10 setObjectOrNull:v17 forKey:@"d"];

  v18 = (void *)objc_claimAutoreleasedReturnValue([v8 adverseActionContentIdentifier]);
  [v10 setObjectOrNull:v18 forKey:@"e"];

  objc_msgSend(v10, "setInteger:forKey:", objc_msgSend(v8, "type"), @"b");
  objc_msgSend(v10, "setInteger:forKey:", objc_msgSend(v8, "initiator"), @"c");
  id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  [v10 setObject:v19 forKey:@"a"];

  id v20 = [objc_alloc((Class)a1) initWithPropertyValues:v10 inDatabase:v9];
  if (v20)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue([v8 rates]);
    id v22 =  +[CreditAccountRates insertAccountRates:forCreditTermsUpdatePID:inDatabase:]( CreditAccountRates,  "insertAccountRates:forCreditTermsUpdatePID:inDatabase:",  v21,  [v20 persistentID],  v9);
  }

  return v20;
}

- (id)creditTermsUpdate
{
  v3 = objc_alloc_init(&OBJC_CLASS___PKAccountCreditTermsUpdate);
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[AccountCreditTermsUpdate _propertySettersForAccountCreditTermsUpdate]( &OBJC_CLASS___AccountCreditTermsUpdate,  "_propertySettersForAccountCreditTermsUpdate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allKeys]);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10037B04C;
  v10[3] = &unk_100638EF0;
  id v11 = v4;
  id v6 = v3;
  id v12 = v6;
  uint64_t v13 = self;
  id v7 = v4;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v5, v10);

  id v8 = v6;
  return v8;
}

- (id)creditLimit
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"f"));
  uint64_t v4 = PKCurrencyStorageNumberToCurrencyDecimal(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"g"));
  if (v5)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDecimalNumber notANumber](&OBJC_CLASS___NSDecimalNumber, "notANumber"));
    unsigned __int8 v8 = [v5 isEqualToNumber:v7];

    id v9 = 0LL;
    if ((v8 & 1) == 0 && v6) {
      id v9 = -[PKCurrencyAmount initWithAmount:currency:exponent:]( objc_alloc(&OBJC_CLASS___PKCurrencyAmount),  "initWithAmount:currency:exponent:",  v5,  v6,  0LL);
    }
  }

  else
  {
    id v9 = 0LL;
  }

  return v9;
}

+ (void)deleteCreditTermsUpdatesWithEventPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForEventPID:a3]);
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);

  [v8 deleteAllEntities];
}

- (BOOL)deleteFromDatabase
{
  int64_t v3 = -[SQLiteEntity persistentID](self, "persistentID");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  +[CreditAccountRates deleteCreditAccountRatesForCreditTermsUpdatePID:inDatabase:]( &OBJC_CLASS___CreditAccountRates,  "deleteCreditAccountRatesForCreditTermsUpdatePID:inDatabase:",  v3,  v4);

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___AccountCreditTermsUpdate;
  return -[SQLiteEntity deleteFromDatabase](&v6, "deleteFromDatabase");
}

+ (id)databaseTable
{
  return @"watermelons";
}

+ (id)_predicateForEventPID:(int64_t)a3
{
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"a",  v3));

  return v4;
}

+ (id)_propertySettersForAccountCreditTermsUpdate
{
  v3[0] = @"d";
  v3[1] = @"e";
  v4[0] = &stru_1006586D8;
  v4[1] = &stru_1006586F8;
  v3[2] = @"b";
  v3[3] = @"c";
  v4[2] = &stru_100658718;
  v4[3] = &stru_100658738;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  4LL));
}

@end