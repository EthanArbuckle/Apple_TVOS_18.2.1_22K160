@interface CloudStoreContainerDatabase
+ (id)_cloudStoreDatabaseWithContainerName:(id)a3 scope:(int64_t)a4 inDatabase:(id)a5;
+ (id)_predicateForContainerName:(id)a3;
+ (id)_predicateForContainerName:(id)a3 scope:(int64_t)a4;
+ (id)_predicateForPID:(int64_t)a3;
+ (id)_predicateForScope:(int64_t)a3;
+ (id)anyInDatabase:(id)a3 withContainerName:(id)a4 scope:(int64_t)a5;
+ (id)anyInDatabase:(id)a3 withPID:(int64_t)a4;
+ (id)databaseTable;
+ (id)insertOrUpdateCloudStoreDatabaseWithContainerName:(id)a3 scope:(int64_t)a4 inDatabase:(id)a5;
+ (void)removeCloudStoreDatabaseWithContainerName:(id)a3 scope:(int64_t)a4 inDatabase:(id)a5;
- (BOOL)deleteFromDatabase;
- (CloudStoreContainerDatabase)initWithCloudStoreDatabaseWithContainerName:(id)a3 scope:(int64_t)a4 inDatabase:(id)a5;
- (id)_commonDictionaryFoDatabaseWithScope:(int64_t)a3 containerName:(id)a4;
- (id)cloudStoreZones;
- (id)databaseSubscription;
- (void)updateWithContainerName:(id)a3 scope:(int64_t)a4;
- (void)updateWithDatabaseSubscription:(id)a3;
@end

@implementation CloudStoreContainerDatabase

+ (id)databaseTable
{
  return @"cloud_store_database";
}

+ (id)insertOrUpdateCloudStoreDatabaseWithContainerName:(id)a3 scope:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue([a1 _cloudStoreDatabaseWithContainerName:v8 scope:a4 inDatabase:v9]);
  if (v10)
  {
    id v11 = v10;
    [v10 updateWithContainerName:v8 scope:a4];
  }

  else
  {
    id v11 = [objc_alloc((Class)a1) initWithCloudStoreDatabaseWithContainerName:v8 scope:a4 inDatabase:v9];
  }

  return v11;
}

- (CloudStoreContainerDatabase)initWithCloudStoreDatabaseWithContainerName:(id)a3 scope:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[CloudStoreContainerDatabase _commonDictionaryFoDatabaseWithScope:containerName:]( self,  "_commonDictionaryFoDatabaseWithScope:containerName:",  a4,  a3));
  v10 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v9, v8);

  return v10;
}

- (void)updateWithContainerName:(id)a3 scope:(int64_t)a4
{
  id v5 = (id)objc_claimAutoreleasedReturnValue( -[CloudStoreContainerDatabase _commonDictionaryFoDatabaseWithScope:containerName:]( self,  "_commonDictionaryFoDatabaseWithScope:containerName:",  a4,  a3));
  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v5);
}

- (void)updateWithDatabaseSubscription:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue([a3 subscriptionID]);
  -[SQLiteEntity setValue:forProperty:](self, "setValue:forProperty:", v4, @"subscription_id");
}

+ (id)_cloudStoreDatabaseWithContainerName:(id)a3 scope:(int64_t)a4 inDatabase:(id)a5
{
  return [a1 anyInDatabase:a5 withContainerName:a3 scope:a4];
}

+ (void)removeCloudStoreDatabaseWithContainerName:(id)a3 scope:(int64_t)a4 inDatabase:(id)a5
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue([a1 _cloudStoreDatabaseWithContainerName:a3 scope:a4 inDatabase:a5]);
  if (v5)
  {
    id v6 = v5;
    [v5 deleteFromDatabase];
    id v5 = v6;
  }
}

- (BOOL)deleteFromDatabase
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  +[CloudStoreZone deleteEntitiesForCloudStoreDatabase:inDatabase:]( &OBJC_CLASS___CloudStoreZone,  "deleteEntitiesForCloudStoreDatabase:inDatabase:",  self,  v3);

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CloudStoreContainerDatabase;
  return -[SQLiteEntity deleteFromDatabase](&v5, "deleteFromDatabase");
}

+ (id)anyInDatabase:(id)a3 withContainerName:(id)a4 scope:(int64_t)a5
{
  id v8 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForContainerName:a4 scope:a5]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v8 predicate:v9]);

  return v10;
}

+ (id)anyInDatabase:(id)a3 withPID:(int64_t)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPID:a4]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  return v8;
}

+ (id)_predicateForContainerName:(id)a3 scope:(int64_t)a4
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForContainerName:a3]);
  v11[0] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForScope:a4]);
  v11[1] = v7;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v11, 2LL));
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v8));

  return v9;
}

+ (id)_predicateForContainerName:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"container_name",  a3);
}

+ (id)_predicateForScope:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"scope",  v3));

  return v4;
}

+ (id)_predicateForPID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"pid",  v3));

  return v4;
}

- (id)cloudStoreZones
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[CloudStoreZone cloudStoreZonesForContainerDatabase:inDatabase:]( &OBJC_CLASS___CloudStoreZone,  "cloudStoreZonesForContainerDatabase:inDatabase:",  self,  v3));

  return v4;
}

- (id)databaseSubscription
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"subscription_id"));
  if (v2) {
    v3 = -[CKDatabaseSubscription initWithSubscriptionID:]( objc_alloc(&OBJC_CLASS___CKDatabaseSubscription),  "initWithSubscriptionID:",  v2);
  }
  else {
    v3 = 0LL;
  }

  return v3;
}

- (id)_commonDictionaryFoDatabaseWithScope:(int64_t)a3 containerName:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObjectOrNull:forKey:](v6, "setObjectOrNull:forKey:", v5, @"container_name");

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  -[NSMutableDictionary setObjectOrNull:forKey:](v6, "setObjectOrNull:forKey:", v7, @"scope");

  return v6;
}

@end