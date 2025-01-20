@interface PaymentTransactionArchiveLocation
+ (id)_predicateForArchivePID:(int64_t)a3;
+ (id)_predicateForCloudStoreZone:(id)a3 inDatabase:(id)a4;
+ (id)_predicateForCloudStoreZonePID:(int64_t)a3;
+ (id)_predicateForLocation:(id)a3 archivePID:(int64_t)a4 inDatabase:(id)a5;
+ (id)_predicateForType:(unint64_t)a3;
+ (id)_propertySettersForTransactionArchiveLocation;
+ (id)_transactionArchiveLocationsWithQuery:(id)a3;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertOrUpdateTransactionArchiveLocations:(id)a3 forArchivePID:(int64_t)a4 inDatabase:(id)a5;
+ (id)transactionArchiveLocationsForArchivePID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deleteArchiveLocationsForArchivePID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deleteArchiveLocationsForCloudStoreZonePID:(int64_t)a3 inDatabase:(id)a4;
- (PaymentTransactionArchiveLocation)initWithTransactionArchiveLocation:(id)a3 forArchivePID:(int64_t)a4 inDatabase:(id)a5;
- (id)_commonDictionaryForArchiveLocation:(id)a3 inDatabase:(id)a4;
- (id)archiveLocation;
- (id)cloudStoreZone;
- (void)updateWithTransactionArchiveLocation:(id)a3;
@end

@implementation PaymentTransactionArchiveLocation

+ (id)databaseTable
{
  return @"payment_transaction_archive_location";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class(&OBJC_CLASS___PaymentTransactionArchive, a2) == a3) {
    return @"archive_pid";
  }
  else {
    return 0LL;
  }
}

+ (id)insertOrUpdateTransactionArchiveLocations:(id)a3 forArchivePID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id obj = v8;
  id v11 = [obj countByEnumeratingWithState:&v25 objects:v31 count:16];
  if (v11)
  {
    id v13 = v11;
    uint64_t v14 = *(void *)v26;
    *(void *)&__int128 v12 = 138412290LL;
    __int128 v23 = v12;
    do
    {
      v15 = 0LL;
      do
      {
        if (*(void *)v26 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void *)(*((void *)&v25 + 1) + 8LL * (void)v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_predicateForLocation:archivePID:inDatabase:", v16, a4, v9, v23));
        id v18 = (id)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v9 predicate:v17]);

        if (v18)
        {
          [v18 updateWithTransactionArchiveLocation:v16];
LABEL_9:
          -[NSMutableSet addObject:](v10, "addObject:", v18);
          goto LABEL_10;
        }

        id v18 = [objc_alloc((Class)a1) initWithTransactionArchiveLocation:v16 forArchivePID:a4 inDatabase:v9];
        if (v18) {
          goto LABEL_9;
        }
        uint64_t Object = PKLogFacilityTypeGetObject(6LL);
        id v18 = (id)objc_claimAutoreleasedReturnValue(Object);
        if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v23;
          id v30 = obj;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v18,  OS_LOG_TYPE_DEFAULT,  "Error: Could not insert PaymentTransactionArchiveLocation into database for locations %@",  buf,  0xCu);
        }

- (PaymentTransactionArchiveLocation)initWithTransactionArchiveLocation:(id)a3 forArchivePID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[PaymentTransactionArchiveLocation _commonDictionaryForArchiveLocation:inDatabase:]( self,  "_commonDictionaryForArchiveLocation:inDatabase:",  a3,  v8));
  id v10 = [v9 mutableCopy];

  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  [v10 setObjectOrNull:v11 forKey:@"archive_pid"];

  id v12 = [v10 copy];
  id v13 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v12, v8);

  uint64_t v14 = v13;
  return v14;
}

- (void)updateWithTransactionArchiveLocation:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue( -[PaymentTransactionArchiveLocation _commonDictionaryForArchiveLocation:inDatabase:]( self,  "_commonDictionaryForArchiveLocation:inDatabase:",  a3,  self->super._database));
  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v4);
}

+ (id)_predicateForLocation:(id)a3 archivePID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForArchivePID:a4]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "cloudStoreZone", v10));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForCloudStoreZone:v11 inDatabase:v8]);

  v18[1] = v12;
  id v13 = [v9 type];

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForType:v13]);
  v18[2] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v18, 3LL));
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v15));

  return v16;
}

+ (id)_predicateForArchivePID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"archive_pid",  v3));

  return v4;
}

+ (id)_predicateForType:(unint64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"type",  v3));

  return v4;
}

+ (id)_predicateForCloudStoreZone:(id)a3 inDatabase:(id)a4
{
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[CloudStoreZone anyInDatabase:forCloudStoreZone:]( &OBJC_CLASS___CloudStoreZone,  "anyInDatabase:forCloudStoreZone:",  a4,  a3));
  id v6 = [v5 persistentID];

  return [a1 _predicateForCloudStoreZonePID:v6];
}

+ (id)_predicateForCloudStoreZonePID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"cloud_store_zone_pid",  v3));

  return v4;
}

+ (void)deleteArchiveLocationsForArchivePID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForArchivePID:a3]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

+ (void)deleteArchiveLocationsForCloudStoreZonePID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForCloudStoreZonePID:a3]);
  v12[0] = v7;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForType:0]);
  v12[1] = v8;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v12, 2LL));
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v9));

  id v11 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v10]);
  [v11 deleteAllEntities];
}

+ (id)transactionArchiveLocationsForArchivePID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForArchivePID:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _transactionArchiveLocationsWithQuery:v8]);
  return v9;
}

- (id)archiveLocation
{
  v3 = objc_alloc_init(&OBJC_CLASS___PKPaymentTransactionArchiveLocation);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[PaymentTransactionArchiveLocation _propertySettersForTransactionArchiveLocation]( &OBJC_CLASS___PaymentTransactionArchiveLocation,  "_propertySettersForTransactionArchiveLocation"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allKeys]);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  void v12[2] = sub_1002E8DDC;
  v12[3] = &unk_100638EF0;
  v12[4] = self;
  id v13 = v4;
  id v6 = v3;
  uint64_t v14 = v6;
  id v7 = v4;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v5, v12);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PaymentTransactionArchiveLocation cloudStoreZone](self, "cloudStoreZone"));
  -[PKPaymentTransactionArchiveLocation setCloudStoreZone:](v6, "setCloudStoreZone:", v8);

  id v9 = v14;
  id v10 = v6;

  return v10;
}

- (id)cloudStoreZone
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"cloud_store_zone_pid"));
  id v4 = [v3 longValue];

  return +[CloudStoreZone cloudStoreZoneWithPID:inDatabase:]( &OBJC_CLASS___CloudStoreZone,  "cloudStoreZoneWithPID:inDatabase:",  v4,  self->super._database);
}

+ (id)_transactionArchiveLocationsWithQuery:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([a1 _propertySettersForTransactionArchiveLocation]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 allKeys]);
  id v21 = @"cloud_store_zone_pid";
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v21, 1LL));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 arrayByAddingObjectsFromArray:v7]);

  id v9 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1002E9010;
  v15[3] = &unk_100653F98;
  id v19 = a1;
  id v20 = (char *)[v8 count] - 1;
  id v16 = v5;
  id v17 = v4;
  id v18 = v9;
  id v10 = v9;
  id v11 = v4;
  id v12 = v5;
  [v11 enumeratePersistentIDsAndProperties:v8 usingBlock:v15];
  id v13 = -[NSMutableSet copy](v10, "copy");

  return v13;
}

- (id)_commonDictionaryForArchiveLocation:(id)a3 inDatabase:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v5 isArchived]));
  -[NSMutableDictionary setObjectOrNull:forKey:](v7, "setObjectOrNull:forKey:", v8, @"archived");

  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v5 type]));
  -[NSMutableDictionary setObjectOrNull:forKey:](v7, "setObjectOrNull:forKey:", v9, @"type");

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 cloudStoreZone]);
  if (v10)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v5 cloudStoreZone]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[CloudStoreZone anyInDatabase:forCloudStoreZone:]( &OBJC_CLASS___CloudStoreZone,  "anyInDatabase:forCloudStoreZone:",  v6,  v11));

    if (v12)
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v12 persistentID]));
      -[NSMutableDictionary setObjectOrNull:forKey:](v7, "setObjectOrNull:forKey:", v13, @"cloud_store_zone_pid");
    }
  }

  id v14 = -[NSMutableDictionary copy](v7, "copy");

  return v14;
}

+ (id)_propertySettersForTransactionArchiveLocation
{
  v3[0] = @"type";
  v3[1] = @"archived";
  v4[0] = &stru_100654850;
  v4[1] = &stru_100654870;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  2LL));
}

@end