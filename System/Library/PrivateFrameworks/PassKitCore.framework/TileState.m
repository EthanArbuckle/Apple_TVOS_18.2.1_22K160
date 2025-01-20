@interface TileState
+ (BOOL)insertStates:(id)a3 forDescriptor:(id)a4 inDatabase:(id)a5;
+ (id)_createStateForPID:(int64_t)a3 withProperties:(id)a4 values:(const void *)a5 propertySetters:(id)a6 indices:(id *)a7 inDatabase:(id)a8;
+ (id)_insertState:(id)a3 inDatabase:(id)a4 root:(BOOL)a5;
+ (id)_predicateForDescriptorPID:(int64_t)a3;
+ (id)_propertySettersWithProperties:(id)a3 effectiveProperties:(id *)a4 indices:(id *)a5;
+ (id)databaseTable;
+ (id)insertState:(id)a3 inDatabase:(id)a4;
+ (id)statesForDescriptorPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4;
+ (void)deleteEntitiesForDescriptor:(id)a3 inDatabase:(id)a4;
- (BOOL)deleteFromDatabase;
- (TileState)initWithState:(id)a3 metadata:(id)a4 icon:(id)a5 actionState:(id)a6 inDatabase:(id)a7;
- (id)actionState;
- (id)icon;
- (id)metadata;
- (id)passTileState;
- (int64_t)type;
@end

@implementation TileState

+ (id)databaseTable
{
  return @"pass_tile_state";
}

+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4
{
  id v6 = a3;
  id v5 = a4;
  if (([v6 isEqualToString:@"tile_descriptor_tile_state_collection.descriptor_pid"] & 1) != 0 || objc_msgSend( v6,  "isEqualToString:",  @"tile_descriptor_tile_state_collection.state_identifier"))
  {
    [v5 addObject:@"JOIN tile_descriptor_tile_state_collection ON pass_tile_state.pid = tile_descriptor_tile_state_collection.state_pid"];
  }
}

- (TileState)initWithState:(id)a3 metadata:(id)a4 icon:(id)a5 actionState:(id)a6 inDatabase:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  v17 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setEntityPIDOrNull:forKey:](v17, "setEntityPIDOrNull:forKey:", v15, @"state_metadata_pid");

  -[NSMutableDictionary setEntityPIDOrNull:forKey:](v17, "setEntityPIDOrNull:forKey:", v14, @"image_pid");
  -[NSMutableDictionary setEntityPIDOrNull:forKey:](v17, "setEntityPIDOrNull:forKey:", v13, @"action_state_pid");

  uint64_t v18 = PKPassTileStateTypeToString([v16 type]);
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  -[NSMutableDictionary setObjectOrNull:forKey:](v17, "setObjectOrNull:forKey:", v19, @"type");

  -[NSMutableDictionary setBool:forKey:](v17, "setBool:forKey:", [v16 isEnabled], @"enabled");
  -[NSMutableDictionary setBool:forKey:](v17, "setBool:forKey:", [v16 isSelected], @"selected");
  v20 = (void *)objc_claimAutoreleasedReturnValue([v16 actionDictionaries]);

  if (v20) {
    v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v20,  0LL,  0LL));
  }
  else {
    v21 = 0LL;
  }
  -[NSMutableDictionary setObjectOrNull:forKey:](v17, "setObjectOrNull:forKey:", v21, @"actions");
  v22 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v17, v12);

  return v22;
}

+ (BOOL)insertStates:(id)a3 forDescriptor:(id)a4 inDatabase:(id)a5
{
  return +[TileDescriptorTileStateCollection insertStates:forDescriptor:inDatabase:]( &OBJC_CLASS___TileDescriptorTileStateCollection,  "insertStates:forDescriptor:inDatabase:",  a3,  a4,  a5);
}

+ (id)insertState:(id)a3 inDatabase:(id)a4
{
  return [a1 _insertState:a3 inDatabase:a4 root:1];
}

+ (id)_insertState:(id)a3 inDatabase:(id)a4 root:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v20 = 0LL;
  v21 = &v20;
  uint64_t v22 = 0x3032000000LL;
  v23 = sub_1003D8E4C;
  v24 = sub_1003D8E5C;
  id v25 = 0LL;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1003D8E64;
  v14[3] = &unk_10065C5C8;
  id v10 = v8;
  id v15 = v10;
  id v11 = v9;
  BOOL v19 = a5;
  v17 = &v20;
  id v18 = a1;
  id v16 = v11;
  sub_1002CCC5C((uint64_t)v11, v14);
  id v12 = (id)v21[5];

  _Block_object_dispose(&v20, 8);
  return v12;
}

+ (void)deleteEntitiesForDescriptor:(id)a3 inDatabase:(id)a4
{
}

- (BOOL)deleteFromDatabase
{
  unint64_t v3 = -[TileState type](self, "type");
  if (v3 <= 3) {
    -[__objc2_class deleteEntitiesForBaseState:inDatabase:]( *(&off_10065C718)[v3],  "deleteEntitiesForBaseState:inDatabase:",  self,  self->super._database);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TileState metadata](self, "metadata"));
  [v4 deleteFromDatabase];

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TileState icon](self, "icon"));
  [v5 deleteFromDatabase];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TileState actionState](self, "actionState"));
  [v6 deleteFromDatabase];

  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TileState;
  return -[SQLiteEntity deleteFromDatabase](&v8, "deleteFromDatabase");
}

+ (id)_predicateForDescriptorPID:(int64_t)a3
{
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"tile_descriptor_tile_state_collection.descriptor_pid",  v3));

  return v4;
}

+ (id)statesForDescriptorPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  id v33 = 0LL;
  v34 = @"tile_descriptor_tile_state_collection.state_identifier";
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v34, 1LL));
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue( +[TileState _propertySettersWithProperties:effectiveProperties:indices:]( &OBJC_CLASS___TileState,  "_propertySettersWithProperties:effectiveProperties:indices:",  v7,  &v33,  &v31));

  id v9 = [v33 indexOfObject:@"tile_descriptor_tile_state_collection.state_identifier"];
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[TileState _predicateForDescriptorPID:](&OBJC_CLASS___TileState, "_predicateForDescriptorPID:", a3));
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryWithDatabase:predicate:]( &OBJC_CLASS___TileState,  "queryWithDatabase:predicate:",  v6,  v10));

  uint64_t v25 = 0LL;
  v26 = &v25;
  uint64_t v27 = 0x3032000000LL;
  v28 = sub_1003D8E4C;
  v29 = sub_1003D8E5C;
  id v30 = 0LL;
  id v12 = v33;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_1003D93C4;
  v17[3] = &unk_10065C5F0;
  id v21 = v9;
  id v22 = a1;
  id v13 = v8;
  id v18 = v13;
  __int128 v23 = v31;
  __int128 v24 = v32;
  id v14 = v6;
  id v19 = v14;
  uint64_t v20 = &v25;
  [v11 enumeratePersistentIDsAndProperties:v12 usingBlock:v17];
  id v15 = [(id)v26[5] copy];

  _Block_object_dispose(&v25, 8);
  return v15;
}

- (id)passTileState
{
  id v21 = 0LL;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[TileState _propertySettersWithProperties:effectiveProperties:indices:]( &OBJC_CLASS___TileState,  "_propertySettersWithProperties:effectiveProperties:indices:",  0LL,  &v21,  &v19));
  uint64_t v13 = 0LL;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000LL;
  id v16 = sub_1003D8E4C;
  v17 = sub_1003D8E5C;
  id v18 = 0LL;
  id v4 = v21;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1003D95C8;
  v8[3] = &unk_10065C618;
  id v10 = &v13;
  v8[4] = self;
  id v5 = v3;
  id v9 = v5;
  __int128 v11 = v19;
  __int128 v12 = v20;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v4, v8);
  id v6 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v6;
}

- (int64_t)type
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"type"));
  PKPassTileStateTypeFromString(v2, &v4);

  return v4;
}

- (id)metadata
{
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"state_metadata_pid"));
  if (v3) {
    int64_t v4 = -[SQLiteEntity initWithPersistentID:inDatabase:]( [TileStateMetadata alloc],  "initWithPersistentID:inDatabase:",  [v3 longLongValue],  self->super._database);
  }
  else {
    int64_t v4 = 0LL;
  }

  return v4;
}

- (id)icon
{
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"image_pid"));
  if (v3) {
    int64_t v4 = -[SQLiteEntity initWithPersistentID:inDatabase:]( [TileImage alloc],  "initWithPersistentID:inDatabase:",  [v3 longLongValue],  self->super._database);
  }
  else {
    int64_t v4 = 0LL;
  }

  return v4;
}

- (id)actionState
{
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"action_state_pid"));
  if (v3) {
    int64_t v4 = -[SQLiteEntity initWithPersistentID:inDatabase:]( [TileState alloc],  "initWithPersistentID:inDatabase:",  [v3 longLongValue],  self->super._database);
  }
  else {
    int64_t v4 = 0LL;
  }

  return v4;
}

+ (id)_propertySettersWithProperties:(id)a3 effectiveProperties:(id *)a4 indices:(id *)a5
{
  id v7 = a3;
  objc_super v8 = 0LL;
  if (a4 && a5)
  {
    v25[0] = @"enabled";
    v25[1] = @"selected";
    v26[0] = &stru_10065C658;
    v26[1] = &stru_10065C678;
    v25[2] = @"action";
    v25[3] = @"actions";
    v26[2] = &stru_10065C698;
    v26[3] = &stru_10065C6B8;
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v26,  v25,  4LL));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 allKeys]);
    id v10 = [v9 mutableCopy];

    a5->var0 = (int64_t)[v10 count];
    [v10 addObject:@"type"];
    a5->var1 = (int64_t)[v10 count];
    [v10 addObject:@"state_metadata_pid"];
    a5->var2 = (int64_t)[v10 count];
    [v10 addObject:@"image_pid"];
    a5->var3 = (int64_t)[v10 count];
    [v10 addObject:@"action_state_pid"];
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    id v11 = v7;
    id v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v21;
      do
      {
        for (i = 0LL; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v21 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v20 + 1) + 8LL * (void)i);
          if (objc_msgSend(v10, "indexOfObject:", v16, (void)v20) == (id)0x7FFFFFFFFFFFFFFFLL) {
            [v10 addObject:v16];
          }
        }

        id v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }

      while (v13);
    }

    id v17 = [v10 copy];
    id v18 = *a4;
    *a4 = v17;
  }

  return v8;
}

+ (id)_createStateForPID:(int64_t)a3 withProperties:(id)a4 values:(const void *)a5 propertySetters:(id)a6 indices:(id *)a7 inDatabase:(id)a8
{
  id v13 = a8;
  id v14 = a6;
  id v15 = a4;
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  id v17 = (id)a5[a7->var0];
  if (v17 == v16)
  {

    id v17 = 0LL;
  }

  PKPassTileStateTypeFromString(v17, &v37);

  id v18 = +[PKPassTileState _createWithType:](&OBJC_CLASS___PKPassTileState, "_createWithType:", v37);
  +[SQLiteEntity applyPropertySetters:toObject:withProperties:values:]( &OBJC_CLASS___TileState,  "applyPropertySetters:toObject:withProperties:values:",  v14,  v18,  v15,  a5);

  __int128 v19 = (id)a5[a7->var1];
  __int128 v20 = v19;
  if (v19) {
    BOOL v21 = v19 == v16;
  }
  else {
    BOOL v21 = 1;
  }
  if (!v21)
  {
    __int128 v22 = -[SQLiteEntity initWithPersistentID:inDatabase:]( [TileStateMetadata alloc],  "initWithPersistentID:inDatabase:",  [v19 longLongValue],  v13);
    __int128 v23 = (void *)objc_claimAutoreleasedReturnValue(-[TileStateMetadata stateMetadata](v22, "stateMetadata"));
    [v18 setMetadata:v23];
  }

  __int128 v24 = (id)a5[a7->var2];
  uint64_t v25 = v24;
  if (v24 && v24 != v16)
  {
    v26 = -[SQLiteEntity initWithPersistentID:inDatabase:]( [TileImage alloc],  "initWithPersistentID:inDatabase:",  [v24 longLongValue],  v13);
    int64_t v27 = a3;
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[TileImage tileImage](v26, "tileImage"));
    [v18 setIcon:v28];

    a3 = v27;
  }

  v29 = (id)a5[a7->var3];
  id v30 = v29;
  if (v29 && v29 != v16)
  {
    __int128 v31 = -[SQLiteEntity initWithPersistentID:inDatabase:]( [TileState alloc],  "initWithPersistentID:inDatabase:",  [v29 longLongValue],  v13);
    __int128 v32 = (void *)objc_claimAutoreleasedReturnValue(-[TileState passTileState](v31, "passTileState"));
    [v18 setActionState:v32];
  }

  switch(v37)
  {
    case 0LL:
      id v33 = &OBJC_CLASS___TileStateDefault;
      uint64_t v34 = objc_claimAutoreleasedReturnValue([v18 stateTypeDefault]);
      goto LABEL_19;
    case 1LL:
      id v33 = &OBJC_CLASS___TileStateDefaultV2;
      uint64_t v34 = objc_claimAutoreleasedReturnValue([v18 stateTypeDefaultV2]);
      goto LABEL_19;
    case 2LL:
      id v33 = &OBJC_CLASS___TileStateCheckIn;
      uint64_t v34 = objc_claimAutoreleasedReturnValue([v18 stateTypeCheckIn]);
      goto LABEL_19;
    case 3LL:
      id v33 = &OBJC_CLASS___TileStateGroup;
      uint64_t v34 = objc_claimAutoreleasedReturnValue([v18 stateTypeGroup]);
LABEL_19:
      v35 = (void *)v34;
      -[__objc2_class inflateState:forBaseStatePID:inDatabase:]( v33,  "inflateState:forBaseStatePID:inDatabase:",  v34,  a3,  v13);

      break;
    default:
      break;
  }

  return v18;
}

@end