@interface PaymentTransactionAward
+ (id)_postProcessedAmountForDecimalAmount:(id)a3 currency:(id)a4 exponent:(int64_t)a5;
+ (id)_predicateForPaymentTransactionPID:(int64_t)a3;
+ (id)_predicateForPaymentTransactionPIDs:(id)a3;
+ (id)_propertySettersForPaymentTransactionAward;
+ (id)databaseTable;
+ (id)insertPaymentTransactionAward:(id)a3 forPaymentTransactionPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)insertPaymentTransactionAwards:(id)a3 forPaymentTransactionPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)paymentTransactionAwardsInDatabase:(id)a3 forPaymentTransactionPID:(int64_t)a4;
+ (void)associateAwardsToPaymentTransactions:(id)a3 inDatabase:(id)a4;
+ (void)deleteEntitiesForPaymentTransactionPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)updateWithPaymentTransactionAwards:(id)a3 forPaymentTransactionPID:(int64_t)a4 inDatabase:(id)a5;
- (PaymentTransactionAward)initWithPaymentTransactionAward:(id)a3 forPaymentTransactionPID:(int64_t)a4 inDatabase:(id)a5;
- (id)_valuesDictionaryForPaymentTransactionAward:(id)a3 forPaymentTransactionPID:(int64_t)a4;
@end

@implementation PaymentTransactionAward

+ (id)databaseTable
{
  return @"payment_transaction_awards";
}

- (PaymentTransactionAward)initWithPaymentTransactionAward:(id)a3 forPaymentTransactionPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue( -[PaymentTransactionAward _valuesDictionaryForPaymentTransactionAward:forPaymentTransactionPID:]( self,  "_valuesDictionaryForPaymentTransactionAward:forPaymentTransactionPID:",  a3,  a4));
  v10 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v9, v8);

  return v10;
}

+ (id)insertPaymentTransactionAward:(id)a3 forPaymentTransactionPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [objc_alloc((Class)a1) initWithPaymentTransactionAward:v9 forPaymentTransactionPID:a4 inDatabase:v8];

  return v10;
}

+ (id)insertPaymentTransactionAwards:(id)a3 forPaymentTransactionPID:(int64_t)a4 inDatabase:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100012138;
  v13[3] = &unk_100639BC8;
  v15 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  int64_t v16 = a4;
  id v14 = v7;
  id v9 = v15;
  id v10 = v7;
  [v8 enumerateObjectsUsingBlock:v13];

  id v11 = -[NSMutableArray copy](v9, "copy");
  return v11;
}

+ (void)updateWithPaymentTransactionAwards:(id)a3 forPaymentTransactionPID:(int64_t)a4 inDatabase:(id)a5
{
  id v9 = a3;
  id v7 = a5;
  if (v9 && [v9 count])
  {
    +[PaymentTransactionAward deleteEntitiesForPaymentTransactionPID:inDatabase:]( &OBJC_CLASS___PaymentTransactionAward,  "deleteEntitiesForPaymentTransactionPID:inDatabase:",  a4,  v7);
    id v8 =  +[PaymentTransactionAward insertPaymentTransactionAwards:forPaymentTransactionPID:inDatabase:]( &OBJC_CLASS___PaymentTransactionAward,  "insertPaymentTransactionAwards:forPaymentTransactionPID:inDatabase:",  v9,  a4,  v7);
  }
}

+ (void)deleteEntitiesForPaymentTransactionPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForPaymentTransactionPID:a3]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

+ (id)paymentTransactionAwardsInDatabase:(id)a3 forPaymentTransactionPID:(int64_t)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPaymentTransactionPID:a4]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _propertySettersForPaymentTransactionAward]);
  id v10 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 allKeys]);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_100012458;
  v18[3] = &unk_100639BF0;
  v20 = v10;
  id v21 = a1;
  id v19 = v9;
  v12 = v10;
  id v13 = v9;
  [v8 enumeratePersistentIDsAndProperties:v11 usingBlock:v18];

  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  @"order",  1LL));
  v22 = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v22, 1LL));
  -[NSMutableArray sortUsingDescriptors:](v12, "sortUsingDescriptors:", v15);

  id v16 = -[NSMutableArray copy](v12, "copy");
  return v16;
}

+ (void)associateAwardsToPaymentTransactions:(id)a3 inDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
  uint64_t v9 = objc_claimAutoreleasedReturnValue([a1 _predicateForPaymentTransactionPIDs:v8]);

  v30 = (void *)v9;
  v31 = v7;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v7 predicate:v9]);
  id v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v12 = (void *)objc_claimAutoreleasedReturnValue([a1 _propertySettersForPaymentTransactionAward]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 allKeys]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 arrayByAddingObject:@"payment_transaction_pid"]);
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472LL;
  v36[2] = sub_10001281C;
  v36[3] = &unk_100639BF0;
  id v39 = a1;
  id v28 = v12;
  id v37 = v28;
  v15 = v11;
  v38 = v15;
  v29 = v10;
  [v10 enumeratePersistentIDsAndProperties:v14 usingBlock:v36];

  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  id v16 = v15;
  id v17 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v16,  "countByEnumeratingWithState:objects:count:",  &v32,  v41,  16LL);
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v33;
    do
    {
      for (i = 0LL; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v33 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void *)(*((void *)&v32 + 1) + 8LL * (void)i);
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", v21, v28));
        uint64_t v23 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v16, "objectForKey:", v21));
        if (v23)
        {
          v24 = (void *)v23;
          v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  @"order",  1LL));
          v40 = v25;
          v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v40,  1LL));
          v27 = (void *)objc_claimAutoreleasedReturnValue([v24 sortedArrayUsingDescriptors:v26]);

          [v22 setAwards:v27];
        }
      }

      id v18 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v16,  "countByEnumeratingWithState:objects:count:",  &v32,  v41,  16LL);
    }

    while (v18);
  }
}

+ (id)_predicateForPaymentTransactionPID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"payment_transaction_pid",  v3));

  return v4;
}

+ (id)_predicateForPaymentTransactionPIDs:(id)a3
{
  return +[SQLiteContainsPredicate containsPredicateWithProperty:values:]( &OBJC_CLASS___SQLiteContainsPredicate,  "containsPredicateWithProperty:values:",  @"payment_transaction_pid",  a3);
}

- (id)_valuesDictionaryForPaymentTransactionAward:(id)a3 forPaymentTransactionPID:(int64_t)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 amount]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 amount]);
  id v9 = [v8 exponent];

  uint64_t v10 = objc_claimAutoreleasedReturnValue([v7 amount]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([(id)v10 currency]);

  LOBYTE(v10) = [v11 isEqualToString:PKNoCurrencyCode];
  v12 = (void *)objc_claimAutoreleasedReturnValue([v7 amount]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 amount]);
  id v14 = v13;
  if ((v10 & 1) != 0)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue([v13 decimalNumberByMultiplyingByPowerOf10:(__int16)v9]);
    id v16 = [v15 longLongValue];
  }

  else
  {
    id v16 = (id)PKCurrencyDecimalToStorageInteger(v13);
  }

  id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  [v6 setObjectOrNull:v17 forKey:@"payment_transaction_pid"];

  id v18 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
  [v6 setObjectOrNull:v18 forKey:@"award_identifier"];

  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v5 typeString]);
  [v6 setObjectOrNull:v19 forKey:@"award_type"];

  v20 = (void *)objc_claimAutoreleasedReturnValue([v5 subtype]);
  [v6 setObjectOrNull:v20 forKey:@"award_subtype"];

  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v5 awardDescription]);
  [v6 setObjectOrNull:v21 forKey:@"award_description"];

  objc_msgSend(v6, "setInteger:forKey:", objc_msgSend(v5, "order"), @"award_order");
  v22 = (void *)objc_claimAutoreleasedReturnValue([v5 relevantAccountName]);
  [v6 setObjectOrNull:v22 forKey:@"relevant_account_name"];

  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v5 localizedAmount]);
  [v6 setObjectOrNull:v23 forKey:@"localized_amount"];

  objc_msgSend(v6, "setBool:forKey:", objc_msgSend(v5, "hasDeepLink"), @"has_deep_link");
  [v6 setObjectOrNull:v11 forKey:@"currency"];
  [v6 setInteger:v9 forKey:@"exponent"];
  [v6 setLongLong:v16 forKey:@"amount"];
  objc_msgSend(v6, "setBool:forKey:", objc_msgSend(v5, "claimExpired"), @"claim_expired");
  objc_msgSend(v6, "setBool:forKey:", objc_msgSend(v5, "redeemExpired"), @"redeem_expired");
  v24 = (void *)objc_claimAutoreleasedReturnValue([v5 claimExpiryDate]);
  [v6 setObjectOrNull:v24 forKey:@"claim_expiry_date"];

  v25 = (void *)objc_claimAutoreleasedReturnValue([v5 redeemExpiryDate]);
  [v6 setObjectOrNull:v25 forKey:@"redeem_expiry_date"];

  id v26 = [v6 copy];
  return v26;
}

+ (id)_postProcessedAmountForDecimalAmount:(id)a3 currency:(id)a4 exponent:(int64_t)a5
{
  id v7 = (NSDecimalNumber *)a3;
  id v8 = 0LL;
  id v9 = v7;
  if (v7 && a4)
  {
    uint64_t v10 = PKNoCurrencyCode;
    id v11 = a4;
    if ([v11 isEqualToString:v10])
    {
      v12 = -[NSDecimalNumber initWithLongLong:]( objc_alloc(&OBJC_CLASS___NSDecimalNumber),  "initWithLongLong:",  -[NSDecimalNumber longLongValue](v7, "longLongValue"));
      id v9 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue( -[NSDecimalNumber decimalNumberByMultiplyingByPowerOf10:]( v12,  "decimalNumberByMultiplyingByPowerOf10:",  (__int16)-(__int16)a5));
    }

    else
    {
      uint64_t v13 = PKCurrencyStorageNumberToCurrencyDecimal(v7);
      id v9 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue(v13);
      v12 = v7;
    }

    id v14 = -[PKCurrencyAmount initWithAmount:currency:exponent:]( objc_alloc(&OBJC_CLASS___PKCurrencyAmount),  "initWithAmount:currency:exponent:",  v9,  v11,  a5);
    if (v14)
    {
      id v8 = -[PKTransactionAmount initWithCurrencyAmount:]( objc_alloc(&OBJC_CLASS___PKTransactionAmount),  "initWithCurrencyAmount:",  v14);
    }

    else
    {
      id v8 = 0LL;
    }
  }

  return v8;
}

+ (id)_propertySettersForPaymentTransactionAward
{
  v3[0] = @"award_type";
  v3[1] = @"award_description";
  v4[0] = &stru_100639C30;
  v4[1] = &stru_100639C50;
  v3[2] = @"award_order";
  v3[3] = @"relevant_account_name";
  v4[2] = &stru_100639C70;
  v4[3] = &stru_100639C90;
  v3[4] = @"award_identifier";
  v3[5] = @"award_subtype";
  v4[4] = &stru_100639CB0;
  v4[5] = &stru_100639CD0;
  v3[6] = @"localized_amount";
  v3[7] = @"has_deep_link";
  v4[6] = &stru_100639CF0;
  v4[7] = &stru_100639D10;
  v3[8] = @"claim_expired";
  v3[9] = @"redeem_expired";
  v4[8] = &stru_100639D30;
  v4[9] = &stru_100639D50;
  v3[10] = @"claim_expiry_date";
  v3[11] = @"redeem_expiry_date";
  v4[10] = &stru_100639D70;
  v4[11] = &stru_100639D90;
  v3[12] = @"amount";
  v3[13] = @"currency";
  v4[12] = &stru_100639DB0;
  v4[13] = &stru_100639DD0;
  v3[14] = @"exponent";
  v4[14] = &stru_100639DF0;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  15LL));
}

@end