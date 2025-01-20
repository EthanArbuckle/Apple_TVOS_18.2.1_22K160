@interface PassLocationSource
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertPassLocationSourceWithPass:(id)a3 locationSource:(id)a4 inDatabase:(id)a5;
+ (id)locationSourcePIDPredicate:(id)a3;
+ (id)passPIDPredicate:(unint64_t)a3;
+ (id)queryWithDatabase:(id)a3 locationSourcePID:(unint64_t)a4;
+ (id)queryWithDatabase:(id)a3 passPID:(unint64_t)a4;
+ (id)queryWithDatabase:(id)a3 passPID:(unint64_t)a4 locationSourcePID:(unint64_t)a5;
- (BOOL)deleteFromDatabase;
- (PassLocationSource)initWithPassPID:(unint64_t)a3 locationSourcePID:(unint64_t)a4 inDatabase:(id)a5;
@end

@implementation PassLocationSource

+ (id)databaseTable
{
  return @"pass_location_source";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class(&OBJC_CLASS___Pass, a2) == a3) {
    return @"pass_pid";
  }
  if ((Class)objc_opt_class(&OBJC_CLASS___LocationSource, v4) == a3) {
    return @"location_source_pid";
  }
  return 0LL;
}

- (PassLocationSource)initWithPassPID:(unint64_t)a3 locationSourcePID:(unint64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  [v9 setObject:v10 forKey:@"pass_pid"];

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  [v9 setObject:v11 forKey:@"location_source_pid"];

  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___PassLocationSource;
  v12 = -[SQLiteEntity initWithPropertyValues:inDatabase:](&v14, "initWithPropertyValues:inDatabase:", v9, v8);

  return v12;
}

+ (id)insertPassLocationSourceWithPass:(id)a3 locationSource:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc((Class)a1);
  id v12 = [v10 persistentID];

  id v13 = [v9 persistentID];
  id v14 = [v11 initWithPassPID:v12 locationSourcePID:v13 inDatabase:v8];

  return v14;
}

+ (id)passPIDPredicate:(unint64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"pass_pid",  v3));

  return v4;
}

+ (id)locationSourcePIDPredicate:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"location_source_pid",  a3);
}

+ (id)queryWithDatabase:(id)a3 passPID:(unint64_t)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 passPIDPredicate:a4]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);

  return v8;
}

+ (id)queryWithDatabase:(id)a3 locationSourcePID:(unint64_t)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 locationSourcePIDPredicate:v7]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  return v9;
}

+ (id)queryWithDatabase:(id)a3 passPID:(unint64_t)a4 locationSourcePID:(unint64_t)a5
{
  id v8 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 passPIDPredicate:a4]);
  v16[0] = v9;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a5));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([a1 locationSourcePIDPredicate:v10]);
  v16[1] = v11;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v16, 2LL));
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v12));
  id v14 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v8 predicate:v13]);

  return v14;
}

- (BOOL)deleteFromDatabase
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"location_source_pid"));
  v5 = (void *)objc_opt_class(self, v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  id v8 = objc_msgSend((id)objc_opt_class(self, v7), "locationSourcePIDPredicate:", v3);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 queryWithDatabase:v6 predicate:v9]);

  if ((uint64_t)[v10 countOfEntities] <= 1)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[LocationSource anyInDatabase:withLocationSourcePID:]( &OBJC_CLASS___LocationSource,  "anyInDatabase:withLocationSourcePID:",  v11,  v3));

    [v12 deleteFromDatabase];
  }

  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___PassLocationSource;
  BOOL v13 = -[SQLiteEntity deleteFromDatabase](&v15, "deleteFromDatabase");

  return v13;
}

@end