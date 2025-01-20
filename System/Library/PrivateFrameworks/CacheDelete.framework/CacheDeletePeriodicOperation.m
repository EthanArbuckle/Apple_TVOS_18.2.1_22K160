@interface CacheDeletePeriodicOperation
- (CDPeriodicOperationResult)periodicResult;
- (CacheDeletePeriodicOperation)initWithInfo:(id)a3 services:(id)a4 volumes:(id)a5;
- (void)_startOperation:(id)a3;
- (void)setPeriodicResult:(id)a3;
@end

@implementation CacheDeletePeriodicOperation

- (CacheDeletePeriodicOperation)initWithInfo:(id)a3 services:(id)a4 volumes:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (![v10 count])
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"]);

    if (!v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[CacheDeleteDaemonVolume rootVolume](&OBJC_CLASS___CacheDeleteDaemonVolume, "rootVolume"));
      v33 = v12;
      uint64_t v13 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v33, 1LL));

      id v10 = (id)v13;
    }
  }

  v31.receiver = self;
  v31.super_class = (Class)&OBJC_CLASS___CacheDeletePeriodicOperation;
  v14 = -[CacheDeleteOperation initWithInfo:services:volumes:](&v31, "initWithInfo:services:volumes:", v8, v9, v10);
  if (v14)
  {
    id v25 = v9;
    id v26 = v8;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteOperation services](v14, "services"));
    id v17 = [v16 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v28;
      do
      {
        v20 = 0LL;
        do
        {
          if (*(void *)v28 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = *(void *)(*((void *)&v27 + 1) + 8LL * (void)v20);
          v22 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteOperation services](v14, "services"));
          v23 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKeyedSubscript:v21]);

          v20 = (char *)v20 + 1;
        }

        while (v18 != v20);
        id v18 = [v16 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }

      while (v18);
    }

    -[CacheDeleteOperation setServices:](v14, "setServices:", v15);
    id v9 = v25;
    id v8 = v26;
  }

  return v14;
}

- (void)_startOperation:(id)a3
{
  id v46 = a3;
  v85[0] = 0LL;
  v85[1] = v85;
  v85[2] = 0x2020000000LL;
  v85[3] = 0LL;
  group = dispatch_group_create();
  v4 = objc_alloc(&OBJC_CLASS___CDPeriodicOperationResult);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteOperation volumeNames](self, "volumeNames"));
  v6 = -[CDPeriodicOperationResult initWithVolumes:](v4, "initWithVolumes:", v5);
  -[CacheDeletePeriodicOperation setPeriodicResult:](self, "setPeriodicResult:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteOperation info](self, "info"));
  v48 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"CACHE_DELETE_TEST_PARAMETERS"]);

  id v82 = 0LL;
  v83[0] = 0LL;
  v83[1] = v83;
  v83[2] = 0x3032000000LL;
  v83[3] = __Block_byref_object_copy__2;
  v83[4] = __Block_byref_object_dispose__2;
  id v84 = 0LL;
  uint64_t v77 = 0LL;
  v78 = &v77;
  uint64_t v79 = 0x3032000000LL;
  v80 = __Block_byref_object_copy__2;
  v81 = __Block_byref_object_dispose__2;
  if (v48)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v48 objectForKeyedSubscript:@"CACHE_DELETE_PURGE_TIMEOUT"]);
    uint64_t v9 = evaluateNumberProperty();
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    id v11 = [v10 unsignedLongLongValue];

    uint64_t v12 = 120LL;
    if (v11) {
      uint64_t v12 = (uint64_t)v11;
    }
  }

  else
  {
    uint64_t v12 = 30LL;
  }

  uint64_t v49 = v12;
  queue = dispatch_queue_create("com.apple.cache_delete_periodic_results", 0LL);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteOperation info](self, "info"));
  unsigned int v14 = -[CacheDeleteOperation validateDictionaryForXPC:](self, "validateDictionaryForXPC:", v13);

  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteOperation info](self, "info"));
    v57 = (NSMutableDictionary *)[v15 mutableCopy];
  }

  else
  {
    v57 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 1LL, v46));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v57,  "setObject:forKeyedSubscript:",  v16,  @"CACHE_DELETE_URGENCY");

  uint64_t v17 = CDGetLogHandle("daemon");
  id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteOperation volumes](self, "volumes"));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v19;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Periodic Operation: Info %@ ",  (uint8_t *)&buf,  0xCu);
  }

  __int128 v75 = 0u;
  __int128 v76 = 0u;
  __int128 v73 = 0u;
  __int128 v74 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[CacheDeleteOperation volumes](self, "volumes"));
  id v52 = [obj countByEnumeratingWithState:&v73 objects:v90 count:16];
  if (v52)
  {
    uint64_t v51 = *(void *)v74;
    do
    {
      for (i = 0LL; i != v52; i = (char *)i + 1)
      {
        if (*(void *)v74 != v51) {
          objc_enumerationMutation(obj);
        }
        v56 = *(void **)(*((void *)&v73 + 1) + 8LL * (void)i);
        uint64_t v20 = CDGetLogHandle("daemon");
        uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 138543362;
          *(void *)((char *)&buf + 4) = v56;
          _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Periodic Operation: volume %{public}@ ",  (uint8_t *)&buf,  0xCu);
        }

        __int128 v71 = 0u;
        __int128 v72 = 0u;
        __int128 v69 = 0u;
        __int128 v70 = 0u;
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteOperation services](self, "services"));
        id v23 = [v22 countByEnumeratingWithState:&v69 objects:v89 count:16];
        if (v23)
        {
          uint64_t v24 = *(void *)v70;
          do
          {
            for (j = 0LL; j != v23; j = (char *)j + 1)
            {
              if (*(void *)v70 != v24) {
                objc_enumerationMutation(v22);
              }
              uint64_t v26 = *(void *)(*((void *)&v69 + 1) + 8LL * (void)j);
              __int128 v27 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteOperation services](self, "services"));
              __int128 v28 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKeyedSubscript:v26]);

              if ([v28 inFlight])
              {
                uint64_t v29 = CDGetLogHandle("daemon");
                __int128 v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
                if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
                {
                  LODWORD(buf) = 138543362;
                  *(void *)((char *)&buf + 4) = v26;
                  _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "Periodic Operation: Service %{public}@ is in flight, skipping",  (uint8_t *)&buf,  0xCu);
                }
              }

              else
              {
                objc_super v31 = objc_alloc_init(&OBJC_CLASS___CDPeriodicServiceRequestResult);
                -[CDServiceRequestResult setServiceName:](v31, "setServiceName:", v26);
                -[CDServiceRequestResult setUrgency:](v31, "setUrgency:", 1LL);
                uint64_t v32 = CDGetLogHandle("daemon");
                v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
                if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
                {
                  LODWORD(buf) = 138543362;
                  *(void *)((char *)&buf + 4) = v26;
                  _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "Periodic Operation: Service %{public}@ ",  (uint8_t *)&buf,  0xCu);
                }

                v34 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteOperation servicesToTranslate](self, "servicesToTranslate"));
                v35 = (void *)objc_claimAutoreleasedReturnValue([v28 ID]);
                unsigned int v36 = [v34 containsObject:v35];

                v37 = (void *)objc_claimAutoreleasedReturnValue([v56 mountPoint]);
                if (v36) {
                  uint64_t v38 = mapVolume(v37, 0LL);
                }
                else {
                  uint64_t v38 = mapVolume(v37, 1LL);
                }
                v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
                -[NSMutableDictionary setObject:forKeyedSubscript:]( v57,  "setObject:forKeyedSubscript:",  v39,  @"CACHE_DELETE_VOLUME");

                dispatch_group_enter(group);
                *(void *)&__int128 buf = 0LL;
                *((void *)&buf + 1) = &buf;
                uint64_t v87 = 0x2020000000LL;
                char v88 = 0;
                id v40 = -[NSMutableDictionary mutableCopy](v57, "mutableCopy");
                v60[0] = _NSConcreteStackBlock;
                v60[1] = 3221225472LL;
                v60[2] = __48__CacheDeletePeriodicOperation__startOperation___block_invoke;
                v60[3] = &unk_1000596F8;
                p___int128 buf = &buf;
                id v41 = v28;
                id v61 = v41;
                v62 = self;
                __int128 v30 = v31;
                v63 = v30;
                v67 = v85;
                v64 = queue;
                v68 = v83;
                v65 = group;
                [v41 servicePeriodic:1 info:v40 replyBlock:v60];

                _Block_object_dispose(&buf, 8);
              }
            }

            id v23 = [v22 countByEnumeratingWithState:&v69 objects:v89 count:16];
          }

          while (v23);
        }

        dispatch_time_t v42 = dispatch_time(0LL, 1000000000 * v49);
        if (dispatch_group_wait(group, v42))
        {
          uint64_t v43 = CDGetLogHandle("daemon");
          v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(buf) = 134217984;
            *(void *)((char *)&buf + 4) = v49;
            _os_log_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_DEFAULT,  "timed out (%llu seconds) waiting for:",  (uint8_t *)&buf,  0xCu);
          }

          v45 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteOperation services](self, "services"));
          [v45 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_4];

          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472LL;
          block[2] = __48__CacheDeletePeriodicOperation__startOperation___block_invoke_29;
          block[3] = &unk_100058BB0;
          block[4] = self;
          dispatch_sync(queue, block);
        }
      }

      id v52 = [obj countByEnumeratingWithState:&v73 objects:v90 count:16];
    }

    while (v52);
  }

  v58[0] = _NSConcreteStackBlock;
  v58[1] = 3221225472LL;
  v58[2] = __48__CacheDeletePeriodicOperation__startOperation___block_invoke_2_30;
  v58[3] = &unk_100059760;
  v58[4] = self;
  v58[5] = v83;
  v58[6] = &v77;
  v58[7] = v85;
  dispatch_sync(queue, v58);
  if (v47) {
    v47[2](v47, v78[5]);
  }

  _Block_object_dispose(&v77, 8);
  _Block_object_dispose(v83, 8);

  _Block_object_dispose(v85, 8);
}

void __48__CacheDeletePeriodicOperation__startOperation___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(*(void *)(a1 + 72) + 8LL);
  if (*(_BYTE *)(v4 + 24))
  {
    uint64_t v5 = CDGetLogHandle("daemon");
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) ID]);
      *(_DWORD *)__int128 buf = 138543362;
      id v25 = v14;
      _os_log_fault_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_FAULT,  "Periodic callback firing more than once for service %{public}@",  buf,  0xCu);
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) ID]);
    _CacheDeleteAbortWithMessage("Periodic callback firing more than once for service %{public}@", v7);
  }

  else
  {
    *(_BYTE *)(v4 + 24) = 1;
    id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "response_queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = __48__CacheDeletePeriodicOperation__startOperation___block_invoke_15;
    block[3] = &unk_1000596D0;
    id v17 = *(id *)(a1 + 48);
    id v9 = v3;
    uint64_t v10 = *(void *)(a1 + 80);
    id v18 = v9;
    uint64_t v22 = v10;
    id v11 = *(id *)(a1 + 56);
    uint64_t v12 = *(void *)(a1 + 88);
    id v19 = v11;
    uint64_t v23 = v12;
    int8x16_t v15 = *(int8x16_t *)(a1 + 32);
    id v13 = (id)v15.i64[0];
    int8x16_t v20 = vextq_s8(v15, v15, 8uLL);
    id v21 = *(id *)(a1 + 64);
    dispatch_async(v8, block);

    v7 = v17;
  }
}

void __48__CacheDeletePeriodicOperation__startOperation___block_invoke_15(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKeyedSubscript:@"CACHE_DELETE_AMOUNT"]);
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v2, v3) & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "setReportedPurgedBytes:", objc_msgSend(v2, "unsignedLongLongValue"));
    *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) += [v2 unsignedLongLongValue];
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __48__CacheDeletePeriodicOperation__startOperation___block_invoke_2;
  block[3] = &unk_100058AA0;
  uint64_t v4 = *(dispatch_queue_s **)(a1 + 48);
  void block[4] = *(void *)(a1 + 56);
  id v16 = *(id *)(a1 + 32);
  dispatch_sync(v4, block);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKeyedSubscript:@"CACHE_DELETE_ERROR"]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKeyedSubscript:@"CACHE_DELETE_TEST_FAILURES"]);
  v7 = *(dispatch_queue_s **)(a1 + 48);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = __48__CacheDeletePeriodicOperation__startOperation___block_invoke_3;
  v10[3] = &unk_1000596A8;
  id v11 = v5;
  id v12 = v6;
  uint64_t v14 = *(void *)(a1 + 88);
  id v13 = *(id *)(a1 + 64);
  id v8 = v6;
  id v9 = v5;
  dispatch_async(v7, v10);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 72));
}

void __48__CacheDeletePeriodicOperation__startOperation___block_invoke_2(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) periodicResult]);
  [v2 addResult:*(void *)(a1 + 40)];
}

void __48__CacheDeletePeriodicOperation__startOperation___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2 || *(void *)(a1 + 40))
  {
    if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL))
    {
      uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
      uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8LL);
      uint64_t v5 = *(void **)(v4 + 40);
      *(void *)(v4 + 40) = v3;

      uint64_t v2 = *(void *)(a1 + 32);
    }

    v6 = &APFSContainerGetSpaceInfo_ptr;
    if (v2)
    {
      v7 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL);
      id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) ID]);
      uint64_t v9 = *(void *)(a1 + 32);
      v31[0] = v8;
      v31[1] = v9;
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v31, 2LL));
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 componentsJoinedByString:@" : "]);
      [v7 addObject:v11];
    }

    id v12 = *(void **)(a1 + 40);
    if (v12)
    {
      __int128 v27 = 0u;
      __int128 v28 = 0u;
      __int128 v25 = 0u;
      __int128 v26 = 0u;
      id obj = v12;
      id v13 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v26;
        do
        {
          id v16 = 0LL;
          do
          {
            if (*(void *)v26 != v15) {
              objc_enumerationMutation(obj);
            }
            uint64_t v17 = *(void *)(*((void *)&v25 + 1) + 8LL * (void)v16);
            id v18 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL);
            id v19 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) ID]);
            v29[0] = v19;
            v29[1] = v17;
            int8x16_t v20 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKeyedSubscript:v17]);
            v29[2] = v20;
            id v21 = v6;
            uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v6[35] arrayWithObjects:v29 count:3]);
            uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v22 componentsJoinedByString:@" : "]);
            [v18 addObject:v23];

            v6 = v21;
            id v16 = (char *)v16 + 1;
          }

          while (v14 != v16);
          id v14 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
        }

        while (v14);
      }
    }
  }

void __48__CacheDeletePeriodicOperation__startOperation___block_invoke_27( id a1,  NSString *a2,  CDService *a3,  BOOL *a4)
{
  uint64_t v5 = a2;
  if (-[CDService inFlight](a3, "inFlight"))
  {
    uint64_t v6 = CDGetLogHandle("daemon");
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138543362;
      uint64_t v9 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "\t%{public}@", (uint8_t *)&v8, 0xCu);
    }
  }
}

void __48__CacheDeletePeriodicOperation__startOperation___block_invoke_29(uint64_t a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) periodicResult]);
  [v1 setTimedOut:1];
}

void __48__CacheDeletePeriodicOperation__startOperation___block_invoke_2_30(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) periodicResult]);
  [v2 finish];

  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) analyticsReporter]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) periodicResult]);
  [v3 reportPeriodic:v4];

  if ([*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) count])
  {
    uint64_t v5 = CDGetLogHandle("daemon");
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 67109120;
      LODWORD(v28) = 172;
      _os_log_error_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "%d, CacheDeletePeriodicOperation _startOperation service errors:",  buf,  8u);
    }

    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    id v7 = *(id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
    id v8 = [v7 countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (v8)
    {
      id v10 = v8;
      uint64_t v11 = *(void *)v22;
      *(void *)&__int128 v9 = 138412290LL;
      __int128 v20 = v9;
      do
      {
        id v12 = 0LL;
        do
        {
          if (*(void *)v22 != v11) {
            objc_enumerationMutation(v7);
          }
          uint64_t v13 = *(void *)(*((void *)&v21 + 1) + 8LL * (void)v12);
          uint64_t v14 = CDGetLogHandle("daemon");
          uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)__int128 buf = v20;
            uint64_t v28 = v13;
            _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Service:Error - %@", buf, 0xCu);
          }

          id v12 = (char *)v12 + 1;
        }

        while (v10 != v12);
        id v10 = [v7 countByEnumeratingWithState:&v21 objects:v29 count:16];
      }

      while (v10);
    }
  }

  __int128 v25 = @"CACHE_DELETE_AMOUNT";
  id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL),  v20,  (void)v21));
  __int128 v26 = v16;
  uint64_t v17 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v26,  &v25,  1LL));
  uint64_t v18 = *(void *)(*(void *)(a1 + 48) + 8LL);
  id v19 = *(void **)(v18 + 40);
  *(void *)(v18 + 40) = v17;
}

- (CDPeriodicOperationResult)periodicResult
{
  return self->_periodicResult;
}

- (void)setPeriodicResult:(id)a3
{
}

- (void).cxx_destruct
{
}

@end