@interface PCCProxiedDevice
- (BOOL)doWork:(id)a3;
- (BOOL)preserveFiles;
- (PCCProxiedDevice)initWithEndpoint:(id)a3;
- (double)jobTimeout;
- (void)acceptTaskingPayload:(id)a3 forRouting:(id)a4 withId:(id)a5;
- (void)ack:(id)a3 result:(BOOL)a4 error:(id)a5;
- (void)finish:(id)a3 target:(id)a4 event:(id)a5 type:(id)a6 result:(id)a7;
- (void)handleConnection:(BOOL)a3 from:(id)a4;
- (void)handleFile:(id)a3 from:(id)a4 metadata:(id)a5;
- (void)handleMessage:(id)a3 from:(id)a4;
- (void)initiate:(id)a3 transferGroupWithOptions:(id)a4 job:(id)a5;
- (void)initiate:(id)a3 transferLog:(id)a4 withOptions:(id)a5 job:(id)a6;
- (void)sendDeviceMetadata:(id)a3;
- (void)setJobTimeout:(double)a3;
- (void)setPreserveFiles:(BOOL)a3;
- (void)startTimer;
@end

@implementation PCCProxiedDevice

- (PCCProxiedDevice)initWithEndpoint:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___PCCProxiedDevice;
  v6 = -[PCCProxiedDevice init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_jobTimeout = 1200.0;
    uint64_t v8 = objc_opt_new();
    jobByTracker = v7->_jobByTracker;
    v7->_jobByTracker = (NSMutableDictionary *)v8;

    dispatch_queue_t v10 = dispatch_queue_create("com.apple.ProxiedCrashCopier.job_queue", 0LL);
    job_queue = v7->_job_queue;
    v7->_job_queue = (OS_dispatch_queue *)v10;

    objc_storeStrong((id *)&v7->_endpoint, a3);
    -[PCCEndpoint runWithDelegate:](v7->_endpoint, "runWithDelegate:", v7);
  }

  return v7;
}

- (void)handleConnection:(BOOL)a3 from:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (v4)
  {
    ++self->up_count;
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( &dword_187E6F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "remote ProxyingDevice connected, initiating group xfer",  buf,  2u);
    }

    -[PCCProxiedDevice initiate:transferGroupWithOptions:job:]( self,  "initiate:transferGroupWithOptions:job:",  v6,  &unk_18A166BA0,  0LL);
  }

  else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl( &dword_187E6F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "remote ProxyingDevice disconnected",  v7,  2u);
  }
}

- (void)handleMessage:(id)a3 from:(id)a4
{
  v109[3] = *MEMORY[0x1895F89C0];
  id v6 = (__CFString *)a3;
  id v7 = a4;
  ++self->msg_count;
  -[__CFString objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", @"messageType");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v8 isEqualToString:@"initiateMetadataUpdate"])
  {
    v9 = v6;
    -[__CFString objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", @"jobId");
    dispatch_queue_t v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v109[0] = @"updateProxiedDeviceMetadata";
    v108[0] = @"messageType";
    v108[1] = @"deviceMetadata";
    [MEMORY[0x189611B08] sharedInstance];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = [v11 metadata];
    objc_super v13 = (void *)v12;
    v108[2] = @"jobId";
    v14 = @"<unknown-job>";
    if (v10) {
      v14 = v10;
    }
    v109[1] = v12;
    v109[2] = v14;
    [MEMORY[0x189603F68] dictionaryWithObjects:v109 forKeys:v108 count:3];
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v99 = @"initiateMetadataUpdate";
      __int16 v100 = 2112;
      v101 = v10;
      __int16 v102 = 2112;
      v103 = @"updateProxiedDeviceMetadata";
      _os_log_impl( &dword_187E6F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "received request %@ (%@); posting %@",
        buf,
        0x20u);
    }

    id v16 = -[PCCEndpoint send:message:error:](self->_endpoint, "send:message:error:", v7, v15, 0LL);

    id v6 = v9;
    goto LABEL_24;
  }

  if ([v8 isEqualToString:@"acceptTasking"])
  {
    -[__CFString objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", @"forRouting");
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[__CFString objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", @"withTaskingId");
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v19 = -[__CFString objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", @"settings");
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413314;
      v99 = @"acceptTasking";
      __int16 v100 = 2112;
      v101 = v17;
      __int16 v102 = 2112;
      v103 = v18;
      __int16 v104 = 2112;
      id v105 = (id)objc_opt_class();
      __int16 v106 = 2048;
      v107 = v19;
      id v20 = v105;
      _os_log_impl( &dword_187E6F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "received request %@-%@ '%@' payload %@ %p",  buf,  0x34u);
    }

    -[PCCProxiedDevice acceptTaskingPayload:forRouting:withId:]( self,  "acceptTaskingPayload:forRouting:withId:",  v19,  v17,  v18);

LABEL_23:
    goto LABEL_24;
  }

  if ([v8 isEqualToString:@"initiateLogTransfer"])
  {
    -[__CFString objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", @"jobId");
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v99 = @"initiateLogTransfer";
      __int16 v100 = 2112;
      v101 = v17;
      _os_log_impl(&dword_187E6F000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "received request %@ (%@)", buf, 0x16u);
    }

    -[__CFString objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", @"logFile");
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v18) {
      -[PCCProxiedDevice initiate:transferLog:withOptions:job:]( self,  "initiate:transferLog:withOptions:job:",  v7,  v18,  v6,  v17);
    }
    else {
      -[PCCProxiedDevice initiate:transferGroupWithOptions:job:]( self,  "initiate:transferGroupWithOptions:job:",  v7,  v6,  v17);
    }
    goto LABEL_23;
  }

  if ([v8 isEqualToString:@"initiateLogList"])
  {
    uint64_t v21 = -[__CFString objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", @"jobId");
    v22 = (void *)objc_opt_new();
    v73 = v6;
    v23 = -[__CFString objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", @"path");
    id v75 = v7;
    v71 = v23;
    if ([v23 length])
    {
      uint64_t v96 = *MEMORY[0x189611C20];
      v97 = v23;
      uint64_t v24 = [MEMORY[0x189603F68] dictionaryWithObjects:&v97 forKeys:&v96 count:1];
    }

    else
    {
      uint64_t v24 = 0LL;
    }

    v38 = (void *)MEMORY[0x189611AF0];
    v83[0] = MEMORY[0x1895F87A8];
    v83[1] = 3221225472LL;
    v83[2] = __39__PCCProxiedDevice_handleMessage_from___block_invoke;
    v83[3] = &unk_18A161458;
    id v39 = v22;
    id v84 = v39;
    v70 = (void *)v24;
    [v38 iterateLogsWithOptions:v24 usingBlock:v83];
    v40 = (void *)v21;
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      v41 = (void *)[v39 count];
      *(_DWORD *)buf = 138413058;
      v99 = @"initiateLogList";
      __int16 v100 = 2112;
      v101 = (__CFString *)v21;
      __int16 v102 = 2112;
      v103 = @"jobStatus";
      __int16 v104 = 2048;
      id v105 = v41;
      _os_log_impl( &dword_187E6F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "received request %@ (%@); posting %@ %lu logs",
        buf,
        0x2Au);
    }

    objc_msgSend(MEMORY[0x189603FA8], "arrayWithCapacity:", objc_msgSend(v39, "count"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    __int128 v79 = 0u;
    __int128 v80 = 0u;
    __int128 v81 = 0u;
    __int128 v82 = 0u;
    id v43 = v39;
    uint64_t v44 = [v43 countByEnumeratingWithState:&v79 objects:v95 count:16];
    if (v44)
    {
      uint64_t v45 = v44;
      uint64_t v46 = *(void *)v80;
      do
      {
        for (uint64_t i = 0LL; i != v45; ++i)
        {
          if (*(void *)v80 != v46) {
            objc_enumerationMutation(v43);
          }
          [*(id *)(*((void *)&v79 + 1) + 8 * i) path];
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          [v42 addObject:v48];
        }

        uint64_t v45 = [v43 countByEnumeratingWithState:&v79 objects:v95 count:16];
      }

      while (v45);
    }

    v93[0] = @"messageType";
    v93[1] = @"jobType";
    v94[0] = @"jobStatus";
    v94[1] = @"initiateLogList";
    v93[2] = @"jobId";
    v93[3] = @"content";
    v94[2] = v40;
    v94[3] = v42;
    [MEMORY[0x189603F68] dictionaryWithObjects:v94 forKeys:v93 count:4];
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    id v7 = v75;
    id v50 = -[PCCEndpoint send:message:error:](self->_endpoint, "send:message:error:", v75, v49, 0LL);

    id v6 = v73;
  }

  else if ([v8 isEqualToString:@"synchronize"])
  {
    v25 = -[__CFString objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", @"jobId");
    v74 = -[__CFString objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", @"options");
    [v74 objectForKeyedSubscript:@"status"];
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    int v27 = [v26 BOOLValue];

    v72 = v25;
    if (v27)
    {
      v91[0] = @"messageType";
      v91[1] = @"jobType";
      v92[0] = @"jobStatus";
      v92[1] = @"synchronize";
      v92[2] = v25;
      v91[2] = @"jobId";
      v91[3] = @"content";
      v89[0] = @"tracking";
      v69 = -[NSMutableDictionary allValues](self->_jobByTracker, "allValues");
      [v69 valueForKey:@"description"];
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v90[0] = v68;
      v89[1] = @"timeout";
      [MEMORY[0x189607968] numberWithDouble:self->_jobTimeout];
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v90[1] = v67;
      v89[2] = @"timer";
      [MEMORY[0x189607968] numberWithInt:self->_expiryTimer != 0];
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v90[2] = v66;
      v89[3] = @"transaction";
      [MEMORY[0x189607968] numberWithInt:self->_txn != 0];
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v90[3] = v65;
      v89[4] = @"files";
      [MEMORY[0x189607968] numberWithInt:self->file_count];
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v90[4] = v64;
      v89[5] = @"msgs";
      [MEMORY[0x189607968] numberWithInt:self->msg_count];
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v90[5] = v28;
      v89[6] = @"connections";
      [MEMORY[0x189607968] numberWithInt:self->up_count];
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v90[6] = v29;
      v89[7] = @"jobs";
      [MEMORY[0x189607968] numberWithInt:self->job_count];
      v30 = v6;
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v90[7] = v31;
      v89[8] = @"expirations";
      [MEMORY[0x189607968] numberWithInt:self->expire_count];
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v90[8] = v32;
      [MEMORY[0x189603F68] dictionaryWithObjects:v90 forKeys:v89 count:9];
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v92[3] = v33;
      [MEMORY[0x189603F68] dictionaryWithObjects:v92 forKeys:v91 count:4];
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      id v6 = v30;
      id v35 = -[PCCEndpoint send:message:error:](self->_endpoint, "send:message:error:", v7, v34, 0LL);

      v37 = v72;
      v36 = v74;
    }

    else
    {
      [v74 objectForKey:@"set-expire"];
      v51 = (void *)objc_claimAutoreleasedReturnValue();

      if (v51)
      {
        [v74 objectForKeyedSubscript:@"set-expire"];
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        int v53 = [v52 intValue];

        if (v53 <= 5) {
          int v54 = 5;
        }
        else {
          int v54 = v53;
        }
        self->_double jobTimeout = (double)v54;
        v87[0] = @"messageType";
        v87[1] = @"jobType";
        v88[0] = @"jobStatus";
        v88[1] = @"synchronize";
        v37 = v25;
        v88[2] = v25;
        v87[2] = @"jobId";
        v87[3] = @"content";
        objc_msgSend(NSString, "stringWithFormat:", @"jobTimeout set to %.0f secs", (double)v54);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v88[3] = v55;
        [MEMORY[0x189603F68] dictionaryWithObjects:v88 forKeys:v87 count:4];
        v56 = (void *)objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
        {
          double jobTimeout = self->_jobTimeout;
          *(_DWORD *)buf = 134217984;
          v99 = *(const __CFString **)&jobTimeout;
          _os_log_impl( &dword_187E6F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "jobTimeout set to %.0f secs",  buf,  0xCu);
        }

        id v58 = -[PCCEndpoint send:message:error:](self->_endpoint, "send:message:error:", v7, v56, 0LL);

        v36 = v74;
      }

      else
      {
        v36 = v74;
        [v74 objectForKeyedSubscript:@"test-expire"];
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        int v60 = [v59 BOOLValue];

        if (v60)
        {
          job_queue = (dispatch_queue_s *)self->_job_queue;
          block[0] = MEMORY[0x1895F87A8];
          block[1] = 3221225472LL;
          block[2] = __39__PCCProxiedDevice_handleMessage_from___block_invoke_82;
          block[3] = &unk_18A161480;
          block[4] = self;
          v37 = v25;
          id v77 = v25;
          id v78 = v7;
          dispatch_async(job_queue, block);
        }

        else
        {
          if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_187E6F000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "remote synchronization", buf, 2u);
          }

          v85[0] = @"messageType";
          v85[1] = @"jobType";
          v86[0] = @"jobStatus";
          v86[1] = @"synchronize";
          v85[2] = @"jobId";
          v85[3] = @"content";
          v37 = v25;
          v86[2] = v25;
          v86[3] = @"remote-Ok";
          [MEMORY[0x189603F68] dictionaryWithObjects:v86 forKeys:v85 count:4];
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          id v63 = -[PCCEndpoint send:message:error:](self->_endpoint, "send:message:error:", v7, v62, 0LL);
        }
      }
    }
  }

  else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v99 = v6;
    _os_log_impl(&dword_187E6F000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "Unknown message %@", buf, 0xCu);
  }

uint64_t __39__PCCProxiedDevice_handleMessage_from___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

void __39__PCCProxiedDevice_handleMessage_from___block_invoke_82(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    double v2 = *(double *)(*(void *)(a1 + 32) + 80LL) / 60.0;
    *(_DWORD *)buf = 134217984;
    double v11 = v2;
    _os_log_impl( &dword_187E6F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "starting bogus job; wait for expiration in %.1f mins",
      buf,
      0xCu);
  }

  v3 = -[PCCJob initWithID:forTarget:options:]( objc_alloc(&OBJC_CLASS___PCCJob),  "initWithID:forTarget:options:",  *(void *)(a1 + 40),  *(void *)(a1 + 48),  0LL);
  [*(id *)(*(void *)(a1 + 32) + 32) setObject:v3 forKeyedSubscript:@"<bogus-tracker>"];
  [*(id *)(a1 + 32) startTimer];
  objc_msgSend( *(id *)(*(void *)(a1 + 32) + 32),  "allValues",  @"messageType",  @"jobType",  @"jobId",  @"content",  @"jobStatus",  @"synchronize",  *(void *)(a1 + 40));
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 valueForKey:@"description"];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[3] = v5;
  [MEMORY[0x189603F68] dictionaryWithObjects:v9 forKeys:&v8 count:4];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  id v7 = (id)[*(id *)(*(void *)(a1 + 32) + 8) send:*(void *)(a1 + 48) message:v6 error:0];
}

- (void)handleFile:(id)a3 from:(id)a4 metadata:(id)a5
{
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
    -[PCCProxiedDevice handleFile:from:metadata:].cold.1();
  }
}

- (void)sendDeviceMetadata:(id)a3
{
  v12[2] = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v11[0] = @"messageType";
  v11[1] = @"deviceMetadata";
  v12[0] = @"updateProxiedDeviceMetadata";
  [MEMORY[0x189611B08] sharedInstance];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 metadata];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v6;
  [MEMORY[0x189603F68] dictionaryWithObjects:v12 forKeys:v11 count:2];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    dispatch_queue_t v10 = @"updateProxiedDeviceMetadata";
    _os_log_impl( &dword_187E6F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "posted %@ (unsolicited)",  (uint8_t *)&v9,  0xCu);
  }

  id v8 = -[PCCEndpoint send:message:error:](self->_endpoint, "send:message:error:", v4, v7, 0LL);
}

- (void)acceptTaskingPayload:(id)a3 forRouting:(id)a4 withId:(id)a5
{
  v19[2] = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([@"-1" isEqualToString:v9]) {
    goto LABEL_4;
  }
  if ([v8 isEqualToString:@"ca1"])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
LABEL_2:
      id v10 = v7;
      id v7 = v10;
LABEL_5:
      id v11 = (id)[MEMORY[0x189611B10] applyTasking:v8 taskId:v9 fromBlob:v10];
      goto LABEL_6;
    }

    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( &dword_187E6F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "unknown payload format for ca1 routing",  buf,  2u);
    }

- (void)ack:(id)a3 result:(BOOL)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v8)
  {
    job_queue = (dispatch_queue_s *)self->_job_queue;
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 3221225472LL;
    void v11[2] = __37__PCCProxiedDevice_ack_result_error___block_invoke;
    v11[3] = &unk_18A1614A8;
    v11[4] = self;
    id v12 = v8;
    BOOL v14 = a4;
    id v13 = v9;
    dispatch_async(job_queue, v11);
  }
}

void __37__PCCProxiedDevice_ack_result_error___block_invoke(uint64_t a1)
{
  double v2 = (void *)MEMORY[0x1895B84F4]();
  [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:*(void *)(a1 + 40)];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    [*(id *)(*(void *)(a1 + 32) + 32) removeObjectForKey:*(void *)(a1 + 40)];
    [v3 registerResult:*(unsigned __int8 *)(a1 + 56) error:*(void *)(a1 + 48)];
    [*(id *)(a1 + 32) doWork:v3];
  }

  objc_autoreleasePoolPop(v2);
}

- (void)initiate:(id)a3 transferGroupWithOptions:(id)a4 job:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = @"<unsolicited>";
  if (a5) {
    id v10 = (__CFString *)a5;
  }
  id v11 = v10;
  job_queue = (dispatch_queue_s *)self->_job_queue;
  v16[0] = MEMORY[0x1895F87A8];
  v16[1] = 3221225472LL;
  v16[2] = __58__PCCProxiedDevice_initiate_transferGroupWithOptions_job___block_invoke;
  v16[3] = &unk_18A1614D0;
  id v17 = v9;
  v18 = self;
  v19 = v11;
  id v20 = v8;
  id v13 = v8;
  BOOL v14 = v11;
  id v15 = v9;
  dispatch_async(job_queue, v16);
}

void __58__PCCProxiedDevice_initiate_transferGroupWithOptions_job___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  double v2 = (void *)MEMORY[0x1895B84F4]();
  [*(id *)(a1 + 32) objectForKeyedSubscript:@"allFiles"];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  int v4 = [v3 BOOLValue];

  if (*(void *)(*(void *)(a1 + 40) + 24LL))
  {
    [*(id *)(a1 + 32) objectForKeyedSubscript:@"event"];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    id v6 = *(void **)(a1 + 32);
    if (v5)
    {
      [v6 objectForKeyedSubscript:@"event"];
      id v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      [v6 objectForKeyedSubscript:@"jobEvent"];
      id v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        [*(id *)(a1 + 32) objectForKeyedSubscript:@"jobEvent"];
        id v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        id v7 = @"<unknown>";
      }
    }

    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = *(void *)(a1 + 48);
      [*(id *)(*(void *)(a1 + 40) + 24) jid];
      id v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      uint64_t v26 = v15;
      __int16 v27 = 2114;
      v28 = v16;
      _os_log_impl( &dword_187E6F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "declining job %{public}@; group transfer already in progress (%{public}@)",
        buf,
        0x16u);
    }

    id v17 = *(void **)(a1 + 40);
    uint64_t v18 = *(void *)(a1 + 48);
    uint64_t v19 = *(void *)(a1 + 56);
    if (v4) {
      id v20 = @"xfer-all";
    }
    else {
      id v20 = @"xfer-group";
    }
    uint64_t v21 = (void *)MEMORY[0x189607870];
    uint64_t v23 = *MEMORY[0x1896075E0];
    uint64_t v24 = @"group transfer already in progress";
    [MEMORY[0x189603F68] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    BOOL v14 = (PCCGroupJob *)objc_claimAutoreleasedReturnValue();
    [v21 errorWithDomain:@"ProxyGizmoLogTransferErrorDomain" code:5 userInfo:v14];
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 finish:v18 target:v19 event:v7 type:v20 result:v22];
  }

  else
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      id v8 = @"standard";
      uint64_t v9 = *(void *)(a1 + 48);
      if (v4) {
        id v8 = @"all";
      }
      *(_DWORD *)buf = 138543618;
      uint64_t v26 = v9;
      __int16 v27 = 2112;
      v28 = v8;
      _os_log_impl( &dword_187E6F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "starting job %{public}@, transfer group '%@'",  buf,  0x16u);
    }

    ++*(_DWORD *)(*(void *)(a1 + 40) + 68LL);
    id v7 = (__CFString *)*(id *)(a1 + 32);
    if (*(_BYTE *)(*(void *)(a1 + 40) + 76LL))
    {
      id v10 = *(void **)(a1 + 32);
      if (v10) {
        id v11 = (__CFString *)[v10 mutableCopy];
      }
      else {
        id v11 = (__CFString *)objc_opt_new();
      }
      id v13 = v11;
      -[__CFString setObject:forKeyedSubscript:]( v11,  "setObject:forKeyedSubscript:",  MEMORY[0x189604A88],  @"<preserve>");

      id v7 = v13;
    }

    BOOL v14 = -[PCCGroupJob initWithID:forTarget:options:]( objc_alloc(&OBJC_CLASS___PCCGroupJob),  "initWithID:forTarget:options:",  *(void *)(a1 + 48),  *(void *)(a1 + 56),  v7);
    if ([*(id *)(a1 + 40) doWork:v14])
    {
      objc_storeStrong((id *)(*(void *)(a1 + 40) + 24LL), v14);
      [*(id *)(a1 + 40) startTimer];
    }
  }

  objc_autoreleasePoolPop(v2);
}

- (void)initiate:(id)a3 transferLog:(id)a4 withOptions:(id)a5 job:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = @"<unsolicited>";
  if (a6) {
    id v13 = (__CFString *)a6;
  }
  BOOL v14 = v13;
  job_queue = (dispatch_queue_s *)self->_job_queue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __57__PCCProxiedDevice_initiate_transferLog_withOptions_job___block_invoke;
  block[3] = &unk_18A1614F8;
  block[4] = self;
  id v21 = v12;
  v22 = v14;
  id v23 = v10;
  id v24 = v11;
  id v16 = v11;
  id v17 = v10;
  uint64_t v18 = v14;
  id v19 = v12;
  dispatch_async(job_queue, block);
}

void __57__PCCProxiedDevice_initiate_transferLog_withOptions_job___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  double v2 = (void *)MEMORY[0x1895B84F4]();
  ++*(_DWORD *)(*(void *)(a1 + 32) + 68LL);
  id v3 = *(id *)(a1 + 40);
  if (*(_BYTE *)(*(void *)(a1 + 32) + 76LL))
  {
    int v4 = *(void **)(a1 + 40);
    if (v4) {
      id v5 = (void *)[v4 mutableCopy];
    }
    else {
      id v5 = (void *)objc_opt_new();
    }
    id v6 = v5;
    [v5 setObject:MEMORY[0x189604A88] forKeyedSubscript:@"<preserve>"];

    id v3 = v6;
  }

  id v7 = -[PCCJob initWithID:forTarget:options:forFile:]( objc_alloc(&OBJC_CLASS___PCCJob),  "initWithID:forTarget:options:forFile:",  *(void *)(a1 + 48),  *(void *)(a1 + 56),  v3,  *(void *)(a1 + 64));
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 48);
    -[PCCJob type](v7, "type");
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = *(void *)(a1 + 64);
    int v11 = 138543874;
    uint64_t v12 = v8;
    __int16 v13 = 2114;
    BOOL v14 = v9;
    __int16 v15 = 2114;
    uint64_t v16 = v10;
    _os_log_impl( &dword_187E6F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "starting job %{public}@, %{public}@ '%{public}@'",  (uint8_t *)&v11,  0x20u);
  }

  objc_autoreleasePoolPop(v2);
}

- (BOOL)doWork:(id)a3
{
  v37[1] = *MEMORY[0x1895F89C0];
  int v4 = (PCCGroupJob *)a3;
  -[PCCJob nextFilepath](v4, "nextFilepath");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    ++self->file_count;
    -[PCCJob options](v4, "options");
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 objectForKeyedSubscript:@"allFiles"];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    else {
      uint64_t v8 = 0LL;
    }
    -[PCCEndpoint setFileTimeout:](self->_endpoint, "setFileTimeout:", v8);

    endpoint = self->_endpoint;
    -[PCCJob target](v4, "target");
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    int v11 = (void *)MEMORY[0x189604030];
    -[PCCJob nextFilepath](v4, "nextFilepath");
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 fileURLWithPath:v12];
    __int16 v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PCCJob metadata](v4, "metadata");
    BOOL v14 = (void *)objc_claimAutoreleasedReturnValue();
    id v31 = 0LL;
    -[PCCEndpoint send:file:metadata:error:](endpoint, "send:file:metadata:error:", v10, v13, v14, &v31);
    __int16 v15 = (void *)objc_claimAutoreleasedReturnValue();
    id v16 = v31;

    if (v15)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_jobByTracker, "setObject:forKeyedSubscript:", v4, v15);
      uint64_t v17 = v4;
    }

    else
    {
      if (!v16)
      {
        id v23 = (void *)MEMORY[0x189607870];
        uint64_t v36 = *MEMORY[0x1896075E0];
        v37[0] = @"no send tracking id";
        [MEMORY[0x189603F68] dictionaryWithObjects:v37 forKeys:&v36 count:1];
        id v24 = (void *)objc_claimAutoreleasedReturnValue();
        [v23 errorWithDomain:@"ProxyGizmoLogTransferErrorDomain" code:4 userInfo:v24];
        id v16 = (id)objc_claimAutoreleasedReturnValue();
      }

      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
      {
        v25 = -[PCCJob jid](v4, "jid");
        *(_DWORD *)buf = 138412546;
        v33 = v25;
        __int16 v34 = 2112;
        id v35 = v16;
        _os_log_impl( &dword_187E6F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "aborting job %@; file send failure: %@",
          buf,
          0x16u);
      }

      -[PCCJob jid](v4, "jid");
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[PCCJob target](v4, "target");
      __int16 v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = -[PCCJob event](v4, "event");
      -[PCCGroupJob type](v4, "type");
      uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[PCCProxiedDevice finish:target:event:type:result:]( self,  "finish:target:event:type:result:",  v26,  v27,  v28,  v29,  v16);

      if (self->_groupXferJob == v4)
      {
        self->_groupXferJob = 0LL;
      }

      uint64_t v17 = 0LL;
    }
  }

  else
  {
    -[PCCJob jid](v4, "jid");
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PCCJob target](v4, "target");
    id v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PCCJob event](v4, "event");
    id v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PCCGroupJob type](v4, "type");
    id v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[PCCGroupJob result](v4, "result");
    -[PCCProxiedDevice finish:target:event:type:result:]( self,  "finish:target:event:type:result:",  v18,  v19,  v20,  v21,  v22);

    if (self->_groupXferJob == v4)
    {
      self->_groupXferJob = 0LL;
    }

    uint64_t v17 = 0LL;
  }

  return v17 != 0LL;
}

- (void)finish:(id)a3 target:(id)a4 event:(id)a5 type:(id)a6 result:(id)a7
{
  v35[4] = *MEMORY[0x1895F89C0];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = (__CFString *)a7;
  if (v16)
  {
    v34[0] = @"messageType";
    v34[1] = @"jobId";
    v35[0] = @"jobStatus";
    v35[1] = v12;
    v34[2] = @"jobEvent";
    v34[3] = @"jobType";
    v35[2] = v14;
    v35[3] = v15;
    [MEMORY[0x189603F68] dictionaryWithObjects:v35 forKeys:v34 count:4];
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v18 = (void *)[v17 mutableCopy];

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      id v19 = v16;
      -[__CFString domain](v19, "domain");
      id v20 = (void *)objc_claimAutoreleasedReturnValue();
      [v18 setObject:v20 forKeyedSubscript:@"error_domain"];

      objc_msgSend(MEMORY[0x189607968], "numberWithInteger:", -[__CFString code](v19, "code"));
      id v21 = (void *)objc_claimAutoreleasedReturnValue();
      [v18 setObject:v21 forKeyedSubscript:@"error_code"];
      v22 = -[__CFString userInfo](v19, "userInfo");
      [v18 setObject:v22 forKeyedSubscript:@"error_info"];
    }

    else
    {
      [v18 setObject:v16 forKeyedSubscript:@"content"];
    }

    id v23 = -[PCCEndpoint send:message:error:](self->_endpoint, "send:message:error:", v13, v18, 0LL);
  }

  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    v25 = @"Ok";
    if ((isKindOfClass & 1) != 0) {
      v25 = v16;
    }
    int v30 = 138412546;
    id v31 = v12;
    __int16 v32 = 2112;
    v33 = v25;
    _os_log_impl( &dword_187E6F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "completed job %@: %@",  (uint8_t *)&v30,  0x16u);
  }

  if (!-[NSMutableDictionary count](self->_jobByTracker, "count"))
  {
    expiryTimer = self->_expiryTimer;
    BOOL v27 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT);
    if (expiryTimer)
    {
      if (v27)
      {
        LOWORD(v30) = 0;
        _os_log_impl( &dword_187E6F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "no outstanding jobs; releasing transaction",
          (uint8_t *)&v30,
          2u);
      }

      dispatch_source_cancel((dispatch_source_t)self->_expiryTimer);
      v28 = self->_expiryTimer;
      self->_expiryTimer = 0LL;

      txn = self->_txn;
      self->_txn = 0LL;
    }

    else if (v27)
    {
      LOWORD(v30) = 0;
      _os_log_impl( &dword_187E6F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "no outstanding jobs (and no transactions were in play)",  (uint8_t *)&v30,  2u);
    }
  }
}

- (void)startTimer
{
  job_queue = (dispatch_queue_s *)self->_job_queue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __30__PCCProxiedDevice_startTimer__block_invoke;
  block[3] = &unk_18A161520;
  block[4] = self;
  dispatch_async(job_queue, block);
}

void __30__PCCProxiedDevice_startTimer__block_invoke(uint64_t a1)
{
  double v2 = (void *)MEMORY[0x1895B84F4]();
  uint64_t v3 = *(void *)(a1 + 32);
  if (!*(void *)(v3 + 40))
  {
    dispatch_source_t v4 = dispatch_source_create(MEMORY[0x1895F8B78], 0LL, 0LL, *(dispatch_queue_t *)(v3 + 16));
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(dispatch_source_s **)(v7 + 40);
    dispatch_time_t v9 = dispatch_walltime(0LL, (uint64_t)(*(double *)(v7 + 80) * 1000000000.0));
    dispatch_source_set_timer(v8, v9, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
    uint64_t v10 = *(void *)(a1 + 32);
    int v11 = *(dispatch_source_s **)(v10 + 40);
    handler[0] = MEMORY[0x1895F87A8];
    handler[1] = 3221225472LL;
    handler[2] = __30__PCCProxiedDevice_startTimer__block_invoke_2;
    handler[3] = &unk_18A161520;
    handler[4] = v10;
    dispatch_source_set_event_handler(v11, handler);
    dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 40LL));
    if (*(void *)(*(void *)(a1 + 32) + 48LL))
    {
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v17 = 0;
        id v12 = (os_log_s *)MEMORY[0x1895F8DA0];
        id v13 = "re-starting job timer and extending transaction";
LABEL_7:
        _os_log_impl(&dword_187E6F000, v12, OS_LOG_TYPE_DEFAULT, v13, v17, 2u);
      }
    }

    else
    {
      uint64_t v14 = os_transaction_create();
      uint64_t v15 = *(void *)(a1 + 32);
      id v16 = *(void **)(v15 + 48);
      *(void *)(v15 + 48) = v14;

      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v17 = 0;
        id v12 = (os_log_s *)MEMORY[0x1895F8DA0];
        id v13 = "starting job timer and creating transaction";
        goto LABEL_7;
      }
    }
  }

  objc_autoreleasePoolPop(v2);
}

void __30__PCCProxiedDevice_startTimer__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v39 = *MEMORY[0x1895F89C0];
  dispatch_source_cancel(*(dispatch_source_t *)(*(void *)(a1 + 32) + 40LL));
  uint64_t v2 = *(void *)(v1 + 32);
  uint64_t v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0LL;

  v28 = (void *)objc_opt_new();
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  id obj = *(id *)(*(void *)(v1 + 32) + 32LL);
  uint64_t v4 = [obj countByEnumeratingWithState:&v32 objects:v38 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v33;
    uint64_t v26 = v1;
    uint64_t v27 = *MEMORY[0x1896075E0];
    do
    {
      for (uint64_t i = 0LL; i != v5; ++i)
      {
        if (*(void *)v33 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v32 + 1) + 8 * i);
        [*(id *)(*(void *)(v1 + 32) + 32) objectForKeyedSubscript:v8];
        dispatch_time_t v9 = (void *)objc_claimAutoreleasedReturnValue();
        [v9 lastTouch];
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
        [v10 timeIntervalSinceNow];
        double v12 = fabs(v11);
        double v13 = *(double *)(*(void *)(v1 + 32) + 80LL);

        if (v12 > v13)
        {
          ++*(_DWORD *)(*(void *)(v1 + 32) + 72LL);
          [v28 addObject:v8];
          int v30 = *(void **)(v1 + 32);
          [v9 jid];
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
          [v9 target];
          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
          [v9 event];
          id v16 = (void *)objc_claimAutoreleasedReturnValue();
          [v9 type];
          uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v18 = v6;
          id v19 = (void *)MEMORY[0x189607870];
          uint64_t v36 = v27;
          v37 = @"job expired due to lack of progress";
          [MEMORY[0x189603F68] dictionaryWithObjects:&v37 forKeys:&v36 count:1];
          uint64_t v20 = v5;
          id v21 = (void *)objc_claimAutoreleasedReturnValue();
          [v19 errorWithDomain:@"ProxyGizmoLogTransferErrorDomain" code:5 userInfo:v21];
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          [v30 finish:v14 target:v15 event:v16 type:v17 result:v22];

          uint64_t v6 = v18;
          uint64_t v1 = v26;

          uint64_t v5 = v20;
          uint64_t v23 = *(void *)(v26 + 32);
          if (v9 == *(void **)(v23 + 24))
          {
            *(void *)(v23 + 24) = 0LL;
          }
        }
      }

      uint64_t v5 = [obj countByEnumeratingWithState:&v32 objects:v38 count:16];
    }

    while (v5);
  }

  [*(id *)(*(void *)(v1 + 32) + 32) removeObjectsForKeys:v28];
  if ([*(id *)(*(void *)(v1 + 32) + 32) count])
  {
    [*(id *)(v1 + 32) startTimer];
  }

  else
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( &dword_187E6F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "job expiration event; releasing transaction",
        buf,
        2u);
    }

    uint64_t v24 = *(void *)(v1 + 32);
    v25 = *(void **)(v24 + 48);
    *(void *)(v24 + 48) = 0LL;
  }
}

- (double)jobTimeout
{
  return self->_jobTimeout;
}

- (void)setJobTimeout:(double)a3
{
  self->_double jobTimeout = a3;
}

- (BOOL)preserveFiles
{
  return self->_preserveFiles;
}

- (void)setPreserveFiles:(BOOL)a3
{
  self->_preserveFiles = a3;
}

- (void).cxx_destruct
{
}

- (void)handleFile:from:metadata:.cold.1()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl( &dword_187E6F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "PCCProxiedDevice unexpectedly asked to handle a file. This is a no-op",  v0,  2u);
}

@end