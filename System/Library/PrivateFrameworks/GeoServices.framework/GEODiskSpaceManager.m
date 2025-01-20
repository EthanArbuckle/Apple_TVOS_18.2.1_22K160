@interface GEODiskSpaceManager
+ (GEODiskSpaceManager)sharedManager;
- (GEODiskSpaceManager)init;
- (GEODiskSpaceManager)initWithCacheDeleteID:(id)a3;
- (NSString)cacheDeleteID;
- (id)_validVolume:(id)a3;
- (id)diskSpaceProviderForIdentifier:(id)a3;
- (unint64_t)freePurgableDiskSpace:(unint64_t)a3 urgency:(int)a4;
- (unint64_t)purgableDiskSpaceForUrgency:(int)a3;
- (void)_registerCacheDeleteCallbacks;
- (void)addDiskSpaceProvider:(id)a3;
- (void)reportSignificantPurgableDiskSpaceUpdate;
@end

@implementation GEODiskSpaceManager

+ (GEODiskSpaceManager)sharedManager
{
  if (qword_10006B028 != -1) {
    dispatch_once(&qword_10006B028, &stru_100059F58);
  }
  return (GEODiskSpaceManager *)(id)qword_10006B020;
}

- (GEODiskSpaceManager)init
{
  result = (GEODiskSpaceManager *)+[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GEOMethodNotAvailableException",  @"This method is unavailable.");
  __break(1u);
  return result;
}

- (GEODiskSpaceManager)initWithCacheDeleteID:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___GEODiskSpaceManager;
  v5 = -[GEODiskSpaceManager init](&v9, "init");
  if (v5)
  {
    v6 = (NSString *)[v4 copy];
    cacheDeleteID = v5->_cacheDeleteID;
    v5->_cacheDeleteID = v6;

    -[GEODiskSpaceManager _registerCacheDeleteCallbacks](v5, "_registerCacheDeleteCallbacks");
  }

  return v5;
}

- (id)_validVolume:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[GEOFilePaths urlFor:](&OBJC_CLASS___GEOFilePaths, "urlFor:", 4LL));
  v5 = v4;
  if (v4)
  {
    id v14 = 0LL;
    unsigned int v6 = [v4 getResourceValue:&v14 forKey:NSURLVolumeURLKey error:0];
    id v7 = v14;
    if (v6)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"]);
      objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v8));
      if ([v9 isEqual:v7])
      {
        id v10 = v8;
      }

      else
      {
        uint64_t Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "GEODiskSpaceManager");
        v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138477827;
          v16 = v8;
          _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "Asked about a volume (%{private}@) we don't control.",  buf,  0xCu);
        }

        id v10 = 0LL;
      }
    }

    else
    {
      id v10 = 0LL;
    }
  }

  else
  {
    id v10 = 0LL;
  }

  return v10;
}

- (void)_registerCacheDeleteCallbacks
{
  uint64_t v3 = DefaultLoggingSubsystem;
  uint64_t Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "GEODiskSpaceManager");
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "Registering cache delete callbacks.",  (uint8_t *)buf,  2u);
  }

  objc_initWeak(buf, self);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100022A80;
  v17[3] = &unk_100059F80;
  objc_copyWeak(&v18, buf);
  unsigned int v6 = objc_retainBlock(v17);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100022C0C;
  v15[3] = &unk_100059F80;
  objc_copyWeak(&v16, buf);
  id v7 = objc_retainBlock(v15);
  if (CacheDeleteRegisterInfoCallbacks(self->_cacheDeleteID, v6, v7, 0LL, 0LL))
  {
    uint64_t v8 = GEOFindOrCreateLog(v3, "GEODiskSpaceManager");
    objc_super v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v14 = 0;
      id v10 = "Cache delete callback registration failed!";
      v11 = v9;
      os_log_type_t v12 = OS_LOG_TYPE_ERROR;
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v11, v12, v10, v14, 2u);
    }
  }

  else
  {
    uint64_t v13 = GEOFindOrCreateLog(v3, "GEODiskSpaceManager");
    objc_super v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id v14 = 0;
      id v10 = "Cache delete callback registration succeeded.";
      v11 = v9;
      os_log_type_t v12 = OS_LOG_TYPE_DEBUG;
      goto LABEL_8;
    }
  }

  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);
  objc_destroyWeak(buf);
}

- (void)addDiskSpaceProvider:(id)a3
{
  id v8 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  diskSpaceProviders = v4->_diskSpaceProviders;
  if (!diskSpaceProviders)
  {
    unsigned int v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    id v7 = v4->_diskSpaceProviders;
    v4->_diskSpaceProviders = v6;

    diskSpaceProviders = v4->_diskSpaceProviders;
  }

  -[NSMutableArray addObject:](diskSpaceProviders, "addObject:", v8);
  v4->_cachedPurgableTime[0] = 2.56734753e-289;
  objc_sync_exit(v4);
}

- (id)diskSpaceProviderForIdentifier:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  unsigned int v6 = v5->_diskSpaceProviders;
  id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier", (void)v14));
        unsigned int v12 = [v11 isEqualToString:v4];

        if (v12)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }

      id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
      if (v7) {
        continue;
      }
      break;
    }
  }

- (void)reportSignificantPurgableDiskSpaceUpdate
{
  obj = self;
  objc_sync_enter(obj);
  double Current = CFAbsoluteTimeGetCurrent();
  if (Current - obj->_lastSignificantUpdate < 60.0)
  {
    objc_sync_exit(obj);
  }

  else
  {
    obj->_lastSignificantUpdate = Current;
    obj->_cachedPurgableTime[0] = 2.56734753e-289;
    objc_sync_exit(obj);

    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[GEODiskSpaceManager _validVolume:](obj, "_validVolume:", 0LL));
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    uint64_t v5 = 1LL;
    unsigned int v6 = obj;
    do
    {
      id v7 = -[GEODiskSpaceManager purgableDiskSpaceForUrgency:](v6, "purgableDiskSpaceForUrgency:", v5, obj);
      if (v7)
      {
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v7));
        objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v5));
        [v4 setObject:v8 forKey:v9];
      }

      uint64_t v5 = (v5 + 1);
      unsigned int v6 = obj;
    }

    while ((_DWORD)v5 != 5);
    cacheDeleteID = obj->_cacheDeleteID;
    v13[0] = @"CACHE_DELETE_ID";
    v13[1] = @"CACHE_DELETE_VOLUME";
    v14[0] = cacheDeleteID;
    v14[1] = v3;
    v13[2] = @"CACHE_DELETE_AMOUNT";
    v14[2] = v4;
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v14,  v13,  3LL));
    CacheDeleteUpdatePurgeable();
  }

- (unint64_t)purgableDiskSpaceForUrgency:(int)a3
{
  double Current = CFAbsoluteTimeGetCurrent();
  unsigned int v6 = self;
  objc_sync_enter(v6);
  cachedPurgableTime = v6->_cachedPurgableTime;
  if (Current - v6->_cachedPurgableTime[a3] < 60.0)
  {
    unint64_t v10 = v6->_cachedPurgableSpace[a3];
    objc_sync_exit(v6);
  }

  else
  {
    objc_sync_exit(v6);

    uint64_t v14 = 0LL;
    __int128 v15 = &v14;
    uint64_t v16 = 0x2020000000LL;
    uint64_t v17 = 0LL;
    diskSpaceProviders = v6->_diskSpaceProviders;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1000232FC;
    v12[3] = &unk_100059FA8;
    int v13 = a3;
    v12[4] = v6;
    v12[5] = &v14;
    -[NSMutableArray enumerateObjectsWithOptions:usingBlock:]( diskSpaceProviders,  "enumerateObjectsWithOptions:usingBlock:",  1LL,  v12);
    objc_super v9 = v6;
    objc_sync_enter(v9);
    cachedPurgableTime[a3] = Current;
    v9->_cachedPurgableSpace[a3] = v15[3];
    objc_sync_exit(v9);

    unint64_t v10 = v15[3];
    _Block_object_dispose(&v14, 8);
  }

  return v10;
}

- (unint64_t)freePurgableDiskSpace:(unint64_t)a3 urgency:(int)a4
{
  uint64_t v13 = 0LL;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000LL;
  uint64_t v16 = 0LL;
  unsigned int v6 = self;
  objc_sync_enter(v6);
  if (v6->_freePurgableInProgress)
  {
    objc_sync_exit(v6);

    unint64_t v7 = 0LL;
  }

  else
  {
    v6->_freePurgableInProgress = 1;
    objc_sync_exit(v6);

    diskSpaceProviders = v6->_diskSpaceProviders;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_100023478;
    v11[3] = &unk_100059FD0;
    v11[5] = &v13;
    v11[6] = a3;
    int v12 = a4;
    v11[4] = v6;
    -[NSMutableArray enumerateObjectsWithOptions:usingBlock:]( diskSpaceProviders,  "enumerateObjectsWithOptions:usingBlock:",  1LL,  v11);
    objc_super v9 = v6;
    objc_sync_enter(v9);
    v6->_freePurgableInProgress = 0;
    objc_sync_exit(v9);

    unint64_t v7 = v14[3];
  }

  _Block_object_dispose(&v13, 8);
  return v7;
}

- (NSString)cacheDeleteID
{
  return self->_cacheDeleteID;
}

- (void).cxx_destruct
{
}

@end