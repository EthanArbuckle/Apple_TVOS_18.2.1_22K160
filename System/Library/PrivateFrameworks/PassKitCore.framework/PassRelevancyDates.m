@interface PassRelevancyDates
+ (BOOL)hasRelevancyDatesForPassPID:(unint64_t)a3 inDatabase:(id)a4;
+ (id)_predicateForPassPID:(int64_t)a3;
+ (id)_propertyValuesForPassRelevancyDates:(id)a3 passPID:(int64_t)a4;
+ (id)_relevantDatesInDatabase:(id)a3 matchingPredicate:(id)a4;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)relevancyDatesForPassPID:(unint64_t)a3 inDatabase:(id)a4;
+ (void)deleteEntitiesForPassPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)insertPassRelevancyDates:(id)a3 forPassPID:(int64_t)a4 inDatabase:(id)a5;
@end

@implementation PassRelevancyDates

+ (id)databaseTable
{
  return @"relevant_pass_dates";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class(&OBJC_CLASS___Pass, a2) == a3) {
    return @"pass_pid";
  }
  else {
    return 0LL;
  }
}

+ (void)insertPassRelevancyDates:(id)a3 forPassPID:(int64_t)a4 inDatabase:(id)a5
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000D922C;
  v8[3] = &unk_100642030;
  id v11 = a1;
  int64_t v12 = a4;
  id v9 = a3;
  id v10 = a5;
  id v6 = v10;
  id v7 = v9;
  sub_1002CCC5C((uint64_t)v6, v8);
}

+ (BOOL)hasRelevancyDatesForPassPID:(unint64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPassPID:a3]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  return v8 != 0LL;
}

+ (id)relevancyDatesForPassPID:(unint64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPassPID:a3]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _relevantDatesInDatabase:v6 matchingPredicate:v7]);

  return v8;
}

+ (void)deleteEntitiesForPassPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForPassPID:a3]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

+ (id)_predicateForPassPID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"pass_pid",  v3));

  return v4;
}

+ (id)_relevantDatesInDatabase:(id)a3 matchingPredicate:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryWithDatabase:predicate:]( &OBJC_CLASS___PassRelevancyDates,  "queryWithDatabase:predicate:",  v6,  v5));

  v17[0] = @"relevant_date";
  v17[1] = @"start_date";
  v17[2] = @"end_date";
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v17, 3LL));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000D9684;
  v15[3] = &unk_10063C0D0;
  v16 = v7;
  id v10 = v7;
  [v8 enumeratePersistentIDsAndProperties:v9 usingBlock:v15];

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray sortedArrayUsingComparator:](v10, "sortedArrayUsingComparator:", &stru_100642070));
  if ([v11 count]) {
    int64_t v12 = v11;
  }
  else {
    int64_t v12 = 0LL;
  }
  id v13 = v12;

  return v13;
}

+ (id)_propertyValuesForPassRelevancyDates:(id)a3 passPID:(int64_t)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 effectiveStartDate]);
  id v8 = (void *)_SQLValueForDate(v7);
  [v6 setObjectOrNull:v8 forKey:@"start_date"];

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 effectiveEndDate]);
  id v10 = (void *)_SQLValueForDate(v9);
  [v6 setObjectOrNull:v10 forKey:@"end_date"];

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v5 date]);
  int64_t v12 = (void *)_SQLValueForDate(v11);
  [v6 setObjectOrNull:v12 forKey:@"relevant_date"];

  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  [v6 setObject:v13 forKey:@"pass_pid"];

  id v14 = [v6 copy];
  return v14;
}

@end