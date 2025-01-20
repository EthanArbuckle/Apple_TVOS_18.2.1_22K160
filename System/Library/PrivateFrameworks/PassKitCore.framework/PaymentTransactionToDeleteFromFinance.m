@interface PaymentTransactionToDeleteFromFinance
+ (BOOL)deletePaymentTransactionToDeleteFromFinanceWithPID:(int64_t)a3 inDatabase:(id)a4;
+ (id)_propertySettersForPaymentTransactionToDeleteFromFinance;
+ (id)databaseTable;
+ (id)transactionsToDeleteFromFinanceWithLimit:(int64_t)a3 inDatabase:(id)a4;
+ (void)insertPaymentTransactionToDeleteFromFinance:(id)a3 inDatabase:(id)a4;
@end

@implementation PaymentTransactionToDeleteFromFinance

+ (id)databaseTable
{
  return @"transactions_to_delete_from_finance";
}

+ (id)transactionsToDeleteFromFinanceWithLimit:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _propertySettersForPaymentTransactionToDeleteFromFinance]);
  v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryWithDatabase:predicate:orderingProperties:orderingDirections:limit:]( &OBJC_CLASS___PaymentTransactionToDeleteFromFinance,  "queryWithDatabase:predicate:orderingProperties:orderingDirections:limit:",  v6,  0LL,  0LL,  0LL,  a3));

  v10 = (void *)objc_claimAutoreleasedReturnValue([v7 allKeys]);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000E8318;
  v15[3] = &unk_100639BF0;
  v17 = v8;
  id v18 = a1;
  id v16 = v7;
  v11 = v8;
  id v12 = v7;
  [v9 enumeratePersistentIDsAndProperties:v10 usingBlock:v15];

  id v13 = -[NSMutableDictionary copy](v11, "copy");
  return v13;
}

+ (void)insertPaymentTransactionToDeleteFromFinance:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 transactionIdentifier]);
  -[NSMutableDictionary setObject:forKey:](v11, "setObject:forKey:", v8, @"transaction_identifier");

  v9 = (void *)objc_claimAutoreleasedReturnValue([v7 accountIdentifier]);
  -[NSMutableDictionary setObject:forKey:](v11, "setObject:forKey:", v9, @"account_identifier");

  id v10 = [objc_alloc((Class)a1) initWithPropertyValues:v11 inDatabase:v6];
}

+ (BOOL)deletePaymentTransactionToDeleteFromFinanceWithPID:(int64_t)a3 inDatabase:(id)a4
{
  id v5 = a4;
  id v6 = -[SQLiteEntity initWithPersistentID:inDatabase:]( objc_alloc(&OBJC_CLASS___PaymentTransactionToDeleteFromFinance),  "initWithPersistentID:inDatabase:",  a3,  v5);

  unsigned __int8 v7 = -[SQLiteEntity deleteFromDatabase](v6, "deleteFromDatabase");
  return v7;
}

+ (id)_propertySettersForPaymentTransactionToDeleteFromFinance
{
  v3[0] = @"transaction_identifier";
  v3[1] = @"account_identifier";
  v4[0] = &stru_100643210;
  v4[1] = &stru_100643230;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  2LL));
}

@end