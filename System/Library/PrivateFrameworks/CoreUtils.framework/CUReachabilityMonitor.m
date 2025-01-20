@interface CUReachabilityMonitor
- (BOOL)_captiveDetectedCheck;
- (CUReachabilityMonitor)init;
- (NSURL)destinationURL;
- (OS_dispatch_queue)dispatchQueue;
- (double)timeout;
- (id)completionHandler;
- (int64_t)mode;
- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)_activate;
- (void)_complete:(id)a3;
- (void)_pathMonitorStart;
- (void)_pathMonitorUpdated:(id)a3;
- (void)_startDownload;
- (void)activate;
- (void)dealloc;
- (void)invalidate;
- (void)setCompletionHandler:(id)a3;
- (void)setDestinationURL:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setMode:(int64_t)a3;
- (void)setTimeout:(double)a3;
@end

@implementation CUReachabilityMonitor

- (CUReachabilityMonitor)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CUReachabilityMonitor;
  v2 = -[CUReachabilityMonitor init](&v5, sel_init);
  if (v2)
  {
    if (CUMainQueue_sOnce != -1) {
      dispatch_once(&CUMainQueue_sOnce, &__block_literal_global_16);
    }
    objc_storeStrong((id *)&v2->_dispatchQueue, (id)CUMainQueue_sQueue);
    v2->_captiveNotifyToken = -1;
    v3 = v2;
  }

  return v2;
}

- (void)dealloc
{
  urlSession = self->_urlSession;
  logger();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  objc_super v5 = v4;
  if (urlSession)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_186A3B000, v5, OS_LOG_TYPE_DEFAULT, "dealloc: active", buf, 2u);
    }
  }

  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_186A3B000, v5, OS_LOG_TYPE_DEBUG, "dealloc: inactive", buf, 2u);
  }

  int captiveNotifyToken = self->_captiveNotifyToken;
  if (captiveNotifyToken != -1)
  {
    notify_cancel(captiveNotifyToken);
    self->_int captiveNotifyToken = -1;
  }

  pathMonitor = self->_pathMonitor;
  if (pathMonitor)
  {
    nw_path_monitor_cancel(pathMonitor);
    v8 = self->_pathMonitor;
    self->_pathMonitor = 0LL;
  }

  timeoutTimer = self->_timeoutTimer;
  if (timeoutTimer)
  {
    v10 = timeoutTimer;
    dispatch_source_cancel(v10);
    v11 = self->_timeoutTimer;
    self->_timeoutTimer = 0LL;
  }

  v12 = self->_urlSession;
  if (v12)
  {
    -[NSURLSession invalidateAndCancel](v12, "invalidateAndCancel");
    v13 = self->_urlSession;
    self->_urlSession = 0LL;
  }

  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___CUReachabilityMonitor;
  -[CUReachabilityMonitor dealloc](&v14, sel_dealloc);
}

- (void)activate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __33__CUReachabilityMonitor_activate__block_invoke;
  block[3] = &unk_189F34238;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_activate
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  if (!self->_urlSession)
  {
    if (!self->_destinationURL)
    {
      [MEMORY[0x189604030] URLWithString:@"http://captive.apple.com"];
      v3 = (NSURL *)objc_claimAutoreleasedReturnValue();
      destinationURL = self->_destinationURL;
      self->_destinationURL = v3;
    }

    logger();
    objc_super v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t mode = self->_mode;
      if (mode > 2) {
        v7 = @"?";
      }
      else {
        v7 = off_189F31AE8[mode];
      }
      v8 = self->_destinationURL;
      double timeout = self->_timeout;
      *(_DWORD *)buf = 138412802;
      v26 = v7;
      __int16 v27 = 2112;
      v28 = v8;
      __int16 v29 = 2048;
      double v30 = timeout;
      _os_log_impl( &dword_186A3B000,  v5,  OS_LOG_TYPE_DEFAULT,  "Activate: mode=%@, url=%@, timeout=%f seconds",  buf,  0x20u);
    }

    objc_initWeak((id *)buf, self);
    dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
    handler[0] = MEMORY[0x1895F87A8];
    handler[1] = 3221225472LL;
    handler[2] = __34__CUReachabilityMonitor__activate__block_invoke;
    handler[3] = &unk_189F31A58;
    objc_copyWeak(&v24, (id *)buf);
    notify_register_dispatch( "com.apple.coreutils.captive-network-state",  &self->_captiveNotifyToken,  dispatchQueue,  handler);
    LOBYTE(dispatchQueue) = -[CUReachabilityMonitor _captiveDetectedCheck](self, "_captiveDetectedCheck");
    objc_destroyWeak(&v24);
    objc_destroyWeak((id *)buf);
    if ((dispatchQueue & 1) == 0)
    {
LABEL_12:
      if (self->_timeout > 0.0)
      {
        v11 = (OS_dispatch_source *)dispatch_source_create( MEMORY[0x1895F8B78],  0LL,  0LL,  (dispatch_queue_t)self->_dispatchQueue);
        timeoutTimer = self->_timeoutTimer;
        self->_timeoutTimer = v11;

        objc_initWeak((id *)buf, self);
        v13 = self->_timeoutTimer;
        uint64_t v18 = MEMORY[0x1895F87A8];
        uint64_t v19 = 3221225472LL;
        v20 = __34__CUReachabilityMonitor__activate__block_invoke_2;
        v21 = &unk_189F31A80;
        objc_copyWeak(&v22, (id *)buf);
        dispatch_source_set_event_handler((dispatch_source_t)v13, &v18);
        objc_super v14 = self->_timeoutTimer;
        unint64_t v15 = (unint64_t)(self->_timeout * 1000000000.0);
        dispatch_time_t v16 = dispatch_time(0LL, v15);
        dispatch_source_set_timer((dispatch_source_t)v14, v16, 0xFFFFFFFFFFFFFFFFLL, v15 >> 2);
        dispatch_resume((dispatch_object_t)self->_timeoutTimer);
        objc_destroyWeak(&v22);
        objc_destroyWeak((id *)buf);
      }

      int64_t v17 = self->_mode;
      switch(v17)
      {
        case 2LL:
          goto LABEL_17;
        case 1LL:
          -[CUReachabilityMonitor _pathMonitorStart](self, "_pathMonitorStart");
          break;
        case 0LL:
LABEL_17:
          self->_downloadStatus = 1;
          -[CUReachabilityMonitor _startDownload](self, "_startDownload", v18, v19, v20, v21);
          break;
      }
    }
  }

- (BOOL)_captiveDetectedCheck
{
  v8[1] = *MEMORY[0x1895F89C0];
  int captiveNotifyToken = self->_captiveNotifyToken;
  v8[0] = 0LL;
  notify_get_state(captiveNotifyToken, v8);
  uint64_t v4 = v8[0];
  logger();
  objc_super v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(v8[0]) = 67109120;
    HIDWORD(v8[0]) = v4 == 1;
    _os_log_impl( &dword_186A3B000,  v5,  OS_LOG_TYPE_DEFAULT,  "Captive network state: detected=%{BOOL}d",  (uint8_t *)v8,  8u);
  }

  if (v4 == 1)
  {
    NSErrorF_safe((void *)*MEMORY[0x189607670], (const char *)0x497F7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CUReachabilityMonitor _complete:](self, "_complete:", v6);
  }

  return v4 == 1;
}

- (void)_startDownload
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setDiscretionary:0];
  [v3 setHTTPCookieAcceptPolicy:1];
  [v3 setHTTPCookieStorage:0];
  [v3 setHTTPShouldSetCookies:0];
  [v3 setRequestCachePolicy:1];
  [v3 setURLCredentialStorage:0];
  [v3 setURLCache:0];
  [v3 setWaitsForConnectivity:1];
  id v11 = objc_alloc_init(MEMORY[0x189607988]);
  [v11 setUnderlyingQueue:self->_dispatchQueue];
  [MEMORY[0x189607AA0] sessionWithConfiguration:v3 delegate:self delegateQueue:v11];
  uint64_t v4 = (NSURLSession *)objc_claimAutoreleasedReturnValue();
  urlSession = self->_urlSession;
  self->_urlSession = v4;

  if (self->_urlSession)
  {
    v6 = self->_destinationURL;
    v7 = -[NSURLSession downloadTaskWithURL:](self->_urlSession, "downloadTaskWithURL:", v6);
    if (v7)
    {
      v9 = v7;
      LODWORD(v8) = 1.0;
      [v7 setPriority:v8];
      [v9 resume];
      goto LABEL_4;
    }
  }

  else
  {
    v6 = 0LL;
  }

  uint64_t v10 = NSErrorWithOSStatusF((const char *)0xFFFFE5D4LL);
  if (!v10) {
    goto LABEL_5;
  }
  v9 = (void *)v10;
  -[CUReachabilityMonitor _complete:](self, "_complete:", v10);
LABEL_4:

LABEL_5:
}

- (void)_pathMonitorStart
{
  v3 = nw_path_monitor_create();
  pathMonitor = self->_pathMonitor;
  self->_pathMonitor = v3;

  nw_path_monitor_set_queue(self->_pathMonitor, (dispatch_queue_t)self->_dispatchQueue);
  objc_initWeak(&location, self);
  objc_super v5 = self->_pathMonitor;
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __42__CUReachabilityMonitor__pathMonitorStart__block_invoke;
  v6[3] = &unk_189F31AA8;
  objc_copyWeak(&v7, &location);
  nw_path_monitor_set_update_handler(v5, v6);
  nw_path_monitor_start(self->_pathMonitor);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)_pathMonitorUpdated:(id)a3
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  uint64_t v4 = (nw_path *)a3;
  logger();
  objc_super v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_186A3B000, v5, OS_LOG_TYPE_DEFAULT, "Path monitor update: path=%@", (uint8_t *)&v6, 0xCu);
  }

  if (nw_path_get_status(v4) == nw_path_status_satisfied) {
    -[CUReachabilityMonitor _complete:](self, "_complete:", 0LL);
  }
}

- (void)_complete:(id)a3
{
  id v4 = a3;
  int captiveNotifyToken = self->_captiveNotifyToken;
  if (captiveNotifyToken != -1)
  {
    id v20 = v4;
    notify_cancel(captiveNotifyToken);
    id v4 = v20;
    self->_int captiveNotifyToken = -1;
  }

  if (!v4)
  {
    downloadStatus = (const char *)self->_downloadStatus;
    if (!(_DWORD)downloadStatus)
    {
      p_completionHandler = &self->_completionHandler;
      if (!self->_completionHandler)
      {
        id v22 = 0LL;
        goto LABEL_22;
      }

      goto LABEL_13;
    }

    NSErrorWithOSStatusF(downloadStatus);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }

  p_completionHandler = &self->_completionHandler;
  if (!self->_completionHandler)
  {
    id v22 = v4;
    goto LABEL_22;
  }

  if (!v4)
  {
LABEL_13:
    if (gLogCategory_CUReachability <= 30
      && (gLogCategory_CUReachability != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUReachability, 0x1Eu)))
    {
      LogPrintF( (uint64_t)&gLogCategory_CUReachability,  (uint64_t)"-[CUReachabilityMonitor _complete:]",  0x1Eu,  (uint64_t)"Reachable: <%@>\n",  v5,  v6,  v7,  v8,  (char)self->_destinationURL);
    }

    id v4 = 0LL;
    goto LABEL_21;
  }

  if (gLogCategory_CUReachability <= 60)
  {
    id v21 = v4;
    if (gLogCategory_CUReachability != -1
      || (v12 = _LogCategory_Initialize((uint64_t)&gLogCategory_CUReachability, 0x3Cu), id v4 = v21, v12))
    {
      LogPrintF( (uint64_t)&gLogCategory_CUReachability,  (uint64_t)"-[CUReachabilityMonitor _complete:]",  0x3Cu,  (uint64_t)"### Not reachable <%@>: %{error}\n",  v5,  v6,  v7,  v8,  (char)self->_destinationURL);
      id v4 = v21;
    }
  }

- (void)invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __35__CUReachabilityMonitor_invalidate__block_invoke;
  block[3] = &unk_189F34238;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  id v6 = a5;
  v27[0] = 0;
  if ([v6 getFileSystemRepresentation:v27 maxLength:1024])
  {
    int v11 = stat(v27, &v26);
    else {
      int v12 = -6743;
    }
    if (v11) {
      int v13 = v11;
    }
    else {
      int v13 = v12;
    }
    if (!v13)
    {
      objc_super v14 = (void *)[objc_alloc(MEMORY[0x189603F48]) initWithContentsOfURL:v6 options:2 error:0];
      unint64_t v15 = v14;
      if (v14)
      {
        id v16 = v14;
        int64_t v17 = (const char *)[v16 bytes];
        if (strncasestr(v17, "<BODY>Success</BODY>", [v16 length]))
        {

          self->_downloadStatus = 0;
          if (gLogCategory_CUReachability <= 30
            && (gLogCategory_CUReachability != -1
             || _LogCategory_Initialize((uint64_t)&gLogCategory_CUReachability, 0x1Eu)))
          {
            LogPrintF( (uint64_t)&gLogCategory_CUReachability,  (uint64_t)"-[CUReachabilityMonitor URLSession:downloadTask:didFinishDownloadingToURL:]",  0x1Eu,  (uint64_t)"Downloaded to <%@>, %lld bytes\n",  v22,  v23,  v24,  v25,  (char)v6);
          }

          goto LABEL_19;
        }

        int v13 = 301048;
        if (gLogCategory_CUReachability <= 60
          && (gLogCategory_CUReachability != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUReachability, 0x3Cu)))
        {
          LogPrintF( (uint64_t)&gLogCategory_CUReachability,  (uint64_t)"-[CUReachabilityMonitor URLSession:downloadTask:didFinishDownloadingToURL:]",  0x3Cu,  (uint64_t)"### Downloaded content mismatch:\n%.2H\n",  v18,  v19,  v20,  v21,  (char)v17);
        }
      }

      else
      {
        int v13 = -6755;
      }
    }
  }

  else
  {
    int v13 = -6704;
  }

  self->_downloadStatus = v13;
  if (gLogCategory_CUReachability <= 60
    && (gLogCategory_CUReachability != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUReachability, 0x3Cu)))
  {
    LogPrintF( (uint64_t)&gLogCategory_CUReachability,  (uint64_t)"-[CUReachabilityMonitor URLSession:downloadTask:didFinishDownloadingToURL:]",  0x3Cu,  (uint64_t)"### Downloaded to <%@> bad: %#m\n",  v7,  v8,  v9,  v10,  (char)v6);
  }

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v11 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if ([v11 code] == -1001)
  {
    if (gLogCategory_CUReachability <= 60
      && (gLogCategory_CUReachability != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUReachability, 0x3Cu)))
    {
      LogPrintF( (uint64_t)&gLogCategory_CUReachability,  (uint64_t)"-[CUReachabilityMonitor URLSession:task:didCompleteWithError:]",  0x3Cu,  (uint64_t)"### CFURL timeout for <%@>: %{error}, retrying...\n",  v6,  v7,  v8,  v9,  (char)self->_destinationURL);
    }

    -[NSURLSession invalidateAndCancel](self->_urlSession, "invalidateAndCancel");
    urlSession = self->_urlSession;
    self->_urlSession = 0LL;

    -[CUReachabilityMonitor _startDownload](self, "_startDownload");
  }

  else
  {
    -[CUReachabilityMonitor _complete:](self, "_complete:", v11);
  }
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (NSURL)destinationURL
{
  return self->_destinationURL;
}

- (void)setDestinationURL:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setMode:(int64_t)a3
{
  self->_unint64_t mode = a3;
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_double timeout = a3;
}

- (void).cxx_destruct
{
}

void __35__CUReachabilityMonitor_invalidate__block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  if (gLogCategory_CUReachability <= 30
    && (gLogCategory_CUReachability != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUReachability, 0x1Eu)))
  {
    LogPrintF( (uint64_t)&gLogCategory_CUReachability,  (uint64_t)"-[CUReachabilityMonitor invalidate]_block_invoke",  0x1Eu,  (uint64_t)"Invalidate\n",  a5,  a6,  a7,  a8,  v10);
  }

  uint64_t v9 = *(void **)(a1 + 32);
  if (v9[5])
  {
    NSErrorWithOSStatusF((const char *)0xFFFFE5BDLL);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    [v9 _complete:v11];
  }

  else
  {
    [v9 _complete:0];
  }

void __42__CUReachabilityMonitor__pathMonitorStart__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _pathMonitorUpdated:v3];
}

void __34__CUReachabilityMonitor__activate__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _captiveDetectedCheck];
}

void __34__CUReachabilityMonitor__activate__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  NSErrorF_safe((void *)*MEMORY[0x189607670], (const char *)0xFFFFE5BELL);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  [WeakRetained _complete:v1];
}

uint64_t __33__CUReachabilityMonitor_activate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activate];
}

@end