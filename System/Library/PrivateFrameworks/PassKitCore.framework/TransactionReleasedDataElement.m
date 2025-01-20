@interface TransactionReleasedDataElement
+ (id)_predicateForReleasedDataPID:(int64_t)a3;
+ (id)_propertySettersForReleasedData;
+ (id)_releasedDataElementsFromQuery:(id)a3;
+ (id)databaseTable;
+ (id)releasedDataElementsForPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deleteEntitiesForPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)insertReleasedDataElements:(id)a3 forPID:(int64_t)a4 inDatabase:(id)a5;
@end

@implementation TransactionReleasedDataElement

+ (id)databaseTable
{
  return @"water";
}

+ (void)insertReleasedDataElements:(id)a3 forPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  [a1 deleteEntitiesForPID:a4 inDatabase:v9];
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id obj = v8;
  id v10 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v23;
    do
    {
      v13 = 0LL;
      do
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(obj);
        }
        v14 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)v13);
        v15 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
        -[NSMutableDictionary setObject:forKey:](v15, "setObject:forKey:", v16, @"a");

        v17 = (void *)objc_claimAutoreleasedReturnValue([v14 elementNamespace]);
        -[NSMutableDictionary setObjectOrNull:forKey:](v15, "setObjectOrNull:forKey:", v17, @"b");

        v18 = (void *)objc_claimAutoreleasedReturnValue([v14 identifier]);
        -[NSMutableDictionary setObjectOrNull:forKey:](v15, "setObjectOrNull:forKey:", v18, @"c");

        v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v14 retentionIntent]));
        -[NSMutableDictionary setObjectOrNull:forKey:](v15, "setObjectOrNull:forKey:", v19, @"d");

        v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v14 retentionPeriod]));
        -[NSMutableDictionary setObjectOrNull:forKey:](v15, "setObjectOrNull:forKey:", v20, @"e");

        v13 = (char *)v13 + 1;
      }

      while (v11 != v13);
      id v11 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }

    while (v11);
  }
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
  id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 allKeys]);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1003259EC;
  v12[3] = &unk_100639BF0;
  id v15 = a1;
  id v13 = v5;
  id v8 = v6;
  v14 = v8;
  id v9 = v5;
  [v4 enumeratePersistentIDsAndProperties:v7 usingBlock:v12];

  if (-[NSMutableSet count](v8, "count")) {
    id v10 = -[NSMutableSet copy](v8, "copy");
  }
  else {
    id v10 = 0LL;
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
  v4[0] = &stru_100656F48;
  v4[1] = &stru_100656F68;
  v3[2] = @"d";
  v3[3] = @"e";
  v4[2] = &stru_100656F88;
  v4[3] = &stru_100656FA8;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  4LL));
}

@end