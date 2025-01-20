@interface TileDescriptorStateParticipant
+ (BOOL)removeParticipantsForPassUniqueID:(id)a3 inDatabase:(id)a4;
+ (BOOL)setPassTileDescriptorStateParticipantIDs:(id)a3 forPassUniqueID:(id)a4 inDatabase:(id)a5;
+ (id)_predicateForParticipantID:(id)a3;
+ (id)_predicateForPassUniqueID:(id)a3;
+ (id)databaseTable;
+ (id)passUniqueIdentifiersForTileDescriptorStateParticipantWithIdentifier:(id)a3 inDatabase:(id)a4;
+ (id)passUniqueIdentifiersInDatabase:(id)a3;
+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4;
- (id)_initWitParticipantID:(id)a3 forPass:(id)a4 inDatabase:(id)a5;
@end

@implementation TileDescriptorStateParticipant

+ (id)databaseTable
{
  return @"pass_tile_descriptor_state_participant";
}

+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4
{
  id v5 = a4;
}

- (id)_initWitParticipantID:(id)a3 forPass:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObjectOrNull:forKey:](v11, "setObjectOrNull:forKey:", v10, @"participant_identifier");

  -[NSMutableDictionary setEntityPIDOrNull:forKey:](v11, "setEntityPIDOrNull:forKey:", v9, @"pass_pid");
  v12 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v11, v8);

  return v12;
}

+ (id)passUniqueIdentifiersInDatabase:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  v6 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v4 predicate:0]);

  v13 = @"pass.unique_id";
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v13, 1LL));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100063EEC;
  v11[3] = &unk_10063D7F0;
  id v8 = v5;
  v12 = v8;
  [v6 enumerateProperties:v7 usingBlock:v11];

  if (-[NSMutableSet count](v8, "count")) {
    id v9 = -[NSMutableSet copy](v8, "copy");
  }
  else {
    id v9 = 0LL;
  }

  return v9;
}

+ (id)passUniqueIdentifiersForTileDescriptorStateParticipantWithIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForParticipantID:v7]);

  id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v9]);
  v17 = @"pass.unique_id";
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v17, 1LL));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100064060;
  v15[3] = &unk_10063D7F0;
  v12 = v8;
  v16 = v12;
  [v10 enumerateProperties:v11 usingBlock:v15];

  if (-[NSMutableSet count](v12, "count")) {
    id v13 = -[NSMutableSet copy](v12, "copy");
  }
  else {
    id v13 = 0LL;
  }

  return v13;
}

+ (BOOL)setPassTileDescriptorStateParticipantIDs:(id)a3 forPassUniqueID:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v20 = 0LL;
  v21 = &v20;
  uint64_t v22 = 0x2020000000LL;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100064184;
  v14[3] = &unk_1006391A8;
  id v10 = a5;
  id v15 = v10;
  id v11 = v9;
  id v16 = v11;
  id v19 = a1;
  id v12 = v8;
  id v17 = v12;
  v18 = &v20;
  sub_1002CCC5C((uint64_t)v10, v14);
  LOBYTE(v8) = *((_BYTE *)v21 + 24);

  _Block_object_dispose(&v20, 8);
  return (char)v8;
}

+ (BOOL)removeParticipantsForPassUniqueID:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPassUniqueID:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);

  LOBYTE(v6) = [v8 deleteAllEntities];
  return (char)v6;
}

+ (id)_predicateForParticipantID:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"participant_identifier",  a3);
}

+ (id)_predicateForPassUniqueID:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"pass.unique_id",  a3);
}

@end