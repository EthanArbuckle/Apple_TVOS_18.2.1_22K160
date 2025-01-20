@interface TileValue
+ (id)databaseTable;
+ (id)insertValue:(id)a3 inDatabase:(id)a4;
- (BOOL)deleteFromDatabase;
- (TileValue)initWithValue:(id)a3 inDatabase:(id)a4;
- (id)passTileValue;
- (int64_t)type;
@end

@implementation TileValue

- (TileValue)initWithValue:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v9 = [v7 type];

  uint64_t v10 = PKPassTileValueTypeToString(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  -[NSMutableDictionary setObjectOrNull:forKey:](v8, "setObjectOrNull:forKey:", v11, @"type");

  v12 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v8, v6);
  return v12;
}

+ (id)insertValue:(id)a3 inDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    uint64_t v15 = 0LL;
    v16 = &v15;
    uint64_t v17 = 0x3032000000LL;
    v18 = sub_1000FB1D8;
    v19 = sub_1000FB1E8;
    id v20 = 0LL;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_1000FB1F0;
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
  int64_t v3 = -[TileValue type](self, "type");
  if ((unint64_t)(v3 - 1) <= 2) {
    -[__objc2_class deleteEntitiesForBaseValue:inDatabase:]( *off_100643FB8[v3 - 1],  "deleteEntitiesForBaseValue:inDatabase:",  self,  self->super._database);
  }
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TileValue;
  return -[SQLiteEntity deleteFromDatabase](&v5, "deleteFromDatabase");
}

- (int64_t)type
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"type"));
  int64_t v3 = PKPassTileValueTypeFromString();

  return v3;
}

- (id)passTileValue
{
  int64_t v3 = -[TileValue type](self, "type");
  id v4 = +[PKPassTileValue _createForType:resolved:](&OBJC_CLASS___PKPassTileValue, "_createForType:resolved:", v3, 0LL);
  objc_super v5 = v4;
  switch(v3)
  {
    case 0LL:
      id v6 = &OBJC_CLASS___TileValueText;
      uint64_t v7 = objc_claimAutoreleasedReturnValue([v4 valueTypeText]);
      goto LABEL_6;
    case 1LL:
      id v6 = &OBJC_CLASS___TileValueDate;
      uint64_t v7 = objc_claimAutoreleasedReturnValue([v4 valueTypeDate]);
      goto LABEL_6;
    case 2LL:
      id v6 = &OBJC_CLASS___TileValueNumber;
      uint64_t v7 = objc_claimAutoreleasedReturnValue([v4 valueTypeNumber]);
      goto LABEL_6;
    case 3LL:
      id v6 = &OBJC_CLASS___TileValueForeignReference;
      uint64_t v7 = objc_claimAutoreleasedReturnValue([v4 valueTypeForeignReference]);
LABEL_6:
      id v8 = (void *)v7;
      -[__objc2_class inflateValue:forBaseValue:inDatabase:]( v6,  "inflateValue:forBaseValue:inDatabase:",  v7,  self,  self->super._database);

      break;
    default:
      return v5;
  }

  return v5;
}

+ (id)databaseTable
{
  return @"pass_tile_value";
}

@end