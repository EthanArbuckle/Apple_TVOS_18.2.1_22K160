@interface DiscoveryNotification
+ (id)_predicateForNotificationIdentifier:(id)a3;
+ (id)_predicateForNotificationsThatAreActive:(unint64_t)a3;
+ (id)_predicateForNotificationsThatAreDelivered:(unint64_t)a3;
+ (id)_predicateForNotificationsThatAreNotExpiredForDate:(id)a3;
+ (id)_predicateForNotificationsThatAreScheduled:(unint64_t)a3;
+ (id)_predicateForNotificationsWithRelevantDate:(id)a3;
+ (id)_predicateForNotificationsWithScheduledDeliveryDateBeforeDate:(id)a3;
+ (id)_propertySettersForNotification;
+ (id)databaseTable;
+ (id)insertOrUpdateNotification:(id)a3 inDatabase:(id)a4;
+ (id)nextRelevantNotificationForDate:(id)a3 inDatabase:(id)a4;
+ (id)notificationWithIdentifier:(id)a3 inDatabase:(id)a4;
+ (id)notificationsInDatabase:(id)a3;
+ (id)notificationsRequiringInsertionForDate:(id)a3 inDatabase:(id)a4;
+ (id)notificationsThatAreNotExpiredForDate:(id)a3 active:(unint64_t)a4 delivered:(unint64_t)a5 inDatabase:(id)a6;
+ (id)notificationsToScheduleForDate:(id)a3 inDatabase:(id)a4;
+ (void)deleteAllNotificationInDatabase:(id)a3;
+ (void)deleteNotificationWithIdentifier:(id)a3 inDatabase:(id)a4;
+ (void)deleteNotificationsNotIncludingIdentifiers:(id)a3 inDatabase:(id)a4;
- (DiscoveryNotification)initWithNotification:(id)a3 inDatabase:(id)a4;
- (id)notification;
- (void)updateWithNotification:(id)a3;
@end

@implementation DiscoveryNotification

+ (id)databaseTable
{
  return @"discovery_notification";
}

+ (id)notificationWithIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForNotificationIdentifier:a3]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  return v8;
}

+ (id)insertOrUpdateNotification:(id)a3 inDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
  id v9 = (id)objc_claimAutoreleasedReturnValue([a1 notificationWithIdentifier:v8 inDatabase:v7]);

  if (v9) {
    [v9 updateWithNotification:v6];
  }
  else {
    id v9 = [objc_alloc((Class)a1) initWithNotification:v6 inDatabase:v7];
  }

  return v9;
}

- (DiscoveryNotification)initWithNotification:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v8, "setObjectOrNull:forKey:", v9, @"identifier");

  -[NSMutableDictionary setInteger:forKey:](v8, "setInteger:forKey:", [v7 version], @"version");
  -[NSMutableDictionary setInteger:forKey:](v8, "setInteger:forKey:", [v7 status], @"status");
  v10 = (void *)objc_claimAutoreleasedReturnValue([v7 ruleIdentifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v8, "setObjectOrNull:forKey:", v10, @"rule_identifier");

  v11 = (void *)objc_claimAutoreleasedReturnValue([v7 osVersionRange]);
  v12 = (void *)_SQLValueForOSVersionRequirementRange(v11);
  -[NSMutableDictionary setObjectOrNull:forKey:]( v8,  "setObjectOrNull:forKey:",  v12,  @"os_version_requirement_range");

  v13 = (void *)objc_claimAutoreleasedReturnValue([v7 hardwareVersionRange]);
  v14 = (void *)_SQLValueForHardwareVersionRange(v13);
  -[NSMutableDictionary setObjectOrNull:forKey:](v8, "setObjectOrNull:forKey:", v14, @"hardware_version_range");

  -[NSMutableDictionary setInteger:forKey:]( v8,  "setInteger:forKey:",  [v7 actionType],  @"action_type");
  v15 = (void *)objc_claimAutoreleasedReturnValue([v7 titleKey]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v8, "setObjectOrNull:forKey:", v15, @"title_key");

  v16 = (void *)objc_claimAutoreleasedReturnValue([v7 messageKey]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v8, "setObjectOrNull:forKey:", v16, @"message_key");

  v17 = (void *)objc_claimAutoreleasedReturnValue([v7 actionTitleKey]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v8, "setObjectOrNull:forKey:", v17, @"action_title_key");

  v18 = (void *)objc_claimAutoreleasedReturnValue([v7 actionInfo]);
  id v19 = _SQLValueForNotificationActionInfo(v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  -[NSMutableDictionary setObjectOrNull:forKey:](v8, "setObjectOrNull:forKey:", v20, @"action_info");

  v21 = (void *)objc_claimAutoreleasedReturnValue([v7 scheduledDeliveryDate]);
  v22 = (void *)_SQLValueForDate(v21);
  -[NSMutableDictionary setObjectOrNull:forKey:](v8, "setObjectOrNull:forKey:", v22, @"scheduled_delivery_date");

  -[NSMutableDictionary setBool:forKey:](v8, "setBool:forKey:", [v7 isDelivered], @"delivered");
  v23 = (void *)objc_claimAutoreleasedReturnValue([v7 relevantDateRange]);
  v24 = (void *)objc_claimAutoreleasedReturnValue([v23 startDate]);
  v25 = (void *)_SQLValueForDate(v24);
  -[NSMutableDictionary setObjectOrNull:forKey:]( v8,  "setObjectOrNull:forKey:",  v25,  @"relevant_date_range_start_date");

  v26 = (void *)objc_claimAutoreleasedReturnValue([v7 relevantDateRange]);
  v27 = (void *)objc_claimAutoreleasedReturnValue([v26 endDate]);
  v28 = (void *)_SQLValueForDate(v27);
  -[NSMutableDictionary setObjectOrNull:forKey:]( v8,  "setObjectOrNull:forKey:",  v28,  @"relevant_date_range_end_date");

  v29 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v8, v6);
  return v29;
}

- (void)updateWithNotification:(id)a3
{
  id v4 = a3;
  v24 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setInteger:forKey:](v24, "setInteger:forKey:", [v4 version], @"version");
  -[NSMutableDictionary setInteger:forKey:](v24, "setInteger:forKey:", [v4 status], @"status");
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 ruleIdentifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v24, "setObjectOrNull:forKey:", v5, @"rule_identifier");

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 osVersionRange]);
  id v7 = (void *)_SQLValueForOSVersionRequirementRange(v6);
  -[NSMutableDictionary setObjectOrNull:forKey:]( v24,  "setObjectOrNull:forKey:",  v7,  @"os_version_requirement_range");

  v8 = (void *)objc_claimAutoreleasedReturnValue([v4 hardwareVersionRange]);
  id v9 = (void *)_SQLValueForHardwareVersionRange(v8);
  -[NSMutableDictionary setObjectOrNull:forKey:](v24, "setObjectOrNull:forKey:", v9, @"hardware_version_range");

  -[NSMutableDictionary setInteger:forKey:]( v24,  "setInteger:forKey:",  [v4 actionType],  @"action_type");
  v10 = (void *)objc_claimAutoreleasedReturnValue([v4 titleKey]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v24, "setObjectOrNull:forKey:", v10, @"title_key");

  v11 = (void *)objc_claimAutoreleasedReturnValue([v4 messageKey]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v24, "setObjectOrNull:forKey:", v11, @"message_key");

  v12 = (void *)objc_claimAutoreleasedReturnValue([v4 actionTitleKey]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v24, "setObjectOrNull:forKey:", v12, @"action_title_key");

  v13 = (void *)objc_claimAutoreleasedReturnValue([v4 actionInfo]);
  id v14 = _SQLValueForNotificationActionInfo(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  -[NSMutableDictionary setObjectOrNull:forKey:](v24, "setObjectOrNull:forKey:", v15, @"action_info");

  v16 = (void *)objc_claimAutoreleasedReturnValue([v4 scheduledDeliveryDate]);
  v17 = (void *)_SQLValueForDate(v16);
  -[NSMutableDictionary setObjectOrNull:forKey:](v24, "setObjectOrNull:forKey:", v17, @"scheduled_delivery_date");

  -[NSMutableDictionary setBool:forKey:](v24, "setBool:forKey:", [v4 isDelivered], @"delivered");
  v18 = (void *)objc_claimAutoreleasedReturnValue([v4 relevantDateRange]);
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 startDate]);
  v20 = (void *)_SQLValueForDate(v19);
  -[NSMutableDictionary setObjectOrNull:forKey:]( v24,  "setObjectOrNull:forKey:",  v20,  @"relevant_date_range_start_date");

  v21 = (void *)objc_claimAutoreleasedReturnValue([v4 relevantDateRange]);
  v22 = (void *)objc_claimAutoreleasedReturnValue([v21 endDate]);
  v23 = (void *)_SQLValueForDate(v22);
  -[NSMutableDictionary setObjectOrNull:forKey:]( v24,  "setObjectOrNull:forKey:",  v23,  @"relevant_date_range_end_date");

  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v24);
}

+ (id)notificationsInDatabase:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SQLiteBooleanPredicate truePredicate](&OBJC_CLASS___SQLiteBooleanPredicate, "truePredicate"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v4 predicate:v5]);

  v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472LL;
  v13 = sub_100386AF0;
  id v14 = &unk_10063BCB0;
  id v15 = v4;
  v16 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v7 = v16;
  id v8 = v4;
  [v6 enumeratePersistentIDsUsingBlock:&v11];
  id v9 = -[NSMutableArray copy](v7, "copy", v11, v12, v13, v14);

  return v9;
}

+ (id)notificationsThatAreNotExpiredForDate:(id)a3 active:(unint64_t)a4 delivered:(unint64_t)a5 inDatabase:(id)a6
{
  id v10 = a6;
  v11 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForNotificationsThatAreNotExpiredForDate:a3]);
  v25[0] = v11;
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForNotificationsThatAreActive:a4]);
  v25[1] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForNotificationsThatAreDelivered:a5]);
  v25[2] = v13;
  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v25, 3LL));
  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v14));

  v16 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v10 predicate:v15]);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_100386D08;
  v22[3] = &unk_10063BCB0;
  id v23 = v10;
  v17 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v24 = v17;
  id v18 = v10;
  [v16 enumeratePersistentIDsUsingBlock:v22];
  id v19 = v24;
  v20 = v17;

  return v20;
}

+ (id)notificationsToScheduleForDate:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForNotificationsThatAreNotExpiredForDate:a3]);
  v22[0] = v7;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForNotificationsThatAreActive:1]);
  v22[1] = v8;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForNotificationsThatAreDelivered:2]);
  v22[2] = v9;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForNotificationsThatAreScheduled:2]);
  v22[3] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v22, 4LL));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v11));

  v13 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v12]);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_100386F3C;
  v19[3] = &unk_10063BCB0;
  id v20 = v6;
  id v14 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v21 = v14;
  id v15 = v6;
  [v13 enumeratePersistentIDsUsingBlock:v19];
  v16 = v21;
  v17 = v14;

  return v17;
}

+ (id)notificationsRequiringInsertionForDate:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForNotificationsThatAreActive:1]);
  v22[0] = v8;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForNotificationsThatAreDelivered:2]);
  v22[1] = v9;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForNotificationsWithScheduledDeliveryDateBeforeDate:v7]);

  v22[2] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v22, 3LL));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v11));

  v13 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v12]);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_100387158;
  v19[3] = &unk_10063BCB0;
  id v20 = v6;
  id v14 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v21 = v14;
  id v15 = v6;
  [v13 enumeratePersistentIDsUsingBlock:v19];
  v16 = v21;
  v17 = v14;

  return v17;
}

+ (id)nextRelevantNotificationForDate:(id)a3 inDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForNotificationsThatAreNotExpiredForDate:v6]);
  v30[0] = v8;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForNotificationsThatAreActive:1]);
  v30[1] = v9;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForNotificationsThatAreDelivered:2]);
  v30[2] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v30, 3LL));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v11));

  v29 = @"scheduled_delivery_date";
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v29, 1LL));
  v28 = @"ASC";
  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v28, 1LL));
  id v15 = (void *)objc_claimAutoreleasedReturnValue( [a1 queryWithDatabase:v7 predicate:v12 orderingProperties:v13 orderingDirections:v14 limit:1]);

  uint64_t v22 = 0LL;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000LL;
  v25 = sub_100387428;
  v26 = sub_100387438;
  id v27 = 0LL;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_100387440;
  v19[3] = &unk_100651E00;
  id v16 = v7;
  id v20 = v16;
  v21 = &v22;
  [v15 enumeratePersistentIDsUsingBlock:v19];
  id v17 = (id)v23[5];

  _Block_object_dispose(&v22, 8);
  return v17;
}

+ (void)deleteNotificationWithIdentifier:(id)a3 inDatabase:(id)a4
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a1 notificationWithIdentifier:a3 inDatabase:a4]);
  if (v4)
  {
    id v5 = v4;
    [v4 deleteFromDatabase];
    id v4 = v5;
  }
}

+ (void)deleteNotificationsNotIncludingIdentifiers:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue( +[SQLiteContainsPredicate doesNotContainPredicateWithProperty:values:]( &OBJC_CLASS___SQLiteContainsPredicate,  "doesNotContainPredicateWithProperty:values:",  @"identifier",  a3));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

+ (void)deleteAllNotificationInDatabase:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[SQLiteBooleanPredicate truePredicate](&OBJC_CLASS___SQLiteBooleanPredicate, "truePredicate"));
  id v6 = (id)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v4 predicate:v5]);

  [v6 deleteAllEntities];
}

- (id)notification
{
  v3 = objc_alloc_init(&OBJC_CLASS___PKDiscoveryNotification);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[DiscoveryNotification _propertySettersForNotification]( &OBJC_CLASS___DiscoveryNotification,  "_propertySettersForNotification"));
  id v5 = objc_alloc(&OBJC_CLASS___NSMutableArray);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 allKeys]);
  id v7 = -[NSMutableArray initWithArray:](v5, "initWithArray:", v6);

  -[NSMutableArray addObject:](v7, "addObject:", @"relevant_date_range_start_date");
  -[NSMutableArray addObject:](v7, "addObject:", @"relevant_date_range_end_date");
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100387700;
  v13[3] = &unk_100639EE8;
  id v14 = v4;
  id v8 = v3;
  id v15 = v8;
  id v9 = v4;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v7, v13);
  id v10 = v15;
  v11 = v8;

  return v11;
}

+ (id)_predicateForNotificationIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"identifier",  a3);
}

+ (id)_predicateForNotificationsThatAreActive:(unint64_t)a3
{
  if (a3)
  {
    if (a3 == 2)
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:notEqualToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:notEqualToValue:",  @"status",  &off_1006907A0));
    }

    else if (a3 == 1)
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"status",  &off_1006907A0));
    }

    else
    {
      v3 = 0LL;
    }
  }

  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[SQLiteBooleanPredicate truePredicate](&OBJC_CLASS___SQLiteBooleanPredicate, "truePredicate"));
  }

  return v3;
}

+ (id)_predicateForNotificationsWithScheduledDeliveryDateBeforeDate:(id)a3
{
  if (a3)
  {
    v3 = (void *)_SQLValueForDate(a3);
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:lessThanValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:lessThanValue:",  @"scheduled_delivery_date",  v3));
  }

  else
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[SQLiteBooleanPredicate truePredicate](&OBJC_CLASS___SQLiteBooleanPredicate, "truePredicate"));
  }

  return v4;
}

+ (id)_predicateForNotificationsThatAreDelivered:(unint64_t)a3
{
  if (a3)
  {
    if (a3 == 2)
    {
      v3 = &off_1006907D0;
    }

    else
    {
      if (a3 != 1)
      {
        id v4 = 0LL;
        return v4;
      }

      v3 = &off_1006907B8;
    }

    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"delivered",  v3));
  }

  else
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[SQLiteBooleanPredicate truePredicate](&OBJC_CLASS___SQLiteBooleanPredicate, "truePredicate"));
  }

  return v4;
}

+ (id)_predicateForNotificationsThatAreScheduled:(unint64_t)a3
{
  if (a3)
  {
    if (a3 == 2)
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteNullPredicate isNullPredicateWithProperty:]( &OBJC_CLASS___SQLiteNullPredicate,  "isNullPredicateWithProperty:",  @"scheduled_delivery_date"));
    }

    else if (a3 == 1)
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteNullPredicate isNotNullPredicateWithProperty:]( &OBJC_CLASS___SQLiteNullPredicate,  "isNotNullPredicateWithProperty:",  @"scheduled_delivery_date"));
    }

    else
    {
      v3 = 0LL;
    }
  }

  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[SQLiteBooleanPredicate truePredicate](&OBJC_CLASS___SQLiteBooleanPredicate, "truePredicate"));
  }

  return v3;
}

+ (id)_predicateForNotificationsWithRelevantDate:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteNullPredicate isNullPredicateWithProperty:]( &OBJC_CLASS___SQLiteNullPredicate,  "isNullPredicateWithProperty:",  @"relevant_date_range_start_date"));
    id v4 = (void *)_SQLValueForDate(v3);
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:lessThanOrEqualToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:lessThanOrEqualToValue:",  @"relevant_date_range_start_date",  v4));

    v19[0] = v16;
    v19[1] = v5;
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v19, 2LL));
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAnyPredicates:",  v6));

    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteNullPredicate isNullPredicateWithProperty:]( &OBJC_CLASS___SQLiteNullPredicate,  "isNullPredicateWithProperty:",  @"relevant_date_range_end_date"));
    id v9 = (void *)_SQLValueForDate(v3);
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:greaterThanOrEqualToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:greaterThanOrEqualToValue:",  @"relevant_date_range_end_date",  v9));

    v18[0] = v8;
    v18[1] = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v18, 2LL));
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAnyPredicates:",  v11));

    v17[0] = v7;
    v17[1] = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v17, 2LL));
    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v13));
  }

  else
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[SQLiteBooleanPredicate truePredicate](&OBJC_CLASS___SQLiteBooleanPredicate, "truePredicate"));
  }

  return v14;
}

+ (id)_predicateForNotificationsThatAreNotExpiredForDate:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteNullPredicate isNullPredicateWithProperty:]( &OBJC_CLASS___SQLiteNullPredicate,  "isNullPredicateWithProperty:",  @"relevant_date_range_end_date"));
    id v5 = (void *)_SQLValueForDate(v3);
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:greaterThanOrEqualToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:greaterThanOrEqualToValue:",  @"relevant_date_range_end_date",  v5));

    v10[0] = v4;
    v10[1] = v6;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v10, 2LL));
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAnyPredicates:",  v7));
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[SQLiteBooleanPredicate truePredicate](&OBJC_CLASS___SQLiteBooleanPredicate, "truePredicate"));
  }

  return v8;
}

+ (id)_propertySettersForNotification
{
  v3[0] = @"identifier";
  v3[1] = @"version";
  v4[0] = &stru_100658F18;
  v4[1] = &stru_100658F38;
  v3[2] = @"status";
  v3[3] = @"rule_identifier";
  v4[2] = &stru_100658F58;
  v4[3] = &stru_100658F78;
  v3[4] = @"os_version_requirement_range";
  v3[5] = @"hardware_version_range";
  v4[4] = &stru_100658F98;
  v4[5] = &stru_100658FB8;
  v3[6] = @"action_type";
  v3[7] = @"title_key";
  v4[6] = &stru_100658FD8;
  v4[7] = &stru_100658FF8;
  v3[8] = @"message_key";
  v3[9] = @"action_title_key";
  v4[8] = &stru_100659018;
  v4[9] = &stru_100659038;
  v3[10] = @"action_info";
  v3[11] = @"scheduled_delivery_date";
  v4[10] = &stru_100659058;
  v4[11] = &stru_100659078;
  v3[12] = @"delivered";
  v4[12] = &stru_100659098;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  13LL));
}

@end