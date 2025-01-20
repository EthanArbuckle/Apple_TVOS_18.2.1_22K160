@interface ChangeHistoryEvent
+ (id)databaseTable;
+ (id)eventsMatchingPredicate:(id)a3 inDatabase:(id)a4;
+ (id)eventsWithRecordType:(int64_t)a3 inDatabase:(id)a4;
+ (id)eventsWithRecordType:(int64_t)a3 recodUniqueID:(id)a4 inDatabase:(id)a5;
+ (id)predicateForAllChangeEvents;
+ (id)predicateForChangeEventRecord:(int64_t)a3;
+ (id)predicateForChangeEventRecordType:(int64_t)a3 recordUniqueID:(id)a4;
+ (id)predicateForChangeEventRecordUniqueIDs:(id)a3;
+ (id)predicateForChangeEventType:(int64_t)a3;
+ (id)predicateForChangeEventWithIdentifier:(id)a3;
+ (id)predicateForChangeEventsOlderThan:(int64_t)a3;
+ (id)propertySettersForChangeHistoryEvent;
+ (id)propertyValuesFromEvent:(id)a3;
+ (unint64_t)numberOfChangeEventsInDatabase:(id)a3;
+ (void)deleteAllEventsInDatabase:(id)a3;
+ (void)deleteEvents:(id)a3 inDatabase:(id)a4;
+ (void)deleteEventsMatchingPredicate:(id)a3 inDatabase:(id)a4;
+ (void)deleteEventsOlderThan:(unint64_t)a3 inDatabase:(id)a4;
+ (void)insertEvents:(id)a3 inDatabase:(id)a4;
- (BOOL)deleteFromDatabase;
- (ChangeHistoryEvent)initWithEvent:(id)a3 inDatabase:(id)a4;
- (id)recordUniqueID;
- (int64_t)recordType;
@end

@implementation ChangeHistoryEvent

+ (id)databaseTable
{
  return @"change_history_event";
}

- (ChangeHistoryEvent)initWithEvent:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[ChangeHistoryEvent propertyValuesFromEvent:]( &OBJC_CLASS___ChangeHistoryEvent,  "propertyValuesFromEvent:",  a3));
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___ChangeHistoryEvent;
  v8 = -[SQLiteEntity initWithPropertyValues:inDatabase:](&v10, "initWithPropertyValues:inDatabase:", v7, v6);

  return v8;
}

+ (void)insertEvents:(id)a3 inDatabase:(id)a4
{
  id v6 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1003948C0;
  v9[3] = &unk_100647810;
  id v11 = a4;
  id v12 = a1;
  id v10 = v6;
  id v7 = v11;
  id v8 = v6;
  sub_1002CCC5C((uint64_t)v7, v9);
}

+ (unint64_t)numberOfChangeEventsInDatabase:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([a1 predicateForAllChangeEvents]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v4 predicate:v5]);

  id v7 = [v6 countOfEntities];
  return (unint64_t)v7;
}

+ (id)eventsWithRecordType:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 predicateForChangeEventRecord:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 eventsMatchingPredicate:v7 inDatabase:v6]);

  return v8;
}

+ (id)eventsMatchingPredicate:(id)a3 inDatabase:(id)a4
{
  v5 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:a4 predicate:a3]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a1 propertySettersForChangeHistoryEvent]);
  id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100394BBC;
  v13[3] = &unk_100639BF0;
  v15 = v7;
  id v16 = a1;
  id v14 = v6;
  v9 = v7;
  id v10 = v6;
  [v5 enumeratePersistentIDsAndProperties:v8 usingBlock:v13];

  id v11 = -[NSMutableArray copy](v9, "copy");
  return v11;
}

- (BOOL)deleteFromDatabase
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ChangeHistoryEvent recordUniqueID](self, "recordUniqueID"));
  int64_t v4 = -[ChangeHistoryEvent recordType](self, "recordType");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  +[ChangeHistoryEventRetryDetails deleteRetryDetailsForEventUniqueIdentifier:recordType:inDatabase:]( &OBJC_CLASS___ChangeHistoryEventRetryDetails,  "deleteRetryDetailsForEventUniqueIdentifier:recordType:inDatabase:",  v3,  v4,  v5);

  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___ChangeHistoryEvent;
  return -[SQLiteEntity deleteFromDatabase](&v7, "deleteFromDatabase");
}

+ (void)deleteEvents:(id)a3 inDatabase:(id)a4
{
  id v6 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100394D88;
  v9[3] = &unk_100647810;
  id v11 = a4;
  id v12 = a1;
  id v10 = v6;
  id v7 = v11;
  id v8 = v6;
  sub_1002CCC5C((uint64_t)v7, v9);
}

+ (void)deleteAllEventsInDatabase:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue([a1 predicateForAllChangeEvents]);
  [a1 deleteEventsMatchingPredicate:v5 inDatabase:v4];
}

+ (void)deleteEventsOlderThan:(unint64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = (id)objc_claimAutoreleasedReturnValue([a1 predicateForChangeEventsOlderThan:a3]);
  [a1 deleteEventsMatchingPredicate:v7 inDatabase:v6];
}

+ (void)deleteEventsMatchingPredicate:(id)a3 inDatabase:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100395038;
  v8[3] = &unk_100647810;
  id v10 = a3;
  id v11 = a1;
  id v9 = a4;
  id v6 = v10;
  id v7 = v9;
  sub_1002CCC5C((uint64_t)v7, v8);
}

+ (id)eventsWithRecordType:(int64_t)a3 recodUniqueID:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 predicateForChangeEventRecordType:a3 recordUniqueID:a4]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 eventsMatchingPredicate:v9 inDatabase:v8]);

  return v10;
}

+ (id)predicateForChangeEventRecordType:(int64_t)a3 recordUniqueID:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 predicateForChangeEventRecord:a3]);
  id v13 = v6;
  v14[0] = v7;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v13, 1LL));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 predicateForChangeEventRecordUniqueIDs:v8]);
  v14[1] = v9;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v14, 2LL));
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v10));

  return v11;
}

+ (id)predicateForChangeEventType:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"type",  v3));

  return v4;
}

+ (id)predicateForChangeEventRecordUniqueIDs:(id)a3
{
  return +[SQLiteCompoundPredicate predicateWithProperty:equalToValues:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateWithProperty:equalToValues:",  @"record_uniqueID",  a3);
}

+ (id)predicateForChangeEventRecord:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"record_type",  v3));

  return v4;
}

+ (id)predicateForChangeEventWithIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"identifier",  a3);
}

+ (id)predicateForAllChangeEvents
{
  return +[SQLiteBooleanPredicate truePredicate](&OBJC_CLASS___SQLiteBooleanPredicate, "truePredicate");
}

+ (id)predicateForChangeEventsOlderThan:(int64_t)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 dateByAddingTimeInterval:(double)a3 * -86400.0]);
  id v6 = (void *)_SQLValueForDate(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:lessThanValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:lessThanValue:",  @"timestamp",  v6));

  return v7;
}

- (id)recordUniqueID
{
  return -[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"record_uniqueID");
}

- (int64_t)recordType
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"record_type"));
  id v3 = [v2 integerValue];

  return (int64_t)v3;
}

+ (id)propertySettersForChangeHistoryEvent
{
  v3[0] = @"identifier";
  v3[1] = @"type";
  v4[0] = &stru_100659970;
  v4[1] = &stru_100659990;
  v3[2] = @"record_type";
  v3[3] = @"record_uniqueID";
  v4[2] = &stru_1006599B0;
  v4[3] = &stru_1006599D0;
  v3[4] = @"timestamp";
  v4[4] = &stru_1006599F0;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  5LL));
}

+ (id)propertyValuesFromEvent:(id)a3
{
  v12[0] = @"identifier";
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
  v13[0] = v4;
  v12[1] = @"type";
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v3 type]));
  v13[1] = v5;
  v12[2] = @"record_type";
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v3 recordType]));
  v13[2] = v6;
  v12[3] = @"record_uniqueID";
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 recordUniqueID]);
  v13[3] = v7;
  v12[4] = @"timestamp";
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 timestamp]);

  id v9 = (void *)_SQLValueForDate(v8);
  void v13[4] = v9;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v13,  v12,  5LL));

  return v10;
}

@end