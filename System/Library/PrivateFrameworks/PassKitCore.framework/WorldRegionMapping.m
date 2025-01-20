@interface WorldRegionMapping
+ (id)_predicateForWorldRegionPID:(int64_t)a3;
+ (id)_predicateForWorldTransactionPID:(int64_t)a3;
+ (id)databaseTable;
+ (id)errorForTransactionPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)increaseFailureCountForTransactionPID:(int64_t)a3 error:(id)a4 inDatabase:(id)a5;
+ (void)insertMatchForWorldRegion:(id)a3 transactionPID:(int64_t)a4 inDatabase:(id)a5;
@end

@implementation WorldRegionMapping

+ (id)databaseTable
{
  return @"world_region_mapping";
}

+ (void)insertMatchForWorldRegion:(id)a3 transactionPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v21 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForWorldTransactionPID:a4]);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "queryWithDatabase:predicate:", v9));
  [v10 deleteAllEntities];

  id v22 = v8;
  if (v22)
  {
    v11 = v22;
    while (1)
    {
      v12 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v11 persistentID]));
      -[NSMutableDictionary setObjectOrNull:forKey:](v12, "setObjectOrNull:forKey:", v13, @"world_region_pid");

      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
      -[NSMutableDictionary setObjectOrNull:forKey:]( v12,  "setObjectOrNull:forKey:",  v14,  @"payment_transaction_pid");

      -[NSMutableDictionary setObjectOrNull:forKey:]( v12,  "setObjectOrNull:forKey:",  &off_100690620,  @"match_try_count");
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      v16 = (void *)_SQLValueForDate(v15);
      -[NSMutableDictionary setObjectOrNull:forKey:](v12, "setObjectOrNull:forKey:", v16, @"last_modified_date");

      v17 = (void *)objc_claimAutoreleasedReturnValue([v11 valueForProperty:@"parent_pid"]);
      uint64_t v19 = objc_opt_class(&OBJC_CLASS___NSNumber, v18);
      if ((objc_opt_isKindOfClass(v17, v19) & 1) == 0) {
        break;
      }
      uint64_t v20 = objc_claimAutoreleasedReturnValue(+[WorldRegion anyInDatabase:withPID:](&OBJC_CLASS___WorldRegion, "anyInDatabase:withPID:", v9, v17));

      v11 = (void *)v20;
      if (!v20) {
        goto LABEL_7;
      }
    }
  }

+ (void)increaseFailureCountForTransactionPID:(int64_t)a3 error:(id)a4 inDatabase:(id)a5
{
  id v20 = a4;
  id v8 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForWorldTransactionPID:a3]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v8 predicate:v9]);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  v13 = (void *)_SQLValueForDate(v12);
  [v11 setObjectOrNull:v13 forKey:@"last_modified_date"];

  if (!v20)
  {
    [v11 setObjectOrNull:0 forKey:@"last_error_domain"];
    [v11 setObjectOrNull:0 forKey:@"last_error_code"];
    if (v10) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
    [v11 setObjectOrNull:v19 forKey:@"payment_transaction_pid"];

    [v11 setObjectOrNull:&off_100690638 forKey:@"match_try_count"];
    goto LABEL_6;
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue([v20 domain]);
  [v11 setObjectOrNull:v14 forKey:@"last_error_domain"];

  v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v20 code]));
  [v11 setObjectOrNull:v15 forKey:@"last_error_code"];

  if (!v10) {
    goto LABEL_5;
  }
LABEL_3:
  v16 = (void *)objc_claimAutoreleasedReturnValue([v10 valueForProperty:@"match_try_count"]);
  v17 = (char *)[v16 integerValue];

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v17 + 1));
  [v11 setObjectOrNull:v18 forKey:@"match_try_count"];

  [v10 setValuesWithDictionary:v11];
LABEL_6:
}

+ (id)errorForTransactionPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForWorldTransactionPID:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 valueForProperty:@"last_error_domain"]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v8 valueForProperty:@"last_error_code"]);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v8 valueForProperty:@"last_modified_date"]);
  v12 = (void *)_DateForSQLValue(v11);

  v13 = 0LL;
  if (v9 && v10 && v12)
  {
    id v14 = [v10 integerValue];
    uint64_t v18 = @"lastModifiedDate";
    v15 = (void *)objc_claimAutoreleasedReturnValue([v12 description]);
    uint64_t v19 = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v19,  &v18,  1LL));
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v9,  v14,  v16));
  }

  return v13;
}

+ (id)_predicateForWorldRegionPID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"world_region_pid",  v3));

  return v4;
}

+ (id)_predicateForWorldTransactionPID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"payment_transaction_pid",  v3));

  return v4;
}

@end