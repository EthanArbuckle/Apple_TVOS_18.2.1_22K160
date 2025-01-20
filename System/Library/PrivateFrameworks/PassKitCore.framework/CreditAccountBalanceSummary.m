@interface CreditAccountBalanceSummary
+ (id)_predicateForCreditAccountSummaryPID:(int64_t)a3;
+ (id)_propertySettersForCreditAccountBalanceSummary;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)creditAccountBalanceSummaryForCreditAccountSummaryPID:(int64_t)a3 inDatabase:(id)a4;
+ (id)databaseTable;
+ (id)insertAccountBalanceSummary:(id)a3 forCreditAccountSummaryPID:(int64_t)a4 inDatabase:(id)a5;
+ (void)deleteCreditAccountBalanceSummaryForCreditAccountSummaryPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)updateCreditAccountBalanceSummary:(id)a3 forCreditAccountSummaryPID:(int64_t)a4 inDatabase:(id)a5;
- (CreditAccountBalanceSummary)initWithCreditAccountBalanceSummary:(id)a3 forCreditAccountSummaryPID:(int64_t)a4 inDatabase:(id)a5;
- (id)creditAccountBalanceSummary;
- (void)updateWithCreditAccountBalanceSummary:(id)a3;
@end

@implementation CreditAccountBalanceSummary

+ (id)databaseTable
{
  return @"bananas";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class(&OBJC_CLASS___CreditAccountSummary, a2) == a3) {
    return @"a";
  }
  else {
    return 0LL;
  }
}

- (CreditAccountBalanceSummary)initWithCreditAccountBalanceSummary:(id)a3 forCreditAccountSummaryPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  [v10 setObjectOrNull:v11 forKey:@"a"];

  v12 = (void *)objc_claimAutoreleasedReturnValue([v9 openingDate]);
  v13 = (void *)_SQLValueForDate(v12);
  [v10 setObjectOrNull:v13 forKey:@"b"];

  v14 = (void *)objc_claimAutoreleasedReturnValue([v9 closingDate]);
  v15 = (void *)_SQLValueForDate(v14);
  [v10 setObjectOrNull:v15 forKey:@"c"];

  v16 = (void *)objc_claimAutoreleasedReturnValue([v9 purchases]);
  uint64_t v17 = PKCurrencyDecimalToStorageNumber(v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  [v10 setObjectOrNull:v18 forKey:@"d"];

  v19 = (void *)objc_claimAutoreleasedReturnValue([v9 pendingPurchases]);
  uint64_t v20 = PKCurrencyDecimalToStorageNumber(v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  [v10 setObjectOrNull:v21 forKey:@"e"];

  v22 = (void *)objc_claimAutoreleasedReturnValue([v9 balanceTransfers]);
  uint64_t v23 = PKCurrencyDecimalToStorageNumber(v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  [v10 setObjectOrNull:v24 forKey:@"f"];

  v25 = (void *)objc_claimAutoreleasedReturnValue([v9 interestCharged]);
  uint64_t v26 = PKCurrencyDecimalToStorageNumber(v25);
  v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
  [v10 setObjectOrNull:v27 forKey:@"g"];

  v28 = (void *)objc_claimAutoreleasedReturnValue([v9 feesCharged]);
  uint64_t v29 = PKCurrencyDecimalToStorageNumber(v28);
  v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
  [v10 setObjectOrNull:v30 forKey:@"h"];

  v31 = (void *)objc_claimAutoreleasedReturnValue([v9 paymentsAndCredits]);
  uint64_t v32 = PKCurrencyDecimalToStorageNumber(v31);
  v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
  [v10 setObjectOrNull:v33 forKey:@"i"];

  v34 = (void *)objc_claimAutoreleasedReturnValue([v9 rewardsEarned]);
  uint64_t v35 = PKCurrencyDecimalToStorageNumber(v34);
  v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
  [v10 setObjectOrNull:v36 forKey:@"j"];

  v37 = (void *)objc_claimAutoreleasedReturnValue([v9 rewardsRedeemed]);
  uint64_t v38 = PKCurrencyDecimalToStorageNumber(v37);
  v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
  [v10 setObjectOrNull:v39 forKey:@"k"];

  v40 = (void *)objc_claimAutoreleasedReturnValue([v9 payments]);
  uint64_t v41 = PKCurrencyDecimalToStorageNumber(v40);
  v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
  [v10 setObjectOrNull:v42 forKey:@"l"];

  v43 = (void *)objc_claimAutoreleasedReturnValue([v9 credits]);
  uint64_t v44 = PKCurrencyDecimalToStorageNumber(v43);
  v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
  [v10 setObjectOrNull:v45 forKey:@"m"];

  v46 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v10, v8);
  return v46;
}

+ (id)insertAccountBalanceSummary:(id)a3 forCreditAccountSummaryPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [objc_alloc((Class)a1) initWithCreditAccountBalanceSummary:v9 forCreditAccountSummaryPID:a4 inDatabase:v8];

  return v10;
}

+ (void)deleteCreditAccountBalanceSummaryForCreditAccountSummaryPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForCreditAccountSummaryPID:a3]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

+ (id)creditAccountBalanceSummaryForCreditAccountSummaryPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForCreditAccountSummaryPID:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 creditAccountBalanceSummary]);
  return v9;
}

+ (void)updateCreditAccountBalanceSummary:(id)a3 forCreditAccountSummaryPID:(int64_t)a4 inDatabase:(id)a5
{
  id v12 = a3;
  id v8 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForCreditAccountSummaryPID:a4]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v8 predicate:v9]);

  if (v10) {
    [v10 updateWithCreditAccountBalanceSummary:v12];
  }
  else {
    id v11 =  +[CreditAccountBalanceSummary insertAccountBalanceSummary:forCreditAccountSummaryPID:inDatabase:]( &OBJC_CLASS___CreditAccountBalanceSummary,  "insertAccountBalanceSummary:forCreditAccountSummaryPID:inDatabase:",  v12,  a4,  v8);
  }
}

- (void)updateWithCreditAccountBalanceSummary:(id)a3
{
  id v4 = a3;
  id v39 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 openingDate]);
  id v6 = (void *)_SQLValueForDate(v5);
  [v39 setObjectOrNull:v6 forKey:@"b"];

  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 closingDate]);
  id v8 = (void *)_SQLValueForDate(v7);
  [v39 setObjectOrNull:v8 forKey:@"c"];

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 purchases]);
  uint64_t v10 = PKCurrencyDecimalToStorageNumber(v9);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  [v39 setObjectOrNull:v11 forKey:@"d"];

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v4 pendingPurchases]);
  uint64_t v13 = PKCurrencyDecimalToStorageNumber(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  [v39 setObjectOrNull:v14 forKey:@"e"];

  v15 = (void *)objc_claimAutoreleasedReturnValue([v4 balanceTransfers]);
  uint64_t v16 = PKCurrencyDecimalToStorageNumber(v15);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  [v39 setObjectOrNull:v17 forKey:@"f"];

  v18 = (void *)objc_claimAutoreleasedReturnValue([v4 interestCharged]);
  uint64_t v19 = PKCurrencyDecimalToStorageNumber(v18);
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  [v39 setObjectOrNull:v20 forKey:@"g"];

  v21 = (void *)objc_claimAutoreleasedReturnValue([v4 feesCharged]);
  uint64_t v22 = PKCurrencyDecimalToStorageNumber(v21);
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  [v39 setObjectOrNull:v23 forKey:@"h"];

  v24 = (void *)objc_claimAutoreleasedReturnValue([v4 paymentsAndCredits]);
  uint64_t v25 = PKCurrencyDecimalToStorageNumber(v24);
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
  [v39 setObjectOrNull:v26 forKey:@"i"];

  v27 = (void *)objc_claimAutoreleasedReturnValue([v4 rewardsEarned]);
  uint64_t v28 = PKCurrencyDecimalToStorageNumber(v27);
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
  [v39 setObjectOrNull:v29 forKey:@"j"];

  v30 = (void *)objc_claimAutoreleasedReturnValue([v4 rewardsRedeemed]);
  uint64_t v31 = PKCurrencyDecimalToStorageNumber(v30);
  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
  [v39 setObjectOrNull:v32 forKey:@"k"];

  v33 = (void *)objc_claimAutoreleasedReturnValue([v4 payments]);
  uint64_t v34 = PKCurrencyDecimalToStorageNumber(v33);
  uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
  [v39 setObjectOrNull:v35 forKey:@"l"];

  v36 = (void *)objc_claimAutoreleasedReturnValue([v4 credits]);
  uint64_t v37 = PKCurrencyDecimalToStorageNumber(v36);
  uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
  [v39 setObjectOrNull:v38 forKey:@"m"];

  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v39);
}

+ (id)_predicateForCreditAccountSummaryPID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"a",  v3));

  return v4;
}

+ (id)_propertySettersForCreditAccountBalanceSummary
{
  v3[0] = @"b";
  v3[1] = @"c";
  v4[0] = &stru_100659478;
  v4[1] = &stru_100659498;
  v3[2] = @"d";
  v3[3] = @"e";
  v4[2] = &stru_1006594B8;
  v4[3] = &stru_1006594D8;
  v3[4] = @"f";
  v3[5] = @"g";
  v4[4] = &stru_1006594F8;
  v4[5] = &stru_100659518;
  v3[6] = @"h";
  v3[7] = @"i";
  v4[6] = &stru_100659538;
  v4[7] = &stru_100659558;
  v3[8] = @"l";
  v3[9] = @"m";
  v4[8] = &stru_100659578;
  v4[9] = &stru_100659598;
  v3[10] = @"l";
  v3[11] = @"m";
  v4[10] = &stru_1006595B8;
  v4[11] = &stru_1006595D8;
  v3[12] = @"j";
  v3[13] = @"k";
  v4[12] = &stru_1006595F8;
  v4[13] = &stru_100659618;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  14LL));
}

- (id)creditAccountBalanceSummary
{
  v3 = objc_alloc_init(&OBJC_CLASS___PKCreditAccountBalanceSummary);
  id v5 = objc_msgSend((id)objc_opt_class(self, v4), "_propertySettersForCreditAccountBalanceSummary");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10038EC7C;
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

@end