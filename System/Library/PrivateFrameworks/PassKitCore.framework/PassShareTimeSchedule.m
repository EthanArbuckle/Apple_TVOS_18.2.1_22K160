@interface PassShareTimeSchedule
+ (id)_passShareTimeSchedulesWithQuery:(id)a3;
+ (id)_predicateForTimeConfigurationPID:(int64_t)a3;
+ (id)_propertySetters;
+ (id)_propertyValuesForObject:(id)a3;
+ (id)databaseTable;
+ (id)passShareTimeSchedulesForTimeConfigurationPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deletePassShareTimeSchedulesForTimeConfigurationPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)insertOrUpdatePassShareTimeSchedules:(id)a3 forTimeConfigurationPID:(int64_t)a4 inDatabase:(id)a5;
- (PassShareTimeSchedule)initWithPassShareTimeSchedule:(id)a3 forTimeConfigurationPID:(int64_t)a4 inDatabase:(id)a5;
- (id)passShareTimeSchedule;
@end

@implementation PassShareTimeSchedule

+ (id)databaseTable
{
  return @"eggs_benedict";
}

- (PassShareTimeSchedule)initWithPassShareTimeSchedule:(id)a3 forTimeConfigurationPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v11 = objc_msgSend((id)objc_opt_class(self, v10), "_propertyValuesForObject:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  [v12 setObjectOrNull:v13 forKey:@"a"];

  v14 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v12, v8);
  return v14;
}

+ (void)insertOrUpdatePassShareTimeSchedules:(id)a3 forTimeConfigurationPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  [a1 deletePassShareTimeSchedulesForTimeConfigurationPID:a4 inDatabase:v9];
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v10 = v8;
  id v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      v14 = 0LL;
      do
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v17 + 1) + 8LL * (void)v14);
        v16 = objc_alloc(&OBJC_CLASS___PassShareTimeSchedule);

        v14 = (char *)v14 + 1;
      }

      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v12);
  }
}

+ (id)passShareTimeSchedulesForTimeConfigurationPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForTimeConfigurationPID:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _passShareTimeSchedulesWithQuery:v8]);
  return v9;
}

+ (void)deletePassShareTimeSchedulesForTimeConfigurationPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForTimeConfigurationPID:a3]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

+ (id)_passShareTimeSchedulesWithQuery:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([a1 _propertySetters]);
  id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 allKeys]);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000E6464;
  v12[3] = &unk_100639BF0;
  id v15 = a1;
  id v13 = v5;
  id v8 = v6;
  v14 = v8;
  id v9 = v5;
  [v4 enumeratePersistentIDsAndProperties:v7 usingBlock:v12];

  if (-[NSMutableArray count](v8, "count")) {
    id v10 = -[NSMutableArray copy](v8, "copy");
  }
  else {
    id v10 = 0LL;
  }

  return v10;
}

- (id)passShareTimeSchedule
{
  v3 = objc_alloc_init(&OBJC_CLASS___PKPassShareTimeSchedule);
  id v5 = objc_msgSend((id)objc_opt_class(self, v4), "_propertySetters");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000E65B8;
  v13[3] = &unk_100638EF0;
  v13[4] = self;
  id v14 = v6;
  id v8 = v3;
  id v15 = v8;
  id v9 = v6;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v7, v13);

  id v10 = v15;
  id v11 = v8;

  return v11;
}

+ (id)_predicateForTimeConfigurationPID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"a",  v3));

  return v4;
}

+ (id)_propertyValuesForObject:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 hoursOfDay]);
  id v6 = _SQLValueForIntegerArray(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v7, @"b");

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 daysOfWeek]);
  id v9 = _SQLValueForIntegerArray(v8);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v10, @"c");

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v3 daysOfMonth]);
  id v12 = _SQLValueForIntegerArray(v11);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v13, @"d");

  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v3 interval]));
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v14, @"e");

  id v15 = [v3 frequency];
  uint64_t v16 = PKPassShareTimeScheduleFrequencyToString(v15);
  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v17, @"f");

  return v4;
}

+ (id)_propertySetters
{
  v3[0] = @"b";
  v3[1] = @"c";
  v4[0] = &stru_100642ED0;
  v4[1] = &stru_100642EF0;
  v3[2] = @"d";
  v3[3] = @"e";
  v4[2] = &stru_100642F10;
  v4[3] = &stru_100642F30;
  v3[4] = @"f";
  v4[4] = &stru_100642F50;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  5LL));
}

@end