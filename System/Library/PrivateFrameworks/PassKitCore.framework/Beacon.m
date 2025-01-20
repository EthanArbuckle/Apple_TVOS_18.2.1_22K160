@interface Beacon
+ (id)_beaconsInDatabase:(id)a3 matchingPredicate:(id)a4;
+ (id)_predicateForPass:(id)a3;
+ (id)_predicateForPassPID:(int64_t)a3;
+ (id)_propertySettersForBeacon;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)beaconsInDatabase:(id)a3 forPass:(id)a4;
+ (id)beaconsInDatabase:(id)a3 forPassPID:(unint64_t)a4;
+ (id)databaseTable;
+ (void)deleteEntitiesForPass:(id)a3 inDatabase:(id)a4;
+ (void)insertBeacons:(id)a3 forPass:(id)a4 inDatabase:(id)a5;
- (Beacon)initWithBeacon:(id)a3 pass:(id)a4 inDatabase:(id)a5;
@end

@implementation Beacon

+ (id)databaseTable
{
  return @"beacon";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class(&OBJC_CLASS___Pass, a2) == a3) {
    return @"pass_pid";
  }
  else {
    return 0LL;
  }
}

- (Beacon)initWithBeacon:(id)a3 pass:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v10 proximityUUIDAsString]);
  [v11 setObjectOrNull:v12 forKey:@"proximity_uuid"];

  v13 = (void *)objc_claimAutoreleasedReturnValue([v10 major]);
  [v11 setObjectOrNull:v13 forKey:@"major"];

  v14 = (void *)objc_claimAutoreleasedReturnValue([v10 minor]);
  [v11 setObjectOrNull:v14 forKey:@"minor"];

  v15 = (void *)objc_claimAutoreleasedReturnValue([v10 name]);
  [v11 setObjectOrNull:v15 forKey:@"name"];

  v16 = (void *)objc_claimAutoreleasedReturnValue([v10 relevantText]);
  [v11 setObjectOrNull:v16 forKey:@"relevant_text"];

  id v17 = [v9 persistentID];
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v17));
  [v11 setObject:v18 forKey:@"pass_pid"];

  v19 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v11, v8);
  return v19;
}

+ (void)insertBeacons:(id)a3 forPass:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v11 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      v14 = 0LL;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v8);
        }

        v14 = (char *)v14 + 1;
      }

      while (v12 != v14);
      id v12 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v12);
  }
}

+ (id)_beaconsInDatabase:(id)a3 matchingPredicate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _propertySettersForBeacon]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryWithDatabase:predicate:]( &OBJC_CLASS___Beacon,  "queryWithDatabase:predicate:",  v7,  v6));

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 allKeys]);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10031D534;
  v17[3] = &unk_100639BF0;
  id v20 = a1;
  id v18 = v9;
  id v12 = v8;
  v19 = v12;
  id v13 = v9;
  [v10 enumeratePersistentIDsAndProperties:v11 usingBlock:v17];

  v14 = v19;
  __int128 v15 = v12;

  return v15;
}

+ (id)_predicateForPassPID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"pass_pid",  v3));

  return v4;
}

+ (id)_predicateForPass:(id)a3
{
  return objc_msgSend(a1, "_predicateForPassPID:", objc_msgSend(a3, "persistentID"));
}

+ (id)beaconsInDatabase:(id)a3 forPass:(id)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPass:a4]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _beaconsInDatabase:v6 matchingPredicate:v7]);

  return v8;
}

+ (id)beaconsInDatabase:(id)a3 forPassPID:(unint64_t)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPassPID:a4]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _beaconsInDatabase:v6 matchingPredicate:v7]);

  return v8;
}

+ (void)deleteEntitiesForPass:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForPass:a3]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

+ (id)_propertySettersForBeacon
{
  v3[0] = @"proximity_uuid";
  v3[1] = @"major";
  v4[0] = &stru_1006568F8;
  v4[1] = &stru_100656918;
  v3[2] = @"minor";
  v3[3] = @"name";
  v4[2] = &stru_100656938;
  v4[3] = &stru_100656958;
  v3[4] = @"relevant_text";
  v4[4] = &stru_100656978;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  5LL));
}

@end