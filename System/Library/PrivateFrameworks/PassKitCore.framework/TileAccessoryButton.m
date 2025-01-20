@interface TileAccessoryButton
+ (id)_predicateForBaseAccessory:(id)a3;
+ (id)databaseTable;
+ (id)insertAccessory:(id)a3 forBaseAccessory:(id)a4 inDatabase:(id)a5;
+ (void)deleteEntitiesForBaseAccessory:(id)a3 inDatabase:(id)a4;
+ (void)inflateAccessory:(id)a3 forBaseAccessory:(id)a4 inDatabase:(id)a5;
- (TileAccessoryButton)initWithAccessory:(id)a3 forBaseAccessory:(id)a4 inDatabase:(id)a5;
@end

@implementation TileAccessoryButton

- (TileAccessoryButton)initWithAccessory:(id)a3 forBaseAccessory:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setEntityPIDOrNull:forKey:](v11, "setEntityPIDOrNull:forKey:", v9, @"accessory_pid");

  v12 = (void *)objc_claimAutoreleasedReturnValue([v10 title]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v11, "setObjectOrNull:forKey:", v12, @"title");

  id v13 = [v10 isSpinnerEnabled];
  -[NSMutableDictionary setBool:forKey:](v11, "setBool:forKey:", v13, @"spinner_enabled");
  v14 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v11, v8);

  return v14;
}

+ (id)insertAccessory:(id)a3 forBaseAccessory:(id)a4 inDatabase:(id)a5
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
    v22 = sub_1003D4A94;
    v23 = sub_1003D4AA4;
    id v24 = 0LL;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1003D4AAC;
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

+ (void)inflateAccessory:(id)a3 forBaseAccessory:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  if (v8)
  {
    id v9 = a5;
    id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForBaseAccessory:a4]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryWithDatabase:predicate:orderingProperties:orderingDirections:limit:]( &OBJC_CLASS___TileAccessoryButton,  "queryWithDatabase:predicate:orderingProperties:orderingDirections:limit:",  v9,  v10,  0LL,  0LL,  1LL));

    v15[0] = @"title";
    v15[1] = @"spinner_enabled";
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v15, 2LL));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1003D4C50;
    v13[3] = &unk_10063C0D0;
    id v14 = v8;
    [v11 enumeratePersistentIDsAndProperties:v12 usingBlock:v13];
  }
}

+ (void)deleteEntitiesForBaseAccessory:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForBaseAccessory:a3]);
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryWithDatabase:predicate:]( &OBJC_CLASS___TileAccessoryButton,  "queryWithDatabase:predicate:",  v6,  v8));

  [v7 deleteAllEntities];
}

+ (id)_predicateForBaseAccessory:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [a3 persistentID]));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"accessory_pid",  v3));

  return v4;
}

+ (id)databaseTable
{
  return @"pass_tile_accessory_button";
}

@end