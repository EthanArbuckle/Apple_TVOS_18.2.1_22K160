@interface CloudStoreContainerChangeEvent
+ (id)_commonDictionaryForEvent:(id)a3;
+ (id)_eventsForQuery:(id)a3;
+ (id)_predicateForContainerIdentifier:(id)a3;
+ (id)_predicateForIdentifier:(id)a3;
+ (id)_predicateForPID:(int64_t)a3;
+ (id)_predicateForTimestamp:(id)a3;
+ (id)_propertySettersForCloudStoreContainerChangeEvent;
+ (id)changeEventForPID:(int64_t)a3 inDatabase:(id)a4;
+ (id)changeEventWithIdentifier:(id)a3 inDatabase:(id)a4;
+ (id)changeEventsForContainerIdentifier:(id)a3 inDatabase:(id)a4;
+ (id)databaseTable;
+ (id)insertContainerChangeEvent:(id)a3 inDatabase:(id)a4;
+ (int64_t)changeEventPIDForIdentifier:(id)a3 inDatabase:(id)a4;
+ (void)deleteAllEntriesInDatabase:(id)a3;
+ (void)purgeOldEntriesIfNecessaryInDatabase:(id)a3;
- (id)beginIntervalEventIdentifier;
- (id)errorDescription;
- (id)event;
- (id)identifier;
- (id)timestamp;
- (unint64_t)changeType;
- (unint64_t)eventType;
@end

@implementation CloudStoreContainerChangeEvent

+ (id)databaseTable
{
  return @"cloud_store_container_change_event";
}

+ (id)insertContainerChangeEvent:(id)a3 inDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t Object = PKLogFacilityTypeGetObject(9LL);
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412290;
    id v16 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "PKCloudStoreContainerChangeEvent: Inserting change event %@",  (uint8_t *)&v15,  0xCu);
  }

  id v11 = objc_msgSend((id)objc_opt_class(a1, v10), "_commonDictionaryForEvent:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = -[SQLiteEntity initWithPropertyValues:inDatabase:]( objc_alloc(&OBJC_CLASS___CloudStoreContainerChangeEvent),  "initWithPropertyValues:inDatabase:",  v12,  v7);

  return v13;
}

+ (id)changeEventsForContainerIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForContainerIdentifier:a3]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);

  v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _eventsForQuery:v8]);
  return v9;
}

+ (id)changeEventWithIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForIdentifier:a3]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 event]);
  return v9;
}

+ (id)changeEventForPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPID:a3]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 event]);
  return v9;
}

+ (int64_t)changeEventPIDForIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForIdentifier:a3]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  id v9 = [v8 persistentID];
  return (int64_t)v9;
}

+ (id)_eventsForQuery:(id)a3
{
  id v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472LL;
  id v9 = sub_10003E43C;
  uint64_t v10 = &unk_10063BCB0;
  id v11 = a3;
  v12 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v3 = v12;
  id v4 = v11;
  [v4 enumeratePersistentIDsUsingBlock:&v7];
  id v5 = -[NSMutableArray copy](v3, "copy", v7, v8, v9, v10);

  return v5;
}

+ (id)_predicateForContainerIdentifier:(id)a3
{
  id v3 = a3;
  if ([v3 length]) {
    uint64_t v4 = objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"container_identifier",  v3));
  }
  else {
    uint64_t v4 = objc_claimAutoreleasedReturnValue(+[SQLiteBooleanPredicate truePredicate](&OBJC_CLASS___SQLiteBooleanPredicate, "truePredicate"));
  }
  id v5 = (void *)v4;

  return v5;
}

+ (id)_predicateForIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"identifier",  a3);
}

+ (id)_predicateForPID:(int64_t)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"pid",  v3));

  return v4;
}

+ (id)_predicateForTimestamp:(id)a3
{
  id v3 = (void *)_SQLValueForDate(a3);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:lessThanValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:lessThanValue:",  @"timestamp",  v3));

  return v4;
}

+ (void)deleteAllEntriesInDatabase:(id)a3
{
  id v4 = a3;
  uint64_t Object = PKLogFacilityTypeGetObject(9LL);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "PKCloudStoreContainerChangeEvent: Deleteing container change events from local database.",  v9,  2u);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[SQLiteBooleanPredicate truePredicate](&OBJC_CLASS___SQLiteBooleanPredicate, "truePredicate"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v4 predicate:v7]);
  [v8 deleteAllEntities];
}

+ (void)purgeOldEntriesIfNecessaryInDatabase:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 dateByAddingTimeInterval:-1728000.0]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForTimestamp:v6]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v4 predicate:v7]);

  uint64_t v9 = (uint64_t)[v8 countOfEntities];
  if (v9 >= 1)
  {
    uint64_t v10 = v9;
    uint64_t Object = PKLogFacilityTypeGetObject(9LL);
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 134218242;
      uint64_t v14 = v10;
      __int16 v15 = 2112;
      id v16 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "PKCloudStoreContainerChangeEvent deleting %ld entries older than %@",  (uint8_t *)&v13,  0x16u);
    }

    [v8 deleteAllEntities];
  }
}

- (id)event
{
  id v3 = objc_alloc_init(&OBJC_CLASS___PKCloudStoreContainerChangeEvent);
  id v5 = objc_msgSend((id)objc_opt_class(self, v4), "_propertySettersForCloudStoreContainerChangeEvent");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10003E94C;
  v17[3] = &unk_100638EF0;
  v17[4] = self;
  id v8 = v6;
  id v18 = v8;
  uint64_t v9 = v3;
  v19 = v9;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v7, v17);

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[CloudStoreContainerChangeEvent beginIntervalEventIdentifier](self, "beginIntervalEventIdentifier"));
  if ([v10 length])
  {
    v12 = (void *)objc_opt_class(self, v11);
    int v13 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v12 changeEventWithIdentifier:v10 inDatabase:v13]);

    if (v14) {
      +[PKCloudStoreContainerChangeEvent populateEndIntervalEvent:withBeginIntervalEvent:]( &OBJC_CLASS___PKCloudStoreContainerChangeEvent,  "populateEndIntervalEvent:withBeginIntervalEvent:",  v9,  v14);
    }
  }

  __int16 v15 = v9;

  return v15;
}

- (id)identifier
{
  return -[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"identifier");
}

- (id)beginIntervalEventIdentifier
{
  return -[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"begin_interval_event_identifier");
}

- (id)timestamp
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"timestamp"));
  id v3 = (void *)_DateForSQLValue(v2);

  return v3;
}

- (id)errorDescription
{
  return -[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"error_description");
}

- (unint64_t)eventType
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"event_type"));
  id v3 = [v2 integerValue];

  return (unint64_t)v3;
}

- (unint64_t)changeType
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"change_type"));
  id v3 = [v2 integerValue];

  return (unint64_t)v3;
}

+ (id)_commonDictionaryForEvent:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v5, @"identifier");

  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v3 changeType]));
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v6, @"change_type");

  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v3 eventType]));
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v7, @"event_type");

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 timestamp]);
  uint64_t v9 = (void *)_SQLValueForDate(v8);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v9, @"timestamp");

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v3 containerIdentifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v10, @"container_identifier");

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v3 beginIntervalEventIdentifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:]( v4,  "setObjectOrNull:forKey:",  v11,  @"begin_interval_event_identifier");

  v12 = (void *)objc_claimAutoreleasedReturnValue([v3 operationGroupName]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v12, @"operation_group_name");

  int v13 = (void *)objc_claimAutoreleasedReturnValue([v3 operationGroupNameSuffix]);
  -[NSMutableDictionary setObjectOrNull:forKey:]( v4,  "setObjectOrNull:forKey:",  v13,  @"operation_group_name_suffix");

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v3 errorDescription]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v14, @"error_description");

  __int16 v15 = (void *)objc_claimAutoreleasedReturnValue([v3 changeToken]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v15, @"change_token");

  id v16 = (void *)objc_claimAutoreleasedReturnValue([v3 stateName]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v16, @"state_name");

  v17 = (void *)objc_claimAutoreleasedReturnValue([v3 objectNames]);
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 componentsJoinedByString:@","]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v18, @"object_names");

  [v3 timeInterval];
  double v20 = v19;

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v20));
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v21, @"time_interval");

  id v22 = -[NSMutableDictionary copy](v4, "copy");
  return v22;
}

+ (id)_propertySettersForCloudStoreContainerChangeEvent
{
  v3[0] = @"identifier";
  v3[1] = @"event_type";
  v4[0] = &stru_10063BCF0;
  v4[1] = &stru_10063BD10;
  v3[2] = @"change_type";
  v3[3] = @"timestamp";
  v4[2] = &stru_10063BD30;
  v4[3] = &stru_10063BD50;
  v3[4] = @"container_identifier";
  v3[5] = @"begin_interval_event_identifier";
  v4[4] = &stru_10063BD70;
  v4[5] = &stru_10063BD90;
  v3[6] = @"operation_group_name";
  v3[7] = @"operation_group_name_suffix";
  v4[6] = &stru_10063BDB0;
  v4[7] = &stru_10063BDD0;
  v3[8] = @"error_description";
  v3[9] = @"state_name";
  v4[8] = &stru_10063BDF0;
  v4[9] = &stru_10063BE10;
  v3[10] = @"object_names";
  v3[11] = @"change_token";
  v4[10] = &stru_10063BE30;
  v4[11] = &stru_10063BE50;
  v3[12] = @"time_interval";
  v4[12] = &stru_10063BE70;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  13LL));
}

@end