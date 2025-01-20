@interface CloudStoreShareBackoff
+ (id)_predicateForBackoffType:(unint64_t)a3 cloudStoreZonePID:(int64_t)a4 recipientHandle:(id)a5;
+ (id)_predicateForCloudStoreZonePID:(int64_t)a3;
+ (id)anyInDatabase:(id)a3 forBackoffType:(unint64_t)a4 cloudStoreZone:(id)a5 recipientHandle:(id)a6;
+ (id)databaseTable;
+ (id)insertIfNotExistsForBackoffType:(unint64_t)a3 cloudStoreZone:(id)a4 recipientHandle:(id)a5 inDatabase:(id)a6;
+ (void)deleteEntriesForBackoffType:(unint64_t)a3 cloudStoreZone:(id)a4 recipientHandle:(id)a5 inDatabase:(id)a6;
+ (void)deleteEntriesWithCloudStoreZonePID:(int64_t)a3 inDatabase:(id)a4;
- (CloudStoreShareBackoff)initWithForBackoffType:(unint64_t)a3 cloudStoreZone:(id)a4 recipientHandle:(id)a5 inDatabase:(id)a6;
- (id)cloudStoreZone;
- (id)nextPossibleFetchDate;
- (id)recipientHandle;
- (unint64_t)backoffType;
- (void)increaseBackoffLevel;
@end

@implementation CloudStoreShareBackoff

+ (id)databaseTable
{
  return @"cloud_store_share_backoff";
}

+ (id)insertIfNotExistsForBackoffType:(unint64_t)a3 cloudStoreZone:(id)a4 recipientHandle:(id)a5 inDatabase:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = (id)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v12 forBackoffType:a3 cloudStoreZone:v10 recipientHandle:v11]);
  if (!v13)
  {
    id v13 = [objc_alloc((Class)a1) initWithForBackoffType:a3 cloudStoreZone:v10 recipientHandle:v11 inDatabase:v12];
    uint64_t Object = PKLogFacilityTypeGetObject(9LL);
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = @"unknown";
      if (a3 == 1) {
        v16 = @"addParticipant";
      }
      v17 = v16;
      v18 = (void *)objc_claimAutoreleasedReturnValue([v10 zoneName]);
      v19 = (void *)objc_claimAutoreleasedReturnValue([v13 nextPossibleFetchDate]);
      int v21 = 138544130;
      v22 = v17;
      __int16 v23 = 2114;
      v24 = v18;
      __int16 v25 = 2112;
      id v26 = v11;
      __int16 v27 = 2114;
      v28 = v19;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Creating new cloud store share backoff for backoff type %{public}@, zone %{public}@, recipientHandle %@, nextPos sibleFetchDate %{public}@",  (uint8_t *)&v21,  0x2Au);
    }
  }

  return v13;
}

- (CloudStoreShareBackoff)initWithForBackoffType:(unint64_t)a3 cloudStoreZone:(id)a4 recipientHandle:(id)a5 inDatabase:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v14 = [v12 persistentID];

  -[NSMutableDictionary setInteger:forKey:](v13, "setInteger:forKey:", v14, @"cloud_store_zone_pid");
  -[NSMutableDictionary setObjectOrNull:forKey:](v13, "setObjectOrNull:forKey:", v11, @"recipient_handle");

  -[NSMutableDictionary setInteger:forKey:](v13, "setInteger:forKey:", a3, @"backoff_type");
  -[NSMutableDictionary setInteger:forKey:](v13, "setInteger:forKey:", 0LL, @"backoff_level");
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", 30.0));
  v16 = (void *)_SQLValueForDate(v15);
  -[NSMutableDictionary setObjectOrNull:forKey:](v13, "setObjectOrNull:forKey:", v16, @"next_fetch");

  id v17 = -[NSMutableDictionary copy](v13, "copy");
  v18 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v17, v10);

  return v18;
}

+ (id)anyInDatabase:(id)a3 forBackoffType:(unint64_t)a4 cloudStoreZone:(id)a5 recipientHandle:(id)a6
{
  id v10 = a6;
  id v11 = a3;
  id v12 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( a1,  "_predicateForBackoffType:cloudStoreZonePID:recipientHandle:",  a4,  objc_msgSend(a5, "persistentID"),  v10));

  id v13 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v11 predicate:v12]);
  return v13;
}

+ (void)deleteEntriesForBackoffType:(unint64_t)a3 cloudStoreZone:(id)a4 recipientHandle:(id)a5 inDatabase:(id)a6
{
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:a6 forBackoffType:a3 cloudStoreZone:a4 recipientHandle:v10]);
  if (v11)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(9LL);
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = [v11 backoffType];
      v15 = @"unknown";
      if (v14 == (id)1) {
        v15 = @"addParticipant";
      }
      v16 = v15;
      id v17 = (void *)objc_claimAutoreleasedReturnValue([v11 cloudStoreZone]);
      v18 = (void *)objc_claimAutoreleasedReturnValue([v17 zoneName]);
      int v19 = 138543874;
      v20 = v16;
      __int16 v21 = 2114;
      v22 = v18;
      __int16 v23 = 2112;
      id v24 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Deleting cloud store share backoff level for backoff type %{public}@, cloud store zone %{public}@, recipientHandle %@",  (uint8_t *)&v19,  0x20u);
    }

    [v11 deleteFromDatabase];
  }
}

+ (void)deleteEntriesWithCloudStoreZonePID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForCloudStoreZonePID:a3]);
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);

  [v8 deleteAllEntities];
}

+ (id)_predicateForBackoffType:(unint64_t)a3 cloudStoreZonePID:(int64_t)a4 recipientHandle:(id)a5
{
  id v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"backoff_type",  v9));
  id v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_predicateForCloudStoreZonePID:", a4, v10));
  v16[1] = v11;
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"recipient_handle",  v8));

  v16[2] = v12;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v16, 3LL));
  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v13));

  return v14;
}

+ (id)_predicateForCloudStoreZonePID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"cloud_store_zone_pid",  v3));

  return v4;
}

- (void)increaseBackoffLevel
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"backoff_level"));
  v4 = (char *)[v3 integerValue];

  v5 = v4 + 1;
  uint64_t v6 = 13LL;
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  dbl_1004D7168[v6]));
  uint64_t Object = PKLogFacilityTypeGetObject(9LL);
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v10 = -[CloudStoreShareBackoff backoffType](self, "backoffType");
    id v11 = @"unknown";
    if (v10 == 1) {
      id v11 = @"addParticipant";
    }
    id v12 = v11;
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CloudStoreShareBackoff cloudStoreZone](self, "cloudStoreZone"));
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 zoneName]);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CloudStoreShareBackoff recipientHandle](self, "recipientHandle"));
    *(_DWORD *)buf = 138544130;
    v22 = v12;
    __int16 v23 = 2114;
    id v24 = v14;
    __int16 v25 = 2112;
    id v26 = v15;
    __int16 v27 = 2114;
    v28 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Increasing cloud store share backoff level for backoff type %{public}@, cloudStoreZone %{public}@, recipientHandle %@, next fetch date %{public}@",  buf,  0x2Au);
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_100301380;
  v18[3] = &unk_100647810;
  id v19 = v7;
  v20 = v5;
  v18[4] = self;
  id v17 = v7;
  sub_1002CCC5C((uint64_t)v16, v18);
}

- (id)nextPossibleFetchDate
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"next_fetch"));
  v3 = (void *)_DateForSQLValue(v2);

  return v3;
}

- (unint64_t)backoffType
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"backoff_type"));
  id v3 = [v2 integerValue];

  return (unint64_t)v3;
}

- (id)recipientHandle
{
  return -[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"recipient_handle");
}

- (id)cloudStoreZone
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"cloud_store_zone_pid"));
  id v4 = [v3 unsignedLongLongValue];
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity database](self, "database"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[CloudStoreZone cloudStoreZoneWithPID:inDatabase:]( &OBJC_CLASS___CloudStoreZone,  "cloudStoreZoneWithPID:inDatabase:",  v4,  v5));

  return v6;
}

@end