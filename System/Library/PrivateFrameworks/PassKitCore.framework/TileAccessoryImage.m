@interface TileAccessoryImage
+ (id)_predicateForBaseAccessory:(id)a3;
+ (id)databaseTable;
+ (id)insertAccessory:(id)a3 forBaseAccessory:(id)a4 inDatabase:(id)a5;
+ (void)deleteEntitiesForBaseAccessory:(id)a3 inDatabase:(id)a4;
+ (void)inflateAccessory:(id)a3 forBaseAccessory:(id)a4 inDatabase:(id)a5;
- (BOOL)deleteFromDatabase;
- (TileAccessoryImage)initWithAccessory:(id)a3 forBaseAccessory:(id)a4 forImage:(id)a5 inDatabase:(id)a6;
- (id)image;
@end

@implementation TileAccessoryImage

- (TileAccessoryImage)initWithAccessory:(id)a3 forBaseAccessory:(id)a4 forImage:(id)a5 inDatabase:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  v12 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setEntityPIDOrNull:forKey:](v12, "setEntityPIDOrNull:forKey:", v11, @"accessory_pid");

  -[NSMutableDictionary setEntityPIDOrNull:forKey:](v12, "setEntityPIDOrNull:forKey:", v10, @"image_pid");
  v13 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v12, v9);

  return v13;
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
    v22 = sub_1002E24A8;
    v23 = sub_1002E24B8;
    id v24 = 0LL;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1002E24C0;
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

+ (void)inflateAccessory:(id)a3 forBaseAccessory:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v8)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForBaseAccessory:a4]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryWithDatabase:predicate:orderingProperties:orderingDirections:limit:]( &OBJC_CLASS___TileAccessoryImage,  "queryWithDatabase:predicate:orderingProperties:orderingDirections:limit:",  v9,  v10,  0LL,  0LL,  1LL));

    id v16 = @"image_pid";
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v16, 1LL));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1002E26B4;
    v13[3] = &unk_100639E18;
    id v14 = v9;
    id v15 = v8;
    [v11 enumeratePersistentIDsAndProperties:v12 usingBlock:v13];
  }
}

+ (void)deleteEntitiesForBaseAccessory:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForBaseAccessory:a3]);
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryWithDatabase:predicate:]( &OBJC_CLASS___TileAccessoryImage,  "queryWithDatabase:predicate:",  v6,  v8));

  [v7 deleteAllEntities];
}

- (BOOL)deleteFromDatabase
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TileAccessoryImage image](self, "image"));
  [v3 deleteFromDatabase];

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TileAccessoryImage;
  return -[SQLiteEntity deleteFromDatabase](&v5, "deleteFromDatabase");
}

+ (id)databaseTable
{
  return @"pass_tile_accessory_image";
}

+ (id)_predicateForBaseAccessory:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [a3 persistentID]));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"accessory_pid",  v3));

  return v4;
}

- (id)image
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"image_pid"));
  if (v3) {
    v4 = -[SQLiteEntity initWithPersistentID:inDatabase:]( [TileImage alloc],  "initWithPersistentID:inDatabase:",  [v3 longLongValue],  self->super._database);
  }
  else {
    v4 = 0LL;
  }

  return v4;
}

@end