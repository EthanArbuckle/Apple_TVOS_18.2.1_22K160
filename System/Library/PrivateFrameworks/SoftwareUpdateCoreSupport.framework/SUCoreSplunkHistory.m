@interface SUCoreSplunkHistory
+ (id)sharedHistory;
+ (void)logEventUUID:(id)a3;
- (NSString)lastUUID;
- (OS_dispatch_queue)splunkHistoryQueue;
- (SUCoreSplunkHistory)init;
- (int)lockFD;
- (int)setupLogFile;
- (void)acquireSharedLock;
- (void)dealloc;
- (void)init;
- (void)releaseSharedLock;
- (void)safeWriteEventUUID:(id)a3;
- (void)setLastUUID:(id)a3;
- (void)setLockFD:(int)a3;
@end

@implementation SUCoreSplunkHistory

- (SUCoreSplunkHistory)init
{
  uint64_t v47 = *MEMORY[0x1895F89C0];
  v40.receiver = self;
  v40.super_class = (Class)&OBJC_CLASS___SUCoreSplunkHistory;
  v2 = -[SUCoreSplunkHistory init](&v40, sel_init);
  v3 = v2;
  if (!v2) {
    goto LABEL_15;
  }
  v2->_lockFD = -1;
  lastUUID = v2->_lastUUID;
  v2->_lastUUID = 0LL;

  id v5 = objc_alloc(NSString);
  v6 = +[SUCore sharedCore](&OBJC_CLASS___SUCore, "sharedCore");
  [v6 commonDomain];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v8 = [v5 initWithFormat:@"%@.%@", v7, @"core.splunk.history"];
  v9 = (const char *)[v8 UTF8String];
  dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v10 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
  dispatch_queue_t v11 = dispatch_queue_create(v9, v10);
  splunkHistoryQueue = v3->_splunkHistoryQueue;
  v3->_splunkHistoryQueue = (OS_dispatch_queue *)v11;

  if (!v3->_splunkHistoryQueue)
  {
    +[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag");
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    id v25 = objc_alloc(NSString);
    v26 = +[SUCore sharedCore](&OBJC_CLASS___SUCore, "sharedCore");
    [v26 commonDomain];
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)[v25 initWithFormat:@"unable to create dispatch queue domain(%@.%@)", v27, @"core.splunk.history"];
    [v20 trackError:@"[SPLUNK_HISTORY] INIT" forReason:v28 withResult:8100 withError:0];

LABEL_22:
    v31 = 0LL;
    goto LABEL_23;
  }
  v13 = +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
  [v13 oslog];
  v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = +[SUCore sharedCore](&OBJC_CLASS___SUCore, "sharedCore");
    [v15 commonDomain];
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v44 = v16;
    __int16 v45 = 2114;
    v46 = @"core.splunk.history";
    _os_log_impl( &dword_187139000,  v14,  OS_LOG_TYPE_DEFAULT,  "[SPLUNK_HISTORY] DISPATCH | created dispatch queue domain(%{public}@.%{public}@)",  buf,  0x16u);
  }

  [MEMORY[0x1896078A8] defaultManager];
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  char v18 = [v17 fileExistsAtPath:@"/private/var/MobileSoftwareUpdate/Controller/SplunkHistory/"];

  if ((v18 & 1) == 0)
  {
    uint64_t v19 = *MEMORY[0x1896074D0];
    v41[0] = *MEMORY[0x1896074F0];
    v41[1] = v19;
    v42[0] = @"mobile";
    v42[1] = @"mobile";
    v41[2] = *MEMORY[0x189607530];
    v42[2] = *MEMORY[0x189607538];
    [MEMORY[0x189603F68] dictionaryWithObjects:v42 forKeys:v41 count:3];
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x1896078A8] defaultManager];
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    id v39 = 0LL;
    [v21 createDirectoryAtPath:@"/private/var/MobileSoftwareUpdate/Controller/SplunkHistory/" withIntermediateDirectories:1 attributes:v20 error:&v39];
    v22 = (os_log_s *)v39;

    if (v22)
    {
      v23 = +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
      [v23 oslog];
      v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        -[SUCoreSplunkHistory init].cold.1((uint64_t)v22, v24);
      }

      goto LABEL_21;
    }
  }

  id v20 = [@"/private/var/MobileSoftwareUpdate/Controller/SplunkHistory/" stringByAppendingPathComponent:@"SUCoreSplunkHistory.lock"];
  v29 = (const char *)[v20 cStringUsingEncoding:4];
  if (!v29)
  {
    v32 = +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
    [v32 oslog];
    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v33 = "[SPLUNK_HISTORY] INIT | failed creating file lock";
      v34 = v22;
      uint32_t v35 = 2;
LABEL_20:
      _os_log_impl(&dword_187139000, v34, OS_LOG_TYPE_DEFAULT, v33, buf, v35);
    }

- (void)dealloc
{
  int lockFD = self->_lockFD;
  if (lockFD != -1)
  {
    close(lockFD);
    self->_int lockFD = -1;
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SUCoreSplunkHistory;
  -[SUCoreSplunkHistory dealloc](&v4, sel_dealloc);
}

+ (id)sharedHistory
{
  if (sharedHistory_reporterOnce != -1) {
    dispatch_once(&sharedHistory_reporterOnce, &__block_literal_global_1);
  }
  return (id)sharedHistory_logger;
}

void __36__SUCoreSplunkHistory_sharedHistory__block_invoke()
{
  v0 = objc_alloc_init(&OBJC_CLASS___SUCoreSplunkHistory);
  v1 = (void *)sharedHistory_logger;
  sharedHistory_logger = (uint64_t)v0;
}

+ (void)logEventUUID:(id)a3
{
  id v3 = a3;
  +[SUCoreSplunkHistory sharedHistory](&OBJC_CLASS___SUCoreSplunkHistory, "sharedHistory");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 safeWriteEventUUID:v3];
}

- (void)acquireSharedLock
{
}

- (void)releaseSharedLock
{
}

- (int)setupLogFile
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  id v2 = [@"/private/var/MobileSoftwareUpdate/Controller/SplunkHistory/" stringByAppendingPathComponent:@"SUCoreSplunkHistory.log"];
  id v3 = (const char *)[v2 cStringUsingEncoding:4];
  if (!v3)
  {
    v10 = +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
    [v10 oslog];
    dispatch_queue_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v12 = "[SPLUNK_HISTORY] SETUP | failed creating file name";
      v13 = v11;
      uint32_t v14 = 2;
LABEL_10:
      _os_log_impl(&dword_187139000, v13, OS_LOG_TYPE_DEFAULT, v12, buf, v14);
    }

- (void)safeWriteEventUUID:(id)a3
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  uint64_t v5 = [objc_alloc(MEMORY[0x189607AB8]) initWithUUIDString:v4];
  int v6 = (void *)v5;
  if (!v4 || !v5)
  {
    v7 = +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
    [v7 oslog];
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v4;
      _os_log_impl( &dword_187139000,  v8,  OS_LOG_TYPE_DEFAULT,  "[SPLUNK_HISTORY] WRITE | wrong format for event UUID %@",  buf,  0xCu);
    }
  }

  -[SUCoreSplunkHistory splunkHistoryQueue](self, "splunkHistoryQueue");
  int v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = __42__SUCoreSplunkHistory_safeWriteEventUUID___block_invoke;
  v11[3] = &unk_189FE8FC0;
  v11[4] = self;
  id v12 = v4;
  id v10 = v4;
  dispatch_async(v9, v11);
}

void __42__SUCoreSplunkHistory_safeWriteEventUUID___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  [*(id *)(a1 + 32) lastUUID];
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  char v3 = [v2 isEqual:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    [*(id *)(a1 + 32) acquireSharedLock];
    int v4 = [*(id *)(a1 + 32) setupLogFile];
    if (v4 == -1)
    {
LABEL_15:
      [*(id *)(a1 + 32) releaseSharedLock];
      return;
    }

    int v5 = v4;
    id v6 = [NSString stringWithFormat:@"%@\n", *(void *)(a1 + 40)];
    v7 = (const char *)[v6 cStringUsingEncoding:4];
    size_t v8 = strlen(v7);
    ssize_t v9 = write(v5, v7, v8);
    if (v9 < 0)
    {
      +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
      id v10 = (void *)objc_claimAutoreleasedReturnValue();
      [v10 oslog];
      dispatch_queue_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = *(void *)(a1 + 40);
        int v13 = *__error();
        *(_DWORD *)buf = 138412546;
        uint64_t v23 = v12;
        __int16 v24 = 1024;
        int v25 = v13;
        id v14 = "[SPLUNK_HISTORY] WRITE | failed writing event UUID %@, errno:%d";
        uint64_t v15 = v11;
        uint32_t v16 = 18;
LABEL_10:
        _os_log_impl(&dword_187139000, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
      }
    }

    else
    {
      if (v9 == v8)
      {
        [*(id *)(a1 + 32) setLastUUID:*(void *)(a1 + 40)];
LABEL_12:
        +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
        [v19 oslog];
        id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v21 = *(void *)(a1 + 40);
          *(_DWORD *)buf = 138412290;
          uint64_t v23 = v21;
          _os_log_impl(&dword_187139000, v20, OS_LOG_TYPE_DEFAULT, "[SPLUNK_HISTORY] WRITE | Wrote UUID %@", buf, 0xCu);
        }

        close(v5);
        goto LABEL_15;
      }

      +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
      [v17 oslog];
      dispatch_queue_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138412290;
        uint64_t v23 = v18;
        id v14 = "[SPLUNK_HISTORY] WRITE | failed writing complete event UUID %@";
        uint64_t v15 = v11;
        uint32_t v16 = 12;
        goto LABEL_10;
      }
    }

    goto LABEL_12;
  }

- (OS_dispatch_queue)splunkHistoryQueue
{
  return self->_splunkHistoryQueue;
}

- (NSString)lastUUID
{
  return self->_lastUUID;
}

- (void)setLastUUID:(id)a3
{
}

- (int)lockFD
{
  return self->_lockFD;
}

- (void)setLockFD:(int)a3
{
  self->_int lockFD = a3;
}

- (void).cxx_destruct
{
}

- (void)init
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  int v2 = 138412546;
  char v3 = @"/private/var/MobileSoftwareUpdate/Controller/SplunkHistory/";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl( &dword_187139000,  a2,  OS_LOG_TYPE_ERROR,  "[SPLUNK_HISTORY] INIT | failed to create history directory at path: %@, error: %@",  (uint8_t *)&v2,  0x16u);
}

@end