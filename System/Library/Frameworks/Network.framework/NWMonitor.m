@interface NWMonitor
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (NWMonitor)monitorWithNetworkDescription:(id)a3 endpoint:(id)a4 parameters:(id)a5;
+ (NWMonitor)monitorWithNetworkDescriptionArray:(id)a3 endpoint:(id)a4 parameters:(id)a5;
+ (id)copySavedMonitorForNetworkDescriptionArray:(id)a3 endpoint:(id)a4 parameters:(id)a5;
+ (id)mainOperationQueue;
+ (id)queue;
+ (void)initialize;
+ (void)saveMonitor:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)matchesNetworkDescriptionArray:(id)a3 endpoint:(id)a4 parameters:(id)a5;
- (NSArray)networkDescriptionArray;
- (NSString)description;
- (NSString)privateDescription;
- (NSURL)lastProbeURL;
- (NSUUID)lastProbeUUID;
- (NWEndpoint)endpoint;
- (NWInterface)interface;
- (NWNetworkDescription)bestAvailableNetworkDescription;
- (NWParameters)parameters;
- (NWPathEvaluator)pathEvaluator;
- (id)descriptionWithIndent:(int)a3 showFullContent:(BOOL)a4;
- (int64_t)status;
- (unint64_t)hash;
- (unsigned)mID;
- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7;
- (void)dealloc;
- (void)evaluateStartingAtIndex:(unint64_t)a3 probeUUID:(id)a4 probeWasSuccessful:(BOOL)a5;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setBestAvailableNetworkDescription:(id)a3;
- (void)setEndpoint:(id)a3;
- (void)setInterface:(id)a3;
- (void)setLastProbeURL:(id)a3;
- (void)setLastProbeUUID:(id)a3;
- (void)setMID:(unsigned int)a3;
- (void)setNetworkDescriptionArray:(id)a3;
- (void)setParameters:(id)a3;
- (void)setPathEvaluator:(id)a3;
- (void)setStatus:(int64_t)a3;
@end

@implementation NWMonitor

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  id v4 = a3;
  if (([v4 isEqualToString:@"status"] & 1) != 0
    || ([v4 isEqualToString:@"bestAvailableNetworkDescription"] & 1) != 0)
  {
    unsigned __int8 v5 = 0;
  }

  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___NWMonitor;
    unsigned __int8 v5 = objc_msgSendSuper2(&v7, sel_automaticallyNotifiesObserversForKey_, v4);
  }

  return v5;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    uint64_t v2 = [MEMORY[0x1896078B8] weakObjectsHashTable];
    v3 = (void *)savedMonitors;
    savedMonitors = v2;

    uint64_t v4 = objc_opt_new();
    unsigned __int8 v5 = (void *)savedMonitorsLock;
    savedMonitorsLock = v4;
  }

+ (id)copySavedMonitorForNetworkDescriptionArray:(id)a3 endpoint:(id)a4 parameters:(id)a5
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = (id)savedMonitorsLock;
  objc_sync_enter(v10);
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v11 = (id)savedMonitors;
  id v12 = (id)[v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v18;
    while (2)
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v11);
        }
        v15 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
        if (objc_msgSend( v15,  "matchesNetworkDescriptionArray:endpoint:parameters:",  v7,  v8,  v9,  (void)v17))
        {
          id v12 = v15;
          goto LABEL_11;
        }
      }

      id v12 = (id)[v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }

+ (void)saveMonitor:(id)a3
{
  id v4 = a3;
  id v3 = (id)savedMonitorsLock;
  objc_sync_enter(v3);
  ++saveMonitor__sMonitorID;
  objc_msgSend(v4, "setMID:");
  [(id)savedMonitors addObject:v4];
  objc_sync_exit(v3);
}

+ (NWMonitor)monitorWithNetworkDescription:(id)a3 endpoint:(id)a4 parameters:(id)a5
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  nw_allow_use_of_dispatch_internal();
  if (!v8)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v13 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    v28 = "+[NWMonitor monitorWithNetworkDescription:endpoint:parameters:]";
    v14 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v24 = 0;
    if (__nwlog_fault(v14, &type, &v24))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v15 = (os_log_s *)(id)gLogObj;
        os_log_type_t v16 = type;
        if (!os_log_type_enabled(v15, type)) {
          goto LABEL_20;
        }
        *(_DWORD *)buf = 136446210;
        v28 = "+[NWMonitor monitorWithNetworkDescription:endpoint:parameters:]";
        __int128 v17 = "%{public}s called with null networkDescription";
LABEL_18:
        uint64_t v22 = v15;
        os_log_type_t v23 = v16;
        goto LABEL_19;
      }

      if (!v24)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v15 = (os_log_s *)(id)gLogObj;
        os_log_type_t v16 = type;
        if (!os_log_type_enabled(v15, type)) {
          goto LABEL_20;
        }
        *(_DWORD *)buf = 136446210;
        v28 = "+[NWMonitor monitorWithNetworkDescription:endpoint:parameters:]";
        __int128 v17 = "%{public}s called with null networkDescription, backtrace limit exceeded";
        goto LABEL_18;
      }

      backtrace_string = (char *)__nw_create_backtrace_string();
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v15 = (os_log_s *)(id)gLogObj;
      os_log_type_t v19 = type;
      BOOL v20 = os_log_type_enabled(v15, type);
      if (!backtrace_string)
      {
        if (!v20)
        {
LABEL_20:

          if (!v14) {
            goto LABEL_14;
          }
          goto LABEL_13;
        }

        *(_DWORD *)buf = 136446210;
        v28 = "+[NWMonitor monitorWithNetworkDescription:endpoint:parameters:]";
        __int128 v17 = "%{public}s called with null networkDescription, no backtrace";
        uint64_t v22 = v15;
        os_log_type_t v23 = v19;
LABEL_19:
        _os_log_impl(&dword_181A5C000, v22, v23, v17, buf, 0xCu);
        goto LABEL_20;
      }

      if (v20)
      {
        *(_DWORD *)buf = 136446466;
        v28 = "+[NWMonitor monitorWithNetworkDescription:endpoint:parameters:]";
        __int16 v29 = 2082;
        v30 = backtrace_string;
        _os_log_impl( &dword_181A5C000,  v15,  v19,  "%{public}s called with null networkDescription, dumping backtrace:%{public}s",  buf,  0x16u);
      }

      free(backtrace_string);
    }

    if (!v14)
    {
LABEL_14:
      id v12 = 0LL;
      goto LABEL_15;
    }

+ (NWMonitor)monitorWithNetworkDescriptionArray:(id)a3 endpoint:(id)a4 parameters:(id)a5
{
  uint64_t v84 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  nw_allow_use_of_dispatch_internal();
  if (!v8)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v17 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    v78 = "+[NWMonitor monitorWithNetworkDescriptionArray:endpoint:parameters:]";
    __int128 v18 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v75 = 0;
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      os_log_type_t v19 = (os_log_s *)(id)gLogObj;
      os_log_type_t v20 = type;
      if (!os_log_type_enabled(v19, type)) {
        goto LABEL_49;
      }
      *(_DWORD *)buf = 136446210;
      v78 = "+[NWMonitor monitorWithNetworkDescriptionArray:endpoint:parameters:]";
      v21 = "%{public}s called with null networkDescriptionArray";
    }

    else
    {
      if (v75)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        os_log_type_t v19 = (os_log_s *)(id)gLogObj;
        os_log_type_t v31 = type;
        BOOL v32 = os_log_type_enabled(v19, type);
        if (backtrace_string)
        {
          if (v32)
          {
            *(_DWORD *)buf = 136446466;
            v78 = "+[NWMonitor monitorWithNetworkDescriptionArray:endpoint:parameters:]";
            __int16 v79 = 2082;
            v80 = (const __CFString *)backtrace_string;
            v33 = "%{public}s called with null networkDescriptionArray, dumping backtrace:%{public}s";
LABEL_35:
            v35 = v19;
            os_log_type_t v36 = v31;
            uint32_t v37 = 22;
LABEL_36:
            _os_log_impl(&dword_181A5C000, v35, v36, v33, buf, v37);
          }

+ (id)mainOperationQueue
{
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __31__NWMonitor_mainOperationQueue__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (mainOperationQueue_opQueueToken != -1) {
    dispatch_once(&mainOperationQueue_opQueueToken, block);
  }
  return (id)mainOperationQueue_opQueue;
}

+ (id)queue
{
  if (queue_onceToken != -1) {
    dispatch_once(&queue_onceToken, &__block_literal_global_10524);
  }
  return (id)queue_mQueue;
}

void __18__NWMonitor_queue__block_invoke()
{
  uint64_t v2 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.network.monitor_queue", v2);
  v1 = (void *)queue_mQueue;
  queue_mQueue = (uint64_t)v0;
}

void __31__NWMonitor_mainOperationQueue__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x189607988]);
  v1 = (void *)mainOperationQueue_opQueue;
  mainOperationQueue_opQueue = (uint64_t)v0;

  [(id)objc_opt_class() queue];
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [(id)mainOperationQueue_opQueue setUnderlyingQueue:v2];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v10 = (os_log_s *)(id)gLogObj;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136446722;
      uint64_t v13 = "-[NWMonitor observeValueForKeyPath:ofObject:change:context:]";
      __int16 v14 = 1024;
      unsigned int v15 = -[NWMonitor mID](self, "mID");
      __int16 v16 = 2114;
      id v17 = v9;
      id v11 = "%{public}s %u invalid object %{public}@";
LABEL_8:
      _os_log_impl(&dword_181A5C000, v10, OS_LOG_TYPE_ERROR, v11, (uint8_t *)&v12, 0x1Cu);
    }

- (void)evaluateStartingAtIndex:(unint64_t)a3 probeUUID:(id)a4 probeWasSuccessful:(BOOL)a5
{
  id v8 = a4;
  [(id)objc_opt_class() queue];
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = __66__NWMonitor_evaluateStartingAtIndex_probeUUID_probeWasSuccessful___block_invoke;
  v11[3] = &unk_189BB7450;
  id v12 = v8;
  uint64_t v13 = self;
  unint64_t v14 = a3;
  BOOL v15 = a5;
  id v10 = v8;
  dispatch_async(v9, v11);
}

- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  id v8 = (void (**)(id, void))a7;
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  id v9 = (os_log_s *)(id)gLogObj;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136446466;
    id v11 = "-[NWMonitor URLSession:task:willPerformHTTPRedirection:newRequest:completionHandler:]";
    __int16 v12 = 1024;
    unsigned int v13 = -[NWMonitor mID](self, "mID");
    _os_log_impl( &dword_181A5C000,  v9,  OS_LOG_TYPE_DEFAULT,  "%{public}s %u received a redirect on probe URL request, not following redirect",  (uint8_t *)&v10,  0x12u);
  }

  v8[2](v8, 0LL);
}

- (void)dealloc
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 removeObserver:self forKeyPath:@"path"];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NWMonitor;
  -[NWMonitor dealloc](&v4, sel_dealloc);
}

- (BOOL)matchesNetworkDescriptionArray:(id)a3 endpoint:(id)a4 parameters:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  -[NWMonitor networkDescriptionArray](self, "networkDescriptionArray");
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  int v12 = [v11 isEqualToArray:v10];

  if (v12)
  {
    -[NWMonitor parameters](self, "parameters");
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    id v14 = v9;
    id v15 = v14;
    if (v13 != v14 && v13 && v14)
    {
      char v16 = [v13 isEqual:v15];

      if ((v16 & 1) != 0)
      {
LABEL_7:
        -[NWMonitor endpoint](self, "endpoint");
        id v13 = (id)objc_claimAutoreleasedReturnValue();
        id v17 = v8;
        id v15 = v17;
        char v18 = v13 == v17;
        if (v13 == v17 || !v13 || !v17) {
          goto LABEL_15;
        }
        if ([v13 isMemberOfClass:objc_opt_class()])
        {
          char v18 = [v13 isEqual:v15];
LABEL_15:

          goto LABEL_16;
        }

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && [v4 isMemberOfClass:objc_opt_class()])
  {
    id v5 = v4;
    [v5 networkDescriptionArray];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 endpoint];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 parameters];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();

    BOOL v9 = -[NWMonitor matchesNetworkDescriptionArray:endpoint:parameters:]( self,  "matchesNetworkDescriptionArray:endpoint:parameters:",  v6,  v7,  v8);
  }

  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 hash];
  -[NWMonitor endpoint](self, "endpoint");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 hash] ^ v4;
  -[NWMonitor parameters](self, "parameters");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

- (id)descriptionWithIndent:(int)a3 showFullContent:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  id v7 = objc_alloc_init(MEMORY[0x189607940]);
  if (v4) {
    objc_msgSend(v7, "appendPrettyInt:withName:indent:", -[NWMonitor mID](self, "mID"), @"monitorID", v5);
  }
  unint64_t v8 = -[NWMonitor status](self, "status");
  if (v8 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown[%ld]", v8);
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    BOOL v9 = (void *)*((void *)&off_189BB74B0 + v8);
  }

  [v7 appendPrettyObject:v9 withName:@"status" indent:v5 showFullContent:v4];

  -[NWMonitor endpoint](self, "endpoint");
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v10 withName:@"endpoint" indent:v5 showFullContent:v4];

  -[NWMonitor parameters](self, "parameters");
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v11 withName:@"parameters" indent:v5 showFullContent:v4];

  -[NWMonitor networkDescriptionArray](self, "networkDescriptionArray");
  int v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v12 withName:@"descriptions" indent:v5 showFullContent:v4];

  -[NWMonitor bestAvailableNetworkDescription](self, "bestAvailableNetworkDescription");
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v13 withName:@"current" indent:v5 showFullContent:v4];

  return v7;
}

- (NSString)description
{
  return (NSString *) -[NWMonitor descriptionWithIndent:showFullContent:]( self,  "descriptionWithIndent:showFullContent:",  0LL,  0LL);
}

- (NSString)privateDescription
{
  return (NSString *) -[NWMonitor descriptionWithIndent:showFullContent:]( self,  "descriptionWithIndent:showFullContent:",  0LL,  1LL);
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (NWNetworkDescription)bestAvailableNetworkDescription
{
  return (NWNetworkDescription *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setBestAvailableNetworkDescription:(id)a3
{
}

- (NSArray)networkDescriptionArray
{
  return (NSArray *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setNetworkDescriptionArray:(id)a3
{
}

- (NWEndpoint)endpoint
{
  return (NWEndpoint *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setEndpoint:(id)a3
{
}

- (NWParameters)parameters
{
  return (NWParameters *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setParameters:(id)a3
{
}

- (NWPathEvaluator)pathEvaluator
{
  return (NWPathEvaluator *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setPathEvaluator:(id)a3
{
}

- (NSUUID)lastProbeUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setLastProbeUUID:(id)a3
{
}

- (NSURL)lastProbeURL
{
  return (NSURL *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setLastProbeURL:(id)a3
{
}

- (NWInterface)interface
{
  return (NWInterface *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setInterface:(id)a3
{
}

- (unsigned)mID
{
  return self->_mID;
}

- (void)setMID:(unsigned int)a3
{
  self->_mID = a3;
}

- (void).cxx_destruct
{
}

void __66__NWMonitor_evaluateStartingAtIndex_probeUUID_probeWasSuccessful___block_invoke(uint64_t a1)
{
  uint64_t v87 = *MEMORY[0x1895F89C0];
  id v2 = *(id *)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  if (v2)
  {
    [v3 lastProbeUUID];
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue();
    char v5 = [v2 isEqual:v4];

    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    uint64_t v6 = (os_log_s *)(id)gLogObj;
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
    if ((v5 & 1) == 0)
    {
      if (v7)
      {
        int v38 = [*(id *)(a1 + 40) mID];
        [v2 UUIDString];
        v39 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        [*(id *)(a1 + 40) lastProbeUUID];
        id v40 = (void *)objc_claimAutoreleasedReturnValue();
        [v40 UUIDString];
        os_log_type_t v41 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136446978;
        v78 = "-[NWMonitor evaluateStartingAtIndex:probeUUID:probeWasSuccessful:]_block_invoke";
        __int16 v79 = 1024;
        int v80 = v38;
        __int16 v81 = 2114;
        v82 = v39;
        __int16 v83 = 2114;
        uint64_t v84 = v41;
        _os_log_impl( &dword_181A5C000,  v6,  OS_LOG_TYPE_DEBUG,  "%{public}s %u received stale probe %{public}@ (current one is %{public}@)",  buf,  0x26u);
      }

      goto LABEL_43;
    }

    if (v7)
    {
      int v8 = [*(id *)(a1 + 40) mID];
      [v2 UUIDString];
      BOOL v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136446722;
      v78 = "-[NWMonitor evaluateStartingAtIndex:probeUUID:probeWasSuccessful:]_block_invoke";
      __int16 v79 = 1024;
      int v80 = v8;
      __int16 v81 = 2114;
      v82 = v9;
      _os_log_impl(&dword_181A5C000, v6, OS_LOG_TYPE_DEBUG, "%{public}s %u received valid probe %{public}@", buf, 0x1Cu);
    }
  }

  else
  {
    [v3 pathEvaluator];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 path];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 privateDescription];
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (gLogDatapath)
    {
      __nwlog_obj();
      v65 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
      {
        int v66 = [*(id *)(a1 + 40) mID];
        *(_DWORD *)buf = 136446722;
        v78 = "-[NWMonitor evaluateStartingAtIndex:probeUUID:probeWasSuccessful:]_block_invoke";
        __int16 v79 = 1024;
        int v80 = v66;
        __int16 v81 = 2114;
        v82 = v6;
        _os_log_impl( &dword_181A5C000,  v65,  OS_LOG_TYPE_DEBUG,  "%{public}s %u received path change %{public}@",  buf,  0x1Cu);
      }
    }
  }

  [*(id *)(a1 + 40) networkDescriptionArray];
  int v12 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v13 = [v12 count];

  [*(id *)(a1 + 40) pathEvaluator];
  id v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 path];
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  [*(id *)(a1 + 40) interface];
  id v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[os_log_s interface](v6, "interface");
  char v16 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 40) setInterface:v16];

  unint64_t v17 = *(void *)(a1 + 48);
  if (-[os_log_s status](v6, "status") != 1) {
    goto LABEL_9;
  }
  uint64_t v18 = [*(id *)(a1 + 40) interface];
  if (!v18
    || (os_log_type_t v19 = (void *)v18,
        [*(id *)(a1 + 40) interface],
        os_log_type_t v20 = (void *)objc_claimAutoreleasedReturnValue(),
        char v21 = [v20 isDeepEqual:v15],
        v20,
        v19,
        (v21 & 1) == 0))
  {
LABEL_9:
    [*(id *)(a1 + 40) privateDescription];
    id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (gLogDatapath)
    {
      __nwlog_obj();
      v63 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
      {
        int v64 = [*(id *)(a1 + 40) mID];
        *(_DWORD *)buf = 136446722;
        v78 = "-[NWMonitor evaluateStartingAtIndex:probeUUID:probeWasSuccessful:]_block_invoke";
        __int16 v79 = 1024;
        int v80 = v64;
        __int16 v81 = 2114;
        v82 = v22;
        _os_log_impl( &dword_181A5C000,  v63,  OS_LOG_TYPE_DEBUG,  "%{public}s %u resetting self to unsatisfied: %{public}@",  buf,  0x1Cu);
      }
    }

    [*(id *)(a1 + 40) setLastProbeUUID:0];
    [*(id *)(a1 + 40) setLastProbeURL:0];

    if (v13)
    {
      for (uint64_t i = 0LL; i != v13; ++i)
      {
        [*(id *)(a1 + 40) networkDescriptionArray];
        char v24 = (void *)objc_claimAutoreleasedReturnValue();
        [v24 objectAtIndexedSubscript:i];
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        [v25 setState:0];
      }
    }

    unint64_t v17 = 0LL;
    id v2 = 0LL;
  }

  if (v17 >= v13)
  {
    id v36 = 0LL;
    uint64_t v37 = 2LL;
LABEL_37:
    [*(id *)(a1 + 40) setLastProbeUUID:0];
    [*(id *)(a1 + 40) setLastProbeURL:0];
    [*(id *)(a1 + 40) bestAvailableNetworkDescription];
    id v45 = (id)objc_claimAutoreleasedReturnValue();

    BOOL v46 = v36 != v45;
    if (v36 != v45 || v37 != [*(id *)(a1 + 40) status])
    {
      if (NWCopyInternalQueue_init_once != -1) {
        dispatch_once(&NWCopyInternalQueue_init_once, &__block_literal_global_62911);
      }
      os_log_type_t v47 = (dispatch_queue_s *)(id)NWCopyInternalQueue_nwQueue;
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = __66__NWMonitor_evaluateStartingAtIndex_probeUUID_probeWasSuccessful___block_invoke_31;
      block[3] = &unk_189BB7450;
      BOOL v72 = v46;
      block[4] = *(void *)(a1 + 40);
      id v36 = v36;
      id v70 = v36;
      uint64_t v71 = v37;
      dispatch_async(v47, block);
    }

    goto LABEL_42;
  }

  v67 = v15;
  id v26 = &qword_18C45F000;
  BOOL v68 = v6;
  while (1)
  {
    [*(id *)(a1 + 40) networkDescriptionArray];
    id v27 = (void *)objc_claimAutoreleasedReturnValue();
    [v27 objectAtIndexedSubscript:v17];
    os_log_type_t v28 = (void *)objc_claimAutoreleasedReturnValue();

    [v28 updateStateWithPath:v6];
    uint64_t v29 = [v28 state];
    if (v29 == 2) {
      break;
    }
    if (v29 == 1)
    {
      id v36 = v28;
LABEL_36:

      uint64_t v37 = 1LL;
      goto LABEL_37;
    }

void __66__NWMonitor_evaluateStartingAtIndex_probeUUID_probeWasSuccessful___block_invoke_28( uint64_t a1,  void *a2,  void *a3,  void *a4)
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (v9)
  {
    [v9 domain];
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    if ([v11 isEqualToString:*MEMORY[0x189607740]])
    {
      uint64_t v12 = [v10 code];

      if (v12 != -1202) {
        goto LABEL_7;
      }
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      id v11 = (id)gLogObj;
      if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = 136446210;
        os_log_type_t v20 = "-[NWMonitor evaluateStartingAtIndex:probeUUID:probeWasSuccessful:]_block_invoke";
        _os_log_impl( &dword_181A5C000,  (os_log_t)v11,  OS_LOG_TYPE_DEFAULT,  "%{public}s probe URL failed due to untrusted server certificate",  (uint8_t *)&v19,  0xCu);
      }
    }
  }

uint64_t __66__NWMonitor_evaluateStartingAtIndex_probeUUID_probeWasSuccessful___block_invoke_31(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  if (*(_BYTE *)(a1 + 56))
  {
    [*(id *)(a1 + 32) bestAvailableNetworkDescription];
    id v2 = (void *)objc_claimAutoreleasedReturnValue();
    [v2 privateDescription];
    id v3 = (void *)objc_claimAutoreleasedReturnValue();

    [*(id *)(a1 + 40) privateDescription];
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue();
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    char v5 = (os_log_s *)(id)gLogObj;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      int v6 = [*(id *)(a1 + 32) mID];
      *(_DWORD *)buf = 136446978;
      uint64_t v17 = "-[NWMonitor evaluateStartingAtIndex:probeUUID:probeWasSuccessful:]_block_invoke";
      __int16 v18 = 1024;
      int v19 = v6;
      __int16 v20 = 2114;
      id v21 = v3;
      __int16 v22 = 2114;
      __int16 v23 = v4;
      _os_log_impl( &dword_181A5C000,  v5,  OS_LOG_TYPE_DEBUG,  "%{public}s %u updating best description from %{public}@ to %{public}@",  buf,  0x26u);
    }

    [*(id *)(a1 + 32) willChangeValueForKey:@"bestAvailableNetworkDescription"];
    [*(id *)(a1 + 32) setBestAvailableNetworkDescription:*(void *)(a1 + 40)];
  }

  uint64_t v7 = *(void *)(a1 + 48);
  uint64_t result = [*(id *)(a1 + 32) status];
  if (v7 != result)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v9 = (os_log_s *)(id)gLogObj;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      int v10 = [*(id *)(a1 + 32) mID];
      unint64_t v11 = [*(id *)(a1 + 32) status];
      if (v11 >= 3)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"Unknown[%ld]", v11);
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        uint64_t v12 = (void *)*((void *)&off_189BB74B0 + v11);
      }

      id v13 = v12;
      unint64_t v14 = *(void *)(a1 + 48);
      if (v14 >= 3)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"Unknown[%ld]", *(void *)(a1 + 48));
        id v15 = (void *)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        id v15 = (void *)*((void *)&off_189BB74B0 + v14);
      }

      *(_DWORD *)buf = 136446978;
      uint64_t v17 = "-[NWMonitor evaluateStartingAtIndex:probeUUID:probeWasSuccessful:]_block_invoke";
      __int16 v18 = 1024;
      int v19 = v10;
      __int16 v20 = 2114;
      id v21 = v13;
      __int16 v22 = 2114;
      __int16 v23 = v15;
      _os_log_impl( &dword_181A5C000,  v9,  OS_LOG_TYPE_DEBUG,  "%{public}s %u updating state from %{public}@ to %{public}@",  buf,  0x26u);
    }

    [*(id *)(a1 + 32) willChangeValueForKey:@"status"];
    [*(id *)(a1 + 32) setStatus:*(void *)(a1 + 48)];
    uint64_t result = [*(id *)(a1 + 32) didChangeValueForKey:@"status"];
  }

  if (*(_BYTE *)(a1 + 56)) {
    return [*(id *)(a1 + 32) didChangeValueForKey:@"bestAvailableNetworkDescription"];
  }
  return result;
}

@end