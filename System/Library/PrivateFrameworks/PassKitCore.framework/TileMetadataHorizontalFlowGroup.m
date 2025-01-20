@interface TileMetadataHorizontalFlowGroup
+ (id)_predicateForBaseMetadata:(id)a3;
+ (id)databaseTable;
+ (id)insertMetadata:(id)a3 forBaseMetadata:(id)a4 inDatabase:(id)a5;
+ (void)deleteEntitiesForBaseMetadata:(id)a3 inDatabase:(id)a4;
+ (void)inflateMetadata:(id)a3 forBaseMetadata:(id)a4 inDatabase:(id)a5;
- (TileMetadataHorizontalFlowGroup)initWithMetadata:(id)a3 forBaseMetadata:(id)a4 inDatabase:(id)a5;
@end

@implementation TileMetadataHorizontalFlowGroup

- (TileMetadataHorizontalFlowGroup)initWithMetadata:(id)a3 forBaseMetadata:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v12 = [v9 persistentID];

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v12));
  -[NSMutableDictionary setObjectOrNull:forKey:](v11, "setObjectOrNull:forKey:", v13, @"metadata_pid");

  v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v10 columns]));
  -[NSMutableDictionary setObjectOrNull:forKey:](v11, "setObjectOrNull:forKey:", v14, @"columns");

  v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v10 maximumRows]));
  -[NSMutableDictionary setObjectOrNull:forKey:](v11, "setObjectOrNull:forKey:", v15, @"maximumRows");

  uint64_t v16 = PKPassTileWidthClassHorizontalFlowToString([v10 widthClass]);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  -[NSMutableDictionary setObjectOrNull:forKey:](v11, "setObjectOrNull:forKey:", v17, @"width_class");

  uint64_t v18 = PKPassTileHeightClassToString([v10 heightClass]);
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  -[NSMutableDictionary setObjectOrNull:forKey:](v11, "setObjectOrNull:forKey:", v19, @"height_class");

  id v20 = [v10 groupStyle];
  uint64_t v21 = PKPassTileGroupStyleToString(v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  -[NSMutableDictionary setObjectOrNull:forKey:](v11, "setObjectOrNull:forKey:", v22, @"group_style");

  v23 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v11, v8);
  return v23;
}

+ (id)insertMetadata:(id)a3 forBaseMetadata:(id)a4 inDatabase:(id)a5
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
    v22 = sub_10030180C;
    v23 = sub_10030181C;
    id v24 = 0LL;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100301824;
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

+ (void)inflateMetadata:(id)a3 forBaseMetadata:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  if (v8)
  {
    id v9 = a5;
    id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForBaseMetadata:a4]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryWithDatabase:predicate:orderingProperties:orderingDirections:limit:]( &OBJC_CLASS___TileMetadataHorizontalFlowGroup,  "queryWithDatabase:predicate:orderingProperties:orderingDirections:limit:",  v9,  v10,  0LL,  0LL,  1LL));

    v15[0] = @"columns";
    v15[1] = @"maximumRows";
    v15[2] = @"width_class";
    v15[3] = @"height_class";
    v15[4] = @"group_style";
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v15, 5LL));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1003019E8;
    v13[3] = &unk_10063C0D0;
    id v14 = v8;
    [v11 enumeratePersistentIDsAndProperties:v12 usingBlock:v13];
  }
}

+ (void)deleteEntitiesForBaseMetadata:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForBaseMetadata:a3]);
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryWithDatabase:predicate:]( &OBJC_CLASS___TileMetadataHorizontalFlowGroup,  "queryWithDatabase:predicate:",  v6,  v8));

  [v7 deleteAllEntities];
}

+ (id)_predicateForBaseMetadata:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [a3 persistentID]));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"metadata_pid",  v3));

  return v4;
}

+ (id)databaseTable
{
  return @"pass_tile_metadata_horizontal_flow_group";
}

@end