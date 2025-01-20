@interface AccountAdditionalPushTopics
+ (id)_predicateForAccountPID:(int64_t)a3;
+ (id)_propertySettersForAccountAdditionalPushTopics;
+ (id)accountAdditionalPushTopicsForAccountPID:(int64_t)a3 inDatabase:(id)a4;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertAccountAdditionalPushTopics:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5;
+ (void)deleteAccountAdditionalPushTopicsForAccountPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)updateAccountAdditionalPushTopics:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5;
- (AccountAdditionalPushTopics)initWithAccountAdditionalPushTopics:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5;
- (id)accountAdditionalPushTopics;
- (void)updateWithAccountAdditionalPushTopics:(id)a3;
@end

@implementation AccountAdditionalPushTopics

+ (id)databaseTable
{
  return @"plum";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class(&OBJC_CLASS___Account, a2) == a3) {
    return @"a";
  }
  else {
    return 0LL;
  }
}

+ (id)accountAdditionalPushTopicsForAccountPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountPID:a3]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 accountAdditionalPushTopics]);
  return v9;
}

- (AccountAdditionalPushTopics)initWithAccountAdditionalPushTopics:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  [v10 setObjectOrNull:v11 forKey:@"a"];

  v12 = (void *)objc_claimAutoreleasedReturnValue([v9 account]);
  [v10 setObjectOrNull:v12 forKey:@"b"];

  v13 = (void *)objc_claimAutoreleasedReturnValue([v9 extendedAccount]);
  [v10 setObjectOrNull:v13 forKey:@"c"];

  v14 = (void *)objc_claimAutoreleasedReturnValue([v9 payments]);
  [v10 setObjectOrNull:v14 forKey:@"d"];

  v15 = (void *)objc_claimAutoreleasedReturnValue([v9 users]);
  [v10 setObjectOrNull:v15 forKey:@"e"];

  v16 = (void *)objc_claimAutoreleasedReturnValue([v9 sharedAccountCloudStore]);
  [v10 setObjectOrNull:v16 forKey:@"f"];

  v17 = (void *)objc_claimAutoreleasedReturnValue([v9 applications]);
  [v10 setObjectOrNull:v17 forKey:@"g"];

  v18 = (void *)objc_claimAutoreleasedReturnValue([v9 financingPlans]);
  [v10 setObjectOrNull:v18 forKey:@"pu"];

  v19 = (void *)objc_claimAutoreleasedReturnValue([v9 physicalCards]);
  [v10 setObjectOrNull:v19 forKey:@"physical_cards"];

  v20 = (void *)objc_claimAutoreleasedReturnValue([v9 virtualCards]);
  [v10 setObjectOrNull:v20 forKey:@"virtual_cards"];

  v21 = (void *)objc_claimAutoreleasedReturnValue([v9 servicingToken]);
  [v10 setObjectOrNull:v21 forKey:@"servicing_token"];

  v22 = (void *)objc_claimAutoreleasedReturnValue([v9 fundingSources]);
  [v10 setObjectOrNull:v22 forKey:@"funding_sources"];

  v23 = (void *)objc_claimAutoreleasedReturnValue([v9 creditRecoveryPaymentPlans]);
  [v10 setObjectOrNull:v23 forKey:@"recovery_payment_plans"];

  v24 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v10, v8);
  return v24;
}

+ (id)insertAccountAdditionalPushTopics:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [objc_alloc((Class)a1) initWithAccountAdditionalPushTopics:v9 forAccountPID:a4 inDatabase:v8];

  return v10;
}

+ (void)deleteAccountAdditionalPushTopicsForAccountPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountPID:a3]);
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  [v8 deleteFromDatabase];
}

+ (void)updateAccountAdditionalPushTopics:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v12 = a3;
  id v8 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountPID:a4]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v8 predicate:v9]);

  if (v10) {
    [v10 updateWithAccountAdditionalPushTopics:v12];
  }
  else {
    id v11 =  +[AccountAdditionalPushTopics insertAccountAdditionalPushTopics:forAccountPID:inDatabase:]( &OBJC_CLASS___AccountAdditionalPushTopics,  "insertAccountAdditionalPushTopics:forAccountPID:inDatabase:",  v12,  a4,  v8);
  }
}

- (void)updateWithAccountAdditionalPushTopics:(id)a3
{
  id v4 = a3;
  id v17 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 account]);
  [v17 setObjectOrNull:v5 forKey:@"b"];

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 extendedAccount]);
  [v17 setObjectOrNull:v6 forKey:@"c"];

  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 payments]);
  [v17 setObjectOrNull:v7 forKey:@"d"];

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 users]);
  [v17 setObjectOrNull:v8 forKey:@"e"];

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 sharedAccountCloudStore]);
  [v17 setObjectOrNull:v9 forKey:@"f"];

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 applications]);
  [v17 setObjectOrNull:v10 forKey:@"g"];

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 financingPlans]);
  [v17 setObjectOrNull:v11 forKey:@"pu"];

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v4 physicalCards]);
  [v17 setObjectOrNull:v12 forKey:@"physical_cards"];

  v13 = (void *)objc_claimAutoreleasedReturnValue([v4 virtualCards]);
  [v17 setObjectOrNull:v13 forKey:@"virtual_cards"];

  v14 = (void *)objc_claimAutoreleasedReturnValue([v4 servicingToken]);
  [v17 setObjectOrNull:v14 forKey:@"servicing_token"];

  v15 = (void *)objc_claimAutoreleasedReturnValue([v4 fundingSources]);
  [v17 setObjectOrNull:v15 forKey:@"funding_sources"];

  v16 = (void *)objc_claimAutoreleasedReturnValue([v4 creditRecoveryPaymentPlans]);
  [v17 setObjectOrNull:v16 forKey:@"recovery_payment_plans"];

  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v17);
}

+ (id)_predicateForAccountPID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"a",  v3));

  return v4;
}

+ (id)_propertySettersForAccountAdditionalPushTopics
{
  v3[0] = @"b";
  v3[1] = @"c";
  v4[0] = &stru_100642F90;
  v4[1] = &stru_100642FB0;
  v3[2] = @"d";
  v3[3] = @"e";
  v4[2] = &stru_100642FD0;
  v4[3] = &stru_100642FF0;
  v3[4] = @"f";
  v3[5] = @"g";
  v4[4] = &stru_100643010;
  v4[5] = &stru_100643030;
  v3[6] = @"pu";
  v3[7] = @"physical_cards";
  v4[6] = &stru_100643050;
  v4[7] = &stru_100643070;
  v3[8] = @"virtual_cards";
  v3[9] = @"servicing_token";
  v4[8] = &stru_100643090;
  v4[9] = &stru_1006430B0;
  v3[10] = @"funding_sources";
  v3[11] = @"recovery_payment_plans";
  v4[10] = &stru_1006430D0;
  v4[11] = &stru_1006430F0;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  12LL));
}

- (id)accountAdditionalPushTopics
{
  v3 = objc_alloc_init(&OBJC_CLASS___PKAccountAdditionalPushTopics);
  id v5 = objc_msgSend((id)objc_opt_class(self, v4), "_propertySettersForAccountAdditionalPushTopics");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000E7408;
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