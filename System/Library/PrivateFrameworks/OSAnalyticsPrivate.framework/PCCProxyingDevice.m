@interface PCCProxyingDevice
- (BOOL)isFilenameReasonable:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (PCCProxyingDevice)initWithEndpoint:(id)a3;
- (double)requestTimeout;
- (void)ack:(id)a3 result:(BOOL)a4 error:(id)a5;
- (void)addRequest:(id)a3 event:(id)a4 type:(id)a5 onComplete:(id)a6;
- (void)deliver:(id)a3 tasking:(id)a4 taskId:(id)a5 fromBlob:(id)a6;
- (void)diagnosticResultsEvent:(id)a3 type:(id)a4 result:(id)a5;
- (void)finishRequest:(id)a3 result:(id)a4;
- (void)finishRequestWithMessage:(id)a3 result:(id)a4;
- (void)handleConnection:(BOOL)a3 from:(id)a4;
- (void)handleFile:(id)a3 from:(id)a4 metadata:(id)a5;
- (void)handleMessage:(id)a3 from:(id)a4;
- (void)listDevices:(id)a3;
- (void)request:(id)a3 logList:(id)a4;
- (void)request:(id)a3 logListWithOptions:(id)a4 onComplete:(id)a5;
- (void)request:(id)a3 transferGroupWithOptions:(id)a4 onComplete:(id)a5;
- (void)request:(id)a3 transferLog:(id)a4 onComplete:(id)a5;
- (void)request:(id)a3 transferLog:(id)a4 withOptions:(id)a5 onComplete:(id)a6;
- (void)requestProxyMetadata:(id)a3 onComplete:(id)a4;
- (void)setRequestTimeout:(double)a3;
- (void)startRequest:(id)a3 message:(id)a4 onComplete:(id)a5;
- (void)startTimer;
- (void)summarizeLog:(id)a3 reason:(id)a4;
- (void)synchronize:(id)a3 withOptions:(id)a4 onComplete:(id)a5;
- (void)updateProxiedDeviceMetadata:(id)a3 from:(id)a4;
@end

@implementation PCCProxyingDevice

- (PCCProxyingDevice)initWithEndpoint:(id)a3
{
  id v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___PCCProxyingDevice;
  v6 = -[PCCProxyingDevice init](&v21, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_requestTimeout = 1200.0;
    uint64_t v8 = objc_opt_new();
    reqById = v7->_reqById;
    v7->_reqById = (NSMutableDictionary *)v8;

    uint64_t v10 = objc_opt_new();
    reqByTracker = v7->_reqByTracker;
    v7->_reqByTracker = (NSMutableDictionary *)v10;

    dispatch_queue_t v12 = dispatch_queue_create("com.apple.ProxiedCrashCopier.request_queue", 0LL);
    request_queue = v7->_request_queue;
    v7->_request_queue = (OS_dispatch_queue *)v12;

    dispatch_queue_t v14 = dispatch_queue_create("com.apple.OSASyncProxy.conn_queue", 0LL);
    sync_proxy_queue = v7->_sync_proxy_queue;
    v7->_sync_proxy_queue = (OS_dispatch_queue *)v14;

    objc_storeStrong((id *)&v7->_endpoint, a3);
    -[PCCEndpoint runWithDelegate:](v7->_endpoint, "runWithDelegate:", v7);
    uint64_t v16 = objc_opt_new();
    sync_summary = v7->_sync_summary;
    v7->_sync_summary = (NSMutableDictionary *)v16;

    uint64_t v18 = objc_opt_new();
    tasking_summary = v7->_tasking_summary;
    v7->_tasking_summary = (NSMutableDictionary *)v18;
  }

  return v7;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = (void *)MEMORY[0x189607B48];
  id v6 = a4;
  [v5 interfaceWithProtocol:&unk_18C6FC7A0];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setExportedInterface:v7];

  [v6 setExportedObject:self];
  [v6 _setQueue:self->_sync_proxy_queue];
  [v6 resume];

  return 1;
}

- (void)listDevices:(id)a3
{
  endpoint = self->_endpoint;
  id v5 = a3;
  -[PCCEndpoint deviceIds](endpoint, "deviceIds");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id, void))a3 + 2))(v5, v6, 0LL);
}

- (void)synchronize:(id)a3 withOptions:(id)a4 onComplete:(id)a5
{
  uint64_t v50 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, void *, void))a5;
  v11 = -[PCCEndpoint synchronize:withOptions:](self->_endpoint, "synchronize:withOptions:", v8, v9);
  [v9 objectForKeyedSubscript:@"remote"];
  dispatch_queue_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  int v13 = [v12 BOOLValue];

  if (v13)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      double v49 = *(double *)&v9;
      _os_log_impl( &dword_187E6F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "requesting remote synchronization with options: %@",  buf,  0xCu);
    }

    v46[0] = @"messageType";
    v46[1] = @"options";
    v47[0] = @"synchronize";
    v47[1] = v9;
    [MEMORY[0x189603F68] dictionaryWithObjects:v47 forKeys:v46 count:2];
    dispatch_queue_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PCCProxyingDevice startRequest:message:onComplete:](self, "startRequest:message:onComplete:", v8, v14, v10);
LABEL_17:

    goto LABEL_18;
  }

  [v9 objectForKeyedSubscript:@"status"];
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  int v16 = [v15 BOOLValue];

  if (v16)
  {
    v44[0] = @"requesting";
    v40 = -[NSMutableDictionary allValues](self->_reqById, "allValues");
    [v40 valueForKey:@"description"];
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v45[0] = v39;
    v44[1] = @"tracking";
    v38 = -[NSMutableDictionary allKeys](self->_reqByTracker, "allKeys");
    v45[1] = v38;
    v44[2] = @"timeout";
    [MEMORY[0x189607968] numberWithDouble:self->_requestTimeout];
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v45[2] = v37;
    v44[3] = @"timer";
    [MEMORY[0x189607968] numberWithInt:self->_expiryTimer != 0];
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v45[3] = v36;
    v44[4] = @"transaction";
    [MEMORY[0x189607968] numberWithInt:self->_txn != 0];
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v45[4] = v35;
    v44[5] = @"files";
    [MEMORY[0x189607968] numberWithInt:self->file_count];
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v45[5] = v17;
    v44[6] = @"msgs";
    [MEMORY[0x189607968] numberWithInt:self->msg_count];
    uint64_t v18 = v11;
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v45[6] = v19;
    v44[7] = @"connections";
    [MEMORY[0x189607968] numberWithInt:self->up_count];
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v45[7] = v20;
    v44[8] = @"requests";
    [MEMORY[0x189607968] numberWithInt:self->request_count];
    objc_super v21 = (void *)objc_claimAutoreleasedReturnValue();
    v45[8] = v21;
    v44[9] = @"expirations";
    [MEMORY[0x189607968] numberWithInt:self->expire_count];
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v45[9] = v22;
    [MEMORY[0x189603F68] dictionaryWithObjects:v45 forKeys:v44 count:10];
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *, void *))v10)[2](v10, v23, v18);

    v11 = v18;
    v24 = v40;
LABEL_7:

    goto LABEL_18;
  }

  [v9 objectForKey:@"set-expire"];
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    [v9 objectForKeyedSubscript:@"set-expire"];
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    int v27 = [v26 intValue];

    if (v27 <= 5) {
      int v28 = 5;
    }
    else {
      int v28 = v27;
    }
    self->_double requestTimeout = (double)v28;
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      double requestTimeout = self->_requestTimeout;
      *(_DWORD *)buf = 134217984;
      double v49 = requestTimeout;
      _os_log_impl( &dword_187E6F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "requestTimeout set to %.0f secs",  buf,  0xCu);
    }

    objc_msgSend( NSString,  "stringWithFormat:",  @"requestTimeout set to %.0f secs",  *(void *)&self->_requestTimeout);
    dispatch_queue_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *, void *))v10)[2](v10, v14, v11);
    goto LABEL_17;
  }

  [v9 objectForKeyedSubscript:@"test-expire"];
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  int v31 = [v30 BOOLValue];

  BOOL v32 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT);
  if (v31)
  {
    if (v32)
    {
      double v33 = self->_requestTimeout / 60.0;
      *(_DWORD *)buf = 134217984;
      double v49 = v33;
      _os_log_impl( &dword_187E6F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "starting bogus request; wait for expiration in %.1f mins",
        buf,
        0xCu);
    }

    -[PCCProxyingDevice startRequest:message:onComplete:]( self,  "startRequest:message:onComplete:",  v8,  &unk_18A166BC8,  0LL);
    request_queue = (dispatch_queue_s *)self->_request_queue;
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __56__PCCProxyingDevice_synchronize_withOptions_onComplete___block_invoke;
    block[3] = &unk_18A161548;
    v43 = v10;
    block[4] = self;
    id v42 = v11;
    dispatch_async(request_queue, block);

    v24 = v43;
    goto LABEL_7;
  }

  if (v32)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_187E6F000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "local synchronization", buf, 2u);
  }

  ((void (**)(id, void *, void *))v10)[2](v10, @"local-Ok", v11);
LABEL_18:
}

void __56__PCCProxyingDevice_synchronize_withOptions_onComplete___block_invoke(void *a1)
{
  uint64_t v2 = a1[6];
  [*(id *)(a1[4] + 32) allValues];
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 valueForKey:@"description"];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, void))(v2 + 16))(v2, v3, a1[5]);
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
      __int16 v11 = 0;
      v7 = (os_log_s *)MEMORY[0x1895F8DA0];
      id v8 = "remote ProxiedDevice connected";
      id v9 = (uint8_t *)&v11;
LABEL_6:
      _os_log_impl(&dword_187E6F000, v7, OS_LOG_TYPE_DEFAULT, v8, v9, 2u);
    }
  }

  else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    __int16 v10 = 0;
    v7 = (os_log_s *)MEMORY[0x1895F8DA0];
    id v8 = "remote ProxiedDevice disconnected";
    id v9 = (uint8_t *)&v10;
    goto LABEL_6;
  }
}

- (void)handleMessage:(id)a3 from:(id)a4
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  ++self->msg_count;
  [v6 objectForKeyedSubscript:@"messageType"];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v8 isEqualToString:@"updateProxiedDeviceMetadata"])
  {
    [v6 objectForKeyedSubscript:@"deviceMetadata"];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v9;
      _os_log_impl( &dword_187E6F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_INFO,  "updateProxiedDeviceMetadata:\n%@",  buf,  0xCu);
    }

    if (!v9) {
      -[PCCProxyingDevice handleMessage:from:].cold.1();
    }
    -[PCCProxyingDevice updateProxiedDeviceMetadata:from:](self, "updateProxiedDeviceMetadata:from:", v9, v7);
    -[PCCProxyingDevice finishRequestWithMessage:result:](self, "finishRequestWithMessage:result:", v6, v9);
  }

  else if ([v8 isEqualToString:@"jobStatus"])
  {
    [v6 objectForKeyedSubscript:@"error_domain"];
    __int16 v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10) {
      goto LABEL_12;
    }
    __int16 v11 = (void *)MEMORY[0x189607870];
    [v6 objectForKeyedSubscript:@"error_code"];
    dispatch_queue_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = (int)[v12 intValue];
    objc_msgSend(v6, "objectForKeyedSubscript:", @"error_info", *MEMORY[0x1896075E0]);
    dispatch_queue_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v14;
    [MEMORY[0x189603F68] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 errorWithDomain:v10 code:v13 userInfo:v15];
    int v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = v17;
    }

    else
    {
LABEL_12:
      [v6 objectForKeyedSubscript:@"content"];
      id v17 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v18 = 0LL;
    }

    -[PCCProxyingDevice finishRequestWithMessage:result:](self, "finishRequestWithMessage:result:", v6, v17);
  }

  else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v22 = v6;
    _os_log_impl(&dword_187E6F000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "Unknown message %@", buf, 0xCu);
  }
}

- (void)summarizeLog:(id)a3 reason:(id)a4
{
  id v10 = a4;
  sync_summary = self->_sync_summary;
  id v7 = (__CFString *)a3;
  -[NSMutableDictionary objectForKeyedSubscript:](sync_summary, "objectForKeyedSubscript:", v10);
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    id v8 = (void *)objc_opt_new();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_sync_summary, "setObject:forKeyedSubscript:", v8, v10);
  }

  if (-[__CFString length](v7, "length")) {
    id v9 = v7;
  }
  else {
    id v9 = @"unknown";
  }
  [v8 _accumulateKey:v9 value:1];
}

- (BOOL)isFilenameReasonable:(id)a3
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  [v3 stringByStandardizingPath];
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 pathComponents];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v6 = [v5 count];
  if (v6 != 1 && os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    id v9 = v3;
    _os_log_impl( &dword_187E6F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "FAILED untrusted filename validation '%{public}@'",  (uint8_t *)&v8,  0xCu);
  }

  return v6 == 1;
}

- (void)handleFile:(id)a3 from:(id)a4 metadata:(id)a5
{
  v122[1] = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v92 = a4;
  id v9 = a5;
  ++self->file_count;
  id v10 = objc_alloc(MEMORY[0x189611AF0]);
  v94 = v8;
  [v8 path];
  __int16 v11 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189611B08] sharedInstance];
  dispatch_queue_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = (void *)[v10 initWithPath:v11 forRouting:@"<sync>" usingConfig:v12 options:&unk_18A166BF0 error:0];

  [v13 closeFileStream];
  v93 = v13;
  [v13 bugType];
  dispatch_queue_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  id v96 = v9;
  [MEMORY[0x189611B08] sharedInstance];
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (([v15 optInApple] & 1) != 0
    || ([v9 objectForKeyedSubscript:@"device_class"],
        (uint64_t v16 = objc_claimAutoreleasedReturnValue()) == 0))
  {

LABEL_7:
    goto LABEL_8;
  }

  id v17 = (void *)v16;
  [v9 objectForKeyedSubscript:@"device_class"];
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  int v19 = [v18 intValue];

  id v9 = v96;
  if (v19 != 7)
  {
    v20 = (void *)MEMORY[0x189607870];
    uint64_t v104 = *MEMORY[0x1896075E0];
    v105 = @"failed opt-out";
    [MEMORY[0x189603F68] dictionaryWithObjects:&v105 forKeys:&v104 count:1];
    objc_super v21 = (void *)objc_claimAutoreleasedReturnValue();
    [v20 errorWithDomain:@"ProxyCompanionLogTransferErrorDomain" code:6 userInfo:v21];
    id v22 = (id)objc_claimAutoreleasedReturnValue();

    -[PCCProxyingDevice summarizeLog:reason:](self, "summarizeLog:reason:", @"211", @"failed-opt-out");
    v95 = 0LL;
    goto LABEL_50;
  }

- (void)ack:(id)a3 result:(BOOL)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  request_queue = (dispatch_queue_s *)self->_request_queue;
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __38__PCCProxyingDevice_ack_result_error___block_invoke;
  v13[3] = &unk_18A1614A8;
  v13[4] = self;
  id v14 = v8;
  BOOL v16 = a4;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(request_queue, v13);
}

void __38__PCCProxyingDevice_ack_result_error___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  uint64_t v2 = (void *)MEMORY[0x1895B84F4]();
  [*(id *)(*(void *)(a1 + 32) + 40) objectForKeyedSubscript:*(void *)(a1 + 40)];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    if (*(_BYTE *)(a1 + 56))
    {
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
      {
        [v3 type];
        BOOL v4 = (void *)objc_claimAutoreleasedReturnValue();
        [v3 jid];
        id v5 = (void *)objc_claimAutoreleasedReturnValue();
        int v6 = 138412546;
        id v7 = v4;
        __int16 v8 = 2112;
        id v9 = v5;
        _os_log_impl( &dword_187E6F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "request %@ (%@) acknowledged",  (uint8_t *)&v6,  0x16u);
      }
    }

    else
    {
      [*(id *)(a1 + 32) finishRequest:v3 result:*(void *)(a1 + 48)];
    }

    [*(id *)(*(void *)(a1 + 32) + 40) removeObjectForKey:*(void *)(a1 + 40)];
  }

  objc_autoreleasePoolPop(v2);
}

- (void)updateProxiedDeviceMetadata:(id)a3 from:(id)a4
{
  v62[1] = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  [v6 objectForKeyedSubscript:@"crashreporter_key"];
  __int16 v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v43 = self;
  if (-[PCCProxyingDevice isFilenameReasonable:](self, "isFilenameReasonable:", v8))
  {
    id v9 = (void *)MEMORY[0x189611B08];
    [MEMORY[0x189611B08] sharedInstance];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 pathSubmission];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    else {
      id v12 = v8;
    }
    [@"ProxiedDevice-" stringByAppendingString:v12];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v61 = *MEMORY[0x189611C38];
    v62[0] = MEMORY[0x189604A88];
    [MEMORY[0x189603F68] dictionaryWithObjects:v62 forKeys:&v61 count:1];
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 ensureUsablePath:v11 component:v13 options:v14];
    id v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      [v15 stringByAppendingPathComponent:@"deviceMetadata.proxy"];
      BOOL v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v55 = v16;
        _os_log_impl(&dword_187E6F000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO, "writing: %@", buf, 0xCu);
      }

      id v17 = (void *)[v6 mutableCopy];
      uint64_t v18 = (void *)MEMORY[0x189607968];
      [MEMORY[0x189603F50] date];
      int v19 = (void *)objc_claimAutoreleasedReturnValue();
      [v19 timeIntervalSince1970];
      objc_msgSend(v18, "numberWithDouble:");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      [v17 setObject:v20 forKeyedSubscript:@"proxyingDeviceTimeAtLastUpdate"];

      if (([v17 writeToFile:v16 atomically:1] & 1) == 0
        && os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v55 = v16;
        _os_log_impl( &dword_187E6F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "FAILED to write metadata update: %@",  buf,  0xCu);
      }

      if ((OSAIsRSDHost() & 1) == 0)
      {
        v38 = v17;
        v39 = v16;
        uint64_t v40 = v8;
        [MEMORY[0x1896078A8] defaultManager];
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        [v6 objectForKeyedSubscript:@"currentTaskingIDByRouting"];
        objc_super v21 = (void *)objc_claimAutoreleasedReturnValue();
        [v21 allKeys];
        id v22 = (void *)objc_claimAutoreleasedReturnValue();

        __int128 v50 = 0u;
        __int128 v51 = 0u;
        __int128 v48 = 0u;
        __int128 v49 = 0u;
        id obj = v22;
        uint64_t v23 = [obj countByEnumeratingWithState:&v48 objects:v60 count:16];
        if (v23)
        {
          uint64_t v24 = v23;
          uint64_t v45 = *(void *)v49;
          id v41 = v6;
          id v42 = v15;
          do
          {
            for (uint64_t i = 0LL; i != v24; ++i)
            {
              if (*(void *)v49 != v45) {
                objc_enumerationMutation(obj);
              }
              uint64_t v26 = *(void **)(*((void *)&v48 + 1) + 8 * i);
              [v6 objectForKeyedSubscript:@"currentTaskingIDByRouting"];
              int v27 = (void *)objc_claimAutoreleasedReturnValue();
              [v27 objectForKeyedSubscript:v26];
              int v28 = (void *)objc_claimAutoreleasedReturnValue();

              [v15 stringByAppendingPathComponent:@"tasking"];
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              [v29 stringByAppendingPathExtension:v26];
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              [v30 stringByAppendingPathExtension:@"proxy"];
              int v31 = (void *)objc_claimAutoreleasedReturnValue();

              char v47 = 0;
              else {
                BOOL v32 = 0;
              }
              if (v32)
              {
                [MEMORY[0x189603F68] dictionaryWithContentsOfFile:v31];
                double v33 = (void *)objc_claimAutoreleasedReturnValue();
                [v33 objectForKeyedSubscript:@"taskingID"];
                uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();
                v35 = v34;
                if (v34 && ([v34 isEqualToString:v28] & 1) == 0)
                {
                  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412802;
                    v55 = v26;
                    __int16 v56 = 2112;
                    v57 = v35;
                    __int16 v58 = 2112;
                    BOOL v59 = v28;
                    _os_log_impl( &dword_187E6F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "updated staged tasking %@ '%@ <- %@'",  buf,  0x20u);
                  }

                  [v33 objectForKeyedSubscript:@"payload"];
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  -[PCCProxyingDevice deliver:tasking:taskId:fromBlob:]( v43,  "deliver:tasking:taskId:fromBlob:",  v7,  v26,  v35,  v36);

                  v52[0] = @"action";
                  v52[1] = @"taskId";
                  v53[0] = @"delivered";
                  v53[1] = v35;
                  v52[2] = @"blob";
                  v53[2] = v31;
                  [MEMORY[0x189603F68] dictionaryWithObjects:v53 forKeys:v52 count:3];
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  -[NSMutableDictionary setObject:forKeyedSubscript:]( v43->_tasking_summary,  "setObject:forKeyedSubscript:",  v37,  v26);

                  id v6 = v41;
                  id v15 = v42;
                }

                else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412546;
                  v55 = v26;
                  __int16 v56 = 2112;
                  v57 = v28;
                  _os_log_impl( &dword_187E6F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "no change staged tasking %@ '%@'",  buf,  0x16u);
                }
              }

              else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v55 = v26;
                _os_log_impl( &dword_187E6F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "no staged tasking %@",  buf,  0xCu);
              }
            }

            uint64_t v24 = [obj countByEnumeratingWithState:&v48 objects:v60 count:16];
          }

          while (v24);
        }

        BOOL v16 = v39;
        __int16 v8 = v40;
        id v17 = v38;
      }
    }
  }
}

- (void)deliver:(id)a3 tasking:(id)a4 taskId:(id)a5 fromBlob:(id)a6
{
  v24[3] = *MEMORY[0x1895F89C0];
  id v10 = a3;
  id v11 = a4;
  id v12 = (__CFString *)a5;
  id v13 = a6;
  v23[0] = @"messageType";
  v23[1] = @"forRouting";
  v23[2] = @"withTaskingId";
  v24[0] = @"acceptTasking";
  id v14 = @"-1";
  if (v12) {
    id v14 = v12;
  }
  v24[1] = v11;
  v24[2] = v14;
  [MEMORY[0x189603F68] dictionaryWithObjects:v24 forKeys:v23 count:3];
  id v15 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v16 = (void *)[v15 mutableCopy];

  if (v12)
  {
    char v17 = -[__CFString isEqualToString:](v12, "isEqualToString:", @"-1");
    if (v13)
    {
      if ((v17 & 1) == 0) {
        [v16 setObject:v13 forKeyedSubscript:@"settings"];
      }
    }
  }

  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 138412546;
    v20 = @"acceptTasking";
    __int16 v21 = 2112;
    id v22 = v11;
    _os_log_impl(&dword_187E6F000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "posted %@-%@", (uint8_t *)&v19, 0x16u);
  }

  id v18 = -[PCCEndpoint send:message:error:](self->_endpoint, "send:message:error:", v10, v16, 0LL);
}

- (void)request:(id)a3 transferGroupWithOptions:(id)a4 onComplete:(id)a5
{
  v18[3] = *MEMORY[0x1895F89C0];
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  [v8 objectForKeyedSubscript:@"allFiles"];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = [v11 BOOLValue];

  v18[0] = @"initiateLogTransfer";
  v17[0] = @"messageType";
  v17[1] = @"allFiles";
  [MEMORY[0x189607968] numberWithBool:v12];
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v13;
  v17[2] = @"jobEvent";
  [v8 objectForKeyedSubscript:@"event"];
  id v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    [v8 objectForKeyedSubscript:@"event"];
    id v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v15 = @"<unknown>";
  }

  v18[2] = v15;
  [MEMORY[0x189603F68] dictionaryWithObjects:v18 forKeys:v17 count:3];
  BOOL v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PCCProxyingDevice startRequest:message:onComplete:](self, "startRequest:message:onComplete:", v10, v16, v9);

  if (v14) {
}
  }

- (void)request:(id)a3 transferLog:(id)a4 withOptions:(id)a5 onComplete:(id)a6
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v20 = v12;
    _os_log_impl(&dword_187E6F000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "transferLog options %@", buf, 0xCu);
  }

  objc_msgSend( v12,  "objectForKeyedSubscript:",  @"event",  @"messageType",  @"logFile",  @"jobEvent",  @"initiateLogTransfer",  v11);
  id v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    [v12 objectForKeyedSubscript:@"event"];
    id v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v15 = @"<unknown>";
  }

  v18[2] = v15;
  [MEMORY[0x189603F68] dictionaryWithObjects:v18 forKeys:&v17 count:3];
  BOOL v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PCCProxyingDevice startRequest:message:onComplete:](self, "startRequest:message:onComplete:", v10, v16, v13);

  if (v14) {
}
  }

- (void)request:(id)a3 transferLog:(id)a4 onComplete:(id)a5
{
}

- (void)request:(id)a3 logListWithOptions:(id)a4 onComplete:(id)a5
{
  v15[2] = *MEMORY[0x1895F89C0];
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = [a4 objectForKeyedSubscript:@"path"];
  id v11 = (void *)v10;
  v14[0] = @"messageType";
  v14[1] = @"path";
  id v12 = &stru_18A161700;
  if (v10) {
    id v12 = (const __CFString *)v10;
  }
  v15[0] = @"initiateLogList";
  v15[1] = v12;
  [MEMORY[0x189603F68] dictionaryWithObjects:v15 forKeys:v14 count:2];
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PCCProxyingDevice startRequest:message:onComplete:](self, "startRequest:message:onComplete:", v9, v13, v8);
}

- (void)request:(id)a3 logList:(id)a4
{
}

- (void)requestProxyMetadata:(id)a3 onComplete:(id)a4
{
}

- (void)startRequest:(id)a3 message:(id)a4 onComplete:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  request_queue = (dispatch_queue_s *)self->_request_queue;
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __53__PCCProxyingDevice_startRequest_message_onComplete___block_invoke;
  void v15[3] = &unk_18A161570;
  v15[4] = self;
  id v16 = v9;
  id v17 = v8;
  id v18 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_async(request_queue, v15);
}

void __53__PCCProxyingDevice_startRequest_message_onComplete___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  ++*(_DWORD *)(*(void *)(a1 + 32) + 92LL);
  uint64_t v2 = (void *)MEMORY[0x1895B84F4]();
  [MEMORY[0x189607AB8] UUID];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 UUIDString];
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue();

  id v5 = (void *)[*(id *)(a1 + 40) mutableCopy];
  [v5 setObject:v4 forKeyedSubscript:@"jobId"];
  id v6 = *(void **)(*(void *)(a1 + 32) + 8LL);
  uint64_t v7 = *(void *)(a1 + 48);
  id v17 = 0LL;
  [v6 send:v7 message:v5 error:&v17];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  id v9 = v17;
  if (!v9)
  {
    id v11 = -[PCCRequest initWithMessage:options:]( objc_alloc(&OBJC_CLASS___PCCRequest),  "initWithMessage:options:",  v5,  0LL);
    id v12 = *(void **)(a1 + 56);
    if (v12)
    {
      id v13 = (void *)[v12 copy];
      -[PCCRequest setCallback:](v11, "setCallback:", v13);
    }

    [*(id *)(*(void *)(a1 + 32) + 32) setObject:v11 forKeyedSubscript:v4];
    if (v8)
    {
      [*(id *)(*(void *)(a1 + 32) + 40) setObject:v11 forKeyedSubscript:v8];
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
      {
        -[PCCRequest type](v11, "type");
        id v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        int v19 = v14;
        __int16 v20 = 2112;
        uint64_t v21 = v4;
        id v15 = (os_log_s *)MEMORY[0x1895F8DA0];
        id v16 = "request %@ (%@) enroute";
LABEL_11:
        _os_log_impl(&dword_187E6F000, v15, OS_LOG_TYPE_DEFAULT, v16, buf, 0x16u);
      }
    }

    else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      -[PCCRequest type](v11, "type");
      id v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      int v19 = v14;
      __int16 v20 = 2112;
      uint64_t v21 = v4;
      id v15 = (os_log_s *)MEMORY[0x1895F8DA0];
      id v16 = "request %@ (%@) sent";
      goto LABEL_11;
    }

    [*(id *)(a1 + 32) startTimer];

    goto LABEL_13;
  }

  uint64_t v10 = *(void *)(a1 + 56);
  if (v10) {
    (*(void (**)(uint64_t, void, id))(v10 + 16))(v10, 0LL, v9);
  }
LABEL_13:

  objc_autoreleasePoolPop(v2);
}

- (void)addRequest:(id)a3 event:(id)a4 type:(id)a5 onComplete:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  request_queue = (dispatch_queue_s *)self->_request_queue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __54__PCCProxyingDevice_addRequest_event_type_onComplete___block_invoke;
  block[3] = &unk_18A161598;
  block[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v23 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  dispatch_async(request_queue, block);
}

void __54__PCCProxyingDevice_addRequest_event_type_onComplete___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  uint64_t v2 = (void *)MEMORY[0x1895B84F4]();
  [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:*(void *)(a1 + 40)];
  id v3 = (PCCRequest *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    BOOL v4 = objc_alloc(&OBJC_CLASS___PCCRequest);
    __int128 v9 = *(_OWORD *)(a1 + 40);
    v8[0] = @"jobId";
    v8[1] = @"jobEvent";
    v8[2] = @"jobType";
    uint64_t v10 = *(void *)(a1 + 56);
    [MEMORY[0x189603F68] dictionaryWithObjects:&v9 forKeys:v8 count:3];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    id v3 = -[PCCRequest initWithMessage:options:](v4, "initWithMessage:options:", v5, 0LL);

    id v6 = *(void **)(a1 + 64);
    if (v6)
    {
      uint64_t v7 = (void *)[v6 copy];
      -[PCCRequest setCallback:](v3, "setCallback:", v7);
    }

    [*(id *)(*(void *)(a1 + 32) + 32) setObject:v3 forKeyedSubscript:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) startTimer];
  }

  objc_autoreleasePoolPop(v2);
}

- (void)finishRequest:(id)a3 result:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  request_queue = (dispatch_queue_s *)self->_request_queue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __42__PCCProxyingDevice_finishRequest_result___block_invoke;
  block[3] = &unk_18A161480;
  id v12 = v6;
  id v13 = v7;
  id v14 = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(request_queue, block);
}

void __42__PCCProxyingDevice_finishRequest_result___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  uint64_t v2 = (void *)MEMORY[0x1895B84F4]();
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    [*(id *)(a1 + 32) type];
    id v3 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 32) jid];
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      id v5 = *(const __CFString **)(a1 + 40);
    }
    else {
      id v5 = @"Ok";
    }
    *(_DWORD *)buf = 138412802;
    id v23 = v3;
    __int16 v24 = 2112;
    v25 = v4;
    __int16 v26 = 2112;
    int v27 = v5;
    _os_log_impl(&dword_187E6F000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "request %@ (%@) complete %@", buf, 0x20u);
  }

  id v6 = *(void **)(a1 + 48);
  [*(id *)(a1 + 32) event];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) type];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    id v9 = @"error";
  }
  else {
    id v9 = @"success";
  }
  [v6 diagnosticResultsEvent:v7 type:v8 result:v9];

  id v10 = *(void **)(*(void *)(a1 + 48) + 32LL);
  [*(id *)(a1 + 32) jid];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 removeObjectForKey:v11];

  [*(id *)(a1 + 32) callback];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    dispatch_get_global_queue(0LL, 0LL);
    id v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1895F87A8];
    v19[1] = 3221225472LL;
    v19[2] = __42__PCCProxyingDevice_finishRequest_result___block_invoke_316;
    v19[3] = &unk_18A1615C0;
    id v20 = *(id *)(a1 + 40);
    id v21 = v12;
    dispatch_async(v13, v19);
  }

  else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_187E6F000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO, "no handler installed?", buf, 2u);
  }

  uint64_t v14 = *(void *)(a1 + 48);
  if (*(void *)(v14 + 48) && ![*(id *)(v14 + 32) count])
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( &dword_187E6F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "no outstanding requests; releasing transaction",
        buf,
        2u);
    }

    dispatch_source_cancel(*(dispatch_source_t *)(*(void *)(a1 + 48) + 48LL));
    uint64_t v15 = *(void *)(a1 + 48);
    id v16 = *(void **)(v15 + 48);
    *(void *)(v15 + 48) = 0LL;

    uint64_t v17 = *(void *)(a1 + 48);
    id v18 = *(void **)(v17 + 56);
    *(void *)(v17 + 56) = 0LL;
  }

  objc_autoreleasePoolPop(v2);
}

void __42__PCCProxyingDevice_finishRequest_result___block_invoke_316(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1895B84F4]();
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v4 = *(void *)(a1 + 32);
  if ((isKindOfClass & 1) != 0)
  {
    uint64_t v5 = 0LL;
  }

  else
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v4 = 0LL;
  }

  (*(void (**)(void, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16LL))(*(void *)(a1 + 40), v5, v4);
  objc_autoreleasePoolPop(v2);
}

- (void)finishRequestWithMessage:(id)a3 result:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  request_queue = (dispatch_queue_s *)self->_request_queue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __53__PCCProxyingDevice_finishRequestWithMessage_result___block_invoke;
  block[3] = &unk_18A161480;
  id v12 = v6;
  id v13 = v7;
  uint64_t v14 = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(request_queue, block);
}

void __53__PCCProxyingDevice_finishRequestWithMessage_result___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  uint64_t v2 = (void *)MEMORY[0x1895B84F4]();
  [*(id *)(a1 + 32) objectForKeyedSubscript:@"jobId"];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = v3;
  if (v3)
  {
    if ([v3 isEqualToString:@"<unsolicited>"])
    {
      [*(id *)(a1 + 32) objectForKeyedSubscript:@"jobType"];
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0) {
          id v6 = *(const __CFString **)(a1 + 40);
        }
        else {
          id v6 = @"Ok";
        }
        int v17 = 138412802;
        id v18 = v4;
        __int16 v19 = 2112;
        id v20 = v5;
        __int16 v21 = 2112;
        id v22 = v6;
        _os_log_impl( &dword_187E6F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "job %@ %@ completed %@",  (uint8_t *)&v17,  0x20u);
      }

      uint64_t v14 = *(void **)(a1 + 48);
      [*(id *)(a1 + 32) objectForKeyedSubscript:@"jobEvent"];
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0) {
        id v16 = @"error";
      }
      else {
        id v16 = @"success";
      }
      [v14 diagnosticResultsEvent:v15 type:v5 result:v16];

      goto LABEL_23;
    }

    [*(id *)(*(void *)(a1 + 48) + 32) objectForKeyedSubscript:v4];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 138412290;
        id v18 = v4;
        _os_log_impl( &dword_187E6F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "unknown job id %@",  (uint8_t *)&v17,  0xCu);
      }

      goto LABEL_23;
    }

- (void)diagnosticResultsEvent:(id)a3 type:(id)a4 result:(id)a5
{
  v36[4] = *MEMORY[0x1895F89C0];
  int v8 = (__CFString *)a3;
  id v9 = (__CFString *)a4;
  id v10 = a5;
  if ((-[__CFString isEqualToString:](v9, "isEqualToString:", @"xfer-group") & 1) != 0
    || (-[__CFString isEqualToString:](v9, "isEqualToString:", @"xfer-all") & 1) != 0
    || -[__CFString isEqualToString:](v9, "isEqualToString:", @"xfer-file"))
  {
    [MEMORY[0x189611B08] sharedInstance];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    int v12 = [v11 appleInternal];

    if (v12)
    {
      [MEMORY[0x189603F50] date];
      int v31 = (void *)objc_claimAutoreleasedReturnValue();
      v36[0] = v31;
      v35[0] = @"time";
      v35[1] = @"version";
      [MEMORY[0x189611B08] sharedInstance];
      id v13 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v14 = [v13 buildVersion];
      uint64_t v15 = (void *)v14;
      id v16 = @"<unknown>";
      if (v8) {
        int v17 = v8;
      }
      else {
        int v17 = @"<unknown>";
      }
      v36[1] = v14;
      v36[2] = v17;
      v35[2] = @"event";
      v35[3] = @"transfer";
      if (v9) {
        id v16 = v9;
      }
      v33[0] = @"type";
      v33[1] = @"result";
      v34[0] = v16;
      v34[1] = v10;
      id v30 = v10;
      v33[2] = @"summary";
      v34[2] = self->_sync_summary;
      [MEMORY[0x189603F68] dictionaryWithObjects:v34 forKeys:v33 count:3];
      id v18 = (void *)objc_claimAutoreleasedReturnValue();
      v36[3] = v18;
      [MEMORY[0x189603F68] dictionaryWithObjects:v36 forKeys:v35 count:4];
      __int16 v19 = (void *)objc_claimAutoreleasedReturnValue();
      id v20 = (void *)[v19 mutableCopy];

      if (-[NSMutableDictionary count](self->_tasking_summary, "count")) {
        [v20 setObject:self->_tasking_summary forKeyedSubscript:@"taskings"];
      }
      [MEMORY[0x189611B08] sharedInstance];
      __int16 v21 = (void *)objc_claimAutoreleasedReturnValue();
      [v21 pathDiagnostics];
      id v22 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v23 = (void *)NSString;
      OSANSDateFormat();
      __int16 v24 = (void *)objc_claimAutoreleasedReturnValue();
      [v23 stringWithFormat:@"transfer-%@", v24];
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      [v22 stringByAppendingPathComponent:v25];
      __int16 v26 = (void *)objc_claimAutoreleasedReturnValue();
      [v26 stringByAppendingPathExtension:@"results"];
      int v27 = (void *)objc_claimAutoreleasedReturnValue();

      if ([v20 writeToFile:v27 atomically:1])
      {
        id v10 = v30;
      }

      else
      {
        id v10 = v30;
        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( &dword_187E6F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "failed to write results file, saving as txt",  buf,  2u);
        }

        uint64_t v28 = [v27 stringByAppendingPathExtension:@"txt"];

        [v20 description];
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        [v29 writeToFile:v28 atomically:1 encoding:4 error:0];

        int v27 = (void *)v28;
      }
    }

    -[NSMutableDictionary removeAllObjects](self->_sync_summary, "removeAllObjects");
    -[NSMutableDictionary removeAllObjects](self->_tasking_summary, "removeAllObjects");
  }
}

- (void)startTimer
{
  request_queue = (dispatch_queue_s *)self->_request_queue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __31__PCCProxyingDevice_startTimer__block_invoke;
  block[3] = &unk_18A161520;
  void block[4] = self;
  dispatch_async(request_queue, block);
}

void __31__PCCProxyingDevice_startTimer__block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1895B84F4]();
  uint64_t v3 = [MEMORY[0x189603F50] date];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 16);
  *(void *)(v4 + 16) = v3;

  uint64_t v6 = *(void *)(a1 + 32);
  if (!*(void *)(v6 + 48))
  {
    dispatch_source_t v7 = dispatch_source_create(MEMORY[0x1895F8B78], 0LL, 0LL, *(dispatch_queue_t *)(v6 + 24));
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = *(void **)(v8 + 48);
    *(void *)(v8 + 48) = v7;

    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(dispatch_source_s **)(v10 + 48);
    dispatch_time_t v12 = dispatch_walltime(0LL, (uint64_t)(*(double *)(v10 + 112) * 1000000000.0));
    dispatch_source_set_timer(v11, v12, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
    uint64_t v13 = *(void *)(a1 + 32);
    uint64_t v14 = *(dispatch_source_s **)(v13 + 48);
    handler[0] = MEMORY[0x1895F87A8];
    handler[1] = 3221225472LL;
    handler[2] = __31__PCCProxyingDevice_startTimer__block_invoke_2;
    handler[3] = &unk_18A161520;
    handler[4] = v13;
    dispatch_source_set_event_handler(v14, handler);
    dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 48LL));
    if (*(void *)(*(void *)(a1 + 32) + 56LL))
    {
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v20 = 0;
        uint64_t v15 = (os_log_s *)MEMORY[0x1895F8DA0];
        id v16 = "re-starting request timer and extending transaction";
LABEL_7:
        _os_log_impl(&dword_187E6F000, v15, OS_LOG_TYPE_DEFAULT, v16, v20, 2u);
      }
    }

    else
    {
      uint64_t v17 = os_transaction_create();
      uint64_t v18 = *(void *)(a1 + 32);
      __int16 v19 = *(void **)(v18 + 56);
      *(void *)(v18 + 56) = v17;

      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v20 = 0;
        uint64_t v15 = (os_log_s *)MEMORY[0x1895F8DA0];
        id v16 = "starting request timer and creating transaction";
        goto LABEL_7;
      }
    }
  }

  objc_autoreleasePoolPop(v2);
}

void __31__PCCProxyingDevice_startTimer__block_invoke_2(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  [*(id *)(*(void *)(a1 + 32) + 16) timeIntervalSinceNow];
  uint64_t v3 = *(void *)(a1 + 32);
  if (fabs(v2) >= *(double *)(v3 + 112))
  {
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    [*(id *)(v3 + 32) allValues];
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = [obj countByEnumeratingWithState:&v27 objects:v33 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v28;
      uint64_t v12 = *MEMORY[0x1896075E0];
      do
      {
        for (uint64_t i = 0LL; i != v10; ++i)
        {
          if (*(void *)v28 != v11) {
            objc_enumerationMutation(obj);
          }
          uint64_t v14 = *(void *)(*((void *)&v27 + 1) + 8 * i);
          ++*(_DWORD *)(*(void *)(a1 + 32) + 96LL);
          uint64_t v15 = *(void **)(a1 + 32);
          id v16 = (void *)MEMORY[0x189607870];
          uint64_t v31 = v12;
          BOOL v32 = @"expired due to lack of progress";
          [MEMORY[0x189603F68] dictionaryWithObjects:&v32 forKeys:&v31 count:1];
          uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
          [v16 errorWithDomain:@"ProxyCompanionLogTransferErrorDomain" code:5 userInfo:v17];
          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
          [v15 finishRequest:v14 result:v18];
        }

        uint64_t v10 = [obj countByEnumeratingWithState:&v27 objects:v33 count:16];
      }

      while (v10);
    }

    [*(id *)(*(void *)(a1 + 32) + 40) removeAllObjects];
    if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_18;
    }
    *(_WORD *)buf = 0;
    __int16 v19 = (os_log_s *)MEMORY[0x1895F8DA0];
    id v20 = "request expiration event; releasing transaction";
    goto LABEL_17;
  }

  uint64_t v4 = [*(id *)(v3 + 32) count];
  BOOL v5 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT);
  if (!v4)
  {
    if (!v5)
    {
LABEL_18:
      uint64_t v21 = *(void *)(a1 + 32);
      id v22 = *(void **)(v21 + 56);
      *(void *)(v21 + 56) = 0LL;

      dispatch_source_cancel(*(dispatch_source_t *)(*(void *)(a1 + 32) + 48LL));
      uint64_t v23 = *(void *)(a1 + 32);
      __int16 v24 = *(void **)(v23 + 48);
      *(void *)(v23 + 48) = 0LL;

      return;
    }

    *(_WORD *)buf = 0;
    __int16 v19 = (os_log_s *)MEMORY[0x1895F8DA0];
    id v20 = "request expiration event (with no outstanding requests!); releasing transaction";
LABEL_17:
    _os_log_impl(&dword_187E6F000, v19, OS_LOG_TYPE_DEFAULT, v20, buf, 2u);
    goto LABEL_18;
  }

  if (v5)
  {
    *(_WORD *)buf = 0;
    _os_log_impl( &dword_187E6F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "re-starting request timer thereby extending transaction",  buf,  2u);
  }

  uint64_t v6 = *(void *)(a1 + 32);
  dispatch_source_t v7 = *(dispatch_source_s **)(v6 + 48);
  dispatch_time_t v8 = dispatch_walltime(0LL, (uint64_t)(*(double *)(v6 + 112) * 1000000000.0));
  dispatch_source_set_timer(v7, v8, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
}

- (double)requestTimeout
{
  return self->_requestTimeout;
}

- (void)setRequestTimeout:(double)a3
{
  self->_double requestTimeout = a3;
}

- (void).cxx_destruct
{
}

- (void)handleMessage:from:.cold.1()
{
}

- (void)handleFile:(uint64_t)a1 from:metadata:.cold.1(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_debug_impl( &dword_187E6F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEBUG,  "file status update %@",  (uint8_t *)&v1,  0xCu);
}

- (void)handleFile:(uint64_t)a1 from:(uint64_t)a2 metadata:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  int v3 = 138543874;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  __int16 v7 = 2114;
  uint64_t v8 = a3;
  _os_log_error_impl( &dword_187E6F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "Error handling %{public}@ from proxying device (%{public}@): %{public}@",  (uint8_t *)&v3,  0x20u);
}

@end