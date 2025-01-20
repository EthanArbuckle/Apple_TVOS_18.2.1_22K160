@interface ChangeHistoryEventRetryDetails
+ (id)_predicateForEvent:(id)a3;
+ (id)_predicateForRecordUniqueID:(id)a3 recordType:(int64_t)a4;
+ (id)databaseTable;
+ (id)retryDateForEvent:(id)a3 inDatabase:(id)a4;
+ (void)deleteRetryDetailsForEventUniqueIdentifier:(id)a3 recordType:(int64_t)a4 inDatabase:(id)a5;
+ (void)increaseRetryIntervalForRecordUniqueIdenifier:(id)a3 recordType:(int64_t)a4 inDatabase:(id)a5;
- (ChangeHistoryEventRetryDetails)initWithRecordUniqueIdenifier:(id)a3 recordType:(int64_t)a4 inDatabase:(id)a5;
- (id)retryDate;
- (int64_t)retryInterval;
- (void)increaseRetryInterval;
@end

@implementation ChangeHistoryEventRetryDetails

+ (id)databaseTable
{
  return @"change_history_event_retry_details";
}

- (ChangeHistoryEventRetryDetails)initWithRecordUniqueIdenifier:(id)a3 recordType:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObjectOrNull:forKey:](v10, "setObjectOrNull:forKey:", v9, @"event_unique_identifier");

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a4));
  -[NSMutableDictionary setObjectOrNull:forKey:](v10, "setObjectOrNull:forKey:", v11, @"event_record_type");

  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___ChangeHistoryEventRetryDetails;
  v12 = -[SQLiteEntity initWithPropertyValues:inDatabase:](&v14, "initWithPropertyValues:inDatabase:", v10, v8);

  return v12;
}

- (void)increaseRetryInterval
{
  int64_t v3 = -[ChangeHistoryEventRetryDetails retryInterval](self, "retryInterval");
  else {
    uint64_t v4 = 9LL;
  }
  id v8 = (id)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  dbl_1004D66E0[v4]));
  v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v6 = (void *)_SQLValueForDate(v8);
  -[NSMutableDictionary setObjectOrNull:forKey:](v5, "setObjectOrNull:forKey:", v6, @"retry_date");

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v4));
  -[NSMutableDictionary setObjectOrNull:forKey:](v5, "setObjectOrNull:forKey:", v7, @"retry_interval");

  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v5);
}

+ (void)increaseRetryIntervalForRecordUniqueIdenifier:(id)a3 recordType:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForRecordUniqueID:v8 recordType:a4]);
  v11 = (ChangeHistoryEventRetryDetails *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v9 predicate:v10]);

  if (!v11) {
    v11 = -[ChangeHistoryEventRetryDetails initWithRecordUniqueIdenifier:recordType:inDatabase:]( objc_alloc(&OBJC_CLASS___ChangeHistoryEventRetryDetails),  "initWithRecordUniqueIdenifier:recordType:inDatabase:",  v8,  a4,  v9);
  }
  -[ChangeHistoryEventRetryDetails increaseRetryInterval](v11, "increaseRetryInterval");
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ChangeHistoryEventRetryDetails retryDate](v11, "retryDate"));
  int64_t v13 = -[ChangeHistoryEventRetryDetails retryInterval](v11, "retryInterval");
  uint64_t Object = PKLogFacilityTypeGetObject(9LL);
  v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138543874;
    id v17 = v8;
    __int16 v18 = 2114;
    v19 = v12;
    __int16 v20 = 2050;
    int64_t v21 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Updating ChangeHistoryEventRetryDetails for recordUniqueID %{public}@ with retryDate %{public}@ and retryInterval %{public}ld",  (uint8_t *)&v16,  0x20u);
  }
}

+ (id)retryDateForEvent:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForEvent:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 retryDate]);
  return v9;
}

+ (void)deleteRetryDetailsForEventUniqueIdentifier:(id)a3 recordType:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForRecordUniqueID:v8 recordType:a4]);
  v11 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v9 predicate:v10]);

  if (v11)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(9LL);
    int64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138543618;
      id v15 = v8;
      __int16 v16 = 2050;
      int64_t v17 = a4;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Deleting ChangeHistoryEventRetryDetails for recordUniqueID %{public}@ and recordType %{public}ld",  (uint8_t *)&v14,  0x16u);
    }

    [v11 deleteFromDatabase];
  }
}

+ (id)_predicateForEvent:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 recordUniqueID]);
  id v6 = [v4 recordType];

  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForRecordUniqueID:v5 recordType:v6]);
  return v7;
}

+ (id)_predicateForRecordUniqueID:(id)a3 recordType:(int64_t)a4
{
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"event_unique_identifier",  a3));
  v11[0] = v5;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a4));
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"event_record_type",  v6));
  v11[1] = v7;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v11, 2LL));
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v8));

  return v9;
}

- (int64_t)retryInterval
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"retry_interval"));
  id v3 = [v2 integerValue];

  return (int64_t)v3;
}

- (id)retryDate
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"retry_date"));
  id v3 = (void *)_DateForSQLValue(v2);

  return v3;
}

@end