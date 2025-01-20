@interface NSFileAccessProcessManager
+ (BOOL)needToManageConnection:(id)a3 forURLs:(id)a4;
- (NSArray)URLs;
- (NSFileAccessProcessManager)initWithClient:(id)a3 queue:(id)a4;
- (id)suspensionHandler;
- (void)_ensureMonitor;
- (void)allowSuspension;
- (void)dealloc;
- (void)invalidate;
- (void)killProcessWithMessage:(id)a3;
- (void)preventSuspensionWithActivityName:(id)a3;
- (void)processSuspended;
- (void)safelySendMessageWithReplyUsingBlock:(id)a3;
- (void)setSuspensionHandler:(id)a3;
- (void)setURLs:(id)a3;
@end

@implementation NSFileAccessProcessManager

+ (BOOL)needToManageConnection:(id)a3 forURLs:(id)a4
{
  uint64_t v43 = *MEMORY[0x1895F89C0];
  if (![a4 count]) {
    return 0;
  }
  if (qword_18C496E08 != -1) {
    dispatch_once(&qword_18C496E08, &__block_literal_global_63);
  }
  if (!off_18C496E00)
  {
    v19 = (os_log_s *)_NSFCProcessMonitorLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buffer = 0;
      _os_log_error_impl( &dword_182EB1000,  v19,  OS_LOG_TYPE_ERROR,  "Could not find SecTaskCopySigningIdentifier symbol",  (uint8_t *)buffer,  2u);
    }

    return 1;
  }

  xpc_connection_get_audit_token();
  uint64_t v5 = *MEMORY[0x189604DD0];
  *(_OWORD *)buffer = v41;
  __int128 v40 = v42;
  v6 = (const __CFString *)off_18C496DF8(v5, buffer);
  CFTypeRef cf = 0LL;
  v7 = (const __CFString *)off_18C496E00(v6, &cf);
  if (!v7)
  {
    v20 = (os_log_s *)_NSFCProcessMonitorLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buffer = 138412290;
      *(void *)&buffer[4] = cf;
      _os_log_error_impl( &dword_182EB1000,  v20,  OS_LOG_TYPE_ERROR,  "Could not get signing identifier: %@",  (uint8_t *)buffer,  0xCu);
    }

    if (cf) {
      CFRelease(cf);
    }
    goto LABEL_41;
  }

  v8 = v7;
  if (!CFStringGetCStringPtr(v7, 0x8000100u) && !CFStringGetCString(v8, buffer, 1024LL, 0x8000100u))
  {
    v25 = (os_log_s *)_NSFCProcessMonitorLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v36 = v8;
      _os_log_error_impl( &dword_182EB1000,  v25,  OS_LOG_TYPE_ERROR,  "Could not convert signing identifier %{public}@",  buf,  0xCu);
    }

void *__61__NSFileAccessProcessManager_needToManageConnection_forURLs___block_invoke()
{
  result = dlopen("/System/Library/Frameworks/Security.framework/Security", 256);
  if (result)
  {
    v1 = result;
    off_18C496DF8 = (uint64_t (*)(void, void))dlsym(result, "SecTaskCreateWithAuditToken");
    result = dlsym(v1, "SecTaskCopySigningIdentifier");
    off_18C496E00 = (uint64_t (*)(void, void))result;
  }

  return result;
}

- (NSFileAccessProcessManager)initWithClient:(id)a3 queue:(id)a4
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NSFileAccessProcessManager;
  v6 = -[NSFileAccessProcessManager init](&v8, sel_init);
  if (v6)
  {
    v6->_connection = (OS_xpc_object *)xpc_retain(a3);
    v6->_pid = xpc_connection_get_pid((xpc_connection_t)a3);
    v6->_queue = (OS_dispatch_queue *)a4;
    dispatch_retain((dispatch_object_t)a4);
  }

  return v6;
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  -[NSFileAccessProcessMonitor removeProcessManager:forPID:]( +[NSFileAccessProcessMonitor sharedInstance](&OBJC_CLASS___NSFileAccessProcessMonitor, "sharedInstance"),  "removeProcessManager:forPID:",  self,  self->_pid);
  connection = self->_connection;
  if (connection) {
    xpc_release(connection);
  }
  queue = (dispatch_object_s *)self->_queue;
  if (queue) {
    dispatch_release(queue);
  }

  id assertionToken = self->_assertionToken;
  if (assertionToken)
  {
    -[_NSFileAccessAsynchronousProcessAssertionScheduler removeAssertionWithToken:]( +[_NSFileAccessAsynchronousProcessAssertionScheduler sharedInstance]( &OBJC_CLASS____NSFileAccessAsynchronousProcessAssertionScheduler,  "sharedInstance"),  "removeAssertionWithToken:",  self->_assertionToken);
    id assertionToken = self->_assertionToken;
  }

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NSFileAccessProcessManager;
  -[NSFileAccessProcessManager dealloc](&v6, sel_dealloc);
}

- (void)_ensureMonitor
{
  if ((self->_suspensionHandler || self->_pendingMessageCount >= 1)
    && +[NSFileAccessProcessManager needToManageConnection:forURLs:]( &OBJC_CLASS___NSFileAccessProcessManager,  "needToManageConnection:forURLs:",  self->_connection,  self->_urls))
  {
    -[NSFileAccessProcessMonitor addProcessManager:forPID:]( +[NSFileAccessProcessMonitor sharedInstance](&OBJC_CLASS___NSFileAccessProcessMonitor, "sharedInstance"),  "addProcessManager:forPID:",  self,  self->_pid);
  }

  else
  {
    -[NSFileAccessProcessMonitor removeProcessManager:forPID:]( +[NSFileAccessProcessMonitor sharedInstance](&OBJC_CLASS___NSFileAccessProcessMonitor, "sharedInstance"),  "removeProcessManager:forPID:",  self,  self->_pid);
  }

- (void)setSuspensionHandler:(id)a3
{
  id suspensionHandler = self->_suspensionHandler;
  if (suspensionHandler != a3)
  {

    self->_id suspensionHandler = (id)[a3 copy];
    -[NSFileAccessProcessManager _ensureMonitor](self, "_ensureMonitor");
  }

- (void)processSuspended
{
  v3[5] = *MEMORY[0x1895F89C0];
  queue = (dispatch_queue_s *)self->_queue;
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __46__NSFileAccessProcessManager_processSuspended__block_invoke;
  v3[3] = &unk_189C9A030;
  v3[4] = self;
  dispatch_async(queue, v3);
}

uint64_t __46__NSFileAccessProcessManager_processSuspended__block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  v2 = (os_log_s *)_NSFCProcessMonitorLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = *(_DWORD *)(*(void *)(a1 + 32) + 16LL);
    v7[0] = 67109120;
    v7[1] = v3;
    _os_log_impl(&dword_182EB1000, v2, OS_LOG_TYPE_DEFAULT, "Detected process suspension: %i", (uint8_t *)v7, 8u);
  }

  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t result = *(void *)(v4 + 32);
  if (result)
  {
    uint64_t result = (*(uint64_t (**)(void))(result + 16))();
    uint64_t v4 = *(void *)(a1 + 32);
  }

  if (*(int *)(v4 + 56) >= 1)
  {
    objc_super v6 = (os_log_s *)_NSFCProcessMonitorLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v7[0]) = 0;
      _os_log_impl( &dword_182EB1000,  v6,  OS_LOG_TYPE_DEFAULT,  "Killing process because it has oustanding messages",  (uint8_t *)v7,  2u);
    }

    return [*(id *)(a1 + 32) killProcessWithMessage:@"The process did not finish responding to an NSFilePresenter message before being suspended"];
  }

  return result;
}

- (id)suspensionHandler
{
  return self->_suspensionHandler;
}

- (void)setURLs:(id)a3
{
  urls = self->_urls;
  if (urls != a3)
  {

    self->_urls = (NSArray *)[a3 copy];
    -[NSFileAccessProcessManager _ensureMonitor](self, "_ensureMonitor");
  }

- (NSArray)URLs
{
  return self->_urls;
}

- (void)killProcessWithMessage:(id)a3
{
  uint64_t pid = xpc_connection_get_pid(self->_connection);
  if (qword_18C496E28 != -1) {
    dispatch_once(&qword_18C496E28, &__block_literal_global_90);
  }
  if (off_18C496E10) {
    off_18C496E10(pid, 0LL, a3);
  }
  kill(pid, 9);
}

- (void)safelySendMessageWithReplyUsingBlock:(id)a3
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  if (qword_18C496E30 != -1) {
    dispatch_once(&qword_18C496E30, &__block_literal_global_93);
  }
  if (_MergedGlobals_138
    && +[NSFileAccessProcessManager needToManageConnection:forURLs:]( &OBJC_CLASS___NSFileAccessProcessManager,  "needToManageConnection:forURLs:",  self->_connection,  self->_urls))
  {
    uint64_t v5 = (char *)xpc_connection_copy_bundle_id();
    if (v5)
    {
      ++self->_pendingMessageCount;
      -[NSFileAccessProcessManager _ensureMonitor](self, "_ensureMonitor");
      uint64_t pid = xpc_connection_get_pid(self->_connection);
      BOOL v7 = -[NSFileAccessProcessMonitor processWithPIDIsSuspended:]( +[NSFileAccessProcessMonitor sharedInstance](&OBJC_CLASS___NSFileAccessProcessMonitor, "sharedInstance"),  "processWithPIDIsSuspended:",  pid);
      uint64_t v8 = (os_log_s *)_NSFCProcessMonitorLog();
      uint64_t v9 = v8;
      if (v7)
      {
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 67109120;
          DWORD1(buf) = pid;
          _os_log_impl( &dword_182EB1000,  v9,  OS_LOG_TYPE_DEFAULT,  "Killing %d because it was suspended when we tried to send it an NSFilePresenter message",  (uint8_t *)&buf,  8u);
        }

        -[NSFileAccessProcessManager killProcessWithMessage:]( self,  "killProcessWithMessage:",  +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"Tried to send an NSFilePresenter message requiring a response, but process was suspended. You should unregister NSFilePresenters when a process is no longer active. The NSFilePresenter being messaged has a presentedItemURL of '%@'",  objc_msgSend(-[NSArray firstObject](self->_urls, "firstObject"), "path")));
        v15[0] = MEMORY[0x1895F87A8];
        v15[1] = 3221225472LL;
        v15[2] = __67__NSFileAccessProcessManager_safelySendMessageWithReplyUsingBlock___block_invoke_25;
        v15[3] = &unk_189C9A030;
        v15[4] = self;
        (*((void (**)(id, void *))a3 + 2))(a3, v15);
      }

      else
      {
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          LODWORD(buf) = 136446210;
          *(void *)((char *)&buf + 4) = v5;
          _os_log_debug_impl( &dword_182EB1000,  v9,  OS_LOG_TYPE_DEBUG,  "Taking assertion for %{public}s while sending it an NSFilePresenter message",  (uint8_t *)&buf,  0xCu);
        }

        v10 = (os_log_s *)_NSFCProcessMonitorLog();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
          uint64_t v11 = strdup(v5);
        }
        else {
          uint64_t v11 = 0LL;
        }
        *(void *)&__int128 buf = 0LL;
        *((void *)&buf + 1) = &buf;
        uint64_t v20 = 0x3052000000LL;
        v21 = __Block_byref_object_copy__21;
        v22 = __Block_byref_object_dispose__21;
        uint64_t v23 = 0LL;
        id v12 = objc_alloc(objc_lookUpClass("BKSProcessAssertion"));
        uint64_t v13 = MEMORY[0x1895F87A8];
        v18[0] = MEMORY[0x1895F87A8];
        v18[1] = 3221225472LL;
        v18[2] = __67__NSFileAccessProcessManager_safelySendMessageWithReplyUsingBlock___block_invoke;
        v18[3] = &unk_189CA1D30;
        v18[4] = self;
        v18[5] = a3;
        v18[6] = &buf;
        v18[7] = v11;
        uint64_t v14 = (void *)[v12 initWithPID:pid flags:3 reason:4 name:@"filecoordinationd waiting for response from NSFilePresenter" withHandler:v18];
        *(void *)(*((void *)&buf + 1) + 40LL) = v14;
        v16[0] = v13;
        v16[1] = 3221225472LL;
        v16[2] = __67__NSFileAccessProcessManager_safelySendMessageWithReplyUsingBlock___block_invoke_20;
        v16[3] = &unk_189C9AA58;
        int v17 = pid;
        v16[4] = self;
        [v14 setInvalidationHandler:v16];
        _Block_object_dispose(&buf, 8);
      }
    }

    else
    {
      (*((void (**)(id, void))a3 + 2))(a3, 0LL);
    }

    free(v5);
  }

  else
  {
    (*((void (**)(id, void))a3 + 2))(a3, 0LL);
  }

void __67__NSFileAccessProcessManager_safelySendMessageWithReplyUsingBlock___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  __int128 v1 = *(_OWORD *)(a1 + 32);
  __int128 v2 = *(_OWORD *)(a1 + 48);
  int v3 = *(dispatch_queue_s **)(*(void *)(a1 + 32) + 24LL);
  block[2] = __67__NSFileAccessProcessManager_safelySendMessageWithReplyUsingBlock___block_invoke_2;
  block[3] = &unk_189CA1D08;
  __int128 v5 = v1;
  __int128 v6 = v2;
  dispatch_async(v3, block);
}

uint64_t __67__NSFileAccessProcessManager_safelySendMessageWithReplyUsingBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __67__NSFileAccessProcessManager_safelySendMessageWithReplyUsingBlock___block_invoke_3;
  v3[3] = &unk_189CA1CE0;
  uint64_t v1 = *(void *)(a1 + 40);
  v3[4] = *(void *)(a1 + 32);
  __int128 v4 = *(_OWORD *)(a1 + 48);
  return (*(uint64_t (**)(uint64_t, void *))(v1 + 16))(v1, v3);
}

void __67__NSFileAccessProcessManager_safelySendMessageWithReplyUsingBlock___block_invoke_3(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  __int128 v2 = (os_log_s *)_NSFCProcessMonitorLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v3 = *(void *)(a1 + 48);
    int v4 = 136446210;
    uint64_t v5 = v3;
    _os_log_debug_impl( &dword_182EB1000,  v2,  OS_LOG_TYPE_DEBUG,  "Releasing assertion after sending message to %{public}s",  (uint8_t *)&v4,  0xCu);
  }

  --*(_DWORD *)(*(void *)(a1 + 32) + 56LL);
  [*(id *)(a1 + 32) _ensureMonitor];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setInvalidationHandler:0];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) invalidate];

  free(*(void **)(a1 + 48));
}

uint64_t __67__NSFileAccessProcessManager_safelySendMessageWithReplyUsingBlock___block_invoke_20(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  __int128 v2 = (os_log_s *)_NSFCProcessMonitorLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = *(_DWORD *)(a1 + 40);
    v5[0] = 67109120;
    v5[1] = v3;
    _os_log_impl( &dword_182EB1000,  v2,  OS_LOG_TYPE_DEFAULT,  "Killing %d because it was suspended before replying to an NSFilePresenter method",  (uint8_t *)v5,  8u);
  }

  return [*(id *)(a1 + 32) killProcessWithMessage:@"The process did not finish responding to an NSFilePresenter message before being suspended."];
}

uint64_t __67__NSFileAccessProcessManager_safelySendMessageWithReplyUsingBlock___block_invoke_25(uint64_t a1)
{
  return [*(id *)(a1 + 32) _ensureMonitor];
}

- (void)preventSuspensionWithActivityName:(id)a3
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  if (qword_18C496E30 != -1) {
    dispatch_once(&qword_18C496E30, &__block_literal_global_93);
  }
  if (_MergedGlobals_138
    && +[NSFileAccessProcessManager needToManageConnection:forURLs:]( &OBJC_CLASS___NSFileAccessProcessManager,  "needToManageConnection:forURLs:",  self->_connection,  self->_urls)
    && !self->_assertionToken)
  {
    uint64_t v5 = (void *)xpc_connection_copy_bundle_id();
    if (v5)
    {
      uint64_t pid = xpc_connection_get_pid(self->_connection);
      uint64_t v7 = (os_log_s *)_NSFCProcessMonitorLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        v8[0] = 67109378;
        v8[1] = pid;
        __int16 v9 = 2114;
        id v10 = a3;
        _os_log_debug_impl( &dword_182EB1000,  v7,  OS_LOG_TYPE_DEBUG,  "Scheduling suspension prevention of pid %d for activity: %{public}@",  (uint8_t *)v8,  0x12u);
      }

      self->_id assertionToken =  -[_NSFileAccessAsynchronousProcessAssertionScheduler addAssertionWithName:forPID:]( +[_NSFileAccessAsynchronousProcessAssertionScheduler sharedInstance]( &OBJC_CLASS____NSFileAccessAsynchronousProcessAssertionScheduler,  "sharedInstance"),  "addAssertionWithName:forPID:",  a3,  pid);
    }

    free(v5);
  }

- (void)allowSuspension
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  int v3 = (os_log_s *)_NSFCProcessMonitorLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    pid_t pid = xpc_connection_get_pid(self->_connection);
    v6[0] = 67109120;
    v6[1] = pid;
    _os_log_debug_impl(&dword_182EB1000, v3, OS_LOG_TYPE_DEBUG, "Re-allowing suspension for pid: %d", (uint8_t *)v6, 8u);
  }

  id assertionToken = self->_assertionToken;
  if (assertionToken)
  {
    -[_NSFileAccessAsynchronousProcessAssertionScheduler removeAssertionWithToken:]( +[_NSFileAccessAsynchronousProcessAssertionScheduler sharedInstance]( &OBJC_CLASS____NSFileAccessAsynchronousProcessAssertionScheduler,  "sharedInstance"),  "removeAssertionWithToken:",  self->_assertionToken);
    id assertionToken = self->_assertionToken;
  }

  self->_id assertionToken = 0LL;
}

- (void)invalidate
{
}

@end