@interface PaymentTransactionAmount
+ (id)_postProcessValue:(id)a3;
+ (id)_predicateForPassUniqueIdentifier:(id)a3;
+ (id)_predicateForPaymentTransactionPID:(int64_t)a3;
+ (id)_predicateForPaymentTransactionPIDs:(id)a3;
+ (id)_predicateForPendingAmounts;
+ (id)_propertySettersForCurrencyAmount;
+ (id)anyInDatabase:(id)a3 forPaymentTransactionPID:(int64_t)a4;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertPaymentAmount:(id)a3 forPaymentTransactionPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)insertPaymentAmounts:(id)a3 forPaymentTransactionPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)paymentAmountsInDatabase:(id)a3 forPaymentTransactionPID:(int64_t)a4;
+ (id)paymentTransactionAmountsInDatabase:(id)a3 forPaymentTransactionPID:(int64_t)a4;
+ (id)pendingTransactionAmountsInDatabase:(id)a3 forPassWithUniqueIdentifier:(id)a4;
+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4;
+ (void)deleteEntitiesForPaymentTransactionPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)updateWithPaymentAmounts:(id)a3 forPaymentTransactionPID:(int64_t)a4 inDatabase:(id)a5;
- (PaymentTransactionAmount)initWithPaymentAmount:(id)a3 forPaymentTransactionPID:(int64_t)a4 inDatabase:(id)a5;
- (id)_valuesDictionaryForPaymentAmount:(id)a3;
- (id)paymentTransaction;
- (id)transactionAmount;
- (void)updateWithPaymentAmount:(id)a3;
@end

@implementation PaymentTransactionAmount

- (PaymentTransactionAmount)initWithPaymentAmount:(id)a3 forPaymentTransactionPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue( -[PaymentTransactionAmount _valuesDictionaryForPaymentAmount:]( self,  "_valuesDictionaryForPaymentAmount:",  a3));
  id v10 = [v9 mutableCopy];

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  [v10 setObjectOrNull:v11 forKey:@"payment_transaction_pid"];

  v12 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v10, v8);
  return v12;
}

+ (id)databaseTable
{
  return @"payment_transaction_amount";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class(&OBJC_CLASS___PaymentTransaction, a2) == a3) {
    return @"payment_transaction_pid";
  }
  else {
    return 0LL;
  }
}

+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4
{
  id v7 = a3;
  id v5 = a4;
  if (([v7 isEqualToString:@"payment_transaction.pid"] & 1) != 0
    || ([v7 isEqualToString:@"payment_transaction_pid"] & 1) != 0)
  {
    v6 = @"JOIN payment_transaction ON payment_transaction.pid = payment_transaction_amount.payment_transaction_pid";
LABEL_11:
    [v5 addObject:v6];
    goto LABEL_12;
  }

  if (([v7 isEqualToString:@"payment_application.transaction_source_pid"] & 1) != 0
    || ([v7 isEqualToString:@"payment_transaction.source_pid"] & 1) != 0)
  {
    v6 = @"JOIN payment_application ON payment_application.transaction_source_pid = payment_transaction.source_pid";
    goto LABEL_11;
  }

  if (([v7 isEqualToString:@"payment_application.pass_pid"] & 1) != 0
    || ([v7 isEqualToString:@"pass.pid"] & 1) != 0
    || [v7 isEqualToString:@"pass.unique_id"])
  {
    v6 = @"JOIN pass on payment_application.pass_pid = pass.pid";
    goto LABEL_11;
  }

+ (id)insertPaymentAmount:(id)a3 forPaymentTransactionPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [objc_alloc((Class)a1) initWithPaymentAmount:v9 forPaymentTransactionPID:a4 inDatabase:v8];

  return v10;
}

+ (id)insertPaymentAmounts:(id)a3 forPaymentTransactionPID:(int64_t)a4 inDatabase:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v10 = v7;
  id v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      v14 = 0LL;
      do
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = (void *)objc_claimAutoreleasedReturnValue( +[PaymentTransactionAmount insertPaymentAmount:forPaymentTransactionPID:inDatabase:]( &OBJC_CLASS___PaymentTransactionAmount,  "insertPaymentAmount:forPaymentTransactionPID:inDatabase:",  *(void *)(*((void *)&v18 + 1) + 8LL * (void)v14),  a4,  v8,  (void)v18));
        -[NSMutableArray safelyAddObject:](v9, "safelyAddObject:", v15);

        v14 = (char *)v14 + 1;
      }

      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v12);
  }

  id v16 = -[NSMutableArray copy](v9, "copy");
  return v16;
}

+ (void)updateWithPaymentAmounts:(id)a3 forPaymentTransactionPID:(int64_t)a4 inDatabase:(id)a5
{
  id v9 = a3;
  id v7 = a5;
  if (v9 && [v9 count])
  {
    +[PaymentTransactionAmount deleteEntitiesForPaymentTransactionPID:inDatabase:]( &OBJC_CLASS___PaymentTransactionAmount,  "deleteEntitiesForPaymentTransactionPID:inDatabase:",  a4,  v7);
    id v8 =  +[PaymentTransactionAmount insertPaymentAmounts:forPaymentTransactionPID:inDatabase:]( &OBJC_CLASS___PaymentTransactionAmount,  "insertPaymentAmounts:forPaymentTransactionPID:inDatabase:",  v9,  a4,  v7);
  }
}

- (void)updateWithPaymentAmount:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue( -[PaymentTransactionAmount _valuesDictionaryForPaymentAmount:]( self,  "_valuesDictionaryForPaymentAmount:",  a3));
  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v4);
}

+ (void)deleteEntitiesForPaymentTransactionPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForPaymentTransactionPID:a3]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

+ (id)anyInDatabase:(id)a3 forPaymentTransactionPID:(int64_t)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPaymentTransactionPID:a4]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  return v8;
}

+ (id)paymentTransactionAmountsInDatabase:(id)a3 forPaymentTransactionPID:(int64_t)a4
{
  id v6 = a3;
  id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPaymentTransactionPID:a4]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryWithDatabase:predicate:]( &OBJC_CLASS___PaymentTransactionAmount,  "queryWithDatabase:predicate:",  v6,  v8));
  v22[0] = @"payment_transaction_pid";
  v22[1] = @"payment_transaction.pid";
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v22, 2LL));
  v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472LL;
  v17 = sub_1002E160C;
  __int128 v18 = &unk_100639BF0;
  __int128 v20 = v7;
  id v21 = a1;
  id v19 = v6;
  id v11 = v7;
  id v12 = v6;
  [v9 enumeratePersistentIDsAndProperties:v10 usingBlock:&v15];

  id v13 = -[NSMutableArray copy](v11, "copy", v15, v16, v17, v18);
  return v13;
}

+ (id)pendingTransactionAmountsInDatabase:(id)a3 forPassWithUniqueIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPendingAmounts]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPassUniqueIdentifier:v7]);

  v24[0] = v9;
  v24[1] = v10;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v24, 2LL));
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v11));

  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryWithDatabase:predicate:]( &OBJC_CLASS___PaymentTransactionAmount,  "queryWithDatabase:predicate:",  v6,  v12));
  v23[0] = @"payment_transaction_pid";
  v23[1] = @"payment_transaction.pid";
  v23[2] = @"payment_transaction.source_pid";
  v23[3] = @"payment_application.transaction_source_pid";
  v23[4] = @"payment_application.pass_pid";
  v23[5] = @"pass.pid";
  v23[6] = @"pass.unique_id";
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v23, 7LL));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_1002E1860;
  v19[3] = &unk_100639BF0;
  id v21 = v8;
  id v22 = a1;
  id v20 = v6;
  v15 = v8;
  id v16 = v6;
  [v13 enumeratePersistentIDsAndProperties:v14 usingBlock:v19];
  id v17 = -[NSMutableArray copy](v15, "copy");

  return v17;
}

+ (id)paymentAmountsInDatabase:(id)a3 forPaymentTransactionPID:(int64_t)a4
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a1 paymentTransactionAmountsInDatabase:a3 forPaymentTransactionPID:a4]);
  id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      id v10 = 0LL;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*((void *)&v14 + 1) + 8 * (void)v10),  "transactionAmount",  (void)v14));
        -[NSMutableArray safelyAddObject:](v5, "safelyAddObject:", v11);

        id v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v8);
  }

  if (-[NSMutableArray count](v5, "count")) {
    id v12 = -[NSMutableArray copy](v5, "copy");
  }
  else {
    id v12 = 0LL;
  }

  return v12;
}

- (id)transactionAmount
{
  v3 = objc_alloc_init(&OBJC_CLASS___TransientCurrencyAmount);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[PaymentTransactionAmount _propertySettersForCurrencyAmount]( &OBJC_CLASS___PaymentTransactionAmount,  "_propertySettersForCurrencyAmount"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allKeys]);
  id v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472LL;
  __int128 v14 = sub_1002E1B00;
  __int128 v15 = &unk_100639EE8;
  id v16 = v4;
  __int128 v17 = v3;
  id v6 = v3;
  id v7 = v4;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v5, &v12);

  id v8 = objc_alloc(&OBJC_CLASS___PKTransactionAmount);
  uint64_t v9 = -[PKTransactionAmount initWithTransientCurrencyAmount:]( v8,  "initWithTransientCurrencyAmount:",  v6,  v12,  v13,  v14,  v15);
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[PaymentTransactionAmount _postProcessValue:]( &OBJC_CLASS___PaymentTransactionAmount,  "_postProcessValue:",  v9));

  return v10;
}

- (id)paymentTransaction
{
  v3 = objc_alloc_init(&OBJC_CLASS___TransientCurrencyAmount);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[PaymentTransactionAmount _propertySettersForCurrencyAmount]( &OBJC_CLASS___PaymentTransactionAmount,  "_propertySettersForCurrencyAmount"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allKeys]);
  id v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472LL;
  __int128 v14 = sub_1002E1C38;
  __int128 v15 = &unk_100639EE8;
  id v16 = v4;
  __int128 v17 = v3;
  id v6 = v3;
  id v7 = v4;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v5, &v12);

  id v8 = objc_alloc(&OBJC_CLASS___PaymentTransaction);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[TransientCurrencyAmount transactionPID](v6, "transactionPID", v12, v13, v14, v15));
  id v10 = -[SQLiteEntity initWithPersistentID:inDatabase:]( v8,  "initWithPersistentID:inDatabase:",  [v9 longLongValue],  self->super._database);

  return v10;
}

- (id)_valuesDictionaryForPaymentAmount:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 amount]);
  id v6 = [v5 exponent];
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 currency]);
  uint64_t v23 = PKNoCurrencyCode;
  v24 = v7;
  if (objc_msgSend(v7, "isEqualToString:"))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 amount]);
    uint64_t v9 = -[NSDecimalNumber initWithLongLong:]( [NSDecimalNumber alloc],  "initWithLongLong:",  [v8 longLongValue]);
    uint64_t v10 = objc_claimAutoreleasedReturnValue( -[NSDecimalNumber decimalNumberByMultiplyingByPowerOf10:]( v9,  "decimalNumberByMultiplyingByPowerOf10:",  (__int16)v6));
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 amount]);
    uint64_t v9 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue([v8 amount]);
    uint64_t v11 = PKCurrencyDecimalToStorageNumber(v9);
    uint64_t v10 = objc_claimAutoreleasedReturnValue(v11);
  }

  id v12 = (void *)v10;

  id v13 = [v3 isPending];
  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v3 label]);
  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v5 preformattedString]);
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v3 amount]);
  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v16 currency]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v17, @"currency");

  -[NSMutableDictionary setInteger:forKey:](v4, "setInteger:forKey:", v6, @"exponent");
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v12, @"amount");
  -[NSMutableDictionary setBool:forKey:](v4, "setBool:forKey:", v13, @"pending");
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v14, @"label");
  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v3 unitIdentifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v18, @"unit_identifier");

  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v15, @"preformatted_string");
  if ([v24 isEqual:v23])
  {
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v5 absoluteValue]);
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 formattedStringValue]);
    -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v20, @"preformatted_string");
  }

  else
  {
    -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", 0LL, @"preformatted_string");
  }

  id v21 = -[NSMutableDictionary copy](v4, "copy");

  return v21;
}

+ (id)_predicateForPendingAmounts
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"pending",  &__kCFBooleanTrue);
}

+ (id)_predicateForPassUniqueIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"pass.unique_id",  a3);
}

+ (id)_predicateForPaymentTransactionPID:(int64_t)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"payment_transaction_pid",  v3));

  return v4;
}

+ (id)_predicateForPaymentTransactionPIDs:(id)a3
{
  return +[SQLiteContainsPredicate containsPredicateWithProperty:values:]( &OBJC_CLASS___SQLiteContainsPredicate,  "containsPredicateWithProperty:values:",  @"payment_transaction_pid",  a3);
}

+ (id)_propertySettersForCurrencyAmount
{
  v3[0] = @"currency";
  v3[1] = @"exponent";
  v4[0] = &stru_100654368;
  v4[1] = &stru_100654388;
  v3[2] = @"label";
  v3[3] = @"pending";
  v4[2] = &stru_1006543A8;
  v4[3] = &stru_1006543C8;
  v3[4] = @"unit_identifier";
  v3[5] = @"amount";
  v4[4] = &stru_1006543E8;
  v4[5] = &stru_100654408;
  v3[6] = @"preformatted_string";
  v3[7] = @"payment_transaction_pid";
  v4[6] = &stru_100654428;
  v4[7] = &stru_100654448;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  8LL));
}

+ (id)_postProcessValue:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 amount]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 currency]);
  if ([v5 isEqualToString:PKNoCurrencyCode])
  {
    id v6 = objc_alloc(&OBJC_CLASS___NSDecimalNumber);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 amount]);
    id v8 = -[NSDecimalNumber initWithLongLong:](v6, "initWithLongLong:", [v7 longLongValue]);

    uint64_t v9 = objc_claimAutoreleasedReturnValue( -[NSDecimalNumber decimalNumberByMultiplyingByPowerOf10:]( v8,  "decimalNumberByMultiplyingByPowerOf10:",  (__int16)-(uint64_t)[v4 exponent]));
  }

  else
  {
    id v8 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue([v4 amount]);
    uint64_t v10 = PKCurrencyStorageNumberToCurrencyDecimal(v8);
    uint64_t v9 = objc_claimAutoreleasedReturnValue(v10);
  }

  uint64_t v11 = (void *)v9;
  [v4 setAmount:v9];

  [v3 setAmount:v4];
  return v3;
}

@end