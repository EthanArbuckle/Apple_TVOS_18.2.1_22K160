@interface AccountHistoricalBalance
+ (id)_predicateForAccountPID:(int64_t)a3;
+ (id)_predicateForEndDate:(id)a3;
+ (id)_predicateForStartDate:(id)a3;
+ (id)_predicateForType:(unint64_t)a3;
+ (id)_propertySettersForBalance;
+ (id)balancesForAccountPID:(int64_t)a3 startDate:(id)a4 endDate:(id)a5 type:(unint64_t)a6 limit:(unint64_t)a7 inDatabase:(id)a8;
+ (id)databaseTable;
+ (id)insertBalance:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5;
+ (void)deleteBalancesForAccountPID:(int64_t)a3 inDatabase:(id)a4;
- (AccountHistoricalBalance)initWithBalance:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5;
@end

@implementation AccountHistoricalBalance

+ (id)databaseTable
{
  return @"account_historical_balance";
}

- (AccountHistoricalBalance)initWithBalance:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  [v10 setObjectOrNull:v11 forKey:@"account_pid"];

  v12 = (void *)objc_claimAutoreleasedReturnValue([v9 balance]);
  uint64_t v13 = PKCurrencyDecimalToStorageNumber(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  [v10 setObjectOrNull:v14 forKey:@"balance"];

  v15 = (void *)objc_claimAutoreleasedReturnValue([v9 date]);
  v16 = (void *)_SQLValueForDate(v15);
  [v10 setObjectOrNull:v16 forKey:@"date"];

  id v17 = [v9 type];
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v17));
  [v10 setObjectOrNull:v18 forKey:@"type"];

  v19 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v10, v8);
  return v19;
}

+ (id)insertBalance:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [objc_alloc((Class)a1) initWithBalance:v9 forAccountPID:a4 inDatabase:v8];

  return v10;
}

+ (void)deleteBalancesForAccountPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountPID:a3]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

+ (id)balancesForAccountPID:(int64_t)a3 startDate:(id)a4 endDate:(id)a5 type:(unint64_t)a6 limit:(unint64_t)a7 inDatabase:(id)a8
{
  v43 = @"date";
  id v14 = a8;
  id v15 = a5;
  id v16 = a4;
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v43, 1LL));
  if (a7)
  {
    if (v16 && v15)
    {
      v42 = @"ASC";
      id v17 = &v42;
    }

    else
    {
      v41 = @"DESC";
      id v17 = &v41;
    }
  }

  else
  {
    v40 = @"ASC";
    id v17 = &v40;
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v17, 1LL, a7));
  v19 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountPID:a3]);
  v39[0] = v19;
  v20 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForStartDate:v16]);

  v39[1] = v20;
  v21 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForEndDate:v15]);

  v39[2] = v21;
  v22 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForType:a6]);
  v39[3] = v22;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v39, 4LL));
  v24 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v23));
  v25 = (void *)objc_claimAutoreleasedReturnValue( [a1 queryWithDatabase:v14 predicate:v24 orderingProperties:v34 orderingDirections:v18 limit:v33]);

  v26 = (void *)objc_claimAutoreleasedReturnValue([a1 _propertySettersForBalance]);
  v27 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v28 = (void *)objc_claimAutoreleasedReturnValue([v26 allKeys]);
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472LL;
  v35[2] = sub_1003D5850;
  v35[3] = &unk_100639BF0;
  id v38 = a1;
  id v36 = v26;
  v29 = v27;
  v37 = v29;
  id v30 = v26;
  [v25 enumeratePersistentIDsAndProperties:v28 usingBlock:v35];

  if (-[NSMutableArray count](v29, "count")) {
    id v31 = -[NSMutableArray copy](v29, "copy");
  }
  else {
    id v31 = 0LL;
  }

  return v31;
}

+ (id)_predicateForAccountPID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"account_pid",  v3));

  return v4;
}

+ (id)_predicateForType:(unint64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"type",  v3));

  return v4;
}

+ (id)_predicateForStartDate:(id)a3
{
  if (a3)
  {
    v3 = (void *)_SQLValueForDate(a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:greaterThanOrEqualToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:greaterThanOrEqualToValue:",  @"date",  v3));
  }

  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[SQLiteBooleanPredicate truePredicate](&OBJC_CLASS___SQLiteBooleanPredicate, "truePredicate"));
  }

  return v4;
}

+ (id)_predicateForEndDate:(id)a3
{
  if (a3)
  {
    v3 = (void *)_SQLValueForDate(a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:lessThanOrEqualToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:lessThanOrEqualToValue:",  @"date",  v3));
  }

  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[SQLiteBooleanPredicate truePredicate](&OBJC_CLASS___SQLiteBooleanPredicate, "truePredicate"));
  }

  return v4;
}

+ (id)_propertySettersForBalance
{
  v3[0] = @"balance";
  v3[1] = @"date";
  v4[0] = &stru_10065C300;
  v4[1] = &stru_10065C320;
  v3[2] = @"type";
  v4[2] = &stru_10065C340;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  3LL));
}

@end