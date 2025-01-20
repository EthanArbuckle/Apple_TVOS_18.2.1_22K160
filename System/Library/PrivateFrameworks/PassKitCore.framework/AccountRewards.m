@interface AccountRewards
+ (id)_predicateForEventPID:(int64_t)a3;
+ (id)_propertySettersForAccountRewards;
+ (id)databaseTable;
+ (id)insertRewards:(id)a3 forEventPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)rewardsWithEventPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deleteRewardsWithEventPID:(int64_t)a3 inDatabase:(id)a4;
- (BOOL)deleteFromDatabase;
- (id)currencyAmount;
- (id)rewards;
@end

@implementation AccountRewards

+ (id)rewardsWithEventPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForEventPID:a3]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  v21 = @"pid";
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v21, 1LL));
  v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472LL;
  v17 = sub_100067374;
  v18 = &unk_100639E18;
  id v19 = v6;
  id v20 = v9;
  id v11 = v9;
  id v12 = v6;
  [v8 enumeratePersistentIDsAndProperties:v10 usingBlock:&v15];

  id v13 = objc_msgSend(v11, "copy", v15, v16, v17, v18);
  return v13;
}

+ (id)insertRewards:(id)a3 forEventPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 currencyAmount]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 amount]);
  uint64_t v13 = PKCurrencyDecimalToStorageNumber(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

  v15 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
  [v10 setObjectOrNull:v15 forKey:@"b"];

  [v10 setObjectOrNull:v14 forKey:@"c"];
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v9 currencyAmount]);
  v17 = (void *)objc_claimAutoreleasedReturnValue([v16 currency]);
  [v10 setObjectOrNull:v17 forKey:@"d"];

  v18 = (void *)objc_claimAutoreleasedReturnValue([v9 status]);
  [v10 setObjectOrNull:v18 forKey:@"f"];

  objc_msgSend(v10, "setInteger:forKey:", objc_msgSend(v9, "type"), @"e");
  objc_msgSend(v10, "setInteger:forKey:", objc_msgSend(v9, "statusCode"), @"g");
  id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  [v10 setObject:v19 forKey:@"a"];

  id v20 = [objc_alloc((Class)a1) initWithPropertyValues:v10 inDatabase:v8];
  id v21 = [v20 persistentID];
  v22 = (void *)objc_claimAutoreleasedReturnValue([v9 transactionIdentifiers]);
  +[AccountRewardsIdentifier insertIdentifiers:forAccountRewardsPID:inDatabase:]( &OBJC_CLASS___AccountRewardsTransactionIdentifier,  "insertIdentifiers:forAccountRewardsPID:inDatabase:",  v22,  v21,  v8);

  v23 = (void *)objc_claimAutoreleasedReturnValue([v9 rewardsAddedIdentifiers]);
  +[AccountRewardsIdentifier insertIdentifiers:forAccountRewardsPID:inDatabase:]( &OBJC_CLASS___AccountRewardsRewardsAddedIdentifier,  "insertIdentifiers:forAccountRewardsPID:inDatabase:",  v23,  v21,  v8);

  v24 = (void *)objc_claimAutoreleasedReturnValue([v9 rewards]);
  +[PaymentTransactionReward updatePaymentTransactionRewards:forAccountRewardsPID:inDatabase:]( &OBJC_CLASS___PaymentTransactionReward,  "updatePaymentTransactionRewards:forAccountRewardsPID:inDatabase:",  v24,  v21,  v8);

  return v20;
}

- (id)rewards
{
  v3 = objc_alloc_init(&OBJC_CLASS___PKAccountRewards);
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[AccountRewards _propertySettersForAccountRewards]( &OBJC_CLASS___AccountRewards,  "_propertySettersForAccountRewards"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allKeys]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000677DC;
  v13[3] = &unk_100638EF0;
  id v14 = v4;
  id v6 = v3;
  v15 = v6;
  uint64_t v16 = self;
  id v7 = v4;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v5, v13);

  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[AccountRewardsIdentifier identifiersWithAccountRewardsPID:inDatabase:]( &OBJC_CLASS___AccountRewardsTransactionIdentifier,  "identifiersWithAccountRewardsPID:inDatabase:",  self->super._persistentID,  self->super._database));
  -[PKAccountRewards setTransactionIdentifiers:](v6, "setTransactionIdentifiers:", v8);

  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[AccountRewardsIdentifier identifiersWithAccountRewardsPID:inDatabase:]( &OBJC_CLASS___AccountRewardsRewardsAddedIdentifier,  "identifiersWithAccountRewardsPID:inDatabase:",  self->super._persistentID,  self->super._database));
  -[PKAccountRewards setRewardsAddedIdentifiers:](v6, "setRewardsAddedIdentifiers:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue( +[PaymentTransactionReward paymentTransactionRewardsInDatabase:forAccountRewardsPID:]( &OBJC_CLASS___PaymentTransactionReward,  "paymentTransactionRewardsInDatabase:forAccountRewardsPID:",  self->super._database,  self->super._persistentID));
  -[PKAccountRewards setRewards:](v6, "setRewards:", v10);

  id v11 = v6;
  return v11;
}

- (id)currencyAmount
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"c"));
  uint64_t v4 = PKCurrencyStorageNumberToCurrencyDecimal(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"d"));
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

+ (void)deleteRewardsWithEventPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForEventPID:a3]);
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);

  [v8 deleteAllEntities];
}

- (BOOL)deleteFromDatabase
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"b"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[PaymentTransaction anyInDatabase:withReferenceIdentifier:]( &OBJC_CLASS___PaymentTransaction,  "anyInDatabase:withReferenceIdentifier:",  self->super._database,  v3));
  v5 = v4;
  if (v4 && [v4 transactionType] != (id)14) {
    [v5 setValue:&off_10068FBA0 forProperty:@"ac"];
  }
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___AccountRewards;
  BOOL v6 = -[SQLiteEntity deleteFromDatabase](&v8, "deleteFromDatabase");

  return v6;
}

+ (id)databaseTable
{
  return @"avocados";
}

+ (id)_predicateForEventPID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"a",  v3));

  return v4;
}

+ (id)_propertySettersForAccountRewards
{
  v3[0] = @"b";
  v3[1] = @"e";
  v4[0] = &stru_10063D970;
  v4[1] = &stru_10063D990;
  v3[2] = @"f";
  v3[3] = @"g";
  v4[2] = &stru_10063D9B0;
  v4[3] = &stru_10063D9D0;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  4LL));
}

@end