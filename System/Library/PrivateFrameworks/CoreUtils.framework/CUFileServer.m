@interface CUFileServer
- (CUFileServer)init;
- (NSString)label;
- (NSString)serviceType;
- (NSURL)rootDirectoryURL;
- (OS_dispatch_queue)dispatchQueue;
- (id)invalidationHandler;
- (void)_activateWithCompletion:(id)a3;
- (void)_handleKeepAlive:(id)a3 responseHandler:(id)a4;
- (void)_handleQuery:(id)a3 responseHandler:(id)a4;
- (void)_handleQuery:(id)a3 session:(id)a4;
- (void)_handleRequestFiles:(id)a3 responseHandler:(id)a4;
- (void)_handleSessionStart:(id)a3 responseHandler:(id)a4;
- (void)_handleSessionStop:(id)a3 responseHandler:(id)a4;
- (void)_invalidate;
- (void)_invalidated;
- (void)_sessionInvalidate:(id)a3;
- (void)_sessionTimerFired;
- (void)_update;
- (void)activateWithCompletion:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)setDispatchQueue:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setLabel:(id)a3;
- (void)setRootDirectoryURL:(id)a3;
- (void)setServiceType:(id)a3;
@end

@implementation CUFileServer

- (CUFileServer)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___CUFileServer;
  v2 = -[CUFileServer init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1895F8AE0]);
    v3->_ucat = (LogCategory *)&gLogCategory_CUFileServer;
    v4 = v3;
  }

  return v3;
}

- (void)dealloc
{
  ucat = self->_ucat;
  if (ucat && (ucat->var3 & 0x40000) != 0)
  {
    LogCategory_Remove(ucat);
    self->_ucat = 0LL;
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CUFileServer;
  -[CUFileServer dealloc](&v4, sel_dealloc);
}

- (void)setLabel:(id)a3
{
  id v5 = a3;
  [v5 UTF8String];
  LogCategoryReplaceF((uint64_t *)&self->_ucat);
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __39__CUFileServer_activateWithCompletion___block_invoke;
  v7[3] = &unk_189F33060;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)_activateWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v38 = 0LL;
  v39 = &v38;
  uint64_t v40 = 0x3032000000LL;
  v41 = __Block_byref_object_copy__2979;
  v42 = __Block_byref_object_dispose__2980;
  id v43 = 0LL;
  uint64_t v5 = MEMORY[0x1895F87A8];
  aBlock[0] = MEMORY[0x1895F87A8];
  aBlock[1] = 3221225472LL;
  aBlock[2] = __40__CUFileServer__activateWithCompletion___block_invoke;
  aBlock[3] = &unk_189F32BC0;
  v37 = &v38;
  aBlock[4] = self;
  id v6 = v4;
  id v36 = v6;
  v11 = (void (**)(void))_Block_copy(aBlock);
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 != -1)
    {
LABEL_3:
      LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUFileServer _activateWithCompletion:]",  0x1Eu,  (uint64_t)"Activate",  v7,  v8,  v9,  v10,  v21);
      goto LABEL_5;
    }

    if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
    {
      ucat = self->_ucat;
      goto LABEL_3;
    }
  }

- (void)invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __26__CUFileServer_invalidate__block_invoke;
  block[3] = &unk_189F34238;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidate
{
  if (self->_invalidateCalled) {
    return;
  }
  self->_invalidateCalled = 1;
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 == -1)
    {
      ucat = self->_ucat;
    }

    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUFileServer _invalidate]", 0x1Eu, (uint64_t)"Invalidate", v2, v3, v4, v5, v13);
  }

- (void)_invalidated
{
  if (self->_invalidateCalled && !self->_invalidateDone && !self->_clinkClient)
  {
    v12 = _Block_copy(self->_invalidationHandler);
    id invalidationHandler = self->_invalidationHandler;
    self->_id invalidationHandler = 0LL;

    uint64_t v8 = v12;
    if (v12)
    {
      (*((void (**)(void *))v12 + 2))(v12);
      uint64_t v8 = v12;
    }

    self->_invalidateDone = 1;
    ucat = self->_ucat;
    if (ucat->var0 > 30) {
      goto LABEL_11;
    }
    if (ucat->var0 == -1)
    {
      BOOL v10 = _LogCategory_Initialize((uint64_t)ucat, 0x1Eu);
      uint64_t v8 = v12;
      if (!v10) {
        goto LABEL_11;
      }
      ucat = self->_ucat;
    }

    LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUFileServer _invalidated]",  0x1Eu,  (uint64_t)"Invalidated",  v4,  v5,  v6,  v7,  v11);
    uint64_t v8 = v12;
LABEL_11:
  }

- (void)_sessionInvalidate:(id)a3
{
  id v4 = a3;
  uint64_t v3 = (DIR *)[v4 dirStream];
  if (v3)
  {
    closedir(v3);
    [v4 setDirStream:0];
  }
}

- (void)_sessionTimerFired
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  ucat = self->_ucat;
  if (ucat->var0 > 20) {
    goto LABEL_5;
  }
  if (ucat->var0 == -1)
  {
    ucat = self->_ucat;
  }

  LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUFileServer _sessionTimerFired]",  0x14u,  (uint64_t)"Session timer fired",  v2,  v3,  v4,  v5,  v22);
LABEL_5:
  uint64_t v8 = mach_absolute_time();
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  -[NSMutableDictionary allKeys](self->_sessionMap, "allKeys");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (!v10) {
    goto LABEL_20;
  }
  uint64_t v11 = v10;
  uint64_t v12 = *(void *)v24;
  do
  {
    uint64_t v13 = 0LL;
    do
    {
      if (*(void *)v24 != v12) {
        objc_enumerationMutation(v9);
      }
      uint64_t v14 = *(void *)(*((void *)&v23 + 1) + 8 * v13);
      v15 = -[NSMutableDictionary objectForKeyedSubscript:](self->_sessionMap, "objectForKeyedSubscript:", v14);
      if (UpTicksToSeconds(v8 - [v15 lastRequestTicks]) >= 0x1E)
      {
        uint64_t v20 = self->_ucat;
        if (v20->var0 <= 30)
        {
          if (v20->var0 != -1) {
            goto LABEL_13;
          }
          if (_LogCategory_Initialize((uint64_t)v20, 0x1Eu))
          {
            uint64_t v20 = self->_ucat;
LABEL_13:
            LogPrintF( (uint64_t)v20,  (uint64_t)"-[CUFileServer _sessionTimerFired]",  0x1Eu,  (uint64_t)"Session stale: ID %@, %llu seconds",  v16,  v17,  v18,  v19,  v14);
          }
        }

        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_sessionMap, "setObject:forKeyedSubscript:", 0LL, v14);
        -[CUFileServer _sessionInvalidate:](self, "_sessionInvalidate:", v15);
      }

      ++v13;
    }

    while (v11 != v13);
    uint64_t v21 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
    uint64_t v11 = v21;
  }

  while (v21);
LABEL_20:
}

- (void)_update
{
  uint64_t v3 = -[NSMutableDictionary count](self->_sessionMap, "count");
  sessionTimer = self->_sessionTimer;
  if (v3)
  {
    if (sessionTimer) {
      return;
    }
    dispatch_source_t v5 = dispatch_source_create(MEMORY[0x1895F8B78], 0LL, 0LL, (dispatch_queue_t)self->_dispatchQueue);
    objc_storeStrong((id *)&self->_sessionTimer, v5);
    v19[0] = MEMORY[0x1895F87A8];
    v19[1] = 3221225472LL;
    v19[2] = __23__CUFileServer__update__block_invoke;
    v19[3] = &unk_189F33088;
    v19[4] = v5;
    v19[5] = self;
    dispatch_source_set_event_handler(v5, v19);
    dispatch_time_t v6 = dispatch_time(0LL, 15000000000LL);
    dispatch_source_set_timer(v5, v6, 0x37E11D600uLL, 0x3B9ACA00uLL);
    dispatch_activate(v5);
    ucat = self->_ucat;
    if (ucat->var0 > 30) {
      goto LABEL_11;
    }
    if (ucat->var0 == -1)
    {
      ucat = self->_ucat;
    }

    LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUFileServer _update]",  0x1Eu,  (uint64_t)"Session timer started",  v7,  v8,  v9,  v10,  v19[0]);
LABEL_11:

    return;
  }

  if (sessionTimer)
  {
    uint64_t v12 = sessionTimer;
    dispatch_source_cancel(v12);
    uint64_t v13 = self->_sessionTimer;
    self->_sessionTimer = 0LL;

    uint64_t v18 = self->_ucat;
    if (v18->var0 <= 30)
    {
      if (v18->var0 != -1)
      {
LABEL_9:
        LogPrintF( (uint64_t)v18,  (uint64_t)"-[CUFileServer _update]",  0x1Eu,  (uint64_t)"Session timer stopped",  v14,  v15,  v16,  v17,  v20);
        return;
      }

      if (_LogCategory_Initialize((uint64_t)v18, 0x1Eu))
      {
        uint64_t v18 = self->_ucat;
        goto LABEL_9;
      }
    }
  }

- (void)_handleSessionStart:(id)a3 responseHandler:(id)a4
{
  v23[1] = *MEMORY[0x1895F89C0];
  id v5 = a4;
  if ((unint64_t)-[NSMutableDictionary count](self->_sessionMap, "count") < 0x1E)
  {
    uint64_t v10 = objc_alloc_init(&OBJC_CLASS___CUFileServerSession);
    -[CUFileServerSession setLastRequestTicks:](v10, "setLastRequestTicks:", mach_absolute_time());
    unint64_t v12 = self->_lastSessionID + 1;
    self->_lastSessionID = v12;
    -[CUFileServerSession setSessionID:](v10, "setSessionID:", v12);
    if (!self->_sessionMap)
    {
      uint64_t v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
      sessionMap = self->_sessionMap;
      self->_sessionMap = v13;
    }

    [MEMORY[0x189607968] numberWithUnsignedLongLong:v12];
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_sessionMap, "setObject:forKeyedSubscript:", v10, v15);
    ucat = self->_ucat;
    if (ucat->var0 > 30) {
      goto LABEL_13;
    }
    if (ucat->var0 == -1)
    {
      ucat = self->_ucat;
    }

    LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUFileServer _handleSessionStart:responseHandler:]",  0x1Eu,  (uint64_t)"Session start: ID %llu",  v16,  v17,  v18,  v19,  v12);
LABEL_13:
    -[CUFileServer _update](self, "_update");
    char v22 = @"sid";
    v23[0] = v15;
    [MEMORY[0x189603F68] dictionaryWithObjects:v23 forKeys:&v22 count:1];
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *, void, void))v5 + 2))(v5, v21, 0LL, 0LL);

    goto LABEL_14;
  }

  NSErrorF_safe((void *)*MEMORY[0x189607670], (const char *)0xFFFEEA12LL);
  uint64_t v10 = (CUFileServerSession *)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = self->_ucat;
  if (v11->var0 <= 90)
  {
    if (v11->var0 == -1)
    {
      uint64_t v11 = self->_ucat;
    }

    LogPrintF( (uint64_t)v11,  (uint64_t)"-[CUFileServer _handleSessionStart:responseHandler:]",  0x5Au,  (uint64_t)"### Session start failed: %{error}",  v6,  v7,  v8,  v9,  (char)v10);
  }

- (void)_handleSessionStop:(id)a3 responseHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v23 = 0LL;
  __int128 v24 = &v23;
  uint64_t v25 = 0x3032000000LL;
  __int128 v26 = __Block_byref_object_copy__2979;
  v27 = __Block_byref_object_dispose__2980;
  id v28 = 0LL;
  aBlock[0] = MEMORY[0x1895F87A8];
  aBlock[1] = 3221225472LL;
  aBlock[2] = __51__CUFileServer__handleSessionStop_responseHandler___block_invoke;
  aBlock[3] = &unk_189F32BC0;
  char v22 = &v23;
  aBlock[4] = self;
  id v8 = v7;
  id v21 = v8;
  uint64_t v9 = (void (**)(void))_Block_copy(aBlock);
  NSDictionaryGetNSNumber(v6, (uint64_t)@"sid", 0LL);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    uint64_t v17 = NSErrorF_safe((void *)*MEMORY[0x189607670], (const char *)0xFFFFE5CFLL);
    uint64_t v15 = (void *)v24[5];
    v24[5] = v17;
    goto LABEL_8;
  }

  -[NSMutableDictionary objectForKeyedSubscript:](self->_sessionMap, "objectForKeyedSubscript:", v10);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    uint64_t v18 = NSErrorF_safe((void *)*MEMORY[0x189607670], (const char *)0xFFFFE5B9LL);
    uint64_t v19 = (void *)v24[5];
    v24[5] = v18;

    uint64_t v15 = 0LL;
    goto LABEL_8;
  }

  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 == -1)
    {
      ucat = self->_ucat;
    }

    LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUFileServer _handleSessionStop:responseHandler:]",  0x1Eu,  (uint64_t)"Session stop: ID %@",  v11,  v12,  v13,  v14,  (char)v10);
  }

- (void)_handleKeepAlive:(id)a3 responseHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v24 = 0LL;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000LL;
  v27 = __Block_byref_object_copy__2979;
  id v28 = __Block_byref_object_dispose__2980;
  id v29 = 0LL;
  aBlock[0] = MEMORY[0x1895F87A8];
  aBlock[1] = 3221225472LL;
  aBlock[2] = __49__CUFileServer__handleKeepAlive_responseHandler___block_invoke;
  aBlock[3] = &unk_189F32BC0;
  uint64_t v23 = &v24;
  aBlock[4] = self;
  id v8 = v7;
  id v22 = v8;
  uint64_t v9 = (void (**)(void))_Block_copy(aBlock);
  NSDictionaryGetNSNumber(v6, (uint64_t)@"sid", 0LL);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    uint64_t v18 = NSErrorF_safe((void *)*MEMORY[0x189607670], (const char *)0xFFFFE5CFLL);
    uint64_t v11 = (void *)v25[5];
    v25[5] = v18;
    goto LABEL_8;
  }

  -[NSMutableDictionary objectForKeyedSubscript:](self->_sessionMap, "objectForKeyedSubscript:", v10);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    uint64_t v19 = NSErrorF_safe((void *)*MEMORY[0x189607670], (const char *)0xFFFFE5B9LL);
    char v20 = (void *)v25[5];
    v25[5] = v19;

    uint64_t v11 = 0LL;
    goto LABEL_8;
  }

  uint64_t v12 = mach_absolute_time();
  UpTicksToSeconds(v12 - [v11 lastRequestTicks]);
  ucat = self->_ucat;
  if (ucat->var0 <= 20)
  {
    if (ucat->var0 == -1)
    {
      ucat = self->_ucat;
    }

    LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUFileServer _handleKeepAlive:responseHandler:]",  0x14u,  (uint64_t)"Keep alive: ID %@, %llu seconds",  v13,  v14,  v15,  v16,  (char)v10);
  }

- (void)_handleQuery:(id)a3 responseHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v45 = 0LL;
  v46 = (id *)&v45;
  uint64_t v47 = 0x3032000000LL;
  v48 = __Block_byref_object_copy__2979;
  v49 = __Block_byref_object_dispose__2980;
  id v50 = 0LL;
  uint64_t v8 = MEMORY[0x1895F87A8];
  aBlock[0] = MEMORY[0x1895F87A8];
  aBlock[1] = 3221225472LL;
  aBlock[2] = __45__CUFileServer__handleQuery_responseHandler___block_invoke;
  aBlock[3] = &unk_189F32BC0;
  v44 = &v45;
  aBlock[4] = self;
  id v9 = v7;
  id v43 = v9;
  uint64_t v10 = (void (**)(void))_Block_copy(aBlock);
  v35 = v10;
  NSDictionaryGetNSNumber(v6, (uint64_t)@"sid", 0LL);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    uint64_t v31 = NSErrorF_safe((void *)*MEMORY[0x189607670], (const char *)0xFFFFE5CFLL);
    id v12 = v46[5];
    v46[5] = (id)v31;
    goto LABEL_14;
  }

  -[NSMutableDictionary objectForKeyedSubscript:](self->_sessionMap, "objectForKeyedSubscript:", v11);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    uint64_t v32 = NSErrorF_safe((void *)*MEMORY[0x189607670], (const char *)0xFFFFE5B9LL);
    id v14 = v46[5];
    v46[5] = (id)v32;
    goto LABEL_13;
  }

  CFTypeID TypeID = CFDictionaryGetTypeID();
  CFDictionaryGetTypedValue((const __CFDictionary *)v6, @"fQry", TypeID, 0LL);
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    uint64_t v15 = objc_alloc(&OBJC_CLASS___CUFileQuery);
    uint64_t v16 = v46;
    id obj = v46[5];
    uint64_t v17 = -[CUFileQuery initWithDictionary:error:](v15, "initWithDictionary:error:", v14, &obj);
    objc_storeStrong(v16 + 5, obj);
    if (v17)
    {
      [v12 setLastRequestTicks:mach_absolute_time()];
      v39[0] = v8;
      v39[1] = 3221225472LL;
      v39[2] = __45__CUFileServer__handleQuery_responseHandler___block_invoke_2;
      v39[3] = &unk_189F30F08;
      id v40 = v9;
      -[CUFileQuery setCompletionHandler:](v17, "setCompletionHandler:", v39);
      ucat = self->_ucat;
      if (ucat->var0 <= 30)
      {
        if (ucat->var0 == -1)
        {
          ucat = self->_ucat;
        }

        LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUFileServer _handleQuery:responseHandler:]",  0x1Eu,  (uint64_t)"Query start: ID %@, %@",  v18,  v19,  v20,  v21,  (char)v11);
      }

- (void)_handleQuery:(id)a3 session:(id)a4
{
  id v6 = a3;
  uint64_t v47 = (char *)a4;
  uint64_t v56 = 0LL;
  v57 = &v56;
  uint64_t v58 = 0x3032000000LL;
  v59 = __Block_byref_object_copy__2979;
  v60 = __Block_byref_object_dispose__2980;
  id v61 = 0LL;
  aBlock[0] = MEMORY[0x1895F87A8];
  aBlock[1] = 3221225472LL;
  aBlock[2] = __37__CUFileServer__handleQuery_session___block_invoke;
  aBlock[3] = &unk_189F30F58;
  v55 = &v56;
  aBlock[4] = self;
  id v7 = v6;
  id v54 = v7;
  uint64_t v45 = (void (**)(void))_Block_copy(aBlock);
  v46 = v7;
  uint64_t v8 = [v7 path];
  v44 = (void *)v8;
  if (v8)
  {
    -[NSURL URLByAppendingPathComponent:isDirectory:]( self->_rootDirectoryURL,  "URLByAppendingPathComponent:isDirectory:",  v8,  0LL);
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    *__error() = 0;
    id v10 = v9;
    uint64_t v11 = realpath_DARWIN_EXTSN((const char *)[v10 fileSystemRepresentation], v47 + 8);
    id v12 = v11;
    if (!v11) {
      goto LABEL_51;
    }
    int v13 = self->_rootPath[0];
    if (self->_rootPath[0])
    {
      id v14 = &self->_rootPath[1];
      uint64_t v15 = v11;
      while (*v15 == v13)
      {
        ++v15;
        int v16 = *v14++;
        int v13 = v16;
        if (!v16) {
          goto LABEL_7;
        }
      }

      uint64_t v40 = NSErrorF_safe((void *)*MEMORY[0x189607670], (const char *)0xFFFFE5D0LL);
LABEL_49:
      v41 = (void *)v57[5];
      v57[5] = v40;

      goto LABEL_44;
    }

- (void)_handleRequestFiles:(id)a3 responseHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v23 = 0LL;
  int v24 = &v23;
  uint64_t v25 = 0x3032000000LL;
  id v26 = __Block_byref_object_copy__2979;
  v27 = __Block_byref_object_dispose__2980;
  id v28 = 0LL;
  aBlock[0] = MEMORY[0x1895F87A8];
  aBlock[1] = 3221225472LL;
  aBlock[2] = __52__CUFileServer__handleRequestFiles_responseHandler___block_invoke;
  aBlock[3] = &unk_189F32BC0;
  id v22 = &v23;
  aBlock[4] = self;
  id v8 = v7;
  id v21 = v8;
  id v9 = (void (**)(void))_Block_copy(aBlock);
  NSDictionaryGetNSNumber(v6, (uint64_t)@"sid", 0LL);
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    uint64_t v17 = NSErrorF_safe((void *)*MEMORY[0x189607670], (const char *)0xFFFFE5CFLL);
    uint64_t v15 = (void *)v24[5];
    v24[5] = v17;
    goto LABEL_8;
  }

  -[NSMutableDictionary objectForKeyedSubscript:](self->_sessionMap, "objectForKeyedSubscript:", v10);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    uint64_t v18 = NSErrorF_safe((void *)*MEMORY[0x189607670], (const char *)0xFFFFE5B9LL);
    uint64_t v19 = (void *)v24[5];
    v24[5] = v18;

    uint64_t v15 = 0LL;
    goto LABEL_8;
  }

  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 == -1)
    {
      ucat = self->_ucat;
    }

    LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUFileServer _handleRequestFiles:responseHandler:]",  0x1Eu,  (uint64_t)"RequestFiles: ID %@",  v11,  v12,  v13,  v14,  (char)v10);
  }

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (NSString)label
{
  return self->_label;
}

- (NSURL)rootDirectoryURL
{
  return self->_rootDirectoryURL;
}

- (void)setRootDirectoryURL:(id)a3
{
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(id)a3
{
}

- (void).cxx_destruct
{
}

uint64_t __52__CUFileServer__handleRequestFiles_responseHandler___block_invoke( uint64_t result,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  uint64_t v8 = *(void *)(*(void *)(*(void *)(result + 48) + 8LL) + 40LL);
  if (v8)
  {
    id v9 = (void *)result;
    id v10 = *(int **)(*(void *)(result + 32) + 1088LL);
    if (*v10 <= 90)
    {
      if (*v10 == -1)
      {
        id v10 = *(int **)(v9[4] + 1088LL);
        uint64_t v8 = *(void *)(*(void *)(v9[6] + 8LL) + 40LL);
      }

      LogPrintF( (uint64_t)v10,  (uint64_t)"-[CUFileServer _handleRequestFiles:responseHandler:]_block_invoke",  0x5Au,  (uint64_t)"### Keep alive failed: %{error}",  a5,  a6,  a7,  a8,  v8);
    }

    return (*(uint64_t (**)(void))(v9[5] + 16LL))();
  }

  return result;
}

void __37__CUFileServer__handleQuery_session___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
  if (v8)
  {
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(int **)(v10 + 1088);
    if (*v11 <= 90)
    {
      if (*v11 == -1)
      {
        BOOL v12 = _LogCategory_Initialize((uint64_t)v11, 0x5Au);
        uint64_t v10 = *(void *)(a1 + 32);
        if (!v12) {
          goto LABEL_6;
        }
        uint64_t v11 = *(int **)(v10 + 1088);
        uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
      }

      LogPrintF( (uint64_t)v11,  (uint64_t)"-[CUFileServer _handleQuery:session:]_block_invoke",  0x5Au,  (uint64_t)"### Query failed: %{error}",  a5,  a6,  a7,  a8,  v8);
      uint64_t v10 = *(void *)(a1 + 32);
    }

void __37__CUFileServer__handleQuery_session___block_invoke_3(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void, void))v2 + 2))(v2, *(void *)(a1 + 40), 0LL);
}

void __37__CUFileServer__handleQuery_session___block_invoke_2(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void, void))v2 + 2))( v2,  0LL,  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL));
}

uint64_t __45__CUFileServer__handleQuery_responseHandler___block_invoke( uint64_t result,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  uint64_t v8 = *(void *)(*(void *)(*(void *)(result + 48) + 8LL) + 40LL);
  if (v8)
  {
    id v9 = (void *)result;
    uint64_t v10 = *(int **)(*(void *)(result + 32) + 1088LL);
    if (*v10 <= 90)
    {
      if (*v10 == -1)
      {
        uint64_t v10 = *(int **)(v9[4] + 1088LL);
        uint64_t v8 = *(void *)(*(void *)(v9[6] + 8LL) + 40LL);
      }

      LogPrintF( (uint64_t)v10,  (uint64_t)"-[CUFileServer _handleQuery:responseHandler:]_block_invoke",  0x5Au,  (uint64_t)"### Query failed: %{error}",  a5,  a6,  a7,  a8,  v8);
    }

    return (*(uint64_t (**)(void))(v9[5] + 16LL))();
  }

  return result;
}

void __45__CUFileServer__handleQuery_responseHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }

  else
  {
    id v5 = objc_alloc_init(MEMORY[0x189603FC8]);
    [v6 encodeWithDictionary:v5];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }
}

uint64_t __45__CUFileServer__handleQuery_responseHandler___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleQuery:*(void *)(a1 + 40) session:*(void *)(a1 + 48)];
}

uint64_t __49__CUFileServer__handleKeepAlive_responseHandler___block_invoke( uint64_t result,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  uint64_t v8 = *(void *)(*(void *)(*(void *)(result + 48) + 8LL) + 40LL);
  if (v8)
  {
    id v9 = (void *)result;
    uint64_t v10 = *(int **)(*(void *)(result + 32) + 1088LL);
    if (*v10 <= 90)
    {
      if (*v10 == -1)
      {
        uint64_t v10 = *(int **)(v9[4] + 1088LL);
        uint64_t v8 = *(void *)(*(void *)(v9[6] + 8LL) + 40LL);
      }

      LogPrintF( (uint64_t)v10,  (uint64_t)"-[CUFileServer _handleKeepAlive:responseHandler:]_block_invoke",  0x5Au,  (uint64_t)"### Keep alive failed: %{error}",  a5,  a6,  a7,  a8,  v8);
    }

    return (*(uint64_t (**)(void))(v9[5] + 16LL))();
  }

  return result;
}

uint64_t __51__CUFileServer__handleSessionStop_responseHandler___block_invoke( uint64_t result,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  uint64_t v8 = *(void *)(*(void *)(*(void *)(result + 48) + 8LL) + 40LL);
  if (v8)
  {
    id v9 = (void *)result;
    uint64_t v10 = *(int **)(*(void *)(result + 32) + 1088LL);
    if (*v10 <= 90)
    {
      if (*v10 == -1)
      {
        uint64_t v10 = *(int **)(v9[4] + 1088LL);
        uint64_t v8 = *(void *)(*(void *)(v9[6] + 8LL) + 40LL);
      }

      LogPrintF( (uint64_t)v10,  (uint64_t)"-[CUFileServer _handleSessionStop:responseHandler:]_block_invoke",  0x5Au,  (uint64_t)"### Session stop failed: %{error}",  a5,  a6,  a7,  a8,  v8);
    }

    return (*(uint64_t (**)(void))(v9[5] + 16LL))();
  }

  return result;
}

void *__23__CUFileServer__update__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  result = *(void **)(a1 + 40);
  if (v2 == result[135]) {
    return (void *)[result _sessionTimerFired];
  }
  return result;
}

uint64_t __27__CUFileServer__invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sessionInvalidate:");
}

uint64_t __26__CUFileServer_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

uint64_t __40__CUFileServer__activateWithCompletion___block_invoke( uint64_t result,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  uint64_t v8 = *(void *)(*(void *)(*(void *)(result + 48) + 8LL) + 40LL);
  if (v8)
  {
    id v9 = (void *)result;
    uint64_t v10 = *(int **)(*(void *)(result + 32) + 1088LL);
    if (*v10 <= 90)
    {
      if (*v10 == -1)
      {
        uint64_t v10 = *(int **)(v9[4] + 1088LL);
        uint64_t v8 = *(void *)(*(void *)(v9[6] + 8LL) + 40LL);
      }

      LogPrintF( (uint64_t)v10,  (uint64_t)"-[CUFileServer _activateWithCompletion:]_block_invoke",  0x5Au,  (uint64_t)"### Activate failed: %{error}",  a5,  a6,  a7,  a8,  v8);
    }

    return (*(uint64_t (**)(void))(v9[5] + 16LL))();
  }

  return result;
}

uint64_t __40__CUFileServer__activateWithCompletion___block_invoke_2(uint64_t result)
{
  v1 = *(void **)(result + 32);
  uint64_t v2 = *(void *)(result + 40);
  if (v1 == *(void **)(v2 + 16))
  {
    uint64_t v3 = result;
    *(void *)(v2 + 16) = 0LL;

    return [*(id *)(v3 + 40) _invalidated];
  }

  return result;
}

uint64_t __40__CUFileServer__activateWithCompletion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleSessionStart:responseHandler:", a2);
}

uint64_t __40__CUFileServer__activateWithCompletion___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleSessionStop:responseHandler:", a2);
}

uint64_t __40__CUFileServer__activateWithCompletion___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleQuery:responseHandler:", a2);
}

uint64_t __40__CUFileServer__activateWithCompletion___block_invoke_6(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleRequestFiles:responseHandler:", a2);
}

uint64_t __40__CUFileServer__activateWithCompletion___block_invoke_7(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleKeepAlive:responseHandler:", a2);
}

void __40__CUFileServer__activateWithCompletion___block_invoke_8(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v8 = *(int **)(*(void *)(a1 + 32) + 1088LL);
  int v9 = *v8;
  id v12 = v3;
  if (v3)
  {
    if (v9 <= 90)
    {
      if (v9 == -1)
      {
        BOOL v10 = _LogCategory_Initialize((uint64_t)v8, 0x5Au);
        LOBYTE(v3) = (_BYTE)v12;
        if (!v10) {
          goto LABEL_11;
        }
        uint64_t v8 = *(int **)(*(void *)(a1 + 32) + 1088LL);
      }

      LogPrintF( (uint64_t)v8,  (uint64_t)"-[CUFileServer _activateWithCompletion:]_block_invoke_8",  0x5Au,  (uint64_t)"### CLink activate failed: %{error}",  v4,  v5,  v6,  v7,  (char)v3);
    }
  }

  else if (v9 <= 30)
  {
    if (v9 == -1)
    {
      uint64_t v8 = *(int **)(*(void *)(a1 + 32) + 1088LL);
    }

    LogPrintF( (uint64_t)v8,  (uint64_t)"-[CUFileServer _activateWithCompletion:]_block_invoke_8",  0x1Eu,  (uint64_t)"CLink activated",  v4,  v5,  v6,  v7,  v11);
  }

void __39__CUFileServer_activateWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(_BYTE *)(v2 + 8))
  {
    *(_BYTE *)(v2 + 8) = 1;
    [*(id *)(a1 + 32) _activateWithCompletion:*(void *)(a1 + 40)];
    return;
  }

  uint64_t v3 = NSErrorF_safe((void *)*MEMORY[0x189607670], (const char *)0xFFFFE5BFLL);
  uint64_t v8 = *(int **)(*(void *)(a1 + 32) + 1088LL);
  id v10 = (id)v3;
  if (*v8 <= 90)
  {
    if (*v8 == -1)
    {
      BOOL v9 = _LogCategory_Initialize((uint64_t)v8, 0x5Au);
      LOBYTE(v3) = (_BYTE)v10;
      if (!v9) {
        goto LABEL_7;
      }
      uint64_t v8 = *(int **)(*(void *)(a1 + 32) + 1088LL);
    }

    LogPrintF( (uint64_t)v8,  (uint64_t)"-[CUFileServer activateWithCompletion:]_block_invoke",  0x5Au,  (uint64_t)"### Activate failed: %{error}",  v4,  v5,  v6,  v7,  v3);
  }

@end