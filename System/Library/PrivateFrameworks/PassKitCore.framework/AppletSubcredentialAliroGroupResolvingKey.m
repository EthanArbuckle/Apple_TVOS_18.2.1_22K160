@interface AppletSubcredentialAliroGroupResolvingKey
+ (id)_aliroGroupResolvingKeysInDatabase:(id)a3 withPredicate:(id)a4;
+ (id)_predicateForAppletSubcredentialPID:(int64_t)a3;
+ (id)aliroGroupResolvingKeysInDatabase:(id)a3 forAppletSubcredentialPID:(int64_t)a4;
+ (id)databaseTable;
+ (id)insertAliroGroupResolvingKeys:(id)a3 withAppletSubcredential:(id)a4 inDatabase:(id)a5;
+ (void)deleteEntitiesInDatabase:(id)a3 forAppletSubcredentialPID:(int64_t)a4;
- (AppletSubcredentialAliroGroupResolvingKey)initWithData:(id)a3 forAppletSubcredentialPID:(int64_t)a4 database:(id)a5;
@end

@implementation AppletSubcredentialAliroGroupResolvingKey

+ (id)databaseTable
{
  return @"whitney_agrk";
}

+ (id)aliroGroupResolvingKeysInDatabase:(id)a3 forAppletSubcredentialPID:(int64_t)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForAppletSubcredentialPID:a4]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _aliroGroupResolvingKeysInDatabase:v6 withPredicate:v7]);

  return v8;
}

+ (id)_aliroGroupResolvingKeysInDatabase:(id)a3 withPredicate:(id)a4
{
  if (!a4) {
    return 0LL;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "queryWithDatabase:predicate:", a3));
  v5 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  v11 = @"data";
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v11, 1LL));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10030EA44;
  v10[3] = &unk_10063C0D0;
  v10[4] = v5;
  [v4 enumeratePersistentIDsAndProperties:v6 usingBlock:v10];

  if (-[NSMutableSet count](v5, "count")) {
    v7 = v5;
  }
  else {
    v7 = 0LL;
  }
  v8 = v7;

  return v8;
}

+ (void)deleteEntitiesInDatabase:(id)a3 forAppletSubcredentialPID:(int64_t)a4
{
  id v6 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForAppletSubcredentialPID:a4]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

+ (id)insertAliroGroupResolvingKeys:(id)a3 withAppletSubcredential:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [a4 persistentID];
  v11 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v8 count]);
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id v12 = v8;
  id v13 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v24;
    do
    {
      v16 = 0LL;
      do
      {
        if (*(void *)v24 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v23 + 1) + 8LL * (void)v16);
        id v18 = objc_alloc((Class)a1);
        id v19 = objc_msgSend(v18, "initWithData:forAppletSubcredentialPID:database:", v17, v10, v9, (void)v23);
        -[NSMutableArray safelyAddObject:](v11, "safelyAddObject:", v19);

        v16 = (char *)v16 + 1;
      }

      while (v14 != v16);
      id v14 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }

    while (v14);
  }

  if (-[NSMutableArray count](v11, "count")) {
    v20 = v11;
  }
  else {
    v20 = 0LL;
  }
  v21 = v20;

  return v21;
}

- (AppletSubcredentialAliroGroupResolvingKey)initWithData:(id)a3 forAppletSubcredentialPID:(int64_t)a4 database:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v10,  "setObject:forKeyedSubscript:",  v12,  @"applet_subcredential_pid");

  if (v9) {
    id v13 = v9;
  }
  else {
    id v13 = v11;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v13, @"data");

  id v14 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v10, v8);
  return v14;
}

+ (id)_predicateForAppletSubcredentialPID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"applet_subcredential_pid",  v3));

  return v4;
}

@end