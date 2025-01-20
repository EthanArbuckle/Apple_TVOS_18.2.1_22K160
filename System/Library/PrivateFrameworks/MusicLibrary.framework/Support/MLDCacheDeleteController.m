@interface MLDCacheDeleteController
+ (unint64_t)_cacheDeleteUrgencyToMusicLibraryUrgency:(int)a3;
- ($06626BA963112C91E7E52BBD3AECAE4D)_calculateUsageAnalytics;
- (BOOL)_isMediaVolume:(id)a3;
- (MLDCacheDeleteController)initWithLibraries:(id)a3;
- (__CFDictionary)_handlePurgeRequestWithUrgency:(int)a3 info:(__CFDictionary *)a4;
- (__CFDictionary)_handlePurgeableRequestWithUrgency:(int)a3 info:(__CFDictionary *)a4;
- (void)_addOptimizeStorageAnalyticsToPayload:(id)a3;
- (void)_addPurgeAnalytics:(id *)a3 toPayload:(id)a4;
- (void)_addPurgeableAnalytics:(id *)a3 toPayload:(id)a4;
- (void)_addUsageAnalytics:(id *)a3 toPayload:(id)a4;
- (void)_handleCacheDeleteNotification:(__CFDictionary *)a3;
- (void)_reconcileAllOriginalArtworkForLibrary:(id)a3 withCompletion:(id)a4;
- (void)_reconcileOrginalArtworkWitRelativePaths:(id)a3 forLibrary:(id)a4 withCompletion:(id)a5;
- (void)_reconcilePurgeNotification;
- (void)_registerCacheDeleteHandler;
- (void)_reportCacheDeletePurgeEventWithUrgency:(int)a3 amountRequested:(unint64_t)a4 amountPurged:(unint64_t)a5 duration:(double)a6;
- (void)_reportCacheDeletePurgeableRequestWithUrgency:(int)a3 purgeableAmount:(unint64_t)a4 duration:(double)a5;
- (void)_updatePurgedOriginalWithRelativePath:(id)a3 forLibrary:(id)a4 usingConnection:(id)a5;
@end

@implementation MLDCacheDeleteController

- (MLDCacheDeleteController)initWithLibraries:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___MLDCacheDeleteController;
  v6 = -[MLDCacheDeleteController init](&v19, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_libraries, a3);
    dispatch_queue_attr_t v8 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_USER_INITIATED, 0);
    v9 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v8);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.medialibraryd.CacheDeleteController.accessQueue", v9);
    accessQueue = v7->_accessQueue;
    v7->_accessQueue = (OS_dispatch_queue *)v10;

    v12 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
    artworkOperationQueue = v7->_artworkOperationQueue;
    v7->_artworkOperationQueue = v12;

    -[NSOperationQueue setMaxConcurrentOperationCount:]( v7->_artworkOperationQueue,  "setMaxConcurrentOperationCount:",  1LL);
    dispatch_queue_attr_t v14 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_UTILITY, 0);
    v15 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v14);
    dispatch_queue_t v16 = dispatch_queue_create("com.apple.amp.medialibrary.CacheDeletePurge.Reporting", v15);
    eventReportingQueue = v7->_eventReportingQueue;
    v7->_eventReportingQueue = (OS_dispatch_queue *)v16;

    -[MLDCacheDeleteController _registerCacheDeleteHandler](v7, "_registerCacheDeleteHandler");
  }

  return v7;
}

- (void)_registerCacheDeleteHandler
{
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100008C98;
  v13[3] = &unk_100024850;
  objc_copyWeak(&v14, &location);
  v13[4] = self;
  v3 = objc_retainBlock(v13);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100008D64;
  v11[3] = &unk_100024850;
  objc_copyWeak(&v12, &location);
  v11[4] = self;
  v4 = objc_retainBlock(v11);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100008E30;
  v9[3] = &unk_100024878;
  objc_copyWeak(&v10, &location);
  v9[4] = self;
  id v5 = objc_retainBlock(v9);
  CacheDeleteRegister(@"com.apple.medialibraryd.cacheDelete", 0LL, v3, v4, 0LL, 0LL, v5);
  CacheDeleteInitPurgeMarker(@"com.apple.medialibraryd.cacheDelete", @"/private/var/mobile", 1LL);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100008EB8;
  v7[3] = &unk_100025200;
  objc_copyWeak(&v8, &location);
  v7[4] = self;
  CacheDeleteRegisterPurgeNotification(@"com.apple.medialibraryd.cacheDelete", &off_100026610, v7);
  v6 = os_log_create("com.apple.amp.medialibraryd", "CacheManagement");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v17 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Registered CacheDelete handlers.",  buf,  0xCu);
  }

  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)_updatePurgedOriginalWithRelativePath:(id)a3 forLibrary:(id)a4 usingConnection:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v26 = v8;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v26, 1LL));
  unsigned __int8 v12 = [v10 executeUpdate:@"UPDATE artwork SET relative_path = '' WHERE relative_path = ?" withParameters:v11 error:0];

  if ((v12 & 1) != 0)
  {
    id v21 = v8;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v21, 1LL));
    id v14 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v10,  "executeQuery:withParameters:",  @"SELECT entity_pid, entity_type, artwork_token.artwork_type FROM artwork JOIN artwork_token USING(artwork_token) WHERE relative_path = ?",  v13));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_100008B78;
    v16[3] = &unk_1000248A0;
    v17 = (os_log_s *)v9;
    id v18 = v10;
    objc_super v19 = self;
    id v20 = v8;
    [v14 enumerateRowsWithBlock:v16];

    v15 = v17;
  }

  else
  {
    v15 = os_log_create("com.apple.amp.medialibraryd", "CacheManagement");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v23 = self;
      __int16 v24 = 2114;
      id v25 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "%{public}@ Error clearing artwork.relative_path for artwork relativePath=%{public}@.",  buf,  0x16u);
    }
  }
}

- (void)_reconcileAllOriginalArtworkForLibrary:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  artworkOperationQueue = self->_artworkOperationQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100008868;
  v11[3] = &unk_100025060;
  id v12 = v6;
  v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  -[NSOperationQueue addOperationWithBlock:](artworkOperationQueue, "addOperationWithBlock:", v11);
}

- (void)_reconcileOrginalArtworkWitRelativePaths:(id)a3 forLibrary:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  artworkOperationQueue = self->_artworkOperationQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000085BC;
  v15[3] = &unk_100024B30;
  id v16 = v9;
  v17 = self;
  id v18 = v8;
  id v19 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  -[NSOperationQueue addOperationWithBlock:](artworkOperationQueue, "addOperationWithBlock:", v15);
}

- (void)_reconcilePurgeNotification
{
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  obj = self->_libraries;
  id v3 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v19,  v28,  16LL);
  if (v3)
  {
    id v5 = v3;
    uint64_t v6 = *(void *)v20;
    *(void *)&__int128 v4 = 138543618LL;
    __int128 v15 = v4;
    do
    {
      id v7 = 0LL;
      do
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)v7);
        id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set", v15));
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 originalArtworkDirectory]);
        v11 = (void *)objc_claimAutoreleasedReturnValue([@"/private" stringByAppendingString:v10]);

        id v12 = os_log_create("com.apple.amp.medialibraryd", "CacheManagement");
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v15;
          id v25 = self;
          __int16 v26 = 2114;
          v27 = v11;
          _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Checking path %{public}@ for purged artwork",  buf,  0x16u);
        }

        v23 = v11;
        id v13 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v23, 1LL);
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472LL;
        v17[2] = sub_10000828C;
        v17[3] = &unk_100024940;
        v17[4] = self;
        v17[5] = v8;
        id v18 = v9;
        id v14 = v9;
        CacheDeleteEnumerateRemovedFilesInDirectories(@"com.apple.medialibraryd.cacheDelete", v13, v17);

        id v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v19,  v28,  16LL);
    }

    while (v5);
  }
}

- (__CFDictionary)_handlePurgeableRequestWithUrgency:(int)a3 info:(__CFDictionary *)a4
{
  uint64_t v5 = *(void *)&a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v37 = objc_msgSend((id)objc_opt_class(self, v8), "_cacheDeleteUrgencyToMusicLibraryUrgency:", v5);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKey:](a4, "objectForKey:", @"CACHE_DELETE_VOLUME"));
  unsigned int v10 = -[MLDCacheDeleteController _isMediaVolume:](self, "_isMediaVolume:", v9);
  v11 = os_log_create("com.apple.amp.medialibraryd", "CacheManagement");
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v12)
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v48 = v5;
      *(_WORD *)&v48[4] = 2114;
      *(void *)&v48[6] = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Received purgeable request with urgency %u for volume '%{public}@'",  buf,  0x12u);
    }

    unsigned int v35 = v5;
    v36 = v9;

    __int128 v42 = 0u;
    __int128 v43 = 0u;
    __int128 v40 = 0u;
    __int128 v41 = 0u;
    v34 = self;
    obj = self->_libraries;
    id v13 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v40,  v46,  16LL);
    if (!v13)
    {
      uint64_t v39 = 0LL;
      goto LABEL_25;
    }

    id v14 = v13;
    uint64_t v39 = 0LL;
    uint64_t v15 = *(void *)v41;
    while (1)
    {
      for (i = 0LL; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v41 != v15) {
          objc_enumerationMutation(obj);
        }
        v17 = *(void **)(*((void *)&v40 + 1) + 8LL * (void)i);
        uint64_t v18 = objc_claimAutoreleasedReturnValue([v17 databasePath]);
        if (!v18
          || (__int128 v19 = (void *)v18,
              __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager")),
              __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v17 databasePath]),
              unsigned int v22 = [v20 fileExistsAtPath:v21],
              v21,
              v20,
              v19,
              !v22))
        {
          id v25 = os_log_create("com.apple.amp.medialibraryd", "CacheManagement");
          if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
            goto LABEL_18;
          }
          __int16 v26 = (void *)objc_claimAutoreleasedReturnValue([v17 databasePath]);
          *(_DWORD *)buf = 138543362;
          *(void *)v48 = v26;
          v27 = v25;
          os_log_type_t v28 = OS_LOG_TYPE_ERROR;
          v29 = "Skipping purgeable amount for library with missing database at path=%{public}@";
          goto LABEL_17;
        }

        v23 = os_log_create("com.apple.amp.medialibraryd", "CacheManagement");
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v24 = (void *)objc_claimAutoreleasedReturnValue([v17 databasePath]);
          *(_DWORD *)buf = 138543362;
          *(void *)v48 = v24;
          _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Begin gathering purgeable amount for library %{public}@",  buf,  0xCu);
        }

        v39 += (uint64_t)[v17 purgeableStorageSizeWithUrgency:v37];
        id v25 = os_log_create("com.apple.amp.medialibraryd", "CacheManagement");
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v26 = (void *)objc_claimAutoreleasedReturnValue([v17 databasePath]);
          *(_DWORD *)buf = 138543362;
          *(void *)v48 = v26;
          v27 = v25;
          os_log_type_t v28 = OS_LOG_TYPE_DEFAULT;
          v29 = "End gathering purgeable amount for library %{public}@";
LABEL_17:
          _os_log_impl((void *)&_mh_execute_header, v27, v28, v29, buf, 0xCu);
        }

- (__CFDictionary)_handlePurgeRequestWithUrgency:(int)a3 info:(__CFDictionary *)a4
{
  id v45 = objc_msgSend((id)objc_opt_class(self, a2), "_cacheDeleteUrgencyToMusicLibraryUrgency:", *(void *)&a3);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKey:](a4, "objectForKey:", @"CACHE_DELETE_AMOUNT"));
  id v8 = [v7 longLongValue];

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKey:](a4, "objectForKey:", @"CACHE_DELETE_VOLUME"));
  LODWORD(a4) = -[MLDCacheDeleteController _isMediaVolume:](self, "_isMediaVolume:", v9);
  unsigned int v10 = os_log_create("com.apple.amp.medialibraryd", "CacheManagement");
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if ((_DWORD)a4)
  {
    if (v11)
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v57 = a3;
      *(_WORD *)&v57[4] = 2114;
      *(void *)&v57[6] = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Received purge request with urgency %u for volume '%{public}@'",  buf,  0x12u);
    }

    unsigned int v43 = a3;
    v44 = v9;

    +[ML3MusicLibrary clearCloudAssetSharedCache](&OBJC_CLASS___ML3MusicLibrary, "clearCloudAssetSharedCache");
    __int128 v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    __int128 v42 = self;
    __int128 v49 = 0u;
    __int128 v50 = 0u;
    __int128 v51 = 0u;
    __int128 v52 = 0u;
    obj = self->_libraries;
    id v12 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v49,  v55,  16LL);
    if (!v12)
    {
      unint64_t v14 = 0LL;
      goto LABEL_27;
    }

    id v13 = v12;
    unint64_t v14 = 0LL;
    uint64_t v15 = "com.apple.amp.medialibraryd";
    id v16 = "CacheManagement";
    uint64_t v17 = *(void *)v50;
    while (1)
    {
      for (i = 0LL; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v50 != v17) {
          objc_enumerationMutation(obj);
        }
        if (v14 < (unint64_t)v8)
        {
          __int128 v19 = *(void **)(*((void *)&v49 + 1) + 8LL * (void)i);
          uint64_t v20 = objc_claimAutoreleasedReturnValue([v19 databasePath]);
          if (!v20) {
            goto LABEL_16;
          }
          __int128 v21 = (void *)v20;
          unsigned int v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
          uint64_t v23 = objc_claimAutoreleasedReturnValue([v19 databasePath]);
          v48 = v19;
          uint64_t v24 = v17;
          unint64_t v25 = v14;
          id v26 = v13;
          v27 = v16;
          id v28 = v8;
          v29 = v15;
          uint64_t v30 = (void *)v23;
          unsigned int v47 = [v22 fileExistsAtPath:v23];

          uint64_t v15 = v29;
          id v8 = v28;
          id v16 = v27;
          id v13 = v26;
          unint64_t v14 = v25;
          uint64_t v17 = v24;
          __int128 v19 = v48;

          if (v47)
          {
            v31 = os_log_create(v15, v16);
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
            {
              v32 = (void *)objc_claimAutoreleasedReturnValue([v48 databasePath]);
              *(_DWORD *)buf = 138543362;
              *(void *)v57 = v32;
              _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "Begin purge for library %{public}@",  buf,  0xCu);

              __int128 v19 = v48;
            }

            v14 += (unint64_t)[v19 clearPurgeableStorageAmount:v8 withUrgency:v45];
            v33 = os_log_create(v15, v16);
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
            {
              v34 = (void *)objc_claimAutoreleasedReturnValue([v19 databasePath]);
              *(_DWORD *)buf = 138543362;
              *(void *)v57 = v34;
              unsigned int v35 = v33;
              os_log_type_t v36 = OS_LOG_TYPE_DEFAULT;
              id v37 = "End purge for library %{public}@";
              goto LABEL_18;
            }
          }

          else
          {
LABEL_16:
            v33 = os_log_create(v15, v16);
            if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
            {
              v34 = (void *)objc_claimAutoreleasedReturnValue([v19 databasePath]);
              *(_DWORD *)buf = 138543362;
              *(void *)v57 = v34;
              unsigned int v35 = v33;
              os_log_type_t v36 = OS_LOG_TYPE_ERROR;
              id v37 = "Skipping purge for library with missing database at path=%{public}@.";
LABEL_18:
              _os_log_impl((void *)&_mh_execute_header, v35, v36, v37, buf, 0xCu);
            }
          }

          continue;
        }
      }

      id v13 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v49,  v55,  16LL);
      if (!v13)
      {
LABEL_27:

        unsigned int v10 = v41;
        -[os_log_s timeIntervalSinceNow](v41, "timeIntervalSinceNow");
        -[MLDCacheDeleteController _reportCacheDeletePurgeEventWithUrgency:amountRequested:amountPurged:duration:]( v42,  "_reportCacheDeletePurgeEventWithUrgency:amountRequested:amountPurged:duration:",  v43,  v8,  v14);
        id v9 = v44;
        goto LABEL_28;
      }
    }
  }

  if (v11)
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v57 = a3;
    *(_WORD *)&v57[4] = 2114;
    *(void *)&v57[6] = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Ignoring purge request with urgency %u for volume '%{public}@'",  buf,  0x12u);
  }

  unint64_t v14 = 0LL;
LABEL_28:

  v54[0] = v9;
  v53[0] = @"CACHE_DELETE_VOLUME";
  v53[1] = @"CACHE_DELETE_AMOUNT";
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v14));
  v53[2] = @"CACHE_DELETE_PURGE_TIMEOUT";
  v54[1] = v38;
  v54[2] = &off_100026658;
  uint64_t v39 = (__CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v54,  v53,  3LL));

  return v39;
}

- (void)_handleCacheDeleteNotification:(__CFDictionary *)a3
{
  uint64_t v5 = os_log_create("com.apple.amp.medialibraryd", "CacheManagement");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v20 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Received CacheDelete notification: %{public}@",  buf,  0xCu);
  }

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKey:](a3, "objectForKey:", @"CACHE_DELETE_CACHE_ENABLED"));
  unsigned int v7 = [v6 BOOLValue];

  id v8 = os_log_create("com.apple.amp.medialibraryd", "CacheManagement");
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "CacheDelete has re-enabled caching - issue a change notification",  buf,  2u);
    }

    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    id v8 = self->_libraries;
    id v10 = -[os_log_s countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v15;
      do
      {
        for (i = 0LL; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v15 != v12) {
            objc_enumerationMutation(v8);
          }
          objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * (void)i), "notifyContentsDidChange", (void)v14);
        }

        id v11 = -[os_log_s countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
      }

      while (v11);
    }
  }

  else if (v9)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "CacheDelete has disabled caching", buf, 2u);
  }
}

- ($06626BA963112C91E7E52BBD3AECAE4D)_calculateUsageAnalytics
{
  uint64_t v18 = 0LL;
  __int128 v19 = &v18;
  uint64_t v20 = 0x4810000000LL;
  __int128 v21 = &unk_10001C405;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  uint64_t v24 = 0LL;
  libraries = self->_libraries;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_1000080D0;
  v17[3] = &unk_100024968;
  v17[4] = &v18;
  -[NSArray enumerateObjectsUsingBlock:](libraries, "enumerateObjectsUsingBlock:", v17);
  uint64_t v5 = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, 1uLL, 1);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 lastObject]);
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v7 attributesOfFileSystemForPath:v8 error:0]);

  if (v9)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:NSFileSystemSize]);
    id v11 = [v10 longLongValue];
    v19[7] = (uint64_t)v11;

    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:NSFileSystemFreeSize]);
    id v13 = [v12 longLongValue];
    v19[8] = (uint64_t)v13;
  }

  __int128 v14 = v19;
  __int128 v15 = *((_OWORD *)v19 + 3);
  *(_OWORD *)&retstr->var0 = *((_OWORD *)v19 + 2);
  *(_OWORD *)&retstr->var2 = v15;
  retstr->var4 = v14[8];

  _Block_object_dispose(&v18, 8);
  return result;
}

- (BOOL)_isMediaVolume:(id)a3
{
  id v3 = a3;
  bzero(&v12, 0x878uLL);
  id v4 = objc_claimAutoreleasedReturnValue(+[ML3MusicLibrary mediaFolderPath](&OBJC_CLASS___ML3MusicLibrary, "mediaFolderPath"));
  int v5 = statfs((const char *)[v4 UTF8String], &v12);

  if (v5)
  {
    uint64_t v6 = os_log_create("com.apple.amp.medialibraryd", "CacheManagement");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(+[ML3MusicLibrary mediaFolderPath](&OBJC_CLASS___ML3MusicLibrary, "mediaFolderPath"));
      int v10 = 138543362;
      id v11 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "Failed to fetch mount stats for path %{public}@",  (uint8_t *)&v10,  0xCu);
    }

    LOBYTE(v8) = 0;
  }

  else
  {
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  v12.f_mntonname));
    int v8 = [v3 isEqualToString:v6];
  }

  return v8;
}

- (void)_reportCacheDeletePurgeEventWithUrgency:(int)a3 amountRequested:(unint64_t)a4 amountPurged:(unint64_t)a5 duration:(double)a6
{
  id v11 = (void *)os_transaction_create("com.apple.amp.medialibrary.CacheDeletePurge.Reporting", a2);
  eventReportingQueue = (dispatch_queue_s *)self->_eventReportingQueue;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100007C74;
  v14[3] = &unk_1000249B8;
  double v16 = a6;
  int v19 = a3;
  unint64_t v17 = a4;
  unint64_t v18 = a5;
  v14[4] = self;
  id v15 = v11;
  id v13 = v11;
  dispatch_async(eventReportingQueue, v14);
}

- (void)_reportCacheDeletePurgeableRequestWithUrgency:(int)a3 purgeableAmount:(unint64_t)a4 duration:(double)a5
{
  BOOL v9 = (void *)os_transaction_create("com.apple.amp.medialibrary.CacheDeletePurgeable.Reporting", a2);
  uint64_t v10 = a3;
  eventReportingQueue = (dispatch_queue_s *)self->_eventReportingQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100007A68;
  block[3] = &unk_100024A08;
  double v15 = fabs(a5);
  uint64_t v16 = v10;
  unint64_t v17 = a4;
  block[4] = self;
  id v14 = v9;
  id v12 = v9;
  dispatch_async(eventReportingQueue, block);
}

- (void)_addOptimizeStorageAnalyticsToPayload:(id)a3
{
  id v6 = a3;
  id v3 = +[ML3MusicLibrary shouldOptimizeStorage](&OBJC_CLASS___ML3MusicLibrary, "shouldOptimizeStorage");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v3));
  [v6 setObject:v4 forKeyedSubscript:@"OptimizeStorageEnabled"];

  if ((_DWORD)v3)
  {
    int v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  +[ML3MusicLibrary minimumPurgeableStorage]( &OBJC_CLASS___ML3MusicLibrary,  "minimumPurgeableStorage")));
    [v6 setObject:v5 forKeyedSubscript:@"OptimizeStorageSetting"];
  }
}

- (void)_addUsageAnalytics:(id *)a3 toPayload:(id)a4
{
  id v14 = a4;
  int v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  a3->var0 >> 20));
  [v14 setObject:v5 forKeyedSubscript:@"MBTotalRedownloadablePinned"];

  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  a3->var1 >> 20));
  [v14 setObject:v6 forKeyedSubscript:@"MBNonRedownloadable"];

  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  a3->var2 >> 20));
  [v14 setObject:v7 forKeyedSubscript:@"MBArtwork"];

  unint64_t var3 = a3->var3;
  if (var3) {
    uint64_t v9 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", var3 >> 20));
  }
  else {
    uint64_t v9 = objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  uint64_t v10 = (void *)v9;
  [v14 setObject:v9 forKeyedSubscript:@"MBTotal"];

  unint64_t var4 = a3->var4;
  if (var4) {
    uint64_t v12 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", var4 >> 20));
  }
  else {
    uint64_t v12 = objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  id v13 = (void *)v12;
  [v14 setObject:v12 forKeyedSubscript:@"MBFree"];
}

- (void)_addPurgeAnalytics:(id *)a3 toPayload:(id)a4
{
  double var0 = a3->var0;
  id v6 = a4;
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", var0));
  [v6 setObject:v7 forKeyedSubscript:@"Duration"];

  int v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  a3->var1));
  [v6 setObject:v8 forKeyedSubscript:@"Urgency"];

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  a3->var2 >> 20));
  [v6 setObject:v9 forKeyedSubscript:@"MBRequested"];

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  a3->var3 >> 20));
  [v6 setObject:v10 forKeyedSubscript:@"MBPurged"];

  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  (a3->var4 + a3->var3) >> 20));
  [v6 setObject:v11 forKeyedSubscript:@"MBPurgeableBefore"];

  id v12 = (id)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  a3->var4 >> 20));
  [v6 setObject:v12 forKeyedSubscript:@"MBPurgeableAfter"];
}

- (void)_addPurgeableAnalytics:(id *)a3 toPayload:(id)a4
{
  double var0 = a3->var0;
  id v6 = a4;
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", var0));
  [v6 setObject:v7 forKeyedSubscript:@"Duration"];

  int v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  a3->var1));
  [v6 setObject:v8 forKeyedSubscript:@"Urgency"];

  id v9 = (id)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  a3->var2 >> 20));
  [v6 setObject:v9 forKeyedSubscript:@"MBPurgeableReported"];
}

- (void).cxx_destruct
{
}

+ (unint64_t)_cacheDeleteUrgencyToMusicLibraryUrgency:(int)a3
{
  uint64_t v3 = (a3 - 2);
  else {
    return 0LL;
  }
}

@end