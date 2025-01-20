void sub_100003314(uint64_t a1)
{
  id v1;
  void *v2;
  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)qword_10001DE28;
  qword_10001DE28 = (uint64_t)v1;
}

void sub_10000333C(void *a1, uint64_t a2)
{
  id v3 = a1;
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue([@"CKPersistentStorageKeysRemoved." stringByAppendingString:a2]);
  v7 = @"removed";
  id v8 = v3;
  v5 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v8,  &v7,  1LL));

  DistributedCenter = CFNotificationCenterGetDistributedCenter();
  CFNotificationCenterPostNotification(DistributedCenter, v4, 0LL, v5, 1u);
}

void sub_10000381C(id a1)
{
  uint64_t v1 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  uint64_t v2 = objc_opt_class(&OBJC_CLASS___NSArray);
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSData);
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSDate);
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSSet);
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSString);
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSURL);
  v9 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v1,  v2,  v3,  v4,  v5,  v6,  v7,  v8,  objc_opt_class(&OBJC_CLASS___NSUUID),  0LL);
  uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)qword_10001DE30;
  qword_10001DE30 = v10;
}

LABEL_10:
}

  result = *(void *)(a1 + 72);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void, void, void))(result + 16))( result,  *(void *)(a1 + 32),  *(void *)(a1 + 56),  *(void *)(a1 + 64),  *(unsigned __int8 *)(a1 + 80));
  }
  return result;
}

void sub_100003AD8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = (os_log_s *)CKLogContextDaemon;
    if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v14 = 136315394;
      v15 = "-[CKNCloudKitDataStore mergeRecordsWithDictionary:deletedRecordKeys:containsAllChanges:]_block_invoke";
      __int16 v16 = 2112;
      id v17 = v5;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%s error: %@", (uint8_t *)&v14, 0x16u);
    }
  }

  uint64_t v8 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  v9 = v8;
  if (v6) {
    -[NSMutableArray addObjectsFromArray:](v8, "addObjectsFromArray:", v6);
  }
  if ([*(id *)(a1 + 32) count])
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[CKDaemon sharedDaemon](&OBJC_CLASS___CKDaemon, "sharedDaemon"));
    [v10 saveKeysAndValues:*(void *)(a1 + 32) toStoreWithIdentifier:@"synched" completionHandler:&stru_100018528];

    v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) allKeys]);
    -[NSMutableArray removeObjectsInArray:](v9, "removeObjectsInArray:", v11);
  }

  if ([*(id *)(a1 + 40) count])
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[CKDaemon sharedDaemon](&OBJC_CLASS___CKDaemon, "sharedDaemon"));
    [v12 removeValuesForKeys:*(void *)(a1 + 40) fromStoreWithIdentifier:@"synched" completionHandler:&stru_100018548];

    -[NSMutableArray removeObjectsInArray:](v9, "removeObjectsInArray:", *(void *)(a1 + 40));
  }

  if (-[NSMutableArray count](v9, "count"))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[CKDaemon sharedDaemon](&OBJC_CLASS___CKDaemon, "sharedDaemon"));
    [v13 removeValuesForKeys:v9 fromStoreWithIdentifier:@"synched" completionHandler:&stru_100018568];
  }
}

void sub_100003CBC(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  if (v2)
  {
    uint64_t v3 = (os_log_s *)CKLogContextDaemon;
    if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136315394;
      id v5 = "-[CKNCloudKitDataStore mergeRecordsWithDictionary:deletedRecordKeys:containsAllChanges:]_block_invoke";
      __int16 v6 = 2112;
      uint64_t v7 = v2;
      _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%s error: %@", (uint8_t *)&v4, 0x16u);
    }
  }
}

void sub_100003D80(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  if (v2)
  {
    uint64_t v3 = (os_log_s *)CKLogContextDaemon;
    if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136315394;
      id v5 = "-[CKNCloudKitDataStore mergeRecordsWithDictionary:deletedRecordKeys:containsAllChanges:]_block_invoke";
      __int16 v6 = 2112;
      uint64_t v7 = v2;
      _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%s error: %@", (uint8_t *)&v4, 0x16u);
    }
  }
}

void sub_100003E44(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  if (v2)
  {
    uint64_t v3 = (os_log_s *)CKLogContextDaemon;
    if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136315394;
      id v5 = "-[CKNCloudKitDataStore mergeRecordsWithDictionary:deletedRecordKeys:containsAllChanges:]_block_invoke";
      __int16 v6 = 2112;
      uint64_t v7 = v2;
      _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%s error: %@", (uint8_t *)&v4, 0x16u);
    }
  }
}

void sub_100003F08(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  if (v2)
  {
    uint64_t v3 = (os_log_s *)CKLogContextDaemon;
    if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136315394;
      id v5 = "-[CKNCloudKitDataStore mergeRecordsWithDictionary:deletedRecordKeys:containsAllChanges:]_block_invoke";
      __int16 v6 = 2112;
      uint64_t v7 = v2;
      _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%s error: %@", (uint8_t *)&v4, 0x16u);
    }
  }
}

void sub_100003FCC(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  if (v2)
  {
    uint64_t v3 = (os_log_s *)CKLogContextDaemon;
    if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136315394;
      id v5 = "-[CKNCloudKitDataStore mergeRecordsWithDictionary:deletedRecordKeys:containsAllChanges:]_block_invoke";
      __int16 v6 = 2112;
      uint64_t v7 = v2;
      _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%s error: %@", (uint8_t *)&v4, 0x16u);
    }
  }
}

LABEL_7:
    v13 = 0;
    goto LABEL_8;
  }

  if (([v7 isEqualToString:@"Delete"] & 1) != 0
    || [v7 isEqualToString:@"Disable"])
  {
    v11 = (os_log_s *)CKLogContextDaemon;
    if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v23 = "-[CKAlarmInteractionProcessor processInteraction:bundleId:]";
      v12 = "%s Ignoring Alarm Delete or Disable events";
LABEL_14:
      _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, v12, buf, 0xCu);
      goto LABEL_7;
    }

    goto LABEL_7;
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@#%@%@",  @"RecurringAlarm",  @"RecurringAlarmApp",  v7));
  __int16 v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  if (v5) {
    id v17 = v5;
  }
  else {
    id v17 = &stru_100018F40;
  }
  v20 = @"bundleId";
  v21 = v17;
  v13 = 1;
  v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v21,  &v20,  1LL));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[CKDaemon sharedDaemon](&OBJC_CLASS___CKDaemon, "sharedDaemon"));
  [v19 recordEventWithIdentifier:v15 startDate:v16 endDate:v16 metadata:v18 toStoreWithIdentifier:@"synched" completionHandler:&stru_100018610];

LABEL_8:
  return v13;
}

void sub_10000435C(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  if (v2)
  {
    uint64_t v3 = (os_log_s *)CKLogContextDaemon;
    if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136315394;
      id v5 = "-[CKAlarmInteractionProcessor processInteraction:bundleId:]_block_invoke";
      __int16 v6 = 2112;
      uint64_t v7 = v2;
      _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v4, 0x16u);
    }
  }
}
}

LABEL_13:
    goto LABEL_14;
  }

  v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  CKErrorDomain,  6LL,  0LL));
  (*((void (**)(id, void *, void, void, void, void))v7 + 2))(v7, v28, 0LL, 0LL, 0LL, 0LL);

LABEL_14:
}
}

void sub_100005B84(_Unwind_Exception *a1)
{
}

LABEL_8:
}

void sub_100007960(uint64_t a1, int a2)
{
  if (a1)
  {
    if (*(unsigned __int8 *)(a1 + 9) != a2)
    {
      *(_BYTE *)(a1 + 9) = a2;
      id v4 = (id)objc_claimAutoreleasedReturnValue( +[CKKnowledgeStore userDefaultsKnowledgeStore]( &OBJC_CLASS___CKKnowledgeStore,  "userDefaultsKnowledgeStore"));
      uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  *(unsigned __int8 *)(a1 + 9)));
      [v4 setValue:v3 forKey:@"HasSetUpRecordZoneSubscription"];
    }
  }

uint64_t sub_1000079F0(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

id sub_100007A04(uint64_t a1)
{
  return [*(id *)(a1 + 32) _disableSyncAndDeleteCloudDataWithCompletionHandler:*(void *)(a1 + 40)];
}

void sub_100007A10(void *a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  block[0] = _NSConcreteStackBlock;
  block[2] = sub_100007AD4;
  block[3] = &unk_100018928;
  uint64_t v8 = a1[4];
  v9 = (void *)a1[5];
  uint64_t v10 = *(dispatch_queue_s **)(v8 + 32);
  block[1] = 3221225472LL;
  block[4] = v8;
  id v14 = v6;
  id v15 = v9;
  id v16 = v7;
  uint64_t v17 = a1[6];
  id v11 = v7;
  id v12 = v6;
  dispatch_async(v10, block);
}

void sub_100007AD4(uint64_t a1)
{
  if ([*(id *)(a1 + 32) _shouldSync])
  {
    if ([*(id *)(a1 + 40) containsObject:*(void *)(a1 + 48)])
    {
      uint64_t v2 = (void *)CKLogContextDaemon;
      if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        uint64_t v3 = *(void **)(a1 + 48);
        id v4 = v2;
        id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 subscriptionID]);
        *(_DWORD *)buf = 136315394;
        v21 = "-[CKNCloudKitManager _setupRecordZoneSubscriptionWithRetryInterval:]_block_invoke";
        __int16 v22 = 2112;
        v23 = v5;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s Subscription created: (%@)", buf, 0x16u);
      }

      objc_storeStrong((id *)(*(void *)(a1 + 32) + 72LL), *(id *)(a1 + 48));
      sub_100007960(*(void *)(a1 + 32), 1);
      [*(id *)(a1 + 32) _fetchChanges];
    }

    else
    {
      int v7 = sub_100007E24(*(void **)(a1 + 56));
      uint64_t v8 = *(void *)(a1 + 32);
      if (v7)
      {
        if (*(void *)(v8 + 56)) {
          [(id)v8 _resetZone];
        }
        else {
          sub_100007960(v8, 0);
        }
      }

      else
      {
        dispatch_source_t v9 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  *(dispatch_queue_t *)(v8 + 32));
        uint64_t v10 = *(void *)(a1 + 32);
        id v11 = *(void **)(v10 + 80);
        *(void *)(v10 + 80) = v9;

        id v12 = *(dispatch_source_s **)(*(void *)(a1 + 32) + 80LL);
        dispatch_time_t v13 = dispatch_time(0LL, (uint64_t)(*(double *)(a1 + 64) * 1000000000.0));
        dispatch_source_set_timer(v12, v13, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
        else {
          double v14 = 86400.0;
        }
        uint64_t v15 = *(void *)(a1 + 32);
        id v16 = *(dispatch_source_s **)(v15 + 80);
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472LL;
        v19[2] = sub_100007FBC;
        v19[3] = &unk_1000188D8;
        v19[4] = v15;
        *(double *)&v19[5] = v14;
        dispatch_source_set_event_handler(v16, v19);
        dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 80LL));
        uint64_t v17 = (os_log_s *)CKLogContextDaemon;
        if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_ERROR))
        {
          v18 = *(void **)(a1 + 56);
          *(_DWORD *)buf = 136315650;
          v21 = "-[CKNCloudKitManager _setupRecordZoneSubscriptionWithRetryInterval:]_block_invoke_2";
          __int16 v22 = 2112;
          v23 = v18;
          __int16 v24 = 2048;
          double v25 = v14;
          _os_log_error_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "%s Subscription creation failed with error (%@). Retrying in %f seconds",  buf,  0x20u);
        }
      }
    }
  }

  else
  {
    id v6 = (os_log_s *)CKLogContextDaemon;
    if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v21 = "-[CKNCloudKitManager _setupRecordZoneSubscriptionWithRetryInterval:]_block_invoke_2";
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "%s iCloud sync is disabled. Will not retry creating zone subscription",  buf,  0xCu);
    }
  }

uint64_t sub_100007E24(void *a1)
{
  id v1 = a1;
  uint64_t v2 = (NSString *)objc_claimAutoreleasedReturnValue([v1 domain]);

  if (v2 != CKErrorDomain) {
    goto LABEL_2;
  }
  if ([v1 code] == (id)26)
  {
    uint64_t v3 = 1LL;
    goto LABEL_17;
  }

  if ([v1 code] == (id)2)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v1 userInfo]);
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:CKPartialErrorsByItemIDKey]);

    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v10 = 0u;
    __int128 v11 = 0u;
    id v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allValues", 0));
    uint64_t v3 = (uint64_t)[v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v3)
    {
      uint64_t v7 = *(void *)v11;
      while (2)
      {
        for (uint64_t i = 0LL; i != v3; ++i)
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v6);
          }
          if ([*(id *)(*((void *)&v10 + 1) + 8 * i) code] == (id)26)
          {
            uint64_t v3 = 1LL;
            goto LABEL_16;
          }
        }

        uint64_t v3 = (uint64_t)[v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v3) {
          continue;
        }
        break;
      }
    }

LABEL_16:
  }

  else
  {
LABEL_2:
    uint64_t v3 = 0LL;
  }

LABEL_17:
  return v3;
}

id sub_100007FBC(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setupRecordZoneSubscriptionWithRetryInterval:*(double *)(a1 + 40)];
}

void sub_100007FCC(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _createRecordsIDsForKeys:*(void *)(a1 + 40)]);
  uint64_t v3 = *(void **)(a1 + 32);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100008070;
  v5[3] = &unk_1000189A0;
  id v4 = *(id *)(a1 + 48);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  [v3 _saveRecords:0 recordIDsToDelete:v2 savePolicy:1 completion:v5];
}

void sub_100008070(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  __int128 v10 = *(void **)(a1 + 40);
  if (v10)
  {
    __int128 v11 = *(dispatch_queue_s **)(*(void *)(a1 + 32) + 32LL);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100008150;
    v12[3] = &unk_100018B08;
    id v16 = v10;
    id v13 = v7;
    id v14 = v8;
    id v15 = v9;
    dispatch_async(v11, v12);
  }
}

uint64_t sub_100008150(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[7] + 16LL))(a1[7], a1[4], a1[5], a1[6]);
}

void sub_100008164(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _createRecordsWithDictionary:*(void *)(a1 + 40)]);
  uint64_t v3 = *(void **)(a1 + 32);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100008208;
  v5[3] = &unk_1000189A0;
  id v4 = *(id *)(a1 + 48);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  [v3 _saveRecords:v2 recordIDsToDelete:0 savePolicy:1 completion:v5];
}

void sub_100008208(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  __int128 v10 = *(void **)(a1 + 40);
  if (v10)
  {
    __int128 v11 = *(dispatch_queue_s **)(*(void *)(a1 + 32) + 32LL);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1000082E8;
    v12[3] = &unk_100018B08;
    id v16 = v10;
    id v13 = v7;
    id v14 = v8;
    id v15 = v9;
    dispatch_async(v11, v12);
  }
}

uint64_t sub_1000082E8(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[7] + 16LL))(a1[7], a1[4], a1[5], a1[6]);
}

id sub_1000082FC(uint64_t a1)
{
  return [*(id *)(a1 + 32) _saveRecords:*(void *)(a1 + 40) recordIDsToDelete:*(void *)(a1 + 48) savePolicy:1 completion:*(void *)(a1 + 56)];
}

void sub_100008310(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  __int128 v10 = (os_log_s *)CKLogContextDaemon;
  if (v9)
  {
    if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v22 = "-[CKNCloudKitManager _saveRecords:recordIDsToDelete:savePolicy:completion:]_block_invoke";
      __int16 v23 = 2112;
      id v24 = v9;
      _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "%s Failed to save records into database with error: (%@)",  buf,  0x16u);
    }

    if ((sub_10000855C(v9) & 1) != 0)
    {
      __int128 v11 = dispatch_group_create();
      dispatch_group_enter(v11);
      uint64_t v12 = *(void *)(a1 + 32);
      id v13 = *(dispatch_queue_s **)(v12 + 32);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100008728;
      block[3] = &unk_100018770;
      block[4] = v12;
      dispatch_group_t v14 = v11;
      dispatch_group_t v20 = v14;
      dispatch_async(v13, block);
    }

    else
    {
      dispatch_group_t v14 = dispatch_group_create();
    }

    uint64_t v15 = *(void *)(a1 + 32);
    id v16 = *(dispatch_queue_s **)(v15 + 32);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_1000087D0;
    v18[3] = &unk_100018A58;
    v18[4] = v15;
    dispatch_group_notify(v14, v16, v18);
  }

  else
  {
    if (!os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_INFO)) {
      goto LABEL_12;
    }
    dispatch_group_t v14 = v10;
    *(_DWORD *)buf = 136315394;
    __int16 v22 = "-[CKNCloudKitManager _saveRecords:recordIDsToDelete:savePolicy:completion:]_block_invoke_4";
    __int16 v23 = 2048;
    id v24 = [v7 count];
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v14,  OS_LOG_TYPE_INFO,  "%s Saved %ld records into database",  buf,  0x16u);
  }

LABEL_12:
  uint64_t v17 = *(void *)(a1 + 40);
  if (v17) {
    (*(void (**)(uint64_t, id, id, id))(v17 + 16))(v17, v9, v7, v8);
  }
}

uint64_t sub_10000855C(void *a1)
{
  id v1 = a1;
  uint64_t v2 = (NSString *)objc_claimAutoreleasedReturnValue([v1 domain]);

  if (v2 != CKErrorDomain) {
    goto LABEL_2;
  }
  if ([v1 code] == (id)112)
  {
    uint64_t v3 = 1LL;
    goto LABEL_19;
  }

  if ([v1 code] == (id)2)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v1 userInfo]);
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:CKPartialErrorsByItemIDKey]);

    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    id v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allValues", 0));
    id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v16;
      while (2)
      {
        for (uint64_t i = 0LL; i != v8; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          __int128 v11 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
          uint64_t v12 = (NSString *)objc_claimAutoreleasedReturnValue([v11 domain]);
          if (v12 == v2)
          {
            id v13 = [v11 code];

            if (v13 == (id)112)
            {
              uint64_t v3 = 1LL;
              goto LABEL_18;
            }
          }

          else
          {
          }
        }

        id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }

    uint64_t v3 = 0LL;
LABEL_18:
  }

  else
  {
LABEL_2:
    uint64_t v3 = 0LL;
  }

LABEL_19:
  return v3;
}

void sub_100008728(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 56) zoneID]);
  if (v2)
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472LL;
    v4[2] = sub_1000087E8;
    v4[3] = &unk_100018748;
    uint64_t v3 = *(void **)(a1 + 32);
    id v5 = *(id *)(a1 + 40);
    [v3 _deleteRecordZoneWithID:v2 qualityOfService:17 completion:v4];
  }

  else
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
}

void sub_1000087D0(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  if (v1[7]) {
    [v1 _resetZone];
  }
  else {
    sub_100007960((uint64_t)v1, 0);
  }
}

void sub_1000087E8(uint64_t a1)
{
}

void sub_1000087F0(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    __int128 v10 = (void *)CKLogContextDaemon;
    if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = *(void **)(a1 + 32);
      id v13 = v10;
      dispatch_group_t v14 = (void *)objc_claimAutoreleasedReturnValue([v12 zoneName]);
      int v15 = 136315650;
      __int128 v16 = "-[CKNCloudKitManager _deleteRecordZoneWithID:qualityOfService:completion:]_block_invoke";
      __int16 v17 = 2112;
      __int128 v18 = v14;
      __int16 v19 = 2112;
      id v20 = v9;
      _os_log_error_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "%s Error deleting zone (%@): (%@)",  (uint8_t *)&v15,  0x20u);
    }
  }

  uint64_t v11 = *(void *)(a1 + 40);
  if (v11) {
    (*(void (**)(uint64_t, id))(v11 + 16))(v11, v9);
  }
}

void sub_100008928(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    __int128 v10 = (void *)CKLogContextDaemon;
    if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      id v13 = *(void **)(a1 + 32);
      dispatch_group_t v14 = v10;
      int v15 = (void *)objc_claimAutoreleasedReturnValue([v13 zoneName]);
      int v16 = 136315650;
      __int16 v17 = "-[CKNCloudKitManager _createRecordZoneWithID:completion:]_block_invoke";
      __int16 v18 = 2112;
      __int16 v19 = v15;
      __int16 v20 = 2112;
      id v21 = v9;
      _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "%s Error creating zone (%@): (%@)",  (uint8_t *)&v16,  0x20u);
    }
  }

  uint64_t v11 = *(void *)(a1 + 40);
  if (v11)
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v7 firstObject]);
    (*(void (**)(uint64_t, id, void *))(v11 + 16))(v11, v9, v12);
  }
}

void sub_100008A7C(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = a1[4];
  id v8 = (void *)a1[5];
  id v9 = *(dispatch_queue_s **)(v7 + 32);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100008B44;
  block[3] = &unk_100018928;
  block[4] = v7;
  id v13 = v8;
  id v14 = v5;
  id v15 = v6;
  uint64_t v16 = a1[6];
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v9, block);
}

void sub_100008B44(uint64_t a1)
{
  if ([*(id *)(a1 + 32) _shouldSync])
  {
    uint64_t v2 = *(void *)(a1 + 32);
    if (*(void *)(v2 + 48))
    {
      uint64_t v3 = *(void **)(a1 + 48);
      if (!v3)
      {
        id v14 = *(void **)(a1 + 56);
        if (v14)
        {
          id v15 = (void *)CKLogContextDaemon;
          if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_INFO))
          {
            uint64_t v16 = v15;
            __int16 v17 = (void *)objc_claimAutoreleasedReturnValue([v14 zoneID]);
            __int16 v18 = (void *)objc_claimAutoreleasedReturnValue([v17 zoneName]);
            *(_DWORD *)buf = 136315394;
            v26 = "-[CKNCloudKitManager _setupRecordZoneWithRetryInterval:]_block_invoke";
            __int16 v27 = 2112;
            v28 = v18;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%s Zone created: (%@)", buf, 0x16u);

            id v14 = *(void **)(a1 + 56);
            uint64_t v2 = *(void *)(a1 + 32);
          }

          if (([v14 isEqual:*(void *)(v2 + 56)] & 1) == 0)
          {
            objc_storeStrong((id *)(*(void *)(a1 + 32) + 56LL), *(id *)(a1 + 56));
            sub_100008E80(*(void *)(a1 + 32), 0LL);
          }

          uint64_t v19 = *(void *)(a1 + 32);
          if (*(void *)(v19 + 72) && !*(_BYTE *)(v19 + 9)) {
            [(id)v19 _fetchChanges];
          }
          else {
            [(id)v19 _setupRecordZoneSubscription];
          }
          return;
        }
      }

      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472LL;
      v22[2] = sub_100008FFC;
      v22[3] = &unk_100018900;
      v22[4] = v2;
      uint64_t v24 = *(void *)(a1 + 64);
      id v23 = v3;
      id v4 = objc_retainBlock(v22);
      id v5 = *(void **)(a1 + 48);
      if (v5 && sub_10000855C(v5))
      {
        uint64_t v7 = *(void **)(a1 + 32);
        uint64_t v6 = *(void *)(a1 + 40);
        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472LL;
        v20[2] = sub_10000919C;
        v20[3] = &unk_100018C20;
        v20[4] = v7;
        id v21 = v4;
        [v7 _deleteRecordZoneWithID:v6 qualityOfService:17 completion:v20];
      }

      else
      {
        ((void (*)(void *))v4[2])(v4);
      }

      id v13 = v23;
    }

    else
    {
      uint64_t v12 = (os_log_s *)CKLogContextDaemon;
      if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v26 = "-[CKNCloudKitManager _setupRecordZoneWithRetryInterval:]_block_invoke_3";
        _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "%s Zone creation error - container no longer exists",  buf,  0xCu);
        uint64_t v2 = *(void *)(a1 + 32);
      }

      id v13 = *(void **)(v2 + 56);
      *(void *)(v2 + 56) = 0LL;
    }

    return;
  }

  id v8 = (void *)CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    id v9 = *(void **)(a1 + 40);
    id v10 = v8;
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 zoneName]);
    *(_DWORD *)buf = 136315394;
    v26 = "-[CKNCloudKitManager _setupRecordZoneWithRetryInterval:]_block_invoke_2";
    __int16 v27 = 2112;
    v28 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%s iCloud sync is disabled. Will not attempt retry creating zone: (%@)",  buf,  0x16u);
  }

void sub_100008E80(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v5 = v4;
  if (a1)
  {
    id v7 = *(id *)(a1 + 88);
    uint64_t v6 = (id *)(a1 + 88);
    if (v7 != v4)
    {
      objc_storeStrong(v6, a2);
      id v8 = (void *)objc_claimAutoreleasedReturnValue( +[CKKnowledgeStore userDefaultsKnowledgeStore]( &OBJC_CLASS___CKKnowledgeStore,  "userDefaultsKnowledgeStore"));
      if (v5)
      {
        id v13 = 0LL;
        id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v5,  1LL,  &v13));
        id v10 = v13;
        if (!v10)
        {
          [v8 setValue:v9 forKey:@"ServerChangeToken"];

          goto LABEL_10;
        }

        id v11 = v10;
        uint64_t v12 = (os_log_s *)CKLogContextDaemon;
        if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          id v15 = "-[CKNCloudKitManager setServerChangeToken:]";
          __int16 v16 = 2112;
          __int16 v17 = v5;
          _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "%s Error unarchihving server change token %@",  buf,  0x16u);
        }
      }

      [v8 setValue:0 forKey:@"ServerChangeToken"];
LABEL_10:
    }
  }
}

void sub_100008FFC(uint64_t a1)
{
  dispatch_source_t v2 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  *(dispatch_queue_t *)(*(void *)(a1 + 32) + 32LL));
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 64);
  *(void *)(v3 + 64) = v2;

  id v5 = *(dispatch_source_s **)(*(void *)(a1 + 32) + 64LL);
  dispatch_time_t v6 = dispatch_time(0LL, (uint64_t)(*(double *)(a1 + 48) * 1000000000.0));
  dispatch_source_set_timer(v5, v6, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  else {
    double v7 = 86400.0;
  }
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(dispatch_source_s **)(v8 + 64);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100009248;
  v12[3] = &unk_1000188D8;
  void v12[4] = v8;
  *(double *)&v12[5] = v7;
  dispatch_source_set_event_handler(v9, v12);
  dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 64LL));
  id v10 = (os_log_s *)CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 136315650;
    id v14 = "-[CKNCloudKitManager _setupRecordZoneWithRetryInterval:]_block_invoke";
    __int16 v15 = 2112;
    uint64_t v16 = v11;
    __int16 v17 = 2048;
    double v18 = v7;
    _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "%s Zone creation failed: (%@) Retrying in %f seconds",  buf,  0x20u);
  }

void sub_10000919C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  dispatch_source_t v2 = *(void **)(a1 + 40);
  uint64_t v3 = *(dispatch_queue_s **)(v1 + 32);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100009210;
  v4[3] = &unk_100018860;
  void v4[4] = v1;
  id v5 = v2;
  dispatch_async(v3, v4);
}

uint64_t sub_100009210(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

id sub_100009248(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setupRecordZoneWithRetryInterval:*(double *)(a1 + 40)];
}

void sub_100009258(uint64_t a1)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000092D0;
  v4[3] = &unk_1000188B0;
  dispatch_source_t v2 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  void v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [v2 _fetchChangesFrom:0 completion:v4];
}

void sub_1000092D0(uint64_t a1, void *a2, void *a3, void *a4, char a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = *(void **)(a1 + 40);
  if (v12)
  {
    id v13 = *(dispatch_queue_s **)(*(void *)(a1 + 32) + 32LL);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000093C0;
    block[3] = &unk_100018888;
    id v18 = v12;
    id v15 = v9;
    id v16 = v10;
    id v17 = v11;
    char v19 = a5;
    dispatch_async(v13, block);
  }
}

uint64_t sub_1000093C0(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void, void))(*(void *)(a1 + 56) + 16LL))( *(void *)(a1 + 56),  *(void *)(a1 + 32),  *(void *)(a1 + 40),  *(void *)(a1 + 48),  *(unsigned __int8 *)(a1 + 64));
}

void sub_1000093D8(uint64_t a1)
{
  dispatch_source_t v2 = *(void **)(a1 + 32);
  uint64_t v1 = *(void **)(a1 + 40);
  uint64_t v3 = v2[11];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100009450;
  v4[3] = &unk_1000188B0;
  void v4[4] = v2;
  id v5 = v1;
  [v2 _fetchChangesFrom:v3 completion:v4];
}

void sub_100009450(uint64_t a1, void *a2, void *a3, void *a4, char a5, void *a6)
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  uint64_t v15 = *(void *)(a1 + 32);
  id v16 = *(void **)(a1 + 40);
  id v17 = *(dispatch_queue_s **)(v15 + 32);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100009564;
  block[3] = &unk_100018838;
  id v23 = v11;
  uint64_t v24 = v15;
  id v25 = v14;
  id v27 = v13;
  id v28 = v16;
  id v26 = v12;
  char v29 = a5;
  id v18 = v13;
  id v19 = v12;
  id v20 = v14;
  id v21 = v11;
  dispatch_async(v17, block);
}

uint64_t sub_100009564(uint64_t a1)
{
  dispatch_source_t v2 = *(void **)(a1 + 32);
  if (!v2)
  {
    if ([*(id *)(a1 + 40) _shouldSync])
    {
      uint64_t v3 = *(void *)(a1 + 40);
      id v4 = *(void **)(a1 + 48);
LABEL_9:
      sub_100008E80(v3, v4);
      goto LABEL_10;
    }

    dispatch_source_t v2 = *(void **)(a1 + 32);
  }

  id v5 = v2;
  dispatch_time_t v6 = (NSString *)objc_claimAutoreleasedReturnValue([v5 domain]);
  double v7 = v6;
  if (v6 != CKErrorDomain)
  {

    goto LABEL_10;
  }

  id v8 = [v5 code];

  if (v8 == (id)21)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    id v4 = 0LL;
    goto LABEL_9;
  }

void sub_10000962C(uint64_t a1, void *a2, void *a3, void *a4, char a5, void *a6)
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  uint64_t v15 = *(void *)(a1 + 32);
  uint64_t v16 = *(void *)(a1 + 40);
  id v17 = *(dispatch_queue_s **)(v15 + 32);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100009730;
  block[3] = &unk_1000187E8;
  id v23 = v11;
  uint64_t v24 = v15;
  char v29 = a5;
  id v25 = v14;
  id v26 = v12;
  id v27 = v13;
  uint64_t v28 = v16;
  id v18 = v13;
  id v19 = v12;
  id v20 = v14;
  id v21 = v11;
  dispatch_async(v17, block);
}

void sub_100009730(uint64_t a1)
{
  dispatch_source_t v2 = *(void **)(a1 + 32);
  if (!v2)
  {
    if ([*(id *)(a1 + 40) _shouldSync])
    {
      sub_100008E80(*(void *)(a1 + 40), *(void **)(a1 + 48));
      if (*(_BYTE *)(a1 + 80) || [*(id *)(a1 + 56) count] || objc_msgSend(*(id *)(a1 + 64), "count"))
      {
        uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) _createDictionaryFromRecords:*(void *)(a1 + 56)]);
        id v4 = (void *)CKLogContextDaemon;
        if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          id v5 = v4;
          dispatch_time_t v6 = (void *)objc_claimAutoreleasedReturnValue([v3 allKeys]);
          *(_DWORD *)buf = 136315394;
          uint64_t v16 = "-[CKNCloudKitManager _fetchChangesWithRetryCount:]_block_invoke_2";
          __int16 v17 = 2112;
          id v18 = v6;
          _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s Received keys=[%@]", buf, 0x16u);
        }

        double v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) _createKeysForRecordsIDs:*(void *)(a1 + 64)]);
        [*(id *)(*(void *)(a1 + 40) + 96) mergeRecordsWithDictionary:v3 deletedRecordKeys:v7 containsAllChanges:*(unsigned __int8 *)(a1 + 80)];
        id v8 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
        v13[0] = _NSConcreteStackBlock;
        v13[1] = 3221225472LL;
        v13[2] = sub_1000099CC;
        v13[3] = &unk_1000187C0;
        id v14 = *(id *)(a1 + 56);
        [v8 logEventWithType:4102 contextProvider:v13];
      }

      return;
    }

    dispatch_source_t v2 = *(void **)(a1 + 32);
  }

  id v12 = v2;
  id v9 = (NSString *)objc_claimAutoreleasedReturnValue([v12 domain]);
  id v10 = v9;
  if (v9 == CKErrorDomain)
  {
    id v11 = [v12 code];

    if (v11 == (id)21)
    {
      sub_100008E80(*(void *)(a1 + 40), 0LL);
    }
  }

  else
  {
  }

NSMutableDictionary *sub_1000099CC(uint64_t a1)
{
  dispatch_source_t v2 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v3 = [*(id *)(a1 + 32) count];
  if (v3)
  {
    id v21 = v2;
    id v4 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", v3);
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    id v5 = *(id *)(a1 + 32);
    id v6 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v23;
      do
      {
        id v9 = 0LL;
        do
        {
          if (*(void *)v23 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)v9);
          id v11 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  4LL);
          id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 recordID]);
          id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 recordName]);

          if (v13) {
            -[NSMutableDictionary setObject:forKey:](v11, "setObject:forKey:", v13, @"record name");
          }
          id v14 = (void *)objc_claimAutoreleasedReturnValue([v10 modificationDate]);
          uint64_t v15 = v14;
          if (v14)
          {
            [v14 timeIntervalSince1970];
            uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
            -[NSMutableDictionary setObject:forKey:](v11, "setObject:forKey:", v16, @"modification date");
          }

          __int16 v17 = (void *)objc_claimAutoreleasedReturnValue([v10 recordChangeTag]);
          if (v17) {
            -[NSMutableDictionary setObject:forKey:](v11, "setObject:forKey:", v17, @"tag");
          }
          -[NSMutableArray addObject:](v4, "addObject:", v11);

          id v9 = (char *)v9 + 1;
        }

        while (v7 != v9);
        id v7 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }

      while (v7);
    }

    dispatch_source_t v2 = v21;
    if (-[NSMutableArray count](v4, "count")) {
      -[NSMutableDictionary setObject:forKey:](v21, "setObject:forKey:", v4, @"changes");
    }
  }

  id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v18 timeIntervalSince1970];
  id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  -[NSMutableDictionary setObject:forKey:](v2, "setObject:forKey:", v19, @"now");

  return v2;
}

uint64_t sub_100009C58(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100009C68(uint64_t a1)
{
}

id sub_100009C70(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

id sub_100009C7C(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

void sub_100009C88(uint64_t a1, int a2, id obj)
{
}

void sub_100009C9C(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5, void *a6)
{
  id v10 = a2;
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  id v14 = v13;
  if (v13)
  {
    uint64_t v15 = (NSString *)objc_claimAutoreleasedReturnValue([v13 domain]);
    uint64_t v16 = v15;
    if (v15 == CKErrorDomain)
    {
      id v23 = [v14 code];

      if (v23 == (id)21)
      {
        __int128 v24 = (void *)CKLogContextDaemon;
        if (!os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_ERROR))
        {
LABEL_11:
          uint64_t v31 = *(void *)(*(void *)(a1 + 32) + 8LL);
          __int128 v22 = *(void **)(v31 + 40);
          *(void *)(v31 + 40) = 0LL;
          goto LABEL_12;
        }

        __int128 v25 = v24;
        id v26 = (void *)objc_claimAutoreleasedReturnValue([v10 zoneName]);
        int v32 = 136315394;
        v33 = "-[CKNCloudKitManager _fetchChangesFrom:completion:]_block_invoke_4";
        __int16 v34 = 2112;
        v35 = v26;
        id v27 = "%s Change token expired for zone (%@)";
        uint64_t v28 = v25;
        uint32_t v29 = 22;
LABEL_14:
        _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, v27, (uint8_t *)&v32, v29);

        goto LABEL_11;
      }
    }

    else
    {
    }

    v30 = (void *)CKLogContextDaemon;
    if (!os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    __int128 v25 = v30;
    id v26 = (void *)objc_claimAutoreleasedReturnValue([v10 zoneName]);
    int v32 = 136315650;
    v33 = "-[CKNCloudKitManager _fetchChangesFrom:completion:]_block_invoke";
    __int16 v34 = 2112;
    v35 = v26;
    __int16 v36 = 2112;
    v37 = v14;
    id v27 = "%s Failed to fetch changes in zone (%@) with error (%@)";
    uint64_t v28 = v25;
    uint32_t v29 = 32;
    goto LABEL_14;
  }

  __int16 v17 = (void *)CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    id v18 = v17;
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v10 zoneName]);
    int v32 = 136315394;
    v33 = "-[CKNCloudKitManager _fetchChangesFrom:completion:]_block_invoke";
    __int16 v34 = 2112;
    v35 = v19;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "%s Fetched changes successfully in zone (%@)",  (uint8_t *)&v32,  0x16u);
  }

  uint64_t v20 = *(void *)(*(void *)(a1 + 32) + 8LL);
  id v21 = v11;
  __int128 v22 = *(void **)(v20 + 40);
  *(void *)(v20 + 40) = v21;
LABEL_12:
}

void sub_100009F44(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    id v5 = *(void **)(a1 + 32);
    id v6 = v4;
    uint64_t v7 = CKDatabaseScopeString([v5 databaseScope]);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    id v9 = [*(id *)(a1 + 40) count];
    *(_DWORD *)buf = 136315650;
    __int128 v24 = "-[CKNCloudKitManager _fetchChangesFrom:completion:]_block_invoke";
    __int16 v25 = 2112;
    id v26 = v8;
    __int16 v27 = 2048;
    id v28 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "%s Finished fetching changes in database (%@), %ld records",  buf,  0x20u);
  }

  if (v3)
  {
    id v10 = (os_log_s *)CKLogContextDaemon;
    if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      __int128 v24 = "-[CKNCloudKitManager _fetchChangesFrom:completion:]_block_invoke";
      __int16 v25 = 2112;
      id v26 = v3;
      _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "%s Failed to fetch changes with error (%@)",  buf,  0x16u);
    }

    int v11 = sub_10000855C(v3);
    if ((sub_100007E24(v3) & 1) != 0 || v11)
    {
      id v12 = dispatch_group_create();
      id v13 = v12;
      if (v11)
      {
        dispatch_group_enter(v12);
        uint64_t v14 = *(void *)(a1 + 48);
        uint64_t v15 = *(dispatch_queue_s **)(v14 + 32);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_10000A1B8;
        block[3] = &unk_100018770;
        void block[4] = v14;
        __int128 v22 = v13;
        dispatch_async(v15, block);
      }

      uint64_t v16 = *(void *)(a1 + 48);
      __int16 v17 = *(dispatch_queue_s **)(v16 + 32);
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472LL;
      v20[2] = sub_10000A260;
      v20[3] = &unk_100018A58;
      v20[4] = v16;
      dispatch_group_notify(v13, v17, v20);
    }

    uint64_t v18 = *(void *)(a1 + 64);
    if (v18)
    {
      BOOL v19 = 0LL;
LABEL_15:
      (*(void (**)(uint64_t, id, void, void, BOOL, void))(v18 + 16))( v18,  v3,  *(void *)(a1 + 40),  *(void *)(a1 + 56),  v19,  *(void *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 40LL));
    }
  }

  else
  {
    uint64_t v18 = *(void *)(a1 + 64);
    if (v18)
    {
      BOOL v19 = *(_BYTE *)(a1 + 80) != 0;
      goto LABEL_15;
    }
  }
}

void sub_10000A1B8(uint64_t a1)
{
  dispatch_source_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 56) zoneID]);
  if (v2)
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472LL;
    v4[2] = sub_10000A278;
    v4[3] = &unk_100018748;
    id v3 = *(void **)(a1 + 32);
    id v5 = *(id *)(a1 + 40);
    [v3 _deleteRecordZoneWithID:v2 qualityOfService:17 completion:v4];
  }

  else
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
}

void sub_10000A260(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  if (v1[7]) {
    [v1 _resetZone];
  }
  else {
    sub_100007960((uint64_t)v1, 0);
  }
}

void sub_10000A278(uint64_t a1)
{
}

void sub_10000A280(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(dispatch_queue_s **)(v7 + 32);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000A330;
  block[3] = &unk_100018658;
  id v12 = v6;
  id v13 = v5;
  uint64_t v14 = v7;
  id v9 = v5;
  id v10 = v6;
  dispatch_async(v8, block);
}

void sub_10000A330(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = (os_log_s *)CKLogContextDaemon;
    if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315394;
      id v10 = "-[CKNCloudKitManager _setupAccount]_block_invoke_2";
      __int16 v11 = 2112;
      uint64_t v12 = v2;
      _os_log_error_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_ERROR,  "%s Error while retrieving account status: %@",  (uint8_t *)&v9,  0x16u);
    }
  }

  id v4 = *(void **)(a1 + 40);
  if (v4 && [v4 supportsDeviceToDeviceEncryption])
  {
    [*(id *)(a1 + 48) _handleAccountStatusChange:*(void *)(a1 + 40)];
    return;
  }

  id v5 = (os_log_s *)CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    int v9 = 136315138;
    id v10 = "-[CKNCloudKitManager _setupAccount]_block_invoke";
    _os_log_error_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "%s Account status change cannot be handled",  (uint8_t *)&v9,  0xCu);
    id v5 = (os_log_s *)CKLogContextDaemon;
  }

  uint64_t v6 = *(void *)(a1 + 40);
  BOOL v7 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  if (v6)
  {
    if (v7)
    {
      int v9 = 136315138;
      id v10 = "-[CKNCloudKitManager _setupAccount]_block_invoke";
      uint64_t v8 = "%s AccountInfo DOES NOT supportsDeviceToDeviceEncryption";
LABEL_15:
      _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, v8, (uint8_t *)&v9, 0xCu);
    }
  }

  else if (v7)
  {
    int v9 = 136315138;
    id v10 = "-[CKNCloudKitManager _setupAccount]_block_invoke";
    uint64_t v8 = "%s AccountInfo is nil";
    goto LABEL_15;
  }

void sub_10000A4F4(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
  unsigned int v3 = [v2 cloudSyncEnabled];

  uint64_t v4 = *(void *)(a1 + 32);
  if (*(unsigned __int8 *)(v4 + 8) != v3)
  {
    *(_BYTE *)(v4 + _Block_object_dispose((const void *)(v1 - 192), 8) = v3;
    id v5 = (os_log_s *)CKLogContextDaemon;
    if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      if (*(_BYTE *)(*(void *)(a1 + 32) + 8LL)) {
        uint64_t v6 = @"enabled";
      }
      else {
        uint64_t v6 = @"disabled";
      }
      int v8 = 136315394;
      int v9 = "-[CKNCloudKitManager _cloudSyncPreferenceDidChange]_block_invoke";
      __int16 v10 = 2112;
      __int16 v11 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s Cloud synch is now %@", (uint8_t *)&v8, 0x16u);
    }

    BOOL v7 = *(_BYTE **)(a1 + 32);
    if (v7[8])
    {
      [v7 _initializeZone];
      [*(id *)(a1 + 32) _setupAccountState];
    }

    else
    {
      [v7 _cleanUpRecordZonesAndSubscriptions];
    }
  }

id sub_10000A624(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setupAccount];
}

void *sub_10000A62C(void *a1)
{
  if (a1)
  {
    uint64_t v1 = a1;
    uint64_t v2 = (void *)a1[3];
    if (!v2)
    {
      unsigned int v3 = objc_alloc(&OBJC_CLASS___APSConnection);
      uint64_t v4 = -[APSConnection initWithEnvironmentName:namedDelegatePort:queue:]( v3,  "initWithEnvironmentName:namedDelegatePort:queue:",  APSEnvironmentProduction,  @"com.apple.siriknowledged.aps",  v1[4]);
      id v5 = (void *)v1[3];
      v1[3] = v4;

      [(id)v1[3] setDelegate:v1];
      uint64_t v2 = (void *)v1[3];
      if (!v2)
      {
        uint64_t v6 = (os_log_s *)CKLogContextDaemon;
        if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_ERROR))
        {
          int v8 = 136315138;
          int v9 = "-[CKNCloudKitManager pushConnection]";
          _os_log_error_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "%s Failed to create push connection",  (uint8_t *)&v8,  0xCu);
          uint64_t v2 = (void *)v1[3];
        }

        else
        {
          uint64_t v2 = 0LL;
        }
      }
    }

    a1 = v2;
  }

  return a1;
}

id sub_10000A738(uint64_t a1)
{
  return [*(id *)(a1 + 32) _disablePush];
}

id sub_10000A740(uint64_t a1)
{
  return [*(id *)(a1 + 32) _enablePush];
}

id sub_10000A748(uint64_t a1)
{
  uint64_t v2 = objc_alloc_init(&OBJC_CLASS___CKNCloudKitDataStore);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 96);
  *(void *)(v3 + 96) = v2;

  [*(id *)(a1 + 32) _initializeZone];
  return [*(id *)(a1 + 32) _setupAccount];
}

id sub_10000A78C(uint64_t a1, void *a2)
{
  uint64_t v3 = (os_log_s *)CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315138;
    uint64_t v6 = "_CKNCloudKitPreferenceDidChangeCallback";
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "%s CloudKit preferences changed handler called",  (uint8_t *)&v5,  0xCu);
  }

  return [a2 _cloudSyncPreferenceDidChange];
}

void sub_10000A92C(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  uint64_t v2 = (void *)qword_10001DE48;
  qword_10001DE48 = (uint64_t)v1;
}

void sub_10000ABBC(uint64_t a1)
{
  if (a1)
  {
    xpc_set_event_stream_handler("com.apple.notifyd.matching", *(dispatch_queue_t *)(a1 + 8), &stru_100018A30);
    xpc_set_event_stream_handler("com.apple.distnoted.matching", *(dispatch_queue_t *)(a1 + 8), &stru_100018A78);
  }

void sub_10000AC0C(id a1, OS_xpc_object *a2)
{
  string = xpc_dictionary_get_string(a2, _xpc_event_key_name);
  if (string)
  {
    uint64_t v3 = string;
    uint64_t v4 = (os_log_s *)CKLogContextDaemon;
    if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v7 = 136315394;
      int v8 = "-[CKEventHandler setupNotifyHandlers]_block_invoke_2";
      __int16 v9 = 2080;
      __int16 v10 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "%s Received XPC event from distnoted: %s",  (uint8_t *)&v7,  0x16u);
    }

    int v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v3));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[CKVDispatcher sharedInstance](&OBJC_CLASS___CKVDispatcher, "sharedInstance"));
    [v6 handleDistributedNotificationEventWithName:v5 completion:0];
  }

void sub_10000AD18(id a1, OS_xpc_object *a2)
{
  uint64_t v2 = a2;
  string = xpc_dictionary_get_string(v2, _xpc_event_key_name);
  if (string)
  {
    uint64_t v4 = string;
    int v5 = (os_log_s *)CKLogContextDaemon;
    if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v11 = "-[CKEventHandler setupNotifyHandlers]_block_invoke";
      __int16 v12 = 2080;
      id v13 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "%s Received XPC event from notifyd: %s",  buf,  0x16u);
    }

    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v4));
    [v6 isEqualToString:kAFPreferencesDidChangeDarwinNotification];
    int v7 = (void *)objc_claimAutoreleasedReturnValue(+[CKVDispatcher sharedInstance](&OBJC_CLASS___CKVDispatcher, "sharedInstance"));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10000AE84;
    v8[3] = &unk_100018A58;
    __int16 v9 = v2;
    [v7 handleDarwinNotificationEventWithName:v6 completion:v8];
  }
}

void sub_10000AE84(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[SEMDispatcher sharedInstance](&OBJC_CLASS___SEMDispatcher, "sharedInstance"));
  [v2 handleXPCEvent:*(void *)(a1 + 32)];
}

void start()
{
  if ((_set_user_dir_suffix("com.apple.siriknowledged") & 1) != 0)
  {
    CKLogInit(objc_autoreleasePoolPush());
    v0 = (os_log_s *)CKLogContextDaemon;
    if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 136315138;
      __int16 v17 = "main";
      _os_log_impl( (void *)&_mh_execute_header,  v0,  OS_LOG_TYPE_DEFAULT,  "%s Starting up siriknowledged...",  (uint8_t *)&v16,  0xCu);
    }

    +[NSXPCListener enableTransactions](&OBJC_CLASS___NSXPCListener, "enableTransactions");
    id v1 = objc_alloc_init(&OBJC_CLASS___CKServiceDelegate);
    id v2 = (void *)qword_10001DE50;
    qword_10001DE50 = (uint64_t)v1;

    uint64_t v3 = -[NSXPCListener initWithMachServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCListener),  "initWithMachServiceName:",  @"com.apple.siriknowledged");
    -[NSXPCListener setDelegate:](v3, "setDelegate:", qword_10001DE50);
    -[NSXPCListener resume](v3, "resume");
    uint64_t v4 = objc_alloc_init(&OBJC_CLASS___CKEventHandler);
    int v5 = (void *)qword_10001DE58;
    qword_10001DE58 = (uint64_t)v4;

    sub_10000ABBC(qword_10001DE58);
    uint64_t v6 = objc_claimAutoreleasedReturnValue(+[CKVDispatcher sharedInstance](&OBJC_CLASS___CKVDispatcher, "sharedInstance"));
    int v7 = (void *)qword_10001DE60;
    qword_10001DE60 = v6;

    [(id)qword_10001DE60 setupXPCListeners];
    [(id)qword_10001DE60 registerXPCActivities];
    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[SEMDispatcher sharedInstance](&OBJC_CLASS___SEMDispatcher, "sharedInstance"));
    __int16 v9 = (void *)qword_10001DE68;
    qword_10001DE68 = v8;

    [(id)qword_10001DE68 setupXPCListeners];
    [(id)qword_10001DE68 registerXPCActivities];
    __int16 v10 = (void *)objc_claimAutoreleasedReturnValue(+[CKNCloudKitManager sharedManager](&OBJC_CLASS___CKNCloudKitManager, "sharedManager"));
    [v10 enablePushNotifications];

    id v11 = objc_alloc_init(&OBJC_CLASS___UAFXPCService);
    __int16 v12 = (void *)qword_10001DE70;
    qword_10001DE70 = (uint64_t)v11;

    UAFRegisterXPCActivities([(id)qword_10001DE70 startAsync]);
    dispatch_main();
  }

  id v13 = (void *)CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    uint64_t v14 = v13;
    int v15 = *__error();
    int v16 = 136315394;
    __int16 v17 = "main";
    __int16 v18 = 1024;
    int v19 = v15;
    _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "%s _set_user_dir_suffix failed with: %d",  (uint8_t *)&v16,  0x12u);
  }

  exit(1);
}

void sub_10000CDA0(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = (void *)a1[5];
  id v10 = 0LL;
  id v4 = sub_10000CE30(v2, v3, &v10);
  int v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = v10;
  if (!v6)
  {
    uint64_t v7 = a1[6];
    uint64_t v8 = a1[7];
    id v9 = 0LL;
    [v5 dropLinksBetween:v7 and:v8 error:&v9];
    id v6 = v9;
  }

  (*(void (**)(void))(a1[8] + 16LL))();
}

id sub_10000CE30(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_20;
  }
  id v6 = (os_log_s *)CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v13 = 136315394;
    uint64_t v14 = "-[CKDaemon handlerForPersistentStoreWithIdentifier:error:]";
    __int16 v15 = 2112;
    id v16 = v5;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "%s Looking for store with identifier %@",  (uint8_t *)&v13,  0x16u);
  }

  if (![v5 length])
  {
    id v10 = (os_log_s *)CKLogContextDaemon;
    if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      int v13 = 136315394;
      uint64_t v14 = "-[CKDaemon handlerForPersistentStoreWithIdentifier:error:]";
      __int16 v15 = 2112;
      id v16 = v5;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "%s identifier is invalid: %@",  (uint8_t *)&v13,  0x16u);
      if (a3) {
        goto LABEL_10;
      }
    }

    else if (a3)
    {
LABEL_10:
      id v8 = 0LL;
      *a3 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.siriknowledged",  101LL,  &off_1000193B0));
      goto LABEL_18;
    }

LABEL_20:
    id v8 = 0LL;
    goto LABEL_18;
  }

  id v7 = *(id *)(a1 + 24);
  objc_sync_enter(v7);
  id v8 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 24) objectForKey:v5]);
  if (v8)
  {
    id v9 = (os_log_s *)CKLogContextDaemon;
    if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      int v13 = 136315138;
      uint64_t v14 = "-[CKDaemon handlerForPersistentStoreWithIdentifier:error:]";
      _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%s Found in cache", (uint8_t *)&v13, 0xCu);
    }
  }

  else
  {
    id v8 = [[CKPersistentStoreHandler alloc] initWithName:v5];
    if (v8)
    {
      id v11 = (os_log_s *)CKLogContextDaemon;
      if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
      {
        int v13 = 136315394;
        uint64_t v14 = "-[CKDaemon handlerForPersistentStoreWithIdentifier:error:]";
        __int16 v15 = 2112;
        id v16 = v5;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "%s Created new store with identifier %@ and updating cache",  (uint8_t *)&v13,  0x16u);
      }

      [*(id *)(a1 + 24) setObject:v8 forKey:v5];
    }

    else
    {
      id v8 = 0LL;
      if (a3) {
        *a3 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.siriknowledged",  102LL,  &off_1000193D8));
      }
    }
  }

  objc_sync_exit(v7);

LABEL_18:
  return v8;
}

void sub_10000D110(_Unwind_Exception *a1)
{
}

void sub_10000D12C(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = (void *)a1[5];
  id v10 = 0LL;
  id v4 = sub_10000CE30(v2, v3, &v10);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = v10;
  if (!v6)
  {
    uint64_t v7 = a1[6];
    uint64_t v8 = a1[7];
    id v9 = 0LL;
    [v5 dropLinksWithLabel:v7 from:v8 error:&v9];
    id v6 = v9;
  }

  (*(void (**)(void))(a1[8] + 16LL))();
}

void sub_10000D1BC(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = (void *)a1[5];
  id v11 = 0LL;
  id v4 = sub_10000CE30(v2, v3, &v11);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = v11;
  if (!v6)
  {
    uint64_t v7 = a1[6];
    uint64_t v8 = a1[7];
    uint64_t v9 = a1[8];
    id v10 = 0LL;
    [v5 dropLinkWithLabel:v7 between:v8 and:v9 error:&v10];
    id v6 = v10;
  }

  (*(void (**)(void))(a1[9] + 16LL))();
}

void sub_10000D250(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = (void *)a1[5];
  id v12 = 0LL;
  id v4 = sub_10000CE30(v2, v3, &v12);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = v12;
  if (v6)
  {
    uint64_t v7 = v6;
  }

  else if ([v5 decreaseWeightForLinkWithLabel:a1[6] between:a1[7] and:a1[8]] == (id)-1)
  {
    v13[0] = @"localizedDescription";
    v13[1] = @"subject";
    uint64_t v8 = a1[7];
    uint64_t v9 = a1[8];
    v14[0] = @"Error decreasing link weight";
    v14[1] = v8;
    v13[2] = @"predicate";
    v13[3] = @"object";
    uint64_t v10 = a1[5];
    v14[2] = a1[6];
    v14[3] = v9;
    void v13[4] = @"storeIdentifier";
    v14[4] = v10;
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v14,  v13,  5LL));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.siriknowledged",  102LL,  v11));
  }

  else
  {
    uint64_t v7 = 0LL;
  }

  (*(void (**)(void))(a1[9] + 16LL))();
}

void sub_10000D3B4(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = (void *)a1[5];
  id v12 = 0LL;
  id v4 = sub_10000CE30(v2, v3, &v12);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = v12;
  if (v6)
  {
    uint64_t v7 = v6;
  }

  else if ([v5 increaseWeightForLinkWithLabel:a1[6] between:a1[7] and:a1[8]] == (id)-1)
  {
    v13[0] = @"localizedDescription";
    v13[1] = @"subject";
    uint64_t v8 = a1[7];
    uint64_t v9 = a1[8];
    v14[0] = @"Error increasing link weight";
    v14[1] = v8;
    v13[2] = @"predicate";
    v13[3] = @"object";
    uint64_t v10 = a1[5];
    v14[2] = a1[6];
    v14[3] = v9;
    void v13[4] = @"storeIdentifier";
    v14[4] = v10;
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v14,  v13,  5LL));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.siriknowledged",  102LL,  v11));
  }

  else
  {
    uint64_t v7 = 0LL;
  }

  (*(void (**)(void))(a1[9] + 16LL))();
}

void sub_10000D518(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = (void *)a1[5];
  id v12 = 0LL;
  id v4 = sub_10000CE30(v2, v3, &v12);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = v12;
  if (!v6)
  {
    uint64_t v7 = a1[6];
    uint64_t v8 = a1[7];
    uint64_t v9 = a1[8];
    uint64_t v10 = a1[10];
    id v11 = 0LL;
    [v5 setWeightForLinkWithLabel:v7 between:v8 and:v9 toValue:v10 error:&v11];
    id v6 = v11;
  }

  (*(void (**)(void))(a1[9] + 16LL))();
}

void sub_10000D5B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
  }

  else
  {
    id v6 = *(void **)(a1 + 32);
    id v5 = *(void **)(a1 + 40);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_10000D66C;
    v7[3] = &unk_100018C20;
    id v8 = v5;
    id v9 = *(id *)(a1 + 48);
    [v6 removeValuesForKeys:a3 fromStoreWithIdentifier:v8 completionHandler:v7];
  }

void sub_10000D66C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (os_log_s *)CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 136315394;
    uint64_t v7 = "-[CKDaemon removeAllValuesFromSynchedStoreWithIdentifier:completionHandler:]_block_invoke_2";
    __int16 v8 = 2112;
    uint64_t v9 = v5;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEBUG,  "%s Finished removing ALL values in synched store %@",  (uint8_t *)&v6,  0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void sub_10000D74C(uint64_t *a1)
{
  uint64_t v2 = (os_log_s *)CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v9 = a1[4];
    *(_DWORD *)buf = 136315394;
    uint64_t v14 = "-[CKDaemon removeAllValuesFromStoreWithIdentifier:completionHandler:]_block_invoke";
    __int16 v15 = 2112;
    uint64_t v16 = v9;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEBUG,  "%s Removing ALL values in store %@",  buf,  0x16u);
  }

  id v4 = (void *)a1[4];
  uint64_t v3 = a1[5];
  id v12 = 0LL;
  id v5 = sub_10000CE30(v3, v4, &v12);
  int v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = v12;
  if (!v7)
  {
    id v11 = 0LL;
    [v6 removeAllValuesAndReturnError:&v11];
    id v7 = v11;
  }

  __int16 v8 = (os_log_s *)CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v10 = a1[4];
    *(_DWORD *)buf = 136315394;
    uint64_t v14 = "-[CKDaemon removeAllValuesFromStoreWithIdentifier:completionHandler:]_block_invoke";
    __int16 v15 = 2112;
    uint64_t v16 = v10;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "%s Finished removing ALL values in store %@",  buf,  0x16u);
  }

  (*(void (**)(void))(a1[6] + 16))();
  if (!v7) {
    sub_10000333C(&__NSArray0__struct, a1[4]);
  }
}

void sub_10000D8E4(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
  }

  else
  {
    int v6 = *(void **)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10000D9D8;
    v11[3] = &unk_100018BF8;
    uint64_t v8 = *(void *)(a1 + 48);
    id v9 = *(id *)(a1 + 56);
    uint64_t v10 = *(void *)(a1 + 32);
    id v15 = v9;
    v11[4] = v10;
    id v12 = *(id *)(a1 + 48);
    id v13 = v5;
    id v14 = *(id *)(a1 + 40);
    [v6 removeValuesMatchingCondition:v7 fromStoreWithIdentifier:v8 completionHandler:v11];
  }
}

void sub_10000D9D8(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16LL))();
  }

  else
  {
    uint64_t v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_10000DABC;
    v5[3] = &unk_100018BD0;
    id v9 = *(id *)(a1 + 64);
    id v6 = *(id *)(a1 + 48);
    id v7 = *(id *)(a1 + 56);
    id v8 = *(id *)(a1 + 40);
    [v3 keysInStoreWithIdentifier:v4 completionHandler:v5];
    sub_10000333C(*(void **)(a1 + 48), *(void *)(a1 + 40));
  }

void sub_10000DABC(id *a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    (*((void (**)(void))a1[7] + 2))();
  }

  else
  {
    id v6 = [a1[4] mutableCopy];
    [v6 removeObjectsInArray:v5];
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[CKNCloudKitManager sharedManager](&OBJC_CLASS___CKNCloudKitManager, "sharedManager"));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10000DBB8;
    v8[3] = &unk_100018BA8;
    id v9 = a1[5];
    id v10 = a1[6];
    id v11 = a1[7];
    [v7 removeValuesForKeys:v6 completion:v8];
  }
}

void sub_10000DBB8(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = (os_log_s *)CKLogContextDaemon;
  if (v7 && os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    int v15 = 136315394;
    uint64_t v16 = "-[CKDaemon removeValuesMatchingCondition:fromSynchedStoreWithIdentifier:completionHandler:]_block_invoke_4";
    __int16 v17 = 2112;
    id v18 = v7;
    _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "%s Could not remove values for keys with error %@",  (uint8_t *)&v15,  0x16u);
    id v10 = (os_log_s *)CKLogContextDaemon;
  }

  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    id v11 = (void *)a1[4];
    id v12 = v10;
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 description]);
    uint64_t v14 = a1[5];
    int v15 = 136315650;
    uint64_t v16 = "-[CKDaemon removeValuesMatchingCondition:fromSynchedStoreWithIdentifier:completionHandler:]_block_invoke";
    __int16 v17 = 2112;
    id v18 = v13;
    __int16 v19 = 2112;
    uint64_t v20 = v14;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "%s Finished removing values matching condition %@ in synched store %@",  (uint8_t *)&v15,  0x20u);
  }

  (*(void (**)(void))(a1[6] + 16LL))();
}

void sub_10000DD50(void *a1)
{
  uint64_t v2 = (void *)CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    id v10 = (void *)a1[4];
    id v11 = v2;
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 description]);
    *(_DWORD *)buf = 136315394;
    __int16 v19 = "-[CKDaemon removeValuesMatchingCondition:fromStoreWithIdentifier:completionHandler:]_block_invoke";
    __int16 v20 = 2112;
    id v21 = v12;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "%s Removing values matching condition %@",  buf,  0x16u);
  }

  uint64_t v3 = a1[5];
  uint64_t v4 = (void *)a1[6];
  id v17 = 0LL;
  id v5 = sub_10000CE30(v3, v4, &v17);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = v17;
  if (!v7)
  {
    uint64_t v8 = a1[4];
    id v16 = 0LL;
    [v6 removeValuesMatching:v8 error:&v16];
    id v7 = v16;
  }

  id v9 = (void *)CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    id v13 = (void *)a1[4];
    uint64_t v14 = v9;
    int v15 = (void *)objc_claimAutoreleasedReturnValue([v13 description]);
    *(_DWORD *)buf = 136315394;
    __int16 v19 = "-[CKDaemon removeValuesMatchingCondition:fromStoreWithIdentifier:completionHandler:]_block_invoke";
    __int16 v20 = 2112;
    id v21 = v15;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEBUG,  "%s Finished removing values matching condition %@",  buf,  0x16u);
  }

  (*(void (**)(void))(a1[7] + 16LL))();
  if (!v7) {
    sub_10000333C(&__NSArray0__struct, a1[6]);
  }
}

void sub_10000DF34(void *a1, void *a2)
{
  id v3 = a2;
  if (!v3)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[CKNCloudKitManager sharedManager](&OBJC_CLASS___CKNCloudKitManager, "sharedManager"));
    [v4 removeValuesForKeys:a1[4] completion:0];
  }

  id v5 = (os_log_s *)CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = a1[4];
    uint64_t v7 = a1[5];
    int v8 = 136315650;
    id v9 = "-[CKDaemon removeValuesForKeys:fromSynchedStoreWithIdentifier:completionHandler:]_block_invoke";
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2112;
    uint64_t v13 = v7;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "%s Finished removing values for keys %@ in synched store %@",  (uint8_t *)&v8,  0x20u);
  }

  (*(void (**)(void))(a1[6] + 16LL))();
}

void sub_10000E044(uint64_t *a1)
{
  uint64_t v2 = (os_log_s *)CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v10 = a1[4];
    *(_DWORD *)buf = 136315394;
    int v15 = "-[CKDaemon removeValuesForKeys:fromStoreWithIdentifier:completionHandler:]_block_invoke";
    __int16 v16 = 2112;
    uint64_t v17 = v10;
    _os_log_debug_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "%s Removing values for keys %@", buf, 0x16u);
  }

  uint64_t v3 = a1[5];
  uint64_t v4 = (void *)a1[6];
  id v13 = 0LL;
  id v5 = sub_10000CE30(v3, v4, &v13);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = v13;
  if (!v7)
  {
    uint64_t v8 = a1[4];
    id v12 = 0LL;
    [v6 removeValuesForKeys:v8 error:&v12];
    id v7 = v12;
  }

  id v9 = (os_log_s *)CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = a1[4];
    *(_DWORD *)buf = 136315394;
    int v15 = "-[CKDaemon removeValuesForKeys:fromStoreWithIdentifier:completionHandler:]_block_invoke";
    __int16 v16 = 2112;
    uint64_t v17 = v11;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "%s Finished removing values for keys %@",  buf,  0x16u);
  }

  (*(void (**)(void))(a1[7] + 16))();
  if (!v7) {
    sub_10000333C((void *)a1[4], a1[6]);
  }
}

void sub_10000E1DC(void *a1, void *a2)
{
  id v3 = a2;
  if (!v3)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[CKNCloudKitManager sharedManager](&OBJC_CLASS___CKNCloudKitManager, "sharedManager"));
    uint64_t v15 = a1[4];
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v15, 1LL));
    [v4 removeValuesForKeys:v5 completion:0];
  }

  uint64_t v6 = (os_log_s *)CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = a1[4];
    uint64_t v8 = a1[5];
    int v9 = 136315650;
    uint64_t v10 = "-[CKDaemon removeValueForKey:fromSynchedStoreWithIdentifier:completionHandler:]_block_invoke";
    __int16 v11 = 2112;
    uint64_t v12 = v7;
    __int16 v13 = 2112;
    uint64_t v14 = v8;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "%s Finished removing value for key %@ in synched store %@",  (uint8_t *)&v9,  0x20u);
  }

  (*(void (**)(void))(a1[6] + 16LL))();
}

void sub_10000E318(void *a1)
{
  uint64_t v2 = (os_log_s *)CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = a1[4];
    *(_DWORD *)buf = 136315394;
    uint64_t v17 = "-[CKDaemon removeValueForKey:fromStoreWithIdentifier:completionHandler:]_block_invoke";
    __int16 v18 = 2112;
    uint64_t v19 = v11;
    _os_log_debug_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "%s Removing value for key %@", buf, 0x16u);
  }

  uint64_t v3 = a1[5];
  uint64_t v4 = (void *)a1[6];
  id v14 = 0LL;
  id v5 = sub_10000CE30(v3, v4, &v14);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = v14;
  if (!v7)
  {
    uint64_t v8 = a1[4];
    id v13 = 0LL;
    [v6 removeValueForKey:v8 error:&v13];
    id v7 = v13;
  }

  int v9 = (os_log_s *)CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v12 = a1[4];
    *(_DWORD *)buf = 136315394;
    uint64_t v17 = "-[CKDaemon removeValueForKey:fromStoreWithIdentifier:completionHandler:]_block_invoke";
    __int16 v18 = 2112;
    uint64_t v19 = v12;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "%s Finished removing value for key %@",  buf,  0x16u);
  }

  (*(void (**)(void))(a1[7] + 16LL))();
  if (!v7)
  {
    uint64_t v15 = a1[4];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v15, 1LL));
    sub_10000333C(v10, a1[6]);
  }
}

void sub_10000E4D4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = (os_log_s *)CKLogContextDaemon;
    if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 136315650;
      __int16 v18 = "-[CKDaemon recordEventWithIdentifier:startDate:endDate:metadata:toStoreWithIdentifier:completionHandler:]_block_invoke";
      __int16 v19 = 2112;
      uint64_t v20 = v14;
      __int16 v21 = 2112;
      id v22 = v5;
      _os_log_error_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "%s Could not retrieve value for key %@. %@",  buf,  0x20u);
    }

    (*(void (**)(void))(*(void *)(a1 + 80) + 16LL))();
  }

  else
  {
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___CKHistoricEvent);
    if ((objc_opt_isKindOfClass(v6, v8) & 1) != 0)
    {
      id v9 = v6;
    }

    else
    {
      uint64_t v10 = (os_log_s *)CKLogContextDaemon;
      if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        uint64_t v15 = *(void *)(a1 + 32);
        __int16 v16 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 136315650;
        __int16 v18 = "-[CKDaemon recordEventWithIdentifier:startDate:endDate:metadata:toStoreWithIdentifier:completionHandler:]_block_invoke";
        __int16 v19 = 2112;
        uint64_t v20 = v15;
        __int16 v21 = 2112;
        id v22 = v16;
        _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "%s value for key %@ in store %@ is not a CKHistoricEvent",  buf,  0x20u);
      }

      id v9 = 0LL;
    }

    uint64_t v11 = -[NSDateInterval initWithStartDate:endDate:]( objc_alloc(&OBJC_CLASS___NSDateInterval),  "initWithStartDate:endDate:",  *(void *)(a1 + 48),  *(void *)(a1 + 56));
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[CKPermanentEventStore createEventWithIdentifier:dateInterval:metadata:fromEvent:]( &OBJC_CLASS___CKPermanentEventStore,  "createEventWithIdentifier:dateInterval:metadata:fromEvent:",  *(void *)(a1 + 32),  v11,  *(void *)(a1 + 64),  v9));

    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  v12,  *(void *)(a1 + 32),  0LL));
    [*(id *)(a1 + 72) saveKeysAndValues:v13 toStoreWithIdentifier:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 80)];
  }
}

void sub_10000E6F8(void *a1, void *a2)
{
  id v3 = a2;
  if (!v3)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[CKNCloudKitManager sharedManager](&OBJC_CLASS___CKNCloudKitManager, "sharedManager"));
    [v4 saveRecordsWithDictionary:a1[4] completion:0];
  }

  id v5 = (os_log_s *)CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = a1[5];
    int v7 = 136315394;
    uint64_t v8 = "-[CKDaemon saveKeysAndValues:toSynchedStoreWithIdentifier:completionHandler:]_block_invoke";
    __int16 v9 = 2112;
    uint64_t v10 = v6;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "%s Finished setting all values for keys in synched store %@",  (uint8_t *)&v7,  0x16u);
  }

  (*(void (**)(void))(a1[6] + 16LL))();
}

void sub_10000E800(void *a1)
{
  uint64_t v2 = (void *)CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    __int16 v16 = (void *)a1[4];
    uint64_t v17 = v2;
    __int16 v18 = (void *)objc_claimAutoreleasedReturnValue([v16 allKeys]);
    uint64_t v19 = a1[5];
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "-[CKDaemon saveKeysAndValues:toStoreWithIdentifier:completionHandler:]_block_invoke";
    __int16 v24 = 2112;
    __int16 v25 = v18;
    __int16 v26 = 2112;
    uint64_t v27 = v19;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEBUG,  "%s Setting all values for keys=[%@] in store %@",  buf,  0x20u);
  }

  uint64_t v4 = (void *)a1[5];
  uint64_t v3 = a1[6];
  id v22 = 0LL;
  id v5 = sub_10000CE30(v3, v4, &v22);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = v22;
  if (!v7)
  {
    uint64_t v8 = a1[4];
    id v21 = 0LL;
    [v6 saveKeysAndValues:v8 error:&v21];
    id v7 = v21;
  }

  __int16 v9 = (os_log_s *)CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v20 = (void *)a1[5];
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[CKDaemon saveKeysAndValues:toStoreWithIdentifier:completionHandler:]_block_invoke";
    __int16 v24 = 2112;
    __int16 v25 = v20;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "%s Finished setting all values for keys in store %@",  buf,  0x16u);
  }

  (*(void (**)(void))(a1[7] + 16LL))();
  if (!v7)
  {
    uint64_t v10 = (void *)a1[4];
    uint64_t v11 = a1[5];
    id v12 = v10;
    id v13 = (__CFString *)objc_claimAutoreleasedReturnValue( [@"CKPersistentStorageKeysAndValuesUpdated." stringByAppendingString:v11]);
    id v28 = @"updated";
    *(void *)buf = v12;
    uint64_t v14 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  buf,  &v28,  1LL));

    DistributedCenter = CFNotificationCenterGetDistributedCenter();
    CFNotificationCenterPostNotification(DistributedCenter, v13, 0LL, v14, 1u);
  }
}

void sub_10000EA38(void *a1)
{
  uint64_t v2 = (void *)CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    id v12 = (void *)a1[4];
    id v13 = v2;
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v12 description]);
    *(_DWORD *)buf = 136315394;
    id v21 = "-[CKDaemon triplesComponentsMatching:inStoreWithIdentifier:completionHandler:]_block_invoke";
    __int16 v22 = 2112;
    id v23 = v14;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "%s Getting triplets matching condition %@",  buf,  0x16u);
  }

  uint64_t v3 = a1[5];
  uint64_t v4 = (void *)a1[6];
  id v19 = 0LL;
  id v5 = sub_10000CE30(v3, v4, &v19);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = v19;
  if (v7)
  {
    id v8 = v7;
    __int16 v9 = &__NSArray0__struct;
  }

  else
  {
    uint64_t v10 = a1[4];
    id v18 = 0LL;
    __int16 v9 = (void *)objc_claimAutoreleasedReturnValue([v6 tripleComponentsMatching:v10 error:&v18]);
    id v8 = v18;
  }

  uint64_t v11 = (void *)CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v15 = (void *)a1[4];
    __int16 v16 = v11;
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v15 description]);
    *(_DWORD *)buf = 136315394;
    id v21 = "-[CKDaemon triplesComponentsMatching:inStoreWithIdentifier:completionHandler:]_block_invoke";
    __int16 v22 = 2112;
    id v23 = v17;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEBUG,  "%s Finished getting triplets matching condition %@",  buf,  0x16u);
  }

  (*(void (**)(void))(a1[7] + 16LL))();
}

void sub_10000EC24(void *a1)
{
  uint64_t v2 = (void *)CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    id v12 = (void *)a1[4];
    id v13 = v2;
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v12 description]);
    *(_DWORD *)buf = 136315394;
    id v21 = "-[CKDaemon keysAndValuesForKeysMatchingCondition:inStoreWithIdentifier:completionHandler:]_block_invoke";
    __int16 v22 = 2112;
    id v23 = v14;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "%s Getting all keys and values matching condition %@",  buf,  0x16u);
  }

  uint64_t v3 = a1[5];
  uint64_t v4 = (void *)a1[6];
  id v19 = 0LL;
  id v5 = sub_10000CE30(v3, v4, &v19);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = v19;
  if (v7)
  {
    id v8 = v7;
    __int16 v9 = &__NSDictionary0__struct;
  }

  else
  {
    uint64_t v10 = a1[4];
    id v18 = 0LL;
    __int16 v9 = (void *)objc_claimAutoreleasedReturnValue([v6 keysAndValuesForKeysMatching:v10 error:&v18]);
    id v8 = v18;
  }

  uint64_t v11 = (void *)CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v15 = (void *)a1[4];
    __int16 v16 = v11;
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v15 description]);
    *(_DWORD *)buf = 136315394;
    id v21 = "-[CKDaemon keysAndValuesForKeysMatchingCondition:inStoreWithIdentifier:completionHandler:]_block_invoke";
    __int16 v22 = 2112;
    id v23 = v17;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEBUG,  "%s Finished getting all keys and values matching condition %@",  buf,  0x16u);
  }

  (*(void (**)(void))(a1[7] + 16LL))();
}

void sub_10000EE10(void *a1)
{
  uint64_t v2 = (os_log_s *)CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = a1[4];
    *(_DWORD *)buf = 136315394;
    __int16 v16 = "-[CKDaemon keysAndValuesInStoreWithIdentifier:completionHandler:]_block_invoke";
    __int16 v17 = 2112;
    uint64_t v18 = v11;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEBUG,  "%s Getting all keys and values in store %@",  buf,  0x16u);
  }

  uint64_t v4 = (void *)a1[4];
  uint64_t v3 = a1[5];
  id v14 = 0LL;
  id v5 = sub_10000CE30(v3, v4, &v14);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = v14;
  if (v7)
  {
    id v8 = v7;
    __int16 v9 = &__NSDictionary0__struct;
  }

  else
  {
    id v13 = 0LL;
    __int16 v9 = (void *)objc_claimAutoreleasedReturnValue([v6 keysAndValuesAndReturnError:&v13]);
    id v8 = v13;
  }

  uint64_t v10 = (os_log_s *)CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v12 = a1[4];
    *(_DWORD *)buf = 136315394;
    __int16 v16 = "-[CKDaemon keysAndValuesInStoreWithIdentifier:completionHandler:]_block_invoke";
    __int16 v17 = 2112;
    uint64_t v18 = v12;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "%s Finished getting all keys and values in store %@",  buf,  0x16u);
  }

  (*(void (**)(void))(a1[6] + 16LL))();
}

void sub_10000EFB8(void *a1)
{
  uint64_t v2 = (void *)CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v12 = (void *)a1[4];
    id v13 = v2;
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v12 description]);
    *(_DWORD *)buf = 136315394;
    id v21 = "-[CKDaemon valuesForKeysMatchingCondition:inStoreWithIdentifier:completionHandler:]_block_invoke";
    __int16 v22 = 2112;
    id v23 = v14;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "%s Getting values for keys matching condition %@",  buf,  0x16u);
  }

  uint64_t v3 = a1[5];
  uint64_t v4 = (void *)a1[6];
  id v19 = 0LL;
  id v5 = sub_10000CE30(v3, v4, &v19);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = v19;
  if (v7)
  {
    id v8 = v7;
    __int16 v9 = &__NSArray0__struct;
  }

  else
  {
    uint64_t v10 = a1[4];
    id v18 = 0LL;
    __int16 v9 = (void *)objc_claimAutoreleasedReturnValue([v6 valuesForKeysMatching:v10 error:&v18]);
    id v8 = v18;
  }

  uint64_t v11 = (void *)CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v15 = (void *)a1[4];
    __int16 v16 = v11;
    __int16 v17 = (void *)objc_claimAutoreleasedReturnValue([v15 description]);
    *(_DWORD *)buf = 136315394;
    id v21 = "-[CKDaemon valuesForKeysMatchingCondition:inStoreWithIdentifier:completionHandler:]_block_invoke";
    __int16 v22 = 2112;
    id v23 = v17;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEBUG,  "%s Finished getting values for keys matching condition %@",  buf,  0x16u);
  }

  (*(void (**)(void))(a1[7] + 16LL))();
}

uint64_t sub_10000F1A4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10000F1B4(uint64_t a1)
{
}

void sub_10000F1BC(void *a1)
{
  uint64_t v2 = (os_log_s *)CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v16 = a1[4];
    *(_DWORD *)buf = 136315394;
    id v21 = "-[CKDaemon valuesForKeys:inStoreWithIdentifier:completionHandler:]_block_invoke";
    __int16 v22 = 2112;
    uint64_t v23 = v16;
    _os_log_debug_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "%s Getting values for keys %@", buf, 0x16u);
  }

  uint64_t v3 = a1[5];
  uint64_t v4 = (void *)a1[6];
  uint64_t v5 = *(void *)(a1[8] + 8LL);
  id obj = *(id *)(v5 + 40);
  id v6 = sub_10000CE30(v3, v4, &obj);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  objc_storeStrong((id *)(v5 + 40), obj);
  uint64_t v8 = *(void *)(a1[8] + 8LL);
  uint64_t v10 = *(void *)(v8 + 40);
  __int16 v9 = (id *)(v8 + 40);
  if (!v10)
  {
    uint64_t v11 = a1[4];
    id v18 = 0LL;
    uint64_t v12 = objc_claimAutoreleasedReturnValue([v7 _valuesForKeys:v11 error:&v18]);
    objc_storeStrong(v9, v18);
    uint64_t v13 = *(void *)(a1[9] + 8LL);
    id v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;
  }

  uint64_t v15 = (os_log_s *)CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v17 = a1[4];
    *(_DWORD *)buf = 136315394;
    id v21 = "-[CKDaemon valuesForKeys:inStoreWithIdentifier:completionHandler:]_block_invoke";
    __int16 v22 = 2112;
    uint64_t v23 = v17;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEBUG,  "%s Finished getting values for keys %@",  buf,  0x16u);
  }

  (*(void (**)(void))(a1[7] + 16LL))();
}

void sub_10000F38C(void *a1)
{
  uint64_t v2 = (os_log_s *)CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = a1[4];
    *(_DWORD *)buf = 136315394;
    uint64_t v16 = "-[CKDaemon valuesInStoreWithIdentifier:completionHandler:]_block_invoke";
    __int16 v17 = 2112;
    uint64_t v18 = v11;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEBUG,  "%s Getting all values in store %@",  buf,  0x16u);
  }

  uint64_t v4 = (void *)a1[4];
  uint64_t v3 = a1[5];
  id v14 = 0LL;
  id v5 = sub_10000CE30(v3, v4, &v14);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = v14;
  if (v7)
  {
    id v8 = v7;
    __int16 v9 = &__NSArray0__struct;
  }

  else
  {
    id v13 = 0LL;
    __int16 v9 = (void *)objc_claimAutoreleasedReturnValue([v6 valuesAndReturnError:&v13]);
    id v8 = v13;
  }

  uint64_t v10 = (os_log_s *)CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v12 = a1[4];
    *(_DWORD *)buf = 136315394;
    uint64_t v16 = "-[CKDaemon valuesInStoreWithIdentifier:completionHandler:]_block_invoke";
    __int16 v17 = 2112;
    uint64_t v18 = v12;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "%s Finished getting all values in store %@",  buf,  0x16u);
  }

  (*(void (**)(void))(a1[6] + 16LL))();
}

void sub_10000F534(void *a1)
{
  uint64_t v2 = (os_log_s *)CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v14 = a1[4];
    *(_DWORD *)buf = 136315394;
    uint64_t v20 = "-[CKDaemon valueForKey:inStoreWithIdentifier:completionHandler:]_block_invoke";
    __int16 v21 = 2112;
    uint64_t v22 = v14;
    _os_log_debug_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "%s Getting value for key %@", buf, 0x16u);
  }

  uint64_t v3 = a1[5];
  uint64_t v4 = (void *)a1[6];
  id v17 = 0LL;
  id v5 = sub_10000CE30(v3, v4, &v17);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = v17;
  if (v7)
  {
    id v8 = v7;
  }

  else
  {
    uint64_t v18 = a1[4];
    __int16 v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v18, 1LL));
    id v16 = 0LL;
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v6 _valuesForKeys:v9 error:&v16]);
    id v8 = v16;
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 firstObject]);

    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    LODWORD(v10) = [v11 isEqual:v12];

    if (!(_DWORD)v10) {
      goto LABEL_8;
    }
  }

  uint64_t v11 = 0LL;
LABEL_8:
  id v13 = (os_log_s *)CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v15 = a1[4];
    *(_DWORD *)buf = 136315394;
    uint64_t v20 = "-[CKDaemon valueForKey:inStoreWithIdentifier:completionHandler:]_block_invoke";
    __int16 v21 = 2112;
    uint64_t v22 = v15;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "%s Finished getting value for key %@",  buf,  0x16u);
  }

  (*(void (**)(void))(a1[7] + 16LL))();
}

void sub_10000F750(void *a1)
{
  uint64_t v2 = (void *)CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v12 = (void *)a1[4];
    id v13 = v2;
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v12 description]);
    *(_DWORD *)buf = 136315394;
    __int16 v21 = "-[CKDaemon keysMatchingCondition:inStoreWithIdentifier:completionHandler:]_block_invoke";
    __int16 v22 = 2112;
    uint64_t v23 = v14;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "%s Getting all keys matching condition %@",  buf,  0x16u);
  }

  uint64_t v3 = a1[5];
  uint64_t v4 = (void *)a1[6];
  id v19 = 0LL;
  id v5 = sub_10000CE30(v3, v4, &v19);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = v19;
  if (v7)
  {
    id v8 = v7;
    __int16 v9 = &__NSArray0__struct;
  }

  else
  {
    uint64_t v10 = a1[4];
    id v18 = 0LL;
    __int16 v9 = (void *)objc_claimAutoreleasedReturnValue([v6 keysMatching:v10 error:&v18]);
    id v8 = v18;
  }

  uint64_t v11 = (void *)CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v15 = (void *)a1[4];
    id v16 = v11;
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v15 description]);
    *(_DWORD *)buf = 136315394;
    __int16 v21 = "-[CKDaemon keysMatchingCondition:inStoreWithIdentifier:completionHandler:]_block_invoke";
    __int16 v22 = 2112;
    uint64_t v23 = v17;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEBUG,  "%s Finished getting all keys matching condition %@",  buf,  0x16u);
  }

  (*(void (**)(void))(a1[7] + 16LL))();
}

void sub_10000F93C(void *a1)
{
  uint64_t v2 = (os_log_s *)CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = a1[4];
    *(_DWORD *)buf = 136315394;
    id v16 = "-[CKDaemon keysInStoreWithIdentifier:completionHandler:]_block_invoke";
    __int16 v17 = 2112;
    uint64_t v18 = v11;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEBUG,  "%s Getting all keys in store %@",  buf,  0x16u);
  }

  uint64_t v4 = (void *)a1[4];
  uint64_t v3 = a1[5];
  id v14 = 0LL;
  id v5 = sub_10000CE30(v3, v4, &v14);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = v14;
  if (v7)
  {
    id v8 = v7;
    __int16 v9 = &__NSArray0__struct;
  }

  else
  {
    id v13 = 0LL;
    __int16 v9 = (void *)objc_claimAutoreleasedReturnValue([v6 keysAndReturnError:&v13]);
    id v8 = v13;
  }

  uint64_t v10 = (os_log_s *)CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v12 = a1[4];
    *(_DWORD *)buf = 136315394;
    id v16 = "-[CKDaemon keysInStoreWithIdentifier:completionHandler:]_block_invoke";
    __int16 v17 = 2112;
    uint64_t v18 = v12;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "%s Finished getting all keys in store %@",  buf,  0x16u);
  }

  (*(void (**)(void))(a1[6] + 16LL))();
}

void sub_10000FB24(id a1)
{
  id v1 = objc_alloc_init(&OBJC_CLASS___CKDaemon);
  uint64_t v2 = (void *)qword_10001DE80;
  qword_10001DE80 = (uint64_t)v1;
}

id objc_msgSend_recordEventWithIdentifier_startDate_endDate_metadata_toStoreWithIdentifier_completionHandler_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "recordEventWithIdentifier:startDate:endDate:metadata:toStoreWithIdentifier:completionHandler:");
}

id objc_msgSend_zoneName(void *a1, const char *a2, ...)
{
  return [a1 zoneName];
}