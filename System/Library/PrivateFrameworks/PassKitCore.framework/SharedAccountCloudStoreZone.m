@interface SharedAccountCloudStoreZone
+ (id)_predicateForSharedAccountCloudStorePID:(int64_t)a3;
+ (id)_predicateForSharedAccountCloudStoreZoneWithAccountIdentifier:(id)a3 zoneName:(id)a4 access:(unint64_t)a5 sharedAccountCloudStorePID:(int64_t)a6;
+ (id)_propertySettersForSharedAccountCloudStoreZone;
+ (id)_sharedAccountCloudStoreZoneWithAccountIdentifier:(id)a3 zoneName:(id)a4 access:(unint64_t)a5 sharedAccountCloudStorePID:(int64_t)a6 inDatabase:(id)a7;
+ (id)_sharedAccountCloudStoreZonesWithQuery:(id)a3;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertOrUpdateSharedAccountCloudStoreZones:(id)a3 forSharedAccountCloudStorePID:(int64_t)a4 inDatabase:(id)a5;
+ (id)sharedAccountCloudStoreZonesForSharedAccountCloudStorePID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deleteEntitiesForSharedAccountCloudStore:(id)a3 inDatabase:(id)a4;
- (SharedAccountCloudStoreZone)initWithSharedAccountCloudStoreZone:(id)a3 forSharedAccountCloudStorePID:(int64_t)a4 inDatabase:(id)a5;
- (id)_commonDictionaryForSharedAccountCloudStoreZone:(id)a3 forSharedAccountCloudStorePID:(int64_t)a4;
- (id)sharedAccountCloudStoreZone;
- (void)updateSharedAccountCloudStoreZone:(id)a3 forSharedAccountCloudStorePID:(int64_t)a4;
@end

@implementation SharedAccountCloudStoreZone

+ (id)databaseTable
{
  return @"almonds";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class(&OBJC_CLASS___SharedAccountCloudStore, a2) == a3) {
    return @"peanuts_pid";
  }
  else {
    return 0LL;
  }
}

+ (id)insertOrUpdateSharedAccountCloudStoreZones:(id)a3 forSharedAccountCloudStorePID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v21 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id obj = v8;
  id v10 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v23;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(obj);
        }
        v14 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)i);
        v15 = (void *)objc_claimAutoreleasedReturnValue([v14 accountIdentifier]);
        v16 = (void *)objc_claimAutoreleasedReturnValue([v14 zoneName]);
        id v17 = (id)objc_claimAutoreleasedReturnValue( objc_msgSend( a1,  "_sharedAccountCloudStoreZoneWithAccountIdentifier:zoneName:access:sharedAccountCloudStorePID:inDatabase:",  v15,  v16,  objc_msgSend(v14, "access"),  a4,  v9));

        if (v17) {
          [v17 updateSharedAccountCloudStoreZone:v14 forSharedAccountCloudStorePID:a4];
        }
        else {
          id v17 = [objc_alloc((Class)a1) initWithSharedAccountCloudStoreZone:v14 forSharedAccountCloudStorePID:a4 inDatabase:v9];
        }
        -[NSMutableArray addObject:](v21, "addObject:", v17);
      }

      id v11 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }

    while (v11);
  }

  id v18 = -[NSMutableArray copy](v21, "copy");
  return v18;
}

- (SharedAccountCloudStoreZone)initWithSharedAccountCloudStoreZone:(id)a3 forSharedAccountCloudStorePID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[SharedAccountCloudStoreZone _commonDictionaryForSharedAccountCloudStoreZone:forSharedAccountCloudStorePID:]( self,  "_commonDictionaryForSharedAccountCloudStoreZone:forSharedAccountCloudStorePID:",  a3,  a4));
  id v10 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v9, v8);

  return v10;
}

- (void)updateSharedAccountCloudStoreZone:(id)a3 forSharedAccountCloudStorePID:(int64_t)a4
{
  id v5 = (id)objc_claimAutoreleasedReturnValue( -[SharedAccountCloudStoreZone _commonDictionaryForSharedAccountCloudStoreZone:forSharedAccountCloudStorePID:]( self,  "_commonDictionaryForSharedAccountCloudStoreZone:forSharedAccountCloudStorePID:",  a3,  a4));
  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v5);
}

+ (id)_predicateForSharedAccountCloudStoreZoneWithAccountIdentifier:(id)a3 zoneName:(id)a4 access:(unint64_t)a5 sharedAccountCloudStorePID:(int64_t)a6
{
  id v10 = a4;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"account_identifier",  a3));
  v19[0] = v11;
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"zone_name",  v10));

  v19[1] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a5));
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"access",  v13));
  v19[2] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForSharedAccountCloudStorePID:a6]);
  v19[3] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v19, 4LL));
  id v17 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v16));

  return v17;
}

+ (id)_predicateForSharedAccountCloudStorePID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"peanuts_pid",  v3));
  id v8 = v4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v8, 1LL));
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v5));

  return v6;
}

+ (void)deleteEntitiesForSharedAccountCloudStore:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_predicateForSharedAccountCloudStorePID:", objc_msgSend(a3, "persistentID")));
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

+ (id)sharedAccountCloudStoreZonesForSharedAccountCloudStorePID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForSharedAccountCloudStorePID:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _sharedAccountCloudStoreZonesWithQuery:v8]);
  return v9;
}

+ (id)_sharedAccountCloudStoreZoneWithAccountIdentifier:(id)a3 zoneName:(id)a4 access:(unint64_t)a5 sharedAccountCloudStorePID:(int64_t)a6 inDatabase:(id)a7
{
  id v12 = a7;
  v13 = (void *)objc_claimAutoreleasedReturnValue( [a1 _predicateForSharedAccountCloudStoreZoneWithAccountIdentifier:a3 zoneName:a4 access:a5 sharedAccountCloudStorePID:a6]);
  v14 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v12 predicate:v13]);

  return v14;
}

- (id)sharedAccountCloudStoreZone
{
  v3 = objc_alloc_init(&OBJC_CLASS___PKSharedAccountCloudStoreZone);
  id v5 = objc_msgSend((id)objc_opt_class(self, v4), "_propertySettersForSharedAccountCloudStoreZone");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000B027C;
  v13[3] = &unk_100638EF0;
  v13[4] = self;
  id v14 = v6;
  id v8 = v3;
  v15 = v8;
  id v9 = v6;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v7, v13);

  id v10 = v15;
  id v11 = v8;

  return v11;
}

+ (id)_sharedAccountCloudStoreZonesWithQuery:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([a1 _propertySettersForSharedAccountCloudStoreZone]);
  id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 allKeys]);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000B03C4;
  v12[3] = &unk_100639BF0;
  id v14 = v6;
  id v15 = a1;
  id v13 = v5;
  id v8 = v6;
  id v9 = v5;
  [v4 enumeratePersistentIDsAndProperties:v7 usingBlock:v12];

  id v10 = -[NSMutableArray copy](v8, "copy");
  return v10;
}

- (id)_commonDictionaryForSharedAccountCloudStoreZone:(id)a3 forSharedAccountCloudStorePID:(int64_t)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  [v6 setObjectOrNull:v7 forKey:@"peanuts_pid"];

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 zoneName]);
  [v6 setObjectOrNull:v8 forKey:@"zone_name"];

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 accountIdentifier]);
  [v6 setObjectOrNull:v9 forKey:@"account_identifier"];

  objc_msgSend(v6, "setInteger:forKey:", objc_msgSend(v5, "accountType"), @"account_type");
  objc_msgSend(v6, "setInteger:forKey:", objc_msgSend(v5, "access"), @"access");
  objc_msgSend(v6, "setInteger:forKey:", objc_msgSend(v5, "mode"), @"mode");
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 originatorAltDSID]);
  [v6 setObjectOrNull:v10 forKey:@"a"];

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v5 sharedUsersAltDSIDs]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 allObjects]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 componentsJoinedByString:@","]);
  [v6 setObjectOrNull:v13 forKey:@"b"];

  return v6;
}

+ (id)_propertySettersForSharedAccountCloudStoreZone
{
  v3[0] = @"zone_name";
  v3[1] = @"account_identifier";
  v4[0] = &stru_10063FB00;
  v4[1] = &stru_10063FB20;
  v3[2] = @"account_type";
  v3[3] = @"access";
  v4[2] = &stru_10063FB40;
  v4[3] = &stru_10063FB60;
  v3[4] = @"mode";
  v3[5] = @"a";
  v4[4] = &stru_10063FB80;
  v4[5] = &stru_10063FBA0;
  v3[6] = @"b";
  v4[6] = &stru_10063FBC0;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  7LL));
}

@end