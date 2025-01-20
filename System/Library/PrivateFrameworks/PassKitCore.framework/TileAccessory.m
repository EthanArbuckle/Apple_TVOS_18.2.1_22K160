@interface TileAccessory
+ (id)databaseTable;
+ (id)insertAccessory:(id)a3 inDatabase:(id)a4;
- (BOOL)deleteFromDatabase;
- (TileAccessory)initWithAccessory:(id)a3 inDatabase:(id)a4;
- (id)passTileAccessory;
- (int64_t)type;
@end

@implementation TileAccessory

- (TileAccessory)initWithAccessory:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v9 = [v7 type];

  uint64_t v10 = PKPassTileAccessoryTypeToString(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  -[NSMutableDictionary setObjectOrNull:forKey:](v8, "setObjectOrNull:forKey:", v11, @"type");

  v12 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v8, v6);
  return v12;
}

+ (id)insertAccessory:(id)a3 inDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    uint64_t v15 = 0LL;
    v16 = &v15;
    uint64_t v17 = 0x3032000000LL;
    v18 = sub_100084644;
    v19 = sub_100084654;
    id v20 = 0LL;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_10008465C;
    v10[3] = &unk_10063D3E8;
    id v14 = a1;
    id v11 = v6;
    id v12 = v7;
    v13 = &v15;
    sub_1002CCC5C((uint64_t)v12, v10);
    id v8 = (id)v16[5];

    _Block_object_dispose(&v15, 8);
  }

  else
  {
    id v8 = 0LL;
  }

  return v8;
}

- (BOOL)deleteFromDatabase
{
  unint64_t v3 = -[TileAccessory type](self, "type");
  if (v3 <= 2) {
    -[__objc2_class deleteEntitiesForBaseAccessory:inDatabase:]( *off_10063E528[v3],  "deleteEntitiesForBaseAccessory:inDatabase:",  self,  self->super._database);
  }
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TileAccessory;
  return -[SQLiteEntity deleteFromDatabase](&v5, "deleteFromDatabase");
}

- (int64_t)type
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"type"));
  PKPassTileAccessoryTypeFromString(v2, &v4);

  return v4;
}

- (id)passTileAccessory
{
  int64_t v3 = -[TileAccessory type](self, "type");
  id v4 = +[PKPassTileAccessory _createForType:resolved:]( &OBJC_CLASS___PKPassTileAccessory,  "_createForType:resolved:",  v3,  0LL);
  objc_super v5 = v4;
  switch(v3)
  {
    case 2LL:
      id v6 = &OBJC_CLASS___TileAccessoryImage;
      uint64_t v7 = objc_claimAutoreleasedReturnValue([v4 accessoryTypeImage]);
      goto LABEL_7;
    case 1LL:
      id v6 = &OBJC_CLASS___TileAccessorySpinner;
      uint64_t v7 = objc_claimAutoreleasedReturnValue([v4 accessoryTypeSpinner]);
      goto LABEL_7;
    case 0LL:
      id v6 = &OBJC_CLASS___TileAccessoryButton;
      uint64_t v7 = objc_claimAutoreleasedReturnValue([v4 accessoryTypeButton]);
LABEL_7:
      id v8 = (void *)v7;
      -[__objc2_class inflateAccessory:forBaseAccessory:inDatabase:]( v6,  "inflateAccessory:forBaseAccessory:inDatabase:",  v7,  self,  self->super._database);

      break;
  }

  return v5;
}

+ (id)databaseTable
{
  return @"pass_tile_accessory";
}

@end