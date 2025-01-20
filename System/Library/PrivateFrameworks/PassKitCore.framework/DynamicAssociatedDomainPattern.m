@interface DynamicAssociatedDomainPattern
+ (id)_objectsWithQuery:(id)a3 inDatabase:(id)a4;
+ (id)_predicateForDomainPID:(int64_t)a3;
+ (id)_propertySetters;
+ (id)_propertyValuesFor:(id)a3;
+ (id)databaseTable;
+ (id)patternsForDomainPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deletePatternsForDomainPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)insertPatterns:(id)a3 forDomainPID:(int64_t)a4 inDatabase:(id)a5;
- (DynamicAssociatedDomainPattern)initWithPattern:(id)a3 forDomainPID:(int64_t)a4 inDatabase:(id)a5;
@end

@implementation DynamicAssociatedDomainPattern

+ (id)databaseTable
{
  return @"egg";
}

- (DynamicAssociatedDomainPattern)initWithPattern:(id)a3 forDomainPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v11 = objc_msgSend((id)objc_opt_class(self, v10), "_propertyValuesFor:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  [v12 setObjectOrNull:v13 forKey:@"a"];

  v14 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v12, v8);
  return v14;
}

+ (void)insertPatterns:(id)a3 forDomainPID:(int64_t)a4 inDatabase:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      v12 = 0LL;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v7);
        }

        v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v10);
  }
}

+ (id)patternsForDomainPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForDomainPID:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _objectsWithQuery:v8 inDatabase:v6]);

  return v9;
}

+ (id)_objectsWithQuery:(id)a3 inDatabase:(id)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a1 _propertySetters]);
  id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10010988C;
  v13[3] = &unk_100639BF0;
  id v16 = a1;
  id v14 = v6;
  id v9 = v7;
  __int128 v15 = v9;
  id v10 = v6;
  [v5 enumeratePersistentIDsAndProperties:v8 usingBlock:v13];

  if (-[NSMutableArray count](v9, "count")) {
    id v11 = -[NSMutableArray copy](v9, "copy");
  }
  else {
    id v11 = 0LL;
  }

  return v11;
}

+ (void)deletePatternsForDomainPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForDomainPID:a3]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

+ (id)_predicateForDomainPID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"a",  v3));

  return v4;
}

+ (id)_propertyValuesFor:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 uri]);

  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v5, @"b");
  return v4;
}

+ (id)_propertySetters
{
  id v3 = @"b";
  v4 = &stru_100644558;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v4,  &v3,  1LL));
}

@end