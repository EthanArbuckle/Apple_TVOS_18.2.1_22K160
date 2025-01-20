@interface TileStateMetadata
+ (id)databaseTable;
+ (id)insertMetadata:(id)a3 inDatabase:(id)a4;
- (BOOL)deleteFromDatabase;
- (TileStateMetadata)initWithMetadata:(id)a3 inDatabase:(id)a4;
- (id)stateMetadata;
- (int64_t)type;
@end

@implementation TileStateMetadata

- (TileStateMetadata)initWithMetadata:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v9 = [v7 type];

  uint64_t v10 = PKPassTileTypeToString(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  -[NSMutableDictionary setObjectOrNull:forKey:](v8, "setObjectOrNull:forKey:", v11, @"type");

  v12 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v8, v6);
  return v12;
}

+ (id)insertMetadata:(id)a3 inDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0LL;
  v18 = &v17;
  uint64_t v19 = 0x3032000000LL;
  v20 = sub_10022DE10;
  v21 = sub_10022DE20;
  id v22 = 0LL;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10022DE28;
  v12[3] = &unk_10063D3E8;
  id v16 = a1;
  id v8 = v6;
  id v13 = v8;
  id v9 = v7;
  id v14 = v9;
  v15 = &v17;
  sub_1002CCC5C((uint64_t)v9, v12);
  id v10 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v10;
}

- (BOOL)deleteFromDatabase
{
  if ((id)-[TileStateMetadata type](self, "type") == (id)1) {
    +[TileStateMetadataRKE deleteEntitiesForBaseMetadata:inDatabase:]( &OBJC_CLASS___TileStateMetadataRKE,  "deleteEntitiesForBaseMetadata:inDatabase:",  self,  self->super._database);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TileStateMetadata;
  return -[SQLiteEntity deleteFromDatabase](&v4, "deleteFromDatabase");
}

- (int64_t)type
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"type"));
  PKPassTileTypeFromString(v2, &v4);

  return v4;
}

- (id)stateMetadata
{
  int64_t v3 = -[TileStateMetadata type](self, "type");
  id v4 = +[PKPassTileStateMetadata _createWithType:](&OBJC_CLASS___PKPassTileStateMetadata, "_createWithType:", v3);
  v5 = v4;
  if (v3 == 1)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 metadataTypeVehicleFunction]);
    +[TileStateMetadataRKE inflateMetadata:forBaseMetadata:inDatabase:]( &OBJC_CLASS___TileStateMetadataRKE,  "inflateMetadata:forBaseMetadata:inDatabase:",  v6,  self,  self->super._database);
  }

  return v5;
}

+ (id)databaseTable
{
  return @"pass_tile_state_metadata";
}

@end