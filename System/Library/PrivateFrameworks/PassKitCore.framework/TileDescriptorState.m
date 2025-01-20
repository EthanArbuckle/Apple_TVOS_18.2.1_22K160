@interface TileDescriptorState
+ (id)_createStateForPID:(int64_t)a3 withProperties:(id)a4 values:(const void *)a5 propertySetters:(id)a6 indices:(id)a7 inDatabase:(id)a8;
+ (id)_propertySettersWithProperties:(id)a3 effectiveProperties:(id *)a4 indices:(id *)a5;
+ (id)databaseTable;
+ (id)insertState:(id)a3 inDatabase:(id)a4;
+ (id)statesInDatabase:(id)a3 forPassPID:(unint64_t)a4;
+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4;
- (BOOL)deleteFromDatabase;
- (TileDescriptorState)initWithState:(id)a3 tileStateOverride:(id)a4 inDatabase:(id)a5;
- (id)passTileDescriptorState;
- (id)stateOverride;
@end

@implementation TileDescriptorState

+ (id)databaseTable
{
  return @"pass_tile_descriptor_state";
}

+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4
{
  id v6 = a3;
  id v5 = a4;
  if (([v6 isEqualToString:@"pass_tile_descriptor.pid"] & 1) != 0
    || [v6 isEqualToString:@"pass_tile_descriptor.pass_pid"])
  {
    [v5 addObject:@"JOIN pass_tile_descriptor ON pass_tile_descriptor_state.pid = pass_tile_descriptor.state_pid"];
  }

  if (([v6 isEqualToString:@"pass_tile_metadata.identifier"] & 1) != 0
    || [v6 isEqualToString:@"pass_tile_metadata.type"])
  {
    [v5 addObject:@"JOIN pass_tile_metadata ON pass_tile_descriptor.metadata_pid = pass_tile_metadata.pid"];
  }
}

- (TileDescriptorState)initWithState:(id)a3 tileStateOverride:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setBool:forKey:](v11, "setBool:forKey:", [v10 isSupported], @"supported");
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v10 isEnabled]));
  -[NSMutableDictionary setObjectOrNull:forKey:](v11, "setObjectOrNull:forKey:", v12, @"enabled");

  v13 = (void *)objc_claimAutoreleasedReturnValue([v10 stateIdentifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v11, "setObjectOrNull:forKey:", v13, @"state_identifier");

  -[NSMutableDictionary setEntityPIDOrNull:forKey:](v11, "setEntityPIDOrNull:forKey:", v9, @"state_override_pid");
  id v14 = [v10 isInProgress];

  -[NSMutableDictionary setBool:forKey:](v11, "setBool:forKey:", v14, @"in_progress");
  v15 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v11, v8);

  return v15;
}

+ (id)insertState:(id)a3 inDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0LL;
  v18 = &v17;
  uint64_t v19 = 0x3032000000LL;
  v20 = sub_1001B6014;
  v21 = sub_1001B6024;
  id v22 = 0LL;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1001B602C;
  v12[3] = &unk_10063D3E8;
  id v8 = v6;
  id v13 = v8;
  id v9 = v7;
  id v14 = v9;
  v15 = &v17;
  id v16 = a1;
  sub_1002CCC5C((uint64_t)v9, v12);
  id v10 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v10;
}

- (BOOL)deleteFromDatabase
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TileDescriptorState stateOverride](self, "stateOverride"));
  [v3 deleteFromDatabase];

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TileDescriptorState;
  return -[SQLiteEntity deleteFromDatabase](&v5, "deleteFromDatabase");
}

+ (id)statesInDatabase:(id)a3 forPassPID:(unint64_t)a4
{
  id v5 = a3;
  id v30 = 0LL;
  __int128 v29 = 0uLL;
  v31 = @"pass_tile_metadata.identifier";
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v31, 1LL));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[TileDescriptorState _propertySettersWithProperties:effectiveProperties:indices:]( &OBJC_CLASS___TileDescriptorState,  "_propertySettersWithProperties:effectiveProperties:indices:",  v6,  &v30,  &v29));

  id v8 = [v30 indexOfObject:@"pass_tile_metadata.identifier"];
  uint64_t v23 = 0LL;
  v24 = &v23;
  uint64_t v25 = 0x3032000000LL;
  v26 = sub_1001B6014;
  v27 = sub_1001B6024;
  id v28 = 0LL;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a4));
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"pass_tile_descriptor.pass_pid",  v9));
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryWithDatabase:predicate:]( &OBJC_CLASS___TileDescriptorState,  "queryWithDatabase:predicate:",  v5,  v10));

  id v12 = v30;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_1001B6368;
  v17[3] = &unk_10064A190;
  v20 = &v23;
  id v21 = v8;
  id v13 = v7;
  id v18 = v13;
  __int128 v22 = v29;
  id v14 = v5;
  id v19 = v14;
  [v11 enumeratePersistentIDsAndProperties:v12 usingBlock:v17];
  id v15 = [(id)v24[5] copy];

  _Block_object_dispose(&v23, 8);
  return v15;
}

- (id)passTileDescriptorState
{
  id v19 = 0LL;
  __int128 v18 = 0uLL;
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[TileDescriptorState _propertySettersWithProperties:effectiveProperties:indices:]( &OBJC_CLASS___TileDescriptorState,  "_propertySettersWithProperties:effectiveProperties:indices:",  0LL,  &v19,  &v18));
  uint64_t v12 = 0LL;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  id v15 = sub_1001B6014;
  id v16 = sub_1001B6024;
  id v17 = 0LL;
  id v4 = v19;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1001B6560;
  v8[3] = &unk_10064A1B8;
  id v10 = &v12;
  v8[4] = self;
  id v5 = v3;
  id v9 = v5;
  __int128 v11 = v18;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v4, v8);
  id v6 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v6;
}

- (id)stateOverride
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"state_override_pid"));
  if (v3) {
    id v4 = -[SQLiteEntity initWithPersistentID:inDatabase:]( [TileState alloc],  "initWithPersistentID:inDatabase:",  [v3 longLongValue],  self->super._database);
  }
  else {
    id v4 = 0LL;
  }

  return v4;
}

+ (id)_propertySettersWithProperties:(id)a3 effectiveProperties:(id *)a4 indices:(id *)a5
{
  id v7 = a3;
  id v8 = 0LL;
  if (a4 && a5)
  {
    v25[0] = @"supported";
    v25[1] = @"enabled";
    v26[0] = &stru_10064A1F8;
    v26[1] = &stru_10064A218;
    v25[2] = @"state_identifier";
    v25[3] = @"in_progress";
    v26[2] = &stru_10064A238;
    v26[3] = &stru_10064A258;
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v26,  v25,  4LL));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 allKeys]);
    id v10 = [v9 mutableCopy];

    a5->var0 = (unint64_t)[v10 count];
    [v10 addObject:@"pass_tile_metadata.type"];
    a5->var1 = (unint64_t)[v10 count];
    [v10 addObject:@"state_override_pid"];
    [v10 addObject:@"pass_tile_descriptor.pid"];
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

+ (id)_createStateForPID:(int64_t)a3 withProperties:(id)a4 values:(const void *)a5 propertySetters:(id)a6 indices:(id)a7 inDatabase:(id)a8
{
  unint64_t var1 = a7.var1;
  unint64_t var0 = a7.var0;
  id v13 = a8;
  id v14 = a6;
  id v15 = a4;
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectAtIndexedSubscript:var0]);
  id v17 = -[PKMutablePassTileDescriptorState initForType:]( [PKMutablePassTileDescriptorState alloc],  "initForType:",  [v16 integerValue]);
  +[SQLiteEntity applyPropertySetters:toObject:withProperties:values:]( &OBJC_CLASS___TileDescriptorState,  "applyPropertySetters:toObject:withProperties:values:",  v14,  v17,  v15,  a5);

  id v18 = (id)a5[var1];
  if (v18)
  {
    id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));

    if (v18 != v19)
    {
      __int128 v20 = -[SQLiteEntity initWithPersistentID:inDatabase:]( [TileState alloc],  "initWithPersistentID:inDatabase:",  [v18 longLongValue],  v13);
      __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(-[TileState passTileState](v20, "passTileState"));
      [v17 setStateOverride:v21];
    }
  }

  id v22 = [v17 copy];

  return v22;
}

@end