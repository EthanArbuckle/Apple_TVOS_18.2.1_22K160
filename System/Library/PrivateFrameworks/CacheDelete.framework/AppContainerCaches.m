@interface AppContainerCaches
+ (BOOL)supportsSecureCoding;
+ (id)appContainerCachesWithInfo:(id)a3;
+ (id)deleteAppCaches:(id)a3 telemetry:(id)a4;
- (AppContainerCaches)initWithCoder:(id)a3;
- (AppContainerCaches)initWithInfo:(id)a3;
- (NSDictionary)info;
- (NSMutableDictionary)cachesByVolume;
- (NSMutableDictionary)cdVolumes;
- (OS_dispatch_queue)collection_queue;
- (OS_dispatch_queue)purge_queue;
- (OperationState)opState;
- (id)appCache:(id)a3 forPath:(id)a4;
- (id)cachesForInstalledApps:(BOOL)a3 bytesNeeded:(unint64_t)a4 volume:(id)a5 sortForUrgency:(int)a6 telemetry:(id)a7;
- (id)cdVolumeForPath:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initReadOnlyCopy;
- (id)mountPointForPath:(id)a3;
- (unint64_t)processContainerCachesForVolume:(id)a3 bytesNeeded:(unint64_t)a4 urgency:(int)a5 calculate:(BOOL)a6 verbose:(BOOL)a7 telemetry:(id)a8;
- (void)_serviceCallback:(id)a3 replyBlock:(id)a4;
- (void)_serviceCancelPurge:(id)a3;
- (void)_serviceNotify:(id)a3 replyBlock:(id)a4;
- (void)_servicePeriodic:(int)a3 info:(id)a4 replyBlock:(id)a5;
- (void)_servicePing:(id)a3;
- (void)_servicePurge:(int)a3 info:(id)a4 replyBlock:(id)a5;
- (void)_servicePurgeable:(int)a3 info:(id)a4 replyBlock:(id)a5;
- (void)encodeWithCoder:(id)a3;
- (void)setCachesByVolume:(id)a3;
- (void)setCdVolumes:(id)a3;
- (void)setCollection_queue:(id)a3;
- (void)setInfo:(id)a3;
- (void)setOpState:(id)a3;
- (void)setPurge_queue:(id)a3;
@end

@implementation AppContainerCaches

+ (id)deleteAppCaches:(id)a3 telemetry:(id)a4
{
  id v5 = a3;
  id v73 = a4;
  v61 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  v68 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  v69 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  __int128 v87 = 0u;
  __int128 v88 = 0u;
  __int128 v89 = 0u;
  __int128 v90 = 0u;
  id obj = v5;
  id v6 = [obj countByEnumeratingWithState:&v87 objects:v100 count:16];
  if (v6)
  {
    id v7 = v6;
    v8 = &APFSContainerGetSpaceInfo_ptr;
    uint64_t v9 = *(void *)v88;
    uint64_t v62 = *(void *)v88;
    do
    {
      v10 = 0LL;
      id v63 = v7;
      do
      {
        if (*(void *)v88 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v87 + 1) + 8LL * (void)v10);
        v12 = v8[34];
        id v86 = 0LL;
        uint64_t v67 = v11;
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "bundleRecordWithBundleIdentifier:allowPlaceholder:error:"));
        id v14 = v86;
        uint64_t v15 = CDGetLogHandle("daemon");
        v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
        v17 = v16;
        if (v13) {
          BOOL v18 = v14 == 0LL;
        }
        else {
          BOOL v18 = 0;
        }
        if (v18)
        {
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            v19 = (void *)objc_opt_class(v13);
            *(_DWORD *)buf = 138412802;
            uint64_t v95 = v67;
            __int16 v96 = 2112;
            id v97 = v19;
            __int16 v98 = 2112;
            v99 = v13;
            id v20 = v19;
            _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "LSBundleRecord for %@ : (class: %@) %@",  buf,  0x20u);
          }

          uint64_t v21 = objc_opt_class(&OBJC_CLASS___LSApplicationRecord);
          id v65 = v14;
          v66 = v10;
          if ((objc_opt_isKindOfClass(v13, v21) & 1) != 0) {
            unsigned __int8 v72 = [v13 isPlaceholder];
          }
          else {
            unsigned __int8 v72 = 0;
          }
          uint64_t v22 = objc_opt_class(&OBJC_CLASS___LSApplicationExtensionRecord);
          char isKindOfClass = objc_opt_isKindOfClass(v13, v22);
          if ((isKindOfClass & 1) != 0) {
            uint64_t v23 = 4LL;
          }
          else {
            uint64_t v23 = 2LL;
          }
          v24 = (void *)objc_claimAutoreleasedReturnValue([v13 bundleIdentifier]);
          uint64_t v25 = dataContainerURLs(v24, v23, [v13 platform]);
          v26 = (void *)objc_claimAutoreleasedReturnValue(v25);

          __int128 v84 = 0u;
          __int128 v85 = 0u;
          __int128 v82 = 0u;
          __int128 v83 = 0u;
          v17 = v26;
          id v27 = -[os_log_s countByEnumeratingWithState:objects:count:]( v17,  "countByEnumeratingWithState:objects:count:",  &v82,  v93,  16LL);
          if (v27)
          {
            id v28 = v27;
            uint64_t v70 = *(void *)v83;
            do
            {
              for (i = 0LL; i != v28; i = (char *)i + 1)
              {
                if (*(void *)v83 != v70) {
                  objc_enumerationMutation(v17);
                }
                v30 = *(void **)(*((void *)&v82 + 1) + 8LL * (void)i);
                else {
                  id v31 = v30;
                }
                v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v13));
                v33 = (void *)objc_claimAutoreleasedReturnValue([v13 bundleIdentifier]);
                v34 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s objectForKeyedSubscript:](v17, "objectForKeyedSubscript:", v30));
                BYTE1(v60) = isKindOfClass & 1;
                LOBYTE(v60) = v72;
                v35 = (void *)objc_claimAutoreleasedReturnValue( +[AppCache appCacheWithRecords:identifier:dataContainerURL:userManagedAssetsURL:personaUniqueString:isDataseparated:isPlaceholder:isPlugin:telemetry:]( &OBJC_CLASS___AppCache,  "appCacheWithRecords:identifier:dataContainerURL:userManagedAssetsURL:personaUniqueStri ng:isDataseparated:isPlaceholder:isPlugin:telemetry:",  v32,  v33,  v34,  0LL,  v31,  0LL,  v60,  v73));

                if (v35)
                {
                  -[NSMutableArray addObject:](v68, "addObject:", v35);
                  v36 = (void *)objc_claimAutoreleasedReturnValue([v35 cdVol]);
                  -[NSMutableSet addObject:](v69, "addObject:", v36);

                  uint64_t v37 = CDGetLogHandle("daemon");
                  v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
                  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
                  {
                    uint64_t v39 = humanReadableNumber([v35 caches:1 purge:0]);
                    v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
                    *(_DWORD *)buf = 138412802;
                    uint64_t v95 = v67;
                    __int16 v96 = 2112;
                    id v97 = v40;
                    __int16 v98 = 2112;
                    v99 = v35;
                    _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEFAULT,  "AppCache for %@ : (%@) %@",  buf,  0x20u);
                  }
                }

                else
                {
                  uint64_t v41 = CDGetLogHandle("daemon");
                  v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
                  if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    uint64_t v95 = v67;
                    _os_log_error_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_ERROR,  "Unable to create AppCache for %@",  buf,  0xCu);
                  }
                }
              }

              id v28 = -[os_log_s countByEnumeratingWithState:objects:count:]( v17,  "countByEnumeratingWithState:objects:count:",  &v82,  v93,  16LL);
            }

            while (v28);
          }

          v8 = &APFSContainerGetSpaceInfo_ptr;
          uint64_t v9 = v62;
          id v7 = v63;
          id v14 = v65;
          v10 = v66;
        }

        else if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v95 = v67;
          __int16 v96 = 2112;
          id v97 = v14;
          _os_log_error_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "Unable to create an LSBundleRecord for %@ : %@",  buf,  0x16u);
        }

        v10 = (char *)v10 + 1;
      }

      while (v10 != v7);
      id v7 = [obj countByEnumeratingWithState:&v87 objects:v100 count:16];
    }

    while (v7);
  }

  __int128 v80 = 0u;
  __int128 v81 = 0u;
  __int128 v78 = 0u;
  __int128 v79 = 0u;
  v42 = v68;
  id v43 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v42,  "countByEnumeratingWithState:objects:count:",  &v78,  v92,  16LL);
  if (v43)
  {
    id v44 = v43;
    uint64_t v45 = 0LL;
    uint64_t v46 = *(void *)v79;
    v47 = v61;
    do
    {
      for (j = 0LL; j != v44; j = (char *)j + 1)
      {
        if (*(void *)v79 != v46) {
          objc_enumerationMutation(v42);
        }
        v49 = *(void **)(*((void *)&v78 + 1) + 8LL * (void)j);
        id v50 = [v49 clearCaches:1];
        v45 += (uint64_t)v50;
        v51 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v50));
        v52 = (void *)objc_claimAutoreleasedReturnValue([v49 identifier]);
        -[NSMutableDictionary setObject:forKeyedSubscript:](v61, "setObject:forKeyedSubscript:", v51, v52);
      }

      id v44 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v42,  "countByEnumeratingWithState:objects:count:",  &v78,  v92,  16LL);
    }

    while (v44);
  }

  else
  {
    uint64_t v45 = 0LL;
    v47 = v61;
  }

  __int128 v76 = 0u;
  __int128 v77 = 0u;
  __int128 v74 = 0u;
  __int128 v75 = 0u;
  v53 = v69;
  id v54 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v53,  "countByEnumeratingWithState:objects:count:",  &v74,  v91,  16LL);
  if (v54)
  {
    id v55 = v54;
    uint64_t v56 = *(void *)v75;
    do
    {
      for (k = 0LL; k != v55; k = (char *)k + 1)
      {
        if (*(void *)v75 != v56) {
          objc_enumerationMutation(v53);
        }
        clearDiscardedCaches(v73, 17LL, 0LL, *(void *)(*((void *)&v74 + 1) + 8LL * (void)k));
      }

      id v55 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v53,  "countByEnumeratingWithState:objects:count:",  &v74,  v91,  16LL);
    }

    while (v55);
  }

  v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v45));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v47,  "setObject:forKeyedSubscript:",  v58,  @"CACHE_DELETE_AMOUNT");

  return v47;
}

- (AppContainerCaches)initWithInfo:(id)a3
{
  id v5 = a3;
  v33.receiver = self;
  v33.super_class = (Class)&OBJC_CLASS___AppContainerCaches;
  id v6 = -[CDService initWithInfo:](&v33, "initWithInfo:", v5);
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_info, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"CONTAINER_CACHES_BY_VOLUME"]);
    id v28 = v8;
    if (v8) {
      uint64_t v9 = (NSMutableDictionary *)[v8 mutableCopy];
    }
    else {
      uint64_t v9 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    }
    cachesByVolume = v7->_cachesByVolume;
    v7->_cachesByVolume = v9;

    uint64_t v11 = objc_opt_new(&OBJC_CLASS___OperationState);
    opState = v7->_opState;
    v7->_opState = v11;

    v13 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    cdVolumes = v7->_cdVolumes;
    v7->_cdVolumes = v13;

    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    uint64_t LocalVolumes = getLocalVolumes();
    v16 = (void *)objc_claimAutoreleasedReturnValue(LocalVolumes);
    id v17 = [v16 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v30;
      do
      {
        for (i = 0LL; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v30 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = *(void *)(*((void *)&v29 + 1) + 8LL * (void)i);
          uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( +[CacheDeleteVolume volumeWithMountpoint:]( &OBJC_CLASS___CacheDeleteVolume,  "volumeWithMountpoint:",  v21));
          if (v22) {
            -[NSMutableDictionary setObject:forKeyedSubscript:]( v7->_cdVolumes,  "setObject:forKeyedSubscript:",  v22,  v21);
          }
        }

        id v18 = [v16 countByEnumeratingWithState:&v29 objects:v34 count:16];
      }

      while (v18);
    }

    dispatch_queue_t v23 = dispatch_queue_create("com.apple.cache_delete.app_caches.collection", 0LL);
    collection_queue = v7->_collection_queue;
    v7->_collection_queue = (OS_dispatch_queue *)v23;

    dispatch_queue_t v25 = dispatch_queue_create("com.apple.cache_delete.app_caches.purge", 0LL);
    purge_queue = v7->_purge_queue;
    v7->_purge_queue = (OS_dispatch_queue *)v25;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)appContainerCachesWithInfo:(id)a3
{
  id v3 = a3;
  v4 = -[AppContainerCaches initWithInfo:](objc_alloc(&OBJC_CLASS___AppContainerCaches), "initWithInfo:", v3);

  return v4;
}

- (AppContainerCaches)initWithCoder:(id)a3
{
  uint64_t v4 = objc_claimAutoreleasedReturnValue([a3 decodeObjectForKey:@"CONTAINER_CACHES_BY_VOLUME"]);
  id v5 = (void *)v4;
  if (v4)
  {
    v12[0] = @"CONTAINER_CACHES_BY_VOLUME";
    v12[1] = @"CACHE_DELETE_ID";
    v13[0] = v4;
    v13[1] = @"com.apple.mobile.cache_delete_app_container_caches";
    v12[2] = @"CACHE_DELETE_SERVICES";
    v13[2] = &off_10005D3A0;
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v13,  v12,  3LL));
    id v7 = -[AppContainerCaches initWithInfo:](self, "initWithInfo:", v6);
  }

  else
  {
    uint64_t v8 = CDGetLogHandle("daemon");
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v11 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Unable to decode cachesByVolume", v11, 2u);
    }

    id v7 = -[AppContainerCaches initWithInfo:](self, "initWithInfo:", &off_10005D1D8);
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[AppContainerCaches cachesByVolume](self, "cachesByVolume"));
  [v4 encodeObject:v5 forKey:@"CONTAINER_CACHES_BY_VOLUME"];
}

- (id)cachesForInstalledApps:(BOOL)a3 bytesNeeded:(unint64_t)a4 volume:(id)a5 sortForUrgency:(int)a6 telemetry:(id)a7
{
  id v52 = a5;
  id v11 = a7;
  v12 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  uint64_t v13 = recentlyUsedAppsDictionary();
  id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  uint64_t v15 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  v16 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  id v17 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  if (a4) {
    BOOL v18 = 1;
  }
  else {
    BOOL v18 = a6 == 4;
  }
  uint64_t v19 = v18;
  v64[0] = _NSConcreteStackBlock;
  v64[1] = 3221225472LL;
  v64[2] = __89__AppContainerCaches_cachesForInstalledApps_bytesNeeded_volume_sortForUrgency_telemetry___block_invoke;
  v64[3] = &unk_100059F10;
  BOOL v71 = a3;
  int v70 = a6;
  id v51 = v14;
  id v65 = v51;
  id v20 = v17;
  v66 = v20;
  uint64_t v21 = v15;
  uint64_t v67 = v21;
  uint64_t v22 = v16;
  v68 = v22;
  dispatch_queue_t v23 = v12;
  v69 = v23;
  +[AppCache enumerateAppCachesOnVolume:options:telemetry:block:]( &OBJC_CLASS___AppCache,  "enumerateAppCachesOnVolume:options:telemetry:block:",  v52,  v19,  v11,  v64);
  v58[0] = _NSConcreteStackBlock;
  v58[1] = 3221225472LL;
  v58[2] = __89__AppContainerCaches_cachesForInstalledApps_bytesNeeded_volume_sortForUrgency_telemetry___block_invoke_2;
  v58[3] = &unk_100059F38;
  v48 = v22;
  v59 = v48;
  v47 = v21;
  uint64_t v60 = v47;
  int v63 = a6;
  id v49 = v11;
  id v61 = v49;
  v24 = v23;
  uint64_t v62 = v24;
  id v50 = v20;
  +[AppCache enumerateGroupCachesOnVolume:block:]( &OBJC_CLASS___AppCache,  "enumerateGroupCachesOnVolume:block:",  v20,  v58);
  if ((a6 - 5) > 0xFFFFFFFB) {
    id v25 = (id)objc_claimAutoreleasedReturnValue( -[NSMutableArray sortedArrayUsingComparator:]( v24,  "sortedArrayUsingComparator:",  &__block_literal_global_9));
  }
  else {
    id v25 = -[NSMutableArray copy](v24, "copy");
  }
  v26 = v25;
  uint64_t v46 = v24;
  uint64_t v27 = CDGetLogHandle("daemon");
  id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "cachesForInstalledApps result:", buf, 2u);
  }

  __int128 v56 = 0u;
  __int128 v57 = 0u;
  __int128 v54 = 0u;
  __int128 v55 = 0u;
  id v29 = v26;
  id v30 = [v29 countByEnumeratingWithState:&v54 objects:v80 count:16];
  if (v30)
  {
    id v31 = v30;
    uint64_t v32 = *(void *)v55;
    id v53 = v29;
    do
    {
      for (i = 0LL; i != v31; i = (char *)i + 1)
      {
        if (*(void *)v55 != v32) {
          objc_enumerationMutation(v29);
        }
        v34 = *(void **)(*((void *)&v54 + 1) + 8LL * (void)i);
        uint64_t v35 = CDGetLogHandle("daemon");
        v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue([v34 identifier]);
          if (v37) {
            uint64_t v38 = objc_claimAutoreleasedReturnValue([v34 identifier]);
          }
          else {
            uint64_t v38 = objc_claimAutoreleasedReturnValue([v34 bundleRecords]);
          }
          uint64_t v39 = (void *)v38;
          v40 = (void *)objc_claimAutoreleasedReturnValue([v34 lastUsed]);
          uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue([v34 lastKnownCacheSize]);
          uint64_t v42 = humanReadableNumber([v41 unsignedLongLongValue]);
          id v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
          unsigned int v44 = [v34 urgency];
          *(_DWORD *)buf = 138413058;
          id v73 = v39;
          __int16 v74 = 2112;
          __int128 v75 = v40;
          __int16 v76 = 2112;
          __int128 v77 = v43;
          __int16 v78 = 1024;
          unsigned int v79 = v44;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "%@ : %@ : %@, urgency: %d", buf, 0x26u);

          id v29 = v53;
        }
      }

      id v31 = [v29 countByEnumeratingWithState:&v54 objects:v80 count:16];
    }

    while (v31);
  }

  return v29;
}

uint64_t __89__AppContainerCaches_cachesForInstalledApps_bytesNeeded_volume_sortForUrgency_telemetry___block_invoke( uint64_t a1,  void *a2)
{
  id v3 = a2;
  context = objc_autoreleasePoolPush();
  id v4 = (char *)[v3 caches:*(unsigned __int8 *)(a1 + 76) purge:0];
  uint64_t v32 = &v4[(void)[v3 tmp:*(unsigned __int8 *)(a1 + 76) purge:0 all:*(_DWORD *)(a1 + 72) == 4]];
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue([v3 bundleRecords]);
  id v33 = [obj countByEnumeratingWithState:&v42 objects:v47 count:16];
  if (v33)
  {
    uint64_t v31 = *(void *)v43;
    do
    {
      uint64_t v5 = 0LL;
      do
      {
        if (*(void *)v43 != v31) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v42 + 1) + 8 * v5);
        if (v32)
        {
          id v7 = *(void **)(a1 + 32);
          uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v42 + 1) + 8 * v5) bundleIdentifier]);
          uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v8]);

          if (v9)
          {
            v10 = (void *)objc_claimAutoreleasedReturnValue([v3 lastUsed]);
            id v11 = *(void **)(a1 + 32);
            v12 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleIdentifier]);
            uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v12]);
            if (!v10) {
              goto LABEL_11;
            }
            id v14 = [v10 compare:v13];

            if (v14 == (id)-1LL)
            {
              uint64_t v15 = *(void **)(a1 + 32);
              v12 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleIdentifier]);
              uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:v12]);
LABEL_11:
              [v3 setLastUsed:v13];
            }
          }
        }

        uint64_t v34 = v5;
        __int128 v40 = 0u;
        __int128 v41 = 0u;
        __int128 v38 = 0u;
        __int128 v39 = 0u;
        id v35 = (id)objc_claimAutoreleasedReturnValue([v6 groupContainerIdentifiers]);
        id v37 = [v35 countByEnumeratingWithState:&v38 objects:v46 count:16];
        if (v37)
        {
          uint64_t v36 = *(void *)v39;
          do
          {
            for (i = 0LL; i != v37; i = (char *)i + 1)
            {
              if (*(void *)v39 != v36) {
                objc_enumerationMutation(v35);
              }
              uint64_t v17 = *(void *)(*((void *)&v38 + 1) + 8LL * (void)i);
              [*(id *)(a1 + 40) addObject:v17];
              BOOL v18 = (NSMutableSet *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) objectForKeyedSubscript:v17]);
              if (!v18)
              {
                BOOL v18 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
                [*(id *)(a1 + 48) setObject:v18 forKeyedSubscript:v17];
              }

              -[NSMutableSet addObject:](v18, "addObject:", v6);
              uint64_t v19 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 56) objectForKeyedSubscript:v17]);
              if (!v19) {
                goto LABEL_22;
              }
              id v20 = (void *)v19;
              id v21 = v3;
              signed int v22 = [v3 urgency];
              dispatch_queue_t v23 = v6;
              v24 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 56) objectForKeyedSubscript:v17]);
              signed int v25 = [v24 intValue];

              id v6 = v23;
              BOOL v26 = v22 <= v25;
              id v3 = v21;
              if (!v26)
              {
LABEL_22:
                uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [v3 urgency]));
                [*(id *)(a1 + 56) setObject:v27 forKeyedSubscript:v17];
              }
            }

            id v37 = [v35 countByEnumeratingWithState:&v38 objects:v46 count:16];
          }

          while (v37);
        }

        uint64_t v5 = v34 + 1;
      }

      while ((id)(v34 + 1) != v33);
      id v33 = [obj countByEnumeratingWithState:&v42 objects:v47 count:16];
    }

    while (v33);
  }

  objc_autoreleasePoolPop(context);
  return 1LL;
}

uint64_t __89__AppContainerCaches_cachesForInstalledApps_bytesNeeded_volume_sortForUrgency_telemetry___block_invoke_2( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:v5]);
  if (v7)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:v5]);
    signed int v9 = [v8 intValue];
  }

  else
  {
    signed int v9 = 1;
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKeyedSubscript:v5]);
  if (v10 && v9 <= *(_DWORD *)(a1 + 64))
  {
    LOWORD(v13) = 0;
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[AppCache appCacheWithRecords:identifier:dataContainerURL:userManagedAssetsURL:personaUniqueString:isDataseparated:isPlaceholder:isPlugin:telemetry:]( &OBJC_CLASS___AppCache,  "appCacheWithRecords:identifier:dataContainerURL:userManagedAssetsURL:personaUniqueString:isDatasep arated:isPlaceholder:isPlugin:telemetry:",  v10,  v5,  v6,  0LL,  0LL,  0LL,  v13,  *(void *)(a1 + 48)));
    if (v11) {
      [*(id *)(a1 + 56) addObject:v11];
    }
  }

  return 1LL;
}

int64_t __89__AppContainerCaches_cachesForInstalledApps_bytesNeeded_volume_sortForUrgency_telemetry___block_invoke_3( id a1,  id a2,  id a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = v4;
  id v7 = v5;
  int v8 = [v6 urgency];
  if (v8 < (int)[v7 urgency])
  {
LABEL_6:
    int64_t v9 = -1LL;
    goto LABEL_9;
  }

  int v10 = [v6 urgency];
  v12 = (void *)objc_claimAutoreleasedReturnValue([v6 lastUsed]);
  if (v12)
  {
  }

  else
  {
    id v28 = (void *)objc_claimAutoreleasedReturnValue([v7 lastUsed]);

    if (v28) {
      goto LABEL_6;
    }
  }

  uint64_t v13 = objc_claimAutoreleasedReturnValue([v6 lastUsed]);
  if (v13)
  {
    id v14 = (void *)v13;
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v7 lastUsed]);

    if (!v15)
    {
LABEL_8:
      int64_t v9 = 1LL;
      goto LABEL_9;
    }
  }

  uint64_t v16 = objc_claimAutoreleasedReturnValue([v6 lastUsed]);
  if (!v16) {
    goto LABEL_17;
  }
  uint64_t v17 = (void *)v16;
  BOOL v18 = (void *)objc_claimAutoreleasedReturnValue([v7 lastUsed]);

  if (!v18
    || (uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v6 lastUsed]),
        id v20 = (void *)objc_claimAutoreleasedReturnValue([v7 lastUsed]),
        int64_t v9 = (int64_t)[v19 compare:v20],
        v20,
        v19,
        !v9))
  {
LABEL_17:
    id v21 = (void *)objc_claimAutoreleasedReturnValue([v6 lastKnownCacheSize]);
    id v22 = [v21 unsignedLongLongValue];
    dispatch_queue_t v23 = (void *)objc_claimAutoreleasedReturnValue([v7 lastKnownCacheSize]);
    id v24 = [v23 unsignedLongLongValue];

    if (v22 >= v24)
    {
      signed int v25 = (void *)objc_claimAutoreleasedReturnValue([v6 lastKnownCacheSize]);
      id v26 = [v25 unsignedLongLongValue];
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v7 lastKnownCacheSize]);
      int64_t v9 = v26 > [v27 unsignedLongLongValue];

      goto LABEL_9;
    }

    goto LABEL_6;
  }

- (unint64_t)processContainerCachesForVolume:(id)a3 bytesNeeded:(unint64_t)a4 urgency:(int)a5 calculate:(BOOL)a6 verbose:(BOOL)a7 telemetry:(id)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  uint64_t v11 = *(void *)&a5;
  id v14 = a3;
  id v15 = a8;
  BOOL v45 = v10;
  unint64_t v46 = a4;
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( -[AppContainerCaches cachesForInstalledApps:bytesNeeded:volume:sortForUrgency:telemetry:]( self,  "cachesForInstalledApps:bytesNeeded:volume:sortForUrgency:telemetry:",  v10,  a4,  v14,  v11,  v15));
  if (![v16 count])
  {
    uint64_t v35 = CDGetLogHandle("daemon");
    uint64_t v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_ERROR,  "No application cache space to reap",  buf,  2u);
    }

    unint64_t v30 = 0LL;
    goto LABEL_33;
  }

  BOOL v43 = v9;
  id v44 = v14;
  if (v9)
  {
    int v42 = v11;
    uint64_t v17 = CDGetLogHandle("daemon");
    BOOL v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "sorted caches:", buf, 2u);
    }

    __int128 v53 = 0u;
    __int128 v54 = 0u;
    __int128 v51 = 0u;
    __int128 v52 = 0u;
    __int128 v41 = v16;
    id v19 = v16;
    id v20 = [v19 countByEnumeratingWithState:&v51 objects:v60 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v52;
      do
      {
        for (i = 0LL; i != v21; i = (char *)i + 1)
        {
          if (*(void *)v52 != v22) {
            objc_enumerationMutation(v19);
          }
          id v24 = *(void **)(*((void *)&v51 + 1) + 8LL * (void)i);
          uint64_t v25 = CDGetLogHandle("daemon");
          id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v56 = v24;
            _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "  %@", buf, 0xCu);
          }
        }

        id v21 = [v19 countByEnumeratingWithState:&v51 objects:v60 count:16];
      }

      while (v21);
    }

    LODWORD(v11) = v42;
    uint64_t v16 = v41;
  }

  __int128 v49 = 0u;
  __int128 v50 = 0u;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  id v27 = v16;
  id v28 = [v27 countByEnumeratingWithState:&v47 objects:v59 count:16];
  if (!v28)
  {

    unint64_t v30 = 0LL;
    goto LABEL_36;
  }

  id v29 = v28;
  unint64_t v30 = 0LL;
  uint64_t v31 = *(void *)v48;
  unint64_t v32 = v46;
  do
  {
    for (j = 0LL; j != v29; j = (char *)j + 1)
    {
      if (*(void *)v48 != v31)
      {
        objc_enumerationMutation(v27);
        unint64_t v32 = v46;
      }

      uint64_t v34 = *(void **)(*((void *)&v47 + 1) + 8LL * (void)j);
      if (v32)
      {
        v30 += (unint64_t)[v34 clearCaches:(_DWORD)v11 == 4];
        if (v30 >= v32) {
          goto LABEL_26;
        }
      }

      else
      {
        v30 += (unint64_t)[v34 caches:v45 purge:0];
      }
    }

    unint64_t v32 = v46;
    id v29 = [v27 countByEnumeratingWithState:&v47 objects:v59 count:16];
  }

  while (v29);
LABEL_26:

  if (!v32)
  {
LABEL_36:
    id v14 = v44;
    if (!v43) {
      goto LABEL_40;
    }
    goto LABEL_37;
  }

  BOOL v9 = v43;
  id v14 = v44;
  if (v30)
  {
    clearDiscardedCaches(v15, 17LL, 0LL, v44);
    if (!v43) {
      goto LABEL_40;
    }
    goto LABEL_37;
  }

- (id)cdVolumeForPath:(id)a3
{
  id v4 = a3;
  bzero(&v25, 0x878uLL);
  id v5 = v4;
  if (statfs((const char *)[v5 UTF8String], &v25))
  {
    uint64_t v6 = CDGetLogHandle("daemon");
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      goto LABEL_3;
    }
    id v18 = [v5 UTF8String];
    id v19 = __error();
    id v20 = strerror(*v19);
    int v21 = 136315394;
    id v22 = v18;
    __int16 v23 = 2080;
    id v24 = v20;
    id v15 = "statfs failed for %s : %s";
    uint64_t v16 = v7;
    uint32_t v17 = 22;
LABEL_12:
    _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, v15, (uint8_t *)&v21, v17);
    goto LABEL_3;
  }

  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(-[AppContainerCaches cdVolumes](self, "cdVolumes"));
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v25.f_mntonname));
  int v8 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v10]);

  if (v8) {
    goto LABEL_6;
  }
  uint64_t v12 = objc_claimAutoreleasedReturnValue(+[CacheDeleteVolume volumeWithPath:](&OBJC_CLASS___CacheDeleteVolume, "volumeWithPath:", v5));
  if (v12)
  {
    int v8 = (void *)v12;
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[AppContainerCaches cdVolumes](self, "cdVolumes"));
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v8 mountPoint]);
    -[os_log_s setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v8, v13);

    goto LABEL_4;
  }

  uint64_t v14 = CDGetLogHandle("daemon");
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    int v21 = 138412290;
    id v22 = v5;
    id v15 = "Unable to create CDVolume from: %@";
    uint64_t v16 = v7;
    uint32_t v17 = 12;
    goto LABEL_12;
  }

- (id)appCache:(id)a3 forPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0LL;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000LL;
  id v20 = __Block_byref_object_copy__8;
  int v21 = __Block_byref_object_dispose__8;
  id v22 = 0LL;
  int v8 = (void *)objc_claimAutoreleasedReturnValue(-[AppContainerCaches mountPointForPath:](self, "mountPointForPath:", v7));
  if (v8)
  {
    BOOL v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[AppContainerCaches collection_queue](self, "collection_queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = __39__AppContainerCaches_appCache_forPath___block_invoke;
    block[3] = &unk_100059FA0;
    block[4] = self;
    id v13 = v8;
    id v14 = v6;
    id v15 = v7;
    uint64_t v16 = &v17;
    dispatch_sync(v9, block);
  }

  id v10 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v10;
}

void __39__AppContainerCaches_appCache_forPath___block_invoke(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) cachesByVolume]);
  uint64_t v11 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:*(void *)(a1 + 40)]);

  uint64_t v3 = *(void *)(a1 + 48);
  if (v3)
  {
    id v4 = v11;
    if (!v11)
    {
      uint64_t v12 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
      id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) cachesByVolume]);
      [v5 setObject:v12 forKeyedSubscript:*(void *)(a1 + 40)];

      id v4 = v12;
      uint64_t v3 = *(void *)(a1 + 48);
    }

    uint64_t v11 = v4;
    -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v3, *(void *)(a1 + 56));
LABEL_8:
    id v6 = v11;
    goto LABEL_9;
  }

  id v6 = v11;
  if (v11)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v11,  "objectForKeyedSubscript:",  *(void *)(a1 + 56)));

    if (v7)
    {
      uint64_t v8 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", *(void *)(a1 + 56)));
      uint64_t v9 = *(void *)(*(void *)(a1 + 64) + 8LL);
      id v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v8;
    }

    goto LABEL_8;
  }

- (id)mountPointForPath:(id)a3
{
  return (id)normalizePath(a3, 1LL);
}

- (id)initReadOnlyCopy
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___AppContainerCaches;
  v2 = -[AppContainerCaches init](&v10, "init");
  uint64_t v3 = v2;
  if (v2)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[AppContainerCaches info](v2, "info"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[AppContainerCaches appContainerCachesWithInfo:]( &OBJC_CLASS___AppContainerCaches,  "appContainerCachesWithInfo:",  v4));

    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 cachesByVolume]);
    id v7 = (NSMutableDictionary *)[v6 copy];
    cachesByVolume = v3->_cachesByVolume;
    v3->_cachesByVolume = v7;
  }

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[AppContainerCaches initReadOnlyCopy]( +[AppContainerCaches allocWithZone:](&OBJC_CLASS___AppContainerCaches, "allocWithZone:", a3),  "initReadOnlyCopy");
}

- (void)_servicePurgeable:(int)a3 info:(id)a4 replyBlock:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  uint64_t v9 = (void (**)(id, void *))a5;
  objc_super v10 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"]);
  uint64_t v11 = evaluateStringProperty(v10);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[CacheDeleteVolume volumeWithPath:](&OBJC_CLASS___CacheDeleteVolume, "volumeWithPath:", v12));

  uint64_t v14 = CDGetLogHandle("daemon");
  id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    uint64_t v34 = "com.apple.mobile.cache_delete_app_container_caches";
    __int16 v35 = 2114;
    id v36 = v8;
    __int16 v37 = 2114;
    __int128 v38 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "%{public}s: PURGEABLE callback, info: %{public}@, cdVol: %{public}@",  buf,  0x20u);
  }

  if (v13
    && (uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v13 mountPoint]),
        uint64_t RootVolume = getRootVolume(v16),
        id v18 = (void *)objc_claimAutoreleasedReturnValue(RootVolume),
        unsigned int v19 = [v16 isEqualToString:v18],
        v18,
        v16,
        v19))
  {
    id v20 = (void *)objc_claimAutoreleasedReturnValue(+[TestTelemetry testTelemetryWithInfo:](&OBJC_CLASS___TestTelemetry, "testTelemetryWithInfo:", v8));
    int v21 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"CACHE_DELETE_NO_CACHE"]);
    uint64_t v22 = evaluateBoolProperty(v21);

    __int16 v23 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"CACHE_DELETE_DIAGNOSTIC_INFO"]);
    uint64_t v24 = evaluateBoolProperty(v23);

    unint64_t v25 = -[AppContainerCaches processContainerCachesForVolume:bytesNeeded:urgency:calculate:verbose:telemetry:]( self,  "processContainerCachesForVolume:bytesNeeded:urgency:calculate:verbose:telemetry:",  v13,  0LL,  v6,  v22,  v24,  v20);
    id v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "mountPoint", @"CACHE_DELETE_VOLUME"));
    v31[1] = @"CACHE_DELETE_AMOUNT";
    v32[0] = v26;
    id v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v25));
    v32[1] = v27;
    id v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v32,  v31,  2LL));

    uint64_t v29 = CDGetLogHandle("daemon");
    unint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      uint64_t v34 = "com.apple.mobile.cache_delete_app_container_caches";
      __int16 v35 = 2114;
      id v36 = v28;
      _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "%{public}s PURGEABLE Result: %{public}@",  buf,  0x16u);
    }
  }

  else
  {
    id v28 = 0LL;
  }

  v9[2](v9, v28);
}

- (void)_servicePurge:(int)a3 info:(id)a4 replyBlock:(id)a5
{
  id v7 = a4;
  id v8 = (void (**)(id, id))a5;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"]);
  uint64_t v10 = evaluateStringProperty(v9);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[CacheDeleteVolume volumeWithPath:](&OBJC_CLASS___CacheDeleteVolume, "volumeWithPath:", v11));

  uint64_t v13 = CDGetLogHandle("daemon");
  uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    *(void *)&uint8_t buf[4] = "com.apple.mobile.cache_delete_app_container_caches";
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%{public}s: PURGE callback, cdVol: %{public}@",  buf,  0x16u);
  }

  if (v12)
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v12 mountPoint]);
    uint64_t RootVolume = getRootVolume(v15);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(RootVolume);
    unsigned int v18 = [v15 isEqualToString:v17];

    if (v18)
    {
      __int128 v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
      unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue(+[TestTelemetry testTelemetryWithInfo:](&OBJC_CLASS___TestTelemetry, "testTelemetryWithInfo:", v7));
      id v20 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"CACHE_DELETE_DIAGNOSTIC_INFO"]);
      char v21 = evaluateBoolProperty(v20);

      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"CACHE_DELETE_AMOUNT"]);
      uint64_t v23 = evaluateNumberProperty();
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      id v25 = [v24 unsignedLongLongValue];

      *(void *)buf = 0LL;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x2020000000LL;
      *(void *)&buf[24] = 0LL;
      if (v19)
      {
        uint64_t v26 = CDGetLogHandle("daemon");
        id v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)uint64_t v62 = 138543362;
          int v63 = v19;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "TestTelemetry: %{public}@", v62, 0xCu);
        }
      }

      id v28 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[AppContainerCaches purge_queue](self, "purge_queue"));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = __52__AppContainerCaches__servicePurge_info_replyBlock___block_invoke;
      block[3] = &unk_100059FC8;
      block[4] = self;
      __int128 v55 = buf;
      id v29 = v12;
      id v53 = v29;
      id v56 = v25;
      int v57 = a3;
      char v58 = v21;
      id v30 = v19;
      id v54 = v30;
      dispatch_sync(v28, block);

      v60[0] = @"CACHE_DELETE_VOLUME";
      uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v29 mountPoint]);
      v61[0] = v31;
      v60[1] = @"CACHE_DELETE_AMOUNT";
      unint64_t v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  *(void *)(*(void *)&buf[8] + 24LL)));
      v61[1] = v32;
      id v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v61,  v60,  2LL));
      id v34 = [v33 mutableCopy];

      if (v19)
      {
        __int16 v35 = (void *)objc_claimAutoreleasedReturnValue([v30 terminationFailures]);
        if ([v35 count])
        {

LABEL_16:
          __int16 v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
          __int128 v41 = (void *)objc_claimAutoreleasedReturnValue([v30 terminationFailures]);
          id v42 = [v41 count];

          if (v42)
          {
            BOOL v43 = (void *)objc_claimAutoreleasedReturnValue([v30 terminationFailures]);
            [v37 setObject:v43 forKeyedSubscript:@"CACHE_DELETE_TEST_TERMINATION_FAILURES"];
          }

          id v44 = (void *)objc_claimAutoreleasedReturnValue([v30 removeFailures]);
          id v45 = [v44 count];

          if (v45)
          {
            unint64_t v46 = (void *)objc_claimAutoreleasedReturnValue([v30 removeFailures]);
            [v37 setObject:v46 forKeyedSubscript:@"CACHE_DELETE_TEST_REMOVE_FAILURES"];
          }

          if ([v37 count]) {
            [v34 setObject:v37 forKeyedSubscript:@"CACHE_DELETE_TEST_FAILURES"];
          }
          goto LABEL_23;
        }

        id v39 = (void *)objc_claimAutoreleasedReturnValue([v30 removeFailures]);
        BOOL v40 = [v39 count] == 0;

        if (!v40) {
          goto LABEL_16;
        }
      }

      __int16 v37 = 0LL;
LABEL_23:
      id v38 = [v34 copy];

      _Block_object_dispose(buf, 8);
      goto LABEL_24;
    }
  }

  uint64_t v36 = CDGetLogHandle("daemon");
  __int16 v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
  if (os_log_type_enabled((os_log_t)v37, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = v7;
    _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v37,  OS_LOG_TYPE_ERROR,  "Unable to create cdVol from info: %{public}@",  buf,  0xCu);
  }

  id v38 = 0LL;
LABEL_24:

  uint64_t v47 = CDGetLogHandle("daemon");
  __int128 v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
  {
    __int128 v49 = (void *)objc_claimAutoreleasedReturnValue([v12 mountPoint]);
    *(_DWORD *)buf = 136446978;
    *(void *)&uint8_t buf[4] = "com.apple.mobile.cache_delete_app_container_caches";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = a3;
    *(_WORD *)&buf[18] = 2114;
    *(void *)&buf[20] = v49;
    *(_WORD *)&buf[28] = 2114;
    *(void *)&buf[30] = v38;
    _os_log_impl( (void *)&_mh_execute_header,  v48,  OS_LOG_TYPE_DEFAULT,  "%{public}s PURGE result: [u:%d] %{public}@ : %{public}@",  buf,  0x26u);
  }

  v8[2](v8, v38);
}

uint64_t __52__AppContainerCaches__servicePurge_info_replyBlock___block_invoke(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) opState]);
  unsigned int v3 = [v2 begin];

  if (v3)
  {
    uint64_t v4 = CDGetLogHandle("daemon");
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Purging Container Caches",  (uint8_t *)&v11,  2u);
    }

    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(a1 + 32) processContainerCachesForVolume:*(void *)(a1 + 40) bytesNeeded:*(void *)(a1 + 64) urgency:*(unsigned int *)(a1 + 72)  calculate:0 verbose:*(unsigned __int8 *)(a1 + 76) telemetry:*(void *)(a1 + 48)];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) opState]);
    [v6 end];

    if (*(void *)(a1 + 48))
    {
      uint64_t v7 = CDGetLogHandle("daemon");
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = *(void *)(a1 + 48);
        int v11 = 138543362;
        uint64_t v12 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "testTelemetry: %{public}@",  (uint8_t *)&v11,  0xCu);
      }
    }
  }

  return clearDiscardedCaches(*(void *)(a1 + 48), 17LL, 0LL, *(void *)(a1 + 40));
}

- (void)_servicePeriodic:(int)a3 info:(id)a4 replyBlock:(id)a5
{
  id v6 = a4;
  uint64_t v7 = (void (**)(id, _UNKNOWN **))a5;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"]);
  uint64_t v9 = evaluateStringProperty(v8);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  int v11 = (void *)objc_claimAutoreleasedReturnValue(+[CacheDeleteVolume volumeWithPath:](&OBJC_CLASS___CacheDeleteVolume, "volumeWithPath:", v10));

  uint64_t v12 = CDGetLogHandle("daemon");
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v11 mountPoint]);
    int v20 = 136446466;
    char v21 = "com.apple.mobile.cache_delete_app_container_caches";
    __int16 v22 = 2114;
    uint64_t v23 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%{public}s: PERIODIC callback, cdVol: %{public}@",  (uint8_t *)&v20,  0x16u);
  }

  if (v11)
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v11 mountPoint]);
    uint64_t RootVolume = getRootVolume(v15);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(RootVolume);
    unsigned int v18 = [v15 isEqualToString:v17];

    if (v18)
    {
      unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue(+[TestTelemetry testTelemetryWithInfo:](&OBJC_CLASS___TestTelemetry, "testTelemetryWithInfo:", v6));
      +[AppCache enumerateAppCachesOnVolume:options:telemetry:block:]( &OBJC_CLASS___AppCache,  "enumerateAppCachesOnVolume:options:telemetry:block:",  v11,  1LL,  v19,  &__block_literal_global_58);
      +[AppCache enumerateGroupCachesOnVolume:block:]( &OBJC_CLASS___AppCache,  "enumerateGroupCachesOnVolume:block:",  0LL,  &__block_literal_global_59);
    }
  }

  v7[2](v7, &off_10005D200);
}

BOOL __55__AppContainerCaches__servicePeriodic_info_replyBlock___block_invoke(id a1, AppCache *a2)
{
  id v2 = objc_claimAutoreleasedReturnValue(-[AppCache cachePath](a2, "cachePath"));
  enableDirStats([v2 UTF8String], 1);

  return 1;
}

BOOL __55__AppContainerCaches__servicePeriodic_info_replyBlock___block_invoke_2(id a1, NSString *a2, NSURL *a3)
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString, "stringWithUTF8String:", -[NSURL fileSystemRepresentation](a3, "fileSystemRepresentation")));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 stringByAppendingPathComponent:@"Library/Caches"]);

  id v5 = v4;
  enableDirStats([v5 UTF8String], 1);

  return 1;
}

- (void)_serviceCancelPurge:(id)a3
{
  uint64_t v4 = (void (**)(void))a3;
  uint64_t v5 = CDGetLogHandle("daemon");
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136446210;
    uint64_t v9 = "com.apple.mobile.cache_delete_app_container_caches";
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%{public}s: PURGE CANCEL callback",  (uint8_t *)&v8,  0xCu);
  }

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[AppContainerCaches opState](self, "opState"));
  [v7 cancel];

  v4[2](v4);
}

- (void)_servicePing:(id)a3
{
}

- (void)_serviceNotify:(id)a3 replyBlock:(id)a4
{
  uint64_t v4 = CDGetLogHandle("daemon");
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    int v6 = 136446210;
    uint64_t v7 = "com.apple.mobile.cache_delete_app_container_caches";
    _os_log_error_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "_serviceNotify is unsupported for %{public}s",  (uint8_t *)&v6,  0xCu);
  }
}

- (void)_serviceCallback:(id)a3 replyBlock:(id)a4
{
  id v5 = a3;
  __int128 v49 = (void (**)(id, id))a4;
  __int128 v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"CACHE_DELETE_OPERATIONS"]);
  uint64_t v7 = CDGetLogHandle("daemon");
  int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)id v61 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "com.apple.mobile.cache_delete_app_container_caches Callback ENTRY, info: %{public}@",  buf,  0xCu);
  }

  __int128 v50 = v5;

  uint64_t LocalVolumes = getLocalVolumes();
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(LocalVolumes);
  __int128 v56 = 0u;
  __int128 v57 = 0u;
  __int128 v58 = 0u;
  __int128 v59 = 0u;
  id v11 = [v10 countByEnumeratingWithState:&v56 objects:v63 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v57;
    do
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v57 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v56 + 1) + 8LL * (void)i);
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[CacheDeleteVolume volumeWithPath:](&OBJC_CLASS___CacheDeleteVolume, "volumeWithPath:", v15));
        uint64_t v17 = v16;
        if (v15)
        {
          unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue([v16 mountPoint]);
          uint64_t RootVolume = getRootVolume(v18);
          int v20 = (void *)objc_claimAutoreleasedReturnValue(RootVolume);
          unsigned int v21 = [v18 isEqualToString:v20];

          if (v21) {
            clearDiscardedCaches(0LL, 21LL, 0LL, v17);
          }
        }
      }

      id v12 = [v10 countByEnumeratingWithState:&v56 objects:v63 count:16];
    }

    while (v12);
  }

  __int128 v48 = v10;
  __int128 v54 = 0u;
  __int128 v55 = 0u;
  __int128 v52 = 0u;
  __int128 v53 = 0u;
  id v22 = v6;
  id v23 = [v22 countByEnumeratingWithState:&v52 objects:v62 count:16];
  if (v23)
  {
    id v24 = v23;
    uint64_t v25 = *(void *)v53;
    do
    {
      for (j = 0LL; j != v24; j = (char *)j + 1)
      {
        if (*(void *)v53 != v25) {
          objc_enumerationMutation(v22);
        }
        id v27 = *(void **)(*((void *)&v52 + 1) + 8LL * (void)j);
        id v28 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKeyedSubscript:v27]);
        id v29 = (void *)objc_claimAutoreleasedReturnValue([v28 objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"]);
        uint64_t v30 = evaluateStringProperty(v29);
        uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
        unint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(+[CacheDeleteVolume volumeWithPath:](&OBJC_CLASS___CacheDeleteVolume, "volumeWithPath:", v31));

        uint64_t v33 = CDGetLogHandle("daemon");
        id v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109634;
          *(_DWORD *)id v61 = 676;
          *(_WORD *)&v61[4] = 2114;
          *(void *)&v61[6] = v32;
          *(_WORD *)&v61[14] = 2114;
          *(void *)&v61[16] = v28;
          _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "%d, cdVol: %{public}@, opInfo: %{public}@",  buf,  0x1Cu);
        }

        uint64_t v35 = objc_opt_class(&OBJC_CLASS___NSDictionary);
        if ((objc_opt_isKindOfClass(v28, v35) & 1) != 0)
        {
          if ([v27 isEqualToString:@"CACHE_DELETE_PURGE_OPERATION"])
          {
            uint64_t v36 = CDGetLogHandle("daemon");
            __int16 v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
            if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              id v38 = v37;
              id v39 = "unsupported, call _servicePurge directly";
              goto LABEL_36;
            }

- (NSMutableDictionary)cachesByVolume
{
  return self->_cachesByVolume;
}

- (void)setCachesByVolume:(id)a3
{
}

- (NSMutableDictionary)cdVolumes
{
  return self->_cdVolumes;
}

- (void)setCdVolumes:(id)a3
{
}

- (OperationState)opState
{
  return self->_opState;
}

- (void)setOpState:(id)a3
{
}

- (OS_dispatch_queue)collection_queue
{
  return self->_collection_queue;
}

- (void)setCollection_queue:(id)a3
{
}

- (OS_dispatch_queue)purge_queue
{
  return self->_purge_queue;
}

- (void)setPurge_queue:(id)a3
{
}

- (NSDictionary)info
{
  return self->_info;
}

- (void)setInfo:(id)a3
{
}

- (void).cxx_destruct
{
}

@end