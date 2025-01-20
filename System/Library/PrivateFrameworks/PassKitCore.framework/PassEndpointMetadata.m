@interface PassEndpointMetadata
+ (id)_predicateForPassPID:(int64_t)a3;
+ (id)_predicateForPassPID:(int64_t)a3 type:(unint64_t)a4;
+ (id)_predicateForType:(unint64_t)a3;
+ (id)_propertySettersForEndpointMetadata;
+ (id)_propertyValuesForEndpointMetadata:(id)a3;
+ (id)anyInDatabase:(id)a3 passUniqueID:(id)a4 type:(unint64_t)a5;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertOrUpdateWithEndpointMetadata:(id)a3 inDatabase:(id)a4;
+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4;
+ (void)deleteEndpointMetadataForPassUniqueID:(id)a3 type:(unint64_t)a4 inDatabase:(id)a5;
+ (void)deleteEntitiesForPassPID:(int64_t)a3 inDatabase:(id)a4;
- (PassEndpointMetadata)initWithEndpointMetadata:(id)a3 passPID:(int64_t)a4 inDatabase:(id)a5;
- (id)endpointMetadata;
- (void)updateWithEndpointMetadata:(id)a3;
@end

@implementation PassEndpointMetadata

+ (id)databaseTable
{
  return @"pass_endpoint_metadata";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class(&OBJC_CLASS___Pass, a2) == a3) {
    return @"pass_pid";
  }
  else {
    return 0LL;
  }
}

+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (__CFString *)v5;
  v9 = v7;
  if (v7 == @"pass.unique_id"
    || v7
    && (unsigned int v8 = -[__CFString isEqualToString:](v7, "isEqualToString:", @"pass.unique_id"),
        v9,
        v8))
  {
    [v6 addObject:@"JOIN pass ON pass.pid = pass_endpoint_metadata.pass_pid"];
  }
}

+ (id)insertOrUpdateWithEndpointMetadata:(id)a3 inDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v6 passUniqueID]);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[Pass anyInDatabase:withUniqueID:](&OBJC_CLASS___Pass, "anyInDatabase:withUniqueID:", v7, v8));

  if (v9)
  {
    id v10 = [v9 persistentID];
    v11 = (void *)objc_claimAutoreleasedReturnValue([v6 passUniqueID]);
    id v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "anyInDatabase:passUniqueID:type:", v7, v11, objc_msgSend(v6, "type")));

    if (v12) {
      [v12 updateWithEndpointMetadata:v6];
    }
    else {
      id v12 = [objc_alloc((Class)a1) initWithEndpointMetadata:v6 passPID:v10 inDatabase:v7];
    }
  }

  else
  {
    id v12 = 0LL;
  }

  return v12;
}

- (PassEndpointMetadata)initWithEndpointMetadata:(id)a3 passPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v11 = objc_msgSend((id)objc_opt_class(self, v10), "_propertyValuesForEndpointMetadata:", v9);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  [v12 setObjectOrNull:v13 forKey:@"pass_pid"];

  v14 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v12, v8);
  return v14;
}

- (void)updateWithEndpointMetadata:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend((id)objc_opt_class(self, v5), "_propertyValuesForEndpointMetadata:", v4);
  id v7 = (id)objc_claimAutoreleasedReturnValue(v6);

  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v7);
}

+ (id)anyInDatabase:(id)a3 passUniqueID:(id)a4 type:(unint64_t)a5
{
  id v8 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[Pass anyInDatabase:withUniqueID:](&OBJC_CLASS___Pass, "anyInDatabase:withUniqueID:", v8, a4));
  uint64_t v10 = v9;
  if (v9)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_predicateForPassPID:type:", objc_msgSend(v9, "persistentID"), a5));
    id v12 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v8 predicate:v11]);
  }

  else
  {
    id v12 = 0LL;
  }

  return v12;
}

+ (void)deleteEndpointMetadataForPassUniqueID:(id)a3 type:(unint64_t)a4 inDatabase:(id)a5
{
  id v5 = (id)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:a5 passUniqueID:a3 type:a4]);
  [v5 deleteFromDatabase];
}

+ (void)deleteEntitiesForPassPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForPassPID:a3]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

+ (id)_predicateForPassPID:(int64_t)a3 type:(unint64_t)a4
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPassPID:a3]);
  v11[0] = v6;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForType:a4]);
  v11[1] = v7;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v11, 2LL));
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v8));

  return v9;
}

+ (id)_predicateForPassPID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"pass_pid",  v3));

  return v4;
}

+ (id)_predicateForType:(unint64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"type",  v3));

  return v4;
}

- (id)endpointMetadata
{
  v3 = objc_alloc_init(&OBJC_CLASS___PDPassEndpointMetadata);
  id v5 = objc_msgSend((id)objc_opt_class(self, v4), "_propertySettersForEndpointMetadata");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100063A10;
  v13[3] = &unk_100638EF0;
  v13[4] = self;
  id v14 = v6;
  id v8 = v3;
  v15 = v8;
  id v9 = v6;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v7, v13);

  uint64_t v10 = v15;
  id v11 = v8;

  return v11;
}

+ (id)_propertyValuesForEndpointMetadata:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 lastUpdated]);
  id v6 = (void *)_SQLValueForDate(v5);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v6, @"last_updated");

  -[NSMutableDictionary setBool:forKey:](v4, "setBool:forKey:", [v3 isDirty], @"is_dirty");
  id v7 = [v3 type];

  -[NSMutableDictionary setInteger:forKey:](v4, "setInteger:forKey:", v7, @"type");
  return v4;
}

+ (id)_propertySettersForEndpointMetadata
{
  v3[0] = @"last_updated";
  v3[1] = @"is_dirty";
  v4[0] = &stru_10063D768;
  v4[1] = &stru_10063D788;
  v3[2] = @"type";
  v3[3] = @"pass.unique_id";
  v4[2] = &stru_10063D7A8;
  v4[3] = &stru_10063D7C8;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  4LL));
}

@end