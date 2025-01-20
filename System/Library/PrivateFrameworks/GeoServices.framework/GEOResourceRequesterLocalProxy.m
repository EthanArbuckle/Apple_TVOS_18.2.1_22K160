@interface GEOResourceRequesterLocalProxy
- (GEOResourceRequesterLocalProxy)init;
- (id)_finished:(id)a3 withResult:(id)a4 error:(id)a5;
- (id)resourcesRequested:(id)a3 forHandler:(id)a4 queue:(id)a5 wantsUnpacked:(BOOL)a6 signpost:(unint64_t)a7;
- (void)_cleanUpFinishedHandlers:(id)a3;
- (void)_failAllPendingRequests;
- (void)_fetchResources:(id)a3 force:(BOOL)a4 manifestConfiguration:(id)a5 destination:(id)a6 additionalDestination:(id)a7 auditToken:(id)a8 signpostID:(unint64_t)a9;
- (void)_fetchResources:(id)a3 force:(BOOL)a4 unpack:(BOOL)a5 manifestConfiguration:(id)a6 auditToken:(id)a7 signpostID:(unint64_t)a8 queue:(id)a9 handler:(id)a10;
- (void)_resetRequestTimeout;
- (void)dealloc;
- (void)didResolvePaths:(id)a3 forResources:(id)a4;
- (void)failedToResolveResources:(id)a3 withError:(id)a4;
- (void)fetchResources:(id)a3 force:(BOOL)a4 unpack:(BOOL)a5 manifestConfiguration:(id)a6 auditToken:(id)a7 signpostID:(unint64_t)a8 queue:(id)a9 handler:(id)a10;
@end

@implementation GEOResourceRequesterLocalProxy

- (GEOResourceRequesterLocalProxy)init
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___GEOResourceRequesterLocalProxy;
  v2 = -[GEOResourceRequesterLocalProxy init](&v12, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    requestHandlersPending = v2->_requestHandlersPending;
    v2->_requestHandlersPending = (NSMutableDictionary *)v3;

    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    inProgressLoaders = v2->_inProgressLoaders;
    v2->_inProgressLoaders = (NSMutableArray *)v5;

    requestTimeoutTimer = v2->_requestTimeoutTimer;
    v2->_requestTimeoutTimer = 0LL;

    uint64_t v8 = geo_dispatch_queue_create_with_workloop_qos("ResourceRequesterLocalProxy", 21LL);
    uint64_t v9 = objc_claimAutoreleasedReturnValue(v8);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v9;
  }

  return v2;
}

- (void)fetchResources:(id)a3 force:(BOOL)a4 unpack:(BOOL)a5 manifestConfiguration:(id)a6 auditToken:(id)a7 signpostID:(unint64_t)a8 queue:(id)a9 handler:(id)a10
{
  id v16 = a3;
  id v17 = a6;
  id v18 = a7;
  id v19 = a9;
  id v20 = a10;
  workQueue = (dispatch_queue_s *)self->_workQueue;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = sub_10002DA88;
  v28[3] = &unk_10005A5F0;
  v28[4] = self;
  id v29 = v16;
  BOOL v35 = a4;
  BOOL v36 = a5;
  id v30 = v17;
  id v31 = v18;
  id v33 = v20;
  unint64_t v34 = a8;
  id v32 = v19;
  id v22 = v20;
  id v23 = v19;
  id v24 = v18;
  id v25 = v17;
  id v26 = v16;
  dispatch_block_t v27 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v28);
  dispatch_async(workQueue, v27);
}

- (void)_fetchResources:(id)a3 force:(BOOL)a4 unpack:(BOOL)a5 manifestConfiguration:(id)a6 auditToken:(id)a7 signpostID:(unint64_t)a8 queue:(id)a9 handler:(id)a10
{
  BOOL v13 = a5;
  BOOL v14 = a4;
  id v15 = a3;
  id v16 = a6;
  id v17 = a7;
  id v18 = (dispatch_queue_s *)a9;
  id v19 = a10;
  if (![v15 count])
  {
    id v27 = sub_10002D55C();
    v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "0 resources requested. Done.", buf, 2u);
    }

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10002E0D8;
    block[3] = &unk_1000591E0;
    id v74 = v19;
    dispatch_async(v18, block);
    id v29 = v74;
    goto LABEL_53;
  }

  id v65 = v17;
  BOOL v63 = v14;
  if (a8)
  {
    id v20 = sub_10002D55C();
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    os_signpost_id_t v22 = os_signpost_id_generate(v21);

    id v23 = sub_10002D55C();
    id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    id v25 = v24;
    if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)v77 = a8;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v25,  OS_SIGNPOST_INTERVAL_BEGIN,  v22,  "FetchResources",  "parent_signpost=%llu",  buf,  0xCu);
    }

    os_signpost_id_t v26 = v22;
    id v17 = v65;
  }

  else
  {
    os_signpost_id_t v26 = 0LL;
  }

  id v64 = v19;
  os_signpost_id_t v62 = v26;
  id v29 = (id)objc_claimAutoreleasedReturnValue( -[GEOResourceRequesterLocalProxy resourcesRequested:forHandler:queue:wantsUnpacked:signpost:]( self,  "resourcesRequested:forHandler:queue:wantsUnpacked:signpost:",  v15,  v19,  v18,  v13));
  id v30 = sub_10002D55C();
  id v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
  {
    unsigned int v32 = [v15 count];
    unsigned int v33 = [v15 count];
    unsigned int v34 = v33 - [v29 count];
    unsigned int v35 = [v29 count];
    *(_DWORD *)buf = 67109632;
    *(_DWORD *)v77 = v32;
    *(_WORD *)&v77[4] = 1024;
    *(_DWORD *)&v77[6] = v34;
    __int16 v78 = 1024;
    unsigned int v79 = v35;
    _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEBUG,  "%d resources requested, %d already pending, will load %d",  buf,  0x14u);
  }

  if (![v29 count]) {
    goto LABEL_52;
  }
  v59 = v18;
  if (!v16) {
    id v16 = (id)objc_claimAutoreleasedReturnValue( +[GEOResourceManifestConfiguration defaultConfiguration]( &OBJC_CLASS___GEOResourceManifestConfiguration,  "defaultConfiguration"));
  }
  v60 = v16;
  id v61 = v15;
  BOOL v36 = (void *)objc_claimAutoreleasedReturnValue( +[GEOResourceManifestManager modernManagerForConfiguration:]( &OBJC_CLASS___GEOResourceManifestManager,  "modernManagerForConfiguration:",  v16));
  v37 = (void *)objc_claimAutoreleasedReturnValue([v36 activeTileGroup]);

  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v69 = 0u;
  __int128 v70 = 0u;
  __int128 v71 = 0u;
  __int128 v72 = 0u;
  id v29 = v29;
  id v39 = [v29 countByEnumeratingWithState:&v69 objects:v75 count:16];
  if (!v39)
  {
    v67 = 0LL;
    goto LABEL_36;
  }

  id v40 = v39;
  v67 = 0LL;
  uint64_t v41 = *(void *)v70;
  do
  {
    v42 = 0LL;
    do
    {
      if (*(void *)v70 != v41) {
        objc_enumerationMutation(v29);
      }
      uint64_t v43 = *(void *)(*((void *)&v69 + 1) + 8LL * (void)v42);
      if ([v37 isRegionalResource:v43])
      {
        v44 = v38;
        goto LABEL_27;
      }

      v45 = (void *)objc_claimAutoreleasedReturnValue([v37 activeResources]);
      if ([v45 containsObject:v43])
      {

LABEL_26:
        v44 = v68;
        goto LABEL_27;
      }

      v46 = (void *)objc_claimAutoreleasedReturnValue([v37 explicitResources]);
      unsigned __int8 v47 = [v46 containsObject:v43];

      if ((v47 & 1) != 0) {
        goto LABEL_26;
      }
      id v48 = sub_10002D55C();
      v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)v77 = v43;
        _os_log_impl( (void *)&_mh_execute_header,  v49,  OS_LOG_TYPE_ERROR,  "Asked to load unknown resource: %@",  buf,  0xCu);
      }

      v44 = v67;
      if (!v67)
      {
        v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
        v67 = v44;
      }

- (void)_fetchResources:(id)a3 force:(BOOL)a4 manifestConfiguration:(id)a5 destination:(id)a6 additionalDestination:(id)a7 auditToken:(id)a8 signpostID:(unint64_t)a9
{
  id v36 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  unsigned int v34 = v14;
  id v18 = (void *)objc_claimAutoreleasedReturnValue( +[GEOResourceManifestManager modernManagerForConfiguration:]( &OBJC_CLASS___GEOResourceManifestManager,  "modernManagerForConfiguration:",  v14));
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 activeTileGroup]);

  id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 urlInfoSet]);
  v21 = (void *)objc_claimAutoreleasedReturnValue([v20 resourcesURL]);
  os_signpost_id_t v22 = (void *)objc_claimAutoreleasedReturnValue([v21 nsURL]);

  id v23 = (void *)objc_claimAutoreleasedReturnValue([v19 urlInfoSet]);
  id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 alternateResourcesNSURLs]);

  id v25 = (void *)objc_claimAutoreleasedReturnValue([v19 urlInfoSet]);
  os_signpost_id_t v26 = (void *)objc_claimAutoreleasedReturnValue([v25 resourcesProxyURL]);

  id v27 = objc_alloc(&OBJC_CLASS___GEOResourceLoader);
  id v28 = sub_10002D55C();
  id v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
  unsigned int v35 = v16;
  LOBYTE(v33) = a4;
  v38 = v17;
  id v30 = [v27 initWithTargetDirectory:v15 auditToken:v17 baseURL:v22 alternateURLs:v24 proxyURL:v26 resources:v36 forceUpdateCheck:v33 maximumConcurrent Loads:6 additionalDirectoryToConsider:v16 log:v29 signpostID:a9];

  -[NSMutableArray addObject:](self->_inProgressLoaders, "addObject:", v30);
  objc_initWeak(&location, v30);
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472LL;
  v39[2] = sub_10002E380;
  v39[3] = &unk_10005A640;
  v39[4] = self;
  objc_copyWeak(&v42, &location);
  id v31 = v36;
  id v40 = v31;
  id v32 = v15;
  id v41 = v32;
  [v30 startWithCompletionHandler:v39 callbackQueue:self->_workQueue];
  -[GEOResourceRequesterLocalProxy _resetRequestTimeout](self, "_resetRequestTimeout");

  objc_destroyWeak(&v42);
  objc_destroyWeak(&location);
}

- (void)dealloc
{
  workQueue = (dispatch_queue_s *)self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002E724;
  block[3] = &unk_100059190;
  void block[4] = self;
  dispatch_sync(workQueue, block);
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___GEOResourceRequesterLocalProxy;
  -[GEOResourceRequesterLocalProxy dealloc](&v4, "dealloc");
}

- (id)resourcesRequested:(id)a3 forHandler:(id)a4 queue:(id)a5 wantsUnpacked:(BOOL)a6 signpost:(unint64_t)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSOrderedSet orderedSetWithArray:](&OBJC_CLASS___NSOrderedSet, "orderedSetWithArray:", v12));
  id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableSet setWithCapacity:]( NSMutableSet,  "setWithCapacity:",  [v12 count]));
  id v27 = v13;
  id v28 = v12;
  id v17 = (void *)objc_claimAutoreleasedReturnValue( +[_GEOResourceRequestHelper helperForHandler:queue:resources:wantsUnpacked:signpost:]( &OBJC_CLASS____GEOResourceRequestHelper,  "helperForHandler:queue:resources:wantsUnpacked:signpost:",  v13,  v14,  v12,  v8,  a7));
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  id v18 = v15;
  id v19 = [v18 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v30;
    do
    {
      for (i = 0LL; i != v20; i = (char *)i + 1)
      {
        if (*(void *)v30 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = *(void *)(*((void *)&v29 + 1) + 8LL * (void)i);
        id v24 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_requestHandlersPending,  "objectForKeyedSubscript:",  v23));
        if (!v24)
        {
          id v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 1LL));
          -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_requestHandlersPending,  "setObject:forKeyedSubscript:",  v24,  v23);
          [v16 addObject:v23];
        }

        [v24 addObject:v17];
      }

      id v20 = [v18 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }

    while (v20);
  }

  id v25 = (void *)objc_claimAutoreleasedReturnValue([v16 allObjects]);
  return v25;
}

- (id)_finished:(id)a3 withResult:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_requestHandlersPending,  "objectForKeyedSubscript:",  v8));
    if (v11)
    {
      uint64_t v42 = 0LL;
      uint64_t v43 = &v42;
      uint64_t v44 = 0x2020000000LL;
      char v45 = 0;
      v39[0] = _NSConcreteStackBlock;
      v39[1] = 3221225472LL;
      v39[2] = sub_10002ECA4;
      v39[3] = &unk_10005A688;
      id v12 = v8;
      id v40 = v12;
      id v41 = &v42;
      [v11 enumerateObjectsUsingBlock:v39];
      if (*((_BYTE *)v43 + 24))
      {
        id v13 = sub_10002D55C();
        id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
        id v38 = 0LL;
        id v15 = (void *)objc_claimAutoreleasedReturnValue( +[GEOResourceLoader unpackResource:at:log:error:]( &OBJC_CLASS___GEOResourceLoader,  "unpackResource:at:log:error:",  v12,  v9,  v14,  &v38));
        id v16 = v38;

        if (v15)
        {
          id v17 = v15;
        }

        else
        {
          id v18 = sub_10002D55C();
          id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412802;
            id v47 = v12;
            __int16 v48 = 2112;
            id v49 = v9;
            __int16 v50 = 2112;
            id v51 = v16;
            _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "Unable to unpack resource %@ at %@ - %@",  buf,  0x20u);
          }
        }
      }

      else
      {
        id v15 = v9;
      }

      id v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472LL;
      v33[2] = sub_10002ECE8;
      v33[3] = &unk_10005A6B0;
      id v34 = v12;
      id v9 = v15;
      id v35 = v9;
      id v36 = v10;
      id v21 = v20;
      id v37 = v21;
      [v11 enumerateObjectsUsingBlock:v33];
      os_signpost_id_t v22 = v37;
      id v23 = v21;

      _Block_object_dispose(&v42, 8);
    }

    else
    {
      BOOL v25 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT);
      if (v25) {
        sub_10003AF3C(v25, v26, v27, v28, v29, v30, v31, v32);
      }
      id v23 = &__NSArray0__struct;
    }
  }

  else
  {
    id v23 = &__NSArray0__struct;
  }

  return v23;
}

- (void)_cleanUpFinishedHandlers:(id)a3
{
  id v4 = a3;
  if ([v4 count] && -[NSMutableDictionary count](self->_requestHandlersPending, "count"))
  {
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_requestHandlersPending, "allKeys", 0LL));
    id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8LL * (void)i);
          v11 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_requestHandlersPending,  "objectForKeyedSubscript:",  v10));
          [v11 removeObjectsInArray:v4];
          if (![v11 count]) {
            -[NSMutableDictionary removeObjectForKey:](self->_requestHandlersPending, "removeObjectForKey:", v10);
          }
        }

        id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }

      while (v7);
    }
  }
}

- (void)didResolvePaths:(id)a3 forResources:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_10002EFF4;
    v13[3] = &unk_10005A6D8;
    id v14 = v7;
    id v9 = v8;
    id v15 = v9;
    id v16 = self;
    [v6 enumerateObjectsUsingBlock:v13];
    -[GEOResourceRequesterLocalProxy _cleanUpFinishedHandlers:](self, "_cleanUpFinishedHandlers:", v9);
    id v10 = sub_10002D55C();
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_requestHandlersPending, "allKeys"));
      *(_DWORD *)buf = 138477827;
      id v18 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "Remaining requests in progress: %{private}@",  buf,  0xCu);
    }
  }
}

- (void)failedToResolveResources:(id)a3 withError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    id v9 = v6;
    id v10 = [v9 countByEnumeratingWithState:&v18 objects:v24 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v19;
      do
      {
        __int128 v13 = 0LL;
        do
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = (void *)objc_claimAutoreleasedReturnValue( -[GEOResourceRequesterLocalProxy _finished:withResult:error:]( self,  "_finished:withResult:error:",  *(void *)(*((void *)&v18 + 1) + 8LL * (void)v13),  0LL,  v7,  (void)v18));
          [v8 addObjectsFromArray:v14];

          __int128 v13 = (char *)v13 + 1;
        }

        while (v11 != v13);
        id v11 = [v9 countByEnumeratingWithState:&v18 objects:v24 count:16];
      }

      while (v11);
    }

    -[GEOResourceRequesterLocalProxy _cleanUpFinishedHandlers:](self, "_cleanUpFinishedHandlers:", v8);
    id v15 = sub_10002D55C();
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      id v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_requestHandlersPending, "allKeys"));
      *(_DWORD *)buf = 138477827;
      id v23 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEBUG,  "Remaining requests in progress: %{private}@",  buf,  0xCu);
    }
  }
}

- (void)_failAllPendingRequests
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_requestHandlersPending, "allValues"));
  id v5 = [v4 countByEnumeratingWithState:&v34 objects:v42 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v35;
    do
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v35 != v7) {
          objc_enumerationMutation(v4);
        }
        [v3 addObjectsFromArray:*(void *)(*((void *)&v34 + 1) + 8 * (void)v8)];
        uint64_t v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v34 objects:v42 count:16];
    }

    while (v6);
  }

  -[NSMutableDictionary removeAllObjects](self->_requestHandlersPending, "removeAllObjects");
  if ([v3 count])
  {
    id v9 = sub_10002D55C();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      unsigned int v11 = [v3 count];
      *(_DWORD *)buf = 67109120;
      unsigned int v41 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "Found %d request helpers that should have finished by now",  buf,  8u);
    }

    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    id v12 = v3;
    id v13 = [v12 countByEnumeratingWithState:&v30 objects:v39 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v31;
      do
      {
        id v16 = 0LL;
        do
        {
          if (*(void *)v31 != v15) {
            objc_enumerationMutation(v12);
          }
          [*(id *)(*((void *)&v30 + 1) + 8 * (void)v16) failAllRemainingRequests];
          id v16 = (char *)v16 + 1;
        }

        while (v14 != v16);
        id v14 = [v12 countByEnumeratingWithState:&v30 objects:v39 count:16];
      }

      while (v14);
    }
  }

  id v17 = -[NSMutableArray copy](self->_inProgressLoaders, "copy");
  -[NSMutableArray removeAllObjects](self->_inProgressLoaders, "removeAllObjects");
  id v18 = sub_10002D55C();
  __int128 v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    unsigned int v20 = [v17 count];
    *(_DWORD *)buf = 67109120;
    unsigned int v41 = v20;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "Canceling %d in-flight resource loaders",  buf,  8u);
  }

  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v21 = self->_inProgressLoaders;
  id v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v21,  "countByEnumeratingWithState:objects:count:",  &v26,  v38,  16LL);
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v27;
    do
    {
      BOOL v25 = 0LL;
      do
      {
        if (*(void *)v27 != v24) {
          objc_enumerationMutation(v21);
        }
        objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * (void)v25), "cancel", (void)v26);
        BOOL v25 = (char *)v25 + 1;
      }

      while (v23 != v25);
      id v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v21,  "countByEnumeratingWithState:objects:count:",  &v26,  v38,  16LL);
    }

    while (v23);
  }
}

- (void)_resetRequestTimeout
{
  char BOOL = GEOConfigGetBOOL( GeoServicesConfig_ResourceRequesterTimeoutEnabled[0],  GeoServicesConfig_ResourceRequesterTimeoutEnabled[1]);
  requestTimeoutTimer = self->_requestTimeoutTimer;
  if ((BOOL & 1) != 0)
  {
    if (requestTimeoutTimer) {
      goto LABEL_4;
    }
    id v5 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_workQueue);
    id v6 = self->_requestTimeoutTimer;
    self->_requestTimeoutTimer = v5;

    dispatch_source_set_timer( (dispatch_source_t)self->_requestTimeoutTimer,  0xFFFFFFFFFFFFFFFFLL,  0xFFFFFFFFFFFFFFFFLL,  0LL);
    objc_initWeak(&location, self);
    uint64_t v7 = self->_requestTimeoutTimer;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_10002F6F0;
    v12[3] = &unk_10005A700;
    objc_copyWeak(&v13, &location);
    dispatch_source_set_event_handler((dispatch_source_t)v7, v12);
    dispatch_activate((dispatch_object_t)self->_requestTimeoutTimer);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
    if (self->_requestTimeoutTimer)
    {
LABEL_4:
      if (GEODataRequestTimeout(4LL) * 3.0 * 0.5 <= 300.0) {
        int64_t v8 = 300000000000LL;
      }
      else {
        int64_t v8 = (uint64_t)(GEODataRequestTimeout(4LL) * 3.0 * 0.5 * 1000000000.0);
      }
      id v10 = self->_requestTimeoutTimer;
      dispatch_time_t v11 = dispatch_time(0LL, v8);
      dispatch_source_set_timer((dispatch_source_t)v10, v11, 0xFFFFFFFFFFFFFFFFLL, 1uLL);
    }
  }

  else if (requestTimeoutTimer)
  {
    dispatch_source_cancel((dispatch_source_t)requestTimeoutTimer);
    id v9 = self->_requestTimeoutTimer;
    self->_requestTimeoutTimer = 0LL;
  }

- (void).cxx_destruct
{
}

@end