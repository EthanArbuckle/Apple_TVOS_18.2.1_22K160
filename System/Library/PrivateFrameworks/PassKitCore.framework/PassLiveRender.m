@interface PassLiveRender
+ (id)_commonDictionaryWithEnabled:(BOOL)a3;
+ (id)_predicateForPassPID:(int64_t)a3;
+ (id)_predicateForPassUniqueID:(id)a3;
+ (id)_propertySettersForPassLiveRender;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertEnabled:(BOOL)a3 forPass:(id)a4 inDatabase:(id)a5;
+ (id)passLiveRenderInDatabase:(id)a3 forPass:(id)a4;
+ (id)passLiveRenderInDatabase:(id)a3 forPassUniqueID:(id)a4;
+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4;
+ (void)deleteEntitiesForPass:(id)a3 inDatabase:(id)a4;
- (BOOL)deleteFromDatabase;
- (PassLiveRender)initWithEnabled:(BOOL)a3 forPassPID:(int64_t)a4 inDatabase:(id)a5;
- (id)passLiveRender;
- (void)updateWithEnabled:(BOOL)a3;
@end

@implementation PassLiveRender

+ (id)databaseTable
{
  return @"pass_live_render";
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

- (PassLiveRender)initWithEnabled:(BOOL)a3 forPassPID:(int64_t)a4 inDatabase:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  id v10 = objc_msgSend((id)objc_opt_class(self, v9), "_commonDictionaryWithEnabled:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  [v11 setObject:v12 forKey:@"pass_pid"];

  v13 = -[SQLiteEntity initWithPropertyValues:inDatabase:]( objc_alloc(&OBJC_CLASS___PassLiveRender),  "initWithPropertyValues:inDatabase:",  v11,  v8);
  return v13;
}

+ (id)insertEnabled:(BOOL)a3 forPass:(id)a4 inDatabase:(id)a5
{
  BOOL v6 = a3;
  id v7 = a4;
  id result = a5;
  if (v7)
  {
    id v9 = result;
    id v10 = -[PassLiveRender initWithEnabled:forPassPID:inDatabase:]( [PassLiveRender alloc],  "initWithEnabled:forPassPID:inDatabase:",  v6,  [v7 persistentID],  result);

    return v10;
  }

  else
  {
    __break(1u);
  }

  return result;
}

- (void)updateWithEnabled:(BOOL)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a3));
  -[SQLiteEntity setValue:forProperty:](self, "setValue:forProperty:", v4, @"enabled");
}

+ (id)passLiveRenderInDatabase:(id)a3 forPassUniqueID:(id)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPassUniqueID:a4]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity anyInDatabase:predicate:]( &OBJC_CLASS___PassLiveRender,  "anyInDatabase:predicate:",  v6,  v7));

  if (v8) {
    id v9 = v8;
  }

  return v8;
}

+ (id)passLiveRenderInDatabase:(id)a3 forPass:(id)a4
{
  id v6 = a3;
  id result = a4;
  if (result)
  {
    id v8 = result;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_predicateForPassPID:", objc_msgSend(result, "persistentID")));
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity anyInDatabase:predicate:]( &OBJC_CLASS___PassLiveRender,  "anyInDatabase:predicate:",  v6,  v9));

    if (v10) {
      id v11 = v10;
    }

    return v10;
  }

  else
  {
    __break(1u);
  }

  return result;
}

+ (id)_commonDictionaryWithEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setBool:forKey:](v4, "setBool:forKey:", v3, @"enabled");
  return v4;
}

+ (void)deleteEntitiesForPass:(id)a3 inDatabase:(id)a4
{
  if (a3)
  {
    id v6 = a4;
    id v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_predicateForPassPID:", objc_msgSend(a3, "persistentID")));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

    [v7 deleteAllEntities];
  }

- (id)passLiveRender
{
  id v3 = -[PKPassLiveRender _init](objc_alloc(&OBJC_CLASS___PKPassLiveRender), "_init");
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[PassLiveRender _propertySettersForPassLiveRender]( &OBJC_CLASS___PassLiveRender,  "_propertySettersForPassLiveRender"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allKeys]);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10025D190;
  v11[3] = &unk_100639EE8;
  id v12 = v4;
  id v6 = v3;
  id v13 = v6;
  id v7 = v4;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v5, v11);

  id v8 = v13;
  id v9 = v6;

  return v9;
}

+ (id)_predicateForPassPID:(int64_t)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"pass_pid",  v3));

  return v4;
}

+ (id)_predicateForPassUniqueID:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"pass.unique_id",  a3);
}

+ (id)_propertySettersForPassLiveRender
{
  id v3 = @"enabled";
  id v4 = &stru_10064FFB0;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v4,  &v3,  1LL));
}

- (BOOL)deleteFromDatabase
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PassLiveRender;
  return -[SQLiteEntity deleteFromDatabase](&v3, "deleteFromDatabase");
}

@end