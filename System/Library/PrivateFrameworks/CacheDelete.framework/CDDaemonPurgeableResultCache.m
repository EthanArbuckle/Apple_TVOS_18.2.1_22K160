@interface CDDaemonPurgeableResultCache
+ (id)defaultPath;
+ (id)fetchVolumeWithPath:(id)a3;
+ (id)pathForVersion:(unint64_t)a3;
+ (id)sharedPurgeableResultsCache;
+ (unint64_t)currentVersion;
- (BOOL)shouldUpdatePurgeable:(id)a3;
- (CDDaemonPurgeableResultCache)initWithPath:(id)a3;
- (CDDaemonRecentInfo)recentPurgeableResults;
- (NSString)path;
- (OS_dispatch_queue)queue;
- (id)copyInvalidServicesForVolume:(id)a3 atUrgency:(id)a4;
- (id)copyPushingServices;
- (id)diagnosticsForVolume:(id)a3 atUrgency:(int)a4;
- (id)emitRecentInfo:(id)a3;
- (id)updatedBlock;
- (id)updatedNotificationBlock;
- (void)absorbRecentInfo:(id)a3;
- (void)addInvalidVolume:(id)a3;
- (void)deductPurgeableAmount:(id)a3 serviceID:(id)a4 volume:(id)a5 urgency:(int)a6;
- (void)forgetPushingService:(id)a3;
- (void)invalidateRecentResultsForVolume:(id)a3;
- (void)keepUpToDate:(id)a3;
- (void)prune;
- (void)prunePreserving:(id)a3;
- (void)removeServiceInfo:(id)a3;
- (void)save:(id)a3;
- (void)setPath:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRecentPurgeableResults:(id)a3;
- (void)setUpdateBlock:(id)a3;
- (void)setUpdateNotificationBlock:(id)a3;
- (void)setUpdatedBlock:(id)a3;
- (void)setUpdatedNotificationBlock:(id)a3;
- (void)updateInvalidVolumes;
- (void)updateRecentInfoForServiceID:(id)a3 volume:(id)a4 info:(id)a5;
- (void)updateRecentStateforVolume:(id)a3;
@end

@implementation CDDaemonPurgeableResultCache

+ (unint64_t)currentVersion
{
  return 2LL;
}

+ (id)pathForVersion:(unint64_t)a3
{
  if (a3 >= 2) {
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"_v%lu", a3));
  }
  else {
    v3 = &stru_10005BF88;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString localizedStringWithFormat:]( &OBJC_CLASS___NSString,  "localizedStringWithFormat:",  @"%@%@",  @"CacheDeleteDaemonRecentInfo",  v3));

  return v4;
}

+ (id)defaultPath
{
  uint64_t v3 = cdCachesPath(a1, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue([a1 pathForVersion:2]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 stringByAppendingPathComponent:v5]);

  return v6;
}

+ (id)sharedPurgeableResultsCache
{
  if (qword_1000667C8 != -1) {
    dispatch_once(&qword_1000667C8, &__block_literal_global_3);
  }
  return (id)_MergedGlobals_1;
}

void __59__CDDaemonPurgeableResultCache_sharedPurgeableResultsCache__block_invoke(id a1)
{
  v1 = objc_alloc(&OBJC_CLASS___CDDaemonPurgeableResultCache);
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[CDDaemonPurgeableResultCache defaultPath](&OBJC_CLASS___CDDaemonPurgeableResultCache, "defaultPath"));
  v2 = -[CDDaemonPurgeableResultCache initWithPath:](v1, "initWithPath:", v4);
  uint64_t v3 = (void *)_MergedGlobals_1;
  _MergedGlobals_1 = (uint64_t)v2;
}

- (CDDaemonPurgeableResultCache)initWithPath:(id)a3
{
  v59 = (__CFString *)a3;
  v62.receiver = self;
  v62.super_class = (Class)&OBJC_CLASS___CDDaemonPurgeableResultCache;
  id v4 = -[CDDaemonPurgeableResultCache init](&v62, "init");
  v5 = v4;
  if (!v4) {
    goto LABEL_31;
  }
  -[CDDaemonPurgeableResultCache setPath:](v4, "setPath:", v59);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CDDaemonPurgeableResultCache path](v5, "path"));

  if (!v6)
  {
    v8 = 0LL;
    v58 = 0LL;
    goto LABEL_21;
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CDDaemonPurgeableResultCache path](v5, "path"));
  id v61 = 0LL;
  v58 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithContentsOfFile:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfFile:options:error:",  v7,  1LL,  &v61));
  v8 = (__CFString *)v61;

  if (!v58 || v8)
  {
LABEL_21:
    NSErrorDomain v32 = (NSErrorDomain)objc_claimAutoreleasedReturnValue(-[__CFString domain](v8, "domain"));
    NSErrorDomain v33 = v32;
    if (v32 == NSPOSIXErrorDomain)
    {
      BOOL v34 = -[__CFString code](v8, "code") == (id)2;

      if (v34) {
        goto LABEL_28;
      }
    }

    else
    {
    }

    uint64_t v35 = CDGetLogHandle("daemon");
    v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      v47 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString description](v8, "description"));
      *(_DWORD *)buf = 138412546;
      v64 = v59;
      __int16 v65 = 2112;
      v66 = v47;
      _os_log_error_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_ERROR,  "Unable to make data from %@ : %@",  buf,  0x16u);
    }

    goto LABEL_27;
  }

  uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSNumber);
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSString);
  uint64_t v12 = objc_opt_class(&OBJC_CLASS___CDDaemonRecentVolumeInfo);
  uint64_t v13 = objc_opt_class(&OBJC_CLASS___CDRecentServiceInfo);
  uint64_t v14 = objc_opt_class(&OBJC_CLASS___CDDaemonRecentInfo);
  v15 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v9,  v10,  v11,  v12,  v13,  v14,  objc_opt_class(&OBJC_CLASS___NSDate),  0LL);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  objc_opt_class(&OBJC_CLASS___CDRecentServiceInfo);
  id v60 = 0LL;
  v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  v16,  v58,  &v60));
  v8 = (__CFString *)v60;
  -[CDDaemonPurgeableResultCache setRecentPurgeableResults:](v5, "setRecentPurgeableResults:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CDDaemonPurgeableResultCache recentPurgeableResults](v5, "recentPurgeableResults"));
  if (v18) {
    BOOL v19 = v8 == 0LL;
  }
  else {
    BOOL v19 = 0;
  }
  int v20 = !v19;

  if (v20)
  {
    uint64_t v21 = CDGetLogHandle("daemon");
    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v48 = @"No error information available";
      if (v8) {
        v48 = v8;
      }
      *(_DWORD *)buf = 138412290;
      v64 = v48;
      _os_log_error_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "NSKeyedUnarchiver unarchivedObjectOfClass failed to unarchive recent purgeable results: %@",  buf,  0xCu);
    }
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[CDDaemonPurgeableResultCache recentPurgeableResults](v5, "recentPurgeableResults"));
  if (!v23) {
    goto LABEL_28;
  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[CDDaemonPurgeableResultCache recentPurgeableResults](v5, "recentPurgeableResults"));
  uint64_t v25 = objc_opt_class(&OBJC_CLASS___CDRecentInfo);
  char isKindOfClass = objc_opt_isKindOfClass(v24, v25);

  if ((isKindOfClass & 1) == 0)
  {
    uint64_t v46 = CDGetLogHandle("daemon");
    v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      v49 = (void *)objc_claimAutoreleasedReturnValue(-[CDDaemonPurgeableResultCache recentPurgeableResults](v5, "recentPurgeableResults"));
      v50 = (__CFString *)objc_opt_class(v49);
      *(_DWORD *)buf = 138412290;
      v64 = v50;
      v51 = v50;
      _os_log_error_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_ERROR,  "result is not of class (or subclass) CacheDeleteRecentInfo: %@",  buf,  0xCu);
    }

    goto LABEL_19;
  }

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[CDDaemonPurgeableResultCache recentPurgeableResults](v5, "recentPurgeableResults"));
  v28 = (void *)objc_claimAutoreleasedReturnValue([v27 version]);
  unsigned __int8 v29 = [v28 isEqualToNumber:&off_10005D478];

  if ((v29 & 1) == 0)
  {
    uint64_t v30 = CDGetLogHandle("daemon");
    v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      v52 = (void *)objc_claimAutoreleasedReturnValue(-[CDDaemonPurgeableResultCache recentPurgeableResults](v5, "recentPurgeableResults"));
      v53 = (objc_class *)objc_opt_class(v52);
      v54 = NSStringFromClass(v53);
      v55 = (__CFString *)objc_claimAutoreleasedReturnValue(v54);
      v56 = (void *)objc_claimAutoreleasedReturnValue(-[CDDaemonPurgeableResultCache recentPurgeableResults](v5, "recentPurgeableResults"));
      v57 = (void *)objc_claimAutoreleasedReturnValue([v56 version]);
      *(_DWORD *)buf = 138412802;
      v64 = v55;
      __int16 v65 = 2112;
      v66 = v57;
      __int16 v67 = 1024;
      int v68 = 2;
      _os_log_error_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_ERROR,  "unarchived version of %@ (%@) is incompatible with current version (%d)",  buf,  0x1Cu);
    }

- (void)save:(id)a3
{
  id v4 = a3;
  v5 = (void *)os_transaction_create("com.apple.cache_delete.saveDaemonRecentInfo");
  v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CDDaemonPurgeableResultCache queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __37__CDDaemonPurgeableResultCache_save___block_invoke;
  block[3] = &unk_100059068;
  id v10 = v5;
  uint64_t v11 = self;
  id v12 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(v6, block);
}

void __37__CDDaemonPurgeableResultCache_save___block_invoke(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) recentPurgeableResults]);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v2,  1LL,  0LL));

  if (v3)
  {
    id v4 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) path]);

    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) path]);
      id v13 = 0LL;
      unsigned __int8 v6 = [v3 writeToFile:v5 options:0 error:&v13];
      id v4 = v13;

      if ((v6 & 1) == 0)
      {
        uint64_t v7 = CDGetLogHandle("daemon");
        id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          id v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) path]);
          *(_DWORD *)buf = 138412546;
          v15 = v12;
          __int16 v16 = 2112;
          id v17 = v4;
          _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "unable to write results to cache file: %@: %@",  buf,  0x16u);
        }
      }

      uint64_t v9 = *(void *)(a1 + 48);
      if (v9) {
        (*(void (**)(void))(v9 + 16))();
      }
    }
  }

  else
  {
    uint64_t v10 = CDGetLogHandle("daemon");
    id v4 = (id)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) recentPurgeableResults]);
      *(_DWORD *)buf = 138412290;
      v15 = v11;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v4,  OS_LOG_TYPE_ERROR,  "Failed to create data from: %@",  buf,  0xCu);
    }
  }
}

- (void)prune
{
}

- (void)absorbRecentInfo:(id)a3
{
}

- (BOOL)shouldUpdatePurgeable:(id)a3
{
  id v3 = a3;
  uint64_t v22 = 0LL;
  v23 = &v22;
  uint64_t v24 = 0x2020000000LL;
  char v25 = 0;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"CACHE_DELETE_TOTAL_PURGEABLE"]);
  char v5 = evaluateBoolProperty(v4);

  unsigned __int8 v6 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  uint64_t v7 = CDGetLogHandle("daemon");
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    int v27 = 192;
    __int16 v28 = 2112;
    unsigned __int8 v29 = (const char *)v3;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%d shouldUpdatePurgeable ENTRY, info: %@",  buf,  0x12u);
  }

  if (qword_1000667E0 != -1) {
    dispatch_once(&qword_1000667E0, &__block_literal_global_33);
  }
  uint64_t v9 = (dispatch_queue_s *)qword_1000667D8;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = __54__CDDaemonPurgeableResultCache_shouldUpdatePurgeable___block_invoke_2;
  v17[3] = &unk_1000595E8;
  char v21 = v5;
  uint64_t v10 = v6;
  v18 = v10;
  id v11 = v3;
  id v19 = v11;
  int v20 = &v22;
  dispatch_sync(v9, v17);
  uint64_t v12 = CDGetLogHandle("daemon");
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    if (*((_BYTE *)v23 + 24)) {
      uint64_t v14 = "YES";
    }
    else {
      uint64_t v14 = "NO";
    }
    *(_DWORD *)buf = 67109378;
    int v27 = 259;
    __int16 v28 = 2080;
    unsigned __int8 v29 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%d shouldUpdatePurgeable EXIT, result: %s",  buf,  0x12u);
  }

  BOOL v15 = *((_BYTE *)v23 + 24) != 0;
  _Block_object_dispose(&v22, 8);

  return v15;
}

void __54__CDDaemonPurgeableResultCache_shouldUpdatePurgeable___block_invoke(id a1)
{
  v1 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  v2 = (void *)qword_1000667D0;
  qword_1000667D0 = (uint64_t)v1;

  dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  unsigned __int8 v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
  dispatch_queue_t v4 = dispatch_queue_create("com.apple.cache_delete.shouldUpdatePurgeable", v6);
  char v5 = (void *)qword_1000667D8;
  qword_1000667D8 = (uint64_t)v4;
}

void __54__CDDaemonPurgeableResultCache_shouldUpdatePurgeable___block_invoke_2(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 56);
  uint64_t v3 = CDGetLogHandle("daemon");
  dispatch_queue_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v5)
    {
      *(_DWORD *)buf = 67109120;
      int v67 = 201;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%d shouldUpdatePurgeable", buf, 8u);
    }

    __int128 v63 = 0u;
    __int128 v64 = 0u;
    __int128 v61 = 0u;
    __int128 v62 = 0u;
    uint64_t LocalVolumes = getLocalVolumes();
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(LocalVolumes);
    id v8 = [v7 countByEnumeratingWithState:&v61 objects:v71 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v62;
      do
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v62 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[CacheDeleteDaemonVolume volumeWithMountpoint:]( &OBJC_CLASS___CacheDeleteDaemonVolume,  "volumeWithMountpoint:",  *(void *)(*((void *)&v61 + 1) + 8LL * (void)i)));
          if (v12) {
            [*(id *)(a1 + 32) addObject:v12];
          }
        }

        id v9 = [v7 countByEnumeratingWithState:&v61 objects:v71 count:16];
      }

      while (v9);
    }
  }

  else
  {
    if (v5)
    {
      *(_DWORD *)buf = 67109120;
      int v67 = 210;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%d shouldUpdatePurgeable", buf, 8u);
    }

    id v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"]);
    uint64_t v14 = evaluateStringProperty();
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v14);

    if (v7)
    {
      uint64_t v15 = CDGetLogHandle("daemon");
      __int16 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        int v67 = 213;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%d shouldUpdatePurgeable", buf, 8u);
      }

      id v17 = (void *)objc_claimAutoreleasedReturnValue( +[CacheDeleteDaemonVolume volumeWithMountpoint:]( &OBJC_CLASS___CacheDeleteDaemonVolume,  "volumeWithMountpoint:",  v7));
      v18 = v17;
      if (v17)
      {
        id v19 = *(void **)(a1 + 32);
        int v20 = (void *)objc_claimAutoreleasedReturnValue([v17 siblings]);
        [v19 addObjectsFromArray:v20];
      }
    }
  }

  __int128 v59 = 0u;
  __int128 v60 = 0u;
  __int128 v57 = 0u;
  __int128 v58 = 0u;
  id obj = *(id *)(a1 + 32);
  id v21 = [obj countByEnumeratingWithState:&v57 objects:v70 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v56 = *(void *)v58;
    do
    {
      for (j = 0LL; j != v22; j = (char *)j + 1)
      {
        if (*(void *)v58 != v56) {
          objc_enumerationMutation(obj);
        }
        uint64_t v24 = *(void **)(*((void *)&v57 + 1) + 8LL * (void)j);
        if (v24)
        {
          uint64_t v25 = evaluatePurgeableUrgency(*(void *)(a1 + 40));
          v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
          int v27 = (void *)objc_claimAutoreleasedReturnValue([v24 mountPoint]);
          __int16 v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@_%d",  v27,  [v26 intValue]));

          unsigned __int8 v29 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_1000667D0 objectForKeyedSubscript:v28]);
          uint64_t v30 = CDGetLogHandle("daemon");
          v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109378;
            int v67 = 227;
            __int16 v68 = 2112;
            v69 = v28;
            _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "%d shouldUpdatePurgeable %@",  buf,  0x12u);
          }

          NSErrorDomain v32 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKeyedSubscript:@"CACHE_DELETE_NO_CACHE"]);
          int v33 = evaluateBoolProperty(v32);

          if (v33)
          {
            uint64_t v34 = CDGetLogHandle("daemon");
            uint64_t v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109120;
              int v67 = 229;
              v36 = v35;
              goto LABEL_40;
            }

            goto LABEL_41;
          }

          if (v29)
          {
            v37 = (void *)objc_claimAutoreleasedReturnValue([v29 objectAtIndexedSubscript:0]);
            id v38 = [v37 unsignedLongLongValue];

            v39 = (void *)objc_claimAutoreleasedReturnValue([v29 objectAtIndexedSubscript:1]);
            [v39 doubleValue];
            v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:"));

            if (v38)
            {
              if ([v24 freespaceIsStale:v38])
              {
                uint64_t v41 = CDGetLogHandle("daemon");
                id v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
                if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 67109120;
                  int v67 = 239;
                  dispatch_queue_t v43 = v42;
                  goto LABEL_47;
                }

- (id)emitRecentInfo:(id)a3
{
  id v4 = a3;
  uint64_t v16 = 0LL;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000LL;
  id v19 = __Block_byref_object_copy__1;
  int v20 = __Block_byref_object_dispose__1;
  id v21 = 0LL;
  uint64_t v5 = CDGetLogHandle("daemon");
  unsigned __int8 v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v23 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "emitRecentInfo ENTRY, info: %@", buf, 0xCu);
  }

  if (-[CDDaemonPurgeableResultCache shouldUpdatePurgeable:](self, "shouldUpdatePurgeable:", v4))
  {
    uint64_t v7 = CDGetLogHandle("daemon");
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "emitRecentInfo shouldUpdatePurgeable",  buf,  2u);
    }

    -[CDDaemonPurgeableResultCache keepUpToDate:](self, "keepUpToDate:", v4);
  }

  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CDDaemonPurgeableResultCache queue](self, "queue"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = __47__CDDaemonPurgeableResultCache_emitRecentInfo___block_invoke;
  v15[3] = &unk_100058C48;
  v15[4] = self;
  v15[5] = &v16;
  dispatch_sync(v9, v15);

  uint64_t v10 = CDGetLogHandle("daemon");
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = (void *)v17[5];
    *(_DWORD *)buf = 138412290;
    id v23 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "emitRecentInfo EXIT, result: %@", buf, 0xCu);
  }

  id v13 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v13;
}

void __47__CDDaemonPurgeableResultCache_emitRecentInfo___block_invoke(uint64_t a1)
{
  int v2 = objc_alloc(&OBJC_CLASS___CDRecentInfo);
  id v6 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) recentPurgeableResults]);
  uint64_t v3 = -[CDRecentInfo initWithRecentInfo:](v2, "initWithRecentInfo:", v6);
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

+ (id)fetchVolumeWithPath:(id)a3
{
  return +[CacheDeleteDaemonVolume volumeWithPath:](&OBJC_CLASS___CacheDeleteDaemonVolume, "volumeWithPath:", a3);
}

- (void)addInvalidVolume:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CDDaemonPurgeableResultCache queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __49__CDDaemonPurgeableResultCache_addInvalidVolume___block_invoke;
  block[3] = &unk_100058AA0;
  void block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, block);
}

void __49__CDDaemonPurgeableResultCache_addInvalidVolume___block_invoke(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) recentPurgeableResults]);
  [v2 addInvalidVolume:*(void *)(a1 + 40)];
}

- (void)updateInvalidVolumes
{
  uint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CDDaemonPurgeableResultCache queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __52__CDDaemonPurgeableResultCache_updateInvalidVolumes__block_invoke;
  block[3] = &unk_100058BB0;
  void block[4] = self;
  dispatch_sync(v3, block);
}

void __52__CDDaemonPurgeableResultCache_updateInvalidVolumes__block_invoke(uint64_t a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) recentPurgeableResults]);
  [v1 updateInvalidVolumes];
}

- (id)diagnosticsForVolume:(id)a3 atUrgency:(int)a4
{
  return 0LL;
}

- (void)updateRecentInfoForServiceID:(id)a3 volume:(id)a4 info:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CDDaemonPurgeableResultCache queue](self, "queue"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = __73__CDDaemonPurgeableResultCache_updateRecentInfoForServiceID_volume_info___block_invoke;
  v15[3] = &unk_100059630;
  id v16 = v10;
  id v17 = v9;
  uint64_t v18 = self;
  id v19 = v8;
  id v12 = v8;
  id v13 = v9;
  id v14 = v10;
  dispatch_async(v11, v15);
}

void __73__CDDaemonPurgeableResultCache_updateRecentInfoForServiceID_volume_info___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) mutableCopy];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"CACHE_DELETE_PUSHED"]);
  int v4 = evaluateBoolProperty(v3);

  uint64_t v5 = evaluatePurgeableUrgency(v2);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"CACHE_DELETE_AMOUNT"]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"CACHE_DELETE_TIMESTAMP"]);
  if (!*(void *)(a1 + 40))
  {
    uint64_t v12 = CDGetLogHandle("daemon");
    id obj = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v104 = (os_log_s *)v2;
      _os_log_error_impl( (void *)&_mh_execute_header,  obj,  OS_LOG_TYPE_ERROR,  "parameter error (volume). mInfo: %@",  buf,  0xCu);
    }

    id v13 = 0LL;
    goto LABEL_68;
  }

  id v9 = &APFSContainerGetSpaceInfo_ptr;
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSNumber);
  v91 = v8;
  if ((objc_opt_isKindOfClass(v8, v10) & 1) != 0) {
    [v8 doubleValue];
  }
  else {
    +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  }
  double v14 = v11;
  int v90 = v4;
  if (!v6)
  {
    uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSNumber);
    if ((objc_opt_isKindOfClass(v7, v15) & 1) != 0)
    {
      v117 = &off_10005D490;
      v118 = v7;
      id v16 = &v118;
      id v17 = (void **)&v117;
LABEL_14:
      int v20 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v16,  v17,  1LL));
      goto LABEL_26;
    }
  }

  uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v6, v18) & 1) != 0)
  {
    uint64_t v19 = objc_opt_class(&OBJC_CLASS___NSNumber);
    if ((objc_opt_isKindOfClass(v7, v19) & 1) != 0)
    {
      v115 = v6;
      v116 = v7;
      id v16 = &v116;
      id v17 = &v115;
      goto LABEL_14;
    }
  }

  uint64_t v21 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v7, v21) & 1) == 0)
  {
    int v33 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) recentPurgeableResults]);
    uint64_t v34 = *(void *)(a1 + 56);
    uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) mountPoint]);
    [v33 removeServiceInfo:v34 forVolume:v35];

    NSErrorDomain v32 = 0LL;
    goto LABEL_28;
  }

  __int128 v101 = 0u;
  __int128 v102 = 0u;
  __int128 v99 = 0u;
  __int128 v100 = 0u;
  id obj = v7;
  id v22 = -[os_log_s countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v99,  v114,  16LL);
  if (!v22) {
    goto LABEL_25;
  }
  id v23 = v22;
  uint64_t v24 = *(void *)v100;
  while (2)
  {
    for (i = 0LL; i != v23; i = (char *)i + 1)
    {
      if (*(void *)v100 != v24) {
        objc_enumerationMutation(obj);
      }
      uint64_t v26 = *(void *)(*((void *)&v99 + 1) + 8LL * (void)i);
      uint64_t v27 = objc_opt_class(v9[50]);
      if ((objc_opt_isKindOfClass(v26, v27) & 1) == 0)
      {
        uint64_t v71 = CDGetLogHandle("daemon");
        v72 = (void *)objc_claimAutoreleasedReturnValue(v71);
        if (!os_log_type_enabled((os_log_t)v72, OS_LOG_TYPE_ERROR))
        {
LABEL_58:

          id v13 = 0LL;
          goto LABEL_59;
        }

        *(_DWORD *)buf = 138412290;
        v104 = obj;
        v73 = "bad key in amounts dictionary: %@";
LABEL_70:
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v72, OS_LOG_TYPE_ERROR, v73, buf, 0xCu);
        goto LABEL_58;
      }

      __int16 v28 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s objectForKeyedSubscript:](obj, "objectForKeyedSubscript:", v26));
      unsigned __int8 v29 = v9;
      uint64_t v30 = objc_opt_class(v9[50]);
      char isKindOfClass = objc_opt_isKindOfClass(v28, v30);

      if ((isKindOfClass & 1) == 0)
      {
        uint64_t v77 = CDGetLogHandle("daemon");
        v72 = (void *)objc_claimAutoreleasedReturnValue(v77);
        if (!os_log_type_enabled((os_log_t)v72, OS_LOG_TYPE_ERROR)) {
          goto LABEL_58;
        }
        *(_DWORD *)buf = 138412290;
        v104 = obj;
        v73 = "bad value in amounts dictionary: %@";
        goto LABEL_70;
      }

      id v9 = v29;
    }

    id v23 = -[os_log_s countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v99,  v114,  16LL);
    int v4 = v90;
    if (v23) {
      continue;
    }
    break;
  }

void __73__CDDaemonPurgeableResultCache_updateRecentInfoForServiceID_volume_info___block_invoke_61(id a1)
{
  id v1 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  id v2 = (void *)qword_1000667E8;
  qword_1000667E8 = (uint64_t)v1;
}

- (void)deductPurgeableAmount:(id)a3 serviceID:(id)a4 volume:(id)a5 urgency:(int)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CDDaemonPurgeableResultCache queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __79__CDDaemonPurgeableResultCache_deductPurgeableAmount_serviceID_volume_urgency___block_invoke;
  block[3] = &unk_100059658;
  void block[4] = self;
  id v18 = v10;
  id v19 = v11;
  id v20 = v12;
  int v21 = a6;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(v13, block);
}

void __79__CDDaemonPurgeableResultCache_deductPurgeableAmount_serviceID_volume_urgency___block_invoke( uint64_t a1)
{
  id v6 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) recentPurgeableResults]);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  int v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 56) mountPoint]);
  uint64_t v5 = *(unsigned int *)(a1 + 64);
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend( v6,  "updateServiceInfoAmount:forService:onVolume:atUrgency:withTimestamp:nonPurgeableAmount:deductFromCurrentAmount:info:",  v2,  v3,  v4,  v5,  0,  1,  0);
}

- (void)removeServiceInfo:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CDDaemonPurgeableResultCache queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = __50__CDDaemonPurgeableResultCache_removeServiceInfo___block_invoke;
  v7[3] = &unk_100058AA0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __50__CDDaemonPurgeableResultCache_removeServiceInfo___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) recentPurgeableResults]);
  [v2 removeServiceInfo:*(void *)(a1 + 40)];

  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) updatedNotificationBlock]);
  if (v3)
  {
    id v4 = (void (**)(id, void))objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) updatedNotificationBlock]);
    v4[2](v4, 0LL);
  }

- (void)updateRecentStateforVolume:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v7 = v4;
    id v5 = [v4 state];
    id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CDDaemonPurgeableResultCache queue](self, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = __59__CDDaemonPurgeableResultCache_updateRecentStateforVolume___block_invoke;
    block[3] = &unk_100058E38;
    id v9 = v7;
    id v10 = self;
    id v11 = v5;
    dispatch_sync(v6, block);

    id v4 = v7;
  }
}

void __59__CDDaemonPurgeableResultCache_updateRecentStateforVolume___block_invoke(uint64_t a1)
{
  id v8 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) mountPoint]);
  BOOL v3 = [*(id *)(a1 + 32) validate] == 0;
  uint64_t v2 = v8;
  BOOL v3 = v3 || v8 == 0LL;
  if (!v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) recentPurgeableResults]);
    unsigned int v5 = [v4 updateRecentState:*(void *)(a1 + 48) forVolume:v8];

    uint64_t v2 = v8;
    if (v5)
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) updatedNotificationBlock]);

      uint64_t v2 = v8;
      if (v6)
      {
        id v7 = (void (**)(void, void))objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) updatedNotificationBlock]);
        v7[2](v7, 0LL);

        uint64_t v2 = v8;
      }
    }
  }
}

- (void)prunePreserving:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CDDaemonPurgeableResultCache queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = __48__CDDaemonPurgeableResultCache_prunePreserving___block_invoke;
  v7[3] = &unk_100058AA0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __48__CDDaemonPurgeableResultCache_prunePreserving___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) recentPurgeableResults]);
  [v2 prunePreserving:*(void *)(a1 + 40)];

  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) updatedNotificationBlock]);
  if (v3)
  {
    id v4 = (void (**)(id, void))objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) updatedNotificationBlock]);
    v4[2](v4, 0LL);
  }

- (void)forgetPushingService:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CDDaemonPurgeableResultCache queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = __53__CDDaemonPurgeableResultCache_forgetPushingService___block_invoke;
  v7[3] = &unk_100058AA0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __53__CDDaemonPurgeableResultCache_forgetPushingService___block_invoke(uint64_t a1)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) recentPurgeableResults]);
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([v3 pushingServices]);
  [v2 removeObject:*(void *)(a1 + 40)];
}

- (void)invalidateRecentResultsForVolume:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CDDaemonPurgeableResultCache queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = __65__CDDaemonPurgeableResultCache_invalidateRecentResultsForVolume___block_invoke;
  v7[3] = &unk_100058AA0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __65__CDDaemonPurgeableResultCache_invalidateRecentResultsForVolume___block_invoke(uint64_t a1)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) recentPurgeableResults]);
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) mountPoint]);
  [v3 invalidateForVolume:v2];
}

- (id)copyInvalidServicesForVolume:(id)a3 atUrgency:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0LL;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000LL;
  id v20 = __Block_byref_object_copy__1;
  int v21 = __Block_byref_object_dispose__1;
  id v22 = 0LL;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CDDaemonPurgeableResultCache queue](self, "queue"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = __71__CDDaemonPurgeableResultCache_copyInvalidServicesForVolume_atUrgency___block_invoke;
  v13[3] = &unk_100059680;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v16 = &v17;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, v13);

  id v11 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v11;
}

void __71__CDDaemonPurgeableResultCache_copyInvalidServicesForVolume_atUrgency___block_invoke(uint64_t a1)
{
  id v6 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) recentPurgeableResults]);
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) mountPoint]);
  id v3 = objc_msgSend(v6, "copyInvalidsForVolume:atUrgency:", v2, objc_msgSend(*(id *)(a1 + 48), "intValue"));
  uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8LL);
  unsigned int v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)copyPushingServices
{
  uint64_t v7 = 0LL;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  id v10 = __Block_byref_object_copy__1;
  id v11 = __Block_byref_object_dispose__1;
  id v12 = 0LL;
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CDDaemonPurgeableResultCache queue](self, "queue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = __51__CDDaemonPurgeableResultCache_copyPushingServices__block_invoke;
  v6[3] = &unk_100058C48;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __51__CDDaemonPurgeableResultCache_copyPushingServices__block_invoke(uint64_t a1)
{
  id v5 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) recentPurgeableResults]);
  id v2 = [v5 copyPushingServices];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)setUpdateNotificationBlock:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CDDaemonPurgeableResultCache queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = __59__CDDaemonPurgeableResultCache_setUpdateNotificationBlock___block_invoke;
  v7[3] = &unk_1000590E0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

id __59__CDDaemonPurgeableResultCache_setUpdateNotificationBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setUpdatedNotificationBlock:*(void *)(a1 + 40)];
}

- (void)setUpdateBlock:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CDDaemonPurgeableResultCache queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = __47__CDDaemonPurgeableResultCache_setUpdateBlock___block_invoke;
  v7[3] = &unk_1000590E0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

id __47__CDDaemonPurgeableResultCache_setUpdateBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setUpdatedBlock:*(void *)(a1 + 40)];
}

- (void)keepUpToDate:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CDDaemonPurgeableResultCache updatedBlock](self, "updatedBlock"));

  if (v5)
  {
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[CDDaemonPurgeableResultCache updatedBlock](self, "updatedBlock"));
    (*((void (**)(os_log_s *, id))v6 + 2))(v6, v4);
  }

  else
  {
    uint64_t v7 = CDGetLogHandle("daemon");
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8[0] = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "keepUpToDate: no updateBlock.",  (uint8_t *)v8,  2u);
    }
  }
}

- (CDDaemonRecentInfo)recentPurgeableResults
{
  return self->_recentPurgeableResults;
}

- (void)setRecentPurgeableResults:(id)a3
{
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (id)updatedNotificationBlock
{
  return self->_updatedNotificationBlock;
}

- (void)setUpdatedNotificationBlock:(id)a3
{
}

- (id)updatedBlock
{
  return self->_updatedBlock;
}

- (void)setUpdatedBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end