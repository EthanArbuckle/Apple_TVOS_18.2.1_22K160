@interface TransactionReleasedDataApplication
+ (id)_predicateForReleasedDataPID:(int64_t)a3;
+ (id)_propertySettersForReleasedData;
+ (id)_releasedDataElementsFromQuery:(id)a3;
+ (id)databaseTable;
+ (id)releasedDataElementsForPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deleteEntitiesForPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)insertReleasedDataApplication:(id)a3 forPID:(int64_t)a4 inDatabase:(id)a5;
@end

@implementation TransactionReleasedDataApplication

+ (id)databaseTable
{
  return @"tamarind";
}

+ (void)insertReleasedDataApplication:(id)a3 forPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  [a1 deleteEntitiesForPID:a4 inDatabase:v8];
  v15 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  -[NSMutableDictionary setObject:forKey:](v15, "setObject:forKey:", v10, @"a");

  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v9 client]));
  -[NSMutableDictionary setObjectOrNull:forKey:](v15, "setObjectOrNull:forKey:", v11, @"b");

  v12 = (void *)objc_claimAutoreleasedReturnValue([v9 bundleIdentifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v15, "setObjectOrNull:forKey:", v12, @"c");

  v13 = (void *)objc_claimAutoreleasedReturnValue([v9 usageDescription]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v15, "setObjectOrNull:forKey:", v13, @"d");

  id v14 = [objc_alloc((Class)a1) initWithPropertyValues:v15 inDatabase:v8];
}

+ (id)releasedDataElementsForPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForReleasedDataPID:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _releasedDataElementsFromQuery:v8]);
  return v9;
}

+ (id)_releasedDataElementsFromQuery:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([a1 _propertySettersForReleasedData]);
  id v6 = objc_alloc_init(&OBJC_CLASS___PKTransactionReleasedDataApplication);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 allKeys]);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100158A44;
  v12[3] = &unk_100639BF0;
  id v15 = a1;
  id v13 = v5;
  id v8 = v6;
  id v14 = v8;
  id v9 = v5;
  [v4 enumeratePersistentIDsAndProperties:v7 usingBlock:v12];

  if (-[PKTransactionReleasedDataApplication client](v8, "client")) {
    v10 = v8;
  }
  else {
    v10 = 0LL;
  }

  return v10;
}

+ (void)deleteEntitiesForPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForReleasedDataPID:a3]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

+ (id)_predicateForReleasedDataPID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"a",  v3));

  return v4;
}

+ (id)_propertySettersForReleasedData
{
  v3[0] = @"b";
  v3[1] = @"c";
  v4[0] = &stru_100646868;
  v4[1] = &stru_100646888;
  v3[2] = @"d";
  v4[2] = &stru_1006468A8;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  3LL));
}

@end