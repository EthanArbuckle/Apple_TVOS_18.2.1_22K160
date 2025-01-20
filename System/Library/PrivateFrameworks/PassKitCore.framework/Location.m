@interface Location
+ (BOOL)hasLocationsInDatabase:(id)a3 forPassPID:(unint64_t)a4;
+ (id)_locationsInDatabase:(id)a3 matchingPredicate:(id)a4;
+ (id)_predicateForLocationSource:(id)a3;
+ (id)_predicateForLocationSourcePID:(int64_t)a3;
+ (id)_predicateForPass:(id)a3;
+ (id)_predicateForPassPID:(int64_t)a3;
+ (id)_predicateForSourceType:(int)a3;
+ (id)_propertySettersForLocation;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)foreignDatabaseTablesToDelete;
+ (id)foreignKeyColumnForTable:(id)a3;
+ (id)locationsInDatabase:(id)a3 forPassPID:(unint64_t)a4;
+ (id)locationsInDatabase:(id)a3 forPassPID:(unint64_t)a4 withSourceType:(int)a5;
+ (id)queryWithDatabase:(id)a3 locationSourcePID:(unint64_t)a4;
+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4;
+ (void)deleteEntitiesForPass:(id)a3 inDatabase:(id)a4;
+ (void)insertLocations:(id)a3 forSource:(id)a4 inDatabase:(id)a5;
- (Location)initWithLocation:(id)a3 source:(id)a4 inDatabase:(id)a5;
@end

@implementation Location

+ (id)databaseTable
{
  return @"location";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class(&OBJC_CLASS___LocationSource, a2) == a3) {
    return @"location_source_pid";
  }
  if ((Class)objc_opt_class(&OBJC_CLASS___Pass, v4) == a3) {
    return @"pass_location_source.pass_pid";
  }
  return 0LL;
}

+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4
{
  id v6 = a3;
  id v5 = a4;
  if (([v6 isEqualToString:@"pass.pid"] & 1) != 0
    || [v6 isEqualToString:@"location_source.type"])
  {
    [v5 addObject:@"JOIN location_source ON location.location_source_pid = location_source.pid"];
    [v5 addObject:@"LEFT JOIN pass_location_source ON pass_location_source.location_source_pid = location_source.pid"];
    [v5 addObject:@"JOIN pass ON pass_location_source.pass_pid = pass.pid"];
  }

  if ([v6 isEqualToString:@"pass_location_source.pass_pid"])
  {
    [v5 addObject:@"JOIN location_source ON location.location_source_pid = location_source.pid"];
    [v5 addObject:@"LEFT JOIN pass_location_source ON pass_location_source.location_source_pid = location_source.pid"];
  }
}

+ (id)foreignDatabaseTablesToDelete
{
  return +[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", @"location_index");
}

+ (id)foreignKeyColumnForTable:(id)a3
{
  else {
    return 0LL;
  }
}

- (Location)initWithLocation:(id)a3 source:(id)a4 inDatabase:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v11 = objc_alloc(&OBJC_CLASS___NSNumber);
  [v7 latitude];
  v12 = -[NSNumber initWithDouble:](v11, "initWithDouble:");
  v13 = objc_alloc(&OBJC_CLASS___NSNumber);
  [v7 longitude];
  v14 = -[NSNumber initWithDouble:](v13, "initWithDouble:");
  -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", v12, @"latitude");
  -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", v14, @"longitude");
  [v7 maxDistance];
  if (v15 > 0.0)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
    -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", v16, @"max_distance");
  }

  if ([v7 hasAltitude])
  {
    v17 = objc_alloc(&OBJC_CLASS___NSNumber);
    [v7 altitude];
    v18 = -[NSNumber initWithDouble:](v17, "initWithDouble:");
    -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", v18, @"altitude");
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue([v7 name]);
  if (v19) {
    -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", v19, @"name");
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue([v7 relevantText]);
  if (v20) {
    -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", v20, @"relevant_text");
  }
  v21 = objc_alloc(&OBJC_CLASS___NSNumber);
  id v22 = [v9 persistentID];

  v23 = -[NSNumber initWithLongLong:](v21, "initWithLongLong:", v22);
  -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", v23, @"location_source_pid");
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___Location;
  v24 = -[SQLiteEntity initWithPropertyValues:inDatabase:](&v28, "initWithPropertyValues:inDatabase:", v10, v8);
  id v25 =  +[LocationIndex insertIndexedLocationWithLatitude:longitude:forLocation:database:]( &OBJC_CLASS___LocationIndex,  "insertIndexedLocationWithLatitude:longitude:forLocation:database:",  v12,  v14,  v24,  v8);

  return v24;
}

+ (void)insertLocations:(id)a3 forSource:(id)a4 inDatabase:(id)a5
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000E7900;
  v11[3] = &unk_10063FDF8;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a1;
  id v8 = v14;
  id v9 = v13;
  id v10 = v12;
  sub_1002CCC5C((uint64_t)v8, v11);
}

+ (id)_locationsInDatabase:(id)a3 matchingPredicate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _propertySettersForLocation]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryWithDatabase:predicate:]( &OBJC_CLASS___Location,  "queryWithDatabase:predicate:",  v7,  v6));

  v11 = (void *)objc_claimAutoreleasedReturnValue([v9 allKeys]);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_1000E7B58;
  v17[3] = &unk_100639BF0;
  id v20 = a1;
  id v18 = v9;
  id v12 = v8;
  v19 = v12;
  id v13 = v9;
  [v10 enumeratePersistentIDsAndProperties:v11 usingBlock:v17];

  id v14 = v19;
  id v15 = v12;

  return v15;
}

+ (id)_predicateForPassPID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"pass.pid",  v3));

  return v4;
}

+ (id)_predicateForPass:(id)a3
{
  return objc_msgSend(a1, "_predicateForPassPID:", objc_msgSend(a3, "persistentID"));
}

+ (BOOL)hasLocationsInDatabase:(id)a3 forPassPID:(unint64_t)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPassPID:a4]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  return v8 != 0LL;
}

+ (id)locationsInDatabase:(id)a3 forPassPID:(unint64_t)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPassPID:a4]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _locationsInDatabase:v6 matchingPredicate:v7]);

  return v8;
}

+ (id)_predicateForLocationSourcePID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"location_source_pid",  v3));

  return v4;
}

+ (id)_predicateForLocationSource:(id)a3
{
  return objc_msgSend(a1, "_predicateForLocationSourcePID:", objc_msgSend(a3, "persistentID"));
}

+ (id)_predicateForSourceType:(int)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", *(void *)&a3));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"location_source.type",  v3));

  return v4;
}

+ (id)locationsInDatabase:(id)a3 forPassPID:(unint64_t)a4 withSourceType:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPassPID:a4]);
  v15[0] = v9;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForSourceType:v5]);
  v15[1] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v15, 2LL));
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v11));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([a1 _locationsInDatabase:v8 matchingPredicate:v12]);

  return v13;
}

+ (id)queryWithDatabase:(id)a3 locationSourcePID:(unint64_t)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForLocationSourcePID:a4]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);

  return v8;
}

+ (void)deleteEntitiesForPass:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForPass:a3]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

+ (id)_propertySettersForLocation
{
  v3[0] = @"latitude";
  v3[1] = @"longitude";
  v4[0] = &stru_100643130;
  v4[1] = &stru_100643150;
  v3[2] = @"max_distance";
  v3[3] = @"altitude";
  v4[2] = &stru_100643170;
  v4[3] = &stru_100643190;
  v3[4] = @"name";
  v3[5] = @"relevant_text";
  v4[4] = &stru_1006431B0;
  v4[5] = &stru_1006431D0;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  6LL));
}

@end