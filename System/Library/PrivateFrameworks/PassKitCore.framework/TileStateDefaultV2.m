@interface TileStateDefaultV2
+ (id)_predicateForBaseState:(id)a3;
+ (id)_predicateForBaseStatePID:(int64_t)a3;
+ (id)databaseTable;
+ (id)insertState:(id)a3 forBaseState:(id)a4 inDatabase:(id)a5;
+ (void)deleteEntitiesForBaseState:(id)a3 inDatabase:(id)a4;
+ (void)inflateState:(id)a3 forBaseStatePID:(int64_t)a4 inDatabase:(id)a5;
- (BOOL)deleteFromDatabase;
- (TileStateDefaultV2)initWithState:(id)a3 forBaseState:(id)a4 forTitleValue:(id)a5 forBodyValue:(id)a6 forBodyImage:(id)a7 forFooterValue:(id)a8 forAccessory:(id)a9 forSecondaryAccessory:(id)a10 inDatabase:(id)a11;
- (id)accessory;
- (id)bodyImage;
- (id)bodyValue;
- (id)footerValue;
- (id)secondaryAccessory;
- (id)titleValue;
@end

@implementation TileStateDefaultV2

- (TileStateDefaultV2)initWithState:(id)a3 forBaseState:(id)a4 forTitleValue:(id)a5 forBodyValue:(id)a6 forBodyImage:(id)a7 forFooterValue:(id)a8 forAccessory:(id)a9 forSecondaryAccessory:(id)a10 inDatabase:(id)a11
{
  id v31 = a11;
  id v30 = a10;
  id v17 = a9;
  id v18 = a8;
  id v19 = a7;
  id v20 = a6;
  id v21 = a5;
  id v22 = a4;
  id v23 = a3;
  v24 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setEntityPIDOrNull:forKey:](v24, "setEntityPIDOrNull:forKey:", v22, @"state_pid");

  -[NSMutableDictionary setEntityPIDOrNull:forKey:](v24, "setEntityPIDOrNull:forKey:", v21, @"title_value_pid");
  -[NSMutableDictionary setEntityPIDOrNull:forKey:](v24, "setEntityPIDOrNull:forKey:", v20, @"body_value_pid");

  -[NSMutableDictionary setEntityPIDOrNull:forKey:](v24, "setEntityPIDOrNull:forKey:", v19, @"body_image_pid");
  -[NSMutableDictionary setEntityPIDOrNull:forKey:](v24, "setEntityPIDOrNull:forKey:", v18, @"footer_value_pid");

  id v25 = [v23 preferredStyle];
  uint64_t v26 = PKPassTileStateStyleToString(v25);
  v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
  -[NSMutableDictionary setObjectOrNull:forKey:](v24, "setObjectOrNull:forKey:", v27, @"preferred_style");

  -[NSMutableDictionary setEntityPIDOrNull:forKey:](v24, "setEntityPIDOrNull:forKey:", v17, @"accessory_pid");
  -[NSMutableDictionary setEntityPIDOrNull:forKey:]( v24,  "setEntityPIDOrNull:forKey:",  v30,  @"secondary_accessory_pid");

  v28 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v24, v31);
  return v28;
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
    id v20 = &v19;
    uint64_t v21 = 0x3032000000LL;
    id v22 = sub_1002E2C54;
    id v23 = sub_1002E2C64;
    id v24 = 0LL;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1002E2C6C;
    v13[3] = &unk_10063E418;
    id v14 = v8;
    id v15 = v10;
    id v17 = &v19;
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
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryWithDatabase:predicate:orderingProperties:orderingDirections:limit:]( &OBJC_CLASS___TileStateDefaultV2,  "queryWithDatabase:predicate:orderingProperties:orderingDirections:limit:",  v9,  v10,  0LL,  0LL,  1LL));

    v16[0] = @"title_value_pid";
    v16[1] = @"body_value_pid";
    v16[2] = @"body_image_pid";
    v16[3] = @"footer_value_pid";
    v16[4] = @"preferred_style";
    v16[5] = @"accessory_pid";
    v16[6] = @"secondary_accessory_pid";
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v16, 7LL));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1002E304C;
    v13[3] = &unk_100639E18;
    id v14 = v9;
    id v15 = v8;
    [v11 enumeratePersistentIDsAndProperties:v12 usingBlock:v13];
  }
}

+ (void)deleteEntitiesForBaseState:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForBaseState:a3]);
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryWithDatabase:predicate:]( &OBJC_CLASS___TileStateDefaultV2,  "queryWithDatabase:predicate:",  v6,  v8));

  [v7 deleteAllEntities];
}

- (BOOL)deleteFromDatabase
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TileStateDefaultV2 titleValue](self, "titleValue"));
  [v3 deleteFromDatabase];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TileStateDefaultV2 bodyValue](self, "bodyValue"));
  [v4 deleteFromDatabase];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TileStateDefaultV2 bodyImage](self, "bodyImage"));
  [v5 deleteFromDatabase];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TileStateDefaultV2 footerValue](self, "footerValue"));
  [v6 deleteFromDatabase];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TileStateDefaultV2 accessory](self, "accessory"));
  [v7 deleteFromDatabase];

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TileStateDefaultV2 secondaryAccessory](self, "secondaryAccessory"));
  [v8 deleteFromDatabase];

  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___TileStateDefaultV2;
  return -[SQLiteEntity deleteFromDatabase](&v10, "deleteFromDatabase");
}

+ (id)databaseTable
{
  return @"pass_tile_state_default_v2";
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

- (id)titleValue
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"title_value_pid"));
  if (v3) {
    v4 = -[SQLiteEntity initWithPersistentID:inDatabase:]( [TileValue alloc],  "initWithPersistentID:inDatabase:",  [v3 longLongValue],  self->super._database);
  }
  else {
    v4 = 0LL;
  }

  return v4;
}

- (id)bodyValue
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"body_value_pid"));
  if (v3) {
    v4 = -[SQLiteEntity initWithPersistentID:inDatabase:]( [TileValue alloc],  "initWithPersistentID:inDatabase:",  [v3 longLongValue],  self->super._database);
  }
  else {
    v4 = 0LL;
  }

  return v4;
}

- (id)bodyImage
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"body_image_pid"));
  if (v3) {
    v4 = -[SQLiteEntity initWithPersistentID:inDatabase:]( [TileImage alloc],  "initWithPersistentID:inDatabase:",  [v3 longLongValue],  self->super._database);
  }
  else {
    v4 = 0LL;
  }

  return v4;
}

- (id)footerValue
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"footer_value_pid"));
  if (v3) {
    v4 = -[SQLiteEntity initWithPersistentID:inDatabase:]( [TileValue alloc],  "initWithPersistentID:inDatabase:",  [v3 longLongValue],  self->super._database);
  }
  else {
    v4 = 0LL;
  }

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