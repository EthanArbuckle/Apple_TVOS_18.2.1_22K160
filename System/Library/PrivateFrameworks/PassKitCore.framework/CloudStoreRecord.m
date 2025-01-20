@interface CloudStoreRecord
+ (id)_predicateForCloudStoreZonePID:(id)a3;
+ (id)_predicateForCloudStoreZonePID:(int64_t)a3 recordName:(id)a4 recordType:(id)a5;
+ (id)_predicateForRecord:(id)a3 cloudStoreZonePID:(id)a4;
+ (id)_predicateForRecordName:(id)a3;
+ (id)_predicateForRecordType:(id)a3;
+ (id)anyInDatabase:(id)a3 cloudStoreRecord:(id)a4 cloudStoreZone:(id)a5;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertOrUpdateCloudStoreRecord:(id)a3 forCloudStoreZone:(id)a4 inDatabase:(id)a5;
+ (id)recordInDatabase:(id)a3 withRecordName:(id)a4 recordType:(id)a5 cloudStoreZone:(id)a6;
+ (void)deleteEntitiesForCloudStoreZonePID:(int64_t)a3 inDatabase:(id)a4;
+ (void)removeCloudStoreRecordID:(id)a3 recordType:(id)a4 cloudStoreZone:(id)a5 inDatabase:(id)a6;
+ (void)removeCloudStoreRecordsWithName:(id)a3 recordType:(id)a4 inDatabase:(id)a5;
- (CloudStoreRecord)initWithCloudStoreRecord:(id)a3 forCloudStoreZone:(id)a4 inDatabase:(id)a5;
- (id)_commonDictionaryForCloudStoreRecord:(id)a3;
- (id)record;
- (unint64_t)hash;
- (void)updateWithCloudStoreRecord:(id)a3;
@end

@implementation CloudStoreRecord

+ (id)databaseTable
{
  return @"cloud_store_record";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class(&OBJC_CLASS___CloudStoreZone, a2) == a3) {
    return @"zone_pid";
  }
  else {
    return 0LL;
  }
}

+ (id)insertOrUpdateCloudStoreRecord:(id)a3 forCloudStoreZone:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v10 cloudStoreRecord:v8 cloudStoreZone:v9]);
  if (v11)
  {
    id v12 = v11;
    [v11 updateWithCloudStoreRecord:v8];
  }

  else
  {
    id v12 = [objc_alloc((Class)a1) initWithCloudStoreRecord:v8 forCloudStoreZone:v9 inDatabase:v10];
  }

  return v12;
}

- (CloudStoreRecord)initWithCloudStoreRecord:(id)a3 forCloudStoreZone:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( -[CloudStoreRecord _commonDictionaryForCloudStoreRecord:]( self,  "_commonDictionaryForCloudStoreRecord:",  a3));
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[CloudStoreZone anyInDatabase:forCloudStoreZone:]( &OBJC_CLASS___CloudStoreZone,  "anyInDatabase:forCloudStoreZone:",  v8,  v9));

  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v11 persistentID]));
  [v10 setObjectOrNull:v12 forKey:@"zone_pid"];

  v13 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v10, v8);
  return v13;
}

- (void)updateWithCloudStoreRecord:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue( -[CloudStoreRecord _commonDictionaryForCloudStoreRecord:]( self,  "_commonDictionaryForCloudStoreRecord:",  a3));
  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v4);
}

+ (id)anyInDatabase:(id)a3 cloudStoreRecord:(id)a4 cloudStoreZone:(id)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[CloudStoreZone anyInDatabase:forCloudStoreZone:]( &OBJC_CLASS___CloudStoreZone,  "anyInDatabase:forCloudStoreZone:",  v9,  a5));
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v10 persistentID]));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForRecord:v8 cloudStoreZonePID:v11]);

  v13 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v9 predicate:v12]);
  return v13;
}

+ (id)recordInDatabase:(id)a3 withRecordName:(id)a4 recordType:(id)a5 cloudStoreZone:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[CloudStoreZone anyInDatabase:forCloudStoreZone:]( &OBJC_CLASS___CloudStoreZone,  "anyInDatabase:forCloudStoreZone:",  v10,  a6));
  v14 = v13;
  if (v13)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( a1,  "_predicateForCloudStoreZonePID:recordName:recordType:",  objc_msgSend(v13, "persistentID"),  v11,  v12));
    v16 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v10 predicate:v15]);
    v17 = (void *)objc_claimAutoreleasedReturnValue([v16 record]);
  }

  else
  {
    v17 = 0LL;
  }

  return v17;
}

+ (void)deleteEntitiesForCloudStoreZonePID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v9 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForCloudStoreZonePID:v9]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);

  [v8 deleteAllEntities];
}

+ (void)removeCloudStoreRecordID:(id)a3 recordType:(id)a4 cloudStoreZone:(id)a5 inDatabase:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  id v17 = (id)objc_claimAutoreleasedReturnValue( +[CloudStoreZone anyInDatabase:forCloudStoreZone:]( &OBJC_CLASS___CloudStoreZone,  "anyInDatabase:forCloudStoreZone:",  v10,  a5));
  id v13 = [v17 persistentID];
  v14 = (void *)objc_claimAutoreleasedReturnValue([v12 recordName]);

  v15 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForCloudStoreZonePID:v13 recordName:v14 recordType:v11]);
  v16 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v10 predicate:v15]);

  [v16 deleteAllEntities];
}

+ (void)removeCloudStoreRecordsWithName:(id)a3 recordType:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForRecordName:a3]);
  v15[0] = v10;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForRecordType:v9]);

  v15[1] = v11;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v15, 2LL));
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v12));

  v14 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v8 predicate:v13]);
  [v14 deleteAllEntities];
}

- (unint64_t)hash
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"hash"));
  id v3 = [v2 unsignedIntegerValue];

  return (unint64_t)v3;
}

- (id)record
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"record_data"));
  if (v2)
  {
    id v4 = -[NSKeyedUnarchiver initForReadingFromData:error:]( objc_alloc(&OBJC_CLASS___NSKeyedUnarchiver),  "initForReadingFromData:error:",  v2,  0LL);
    if (v4)
    {
      id v5 = -[NSKeyedUnarchiver decodeTopLevelObjectOfClass:forKey:error:]( v4,  "decodeTopLevelObjectOfClass:forKey:error:",  objc_opt_class(&OBJC_CLASS___CKRecord, v3),  NSKeyedArchiveRootObjectKey,  0LL);
      id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
      -[NSKeyedUnarchiver finishDecoding](v4, "finishDecoding");
    }

    else
    {
      uint64_t Object = PKLogFacilityTypeGetObject(9LL);
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v10 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Could not initialize unarchiver with cloud store record data.",  v10,  2u);
      }

      id v6 = 0LL;
    }
  }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

+ (id)_predicateForRecord:(id)a3 cloudStoreZonePID:(id)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForCloudStoreZonePID:a4]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "recordID", v7));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 recordName]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForRecordName:v9]);
  v16[1] = v10;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 recordType]);

  id v12 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForRecordType:v11]);
  v16[2] = v12;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v16, 3LL));
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v13));

  return v14;
}

+ (id)_predicateForRecordName:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"record_name",  a3);
}

+ (id)_predicateForCloudStoreZonePID:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"zone_pid",  a3);
}

+ (id)_predicateForRecordType:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"record_type",  a3);
}

+ (id)_predicateForCloudStoreZonePID:(int64_t)a3 recordName:(id)a4 recordType:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForCloudStoreZonePID:v10]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_predicateForRecordName:", v9, v11));

  v17[1] = v12;
  id v13 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForRecordType:v8]);

  v17[2] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v17, 3LL));
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v14));

  return v15;
}

- (id)_commonDictionaryForCloudStoreRecord:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 recordID]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 recordName]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v6, @"record_name");

  v7 = (void *)objc_claimAutoreleasedReturnValue([v3 recordType]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v7, @"record_type");

  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  objc_msgSend(v3, "pk_hash")));
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v8, @"hash");

  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v3,  1LL,  0LL));
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v9, @"record_data");

  return v4;
}

@end