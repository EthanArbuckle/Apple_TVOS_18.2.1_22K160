@interface CacheDeletePurgeableOperation
- (BOOL)cancel;
- (CDPurgeableOperationResult)purgeableResult;
- (CacheDeletePurgeableOperation)initWithInfo:(id)a3 services:(id)a4 volumes:(id)a5;
- (NSCountedSet)inflight;
- (OS_dispatch_queue)inflight_q;
- (id)copyInFlights;
- (int)purgeableUrgency;
- (void)_startOperation:(id)a3;
- (void)addInFlight:(id)a3;
- (void)cancelOperation;
- (void)performBlockWithUrgency:(id)a3;
- (void)removeInFlight:(id)a3;
- (void)setCancel:(BOOL)a3;
- (void)setInflight:(id)a3;
- (void)setInflight_q:(id)a3;
- (void)setPurgeableResult:(id)a3;
- (void)setPurgeableUrgency:(int)a3;
@end

@implementation CacheDeletePurgeableOperation

- (CacheDeletePurgeableOperation)initWithInfo:(id)a3 services:(id)a4 volumes:(id)a5
{
  id v8 = a3;
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___CacheDeletePurgeableOperation;
  v9 = -[CacheDeleteOperation initWithInfo:services:volumes:](&v28, "initWithInfo:services:volumes:", v8, a4, a5);
  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteOperation services](v9, "services", 0LL));
    id v12 = [v11 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v25;
      do
      {
        v15 = 0LL;
        do
        {
          if (*(void *)v25 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v24 + 1) + 8LL * (void)v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteOperation services](v9, "services"));
          v18 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:v16]);

          v15 = (char *)v15 + 1;
        }

        while (v13 != v15);
        id v13 = [v11 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }

      while (v13);
    }

    dispatch_queue_t v19 = dispatch_queue_create("com.apple.cahce_delete.purgeable_inflight", 0LL);
    -[CacheDeletePurgeableOperation setInflight_q:](v9, "setInflight_q:", v19);

    v20 = objc_opt_new(&OBJC_CLASS___NSCountedSet);
    -[CacheDeletePurgeableOperation setInflight:](v9, "setInflight:", v20);

    -[CacheDeleteOperation setServices:](v9, "setServices:", v10);
    uint64_t v21 = evaluatePurgeableUrgency(v8);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    -[CacheDeletePurgeableOperation setPurgeableUrgency:](v9, "setPurgeableUrgency:", [v22 intValue]);
  }

  return v9;
}

- (void)cancelOperation
{
}

- (void)addInFlight:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CacheDeletePurgeableOperation inflight_q](self, "inflight_q"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __45__CacheDeletePurgeableOperation_addInFlight___block_invoke;
  block[3] = &unk_100058AA0;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, block);
}

void __45__CacheDeletePurgeableOperation_addInFlight___block_invoke(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) inflight]);
  [v2 addObject:*(void *)(a1 + 40)];
}

- (void)removeInFlight:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CacheDeletePurgeableOperation inflight_q](self, "inflight_q"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __48__CacheDeletePurgeableOperation_removeInFlight___block_invoke;
  block[3] = &unk_100058AA0;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, block);
}

void __48__CacheDeletePurgeableOperation_removeInFlight___block_invoke(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) inflight]);
  [v2 removeObject:*(void *)(a1 + 40)];
}

- (id)copyInFlights
{
  uint64_t v7 = 0LL;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  v10 = __Block_byref_object_copy__6;
  v11 = __Block_byref_object_dispose__6;
  id v12 = 0LL;
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CacheDeletePurgeableOperation inflight_q](self, "inflight_q"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = __46__CacheDeletePurgeableOperation_copyInFlights__block_invoke;
  v6[3] = &unk_100058C48;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __46__CacheDeletePurgeableOperation_copyInFlights__block_invoke(uint64_t a1)
{
  id v5 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) inflight]);
  id v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)performBlockWithUrgency:(id)a3
{
  id v5 = a3;
  (*((void (**)(id, void))a3 + 2))( v5,  -[CacheDeletePurgeableOperation purgeableUrgency](self, "purgeableUrgency"));
}

- (void)_startOperation:(id)a3
{
  v139 = (void (**)(id, id))a3;
  v154 = self;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteOperation info](self, "info"));
  id v5 = [v4 mutableCopy];

  v155 = v5;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"CACHE_DELETE_NO_CACHE"]);
  int v147 = evaluateBoolProperty(v6);

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"CACHE_DELETE_DIAGNOSTIC_INFO"]);
  int v142 = evaluateBoolProperty(v7);

  uint64_t v138 = mach_absolute_time();
  id v8 = objc_alloc(&OBJC_CLASS___CDPurgeableOperationResult);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteOperation volumeNames](v154, "volumeNames"));
  v10 = -[CDPurgeableOperationResult initWithVolumes:](v8, "initWithVolumes:", v9);
  -[CacheDeletePurgeableOperation setPurgeableResult:](v154, "setPurgeableResult:", v10);

  v157 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteOperation resultCache](v154, "resultCache"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteOperation info](v154, "info"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"CACHE_DELETE_CALLING_PROCESS"]);
  uint64_t v13 = evaluateStringProperty(v12);
  v146 = (__CFString *)objc_claimAutoreleasedReturnValue(v13);

  __int128 v190 = 0u;
  __int128 v191 = 0u;
  __int128 v188 = 0u;
  __int128 v189 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[CacheDeleteOperation volumes](v154, "volumes"));
  id v150 = [obj countByEnumeratingWithState:&v188 objects:v209 count:16];
  if (v150)
  {
    uint64_t v14 = @"unknown";
    if (v146) {
      uint64_t v14 = v146;
    }
    v143 = v14;
    uint64_t v149 = *(void *)v189;
    v15 = "FALSE";
    if (v147) {
      v15 = "TRUE";
    }
    v145 = v15;
    if (v147) {
      int v16 = 30;
    }
    else {
      int v16 = 5;
    }
    int v141 = v16;
    if (v147) {
      v17 = "";
    }
    else {
      v17 = "NOT ";
    }
    v140 = v17;
    uint64_t v18 = 5000000000LL;
    if (v147) {
      uint64_t v18 = 30000000000LL;
    }
    int64_t delta = v18;
LABEL_15:
    uint64_t v153 = 0LL;
    while (1)
    {
      if (*(void *)v189 != v149) {
        objc_enumerationMutation(obj);
      }
      v156 = *(void **)(*((void *)&v188 + 1) + 8 * v153);
      objc_msgSend(v155, "setObject:forKeyedSubscript:", 0, @"CACHE_DELETE_AMOUNT", v138);
      dispatch_queue_t v19 = (void *)objc_claimAutoreleasedReturnValue([v156 mountPoint]);
      [v155 setObject:v19 forKeyedSubscript:@"CACHE_DELETE_VOLUME"];

      *(void *)v206 = 0LL;
      *(void *)&v206[8] = v206;
      *(void *)&v206[16] = 0x3032000000LL;
      v207 = __Block_byref_object_copy__6;
      *(void *)&__int128 v208 = __Block_byref_object_dispose__6;
      *((void *)&v208 + 1) = 0LL;
      dispatch_group_t v152 = dispatch_group_create();
      uint64_t v20 = CDGetLogHandle("daemon");
      uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue([v155 objectForKeyedSubscript:@"CACHE_DELETE_QUERY_PATH"]);
        uint64_t v23 = evaluateStringProperty(v22);
        id v24 = (id)objc_claimAutoreleasedReturnValue(v23);
        __int128 v25 = (void *)objc_claimAutoreleasedReturnValue([v156 mountPoint]);
        *(_DWORD *)buf = 67109890;
        *(_DWORD *)v200 = 116;
        *(_WORD *)&v200[4] = 2114;
        *(void *)&v200[6] = v24;
        *(_WORD *)&v200[14] = 2112;
        *(void *)&v200[16] = v25;
        __int16 v201 = 2114;
        v202 = v155;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "%d PurgeableOperation _startOperation query path: %{public}@ for volume: %@, info: %{public}@",  buf,  0x26u);
      }

      if (v156)
      {
        if (v147)
        {
          __int128 v26 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteOperation services](v154, "services"));
          __int128 v27 = (void *)objc_claimAutoreleasedReturnValue([v26 allKeys]);
          objc_super v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v27));
          id v29 = [v28 mutableCopy];
          v30 = *(void **)(*(void *)&v206[8] + 40LL);
          *(void *)(*(void *)&v206[8] + 40LL) = v29;

          v31 = *(void **)(*(void *)&v206[8] + 40LL);
          id v32 = [v157 copyPushingServices];
          [v31 minusSet:v32];

          uint64_t v33 = CDGetLogHandle("daemon");
          log = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
          if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v34 = *(void *)(*(void *)&v206[8] + 40LL);
            *(_DWORD *)buf = 138543362;
            *(void *)v200 = v34;
            _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "NOT using cached purgeable values for %{public}@",  buf,  0xCu);
          }
        }

        else
        {
          v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  -[CacheDeletePurgeableOperation purgeableUrgency](v154, "purgeableUrgency")));
          id v38 = [v157 copyInvalidServicesForVolume:v156 atUrgency:v37];
          id v39 = [v38 mutableCopy];
          v40 = *(void **)(*(void *)&v206[8] + 40LL);
          *(void *)(*(void *)&v206[8] + 40LL) = v39;

          if (!*(void *)(*(void *)&v206[8] + 40LL))
          {
            uint64_t v41 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
            v42 = *(void **)(*(void *)&v206[8] + 40LL);
            *(void *)(*(void *)&v206[8] + 40LL) = v41;
          }

          v43 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteOperation services](v154, "services"));
          v44 = (void *)objc_claimAutoreleasedReturnValue([v43 allKeys]);
          log = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](&OBJC_CLASS___NSMutableSet, "setWithArray:", v44));

          [*(id *)(*(void *)&v206[8] + 40) intersectSet:log];
          v45 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteOperation resultCache](v154, "resultCache"));
          v46 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v45,  "recentInfoForVolume:atUrgency:",  v156,  -[CacheDeletePurgeableOperation purgeableUrgency](v154, "purgeableUrgency")));

          __int128 v186 = 0u;
          __int128 v187 = 0u;
          __int128 v184 = 0u;
          __int128 v185 = 0u;
          v47 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteOperation services](v154, "services"));
          id v48 = [v47 countByEnumeratingWithState:&v184 objects:v205 count:16];
          if (v48)
          {
            uint64_t v49 = *(void *)v185;
            do
            {
              for (i = 0LL; i != v48; i = (char *)i + 1)
              {
                if (*(void *)v185 != v49) {
                  objc_enumerationMutation(v47);
                }
                uint64_t v51 = *(void *)(*((void *)&v184 + 1) + 8LL * (void)i);
                v52 = (void *)objc_claimAutoreleasedReturnValue([v46 objectForKeyedSubscript:v51]);
                if (v52)
                {
                }

                else
                {
                  id v53 = [v157 copyPushingServices];
                  unsigned __int8 v54 = [v53 containsObject:v51];

                  if ((v54 & 1) == 0) {
                    [*(id *)(*(void *)&v206[8] + 40) addObject:v51];
                  }
                }
              }

              id v48 = [v47 countByEnumeratingWithState:&v184 objects:v205 count:16];
            }

            while (v48);
          }
        }

        uint64_t v55 = CDGetLogHandle("daemon");
        v56 = (os_log_s *)objc_claimAutoreleasedReturnValue(v55);
        if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
        {
          v57 = (void *)objc_claimAutoreleasedReturnValue([v156 mountPoint]);
          id v58 = [*(id *)(*(void *)&v206[8] + 40) count];
          *(_DWORD *)buf = 67110146;
          *(_DWORD *)v200 = 146;
          *(_WORD *)&v200[4] = 2114;
          *(void *)&v200[6] = v143;
          *(_WORD *)&v200[14] = 2082;
          *(void *)&v200[16] = v145;
          __int16 v201 = 2114;
          v202 = v57;
          __int16 v203 = 2048;
          id v204 = v58;
          _os_log_impl( (void *)&_mh_execute_header,  v56,  OS_LOG_TYPE_DEFAULT,  "%d PurgeableOperation Calling process: %{public}@, refreshAll is %{public}s for volume: %{public}@, %lu servicesToQuery:",  buf,  0x30u);
        }

        __int128 v182 = 0u;
        __int128 v183 = 0u;
        __int128 v180 = 0u;
        __int128 v181 = 0u;
        id v59 = *(id *)(*(void *)&v206[8] + 40LL);
        id v60 = [v59 countByEnumeratingWithState:&v180 objects:v198 count:16];
        if (v60)
        {
          uint64_t v61 = *(void *)v181;
          do
          {
            for (j = 0LL; j != v60; j = (char *)j + 1)
            {
              if (*(void *)v181 != v61) {
                objc_enumerationMutation(v59);
              }
              uint64_t v63 = *(void *)(*((void *)&v180 + 1) + 8LL * (void)j);
              uint64_t v64 = CDGetLogHandle("daemon");
              v65 = (os_log_s *)objc_claimAutoreleasedReturnValue(v64);
              if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109378;
                *(_DWORD *)v200 = 148;
                *(_WORD *)&v200[4] = 2114;
                *(void *)&v200[6] = v63;
                _os_log_impl( (void *)&_mh_execute_header,  v65,  OS_LOG_TYPE_DEFAULT,  "%d PurgeableOperation will query: %{public}@",  buf,  0x12u);
              }
            }

            id v60 = [v59 countByEnumeratingWithState:&v180 objects:v198 count:16];
          }

          while (v60);
        }

        if ([*(id *)(*(void *)&v206[8] + 40) count])
        {
          v66 = objc_alloc(&OBJC_CLASS___CacheDeleteAsyncTimeoutFlag);
          v67 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteOperation response_queue](v154, "response_queue"));
          v68 = -[CacheDeleteAsyncTimeoutFlag initWithQueue:](v66, "initWithQueue:", v67);

          v173[0] = _NSConcreteStackBlock;
          v173[1] = 3221225472LL;
          v173[2] = __49__CacheDeletePurgeableOperation__startOperation___block_invoke;
          v173[3] = &unk_100059B40;
          v173[4] = v154;
          v179 = v206;
          v69 = v152;
          v174 = v69;
          id v70 = v155;
          id v175 = v70;
          v176 = v146;
          v177 = v156;
          v36 = v68;
          v178 = v36;
          -[CacheDeletePurgeableOperation performBlockWithUrgency:](v154, "performBlockWithUrgency:", v173);
          dispatch_time_t v71 = dispatch_time(0LL, delta);
          uint64_t v72 = dispatch_group_wait(v69, v71);
          -[CacheDeleteAsyncTimeoutFlag setTimedOut:](v36, "setTimedOut:", 1LL);
          if (v72)
          {
            id v73 = -[CacheDeletePurgeableOperation copyInFlights](v154, "copyInFlights");
            uint64_t v74 = CDGetLogHandle("daemon");
            v75 = (os_log_s *)objc_claimAutoreleasedReturnValue(v74);
            if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v76 = objc_opt_self(v154);
              v77 = (void *)objc_claimAutoreleasedReturnValue(v76);
              v78 = (void *)objc_claimAutoreleasedReturnValue([v77 volumeNames]);
              *(_DWORD *)buf = 67109634;
              *(_DWORD *)v200 = v141;
              *(_WORD *)&v200[4] = 2080;
              *(void *)&v200[6] = v140;
              *(_WORD *)&v200[14] = 2114;
              *(void *)&v200[16] = v78;
              _os_log_impl( (void *)&_mh_execute_header,  v75,  OS_LOG_TYPE_DEFAULT,  "dispatch_group_wait timed out after %d seconds, %srefreshing all services. Volumes: %{public}@, services in flight:",  buf,  0x1Cu);
            }

            __int128 v171 = 0u;
            __int128 v172 = 0u;
            __int128 v169 = 0u;
            __int128 v170 = 0u;
            id v79 = v73;
            id v80 = [v79 countByEnumeratingWithState:&v169 objects:v197 count:16];
            if (v80)
            {
              uint64_t v81 = *(void *)v170;
              do
              {
                for (k = 0LL; k != v80; k = (char *)k + 1)
                {
                  if (*(void *)v170 != v81) {
                    objc_enumerationMutation(v79);
                  }
                  uint64_t v83 = *(void *)(*((void *)&v169 + 1) + 8LL * (void)k);
                  uint64_t v84 = CDGetLogHandle("daemon");
                  v85 = (os_log_s *)objc_claimAutoreleasedReturnValue(v84);
                  if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138543362;
                    *(void *)v200 = v83;
                    _os_log_impl( (void *)&_mh_execute_header,  v85,  OS_LOG_TYPE_DEFAULT,  "dispatch_group_wait_timeout_leave, service inFlight: %{public}@",  buf,  0xCu);
                  }
                }

                id v80 = [v79 countByEnumeratingWithState:&v169 objects:v197 count:16];
              }

              while (v80);
            }

            if (v79) {
              int v86 = v142;
            }
            else {
              int v86 = 0;
            }
            if (v86 == 1) {
              [v70 setObject:v79 forKeyedSubscript:@"CACHE_DELETE_SERVICES_INFLIGHT"];
            }
          }
        }

        else
        {
          uint64_t v87 = CDGetLogHandle("daemon");
          v36 = (CacheDeleteAsyncTimeoutFlag *)objc_claimAutoreleasedReturnValue(v87);
          if (os_log_type_enabled((os_log_t)v36, OS_LOG_TYPE_DEFAULT))
          {
            v88 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteOperation volumeNames](v154, "volumeNames"));
            *(_DWORD *)buf = 138543618;
            *(void *)v200 = v88;
            *(_WORD *)&v200[8] = 2080;
            *(void *)&v200[10] = v145;
            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v36,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] no servicesToQuery. refreshAll: %s",  buf,  0x16u);
          }
        }
      }

      else
      {
        uint64_t v35 = CDGetLogHandle("daemon");
        v36 = (CacheDeleteAsyncTimeoutFlag *)objc_claimAutoreleasedReturnValue(v35);
        if (os_log_type_enabled((os_log_t)v36, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          *(void *)v200 = v155;
          _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v36,  OS_LOG_TYPE_ERROR,  "Invalid volume parameter, info: %{public}@",  buf,  0xCu);
        }
      }

      _Block_object_dispose(v206, 8);
      if (!v156) {
        break;
      }
      if ((id)++v153 == v150)
      {
        id v150 = [obj countByEnumeratingWithState:&v188 objects:v209 count:16];
        if (v150) {
          goto LABEL_15;
        }
        goto LABEL_76;
      }
    }
  }

  else
  {
LABEL_76:

    v89 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeletePurgeableOperation purgeableResult](v154, "purgeableResult"));
    [v89 finish];

    v90 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteOperation analyticsReporter](v154, "analyticsReporter"));
    v91 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeletePurgeableOperation purgeableResult](v154, "purgeableResult"));
    [v90 reportPurgeable:v91];

    if (v142)
    {
      v92 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
      __int128 v167 = 0u;
      __int128 v168 = 0u;
      __int128 v165 = 0u;
      __int128 v166 = 0u;
      id v158 = -[CacheDeletePurgeableOperation copyInFlights](v154, "copyInFlights");
      id v93 = [v158 countByEnumeratingWithState:&v165 objects:v196 count:16];
      if (v93)
      {
        uint64_t v94 = *(void *)v166;
        do
        {
          for (m = 0LL; m != v93; m = (char *)m + 1)
          {
            if (*(void *)v166 != v94) {
              objc_enumerationMutation(v158);
            }
            uint64_t v96 = *(void *)(*((void *)&v165 + 1) + 8LL * (void)m);
            v195[0] = &off_10005D4C0;
            v194[0] = @"Reported";
            v194[1] = @"Duration";
            v97 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", nan(""));
            v98 = (void *)objc_claimAutoreleasedReturnValue(v97);
            v194[2] = @"inFlight";
            v195[1] = v98;
            v195[2] = &__kCFBooleanTrue;
            v99 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v195,  v194,  3LL));

            v193 = v99;
            v100 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v193,  1LL));
            [v92 setObject:v100 forKeyedSubscript:v96];
          }

          id v93 = [v158 countByEnumeratingWithState:&v165 objects:v196 count:16];
        }

        while (v93);
      }

      v101 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeletePurgeableOperation purgeableResult](v154, "purgeableResult"));
      v102 = (void *)objc_claimAutoreleasedReturnValue([v101 results]);
      v163[0] = _NSConcreteStackBlock;
      v163[1] = 3221225472LL;
      v163[2] = __49__CacheDeletePurgeableOperation__startOperation___block_invoke_57;
      v163[3] = &unk_100059B68;
      id v164 = v92;
      id v103 = v92;
      [v102 enumerateObjectsUsingBlock:v163];

      id v104 = [v103 copy];
      [v155 setObject:v104 forKeyedSubscript:@"CACHE_DELETE_DIAGNOSTIC_INFO"];
    }

    double v105 = (double)v138;
    v106 = +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  gTimebaseConversion * ((double)mach_absolute_time() - (double)v138) / 1000000000.0);
    v107 = (void *)objc_claimAutoreleasedReturnValue(v106);
    [v155 setObject:v107 forKeyedSubscript:@"CACHE_DELETE_ELAPSED_TIME"];

    if (-[CacheDeletePurgeableOperation cancel](v154, "cancel")) {
      [v155 setObject:@"Operation Cancelled" forKeyedSubscript:@"CACHE_DELETE_ERROR"];
    }
    v108 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteOperation volumes](v154, "volumes", v138));
    id v109 = (id)-[CacheDeleteOperation urgency](v154, "urgency");
    v110 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteOperation info](v154, "info"));
    v111 = (void *)objc_claimAutoreleasedReturnValue([v110 objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"]);
    uint64_t v112 = evaluateStringProperty(v111);
    v113 = (void *)objc_claimAutoreleasedReturnValue(v112);
    v114 = (void *)objc_claimAutoreleasedReturnValue( [v157 recentInfoForVolumes:v108 atUrgency:v109 validateResults:0 targetVolume:v113]);
    [v155 addEntriesFromDictionary:v114];

    uint64_t v115 = CDGetLogHandle("daemon");
    v116 = (os_log_s *)objc_claimAutoreleasedReturnValue(v115);
    if (os_log_type_enabled(v116, OS_LOG_TYPE_DEFAULT))
    {
      if (v146) {
        v117 = v146;
      }
      else {
        v117 = @"unknown caller";
      }
      v118 = (void *)objc_claimAutoreleasedReturnValue([v155 objectForKeyedSubscript:@"CACHE_DELETE_QUERY_PATH"]);
      uint64_t v119 = evaluateStringProperty(v118);
      v120 = (void *)objc_claimAutoreleasedReturnValue(v119);
      v121 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  -[CacheDeleteOperation urgency](v154, "urgency")));
      uint64_t v122 = mach_absolute_time();
      *(_DWORD *)v206 = 138544130;
      *(void *)&v206[4] = v117;
      *(_WORD *)&v206[12] = 2112;
      *(void *)&v206[14] = v120;
      *(_WORD *)&v206[22] = 2112;
      v207 = v121;
      LOWORD(v208) = 2048;
      *(double *)((char *)&v208 + 2) = gTimebaseConversion * ((double)v122 - v105) / 1000000000.0;
      _os_log_impl( (void *)&_mh_execute_header,  v116,  OS_LOG_TYPE_DEFAULT,  "<<<PurgeableOperation Result (%{public}@, query path: %@, u: %@, ET: %f):",  v206,  0x2Au);
    }

    __int128 v161 = 0u;
    __int128 v162 = 0u;
    __int128 v159 = 0u;
    __int128 v160 = 0u;
    id v123 = v155;
    id v124 = [v123 countByEnumeratingWithState:&v159 objects:v192 count:16];
    if (v124)
    {
      uint64_t v125 = *(void *)v160;
      do
      {
        for (n = 0LL; n != v124; n = (char *)n + 1)
        {
          if (*(void *)v160 != v125) {
            objc_enumerationMutation(v123);
          }
          uint64_t v127 = *(void *)(*((void *)&v159 + 1) + 8LL * (void)n);
          uint64_t v128 = CDGetLogHandle("daemon");
          v129 = (os_log_s *)objc_claimAutoreleasedReturnValue(v128);
          if (os_log_type_enabled(v129, OS_LOG_TYPE_DEFAULT))
          {
            v130 = (void *)objc_claimAutoreleasedReturnValue([v123 objectForKeyedSubscript:v127]);
            *(_DWORD *)v206 = 138543618;
            *(void *)&v206[4] = v127;
            *(_WORD *)&v206[12] = 2114;
            *(void *)&v206[14] = v130;
            _os_log_impl((void *)&_mh_execute_header, v129, OS_LOG_TYPE_DEFAULT, "%{public}@ : %{public}@", v206, 0x16u);
          }
        }

        id v124 = [v123 countByEnumeratingWithState:&v159 objects:v192 count:16];
      }

      while (v124);
    }

    uint64_t v131 = CDGetLogHandle("daemon");
    v132 = (os_log_s *)objc_claimAutoreleasedReturnValue(v131);
    if (os_log_type_enabled(v132, OS_LOG_TYPE_DEFAULT))
    {
      v133 = (void *)objc_claimAutoreleasedReturnValue([v123 objectForKeyedSubscript:@"CACHE_DELETE_TOTAL_AVAILABLE"]);
      v134 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteOperation info](v154, "info"));
      uint64_t v135 = objc_claimAutoreleasedReturnValue([v134 objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"]);
      v136 = (void *)v135;
      v137 = @"unknown";
      *(_DWORD *)v206 = 138543874;
      if (v146) {
        v137 = v146;
      }
      *(void *)&v206[4] = v133;
      *(_WORD *)&v206[12] = 2114;
      *(void *)&v206[14] = v135;
      *(_WORD *)&v206[22] = 2114;
      v207 = (uint64_t (*)(uint64_t, uint64_t))v137;
      _os_log_impl( (void *)&_mh_execute_header,  v132,  OS_LOG_TYPE_DEFAULT,  "PurgeableOperation Result>>> %{public}@ bytes on: %{public}@. Calling process: %{public}@",  v206,  0x20u);
    }

    id obj = [v123 copy];
    v139[2](v139, obj);
  }
}

uint64_t __49__CacheDeletePurgeableOperation__startOperation___block_invoke(uint64_t a1, unsigned int a2)
{
  unsigned int v33 = [*(id *)(a1 + 32) cancel];
  if ((v33 & 1) == 0)
  {
    uint64_t v3 = CDGetLogHandle("daemon");
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      unsigned int v31 = [*(id *)(a1 + 32) urgency];
      unsigned int v32 = [*(id *)(a1 + 32) urgencyLimit];
      *(void *)&__int128 buf = 0xA004000300LL;
      WORD4(buf) = 1024;
      *(_DWORD *)((char *)&buf + 10) = v31;
      HIWORD(buf) = 1024;
      LODWORD(v57) = v32;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEBUG,  "%d self.urgency: %d, self.urgencyLimit: %d",  (uint8_t *)&buf,  0x14u);
    }

    __int128 v54 = 0u;
    __int128 v55 = 0u;
    __int128 v52 = 0u;
    __int128 v53 = 0u;
    id v5 = *(id *)(*(void *)(*(void *)(a1 + 80) + 8LL) + 40LL);
    id v37 = [v5 countByEnumeratingWithState:&v52 objects:v59 count:16];
    if (v37)
    {
      uint64_t v36 = *(void *)v53;
      do
      {
        for (i = 0LL; i != v37; i = (char *)i + 1)
        {
          if (*(void *)v53 != v36) {
            objc_enumerationMutation(v5);
          }
          uint64_t v7 = *(void *)(*((void *)&v52 + 1) + 8LL * (void)i);
          uint64_t v8 = fsPurgeableTypeForService(v7);
          uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

          if (!v9)
          {
            v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) services]);
            v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:v7]);

            if ([v11 inFlight])
            {
              uint64_t v12 = CDGetLogHandle("daemon");
              uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
              if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
              {
                LODWORD(buf) = 138543362;
                *(void *)((char *)&buf + 4) = v7;
                _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Service %{public}@ is still in-flight!",  (uint8_t *)&buf,  0xCu);
              }
            }

            else
            {
              dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
              [*(id *)(a1 + 32) addInFlight:v7];
              uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) resultCache]);
              objc_initWeak(&location, *(id *)(a1 + 32));
              uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "response_queue"));
              *(void *)&__int128 buf = 0LL;
              *((void *)&buf + 1) = &buf;
              uint64_t v57 = 0x2020000000LL;
              char v58 = 0;
              v15 = objc_alloc_init(&OBJC_CLASS___CDPurgeableServiceRequestResult);
              -[CDServiceRequestResult setUrgency:](v15, "setUrgency:", a2);
              -[CDServiceRequestResult setServiceName:](v15, "setServiceName:", v7);
              int v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) servicesToTranslate]);
              unsigned int v17 = [v16 containsObject:v7];

              uint64_t v18 = *(void **)(a1 + 48);
              if (v17)
              {
                dispatch_queue_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"]);
                uint64_t v20 = mapVolume(v19, 0LL);
              }

              else
              {
                dispatch_queue_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"]);
                uint64_t v20 = mapVolume(v19, 1LL);
              }

              uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
              [*(id *)(a1 + 48) setObject:v21 forKeyedSubscript:@"CACHE_DELETE_VOLUME"];

              v22 = (void *)mach_absolute_time();
              id v23 = [*(id *)(a1 + 48) mutableCopy];
              v38[0] = _NSConcreteStackBlock;
              v38[1] = 3221225472LL;
              v38[2] = __49__CacheDeletePurgeableOperation__startOperation___block_invoke_25;
              v38[3] = &unk_100059B18;
              v49[1] = v22;
              v38[4] = v7;
              id v24 = *(id *)(a1 + 56);
              uint64_t v25 = *(void *)(a1 + 64);
              id v39 = v24;
              uint64_t v40 = v25;
              p___int128 buf = &buf;
              id v26 = v11;
              id v41 = v26;
              id v42 = *(id *)(a1 + 40);
              id v27 = v14;
              id v43 = v27;
              objc_copyWeak(v49, &location);
              objc_super v28 = v15;
              uint64_t v29 = *(void *)(a1 + 32);
              v44 = v28;
              uint64_t v45 = v29;
              unsigned int v50 = a2;
              uint64_t v13 = v34;
              v46 = v13;
              id v47 = *(id *)(a1 + 72);
              [v26 servicePurgeable:a2 info:v23 replyBlock:v38];

              objc_destroyWeak(v49);
              _Block_object_dispose(&buf, 8);

              objc_destroyWeak(&location);
            }
          }
        }

        id v37 = [v5 countByEnumeratingWithState:&v52 objects:v59 count:16];
      }

      while (v37);
    }

void __49__CacheDeletePurgeableOperation__startOperation___block_invoke_25(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = mach_absolute_time();
  unint64_t v5 = *(void *)(a1 + 128);
  double v6 = gTimebaseConversion;
  uint64_t v7 = CDGetLogHandle("daemon");
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    double v9 = v6 * ((double)v4 - (double)v5) / 1000000000.0;
    v10 = *(void **)(a1 + 32);
    if (*(void *)(a1 + 40)) {
      v11 = *(const __CFString **)(a1 + 40);
    }
    else {
      v11 = @"unknown";
    }
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) mountPoint]);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"CACHE_DELETE_AMOUNT"]);
    *(_DWORD *)__int128 buf = 138544386;
    uint64_t v51 = v10;
    __int16 v52 = 2048;
    double v53 = v9;
    __int16 v54 = 2114;
    __int128 v55 = v11;
    __int16 v56 = 2114;
    uint64_t v57 = v12;
    __int16 v58 = 2114;
    id v59 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%{public}@ took %f seconds for Calling process: %{public}@, on volume: %{public}@, returned: %{public}@",  buf,  0x34u);
  }

  uint64_t v34 = a1;

  __int128 v47 = 0u;
  __int128 v48 = 0u;
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  id v14 = v3;
  id v15 = [v14 countByEnumeratingWithState:&v45 objects:v49 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v46;
    do
    {
      for (i = 0LL; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v46 != v17) {
          objc_enumerationMutation(v14);
        }
        dispatch_queue_t v19 = *(void **)(*((void *)&v45 + 1) + 8LL * (void)i);
        uint64_t v20 = CDGetLogHandle("daemon");
        uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:v19]);
          *(_DWORD *)__int128 buf = 138543618;
          uint64_t v51 = v19;
          __int16 v52 = 2114;
          double v53 = *(double *)&v22;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "\t%{public}@ : %{public}@", buf, 0x16u);
        }
      }

      id v16 = [v14 countByEnumeratingWithState:&v45 objects:v49 count:16];
    }

    while (v16);
  }

  uint64_t v23 = *(void *)(*(void *)(v34 + 112) + 8LL);
  if (*(_BYTE *)(v23 + 24))
  {
    uint64_t v24 = CDGetLogHandle("daemon");
    uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
    {
      unsigned int v33 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v34 + 56) ID]);
      *(_DWORD *)__int128 buf = 138543362;
      uint64_t v51 = v33;
      _os_log_fault_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_FAULT,  "Purgeable callback firing more than once for service %{public}@",  buf,  0xCu);
    }

    id v26 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v34 + 56) ID]);
    _CacheDeleteAbortWithMessage("Purgeable callback firing more than once for service %{public}@", v26);
  }

  else
  {
    *(_BYTE *)(v23 + 24) = 1;
    id v27 = *(dispatch_group_s **)(v34 + 64);
    objc_super v28 = *(dispatch_queue_s **)(v34 + 72);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = __49__CacheDeletePurgeableOperation__startOperation___block_invoke_27;
    block[3] = &unk_100059AF0;
    objc_copyWeak(&v43, (id *)(v34 + 120));
    id v36 = *(id *)(v34 + 80);
    id v29 = v14;
    uint64_t v30 = *(void *)(v34 + 32);
    id v37 = v29;
    uint64_t v38 = v30;
    uint64_t v31 = *(void *)(v34 + 88);
    unsigned int v32 = *(void **)(v34 + 96);
    uint64_t v39 = *(void *)(v34 + 48);
    uint64_t v40 = v31;
    int v44 = *(_DWORD *)(v34 + 136);
    id v41 = v32;
    id v42 = *(id *)(v34 + 104);
    dispatch_group_async(v27, v28, block);
    dispatch_group_leave(*(dispatch_group_t *)(v34 + 64));

    objc_destroyWeak(&v43);
  }
}

void __49__CacheDeletePurgeableOperation__startOperation___block_invoke_27(uint64_t a1)
{
  uint64_t v1 = a1;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  [*(id *)(v1 + 32) finish];
  id v3 = *(void **)(v1 + 40);
  if (v3)
  {
    uint64_t v4 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"CACHE_DELETE_AMOUNT"]);
    if (!v4
      || (uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v4, v5) & 1) == 0)
      || ((unint64_t)[v4 longLongValue] & 0x8000000000000000) != 0)
    {
      uint64_t v6 = CDGetLogHandle("daemon");
      uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = *(void *)(v1 + 48);
        *(_DWORD *)__int128 buf = 138543362;
        uint64_t v62 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%{public}@ returned an invalid CACHE_DELETE_AMOUNT, using zero",  buf,  0xCu);
      }

      uint64_t v4 = &off_10005D4C0;
    }

    objc_msgSend(*(id *)(v1 + 32), "setReportedPurgeableBytes:", objc_msgSend(v4, "unsignedLongLongValue"));
    v59[0] = @"CACHE_DELETE_AMOUNT";
    v59[1] = @"CACHE_DELETE_VOLUME";
    v60[0] = v4;
    double v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v1 + 56) mountPoint]);
    v60[1] = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v60,  v59,  2LL));
    [v2 addEntriesFromDictionary:v10];

    v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v1 + 40) objectForKeyedSubscript:@"CACHE_DELETE_SIGNING_ID"]);
    uint64_t v12 = evaluateStringProperty(v11);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

    id v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v1 + 40) objectForKeyedSubscript:@"CACHE_DELETE_PROCNAME"]);
    uint64_t v15 = evaluateStringProperty(v14);
    id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

    if (v13) {
      [v2 setObject:v13 forKeyedSubscript:@"CACHE_DELETE_SIGNING_ID"];
    }
    if (v16) {
      [v2 setObject:v16 forKeyedSubscript:@"CACHE_DELETE_PROCNAME"];
    }
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(v1 + 40) objectForKeyedSubscript:@"CACHE_DELETE_NONPURGEABLE_AMOUNT"]);

    if (v17)
    {
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(v1 + 40) objectForKeyedSubscript:@"CACHE_DELETE_NONPURGEABLE_AMOUNT"]);
      [v2 setObject:v18 forKeyedSubscript:@"CACHE_DELETE_NONPURGEABLE_AMOUNT"];
    }

    dispatch_queue_t v19 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(v1 + 40) objectForKeyedSubscript:@"CACHE_DELETE_ITEMIZED_NONPURGEABLE"]);

    if (v19)
    {
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(v1 + 40) objectForKeyedSubscript:@"CACHE_DELETE_ITEMIZED_NONPURGEABLE"]);
      [v2 setObject:v20 forKeyedSubscript:@"CACHE_DELETE_ITEMIZED_NONPURGEABLE"];
    }

    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v1 + 64) analyticsReporter]);
    [v21 reportPurgeableTimingInfo:*(void *)(v1 + 32)];
  }

  else
  {
    uint64_t v22 = CDGetLogHandle("daemon");
    uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v24 = *(void *)(v1 + 48);
      *(_DWORD *)__int128 buf = 138543362;
      uint64_t v62 = v24;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%{public}@ returned null result", buf, 0xCu);
    }

    v57[0] = @"CACHE_DELETE_AMOUNT";
    v57[1] = @"CACHE_DELETE_VOLUME";
    v58[0] = &off_10005D4C0;
    uint64_t v4 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue([*(id *)(v1 + 56) mountPoint]);
    v58[1] = v4;
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v58,  v57,  2LL));
    [v2 addEntriesFromDictionary:v13];
  }

  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", *(unsigned int *)(v1 + 96)));
  [v2 setObject:v25 forKeyedSubscript:@"CACHE_DELETE_URGENCY"];

  __int128 v47 = v2;
  [*(id *)(v1 + 72) updateRecentInfoForServiceID:*(void *)(v1 + 48) volume:*(void *)(v1 + 56) info:v2];
  id v26 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v1 + 40) objectForKeyedSubscript:@"CACHE_DELETE_ITEMIZED_PURGEABLE"]);
  __int128 v52 = 0u;
  __int128 v53 = 0u;
  __int128 v54 = 0u;
  __int128 v55 = 0u;
  id v27 = [v26 countByEnumeratingWithState:&v52 objects:v56 count:16];
  if (v27)
  {
    id v28 = v27;
    uint64_t v29 = *(void *)v53;
    uint64_t v49 = *(void *)v53;
    unsigned int v50 = v26;
    do
    {
      uint64_t v30 = 0LL;
      id v51 = v28;
      do
      {
        if (*(void *)v53 != v29) {
          objc_enumerationMutation(v26);
        }
        uint64_t v31 = *(void **)(*((void *)&v52 + 1) + 8LL * (void)v30);
        if (([v31 isEqualToString:@"CACHE_DELETE_TOTAL_FSPURGEABLE"] & 1) == 0)
        {
          unsigned int v32 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
          unsigned int v33 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v1 + 40) objectForKeyedSubscript:@"CACHE_DELETE_SIGNING_ID"]);
          uint64_t v34 = evaluateStringProperty(v33);
          uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue(v34);

          id v36 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v1 + 40) objectForKeyedSubscript:@"CACHE_DELETE_PROCNAME"]);
          uint64_t v37 = evaluateStringProperty(v36);
          uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue(v37);

          if (v35) {
            -[NSMutableDictionary setObject:forKeyedSubscript:]( v32,  "setObject:forKeyedSubscript:",  v35,  @"CACHE_DELETE_SIGNING_ID");
          }
          uint64_t v39 = v1;
          if (v38) {
            -[NSMutableDictionary setObject:forKeyedSubscript:]( v32,  "setObject:forKeyedSubscript:",  v38,  @"CACHE_DELETE_PROCNAME");
          }
          uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKeyedSubscript:v31]);
          uint64_t v41 = evaluateNumberProperty();
          id v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
          else {
            id v43 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue([v26 objectForKeyedSubscript:v31]);
          }

          uint64_t v1 = v39;
          int v44 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  *(unsigned int *)(v39 + 96)));
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v32,  "setObject:forKeyedSubscript:",  v44,  @"CACHE_DELETE_URGENCY");

          -[NSMutableDictionary setObject:forKeyedSubscript:]( v32,  "setObject:forKeyedSubscript:",  v43,  @"CACHE_DELETE_AMOUNT");
          __int128 v45 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v39 + 56) mountPoint]);
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v32,  "setObject:forKeyedSubscript:",  v45,  @"CACHE_DELETE_VOLUME");

          [*(id *)(v39 + 72) updateRecentInfoForServiceID:v31 volume:*(void *)(v39 + 56) info:v32];
          id v26 = v50;
          id v28 = v51;
          uint64_t v29 = v49;
        }

        uint64_t v30 = (char *)v30 + 1;
      }

      while (v28 != v30);
      id v28 = [v26 countByEnumeratingWithState:&v52 objects:v56 count:16];
    }

    while (v28);
  }

  if (([*(id *)(v1 + 80) timedOut] & 1) == 0)
  {
    __int128 v46 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained purgeableResult]);
    [v46 addResult:*(void *)(v1 + 32)];

    [WeakRetained removeInFlight:*(void *)(v1 + 48)];
  }
}

void __49__CacheDeletePurgeableOperation__startOperation___block_invoke_57(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 serviceName]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v5]);

  if (!v6)
  {
    uint64_t v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    uint64_t v8 = *(void **)(a1 + 32);
    double v9 = (void *)objc_claimAutoreleasedReturnValue([v3 serviceName]);
    [v8 setObject:v7 forKeyedSubscript:v9];
  }

  v17[0] = @"Urgency";
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v3 urgency]));
  v18[0] = v10;
  v17[1] = @"Reported";
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v3 reportedPurgeableBytes]));
  v18[1] = v11;
  v17[2] = @"Duration";
  [v3 duration];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  v18[2] = v12;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v18,  v17,  3LL));

  id v14 = *(void **)(a1 + 32);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v3 serviceName]);
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:v15]);
  [v16 addObject:v13];
}

- (int)purgeableUrgency
{
  return self->_purgeableUrgency;
}

- (void)setPurgeableUrgency:(int)a3
{
  self->_purgeableUrgency = a3;
}

- (CDPurgeableOperationResult)purgeableResult
{
  return self->_purgeableResult;
}

- (void)setPurgeableResult:(id)a3
{
}

- (BOOL)cancel
{
  return self->_cancel;
}

- (void)setCancel:(BOOL)a3
{
  self->_cancel = a3;
}

- (OS_dispatch_queue)inflight_q
{
  return self->_inflight_q;
}

- (void)setInflight_q:(id)a3
{
}

- (NSCountedSet)inflight
{
  return self->_inflight;
}

- (void)setInflight:(id)a3
{
}

- (void).cxx_destruct
{
}

@end