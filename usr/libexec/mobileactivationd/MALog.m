@interface MALog
+ (id)getSharedInstance;
- ($408BE20ABC6783163DDCA7AF1B52A3E6)logHandle;
- (MALog)init;
- (OS_dispatch_queue)queue;
- (void)dealloc;
- (void)deleteExpiredLogFiles;
- (void)logMessage:(id)a3 toSyslog:(BOOL)a4;
- (void)setLogHandle:(id *)a3;
- (void)setQueue:(id)a3;
@end

@implementation MALog

+ (id)getSharedInstance
{
  if (getSharedInstance_once != -1) {
    dispatch_once(&getSharedInstance_once, &__block_literal_global);
  }
  return (id)getSharedInstance_sharedInstance;
}

void __26__MALog_getSharedInstance__block_invoke(id a1)
{
  v1 = objc_opt_new(&OBJC_CLASS___MALog);
  v2 = (void *)getSharedInstance_sharedInstance;
  getSharedInstance_sharedInstance = (uint64_t)v1;
}

- (MALog)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MALog;
  v2 = -[MALog init](&v8, "init");
  if (v2
    && (v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM),
        dispatch_queue_t v4 = dispatch_queue_create("com.apple.mobileactivationd.log", v3),
        queue = v2->_queue,
        v2->_queue = (OS_dispatch_queue *)v4,
        queue,
        v3,
        !v2->_queue))
  {
    v6 = 0LL;
  }

  else
  {
    v6 = v2;
  }

  return v6;
}

- (void)dealloc
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3254779904LL;
  block[2] = __16__MALog_dealloc__block_invoke;
  block[3] = &__block_descriptor_40_e8_32s_e5_v8__0l;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)queue, block);
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MALog;
  -[MALog dealloc](&v4, "dealloc");
}

uint64_t __16__MALog_dealloc__block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 8LL);
  if (result) {
    return MOLogClose();
  }
  return result;
}

- (void)deleteExpiredLogFiles
{
  v3 = -[MALog queue](self, "queue");
  block[0] = _NSConcreteStackBlock;
  block[1] = 3254779904LL;
  block[2] = __30__MALog_deleteExpiredLogFiles__block_invoke;
  block[3] = &__block_descriptor_40_e8_32s_e5_v8__0l;
  block[4] = self;
  dispatch_async((dispatch_queue_t)v3, block);
}

void __30__MALog_deleteExpiredLogFiles__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) logHandle])
  {
    MOLogClose([*(id *)(a1 + 32) logHandle]);
    [*(id *)(a1 + 32) setLogHandle:0];
  }

  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  obj = copy_sorted_file_list(gPersistentLogFilePath[0]);
  id v2 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v30,  v40,  16LL);
  if (!v2)
  {
    v23 = 0LL;
    goto LABEL_24;
  }

  id v4 = v2;
  id v5 = 0LL;
  v27 = 0LL;
  uint64_t v6 = *(void *)v31;
  NSURLResourceKey v7 = NSURLContentModificationDateKey;
  objc_super v8 = &CCDigest_ptr;
  *(void *)&__int128 v3 = 138412546LL;
  __int128 v24 = v3;
  do
  {
    v9 = 0LL;
    id v25 = v4;
    do
    {
      v10 = v5;
      if (*(void *)v31 != v6) {
        objc_enumerationMutation(obj);
      }
      v11 = *(void **)(*((void *)&v30 + 1) + 8LL * (void)v9);
      id v29 = 0LL;
      objc_msgSend(v11, "getResourceValue:forKey:error:", &v29, v7, 0, v24);
      id v5 = v29;

      id v12 = [v8[66] date];
      NSInteger v13 = numberOfDaysBetweenDates(v5, v12);

      if (gPersistentLogTTL < 0)
      {
        v21 = copyLoggingHandle();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
          __30__MALog_deleteExpiredLogFiles__block_invoke_cold_1(v38, v39, v21);
        }
      }

      else
      {
        uint64_t v14 = v6;
        v15 = v8;
        v16 = copyLoggingHandle();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          id v17 = [v11 path];
          *(_DWORD *)buf = 138412802;
          id v35 = v17;
          __int16 v36 = 1024;
          LODWORD(v37[0]) = gPersistentLogTTL;
          WORD2(v37[0]) = 2048;
          *(void *)((char *)v37 + 6) = v13;
          _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Log file (%@) is greater than %d days old (%lld), deleting.",  buf,  0x1Cu);
        }

        v18 = +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager");
        id v28 = v27;
        unsigned __int8 v19 = -[NSFileManager removeItemAtURL:error:](v18, "removeItemAtURL:error:", v11, &v28);
        id v20 = v28;

        if ((v19 & 1) != 0)
        {
          v27 = v20;
          objc_super v8 = v15;
          uint64_t v6 = v14;
          NSURLResourceKey v7 = NSURLContentModificationDateKey;
          id v4 = v25;
          goto LABEL_20;
        }

        v21 = copyLoggingHandle();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
        {
          id v22 = [v11 path];
          *(_DWORD *)buf = v24;
          id v35 = v22;
          __int16 v36 = 2112;
          v37[0] = v20;
          _os_log_fault_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_FAULT, "Failed to delete %@: %@", buf, 0x16u);
        }

        v27 = v20;
        objc_super v8 = v15;
        uint64_t v6 = v14;
        NSURLResourceKey v7 = NSURLContentModificationDateKey;
        id v4 = v25;
      }

LABEL_20:
      v9 = (char *)v9 + 1;
    }

    while (v4 != v9);
    id v4 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v30,  v40,  16LL);
  }

  while (v4);

  v23 = v27;
LABEL_24:
}

- (void)logMessage:(id)a3 toSyslog:(BOOL)a4
{
  id v6 = a3;
  NSURLResourceKey v7 = -[MALog queue](self, "queue");
  block[0] = _NSConcreteStackBlock;
  block[1] = 3254779904LL;
  block[2] = __29__MALog_logMessage_toSyslog___block_invoke;
  block[3] = &__block_descriptor_49_e8_32s40s_e5_v8__0l;
  BOOL v11 = a4;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async((dispatch_queue_t)v7, block);
}

void __29__MALog_logMessage_toSyslog___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) logHandle]) {
    goto LABEL_4;
  }
  objc_msgSend(*(id *)(a1 + 32), "setLogHandle:", MOLogOpen(objc_msgSend(gPersistentLogLabel, "UTF8String"), 3));
  if ([*(id *)(a1 + 32) logHandle])
  {
    id v2 = [*(id *)(a1 + 32) logHandle];
    id v3 = -[__CFString stringByAppendingPathComponent:]( gPersistentLogFilePath[0], "stringByAppendingPathComponent:", gPersistentLogFileName[0]);
    id v4 = [v3 UTF8String];
    MOLogEnableDiskLogging(v2, v4, gPersistentLogMaxFiles, gPersistentLogSizeBytes);

LABEL_4:
    uint64_t LogLevel = MOLogGetLogLevel([gPersistentLogLabel UTF8String]);
    if ((_DWORD)LogLevel == -1)
    {
      if (*(_BYTE *)(a1 + 48)) {
        uint64_t LogLevel = 5LL;
      }
      else {
        uint64_t LogLevel = 7LL;
      }
    }

    id v6 = [*(id *)(a1 + 32) logHandle];
    MOLogWrite(v6, LogLevel, [gPersistentLogLabel UTF8String], @"%@");
    return;
  }

  NSURLResourceKey v7 = copyLoggingHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
    __29__MALog_logMessage_toSyslog___block_invoke_cold_1(v7);
  }
}

- ($408BE20ABC6783163DDCA7AF1B52A3E6)logHandle
{
  return self->_logHandle;
}

- (void)setLogHandle:(id *)a3
{
  self->_logHandle = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

void __30__MALog_deleteExpiredLogFiles__block_invoke_cold_1(uint8_t *buf, int *a2, os_log_t log)
{
  int v3 = gPersistentLogTTL;
  *(_DWORD *)buf = 67109120;
  *a2 = v3;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "Invalid TTL: %u", buf, 8u);
}

void __29__MALog_logMessage_toSyslog___block_invoke_cold_1(os_log_t log)
{
  int v1 = 138412290;
  id v2 = gPersistentLogLabel;
  _os_log_fault_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_FAULT,  "MOLogOpen failed for %@.",  (uint8_t *)&v1,  0xCu);
}

@end