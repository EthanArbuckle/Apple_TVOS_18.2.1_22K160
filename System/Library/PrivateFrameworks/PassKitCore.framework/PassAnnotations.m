@interface PassAnnotations
+ (id)_passAnnotationsIDPredicate:(id)a3;
+ (id)_predicateForPass:(id)a3;
+ (id)_predicateForPassPID:(int64_t)a3;
+ (id)_propertySettersForPassAnnotations;
+ (id)anyInDatabase:(id)a3 withPassID:(id)a4;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertPassAnnotationsForSortingState:(int64_t)a3 forPass:(id)a4 inDatabase:(id)a5;
+ (id)insertPassAnnotationsForSortingState:(int64_t)a3 forPassPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)queryWithDatabase:(id)a3 passAnnotationsPID:(unint64_t)a4;
+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4;
+ (void)deleteEntitiesForPass:(id)a3 inDatabase:(id)a4;
+ (void)updateAnnotationsOfExpiredIrrelevantOrVoidedPassesWithState:(int64_t)a3 inDatabase:(id)a4;
- (BOOL)deleteFromDatabase;
- (PassAnnotations)initWithPassAnnotationsForSortingState:(int64_t)a3 forPass:(id)a4 inDatabase:(id)a5;
- (PassAnnotations)initWithPassAnnotationsForSortingState:(int64_t)a3 forPassPID:(int64_t)a4 inDatabase:(id)a5;
- (id)archivedTimestamp;
- (id)passAnnotations;
- (int64_t)sortingState;
- (void)updateArchivedTimestamp:(id)a3;
- (void)updateSortingState:(int64_t)a3;
@end

@implementation PassAnnotations

+ (id)databaseTable
{
  return @"pass_annotations";
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

+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4
{
  id v5 = a4;
}

- (PassAnnotations)initWithPassAnnotationsForSortingState:(int64_t)a3 forPass:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v11 = [v9 persistentID];

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v11));
  [v10 setObject:v12 forKey:@"pass_pid"];

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  [v10 setObject:v13 forKey:@"sorting_state"];

  if (a3 == 1)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
    v15 = (void *)_SQLValueForDate(v14);
    [v10 setObjectOrNull:v15 forKey:@"archived_timestamp"];
  }

  else
  {
    [v10 setObjectOrNull:0 forKey:@"archived_timestamp"];
  }

  v16 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v10, v8);

  return v16;
}

- (PassAnnotations)initWithPassAnnotationsForSortingState:(int64_t)a3 forPassPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  [v9 setObject:v10 forKey:@"pass_pid"];

  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  [v9 setObject:v11 forKey:@"sorting_state"];

  if (a3 == 1)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
    v13 = (void *)_SQLValueForDate(v12);
    [v9 setObjectOrNull:v13 forKey:@"archived_timestamp"];
  }

  else
  {
    [v9 setObjectOrNull:0 forKey:@"archived_timestamp"];
  }

  v14 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v9, v8);

  return v14;
}

+ (id)insertPassAnnotationsForSortingState:(int64_t)a3 forPass:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = [objc_alloc((Class)a1) initWithPassAnnotationsForSortingState:a3 forPass:v9 inDatabase:v8];

  return v10;
}

+ (id)insertPassAnnotationsForSortingState:(int64_t)a3 forPassPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = [objc_alloc((Class)a1) initWithPassAnnotationsForSortingState:a3 forPassPID:a4 inDatabase:v8];

  return v9;
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

+ (id)_passAnnotationsIDPredicate:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"pass.unique_id",  a3);
}

+ (void)deleteEntitiesForPass:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForPass:a3]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

+ (id)anyInDatabase:(id)a3 withPassID:(id)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _passAnnotationsIDPredicate:a4]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  return v8;
}

+ (id)queryWithDatabase:(id)a3 passAnnotationsPID:(unint64_t)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPassPID:a4]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);

  return v8;
}

+ (void)updateAnnotationsOfExpiredIrrelevantOrVoidedPassesWithState:(int64_t)a3 inDatabase:(id)a4
{
  id v5 = a4;
  uint64_t v6 = objc_claimAutoreleasedReturnValue(+[Pass predicateForInMainStack](&OBJC_CLASS___Pass, "predicateForInMainStack"));
  v7 = (void *)v6;
  if (a3 == 1)
  {
    v18[0] = v6;
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[Pass predicateForStagedForExpiration](&OBJC_CLASS___Pass, "predicateForStagedForExpiration"));
    v18[1] = v8;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v18, 2LL));
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAnyPredicates:",  v9));
  }

  else
  {
    v17[0] = v6;
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[Pass predicateForExpired](&OBJC_CLASS___Pass, "predicateForExpired"));
    v17[1] = v8;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[Pass predicateForManuallyRecovered](&OBJC_CLASS___Pass, "predicateForManuallyRecovered"));
    v17[2] = v9;
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v17, 3LL));
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAnyPredicates:",  v11));
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryWithDatabase:predicate:]( &OBJC_CLASS___Pass,  "queryWithDatabase:predicate:",  v5,  v10));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10028117C;
  v14[3] = &unk_100651240;
  id v15 = v5;
  int64_t v16 = a3;
  id v13 = v5;
  +[Pass enumeratePassesForQuery:withHandler:](&OBJC_CLASS___Pass, "enumeratePassesForQuery:withHandler:", v12, v14);
}

- (id)passAnnotations
{
  v3 = objc_alloc_init(&OBJC_CLASS___PKPassAnnotations);
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[PassAnnotations _propertySettersForPassAnnotations]( &OBJC_CLASS___PassAnnotations,  "_propertySettersForPassAnnotations"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allKeys]);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100281494;
  v11[3] = &unk_100639EE8;
  id v12 = v4;
  uint64_t v6 = v3;
  id v13 = v6;
  id v7 = v4;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v5, v11);

  id v8 = v13;
  id v9 = v6;

  return v9;
}

- (int64_t)sortingState
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"sorting_state"));
  id v3 = [v2 integerValue];

  return (int64_t)v3;
}

- (id)archivedTimestamp
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"archived_timestamp"));
  id v3 = (void *)_DateForSQLValue(v2);

  return v3;
}

- (void)updateSortingState:(int64_t)a3
{
  if (-[PassAnnotations sortingState](self, "sortingState") != a3)
  {
    if (a3 == 1)
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
      uint64_t v6 = (void *)_SQLValueForDate(v5);
      -[SQLiteEntity setValue:forProperty:](self, "setValue:forProperty:", v6, @"archived_timestamp");
    }

    id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
    -[SQLiteEntity setValue:forProperty:](self, "setValue:forProperty:", v7, @"sorting_state");
  }

- (void)updateArchivedTimestamp:(id)a3
{
  id v4 = (id)_SQLValueForDate(a3);
  -[SQLiteEntity setValue:forProperty:](self, "setValue:forProperty:", v4, @"archived_timestamp");
}

+ (id)_propertySettersForPassAnnotations
{
  v3[0] = @"sorting_state";
  v3[1] = @"archived_timestamp";
  v4[0] = &stru_100651280;
  v4[1] = &stru_1006512A0;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  2LL));
}

- (BOOL)deleteFromDatabase
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PassAnnotations;
  return -[SQLiteEntity deleteFromDatabase](&v3, "deleteFromDatabase");
}

@end