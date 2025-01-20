@interface TransactionReceipt
+ (id)_predicateForUniqueID:(id)a3;
+ (id)_propertySettersForTransactionReceipt;
+ (id)_propertyValuesForTransactionReceipt:(id)a3;
+ (id)anyInDatabase:(id)a3 withUniqueID:(id)a4;
+ (id)databaseTable;
+ (id)insertOrUpdateTransactionReceipt:(id)a3 inDatabase:(id)a4;
- (TransactionReceipt)initWithTransactionReceipt:(id)a3 inDatabase:(id)a4;
- (id)transactionReceipt;
- (void)updateWithTransactionReceipt:(id)a3;
@end

@implementation TransactionReceipt

- (TransactionReceipt)initWithTransactionReceipt:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = objc_msgSend((id)objc_opt_class(self, v8), "_propertyValuesForTransactionReceipt:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  v11 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v10, v6);
  return v11;
}

+ (id)databaseTable
{
  return @"transaction_receipt";
}

+ (id)anyInDatabase:(id)a3 withUniqueID:(id)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForUniqueID:a4]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  return v8;
}

+ (id)insertOrUpdateTransactionReceipt:(id)a3 inDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 uniqueID]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v7 withUniqueID:v8]);
  if (v9)
  {
    id v10 = v9;
    [v9 updateWithTransactionReceipt:v6];
  }

  else
  {
    id v10 = [objc_alloc((Class)a1) initWithTransactionReceipt:v6 inDatabase:v7];
  }

  return v10;
}

- (void)updateWithTransactionReceipt:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend((id)objc_opt_class(self, v5), "_propertyValuesForTransactionReceipt:", v4);
  id v7 = (id)objc_claimAutoreleasedReturnValue(v6);

  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v7);
}

- (id)transactionReceipt
{
  v3 = objc_alloc_init(&OBJC_CLASS___PKTransactionReceipt);
  id v5 = objc_msgSend((id)objc_opt_class(self, v4), "_propertySettersForTransactionReceipt");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1003235D0;
  v13[3] = &unk_100638EF0;
  v13[4] = self;
  id v14 = v6;
  uint64_t v8 = v3;
  v15 = v8;
  id v9 = v6;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v7, v13);

  id v10 = v15;
  v11 = v8;

  return v11;
}

+ (id)_predicateForUniqueID:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"unique_id",  a3);
}

+ (id)_propertyValuesForTransactionReceipt:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 uniqueID]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v5, @"unique_id");

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 receiptProviderIdentifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:]( v4,  "setObjectOrNull:forKey:",  v6,  @"receipt_provider_identifier");

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 receiptIdentifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v7, @"receipt_identifier");

  id v8 = -[NSMutableDictionary copy](v4, "copy");
  return v8;
}

+ (id)_propertySettersForTransactionReceipt
{
  v3[0] = @"unique_id";
  v3[1] = @"receipt_provider_identifier";
  v4[0] = &stru_100656CE8;
  v4[1] = &stru_100656D08;
  v3[2] = @"receipt_identifier";
  v4[2] = &stru_100656D28;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  3LL));
}

@end