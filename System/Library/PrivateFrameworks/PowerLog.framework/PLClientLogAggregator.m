@interface PLClientLogAggregator
+ (id)sharedInstance;
- (BOOL)_aggregateForClientID:(id)a3 eventName:(id)a4 eventDictionary:(id)a5 configuration:(id)a6;
- (BOOL)_isEventInputValid:(id)a3 configuration:(id)a4;
- (BOOL)_setEventAggregate:(id)a3 eventName:(id)a4 aggregateKey:(id)a5 valueLabel:(id)a6 value:(id)a7;
- (BOOL)aggregateForClientID_async:(signed __int16)a3 eventName:(id)a4 eventDictionary:(id)a5 configuration:(id)a6;
- (NSMutableDictionary)aggregatesCache;
- (OS_dispatch_queue)executionQueue;
- (OS_dispatch_source)flushTimer;
- (OS_os_log)logHandle;
- (PLClientLogAggregator)init;
- (id)_eventAggregate:(id)a3 eventName:(id)a4 aggregateKey:(id)a5 valueLabel:(id)a6;
- (unsigned)numAggregates;
- (unsigned)numAggregations;
- (void)_flushToPowerLog;
- (void)_scheduleFlushTimer;
- (void)cleanCache;
- (void)setExecutionQueue:(id)a3;
- (void)setFlushTimer:(id)a3;
- (void)setLogHandle:(id)a3;
- (void)setNumAggregates:(unsigned __int8)a3;
- (void)setNumAggregations:(unsigned __int8)a3;
@end

@implementation PLClientLogAggregator

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_2);
  }
  return (id)sharedInstance_sharedInstance;
}

void __39__PLClientLogAggregator_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(&OBJC_CLASS___PLClientLogAggregator);
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v0;
}

- (PLClientLogAggregator)init
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___PLClientLogAggregator;
  v2 = -[PLClientLogAggregator init](&v11, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    aggregatesCache = v2->_aggregatesCache;
    v2->_aggregatesCache = v3;

    *(_WORD *)&v2->_numAggregates = 0;
    os_log_t v5 = os_log_create("com.apple.powerlog.clientLogAggregator", "");
    logHandle = v2->_logHandle;
    v2->_logHandle = v5;

    if (!v2->_logHandle) {
      objc_storeStrong((id *)&v2->_logHandle, MEMORY[0x1895F8DA0]);
    }
    dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_BACKGROUND, 0);
    v7 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v8 = dispatch_queue_create("PLClientLogAggregator", v7);
    executionQueue = v2->_executionQueue;
    v2->_executionQueue = (OS_dispatch_queue *)v8;
  }

  return v2;
}

- (void)_scheduleFlushTimer
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[PLClientLogAggregator executionQueue](self, "executionQueue");
    v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    dispatch_source_t v5 = dispatch_source_create(MEMORY[0x1895F8B78], 0LL, 0LL, v4);
    -[PLClientLogAggregator setFlushTimer:](self, "setFlushTimer:", v5);

    -[PLClientLogAggregator flushTimer](self, "flushTimer");
    v6 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue();
    dispatch_time_t v7 = dispatch_walltime(0LL, 900000000000LL);
    dispatch_source_set_timer(v6, v7, 0xFFFFFFFFFFFFFFFFLL, 0x14F46B0400uLL);

    -[PLClientLogAggregator flushTimer](self, "flushTimer");
    dispatch_queue_t v8 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue();
    handler[0] = MEMORY[0x1895F87A8];
    handler[1] = 3221225472LL;
    handler[2] = __44__PLClientLogAggregator__scheduleFlushTimer__block_invoke;
    handler[3] = &unk_189E9E750;
    handler[4] = self;
    dispatch_source_set_event_handler(v8, handler);

    -[PLClientLogAggregator flushTimer](self, "flushTimer");
    v9 = (dispatch_object_s *)objc_claimAutoreleasedReturnValue();
    dispatch_resume(v9);
  }

uint64_t __44__PLClientLogAggregator__scheduleFlushTimer__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _flushToPowerLog];
}

- (BOOL)aggregateForClientID_async:(signed __int16)a3 eventName:(id)a4 eventDictionary:(id)a5 configuration:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v24 = 0LL;
  v25 = &v24;
  uint64_t v26 = 0x2020000000LL;
  -[PLClientLogAggregator executionQueue](self, "executionQueue");
  v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1895F87A8];
  v18[1] = 3221225472LL;
  v18[2] = __92__PLClientLogAggregator_aggregateForClientID_async_eventName_eventDictionary_configuration___block_invoke;
  v18[3] = &unk_189E9EB88;
  id v21 = v12;
  v22 = &v24;
  signed __int16 v23 = a3;
  v18[4] = self;
  id v19 = v10;
  id v20 = v11;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(v13, v18);

  LOBYTE(self) = *((_BYTE *)v25 + 24);
  _Block_object_dispose(&v24, 8);
  return (char)self;
}

void __92__PLClientLogAggregator_aggregateForClientID_async_eventName_eventDictionary_configuration___block_invoke( uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  [MEMORY[0x189607968] numberWithShort:*(__int16 *)(a1 + 72)];
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (void *)[*(id *)(a1 + 40) copy];
  v4 = (void *)[*(id *)(a1 + 48) copy];
  dispatch_source_t v5 = (void *)[*(id *)(a1 + 56) copy];
  *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [v2 _aggregateForClientID:v6 eventName:v3 eventDictionary:v4 configuration:v5];
}

- (BOOL)_aggregateForClientID:(id)a3 eventName:(id)a4 eventDictionary:(id)a5 configuration:(id)a6
{
  uint64_t v58 = *MEMORY[0x1895F89C0];
  id v10 = a3;
  id v11 = a4;
  id v43 = a5;
  id v12 = a6;
  v13 = v12;
  BOOL v14 = 0;
  v40 = v10;
  if (v10 && v11 && v43 && v12)
  {
    -[PLClientLogAggregator logHandle](self, "logHandle");
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138413058;
      id v51 = v10;
      __int16 v52 = 2112;
      id v53 = v11;
      __int16 v54 = 2112;
      id v55 = v43;
      __int16 v56 = 2112;
      v57 = v13;
      _os_log_debug_impl( &dword_186654000,  v15,  OS_LOG_TYPE_DEBUG,  "Received (clientID:%@, eventName:%@, eventDictionary:%@) for aggregation with configuration:%@",  buf,  0x2Au);
    }

    if (-[PLClientLogAggregator _isEventInputValid:configuration:](self, "_isEventInputValid:configuration:", v43, v13))
    {
      [v13 allKeysForObject:&unk_189EA45E0];
      id v16 = (void *)objc_claimAutoreleasedReturnValue();
      if ([v16 count])
      {
        [MEMORY[0x189603FE8] null];
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        [v43 objectsForKeys:v16 notFoundMarker:v17];
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        [MEMORY[0x189603FE8] null];
        id v19 = (void *)objc_claimAutoreleasedReturnValue();
        id v20 = v16;
        uint64_t v21 = [v18 indexOfObject:v19];

        if (v21 != 0x7FFFFFFFFFFFFFFFLL)
        {

          v39 = 0LL;
          BOOL v14 = 0;
LABEL_31:

          goto LABEL_32;
        }

        v34 = v20;
        v39 = (void *)[objc_alloc(MEMORY[0x189603F68]) initWithObjects:v18 forKeys:v20];
      }

      else
      {
        v34 = v16;
        v39 = &unk_189EA4A38;
      }

      __int128 v47 = 0u;
      __int128 v48 = 0u;
      __int128 v45 = 0u;
      __int128 v46 = 0u;
      v36 = v13;
      id v22 = v13;
      uint64_t v42 = [v22 countByEnumeratingWithState:&v45 objects:v49 count:16];
      if (v42)
      {
        uint64_t v41 = *(void *)v46;
        v37 = self;
        id v38 = v22;
        while (2)
        {
          for (uint64_t i = 0LL; i != v42; ++i)
          {
            if (*(void *)v46 != v41) {
              objc_enumerationMutation(v22);
            }
            uint64_t v24 = *(void *)(*((void *)&v45 + 1) + 8 * i);
            context = (void *)MEMORY[0x186E3D3CC]();
            [v22 objectForKeyedSubscript:v24];
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            if ([v25 unsignedIntValue])
            {
              unsigned int v26 = [v25 unsignedIntValue] - 1;
              if (v26 > 3)
              {

                objc_autoreleasePoolPop(context);
                BOOL v14 = 0;
                id v20 = v34;
                v13 = v36;
                goto LABEL_31;
              }

              uint64_t v27 = (uint64_t)*(&off_189E9EC48 + (int)v26);
              [v43 objectForKeyedSubscript:v24];
              v28 = (void *)objc_claimAutoreleasedReturnValue();

              if (v28)
              {
                v29 = -[PLClientLogAggregator _eventAggregate:eventName:aggregateKey:valueLabel:]( self,  "_eventAggregate:eventName:aggregateKey:valueLabel:",  v40,  v11,  v39,  v24);
                [v43 objectForKeyedSubscript:v24];
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                (*(void (**)(uint64_t, void *, void *))(v27 + 16))(v27, v29, v30);
                v31 = (void *)objc_claimAutoreleasedReturnValue();

                id v22 = v38;
                self = v37;
                -[PLClientLogAggregator _setEventAggregate:eventName:aggregateKey:valueLabel:value:]( v37,  "_setEventAggregate:eventName:aggregateKey:valueLabel:value:",  v40,  v11,  v39,  v24,  v31);
              }
            }

            objc_autoreleasePoolPop(context);
          }

          uint64_t v42 = [v22 countByEnumeratingWithState:&v45 objects:v49 count:16];
          if (v42) {
            continue;
          }
          break;
        }
      }

      -[PLClientLogAggregator setNumAggregations:]( self,  "setNumAggregations:",  (-[PLClientLogAggregator numAggregations](self, "numAggregations") + 1));
      if (-[PLClientLogAggregator numAggregations](self, "numAggregations") == 1) {
        -[PLClientLogAggregator _scheduleFlushTimer](self, "_scheduleFlushTimer");
      }
      unsigned int v32 = -[PLClientLogAggregator numAggregations](self, "numAggregations", v34);
      id v20 = v35;
      if (v32 >= 0x14) {
        -[PLClientLogAggregator _flushToPowerLog](self, "_flushToPowerLog");
      }
      BOOL v14 = 1;
      v13 = v36;
      goto LABEL_31;
    }

    BOOL v14 = 0;
  }

- (BOOL)_isEventInputValid:(id)a3 configuration:(id)a4
{
  uint64_t v37 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 count];
  if (v8 != [v7 count])
  {
    -[PLClientLogAggregator logHandle](self, "logHandle");
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[PLClientLogAggregator _isEventInputValid:configuration:].cold.5(v6, v7, v9);
    }
    goto LABEL_31;
  }

  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  v9 = (os_log_s *)v6;
  uint64_t v10 = -[os_log_s countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v26,  v36,  16LL);
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v24 = self;
    char v25 = 0;
    uint64_t v12 = *(void *)v27;
    while (2)
    {
      for (uint64_t i = 0LL; i != v11; ++i)
      {
        if (*(void *)v27 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v26 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          -[PLClientLogAggregator logHandle](v24, "logHandle");
          id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
            -[PLClientLogAggregator _isEventInputValid:configuration:].cold.4(v14, v19);
          }

          goto LABEL_31;
        }

        [v7 objectForKey:v14];
        id v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v15
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
          || (unint64_t)[v15 unsignedIntegerValue] >= 5)
        {
          -[PLClientLogAggregator logHandle](v24, "logHandle");
          v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
            -[PLClientLogAggregator _isEventInputValid:configuration:].cold.2();
          }

          goto LABEL_31;
        }

        -[os_log_s objectForKey:](v9, "objectForKey:", v14);
        id v16 = (void *)objc_claimAutoreleasedReturnValue();
        if ([v15 unsignedIntegerValue])
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            -[PLClientLogAggregator logHandle](v24, "logHandle");
            uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
            {
              unsigned int v22 = [v15 unsignedIntegerValue];
              if (v22 > 4) {
                signed __int16 v23 = @"(null)";
              }
              else {
                signed __int16 v23 = off_189E9EC68[v22];
              }
              *(_DWORD *)buf = 138412802;
              uint64_t v31 = v14;
              __int16 v32 = 2112;
              v33 = v16;
              __int16 v34 = 2112;
              v35 = v23;
              _os_log_debug_impl( &dword_186654000,  v21,  OS_LOG_TYPE_DEBUG,  "Invalid event data -- value for %@: %@ (according to configuration, %@ expects NSNumber)",  buf,  0x20u);
            }

- (void)_flushToPowerLog
{
  int v7 = [a2 numAggregations];
  *(_DWORD *)a1 = 67109120;
  *a3 = v7;
  _os_log_debug_impl(&dword_186654000, a4, OS_LOG_TYPE_DEBUG, "# of aggregations before flush: %d", a1, 8u);
}

- (void)cleanCache
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 removeAllObjects];

  -[PLClientLogAggregator setNumAggregates:](self, "setNumAggregates:", 0LL);
  -[PLClientLogAggregator setNumAggregations:](self, "setNumAggregations:", 0LL);
}

- (id)_eventAggregate:(id)a3 eventName:(id)a4 aggregateKey:(id)a5 valueLabel:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  -[PLClientLogAggregator aggregatesCache](self, "aggregatesCache");
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 objectForKeyedSubscript:v13];
  id v15 = (void *)objc_claimAutoreleasedReturnValue();

  [v15 objectForKeyedSubscript:v12];
  id v16 = (void *)objc_claimAutoreleasedReturnValue();

  [v16 objectForKeyedSubscript:v11];
  BOOL v17 = (void *)objc_claimAutoreleasedReturnValue();

  [v17 objectForKeyedSubscript:v10];
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (BOOL)_setEventAggregate:(id)a3 eventName:(id)a4 aggregateKey:(id)a5 valueLabel:(id)a6 value:(id)a7
{
  uint64_t v69 = *MEMORY[0x1895F89C0];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  -[PLClientLogAggregator aggregatesCache](self, "aggregatesCache");
  BOOL v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v17 objectForKeyedSubscript:v12];
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    id v19 = (void *)objc_opt_new();
    -[PLClientLogAggregator aggregatesCache](self, "aggregatesCache");
    id v20 = (void *)objc_claimAutoreleasedReturnValue();
    [v20 setObject:v19 forKeyedSubscript:v12];
  }

  v64 = v15;
  -[PLClientLogAggregator aggregatesCache](self, "aggregatesCache");
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
  [v21 objectForKeyedSubscript:v12];
  unsigned int v22 = (void *)objc_claimAutoreleasedReturnValue();
  [v22 objectForKeyedSubscript:v13];
  signed __int16 v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v23)
  {
    uint64_t v24 = (void *)objc_opt_new();
    -[PLClientLogAggregator aggregatesCache](self, "aggregatesCache");
    char v25 = (void *)objc_claimAutoreleasedReturnValue();
    [v25 objectForKeyedSubscript:v12];
    __int128 v26 = (void *)objc_claimAutoreleasedReturnValue();
    [v26 setObject:v24 forKeyedSubscript:v13];
  }

  [MEMORY[0x189603F50] date];
  __int128 v27 = (void *)objc_claimAutoreleasedReturnValue();
  [v27 timeIntervalSince1970];
  double v29 = v28;
  v30 = -[PLClientLogAggregator aggregatesCache](self, "aggregatesCache");
  [v30 objectForKeyedSubscript:v12];
  uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
  [v31 objectForKeyedSubscript:v13];
  __int16 v32 = (void *)objc_claimAutoreleasedReturnValue();
  [v32 objectForKeyedSubscript:v14];
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v33)
  {
    __int16 v34 = (void *)objc_opt_new();
    v35 = -[PLClientLogAggregator aggregatesCache](self, "aggregatesCache");
    [v35 objectForKeyedSubscript:v12];
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    [v36 objectForKeyedSubscript:v13];
    uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue();
    [v37 setObject:v34 forKeyedSubscript:v14];

    [MEMORY[0x189607968] numberWithDouble:v29];
    id v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = -[PLClientLogAggregator aggregatesCache](self, "aggregatesCache");
    [v39 objectForKeyedSubscript:v12];
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    [v40 objectForKeyedSubscript:v13];
    uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue();
    [v41 objectForKeyedSubscript:v14];
    uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue();
    [v42 setObject:v38 forKeyedSubscript:@"__firstTimestamp"];

    objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedChar:",  -[PLClientLogAggregator numAggregates](self, "numAggregates"));
    id v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = -[PLClientLogAggregator aggregatesCache](self, "aggregatesCache");
    [v44 objectForKeyedSubscript:v12];
    __int128 v45 = (void *)objc_claimAutoreleasedReturnValue();
    [v45 objectForKeyedSubscript:v13];
    __int128 v46 = (void *)objc_claimAutoreleasedReturnValue();
    [v46 objectForKeyedSubscript:v14];
    __int128 v47 = (void *)objc_claimAutoreleasedReturnValue();
    [v47 setObject:v43 forKeyedSubscript:@"__number"];

    -[PLClientLogAggregator setNumAggregates:]( self,  "setNumAggregates:",  (-[PLClientLogAggregator numAggregates](self, "numAggregates") + 1));
  }

  -[PLClientLogAggregator aggregatesCache](self, "aggregatesCache");
  __int128 v48 = (void *)objc_claimAutoreleasedReturnValue();
  [v48 objectForKeyedSubscript:v12];
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  [v49 objectForKeyedSubscript:v13];
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  [v50 objectForKeyedSubscript:v14];
  id v51 = (void *)objc_claimAutoreleasedReturnValue();
  [v51 setObject:v16 forKeyedSubscript:v64];

  [MEMORY[0x189607968] numberWithDouble:v29];
  __int16 v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLClientLogAggregator aggregatesCache](self, "aggregatesCache");
  id v53 = (void *)objc_claimAutoreleasedReturnValue();
  [v53 objectForKeyedSubscript:v12];
  __int16 v54 = (void *)objc_claimAutoreleasedReturnValue();
  [v54 objectForKeyedSubscript:v13];
  id v55 = (void *)objc_claimAutoreleasedReturnValue();
  [v55 objectForKeyedSubscript:v14];
  __int16 v56 = (void *)objc_claimAutoreleasedReturnValue();
  [v56 setObject:v52 forKeyedSubscript:@"__lastTimestamp"];

  -[PLClientLogAggregator logHandle](self, "logHandle");
  v57 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
  {
    v59 = -[PLClientLogAggregator aggregatesCache](self, "aggregatesCache");
    [v59 objectForKeyedSubscript:v12];
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    [v60 objectForKeyedSubscript:v13];
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    [v61 objectForKeyedSubscript:v14];
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    [v62 objectForKeyedSubscript:@"__number"];
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v66 = v63;
    __int16 v67 = 2112;
    v68 = v64;
    _os_log_debug_impl( &dword_186654000,  v57,  OS_LOG_TYPE_DEBUG,  "-- Updated aggregated event #%@ (key: %@)",  buf,  0x16u);
  }

  return 1;
}

- (NSMutableDictionary)aggregatesCache
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16LL, 1);
}

- (unsigned)numAggregates
{
  return self->_numAggregates;
}

- (void)setNumAggregates:(unsigned __int8)a3
{
  self->_numAggregates = a3;
}

- (unsigned)numAggregations
{
  return self->_numAggregations;
}

- (void)setNumAggregations:(unsigned __int8)a3
{
  self->_numAggregations = a3;
}

- (OS_os_log)logHandle
{
  return (OS_os_log *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setLogHandle:(id)a3
{
}

- (OS_dispatch_queue)executionQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setExecutionQueue:(id)a3
{
}

- (OS_dispatch_source)flushTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setFlushTimer:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)_isEventInputValid:(os_log_t)log configuration:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl( &dword_186654000,  log,  OS_LOG_TYPE_DEBUG,  "Invalid configuration -- expected at least one numeric AggregateType key",  v1,  2u);
}

- (void)_isEventInputValid:configuration:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6( &dword_186654000,  v0,  (uint64_t)v0,  "Invalid configuration -- value for %@: %@ (expected AggregateType)",  v1);
  OUTLINED_FUNCTION_1();
}

- (void)_isEventInputValid:configuration:.cold.3()
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6( &dword_186654000,  v0,  (uint64_t)v0,  "Invalid event data -- GROUP_BY on %@: %@ (expected NSString or NSNumber)",  v1);
  OUTLINED_FUNCTION_1();
}

- (void)_isEventInputValid:(uint64_t)a1 configuration:(os_log_s *)a2 .cold.4(uint64_t a1, os_log_s *a2)
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl( &dword_186654000,  a2,  OS_LOG_TYPE_DEBUG,  "Invalid event data -- %@ key (expected NSString)",  (uint8_t *)&v2,  0xCu);
  OUTLINED_FUNCTION_1();
}

- (void)_isEventInputValid:(os_log_s *)a3 configuration:.cold.5(void *a1, void *a2, os_log_s *a3)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  int v6 = 134218240;
  uint64_t v7 = [a1 count];
  __int16 v8 = 2048;
  uint64_t v9 = [a2 count];
  OUTLINED_FUNCTION_6( &dword_186654000,  a3,  v5,  "Invalid configuration -- event data (%lu) and configuration (%lu) should have the same number of keys",  (uint8_t *)&v6);
}

@end