@interface PhysicalCardOrderActivityEvent
+ (id)_activityEventsWithQuery:(id)a3;
+ (id)_predicateForPhysicalCardPID:(int64_t)a3;
+ (id)_propertySettersForActivityEvent;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertPhysicalCardOrderActivityEvents:(id)a3 forPhysicalCardPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)physicalCardOrderActivityEventsForPhysicalCardPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deleteActivityEventsForPhysicalCardPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)updateActivityEvents:(id)a3 forPhysicalCardPID:(int64_t)a4 inDatabase:(id)a5;
- (PhysicalCardOrderActivityEvent)initWithActivityEvent:(id)a3 forPhysicalCardPID:(int64_t)a4 inDatabase:(id)a5;
- (id)activityEvent;
- (void)updateWithActivityEvent:(id)a3;
@end

@implementation PhysicalCardOrderActivityEvent

+ (id)databaseTable
{
  return @"pitayas";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class(&OBJC_CLASS___PhysicalCard, a2) == a3) {
    return @"a";
  }
  else {
    return 0LL;
  }
}

- (PhysicalCardOrderActivityEvent)initWithActivityEvent:(id)a3 forPhysicalCardPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  [v10 setObjectOrNull:v11 forKey:@"a"];

  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v9 activity]));
  [v10 setObjectOrNull:v12 forKey:@"b"];

  v13 = (void *)objc_claimAutoreleasedReturnValue([v9 date]);
  v14 = (void *)_SQLValueForDate(v13);
  [v10 setObjectOrNull:v14 forKey:@"c"];

  v15 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v10, v8);
  return v15;
}

+ (void)updateActivityEvents:(id)a3 forPhysicalCardPID:(int64_t)a4 inDatabase:(id)a5
{
  id v10 = a3;
  id v8 = a5;
  [a1 deleteActivityEventsForPhysicalCardPID:a4 inDatabase:v8];
  id v9 = [a1 insertPhysicalCardOrderActivityEvents:v10 forPhysicalCardPID:a4 inDatabase:v8];
}

- (void)updateWithActivityEvent:(id)a3
{
  id v4 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v4 activity]));
  [v8 setObjectOrNull:v5 forKey:@"b"];

  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 date]);
  v7 = (void *)_SQLValueForDate(v6);
  [v8 setObjectOrNull:v7 forKey:@"c"];

  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v8);
}

+ (id)insertPhysicalCardOrderActivityEvents:(id)a3 forPhysicalCardPID:(int64_t)a4 inDatabase:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v10 = v7;
  id v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v21;
    do
    {
      v14 = 0LL;
      do
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v20 + 1) + 8LL * (void)v14);
        v16 = objc_alloc(&OBJC_CLASS___PhysicalCardOrderActivityEvent);
        v17 = -[PhysicalCardOrderActivityEvent initWithActivityEvent:forPhysicalCardPID:inDatabase:]( v16,  "initWithActivityEvent:forPhysicalCardPID:inDatabase:",  v15,  a4,  v8,  (void)v20);
        if (v17) {
          -[NSMutableSet addObject:](v9, "addObject:", v17);
        }

        v14 = (char *)v14 + 1;
      }

      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }

    while (v12);
  }

  if (-[NSMutableSet count](v9, "count")) {
    id v18 = -[NSMutableSet copy](v9, "copy");
  }
  else {
    id v18 = 0LL;
  }

  return v18;
}

+ (void)deleteActivityEventsForPhysicalCardPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForPhysicalCardPID:a3]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

+ (id)physicalCardOrderActivityEventsForPhysicalCardPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPhysicalCardPID:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _activityEventsWithQuery:v8]);
  return v9;
}

+ (id)_predicateForPhysicalCardPID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"a",  v3));

  return v4;
}

- (id)activityEvent
{
  v3 = objc_alloc_init(&OBJC_CLASS___PKPhysicalCardOrderActivityEvent);
  id v5 = objc_msgSend((id)objc_opt_class(self, v4), "_propertySettersForPhysicalCard");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100321174;
  v13[3] = &unk_100638EF0;
  v13[4] = self;
  id v14 = v6;
  id v8 = v3;
  uint64_t v15 = v8;
  id v9 = v6;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v7, v13);

  id v10 = v15;
  id v11 = v8;

  return v11;
}

+ (id)_activityEventsWithQuery:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([a1 _propertySettersForActivityEvent]);
  id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 allKeys]);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1003212D4;
  v12[3] = &unk_100639BF0;
  id v15 = a1;
  id v13 = v5;
  id v8 = v6;
  id v14 = v8;
  id v9 = v5;
  [v4 enumeratePersistentIDsAndProperties:v7 usingBlock:v12];

  if (-[NSMutableSet count](v8, "count")) {
    id v10 = -[NSMutableSet copy](v8, "copy");
  }
  else {
    id v10 = 0LL;
  }

  return v10;
}

+ (id)_propertySettersForActivityEvent
{
  v3[0] = @"b";
  v3[1] = @"c";
  v4[0] = &stru_100656C58;
  v4[1] = &stru_100656C78;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  2LL));
}

@end