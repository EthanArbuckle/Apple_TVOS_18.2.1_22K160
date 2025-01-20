@interface LocationIndex
+ (id)databaseTable;
+ (id)insertIndexedLocationWithLatitude:(id)a3 longitude:(id)a4 forLocation:(id)a5 database:(id)a6;
+ (id)locationsByPassUniqueIDWithBoundingBox:(id)a3 inDatabase:(id)a4;
+ (id)propertySettersForLocation;
+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4;
- (LocationIndex)initWithLatitude:(id)a3 longitude:(id)a4 forLocation:(id)a5 database:(id)a6;
@end

@implementation LocationIndex

+ (id)databaseTable
{
  return @"location_index";
}

+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 propertySettersForLocation]);
  if (([v10 isEqualToString:@"pass.unique_id"] & 1) != 0
    || (v8 = (void *)objc_claimAutoreleasedReturnValue([v7 allKeys]),
        unsigned int v9 = [v8 containsObject:v10],
        v8,
        v9))
  {
    [v6 addObject:@"JOIN location ON location_index.location_pid = location.pid"];
    [v6 addObject:@"JOIN location_source ON location.location_source_pid = location_source.pid"];
    [v6 addObject:@"LEFT JOIN pass_location_source ON pass_location_source.location_source_pid = location_source.pid"];
    [v6 addObject:@"JOIN pass ON pass_location_source.pass_pid = pass.pid"];
  }
}

- (LocationIndex)initWithLatitude:(id)a3 longitude:(id)a4 forLocation:(id)a5 database:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObject:forKey:](v14, "setObject:forKey:", v13, @"min_lat");
  -[NSMutableDictionary setObject:forKey:](v14, "setObject:forKey:", v13, @"max_lat");

  -[NSMutableDictionary setObject:forKey:](v14, "setObject:forKey:", v12, @"min_long");
  -[NSMutableDictionary setObject:forKey:](v14, "setObject:forKey:", v12, @"max_long");

  v15 = objc_alloc(&OBJC_CLASS___NSNumber);
  id v16 = [v11 persistentID];

  v17 = -[NSNumber initWithLongLong:](v15, "initWithLongLong:", v16);
  -[NSMutableDictionary setObject:forKey:](v14, "setObject:forKey:", v17, @"location_pid");

  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___LocationIndex;
  v18 = -[SQLiteEntity initWithPropertyValues:inDatabase:](&v20, "initWithPropertyValues:inDatabase:", v14, v10);

  return v18;
}

+ (id)insertIndexedLocationWithLatitude:(id)a3 longitude:(id)a4 forLocation:(id)a5 database:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [objc_alloc((Class)a1) initWithLatitude:v13 longitude:v12 forLocation:v11 database:v10];

  return v14;
}

+ (id)locationsByPassUniqueIDWithBoundingBox:(id)a3 inDatabase:(id)a4
{
  double var3 = a3.var3;
  double var2 = a3.var2;
  double var1 = a3.var1;
  double var0 = a3.var0;
  id v9 = a4;
  id v10 = -[NSNumber initWithDouble:](objc_alloc(&OBJC_CLASS___NSNumber), "initWithDouble:", var0);
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:greaterThanOrEqualToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:greaterThanOrEqualToValue:",  @"min_lat",  v10));

  id v12 = -[NSNumber initWithDouble:](objc_alloc(&OBJC_CLASS___NSNumber), "initWithDouble:", var1);
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:lessThanOrEqualToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:lessThanOrEqualToValue:",  @"max_lat",  v12));

  id v14 = -[NSNumber initWithDouble:](objc_alloc(&OBJC_CLASS___NSNumber), "initWithDouble:", var2);
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:greaterThanOrEqualToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:greaterThanOrEqualToValue:",  @"min_long",  v14));

  id v16 = -[NSNumber initWithDouble:](objc_alloc(&OBJC_CLASS___NSNumber), "initWithDouble:", var3);
  v17 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:lessThanOrEqualToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:lessThanOrEqualToValue:",  @"max_long",  v16));

  v35[0] = v11;
  v35[1] = v13;
  v35[2] = v15;
  v35[3] = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v35, 4LL));
  v19 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v18));
  objc_super v20 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v9 predicate:v19]);

  v21 = objc_alloc_init(&OBJC_CLASS___PDLocationMap);
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[LocationIndex propertySettersForLocation](&OBJC_CLASS___LocationIndex, "propertySettersForLocation"));
  v23 = (void *)objc_claimAutoreleasedReturnValue([v22 allKeys]);
  id v24 = [v23 mutableCopy];

  [v24 addObject:@"pass.unique_id"];
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = sub_1003DABF4;
  v30[3] = &unk_10065C7E0;
  id v33 = a1;
  id v34 = [v24 indexOfObject:@"pass.unique_id"];
  id v31 = v22;
  v25 = v21;
  v32 = v25;
  id v26 = v22;
  [v20 enumeratePersistentIDsAndProperties:v24 usingBlock:v30];
  v27 = v32;
  v28 = v25;

  return v28;
}

+ (id)propertySettersForLocation
{
  v3[0] = @"location.latitude";
  v3[1] = @"location.longitude";
  v4[0] = &stru_10065C800;
  v4[1] = &stru_10065C820;
  v3[2] = @"location.max_distance";
  v3[3] = @"location.altitude";
  v4[2] = &stru_10065C840;
  v4[3] = &stru_10065C860;
  v3[4] = @"location.name";
  v3[5] = @"location.relevant_text";
  v4[4] = &stru_10065C880;
  v4[5] = &stru_10065C8A0;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  6LL));
}

@end