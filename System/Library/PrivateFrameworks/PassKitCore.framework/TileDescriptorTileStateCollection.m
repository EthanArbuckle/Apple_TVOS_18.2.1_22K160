@interface TileDescriptorTileStateCollection
+ (BOOL)insertStates:(id)a3 forDescriptor:(id)a4 inDatabase:(id)a5;
+ (id)_predicateForDescriptorPID:(int64_t)a3;
+ (id)databaseTable;
+ (void)deleteEntitiesForDescriptor:(id)a3 inDatabase:(id)a4;
- (BOOL)deleteFromDatabase;
- (TileDescriptorTileStateCollection)initWithState:(id)a3 identifier:(id)a4 forDescriptor:(id)a5 inDatabase:(id)a6;
- (id)tileState;
@end

@implementation TileDescriptorTileStateCollection

- (TileDescriptorTileStateCollection)initWithState:(id)a3 identifier:(id)a4 forDescriptor:(id)a5 inDatabase:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setEntityPIDOrNull:forKey:](v14, "setEntityPIDOrNull:forKey:", v11, @"descriptor_pid");

  -[NSMutableDictionary setEntityPIDOrNull:forKey:](v14, "setEntityPIDOrNull:forKey:", v13, @"state_pid");
  -[NSMutableDictionary setObjectOrNull:forKey:](v14, "setObjectOrNull:forKey:", v12, @"state_identifier");

  v15 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v14, v10);
  return v15;
}

+ (BOOL)insertStates:(id)a3 forDescriptor:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 count])
  {
    if (v9)
    {
      uint64_t v19 = 0LL;
      v20 = &v19;
      uint64_t v21 = 0x2020000000LL;
      char v22 = 1;
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472LL;
      v13[2] = sub_1000086F4;
      v13[3] = &unk_1006391A8;
      id v14 = v8;
      id v15 = v10;
      id v18 = a1;
      id v16 = v9;
      v17 = &v19;
      sub_1002CCC5C((uint64_t)v15, v13);
      BOOL v11 = *((_BYTE *)v20 + 24) != 0;

      _Block_object_dispose(&v19, 8);
    }

    else
    {
      BOOL v11 = 0;
    }
  }

  else
  {
    BOOL v11 = 1;
  }

  return v11;
}

+ (void)deleteEntitiesForDescriptor:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_predicateForDescriptorPID:", objc_msgSend(a3, "persistentID")));
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryWithDatabase:predicate:]( &OBJC_CLASS___TileDescriptorTileStateCollection,  "queryWithDatabase:predicate:",  v6,  v8));

  [v7 deleteAllEntities];
}

- (BOOL)deleteFromDatabase
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TileDescriptorTileStateCollection tileState](self, "tileState"));
  [v3 deleteFromDatabase];

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TileDescriptorTileStateCollection;
  return -[SQLiteEntity deleteFromDatabase](&v5, "deleteFromDatabase");
}

+ (id)_predicateForDescriptorPID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"descriptor_pid",  v3));

  return v4;
}

- (id)tileState
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"state_pid"));
  if (v3) {
    v4 = -[SQLiteEntity initWithPersistentID:inDatabase:]( [TileState alloc],  "initWithPersistentID:inDatabase:",  [v3 longLongValue],  self->super._database);
  }
  else {
    v4 = 0LL;
  }

  return v4;
}

+ (id)databaseTable
{
  return @"tile_descriptor_tile_state_collection";
}

@end