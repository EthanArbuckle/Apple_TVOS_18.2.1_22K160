@interface SiriNWConnection
- (BOOL)hasActiveConnection;
- (SiriNWConnection)initWithQueueAndCompletion:(id)a3 reason:(id)a4 callback:(id)a5;
- (id)_getAttemptedEndpoints;
- (id)_queue;
- (id)_setParametersForHost:(const char *)a3 useTLS:(BOOL)a4 initialPayload:(id)a5;
- (id)resolvedHost;
- (void)_cancelOpenTimer;
- (void)_closeWithError:(id)a3;
- (void)_configureConnection:(id)a3;
- (void)_getNWConnectionWithInitialData:(id)a3 completion:(id)a4;
- (void)_invokeOpenCompletionWithError:(id)a3;
- (void)_setupOpenTimer;
- (void)close;
- (void)dealloc;
- (void)openConnectionForURL:(id)a3 withConnectionId:(id)a4 initialPayload:(id)a5 completion:(id)a6;
- (void)runSiriProbeWithDepth:(int64_t)a3 trafficClass:(unsigned int)a4;
@end

@implementation SiriNWConnection

- (SiriNWConnection)initWithQueueAndCompletion:(id)a3 reason:(id)a4 callback:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  objc_storeStrong((id *)&self->_queue, a3);
  id v11 = a5;
  objc_storeStrong((id *)&self->_reason, a4);
  v12 = (void *)MEMORY[0x1895BA9F4](v11);

  id wfcompletion = self->_wfcompletion;
  self->_id wfcompletion = v12;

  id v14 = objc_alloc_init(MEMORY[0x189607848]);
  [v14 setDateFormat:@"yyyy-MM-dd"];
  [v14 dateFromString:@"2025-12-30"];
  v15 = (NSDate *)objc_claimAutoreleasedReturnValue();
  dateToDisable = self->_dateToDisable;
  self->_dateToDisable = v15;

  if ([v10 containsString:@"expireddate"])
  {
    [v14 dateFromString:@"2024-01-30"];
    v17 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v18 = self->_dateToDisable;
    self->_dateToDisable = v17;
  }

  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SiriNWConnection;
  -[SiriNWConnection dealloc](&v3, sel_dealloc);
}

- (id)_queue
{
  return self->_queue;
}

- (void)runSiriProbeWithDepth:(int64_t)a3 trafficClass:(unsigned int)a4
{
  v25[1] = *MEMORY[0x1895F89C0];
  self->_network_traffic_class = a4;
  if (a3 == 2)
  {
    [MEMORY[0x189604030] URLWithString:@"https://guzzoni.apple.com:443/ace"];
    id v11 = (NSURL *)objc_claimAutoreleasedReturnValue();
    url = self->_url;
    self->_url = v11;
    int64_t v10 = 10LL;
  }

  else if (a3 == 1)
  {
    [MEMORY[0x189604030] URLWithString:@"https://guzzoni.apple.com:443/"];
    v12 = (NSURL *)objc_claimAutoreleasedReturnValue();
    url = self->_url;
    self->_url = v12;
    int64_t v10 = 9LL;
  }

  else
  {
    if (a3) {
      goto LABEL_10;
    }
    [MEMORY[0x189604030] URLWithString:@"http://guzzoni.apple.com:443/"];
    v6 = (NSURL *)objc_claimAutoreleasedReturnValue();
    v7 = self->_url;
    self->_url = v6;

    if (!-[NSString containsString:](self->_reason, "containsString:", @"badport"))
    {
      int64_t v10 = 8LL;
      goto LABEL_9;
    }

    [MEMORY[0x189604030] URLWithString:@"http://guzzoni.apple.com:80/"];
    v8 = (NSURL *)objc_claimAutoreleasedReturnValue();
    url = self->_url;
    self->_url = v8;
    int64_t v10 = 8LL;
  }

LABEL_9:
  self->_probeLabel = v10;
LABEL_10:
  [MEMORY[0x189603F50] now];
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 timeIntervalSinceDate:self->_dateToDisable];
  if (v14 <= 0.0)
  {
    NSLog( @"%s: Probing ok to run before %@, it is now %@",  "-[SiriNWConnection runSiriProbeWithDepth:trafficClass:]",  self->_dateToDisable,  v13);
    NSLog( @"%s: Starting NWConnection to Siri using traffic class %d, depth %ld",  "-[SiriNWConnection runSiriProbeWithDepth:trafficClass:]",  self->_network_traffic_class,  a3);
    v22 = self->_url;
    v23[0] = MEMORY[0x1895F87A8];
    v23[1] = 3221225472LL;
    v23[2] = __55__SiriNWConnection_runSiriProbeWithDepth_trafficClass___block_invoke;
    v23[3] = &unk_18A16D930;
    v23[4] = self;
    -[SiriNWConnection openConnectionForURL:withConnectionId:initialPayload:completion:]( self,  "openConnectionForURL:withConnectionId:initialPayload:completion:",  v22,  0LL,  0LL,  v23);
  }

  else
  {
    NSLog( @"%s: Probing has been disabled from running after %@, it is now %@",  "-[SiriNWConnection runSiriProbeWithDepth:trafficClass:]",  self->_dateToDisable,  v13);
    v15 = (void *)MEMORY[0x189607870];
    uint64_t v24 = *MEMORY[0x1896075E0];
    [MEMORY[0x1896077F8] mainBundle];
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v16 localizedStringForKey:@"Past Siri Probe Functional Date" value:&stru_18A170410 table:0];
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v17;
    [MEMORY[0x189603F68] dictionaryWithObjects:v25 forKeys:&v24 count:1];
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 errorWithDomain:@"com.apple.wifi.policy" code:1 userInfo:v18];
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (self->_wfcompletion)
    {
      v20 = (void (**)(void, void, void))MEMORY[0x1895BA9F4]();
      id wfcompletion = self->_wfcompletion;
      self->_id wfcompletion = 0LL;

      ((void (**)(void, void, void *))v20)[2](v20, 0LL, v19);
    }
  }
}

void __55__SiriNWConnection_runSiriProbeWithDepth_trafficClass___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v7 = v3;
  if (v3) {
    NSLog( @"%s: openConnectionForURL returned error %@",  "-[SiriNWConnection runSiriProbeWithDepth:trafficClass:]_block_invoke",  v3);
  }
  else {
    NSLog( @"%s: openConnectionForURL returned success",  "-[SiriNWConnection runSiriProbeWithDepth:trafficClass:]_block_invoke");
  }
  if (*(void *)(*(void *)(a1 + 32) + 72LL))
  {
    v4 = (void (**)(void, void, void))MEMORY[0x1895BA9F4]();
    uint64_t v5 = *(void *)(a1 + 32);
    v6 = *(void **)(v5 + 72);
    *(void *)(v5 + 72) = 0LL;

    ((void (**)(void, BOOL, id))v4)[2](v4, v7 == 0LL, v7);
  }

  NSLog( @"%s: openConnectionForURL complete closing connection",  "-[SiriNWConnection runSiriProbeWithDepth:trafficClass:]_block_invoke");
  [*(id *)(a1 + 32) _closeWithError:v7];
}

- (void)_invokeOpenCompletionWithError:(id)a3
{
  id openCompletion = self->_openCompletion;
  if (openCompletion)
  {
    id v5 = a3;
    id v7 = (void (**)(id, id))MEMORY[0x1895BA9F4](openCompletion);
    id v6 = self->_openCompletion;
    self->_id openCompletion = 0LL;

    v7[2](v7, v5);
  }

- (void)_getNWConnectionWithInitialData:(id)a3 completion:(id)a4
{
  id v19 = a3;
  id v6 = (void (**)(id, nw_connection_t, void *))a4;
  id v7 = self->_resolvedHost;
  v8 = -[NSURL port](self->_url, "port");
  [v8 stringValue];
  id v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

  -[NSURL scheme](self->_url, "scheme");
  int64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  self->_usingTLS = [v10 caseInsensitiveCompare:@"https"] == 0;

  if (!v9)
  {
    NSLog( @"%s: Failed to find port in _url %@",  "-[SiriNWConnection _getNWConnectionWithInitialData:completion:]",  self->_url);
    if (self->_usingTLS) {
      id v9 = @"443";
    }
    else {
      id v9 = @"80";
    }
  }

  id v11 = v7;
  v12 = -[NSString UTF8String](v11, "UTF8String");
  v13 = v9;
  host = nw_endpoint_create_host(v12, (const char *)-[__CFString UTF8String](v13, "UTF8String"));
  if (host
    || ([MEMORY[0x189607870] errorWithDomain:@"com.apple.wifi.policy.siri" code:22 userInfo:0],  v18 = (void *)objc_claimAutoreleasedReturnValue(),  NSLog( @"%s: Failed to create endpoint %@",  "-[SiriNWConnection _getNWConnectionWithInitialData:completion:]",  v18),  !v18))
  {
    -[SiriNWConnection _setParametersForHost:useTLS:initialPayload:]( self,  "_setParametersForHost:useTLS:initialPayload:",  v12,  self->_usingTLS,  v19);
    v15 = (nw_parameters *)objc_claimAutoreleasedReturnValue();
    nw_connection_t v16 = nw_connection_create(host, v15);
    v17 = +[WiFiPolicyNetworkActivityTracing sharedNetworkActivityTracing]( &OBJC_CLASS___WiFiPolicyNetworkActivityTracing,  "sharedNetworkActivityTracing");
    [v17 networkActivityAddNWConnection:v16 toActivityWithLabel:self->_probeLabel];

    if (v16)
    {
      v18 = 0LL;
    }

    else
    {
      [MEMORY[0x189607870] errorWithDomain:@"com.apple.wifi.policy.siri" code:23 userInfo:0];
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog( @"%s: Failed to create connection %@",  "-[SiriNWConnection _getNWConnectionWithInitialData:completion:]",  v18);
    }
  }

  else
  {
    nw_connection_t v16 = 0LL;
  }

  v6[2](v6, v16, v18);
}

- (void)openConnectionForURL:(id)a3 withConnectionId:(id)a4 initialPayload:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  [v13 host];
  double v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (NSString *)[v14 copy];
  resolvedHost = self->_resolvedHost;
  self->_resolvedHost = v15;

  v17 = (NSURL *)[v13 copy];
  url = self->_url;
  self->_url = v17;

  id v19 = (NSString *)[v12 copy];
  connectionId = self->_connectionId;
  self->_connectionId = v19;

  self->_isEstablishing = 1;
  -[SiriNWConnection _setupOpenTimer](self, "_setupOpenTimer");
  uint64_t v21 = MEMORY[0x1895F87A8];
  v26[0] = MEMORY[0x1895F87A8];
  v26[1] = 3221225472LL;
  v26[2] = __84__SiriNWConnection_openConnectionForURL_withConnectionId_initialPayload_completion___block_invoke;
  v26[3] = &unk_18A16DE60;
  v26[4] = self;
  id v27 = v10;
  id v22 = v10;
  v23 = (void *)MEMORY[0x1895BA9F4](v26);
  id openCompletion = self->_openCompletion;
  self->_id openCompletion = v23;

  v25[0] = v21;
  v25[1] = 3221225472LL;
  void v25[2] = __84__SiriNWConnection_openConnectionForURL_withConnectionId_initialPayload_completion___block_invoke_2;
  v25[3] = &unk_18A16DE88;
  v25[4] = self;
  -[SiriNWConnection _getNWConnectionWithInitialData:completion:]( self,  "_getNWConnectionWithInitialData:completion:",  v11,  v25);
}

void __84__SiriNWConnection_openConnectionForURL_withConnectionId_initialPayload_completion___block_invoke( uint64_t a1,  void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 _cancelOpenTimer];
  *(_BYTE *)(*(void *)(a1 + 32) + 81LL) = 0;
  *(_BYTE *)(*(void *)(a1 + 32) + 82LL) = v4 == 0LL;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void __84__SiriNWConnection_openConnectionForURL_withConnectionId_initialPayload_completion___block_invoke_2( uint64_t a1,  void *a2,  void *a3)
{
  id v7 = a2;
  id v5 = a3;
  id v6 = v5;
  if (v7)
  {
    [*(id *)(a1 + 32) _configureConnection:v7];
  }

  else
  {
    if (!v5)
    {
      [MEMORY[0x189607870] errorWithDomain:@"com.apple.wifi.policy.siri" code:31 userInfo:0];
      id v6 = (void *)objc_claimAutoreleasedReturnValue();
    }

    [*(id *)(a1 + 32) _closeWithError:v6];
  }
}

- (void)_configureConnection:(id)a3
{
  id v5 = (nw_connection *)a3;
  objc_storeStrong((id *)&self->_connection, a3);
  objc_storeStrong((id *)&self->_content_context, (id)*MEMORY[0x189608E90]);
  nw_connection_set_queue(v5, (dispatch_queue_t)self->_queue);
  id v6 = v5;
  MEMORY[0x1895BA6A0]();
  nw_connection_set_read_close_handler();
  nw_connection_set_write_close_handler();
  nw_connection_start(v6);
}

void __41__SiriNWConnection__configureConnection___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v21[1] = *MEMORY[0x1895F89C0];
  id v5 = a3;
  id v6 = v5;
  if (!v5)
  {
    CFErrorRef v7 = 0LL;
    goto LABEL_7;
  }

  CFErrorRef v7 = nw_error_copy_cf_error(v5);
  if (!v7)
  {
LABEL_7:
    int v9 = 1;
    goto LABEL_8;
  }

  uint64_t id = *(void *)(a1 + 32);
  if (id) {
    uint64_t id = nw_connection_get_id();
  }
  NSLog( @"%s: state: %d error: %@ for connection: %llu",  "-[SiriNWConnection _configureConnection:]_block_invoke",  a2,  v7,  id);
  int v9 = 0;
LABEL_8:
  objc_storeStrong((id *)(*(void *)(a1 + 40) + 168LL), v7);
  uint64_t v10 = *(void *)(a1 + 40);
  if (!*(_BYTE *)(v10 + 80) && *(void *)(a1 + 32) == *(void *)(v10 + 40))
  {
    switch((int)a2)
    {
      case 0:
        uint64_t v16 = nw_connection_get_id();
        NSLog( @"%s: state: nw_connection_state_invalid for connection: %llu",  "-[SiriNWConnection _configureConnection:]_block_invoke",  v16);
        break;
      case 1:
        uint64_t v17 = nw_connection_get_id();
        NSLog( @"%s: state: nw_connection_state_waiting for connection: %llu",  "-[SiriNWConnection _configureConnection:]_block_invoke",  v17);
        break;
      case 2:
        uint64_t v18 = nw_connection_get_id();
        NSLog( @"%s: state: nw_connection_state_preparing for connection: %llu",  "-[SiriNWConnection _configureConnection:]_block_invoke",  v18);
        break;
      case 3:
        uint64_t v11 = nw_connection_get_id();
        NSLog( @"%s: state: nw_connection_state_ready for connection: %llu",  "-[SiriNWConnection _configureConnection:]_block_invoke",  v11);
        [*(id *)(a1 + 40) _invokeOpenCompletionWithError:0];
        break;
      case 4:
        uint64_t v19 = nw_connection_get_id();
        NSLog( @"%s: state: nw_connection_state_failed for connection: %llu",  "-[SiriNWConnection _configureConnection:]_block_invoke",  v19);
        break;
      case 5:
        uint64_t v12 = nw_connection_get_id();
        NSLog( @"%s: state: nw_connection_state_cancelled for connection: %llu",  "-[SiriNWConnection _configureConnection:]_block_invoke",  v12);
        id v13 = (void *)MEMORY[0x189607870];
        if (v9)
        {
          [MEMORY[0x189607870] errorWithDomain:@"com.apple.wifi.policy.siri" code:16 userInfo:0];
          double v14 = (void *)objc_claimAutoreleasedReturnValue();
        }

        else
        {
          uint64_t v20 = *MEMORY[0x189607798];
          v21[0] = v7;
          [MEMORY[0x189603F68] dictionaryWithObjects:v21 forKeys:&v20 count:1];
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          [v13 errorWithDomain:@"com.apple.wifi.policy.siri" code:16 userInfo:v15];
          double v14 = (void *)objc_claimAutoreleasedReturnValue();
        }

        [*(id *)(a1 + 40) _closeWithError:v14];

        break;
      default:
        break;
    }
  }

  else
  {
    NSLog( @"%s: Got nw_connection callback event while _isCanceled %d or for other connection, ignoring",  "-[SiriNWConnection _configureConnection:]_block_invoke",  *(unsigned __int8 *)(v10 + 80));
  }
}

uint64_t __41__SiriNWConnection__configureConnection___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _closeWithError:0];
}

uint64_t __41__SiriNWConnection__configureConnection___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _closeWithError:0];
}

- (void)_setupOpenTimer
{
  id v3 = dispatch_source_create(MEMORY[0x1895F8B78], 0LL, 0LL, (dispatch_queue_t)self->_queue);
  +[TrialNamespaceLinkTest sharedObj](&OBJC_CLASS___TrialNamespaceLinkTest, "sharedObj");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 siriConnectionTimeoutThreshold];

  dispatch_time_t v6 = dispatch_time(0LL, 1000000000 * v5);
  dispatch_source_set_timer(v3, v6, 0xFFFFFFFFFFFFFFFFLL, 0LL);
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __35__SiriNWConnection__setupOpenTimer__block_invoke;
  v10[3] = &unk_18A16C748;
  CFErrorRef v7 = v3;
  uint64_t v11 = v7;
  uint64_t v12 = self;
  dispatch_source_set_event_handler(v7, v10);
  dispatch_resume(v7);
  openTimer = self->_openTimer;
  self->_openTimer = (OS_dispatch_source *)v7;
  int v9 = v7;
}

void __35__SiriNWConnection__setupOpenTimer__block_invoke(uint64_t a1)
{
  v10[1] = *MEMORY[0x1895F89C0];
  NSLog(@"%s: Open timer firing", "-[SiriNWConnection _setupOpenTimer]_block_invoke");
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  if (v2 == *(void **)(v3 + 120))
  {
    *(void *)(v3 + 120) = 0LL;
  }

  id v4 = objc_alloc(MEMORY[0x189607870]);
  uint64_t v5 = v4;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 168LL);
  if (v6)
  {
    uint64_t v9 = *MEMORY[0x189607798];
    v10[0] = v6;
    [MEMORY[0x189603F68] dictionaryWithObjects:v10 forKeys:&v9 count:1];
    CFErrorRef v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)[v5 initWithDomain:@"com.apple.wifi.policy.siri" code:4 userInfo:v7];
  }

  else
  {
    v8 = (void *)[v4 initWithDomain:@"com.apple.wifi.policy.siri" code:4 userInfo:0];
  }

  [*(id *)(a1 + 40) _closeWithError:v8];
}

- (void)_cancelOpenTimer
{
  openTimer = self->_openTimer;
  if (openTimer)
  {
    dispatch_source_cancel((dispatch_source_t)openTimer);
    id v4 = self->_openTimer;
    self->_openTimer = 0LL;
  }

- (BOOL)hasActiveConnection
{
  return self->_connection != 0LL;
}

- (void)_closeWithError:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (self->_isCanceled)
  {
    NSLog(@"%s: is alredy cancelled, returning", "-[SiriNWConnection _closeWithError:]");
  }

  else
  {
    if (v4) {
      NSLog(@"%s: closing with error %@", "-[SiriNWConnection _closeWithError:]", v4);
    }
    else {
      NSLog(@"%s: closing", "-[SiriNWConnection _closeWithError:]");
    }
    resolvedHost = self->_resolvedHost;
    self->_resolvedHost = 0LL;

    self->_isReady = 0;
    uint64_t v7 = MEMORY[0x1895F87A8];
    self->_isCanceled = 1;
    v30[0] = v7;
    v30[1] = 3221225472LL;
    v30[2] = __36__SiriNWConnection__closeWithError___block_invoke;
    v30[3] = &unk_18A16C748;
    v30[4] = self;
    id v31 = v5;
    uint64_t v8 = MEMORY[0x1895BA9F4](v30);
    uint64_t v9 = (void *)v8;
    connection = self->_connection;
    if (connection)
    {
      uint64_t v11 = connection;
      uint64_t v12 = self->_connection;
      self->_connection = 0LL;

      id v13 = self->_content_context;
      content_context = self->_content_context;
      self->_content_context = 0LL;

      if (!self->_attemptedEndpoints)
      {
        -[SiriNWConnection _getAttemptedEndpoints](self, "_getAttemptedEndpoints");
        v15 = (NSArray *)objc_claimAutoreleasedReturnValue();
        attemptedEndpoints = self->_attemptedEndpoints;
        self->_attemptedEndpoints = v15;
      }

      uint64_t v17 = dispatch_group_create();
      dispatch_group_enter(v17);
      +[WiFiPolicyNetworkActivityTracing sharedNetworkActivityTracing]( &OBJC_CLASS___WiFiPolicyNetworkActivityTracing,  "sharedNetworkActivityTracing");
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
      int64_t probeLabel = self->_probeLabel;
      v28[0] = v7;
      v28[1] = 3221225472LL;
      v28[2] = __36__SiriNWConnection__closeWithError___block_invoke_2;
      v28[3] = &unk_18A16C770;
      v29 = v17;
      uint64_t v20 = v17;
      [v18 networkActivityRemoveNWConnection:v11 fromActivityWithLabel:probeLabel completion:v28];

      queue = (dispatch_queue_s *)self->_queue;
      block[0] = v7;
      block[1] = 3221225472LL;
      block[2] = __36__SiriNWConnection__closeWithError___block_invoke_3;
      block[3] = &unk_18A16D9D0;
      v25 = v11;
      v26 = v13;
      id v27 = v9;
      id v22 = v13;
      v23 = v11;
      dispatch_group_notify(v20, queue, block);
    }

    else
    {
      (*(void (**)(uint64_t))(v8 + 16))(v8);
    }
  }
}

void __36__SiriNWConnection__closeWithError___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (v2[14])
  {
    uint64_t v3 = *(void *)(a1 + 40);
    if (v3)
    {
      uint64_t v4 = 0LL;
    }

    else
    {
      uint64_t v4 = [MEMORY[0x189607870] errorWithDomain:@"com.apple.wifi.policy.siri" code:17 userInfo:0];
      v2 = *(void **)(a1 + 32);
      uint64_t v3 = *(void *)(a1 + 40);
    }

    id v6 = (id)v4;
    if (v3) {
      uint64_t v5 = v3;
    }
    else {
      uint64_t v5 = v4;
    }
    [v2 _invokeOpenCompletionWithError:v5];
  }

void __36__SiriNWConnection__closeWithError___block_invoke_2(uint64_t a1)
{
}

uint64_t __36__SiriNWConnection__closeWithError___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

void __36__SiriNWConnection__closeWithError___block_invoke_4(uint64_t a1, void *a2)
{
  v2 = a2;
  if (v2)
  {
    error = v2;
    int error_code = nw_error_get_error_code(v2);
    BOOL v4 = nw_error_get_error_domain(error) == nw_error_domain_posix;
    v2 = error;
    if (!v4 || error_code != 57)
    {
      NSLog(@"%s: close error is %@", "-[SiriNWConnection _closeWithError:]_block_invoke_4", error);
      v2 = error;
    }
  }
}

- (void)close
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __25__SiriNWConnection_close__block_invoke;
  block[3] = &unk_18A16C770;
  void block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __25__SiriNWConnection_close__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _closeWithError:0];
}

- (id)resolvedHost
{
  return self->_resolvedHost;
}

- (id)_setParametersForHost:(const char *)a3 useTLS:(BOOL)a4 initialPayload:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  uint64_t v9 = (void *)MEMORY[0x1895BA9F4](*MEMORY[0x189608EB0]);
  if (v5)
  {
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = __64__SiriNWConnection__setParametersForHost_useTLS_initialPayload___block_invoke;
    v18[3] = &__block_descriptor_33_e42_v16__0__NSObject_OS_nw_protocol_options__8l;
    char v19 = 1;
    uint64_t v10 = MEMORY[0x1895BA9F4](v18);

    uint64_t v9 = (void *)v10;
  }

  secure_tcp = nw_parameters_create_secure_tcp(v9, &__block_literal_global_152);
  if (v5)
  {
    size_t v12 = strlen(a3);
    xpc_object_t v13 = xpc_data_create(a3, v12);
    nw_parameters_set_tls_session_id();
  }

  double v14 = (void *)nw_context_create();
  nw_context_set_scheduling_mode();
  nw_context_set_isolate_protocol_stack();
  nw_context_set_privacy_level();
  nw_context_set_isolate_protocol_cache();
  nw_parameters_set_context();
  nw_parameters_set_data_mode();
  NSLog( @"%s: Network traffic class used=%u",  "-[SiriNWConnection _setParametersForHost:useTLS:initialPayload:]",  self->_network_traffic_class);
  nw_parameters_set_traffic_class();
  nw_parameters_set_indefinite();
  nw_parameters_set_tfo();
  if (v8) {
    nw_parameters_set_initial_data_payload();
  }
  NSLog(@"%s: optimisticDNS", "-[SiriNWConnection _setParametersForHost:useTLS:initialPayload:]");
  nw_parameters_set_expired_dns_behavior(secure_tcp, nw_parameters_expired_dns_behavior_allow);
  mach_msg_type_number_t task_info_outCnt = 8;
  if (task_info(*MEMORY[0x1895FBBE0], 0xFu, task_info_out, &task_info_outCnt)) {
    NSLog(@"%s: Failed to get task_info", "-[SiriNWConnection _setParametersForHost:useTLS:initialPayload:]");
  }
  else {
    nw_parameters_set_source_application();
  }

  return secure_tcp;
}

void __64__SiriNWConnection__setParametersForHost_useTLS_initialPayload___block_invoke(uint64_t a1, id a2)
{
  uint64_t v3 = (sec_protocol_options *)a2;
  sec_protocol_options_set_tls_tickets_enabled(v3, *(_BYTE *)(a1 + 32));
}

void __64__SiriNWConnection__setParametersForHost_useTLS_initialPayload___block_invoke_2( int a1,  nw_protocol_options_t options)
{
}

- (id)_getAttemptedEndpoints
{
  attemptedEndpoints = self->_attemptedEndpoints;
  if (attemptedEndpoints)
  {
    NSLog(@"%s: cached %@", a2, "-[SiriNWConnection _getAttemptedEndpoints]", attemptedEndpoints);
    BOOL v4 = self->_attemptedEndpoints;
  }

  else
  {
    BOOL v4 = (NSArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    BOOL v5 = self->_connection;
    if (v5 && !self->_isCanceled)
    {
      id v6 = (void *)nw_connection_copy_attempted_endpoint_array();
      if (v6)
      {
        uint64_t count = nw_array_get_count();
        if (count)
        {
          uint64_t v8 = count;
          for (uint64_t i = 0LL; i != v8; ++i)
          {
            nw_array_get_object_at_index();
            uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
            uint64_t description = nw_endpoint_get_description();
            if (description)
            {
              size_t v12 = (void *)[objc_alloc(NSString) initWithUTF8String:description];
              if (v12) {
                -[NSArray addObject:](v4, "addObject:", v12);
              }
            }
          }
        }
      }
    }

    NSLog(@"%s: %@", "-[SiriNWConnection _getAttemptedEndpoints]", v4);
  }

  return v4;
}

- (void).cxx_destruct
{
}

@end