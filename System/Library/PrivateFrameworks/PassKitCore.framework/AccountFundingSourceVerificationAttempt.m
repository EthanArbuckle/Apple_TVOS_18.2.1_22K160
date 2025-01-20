@interface AccountFundingSourceVerificationAttempt
+ (BOOL)deleteVerificationAttemptForPID:(id)a3 inDatabase:(id)a4;
+ (id)_predicateForPersistentID:(id)a3;
+ (id)_propertySetters;
+ (id)_propertyValuesForVerificationAttempt:(id)a3;
+ (id)_verificationActionsWithQuery:(id)a3;
+ (id)databaseTable;
+ (id)insertOrUpdateVerificationAttempt:(id)a3 forPID:(id)a4 inDatabase:(id)a5;
+ (id)verificationAttemptForPID:(id)a3 inDatabase:(id)a4;
- (id)_verificationAttempt;
@end

@implementation AccountFundingSourceVerificationAttempt

+ (id)databaseTable
{
  return @"account_funding_source_verification_attempt";
}

+ (id)insertOrUpdateVerificationAttempt:(id)a3 forPID:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v9)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPersistentID:v9]);
    id v12 = (id)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v10 predicate:v11]);
  }

  else
  {
    id v12 = 0LL;
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue([a1 _propertyValuesForVerificationAttempt:v8]);
  if (v12) {
    [v12 setValuesWithDictionary:v13];
  }
  else {
    id v12 = [objc_alloc((Class)a1) initWithPropertyValues:v13 inDatabase:v10];
  }

  return v12;
}

+ (id)verificationAttemptForPID:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPersistentID:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _verificationActionsWithQuery:v8]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 firstObject]);

  return v10;
}

+ (BOOL)deleteVerificationAttemptForPID:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPersistentID:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);

  LOBYTE(v7) = [v8 deleteAllEntities];
  return (char)v7;
}

+ (id)_predicateForPersistentID:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"pid",  a3);
}

- (id)_verificationAttempt
{
  v3 = objc_alloc_init(&OBJC_CLASS___PKAccountFundingSourceVerificationAttempt);
  id v5 = objc_msgSend((id)objc_opt_class(self, v4), "_propertySetters");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000FB8C0;
  v13[3] = &unk_100638EF0;
  v13[4] = self;
  id v14 = v6;
  id v8 = v3;
  v15 = v8;
  id v9 = v6;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v7, v13);

  id v10 = v15;
  v11 = v8;

  return v11;
}

+ (id)_verificationActionsWithQuery:(id)a3
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000FB9E4;
  v7[3] = &unk_100643FD8;
  id v10 = a1;
  id v8 = a3;
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v9 = v3;
  id v4 = v8;
  [v4 enumeratePersistentIDsUsingBlock:v7];
  if (-[NSMutableArray count](v3, "count")) {
    id v5 = -[NSMutableArray copy](v3, "copy");
  }
  else {
    id v5 = 0LL;
  }

  return v5;
}

+ (id)_propertyValuesForVerificationAttempt:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v3 type]));
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v5, @"type");

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 sentDate]);
  v7 = (void *)_SQLValueForDate(v6);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v7, @"sent_date");

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 expiryDate]);
  id v9 = (void *)_SQLValueForDate(v8);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v9, @"expiry_date");

  id v10 = [v3 failureReason];
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v10));
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v11, @"failure_reason");

  return v4;
}

+ (id)_propertySetters
{
  v3[0] = @"type";
  v3[1] = @"sent_date";
  v4[0] = &stru_100644018;
  v4[1] = &stru_100644038;
  v3[2] = @"expiry_date";
  v3[3] = @"failure_reason";
  v4[2] = &stru_100644058;
  v4[3] = &stru_100644078;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  4LL));
}

@end