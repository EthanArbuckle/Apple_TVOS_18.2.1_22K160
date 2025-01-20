@interface PassShareTimeConfiguration
+ (id)_passShareTimeConfigurationsWithQuery:(id)a3 inDatabase:(id)a4;
+ (id)_predicateForPassEntitlementPID:(int64_t)a3;
+ (id)_predicateForPassSharedEntitlementPID:(int64_t)a3;
+ (id)_propertySetters;
+ (id)_propertyValuesForObject:(id)a3;
+ (id)databaseTable;
+ (id)passShareTimeConfigurationsForPassEntitlementPID:(int64_t)a3 inDatabase:(id)a4;
+ (id)passShareTimeConfigurationsForPassSharedEntitlementPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)_deletePassShareTimeConfigurationsForQuery:(id)a3 inDatabase:(id)a4;
+ (void)_insertOrUpdatePassShareTimeConfigurations:(id)a3 forPassSharedEntitlementPID:(int64_t)a4 forPassEntitlementPID:(int64_t)a5 inDatabase:(id)a6;
+ (void)deletePassShareTimeConfigurationsForPassEntitlementPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deletePassShareTimeConfigurationsForPassSharedEntitlementPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)insertOrUpdatePassShareTimeConfiguration:(id)a3 forPassEntitlementPID:(int64_t)a4 inDatabase:(id)a5;
+ (void)insertOrUpdatePassShareTimeConfiguration:(id)a3 forPassSharedEntitlementPID:(int64_t)a4 inDatabase:(id)a5;
- (PassShareTimeConfiguration)initWithPassShareTimeConfiguration:(id)a3 forPassSharedEntitlementPID:(int64_t)a4 forPassEntitlementPID:(int64_t)a5 inDatabase:(id)a6;
- (id)passShareTimeConfiguration;
- (void)updateWithPassShareTimeConfiguration:(id)a3;
@end

@implementation PassShareTimeConfiguration

+ (id)databaseTable
{
  return @"avocado_toast";
}

- (PassShareTimeConfiguration)initWithPassShareTimeConfiguration:(id)a3 forPassSharedEntitlementPID:(int64_t)a4 forPassEntitlementPID:(int64_t)a5 inDatabase:(id)a6
{
  id v10 = a6;
  id v11 = a3;
  id v13 = objc_msgSend((id)objc_opt_class(self, v12), "_propertyValuesForObject:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

  if (a4)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
    [v14 setObjectOrNull:v15 forKey:@"a"];
  }

  if (a5)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a5));
    [v14 setObjectOrNull:v16 forKey:@"b"];
  }

  v17 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v14, v10);

  return v17;
}

- (void)updateWithPassShareTimeConfiguration:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend((id)objc_opt_class(self, v5), "_propertyValuesForObject:", v4);
  id v7 = (id)objc_claimAutoreleasedReturnValue(v6);

  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v7);
}

+ (void)insertOrUpdatePassShareTimeConfiguration:(id)a3 forPassSharedEntitlementPID:(int64_t)a4 inDatabase:(id)a5
{
  if (a3)
  {
    id v11 = a3;
    id v8 = a5;
    id v9 = a3;
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v11, 1LL));

    objc_msgSend( a1,  "_insertOrUpdatePassShareTimeConfigurations:forPassSharedEntitlementPID:forPassEntitlementPID:inDatabase:",  v10,  a4,  0,  v8,  v11);
  }

+ (void)insertOrUpdatePassShareTimeConfiguration:(id)a3 forPassEntitlementPID:(int64_t)a4 inDatabase:(id)a5
{
  if (a3)
  {
    id v11 = a3;
    id v8 = a5;
    id v9 = a3;
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v11, 1LL));

    objc_msgSend( a1,  "_insertOrUpdatePassShareTimeConfigurations:forPassSharedEntitlementPID:forPassEntitlementPID:inDatabase:",  v10,  0,  a4,  v8,  v11);
  }

+ (void)_insertOrUpdatePassShareTimeConfigurations:(id)a3 forPassSharedEntitlementPID:(int64_t)a4 forPassEntitlementPID:(int64_t)a5 inDatabase:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  if (a4) {
    [a1 deletePassShareTimeConfigurationsForPassSharedEntitlementPID:a4 inDatabase:v11];
  }
  if (a5) {
    [a1 deletePassShareTimeConfigurationsForPassEntitlementPID:a5 inDatabase:v11];
  }
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id obj = v10;
  id v12 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v21;
    do
    {
      v15 = 0LL;
      do
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(obj);
        }
        v16 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)v15);
        v17 = -[PassShareTimeConfiguration initWithPassShareTimeConfiguration:forPassSharedEntitlementPID:forPassEntitlementPID:inDatabase:]( objc_alloc(&OBJC_CLASS___PassShareTimeConfiguration),  "initWithPassShareTimeConfiguration:forPassSharedEntitlementPID:forPassEntitlementPID:inDatabase:",  v16,  a4,  a5,  v11);
        v18 = (void *)objc_claimAutoreleasedReturnValue([v16 schedules]);
        +[PassShareTimeSchedule insertOrUpdatePassShareTimeSchedules:forTimeConfigurationPID:inDatabase:]( &OBJC_CLASS___PassShareTimeSchedule,  "insertOrUpdatePassShareTimeSchedules:forTimeConfigurationPID:inDatabase:",  v18,  -[SQLiteEntity persistentID](v17, "persistentID"),  v11);

        v15 = (char *)v15 + 1;
      }

      while (v13 != v15);
      id v13 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }

    while (v13);
  }
}

+ (id)passShareTimeConfigurationsForPassSharedEntitlementPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPassSharedEntitlementPID:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _passShareTimeConfigurationsWithQuery:v8 inDatabase:v6]);

  return v9;
}

+ (id)passShareTimeConfigurationsForPassEntitlementPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPassEntitlementPID:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _passShareTimeConfigurationsWithQuery:v8 inDatabase:v6]);

  return v9;
}

+ (void)deletePassShareTimeConfigurationsForPassSharedEntitlementPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForPassSharedEntitlementPID:a3]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);
  [a1 _deletePassShareTimeConfigurationsForQuery:v7 inDatabase:v6];
}

+ (void)deletePassShareTimeConfigurationsForPassEntitlementPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForPassEntitlementPID:a3]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);
  [a1 _deletePassShareTimeConfigurationsForQuery:v7 inDatabase:v6];
}

+ (void)_deletePassShareTimeConfigurationsForQuery:(id)a3 inDatabase:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000E8C94;
  v7[3] = &unk_10063BE98;
  id v8 = a4;
  id v6 = v8;
  id v5 = a3;
  [v5 enumeratePersistentIDsUsingBlock:v7];
  [v5 deleteAllEntities];
}

+ (id)_passShareTimeConfigurationsWithQuery:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _propertySetters]);
  id v9 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 allKeys]);
  v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472LL;
  v18 = sub_1000E8DD4;
  v19 = &unk_100638F18;
  id v23 = a1;
  id v20 = v8;
  id v21 = v6;
  id v11 = v9;
  __int128 v22 = v11;
  id v12 = v6;
  id v13 = v8;
  [v7 enumeratePersistentIDsAndProperties:v10 usingBlock:&v16];

  if (-[NSMutableArray count](v11, "count", v16, v17, v18, v19)) {
    id v14 = -[NSMutableArray copy](v11, "copy");
  }
  else {
    id v14 = 0LL;
  }

  return v14;
}

- (id)passShareTimeConfiguration
{
  v3 = objc_alloc_init(&OBJC_CLASS___PKPassShareTimeConfiguration);
  id v5 = objc_msgSend((id)objc_opt_class(self, v4), "_propertySetters");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1000E8FAC;
  v14[3] = &unk_100638EF0;
  v14[4] = self;
  id v15 = v6;
  id v8 = v3;
  v16 = v8;
  id v9 = v6;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v7, v14);

  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[PassShareTimeSchedule passShareTimeSchedulesForTimeConfigurationPID:inDatabase:]( &OBJC_CLASS___PassShareTimeSchedule,  "passShareTimeSchedulesForTimeConfigurationPID:inDatabase:",  -[SQLiteEntity persistentID](self, "persistentID"),  self->super._database));
  -[PKPassShareTimeConfiguration setSchedules:](v8, "setSchedules:", v10);

  id v11 = v16;
  id v12 = v8;

  return v12;
}

+ (id)_predicateForPassSharedEntitlementPID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"a",  v3));

  return v4;
}

+ (id)_predicateForPassEntitlementPID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"b",  v3));

  return v4;
}

+ (id)_propertyValuesForObject:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 startDate]);
  id v6 = (void *)_SQLValueForDate(v5);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v6, @"c");

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 expirationDate]);
  id v8 = (void *)_SQLValueForDate(v7);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v8, @"d");

  id v9 = [v3 support];
  uint64_t v10 = PKPassShareTimeConfigurationSupportToString(v9);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v11, @"e");

  return v4;
}

+ (id)_propertySetters
{
  v3[0] = @"c";
  v3[1] = @"d";
  v4[0] = &stru_100643270;
  v4[1] = &stru_100643290;
  v3[2] = @"e";
  v4[2] = &stru_1006432B0;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  3LL));
}

@end