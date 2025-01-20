@interface GEOMobileAssetResourceServer
+ (id)identifier;
+ (id)possibleBackgroundTaskIdentifiers;
+ (unint64_t)launchMode;
+ (void)submitBackgroundTasksNeededDuringDaemonStart;
- (BOOL)handleIncomingMessage:(id)a3 withObject:(id)a4 fromPeer:(id)a5 signpostId:(unint64_t)a6;
- (GEOMobileAssetResourceServer)initWithDaemon:(id)a3;
- (unint64_t)_processPurgableResourcesForUrgency:(int)a3 purgeSize:(unint64_t)a4 error:(id *)a5;
- (unint64_t)freePurgableDiskSpace:(unint64_t)a3 urgency:(int)a4;
- (unint64_t)purgableDiskSpaceForUrgency:(int)a3;
- (void)calculateFreeableWithRequest:(id)a3;
- (void)fetchWithRequest:(id)a3;
- (void)purgeDiskCacheWithRequest:(id)a3;
- (void)reportCorruptWithRequest:(id)a3;
- (void)runBackgroundTask:(id)a3;
- (void)updateWithMessage:(id)a3;
@end

@implementation GEOMobileAssetResourceServer

+ (id)identifier
{
  return @"MAResources";
}

+ (unint64_t)launchMode
{
  return 1LL;
}

+ (id)possibleBackgroundTaskIdentifiers
{
  return &off_10005E820;
}

- (BOOL)handleIncomingMessage:(id)a3 withObject:(id)a4 fromPeer:(id)a5 signpostId:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  int v13 = sub_100011D18(v10);
  BOOL v16 = 0;
  if (v13 <= 1409)
  {
    if (v13 == 522)
    {
      uint64_t v32 = objc_opt_class(&OBJC_CLASS___GEOMAResourceFetchRequest, v14, v15);
      id v33 = sub_100012270(@"MAResources", v10, v11, v32, v12);
      v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
      v22 = v34;
      BOOL v16 = v34 != 0LL;
      if (v34)
      {
        [v34 setSignpostId:a6];
        -[GEOMobileAssetResourceServer fetchWithRequest:](self, "fetchWithRequest:", v22);
        goto LABEL_20;
      }

      goto LABEL_21;
    }

    if (v13 == 643)
    {
      if (!sub_100012B28(v12, v11, @"MAResources", v10, &off_10005E838, 0LL))
      {
        BOOL v16 = 1;
        goto LABEL_22;
      }

      id v23 = [[GEOMessage alloc] initWithXPCMessage:v11 peer:v12];
      v22 = v23;
      BOOL v16 = v23 != 0LL;
      if (!v23) {
        goto LABEL_21;
      }
      [v23 setSignpostId:a6];
      -[GEOMobileAssetResourceServer updateWithMessage:](self, "updateWithMessage:", v22);
      goto LABEL_20;
    }
  }

  else
  {
    switch(v13)
    {
      case 1410:
        BOOL v16 = 1;
        if (sub_100012B28(v12, v11, @"MAResources", v10, &off_10005E868, 1LL))
        {
          uint64_t v26 = objc_opt_class(&OBJC_CLASS___GEOMAResourcePurgeCacheToSizeRequest, v24, v25);
          id v27 = sub_100012270(@"MAResources", v10, v11, v26, v12);
          v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
          v22 = v28;
          BOOL v16 = v28 != 0LL;
          if (v28)
          {
            [v28 setSignpostId:a6];
            -[GEOMobileAssetResourceServer purgeDiskCacheWithRequest:](self, "purgeDiskCacheWithRequest:", v22);
            goto LABEL_20;
          }

- (GEOMobileAssetResourceServer)initWithDaemon:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___GEOMobileAssetResourceServer;
  v3 = -[GEOMobileAssetResourceServer initWithDaemon:](&v6, "initWithDaemon:", a3);
  id v4 = +[GEOMobileAssetResourceUpdater sharedUpdater](&OBJC_CLASS___GEOMobileAssetResourceUpdater, "sharedUpdater");
  return v3;
}

- (void)updateWithMessage:(id)a3
{
  id v3 = a3;
  +[GEOMobileAssetResourceUpdater run](&OBJC_CLASS___GEOMobileAssetResourceUpdater, "run");
  [v3 sendReply:&__NSDictionary0__struct];
}

- (void)fetchWithRequest:(id)a3
{
  id v3 = a3;
  id v4 = [[GEOMAResourceFetchReply alloc] initWithRequest:v3];
  id v5 = [v3 type];
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v3 extras]);
  v7 = sub_100023CE4((uint64_t)v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  if (v8)
  {
    uint64_t v9 = qos_class_self();
    global_workloop = (void *)geo_get_global_workloop(v9);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1000261FC;
    v13[3] = &unk_10005A1D0;
    id v14 = v4;
    id v15 = v8;
    id v16 = v3;
    id v17 = global_workloop;
    id v11 = global_workloop;
    [v15 listResources:0 queue:v11 results:v13];
  }

  else
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSError GEOErrorWithCode:reason:]( &OBJC_CLASS___NSError,  "GEOErrorWithCode:reason:",  -10LL,  @"Unrecognized type"));
    [v4 setError:v12];

    [v4 send];
  }
}

- (void)reportCorruptWithRequest:(id)a3
{
  id v4 = a3;
  double v5 = GEOGetMonotonicTime();
  double lastCorruptMessage = self->_lastCorruptMessage;
  if (lastCorruptMessage
     + GEOConfigGetDouble( GeoServicesConfig_MAResourceCorruptDeletionHoldDown[0],  GeoServicesConfig_MAResourceCorruptDeletionHoldDown[1]) <= v5)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 url]);
    unsigned __int8 v11 = [v10 isFileURL];

    if ((v11 & 1) == 0)
    {
      id v32 = sub_100018084();
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
        goto LABEL_23;
      }
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v4 url]);
      *(_DWORD *)buf = 138412290;
      double v41 = *(double *)&v14;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_FAULT,  "Will not remove MAResource, URL is not a file URL: \"%@\"",  buf,  0xCu);
LABEL_22:

      goto LABEL_23;
    }

    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[GEOFilePaths urlFor:](&OBJC_CLASS___GEOFilePaths, "urlFor:", 15LL));
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v12 URLByResolvingSymlinksInPath]);

    int v13 = (void *)objc_claimAutoreleasedReturnValue([v4 url]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 URLByResolvingSymlinksInPath]);

    id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 absoluteString]);
    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s absoluteString](v8, "absoluteString"));
    unsigned __int8 v17 = [v15 hasPrefix:v16];

    if ((v17 & 1) != 0)
    {
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v4 url]);
      id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 path]);
      unsigned __int8 v21 = [v18 fileExistsAtPath:v20];

      if ((v21 & 1) != 0)
      {
        self->_double lastCorruptMessage = v5;
        v22 = (void *)objc_claimAutoreleasedReturnValue([v4 url]);
        id v39 = 0LL;
        unsigned __int8 v23 = +[GEOMAResource removeResourceAt:error:]( &OBJC_CLASS___GEOMAResource,  "removeResourceAt:error:",  v22,  &v39);
        uint64_t v24 = (os_log_s *)v39;

        id v25 = sub_100018084();
        uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
        id v27 = v26;
        if ((v23 & 1) != 0)
        {
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            double v41 = *(double *)&v14;
            v28 = "Removed corrupt MAResource at \"%@\"";
            uint64_t v29 = v27;
            os_log_type_t v30 = OS_LOG_TYPE_DEBUG;
            uint32_t v31 = 12;
LABEL_19:
            _os_log_impl((void *)&_mh_execute_header, v29, v30, v28, buf, v31);
          }
        }

        else if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412546;
          double v41 = *(double *)&v14;
          __int16 v42 = 2112;
          v43 = v24;
          v28 = "Failed to remove corrupt MAResource at %@: %@";
          uint64_t v29 = v27;
          os_log_type_t v30 = OS_LOG_TYPE_FAULT;
          uint32_t v31 = 22;
          goto LABEL_19;
        }

        goto LABEL_21;
      }

      id v38 = sub_100018084();
      uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        double v41 = *(double *)&v14;
        v34 = "Can not remove MAResource, no file/dir found at \"%@\"";
        v35 = v24;
        os_log_type_t v36 = OS_LOG_TYPE_ERROR;
        uint32_t v37 = 12;
        goto LABEL_16;
      }
    }

    else
    {
      id v33 = sub_100018084();
      uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412546;
        double v41 = *(double *)&v14;
        __int16 v42 = 2112;
        v43 = v8;
        v34 = "Will not remove URL, is not an MAResource: \"%@\" (expected prefix: \"%@\"";
        v35 = v24;
        os_log_type_t v36 = OS_LOG_TYPE_FAULT;
        uint32_t v37 = 22;
LABEL_16:
        _os_log_impl((void *)&_mh_execute_header, v35, v36, v34, buf, v37);
      }
    }

- (unint64_t)_processPurgableResourcesForUrgency:(int)a3 purgeSize:(unint64_t)a4 error:(id *)a5
{
  id v6 = sub_100018084();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218240;
    unint64_t v54 = a4;
    __int16 v55 = 1024;
    LODWORD(v56) = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "Looking for %llu bytes of purgable resources at urgency %d",  buf,  0x12u);
  }

  id v8 = sub_100023B80();
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(v8);
  id v9 = [obj countByEnumeratingWithState:&v48 objects:v57 count:16];
  if (!v9)
  {
    unint64_t v12 = 0LL;
    goto LABEL_46;
  }

  id v11 = v9;
  unint64_t v12 = 0LL;
  uint64_t v13 = *(void *)v49;
  if (a4) {
    id v14 = "purging";
  }
  else {
    id v14 = "counting";
  }
  id v38 = v14;
  *(void *)&__int128 v10 = 136315394LL;
  __int128 v37 = v10;
  uint64_t v39 = *(void *)v49;
  do
  {
    id v15 = 0LL;
    id v40 = v11;
    do
    {
      if (*(void *)v49 != v13) {
        objc_enumerationMutation(obj);
      }
      id v16 = *(void **)(*((void *)&v48 + 1) + 8LL * (void)v15);
      id v17 = objc_msgSend(v16, "policy", v37);
      if (v17 == (id)3)
      {
        if (a3 <= 1)
        {
          id v23 = sub_100018084();
          uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
          if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_42;
          }
          *(_DWORD *)buf = v37;
          unint64_t v54 = (unint64_t)v38;
          __int16 v55 = 2112;
          v56 = v16;
          id v20 = v19;
          unsigned __int8 v21 = "Resource has policy auto update, not %s: %@";
          goto LABEL_22;
        }
      }

      else if (v17 == (id)2)
      {
        if (a3 <= 2)
        {
          id v22 = sub_100018084();
          uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
          if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_42;
          }
          *(_DWORD *)buf = v37;
          unint64_t v54 = (unint64_t)v38;
          __int16 v55 = 2112;
          v56 = v16;
          id v20 = v19;
          unsigned __int8 v21 = "Resource has policy prefetch, not %s: %@";
          goto LABEL_22;
        }
      }

      else if (v17 == (id)1)
      {
        id v18 = sub_100018084();
        uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
        if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_42;
        }
        *(_DWORD *)buf = v37;
        unint64_t v54 = (unint64_t)v38;
        __int16 v55 = 2112;
        v56 = v16;
        id v20 = v19;
        unsigned __int8 v21 = "Resource has policy required, not %s: %@";
LABEL_22:
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, v21, buf, 0x16u);
        goto LABEL_42;
      }

      __int128 v46 = 0u;
      __int128 v47 = 0u;
      __int128 v44 = 0u;
      __int128 v45 = 0u;
      uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue([v16 installedResources]);
      id v24 = -[os_log_s countByEnumeratingWithState:objects:count:]( v19,  "countByEnumeratingWithState:objects:count:",  &v44,  v52,  16LL);
      if (v24)
      {
        id v25 = v24;
        uint64_t v26 = *(void *)v45;
        do
        {
          for (i = 0LL; i != v25; i = (char *)i + 1)
          {
            if (*(void *)v45 != v26) {
              objc_enumerationMutation(v19);
            }
            v28 = *(void **)(*((void *)&v44 + 1) + 8LL * (void)i);
            id v29 = [v28 size];
            id v30 = v29;
            if (a4)
            {
              if (v12 < a4)
              {
                id v31 = sub_100018084();
                id v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
                if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  unint64_t v54 = (unint64_t)v28;
                  _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEBUG, "Purging resource: %@", buf, 0xCu);
                }

                else {
                  id v33 = 0LL;
                }
                v12 += (unint64_t)v33;
              }

              if (v12 >= a4) {
                goto LABEL_41;
              }
            }

            else
            {
              v12 += (unint64_t)v29;
            }
          }

          id v25 = -[os_log_s countByEnumeratingWithState:objects:count:]( v19,  "countByEnumeratingWithState:objects:count:",  &v44,  v52,  16LL);
        }

        while (v25);
LABEL_41:
        uint64_t v13 = v39;
        id v11 = v40;
      }

- (unint64_t)purgableDiskSpaceForUrgency:(int)a3
{
  return -[GEOMobileAssetResourceServer _processPurgableResourcesForUrgency:purgeSize:error:]( self,  "_processPurgableResourcesForUrgency:purgeSize:error:",  *(void *)&a3,  0LL,  0LL);
}

- (unint64_t)freePurgableDiskSpace:(unint64_t)a3 urgency:(int)a4
{
  return -[GEOMobileAssetResourceServer _processPurgableResourcesForUrgency:purgeSize:error:]( self,  "_processPurgableResourcesForUrgency:purgeSize:error:",  *(void *)&a4,  a3,  0LL);
}

- (void)calculateFreeableWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = [[GEOMAResourceCalculateFreeableSizeReply alloc] initWithRequest:v4];
  id v6 = [v4 urgency];

  id v9 = 0LL;
  unint64_t v7 = -[GEOMobileAssetResourceServer _processPurgableResourcesForUrgency:purgeSize:error:]( self,  "_processPurgableResourcesForUrgency:purgeSize:error:",  v6,  0LL,  &v9);
  id v8 = v9;
  [v5 setSize:v7];
  [v5 setError:v8];

  [v5 send];
}

- (void)purgeDiskCacheWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = [[GEOMAResourcePurgeCacheToSizeReply alloc] initWithRequest:v4];
  id v6 = [v4 urgency];
  id v7 = [v4 targetSize];

  id v10 = 0LL;
  unint64_t v8 = -[GEOMobileAssetResourceServer _processPurgableResourcesForUrgency:purgeSize:error:]( self,  "_processPurgableResourcesForUrgency:purgeSize:error:",  v6,  v7,  &v10);
  id v9 = v10;
  [v5 setAmountDeleted:v8];
  [v5 setError:v9];

  [v5 send];
}

- (void)runBackgroundTask:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  GEOBackgroundTaskReportReportTaskInitiated();

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  unsigned int v7 = [v6 isEqualToString:GEOMobileAssetResourceUpdaterTaskIdentifier];

  if (v7)
  {
    unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[GEOMobileAssetResourceUpdater sharedUpdater]( &OBJC_CLASS___GEOMobileAssetResourceUpdater,  "sharedUpdater"));
    [v8 triggerUpdate:v4];
  }

  else
  {
    v9.receiver = self;
    v9.super_class = (Class)&OBJC_CLASS___GEOMobileAssetResourceServer;
    -[GEOMobileAssetResourceServer runBackgroundTask:](&v9, "runBackgroundTask:", v4);
  }
}

+ (void)submitBackgroundTasksNeededDuringDaemonStart
{
}

@end