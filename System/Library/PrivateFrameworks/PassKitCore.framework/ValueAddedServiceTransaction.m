@interface ValueAddedServiceTransaction
+ (id)_predicateForIdentifier:(id)a3;
+ (id)_predicateForMerchantPID:(id)a3;
+ (id)_predicateForMerchantWithIdentifier:(id)a3;
+ (id)_predicateForPass:(id)a3;
+ (id)_predicateForPassWithUniqueIdentifier:(id)a3;
+ (id)_predicateForPaymentTransaction:(id)a3;
+ (id)_propertySettersForValueAddedServiceTransaction;
+ (id)_valueAddedServiceTransactionsWithQuery:(id)a3;
+ (id)anyInDatabase:(id)a3 withIdentifier:(id)a4;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertValueAddedServiceTransaction:(id)a3 withPass:(id)a4 paymentTransaction:(id)a5 valueAddedMerchant:(id)a6 inDatabase:(id)a7;
+ (id)valueAddedServiceTransactionsInDatabase:(id)a3 forPassUniqueIdentifier:(id)a4 limit:(int64_t)a5;
+ (id)valueAddedServiceTransactionsInDatabase:(id)a3 forPaymentTransaction:(id)a4;
+ (unint64_t)numberOfValueAddedServiceTransactionsForMerchant:(id)a3 inDatabase:(id)a4;
+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4;
+ (void)deleteEntitiesForPass:(id)a3 inDatabase:(id)a4;
+ (void)deleteEntitiesForPaymentTransaction:(id)a3 inDatabase:(id)a4;
+ (void)truncateEntitiesForPass:(id)a3 inDatabase:(id)a4 toCount:(int64_t)a5;
- (BOOL)deleteFromDatabase;
- (ValueAddedServiceTransaction)initWithValueAddedServiceTransaction:(id)a3 pass:(id)a4 paymentTransaction:(id)a5 valueAddedMerchant:(id)a6 inDatabase:(id)a7;
- (id)valueAddedServiceTransaction;
- (void)updateWithValueAddedServiceTransaction:(id)a3 paymentTransaction:(id)a4;
@end

@implementation ValueAddedServiceTransaction

- (ValueAddedServiceTransaction)initWithValueAddedServiceTransaction:(id)a3 pass:(id)a4 paymentTransaction:(id)a5 valueAddedMerchant:(id)a6 inDatabase:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v18 = [v15 persistentID];

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v18));
  [v17 setObjectOrNull:v19 forKey:@"pass_pid"];

  id v20 = [v14 persistentID];
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v20));
  [v17 setObjectOrNull:v21 forKey:@"payment_transaction_pid"];

  v22 = (void *)objc_claimAutoreleasedReturnValue([v16 identifier]);
  [v17 setObjectOrNull:v22 forKey:@"identifier"];

  v23 = (void *)objc_claimAutoreleasedReturnValue([v16 merchantURL]);
  [v17 setObjectOrNull:v23 forKey:@"merchant_url"];

  v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v16 didSucceed]));
  [v17 setObjectOrNull:v24 forKey:@"successful"];

  v25 = (void *)objc_claimAutoreleasedReturnValue([v16 terminalApplicationVersion]);
  [v17 setObjectOrNull:v25 forKey:@"terminal_application_version"];

  v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v16 terminalMode]));
  [v17 setObjectOrNull:v26 forKey:@"terminal_mode"];

  v27 = (void *)objc_claimAutoreleasedReturnValue([v16 transactionDate]);
  [v17 setObjectOrNull:v27 forKey:@"transaction_date"];

  id v28 = [v13 persistentID];
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v28));
  [v17 setObjectOrNull:v29 forKey:@"merchant_pid"];

  v30 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v17, v12);
  return v30;
}

+ (id)insertValueAddedServiceTransaction:(id)a3 withPass:(id)a4 paymentTransaction:(id)a5 valueAddedMerchant:(id)a6 inDatabase:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = [objc_alloc((Class)a1) initWithValueAddedServiceTransaction:v16 pass:v15 paymentTransaction:v14 valueAddedMerchant:v13 inDatabase:v12];

  return v17;
}

+ (void)truncateEntitiesForPass:(id)a3 inDatabase:(id)a4 toCount:(int64_t)a5
{
  id v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPass:a3]);
  id v18 = @"transaction_date";
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v18, 1LL));
  id v17 = @"DESC";
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v17, 1LL));
  id v12 = (void *)objc_claimAutoreleasedReturnValue( [a1 queryWithDatabase:v8 predicate:v9 orderingProperties:v10 orderingDirections:v11]);

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1002FA2B0;
  v14[3] = &unk_100651A08;
  id v15 = v8;
  int64_t v16 = a5;
  id v13 = v8;
  [v12 enumeratePersistentIDsUsingBlock:v14];
}

+ (void)deleteEntitiesForPass:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPass:a3]);
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);

  [v8 deleteAllEntities];
}

+ (void)deleteEntitiesForPaymentTransaction:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPaymentTransaction:a3]);
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);

  [v8 deleteAllEntities];
}

- (BOOL)deleteFromDatabase
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"merchant_pid"));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[ValueAddedServiceTransaction _predicateForMerchantPID:]( &OBJC_CLASS___ValueAddedServiceTransaction,  "_predicateForMerchantPID:",  v3));
  database = self->super._database;
  id v15 = @"transaction_date";
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v15, 1LL));
  id v14 = @"DESC";
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v14, 1LL));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryWithDatabase:predicate:orderingProperties:orderingDirections:limit:]( &OBJC_CLASS___ValueAddedServiceTransaction,  "queryWithDatabase:predicate:orderingProperties:orderingDirections:limit:",  database,  v4,  v6,  v7,  PKMaxPerPassValueAddedServiceTransactionHistory));

  v9 = (void *)objc_claimAutoreleasedReturnValue( +[ValueAddedServiceTransaction _valueAddedServiceTransactionsWithQuery:]( &OBJC_CLASS___ValueAddedServiceTransaction,  "_valueAddedServiceTransactionsWithQuery:",  v8));
  if ((unint64_t)[v9 count] <= 1)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[ValueAddedMerchant anyInDatabase:withPersistentID:]( &OBJC_CLASS___ValueAddedMerchant,  "anyInDatabase:withPersistentID:",  self->super._database,  v3));
    [v10 deleteFromDatabase];
  }

  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___ValueAddedServiceTransaction;
  BOOL v11 = -[SQLiteEntity deleteFromDatabase](&v13, "deleteFromDatabase");

  return v11;
}

+ (id)anyInDatabase:(id)a3 withIdentifier:(id)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForIdentifier:a4]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  return v8;
}

+ (id)valueAddedServiceTransactionsInDatabase:(id)a3 forPassUniqueIdentifier:(id)a4 limit:(int64_t)a5
{
  id v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPassWithUniqueIdentifier:a4]);
  int64_t v16 = @"transaction_date";
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v16, 1LL));
  id v15 = @"DESC";
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v15, 1LL));
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryWithDatabase:predicate:orderingProperties:orderingDirections:limit:]( &OBJC_CLASS___ValueAddedServiceTransaction,  "queryWithDatabase:predicate:orderingProperties:orderingDirections:limit:",  v8,  v9,  v10,  v11,  a5));

  objc_super v13 = (void *)objc_claimAutoreleasedReturnValue([a1 _valueAddedServiceTransactionsWithQuery:v12]);
  return v13;
}

+ (id)valueAddedServiceTransactionsInDatabase:(id)a3 forPaymentTransaction:(id)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a4 identifier]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[PaymentTransaction anyInDatabase:withIdentifier:]( &OBJC_CLASS___PaymentTransaction,  "anyInDatabase:withIdentifier:",  v6,  v7));

  v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPaymentTransaction:v8]);
  int64_t v16 = @"transaction_date";
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v16, 1LL));
  id v15 = @"DESC";
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v15, 1LL));
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryWithDatabase:predicate:orderingProperties:orderingDirections:]( &OBJC_CLASS___ValueAddedServiceTransaction,  "queryWithDatabase:predicate:orderingProperties:orderingDirections:",  v6,  v9,  v10,  v11));

  objc_super v13 = (void *)objc_claimAutoreleasedReturnValue([a1 _valueAddedServiceTransactionsWithQuery:v12]);
  return v13;
}

+ (unint64_t)numberOfValueAddedServiceTransactionsForMerchant:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a3 identifier]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 hexEncoding]);

  v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForMerchantWithIdentifier:v8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryWithDatabase:predicate:]( &OBJC_CLASS___ValueAddedServiceTransaction,  "queryWithDatabase:predicate:",  v6,  v9));

  id v11 = [v10 countOfEntities];
  return (unint64_t)v11;
}

- (void)updateWithValueAddedServiceTransaction:(id)a3 paymentTransaction:(id)a4
{
  id v21 = a3;
  id v6 = a4;
  v7 = v6;
  if (v6)
  {
    database = self->super._database;
    v9 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[PaymentTransaction anyInDatabase:withIdentifier:]( &OBJC_CLASS___PaymentTransaction,  "anyInDatabase:withIdentifier:",  database,  v9));

    if (v10)
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
      id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v10 persistentID]));
      [v11 setObject:v12 forKey:@"payment_transaction_pid"];

      -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v11);
    }
  }

  objc_super v13 = (void *)objc_claimAutoreleasedReturnValue([v21 merchant]);
  id v14 = v13;
  if (v13)
  {
    id v15 = self->super._database;
    int64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v13 identifier]);
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 hexEncoding]);
    id v18 = (void *)objc_claimAutoreleasedReturnValue( +[ValueAddedMerchant anyInDatabase:withIdentifier:]( &OBJC_CLASS___ValueAddedMerchant,  "anyInDatabase:withIdentifier:",  v15,  v17));

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v18 persistentID]));
    [v19 setObject:v20 forKey:@"merchant_pid"];

    -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v19);
  }
}

- (id)valueAddedServiceTransaction
{
  v3 = objc_alloc_init(&OBJC_CLASS___PKValueAddedServiceTransaction);
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[ValueAddedServiceTransaction _propertySettersForValueAddedServiceTransaction]( &OBJC_CLASS___ValueAddedServiceTransaction,  "_propertySettersForValueAddedServiceTransaction"));
  database = self->super._database;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"merchant_pid"));
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[ValueAddedMerchant anyInDatabase:withPersistentID:]( &OBJC_CLASS___ValueAddedMerchant,  "anyInDatabase:withPersistentID:",  database,  v6));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 valueAddedMerchant]);

  v9 = (void *)objc_claimAutoreleasedReturnValue([v4 allKeys]);
  id v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472LL;
  id v17 = sub_1002FAC90;
  id v18 = &unk_100639EE8;
  id v19 = v4;
  v10 = v3;
  id v20 = v10;
  id v11 = v4;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v9, &v15);

  -[PKValueAddedServiceTransaction setMerchant:](v10, "setMerchant:", v8, v15, v16, v17, v18);
  id v12 = v20;
  objc_super v13 = v10;

  return v13;
}

+ (id)databaseTable
{
  return @"value_added_service_transaction";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class(&OBJC_CLASS___Pass, a2) == a3) {
    return @"pass_pid";
  }
  if ((Class)objc_opt_class(&OBJC_CLASS___PaymentTransaction, v4) == a3) {
    return @"payment_transaction_pid";
  }
  if ((Class)objc_opt_class(&OBJC_CLASS___ValueAddedMerchant, v5) == a3) {
    return @"merchant_pid";
  }
  return 0LL;
}

+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (__CFString *)v5;
  objc_super v13 = v7;
  if (v7 == @"pass.unique_id") {
    goto LABEL_4;
  }
  if (v7)
  {
    unsigned __int8 v8 = -[__CFString isEqualToString:](v7, "isEqualToString:", @"pass.unique_id");

    if ((v8 & 1) != 0)
    {
LABEL_4:
      v9 = @"JOIN pass ON pass.pid = value_added_service_transaction.pass_pid";
LABEL_5:
      [v6 addObject:v9];
      goto LABEL_6;
    }

    v10 = v13;
    if (v10 == @"value_added_merchant.identifier"
      || (id v11 = v10,
          unsigned int v12 = -[__CFString isEqualToString:]( v10,  "isEqualToString:",  @"value_added_merchant.identifier"),  v11,  v12))
    {
      v9 = @"JOIN value_added_merchant ON value_added_merchant.pid == value_added_service_transaction.merchant_pid";
      goto LABEL_5;
    }
  }

+ (id)_predicateForPaymentTransaction:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [a3 persistentID]));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"payment_transaction_pid",  v3));

  return v4;
}

+ (id)_predicateForPassWithUniqueIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"pass.unique_id",  a3);
}

+ (id)_predicateForMerchantWithIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"value_added_merchant.identifier",  a3);
}

+ (id)_predicateForPass:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [a3 persistentID]));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"pass_pid",  v3));

  return v4;
}

+ (id)_predicateForIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"identifier",  a3);
}

+ (id)_predicateForMerchantPID:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"identifier",  a3);
}

+ (id)_valueAddedServiceTransactionsWithQuery:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([a1 _propertySettersForValueAddedServiceTransaction]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 allKeys]);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1002FAFFC;
  v10[3] = &unk_10063C288;
  id v11 = v5;
  id v12 = a1;
  id v8 = v5;
  [v4 enumeratePersistentIDsAndProperties:v7 usingBlock:v10];

  return v6;
}

+ (id)_propertySettersForValueAddedServiceTransaction
{
  v3[0] = @"identifier";
  v3[1] = @"merchant_url";
  v4[0] = &stru_100655778;
  v4[1] = &stru_100655798;
  v3[2] = @"successful";
  v3[3] = @"terminal_application_version";
  v4[2] = &stru_1006557B8;
  v4[3] = &stru_1006557D8;
  v3[4] = @"terminal_mode";
  v3[5] = @"transaction_date";
  v4[4] = &stru_1006557F8;
  v4[5] = &stru_100655818;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  6LL));
}

@end