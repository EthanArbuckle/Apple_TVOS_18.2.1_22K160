@interface GEOPDPlaceCache
- (BOOL)_deleteAndResetDB:(id)a3;
- (BOOL)_meetsManifestVersionPolicyForPlace:(id)a3;
- (BOOL)_validateDBLocaleAndResetIfNecessary;
- (GEOPDPlaceCache)initWithCacheFilePath:(id)a3 schedulingDelegate:(id)a4 manifestInfoProvider:(id)a5;
- (NSArray)serviceVersions;
- (id)_cacheKeyForHandle:(id)a3;
- (id)_cacheKeysForPlace:(id)a3 request:(id)a4;
- (id)internalSerialQueue;
- (id)lookupIdentifierByPhoneNumber:(id)a3;
- (int64_t)currentTime;
- (unint64_t)_calculateFreeableSpace;
- (unint64_t)_shrinkBySize:(unint64_t)a3;
- (unint64_t)calculateFreeableSpaceSync;
- (unint64_t)shrinkBySizeSync:(unint64_t)a3;
- (void)_evictPlaceWithHash:(id)a3;
- (void)_iterateAllKeysFilteringCacheKeyWithPredicate:(id)a3 entryBlock:(id)a4 finishedBlock:(id)a5;
- (void)_iterateAllPlacesFilteringCacheKeyWithPredicate:(id)a3 entryBlock:(id)a4 finishedBlock:(id)a5;
- (void)_localeChanged:(id)a3;
- (void)_lookupPlaceByRequestKey:(id)a3 allowExpiredPlace:(BOOL)a4 resultBlock:(id)a5;
- (void)_storePlace:(id)a3 withHash:(id)a4 forRequestKeys:(id)a5;
- (void)calculateFreeableSpaceWithHandler:(id)a3;
- (void)cancelCleanupBlockSchedule;
- (void)close;
- (void)dealloc;
- (void)deletePhoneNumberMapping;
- (void)enqueueAccessTimeUpdateForCacheKey:(id)a3 accessTime:(int64_t)a4;
- (void)evictAllEntries;
- (void)iterateAllBasemapIdKeysWithBlock:(id)a3 finishedBlock:(id)a4;
- (void)iterateAllHandleKeysWithBlock:(id)a3 finishedBlock:(id)a4;
- (void)iterateAllKeysWithBlock:(id)a3 finishedBlock:(id)a4;
- (void)iterateAllMUIDKeysWithBlock:(id)a3 finishedBlock:(id)a4;
- (void)iterateAllPhoneKeysWithBlock:(id)a3 finishedBlock:(id)a4;
- (void)iterateAllPlacesWithBlock:(id)a3 finishedBlock:(id)a4;
- (void)iterateBasemapIdPlacesWithBlock:(id)a3 finishedBlock:(id)a4;
- (void)iterateHandlePlacesWithBlock:(id)a3 finishedBlock:(id)a4;
- (void)iterateMUIDPlacesWithBlock:(id)a3 finishedBlock:(id)a4;
- (void)iteratePhonePlacesWithBlock:(id)a3 finishedBlock:(id)a4;
- (void)lookupPlaceByHandle:(id)a3 allowExpired:(BOOL)a4 resultBlock:(id)a5;
- (void)lookupPlaceByIdentifier:(id)a3 allowExpired:(BOOL)a4 resultBlock:(id)a5;
- (void)lookupPlaceByPhoneNumber:(id)a3 allowExpired:(BOOL)a4 resultBlock:(id)a5;
- (void)lookupPlaceByRequest:(id)a3 allowExpired:(BOOL)a4 resultBlock:(id)a5;
- (void)periodicCleanupAndAccessTimeUpdate;
- (void)runCleanupBlock:(id)a3 inSecondsFromNow:(int64_t)a4;
- (void)scheduleCleanup;
- (void)shrinkBySize:(unint64_t)a3 finished:(id)a4;
- (void)storePlace:(id)a3 forRequest:(id)a4;
- (void)storePlace:(id)a3 forRequest:(id)a4 completionQueue:(id)a5 completion:(id)a6;
- (void)trackPlace:(id)a3;
- (void)trackPlace:(id)a3 completionQueue:(id)a4 completion:(id)a5;
@end

@implementation GEOPDPlaceCache

- (GEOPDPlaceCache)initWithCacheFilePath:(id)a3 schedulingDelegate:(id)a4 manifestInfoProvider:(id)a5
{
  id v8 = a3;
  v9 = (GEOPDPlaceCache *)a4;
  v10 = (GEOPDPlaceCache *)a5;
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___GEOPDPlaceCache;
  v11 = -[GEOPDPlaceCache init](&v27, "init");
  if (v11)
  {
    v12 = objc_alloc(&OBJC_CLASS___GEOSQLiteDB);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_10000BF88;
    v25[3] = &unk_100059408;
    v13 = v11;
    v26 = v13;
    v14 = -[GEOSQLiteDB initWithQueueName:logFacility:dbFilePath:sqliteFlags:pragmas:setupBlock:]( v12,  "initWithQueueName:logFacility:dbFilePath:sqliteFlags:pragmas:setupBlock:",  "com.apple.geo.pdplacecache",  "GEOPDPlaceCache",  v8,  3145728LL,  0LL,  v25);
    db = v13->_db;
    v13->_db = v14;

    if (v9) {
      v16 = v9;
    }
    else {
      v16 = v13;
    }
    objc_storeWeak((id *)&v13->_schedulingDelegate, v16);
    if (v10) {
      v17 = v10;
    }
    else {
      v17 = v13;
    }
    objc_storeWeak((id *)&v13->_manifestInfoProvider, v17);
    uint64_t v18 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    accessTimesDict = v13->_accessTimesDict;
    v13->_accessTimesDict = (NSMutableDictionary *)v18;

    cleanupTimer = v13->_cleanupTimer;
    v13->_cleanupTimer = 0LL;

    if (GEOConfigGetBOOL( GeoServicesConfig_PDPlaceCacheShouldUseRecentlySeenPlaceFilter[0],  GeoServicesConfig_PDPlaceCacheShouldUseRecentlySeenPlaceFilter[1]))
    {
      uint64_t v21 = objc_claimAutoreleasedReturnValue( +[NSMutableOrderedSet orderedSetWithCapacity:]( &OBJC_CLASS___NSMutableOrderedSet,  "orderedSetWithCapacity:",  100LL));
      recentlySeenPlaceHashes = v13->_recentlySeenPlaceHashes;
      v13->_recentlySeenPlaceHashes = (NSMutableOrderedSet *)v21;
    }

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v23 addObserver:v13 selector:"_localeChanged:" name:NSCurrentLocaleDidChangeNotification object:0];
  }

  return v11;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___GEOPDPlaceCache;
  -[GEOPDPlaceCache dealloc](&v4, "dealloc");
}

- (void)_localeChanged:(id)a3
{
  id v4 = a3;
  v8[0] = 0LL;
  v8[1] = v8;
  v8[2] = 0x3032000000LL;
  v8[3] = sub_10000C288;
  v8[4] = sub_10000C298;
  uint64_t v5 = _GEOCreateTransaction("com.apple.geo.placecache.localeChanged");
  id v9 = (id)objc_claimAutoreleasedReturnValue(v5);
  db = self->_db;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10000C2A0;
  v7[3] = &unk_100059430;
  v7[4] = self;
  v7[5] = v8;
  -[GEOSQLiteDB executeAsync:](db, "executeAsync:", v7);
  _Block_object_dispose(v8, 8);
}

- (BOOL)_validateDBLocaleAndResetIfNecessary
{
  id v3 = sub_10000C5A0();
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v18 = 0LL;
  v19 = &v18;
  uint64_t v20 = 0x3032000000LL;
  uint64_t v21 = sub_10000C288;
  v22 = sub_10000C298;
  id v23 = 0LL;
  db = self->_db;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10000C5E0;
  v17[3] = &unk_100059458;
  v17[4] = &v18;
  v6 = db;
  v7 = v17;
  v24[0] = 0LL;
  v24[1] = v24;
  v24[2] = 0x3032000000LL;
  v24[3] = sub_10000C288;
  v24[4] = sub_10000C298;
  id v25 = 0LL;
  *(void *)buf = _NSConcreteStackBlock;
  *(void *)&buf[8] = 3221225472LL;
  *(void *)&buf[16] = sub_100011B2C;
  objc_super v27 = &unk_100059778;
  id v8 = v6;
  v28 = v8;
  id v9 = v7;
  id v29 = v9;
  v30 = v24;
  -[GEOSQLiteDB statementForKey:statementBlock:](v8, "statementForKey:statementBlock:", @"GetValue", buf);

  _Block_object_dispose(v24, 8);
  if ([(id)v19[5] isEqual:v4])
  {
    uint64_t Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "GEOPDPlaceCache");
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = v19[5];
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v4;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Locale did not change. %@ == %@", buf, 0x16u);
    }

    BOOL v13 = 1;
  }

  else
  {
    uint64_t v14 = GEOFindOrCreateLog(DefaultLoggingSubsystem, "GEOPDPlaceCache");
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "Locale changed. Dropping all cached data",  buf,  2u);
    }

    BOOL v13 = -[GEOPDPlaceCache _deleteAndResetDB:](self, "_deleteAndResetDB:", v4);
  }

  _Block_object_dispose(&v18, 8);

  return v13;
}

- (BOOL)_deleteAndResetDB:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v5 = sub_10000C5A0();
    id v4 = (id)objc_claimAutoreleasedReturnValue(v5);
  }

  -[NSMutableOrderedSet removeAllObjects](self->_recentlySeenPlaceHashes, "removeAllObjects");
  db = self->_db;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GEOSQLiteDB log](db, "log"));
  sub_10000C0C0(db, 1);

  if (!-[GEOSQLiteDB createTable:withDrop:]( self->_db,  "createTable:withDrop:",  "CREATE TABLE IF NOT EXISTS pdplaces (pdplacehash TEXT PRIMARY KEY NOT NULL, expiretime INT NOT N ULL, pdplace BLOB NOT NULL);",
                        "DROP TABLE pdplaces"))
    goto LABEL_8;
  if (!-[GEOSQLiteDB createTable:withDrop:]( self->_db,  "createTable:withDrop:",  "CREATE TABLE IF NOT EXISTS pdplacelookup (requestkey TEXT PRIMARY KEY NOT NULL, pdplacehash TEXT NOT NULL, lastaccesstime INT NOT NULL);",
                        "DROP TABLE pdplacelookup"))
    goto LABEL_8;
  id v8 = self->_db;
  id v9 = v4;
  v19[0] = 0LL;
  v19[1] = v19;
  v19[2] = 0x3032000000LL;
  v19[3] = sub_10000C288;
  v19[4] = sub_10000C298;
  id v20 = 0LL;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100011BFC;
  v15[3] = &unk_1000597A0;
  v10 = v8;
  v16 = v10;
  id v11 = v9;
  id v17 = v11;
  uint64_t v18 = v19;
  unsigned int v12 = -[GEOSQLiteDB executeStatement:statementBlock:]( v10,  "executeStatement:statementBlock:",  @"SetLocale",  v15);

  _Block_object_dispose(v19, 8);
  if (v12)
  {
    -[GEOSQLiteDB setUser_version:](self->_db, "setUser_version:", 2LL);
    BOOL v13 = 1;
  }

  else
  {
LABEL_8:
    BOOL v13 = 0;
  }

  return v13;
}

- (BOOL)_meetsManifestVersionPolicyForPlace:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_manifestInfoProvider);
  v6 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained serviceVersions]);

  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v21 = self;
    uint64_t v10 = *(void *)v24;
    uint64_t v11 = DefaultLoggingSubsystem;
    while (2)
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(v7);
        }
        unsigned __int8 v13 = [v4 meetsManifestVersioningForServiceVersion:*(void *)(*((void *)&v23 + 1) + 8 * (void)i)];
        uint64_t Log = GEOFindOrCreateLog(v11, "GEOPDPlaceCache");
        v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
        BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);
        if ((v13 & 1) == 0)
        {
          if (v16)
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEBUG,  "place does not meet service version requirement",  buf,  2u);
          }

          recentlySeenPlaceHashes = v21->_recentlySeenPlaceHashes;
          v19 = (void *)objc_claimAutoreleasedReturnValue([v4 cacheKey]);
          -[NSMutableOrderedSet removeObject:](recentlySeenPlaceHashes, "removeObject:", v19);

          BOOL v17 = 0;
          goto LABEL_15;
        }

        if (v16)
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEBUG,  "place meets service version requirement",  buf,  2u);
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  BOOL v17 = 1;
LABEL_15:

  return v17;
}

- (void)_storePlace:(id)a3 withHash:(id)a4 forRequestKeys:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = DefaultLoggingSubsystem;
  uint64_t Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "GEOPDPlaceCache");
  unsigned __int8 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, (const char *)&unk_10004E833, buf, 2u);
  }

  uint64_t v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[GEOSQLiteDB isolationQueue](self->_db, "isolationQueue"));
  dispatch_assert_queue_V2(v14);

  if (-[GEOPDPlaceCache _meetsManifestVersionPolicyForPlace:](self, "_meetsManifestVersionPolicyForPlace:", v8))
  {
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 cacheKey]);
    if (-[NSMutableOrderedSet containsObject:](self->_recentlySeenPlaceHashes, "containsObject:", v15))
    {
      uint64_t v16 = GEOFindOrCreateLog(v11, "GEOPDPlaceCache");
      BOOL v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138477827;
        v48 = v15;
        uint64_t v18 = "place exists in recentlySeenPlaces set (%{private}@); will not store";
        v19 = v17;
        uint32_t v20 = 12;
LABEL_14:
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, v18, buf, v20);
      }
    }

    else
    {
      -[NSMutableOrderedSet addObject:](self->_recentlySeenPlaceHashes, "addObject:", v15);
      unsigned int v22 = [v8 minTTL];
      if (GEOConfigGetInteger( GeoServicesConfig_PDPlaceCacheMinimumTTLToStore[0],  GeoServicesConfig_PDPlaceCacheMinimumTTLToStore[1]) <= v22)
      {
        uint64_t v25 = v22;
        id v26 = [v8 copyWithoutETAComponents];
        objc_super v27 = (void *)objc_claimAutoreleasedReturnValue([v26 data]);

        [v8 firstSeenTimestamp];
        double v29 = v28;
        id WeakRetained = objc_loadWeakRetained((id *)&self->_schedulingDelegate);
        double v31 = (double)(uint64_t)[WeakRetained currentTime];

        if (v29 == 0.0) {
          double v32 = v31;
        }
        else {
          double v32 = v29;
        }
        db = self->_db;
        v37 = _NSConcreteStackBlock;
        uint64_t v38 = 3221225472LL;
        v39 = sub_10000CDC0;
        v40 = &unk_1000594A8;
        v41 = self;
        uint64_t v45 = (uint64_t)v32 + v25;
        id v42 = v9;
        id v43 = v27;
        id v44 = v10;
        double v46 = v31;
        BOOL v17 = v27;
        LOBYTE(db) = -[GEOSQLiteDB executeInTransaction:](db, "executeInTransaction:", &v37);
        uint64_t v34 = GEOFindOrCreateLog(v11, "GEOPDPlaceCache");
        v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
        BOOL v36 = os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG);
        if ((db & 1) != 0)
        {
          if (v36)
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEBUG, "place was stored successfully", buf, 2u);
          }

          -[GEOPDPlaceCache scheduleCleanup]( self,  "scheduleCleanup",  v37,  v38,  v39,  v40,  v41,  v42,  v43,  v44,  v45,  *(void *)&v46);
        }

        else
        {
          if (v36)
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEBUG, "place failed to be stored", buf, 2u);
          }
        }

        goto LABEL_26;
      }

      uint64_t v23 = GEOFindOrCreateLog(v11, "GEOPDPlaceCache");
      BOOL v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        int Integer = GEOConfigGetInteger( GeoServicesConfig_PDPlaceCacheMinimumTTLToStore[0],  GeoServicesConfig_PDPlaceCacheMinimumTTLToStore[1]);
        *(_DWORD *)buf = 67109120;
        LODWORD(v48) = Integer;
        uint64_t v18 = "place has a minTTL < %d, not writing it down";
        v19 = v17;
        uint32_t v20 = 8;
        goto LABEL_14;
      }
    }

- (id)_cacheKeysForPlace:(id)a3 request:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  if ([v5 shouldCacheByIDForRequest:v6])
  {
    if ([v5 hasMuid])
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@%llu",  @"muid-",  [v5 muid]));
      [v7 addObject:v8];
LABEL_10:

      goto LABEL_11;
    }

    id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 mapsId]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 shardedId]);
    unsigned int v11 = [v10 hasMuid];

    if (v11)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 mapsId]);
      unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v8 shardedId]);
      id v13 = [v12 muid];
      uint64_t v14 = @"muid-";
LABEL_9:
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%llu",  v14,  v13));
      [v7 addObject:v18];

      goto LABEL_10;
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue([v5 mapsId]);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 shardedId]);
    unsigned int v17 = [v16 hasBasemapId];

    if (v17)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 mapsId]);
      unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v8 shardedId]);
      id v13 = [v12 basemapId];
      uint64_t v14 = @"bmid-";
      goto LABEL_9;
    }
  }

- (id)_cacheKeyForHandle:(id)a3
{
  uint64_t v7 = 0LL;
  uint64_t v8 = 0LL;
  id v3 = a3;
  id v4 = [v3 bytes];
  id v5 = [v3 length];

  _GEOMurmurHash3_128_realign(v4, v5, 7LL, &v7);
  return (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%llx%llx",  @"hndl-",  v7,  v8));
}

- (void)trackPlace:(id)a3
{
  uint64_t v4 = DefaultLoggingSubsystem;
  id v5 = a3;
  uint64_t Log = GEOFindOrCreateLog(v4, "GEOPDPlaceCache");
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, (const char *)&unk_10004E833, v8, 2u);
  }

  -[GEOPDPlaceCache trackPlace:completionQueue:completion:]( self,  "trackPlace:completionQueue:completion:",  v5,  0LL,  0LL);
}

- (void)trackPlace:(id)a3 completionQueue:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = (dispatch_queue_s *)a4;
  id v10 = a5;
  uint64_t v11 = DefaultLoggingSubsystem;
  uint64_t Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "GEOPDPlaceCache");
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, (const char *)&unk_10004E833, buf, 2u);
  }

  if ([v8 isCacheable])
  {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[GEOPDPlaceCache _cacheKeysForPlace:request:](self, "_cacheKeysForPlace:request:", v8, 0LL));
    uint64_t v15 = GEOFindOrCreateLog(v11, "GEOPDPlaceCache");
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "componentsJoinedByString:", @", "));
      *(_DWORD *)buf = 138412290;
      double v29 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "cache keys : %@", buf, 0xCu);
    }

    if ([v14 count])
    {
      db = self->_db;
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472LL;
      v23[2] = sub_10000D9A8;
      v23[3] = &unk_1000594D0;
      v23[4] = self;
      id v24 = v8;
      id v25 = v14;
      id v27 = v10;
      id v26 = v9;
      id v19 = v14;
      -[GEOSQLiteDB executeAsync:](db, "executeAsync:", v23);

LABEL_15:
      goto LABEL_16;
    }
  }

  if (v10)
  {
    global_queue = v9;
    if (!v9) {
      global_queue = (dispatch_queue_s *)geo_get_global_queue(17LL);
    }
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_10000DAA0;
    v21[3] = &unk_1000591E0;
    id v22 = v10;
    dispatch_async(global_queue, v21);
    if (!v9) {

    }
    id v19 = v22;
    goto LABEL_15;
  }

- (void)storePlace:(id)a3 forRequest:(id)a4
{
  uint64_t v6 = DefaultLoggingSubsystem;
  id v7 = a4;
  id v8 = a3;
  uint64_t Log = GEOFindOrCreateLog(v6, "GEOPDPlaceCache");
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, (const char *)&unk_10004E833, v11, 2u);
  }

  -[GEOPDPlaceCache storePlace:forRequest:completionQueue:completion:]( self,  "storePlace:forRequest:completionQueue:completion:",  v8,  v7,  0LL,  0LL);
}

- (void)storePlace:(id)a3 forRequest:(id)a4 completionQueue:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  unsigned int v12 = (dispatch_queue_s *)a5;
  id v13 = a6;
  uint64_t v14 = DefaultLoggingSubsystem;
  uint64_t Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "GEOPDPlaceCache");
  uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, (const char *)&unk_10004E833, buf, 2u);
  }

  if ([v11 shouldConsiderCaching] && objc_msgSend(v10, "isCacheable"))
  {
    id v17 = (id)objc_claimAutoreleasedReturnValue(-[GEOPDPlaceCache _cacheKeysForPlace:request:](self, "_cacheKeysForPlace:request:", v10, v11));
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v11 cacheKey]);
    if (v18) {
      [v17 addObject:v18];
    }
    if (([v10 nilPlace] & 1) == 0)
    {
      id v19 = [[_GEOPlaceDataItem alloc] initWithPlaceData:v10];
      uint32_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[GEOMapItemHandle handleDataForMapItem:]( &OBJC_CLASS___GEOMapItemHandle,  "handleDataForMapItem:",  v19));

      if (v20)
      {
        uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[GEOPDPlaceCache _cacheKeyForHandle:](self, "_cacheKeyForHandle:", v20));
        [v17 addObject:v21];
      }
    }

    uint64_t v22 = GEOFindOrCreateLog(v14, "GEOPDPlaceCache");
    uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      id v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "componentsJoinedByString:", @", "));
      *(_DWORD *)buf = 138477827;
      uint64_t v38 = v24;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "cache keys : %{private}@", buf, 0xCu);
    }

    if ([v17 count])
    {
      id v25 = (void *)objc_claimAutoreleasedReturnValue([v10 pdPlaceCacheKeyForRequest:v11]);
      db = self->_db;
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472LL;
      v31[2] = sub_10000DEE0;
      v31[3] = &unk_1000594F8;
      v31[4] = self;
      id v32 = v10;
      id v33 = v25;
      id v17 = v17;
      id v34 = v17;
      id v36 = v13;
      v35 = v12;
      id v27 = v25;
      -[GEOSQLiteDB executeAsync:](db, "executeAsync:", v31);

LABEL_21:
      goto LABEL_22;
    }

    if (!v13) {
      goto LABEL_22;
    }
LABEL_16:
    global_queue = v12;
    if (!v12) {
      global_queue = (dispatch_queue_s *)geo_get_global_queue(17LL);
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10000DFC0;
    block[3] = &unk_1000591E0;
    id v30 = v13;
    dispatch_async(global_queue, block);
    if (!v12) {

    }
    uint64_t v18 = v30;
    goto LABEL_21;
  }

  id v17 = 0LL;
  if (v13) {
    goto LABEL_16;
  }
LABEL_22:
}

- (void)_lookupPlaceByRequestKey:(id)a3 allowExpiredPlace:(BOOL)a4 resultBlock:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[GEOSQLiteDB isolationQueue](self->_db, "isolationQueue"));
  dispatch_assert_queue_V2(v10);

  id WeakRetained = objc_loadWeakRetained((id *)&self->_schedulingDelegate);
  id v12 = [WeakRetained currentTime];

  double Integer = 0.0;
  if (v6) {
    double Integer = (double)GEOConfigGetInteger( GeoServicesConfig_PDPlaceCacheExpiredPlaceGracePeriodInSeconds[0],  GeoServicesConfig_PDPlaceCacheExpiredPlaceGracePeriodInSeconds[1]);
  }
  if ((-[GEOSQLiteDB prepareStatement:forKey:]( self->_db,  "prepareStatement:forKey:",  "SELECT b.pdplace, b.expiretime, b.pdplacehash FROM pdplacelookup a, pdplaces b WHERE a.requestke y = @requestkey AND       a.pdplacehash = b.pdplacehash AND       b.expiretime > @expiretime;",
                        @"lookupByReqKey") & 1) == 0)
  {
    (*((void (**)(id, void, void, void))v9 + 2))(v9, 0LL, 0LL, 0LL);
    goto LABEL_26;
  }

  uint64_t v14 = (sqlite3_stmt *)-[GEOSQLiteDB statementForKey:](self->_db, "statementForKey:", @"lookupByReqKey");
  db = self->_db;
  id v45 = 0LL;
  unsigned __int8 v16 = -[GEOSQLiteDB bindTextParameter:toValue:inStatement:error:]( db,  "bindTextParameter:toValue:inStatement:error:",  "@requestkey",  v8,  v14,  &v45);
  id v17 = v45;
  if ((v16 & 1) == 0)
  {
    (*((void (**)(id, void, void, void))v9 + 2))(v9, 0LL, 0LL, 0LL);

    goto LABEL_26;
  }

  double v18 = (double)(uint64_t)v12;
  id v19 = self->_db;
  id v44 = v17;
  unsigned __int8 v20 = -[GEOSQLiteDB bindInt64Parameter:toValue:inStatement:error:]( v19,  "bindInt64Parameter:toValue:inStatement:error:",  "@expiretime",  (uint64_t)((double)(uint64_t)v12 - Integer),  v14,  &v44);
  id v21 = v44;

  if ((v20 & 1) == 0)
  {
    (*((void (**)(id, void, void, void))v9 + 2))(v9, 0LL, 0LL, 0LL);
    goto LABEL_25;
  }

  if (sqlite3_step(v14) != 100)
  {
    sqlite3_reset(v14);
    id v23 = 0LL;
    BOOL v26 = 0LL;
    id v29 = 0LL;
    uint64_t v30 = DefaultLoggingSubsystem;
LABEL_21:
    uint64_t Log = GEOFindOrCreateLog(v30, "GEOPDPlaceCache");
    v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEBUG, "no valid place in the cache", buf, 2u);
    }

    (*((void (**)(id, void, BOOL, id))v9 + 2))(v9, 0LL, v26, v23);
    goto LABEL_24;
  }

  id v40 = v21;
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[GEOSQLiteDB blobForColumn:inStatment:](self->_db, "blobForColumn:inStatment:", 0LL, v14));
  id v23 = [v22 length];
  id v24 = -[GEOPDPlace initWithData:](objc_alloc(&OBJC_CLASS___GEOPDPlace), "initWithData:", v22);
  double v25 = (double)(uint64_t)-[GEOSQLiteDB int64ForColumn:inStatment:](self->_db, "int64ForColumn:inStatment:", 1LL, v14);
  BOOL v26 = v18 > v25;
  if (v18 > v25)
  {
    recentlySeenPlaceHashes = self->_recentlySeenPlaceHashes;
    double v28 = (void *)objc_claimAutoreleasedReturnValue(-[GEOPDPlace cacheKey](v24, "cacheKey"));
    -[NSMutableOrderedSet removeObject:](recentlySeenPlaceHashes, "removeObject:", v28);
  }

  id v29 = (id)objc_claimAutoreleasedReturnValue(-[GEOSQLiteDB stringForColumn:inStatment:](self->_db, "stringForColumn:inStatment:", 2LL, v14));

  sqlite3_reset(v14);
  uint64_t v30 = DefaultLoggingSubsystem;
  if (!v24)
  {
LABEL_20:
    id v21 = v40;
    goto LABEL_21;
  }

  uint64_t v31 = GEOFindOrCreateLog(DefaultLoggingSubsystem, "GEOPDPlaceCache");
  id v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEBUG, "found a place in the cache", buf, 2u);
  }

  if (!-[GEOPDPlaceCache _meetsManifestVersionPolicyForPlace:](self, "_meetsManifestVersionPolicyForPlace:", v24))
  {

    uint64_t v35 = GEOFindOrCreateLog(v30, "GEOPDPlaceCache");
    id v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEBUG,  "place does not meet service version requirement",  buf,  2u);
    }

    v37 = self->_db;
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472LL;
    v41[2] = sub_10000E470;
    v41[3] = &unk_100059520;
    v41[4] = self;
    id v29 = v29;
    id v42 = v29;
    -[GEOSQLiteDB executeAsync:](v37, "executeAsync:", v41);

    goto LABEL_20;
  }

  uint64_t v33 = GEOFindOrCreateLog(v30, "GEOPDPlaceCache");
  id v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEBUG,  "place meets service version requirement",  buf,  2u);
  }

  -[GEOPDPlaceCache enqueueAccessTimeUpdateForCacheKey:accessTime:]( self,  "enqueueAccessTimeUpdateForCacheKey:accessTime:",  v8,  (uint64_t)v18);
  (*((void (**)(id, GEOPDPlace *, BOOL, id))v9 + 2))(v9, v24, v18 > v25, v23);

  id v21 = v40;
LABEL_24:

LABEL_25:
LABEL_26:
}

- (void)lookupPlaceByRequest:(id)a3 allowExpired:(BOOL)a4 resultBlock:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 cacheKey]);
  uint64_t v11 = DefaultLoggingSubsystem;
  uint64_t Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "GEOPDPlaceCache");
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG);
  if (v10)
  {
    if (v14)
    {
      LODWORD(buf) = 138477827;
      *(void *)((char *)&buf + 4) = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "using cacheKey '%{private}@' for request",  (uint8_t *)&buf,  0xCu);
    }

    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v34 = 0x3032000000LL;
    uint64_t v35 = sub_10000C288;
    id v36 = sub_10000C298;
    id v37 = 0LL;
    uint64_t v28 = 0LL;
    id v29 = &v28;
    uint64_t v30 = 0x2020000000LL;
    uint64_t v25 = 0LL;
    BOOL v26 = &v25;
    uint64_t v27 = 0x2020000000LL;
    db = self->_db;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_10000E794;
    v19[3] = &unk_100059570;
    v19[4] = self;
    BOOL v24 = a4;
    id v20 = v10;
    p___int128 buf = &buf;
    uint64_t v22 = &v28;
    id v23 = &v25;
    -[GEOSQLiteDB executeSync:](db, "executeSync:", v19);
    uint64_t v16 = GEOFindOrCreateLog(v11, "GEOPDPlaceCache");
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      if (*(void *)(*((void *)&buf + 1) + 40LL)) {
        double v18 = @" ";
      }
      else {
        double v18 = @" nil ";
      }
      *(_DWORD *)uint64_t v31 = 138412290;
      id v32 = v18;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "returning%@place for request", v31, 0xCu);
    }

    (*((void (**)(id, void, void, uint64_t))v9 + 2))( v9,  *(void *)(*((void *)&buf + 1) + 40LL),  *((unsigned __int8 *)v29 + 24),  v26[3]);
    _Block_object_dispose(&v25, 8);
    _Block_object_dispose(&v28, 8);
    _Block_object_dispose(&buf, 8);
  }

  else
  {
    if (v14)
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "request has no cacheKey", (uint8_t *)&buf, 2u);
    }

    (*((void (**)(id, void, void, void))v9 + 2))(v9, 0LL, 0LL, 0LL);
  }
}

- (void)lookupPlaceByPhoneNumber:(id)a3 allowExpired:(BOOL)a4 resultBlock:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@",  @"phNo-",  v8));
  uint64_t v11 = DefaultLoggingSubsystem;
  uint64_t Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "GEOPDPlaceCache");
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138477827;
    *(void *)((char *)&buf + 4) = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "using cacheKey '%{private}@' for request",  (uint8_t *)&buf,  0xCu);
  }

  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v34 = 0x3032000000LL;
  uint64_t v35 = sub_10000C288;
  id v36 = sub_10000C298;
  id v37 = 0LL;
  uint64_t v28 = 0LL;
  id v29 = &v28;
  uint64_t v30 = 0x2020000000LL;
  uint64_t v25 = 0LL;
  BOOL v26 = &v25;
  uint64_t v27 = 0x2020000000LL;
  db = self->_db;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_10000EB34;
  v19[3] = &unk_100059570;
  v19[4] = self;
  id v15 = v10;
  BOOL v24 = a4;
  id v20 = v15;
  p___int128 buf = &buf;
  uint64_t v22 = &v28;
  id v23 = &v25;
  -[GEOSQLiteDB executeSync:](db, "executeSync:", v19);
  uint64_t v16 = GEOFindOrCreateLog(v11, "GEOPDPlaceCache");
  id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    if (*(void *)(*((void *)&buf + 1) + 40LL)) {
      double v18 = @" ";
    }
    else {
      double v18 = @" nil ";
    }
    *(_DWORD *)uint64_t v31 = 138412290;
    id v32 = v18;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "returning%@place for phone number", v31, 0xCu);
  }

  (*((void (**)(id, void, void, uint64_t))v9 + 2))( v9,  *(void *)(*((void *)&buf + 1) + 40LL),  *((unsigned __int8 *)v29 + 24),  v26[3]);
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&buf, 8);
}

- (void)lookupPlaceByIdentifier:(id)a3 allowExpired:(BOOL)a4 resultBlock:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = DefaultLoggingSubsystem;
  uint64_t Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "GEOPDPlaceCache");
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(buf) = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, (const char *)&unk_10004E833, (uint8_t *)&buf, 2u);
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 mapsIdentifier]);
  BOOL v14 = (void *)objc_claimAutoreleasedReturnValue([v13 shardedId]);
  unsigned int v15 = [v14 hasMuid];

  if (v15)
  {
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v8 mapsIdentifier]);
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 shardedId]);
    uint64_t v18 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@%llu",  @"muid-",  [v17 muid]));
LABEL_7:
    uint64_t v22 = (void *)v18;

    uint64_t v23 = GEOFindOrCreateLog(v10, "GEOPDPlaceCache");
    BOOL v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(buf) = 138477827;
      *(void *)((char *)&buf + 4) = v22;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEBUG,  "using cacheKey '%{private}@' for request",  (uint8_t *)&buf,  0xCu);
    }

    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v47 = 0x3032000000LL;
    v48 = sub_10000C288;
    v49 = sub_10000C298;
    id v50 = 0LL;
    uint64_t v41 = 0LL;
    id v42 = &v41;
    uint64_t v43 = 0x2020000000LL;
    uint64_t v38 = 0LL;
    v39 = &v38;
    uint64_t v40 = 0x2020000000LL;
    db = self->_db;
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472LL;
    v32[2] = sub_10000F068;
    v32[3] = &unk_100059570;
    v32[4] = self;
    id v26 = v22;
    BOOL v37 = a4;
    id v33 = v26;
    p___int128 buf = &buf;
    uint64_t v35 = &v41;
    id v36 = &v38;
    -[GEOSQLiteDB executeSync:](db, "executeSync:", v32);
    uint64_t v27 = GEOFindOrCreateLog(v10, "GEOPDPlaceCache");
    uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      if (*(void *)(*((void *)&buf + 1) + 40LL)) {
        id v29 = @" ";
      }
      else {
        id v29 = @" nil ";
      }
      *(_DWORD *)id v44 = 138412290;
      id v45 = v29;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "returning%@place for identifier", v44, 0xCu);
    }

    (*((void (**)(id, void, void, uint64_t))v9 + 2))( v9,  *(void *)(*((void *)&buf + 1) + 40LL),  *((unsigned __int8 *)v42 + 24),  v39[3]);
    _Block_object_dispose(&v38, 8);
    _Block_object_dispose(&v41, 8);
    _Block_object_dispose(&buf, 8);

    goto LABEL_18;
  }

  id v19 = (void *)objc_claimAutoreleasedReturnValue([v8 mapsIdentifier]);
  id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 shardedId]);
  unsigned int v21 = [v20 hasBasemapId];

  if (v21)
  {
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v8 mapsIdentifier]);
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 shardedId]);
    uint64_t v18 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@%llu",  @"bmid-",  [v17 basemapId]));
    goto LABEL_7;
  }

  uint64_t v30 = GEOFindOrCreateLog(v10, "GEOPDPlaceCache");
  uint64_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(buf) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEBUG,  "unable to create cacheKey for request",  (uint8_t *)&buf,  2u);
  }

  (*((void (**)(id, void, void, void))v9 + 2))(v9, 0LL, 0LL, 0LL);
LABEL_18:
}

- (void)lookupPlaceByHandle:(id)a3 allowExpired:(BOOL)a4 resultBlock:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[GEOPDPlaceCache _cacheKeyForHandle:](self, "_cacheKeyForHandle:", v8));
  uint64_t v11 = DefaultLoggingSubsystem;
  uint64_t Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "GEOPDPlaceCache");
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138477827;
    *(void *)((char *)&buf + 4) = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "using cacheKey '%{private}@' for request",  (uint8_t *)&buf,  0xCu);
  }

  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v34 = 0x3032000000LL;
  uint64_t v35 = sub_10000C288;
  id v36 = sub_10000C298;
  id v37 = 0LL;
  uint64_t v28 = 0LL;
  id v29 = &v28;
  uint64_t v30 = 0x2020000000LL;
  uint64_t v25 = 0LL;
  id v26 = &v25;
  uint64_t v27 = 0x2020000000LL;
  db = self->_db;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_10000F3F4;
  v19[3] = &unk_100059570;
  v19[4] = self;
  id v15 = v10;
  BOOL v24 = a4;
  id v20 = v15;
  p___int128 buf = &buf;
  uint64_t v22 = &v28;
  uint64_t v23 = &v25;
  -[GEOSQLiteDB executeSync:](db, "executeSync:", v19);
  uint64_t v16 = GEOFindOrCreateLog(v11, "GEOPDPlaceCache");
  id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    if (*(void *)(*((void *)&buf + 1) + 40LL)) {
      uint64_t v18 = @" ";
    }
    else {
      uint64_t v18 = @" nil ";
    }
    *(_DWORD *)uint64_t v31 = 138412290;
    id v32 = v18;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "returning%@place for handle", v31, 0xCu);
  }

  (*((void (**)(id, void, void, uint64_t))v9 + 2))( v9,  *(void *)(*((void *)&buf + 1) + 40LL),  *((unsigned __int8 *)v29 + 24),  v26[3]);
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&buf, 8);
}

- (id)lookupIdentifierByPhoneNumber:(id)a3
{
  id v4 = a3;
  uint64_t v5 = DefaultLoggingSubsystem;
  uint64_t Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "GEOPDPlaceCache");
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, (const char *)&unk_10004E833, buf, 2u);
  }

  *(void *)__int128 buf = 0LL;
  uint64_t v31 = buf;
  uint64_t v32 = 0x2020000000LL;
  uint64_t v33 = 0LL;
  uint64_t v26 = 0LL;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x2020000000LL;
  uint64_t v29 = 0LL;
  db = self->_db;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_10000F788;
  v22[3] = &unk_100059598;
  v22[4] = self;
  id v9 = v4;
  id v23 = v9;
  BOOL v24 = buf;
  uint64_t v25 = &v26;
  -[GEOSQLiteDB executeSync:](db, "executeSync:", v22);
  if (*((void *)v31 + 3))
  {
    uint64_t v10 = GEOFindOrCreateLog(v5, "GEOPDPlaceCache");
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)unsigned int v21 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "returning muid for phone number", v21, 2u);
    }

    id v12 = objc_alloc(&OBJC_CLASS___GEOMapItemIdentifier);
    id v13 = objc_msgSend(v12, "initWithMUID:resultProviderID:coordinate:", *((void *)v31 + 3), 0, -180.0, -180.0);
LABEL_11:
    id v17 = v13;
    goto LABEL_12;
  }

  if (v27[3])
  {
    uint64_t v14 = GEOFindOrCreateLog(v5, "GEOPDPlaceCache");
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)unsigned int v21 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "returning bmid for phone number", v21, 2u);
    }

    id v16 = objc_alloc(&OBJC_CLASS___GEOMapItemIdentifier);
    id v13 = objc_msgSend(v16, "initWithBasemapId:resultProviderID:coordinate:", v27[3], 0, -180.0, -180.0);
    goto LABEL_11;
  }

  uint64_t v19 = GEOFindOrCreateLog(v5, "GEOPDPlaceCache");
  id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)unsigned int v21 = 0;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "returning nil id for phone number", v21, 2u);
  }

  id v17 = 0LL;
LABEL_12:

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(buf, 8);

  return v17;
}

- (void)calculateFreeableSpaceWithHandler:(id)a3
{
  id v4 = a3;
  uint64_t Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "GEOPDPlaceCache");
  BOOL v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, (const char *)&unk_10004E833, buf, 2u);
  }

  if (v4)
  {
    db = self->_db;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10000FA48;
    v8[3] = &unk_1000595E8;
    v8[4] = self;
    id v9 = v4;
    -[GEOSQLiteDB executeAsync:](db, "executeAsync:", v8);
  }
}

- (unint64_t)calculateFreeableSpaceSync
{
  uint64_t Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "GEOPDPlaceCache");
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, (const char *)&unk_10004E833, buf, 2u);
  }

  *(void *)__int128 buf = 0LL;
  uint64_t v10 = buf;
  uint64_t v11 = 0x2020000000LL;
  uint64_t v12 = 0LL;
  db = self->_db;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10000FBD4;
  v8[3] = &unk_1000591B8;
  v8[4] = self;
  void v8[5] = buf;
  -[GEOSQLiteDB executeSync:](db, "executeSync:", v8);
  unint64_t v6 = *((void *)v10 + 3);
  _Block_object_dispose(buf, 8);
  return v6;
}

- (unint64_t)_calculateFreeableSpace
{
  unint64_t v7 = 0LL;
  int v2 = sqlite3_exec( (sqlite3 *)-[GEOSQLiteDB sqliteDB](self->_db, "sqliteDB"),  "SELECT  SUM(LENGTH(pdplace)) FROM pdplaces;",
         (int (__cdecl *)(void *, int, char **, char **))sub_10000FD00,
         &v7,
         0LL);
  if (v2)
  {
    int v3 = v2;
    uint64_t Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "GEOPDPlaceCache");
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 136380931;
      id v9 = "SELECT  SUM(LENGTH(pdplace)) FROM pdplaces;";
      __int16 v10 = 1024;
      int v11 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "unable to execute SQL %{private}s : error %d",  buf,  0x12u);
    }
  }

  return v7;
}

- (void)shrinkBySize:(unint64_t)a3 finished:(id)a4
{
  id v6 = a4;
  uint64_t Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "GEOPDPlaceCache");
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, (const char *)&unk_10004E833, buf, 2u);
  }

  *(void *)__int128 buf = 0LL;
  id v16 = buf;
  uint64_t v17 = 0x2020000000LL;
  uint64_t v18 = 0LL;
  db = self->_db;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10000FE6C;
  v11[3] = &unk_100059638;
  id v13 = buf;
  unint64_t v14 = a3;
  v11[4] = self;
  id v10 = v6;
  id v12 = v10;
  -[GEOSQLiteDB executeAsync:](db, "executeAsync:", v11);

  _Block_object_dispose(buf, 8);
}

- (unint64_t)shrinkBySizeSync:(unint64_t)a3
{
  uint64_t Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "GEOPDPlaceCache");
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, (const char *)&unk_10004E833, buf, 2u);
  }

  *(void *)__int128 buf = 0LL;
  id v12 = buf;
  uint64_t v13 = 0x2020000000LL;
  uint64_t v14 = 0LL;
  db = self->_db;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100010020;
  v10[3] = &unk_100059660;
  v10[4] = self;
  v10[5] = buf;
  v10[6] = a3;
  -[GEOSQLiteDB executeSync:](db, "executeSync:", v10);
  unint64_t v8 = *((void *)v12 + 3);
  _Block_object_dispose(buf, 8);
  return v8;
}

- (unint64_t)_shrinkBySize:(unint64_t)a3
{
                        @"ascExpire"))
    return 0LL;
  uint64_t v5 = (sqlite3_stmt *)-[GEOSQLiteDB statementForKey:](self->_db, "statementForKey:", @"ascExpire");
  int v6 = 0;
  unint64_t v7 = 0LL;
  do
  {
    if (sqlite3_step(v5) != 100) {
      break;
    }
    ++v6;
    v7 += (int)-[GEOSQLiteDB intForColumn:inStatment:](self->_db, "intForColumn:inStatment:", 0LL, v5);
  }

  while (v7 < a3);
  sqlite3_reset(v5);
  db = self->_db;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10001014C;
  v10[3] = &unk_100059688;
  v10[4] = self;
  int v11 = v6;
  else {
    return 0LL;
  }
}

- (void)deletePhoneNumberMapping
{
  uint64_t Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "GEOPDPlaceCache");
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, (const char *)&unk_10004E833, buf, 2u);
  }

  db = self->_db;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000102C0;
  v6[3] = &unk_100059190;
  v6[4] = self;
  -[GEOSQLiteDB executeSync:](db, "executeSync:", v6);
}

- (void)evictAllEntries
{
  uint64_t Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "GEOPDPlaceCache");
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, (const char *)&unk_10004E833, buf, 2u);
  }

  db = self->_db;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100010448;
  v6[3] = &unk_100059190;
  v6[4] = self;
  -[GEOSQLiteDB executeSync:](db, "executeSync:", v6);
}

- (void)enqueueAccessTimeUpdateForCacheKey:(id)a3 accessTime:(int64_t)a4
{
  id v6 = a3;
  uint64_t Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "GEOPDPlaceCache");
  unint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, (const char *)&unk_10004E833, v13, 2u);
  }

  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[GEOSQLiteDB isolationQueue](self->_db, "isolationQueue"));
  dispatch_assert_queue_V2(v9);

  if (v6)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_accessTimesDict, "setObject:forKeyedSubscript:", v10, v6);

    Udouble Integer = GEOConfigGetUInteger( GeoServicesConfig_PDPlaceCacheAccessCountBeforeUpdate[0],  GeoServicesConfig_PDPlaceCacheAccessCountBeforeUpdate[1]);
    if ((unint64_t)-[NSMutableDictionary count](self->_accessTimesDict, "count") >= UInteger)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_schedulingDelegate);
      [WeakRetained cancelCleanupBlockSchedule];

      -[GEOPDPlaceCache periodicCleanupAndAccessTimeUpdate](self, "periodicCleanupAndAccessTimeUpdate");
    }

    else
    {
      -[GEOPDPlaceCache scheduleCleanup](self, "scheduleCleanup");
    }
  }
}

- (void)scheduleCleanup
{
  uint64_t Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "GEOPDPlaceCache");
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, (const char *)&unk_10004E833, buf, 2u);
  }

  uint64_t Integer = GEOConfigGetInteger( GeoServicesConfig_PDPlaceCacheQuiescentTimeBeforeUpdate[0],  GeoServicesConfig_PDPlaceCacheQuiescentTimeBeforeUpdate[1]);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_schedulingDelegate);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10001073C;
  v7[3] = &unk_100059190;
  v7[4] = self;
  [WeakRetained runCleanupBlock:v7 inSecondsFromNow:Integer];
}

- (void)periodicCleanupAndAccessTimeUpdate
{
  int v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[GEOSQLiteDB isolationQueue](self->_db, "isolationQueue"));
  dispatch_assert_queue_V2(v3);

  id WeakRetained = objc_loadWeakRetained((id *)&self->_schedulingDelegate);
  uint64_t v5 = (const char *)[WeakRetained currentTime];

  uint64_t v6 = DefaultLoggingSubsystem;
  uint64_t Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "GEOPDPlaceCache");
  unint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)__int128 buf = 134217984;
    id v37 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "running at %lld", buf, 0xCu);
  }

  if (-[GEOSQLiteDB prepareStatement:forKey:]( self->_db,  "prepareStatement:forKey:",  "DELETE FROM pdplaces WHERE expiretime < @expiretime;",
                       @"removeExpired"))
  {
    id v9 = -[GEOSQLiteDB statementForKey:](self->_db, "statementForKey:", @"removeExpired");
    if (-[GEOSQLiteDB bindInt64Parameter:toValue:inStatement:error:]( self->_db,  "bindInt64Parameter:toValue:inStatement:error:",  "@expiretime",  v5,  v9,  0LL)) {
      -[GEOSQLiteDB executeStatement:error:](self->_db, "executeStatement:error:", v9, 0LL);
    }
  }

  int v10 = sqlite3_exec( (sqlite3 *)-[GEOSQLiteDB sqliteDB](self->_db, "sqliteDB"),  "DELETE FROM pdplacelookup WHERE requestkey NOT LIKE phNo-% AND pdplacehash NOT IN         (SELECT pdplaceh ash FROM pdplaces);",
          0LL,
          0LL,
          0LL);
  if (v10)
  {
    int v11 = v10;
    uint64_t v12 = GEOFindOrCreateLog(v6, "GEOPDPlaceCache");
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 136380931;
      id v37 = "DELETE FROM pdplacelookup WHERE requestkey NOT LIKE phNo-% AND pdplacehash NOT IN         (SELECT pdplac"
            "ehash FROM pdplaces);";
      __int16 v38 = 1024;
      int v39 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "unable to execute SQL %{private}s : error %d",  buf,  0x12u);
    }
  }

  if ((-[GEOSQLiteDB prepareStatement:forKey:]( self->_db,  "prepareStatement:forKey:",  "UPDATE pdplacelookup SET lastaccesstime = @lastaccesstime WHERE requestkey = @requestkey;",
                        @"updateAccessTime") & 1) == 0)
  {
    uint64_t v14 = GEOFindOrCreateLog(v6, "GEOPDPlaceCache");
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 136380675;
      id v37 = "UPDATE pdplacelookup SET lastaccesstime = @lastaccesstime WHERE requestkey = @requestkey;";
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "unable to prepare SQL \"%{private}s\"",  buf,  0xCu);
    }
  }

  id v16 = (sqlite3_stmt *)-[GEOSQLiteDB statementForKey:](self->_db, "statementForKey:", @"updateAccessTime", v6);
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_accessTimesDict, "allKeys"));
  id v17 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v32;
    do
    {
      for (i = 0LL; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v32 != v19) {
          objc_enumerationMutation(obj);
        }
        uint64_t v21 = *(void *)(*((void *)&v31 + 1) + 8LL * (void)i);
        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_accessTimesDict,  "objectForKeyedSubscript:",  v21));
        id v23 = [v22 longLongValue];

        if (-[GEOSQLiteDB bindInt64Parameter:toValue:inStatement:error:]( self->_db,  "bindInt64Parameter:toValue:inStatement:error:",  "@lastaccesstime",  v23,  v16,  0LL)
          && -[GEOSQLiteDB bindTextParameter:toValue:inStatement:error:]( self->_db,  "bindTextParameter:toValue:inStatement:error:",  "@requestkey",  v21,  v16,  0LL))
        {
          -[GEOSQLiteDB executeStatement:error:](self->_db, "executeStatement:error:", v16, 0LL);
        }
      }

      id v18 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
    }

    while (v18);
  }

  -[NSMutableDictionary removeAllObjects](self->_accessTimesDict, "removeAllObjects");
  uint64_t Integer = GEOConfigGetInteger( GeoServicesConfig_MaxPhoneNumberKeysInPlaceCache[0],  GeoServicesConfig_MaxPhoneNumberKeysInPlaceCache[1]);
  if (-[GEOSQLiteDB prepareStatement:forKey:]( self->_db,  "prepareStatement:forKey:",  "DELETE FROM pdplacelookup WHERE lastaccesstime <      (SELECT lastaccesstime       FROM pdplacelo okup       ORDER BY lastaccesstime ASC LIMIT 1 OFFSET @offset);",
                       @"removeOldPhones"))
  {
    id v16 = (sqlite3_stmt *)-[GEOSQLiteDB statementForKey:](self->_db, "statementForKey:", @"removeOldPhones");
    if (-[GEOSQLiteDB bindInt64Parameter:toValue:inStatement:error:]( self->_db,  "bindInt64Parameter:toValue:inStatement:error:",  "@offset",  Integer,  v16,  0LL)) {
      -[GEOSQLiteDB executeStatement:error:](self->_db, "executeStatement:error:", v16, 0LL);
    }
  }

  sqlite3_reset(v16);
  int v25 = sqlite3_exec( (sqlite3 *)-[GEOSQLiteDB sqliteDB](self->_db, "sqliteDB"),  "DELETE FROM pdplaces WHERE pdplacehash NOT IN (SELECT pdplacehash FROM pdplacelookup);",
          0LL,
          0LL,
          0LL);
  if (v25)
  {
    int v26 = v25;
    uint64_t v27 = GEOFindOrCreateLog(v29, "GEOPDPlaceCache");
    uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 136380931;
      id v37 = "DELETE FROM pdplacelookup WHERE requestkey NOT LIKE phNo-% AND pdplacehash NOT IN         (SELECT pdplac"
            "ehash FROM pdplaces);";
      __int16 v38 = 1024;
      int v39 = v26;
      _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_ERROR,  "unable to execute SQL %{private}s : error %d",  buf,  0x12u);
    }
  }

- (void)_evictPlaceWithHash:(id)a3
{
  id v4 = a3;
  uint64_t Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "GEOPDPlaceCache");
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, (const char *)&unk_10004E833, buf, 2u);
  }

  unint64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[GEOSQLiteDB isolationQueue](self->_db, "isolationQueue"));
  dispatch_assert_queue_V2(v7);

  db = self->_db;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100010CFC;
  v10[3] = &unk_1000596D8;
  v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  -[GEOSQLiteDB executeInTransaction:](db, "executeInTransaction:", v10);
}

- (void)close
{
  db = self->_db;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100010E58;
  v3[3] = &unk_100059190;
  v3[4] = self;
  -[GEOSQLiteDB executeSync:](db, "executeSync:", v3);
}

- (void)_iterateAllPlacesFilteringCacheKeyWithPredicate:(id)a3 entryBlock:(id)a4 finishedBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  db = self->_db;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100010F2C;
  v15[3] = &unk_100059728;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  -[GEOSQLiteDB executeAsync:](db, "executeAsync:", v15);
}

- (void)iterateAllPlacesWithBlock:(id)a3 finishedBlock:(id)a4
{
}

- (void)iterateMUIDPlacesWithBlock:(id)a3 finishedBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"SELF BEGINSWITH %@",  @"muid-"));
  -[GEOPDPlaceCache _iterateAllPlacesFilteringCacheKeyWithPredicate:entryBlock:finishedBlock:]( self,  "_iterateAllPlacesFilteringCacheKeyWithPredicate:entryBlock:finishedBlock:",  v8,  v7,  v6);
}

- (void)iterateBasemapIdPlacesWithBlock:(id)a3 finishedBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"SELF BEGINSWITH %@",  @"bmid-"));
  -[GEOPDPlaceCache _iterateAllPlacesFilteringCacheKeyWithPredicate:entryBlock:finishedBlock:]( self,  "_iterateAllPlacesFilteringCacheKeyWithPredicate:entryBlock:finishedBlock:",  v8,  v7,  v6);
}

- (void)iteratePhonePlacesWithBlock:(id)a3 finishedBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"SELF BEGINSWITH %@",  @"phNo-"));
  -[GEOPDPlaceCache _iterateAllPlacesFilteringCacheKeyWithPredicate:entryBlock:finishedBlock:]( self,  "_iterateAllPlacesFilteringCacheKeyWithPredicate:entryBlock:finishedBlock:",  v8,  v7,  v6);
}

- (void)iterateHandlePlacesWithBlock:(id)a3 finishedBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"SELF BEGINSWITH %@",  @"hndl-"));
  -[GEOPDPlaceCache _iterateAllPlacesFilteringCacheKeyWithPredicate:entryBlock:finishedBlock:]( self,  "_iterateAllPlacesFilteringCacheKeyWithPredicate:entryBlock:finishedBlock:",  v8,  v7,  v6);
}

- (void)_iterateAllKeysFilteringCacheKeyWithPredicate:(id)a3 entryBlock:(id)a4 finishedBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  db = self->_db;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100011420;
  v15[3] = &unk_100059728;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  -[GEOSQLiteDB executeAsync:](db, "executeAsync:", v15);
}

- (void)iterateAllKeysWithBlock:(id)a3 finishedBlock:(id)a4
{
}

- (void)iterateAllMUIDKeysWithBlock:(id)a3 finishedBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"SELF BEGINSWITH %@",  @"muid-"));
  -[GEOPDPlaceCache _iterateAllKeysFilteringCacheKeyWithPredicate:entryBlock:finishedBlock:]( self,  "_iterateAllKeysFilteringCacheKeyWithPredicate:entryBlock:finishedBlock:",  v8,  v7,  v6);
}

- (void)iterateAllBasemapIdKeysWithBlock:(id)a3 finishedBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"SELF BEGINSWITH %@",  @"bmid-"));
  -[GEOPDPlaceCache _iterateAllKeysFilteringCacheKeyWithPredicate:entryBlock:finishedBlock:]( self,  "_iterateAllKeysFilteringCacheKeyWithPredicate:entryBlock:finishedBlock:",  v8,  v7,  v6);
}

- (void)iterateAllPhoneKeysWithBlock:(id)a3 finishedBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"SELF BEGINSWITH %@",  @"phNo-"));
  -[GEOPDPlaceCache _iterateAllKeysFilteringCacheKeyWithPredicate:entryBlock:finishedBlock:]( self,  "_iterateAllKeysFilteringCacheKeyWithPredicate:entryBlock:finishedBlock:",  v8,  v7,  v6);
}

- (void)iterateAllHandleKeysWithBlock:(id)a3 finishedBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"SELF BEGINSWITH %@",  @"hndl-"));
  -[GEOPDPlaceCache _iterateAllKeysFilteringCacheKeyWithPredicate:entryBlock:finishedBlock:]( self,  "_iterateAllKeysFilteringCacheKeyWithPredicate:entryBlock:finishedBlock:",  v8,  v7,  v6);
}

- (id)internalSerialQueue
{
  return -[GEOSQLiteDB isolationQueue](self->_db, "isolationQueue");
}

- (int64_t)currentTime
{
  return (uint64_t)v2;
}

- (void)runCleanupBlock:(id)a3 inSecondsFromNow:(int64_t)a4
{
  id v6 = a3;
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[GEOSQLiteDB isolationQueue](self->_db, "isolationQueue"));
  dispatch_assert_queue_V2(v7);

  uint64_t Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "GEOPDPlaceCache");
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, (const char *)&unk_10004E833, buf, 2u);
  }

  cleanupTimer = self->_cleanupTimer;
  if (cleanupTimer)
  {
    dispatch_source_cancel((dispatch_source_t)cleanupTimer);
    id v11 = self->_cleanupTimer;
    self->_cleanupTimer = 0LL;
  }

  double v12 = (double)a4;
  double v13 = GEO_DISPATCH_TIME_FOREVER;
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[GEOSQLiteDB isolationQueue](self->_db, "isolationQueue"));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_100011978;
  v18[3] = &unk_100059750;
  v18[4] = self;
  id v19 = v6;
  id v15 = v6;
  id v16 = (OS_dispatch_source *)geo_dispatch_timer_create_on_queue(v14, v18, v12, v13, 10.0);
  id v17 = self->_cleanupTimer;
  self->_cleanupTimer = v16;

  dispatch_resume((dispatch_object_t)self->_cleanupTimer);
}

- (void)cancelCleanupBlockSchedule
{
  uint64_t Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "GEOPDPlaceCache");
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, (const char *)&unk_10004E833, v6, 2u);
  }

  dispatch_source_cancel((dispatch_source_t)self->_cleanupTimer);
  cleanupTimer = self->_cleanupTimer;
  self->_cleanupTimer = 0LL;
}

- (NSArray)serviceVersions
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue(+[GEOResourceManifestManager modernManager](&OBJC_CLASS___GEOResourceManifestManager, "modernManager"));
  int v3 = (void *)objc_claimAutoreleasedReturnValue([v2 activeTileGroup]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 versionManifest]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 serviceVersions]);
  id v6 = [v5 copy];

  return (NSArray *)v6;
}

- (void).cxx_destruct
{
}

@end