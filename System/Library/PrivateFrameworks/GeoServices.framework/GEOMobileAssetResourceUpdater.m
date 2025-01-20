@interface GEOMobileAssetResourceUpdater
+ (id)sharedUpdater;
+ (void)run;
+ (void)submitBackgroundTasksNeededDuringDaemonStart;
- (id)initInternal;
- (void)_fetchAssets;
- (void)_processResources:(id)a3 group:(id)a4;
- (void)_pruneOldResourcesIn:(id)a3;
- (void)_update:(id)a3;
- (void)_updateComplete;
- (void)_updateOnQueue;
@end

@implementation GEOMobileAssetResourceUpdater

+ (id)sharedUpdater
{
  if (qword_10006AF58 != -1) {
    dispatch_once(&qword_10006AF58, &stru_1000597C0);
  }
  return (id)qword_10006AF50;
}

- (id)initInternal
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___GEOMobileAssetResourceUpdater;
  v2 = -[GEOMobileAssetResourceUpdater init](&v11, "init");
  if (v2)
  {
    uint64_t v3 = geo_dispatch_queue_create_with_workloop_qos("com.apple.geo.ma.update", 5LL);
    uint64_t v4 = objc_claimAutoreleasedReturnValue(v3);
    updateWorkQueue = v2->_updateWorkQueue;
    v2->_updateWorkQueue = (OS_dispatch_queue *)v4;

    double Double = GEOConfigGetDouble( GeoServicesConfig_MobileAssetUpdateStartedAt[0],  GeoServicesConfig_MobileAssetUpdateStartedAt[1]);
    if (Double > 0.0 && Double < GEOGetMonotonicTime())
    {
      id v7 = sub_100018084();
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "Was updating when geod quit, re-starting update",  v10,  2u);
      }

      -[GEOMobileAssetResourceUpdater _update:](v2, "_update:", 0LL);
    }
  }

  return v2;
}

+ (void)submitBackgroundTasksNeededDuringDaemonStart
{
  if (sub_100017C50(0LL))
  {
    id v2 = [sub_100017D6C() sharedScheduler];
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
    uint64_t v4 = (const __CFString *)GEOMobileAssetResourceUpdaterTaskIdentifier;
    v5 = (void *)objc_claimAutoreleasedReturnValue([v3 taskRequestForIdentifier:GEOMobileAssetResourceUpdaterTaskIdentifier]);
    if (v5)
    {
      id v6 = sub_100018084();
      id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        v16 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "MobileAsset background task is already scheduled (%{public}@)",  buf,  0xCu);
      }
    }

    else
    {
      id v7 = (os_log_s *)[objc_alloc((Class)sub_100017F7C()) initWithIdentifier:v4];
      unint64_t Double = (unint64_t)GEOConfigGetDouble( GeoServicesConfig_MobileAssetUpdateInterval[0],  GeoServicesConfig_MobileAssetUpdateInterval[1]);
      if (Double <= 0x3840) {
        unint64_t Double = 14400LL;
      }
      if (Double >= 0x278D00) {
        unint64_t Double = 2592000LL;
      }
      -[os_log_s setInterval:](v7, "setInterval:", (double)Double);
      -[os_log_s setPriority:](v7, "setPriority:", 1LL);
      -[os_log_s setRequiresExternalPower:](v7, "setRequiresExternalPower:", 1LL);
      -[os_log_s setRequiresNetworkConnectivity:](v7, "setRequiresNetworkConnectivity:", 1LL);
      -[os_log_s setRequiresInexpensiveNetworkConnectivity:](v7, "setRequiresInexpensiveNetworkConnectivity:", 1LL);
      -[os_log_s setNetworkDownloadSize:](v7, "setNetworkDownloadSize:", 10485760LL);
      id v14 = 0LL;
      unsigned __int8 v9 = [v3 submitTaskRequest:v7 error:&v14];
      v10 = (__CFString *)v14;
      if ((v9 & 1) == 0)
      {
        id v11 = sub_100018084();
        v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          v13 = @"Unknown";
          if (v10) {
            v13 = v10;
          }
          *(_DWORD *)buf = 138412290;
          v16 = v13;
          _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "Failed to submit repeating task with error: %@",  buf,  0xCu);
        }
      }
    }
  }

+ (void)run
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([a1 sharedUpdater]);
  [v2 _update:0];
}

- (void)_update:(id)a3
{
  id v4 = a3;
  updateWorkQueue = (dispatch_queue_s *)self->_updateWorkQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100016218;
  v7[3] = &unk_100059520;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(updateWorkQueue, v7);
}

- (void)_updateOnQueue
{
  if (self->_running)
  {
    id v2 = sub_100018084();
    uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Already running, will not start again", buf, 2u);
    }
  }

  else
  {
    self->_running = 1;
    double v5 = GEOGetMonotonicTime();
    GEOConfigSetDouble( GeoServicesConfig_MobileAssetUpdateStartedAt[0],  GeoServicesConfig_MobileAssetUpdateStartedAt[1],  v5);
    id v6 = sub_100018084();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Fetching MA catalog", buf, 2u);
    }

    uint64_t v3 = (os_log_s *)objc_alloc_init((Class)sub_10001A604());
    -[os_log_s setAllowsCellularAccess:](v3, "setAllowsCellularAccess:", 0LL);
    -[os_log_s setAllowsExpensiveAccess:](v3, "setAllowsExpensiveAccess:", 0LL);
    -[os_log_s setDiscretionary:](v3, "setDiscretionary:", 1LL);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100016398;
    v8[3] = &unk_100059810;
    v8[4] = self;
    [sub_10001A3F4() startCatalogDownload:@"com.apple.MobileAsset.GeoPolygonDataAssets" options:v3 then:v8];
  }
}

- (void)_updateComplete
{
  id v3 = sub_100018084();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)double v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Update complete", v5, 2u);
  }

  self->_running = 0;
  _GEOConfigRemoveValue( GeoServicesConfig_MobileAssetUpdateStartedAt[0],  GeoServicesConfig_MobileAssetUpdateStartedAt[1]);
}

- (void)_fetchAssets
{
  id v3 = dispatch_group_create();
  id v4 = sub_100023B80();
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(v4);
  id v5 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      id v8 = 0LL;
      do
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(obj);
        }
        unsigned __int8 v9 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)v8);
        dispatch_group_enter(v3);
        updateWorkQueue = self->_updateWorkQueue;
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472LL;
        v14[2] = sub_1000166B8;
        v14[3] = &unk_100059838;
        v14[4] = v9;
        v15 = v3;
        v16 = self;
        [v9 listResources:1 queue:updateWorkQueue results:v14];

        id v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v6);
  }

  id v11 = (dispatch_queue_s *)self->_updateWorkQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000167D0;
  block[3] = &unk_100059190;
  block[4] = self;
  dispatch_group_notify(v3, v11, block);
}

- (void)_processResources:(id)a3 group:(id)a4
{
  id v6 = a4;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_100016970;
  v19[3] = &unk_100059048;
  id v7 = [a3 mutableCopy];
  id v20 = v7;
  v21 = self;
  id v8 = v6;
  id v22 = v8;
  unsigned __int8 v9 = objc_retainBlock(v19);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v7 lastObject]);
  if (((unint64_t)[v10 state] | 4) == 4
    || (id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 resourceInfo]),
        unint64_t v12 = (unint64_t)[v11 policy],
        v11,
        (v12 & 0xFFFFFFFFFFFFFFFELL) == 2)
    && (v13 = (void *)objc_claimAutoreleasedReturnValue([v10 resourceInfo]),
        unsigned int v14 = [v13 isExpired],
        v13,
        v14))
  {
    ((void (*)(void *))v9[2])(v9);
  }

  else
  {
    updateWorkQueue = self->_updateWorkQueue;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_1000169A4;
    v16[3] = &unk_100059860;
    id v17 = v10;
    __int128 v18 = v9;
    [v17 downloadWithOptions:0 queue:updateWorkQueue completion:v16];
  }
}

- (void)_pruneOldResourcesIn:(id)a3
{
  id v3 = a3;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v36 objects:v45 count:16];
  if (v4)
  {
    id v5 = v4;
    id v6 = 0LL;
    uint64_t v7 = *(void *)v37;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v37 != v7) {
          objc_enumerationMutation(v3);
        }
        unsigned __int8 v9 = *(void **)(*((void *)&v36 + 1) + 8LL * (void)i);
        if (((unint64_t)[v9 state] & 0xFFFFFFFFFFFFFFFELL) == 2)
        {
          if (!v6) {
            id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
          }
          [v6 addObject:v9];
        }
      }

      id v5 = [v3 countByEnumeratingWithState:&v36 objects:v45 count:16];
    }

    while (v5);
  }

  else
  {
    id v6 = 0LL;
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue([v6 lastObject]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 resourceInfo]);
  unint64_t v12 = (char *)[v11 policy];

  v29 = v10;
  v30 = v3;
  if ((unint64_t)(v12 - 2) >= 2)
  {
    goto LABEL_18;
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "resourceInfo", v10, v3));
  unsigned __int8 v14 = [v13 isExpired];

  if ((v14 & 1) == 0) {
LABEL_18:
  }
    objc_msgSend(v6, "removeLastObject", v29);
LABEL_19:
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  id v15 = v6;
  id v16 = [v15 countByEnumeratingWithState:&v32 objects:v44 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v33;
    do
    {
      for (j = 0LL; j != v17; j = (char *)j + 1)
      {
        if (*(void *)v33 != v18) {
          objc_enumerationMutation(v15);
        }
        id v20 = *(void **)(*((void *)&v32 + 1) + 8LL * (void)j);
        id v21 = sub_100018084();
        id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v41 = v20;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "Will delete old resource %@", buf, 0xCu);
        }

        id v31 = 0LL;
        unsigned int v23 = [v20 remove:&v31];
        id v24 = v31;
        v25 = v24;
        if (v23) {
          BOOL v26 = v24 == 0LL;
        }
        else {
          BOOL v26 = 0;
        }
        if (!v26)
        {
          id v27 = sub_100018084();
          v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v41 = v20;
            __int16 v42 = 2112;
            v43 = v25;
            _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_ERROR,  "Unable to delete old resource %@: %@",  buf,  0x16u);
          }
        }
      }

      id v17 = [v15 countByEnumeratingWithState:&v32 objects:v44 count:16];
    }

    while (v17);
  }
}

- (void).cxx_destruct
{
}

@end