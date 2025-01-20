@interface SharedAccountCloudStore
+ (id)_predicateForAccountPID:(int64_t)a3;
+ (id)_propertySettersForSharedAccountCloudStore;
+ (id)_sharedAccountCloudStoreForQuery:(id)a3;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertOrUpdateSharedAccountCloudStore:(id)a3 forAccount:(id)a4 inDatabase:(id)a5;
+ (id)sharedAccountCloudStoreByAccountIdentifierInDatabase:(id)a3;
+ (id)sharedAccountCloudStoreForAccount:(id)a3 inDatabase:(id)a4;
+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4;
+ (void)deleteEntitiesForAccountPID:(int64_t)a3 inDatabase:(id)a4;
- (BOOL)deleteFromDatabase;
- (SharedAccountCloudStore)initWithSharedAccountCloudStore:(id)a3 forAccount:(id)a4 inDatabase:(id)a5;
- (id)_commonDictionaryForSharedAccountCloudStore:(id)a3 accountPID:(int64_t)a4;
- (id)sharedAccountCloudStore;
- (void)updateWithSharedAccountCloudStore:(id)a3 forAccount:(id)a4;
@end

@implementation SharedAccountCloudStore

+ (id)databaseTable
{
  return @"peanuts";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class(&OBJC_CLASS___Account, a2) == a3) {
    return @"account_pid";
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
  if (v7 == @"pears.a"
    || v7 && (unsigned int v8 = [@"pears.a" isEqualToString:v7], v9, v8))
  {
    [v6 addObject:@"JOIN pears ON pears.pid = peanuts.account_pid"];
  }
}

+ (id)insertOrUpdateSharedAccountCloudStore:(id)a3 forAccount:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_predicateForAccountPID:", objc_msgSend(v9, "persistentID")));
  id v12 = (id)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v10 predicate:v11]);

  if (v12) {
    [v12 updateWithSharedAccountCloudStore:v8 forAccount:v9];
  }
  else {
    id v12 = [objc_alloc((Class)a1) initWithSharedAccountCloudStore:v8 forAccount:v9 inDatabase:v10];
  }

  return v12;
}

- (SharedAccountCloudStore)initWithSharedAccountCloudStore:(id)a3 forAccount:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( -[SharedAccountCloudStore _commonDictionaryForSharedAccountCloudStore:accountPID:]( self,  "_commonDictionaryForSharedAccountCloudStore:accountPID:",  v9,  [a4 persistentID]));
  v11 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v10, v8);
  id v12 = -[SQLiteEntity persistentID](v11, "persistentID");
  v13 = (void *)objc_claimAutoreleasedReturnValue([v9 sharedAccountCloudStoreZones]);

  id v14 =  +[SharedAccountCloudStoreZone insertOrUpdateSharedAccountCloudStoreZones:forSharedAccountCloudStorePID:inDatabase:]( &OBJC_CLASS___SharedAccountCloudStoreZone,  "insertOrUpdateSharedAccountCloudStoreZones:forSharedAccountCloudStorePID:inDatabase:",  v13,  v12,  v8);
  return v11;
}

- (void)updateWithSharedAccountCloudStore:(id)a3 forAccount:(id)a4
{
  id v6 = a3;
  id v12 = (id)objc_claimAutoreleasedReturnValue( -[SharedAccountCloudStore _commonDictionaryForSharedAccountCloudStore:accountPID:]( self,  "_commonDictionaryForSharedAccountCloudStore:accountPID:",  v6,  [a4 persistentID]));
  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  +[SharedAccountCloudStoreZone deleteEntitiesForSharedAccountCloudStore:inDatabase:]( &OBJC_CLASS___SharedAccountCloudStoreZone,  "deleteEntitiesForSharedAccountCloudStore:inDatabase:",  self,  v7);

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 sharedAccountCloudStoreZones]);
  int64_t v9 = -[SQLiteEntity persistentID](self, "persistentID");
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  id v11 =  +[SharedAccountCloudStoreZone insertOrUpdateSharedAccountCloudStoreZones:forSharedAccountCloudStorePID:inDatabase:]( &OBJC_CLASS___SharedAccountCloudStoreZone,  "insertOrUpdateSharedAccountCloudStoreZones:forSharedAccountCloudStorePID:inDatabase:",  v8,  v9,  v10);
}

+ (id)sharedAccountCloudStoreForAccount:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_predicateForAccountPID:", objc_msgSend(a3, "persistentID")));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  int64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 sharedAccountCloudStore]);
  return v9;
}

+ (id)sharedAccountCloudStoreByAccountIdentifierInDatabase:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[Account databaseTable](&OBJC_CLASS___Account, "databaseTable"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a1 databaseTable]);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[Account databaseTable](&OBJC_CLASS___Account, "databaseTable"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 databaseTable]);
  int64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[Account databaseTable](&OBJC_CLASS___Account, "databaseTable"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"SELECT DISTINCT %@.pid, %@ FROM %@, %@ WHERE %@.%@ = %@.pid",  v5,  @"pears.a",  v6,  v7,  v8,  @"account_pid",  v9));

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1003B0B64;
  v15[3] = &unk_1006452B8;
  v17 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v18 = a1;
  id v16 = v4;
  id v11 = v17;
  id v12 = v4;
  sub_1002CCDBC((uint64_t)v12, v10, v15);
  id v13 = -[NSMutableDictionary copy](v11, "copy");

  return v13;
}

+ (void)deleteEntitiesForAccountPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForAccountPID:a3]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

- (BOOL)deleteFromDatabase
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  +[SharedAccountCloudStoreZone deleteEntitiesForSharedAccountCloudStore:inDatabase:]( &OBJC_CLASS___SharedAccountCloudStoreZone,  "deleteEntitiesForSharedAccountCloudStore:inDatabase:",  self,  v3);

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___SharedAccountCloudStore;
  return -[SQLiteEntity deleteFromDatabase](&v5, "deleteFromDatabase");
}

+ (id)_predicateForAccountPID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"account_pid",  v3));

  return v4;
}

- (id)sharedAccountCloudStore
{
  v3 = objc_alloc_init(&OBJC_CLASS___PKSharedAccountCloudStore);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SharedAccountCloudStore _propertySettersForSharedAccountCloudStore]( &OBJC_CLASS___SharedAccountCloudStore,  "_propertySettersForSharedAccountCloudStore"));
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allKeys]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1003B0EC0;
  v13[3] = &unk_100638EF0;
  v13[4] = self;
  id v14 = v4;
  id v6 = v3;
  v15 = v6;
  id v7 = v4;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v5, v13);

  int64_t v8 = -[SQLiteEntity persistentID](self, "persistentID");
  int64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[SharedAccountCloudStoreZone sharedAccountCloudStoreZonesForSharedAccountCloudStorePID:inDatabase:]( &OBJC_CLASS___SharedAccountCloudStoreZone,  "sharedAccountCloudStoreZonesForSharedAccountCloudStorePID:inDatabase:",  v8,  v9));

  -[PKSharedAccountCloudStore setSharedAccountCloudStoreZones:](v6, "setSharedAccountCloudStoreZones:", v10);
  id v11 = v6;

  return v11;
}

+ (id)_sharedAccountCloudStoreForQuery:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue([a1 _propertySettersForSharedAccountCloudStore]);
  id v6 = objc_alloc_init(&OBJC_CLASS___PKSharedAccountCloudStore);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 allKeys]);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1003B101C;
  v14[3] = &unk_100638F18;
  id v18 = a1;
  id v15 = v5;
  int64_t v8 = v6;
  id v16 = v8;
  id v17 = v4;
  id v9 = v4;
  id v10 = v5;
  [v9 enumeratePersistentIDsAndProperties:v7 usingBlock:v14];

  id v11 = v17;
  id v12 = v8;

  return v12;
}

- (id)_commonDictionaryForSharedAccountCloudStore:(id)a3 accountPID:(int64_t)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  [v6 setObjectOrNull:v7 forKey:@"account_pid"];

  int64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 lastUpdated]);
  id v9 = (void *)_SQLValueForDate(v8);
  [v6 setObjectOrNull:v9 forKey:@"last_updated_date"];

  id v10 = [v5 isDirty];
  [v6 setBool:v10 forKey:@"dirty"];
  return v6;
}

+ (id)_propertySettersForSharedAccountCloudStore
{
  v3[0] = @"dirty";
  v3[1] = @"last_updated_date";
  v4[0] = &stru_10065B200;
  v4[1] = &stru_10065B220;
  v3[2] = @"pears.a";
  v4[2] = &stru_10065B240;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  3LL));
}

@end