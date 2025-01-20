@interface TileMetadata
+ (id)_predicateForTileType:(int64_t)a3;
+ (id)databaseTable;
+ (id)insertMetadata:(id)a3 inDatabase:(id)a4;
+ (id)passUniqueIdentifiersInDatabase:(id)a3 withTileOfType:(int64_t)a4;
+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4;
- (BOOL)deleteFromDatabase;
- (TileMetadata)initWithMetadata:(id)a3 inDatabase:(id)a4;
- (id)metadata;
- (int64_t)type;
@end

@implementation TileMetadata

+ (id)databaseTable
{
  return @"pass_tile_metadata";
}

+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4
{
  id v5 = a4;
  if ([a3 isEqualToString:@"pass.unique_id"])
  {
    [v5 addObject:@"JOIN pass_tile_descriptor ON pass_tile_metadata.pid = pass_tile_descriptor.metadata_pid"];
    [v5 addObject:@"JOIN pass ON pass_tile_descriptor.pass_pid = pass.pid"];
  }
}

- (TileMetadata)initWithMetadata:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v8, "setObjectOrNull:forKey:", v9, @"identifier");

  uint64_t v10 = PKPassTileTypeToString([v7 type]);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  -[NSMutableDictionary setObjectOrNull:forKey:](v8, "setObjectOrNull:forKey:", v11, @"type");

  uint64_t v12 = PKPassTileStyleToString([v7 preferredStyle]);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  -[NSMutableDictionary setObjectOrNull:forKey:](v8, "setObjectOrNull:forKey:", v13, @"style");

  -[NSMutableDictionary setBool:forKey:](v8, "setBool:forKey:", [v7 isSelectable], @"selectable");
  -[NSMutableDictionary setBool:forKey:]( v8,  "setBool:forKey:",  [v7 showInPrearm],  @"show_in_prearm");
  id v14 = [v7 context];

  uint64_t v15 = PKPassTileContextToString(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  -[NSMutableDictionary setObjectOrNull:forKey:](v8, "setObjectOrNull:forKey:", v16, @"context_identifier");

  v17 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v8, v6);
  return v17;
}

+ (id)insertMetadata:(id)a3 inDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0LL;
  v18 = &v17;
  uint64_t v19 = 0x3032000000LL;
  v20 = sub_100159A14;
  v21 = sub_100159A24;
  id v22 = 0LL;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100159A2C;
  v12[3] = &unk_10063D3E8;
  id v16 = a1;
  id v8 = v6;
  id v13 = v8;
  id v9 = v7;
  id v14 = v9;
  uint64_t v15 = &v17;
  sub_1002CCC5C((uint64_t)v9, v12);
  id v10 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v10;
}

- (BOOL)deleteFromDatabase
{
  int64_t v3 = -[TileMetadata type](self, "type");
  if ((unint64_t)(v3 - 1) <= 2) {
    -[__objc2_class deleteEntitiesForBaseMetadata:inDatabase:]( *off_100646928[v3 - 1],  "deleteEntitiesForBaseMetadata:inDatabase:",  self,  self->super._database);
  }
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TileMetadata;
  return -[SQLiteEntity deleteFromDatabase](&v5, "deleteFromDatabase");
}

- (int64_t)type
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"type"));
  PKPassTileTypeFromString(v2, &v4);

  return v4;
}

+ (id)passUniqueIdentifiersInDatabase:(id)a3 withTileOfType:(int64_t)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForTileType:a4]);
  LOBYTE(v12) = 1;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryWithDatabase:predicate:orderingProperties:orderingDirections:limit:groupingProperties:returnsDistinctEntities:]( &OBJC_CLASS___TileMetadata,  "queryWithDatabase:predicate:orderingProperties:orderingDirections:limit:groupingProperties:returnsDistinctEntities:",  v6,  v7,  0LL,  0LL,  0LL,  0LL,  v12));

  uint64_t v14 = 0LL;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000LL;
  uint64_t v17 = sub_100159A14;
  v18 = sub_100159A24;
  id v19 = 0LL;
  v20 = @"pass.unique_id";
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v20, 1LL));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100159D80;
  v13[3] = &unk_10063C0F8;
  v13[4] = &v14;
  [v8 enumerateProperties:v9 usingBlock:v13];

  id v10 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v10;
}

+ (id)_predicateForTileType:(int64_t)a3
{
  uint64_t v3 = PKPassTileTypeToString(a3);
  int64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"type",  v4));

  return v5;
}

- (id)metadata
{
  uint64_t v15 = 0LL;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000LL;
  uint64_t v9 = 0LL;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000LL;
  uint64_t v12 = sub_100159A14;
  id v13 = sub_100159A24;
  id v14 = 0LL;
  v18[0] = @"type";
  v18[1] = @"identifier";
  v18[2] = @"context_identifier";
  v18[3] = @"style";
  v18[4] = @"selectable";
  v18[5] = @"show_in_prearm";
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v18, 6LL));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10015A0D4;
  v8[3] = &unk_10063FE20;
  v8[4] = &v15;
  v8[5] = &v9;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v3, v8);

  uint64_t v4 = v16[3];
  switch(v4)
  {
    case 1LL:
      objc_super v5 = (void *)objc_claimAutoreleasedReturnValue([(id)v10[5] metadataTypeVehicleFunction]);
      +[TileMetadataRKE inflateMetadata:forBaseMetadata:inDatabase:]( &OBJC_CLASS___TileMetadataRKE,  "inflateMetadata:forBaseMetadata:inDatabase:",  v5,  self,  self->super._database);
      goto LABEL_7;
    case 2LL:
      objc_super v5 = (void *)objc_claimAutoreleasedReturnValue([(id)v10[5] metadataTypeHorizontalFlowGroup]);
      +[TileMetadataHorizontalFlowGroup inflateMetadata:forBaseMetadata:inDatabase:]( &OBJC_CLASS___TileMetadataHorizontalFlowGroup,  "inflateMetadata:forBaseMetadata:inDatabase:",  v5,  self,  self->super._database);
      goto LABEL_7;
    case 3LL:
      objc_super v5 = (void *)objc_claimAutoreleasedReturnValue([(id)v10[5] metadataTypeVerticalFlowGroup]);
      +[TileMetadataVerticalFlowGroup inflateMetadata:forBaseMetadata:inDatabase:]( &OBJC_CLASS___TileMetadataVerticalFlowGroup,  "inflateMetadata:forBaseMetadata:inDatabase:",  v5,  self,  self->super._database);
LABEL_7:

      break;
  }

  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
  return v6;
}

@end