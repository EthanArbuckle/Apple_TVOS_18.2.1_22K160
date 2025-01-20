@interface CloudStoreRecordFetchTask
+ (id)_commonDictionaryForTask:(id)a3;
+ (id)_predicateForCloudStoreZonePID:(int64_t)a3;
+ (id)_predicateForPID:(id)a3;
+ (id)_predicateForTransactionSourcePID:(int64_t)a3;
+ (id)_propertySettersForRecordFetchTask;
+ (id)_recordFetchTaskWithCloudStoreZonePID:(int64_t)a3 inDatabase:(id)a4;
+ (id)_recordFetchTaskWithTransactionSourcePID:(int64_t)a3 inDatabase:(id)a4;
+ (id)_tasksForQuery:(id)a3;
+ (id)allRecordFetchTasksInDatabase:(id)a3;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertOrUpdateRecordFetchTask:(id)a3 inDatabase:(id)a4;
+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4;
+ (void)deleteAllEntriesForCloudStoreZonePID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deleteAllEntriesForTransactionSourcePID:(int64_t)a3 inDatabase:(id)a4;
+ (void)removeRecordFetchTasks:(id)a3 inDatabase:(id)a4;
- (CloudStoreRecordFetchTask)initWithRecordFetchTaskWithTask:(id)a3 transactionSourcePID:(int64_t)a4 cloudStoreZonePID:(int64_t)a5 inDatabase:(id)a6;
- (void)updateRecordFetchTaskWithTask:(id)a3;
@end

@implementation CloudStoreRecordFetchTask

+ (id)databaseTable
{
  return @"cloud_store_record_fetch_task";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class(&OBJC_CLASS___TransactionSource, a2) == a3) {
    return @"transaction_source_pid";
  }
  if ((Class)objc_opt_class(&OBJC_CLASS___CloudStoreZone, v4) == a3) {
    return @"cloud_store_zone_pid";
  }
  return 0LL;
}

+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (__CFString *)v5;
  v9 = v7;
  if (v7 == @"transaction_source.identifier"
    || v7
    && (unsigned int v8 = [@"transaction_source.identifier" isEqualToString:v7],
        v9,
        v8))
  {
    [v6 addObject:@"JOIN transaction_source ON transaction_source.pid = cloud_store_record_fetch_task.transaction_source_pid"];
  }
}

+ (id)insertOrUpdateRecordFetchTask:(id)a3 inDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v6 transactionSourceIdentifier]);
    uint64_t v9 = objc_claimAutoreleasedReturnValue([v6 cloudStoreZone]);
    v10 = (void *)v9;
    if (v8)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue( +[TransactionSource anyInDatabase:withIdentifier:]( &OBJC_CLASS___TransactionSource,  "anyInDatabase:withIdentifier:",  v7,  v8));
      id v12 = [v11 persistentID];
      if (v12)
      {
        id v13 = v12;
        id v14 = (id)objc_claimAutoreleasedReturnValue([a1 _recordFetchTaskWithTransactionSourcePID:v12 inDatabase:v7]);
        id v15 = 0LL;
        goto LABEL_9;
      }

      uint64_t Object = PKLogFacilityTypeGetObject(9LL);
      v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        int v22 = 138412546;
        id v23 = v6;
        __int16 v24 = 2112;
        v25 = v8;
        v19 = "Error tried to insert task %@ with a transactionSourceIdentifier %@ that doesnt exist in the database";
LABEL_17:
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, v19, (uint8_t *)&v22, 0x16u);
      }
    }

    else
    {
      if (!v9)
      {
        id v15 = 0LL;
        id v13 = 0LL;
        goto LABEL_14;
      }

      v11 = (void *)objc_claimAutoreleasedReturnValue( +[CloudStoreZone anyInDatabase:forCloudStoreZone:]( &OBJC_CLASS___CloudStoreZone,  "anyInDatabase:forCloudStoreZone:",  v7,  v9));
      id v16 = [v11 persistentID];
      if (v16)
      {
        id v15 = v16;
        id v14 = (id)objc_claimAutoreleasedReturnValue([a1 _recordFetchTaskWithCloudStoreZonePID:v16 inDatabase:v7]);
        id v13 = 0LL;
LABEL_9:

        if (v14)
        {
          [v14 updateRecordFetchTaskWithTask:v6];
LABEL_19:

          goto LABEL_20;
        }

- (CloudStoreRecordFetchTask)initWithRecordFetchTaskWithTask:(id)a3 transactionSourcePID:(int64_t)a4 cloudStoreZonePID:(int64_t)a5 inDatabase:(id)a6
{
  id v10 = a6;
  id v11 = a3;
  id v13 = objc_msgSend((id)objc_opt_class(self, v12), "_commonDictionaryForTask:", v11);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

  if (a4)
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
    [v14 setObjectOrNull:v15 forKey:@"transaction_source_pid"];
  }

  if (a5)
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a5));
    [v14 setObjectOrNull:v16 forKey:@"cloud_store_zone_pid"];
  }

  v17 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v14, v10);

  return v17;
}

- (void)updateRecordFetchTaskWithTask:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend((id)objc_opt_class(self, v5), "_commonDictionaryForTask:", v4);
  id v7 = (id)objc_claimAutoreleasedReturnValue(v6);

  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v7);
}

+ (id)allRecordFetchTasksInDatabase:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[SQLiteBooleanPredicate truePredicate](&OBJC_CLASS___SQLiteBooleanPredicate, "truePredicate"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v4 predicate:v5]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _tasksForQuery:v6]);
  return v7;
}

+ (id)_recordFetchTaskWithTransactionSourcePID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForTransactionSourcePID:a3]);
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  return v8;
}

+ (id)_recordFetchTaskWithCloudStoreZonePID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForCloudStoreZonePID:a3]);
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  return v8;
}

+ (id)_predicateForTransactionSourcePID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"transaction_source_pid",  v3));

  return v4;
}

+ (id)_predicateForCloudStoreZonePID:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"cloud_store_zone_pid",  v3));

  return v4;
}

+ (id)_predicateForPID:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"pid",  a3);
}

+ (void)removeRecordFetchTasks:(id)a3 inDatabase:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  id v7 = v5;
  id v8 = [v5 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v8)
  {
    id v10 = v8;
    uint64_t v11 = *(void *)v30;
    *(void *)&__int128 v9 = 138412546LL;
    __int128 v27 = v9;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v30 != v11) {
          objc_enumerationMutation(v7);
        }
        id v13 = *(void **)(*((void *)&v29 + 1) + 8LL * (void)i);
        id v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "transactionSourceIdentifier", v27));
        uint64_t v15 = objc_claimAutoreleasedReturnValue([v13 cloudStoreZone]);
        id v16 = (void *)v15;
        if (v14)
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue( +[TransactionSource anyInDatabase:withIdentifier:]( &OBJC_CLASS___TransactionSource,  "anyInDatabase:withIdentifier:",  v6,  v14));
          id v18 = [v17 persistentID];
          if (v18)
          {
            uint64_t v19 = objc_claimAutoreleasedReturnValue([a1 _recordFetchTaskWithTransactionSourcePID:v18 inDatabase:v6]);
LABEL_12:
            v21 = (void *)v19;
            goto LABEL_19;
          }

          uint64_t Object = PKLogFacilityTypeGetObject(9LL);
          id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v27;
            v34 = v13;
            __int16 v35 = 2112;
            v36 = v14;
            __int16 v24 = v23;
            v25 = "Error tried to delete task %@ with a transactionSourceIdentifier %@ that doesnt exist in the database";
LABEL_17:
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, v25, buf, 0x16u);
          }
        }

        else
        {
          if (!v15) {
            goto LABEL_21;
          }
          v17 = (void *)objc_claimAutoreleasedReturnValue( +[CloudStoreZone anyInDatabase:forCloudStoreZone:]( &OBJC_CLASS___CloudStoreZone,  "anyInDatabase:forCloudStoreZone:",  v6,  v15));
          id v20 = [v17 persistentID];
          if (v20)
          {
            uint64_t v19 = objc_claimAutoreleasedReturnValue([a1 _recordFetchTaskWithCloudStoreZonePID:v20 inDatabase:v6]);
            goto LABEL_12;
          }

          uint64_t v26 = PKLogFacilityTypeGetObject(9LL);
          id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v27;
            v34 = v13;
            __int16 v35 = 2112;
            v36 = v16;
            __int16 v24 = v23;
            v25 = "Error tried to delete task %@ with a cloudStoreZone %@ that doesnt exist in the database";
            goto LABEL_17;
          }
        }

        v21 = 0LL;
LABEL_19:

        if (v21)
        {
          [v21 deleteFromDatabase];
        }

+ (void)deleteAllEntriesForTransactionSourcePID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForTransactionSourcePID:a3]);
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);

  [v8 deleteAllEntities];
}

+ (void)deleteAllEntriesForCloudStoreZonePID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForCloudStoreZonePID:a3]);
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v7]);

  [v8 deleteAllEntities];
}

+ (id)_tasksForQuery:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 database]);
  __int128 v32 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  id v8 = objc_msgSend((id)objc_opt_class(a1, v7), "_propertySettersForRecordFetchTask");
  __int128 v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 allKeys]);
  id v11 = [v10 mutableCopy];

  uint64_t v12 = (char *)[v11 count];
  [v11 addObject:@"last_error_domain"];
  [v11 addObject:@"last_error_code"];
  [v11 addObject:@"last_error_description"];
  [v11 addObject:@"cloud_store_zone_pid"];
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472LL;
  v38[2] = sub_1002C0064;
  v38[3] = &unk_100652E60;
  id v43 = a1;
  id v13 = v9;
  id v39 = v13;
  v44 = v12;
  v45 = v12 + 1;
  id v14 = v4;
  v46 = v12 + 2;
  v47 = v12 + 3;
  id v15 = v5;
  id v40 = v15;
  id v16 = v6;
  v41 = v16;
  v17 = v32;
  v42 = v17;
  [v14 enumeratePersistentIDsAndProperties:v11 usingBlock:v38];
  if (-[NSMutableSet count](v16, "count"))
  {
    id v30 = v13;
    id v31 = v15;
    v33 = v14;
    id v18 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    uint64_t v19 = v16;
    id v20 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v19,  "countByEnumeratingWithState:objects:count:",  &v34,  v48,  16LL);
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v35;
      do
      {
        id v23 = 0LL;
        do
        {
          if (*(void *)v35 != v22) {
            objc_enumerationMutation(v19);
          }
          __int16 v24 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPID:*(void *)(*((void *)&v34 + 1) + 8 * (void)v23)]);
          -[NSMutableArray addObject:](v18, "addObject:", v24);

          id v23 = (char *)v23 + 1;
        }

        while (v21 != v23);
        id v21 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v19,  "countByEnumeratingWithState:objects:count:",  &v34,  v48,  16LL);
      }

      while (v21);
    }

    id v14 = v33;
    v25 = (void *)objc_claimAutoreleasedReturnValue([v33 database]);
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAnyPredicates:",  v18));
    __int128 v27 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v25 predicate:v26]);

    [v27 deleteAllEntities];
    id v13 = v30;
    id v15 = v31;
  }

  id v28 = -[NSMutableArray copy](v17, "copy");

  return v28;
}

+ (id)_commonDictionaryForTask:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v3 type]));
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v5, @"type");

  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v3 status]));
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v6, @"status");

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v3 startDate]);
  id v8 = (void *)_SQLValueForDate(v7);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v8, @"start_date");

  __int128 v9 = (void *)objc_claimAutoreleasedReturnValue([v3 endDate]);
  id v10 = (void *)_SQLValueForDate(v9);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v10, @"end_date");

  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v3 backoffLevel]));
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v11, @"backoff_level");

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v3 nextPossibleFetchDate]);
  id v13 = (void *)_SQLValueForDate(v12);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v13, @"next_possible_fetch_date");

  id v14 = (void *)objc_claimAutoreleasedReturnValue([v3 lastError]);
  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v14 code]));
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v15, @"last_error_code");

  id v16 = (void *)objc_claimAutoreleasedReturnValue([v14 domain]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v16, @"last_error_domain");

  v17 = (void *)objc_claimAutoreleasedReturnValue([v14 userInfo]);
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:NSLocalizedDescriptionKey]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v18, @"last_error_description");

  return v4;
}

+ (id)_propertySettersForRecordFetchTask
{
  v3[0] = @"type";
  v3[1] = @"status";
  v4[0] = &stru_100652EA0;
  v4[1] = &stru_100652EC0;
  v3[2] = @"start_date";
  v3[3] = @"end_date";
  v4[2] = &stru_100652EE0;
  v4[3] = &stru_100652F00;
  v3[4] = @"backoff_level";
  v3[5] = @"next_possible_fetch_date";
  v4[4] = &stru_100652F20;
  v4[5] = &stru_100652F40;
  v3[6] = @"transaction_source.identifier";
  v4[6] = &stru_100652F60;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  7LL));
}

@end