@interface CloudStoreZone
+ (BOOL)didFinishInitialSyncForCloudStoreZone:(id)a3 forContainerDatabase:(id)a4 inDatabase:(id)a5;
+ (id)_cloudStoreZoneWithName:(id)a3 containerDatabase:(id)a4 inDatabase:(id)a5;
+ (id)_cloudStoreZonesWithQuery:(id)a3;
+ (id)_predicateForDatabasePID:(int64_t)a3;
+ (id)_predicateForPID:(int64_t)a3;
+ (id)_predicateForZoneName:(id)a3;
+ (id)_predicateForZoneName:(id)a3 forContainerDatabase:(id)a4;
+ (id)_propertySettersForCloudStoreZone;
+ (id)anyInDatabase:(id)a3 forCloudStoreZone:(id)a4;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)cloudStoreZoneWithPID:(int64_t)a3 inDatabase:(id)a4;
+ (id)cloudStoreZonesForContainerDatabase:(id)a3 inDatabase:(id)a4;
+ (id)databaseTable;
+ (id)fetchTimestampForCloudStoreZone:(id)a3 forContainerDatabase:(id)a4 inDatabase:(id)a5;
+ (id)insertOrUpdateCloudStoreZone:(id)a3 forContainerDatabase:(id)a4 inDatabase:(id)a5;
+ (id)tokenDataForCloudStoreZone:(id)a3 forContainerDatabase:(id)a4 inDatabase:(id)a5;
+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4;
+ (void)deleteEntitiesForCloudStoreDatabase:(id)a3 inDatabase:(id)a4;
+ (void)removeCloudStoreZone:(id)a3 forContainerDatabase:(id)a4 inDatabase:(id)a5;
+ (void)updateChangeToken:(id)a3 fetchTimestamp:(id)a4 forCloudStoreZone:(id)a5 inContainerDatabase:(id)a6 inDatabase:(id)a7;
+ (void)updateDidFinishInitialSync:(BOOL)a3 forCloudStoreZone:(id)a4 inContainerDatabase:(id)a5 inDatabase:(id)a6;
- (BOOL)deleteFromDatabase;
- (CloudStoreZone)initWithCloudStoreZone:(id)a3 forContainerDatabase:(id)a4 inDatabase:(id)a5;
- (id)_commonDictionaryForCloudStoreZone:(id)a3 forContainerDatabase:(id)a4;
- (id)cloudStoreZone;
- (id)zoneName;
- (void)updateWithCloudStoreZone:(id)a3 forContainerDatabase:(id)a4;
- (void)updateWithShareParticipants:(id)a3;
@end

@implementation CloudStoreZone

+ (id)databaseTable
{
  return @"cloud_store_zone";
}

+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (__CFString *)v5;
  v12 = v7;
  if (v7 == @"cloud_store_database.container_name"
    || v7
    && ((unsigned __int8 v8 = [@"cloud_store_database.container_name" isEqualToString:v7],
         v12,
         (v8 & 1) != 0)
     || (v9 = v12, v9 == @"cloud_store_database.scope")
     || (v10 = v9,
         unsigned int v11 = [@"cloud_store_database.scope" isEqualToString:v9],
         v10,
         v11)))
  {
    [v6 addObject:@"JOIN cloud_store_database ON cloud_store_database.pid = cloud_store_zone.container_database_pid"];
  }
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class(&OBJC_CLASS___CloudStoreContainerDatabase, a2) == a3) {
    return @"container_database_pid";
  }
  else {
    return 0LL;
  }
}

+ (id)insertOrUpdateCloudStoreZone:(id)a3 forContainerDatabase:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v8 zoneName]);
  id v12 = (id)objc_claimAutoreleasedReturnValue([a1 _cloudStoreZoneWithName:v11 containerDatabase:v9 inDatabase:v10]);

  if (v12) {
    [v12 updateWithCloudStoreZone:v8 forContainerDatabase:v9];
  }
  else {
    id v12 = [objc_alloc((Class)a1) initWithCloudStoreZone:v8 forContainerDatabase:v9 inDatabase:v10];
  }

  return v12;
}

+ (void)updateChangeToken:(id)a3 fetchTimestamp:(id)a4 forCloudStoreZone:(id)a5 inContainerDatabase:(id)a6 inDatabase:(id)a7
{
  id v18 = a3;
  id v12 = a4;
  id v13 = a7;
  id v14 = a6;
  v15 = (void *)objc_claimAutoreleasedReturnValue([a5 zoneName]);
  v16 = (void *)objc_claimAutoreleasedReturnValue([a1 _cloudStoreZoneWithName:v15 containerDatabase:v14 inDatabase:v13]);

  if (v16)
  {
    [v16 setValue:v18 forProperty:@"token_data"];
    v17 = (void *)_SQLValueForDate(v12);
    [v16 setValue:v17 forProperty:@"fetch_timestamp"];
  }
}

+ (void)updateDidFinishInitialSync:(BOOL)a3 forCloudStoreZone:(id)a4 inContainerDatabase:(id)a5 inDatabase:(id)a6
{
  BOOL v8 = a3;
  id v10 = a6;
  id v11 = a5;
  id v12 = (void *)objc_claimAutoreleasedReturnValue([a4 zoneName]);
  id v14 = (id)objc_claimAutoreleasedReturnValue([a1 _cloudStoreZoneWithName:v12 containerDatabase:v11 inDatabase:v10]);

  if (v14)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v8));
    [v14 setValue:v13 forProperty:@"did_finish_initial_sync"];
  }
}

- (CloudStoreZone)initWithCloudStoreZone:(id)a3 forContainerDatabase:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( -[CloudStoreZone _commonDictionaryForCloudStoreZone:forContainerDatabase:]( self,  "_commonDictionaryForCloudStoreZone:forContainerDatabase:",  v8,  a4));
  id v11 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v10, v9);

  id v12 = v11;
  if (v12)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 shareParticipants]);
    -[CloudStoreZone updateWithShareParticipants:](v12, "updateWithShareParticipants:", v13);
  }

  return v12;
}

- (void)updateWithCloudStoreZone:(id)a3 forContainerDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 shareParticipants]);
  -[CloudStoreZone updateWithShareParticipants:](self, "updateWithShareParticipants:", v8);

  id v9 = (id)objc_claimAutoreleasedReturnValue( -[CloudStoreZone _commonDictionaryForCloudStoreZone:forContainerDatabase:]( self,  "_commonDictionaryForCloudStoreZone:forContainerDatabase:",  v7,  v6));
  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v9);
}

- (void)updateWithShareParticipants:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  +[CloudStoreZoneShareParticipant updateShareParticipants:forCloudStoreZone:inDatabase:]( &OBJC_CLASS___CloudStoreZoneShareParticipant,  "updateShareParticipants:forCloudStoreZone:inDatabase:",  v4,  self,  v5);
}

+ (id)anyInDatabase:(id)a3 forCloudStoreZone:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 containerName]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[CloudStoreContainerDatabase anyInDatabase:withContainerName:scope:]( CloudStoreContainerDatabase,  "anyInDatabase:withContainerName:scope:",  v7,  v8,  [v6 scope]));

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 zoneName]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([a1 _cloudStoreZoneWithName:v10 containerDatabase:v9 inDatabase:v7]);

  return v11;
}

+ (id)cloudStoreZoneWithPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPID:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 cloudStoreZone]);
  return v9;
}

+ (id)_cloudStoreZoneWithName:(id)a3 containerDatabase:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForZoneName:a3 forContainerDatabase:a4]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v8 predicate:v9]);

  return v10;
}

+ (void)removeCloudStoreZone:(id)a3 forContainerDatabase:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([a3 zoneName]);
  id v12 = (id)objc_claimAutoreleasedReturnValue([a1 _cloudStoreZoneWithName:v10 containerDatabase:v9 inDatabase:v8]);

  id v11 = v12;
  if (v12)
  {
    [v12 deleteFromDatabase];
    id v11 = v12;
  }
}

- (BOOL)deleteFromDatabase
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  +[CloudStoreZoneShareParticipant deleteEntitiesForCloudStoreZone:inDatabase:]( &OBJC_CLASS___CloudStoreZoneShareParticipant,  "deleteEntitiesForCloudStoreZone:inDatabase:",  self,  v3);

  int64_t v4 = -[SQLiteEntity persistentID](self, "persistentID");
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  +[PaymentTransactionArchiveLocation deleteArchiveLocationsForCloudStoreZonePID:inDatabase:]( &OBJC_CLASS___PaymentTransactionArchiveLocation,  "deleteArchiveLocationsForCloudStoreZonePID:inDatabase:",  v4,  v5);

  int64_t v6 = -[SQLiteEntity persistentID](self, "persistentID");
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  +[CloudStoreRecord deleteEntitiesForCloudStoreZonePID:inDatabase:]( &OBJC_CLASS___CloudStoreRecord,  "deleteEntitiesForCloudStoreZonePID:inDatabase:",  v6,  v7);

  int64_t v8 = -[SQLiteEntity persistentID](self, "persistentID");
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  +[CloudStoreShareBackoff deleteEntriesWithCloudStoreZonePID:inDatabase:]( &OBJC_CLASS___CloudStoreShareBackoff,  "deleteEntriesWithCloudStoreZonePID:inDatabase:",  v8,  v9);

  int64_t v10 = -[SQLiteEntity persistentID](self, "persistentID");
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  +[CloudStoreRecordFetchTask deleteAllEntriesForCloudStoreZonePID:inDatabase:]( &OBJC_CLASS___CloudStoreRecordFetchTask,  "deleteAllEntriesForCloudStoreZonePID:inDatabase:",  v10,  v11);

  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___CloudStoreZone;
  return -[SQLiteEntity deleteFromDatabase](&v13, "deleteFromDatabase");
}

+ (void)deleteEntitiesForCloudStoreDatabase:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_predicateForDatabasePID:", objc_msgSend(a3, "persistentID")));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

+ (id)_predicateForZoneName:(id)a3 forContainerDatabase:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForZoneName:a3]);
  v13[0] = v7;
  id v8 = [v6 persistentID];

  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForDatabasePID:v8]);
  v13[1] = v9;
  int64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v13, 2LL));
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v10));

  return v11;
}

+ (id)_predicateForZoneName:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"zone_name",  a3);
}

+ (id)_predicateForDatabasePID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  int64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"container_database_pid",  v3));

  return v4;
}

+ (id)_predicateForPID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  int64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"pid",  v3));

  return v4;
}

+ (id)tokenDataForCloudStoreZone:(id)a3 forContainerDatabase:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  int64_t v10 = (void *)objc_claimAutoreleasedReturnValue([a3 zoneName]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([a1 _cloudStoreZoneWithName:v10 containerDatabase:v9 inDatabase:v8]);

  if (v11) {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 valueForProperty:@"token_data"]);
  }
  else {
    id v12 = 0LL;
  }

  return v12;
}

+ (BOOL)didFinishInitialSyncForCloudStoreZone:(id)a3 forContainerDatabase:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  int64_t v10 = (void *)objc_claimAutoreleasedReturnValue([a3 zoneName]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([a1 _cloudStoreZoneWithName:v10 containerDatabase:v9 inDatabase:v8]);

  if (v11)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 valueForProperty:@"did_finish_initial_sync"]);
    unsigned __int8 v13 = [v12 BOOLValue];
  }

  else
  {
    unsigned __int8 v13 = 0;
  }

  return v13;
}

+ (id)fetchTimestampForCloudStoreZone:(id)a3 forContainerDatabase:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  int64_t v10 = (void *)objc_claimAutoreleasedReturnValue([a3 zoneName]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([a1 _cloudStoreZoneWithName:v10 containerDatabase:v9 inDatabase:v8]);

  if (v11)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 valueForProperty:@"fetch_timestamp"]);
    unsigned __int8 v13 = (void *)_DateForSQLValue(v12);
  }

  else
  {
    unsigned __int8 v13 = 0LL;
  }

  return v13;
}

+ (id)cloudStoreZonesForContainerDatabase:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_predicateForDatabasePID:", objc_msgSend(a3, "persistentID")));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _cloudStoreZonesWithQuery:v8]);
  return v9;
}

+ (id)_cloudStoreZonesWithQuery:(id)a3
{
  id v3 = a3;
  int64_t v4 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  v16 = @"pid";
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v16, 1LL));
  int64_t v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472LL;
  id v12 = sub_10030DF18;
  unsigned __int8 v13 = &unk_100639E18;
  id v14 = v3;
  v15 = v4;
  id v6 = v4;
  id v7 = v3;
  [v7 enumeratePersistentIDsAndProperties:v5 usingBlock:&v10];

  id v8 = -[NSMutableSet copy](v6, "copy", v10, v11, v12, v13);
  return v8;
}

- (id)cloudStoreZone
{
  id v3 = objc_alloc_init(&OBJC_CLASS___PKCloudStoreZone);
  int64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[CloudStoreZone _propertySettersForCloudStoreZone]( &OBJC_CLASS___CloudStoreZone,  "_propertySettersForCloudStoreZone"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allKeys]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  void v13[2] = sub_10030E0DC;
  v13[3] = &unk_100638EF0;
  v13[4] = self;
  id v14 = v4;
  id v6 = v3;
  v15 = v6;
  id v7 = v4;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v5, v13);

  int64_t v8 = -[SQLiteEntity persistentID](self, "persistentID");
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  int64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[CloudStoreZoneShareParticipant shareParticipantsForCloudStoreZonePID:inDatabase:]( &OBJC_CLASS___CloudStoreZoneShareParticipant,  "shareParticipantsForCloudStoreZonePID:inDatabase:",  v8,  v9));

  -[PKCloudStoreZone setShareParticipants:](v6, "setShareParticipants:", v10);
  uint64_t v11 = v6;

  return v11;
}

- (id)zoneName
{
  return -[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"zone_name");
}

- (id)_commonDictionaryForCloudStoreZone:(id)a3 forContainerDatabase:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v8 = [v5 persistentID];

  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v8));
  [v7 setObjectOrNull:v9 forKey:@"container_database_pid"];

  int64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v6 zoneName]);
  [v7 setObjectOrNull:v10 forKey:@"zone_name"];

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v6 ownerName]);
  [v7 setObjectOrNull:v11 forKey:@"zone_owner"];

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 zoneSubscriptionIdentifier]);
  [v7 setObjectOrNull:v12 forKey:@"subscription_id"];

  return v7;
}

+ (id)_propertySettersForCloudStoreZone
{
  v3[0] = @"zone_name";
  v3[1] = @"zone_owner";
  v4[0] = &stru_1006561B0;
  v4[1] = &stru_1006561D0;
  v3[2] = @"cloud_store_database.container_name";
  v3[3] = @"subscription_id";
  v4[2] = &stru_1006561F0;
  v4[3] = &stru_100656210;
  v3[4] = @"cloud_store_database.scope";
  v4[4] = &stru_100656230;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  5LL));
}

@end