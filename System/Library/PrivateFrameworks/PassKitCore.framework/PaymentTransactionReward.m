@interface PaymentTransactionReward
+ (id)_paymentTransactionRewardsInDatabase:(id)a3 matchingPredicate:(id)a4;
+ (id)_paymentTransactionRewardsWithQuery:(id)a3;
+ (id)_predicateExcludingPaymentTransactionRewardState:(unint64_t)a3;
+ (id)_predicateForAccountRewardsPID:(int64_t)a3;
+ (id)_predicateForCompletedRewards;
+ (id)_predicateForInProgressRewards;
+ (id)_predicateForInstallmentPlanPID:(id)a3;
+ (id)_predicateForPaymentTransaction:(id)a3;
+ (id)_predicateForPaymentTransactionIdentifier:(id)a3;
+ (id)_predicateForPaymentTransactionPID:(int64_t)a3;
+ (id)_predicateForPaymentTransactionPIDs:(id)a3;
+ (id)_predicateForPaymentTransactionRewardState:(unint64_t)a3;
+ (id)_predicateForRewardWithIdentifier:(id)a3;
+ (id)_propertySettersForPaymentTransactionRewardItem;
+ (id)_rewardsFromRewardsItems:(id)a3;
+ (id)_rewardsInProgressFromRewardsItems:(id)a3;
+ (id)_updateQueryGrouping:(id)a3;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)paymentTransactionRewardsInDatabase:(id)a3 forAccountRewardsPID:(int64_t)a4;
+ (id)paymentTransactionRewardsInDatabase:(id)a3 forPaymentTransaction:(id)a4;
+ (id)paymentTransactionRewardsInDatabase:(id)a3 forPaymentTransactionIdentifier:(id)a4;
+ (id)paymentTransactionRewardsInProgressInDatabase:(id)a3 forPaymentTransaction:(id)a4;
+ (id)paymentTransactionRewardsInProgressInDatabase:(id)a3 forPaymentTransactionIdentifier:(id)a4;
+ (id)rewardsInDatabase:(id)a3 forInstallmentPlanPID:(id)a4;
+ (void)_deleteCompletedRewardsForPaymentTransaction:(id)a3 inDatabase:(id)a4;
+ (void)_deleteEntitiesForPaymentTransaction:(id)a3 matchingPredicate:(id)a4 inDatabase:(id)a5;
+ (void)_deleteInProgressRewardsForPaymentTransaction:(id)a3 inDatabase:(id)a4;
+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4;
+ (void)associateRewardsToPaymentTransactions:(id)a3 inDatabase:(id)a4;
+ (void)deleteEntitiesForAccountRewardsPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deleteEntitiesForInstallmentPlanPID:(id)a3 inDatabase:(id)a4;
+ (void)deleteEntitiesForPaymentTransaction:(id)a3 inDatabase:(id)a4;
+ (void)deleteEntitiesForPaymentTransactionPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)updatePaymentTransactionRewards:(id)a3 forAccountRewardsPID:(int64_t)a4 inDatabase:(id)a5;
+ (void)updatePaymentTransactionRewards:(id)a3 forPaymentTransaction:(id)a4 inDatabase:(id)a5;
+ (void)updatePaymentTransactionRewardsInProgress:(id)a3 forPaymentTransaction:(id)a4 inDatabase:(id)a5;
+ (void)updateRewards:(id)a3 forInstallmentPlanPID:(id)a4 inDatabase:(id)a5;
- (PaymentTransactionReward)initWithPaymentTransactionRewardsItem:(id)a3 accountRewardsPID:(unint64_t)a4 inDatabase:(id)a5;
- (PaymentTransactionReward)initWithPaymentTransactionRewardsItem:(id)a3 paymentTransaction:(id)a4 inDatabase:(id)a5;
- (PaymentTransactionReward)initWithRewardsItem:(id)a3 installmentPlanPID:(id)a4 inDatabase:(id)a5;
- (void)updateWithPaymentTransactionRewardItem:(id)a3;
@end

@implementation PaymentTransactionReward

- (PaymentTransactionReward)initWithPaymentTransactionRewardsItem:(id)a3 accountRewardsPID:(unint64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v9 currencyAmount]);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 amount]);
  uint64_t v13 = PKCurrencyDecimalToStorageNumber(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

  v15 = (void *)objc_claimAutoreleasedReturnValue([v9 eligibleValue]);
  uint64_t v16 = PKCurrencyDecimalToStorageNumber(v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);

  v18 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
  [v10 setObjectOrNull:v18 forKey:@"a"];

  objc_msgSend(v10, "setInteger:forKey:", objc_msgSend(v9, "type"), @"c");
  objc_msgSend(v10, "setInteger:forKey:", objc_msgSend(v9, "state"), @"d");
  objc_msgSend(v10, "setInteger:forKey:", objc_msgSend(v9, "eligibleValueUnit"), @"h");
  [v10 setObjectOrNull:v17 forKey:@"g"];
  v19 = (void *)objc_claimAutoreleasedReturnValue([v9 currencyAmount]);
  v20 = (void *)objc_claimAutoreleasedReturnValue([v19 currency]);
  [v10 setObjectOrNull:v20 forKey:@"f"];

  [v10 setObjectOrNull:v14 forKey:@"e"];
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  [v10 setObject:v21 forKey:@"i"];

  v22 = (void *)objc_claimAutoreleasedReturnValue([v9 promotionName]);
  [v10 setObjectOrNull:v22 forKey:@"l"];

  v23 = (void *)objc_claimAutoreleasedReturnValue([v9 promotionIdentifier]);
  [v10 setObjectOrNull:v23 forKey:@"k"];

  v24 = (void *)objc_claimAutoreleasedReturnValue([v9 programIdentifier]);
  [v10 setObjectOrNull:v24 forKey:@"m"];

  v25 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v10, v8);
  return v25;
}

- (PaymentTransactionReward)initWithPaymentTransactionRewardsItem:(id)a3 paymentTransaction:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v10 currencyAmount]);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 amount]);
  uint64_t v14 = PKCurrencyDecimalToStorageNumber(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v10 eligibleValue]);
  uint64_t v17 = PKCurrencyDecimalToStorageNumber(v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);

  v19 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);
  [v11 setObjectOrNull:v19 forKey:@"a"];

  objc_msgSend(v11, "setInteger:forKey:", objc_msgSend(v10, "type"), @"c");
  objc_msgSend(v11, "setInteger:forKey:", objc_msgSend(v10, "state"), @"d");
  objc_msgSend(v11, "setInteger:forKey:", objc_msgSend(v10, "eligibleValueUnit"), @"h");
  [v11 setObjectOrNull:v18 forKey:@"g"];
  v20 = (void *)objc_claimAutoreleasedReturnValue([v10 currencyAmount]);
  v21 = (void *)objc_claimAutoreleasedReturnValue([v20 currency]);
  [v11 setObjectOrNull:v21 forKey:@"f"];

  [v11 setObjectOrNull:v15 forKey:@"e"];
  id v22 = [v9 persistentID];

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v22));
  [v11 setObject:v23 forKey:@"b"];

  v24 = (void *)objc_claimAutoreleasedReturnValue([v10 promotionName]);
  [v11 setObjectOrNull:v24 forKey:@"l"];

  v25 = (void *)objc_claimAutoreleasedReturnValue([v10 promotionIdentifier]);
  [v11 setObjectOrNull:v25 forKey:@"k"];

  v26 = (void *)objc_claimAutoreleasedReturnValue([v10 programIdentifier]);
  [v11 setObjectOrNull:v26 forKey:@"m"];

  v27 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v11, v8);
  return v27;
}

- (PaymentTransactionReward)initWithRewardsItem:(id)a3 installmentPlanPID:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v10 currencyAmount]);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 amount]);
  uint64_t v14 = PKCurrencyDecimalToStorageNumber(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v10 eligibleValue]);
  uint64_t v17 = PKCurrencyDecimalToStorageNumber(v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);

  v19 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v11, "setObjectOrNull:forKey:", v19, @"a");

  -[NSMutableDictionary setInteger:forKey:](v11, "setInteger:forKey:", [v10 type], @"c");
  -[NSMutableDictionary setInteger:forKey:](v11, "setInteger:forKey:", [v10 state], @"d");
  -[NSMutableDictionary setInteger:forKey:]( v11,  "setInteger:forKey:",  [v10 eligibleValueUnit],  @"h");
  -[NSMutableDictionary setObjectOrNull:forKey:](v11, "setObjectOrNull:forKey:", v18, @"g");
  v20 = (void *)objc_claimAutoreleasedReturnValue([v10 currencyAmount]);
  v21 = (void *)objc_claimAutoreleasedReturnValue([v20 currency]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v11, "setObjectOrNull:forKey:", v21, @"f");

  -[NSMutableDictionary setObjectOrNull:forKey:](v11, "setObjectOrNull:forKey:", v15, @"e");
  -[NSMutableDictionary setObject:forKey:](v11, "setObject:forKey:", v9, @"j");

  id v22 = (void *)objc_claimAutoreleasedReturnValue([v10 promotionName]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v11, "setObjectOrNull:forKey:", v22, @"l");

  v23 = (void *)objc_claimAutoreleasedReturnValue([v10 promotionIdentifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v11, "setObjectOrNull:forKey:", v23, @"k");

  v24 = (void *)objc_claimAutoreleasedReturnValue([v10 programIdentifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v11, "setObjectOrNull:forKey:", v24, @"m");

  v25 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v11, v8);
  return v25;
}

+ (id)databaseTable
{
  return @"apples";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class(&OBJC_CLASS___PaymentTransaction, a2) == a3) {
    return @"b";
  }
  if ((Class)objc_opt_class(&OBJC_CLASS___AccountRewards, v4) == a3) {
    return @"i";
  }
  if ((Class)objc_opt_class(&OBJC_CLASS___CreditInstallmentPlan, v5) == a3) {
    return @"j";
  }
  return 0LL;
}

+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (__CFString *)v5;
  id v8 = v7;
  if (v7 == @"payment_transaction.identifier") {
    goto LABEL_4;
  }
  if (v7)
  {
    unsigned int v9 = [@"payment_transaction.identifier" isEqualToString:v7];

    if (v9)
    {
LABEL_4:
      __int128 v25 = 0u;
      __int128 v26 = 0u;
      __int128 v23 = 0u;
      __int128 v24 = 0u;
      id v10 = v6;
      id v11 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v11)
      {
        id v12 = v11;
        uint64_t v13 = *(void *)v24;
LABEL_6:
        uint64_t v14 = 0LL;
        while (1)
        {
          if (*(void *)v24 != v13) {
            objc_enumerationMutation(v10);
          }
          if ([*(id *)(*((void *)&v23 + 1) + 8 * v14) containsString:@"JOIN payment_transaction ON payment_transaction.pid = apples.b"]) {
            goto LABEL_20;
          }
          if (v12 == (id)++v14)
          {
            id v12 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
            if (v12) {
              goto LABEL_6;
            }
            break;
          }
        }
      }

      v15 = @"JOIN payment_transaction ON payment_transaction.pid = apples.b";
      uint64_t v16 = v10;
      goto LABEL_16;
    }

    uint64_t v17 = v8;
    if (v17 == @"avocados.identifier"
      || (v18 = v17,
          unsigned int v19 = [@"avocados.identifier" isEqualToString:v17],
          v18,
          v19))
    {
      v15 = @"JOIN avocados ON avocados.pid = apples.i";
      uint64_t v16 = v6;
LABEL_16:
      [v16 addObject:v15];
      goto LABEL_21;
    }

    v20 = v18;
    if (v20 == @"MAX(mirabelle.b) NOT NULL AS has_enhanced_merchant_program_identifier"
      || (v21 = v20,
          unsigned int v22 = [@"MAX(mirabelle.b) NOT NULL AS has_enhanced_merchant_program_identifier" isEqualToString:v20],  v21,  v22))
    {
      [v6 removeObject:@"JOIN payment_transaction ON payment_transaction.pid = apples.b"];
      id v10 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ %@ %@ %@",  @"JOIN payment_transaction ON payment_transaction.pid = apples.b",  @"JOIN pears ON pears.a = payment_transaction.account_identifier",  @"LEFT JOIN quince ON quince.a = pears.pid",  @"LEFT JOIN mirabelle ON mirabelle.a = quince.pid AND mirabelle.b = apples.m"));
      [v6 addObject:v10];
LABEL_20:
    }
  }

- (void)updateWithPaymentTransactionRewardItem:(id)a3
{
  id v4 = a3;
  id v17 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 currencyAmount]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 amount]);
  uint64_t v7 = PKCurrencyDecimalToStorageNumber(v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v4 eligibleValue]);
  uint64_t v10 = PKCurrencyDecimalToStorageNumber(v9);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  objc_msgSend(v17, "setInteger:forKey:", objc_msgSend(v4, "type"), @"c");
  objc_msgSend(v17, "setInteger:forKey:", objc_msgSend(v4, "state"), @"d");
  objc_msgSend(v17, "setInteger:forKey:", objc_msgSend(v4, "eligibleValueUnit"), @"h");
  [v17 setObjectOrNull:v11 forKey:@"g"];
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v4 currencyAmount]);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 currency]);
  [v17 setObjectOrNull:v13 forKey:@"f"];

  [v17 setObjectOrNull:v8 forKey:@"e"];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v4 promotionName]);
  [v17 setObjectOrNull:v14 forKey:@"l"];

  v15 = (void *)objc_claimAutoreleasedReturnValue([v4 promotionIdentifier]);
  [v17 setObjectOrNull:v15 forKey:@"k"];

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v4 programIdentifier]);
  [v17 setObjectOrNull:v16 forKey:@"m"];

  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v17);
}

+ (void)updatePaymentTransactionRewards:(id)a3 forPaymentTransaction:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [a1 _deleteCompletedRewardsForPaymentTransaction:v9 inDatabase:v10];
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "rewardsItems", 0));
  id v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      v15 = 0LL;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }

        v15 = (char *)v15 + 1;
      }

      while (v13 != v15);
      id v13 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v13);
  }
}

+ (void)updatePaymentTransactionRewardsInProgress:(id)a3 forPaymentTransaction:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [a1 _deleteInProgressRewardsForPaymentTransaction:v9 inDatabase:v10];
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "rewardsItems", 0));
  id v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      v15 = 0LL;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }

        v15 = (char *)v15 + 1;
      }

      while (v13 != v15);
      id v13 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v13);
  }
}

+ (void)updatePaymentTransactionRewards:(id)a3 forAccountRewardsPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  [a1 deleteEntitiesForAccountRewardsPID:a4 inDatabase:v9];
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "rewardsItems", 0));
  id v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0LL;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }

        uint64_t v14 = (char *)v14 + 1;
      }

      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v12);
  }
}

+ (void)updateRewards:(id)a3 forInstallmentPlanPID:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [a1 deleteEntitiesForInstallmentPlanPID:v9 inDatabase:v10];
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "rewardsItems", 0));
  id v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      __int128 v15 = 0LL;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }

        __int128 v15 = (char *)v15 + 1;
      }

      while (v13 != v15);
      id v13 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v13);
  }
}

+ (void)deleteEntitiesForPaymentTransaction:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForPaymentTransaction:a3]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

+ (void)deleteEntitiesForPaymentTransactionPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForPaymentTransactionPID:a3]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

+ (void)_deleteCompletedRewardsForPaymentTransaction:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForCompletedRewards]);
  [a1 _deleteEntitiesForPaymentTransaction:v7 matchingPredicate:v8 inDatabase:v6];
}

+ (void)_deleteInProgressRewardsForPaymentTransaction:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForInProgressRewards]);
  [a1 _deleteEntitiesForPaymentTransaction:v7 matchingPredicate:v8 inDatabase:v6];
}

+ (void)_deleteEntitiesForPaymentTransaction:(id)a3 matchingPredicate:(id)a4 inDatabase:(id)a5
{
  v14[0] = a4;
  id v8 = a5;
  id v9 = a4;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPaymentTransaction:a3]);
  v14[1] = v10;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v14, 2LL));
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v11));

  id v13 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v8 predicate:v12]);
  [v13 deleteAllEntities];
}

+ (void)deleteEntitiesForAccountRewardsPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountRewardsPID:a3]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

+ (void)deleteEntitiesForInstallmentPlanPID:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForInstallmentPlanPID:a3]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

+ (id)paymentTransactionRewardsInDatabase:(id)a3 forPaymentTransaction:(id)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPaymentTransaction:a4]);
  v14[0] = v7;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForCompletedRewards]);
  v14[1] = v8;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v14, 2LL));
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v9));

  id v11 = (void *)objc_claimAutoreleasedReturnValue([a1 _paymentTransactionRewardsInDatabase:v6 matchingPredicate:v10]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([a1 _rewardsFromRewardsItems:v11]);

  return v12;
}

+ (id)paymentTransactionRewardsInDatabase:(id)a3 forPaymentTransactionIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPaymentTransactionIdentifier:a4]);
  v14[0] = v7;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForCompletedRewards]);
  v14[1] = v8;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v14, 2LL));
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v9));

  id v11 = (void *)objc_claimAutoreleasedReturnValue([a1 _paymentTransactionRewardsInDatabase:v6 matchingPredicate:v10]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([a1 _rewardsFromRewardsItems:v11]);

  return v12;
}

+ (id)paymentTransactionRewardsInProgressInDatabase:(id)a3 forPaymentTransaction:(id)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPaymentTransaction:a4]);
  v14[0] = v7;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForInProgressRewards]);
  v14[1] = v8;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v14, 2LL));
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v9));

  id v11 = (void *)objc_claimAutoreleasedReturnValue([a1 _paymentTransactionRewardsInDatabase:v6 matchingPredicate:v10]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([a1 _rewardsInProgressFromRewardsItems:v11]);

  return v12;
}

+ (id)paymentTransactionRewardsInProgressInDatabase:(id)a3 forPaymentTransactionIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPaymentTransactionIdentifier:a4]);
  v14[0] = v7;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForInProgressRewards]);
  v14[1] = v8;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v14, 2LL));
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v9));

  id v11 = (void *)objc_claimAutoreleasedReturnValue([a1 _paymentTransactionRewardsInDatabase:v6 matchingPredicate:v10]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([a1 _rewardsInProgressFromRewardsItems:v11]);

  return v12;
}

+ (id)paymentTransactionRewardsInDatabase:(id)a3 forAccountRewardsPID:(int64_t)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountRewardsPID:a4]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _paymentTransactionRewardsInDatabase:v6 matchingPredicate:v7]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _rewardsFromRewardsItems:v8]);
  return v9;
}

+ (id)rewardsInDatabase:(id)a3 forInstallmentPlanPID:(id)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForInstallmentPlanPID:a4]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _paymentTransactionRewardsInDatabase:v6 matchingPredicate:v7]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _rewardsFromRewardsItems:v8]);
  return v9;
}

+ (void)associateRewardsToPaymentTransactions:(id)a3 inDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v43 = v6;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPaymentTransactionPIDs:v8]);
  v41 = v7;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryWithDatabase:predicate:]( &OBJC_CLASS___PaymentTransactionReward,  "queryWithDatabase:predicate:",  v7,  v9));

  id v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v12 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([a1 _propertySettersForPaymentTransactionRewardItem]);
  if (sub_1003EE5BC(v10))
  {
    id v14 = [v13 mutableCopy];
    [v14 removeObjectForKey:@"MAX(mirabelle.b) NOT NULL AS has_enhanced_merchant_program_identifier"];
    id v15 = [v14 copy];

    id v13 = v15;
  }

  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue( [v13 objectForKey:@"MAX(mirabelle.b) NOT NULL AS has_enhanced_merchant_program_identifier"]);

  if (v16)
  {
    uint64_t v17 = objc_claimAutoreleasedReturnValue([a1 _updateQueryGrouping:v10]);

    id v10 = (void *)v17;
  }

  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v13 allKeys]);
  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v18 arrayByAddingObject:@"b"]);
  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472LL;
  v48[2] = sub_1003EE604;
  v48[3] = &unk_100638F18;
  id v52 = a1;
  id v39 = v13;
  id v49 = v39;
  v20 = v12;
  v50 = v20;
  v21 = v11;
  v51 = v21;
  v40 = v10;
  [v10 enumeratePersistentIDsAndProperties:v19 usingBlock:v48];

  unsigned int v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v20, "allKeys"));
  __int128 v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v22));

  __int128 v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v21, "allKeys"));
  __int128 v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v24));

  v38 = v23;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue([v23 setByAddingObjectsFromSet:v25]);
  id v26 = [obj countByEnumeratingWithState:&v44 objects:v53 count:16];
  if (v26)
  {
    id v27 = v26;
    uint64_t v28 = *(void *)v45;
    do
    {
      for (i = 0LL; i != v27; i = (char *)i + 1)
      {
        if (*(void *)v45 != v28) {
          objc_enumerationMutation(obj);
        }
        uint64_t v30 = *(void *)(*((void *)&v44 + 1) + 8LL * (void)i);
        v31 = (void *)objc_claimAutoreleasedReturnValue([v43 objectForKey:v30]);
        id v32 = objc_alloc(&OBJC_CLASS___PKPaymentTransactionRewards);
        v33 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v21, "objectForKey:", v30));
        id v34 = [v32 initWithRewardsItems:v33];
        [v31 setRewards:v34];

        id v35 = objc_alloc(&OBJC_CLASS___PKPaymentTransactionRewards);
        v36 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v20, "objectForKey:", v30));
        id v37 = [v35 initWithRewardsItems:v36];
        [v31 setRewardsInProgress:v37];
      }

      id v27 = [obj countByEnumeratingWithState:&v44 objects:v53 count:16];
    }

    while (v27);
  }
}

+ (id)_paymentTransactionRewardsInDatabase:(id)a3 matchingPredicate:(id)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryWithDatabase:predicate:]( &OBJC_CLASS___PaymentTransactionReward,  "queryWithDatabase:predicate:",  a3,  a4));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a1 _paymentTransactionRewardsWithQuery:v5]);

  return v6;
}

+ (id)_paymentTransactionRewardsWithQuery:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([a1 _propertySettersForPaymentTransactionRewardItem]);
  if (sub_1003EE5BC(v4))
  {
    id v6 = [v5 mutableCopy];
    [v6 removeObjectForKey:@"MAX(mirabelle.b) NOT NULL AS has_enhanced_merchant_program_identifier"];
    id v7 = [v6 copy];

    id v5 = v7;
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue( [v5 objectForKey:@"MAX(mirabelle.b) NOT NULL AS has_enhanced_merchant_program_identifier"]);

  if (v8)
  {
    uint64_t v9 = objc_claimAutoreleasedReturnValue([a1 _updateQueryGrouping:v4]);

    id v4 = (id)v9;
  }

  id v10 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v5 allKeys]);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1003EE950;
  v16[3] = &unk_100639BF0;
  __int128 v18 = v10;
  id v19 = a1;
  id v17 = v5;
  id v12 = v10;
  id v13 = v5;
  [v4 enumeratePersistentIDsAndProperties:v11 usingBlock:v16];

  id v14 = -[NSMutableArray copy](v12, "copy");
  return v14;
}

+ (id)_updateQueryGrouping:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 queryDescriptor]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 groupingProperties]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", @"pid"));
  id v17 = v6;
  if ([v5 count]) {
    id v7 = (id)objc_claimAutoreleasedReturnValue([v6 arrayByAddingObjectsFromArray:v5]);
  }
  else {
    id v7 = v6;
  }
  id v8 = v7;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v3 database]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 predicate]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 orderingProperties]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v4 orderingDirections]);
  id v13 = [v4 limitCount];
  LOBYTE(v16) = [v4 returnsDistinctEntities];
  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryWithDatabase:predicate:orderingProperties:orderingDirections:limit:groupingProperties:returnsDistinctEntities:]( &OBJC_CLASS___PaymentTransactionReward,  "queryWithDatabase:predicate:orderingProperties:orderingDirections:limit:groupingProperties:returnsDistinctEntities:",  v9,  v10,  v11,  v12,  v13,  v8,  v16));

  return v14;
}

+ (id)_predicateForRewardWithIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"a",  a3);
}

+ (id)_predicateForPaymentTransactionPID:(int64_t)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"b",  v3));

  return v4;
}

+ (id)_predicateForPaymentTransactionPIDs:(id)a3
{
  return +[SQLiteContainsPredicate containsPredicateWithProperty:values:]( &OBJC_CLASS___SQLiteContainsPredicate,  "containsPredicateWithProperty:values:",  @"b",  a3);
}

+ (id)_predicateForPaymentTransactionIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"payment_transaction.identifier",  a3);
}

+ (id)_predicateForPaymentTransaction:(id)a3
{
  return objc_msgSend(a1, "_predicateForPaymentTransactionPID:", objc_msgSend(a3, "persistentID"));
}

+ (id)_predicateForCompletedRewards
{
  return _[a1 _predicateExcludingPaymentTransactionRewardState:4];
}

+ (id)_predicateForInProgressRewards
{
  return _[a1 _predicateForPaymentTransactionRewardState:4];
}

+ (id)_predicateForPaymentTransactionRewardState:(unint64_t)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"d",  v3));

  return v4;
}

+ (id)_predicateExcludingPaymentTransactionRewardState:(unint64_t)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:notEqualToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:notEqualToValue:",  @"d",  v3));

  return v4;
}

+ (id)_predicateForAccountRewardsPID:(int64_t)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"i",  v3));

  return v4;
}

+ (id)_predicateForInstallmentPlanPID:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"j",  a3);
}

+ (id)_rewardsFromRewardsItems:(id)a3
{
  id v3 = a3;
  if ([v3 count]) {
    id v4 = [[PKPaymentTransactionRewards alloc] initWithRewardsItems:v3];
  }
  else {
    id v4 = 0LL;
  }

  return v4;
}

+ (id)_rewardsInProgressFromRewardsItems:(id)a3
{
  id v3 = a3;
  if ([v3 count]) {
    id v4 = [[PKPaymentTransactionRewards alloc] initWithRewardsItems:v3];
  }
  else {
    id v4 = 0LL;
  }

  return v4;
}

+ (id)_propertySettersForPaymentTransactionRewardItem
{
  v3[0] = @"a";
  v3[1] = @"c";
  v4[0] = &stru_10065D0B8;
  v4[1] = &stru_10065D0D8;
  v3[2] = @"d";
  v3[3] = @"g";
  v4[2] = &stru_10065D0F8;
  v4[3] = &stru_10065D118;
  v3[4] = @"h";
  v3[5] = @"k";
  v4[4] = &stru_10065D138;
  v4[5] = &stru_10065D158;
  v3[6] = @"l";
  v3[7] = @"m";
  v4[6] = &stru_10065D178;
  v4[7] = &stru_10065D198;
  v3[8] = @"MAX(mirabelle.b) NOT NULL AS has_enhanced_merchant_program_identifier";
  v3[9] = @"e";
  v4[8] = &stru_10065D1B8;
  v4[9] = &stru_10065D1D8;
  v3[10] = @"f";
  v4[10] = &stru_10065D1F8;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  11LL));
}

@end