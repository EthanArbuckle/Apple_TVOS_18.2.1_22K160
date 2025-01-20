@interface TileStateMetadataRKE
+ (id)_predicateForBaseMetadata:(id)a3;
+ (id)databaseTable;
+ (id)insertMetadata:(id)a3 forBaseMetadata:(id)a4 inDatabase:(id)a5;
+ (void)deleteEntitiesForBaseMetadata:(id)a3 inDatabase:(id)a4;
+ (void)inflateMetadata:(id)a3 forBaseMetadata:(id)a4 inDatabase:(id)a5;
- (TileStateMetadataRKE)initWithMetadata:(id)a3 forBaseMetadata:(id)a4 inDatabase:(id)a5;
@end

@implementation TileStateMetadataRKE

- (TileStateMetadataRKE)initWithMetadata:(id)a3 forBaseMetadata:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setEntityPIDOrNull:forKey:](v11, "setEntityPIDOrNull:forKey:", v9, @"state_metadata_pid");

  v12 = (void *)objc_claimAutoreleasedReturnValue([v10 vehicleFunctionStates]);
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v12,  1LL,  0LL));
  -[NSMutableDictionary setObjectOrNull:forKey:](v11, "setObjectOrNull:forKey:", v13, @"vehicle_function_states");

  v14 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v11, v8);
  return v14;
}

+ (id)insertMetadata:(id)a3 forBaseMetadata:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v22 = 0LL;
  v23 = &v22;
  uint64_t v24 = 0x3032000000LL;
  v25 = sub_10037F830;
  v26 = sub_10037F840;
  id v27 = 0LL;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10037F848;
  v16[3] = &unk_10063C260;
  v20 = &v22;
  id v21 = a1;
  id v11 = v8;
  id v17 = v11;
  id v12 = v9;
  id v18 = v12;
  id v13 = v10;
  id v19 = v13;
  sub_1002CCC5C((uint64_t)v13, v16);
  id v14 = (id)v23[5];

  _Block_object_dispose(&v22, 8);
  return v14;
}

+ (void)inflateMetadata:(id)a3 forBaseMetadata:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  if (v8)
  {
    id v9 = a5;
    id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForBaseMetadata:a4]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryWithDatabase:predicate:orderingProperties:orderingDirections:limit:]( &OBJC_CLASS___TileStateMetadataRKE,  "queryWithDatabase:predicate:orderingProperties:orderingDirections:limit:",  v9,  v10,  0LL,  0LL,  1LL));

    v15 = @"vehicle_function_states";
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v15, 1LL));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_10037F9E4;
    v13[3] = &unk_10063C0D0;
    id v14 = v8;
    [v11 enumeratePersistentIDsAndProperties:v12 usingBlock:v13];
  }
}

+ (void)deleteEntitiesForBaseMetadata:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForBaseMetadata:a3]);
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryWithDatabase:predicate:]( &OBJC_CLASS___TileStateMetadataRKE,  "queryWithDatabase:predicate:",  v6,  v8));

  [v7 deleteAllEntities];
}

+ (id)_predicateForBaseMetadata:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [a3 persistentID]));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"state_metadata_pid",  v3));

  return v4;
}

+ (id)databaseTable
{
  return @"pass_tile_state_metadata_rke";
}

@end