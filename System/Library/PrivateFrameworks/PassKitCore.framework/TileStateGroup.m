@interface TileStateGroup
+ (id)_predicateForBaseState:(id)a3;
+ (id)_predicateForBaseStatePID:(int64_t)a3;
+ (id)databaseTable;
+ (id)insertState:(id)a3 forBaseState:(id)a4 inDatabase:(id)a5;
+ (void)deleteEntitiesForBaseState:(id)a3 inDatabase:(id)a4;
+ (void)inflateState:(id)a3 forBaseStatePID:(int64_t)a4 inDatabase:(id)a5;
- (TileStateGroup)initWithState:(id)a3 forBaseState:(id)a4 inDatabase:(id)a5;
@end

@implementation TileStateGroup

- (TileStateGroup)initWithState:(id)a3 forBaseState:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setEntityPIDOrNull:forKey:](v11, "setEntityPIDOrNull:forKey:", v9, @"state_pid");

  v12 = (void *)objc_claimAutoreleasedReturnValue([v10 header]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v11, "setObjectOrNull:forKey:", v12, @"header");

  v13 = (void *)objc_claimAutoreleasedReturnValue([v10 footer]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v11, "setObjectOrNull:forKey:", v13, @"footer");

  v14 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v11, v8);
  return v14;
}

+ (id)insertState:(id)a3 forBaseState:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = 0LL;
  if (v8 && v9)
  {
    uint64_t v19 = 0LL;
    v20 = &v19;
    uint64_t v21 = 0x3032000000LL;
    v22 = sub_1002E9BFC;
    v23 = sub_1002E9C0C;
    id v24 = 0LL;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1002E9C14;
    v13[3] = &unk_10063C260;
    v17 = &v19;
    id v18 = a1;
    id v14 = v8;
    id v15 = v9;
    id v16 = v10;
    sub_1002CCC5C((uint64_t)v16, v13);
    id v11 = (id)v20[5];

    _Block_object_dispose(&v19, 8);
  }

  return v11;
}

+ (void)inflateState:(id)a3 forBaseStatePID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  if (v8)
  {
    id v9 = a5;
    id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForBaseStatePID:a4]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryWithDatabase:predicate:orderingProperties:orderingDirections:limit:]( &OBJC_CLASS___TileStateGroup,  "queryWithDatabase:predicate:orderingProperties:orderingDirections:limit:",  v9,  v10,  0LL,  0LL,  1LL));

    v15[0] = @"header";
    v15[1] = @"footer";
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v15, 2LL));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1002E9DB8;
    v13[3] = &unk_10063C0D0;
    id v14 = v8;
    [v11 enumeratePersistentIDsAndProperties:v12 usingBlock:v13];
  }
}

+ (void)deleteEntitiesForBaseState:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForBaseState:a3]);
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryWithDatabase:predicate:]( &OBJC_CLASS___TileStateGroup,  "queryWithDatabase:predicate:",  v6,  v8));

  [v7 deleteAllEntities];
}

+ (id)databaseTable
{
  return @"pass_tile_state_group";
}

+ (id)_predicateForBaseState:(id)a3
{
  if (a3) {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_predicateForBaseStatePID:", objc_msgSend(a3, "persistentID")));
  }
  else {
    v3 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"state_pid",  0LL));
  }
  return v3;
}

+ (id)_predicateForBaseStatePID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"state_pid",  v3));

  return v4;
}

@end