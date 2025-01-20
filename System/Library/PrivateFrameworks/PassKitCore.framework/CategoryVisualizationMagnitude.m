@interface CategoryVisualizationMagnitude
+ (id)_magnitudesMatchingQuery:(id)a3;
+ (id)_predicateForBucket:(int64_t)a3;
+ (id)_predicateForPID:(id)a3;
+ (id)_predicateForPassUniqueID:(id)a3;
+ (id)_predicateForPassUniqueID:(id)a3 bucket:(int64_t)a4;
+ (id)_propertySetters;
+ (id)_propertyValuesForMagnitude:(id)a3;
+ (id)anyInDatabase:(id)a3 withPID:(id)a4;
+ (id)databaseTable;
+ (id)insertMagnitude:(id)a3 inDatabase:(id)a4;
+ (id)insertOrUpdateMagnitude:(id)a3 inDatabase:(id)a4;
+ (id)magnitudesForPassUniqueIdentifier:(id)a3 inDatabase:(id)a4;
+ (void)deleteAnyInDatabase:(id)a3 forPassUniqueID:(id)a4;
- (CategoryVisualizationMagnitude)initWithMagnitude:(id)a3 inDatabase:(id)a4;
- (id)magnitude;
- (void)updateWithMagnitude:(id)a3;
@end

@implementation CategoryVisualizationMagnitude

+ (id)databaseTable
{
  return @"guavas";
}

- (CategoryVisualizationMagnitude)initWithMagnitude:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = objc_msgSend((id)objc_opt_class(self, v8), "_propertyValuesForMagnitude:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  v11 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v10, v6);
  return v11;
}

+ (id)anyInDatabase:(id)a3 withPID:(id)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPID:a4]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  return v8;
}

+ (id)magnitudesForPassUniqueIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPassUniqueID:a3]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _magnitudesMatchingQuery:v8]);
  return v9;
}

+ (id)insertMagnitude:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [objc_alloc((Class)a1) initWithMagnitude:v7 inDatabase:v6];

  return v8;
}

+ (id)insertOrUpdateMagnitude:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 passUniqueIdentifier]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_predicateForPassUniqueID:bucket:", v8, objc_msgSend(v7, "bucket")));

  v10 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v9]);
  if (v10)
  {
    v11 = v10;
    [v10 updateWithMagnitude:v7];
  }

  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue([a1 insertMagnitude:v7 inDatabase:v6]);
  }

  return v11;
}

+ (void)deleteAnyInDatabase:(id)a3 forPassUniqueID:(id)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPassUniqueID:a4]);
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);

  [v8 deleteAllEntities];
}

- (void)updateWithMagnitude:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend((id)objc_opt_class(self, v5), "_propertyValuesForMagnitude:", v4);
  id v7 = (id)objc_claimAutoreleasedReturnValue(v6);

  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v7);
}

- (id)magnitude
{
  v3 = objc_alloc_init(&OBJC_CLASS___PKCategoryVisualizationMagnitude);
  id v5 = objc_msgSend((id)objc_opt_class(self, v4), "_propertySetters");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100045724;
  v13[3] = &unk_100638EF0;
  v13[4] = self;
  id v14 = v6;
  id v8 = v3;
  v15 = v8;
  id v9 = v6;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v7, v13);

  v10 = v15;
  v11 = v8;

  return v11;
}

+ (id)_magnitudesMatchingQuery:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([a1 _propertySetters]);
  id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 allKeys]);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10004586C;
  v12[3] = &unk_100639BF0;
  id v14 = v6;
  id v15 = a1;
  id v13 = v5;
  id v8 = v6;
  id v9 = v5;
  [v4 enumeratePersistentIDsAndProperties:v7 usingBlock:v12];

  id v10 = -[NSMutableSet copy](v8, "copy");
  return v10;
}

+ (id)_predicateForPassUniqueID:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"a",  a3);
}

+ (id)_predicateForPassUniqueID:(id)a3 bucket:(int64_t)a4
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPassUniqueID:a3]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForBucket:a4]);
  v11[0] = v6;
  v11[1] = v7;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v11, 2LL));
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v8));

  return v9;
}

+ (id)_predicateForPID:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"pid",  a3);
}

+ (id)_predicateForBucket:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"b",  v3));

  return v4;
}

+ (id)_propertyValuesForMagnitude:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 passUniqueIdentifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v5, @"a");

  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v3 bucket]));
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v6, @"b");

  [v3 magnitude];
  double v8 = v7;

  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v8));
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v9, @"c");

  id v10 = -[NSMutableDictionary copy](v4, "copy");
  return v10;
}

+ (id)_propertySetters
{
  v3[0] = @"a";
  v3[1] = @"b";
  v4[0] = &stru_10063C348;
  v4[1] = &stru_10063C368;
  v3[2] = @"c";
  v4[2] = &stru_10063C388;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  3LL));
}

@end