@interface PaymentTransactionAmountModifier
+ (id)_postProcessedAmountForDecimalAmount:(id)a3 currency:(id)a4 exponent:(int64_t)a5;
+ (id)_predicateForPaymentTransactionPID:(int64_t)a3;
+ (id)_predicateForPaymentTransactionPIDs:(id)a3;
+ (id)_propertySettersForPaymentTransactionAmountModifier;
+ (id)databaseTable;
+ (id)insertPaymentTransactionAmountModifier:(id)a3 forPaymentTransactionPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)insertPaymentTransactionAmountModifiers:(id)a3 forPaymentTransactionPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)paymentTransactionAmountModifiersInDatabase:(id)a3 forPaymentTransactionPID:(int64_t)a4;
+ (void)associateAmountModifiersToPaymentTransactions:(id)a3 inDatabase:(id)a4;
+ (void)deleteEntitiesForPaymentTransactionPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)updateWithPaymentTransactionAmountModifiers:(id)a3 forPaymentTransactionPID:(int64_t)a4 inDatabase:(id)a5;
- (PaymentTransactionAmountModifier)initWithPaymentTransactionAmountModifier:(id)a3 forPaymentTransactionPID:(int64_t)a4 inDatabase:(id)a5;
- (id)_valuesDictionaryForPaymentTransactionAmountModifier:(id)a3 forPaymentTransactionPID:(int64_t)a4;
@end

@implementation PaymentTransactionAmountModifier

+ (id)databaseTable
{
  return @"payment_transaction_amount_modifiers";
}

- (PaymentTransactionAmountModifier)initWithPaymentTransactionAmountModifier:(id)a3 forPaymentTransactionPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue( -[PaymentTransactionAmountModifier _valuesDictionaryForPaymentTransactionAmountModifier:forPaymentTransactionPID:]( self,  "_valuesDictionaryForPaymentTransactionAmountModifier:forPaymentTransactionPID:",  a3,  a4));
  v10 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v9, v8);

  return v10;
}

+ (id)insertPaymentTransactionAmountModifier:(id)a3 forPaymentTransactionPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [objc_alloc((Class)a1) initWithPaymentTransactionAmountModifier:v9 forPaymentTransactionPID:a4 inDatabase:v8];

  return v10;
}

+ (id)insertPaymentTransactionAmountModifiers:(id)a3 forPaymentTransactionPID:(int64_t)a4 inDatabase:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100084A80;
  v13[3] = &unk_10063E548;
  v15 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  int64_t v16 = a4;
  id v14 = v7;
  id v9 = v15;
  id v10 = v7;
  [v8 enumerateObjectsUsingBlock:v13];

  id v11 = -[NSMutableArray copy](v9, "copy");
  return v11;
}

+ (void)updateWithPaymentTransactionAmountModifiers:(id)a3 forPaymentTransactionPID:(int64_t)a4 inDatabase:(id)a5
{
  id v9 = a3;
  id v7 = a5;
  if (v9 && [v9 count])
  {
    +[PaymentTransactionAmountModifier deleteEntitiesForPaymentTransactionPID:inDatabase:]( &OBJC_CLASS___PaymentTransactionAmountModifier,  "deleteEntitiesForPaymentTransactionPID:inDatabase:",  a4,  v7);
    id v8 =  +[PaymentTransactionAmountModifier insertPaymentTransactionAmountModifiers:forPaymentTransactionPID:inDatabase:]( &OBJC_CLASS___PaymentTransactionAmountModifier,  "insertPaymentTransactionAmountModifiers:forPaymentTransactionPID:inDatabase:",  v9,  a4,  v7);
  }
}

+ (void)deleteEntitiesForPaymentTransactionPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForPaymentTransactionPID:a3]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

+ (id)paymentTransactionAmountModifiersInDatabase:(id)a3 forPaymentTransactionPID:(int64_t)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPaymentTransactionPID:a4]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _propertySettersForPaymentTransactionAmountModifier]);
  id v10 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 allKeys]);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_100084DA0;
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

+ (void)associateAmountModifiersToPaymentTransactions:(id)a3 inDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
  uint64_t v9 = objc_claimAutoreleasedReturnValue([a1 _predicateForPaymentTransactionPIDs:v8]);

  v30 = (void *)v9;
  v31 = v7;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v7 predicate:v9]);
  id v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v12 = (void *)objc_claimAutoreleasedReturnValue([a1 _propertySettersForPaymentTransactionAmountModifier]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 allKeys]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 arrayByAddingObject:@"payment_transaction_pid"]);
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472LL;
  v36[2] = sub_100085164;
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

          [v22 setAmountModifiers:v27];
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

- (id)_valuesDictionaryForPaymentTransactionAmountModifier:(id)a3 forPaymentTransactionPID:(int64_t)a4
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

  id v18 = (void *)objc_claimAutoreleasedReturnValue([v5 typeString]);
  [v6 setObjectOrNull:v18 forKey:@"modifier_type"];

  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v5 modifierDescription]);
  [v6 setObjectOrNull:v19 forKey:@"modifier_description"];

  objc_msgSend(v6, "setInteger:forKey:", objc_msgSend(v5, "order"), @"modifier_order");
  [v6 setObjectOrNull:v11 forKey:@"currency"];
  [v6 setInteger:v9 forKey:@"exponent"];
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v16));
  [v6 setObjectOrNull:v20 forKey:@"amount"];

  id v21 = [v6 copy];
  return v21;
}

+ (id)_postProcessedAmountForDecimalAmount:(id)a3 currency:(id)a4 exponent:(int64_t)a5
{
  id v7 = a3;
  id v8 = 0LL;
  if (v7 && a4)
  {
    uint64_t v9 = PKNoCurrencyCode;
    id v10 = a4;
    if ([v10 isEqualToString:v9])
    {
      id v11 = -[NSDecimalNumber initWithLongLong:]( [NSDecimalNumber alloc],  "initWithLongLong:",  [v7 longLongValue]);
      v12 = (void *)objc_claimAutoreleasedReturnValue( -[NSDecimalNumber decimalNumberByMultiplyingByPowerOf10:]( v11,  "decimalNumberByMultiplyingByPowerOf10:",  (__int16)-(__int16)a5));
    }

    else
    {
      uint64_t v13 = PKCurrencyStorageNumberToCurrencyDecimal(v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v13);
    }

    id v14 = -[PKCurrencyAmount initWithAmount:currency:exponent:]( objc_alloc(&OBJC_CLASS___PKCurrencyAmount),  "initWithAmount:currency:exponent:",  v12,  v10,  a5);

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

+ (id)_propertySettersForPaymentTransactionAmountModifier
{
  v3[0] = @"modifier_type";
  v3[1] = @"modifier_description";
  v4[0] = &stru_10063E588;
  v4[1] = &stru_10063E5A8;
  v3[2] = @"modifier_order";
  v3[3] = @"amount";
  v4[2] = &stru_10063E5C8;
  v4[3] = &stru_10063E5E8;
  v3[4] = @"currency";
  v3[5] = @"exponent";
  v4[4] = &stru_10063E608;
  v4[5] = &stru_10063E628;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  6LL));
}

@end