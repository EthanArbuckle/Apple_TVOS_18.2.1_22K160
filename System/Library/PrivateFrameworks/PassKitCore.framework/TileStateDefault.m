@interface TileStateDefault
+ (id)_predicateForBaseState:(id)a3;
+ (id)_predicateForBaseStatePID:(int64_t)a3;
+ (id)databaseTable;
+ (id)insertState:(id)a3 forBaseState:(id)a4 inDatabase:(id)a5;
+ (void)deleteEntitiesForBaseState:(id)a3 inDatabase:(id)a4;
+ (void)inflateState:(id)a3 forBaseStatePID:(int64_t)a4 inDatabase:(id)a5;
- (BOOL)deleteFromDatabase;
- (TileStateDefault)initWithState:(id)a3 forBaseState:(id)a4 forAccessory:(id)a5 forSecondaryAccessory:(id)a6 inDatabase:(id)a7;
- (id)accessory;
- (id)secondaryAccessory;
@end

@implementation TileStateDefault

- (TileStateDefault)initWithState:(id)a3 forBaseState:(id)a4 forAccessory:(id)a5 forSecondaryAccessory:(id)a6 inDatabase:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  v17 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setEntityPIDOrNull:forKey:](v17, "setEntityPIDOrNull:forKey:", v15, @"state_pid");

  v18 = (void *)objc_claimAutoreleasedReturnValue([v16 title]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v17, "setObjectOrNull:forKey:", v18, @"title");

  v19 = (void *)objc_claimAutoreleasedReturnValue([v16 body]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v17, "setObjectOrNull:forKey:", v19, @"body");

  -[NSMutableDictionary setEntityPIDOrNull:forKey:](v17, "setEntityPIDOrNull:forKey:", v14, @"accessory_pid");
  -[NSMutableDictionary setEntityPIDOrNull:forKey:]( v17,  "setEntityPIDOrNull:forKey:",  v13,  @"secondary_accessory_pid");

  v20 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v17, v12);
  return v20;
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
    v22 = sub_1000819C8;
    v23 = sub_1000819D8;
    id v24 = 0LL;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1000819E0;
    v13[3] = &unk_10063E418;
    id v14 = v8;
    id v15 = v10;
    v17 = &v19;
    id v18 = a1;
    id v16 = v9;
    sub_1002CCC5C((uint64_t)v15, v13);
    id v11 = (id)v20[5];

    _Block_object_dispose(&v19, 8);
  }

  return v11;
}

+ (void)inflateState:(id)a3 forBaseStatePID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v8)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForBaseStatePID:a4]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryWithDatabase:predicate:orderingProperties:orderingDirections:limit:]( &OBJC_CLASS___TileStateDefault,  "queryWithDatabase:predicate:orderingProperties:orderingDirections:limit:",  v9,  v10,  0LL,  0LL,  1LL));

    v16[0] = @"title";
    v16[1] = @"body";
    v16[2] = @"accessory_pid";
    v16[3] = @"secondary_accessory_pid";
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v16, 4LL));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100081C50;
    v13[3] = &unk_100639E18;
    id v14 = v8;
    id v15 = v9;
    [v11 enumeratePersistentIDsAndProperties:v12 usingBlock:v13];
  }
}

+ (void)deleteEntitiesForBaseState:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForBaseState:a3]);
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryWithDatabase:predicate:]( &OBJC_CLASS___TileStateDefault,  "queryWithDatabase:predicate:",  v6,  v8));

  [v7 deleteAllEntities];
}

- (BOOL)deleteFromDatabase
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TileStateDefault accessory](self, "accessory"));
  [v3 deleteFromDatabase];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TileStateDefault secondaryAccessory](self, "secondaryAccessory"));
  [v4 deleteFromDatabase];

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TileStateDefault;
  return -[SQLiteEntity deleteFromDatabase](&v6, "deleteFromDatabase");
}

+ (id)databaseTable
{
  return @"pass_tile_state_default";
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

- (id)accessory
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"accessory_pid"));
  if (v3) {
    v4 = -[SQLiteEntity initWithPersistentID:inDatabase:]( [TileAccessory alloc],  "initWithPersistentID:inDatabase:",  [v3 longLongValue],  self->super._database);
  }
  else {
    v4 = 0LL;
  }

  return v4;
}

- (id)secondaryAccessory
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"secondary_accessory_pid"));
  if (v3) {
    v4 = -[SQLiteEntity initWithPersistentID:inDatabase:]( [TileAccessory alloc],  "initWithPersistentID:inDatabase:",  [v3 longLongValue],  self->super._database);
  }
  else {
    v4 = 0LL;
  }

  return v4;
}

@end