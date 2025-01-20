@interface TileMetadataRKE
+ (id)_predicateForBaseMetadata:(id)a3;
+ (id)databaseTable;
+ (id)insertMetadata:(id)a3 forBaseMetadata:(id)a4 inDatabase:(id)a5;
+ (void)deleteEntitiesForBaseMetadata:(id)a3 inDatabase:(id)a4;
+ (void)inflateMetadata:(id)a3 forBaseMetadata:(id)a4 inDatabase:(id)a5;
- (TileMetadataRKE)initWithMetadata:(id)a3 forBaseMetadata:(id)a4 inDatabase:(id)a5;
@end

@implementation TileMetadataRKE

- (TileMetadataRKE)initWithMetadata:(id)a3 forBaseMetadata:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v12 = [v9 persistentID];

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v12));
  -[NSMutableDictionary setObjectOrNull:forKey:](v11, "setObjectOrNull:forKey:", v13, @"metadata_pid");

  v14 = (void *)objc_claimAutoreleasedReturnValue([v10 vehicleFunctions]);
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v14,  1LL,  0LL));
  -[NSMutableDictionary setObjectOrNull:forKey:](v11, "setObjectOrNull:forKey:", v15, @"vehicle_functions");

  v16 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v11, v8);
  return v16;
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
    v20 = &v19;
    uint64_t v21 = 0x3032000000LL;
    v22 = sub_100065840;
    v23 = sub_100065850;
    id v24 = 0LL;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100065858;
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
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryWithDatabase:predicate:orderingProperties:orderingDirections:limit:]( &OBJC_CLASS___TileMetadataRKE,  "queryWithDatabase:predicate:orderingProperties:orderingDirections:limit:",  v9,  v10,  0LL,  0LL,  1LL));

    id v15 = @"vehicle_functions";
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v15, 1LL));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1000659F4;
    v13[3] = &unk_10063C0D0;
    id v14 = v8;
    [v11 enumeratePersistentIDsAndProperties:v12 usingBlock:v13];
  }
}

+ (void)deleteEntitiesForBaseMetadata:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForBaseMetadata:a3]);
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryWithDatabase:predicate:]( &OBJC_CLASS___TileMetadataRKE,  "queryWithDatabase:predicate:",  v6,  v8));

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
  return @"pass_tile_metadata_rke";
}

@end