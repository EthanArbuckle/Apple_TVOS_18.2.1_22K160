@interface SBSnapshotServer
+ (id)secureCodableRequestClasses;
- (SBSnapshotServer)init;
- (id)cachedSnapshotForRequest:(id)a3;
- (id)executeSnapshotRequest:(id)a3;
- (void)_posterCollectionUpdatedForRole:(id)a3 previousCollection:(id)a4 updatedCollection:(id)a5;
- (void)_setupRoleObservation;
- (void)_teardownRoleObservation;
- (void)cachedSnapshotForRequest:(id)a3 reply:(id)a4;
- (void)dealloc;
- (void)executeSnapshotRequest:(id)a3 reply:(id)a4;
@end

@implementation SBSnapshotServer

+ (id)secureCodableRequestClasses
{
  uint64_t v2 = objc_opt_class(&OBJC_CLASS___PRUISSnapshotServiceRequest, a2);
  return +[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v2);
}

- (SBSnapshotServer)init
{
  if (PUIFeatureEnabled(5LL))
  {
    v31.receiver = self;
    v31.super_class = (Class)&OBJC_CLASS___SBSnapshotServer;
    v3 = -[SBSnapshotServer init](&v31, "init");
    if (v3)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue( [@"~/Library/Caches/com.apple.springboard.SBRendererService/" stringByExpandingTildeInPath]);
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](&OBJC_CLASS___NSURL, "fileURLWithPath:isDirectory:", v4, 1LL));
      v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:isDirectory:relativeToURL:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:isDirectory:relativeToURL:",  @"SnapshotServerCache",  1LL,  v5));
      v7 = (void *)objc_claimAutoreleasedReturnValue([v6 absoluteURL]);

      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      uint64_t v9 = PFPosterPathFileAttributes();
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      id v30 = 0LL;
      unsigned __int8 v11 = [v8 createDirectoryAtURL:v7 withIntermediateDirectories:1 attributes:v10 error:&v30];
      id v12 = v30;

      if ((v11 & 1) == 0)
      {
        id v13 = SBRSLogSnapshotting();
        v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          sub_100008654((uint64_t)v12, v14, v15, v16, v17, v18, v19, v20);
        }
      }

      v21 = -[PUIPosterSnapshotFilesystemCache initWithURL:]( objc_alloc(&OBJC_CLASS___PUIPosterSnapshotFilesystemCache),  "initWithURL:",  v7);
      cache = v3->_cache;
      v3->_cache = v21;

      v23 = objc_alloc(&OBJC_CLASS___PUIPosterSnapshotController);
      v24 = v3->_cache;
      v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSUUID pf_UUIDFromArbitraryString:]( &OBJC_CLASS___NSUUID,  "pf_UUIDFromArbitraryString:",  @"PUISnapshotServer"));
      v26 = -[PUIPosterSnapshotController initWithCache:instanceIdentifier:]( v23,  "initWithCache:instanceIdentifier:",  v24,  v25);
      snapshotController = v3->_snapshotController;
      v3->_snapshotController = v26;

      -[SBSnapshotServer _setupRoleObservation](v3, "_setupRoleObservation");
    }

    self = v3;
    v28 = self;
  }

  else
  {
    v28 = 0LL;
  }

  return v28;
}

- (void)dealloc
{
  snapshotController = self->_snapshotController;
  self->_snapshotController = 0LL;

  -[PUIPosterSnapshotFilesystemCache invalidate](self->_cache, "invalidate");
  cache = self->_cache;
  self->_cache = 0LL;

  -[SBSnapshotServer _teardownRoleObservation](self, "_teardownRoleObservation");
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___SBSnapshotServer;
  -[SBSnapshotServer dealloc](&v5, "dealloc");
}

- (void)executeSnapshotRequest:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 posterSnapshotRequest]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 uniqueIdentifier]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 UUIDString]);

  id v11 = SBRSLogSnapshotting();
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 path]);
    *(_DWORD *)buf = 136446722;
    v25 = "-[SBSnapshotServer executeSnapshotRequest:reply:]";
    __int16 v26 = 2114;
    v27 = v10;
    __int16 v28 = 2114;
    v29 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%{public}s RUNNING for uniqueIdentifier: %{public}@ path: %{public}@",  buf,  0x20u);
  }

  snapshotController = self->_snapshotController;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_1000076E0;
  v19[3] = &unk_10000C5D8;
  id v20 = v10;
  id v21 = v8;
  id v22 = v6;
  id v23 = v7;
  id v15 = v7;
  id v16 = v6;
  id v17 = v8;
  id v18 = v10;
  -[PUIPosterSnapshotController executeSnapshotRequest:completion:]( snapshotController,  "executeSnapshotRequest:completion:",  v17,  v19);
}

- (void)cachedSnapshotForRequest:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *, void))a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 posterSnapshotRequest]);
  id v9 = SBRSLogSnapshotting();
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 path]);
    *(_DWORD *)buf = 136446466;
    id v22 = "-[SBSnapshotServer cachedSnapshotForRequest:reply:]";
    __int16 v23 = 2114;
    v24 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}s for path: %{public}@", buf, 0x16u);
  }

  cache = self->_cache;
  id v20 = 0LL;
  id v13 = (void *)objc_claimAutoreleasedReturnValue( -[PUIPosterSnapshotFilesystemCache latestSnapshotBundleForRequest:error:]( cache,  "latestSnapshotBundleForRequest:error:",  v8,  &v20));
  id v14 = v20;
  id v15 = SBRSLogSnapshotting();
  id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  id v17 = v16;
  if (v13)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      sub_1000088B4(v8, v17);
    }

    id v18 = (void *)objc_claimAutoreleasedReturnValue( +[PRUISSnapshotServiceResponse snapshotResponseForRequest:snapshotBundle:]( &OBJC_CLASS___PRUISSnapshotServiceResponse,  "snapshotResponseForRequest:snapshotBundle:",  v6,  v13));
  }

  else
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_10000883C();
    }

    uint64_t v19 = v14;
    if (!v14) {
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSError sbSnapshotService_errorWithCode:]( &OBJC_CLASS___NSError,  "sbSnapshotService_errorWithCode:",  0LL));
    }
    id v18 = (void *)objc_claimAutoreleasedReturnValue( +[PRUISSnapshotServiceResponse errorResponseForRequest:error:]( &OBJC_CLASS___PRUISSnapshotServiceResponse,  "errorResponseForRequest:error:",  v6,  v19));
    if (!v14) {
  }
    }

  v7[2](v7, v18, 0LL);
}

- (id)cachedSnapshotForRequest:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue([v4 posterSnapshotRequest]);
  cache = self->_cache;
  uint64_t v11 = 0LL;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[PUIPosterSnapshotFilesystemCache latestSnapshotBundleForRequest:error:]( cache,  "latestSnapshotBundleForRequest:error:",  v5,  &v11));
  if (v11) {
    uint64_t v8 = objc_claimAutoreleasedReturnValue( +[PRUISSnapshotServiceResponse errorResponseForRequest:error:]( &OBJC_CLASS___PRUISSnapshotServiceResponse,  "errorResponseForRequest:error:",  v4));
  }
  else {
    uint64_t v8 = objc_claimAutoreleasedReturnValue( +[PRUISSnapshotServiceResponse snapshotResponseForRequest:snapshotBundle:]( &OBJC_CLASS___PRUISSnapshotServiceResponse,  "snapshotResponseForRequest:snapshotBundle:",  v4,  v7));
  }
  id v9 = (void *)v8;

  return v9;
}

- (id)executeSnapshotRequest:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue([v4 posterSnapshotRequest]);
  id v6 = dispatch_group_create();
  dispatch_group_enter(v6);
  uint64_t v22 = 0LL;
  __int16 v23 = &v22;
  uint64_t v24 = 0x3032000000LL;
  v25 = sub_100007C84;
  __int16 v26 = sub_100007C94;
  id v27 = 0LL;
  uint64_t v16 = 0LL;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000LL;
  uint64_t v19 = sub_100007C84;
  id v20 = sub_100007C94;
  id v21 = 0LL;
  snapshotController = self->_snapshotController;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100007C9C;
  v12[3] = &unk_10000C600;
  id v14 = &v16;
  id v15 = &v22;
  uint64_t v8 = v6;
  id v13 = v8;
  -[PUIPosterSnapshotController executeSnapshotRequest:completion:]( snapshotController,  "executeSnapshotRequest:completion:",  v5,  v12);
  dispatch_group_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  if (v17[5])
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[PRUISSnapshotServiceResponse errorResponseForRequest:error:]( &OBJC_CLASS___PRUISSnapshotServiceResponse,  "errorResponseForRequest:error:",  v4));
  }

  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue([(id)v23[5] snapshotBundle]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[PRUISSnapshotServiceResponse snapshotResponseForRequest:snapshotBundle:]( &OBJC_CLASS___PRUISSnapshotServiceResponse,  "snapshotResponseForRequest:snapshotBundle:",  v4,  v10));
  }

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v9;
}

- (void)_setupRoleObservation
{
  if (!self->_roleToObserver)
  {
    v3 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    uint64_t v4 = PFPosterRolesSupportedForCurrentDeviceClass();
    id obj = (id)objc_claimAutoreleasedReturnValue(v4);
    id v5 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v19;
      do
      {
        id v7 = 0LL;
        do
        {
          if (*(void *)v19 != v6) {
            objc_enumerationMutation(obj);
          }
          uint64_t v8 = *(void *)(*((void *)&v18 + 1) + 8LL * (void)v7);
          id v9 = -[PRSWallpaperObserver initWithExplanation:]( objc_alloc(&OBJC_CLASS___PRSWallpaperObserver),  "initWithExplanation:",  @"SBSnapshotServer");
          id v10 = objc_alloc_init(&OBJC_CLASS___PRSWallpaperObserverConfiguration);
          objc_initWeak(&location, self);
          id v11 = [[PRSPosterRoleCollectionObserver alloc] initWithRole:v8 needsSandboxExtensions:1];
          [v10 setPostersCollectionRoleObserver:v11];
          v15[0] = _NSConcreteStackBlock;
          v15[1] = 3221225472LL;
          v15[2] = sub_100007F78;
          v15[3] = &unk_10000C628;
          objc_copyWeak(&v16, &location);
          v15[4] = v8;
          [v11 setHandler:v15];
          -[PRSWallpaperObserver activateWithConfiguration:](v9, "activateWithConfiguration:", v10);
          -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v9, v8);
          objc_destroyWeak(&v16);

          objc_destroyWeak(&location);
          id v7 = (char *)v7 + 1;
        }

        while (v5 != v7);
        id v5 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
      }

      while (v5);
    }

    id v12 = (NSDictionary *)-[NSMutableDictionary copy](v3, "copy");
    roleToObserver = self->_roleToObserver;
    self->_roleToObserver = v12;
  }

- (void)_teardownRoleObservation
{
  roleToObserver = self->_roleToObserver;
  self->_roleToObserver = 0LL;
}

- (void)_posterCollectionUpdatedForRole:(id)a3 previousCollection:(id)a4 updatedCollection:(id)a5
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue([a5 differenceFromOrderedSet:a4]);
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "removals", 0, 0));
  id v7 = (char *)[v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v11;
    while (1)
    {
      if (*(void *)v11 != v9) {
        objc_enumerationMutation(v6);
      }
      if (!--v8)
      {
        uint64_t v8 = (char *)[v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (!v8) {
          break;
        }
      }
    }
  }
}

- (void).cxx_destruct
{
}

@end