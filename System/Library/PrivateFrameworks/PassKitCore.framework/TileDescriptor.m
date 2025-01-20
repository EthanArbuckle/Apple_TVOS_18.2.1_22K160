@interface TileDescriptor
+ (id)_createDescriptorForPID:(int64_t)a3 withProperties:(id)a4 values:(const void *)a5 propertySetters:(id)a6 indices:(id)a7 inDatabase:(id)a8;
+ (id)_createDescriptorStatePairForPID:(int64_t)a3 withProperties:(id)a4 values:(const void *)a5 propertySetters:(id)a6 indices:(id)a7 inDatabase:(id)a8 supportGroups:(BOOL)a9;
+ (id)_createUpdatedDescriptorPairForPID:(int64_t)a3 transform:(id)a4 withProperties:(id)a5 values:(const void *)a6 propertySetters:(id)a7 indices:(id)a8 inDatabase:(id)a9 updated:(BOOL *)a10 supportGroups:(BOOL)a11;
+ (id)_predicateForContext:(int64_t)a3;
+ (id)_predicateForGroupDescriptorPID:(unint64_t)a3;
+ (id)_predicateForNullGroupID;
+ (id)_predicateForPassPID:(unint64_t)a3;
+ (id)_predicateForPassUniqueID:(id)a3;
+ (id)_propertySettersWithProperties:(id)a3 effectiveProperties:(id *)a4 indices:(id *)a5;
+ (id)_tileDescriptorQueryWithPredicate:(id)a3 inDatabase:(id)a4;
+ (id)databaseTable;
+ (id)descriptorsInDatabase:(id)a3 forPassUniqueID:(id)a4 context:(int64_t)a5;
+ (id)insertDescriptor:(id)a3 groupDescriptor:(id)a4 withState:(id)a5 order:(int64_t)a6 forPass:(id)a7 inDatabase:(id)a8;
+ (id)updatePassTileDescriptorStatesInDatabase:(id)a3 forPassUniqueID:(id)a4 forContext:(int64_t)a5 withTransform:(id)a6;
+ (void)_deleteEntitiesForGroupDescriptor:(id)a3 inDatabase:(id)a4;
+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4;
+ (void)deleteEntitiesForPassPID:(unint64_t)a3 inDatabase:(id)a4;
- (BOOL)deleteFromDatabase;
- (TileDescriptor)initWithDescriptor:(id)a3 groupDescriptor:(id)a4 metadata:(id)a5 state:(id)a6 order:(int64_t)a7 forPass:(id)a8 inDatabase:(id)a9;
- (id)metadata;
- (id)state;
@end

@implementation TileDescriptor

+ (id)databaseTable
{
  return @"pass_tile_descriptor";
}

+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4
{
  id v7 = a3;
  id v5 = a4;
  if ([v7 isEqualToString:@"pass.unique_id"])
  {
    v6 = @"JOIN pass ON pass_tile_descriptor.pass_pid = pass.pid";
LABEL_5:
    [v5 addObject:v6];
    goto LABEL_6;
  }

  if ([v7 isEqualToString:@"pass_tile_metadata.context_identifier"])
  {
    v6 = @"JOIN pass_tile_metadata ON pass_tile_descriptor.metadata_pid = pass_tile_metadata.pid";
    goto LABEL_5;
  }

- (TileDescriptor)initWithDescriptor:(id)a3 groupDescriptor:(id)a4 metadata:(id)a5 state:(id)a6 order:(int64_t)a7 forPass:(id)a8 inDatabase:(id)a9
{
  id v14 = a9;
  id v15 = a8;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  v20 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setEntityPIDOrNull:forKey:](v20, "setEntityPIDOrNull:forKey:", v17, @"metadata_pid");

  -[NSMutableDictionary setEntityPIDOrNull:forKey:](v20, "setEntityPIDOrNull:forKey:", v16, @"state_pid");
  -[NSMutableDictionary setEntityPIDOrNull:forKey:](v20, "setEntityPIDOrNull:forKey:", v15, @"pass_pid");

  -[NSMutableDictionary setEntityPIDOrNull:forKey:]( v20,  "setEntityPIDOrNull:forKey:",  v18,  @"group_descriptor_pid");
  v21 = (void *)objc_claimAutoreleasedReturnValue([v19 defaultStateIdentifier]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v20, "setObjectOrNull:forKey:", v21, @"default_state_identifier");

  id v22 = [v19 isDefaultEnabled];
  -[NSMutableDictionary setBool:forKey:](v20, "setBool:forKey:", v22, @"default_state_enabled");
  -[NSMutableDictionary setInteger:forKey:](v20, "setInteger:forKey:", a7, @"internal_tile_order");
  v23 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v20, v14);

  return v23;
}

+ (id)insertDescriptor:(id)a3 groupDescriptor:(id)a4 withState:(id)a5 order:(int64_t)a6 forPass:(id)a7 inDatabase:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  if (v17)
  {
    uint64_t v30 = 0LL;
    v31 = &v30;
    uint64_t v32 = 0x3032000000LL;
    v33 = sub_10038956C;
    v34 = sub_10038957C;
    id v35 = 0LL;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_100389584;
    v21[3] = &unk_1006591C0;
    id v22 = v14;
    id v23 = v18;
    id v24 = v16;
    v27 = &v30;
    id v28 = a1;
    id v25 = v15;
    int64_t v29 = a6;
    id v26 = v17;
    sub_1002CCC5C((uint64_t)v23, v21);
    id v19 = (id)v31[5];

    _Block_object_dispose(&v30, 8);
  }

  else
  {
    id v19 = 0LL;
  }

  return v19;
}

+ (id)descriptorsInDatabase:(id)a3 forPassUniqueID:(id)a4 context:(int64_t)a5
{
  id v8 = a3;
  id v22 = a4;
  id v36 = 0LL;
  __int128 v35 = 0uLL;
  v38 = @"state_pid";
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v38, 1LL));
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[TileDescriptor _propertySettersWithProperties:effectiveProperties:indices:]( &OBJC_CLASS___TileDescriptor,  "_propertySettersWithProperties:effectiveProperties:indices:",  v9,  &v36,  &v35));

  v11 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPassUniqueID:v22]);
  v37[0] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForNullGroupID]);
  v37[1] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForContext:a5]);
  v37[2] = v13;
  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v37, 3LL));
  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v14));

  id v16 = (void *)objc_claimAutoreleasedReturnValue([a1 _tileDescriptorQueryWithPredicate:v15 inDatabase:v8]);
  uint64_t v29 = 0LL;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x3032000000LL;
  uint64_t v32 = sub_10038956C;
  v33 = sub_10038957C;
  id v34 = 0LL;
  id v17 = v36;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_100389948;
  v23[3] = &unk_10064A190;
  id v26 = &v29;
  id v27 = a1;
  id v18 = v10;
  id v24 = v18;
  __int128 v28 = v35;
  id v19 = v8;
  id v25 = v19;
  [v16 enumeratePersistentIDsAndProperties:v17 usingBlock:v23];
  id v20 = [(id)v30[5] copy];

  _Block_object_dispose(&v29, 8);
  return v20;
}

+ (id)updatePassTileDescriptorStatesInDatabase:(id)a3 forPassUniqueID:(id)a4 forContext:(int64_t)a5 withTransform:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v28 = 0LL;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x3032000000LL;
  uint64_t v31 = sub_10038956C;
  uint64_t v32 = sub_10038957C;
  id v33 = 0LL;
  id v18 = _NSConcreteStackBlock;
  uint64_t v19 = 3221225472LL;
  id v20 = sub_100389B60;
  v21 = &unk_100659210;
  id v26 = a1;
  id v13 = v11;
  id v22 = v13;
  int64_t v27 = a5;
  id v14 = v10;
  id v23 = v14;
  id v25 = &v28;
  id v15 = v12;
  id v24 = v15;
  sub_1002CCC5C((uint64_t)v14, &v18);
  id v16 = objc_msgSend((id)v29[5], "copy", v18, v19, v20, v21);

  _Block_object_dispose(&v28, 8);
  return v16;
}

+ (void)deleteEntitiesForPassPID:(unint64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForPassPID:a3]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryWithDatabase:predicate:]( &OBJC_CLASS___TileDescriptor,  "queryWithDatabase:predicate:",  v6,  v8));

  [v7 deleteAllEntities];
}

- (BOOL)deleteFromDatabase
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TileDescriptor metadata](self, "metadata"));
  [v3 deleteFromDatabase];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TileDescriptor state](self, "state"));
  [v4 deleteFromDatabase];

  +[TileState deleteEntitiesForDescriptor:inDatabase:]( &OBJC_CLASS___TileState,  "deleteEntitiesForDescriptor:inDatabase:",  self,  self->super._database);
  +[TileDescriptor _deleteEntitiesForGroupDescriptor:inDatabase:]( &OBJC_CLASS___TileDescriptor,  "_deleteEntitiesForGroupDescriptor:inDatabase:",  self,  self->super._database);
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TileDescriptor;
  return -[SQLiteEntity deleteFromDatabase](&v6, "deleteFromDatabase");
}

+ (void)_deleteEntitiesForGroupDescriptor:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_predicateForGroupDescriptorPID:", objc_msgSend(a3, "persistentID")));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryWithDatabase:predicate:]( &OBJC_CLASS___TileDescriptor,  "queryWithDatabase:predicate:",  v6,  v8));

  [v7 deleteAllEntities];
}

- (id)metadata
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"metadata_pid"));
  if (v3) {
    v4 = -[SQLiteEntity initWithPersistentID:inDatabase:]( [TileMetadata alloc],  "initWithPersistentID:inDatabase:",  [v3 longLongValue],  self->super._database);
  }
  else {
    v4 = 0LL;
  }

  return v4;
}

- (id)state
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"state_pid"));
  if (v3) {
    v4 = -[SQLiteEntity initWithPersistentID:inDatabase:]( [TileDescriptorState alloc],  "initWithPersistentID:inDatabase:",  [v3 longLongValue],  self->super._database);
  }
  else {
    v4 = 0LL;
  }

  return v4;
}

+ (id)_predicateForPassPID:(unint64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"pass_pid",  v3));

  return v4;
}

+ (id)_predicateForPassUniqueID:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"pass.unique_id",  a3);
}

+ (id)_predicateForNullGroupID
{
  return +[SQLiteNullPredicate isNullPredicateWithProperty:]( &OBJC_CLASS___SQLiteNullPredicate,  "isNullPredicateWithProperty:",  @"group_descriptor_pid");
}

+ (id)_predicateForGroupDescriptorPID:(unint64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"group_descriptor_pid",  v3));

  return v4;
}

+ (id)_predicateForContext:(int64_t)a3
{
  uint64_t v5 = PKPassTileContextToString(a3);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  if (a3 == 1)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForNullGroupID]);
    v17[0] = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteNullPredicate isNullPredicateWithProperty:]( &OBJC_CLASS___SQLiteNullPredicate,  "isNullPredicateWithProperty:",  @"pass_tile_metadata.context_identifier"));
    v17[1] = v9;
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v17, 2LL));
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v10));
    -[NSMutableArray addObject:](v7, "addObject:", v11);
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"pass_tile_metadata.context_identifier",  v6));
  id v16 = v12;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v16, 1LL));
  -[NSMutableArray addObjectsFromArray:](v7, "addObjectsFromArray:", v13);

  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAnyPredicates:",  v7));
  return v14;
}

+ (id)_tileDescriptorQueryWithPredicate:(id)a3 inDatabase:(id)a4
{
  id v12 = @"internal_tile_order";
  id v5 = a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v12, 1LL));
  id v11 = @"ASC";
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v11, 1LL));
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryWithDatabase:predicate:orderingProperties:orderingDirections:]( &OBJC_CLASS___TileDescriptor,  "queryWithDatabase:predicate:orderingProperties:orderingDirections:",  v5,  v6,  v7,  v8));

  return v9;
}

+ (id)_propertySettersWithProperties:(id)a3 effectiveProperties:(id *)a4 indices:(id *)a5
{
  id v7 = a3;
  id v8 = 0LL;
  if (a4 && a5)
  {
    v26[0] = @"default_state_identifier";
    v26[1] = @"default_state_enabled";
    v27[0] = &stru_100659250;
    v27[1] = &stru_100659270;
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v27,  v26,  2LL));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 allKeys]);
    id v10 = [v9 mutableCopy];

    a5->var0 = (unint64_t)[v10 count];
    [v10 addObject:@"metadata_pid"];
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    id v20 = v7;
    id v11 = v7;
    id v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v22;
      do
      {
        for (i = 0LL; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v22 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v21 + 1) + 8LL * (void)i);
          if ([v10 indexOfObject:v16] == (id)0x7FFFFFFFFFFFFFFFLL) {
            [v10 addObject:v16];
          }
        }

        id v13 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }

      while (v13);
    }

    a5->var1 = (unint64_t)[v10 indexOfObject:@"state_pid"];
    id v17 = [v10 copy];
    id v18 = *a4;
    *a4 = v17;

    id v7 = v20;
  }

  return v8;
}

+ (id)_createDescriptorStatePairForPID:(int64_t)a3 withProperties:(id)a4 values:(const void *)a5 propertySetters:(id)a6 indices:(id)a7 inDatabase:(id)a8 supportGroups:(BOOL)a9
{
  unint64_t var1 = a7.var1;
  unint64_t var0 = a7.var0;
  id v14 = a4;
  id v15 = a6;
  id v16 = a8;
  id v17 = (void *)a5[var1];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = -[SQLiteEntity initWithPersistentID:inDatabase:]( [TileDescriptorState alloc],  "initWithPersistentID:inDatabase:",  [v18 longLongValue],  v16);
  }

  else
  {
    uint64_t v19 = 0LL;
  }

  v38 = v14;
  id v20 = v15;
  id v21 = objc_msgSend( a1,  "_createDescriptorForPID:withProperties:values:propertySetters:indices:inDatabase:",  a3,  v14,  a5,  v15,  var0,  var1,  v16);
  __int128 v22 = v19;
  __int128 v23 = (void *)objc_claimAutoreleasedReturnValue(-[TileDescriptorState passTileDescriptorState](v19, "passTileDescriptorState"));
  __int128 v24 = v23;
  if (v23)
  {
    id v25 = v23;
  }

  else
  {
    id v26 = objc_alloc(&OBJC_CLASS___PKPassTileDescriptorState);
    int64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v21 metadata]);
    id v25 = -[PKPassTileDescriptorState initForType:](v26, "initForType:", [v27 type]);

    id v20 = v15;
  }

  uint64_t v54 = 0LL;
  v55 = &v54;
  uint64_t v56 = 0x2020000000LL;
  char v57 = 0;
  uint64_t v48 = 0LL;
  v49 = &v48;
  uint64_t v50 = 0x3032000000LL;
  v51 = sub_10038956C;
  v52 = sub_10038957C;
  id v53 = 0LL;
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v21 metadata]);
  uint64_t v29 = v22;
  uint64_t v30 = v25;
  unsigned int v31 = [v28 isGroupType];

  if (!v31) {
    goto LABEL_11;
  }
  if (!a9) {
    goto LABEL_10;
  }
  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForGroupDescriptorPID:a3]);
  id v33 = (void *)objc_claimAutoreleasedReturnValue([a1 _tileDescriptorQueryWithPredicate:v32 inDatabase:v16]);

  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472LL;
  v40[2] = sub_10038AAAC;
  v40[3] = &unk_100659298;
  v43 = &v48;
  id v45 = a1;
  id v41 = v20;
  unint64_t v46 = var0;
  unint64_t v47 = var1;
  id v42 = v16;
  v44 = &v54;
  [v33 enumeratePersistentIDsAndProperties:v38 usingBlock:v40];
  LODWORD(v32) = *((unsigned __int8 *)v55 + 24);

  if ((_DWORD)v32)
  {
LABEL_10:
    id v34 = 0LL;
  }

  else
  {
LABEL_11:
    __int128 v35 = objc_alloc(&OBJC_CLASS___PDPassTileDescriptorDescriptorStatePair);
    id v36 = [(id)v49[5] copy];
    id v34 = sub_1000FB4C8((id *)&v35->super.isa, v21, v30, v36);
  }

  _Block_object_dispose(&v48, 8);

  _Block_object_dispose(&v54, 8);
  return v34;
}

+ (id)_createUpdatedDescriptorPairForPID:(int64_t)a3 transform:(id)a4 withProperties:(id)a5 values:(const void *)a6 propertySetters:(id)a7 indices:(id)a8 inDatabase:(id)a9 updated:(BOOL *)a10 supportGroups:(BOOL)a11
{
  id v16 = (uint64_t (**)(id, id, id))a4;
  id v17 = a5;
  id v49 = a7;
  id v18 = a9;
  uint64_t v19 = (void *)a6[a8.var1];
  if (v19)
  {
    id v20 = v19;
    id v21 = -[SQLiteEntity initWithPersistentID:inDatabase:]( [TileDescriptorState alloc],  "initWithPersistentID:inDatabase:",  [v20 longLongValue],  v18);
  }

  else
  {
    id v21 = 0LL;
  }

  uint64_t v48 = v17;
  id v22 = objc_msgSend( a1,  "_createDescriptorForPID:withProperties:values:propertySetters:indices:inDatabase:",  a3,  v17,  a6,  v49,  a8.var0,  a8.var1,  v18);
  __int128 v23 = (void *)objc_claimAutoreleasedReturnValue(-[TileDescriptorState passTileDescriptorState](v21, "passTileDescriptorState"));
  __int128 v24 = v23;
  if (v23)
  {
    id v25 = v23;
  }

  else
  {
    id v26 = objc_alloc(&OBJC_CLASS___PKPassTileDescriptorState);
    int64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v22 metadata]);
    id v25 = -[PKPassTileDescriptorState initForType:](v26, "initForType:", [v27 type]);
  }

  uint64_t v28 = v16[2](v16, v22, v25);
  uint64_t v29 = objc_claimAutoreleasedReturnValue(v28);
  uint64_t v30 = (void *)v29;
  if (v29) {
    unsigned int v31 = (void *)v29;
  }
  else {
    unsigned int v31 = v25;
  }
  id v32 = v31;

  if (v25 != v32 && ([v25 isEqualToUnresolvedState:v32] & 1) == 0)
  {
    if (v21 && !-[TileDescriptorState deleteFromDatabase](v21, "deleteFromDatabase"))
    {
      v38 = 0LL;
      unint64_t v47 = v21;
      goto LABEL_22;
    }

    id v42 = (TileDescriptorState *)objc_claimAutoreleasedReturnValue( +[TileDescriptorState insertState:inDatabase:]( &OBJC_CLASS___TileDescriptorState,  "insertState:inDatabase:",  v32,  v18));

    if (v42)
    {
      id v46 = a1;
      v43 = -[SQLiteEntity initWithPersistentID:inDatabase:]( objc_alloc(&OBJC_CLASS___TileDescriptor),  "initWithPersistentID:inDatabase:",  a3,  v18);
      unint64_t v47 = v42;
      v44 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  -[SQLiteEntity persistentID](v42, "persistentID")));
      unsigned int v45 = -[SQLiteEntity setValue:forProperty:](v43, "setValue:forProperty:", v44, @"state_pid");

      if (v45)
      {
        if (a10) {
          *a10 = 1;
        }

        a1 = v46;
        goto LABEL_13;
      }
    }

    else
    {
      unint64_t v47 = 0LL;
    }

    v38 = 0LL;
    goto LABEL_22;
  }

  unint64_t v47 = v21;
LABEL_13:
  uint64_t v67 = 0LL;
  v68 = &v67;
  uint64_t v69 = 0x3032000000LL;
  v70 = sub_10038956C;
  v71 = sub_10038957C;
  id v72 = 0LL;
  id v33 = (void *)objc_claimAutoreleasedReturnValue([v22 metadata]);
  unsigned int v34 = [v33 isGroupType];

  if (!v34) {
    goto LABEL_20;
  }
  if (!a11) {
    goto LABEL_19;
  }
  __int128 v35 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForGroupDescriptorPID:a3]);
  id v36 = (void *)objc_claimAutoreleasedReturnValue([a1 _tileDescriptorQueryWithPredicate:v35 inDatabase:v18]);

  uint64_t v63 = 0LL;
  v64 = &v63;
  uint64_t v65 = 0x2020000000LL;
  char v66 = 0;
  uint64_t v59 = 0LL;
  v60 = &v59;
  uint64_t v61 = 0x2020000000LL;
  char v62 = 0;
  v50[0] = _NSConcreteStackBlock;
  v50[1] = 3221225472LL;
  v50[2] = sub_10038B044;
  v50[3] = &unk_1006591E8;
  uint64_t v54 = &v67;
  id v57 = a1;
  id v53 = v16;
  id v51 = v49;
  $7DEDF3842AEFB7F1E6DF5AF62E424A02 v58 = a8;
  id v52 = v18;
  v55 = &v59;
  uint64_t v56 = &v63;
  [v36 enumeratePersistentIDsAndProperties:v48 usingBlock:v50];
  int v37 = *((unsigned __int8 *)v64 + 24);
  if (a10 && !*((_BYTE *)v64 + 24)) {
    *a10 |= *((_BYTE *)v60 + 24);
  }

  _Block_object_dispose(&v59, 8);
  _Block_object_dispose(&v63, 8);

  if (v37)
  {
LABEL_19:
    v38 = 0LL;
  }

  else
  {
LABEL_20:
    v39 = objc_alloc(&OBJC_CLASS___PDPassTileDescriptorDescriptorStatePair);
    id v40 = [(id)v68[5] copy];
    v38 = sub_1000FB4C8((id *)&v39->super.isa, v22, v32, v40);
  }

  _Block_object_dispose(&v67, 8);

LABEL_22:
  return v38;
}

+ (id)_createDescriptorForPID:(int64_t)a3 withProperties:(id)a4 values:(const void *)a5 propertySetters:(id)a6 indices:(id)a7 inDatabase:(id)a8
{
  unint64_t var0 = a7.var0;
  id v13 = a8;
  id v14 = a6;
  id v15 = a4;
  id v16 = -[PKPassTileDescriptor _init](objc_alloc(&OBJC_CLASS___PKPassTileDescriptor), "_init");
  +[SQLiteEntity applyPropertySetters:toObject:withProperties:values:]( &OBJC_CLASS___TileDescriptor,  "applyPropertySetters:toObject:withProperties:values:",  v14,  v16,  v15,  a5);

  id v17 = (id)a5[var0];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));

    if (v18 != v19)
    {
      id v20 = -[SQLiteEntity initWithPersistentID:inDatabase:]( [TileMetadata alloc],  "initWithPersistentID:inDatabase:",  [v18 longLongValue],  v13);
      id v21 = (void *)objc_claimAutoreleasedReturnValue(-[TileMetadata metadata](v20, "metadata"));
      [v16 setMetadata:v21];
    }
  }

  id v22 = (void *)objc_claimAutoreleasedReturnValue( +[TileState statesForDescriptorPID:inDatabase:]( &OBJC_CLASS___TileState,  "statesForDescriptorPID:inDatabase:",  a3,  v13));
  [v16 setStates:v22];

  return v16;
}

@end