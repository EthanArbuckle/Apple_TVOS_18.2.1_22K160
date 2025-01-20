os_log_t sub_1000037E0()
{
  return os_log_create("com.apple.amp.medialibraryd", "Default");
}

void sub_10000389C(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) transactionMap]);
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 allValues]);
  [*(id *)(a1 + 32) setActiveTransactions:v3];

  v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) databaseOperationQueue]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 operations]);
  [*(id *)(a1 + 32) setEnqueuedConcurrentOperations:v5];

  v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) databaseOperationSerialQueue]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 operations]);
  [*(id *)(a1 + 32) setEnqueuedSerialOperations:v7];

  id v9 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) databaseOperationLimitedQueue]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v9 operations]);
  [*(id *)(a1 + 32) setEnqueuedLimitedQueueOperations:v8];
}
}

id sub_100004730(uint64_t a1, uint64_t a2, void *a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 appendFormat:@"Library at path %@\n", a2];
  v7 = *(void **)(a1 + 40);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 writerAvailableConnections]);
  [v7 _appendDescribableArray:v8 toString:*(void *)(a1 + 32) withTitle:@"Writer Available Connections" indentLevel:1];

  [*(id *)(a1 + 32) appendString:@"\n"];
  id v9 = *(void **)(a1 + 40);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v6 writerBusyConnections]);
  [v9 _appendDescribableArray:v10 toString:*(void *)(a1 + 32) withTitle:@"Writer Busy Connections" indentLevel:1];

  [*(id *)(a1 + 32) appendString:@"\n"];
  v11 = *(void **)(a1 + 40);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v6 readerAvailableConnections]);
  [v11 _appendDescribableArray:v12 toString:*(void *)(a1 + 32) withTitle:@"Reader Available Connections" indentLevel:1];

  [*(id *)(a1 + 32) appendString:@"\n"];
  v13 = *(void **)(a1 + 40);
  v14 = (void *)objc_claimAutoreleasedReturnValue([v6 readerBusyConnections]);

  [v13 _appendDescribableArray:v14 toString:*(void *)(a1 + 32) withTitle:@"Reader Busy Connections" indentLevel:1];
  return [*(id *)(a1 + 32) appendString:@"\n\n"];
}

uint64_t start()
{
  v0 = os_log_create("com.apple.amp.medialibraryd", "Default");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "Starting medialibraryd", buf, 2u);
  }

  _set_user_dir_suffix("com.apple.MediaServices");
  id v1 = NSTemporaryDirectory();
  v2 = objc_autoreleasePoolPush();
  +[ML3MusicLibrary disableSharedLibrary](&OBJC_CLASS___ML3MusicLibrary, "disableSharedLibrary");
  +[ML3MusicLibrary disableAutomaticDatabaseValidation]( &OBJC_CLASS___ML3MusicLibrary,  "disableAutomaticDatabaseValidation");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
  +[MLMediaLibraryService _setDaemonProcessInfo:](&OBJC_CLASS___MLMediaLibraryService, "_setDaemonProcessInfo:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MLDMediaLibraryService sharedInstance](&OBJC_CLASS___MLDMediaLibraryService, "sharedInstance"));
  [v4 start];

  objc_autoreleasePoolPop(v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"));
  [v5 run];

  id v6 = os_log_create("com.apple.amp.medialibraryd", "Default");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "medialibraryd exiting.", v8, 2u);
  }

  return 0LL;
}

void sub_100004E30(_Unwind_Exception *a1)
{
}

void sub_1000054D8(_Unwind_Exception *a1)
{
}

void sub_100005634(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(25LL, 0LL);
    uint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000056F8;
    block[3] = &unk_100024AE0;
    id v5 = WeakRetained;
    dispatch_async(v3, block);
  }
}

void sub_1000056C8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _exitForLocalizationChange];
    id WeakRetained = v2;
  }
}

id sub_1000056F8(uint64_t a1)
{
  return [*(id *)(a1 + 32) _exitForLocalizationChange];
}

void sub_100005700(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) suspendedValidations]);
  id v3 = [v2 count];

  if (v3)
  {
    v4 = os_log_create("com.apple.amp.medialibraryd", "Service");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "[LanguageChange] Validation operations are in progress. Suspending further validations...",  buf,  2u);
    }
  }

  [*(id *)(a1 + 32) setSuspended:1];
  [*(id *)(a1 + 32) _purgePendingDatabaseValidations];
  id v5 = os_log_create("com.apple.amp.medialibraryd", "Service");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[LanguageChange] exiting...", v6, 2u);
  }

  exit(0);
}

id sub_1000057F4(uint64_t a1)
{
  id v2 = os_log_create("com.apple.amp.medialibraryd", "Service");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) suspendedValidations]);
    int v5 = 138543362;
    id v6 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "Unlock: resuming validation queue - %{public}@",  (uint8_t *)&v5,  0xCu);
  }

  [*(id *)(a1 + 32) setSuspended:0];
  return [*(id *)(a1 + 32) _purgePendingDatabaseValidations];
}

id sub_1000058D0(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 48) removeAllObjects];
}

id sub_100005900(uint64_t a1)
{
  id v2 = os_log_create("com.apple.amp.medialibraryd", "Service");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) suspendedValidations]);
    int v5 = 138543362;
    id v6 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "Lock: suspending validation queue - %{public}@",  (uint8_t *)&v5,  0xCu);
  }

  [*(id *)(a1 + 32) setSuspended:1];
  return [*(id *)(a1 + 32) _purgePendingDatabaseValidations];
}

uint64_t sub_1000059DC(void *a1)
{
  else {
    uint64_t result = (uint64_t)[*(id *)(a1[4] + 48) containsObject:a1[5]];
  }
  *(_BYTE *)(*(void *)(a1[6] + 8LL) + 24LL) = result;
  return result;
}

id sub_100005A28(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) shouldValidateDatabaseForLibrary:*(void *)(a1 + 40)];
  *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = (_BYTE)result;
  return result;
}

id sub_100005A5C(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 48) addObject:*(void *)(a1 + 40)];
}

void sub_100005A68(void *a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1[4] + 24LL));
  id v6 = os_log_create("com.apple.amp.medialibraryd", "Service");
  v7 = v6;
  if ((_DWORD)a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = a1[5];
      int v11 = 138543362;
      uint64_t v12 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Successfull validation of database at path %{public}@",  (uint8_t *)&v11,  0xCu);
    }

    [*(id *)(a1[4] + 40) addObject:a1[5]];
  }

  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = a1[5];
      int v11 = 138543618;
      uint64_t v12 = v9;
      __int16 v13 = 2114;
      id v14 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "Failed validation of database at path %{public}@. error = %{public}@",  (uint8_t *)&v11,  0x16u);
    }
  }

  [*(id *)(a1[4] + 48) removeObject:a1[5]];
  uint64_t v10 = a1[6];
  if (v10) {
    (*(void (**)(uint64_t, uint64_t, id))(v10 + 16))(v10, a2, v5);
  }
}

void sub_100005BC8(uint64_t a1)
{
  if (*(_BYTE *)(*(void *)(a1 + 32) + 8LL))
  {
    id v2 = os_log_create("com.apple.amp.medialibraryd", "Service");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(a1 + 40);
      int v5 = 138543362;
      uint64_t v6 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "Validation queue suspended - Adding pending database validation for media library at path: %{public}@",  (uint8_t *)&v5,  0xCu);
    }

    v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) suspendedValidations]);
    [v4 addObject:*(void *)(a1 + 48)];
  }

  else
  {
    [*(id *)(a1 + 48) runValidation];
  }

void sub_100006040(_Unwind_Exception *a1)
{
}

LABEL_18:
      }

      id v14 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v40,  v46,  16LL);
      if (!v14)
      {
LABEL_25:

        [v7 timeIntervalSinceNow];
        v30 = v39;
        -[MLDCacheDeleteController _reportCacheDeletePurgeableRequestWithUrgency:purgeableAmount:duration:]( v34,  "_reportCacheDeletePurgeableRequestWithUrgency:purgeableAmount:duration:",  v35,  v39);
        uint64_t v9 = v36;
        goto LABEL_26;
      }
    }
  }

  if (v12)
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v48 = v5;
    *(_WORD *)&v48[4] = 2114;
    *(void *)&v48[6] = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Ignoring purgeable request with urgency %u for volume '%{public}@'",  buf,  0x12u);
  }

  v30 = 0LL;
LABEL_26:
  v45[0] = v9;
  v44[0] = @"CACHE_DELETE_VOLUME";
  v44[1] = @"CACHE_DELETE_AMOUNT";
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v30));
  v44[2] = @"CACHE_DELETE_PURGE_TIMEOUT";
  v45[1] = v31;
  v45[2] = &off_100026658;
  v32 = (__CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v45,  v44,  3LL));

  return v32;
}

void sub_100007304(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
}

void sub_100007A68(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  if (v2)
  {
    [v2 _calculateUsageAnalytics];
    uint64_t v3 = *(void *)(a1 + 32);
  }

  else
  {
    uint64_t v3 = 0LL;
    uint64_t v14 = 0LL;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
  }

  v5[1] = 3221225472LL;
  __int128 v7 = *(_OWORD *)(a1 + 48);
  __int128 v9 = v12;
  v5[0] = _NSConcreteStackBlock;
  v5[2] = sub_100007B3C;
  v5[3] = &unk_1000249E0;
  v5[4] = v3;
  uint64_t v8 = *(void *)(a1 + 64);
  __int128 v10 = v13;
  uint64_t v11 = v14;
  id v6 = *(id *)(a1 + 40);
  v4 = objc_retainBlock(v5);
  AnalyticsSendEventLazy(@"com.apple.amp.medialibrary.CacheDeletePurgeableRequest", v4);
}

id sub_100007B3C(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  uint64_t v3 = *(void **)(a1 + 32);
  *(_OWORD *)__int128 v9 = *(_OWORD *)(a1 + 48);
  *(void *)&v9[16] = *(void *)(a1 + 64);
  [v3 _addPurgeableAnalytics:v9 toPayload:v2];
  v4 = *(void **)(a1 + 32);
  __int128 v5 = *(_OWORD *)(a1 + 88);
  *(_OWORD *)__int128 v9 = *(_OWORD *)(a1 + 72);
  *(_OWORD *)&v9[16] = v5;
  uint64_t v10 = *(void *)(a1 + 104);
  [v4 _addUsageAnalytics:v9 toPayload:v2];
  [*(id *)(a1 + 32) _addOptimizeStorageAnalyticsToPayload:v2];
  id v6 = os_log_create("com.apple.amp.medialibraryd", "CacheManagement");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 40);
    *(_DWORD *)__int128 v9 = 138478339;
    *(void *)&v9[4] = v2;
    *(_WORD *)&v9[12] = 2114;
    *(void *)&v9[14] = v7;
    *(_WORD *)&v9[22] = 2050;
    *(void *)&v9[24] = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Generated CacheDeletePurgeableRequest event with payload:\n%{private}@, transaction: %{public}@ %{public}p",  v9,  0x20u);
  }

  return v2;
}

void sub_100007C74(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(v1 + 40);
  *(double *)(v1 + 32) = *(double *)(v1 + 32) + fabs(*(double *)(a1 + 48));
  uint64_t v3 = *(void *)(a1 + 32);
  unint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v4;
  *(void *)(*(void *)(a1 + 32) + 48LL) += *(void *)(a1 + 56);
  *(void *)(*(void *)(a1 + 32) + 56LL) += *(void *)(a1 + 64);
  if (!v2)
  {
    dispatch_time_t v6 = dispatch_time(0LL, 10000000000LL);
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void **)(a1 + 40);
    __int128 v9 = *(dispatch_queue_s **)(v7 + 72);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_100007D68;
    v10[3] = &unk_1000251D8;
    v10[4] = v7;
    id v11 = v8;
    dispatch_after(v6, v9, v10);
  }

void sub_100007D68(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  __int128 v2 = *(_OWORD *)(v1 + 48);
  __int128 v35 = *(_OWORD *)(v1 + 32);
  __int128 v36 = v2;
  uint64_t v3 = *(void *)(v1 + 64);
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  id v4 = *(id *)(v1 + 24);
  id v5 = [v4 countByEnumeratingWithState:&v31 objects:v37 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v32;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v32 != v7) {
          objc_enumerationMutation(v4);
        }
        __int128 v9 = *(void **)(*((void *)&v31 + 1) + 8LL * (void)i);
        uint64_t v10 = objc_claimAutoreleasedReturnValue([v9 databasePath]);
        if (v10)
        {
          id v11 = (void *)v10;
          __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
          __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v9 databasePath]);
          unsigned int v14 = [v12 fileExistsAtPath:v13];

          if (v14) {
            v3 += (uint64_t)[v9 purgeableStorageSizeWithUrgency:3];
          }
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v31 objects:v37 count:16];
    }

    while (v6);
  }

  v15 = *(void **)(a1 + 32);
  if (v15)
  {
    [v15 _calculateUsageAnalytics];
    uint64_t v16 = *(void *)(a1 + 32);
  }

  else
  {
    uint64_t v16 = 0LL;
    uint64_t v30 = 0LL;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
  }

  v20[1] = 3221225472LL;
  __int128 v22 = v35;
  __int128 v23 = v36;
  __int128 v25 = v28;
  v20[0] = _NSConcreteStackBlock;
  v20[2] = sub_100007F98;
  v20[3] = &unk_100024990;
  v20[4] = v16;
  uint64_t v24 = v3;
  __int128 v26 = v29;
  uint64_t v27 = v30;
  id v21 = *(id *)(a1 + 40);
  v17 = objc_retainBlock(v20);
  AnalyticsSendEventLazy(@"com.apple.amp.medialibrary.CacheDeletePurge", v17);
  uint64_t v18 = *(void *)(a1 + 32);
  *(_OWORD *)(v18 + 32) = 0u;
  *(_OWORD *)(v18 + 4_Block_object_dispose(va, 8) = 0u;
  *(void *)(v18 + 64) = 0LL;
}

id sub_100007F98(uint64_t a1)
{
  __int128 v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  uint64_t v3 = *(void **)(a1 + 32);
  __int128 v4 = *(_OWORD *)(a1 + 64);
  *(_OWORD *)uint64_t v10 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)&v10[16] = v4;
  uint64_t v11 = *(void *)(a1 + 80);
  [v3 _addPurgeAnalytics:v10 toPayload:v2];
  id v5 = *(void **)(a1 + 32);
  __int128 v6 = *(_OWORD *)(a1 + 104);
  *(_OWORD *)uint64_t v10 = *(_OWORD *)(a1 + 88);
  *(_OWORD *)&v10[16] = v6;
  uint64_t v11 = *(void *)(a1 + 120);
  [v5 _addUsageAnalytics:v10 toPayload:v2];
  [*(id *)(a1 + 32) _addOptimizeStorageAnalyticsToPayload:v2];
  uint64_t v7 = os_log_create("com.apple.amp.medialibraryd", "CacheManagement");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 40);
    *(_DWORD *)uint64_t v10 = 138478339;
    *(void *)&v10[4] = v2;
    *(_WORD *)&v10[12] = 2114;
    *(void *)&v10[14] = v8;
    *(_WORD *)&v10[22] = 2050;
    *(void *)&v10[24] = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Generated CacheDeletePurge event with payload:\n%{private}@, transaction: %{public}@ %{public}p",  v10,  0x20u);
  }

  return v2;
}

void sub_1000080D0(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_claimAutoreleasedReturnValue([v3 databasePath]);
  if (v4)
  {
    id v5 = (void *)v4;
    __int128 v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v3 databasePath]);
    if ([v6 fileExistsAtPath:v7])
    {
      unsigned int v8 = [v3 currentDatabaseVersion];

      if (v8 == 2220020)
      {
        *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) += [v3 totalSizeForAllNonRedownloadableTracks];
        *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 32) += [v3 totalSizeForAllRedownloadableNonCacheTracks];
        *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48) += [v3 totalSizeForArtwork];
        goto LABEL_9;
      }
    }

    else
    {
    }
  }

  __int128 v9 = os_log_create("com.apple.amp.medialibraryd", "CacheManagement");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v3 databasePath]);
    int v11 = 138543618;
    __int128 v12 = v10;
    __int16 v13 = 1024;
    unsigned int v14 = [v3 currentDatabaseVersion];
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "Skipping usage calculation for library at path '%{public}@' because db file is not present or invalid (db version=%d)",  (uint8_t *)&v11,  0x12u);
  }

LABEL_9:
}

void sub_10000828C(uint64_t a1, void *a2)
{
  uint64_t v4 = os_log_create("com.apple.amp.medialibraryd", "CacheManagement_Oversize");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    uint64_t v37 = v5;
    __int16 v38 = 2114;
    v39 = a2;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%{public}@ EnumerateRemovedFilesInDirectories events=%{public}@",  buf,  0x16u);
  }

  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  id v6 = a2;
  id v7 = [v6 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v7)
  {
    id v9 = v7;
    uint64_t v10 = *(void *)v32;
    *(void *)&__int128 v8 = 138543618LL;
    __int128 v30 = v8;
    while (2)
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v32 != v10) {
          objc_enumerationMutation(v6);
        }
        __int128 v12 = *(void **)(*((void *)&v31 + 1) + 8LL * (void)i);
        __int16 v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", @"rescan", v30, (void)v31));

        if (v13)
        {
          [*(id *)(a1 + 32) _reconcileAllOriginalArtworkForLibrary:*(void *)(a1 + 40) withCompletion:0];
          goto LABEL_23;
        }

        unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"historyDone"]);

        if (v14)
        {
          [*(id *)(a1 + 32) _reconcileOrginalArtworkWitRelativePaths:*(void *)(a1 + 48) forLibrary:*(void *)(a1 + 40) withCompletion:0];
          goto LABEL_23;
        }

        v15 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"path"]);
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) originalArtworkDirectory]);
        unsigned int v17 = [v15 containsString:v16];

        uint64_t v18 = *(void **)(a1 + 40);
        if (v17)
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue([v18 originalArtworkDirectory]);
          v20 = (char *)[v15 rangeOfString:v19];
          uint64_t v22 = v21;

          if (&v20[v22] >= [v15 length])
          {
            [*(id *)(a1 + 32) _reconcileAllOriginalArtworkForLibrary:*(void *)(a1 + 40) withCompletion:0];
          }

          else
          {
            __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v15 substringFromIndex:&v20[v22 + 1]]);
            uint64_t v24 = *(void **)(a1 + 48);
            id v25 = [v23 copy];
            [v24 addObject:v25];
          }
        }

        else
        {
          __int128 v26 = (void *)objc_claimAutoreleasedReturnValue([v18 rootArtworkCacheDirectory]);
          unsigned __int8 v27 = [v15 containsString:v26];

          if ((v27 & 1) == 0)
          {
            __int128 v28 = os_log_create("com.apple.amp.medialibraryd", "CacheManagement");
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            {
              uint64_t v29 = *(void *)(a1 + 32);
              *(_DWORD *)buf = v30;
              uint64_t v37 = v29;
              __int16 v38 = 2114;
              v39 = v15;
              _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_ERROR,  "%{public}@ _reconcilePurgeNotification - Ignoring unrecognized path %{public}@",  buf,  0x16u);
            }
          }
        }
      }

      id v9 = [v6 countByEnumeratingWithState:&v31 objects:v35 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

LABEL_23:
}

void sub_1000085BC(uint64_t a1)
{
  __int128 v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) databasePath]);
  unsigned int v4 = [v2 fileExistsAtPath:v3];
  uint64_t v5 = os_log_create("com.apple.amp.medialibraryd", "CacheManagement");
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = *(void **)(a1 + 40);
      id v8 = [*(id *)(a1 + 48) count];
      *(_DWORD *)buf = 138543618;
      id v18 = v7;
      __int16 v19 = 2048;
      id v20 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Reconciling %lu paths of purged original artwork.",  buf,  0x16u);
    }

    id v9 = *(void **)(a1 + 32);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_1000087B8;
    v14[3] = &unk_1000248F0;
    v15 = (os_log_s *)*(id *)(a1 + 48);
    int8x16_t v13 = *(int8x16_t *)(a1 + 32);
    id v10 = (id)v13.i64[0];
    int8x16_t v16 = vextq_s8(v13, v13, 8uLL);
    [v9 databaseConnectionAllowingWrites:1 withBlock:v14];
    [*(id *)(a1 + 32) cleanupArtworkWithOptions:16];

    id v6 = v15;
  }

  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    id v11 = [*(id *)(a1 + 48) count];
    *(_DWORD *)buf = 134218242;
    id v18 = v11;
    __int16 v19 = 2114;
    id v20 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "Skipping artwork reconciliation for %lu paths. No file exists at path '%{public}@'",  buf,  0x16u);
  }

  uint64_t v12 = *(void *)(a1 + 56);
  if (v12) {
    (*(void (**)(void))(v12 + 16))();
  }
}

void sub_1000087B8(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100008854;
  v6[3] = &unk_100024918;
  unsigned int v4 = *(void **)(a1 + 32);
  v6[4] = *(void *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  id v8 = v3;
  id v5 = v3;
  [v4 enumerateObjectsUsingBlock:v6];
}

id sub_100008854(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _updatePurgedOriginalWithRelativePath:a2 forLibrary:*(void *)(a1 + 40) usingConnection:*(void *)(a1 + 48)];
}

void sub_100008868(uint64_t a1)
{
  __int128 v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) databasePath]);
  unsigned int v4 = [v2 fileExistsAtPath:v3];
  id v5 = os_log_create("com.apple.amp.medialibraryd", "CacheManagement");
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      id v7 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      id v18 = v7;
      __int16 v19 = 2114;
      uint64_t v20 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Reconciling all original artwork for library %{public}@.",  buf,  0x16u);
    }

    id v9 = *(void **)(a1 + 32);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100008A3C;
    v13[3] = &unk_1000248F0;
    id v14 = v9;
    id v10 = v2;
    uint64_t v11 = *(void *)(a1 + 40);
    id v15 = v10;
    uint64_t v16 = v11;
    [v14 databaseConnectionAllowingWrites:1 withBlock:v13];
    [*(id *)(a1 + 32) cleanupArtworkWithOptions:16];

    id v6 = (os_log_s *)v14;
  }

  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v18 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "Skipping artwork reconciliation. No file exists at path '%{public}@'",  buf,  0xCu);
  }

  uint64_t v12 = *(void *)(a1 + 48);
  if (v12) {
    (*(void (**)(void))(v12 + 16))();
  }
}

void sub_100008A3C(uint64_t a1, void *a2)
{
  id v3 = a2;
  unsigned int v4 = *(void **)(a1 + 32);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100008AF8;
  v8[3] = &unk_1000248C8;
  id v9 = v4;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  id v10 = v5;
  uint64_t v11 = v6;
  id v12 = v3;
  id v7 = v3;
  [v9 enumerateArtworkRelativePathsWithConnection:v7 matchingRelativePathContainer:0 block:v8];
}

void sub_100008AF8(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) originalArtworkDirectory]);
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue([v3 stringByAppendingPathComponent:v5]);

  if (([*(id *)(a1 + 40) fileExistsAtPath:v4] & 1) == 0) {
    [*(id *)(a1 + 48) _updatePurgedOriginalWithRelativePath:v5 forLibrary:*(void *)(a1 + 32) usingConnection:*(void *)(a1 + 56)];
  }
}

void sub_100008B78(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 int64ForColumnIndex:0];
  uint64_t v5 = (int)[v3 intForColumnIndex:1];
  signed int v6 = [v3 intForColumnIndex:2];

  [*(id *)(a1 + 32) updateBestArtworkTokenForEntityPersistentID:v4 entityType:v5 artworkType:v6 retrievalTime:0 preserveExistingAvailableToken:*(void *)(a1 + 40) usingConnection:0.0];
  id v7 = os_log_create("com.apple.amp.medialibraryd", "CacheManagement");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 48);
    uint64_t v9 = *(void *)(a1 + 56);
    int v10 = 138543618;
    uint64_t v11 = v8;
    __int16 v12 = 2114;
    uint64_t v13 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Updated best artwork token for purged artwork with relativePath %{public}@.",  (uint8_t *)&v10,  0x16u);
  }
}

uint64_t sub_100008C98(uint64_t a1, int a2, uint64_t a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v16 = 0LL;
  unsigned int v17 = &v16;
  uint64_t v18 = 0x2020000000LL;
  uint64_t v19 = 0LL;
  id v7 = *(dispatch_queue_s **)(*(void *)(a1 + 32) + 8LL);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100008F88;
  v11[3] = &unk_100024828;
  id v12 = WeakRetained;
  uint64_t v13 = &v16;
  int v15 = a2;
  uint64_t v14 = a3;
  id v8 = WeakRetained;
  dispatch_sync(v7, v11);
  uint64_t v9 = v17[3];

  _Block_object_dispose(&v16, 8);
  return v9;
}

uint64_t sub_100008D64(uint64_t a1, int a2, uint64_t a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v16 = 0LL;
  unsigned int v17 = &v16;
  uint64_t v18 = 0x2020000000LL;
  uint64_t v19 = 0LL;
  id v7 = *(dispatch_queue_s **)(*(void *)(a1 + 32) + 8LL);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100008F50;
  v11[3] = &unk_100024828;
  id v12 = WeakRetained;
  uint64_t v13 = &v16;
  int v15 = a2;
  uint64_t v14 = a3;
  id v8 = WeakRetained;
  dispatch_sync(v7, v11);
  uint64_t v9 = v17[3];

  _Block_object_dispose(&v16, 8);
  return v9;
}

void sub_100008E30(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = *(dispatch_queue_s **)(*(void *)(a1 + 32) + 8LL);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100008F44;
  block[3] = &unk_100024EA0;
  id v8 = WeakRetained;
  uint64_t v9 = a2;
  id v6 = WeakRetained;
  dispatch_sync(v5, block);
}

void sub_100008EB8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = *(dispatch_queue_s **)(*(void *)(a1 + 32) + 8LL);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100008F3C;
  block[3] = &unk_100024AE0;
  id v6 = WeakRetained;
  id v4 = WeakRetained;
  dispatch_sync(v3, block);
}

id sub_100008F3C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reconcilePurgeNotification];
}

id sub_100008F44(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleCacheDeleteNotification:*(void *)(a1 + 40)];
}

id sub_100008F50(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) _handlePurgeRequestWithUrgency:*(unsigned int *)(a1 + 56) info:*(void *)(a1 + 48)];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = result;
  return result;
}

id sub_100008F88(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) _handlePurgeableRequestWithUrgency:*(unsigned int *)(a1 + 56) info:*(void *)(a1 + 48)];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = result;
  return result;
}

LABEL_8:
}
}
}
}

    __int128 v2 = v9;
  }
}

void sub_100009C38( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
}

LABEL_31:
}

void sub_10000A694( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

LABEL_33:
      goto LABEL_34;
    }

    if (v10)
    {
      id v25 = os_log_create("com.apple.amp.medialibraryd", "Default");
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEBUG,  "Failed to process request to update spotlight index – invalid bundle id",  buf,  2u);
      }

      __int128 v23 = &off_1000266B0;
      uint64_t v24 = 1001LL;
      goto LABEL_19;
    }
  }

  else if (v10)
  {
    __int128 v23 = &off_100026688;
    uint64_t v24 = 1010LL;
LABEL_19:
    uint64_t v11 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"MLDMediaLibraryServiceErrorDomain",  v24,  v23));
    v10[2](v10, 0LL, v11);
    goto LABEL_33;
  }

LABEL_34:
}

void sub_10000C258( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, char a34)
{
}

LABEL_14:
    id v12 = 0;
    goto LABEL_15;
  }

  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v6;
    *(_WORD *)&buf[22] = 2114;
    *(void *)&buf[24] = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Received request from listener %{public}@ for connection %{public}@",  buf,  0x20u);
  }

  if ((id)-[MLDMediaLibraryService _MLDSupportedServiceForXPCListener:]( self,  "_MLDSupportedServiceForXPCListener:",  v6) != (id)1)
  {
    uint64_t v11 = os_log_create("com.apple.amp.medialibraryd", "Service");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v8;
      *(_WORD *)&buf[22] = 2114;
      *(void *)&buf[24] = v6;
      uint64_t v14 = "%{public}@ Ignoring connection %{public}@ from listener %{public}@";
      int v15 = v11;
      uint64_t v16 = OS_LOG_TYPE_DEFAULT;
      unsigned int v17 = 32;
      goto LABEL_13;
    }

    goto LABEL_14;
  }

  id v12 = -[MLDMediaLibraryService _shouldAcceptConnectionForMediaLibraryService:]( self,  "_shouldAcceptConnectionForMediaLibraryService:",  v8);
LABEL_15:

  return v12;
}

void sub_10000CCB0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, id location, id a22)
{
}

void sub_10000DFA8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_10000F40C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_10000FB60(uint64_t a1)
{
  __int128 v2 = os_log_create("com.apple.amp.medialibraryd", "Service");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    id v3 = [*(id *)(a1 + 32) UTF8String];
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    int v10 = 136446722;
    id v11 = v3;
    __int16 v12 = 2050;
    uint64_t v13 = v4;
    __int16 v14 = 2114;
    uint64_t v15 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_ERROR,  "Authorizer flagged suspicious query=%{public}s with action=%{public}ld from bundleID=%{public}@",  (uint8_t *)&v10,  0x20u);
  }

  id v6 = os_log_create("com.apple.amp.medialibraryd", "Service");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
  {
    id v7 = [*(id *)(a1 + 32) UTF8String];
    uint64_t v9 = *(void *)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 48);
    int v10 = 136446722;
    id v11 = v7;
    __int16 v12 = 2050;
    uint64_t v13 = v8;
    __int16 v14 = 2114;
    uint64_t v15 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_FAULT,  "Authorizer flagged suspicious query=%{public}s with action=%{public}ld from bundleID=%{public}@",  (uint8_t *)&v10,  0x20u);
  }
}

uint64_t sub_10000FCBC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 16))();
}

void sub_10000FCC4(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  id v6 = (id)objc_claimAutoreleasedReturnValue( +[ML3MusicLibrary libraryPathForContainerPath:]( &OBJC_CLASS___ML3MusicLibrary,  "libraryPathForContainerPath:",  a2));
  *a4 = *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
}

void sub_10000FD38(id a1)
{
  uint64_t v1 = (void *)qword_10002BB60;
  qword_10002BB60 = (uint64_t)&off_100026640;
}

id sub_10000FD50(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  return [*(id *)(a1 + 32) endTransaction];
}

void sub_10000FD80(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 168) objectForKeyedSubscript:*(void *)(a1 + 40)]);
  if (v2)
  {
    id v9 = v2;
    id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 client]);
    unsigned int v4 = [v3 processID];
    if (v4 == [*(id *)(a1 + 48) processID])
    {
      id v5 = (id)objc_claimAutoreleasedReturnValue([v3 bundleID]);
      id v6 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) bundleID]);
      if (v5 == v6)
      {
      }

      else
      {
        id v7 = v6;
        unsigned __int8 v8 = [v5 isEqual:v6];

        if ((v8 & 1) == 0) {
          goto LABEL_8;
        }
      }

      *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 1;
    }

void sub_10000FE64(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 168) objectForKeyedSubscript:*(void *)(a1 + 40)]);
  if (v2)
  {
    [*(id *)(*(void *)(a1 + 32) + 168) setObject:0 forKeyedSubscript:*(void *)(a1 + 40)];
    id v3 = os_log_create("com.apple.amp.medialibraryd", "Service");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 40);
      int v5 = 138543618;
      uint64_t v6 = v4;
      __int16 v7 = 2114;
      unsigned __int8 v8 = v2;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Unregistering transaction %{public}@:%{public}@",  (uint8_t *)&v5,  0x16u);
    }
  }
}

void sub_10000FF54(void *a1)
{
  uint64_t v2 = os_log_create("com.apple.amp.medialibraryd", "Service");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = a1[5];
    uint64_t v4 = a1[6];
    int v5 = 138543618;
    uint64_t v6 = v3;
    __int16 v7 = 2114;
    uint64_t v8 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "Registering transaction %{public}@: %{public}@",  (uint8_t *)&v5,  0x16u);
  }
}

void sub_100010020(uint64_t a1)
{
  uint64_t v2 = os_log_create("com.apple.amp.medialibraryd", "Service");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "[Maintenance] Maintenance operation complete. Performing artwork reconciliation.",  buf,  2u);
  }

  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 88LL);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000100F4;
  v5[3] = &unk_100024D88;
  id v6 = *(id *)(a1 + 48);
  [v4 reconcilePurgeableArtworkForLibrary:v3 withCompletion:v5];
}

uint64_t sub_1000100F4(uint64_t a1)
{
  uint64_t v2 = os_log_create("com.apple.amp.medialibraryd", "Service");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "[Maintenance] Artwork reconciliation complete.",  v4,  2u);
  }

  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, 1LL, 0LL);
  }
  return result;
}

void sub_100010184(id a1, ML3MusicLibrary *a2, unint64_t a3, BOOL *a4)
{
}

void sub_10001018C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleDebugSignal];
}

id sub_1000101B8(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 72) cancelActiveTransationAndDatabaseOperationsForClient:*(void *)(a1 + 40)];
}

uint64_t sub_1000101C4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_1000101D4(uint64_t a1)
{
}

void sub_1000101DC(uint64_t a1)
{
  id v5 = (id)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 152) allValues]);
  id v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_100010230(void *a1)
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue([*(id *)(a1[4] + 152) objectForKey:a1[5]]);
  uint64_t v3 = *(void *)(a1[6] + 8LL);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(a1[6] + 8LL) + 40LL))
  {
    id v5 = -[ML3MusicLibrary initWithPath:](objc_alloc(&OBJC_CLASS___ML3MusicLibrary), "initWithPath:", a1[5]);
    uint64_t v6 = *(void *)(a1[6] + 8LL);
    __int16 v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    [*(id *)(*(void *)(a1[6] + 8) + 40) setDelegate:a1[4]];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1[6] + 8) + 40) connectionPool]);
    [v8 setUseDistantWriterConnections:0];

    [*(id *)(a1[4] + 152) setObject:*(void *)(*(void *)(a1[6] + 8) + 40) forKey:a1[5]];
  }

id sub_100010300(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 56LL);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100010358;
  v4[3] = &unk_100024F40;
  v4[4] = v1;
  return [v2 enumerateKeysAndObjectsUsingBlock:v4];
}

void sub_100010358(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v9 = a2;
  if ([v9 isEqualToString:MLMediaLibraryServiceMachServiceName])
  {
    uint64_t v6 = 1LL;
    __int16 v7 = v9;
LABEL_5:
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v6;
    *a4 = 1;
    goto LABEL_6;
  }

  unsigned int v8 = [v9 isEqualToString:@"MLDSupportedServicesMediaLibraryResourcesService"];
  __int16 v7 = v9;
  if (v8)
  {
    uint64_t v6 = 2LL;
    goto LABEL_5;
  }

LABEL_6:
}

void sub_1000103E0(void *a1)
{
  uint64_t v2 = a1[6];
  switch(v2)
  {
    case 1LL:
      uint64_t v3 = (os_log_s *)MLMediaLibraryServiceMachServiceName;
      if (v3) {
        goto LABEL_9;
      }
      break;
    case 2LL:
      uint64_t v3 = (os_log_s *)@"MLDSupportedServicesMediaLibraryResourcesService";
      goto LABEL_9;
    case 3LL:
      uint64_t v3 = (os_log_s *)@"MLDSupportedServiceMediaLibraryClientImportService";
LABEL_9:
      id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1[4] + 56) objectForKeyedSubscript:v3]);

      if (!v5)
      {
        switch(a1[6])
        {
          case 0LL:
            uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
            [v6 handleFailureInMethod:a1[7] object:a1[4] file:@"MLDMediaLibraryService.m" lineNumber:1362 description:@"We should never get here"];

            goto LABEL_12;
          case 1LL:
            __int16 v7 = -[NSXPCListener initWithMachServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCListener),  "initWithMachServiceName:",  v3);
            -[NSXPCListener setDelegate:](v7, "setDelegate:", a1[4]);
            break;
          case 2LL:
            __int16 v7 = (NSXPCListener *)objc_claimAutoreleasedReturnValue(+[NSXPCListener anonymousListener](&OBJC_CLASS___NSXPCListener, "anonymousListener"));
            uint64_t v8 = objc_claimAutoreleasedReturnValue( +[MLMediaLibraryResourcesServiceServer sharedInstance]( &OBJC_CLASS___MLMediaLibraryResourcesServiceServer,  "sharedInstance"));
            goto LABEL_16;
          case 3LL:
            __int16 v7 = (NSXPCListener *)objc_claimAutoreleasedReturnValue(+[NSXPCListener anonymousListener](&OBJC_CLASS___NSXPCListener, "anonymousListener"));
            uint64_t v8 = objc_claimAutoreleasedReturnValue(+[MLDClientImportService sharedService](&OBJC_CLASS___MLDClientImportService, "sharedService"));
LABEL_16:
            id v9 = (void *)v8;
            -[NSXPCListener setDelegate:](v7, "setDelegate:", v8);

            break;
          default:
LABEL_12:
            __int16 v7 = 0LL;
            break;
        }

        int v10 = os_log_create("com.apple.amp.medialibraryd", "Service");
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          int v14 = 138543362;
          uint64_t v15 = v3;
          _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Starting service '%{public}@'",  (uint8_t *)&v14,  0xCu);
        }

        [*(id *)(a1[4] + 56) setObject:v7 forKeyedSubscript:v3];
        -[NSXPCListener resume](v7, "resume");
      }

      uint64_t v11 = objc_claimAutoreleasedReturnValue([*(id *)(a1[4] + 56) objectForKeyedSubscript:v3]);
      uint64_t v12 = *(void *)(a1[5] + 8LL);
      uint64_t v13 = *(void **)(v12 + 40);
      *(void *)(v12 + 40) = v11;

      goto LABEL_21;
  }

  uint64_t v3 = os_log_create("com.apple.amp.medialibraryd", "Service");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = (os_log_s *)a1[4];
    int v14 = 138543362;
    uint64_t v15 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_ERROR,  "%{public}@ - Attempting to retrieve an XPC listener for an unknown service",  (uint8_t *)&v14,  0xCu);
  }

LABEL_21:
}

void sub_100010690(uint64_t a1)
{
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v2 = *(id *)(a1 + 32);
  id v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        __int16 v7 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)i);
        objc_msgSend(v7, "setDelegate:", *(void *)(a1 + 40), (void)v11);
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 connectionPool]);
        [v8 setUseDistantWriterConnections:0];

        id v9 = *(void **)(*(void *)(a1 + 40) + 152LL);
        int v10 = (void *)objc_claimAutoreleasedReturnValue([v7 databasePath]);
        [v9 setObject:v7 forKey:v10];
      }

      id v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v4);
  }
}

void sub_1000107DC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[ML3MusicLibrary allLibraries](&OBJC_CLASS___ML3MusicLibrary, "allLibraries"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10001087C;
  v6[3] = &unk_100024EF0;
  v6[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v5 = v3;
  [v4 enumerateObjectsUsingBlock:v6];
}

void sub_10001087C(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = (id)objc_claimAutoreleasedReturnValue([a2 databasePath]);
  [v3 _performMaintenanceOnDatabaseAtPath:v4 withActivity:*(void *)(a1 + 40) completion:0];
}

void sub_1000108CC(uint64_t a1, xpc_object_t xdict)
{
  id v3 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  xpc_dictionary_get_string(xdict, _xpc_event_key_name));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  if ([v4 isEqualToString:@"com.apple.siri.koa.donate"])
  {
    [*(id *)(a1 + 32) updateSiriIndexMetadataForAllLibrariesWithCompletion:0];
  }

  else
  {
    id v5 = os_log_create("com.apple.amp.medialibraryd", "Service");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      int v6 = 138543362;
      id v7 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_FAULT,  "Received unhandled notifyd.matching darwin notification: '%{public}@'",  (uint8_t *)&v6,  0xCu);
    }
  }
}

void sub_1000109D0(uint64_t a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 168) objectForKeyedSubscript:*(void *)(a1 + 40)]);
  id v2 = (void *)objc_claimAutoreleasedReturnValue([v1 privacyContext]);

  if (v2)
  {
    os_log_t v3 = (os_log_t)objc_claimAutoreleasedReturnValue([v1 privacyContext]);
    -[os_log_s logDatabasePrivacyAccess](v3, "logDatabasePrivacyAccess");
  }

  else
  {
    os_log_t v3 = os_log_create("com.apple.amp.medialibraryd", "Service");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_ERROR,  "Could not log database access. privacyContext=nil",  v4,  2u);
    }
  }
}

uint64_t sub_100010A84(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8LL) + 24LL) = *(void *)(*(void *)(result + 32) + 192LL);
  return result;
}

uint64_t sub_100010A98(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 192LL) = *(void *)(result + 40);
  return result;
}

uint64_t sub_100010AA4(uint64_t result)
{
  *(_BYTE *)(*(void *)(*(void *)(result + 40) + 8LL) + 24LL) = *(_BYTE *)(*(void *)(result + 32) + 184LL);
  return result;
}

uint64_t sub_100010AB8(uint64_t result)
{
  *(_BYTE *)(*(void *)(result + 32) + 184LL) = *(_BYTE *)(result + 40);
  return result;
}

void sub_100010AC8(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSVXPCTransaction activeTransactions](&OBJC_CLASS___MSVXPCTransaction, "activeTransactions"));
  [*(id *)(a1 + 32) setActiveXPCTransactions:v2];

  [*(id *)(a1 + 32) setActiveClients:*(void *)(a1 + 48)];
  os_log_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 40) + 152) allValues]);
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id obj = v3;
  id v6 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(obj);
        }
        int v10 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
        __int128 v11 = objc_alloc(&OBJC_CLASS___MLDDatabaseFileDiagnostic);
        __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v10 databasePath]);
        __int128 v13 = -[MLDDatabaseFileDiagnostic initWithDatabasePath:](v11, "initWithDatabasePath:", v12);

        -[NSMutableArray addObject:](v4, "addObject:", v13);
        __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v10 connectionPool]);
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 _generateDiagnostic]);
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v10 databasePath]);
        -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v15, v16);
      }

      id v7 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v7);
  }

  [*(id *)(a1 + 32) setDatabaseFileDiagnostics:v4];
  [*(id *)(a1 + 32) setLibraryConnectionDiagnostics:v5];
  [*(id *)(*(void *)(a1 + 40) + 72) collectDiagnostic:*(void *)(a1 + 32)];
  [*(id *)(*(void *)(a1 + 40) + 80) collectDiagnostic:*(void *)(a1 + 32)];
}

void sub_100010D00(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = os_log_create("com.apple.amp.medialibraryd", "Service");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 138543362;
    id v6 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEBUG,  "Connection invalidated: %{public}@",  (uint8_t *)&v5,  0xCu);
  }

  if (v3) {
    [WeakRetained _handleXPCDisconnect:v3];
  }
}

void sub_100010DE4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = os_log_create("com.apple.amp.medialibraryd", "Service");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 138543362;
    id v6 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEBUG,  "Connection interrupted: %{public}@",  (uint8_t *)&v5,  0xCu);
  }

  if (v3) {
    [WeakRetained _handleXPCDisconnect:v3];
  }
}

void sub_100010EC8(void *a1)
{
  uint64_t v1 = a1[4];
  uint64_t v2 = a1[6];
  if (v1)
  {
    id v3 = *(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16);
    uint64_t v4 = a1[6];
    uint64_t v5 = 0LL;
LABEL_5:
    v3(v4, v1, v5);
    return;
  }

  uint64_t v5 = a1[5];
  if (v5)
  {
    id v3 = *(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16);
    uint64_t v4 = a1[6];
    uint64_t v1 = 0LL;
    goto LABEL_5;
  }

  id v6 = (id)objc_claimAutoreleasedReturnValue( +[NSError msv_errorWithDomain:code:debugDescription:]( &OBJC_CLASS___NSError,  "msv_errorWithDomain:code:debugDescription:",  @"MLDMediaLibraryServiceErrorDomain",  0LL,  @"MLDMediaLibraryService securityScopedURLWrapperForItemPid: encountered nil wrapper"));
  (*(void (**)(uint64_t, void, id))(v2 + 16))(v2, 0LL, v6);
}

void sub_100010F68(uint64_t a1, uint64_t a2, void *a3)
{
  if (a3)
  {
    uint64_t v4 = (os_unfair_lock_s *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 32LL);
    id v5 = a3;
    os_unfair_lock_lock(v4);
    [*(id *)(a1 + 32) addObject:v5];

    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 48) + 8LL) + 32LL));
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void sub_100010FD0(uint64_t a1)
{
  if (*(void *)(a1 + 40))
  {
    if ([*(id *)(a1 + 32) count]) {
      uint64_t v2 = objc_claimAutoreleasedReturnValue( +[NSError msv_errorWithDomain:code:underlyingErrors:debugDescription:]( &OBJC_CLASS___NSError,  "msv_errorWithDomain:code:underlyingErrors:debugDescription:",  @"MLDMediaLibraryServiceErrorDomain",  3000LL,  *(void *)(a1 + 32),  @"Updating Siri index failed"));
    }
    else {
      uint64_t v2 = 0LL;
    }
    id v3 = (id)v2;
    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }

void sub_10001106C(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) isDatabaseLocked];
  id v3 = os_log_create("com.apple.amp.medialibraryd", "Service");
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Unlocking database", buf, 2u);
    }

    id v5 = *(void **)(a1 + 32);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 _allMediaLibraries]);
    [v5 _reconnectLibraries:v6];

    [*(id *)(*(void *)(a1 + 32) + 96) clearValidatedPaths];
    [*(id *)(*(void *)(a1 + 32) + 96) resumeValidations];
    id v7 = os_log_create("com.apple.amp.medialibraryd", "Service");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Unlock: resuming media library writer",  buf,  2u);
    }

    [*(id *)(*(void *)(a1 + 32) + 72) setSuspended:0];
    uint64_t v8 = os_log_create("com.apple.amp.medialibraryd", "Service");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Unlock: resuming the maintenance tasks queue",  buf,  2u);
    }

    [*(id *)(*(void *)(a1 + 32) + 104) setSuspended:0];
    id v9 = os_log_create("com.apple.amp.medialibraryd", "Service");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Unlock: completed successfully", buf, 2u);
    }

    [*(id *)(a1 + 32) setCurrentLockReason:0];
    [*(id *)(a1 + 32) setDatabaseLocked:0];
    int v10 = *(void **)(a1 + 40);
    __int128 v11 = *(dispatch_queue_s **)(*(void *)(a1 + 32) + 40LL);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100011360;
    block[3] = &unk_100024D88;
    id v20 = v10;
    dispatch_async(v11, block);
    id v12 = v20;
  }

  else
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Unlock: not locked", buf, 2u);
    }

    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue( +[ML3MediaLibraryWriter writerErrorWithCode:description:]( &OBJC_CLASS___ML3MediaLibraryWriter,  "writerErrorWithCode:description:",  0LL,  @"Database is not currently locked."));
    __int128 v14 = *(void **)(a1 + 40);
    uint64_t v15 = *(dispatch_queue_s **)(*(void *)(a1 + 32) + 40LL);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_100011374;
    v16[3] = &unk_100024DD8;
    id v17 = v13;
    id v18 = v14;
    id v12 = v13;
    dispatch_async(v15, v16);
  }
}

uint64_t sub_100011360(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t sub_100011374(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  0LL,  *(void *)(a1 + 32));
}

void sub_100011388(uint64_t a1)
{
  unsigned __int8 v2 = [*(id *)(a1 + 32) isDatabaseLocked];
  id v3 = os_log_create("com.apple.amp.medialibraryd", "Service");
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if ((v2 & 1) != 0)
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Lock: already locked", buf, 2u);
    }

    uint64_t v5 = MLServiceLockReasonDescription([*(id *)(a1 + 32) currentLockReason]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Database is already locked. (Reason = %@)",  v6));

    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[ML3MediaLibraryWriter writerErrorWithCode:description:]( &OBJC_CLASS___ML3MediaLibraryWriter,  "writerErrorWithCode:description:",  1000LL,  v7));
    id v9 = *(void **)(a1 + 40);
    int v10 = *(dispatch_queue_s **)(*(void *)(a1 + 32) + 40LL);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000117D4;
    block[3] = &unk_100024DD8;
    id v24 = v8;
    id v25 = v9;
    id v11 = v8;
    dispatch_async(v10, block);
  }

  else
  {
    if (v4)
    {
      uint64_t v12 = MLServiceLockReasonDescription(*(void *)(a1 + 48));
      __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      *(_DWORD *)buf = 138543362;
      uint64_t v29 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Locking database for reason: %{public}@",  buf,  0xCu);
    }

    __int128 v14 = os_log_create("com.apple.amp.medialibraryd", "Service");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Lock: cancelling all database operations",  buf,  2u);
    }

    [*(id *)(*(void *)(a1 + 32) + 72) cancelAllActiveDatabaseOperationsAndWaitUntilFinished:1];
    [*(id *)(*(void *)(a1 + 32) + 96) suspendValidations];
    uint64_t v15 = os_log_create("com.apple.amp.medialibraryd", "Service");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Lock: suspending the maintenance tasks queue",  buf,  2u);
    }

    [*(id *)(*(void *)(a1 + 32) + 104) setSuspended:1];
    [*(id *)(*(void *)(a1 + 32) + 104) waitUntilAllOperationsAreFinished];
    uint64_t v16 = os_log_create("com.apple.amp.medialibraryd", "Service");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Lock: cancelling all import operations",  buf,  2u);
    }

    [*(id *)(*(void *)(a1 + 32) + 80) cancelAllImportOperations];
    id v17 = *(void **)(a1 + 32);
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 _allMediaLibraries]);
    [v17 _disconnectLibraries:v18];

    __int128 v19 = os_log_create("com.apple.amp.medialibraryd", "Service");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Lock: suspending media library writer",  buf,  2u);
    }

    [*(id *)(*(void *)(a1 + 32) + 72) setSuspended:1];
    id v20 = os_log_create("com.apple.amp.medialibraryd", "Service");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Lock: completed successfully", buf, 2u);
    }

    [*(id *)(a1 + 32) setCurrentLockReason:*(void *)(a1 + 48)];
    [*(id *)(a1 + 32) setDatabaseLocked:1];
    __int128 v21 = *(void **)(a1 + 40);
    uint64_t v22 = *(dispatch_queue_s **)(*(void *)(a1 + 32) + 40LL);
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472LL;
    v26[2] = sub_1000117C0;
    v26[3] = &unk_100024D88;
    id v27 = v21;
    dispatch_async(v22, v26);
    id v7 = v27;
  }
}

uint64_t sub_1000117C0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t sub_1000117D4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  0LL,  *(void *)(a1 + 32));
}

uint64_t sub_1000117E8(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_1000117FC(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    id v6 = objc_alloc(&OBJC_CLASS___ML3DatabasePrivacyContext);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) clientIdentity]);
    uint64_t v8 = -[ML3DatabasePrivacyContext initWithClientIdentity:](v6, "initWithClientIdentity:", v7);

    -[ML3DatabasePrivacyContext logDatabasePrivacyAccess](v8, "logDatabasePrivacyAccess");
    id v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) _mediaLibraryForPath:*(void *)(a1 + 48)]);
    id v10 = [[ML3ServiceDatabaseImport alloc] initWithDatabaseImport:*(void *)(a1 + 32) library:v9 writer:*(void *)(*(void *)(a1 + 40) + 72) client:*(void *)(a1 + 56)];
    id v11 = os_log_create("com.apple.amp.medialibraryd", "Default");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      id v23 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Performing import: %{public}@", buf, 0xCu);
    }

    uint64_t v12 = *(void **)(*(void *)(a1 + 40) + 80LL);
    uint64_t v13 = *(void *)(a1 + 88);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_100011A8C;
    v19[3] = &unk_100024CE8;
    id v20 = *(id *)(a1 + 56);
    id v21 = *(id *)(a1 + 64);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_100011AEC;
    v16[3] = &unk_100024D10;
    id v18 = *(id *)(a1 + 80);
    id v17 = *(id *)(a1 + 72);
    [v12 performImport:v10 fromSource:v13 progressBlock:v19 withCompletionHandler:v16];
  }

  else
  {
    __int128 v14 = os_log_create("com.apple.amp.medialibraryd", "Service");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEBUG,  "Database validation failed. Aborting database import.",  buf,  2u);
    }

    uint64_t v15 = *(void *)(a1 + 80);
    if (v15) {
      (*(void (**)(uint64_t, void, id, void))(v15 + 16))(v15, 0LL, v5, 0LL);
    }
    [*(id *)(a1 + 72) endTransaction];
  }
}

void sub_100011A8C(uint64_t a1, float a2)
{
  id v6 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) connection]);
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v6 remoteObjectProxy]);
  *(float *)&double v5 = a2;
  [v4 importOperationWithIdentifier:*(void *)(a1 + 40) didUpdateWithProgress:v5];
}

id sub_100011AEC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  return [*(id *)(a1 + 32) endTransaction];
}

void sub_100011B1C(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _mediaLibraryForPath:*(void *)(a1 + 40)]);
  id v3 = *(void **)(*(void *)(a1 + 32) + 72LL);
  uint64_t v4 = *(void *)(a1 + 88);
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 56);
  id v7 = *(void **)(a1 + 64);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100011E1C;
  v8[3] = &unk_100024C70;
  id v9 = v7;
  id v11 = *(id *)(a1 + 80);
  id v10 = *(id *)(a1 + 72);
  [v3 performDatabaseOperation:v4 onLibrary:v2 withAttributes:v5 options:v6 fromClient:v9 completionHandler:v8];
}

void sub_100011C0C(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) connection]);

    if (v6)
    {
      id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) connection]);
      uint64_t v8 = v7;
      if (v7)
      {
        -[os_log_s auditToken](v7, "auditToken");
      }

      else
      {
        __int128 v13 = 0u;
        __int128 v14 = 0u;
      }

      *(_OWORD *)buf = v13;
      __int128 v16 = v14;
    }

    else
    {
      MSVAuditTokenForCurrentProcess(buf);
      uint64_t v8 = os_log_create("com.apple.amp.medialibraryd", "Default");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v13) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "Logging privacy access for daemon process",  (uint8_t *)&v13,  2u);
      }
    }

    __int128 v13 = *(_OWORD *)buf;
    __int128 v14 = v16;
    +[ML3DatabasePrivacyContext logDatabasePrivacyAccessWithAuditToken:]( &OBJC_CLASS___ML3DatabasePrivacyContext,  "logDatabasePrivacyAccessWithAuditToken:",  &v13);
    id v11 = os_log_create("com.apple.amp.medialibraryd", "Default");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(a1 + 64);
      LODWORD(v13) = 134217984;
      *(void *)((char *)&v13 + 4) = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Validating successful - enqueing operation for type %lu",  (uint8_t *)&v13,  0xCu);
    }

    dispatch_async(*(dispatch_queue_t *)(*(void *)(a1 + 40) + 32LL), *(dispatch_block_t *)(a1 + 48));
  }

  else
  {
    id v9 = os_log_create("com.apple.amp.medialibraryd", "Default");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "Validation failed! Operation not enqueued. %{public}@",  buf,  0xCu);
    }

    uint64_t v10 = *(void *)(a1 + 56);
    if (v10) {
      (*(void (**)(uint64_t, void, id))(v10 + 16))(v10, 0LL, v5);
    }
  }
}

void sub_100011E1C(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = os_log_create("com.apple.amp.medialibraryd", "Service");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v9 = 138543618;
    uint64_t v10 = v7;
    __int16 v11 = 2114;
    id v12 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Finished database operation request on client: %{public}@. err=%{public}@",  (uint8_t *)&v9,  0x16u);
  }

  uint64_t v8 = *(void *)(a1 + 48);
  if (v8) {
    (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, a2, v5);
  }
  [*(id *)(a1 + 40) endTransaction];
}

void sub_100011F10(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  [*(id *)(a1 + 32) _logPrivacyAccessWithTransactionIdentifier:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 72LL);
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 56);
  uint64_t v7 = *(void *)(a1 + 64);
  id v12 = 0LL;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( [v4 executeUntrustedQuery:v5 withParameters:v6 options:v7 onTransaction:v3 error:&v12]);
  id v9 = v12;
  [*(id *)(a1 + 32) faultForQuery:*(void *)(a1 + 48) fromClientBundleID:*(void *)(a1 + 72) onTrustError:v9];
  if (v8)
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v8,  1LL,  0LL));
    if (!v10)
    {
      uint64_t v11 = objc_claimAutoreleasedReturnValue( +[ML3MediaLibraryWriter writerErrorWithCode:description:]( &OBJC_CLASS___ML3MediaLibraryWriter,  "writerErrorWithCode:description:",  200LL,  @"Failed to serialize fetched query data."));

      id v9 = (id)v11;
    }
  }

  else
  {
    uint64_t v10 = 0LL;
  }

  (*(void (**)(void))(*(void *)(a1 + 80) + 16LL))();

  objc_autoreleasePoolPop(v2);
}

void sub_100012018(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  [*(id *)(a1 + 32) _logPrivacyAccessWithTransactionIdentifier:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 72LL);
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 56);
  id v15 = 0LL;
  unsigned __int8 v7 = [v4 executeUntrustedUpdate:v5 withParameters:v6 onTransaction:v3 error:&v15];
  id v8 = v15;
  [*(id *)(a1 + 32) faultForQuery:*(void *)(a1 + 48) fromClientBundleID:*(void *)(a1 + 64) onTrustError:v8];
  id v9 = *(void **)(a1 + 72);
  if (v9)
  {
    uint64_t v10 = *(dispatch_queue_s **)(*(void *)(a1 + 32) + 40LL);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_100012108;
    v11[3] = &unk_100024BF8;
    id v13 = v9;
    unsigned __int8 v14 = v7;
    id v12 = v8;
    dispatch_async(v10, v11);
  }

  objc_autoreleasePoolPop(v2);
}

uint64_t sub_100012108(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(unsigned __int8 *)(a1 + 48),  *(void *)(a1 + 32));
}

void sub_10001211C(uint64_t a1, void *a2, id obj)
{
  id v10 = obj;
  id v6 = a2;
  uint64_t v7 = objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 72) _transactionForIdentifier:v6]);

  uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8LL);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_1000121B0(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = os_log_create("com.apple.amp.medialibraryd", "Default");
  uint64_t v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Validating successful - starting transaction",  buf,  2u);
    }

    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = *(void **)(a1 + 40);
    id v10 = *(dispatch_queue_s **)(v8 + 24);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10001238C;
    block[3] = &unk_100024B80;
    void block[4] = v8;
    id v17 = v9;
    id v11 = *(id *)(a1 + 48);
    id v12 = *(void **)(a1 + 80);
    uint64_t v13 = *(void *)(a1 + 88);
    id v18 = v11;
    uint64_t v14 = *(void *)(a1 + 96);
    uint64_t v23 = v13;
    uint64_t v24 = v14;
    id v22 = v12;
    id v19 = *(id *)(a1 + 56);
    id v20 = *(id *)(a1 + 64);
    id v21 = *(id *)(a1 + 72);
    dispatch_async(v10, block);
  }

  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v26 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "Validation failed - skipping starting a transaction. err=%{public}@",  buf,  0xCu);
    }

    uint64_t v15 = *(void *)(a1 + 80);
    if (v15) {
      (*(void (**)(uint64_t, void, id))(v15 + 16))(v15, 0LL, v5);
    }
  }
}

void sub_10001238C(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _mediaLibraryForPath:*(void *)(a1 + 40)]);
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 72LL);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 88);
  id v15 = 0LL;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 beginTransactionForLibrary:v2 withClient:v4 options:v5 error:&v15]);
  id v7 = v15;
  uint64_t v8 = objc_claimAutoreleasedReturnValue([v6 identifier]);
  id v9 = (void *)v8;
  if (v7) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = v8 == 0;
  }
  if (v10)
  {
    if (!v7)
    {
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
      [v14 handleFailureInMethod:*(void *)(a1 + 96) object:*(void *)(a1 + 32) file:@"MLDMediaLibraryService.m" lineNumber:471 description:@"Error cannot be nil even with nil transaction identifier"];
    }

    (*(void (**)(void))(*(void *)(a1 + 80) + 16LL))();
    [*(id *)(a1 + 56) endTransaction];
    [*(id *)(a1 + 64) invalidate];
    id v12 = os_log_create("com.apple.amp.medialibraryd", "Service");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 64);
      *(_DWORD *)buf = 138543362;
      uint64_t v17 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Releasing task assertion %{public}@",  buf,  0xCu);
    }
  }

  else
  {
    id v12 = objc_alloc_init(&OBJC_CLASS___MLDTransactionInfo);
    -[os_log_s setTaskAssertion:](v12, "setTaskAssertion:", *(void *)(a1 + 64));
    -[os_log_s setClient:](v12, "setClient:", *(void *)(a1 + 48));
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 72) privacyContext]);
    -[os_log_s setPrivacyContext:](v12, "setPrivacyContext:", v13);

    [*(id *)(a1 + 32) _registerTransactionInfo:v12 forIdentitifer:v9];
    (*(void (**)(void))(*(void *)(a1 + 80) + 16LL))();
    [*(id *)(a1 + 56) endTransaction];
  }
}

void sub_1000125A0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained error]);
  uint64_t v4 = os_log_create("com.apple.amp.medialibraryd", "Service");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Integrity check complete. err=%{public}@",  (uint8_t *)&v5,  0xCu);
  }

  (*(void (**)(void, BOOL, void *))(*(void *)(a1 + 40) + 16LL))(*(void *)(a1 + 40), v3 == 0LL, v3);
  [*(id *)(a1 + 32) endTransaction];
}

void sub_100012694(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 120LL);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100012814;
  v9[3] = &unk_100024B08;
  id v11 = *(id *)(a1 + 56);
  id v10 = *(id *)(a1 + 40);
  uint64_t v3 = objc_retainBlock(v9);
  [v2 addObject:v3];

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 112) operations]);
  id v5 = (id)objc_claimAutoreleasedReturnValue([v4 firstObject]);

  if (!v5)
  {
    id v5 = [[ML3DatabaseRecoveryOperation alloc] initWithDatabaseFilePath:*(void *)(a1 + 48)];
    objc_initWeak(&location, v5);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_10001284C;
    v6[3] = &unk_100025200;
    objc_copyWeak(&v7, &location);
    v6[4] = *(void *)(a1 + 32);
    [v5 setCompletionBlock:v6];
    [*(id *)(*(void *)(a1 + 32) + 112) addOperation:v5];
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

void sub_1000127F4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

id sub_100012814(uint64_t a1, uint64_t a2)
{
  (*(void (**)(void, BOOL, uint64_t))(*(void *)(a1 + 40) + 16LL))(*(void *)(a1 + 40), a2 == 0, a2);
  return [*(id *)(a1 + 32) endTransaction];
}

void sub_10001284C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained error]);
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(dispatch_queue_s **)(v4 + 8);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000128E8;
  v7[3] = &unk_1000251D8;
  v7[4] = v4;
  id v8 = v3;
  id v6 = v3;
  dispatch_async(v5, v7);
}

id sub_1000128E8(uint64_t a1)
{
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 120LL);
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      id v6 = 0LL;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v8 + 1) + 8LL * (void)v6) + 16LL))(*(void *)(*((void *)&v8 + 1) + 8LL * (void)v6));
        id v6 = (char *)v6 + 1;
      }

      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }

    while (v4);
  }

  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 120), "removeAllObjects", (void)v8);
}

void sub_1000129EC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 56);
  *(void *)(v2 + 56) = 0LL;
}

void sub_100012A28(id a1, NSString *a2, NSXPCListener *a3, BOOL *a4)
{
  id v4 = a3;
  -[NSXPCListener invalidate](v4, "invalidate");
  -[NSXPCListener suspend](v4, "suspend");
  -[NSXPCListener setDelegate:](v4, "setDelegate:", 0LL);
}

uint64_t sub_100012A64(uint64_t a1)
{
  uint64_t v1 = &_dispatch_main_q;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100012B30;
  v4[3] = &unk_100024A50;
  objc_copyWeak(&v5, &location);
  uint64_t v2 = MSVLogAddStateHandler(&_dispatch_main_q, @"MLDMediaLibrary State", v4);
  objc_destroyWeak(&v5);

  objc_destroyWeak(&location);
  return v2;
}

void sub_100012B14(_Unwind_Exception *a1)
{
}

uint64_t sub_100012B30(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    __int128 v8 = WeakRetained;
    if (WeakRetained)
    {
      __int128 v9 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained _stateDump]);
      uint64_t v6 = v5[2](v5, v9);
    }

    else
    {
      uint64_t v6 = 0LL;
    }
  }

  else
  {
    uint64_t v6 = 0LL;
  }

  return v6;
}

void sub_100012BF8(id a1)
{
  id v1 = -[MLDMediaLibraryService _init](objc_alloc(&OBJC_CLASS___MLDMediaLibraryService), "_init");
  uint64_t v2 = (void *)qword_10002BB50;
  qword_10002BB50 = (uint64_t)v1;
}

void sub_100012DB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100012EC4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  if (!v12) {

  }
  _Unwind_Resume(a1);
}

void sub_100012F88( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  if (!v11) {

  }
  _Unwind_Resume(a1);
}

void sub_100013010( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_1000130D8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  if (!v12) {

  }
  _Unwind_Resume(a1);
}

void sub_1000131B4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  if (!v12) {

  }
  _Unwind_Resume(a1);
}

void sub_100013290( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  if (!v12) {

  }
  _Unwind_Resume(a1);
}

void sub_100013348(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100013644(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000138EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

LABEL_17:
    uint64_t v17 = -[ML3ClientImportResult initWithSuccess:resultingDatabasePersistentIDs:]( objc_alloc(&OBJC_CLASS___ML3ClientImportResult),  "initWithSuccess:resultingDatabasePersistentIDs:",  self->_success,  v5);
    currentResult = self->_currentResult;
    self->_currentResult = v17;
  }

  else
  {
    id v19 = os_log_create("com.apple.amp.medialibraryd", "Default");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      __int128 v30 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "%{public}@ addItems called without an active import session",  buf,  0xCu);
    }

    self->_success = 0;
  }
}

    uint64_t v17 = -[ML3ClientImportResult initWithSuccess:resultingDatabasePersistentIDs:]( objc_alloc(&OBJC_CLASS___ML3ClientImportResult),  "initWithSuccess:resultingDatabasePersistentIDs:",  self->_success,  v5);
    currentResult = self->_currentResult;
    self->_currentResult = v17;
  }

  else
  {
    id v19 = os_log_create("com.apple.amp.medialibraryd", "Default");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      __int128 v30 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "%{public}@ updateItems called without an active import session",  buf,  0xCu);
    }

    self->_success = 0;
  }
}

    uint64_t v17 = -[ML3ClientImportResult initWithSuccess:resultingDatabasePersistentIDs:]( objc_alloc(&OBJC_CLASS___ML3ClientImportResult),  "initWithSuccess:resultingDatabasePersistentIDs:",  self->_success,  v5);
    currentResult = self->_currentResult;
    self->_currentResult = v17;
  }

  else
  {
    id v5 = os_log_create("com.apple.amp.medialibraryd", "Default");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v29 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "%{public}@ removeItems called without an active import session",  buf,  0xCu);
    }
  }
}

void sub_100013C4C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_100013FD4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_100014354( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_100014474(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000144F8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.medialibraryd", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Failed to report progress to client. err=%{public}@",  (uint8_t *)&v6,  0x16u);
  }
}

void sub_1000145CC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.medialibraryd", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Failed to obtain client proxy object. err=%{public}@",  (uint8_t *)&v6,  0x16u);
  }
}

void sub_1000146A0(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (!v5 && (a2 & 1) == 0)
  {
    int v6 = os_log_create("com.apple.amp.medialibraryd", "Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138543362;
      uint64_t v9 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Skipping failure",  (uint8_t *)&v8,  0xCu);
    }

    *(_BYTE *)(*(void *)(a1 + 32) + 48LL) = 1;
  }
}

void sub_100014780(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.medialibraryd", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Failed to obtain client proxy object. err=%{public}@",  (uint8_t *)&v6,  0x16u);
  }
}

void sub_100014854(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (!v5 && (a2 & 1) == 0)
  {
    int v6 = os_log_create("com.apple.amp.medialibraryd", "Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138543362;
      uint64_t v9 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Skipping failure",  (uint8_t *)&v8,  0xCu);
    }

    *(_BYTE *)(*(void *)(a1 + 32) + 48LL) = 1;
  }
}

void sub_100014934(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.medialibraryd", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Failed to obtain client proxy object. err=%{public}@",  (uint8_t *)&v6,  0x16u);
  }
}

void sub_100014A08(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (!v5 && (a2 & 1) == 0)
  {
    int v6 = os_log_create("com.apple.amp.medialibraryd", "Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138543362;
      uint64_t v9 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Skipping failure",  (uint8_t *)&v8,  0xCu);
    }

    *(_BYTE *)(*(void *)(a1 + 32) + 48LL) = 1;
  }
}

void sub_100014AE8(uint64_t a1)
{
  *(_BYTE *)(*(void *)(a1 + 32) + 49LL) = 0;
  CFRunLoopStop((CFRunLoopRef)[*(id *)(*(void *)(a1 + 32) + 80) getCFRunLoop]);
}

uint64_t sub_100015334(void *a1, int a2, uint64_t *a3)
{
  if (a2 >= 1)
  {
    uint64_t v3 = *a3;
    id v4 = a1;
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v3));
    [v4 addObject:v5];
  }

  return 0LL;
}

void sub_100015828(_Unwind_Exception *a1)
{
}

id sub_100015890(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) addObject:*(void *)(a1 + 40)];
}

void sub_10001589C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = os_log_create("com.apple.amp.medialibraryd", "Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    __int128 v10 = WeakRetained;
    __int16 v11 = 2114;
    uint64_t v12 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_ERROR,  "%{public}@ - Connection interrupted for session %{public}@",  buf,  0x16u);
  }

  if (WeakRetained)
  {
    id v5 = (dispatch_queue_s *)WeakRetained[2];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_100015B38;
    v6[3] = &unk_1000251D8;
    id v7 = *(id *)(a1 + 32);
    int v8 = WeakRetained;
    dispatch_sync(v5, v6);
  }
}

void sub_1000159D4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = os_log_create("com.apple.amp.medialibraryd", "Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    __int128 v10 = WeakRetained;
    __int16 v11 = 2114;
    uint64_t v12 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_ERROR,  "%{public}@ - Connection invalidated for session %{public}@ - removing",  buf,  0x16u);
  }

  if (WeakRetained)
  {
    id v5 = (dispatch_queue_s *)WeakRetained[2];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_100015B0C;
    v6[3] = &unk_1000251D8;
    id v7 = *(id *)(a1 + 32);
    int v8 = WeakRetained;
    dispatch_sync(v5, v6);
  }
}

id sub_100015B0C(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 40) + 8) removeObject:*(void *)(a1 + 32)];
}

id sub_100015B38(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 40) + 8) removeObject:*(void *)(a1 + 32)];
}

void sub_100015BA4(id a1)
{
  id v1 = objc_alloc_init(&OBJC_CLASS___MLDClientImportService);
  uint64_t v2 = (void *)qword_10002BB70;
  qword_10002BB70 = (uint64_t)v1;
}

LABEL_11:
LABEL_15:
  id v18 = (void *)objc_claimAutoreleasedReturnValue( -[MLDIndexIntegrityFault _createErrorWithDescription:]( self,  "_createErrorWithDescription:",  @"could not find index SQL to rebuild"));
LABEL_22:

  if (v18)
  {
    id v19 = os_log_create("com.apple.amp.medialibraryd", "Default");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      id v20 = self->_indexName;
      *(_DWORD *)buf = 138543618;
      id v27 = v20;
      __int128 v28 = 2114;
      uint64_t v29 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "[MLDDatabaseIntegrityFault] Failed to repair index %{public}@: %{public}@",  buf,  0x16u);
    }
  }

  if (a4) {
    *a4 = v18;
  }

  return v18 == 0LL;
}

id objc_msgSend__reportCacheDeletePurgeEventWithUrgency_amountRequested_amountPurged_duration_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_reportCacheDeletePurgeEventWithUrgency:amountRequested:amountPurged:duration:");
}

id objc_msgSend_enumerateArtworkRelativePathsWithConnection_matchingRelativePathContainer_block_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateArtworkRelativePathsWithConnection:matchingRelativePathContainer:block:");
}

id objc_msgSend_performDatabaseOperation_onLibrary_withAttributes_options_fromClient_completionHandler_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performDatabaseOperation:onLibrary:withAttributes:options:fromClient:completionHandler:");
}

id objc_msgSend_updateBestArtworkTokenForEntityPersistentID_entityType_artworkType_retrievalTime_preserveExistingAvailableToken_usingConnection_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "updateBestArtworkTokenForEntityPersistentID:entityType:artworkType:retrievalTime:preserveExistingAvailableTok en:usingConnection:");
}

id objc_msgSend_writerErrorWithCode_description_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writerErrorWithCode:description:");
}