@interface TransactionCommutePlanUnit
+ (id)_predicateForPaymentTransactionPID:(int64_t)a3;
+ (id)_predicateForPaymentTransactionPIDs:(id)a3;
+ (id)_propertySettersForCommutePlanUnit;
+ (id)anyInDatabase:(id)a3 forPaymentTransactionPID:(int64_t)a4;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertCommutePlanUnit:(id)a3 forPaymentTransactionPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)insertCommutePlanUnits:(id)a3 forPaymentTransactionPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)pk_transactionCommutePlanUnitsInDatabase:(id)a3 forPaymentTransactionPID:(int64_t)a4;
+ (id)transactionCommutePlanUnitsInDatabase:(id)a3 forPaymentTransactionPID:(int64_t)a4;
+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4;
+ (void)deleteEntitiesForPaymentTransactionPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)updateWithCommutePlanUnits:(id)a3 forPaymentTransactionPID:(int64_t)a4 inDatabase:(id)a5;
- (TransactionCommutePlanUnit)initWithCommutePlanUnit:(id)a3 forPaymentTransactionPID:(int64_t)a4 inDatabase:(id)a5;
- (id)_valuesDictionaryForCommutePlanUnit:(id)a3 forPaymentTransactionPID:(int64_t)a4;
- (id)transactionCommutePlanUnit;
@end

@implementation TransactionCommutePlanUnit

- (TransactionCommutePlanUnit)initWithCommutePlanUnit:(id)a3 forPaymentTransactionPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue( -[TransactionCommutePlanUnit _valuesDictionaryForCommutePlanUnit:forPaymentTransactionPID:]( self,  "_valuesDictionaryForCommutePlanUnit:forPaymentTransactionPID:",  a3,  a4));
  v10 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v9, v8);

  return v10;
}

+ (id)databaseTable
{
  return @"ice_cream_banana";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class(&OBJC_CLASS___PaymentTransaction, a2) == a3) {
    return @"a";
  }
  else {
    return 0LL;
  }
}

+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4
{
  id v5 = a4;
}

+ (id)insertCommutePlanUnit:(id)a3 forPaymentTransactionPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [objc_alloc((Class)a1) initWithCommutePlanUnit:v9 forPaymentTransactionPID:a4 inDatabase:v8];

  return v10;
}

+ (id)insertCommutePlanUnits:(id)a3 forPaymentTransactionPID:(int64_t)a4 inDatabase:(id)a5
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
        v15 = (void *)objc_claimAutoreleasedReturnValue( +[TransactionCommutePlanUnit insertCommutePlanUnit:forPaymentTransactionPID:inDatabase:]( &OBJC_CLASS___TransactionCommutePlanUnit,  "insertCommutePlanUnit:forPaymentTransactionPID:inDatabase:",  *(void *)(*((void *)&v18 + 1) + 8LL * (void)v14),  a4,  v8,  (void)v18));
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

+ (id)transactionCommutePlanUnitsInDatabase:(id)a3 forPaymentTransactionPID:(int64_t)a4
{
  id v6 = a3;
  id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPaymentTransactionPID:a4]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryWithDatabase:predicate:]( &OBJC_CLASS___TransactionCommutePlanUnit,  "queryWithDatabase:predicate:",  v6,  v8));
  v22[0] = @"a";
  v22[1] = @"payment_transaction.pid";
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v22, 2LL));
  v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472LL;
  v17 = sub_100145AC4;
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

+ (id)pk_transactionCommutePlanUnitsInDatabase:(id)a3 forPaymentTransactionPID:(int64_t)a4
{
  v4 = (void *)objc_claimAutoreleasedReturnValue([a1 transactionCommutePlanUnitsInDatabase:a3 forPaymentTransactionPID:a4]);
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
        id v11 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*((void *)&v14 + 1) + 8 * (void)v10),  "transactionCommutePlanUnit",  (void)v14));
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

+ (void)updateWithCommutePlanUnits:(id)a3 forPaymentTransactionPID:(int64_t)a4 inDatabase:(id)a5
{
  id v9 = a3;
  id v7 = a5;
  if (v9 && [v9 count])
  {
    +[TransactionCommutePlanUnit deleteEntitiesForPaymentTransactionPID:inDatabase:]( &OBJC_CLASS___TransactionCommutePlanUnit,  "deleteEntitiesForPaymentTransactionPID:inDatabase:",  a4,  v7);
    id v8 =  +[TransactionCommutePlanUnit insertCommutePlanUnits:forPaymentTransactionPID:inDatabase:]( &OBJC_CLASS___TransactionCommutePlanUnit,  "insertCommutePlanUnits:forPaymentTransactionPID:inDatabase:",  v9,  a4,  v7);
  }
}

- (id)transactionCommutePlanUnit
{
  v3 = objc_alloc_init(&OBJC_CLASS___TransientUnit);
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[TransactionCommutePlanUnit _propertySettersForCommutePlanUnit]( &OBJC_CLASS___TransactionCommutePlanUnit,  "_propertySettersForCommutePlanUnit"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allKeys]);
  id v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472LL;
  id v12 = sub_100145DC8;
  id v13 = &unk_100639EE8;
  id v14 = v4;
  __int128 v15 = v3;
  id v6 = v3;
  id v7 = v4;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v5, &v10);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TransientUnit commutePlanUnit](v6, "commutePlanUnit", v10, v11, v12, v13));
  return v8;
}

- (id)_valuesDictionaryForCommutePlanUnit:(id)a3 forPaymentTransactionPID:(int64_t)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  [v6 setObjectOrNull:v7 forKey:@"a"];

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 valueCount]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 currency]);
  [v6 setObjectOrNull:v9 forKey:@"d"];

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 label]);
  [v6 setObjectOrNull:v10 forKey:@"c"];

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
  [v6 setObjectOrNull:v11 forKey:@"b"];

  objc_msgSend(v6, "setInteger:forKey:", objc_msgSend(v5, "planType"), @"f");
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v5 valueCount]);

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 amount]);
  uint64_t v14 = PKCurrencyDecimalToStorageNumber(v13);
  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  [v6 setObjectOrNull:v15 forKey:@"e"];

  id v16 = [v6 copy];
  return v16;
}

+ (id)_predicateForPaymentTransactionPID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"a",  v3));

  return v4;
}

+ (id)_predicateForPaymentTransactionPIDs:(id)a3
{
  return +[SQLiteContainsPredicate containsPredicateWithProperty:values:]( &OBJC_CLASS___SQLiteContainsPredicate,  "containsPredicateWithProperty:values:",  @"a",  a3);
}

+ (id)_propertySettersForCommutePlanUnit
{
  v3[0] = @"b";
  v3[1] = @"d";
  v4[0] = &stru_1006458B8;
  v4[1] = &stru_1006458D8;
  v3[2] = @"c";
  v3[3] = @"e";
  v4[2] = &stru_1006458F8;
  v4[3] = &stru_100645918;
  v3[4] = @"f";
  v4[4] = &stru_100645938;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  5LL));
}

@end