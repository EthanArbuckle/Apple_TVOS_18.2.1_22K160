@interface AccountEndpointBackOff
+ (id)_predicateForAccountType:(unint64_t)a3 accountPID:(int64_t)a4;
+ (id)_predicateForAccountType:(unint64_t)a3 endpointType:(unint64_t)a4 accountPID:(int64_t)a5;
+ (id)anyInDatabase:(id)a3 forAccountType:(unint64_t)a4 accountPID:(int64_t)a5;
+ (id)anyInDatabase:(id)a3 forAccountType:(unint64_t)a4 endpointType:(unint64_t)a5 accountPID:(int64_t)a6;
+ (id)databaseTable;
+ (id)insertIfNotExistsForAccountType:(unint64_t)a3 endpointType:(unint64_t)a4 accountPID:(int64_t)a5 inDatabase:(id)a6;
+ (void)deleteBackOffForAccountType:(unint64_t)a3 endpointType:(unint64_t)a4 accountPID:(int64_t)a5 inDatabase:(id)a6;
+ (void)deleteEntriesForAccountType:(unint64_t)a3 accountPID:(int64_t)a4 inDatabase:(id)a5;
- (AccountEndpointBackOff)initWithForAccountType:(unint64_t)a3 endpointType:(unint64_t)a4 accountPID:(int64_t)a5 inDatabase:(id)a6;
- (id)nextPossibleFetchDate;
- (unint64_t)accountType;
- (unint64_t)endpointType;
- (void)increaseBackoffLevel;
@end

@implementation AccountEndpointBackOff

+ (id)databaseTable
{
  return @"account_endpoint_backoff";
}

+ (id)insertIfNotExistsForAccountType:(unint64_t)a3 endpointType:(unint64_t)a4 accountPID:(int64_t)a5 inDatabase:(id)a6
{
  id v10 = a6;
  id v11 = (id)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v10 forAccountType:a3 endpointType:a4 accountPID:a5]);
  if (!v11)
  {
    id v11 = [objc_alloc((Class)a1) initWithForAccountType:a3 endpointType:a4 accountPID:a5 inDatabase:v10];
    uint64_t Object = PKLogFacilityTypeGetObject(14LL);
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      if (a3 > 5) {
        v14 = @"broadway";
      }
      else {
        v14 = off_100658758[a3];
      }
      if (a4 > 0xA) {
        v15 = @"account";
      }
      else {
        v15 = off_100658788[a4];
      }
      v16 = (void *)objc_claimAutoreleasedReturnValue([v11 nextPossibleFetchDate]);
      int v18 = 138412802;
      v19 = v14;
      __int16 v20 = 2112;
      v21 = v15;
      __int16 v22 = 2112;
      v23 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Creating new account endpoint backoff for account type %@, endpoint type, %@, next update date %@",  (uint8_t *)&v18,  0x20u);
    }
  }

  return v11;
}

- (AccountEndpointBackOff)initWithForAccountType:(unint64_t)a3 endpointType:(unint64_t)a4 accountPID:(int64_t)a5 inDatabase:(id)a6
{
  id v10 = a6;
  id v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setInteger:forKey:](v11, "setInteger:forKey:", a5, @"account_pid");
  -[NSMutableDictionary setInteger:forKey:](v11, "setInteger:forKey:", a3, @"account_type");
  -[NSMutableDictionary setInteger:forKey:](v11, "setInteger:forKey:", a4, @"endpoint_type");
  -[NSMutableDictionary setInteger:forKey:](v11, "setInteger:forKey:", 0LL, @"backoff_level");
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", 30.0));
  v13 = (void *)_SQLValueForDate(v12);
  -[NSMutableDictionary setObjectOrNull:forKey:](v11, "setObjectOrNull:forKey:", v13, @"next_fetch");

  id v14 = -[NSMutableDictionary copy](v11, "copy");
  v15 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v14, v10);

  return v15;
}

+ (id)anyInDatabase:(id)a3 forAccountType:(unint64_t)a4 endpointType:(unint64_t)a5 accountPID:(int64_t)a6
{
  id v10 = a3;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountType:a4 endpointType:a5 accountPID:a6]);
  v12 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v10 predicate:v11]);

  return v12;
}

+ (id)anyInDatabase:(id)a3 forAccountType:(unint64_t)a4 accountPID:(int64_t)a5
{
  id v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountType:a4 accountPID:a5]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v8 predicate:v9]);

  return v10;
}

+ (void)deleteBackOffForAccountType:(unint64_t)a3 endpointType:(unint64_t)a4 accountPID:(int64_t)a5 inDatabase:(id)a6
{
  id v10 = a6;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountType:a3 endpointType:a4 accountPID:a5]);
  v12 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v10 predicate:v11]);

  uint64_t Object = PKLogFacilityTypeGetObject(14LL);
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    if (a3 > 5) {
      v15 = @"broadway";
    }
    else {
      v15 = off_100658758[a3];
    }
    if (a4 > 0xA) {
      v16 = @"account";
    }
    else {
      v16 = off_100658788[a4];
    }
    int v17 = 138412546;
    int v18 = v15;
    __int16 v19 = 2112;
    __int16 v20 = v16;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Deleting backoff level for account type %@, endpoint type %@",  (uint8_t *)&v17,  0x16u);
  }

  [v12 deleteAllEntities];
}

+ (void)deleteEntriesForAccountType:(unint64_t)a3 accountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountType:a3 accountPID:a4]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v8 predicate:v9]);

  uint64_t Object = PKLogFacilityTypeGetObject(14LL);
  v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    if (a3 > 5) {
      v13 = @"broadway";
    }
    else {
      v13 = off_100658758[a3];
    }
    int v14 = 138412290;
    v15 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Deleting all backoff levels for account type %@",  (uint8_t *)&v14,  0xCu);
  }

  [v10 deleteAllEntities];
}

+ (id)_predicateForAccountType:(unint64_t)a3 endpointType:(unint64_t)a4 accountPID:(int64_t)a5
{
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"account_type",  v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a4, v8));
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"endpoint_type",  v9));
  v16[1] = v10;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a5));
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"account_pid",  v11));
  v16[2] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v16, 3LL));
  int v14 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v13));

  return v14;
}

+ (id)_predicateForAccountType:(unint64_t)a3 accountPID:(int64_t)a4
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"account_type",  v5));
  v12[0] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"account_pid",  v7));
  v12[1] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v12, 2LL));
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v9));

  return v10;
}

- (void)increaseBackoffLevel
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"backoff_level"));
  v4 = (char *)[v3 integerValue];

  v5 = v4 + 1;
  uint64_t v6 = 13LL;
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  dbl_1004D77A8[v6]));
  uint64_t Object = PKLogFacilityTypeGetObject(14LL);
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v10 = -[AccountEndpointBackOff accountType](self, "accountType");
    if (v10 > 5) {
      id v11 = @"broadway";
    }
    else {
      id v11 = off_100658758[v10];
    }
    unint64_t v12 = -[AccountEndpointBackOff endpointType](self, "endpointType");
    if (v12 > 0xA) {
      v13 = @"account";
    }
    else {
      v13 = off_100658788[v12];
    }
    *(_DWORD *)buf = 138412802;
    __int16 v20 = v11;
    __int16 v21 = 2112;
    __int16 v22 = v13;
    __int16 v23 = 2112;
    v24 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Increasing backoff level for account type %@, endpoint type %@, next fetch date %@",  buf,  0x20u);
  }

  int v14 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10037CA3C;
  void v16[3] = &unk_100647810;
  id v17 = v7;
  int v18 = v5;
  v16[4] = self;
  id v15 = v7;
  sub_1002CCC5C((uint64_t)v14, v16);
}

- (id)nextPossibleFetchDate
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"next_fetch"));
  v3 = (void *)_DateForSQLValue(v2);

  return v3;
}

- (unint64_t)accountType
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"account_type"));
  id v3 = [v2 integerValue];

  return (unint64_t)v3;
}

- (unint64_t)endpointType
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"endpoint_type"));
  id v3 = [v2 integerValue];

  return (unint64_t)v3;
}

@end