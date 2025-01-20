@interface BarcodeFetch
+ (BOOL)removeBarcodeFetchForPassPID:(int64_t)a3 inDatabase:(id)a4;
+ (BOOL)updateNextBackgroundFetchDate:(id)a3 withBackgroundFetchRetryLevel:(int64_t)a4 forPassPID:(int64_t)a5 inDatabase:(id)a6;
+ (id)_barcodeFetchesForQuery:(id)a3;
+ (id)_predicateForFutureNextBackgroundFetchDates;
+ (id)_predicateForNextBackgroundFetchDatesBeforeDate:(id)a3;
+ (id)_predicateForNotNullNextBackgroundFetchDates;
+ (id)_predicateForPassPID:(int64_t)a3;
+ (id)anyInDatabase:(id)a3 withPassPID:(int64_t)a4;
+ (id)createIfNotExistInDatabase:(id)a3 withPassPID:(int64_t)a4;
+ (id)databaseTable;
+ (id)nextBackgroundFetchDateInDatabase:(id)a3;
+ (id)passPIDsWithNextbackgroundFetchDateBeforeDate:(id)a3 inDatabase:(id)a4;
+ (int64_t)backgroundFetchRetryLevelForPassPID:(int64_t)a3 inDatabase:(id)a4;
- (id)nextBackgroundFetchDate;
@end

@implementation BarcodeFetch

+ (id)databaseTable
{
  return @"barcode_fetch";
}

+ (id)anyInDatabase:(id)a3 withPassPID:(int64_t)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPassPID:a4]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  return v8;
}

+ (id)createIfNotExistInDatabase:(id)a3 withPassPID:(int64_t)a4
{
  id v6 = a3;
  v7 = (BarcodeFetch *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 withPassPID:a4]);
  if (!v7)
  {
    v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[NSMutableDictionary setLongLong:forKey:](v8, "setLongLong:forKey:", a4, @"pass_pid");
    v9 = objc_alloc(&OBJC_CLASS___BarcodeFetch);
    id v10 = -[NSMutableDictionary copy](v8, "copy");
    v7 = -[SQLiteEntity initWithPropertyValues:inDatabase:](v9, "initWithPropertyValues:inDatabase:", v10, v6);
  }

  return v7;
}

+ (int64_t)backgroundFetchRetryLevelForPassPID:(int64_t)a3 inDatabase:(id)a4
{
  v4 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:a4 withPassPID:a3]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 valueForProperty:@"background_fetch_retry_level"]);
  id v6 = [v5 integerValue];

  return (int64_t)v6;
}

+ (BOOL)updateNextBackgroundFetchDate:(id)a3 withBackgroundFetchRetryLevel:(int64_t)a4 forPassPID:(int64_t)a5 inDatabase:(id)a6
{
  id v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue([a1 createIfNotExistInDatabase:a6 withPassPID:a5]);
  v12 = (void *)_SQLValueForDate(v10);

  if ([v11 setValue:v12 forProperty:@"next_background_fetch_date"])
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a4));
    unsigned __int8 v14 = [v11 setValue:v13 forProperty:@"background_fetch_retry_level"];
  }

  else
  {
    unsigned __int8 v14 = 0;
  }

  return v14;
}

+ (id)nextBackgroundFetchDateInDatabase:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForNotNullNextBackgroundFetchDates]);
  v26[0] = v5;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForFutureNextBackgroundFetchDates]);
  v26[1] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v26, 2LL));
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v7));

  v25 = @"next_background_fetch_date";
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v25, 1LL));
  v24 = @"ASC";
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v24, 1LL));
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryWithDatabase:predicate:orderingProperties:orderingDirections:limit:]( &OBJC_CLASS___BarcodeFetch,  "queryWithDatabase:predicate:orderingProperties:orderingDirections:limit:",  v4,  v8,  v9,  v10,  1LL));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[BarcodeFetch _barcodeFetchesForQuery:](&OBJC_CLASS___BarcodeFetch, "_barcodeFetchesForQuery:", v11));
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 firstObject]);
  unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 valueForProperty:@"next_background_fetch_date"]);
  v15 = (void *)_DateForSQLValue(v14);

  if (!v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForNotNullNextBackgroundFetchDates]);
    v23[0] = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    v18 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForNextBackgroundFetchDatesBeforeDate:v17]);
    v23[1] = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v23, 2LL));
    v20 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v19));

    v21 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryWithDatabase:predicate:]( &OBJC_CLASS___BarcodeFetch,  "queryWithDatabase:predicate:",  v4,  v20));
    else {
      v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  600.0));
    }

    v11 = v21;
  }

  return v15;
}

+ (id)passPIDsWithNextbackgroundFetchDateBeforeDate:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForNotNullNextBackgroundFetchDates]);
  v20[0] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForNextBackgroundFetchDatesBeforeDate:v7]);

  v20[1] = v9;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v20, 2LL));
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v10));

  v19 = @"next_background_fetch_date";
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v19, 1LL));
  v18 = @"ASC";
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v18, 1LL));
  unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryWithDatabase:predicate:orderingProperties:orderingDirections:]( &OBJC_CLASS___BarcodeFetch,  "queryWithDatabase:predicate:orderingProperties:orderingDirections:",  v6,  v11,  v12,  v13));

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[BarcodeFetch _barcodeFetchesForQuery:](&OBJC_CLASS___BarcodeFetch, "_barcodeFetchesForQuery:", v14));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "pk_arrayByApplyingBlock:", &stru_100654768));

  return v16;
}

+ (BOOL)removeBarcodeFetchForPassPID:(int64_t)a3 inDatabase:(id)a4
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[BarcodeFetch anyInDatabase:withPassPID:]( &OBJC_CLASS___BarcodeFetch,  "anyInDatabase:withPassPID:",  a4,  a3));
  unsigned __int8 v5 = [v4 deleteFromDatabase];

  return v5;
}

+ (id)_predicateForPassPID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"pass_pid",  v3));

  return v4;
}

+ (id)_predicateForNotNullNextBackgroundFetchDates
{
  return +[SQLiteNullPredicate isNotNullPredicateWithProperty:]( &OBJC_CLASS___SQLiteNullPredicate,  "isNotNullPredicateWithProperty:",  @"next_background_fetch_date");
}

+ (id)_predicateForFutureNextBackgroundFetchDates
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  v3 = (void *)_SQLValueForDate(v2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:greaterThanOrEqualToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:greaterThanOrEqualToValue:",  @"next_background_fetch_date",  v3));

  return v4;
}

+ (id)_predicateForNextBackgroundFetchDatesBeforeDate:(id)a3
{
  v3 = (void *)_SQLValueForDate(a3);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:lessThanValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:lessThanValue:",  @"next_background_fetch_date",  v3));

  return v4;
}

+ (id)_barcodeFetchesForQuery:(id)a3
{
  id v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472LL;
  v9 = sub_1002E7598;
  id v10 = &unk_10063BCB0;
  id v11 = a3;
  v12 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v3 = v12;
  id v4 = v11;
  [v4 enumeratePersistentIDsUsingBlock:&v7];
  id v5 = -[NSMutableArray copy](v3, "copy", v7, v8, v9, v10);

  return v5;
}

- (id)nextBackgroundFetchDate
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"next_background_fetch_date"));
  v3 = (void *)_DateForSQLValue(v2);

  return v3;
}

@end