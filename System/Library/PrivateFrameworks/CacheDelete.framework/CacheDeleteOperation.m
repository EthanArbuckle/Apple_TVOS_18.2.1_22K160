@interface CacheDeleteOperation
- (BOOL)clientSpecifiedTimeout;
- (BOOL)hasRootOnlyServices;
- (BOOL)measureElapsedTime;
- (BOOL)serviceIsRegistered:(id)a3;
- (BOOL)timeoutNotReached;
- (BOOL)validateDictionaryForXPC:(id)a3;
- (CDPurgeableResultCache)resultCache;
- (CacheDeleteAnalytics)analyticsReporter;
- (CacheDeleteOperation)initWithInfo:(id)a3 services:(id)a4 volumes:(id)a5;
- (NSArray)servicesToTranslate;
- (NSArray)volumeNames;
- (NSArray)volumes;
- (NSDictionary)info;
- (NSDictionary)services;
- (NSMutableDictionary)result;
- (NSMutableDictionary)testFailures;
- (NSString)description;
- (OS_dispatch_queue)operation_queue;
- (OS_dispatch_queue)response_queue;
- (double)non_negative_time_remaining;
- (double)start_time;
- (double)timeout_seconds;
- (id)servicesForVolume:(id)a3;
- (int)urgency;
- (int)urgencyLimit;
- (void)_startOperation:(id)a3;
- (void)performBlockWithUrgency:(id)a3;
- (void)processTestFailures:(id)a3;
- (void)setAnalyticsReporter:(id)a3;
- (void)setInfo:(id)a3;
- (void)setMeasureElapsedTime:(BOOL)a3;
- (void)setOperation_queue:(id)a3;
- (void)setResponse_queue:(id)a3;
- (void)setResult:(id)a3;
- (void)setResultCache:(id)a3;
- (void)setServices:(id)a3;
- (void)setStart_time:(double)a3;
- (void)setTestFailures:(id)a3;
- (void)setTimeout_seconds:(double)a3;
- (void)setVolumeNames:(id)a3;
- (void)setVolumes:(id)a3;
- (void)startOperation:(id)a3;
@end

@implementation CacheDeleteOperation

- (CacheDeleteOperation)initWithInfo:(id)a3 services:(id)a4 volumes:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v149.receiver = self;
  v149.super_class = (Class)&OBJC_CLASS___CacheDeleteOperation;
  v12 = -[CacheDeleteOperation init](&v149, "init");
  if (!v12)
  {
LABEL_102:
    v26 = v12;
    goto LABEL_107;
  }

  uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v9, v13) & 1) != 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"CACHE_DELETE_PURGE_TIMEOUT"]);
    uint64_t v15 = evaluateNumberProperty();
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

    uint64_t v17 = CDGetLogHandle("daemon");
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
    if (v16)
    {
      if (v19)
      {
        *(_DWORD *)buf = 138412290;
        id v157 = v16;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Client specified timeout: %@", buf, 0xCu);
      }

      [v16 doubleValue];
      if (v20 > 600.0) {
        double v20 = 600.0;
      }
      char v21 = 1;
    }

    else
    {
      if (v19)
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v157) = 600;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Client specified no timeout. Using : %d",  buf,  8u);
      }

      char v21 = 0;
      double v20 = 600.0;
    }

    id v125 = a3;
    v126 = v16;
    v12->_timeout_seconds = v20;
    v12->_clientSpecifiedTimeout = v21;
    v12->_start_time = 0.0;
    servicesToTranslate = v12->_servicesToTranslate;
    v12->_servicesToTranslate = (NSArray *)&off_10005D388;

    v28 = (NSMutableDictionary *)[v9 mutableCopy];
    v29 = v12->_result;
    v12->_result = v28;

    v30 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v12->_result,  "objectForKeyedSubscript:",  @"CACHE_DELETE_MEASURE_ELAPSED_TIME"));
    v12->_measureElapsedTime = evaluateBoolProperty(v30);

    v31 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v11 count]);
    v127 = v12;
    if (v11 && [v11 count])
    {
      id v123 = v11;
      id v124 = v9;
      __int128 v147 = 0u;
      __int128 v148 = 0u;
      __int128 v145 = 0u;
      __int128 v146 = 0u;
      id v32 = v11;
      id v33 = [v32 countByEnumeratingWithState:&v145 objects:v155 count:16];
      if (v33)
      {
        id v34 = v33;
        uint64_t v35 = *(void *)v146;
        do
        {
          for (i = 0LL; i != v34; i = (char *)i + 1)
          {
            if (*(void *)v146 != v35) {
              objc_enumerationMutation(v32);
            }
            v37 = *(void **)(*((void *)&v145 + 1) + 8LL * (void)i);
            if (([v37 validate] & 1) == 0)
            {
              uint64_t v38 = CDGetLogHandle("daemon");
              v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
              if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
              {
                v40 = v31;
                v41 = (void *)objc_claimAutoreleasedReturnValue([v37 mountPoint]);
                *(_DWORD *)buf = 138543362;
                id v157 = v41;
                _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_DEFAULT,  "Volume became invalid: %{public}@",  buf,  0xCu);

                v31 = v40;
              }
            }
          }

          id v34 = [v32 countByEnumeratingWithState:&v145 objects:v155 count:16];
        }

        while (v34);
      }

      if (-[NSMutableArray count](v31, "count"))
      {
        v42 = v31;
        volumes = v12->_volumes;
        v12->_volumes = &v42->super;
LABEL_34:

        v46 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v12->_result,  "objectForKeyedSubscript:",  @"CACHE_DELETE_MEASURE_ELAPSED_TIME"));
        v12->_measureElapsedTime = evaluateBoolProperty(v46);

        v47 = (objc_class *)objc_opt_class(v12);
        v48 = NSStringFromClass(v47);
        v49 = (void *)objc_claimAutoreleasedReturnValue(v48);
        v50 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s_%@_operation.%p",  "com.apple.cache_delete",  v49,  v12));

        id v51 = v50;
        dispatch_queue_t v52 = dispatch_queue_create((const char *)[v51 UTF8String], 0);
        operation_queue = v12->_operation_queue;
        v12->_operation_queue = (OS_dispatch_queue *)v52;

        v54 = (objc_class *)objc_opt_class(v12);
        v55 = NSStringFromClass(v54);
        v56 = (void *)objc_claimAutoreleasedReturnValue(v55);
        v57 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s_%@_response.%p",  "com.apple.cache_delete",  v56,  v12));

        id v121 = v57;
        dispatch_queue_t v58 = dispatch_queue_create((const char *)[v121 UTF8String], 0);
        response_queue = v12->_response_queue;
        v12->_response_queue = (OS_dispatch_queue *)v58;

        id v60 = [v10 mutableCopy];
        v128 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
        __int128 v141 = 0u;
        __int128 v142 = 0u;
        __int128 v143 = 0u;
        __int128 v144 = 0u;
        v61 = v12->_volumes;
        id v62 = -[NSArray countByEnumeratingWithState:objects:count:]( v61,  "countByEnumeratingWithState:objects:count:",  &v141,  v153,  16LL);
        if (v62)
        {
          id v63 = v62;
          uint64_t v64 = *(void *)v142;
          while (2)
          {
            for (j = 0LL; j != v63; j = (char *)j + 1)
            {
              if (*(void *)v142 != v64) {
                objc_enumerationMutation(v61);
              }
              if (![*(id *)(*((void *)&v141 + 1) + 8 * (void)j) isRoot])
              {

                __int128 v139 = 0u;
                __int128 v140 = 0u;
                __int128 v137 = 0u;
                __int128 v138 = 0u;
                v61 = (NSArray *)v60;
                id v66 = -[NSArray countByEnumeratingWithState:objects:count:]( v61,  "countByEnumeratingWithState:objects:count:",  &v137,  v152,  16LL);
                if (v66)
                {
                  id v67 = v66;
                  uint64_t v68 = *(void *)v138;
                  while (2)
                  {
                    for (k = 0LL; k != v67; k = (char *)k + 1)
                    {
                      if (*(void *)v138 != v68) {
                        objc_enumerationMutation(v61);
                      }
                      uint64_t v70 = *(void *)(*((void *)&v137 + 1) + 8LL * (void)k);
                      v71 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:v70]);
                      if ([v71 rootOnly])
                      {
                        if ((id)-[NSArray count](v12->_volumes, "count") != (id)1)
                        {
                          v12->_hasRootOnlyServices = 1;

                          goto LABEL_58;
                        }

                        [v128 addObject:v70];
                      }
                    }

                    id v67 = -[NSArray countByEnumeratingWithState:objects:count:]( v61,  "countByEnumeratingWithState:objects:count:",  &v137,  v152,  16LL);
                    if (v67) {
                      continue;
                    }
                    break;
                  }
                }

                goto LABEL_58;
              }
            }

            id v63 = -[NSArray countByEnumeratingWithState:objects:count:]( v61,  "countByEnumeratingWithState:objects:count:",  &v141,  v153,  16LL);
            if (v63) {
              continue;
            }
            break;
          }
        }

- (void)startOperation:(id)a3
{
  id v4 = a3;
  v18[0] = 0LL;
  v18[1] = v18;
  v18[2] = 0x2020000000LL;
  char v19 = 0;
  uint64_t v12 = 0LL;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  uint64_t v15 = __Block_byref_object_copy__4;
  v16 = __Block_byref_object_dispose__4;
  id v17 = 0LL;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CacheDeleteOperation operation_queue](self, "operation_queue"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = __39__CacheDeleteOperation_startOperation___block_invoke;
  v8[3] = &unk_1000597D8;
  v8[4] = self;
  id v10 = v18;
  id v6 = v4;
  id v9 = v6;
  id v11 = &v12;
  dispatch_sync(v5, v8);

  v7 = (void *)v13[5];
  if (v7)
  {
    objc_exception_throw(v7);
    __break(1u);
  }

  else
  {

    _Block_object_dispose(&v12, 8);
    _Block_object_dispose(v18, 8);
  }

void __39__CacheDeleteOperation_startOperation___block_invoke(uint64_t a1)
{
  v2 = objc_autoreleasePoolPush();
  v3 = *(void **)(a1 + 32);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = __39__CacheDeleteOperation_startOperation___block_invoke_2;
  v9[3] = &unk_1000597B0;
  __int128 v7 = *(_OWORD *)(a1 + 40);
  id v4 = (id)v7;
  __int128 v10 = v7;
  [v3 _startOperation:v9];
  if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL))
  {
    uint64_t v5 = CDGetLogHandle("daemon");
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "Finished operation without firing completion!",  buf,  2u);
    }
  }

  objc_autoreleasePoolPop(v2);
}

uint64_t __39__CacheDeleteOperation_startOperation___block_invoke_2(uint64_t a1)
{
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_startOperation:(id)a3
{
}

- (BOOL)serviceIsRegistered:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteOperation services](self, "services"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 allKeys]);
  unsigned __int8 v7 = [v6 containsObject:v4];

  return v7;
}

- (id)servicesForVolume:(id)a3
{
  if (([a3 isRoot] & 1) != 0
    || !-[CacheDeleteOperation hasRootOnlyServices](self, "hasRootOnlyServices"))
  {
    id v6 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(-[CacheDeleteOperation services](self, "services"));
  }

  else
  {
    id v4 = objc_alloc(&OBJC_CLASS___NSMutableDictionary);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteOperation services](self, "services"));
    id v6 = -[NSMutableDictionary initWithCapacity:](v4, "initWithCapacity:", [v5 count]);

    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteOperation services](self, "services", 0LL));
    id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        id v11 = 0LL;
        do
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8LL * (void)v11);
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteOperation services](self, "services"));
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:v12]);

          id v11 = (char *)v11 + 1;
        }

        while (v9 != v11);
        id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }

      while (v9);
    }
  }

  return v6;
}

- (void)performBlockWithUrgency:(id)a3
{
  id v6 = (uint64_t (**)(id, void))a3;
  uint64_t v4 = -[CacheDeleteOperation urgency](self, "urgency");
  if ((int)v4 <= -[CacheDeleteOperation urgencyLimit](self, "urgencyLimit"))
  {
    do
    {
      if ((v6[2](v6, v4) & 1) == 0) {
        break;
      }
      BOOL v5 = (int)v4 < -[CacheDeleteOperation urgencyLimit](self, "urgencyLimit");
      uint64_t v4 = (v4 + 1);
    }

    while (v5);
  }
}

- (void)processTestFailures:(id)a3
{
  id v4 = a3;
  if (qword_100066800 != -1) {
    dispatch_once(&qword_100066800, &__block_literal_global_5);
  }
  uint64_t v5 = CDGetLogHandle("daemon");
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "processTestFailures: %@", buf, 0xCu);
  }

  if (v4 && (uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSDictionary), (objc_opt_isKindOfClass(v4, v7) & 1) != 0))
  {
    id v8 = (dispatch_queue_s *)_MergedGlobals_13;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = __44__CacheDeleteOperation_processTestFailures___block_invoke_42;
    v11[3] = &unk_100058AA0;
    uint64_t v12 = (os_log_s *)v4;
    uint64_t v13 = self;
    dispatch_sync(v8, v11);
    id v9 = v12;
  }

  else
  {
    uint64_t v10 = CDGetLogHandle("daemon");
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v4;
      _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "processTestFailures parameter error, failures: %@",  buf,  0xCu);
    }
  }
}

void __44__CacheDeleteOperation_processTestFailures___block_invoke(id a1)
{
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.cache_deleteoperation_test_failures", 0LL);
  v2 = (void *)_MergedGlobals_13;
  _MergedGlobals_13 = (uint64_t)v1;
}

void __44__CacheDeleteOperation_processTestFailures___block_invoke_42(uint64_t a1)
{
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v2 = *(id *)(a1 + 32);
  id v3 = [v2 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v3)
  {
    id v5 = v3;
    uint64_t v6 = *(void *)v20;
    *(void *)&__int128 v4 = 138412546LL;
    __int128 v18 = v4;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void *)(*((void *)&v19 + 1) + 8LL * (void)v7);
        uint64_t v9 = CDGetLogHandle("daemon");
        uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          id v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:v8]);
          *(_DWORD *)buf = v18;
          uint64_t v24 = v8;
          __int16 v25 = 2112;
          v26 = v11;
          _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "processTestFailures key: %@, val: %@",  buf,  0x16u);
        }

        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) testFailures]);
        if (!v12)
        {
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
          [*(id *)(a1 + 40) setTestFailures:v13];
        }

        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "testFailures", v18, (void)v19));
        id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:v8]);

        if (!v15)
        {
          id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
          __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) testFailures]);
          [v16 setObject:v15 forKeyedSubscript:v8];
        }

        __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:v8]);
        [v15 addObject:v17];

        uint64_t v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [v2 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }

    while (v5);
  }
}

- (NSArray)volumeNames
{
  id v3 = objc_alloc(&OBJC_CLASS___NSMutableArray);
  __int128 v4 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteOperation volumes](self, "volumes"));
  id v5 = -[NSMutableArray initWithCapacity:](v3, "initWithCapacity:", [v4 count]);

  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteOperation volumes](self, "volumes", 0LL));
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v13 + 1) + 8 * (void)v10) mountPoint]);
        -[NSMutableArray addObject:](v5, "addObject:", v11);

        uint64_t v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v8);
  }

  return (NSArray *)v5;
}

- (BOOL)validateDictionaryForXPC:(id)a3
{
  id v3 = a3;
  id v12 = 0LL;
  __int128 v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v3,  100LL,  0LL,  &v12));
  id v5 = v12;
  uint64_t v6 = v5;
  if (v4) {
    BOOL v7 = v5 == 0LL;
  }
  else {
    BOOL v7 = 0;
  }
  BOOL v8 = v7;
  if (!v7)
  {
    uint64_t v9 = CDGetLogHandle("daemon");
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      __int128 v14 = v6;
      __int16 v15 = 2112;
      id v16 = v3;
      _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "validateDictionaryForXPC Invalid dictionary (%@): %@",  buf,  0x16u);
    }
  }

  return v8;
}

- (double)non_negative_time_remaining
{
  uint64_t v3 = mach_absolute_time();
  double start_time = self->_start_time;
  double timeout_seconds = self->_timeout_seconds;
  if (start_time == 0.0) {
    return self->_timeout_seconds;
  }
  double v7 = ((double)v3 - start_time) * gTimebaseConversion / 1000000000.0;
  double result = 0.0;
  if (v7 < timeout_seconds) {
    return timeout_seconds - v7;
  }
  return result;
}

- (BOOL)timeoutNotReached
{
  return v2 > 0.0;
}

- (NSString)description
{
  uint64_t v3 = (objc_class *)objc_opt_class(self);
  __int128 v4 = NSStringFromClass(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"%@ <%p>: {\n",  v5,  self));

  [v6 appendString:@"\tVolumes: [\n"];
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteOperation volumes](self, "volumes"));
  id v8 = [v7 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v26;
    do
    {
      id v11 = 0LL;
      do
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v25 + 1) + 8 * (void)v11) mountPoint]);
        __int128 v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"\t\t%@\n",  v12));
        [v6 appendString:v13];

        id v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }

    while (v9);
  }

  [v6 appendString:@"\tServices: [\n"];
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteOperation services](self, "services"));
  id v15 = [v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v22;
    do
    {
      __int128 v18 = 0LL;
      do
      {
        if (*(void *)v22 != v17) {
          objc_enumerationMutation(v14);
        }
        __int128 v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"\t\t%@\n",  *(void *)(*((void *)&v21 + 1) + 8LL * (void)v18)));
        [v6 appendString:v19];

        __int128 v18 = (char *)v18 + 1;
      }

      while (v16 != v18);
      id v16 = [v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }

    while (v16);
  }

  [v6 appendString:@"\t]\n"];
  [v6 appendString:@"}\n"];
  return (NSString *)v6;
}

- (CDPurgeableResultCache)resultCache
{
  return self->_resultCache;
}

- (void)setResultCache:(id)a3
{
}

- (NSDictionary)info
{
  return self->_info;
}

- (void)setInfo:(id)a3
{
}

- (NSDictionary)services
{
  return self->_services;
}

- (void)setServices:(id)a3
{
}

- (NSMutableDictionary)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
}

- (NSMutableDictionary)testFailures
{
  return self->_testFailures;
}

- (void)setTestFailures:(id)a3
{
}

- (NSArray)volumes
{
  return self->_volumes;
}

- (void)setVolumes:(id)a3
{
}

- (void)setVolumeNames:(id)a3
{
}

- (BOOL)hasRootOnlyServices
{
  return self->_hasRootOnlyServices;
}

- (NSArray)servicesToTranslate
{
  return self->_servicesToTranslate;
}

- (int)urgencyLimit
{
  return self->_urgencyLimit;
}

- (int)urgency
{
  return self->_urgency;
}

- (OS_dispatch_queue)operation_queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 88LL, 1);
}

- (void)setOperation_queue:(id)a3
{
}

- (OS_dispatch_queue)response_queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 96LL, 1);
}

- (void)setResponse_queue:(id)a3
{
}

- (BOOL)measureElapsedTime
{
  return self->_measureElapsedTime;
}

- (void)setMeasureElapsedTime:(BOOL)a3
{
  self->_measureElapsedTime = a3;
}

- (double)start_time
{
  return self->_start_time;
}

- (void)setStart_time:(double)a3
{
  self->_double start_time = a3;
}

- (CacheDeleteAnalytics)analyticsReporter
{
  return self->_analyticsReporter;
}

- (void)setAnalyticsReporter:(id)a3
{
}

- (BOOL)clientSpecifiedTimeout
{
  return self->_clientSpecifiedTimeout;
}

- (double)timeout_seconds
{
  return self->_timeout_seconds;
}

- (void)setTimeout_seconds:(double)a3
{
  self->_double timeout_seconds = a3;
}

- (void).cxx_destruct
{
}

@end