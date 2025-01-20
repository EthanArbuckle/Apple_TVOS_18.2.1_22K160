@interface __NSCFLocalSessionTask
- (BOOL)_needSendingMetrics;
- (_BYTE)_finishAllow;
- (__NSCFLocalSessionTask)initWithBackgroundTaskInfo:(id)a3 taskGroup:(id)a4;
- (__NSCFLocalSessionTask)initWithOriginalRequest:(id)a3 ident:(unint64_t)a4 taskGroup:(id)a5;
- (__NSCFURLSessionConnection)cfConn;
- (id).cxx_construct;
- (id)_onqueue_strippedMutableRequest;
- (id)error:(id)a3 code:(int64_t)a4;
- (id)resourceTimeoutError;
- (uint64_t)_finishBecomeDownload:(uint64_t)result;
- (uint64_t)_finishBecomeStream:(void *)a3 forConnection:(uint64_t)a4 completionHandler:;
- (uint64_t)_onqueue_suspendWorkQueue;
- (uint64_t)timeoutErrorWithStreamErrorCode:(void *)a1;
- (void)_didSendMetrics;
- (void)_onSessionQueue_disavow;
- (void)_onqueue_adjustBytesPerSecondLimit:(int64_t)a3;
- (void)_onqueue_adjustPoolPriority;
- (void)_onqueue_adjustPriorityHint:(float)a3 incremental:(BOOL)a4;
- (void)_onqueue_alternatePathAvailable:(int)a3;
- (void)_onqueue_cancel;
- (void)_onqueue_cancel_with_error:(id)a3;
- (void)_onqueue_completeInitialization;
- (void)_onqueue_conditionalRequirementsChanged:(BOOL)a3;
- (void)_onqueue_connectionWaitingWithReason:(int64_t)a3;
- (void)_onqueue_didFinishWithError:(id)a3;
- (void)_onqueue_didReceiveChallenge:(id)a3 request:(id)a4 withCompletion:(id)a5;
- (void)_onqueue_didReceiveDispatchData:(id)a3 completion:(id)a4;
- (void)_onqueue_didReceiveResponse:(id)a3 completion:(id)a4;
- (void)_onqueue_didReceiveResponse:(id)a3 redirectRequest:(id)a4 withCompletion:(id)a5;
- (void)_onqueue_didSendBodyBytes:(int64_t)a3 totalBytesSent:(int64_t)a4 totalBytesExpectedToSend:(int64_t)a5;
- (void)_onqueue_expectedProgressTargetChanged;
- (void)_onqueue_needNewBodyStream:(id)a3 fromOffset:(int64_t)a4 withCompletion:(id)a5;
- (void)_onqueue_needNewBodyStream:(id)a3 withCompletion:(id)a4;
- (void)_onqueue_resume;
- (void)_onqueue_setupNextEffectiveConfigurationWithCompletionHandler:(id)a3;
- (void)_onqueue_startResourceTimer:(uint64_t)a1;
- (void)_onqueue_startStartTimer;
- (void)_onqueue_startTimer:(int64_t)a3 withTimeoutInNanos:(int)a4 streamErrorCode:;
- (void)_onqueue_suspend;
- (void)_onqueue_willCacheResponse:(id)a3 withCompletion:(id)a4;
- (void)_onqueue_willSendRequestForEstablishedConnection:(id)a3 withCompletion:(id)a4;
- (void)_private_onqueue_didReceiveResponseDisposition:(int64_t)a3 completion:(id)a4;
- (void)_setConnectionCacheKey:(void *)a3;
- (void)_task_onqueue_didFinish;
- (void)_task_onqueue_didReceiveDispatchData:(id)a3 completionHandler:(id)a4;
- (void)cancel_with_error:(id)a3;
- (void)connection:(id)a3 _conditionalRequirementsChanged:(BOOL)a4;
- (void)connection:(id)a3 _willSendRequestForEstablishedConnection:(id)a4 completion:(id)a5;
- (void)connection:(id)a3 alternatePathAvailable:(int)a4;
- (void)connection:(id)a3 challenged:(id)a4 authCallback:(id)a5;
- (void)connection:(id)a3 didFinishLoadingWithError:(id)a4;
- (void)connection:(id)a3 didReceiveData:(id)a4 completion:(id)a5;
- (void)connection:(id)a3 didReceiveInformationalResponse:(id)a4;
- (void)connection:(id)a3 didReceiveResponse:(id)a4 completion:(id)a5;
- (void)connection:(id)a3 didReceiveSocketInputStream:(id)a4 outputStream:(id)a5;
- (void)connection:(id)a3 didReceiveTCPConnection:(shared_ptr<TransportConnection>)a4 extraBytes:(id)a5;
- (void)connection:(id)a3 request:(id)a4 needsNewBodyStreamCallback:(id)a5;
- (void)connection:(id)a3 request:(id)a4 needsNewBodyStreamFromOffset:(int64_t)a5 callback:(id)a6;
- (void)connection:(id)a3 sentBodyBytes:(id)a4 totalBytes:(id)a5 expectedBytes:(id)a6;
- (void)connection:(id)a3 waitingWithReason:(int64_t)a4;
- (void)connection:(id)a3 wasRedirected:(id)a4 newRequest:(id)a5 responseCallback:(id)a6;
- (void)connection:(id)a3 willCacheResponse:(id)a4 responseCallback:(id)a5;
- (void)connectionWillFinishLoading:(id)a3;
- (void)dealloc;
- (void)localSession;
- (void)setCfConn:(id)a3;
- (void)setConnection:(void *)a1;
- (void)set_TLSMaximumSupportedProtocolVersion:(unsigned __int16)a3;
- (void)set_TLSMinimumSupportedProtocolVersion:(unsigned __int16)a3;
- (void)set_timeoutIntervalForResource:(double)a3;
- (void)startResourceTimer;
@end

@implementation __NSCFLocalSessionTask

- (id).cxx_construct
{
  *((void *)self + 111) = 0LL;
  *((void *)self + 112) = 0LL;
  return self;
}

- (__NSCFLocalSessionTask)initWithOriginalRequest:(id)a3 ident:(unint64_t)a4 taskGroup:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS_____NSCFLocalSessionTask;
  v6 = -[NSURLSessionTask initWithOriginalRequest:ident:taskGroup:]( &v10,  sel_initWithOriginalRequest_ident_taskGroup_,  a3,  a4,  a5);
  v7 = v6;
  if (v6)
  {
    v6->_connKeyLock._os_unfair_lock_opaque = 0;
    v6->_suspendCount = 1LL;
    objc_msgSend((id)objc_msgSend(a3, "_startTimeoutDate"), "timeIntervalSinceReferenceDate");
    v7->_startTimeoutTime = v8;
    -[NSURLSessionTask setState:](v7, "setState:", 1LL);
  }

  return v7;
}

- (void)_onqueue_resume
{
  if (self)
  {
    unint64_t v3 = self->_suspendCount - 1;
    self->_suspendCount = v3;
    if (!v3)
    {
      -[NSURLSessionTask setState:](self, "setState:", 0LL);
      if (objc_getProperty(self, v4, 808LL, 1))
      {
        -[__NSCFLocalSessionTask _onqueue_completeInitialization](self, "_onqueue_completeInitialization");
      }

      else if (-[__NSCFLocalSessionTask cfConn](self, "cfConn"))
      {
        -[__NSCFURLSessionConnection resume](-[__NSCFLocalSessionTask cfConn](self, "cfConn"), "resume");
      }
    }
  }

- (void)_onqueue_completeInitialization
{
  if (self)
  {
    id Property = objc_getProperty(self, a2, 808LL, 1);
    SEL v4 = (void (**)(void *, __NSCFLocalSessionTask *, uint64_t))_Block_copy(Property);
    objc_setProperty_atomic_copy(self, v5, 0LL, 808LL);
  }

  else
  {
    SEL v4 = (void (**)(void *, __NSCFLocalSessionTask *, uint64_t))_Block_copy(0LL);
  }

  v4[2](v4, self, 1LL);
  _Block_release(v4);
}

- (id)_onqueue_strippedMutableRequest
{
  unint64_t v3 = (void *)-[NSURLRequest mutableCopy](-[NSURLSessionTask currentRequest](self, "currentRequest"), "mutableCopy");
  [v3 setHTTPBody:0];
  [v3 setHTTPBodyStream:0];
  [v3 setValue:0 forHTTPHeaderField:@"Transfer-Encoding"];
  -[NSURLSessionTask updateCurrentRequest:](self, "updateCurrentRequest:", v3);
  return v3;
}

- (void)_onqueue_setupNextEffectiveConfigurationWithCompletionHandler:(id)a3
{
  SEL v5 = -[NSURLSessionTask _effectiveConfiguration](self, "_effectiveConfiguration");
  if (self)
  {
    internalDelegateWrapper = self->super._internalDelegateWrapper;
  }

  else
  {
    internalDelegateWrapper = 0LL;
  }

  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __88____NSCFLocalSessionTask__onqueue_setupNextEffectiveConfigurationWithCompletionHandler___block_invoke;
  v7[3] = &unk_189C024E8;
  v7[4] = self;
  v7[5] = v5;
  v7[6] = a3;
  -[__NSCFURLSessionDelegateWrapper task:_willUseEffectiveConfiguration:completionHandler:]( (uint64_t)internalDelegateWrapper,  self,  v5,  v7);
}

- (void)setConnection:(void *)a1
{
  if (a1)
  {
    [a1 setCfConn:a2];
    if (a2)
    {
      [a1 _timeoutIntervalForResource];
      -[__NSCFLocalSessionTask _onqueue_startResourceTimer:]((uint64_t)a1, v4);
      -[__NSCFLocalSessionTask _onqueue_startStartTimer]((uint64_t)a1);
    }

    else
    {
      SEL v5 = (dispatch_source_s *)a1[102];
      if (v5)
      {
        a1[102] = 0LL;
        dispatch_source_cancel(v5);
        dispatch_release(v5);
      }

      v6 = (dispatch_source_s *)a1[106];
      if (v6)
      {
        a1[106] = 0LL;
        dispatch_source_cancel(v6);
        dispatch_release(v6);
      }

      v7 = (dispatch_source_s *)a1[107];
      if (v7)
      {
        a1[107] = 0LL;
        dispatch_source_cancel(v7);
        dispatch_release(v7);
      }

      double v8 = (dispatch_source_s *)a1[108];
      if (v8)
      {
        a1[108] = 0LL;
        dispatch_source_cancel(v8);
        dispatch_release(v8);
      }
    }
  }

- (void)setCfConn:(id)a3
{
}

- (void)_onqueue_startResourceTimer:(uint64_t)a1
{
  if (v4 != 0.0 && !*(void *)(a1 + 816))
  {
    if (*(double *)(a1 + 840) == 0.0)
    {
      if (a2 <= 0.0) {
        return;
      }
    }

    else
    {
      objc_msgSend((id)objc_msgSend((id)a1, "currentRequest"), "_payloadTransmissionTimeout");
      if (a2 <= 0.0 || v5 != 0.0) {
        return;
      }
    }

    [(id)a1 startTime];
    double v7 = v6 + a2;
    [MEMORY[0x189603F50] timeIntervalSinceReferenceDate];
    double v9 = v7 - v8;
    if (v9 <= 31536000.0)
    {
      int64_t v10 = (uint64_t)(v9 * 1000000000.0);
      if (v10 < 1)
      {
        objc_msgSend( (id)a1,  "_onqueue_cancel_with_error:",  -[__NSCFLocalSessionTask timeoutErrorWithStreamErrorCode:]((void *)a1, 4294965193));
      }

      else
      {
        v11 = (dispatch_queue_s *)[(id)a1 workQueue];
        v12 = dispatch_source_create(MEMORY[0x1895F8B78], 0LL, 0LL, v11);
        *(void *)(a1 + 816) = v12;
        -[__NSCFLocalSessionTask _onqueue_startTimer:withTimeoutInNanos:streamErrorCode:]((void *)a1, v12, v10, -2103);
      }
    }
  }

- (void)_onqueue_startTimer:(int64_t)a3 withTimeoutInNanos:(int)a4 streamErrorCode:
{
  id v8 = a1;
  uint64_t v9 = MEMORY[0x1895F87A8];
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __81____NSCFLocalSessionTask__onqueue_startTimer_withTimeoutInNanos_streamErrorCode___block_invoke;
  block[3] = &unk_189C1A318;
  block[4] = a1;
  int v14 = a4;
  dispatch_block_t v10 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_source_set_event_handler(a2, v10);
  _Block_release(v10);
  handler[0] = v9;
  handler[1] = 3221225472LL;
  handler[2] = __81____NSCFLocalSessionTask__onqueue_startTimer_withTimeoutInNanos_streamErrorCode___block_invoke_2;
  handler[3] = &unk_189C1A548;
  handler[4] = a1;
  dispatch_source_set_cancel_handler(a2, handler);
  dispatch_time_t v11 = dispatch_time(0x8000000000000000LL, a3);
  dispatch_source_set_timer(a2, v11, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  dispatch_resume(a2);
}

- (void)_onqueue_startStartTimer
{
  if (a1)
  {
    if (*(double *)(a1 + 840) > 0.0)
    {
      [(id)a1 startTime];
      if (v2 != 0.0 && !*(void *)(a1 + 848))
      {
        double v3 = *(double *)(a1 + 840);
        [MEMORY[0x189603F50] timeIntervalSinceReferenceDate];
        int64_t v5 = (uint64_t)((v3 - v4) * 1000000000.0);
        if (v5 < 1)
        {
          objc_msgSend( (id)a1,  "_onqueue_cancel_with_error:",  -[__NSCFLocalSessionTask timeoutErrorWithStreamErrorCode:]((void *)a1, 4294965191));
        }

        else
        {
          double v6 = (dispatch_queue_s *)[(id)a1 workQueue];
          double v7 = dispatch_source_create(MEMORY[0x1895F8B78], 0LL, 0LL, v6);
          *(void *)(a1 + 848) = v7;
          -[__NSCFLocalSessionTask _onqueue_startTimer:withTimeoutInNanos:streamErrorCode:]((void *)a1, v7, v5, -2105);
        }
      }
    }
  }

- (void)_setConnectionCacheKey:(void *)a3
{
  if (a3) {
    (*(void (**)(void *, SEL))(*(void *)a3 + 40LL))(a3, a2);
  }
  os_unfair_lock_lock(&self->_connKeyLock);
  connKey = self->_connKey;
  self->_connKey = a3;
  os_unfair_lock_unlock(&self->_connKeyLock);
  if (connKey) {
    (*(void (**)(void *))(*(void *)connKey + 48LL))(connKey);
  }
}

- (void)connection:(id)a3 sentBodyBytes:(id)a4 totalBytes:(id)a5 expectedBytes:(id)a6
{
  uint64_t v8 = MEMORY[0x1895F87A8];
  uint64_t v9 = 3221225472LL;
  dispatch_block_t v10 = __76____NSCFLocalSessionTask_connection_sentBodyBytes_totalBytes_expectedBytes___block_invoke;
  dispatch_time_t v11 = &unk_189C136C0;
  v12 = self;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (self)
  {
    connectionWorkQueue = self->_connectionWorkQueue;
    if (connectionWorkQueue) {
      -[NSOperationQueue addOperationWithBlock:](connectionWorkQueue, "addOperationWithBlock:", &v8);
    }
    else {
      -[__NSCFLocalSessionTask _onqueue_didSendBodyBytes:totalBytesSent:totalBytesExpectedToSend:]( self,  "_onqueue_didSendBodyBytes:totalBytesSent:totalBytesExpectedToSend:",  objc_msgSend(a4, "longLongValue", a3, v8, v9, v10, v11, v12, v13, v14, v15),  objc_msgSend(a5, "longLongValue"),  objc_msgSend(a6, "longLongValue"));
    }
  }

- (void)_onqueue_didSendBodyBytes:(int64_t)a3 totalBytesSent:(int64_t)a4 totalBytesExpectedToSend:(int64_t)a5
{
  if (self)
  {
    internalDelegateWrapper = self->super._internalDelegateWrapper;
  }

  else
  {
    internalDelegateWrapper = 0LL;
  }

  -[__NSCFURLSessionDelegateWrapper task:didSendBodyData:totalBytesSent:totalBytesExpectedToSend:]( (uint64_t)internalDelegateWrapper,  self,  a3,  a4,  a5);
}

- (void)dealloc
{
  if (self->_resourceTimeout) {
    __assert_rtn("-[__NSCFLocalSessionTask dealloc]", "LocalSessionTask.mm", 384, "_resourceTimeout == NULL");
  }
  double v3 = -[__NSCFLocalSessionTask localSession](self);
  -[__NSURLSessionLocal removeUnresumedTask:]((uint64_t)v3, (uint64_t)self);

  id dataTaskCompletion = self->_dataTaskCompletion;
  if (dataTaskCompletion) {
    _Block_release(dataTaskCompletion);
  }
  dataTaskData = (dispatch_object_s *)self->_dataTaskData;
  if (dataTaskData) {
    dispatch_release(dataTaskData);
  }
  pendingResponseBytes = (dispatch_object_s *)self->_pendingResponseBytes;
  if (pendingResponseBytes) {
    dispatch_release(pendingResponseBytes);
  }
  id async_initialization = self->_async_initialization;
  if (async_initialization) {
    _Block_release(async_initialization);
  }
  connKey = self->_connKey;
  if (connKey) {
    (*(void (**)(void *))(*(void *)connKey + 48LL))(connKey);
  }
  socketReadStreamForUpgrade = self->_socketReadStreamForUpgrade;
  if (socketReadStreamForUpgrade)
  {
    -[NSInputStream close](socketReadStreamForUpgrade, "close");

    self->_socketReadStreamForUpgrade = 0LL;
  }

  socketWriteStreamForUpgrade = self->_socketWriteStreamForUpgrade;
  if (socketWriteStreamForUpgrade)
  {
    -[NSOutputStream close](socketWriteStreamForUpgrade, "close");

    self->_socketWriteStreamForUpgrade = 0LL;
  }

  connectionWorkQueue = self->_connectionWorkQueue;
  if (connectionWorkQueue)
  {

    self->_connectionWorkQueue = 0LL;
  }

  extraBytes = (dispatch_object_s *)self->_extraBytes;
  if (extraBytes)
  {
    dispatch_release(extraBytes);
    self->_extraBytes = 0LL;
  }

  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS_____NSCFLocalSessionTask;
  -[NSURLSessionTask dealloc](&v13, sel_dealloc);
}

- (void)localSession
{
  if (result)
  {
    v1 = result;
    [result session];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 && os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)double v2 = 0;
      _os_log_fault_impl( &dword_18298D000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_FAULT,  "local tasks should have local sessions",  v2,  2u);
    }

    return (void *)[v1 session];
  }

  return result;
}

- (void).cxx_destruct
{
}

- (void)connection:(id)a3 didReceiveResponse:(id)a4 completion:(id)a5
{
  if (!self->_didCheckMixedReplace)
  {
    self->_didCheckMixedReplace = 1;
    uint64_t v10 = *(void *)(objc_msgSend(a4, "_inner", a3) + 88);
    if (v10)
    {
      if ((*(_WORD *)(v10 + 297) & 0x8000) != 0)
      {
        dispatch_time_t v11 = (NSOperationQueue *)objc_opt_new();
        self->_connectionWorkQueue = v11;
        -[NSOperationQueue setMaxConcurrentOperationCount:](v11, "setMaxConcurrentOperationCount:", 1LL);
        v12 = -[NSURLSessionTask session](self, "session");
        if (v12) {
          workQueue = v12->_workQueue;
        }
        else {
          workQueue = 0LL;
        }
        -[NSOperationQueue setUnderlyingQueue:](self->_connectionWorkQueue, "setUnderlyingQueue:", workQueue);
      }
    }
  }

  uint64_t v8 = MEMORY[0x1895F87A8];
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  v14[2] = __67____NSCFLocalSessionTask_connection_didReceiveResponse_completion___block_invoke;
  v14[3] = &unk_189C1A480;
  v14[4] = self;
  v14[5] = a4;
  v14[6] = a5;
  connectionWorkQueue = self->_connectionWorkQueue;
  if (connectionWorkQueue)
  {
    -[NSOperationQueue addOperationWithBlock:](connectionWorkQueue, "addOperationWithBlock:", v14);
  }

  else
  {
    -[__NSCFLocalSessionTask _onqueue_suspendWorkQueue]((uint64_t)self);
    v15[0] = v8;
    v15[1] = 3221225472LL;
    v15[2] = __67____NSCFLocalSessionTask_connection_didReceiveResponse_completion___block_invoke_2;
    v15[3] = &unk_189C1A5C0;
    v15[4] = self;
    v15[5] = a5;
    -[__NSCFLocalSessionTask _onqueue_didReceiveResponse:completion:]( self,  "_onqueue_didReceiveResponse:completion:",  a4,  v15);
  }

- (__NSCFURLSessionConnection)cfConn
{
  return (__NSCFURLSessionConnection *)objc_getProperty(self, a2, 760LL, 1);
}

- (void)_onqueue_suspend
{
  if (!self || (unint64_t suspendCount = self->_suspendCount, self->_unint64_t suspendCount = suspendCount + 1, !suspendCount))
  {
    -[NSURLSessionTask setState:](self, "setState:", 1LL);
    if (-[__NSCFLocalSessionTask cfConn](self, "cfConn")) {
      -[__NSCFURLSessionConnection suspend](-[__NSCFLocalSessionTask cfConn](self, "cfConn"), "suspend");
    }
  }

- (void)_private_onqueue_didReceiveResponseDisposition:(int64_t)a3 completion:(id)a4
{
  switch(a3)
  {
    case 0LL:
      goto LABEL_2;
    case 1LL:
      if (self) {
        goto LABEL_18;
      }
      goto LABEL_19;
    case 2LL:
      if (!self) {
        goto LABEL_2;
      }
      internalDelegateWrapper = self->super._internalDelegateWrapper;
      if (!internalDelegateWrapper)
      {
        internalDelegateWrapper = self->super._publicDelegateWrapper;
      }

      if ((-[__NSCFURLSessionDelegateWrapper check_didBecomeDownloadTask]( (unsigned __int8 *)internalDelegateWrapper,  a2) & 1) == 0 && (-[__NSCFURLSessionDelegateWrapper check_didBecomeDownloadTask]( (unsigned __int8 *)internalDelegateWrapper->_fallbackDelegateWrapper,  v8) & 1) == 0)
      {
        goto LABEL_2;
      }

      uint64_t v9 = -[__NSCFLocalSessionTask cfConn](self, "cfConn");
      -[__NSCFLocalSessionTask setConnection:](self, 0LL);
      uint64_t v10 = objc_alloc(&OBJC_CLASS_____NSCFLocalDownloadTask);
      if (!v10) {
        goto LABEL_53;
      }
      v10->_initialResumeSize = -1LL;
      v43.receiver = v10;
      v43.super_class = (Class)&OBJC_CLASS_____NSCFLocalSessionTask;
      dispatch_time_t v11 = -[NSURLSessionTask initWithTask:](&v43, sel_initWithTask_, self);
      v12 = v11;
      if (v11)
      {
        v11->_connKeyLock._os_unfair_lock_opaque = 0;
        v11->_unint64_t suspendCount = 1LL;
        -[__NSCFLocalSessionTask setConnection:](v11, (uint64_t)-[__NSCFLocalSessionTask cfConn](self, "cfConn"));
        -[NSURLSessionTask setState:](v12, "setState:", 1LL);
        -[__NSCFLocalSessionTask setCfConn:](v12, "setCfConn:", v9);
        objc_super v13 = -[__NSCFLocalSessionTask cfConn](v12, "cfConn");
        if (v13) {
          objc_setProperty_atomic_copy(v13, v14, v12, 8LL);
        }
        id v15 = -[__NSCFLocalSessionTask cfConn](v12, "cfConn");
        if (v15) {
          objc_setProperty_atomic(v15, v16, v12, 24LL);
        }
        -[__NSCFURLSessionConnection setIsDownload:]( -[__NSCFLocalSessionTask cfConn](v12, "cfConn"),  "setIsDownload:",  1LL);
        -[NSURLSessionTask setPrefersIncrementalDelivery:](v12, "setPrefersIncrementalDelivery:", 0LL);
        if (-[__NSCFLocalDownloadTask setupForNewDownload:](v12, 0LL))
        {
          v12->_unint64_t suspendCount = 1LL;
          -[NSURLSessionTask setState:](v12, "setState:", 1LL);
        }

        else
        {

LABEL_53:
          v12 = 0LL;
        }
      }

      v37 = (id *)-[__NSCFLocalSessionTask localSession](self);
      -[__NSURLSessionLocal replaceTask:withTask:](v37, self, v12);
      publicDelegateWrapper = self->super._internalDelegateWrapper;
      if (!publicDelegateWrapper) {
        publicDelegateWrapper = self->super._publicDelegateWrapper;
      }
      v41[0] = MEMORY[0x1895F87A8];
      v41[1] = 3221225472LL;
      v41[2] = __84____NSCFLocalSessionTask__private_onqueue_didReceiveResponseDisposition_completion___block_invoke_2;
      v41[3] = &unk_189C1A270;
      v41[4] = self;
      v41[5] = v12;
      -[__NSCFURLSessionDelegateWrapper dataTask:didBecomeDownloadTask:completionHandler:]( (uint64_t)publicDelegateWrapper,  self,  v12,  v41);
      goto LABEL_57;
    case 3LL:
      if (self)
      {
        v18 = self->super._internalDelegateWrapper;
        if ((v18 || (v18 = self->super._publicDelegateWrapper) != 0LL)
          && ((-[__NSCFURLSessionDelegateWrapper check_didBecomeStreamTask]((unsigned __int8 *)v18, a2) & 1) != 0
           || (-[__NSCFURLSessionDelegateWrapper check_didBecomeStreamTask]( (unsigned __int8 *)v18->_fallbackDelegateWrapper,  v19) & 1) != 0))
        {
          v20 = (id *)-[__NSCFLocalSessionTask localSession](self);
          v21 = -[__NSCFLocalSessionTask cfConn](self, "cfConn");
          v22 = (void *)MEMORY[0x1895F87A8];
          if (self->_connectionForUpgrade.__ptr_)
          {
            if (self->_pendingResponseBytes) {
              __assert_rtn( "-[__NSCFLocalSessionTask _private_onqueue_becomeStreamTaskWithCompletionHandler:]",  "LocalSessionTask.mm",  525,  "_pendingResponseBytes == nil");
            }
            v23 = objc_alloc(&OBJC_CLASS_____NSCFURLLocalTCPIOStreamTaskFromDataTask);
            cntrl = self->_connectionForUpgrade.__cntrl_;
            ptr = self->_connectionForUpgrade.__ptr_;
            v57 = cntrl;
            if (cntrl)
            {
              v25 = (unint64_t *)((char *)cntrl + 8);
              do
                unint64_t v26 = __ldxr(v25);
              while (__stxr(v26 + 1, v25));
            }

            extraBytes = self->_extraBytes;
            v50 = v22;
            uint64_t v51 = 3221225472LL;
            v52 = __81____NSCFLocalSessionTask__private_onqueue_becomeStreamTaskWithCompletionHandler___block_invoke;
            v53 = &unk_189C024C0;
            v54 = v20;
            v55 = v21;
            v28 = -[__NSCFURLLocalTCPIOStreamTaskFromDataTask initWithTask:connection:extraBytes:disavow:]( v23,  "initWithTask:connection:extraBytes:disavow:",  self,  &ptr,  extraBytes,  &v50);
            v29 = (std::__shared_weak_count *)v57;
            if (v57)
            {
              v30 = (unint64_t *)((char *)v57 + 8);
              do
                unint64_t v31 = __ldaxr(v30);
              while (__stlxr(v31 - 1, v30));
              if (!v31)
              {
                ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
                std::__shared_weak_count::__release_weak(v29);
              }
            }
          }

          else
          {
            v50 = (void *)MEMORY[0x1895F87A8];
            uint64_t v51 = 3221225472LL;
            v52 = __81____NSCFLocalSessionTask__private_onqueue_becomeStreamTaskWithCompletionHandler___block_invoke_2;
            v53 = &unk_189C024C0;
            v54 = v20;
            v55 = v21;
            v28 = -[__NSCFURLLocalStreamTaskFromDataTask initWithTask:disavow:]( objc_alloc(&OBJC_CLASS_____NSCFURLLocalStreamTaskFromDataTask),  "initWithTask:disavow:",  self,  &v50);
          }

          uint64_t v32 = objc_opt_class();
          if (v32 == objc_opt_class())
          {
            if (!v21)
            {
LABEL_49:
              -[__NSCFLocalSessionTask setConnection:](self, 0LL);
              -[__NSURLSessionLocal replaceTask:withTask:](v20, self, v28);
              v36 = self->super._internalDelegateWrapper;
              if (!v36) {
                v36 = self->super._publicDelegateWrapper;
              }
              v43.receiver = v22;
              v43.super_class = (Class)3221225472LL;
              v44 = __81____NSCFLocalSessionTask__private_onqueue_becomeStreamTaskWithCompletionHandler___block_invoke_3;
              v45 = &unk_189C15848;
              v46 = self;
              v47 = v28;
              v48 = v21;
              id v49 = a4;
              -[__NSCFURLSessionDelegateWrapper dataTask:didBecomeStreamTask:completionHandler:]( (uint64_t)v36,  self,  v28,  &v43);
              return;
            }
          }

          else
          {
            uint64_t v34 = objc_opt_class();
            if (v34 != objc_opt_class() || v21 == 0LL) {
              goto LABEL_49;
            }
          }

          objc_setProperty_atomic(v21, v33, v28, 24LL);
          goto LABEL_49;
        }
      }

- (void)connection:(id)a3 didReceiveData:(id)a4 completion:(id)a5
{
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __63____NSCFLocalSessionTask_connection_didReceiveData_completion___block_invoke;
  v5[3] = &unk_189C1A480;
  v5[4] = self;
  v5[5] = a4;
  v5[6] = a5;
  if (self)
  {
    if (self->_connectionWorkQueue) {
      -[NSOperationQueue addOperationWithBlock:](self->_connectionWorkQueue, "addOperationWithBlock:", v5);
    }
    else {
      -[__NSCFLocalSessionTask _onqueue_didReceiveDispatchData:completion:]( self,  "_onqueue_didReceiveDispatchData:completion:",  a4,  a5);
    }
  }

- (void)_onqueue_didReceiveDispatchData:(id)a3 completion:(id)a4
{
  if (-[NSURLSessionTask state](self, "state") < NSURLSessionTaskStateCanceling)
  {
    -[NSURLSessionTask setCountOfBytesReceived:]( self,  "setCountOfBytesReceived:",  -[NSURLSessionTask countOfBytesReceived](self, "countOfBytesReceived")
    + dispatch_data_get_size((dispatch_data_t)a3));
    if (!self || !self->_pendingResponseDisposition)
    {
      -[__NSCFLocalSessionTask _task_onqueue_didReceiveDispatchData:completionHandler:]( self,  "_task_onqueue_didReceiveDispatchData:completionHandler:",  a3,  a4);
      return;
    }

    pendingResponseBytes = (dispatch_object_s *)self->_pendingResponseBytes;
    if (pendingResponseBytes)
    {
      self->_pendingResponseBytes = (OS_dispatch_data *)dispatch_data_create_concat( (dispatch_data_t)self->_pendingResponseBytes,  (dispatch_data_t)a3);
      dispatch_release(pendingResponseBytes);
    }

    else
    {
      dispatch_retain((dispatch_object_t)a3);
      self->_pendingResponseBytes = (OS_dispatch_data *)a3;
    }
  }

  (*((void (**)(id))a4 + 2))(a4);
}

- (void)_task_onqueue_didReceiveDispatchData:(id)a3 completionHandler:(id)a4
{
  if (!self)
  {
    uint64_t v8 = 0LL;
LABEL_8:
    -[__NSCFURLSessionDelegateWrapper dataTask:didReceiveData:completionHandler:]((uint64_t)self, v8, a3, a4);
    return;
  }

  double v6 = self;
  if (!objc_getProperty(self, a2, 784LL, 1))
  {
    self = (__NSCFLocalSessionTask *)v6->super._internalDelegateWrapper;
    if (!self) {
      self = (__NSCFLocalSessionTask *)v6->super._publicDelegateWrapper;
    }
    uint64_t v8 = v6;
    goto LABEL_8;
  }

  dataTaskData = (dispatch_object_s *)v6->_dataTaskData;
  if (dataTaskData)
  {
    v6->_dataTaskData = (OS_dispatch_data *)dispatch_data_create_concat( (dispatch_data_t)v6->_dataTaskData,  (dispatch_data_t)a3);
    dispatch_release(dataTaskData);
  }

  else
  {
    if (a3) {
      dispatch_retain((dispatch_object_t)a3);
    }
    v6->_dataTaskData = (OS_dispatch_data *)a3;
  }

  (*((void (**)(id))a4 + 2))(a4);
}

- (void)connectionWillFinishLoading:(id)a3
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __54____NSCFLocalSessionTask_connectionWillFinishLoading___block_invoke;
  v3[3] = &unk_189C1A548;
  v3[4] = self;
  if (self)
  {
    if (self->_connectionWorkQueue) {
      -[NSOperationQueue addOperationWithBlock:](self->_connectionWorkQueue, "addOperationWithBlock:", v3);
    }
    else {
      -[NSURLSessionTask _releasePreventIdleSleepAssertionIfAppropriate]( self,  "_releasePreventIdleSleepAssertionIfAppropriate",  a3);
    }
  }

- (void)connection:(id)a3 didFinishLoadingWithError:(id)a4
{
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __63____NSCFLocalSessionTask_connection_didFinishLoadingWithError___block_invoke;
  v4[3] = &unk_189C1A270;
  v4[4] = self;
  v4[5] = a4;
  if (self)
  {
    if (self->_connectionWorkQueue) {
      -[NSOperationQueue addOperationWithBlock:](self->_connectionWorkQueue, "addOperationWithBlock:", v4);
    }
    else {
      -[__NSCFLocalSessionTask _onqueue_didFinishWithError:](self, "_onqueue_didFinishWithError:", a4);
    }
  }

- (void)_onqueue_didFinishWithError:(id)a3
{
  if (!-[NSURLSessionTask error](self, "error"))
  {
    -[NSURLSessionTask setError:](self, "setError:", a3);
    -[__NSCFLocalSessionTask _task_onqueue_didFinish](self, "_task_onqueue_didFinish");
  }

- (void)_task_onqueue_didFinish
{
  double v3 = -[NSError domain](-[NSURLSessionTask error](self, "error"), "domain");
  if (-[NSString isEqualToString:](v3, "isEqualToString:", *MEMORY[0x189607740])
    && -[NSError code](-[NSURLSessionTask error](self, "error"), "code") == -999)
  {
    os_unfair_lock_lock(&self->_connKeyLock);
    connKey = self->_connKey;
    if (connKey)
    {
      (*(void (**)(void *))(*(void *)connKey + 40LL))(self->_connKey);
      os_unfair_lock_unlock(&self->_connKeyLock);
      int64_t v5 = -[__NSCFLocalSessionTask localSession](self);
      if (v5)
      {
        uint64_t v6 = v5[21];
        if (v6)
        {
          pthread_mutex_lock((pthread_mutex_t *)(v6 + 40));
          context[0] = MEMORY[0x1895F87A8];
          context[1] = 3221225472LL;
          context[2] = ___ZN12XTubeManager38invalidateUnpurgeableConnectionsForKeyEP22HTTPConnectionCacheKey_block_invoke;
          context[3] = &__block_descriptor_40_e136_v24__0r__CoreSchedulingSet________CFAllocator_i______opaque_pthread_t_i____CFSet___os_unfair_lock_s_I_____CFRunLoop_____CFString_i_8_v16l;
          context[4] = connKey;
          CFDictionaryApplyFunction( *(CFDictionaryRef *)(v6 + 32),  (CFDictionaryApplierFunction)RetainableTypedDict<CoreSchedulingSet const*,GlueTubeManager *>::_visit,  context);
          pthread_mutex_unlock((pthread_mutex_t *)(v6 + 40));
        }
      }

      (*(void (**)(void *))(*(void *)connKey + 48LL))(connKey);
    }

    else
    {
      os_unfair_lock_unlock(&self->_connKeyLock);
    }

    -[NSURLSessionTask _finishProgressReporting](self, "_finishProgressReporting");
  }

  else
  {
    -[NSURLSessionTask _finishProgressReporting](self, "_finishProgressReporting");
    if (!self) {
      goto LABEL_13;
    }
  }

  if (self->_pendingResponseDisposition)
  {
    self->_pendingResponseDisposition_didFinish = 1;
    return;
  }

- (BOOL)_needSendingMetrics
{
  return !self->_sentDidFinishCollectingMetrics;
}

- (void)_didSendMetrics
{
  self->_sentDidFinishCollectingMetrics = 1;
}

- (void)_onSessionQueue_disavow
{
  double v3 = (void *)MEMORY[0x186E1578C](self, a2);
  -[__NSCFLocalSessionTask cfConn](self, "cfConn");
  -[__NSCFLocalSessionTask setConnection:](self, 0LL);
  double v4 = -[__NSCFLocalSessionTask localSession](self);
  -[__NSURLSessionLocal task:terminatedConnection:]((uint64_t)v4, (uint64_t)self);
  objc_autoreleasePoolPop(v3);
}

- (void)connection:(id)a3 willCacheResponse:(id)a4 responseCallback:(id)a5
{
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __72____NSCFLocalSessionTask_connection_willCacheResponse_responseCallback___block_invoke;
  v5[3] = &unk_189C1A480;
  v5[4] = self;
  v5[5] = a4;
  v5[6] = a5;
  if (self)
  {
    if (self->_connectionWorkQueue) {
      -[NSOperationQueue addOperationWithBlock:](self->_connectionWorkQueue, "addOperationWithBlock:", v5);
    }
    else {
      -[__NSCFLocalSessionTask _onqueue_willCacheResponse:withCompletion:]( self,  "_onqueue_willCacheResponse:withCompletion:",  a4,  a5);
    }
  }

- (void)_onqueue_willCacheResponse:(id)a3 withCompletion:(id)a4
{
  if (self)
  {
    uint64_t v6 = self;
    if (objc_getProperty(self, a2, 784LL, 1))
    {
      (*((void (**)(id, id))a4 + 2))(a4, a3);
      return;
    }

    self = (__NSCFLocalSessionTask *)v6->super._internalDelegateWrapper;
    if (!self) {
      self = (__NSCFLocalSessionTask *)v6->super._publicDelegateWrapper;
    }
    uint64_t v7 = v6;
  }

  else
  {
    uint64_t v7 = 0LL;
  }

  -[__NSCFURLSessionDelegateWrapper dataTask:willCacheResponse:completionHandler:]((uint64_t)self, v7, a3, a4);
}

- (__NSCFLocalSessionTask)initWithBackgroundTaskInfo:(id)a3 taskGroup:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS_____NSCFLocalSessionTask;
  int64_t v5 = -[NSURLSessionTask initWithOriginalRequest:ident:taskGroup:]( &v9,  sel_initWithOriginalRequest_ident_taskGroup_,  [a3 originalRequest],  objc_msgSend(a3, "identifier"),  a4);
  uint64_t v6 = v5;
  if (v5)
  {
    v5->_connKeyLock._os_unfair_lock_opaque = 0;
    -[NSURLSessionTask updateCurrentRequest:](v5, "updateCurrentRequest:", [a3 currentRequest]);
    -[NSURLSessionTask setResponse:](v6, "setResponse:", [a3 response]);
    -[NSURLSessionTask setState:](v6, "setState:", [a3 state]);
    -[NSURLSessionTask setError:](v6, "setError:", [a3 error]);
    -[NSURLSessionTask setTaskIdentifier:](v6, "setTaskIdentifier:", [a3 identifier]);
    -[NSURLSessionTask setTaskDescription:](v6, "setTaskDescription:", [a3 taskDescription]);
    -[NSURLSessionTask setEarliestBeginDate:](v6, "setEarliestBeginDate:", [a3 earliestBeginDate]);
    -[NSURLSessionTask setCountOfBytesClientExpectsToSend:]( v6,  "setCountOfBytesClientExpectsToSend:",  [a3 countOfBytesClientExpectsToSend]);
    -[NSURLSessionTask setCountOfBytesClientExpectsToReceive:]( v6,  "setCountOfBytesClientExpectsToReceive:",  [a3 countOfBytesClientExpectsToReceive]);
    -[NSURLSessionTask set_uniqueIdentifier:](v6, "set_uniqueIdentifier:", [a3 uniqueIdentifier]);
    -[NSURLSessionTask set_storagePartitionIdentifier:]( v6,  "set_storagePartitionIdentifier:",  [a3 storagePartitionIdentifier]);
    -[NSURLSessionTask set_pathToDownloadTaskFile:]( v6,  "set_pathToDownloadTaskFile:",  [a3 pathToDownloadTaskFile]);
    if ([a3 taskKind] == 1)
    {
      id v7 = +[__NSCFResumableUploadState rusWithResumeData:originalRequest:]( __NSCFResumableUploadState,  "rusWithResumeData:originalRequest:",  [a3 resumableUploadData],  objc_msgSend(a3, "originalRequest"));
      if (v7) {
        -[NSURLSessionTask setResumableUploadState:](v6, "setResumableUploadState:", v7);
      }
    }
  }

  return v6;
}

- (void)_onqueue_didReceiveResponse:(id)a3 completion:(id)a4
{
}

- (void)_onqueue_didReceiveResponse:(id)a3 redirectRequest:(id)a4 withCompletion:(id)a5
{
  int64_t v5 = (__NSCFLocalSessionTask **)self;
  if (self)
  {
    self = (__NSCFLocalSessionTask *)self->super._internalDelegateWrapper;
    if (!self) {
      self = v5[87];
    }
  }

  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __85____NSCFLocalSessionTask__onqueue_didReceiveResponse_redirectRequest_withCompletion___block_invoke;
  v6[3] = &unk_189C07858;
  v6[4] = v5;
  v6[5] = a5;
  -[__NSCFURLSessionDelegateWrapper task:willPerformHTTPRedirection:newRequest:completionHandler:]( (uint64_t)self,  v5,  a3,  a4,  v6);
}

- (void)_onqueue_didReceiveChallenge:(id)a3 request:(id)a4 withCompletion:(id)a5
{
  if (isSessionChallenge((NSURLAuthenticationChallenge *)a3))
  {
    if (self)
    {
      internalDelegateWrapper = self->super._internalDelegateWrapper;
      if ((-[__NSCFURLSessionDelegateWrapper sessionDidReceiveChallenge]((uint64_t)internalDelegateWrapper, v8) & 1) != 0)
      {
        publicDelegateWrapper = self->super._internalDelegateWrapper;
        if (!publicDelegateWrapper) {
          publicDelegateWrapper = self->super._publicDelegateWrapper;
        }
        goto LABEL_8;
      }

      goto LABEL_10;
    }

    char v12 = -[__NSCFURLSessionDelegateWrapper sessionDidReceiveChallenge](0LL, v8);
    publicDelegateWrapper = 0LL;
    dispatch_time_t v11 = 0LL;
    if ((v12 & 1) != 0)
    {
LABEL_8:
      -[__NSCFURLSessionDelegateWrapper didReceiveChallenge:completionHandler:]((uint64_t)publicDelegateWrapper, a3, a5);
      return;
    }
  }

  else
  {
    if (self)
    {
LABEL_10:
      dispatch_time_t v11 = self->super._internalDelegateWrapper;
      if (!v11) {
        dispatch_time_t v11 = self->super._publicDelegateWrapper;
      }
      goto LABEL_12;
    }

    dispatch_time_t v11 = 0LL;
  }

- (void)_onqueue_needNewBodyStream:(id)a3 withCompletion:(id)a4
{
  double v4 = (__NSCFLocalSessionTask **)self;
  if (self)
  {
    self = (__NSCFLocalSessionTask *)self->super._internalDelegateWrapper;
    if (!self) {
      self = v4[87];
    }
  }

  -[__NSCFURLSessionDelegateWrapper task:needNewBodyStream:]((uint64_t)self, v4, a4);
}

- (void)_onqueue_needNewBodyStream:(id)a3 fromOffset:(int64_t)a4 withCompletion:(id)a5
{
  int64_t v5 = (__NSCFLocalSessionTask **)self;
  if (self)
  {
    self = (__NSCFLocalSessionTask *)self->super._internalDelegateWrapper;
    if (!self) {
      self = v5[87];
    }
  }

  -[__NSCFURLSessionDelegateWrapper task:needNewBodyStreamFromOffset:completionHandler:]((uint64_t)self, v5, a4, a5);
}

- (void)_onqueue_willSendRequestForEstablishedConnection:(id)a3 withCompletion:(id)a4
{
  startTimeoutTimer = self->_startTimeoutTimer;
  if (startTimeoutTimer)
  {
    self->_startTimeoutTimer = 0LL;
    dispatch_source_cancel((dispatch_source_t)startTimeoutTimer);
    dispatch_release((dispatch_object_t)startTimeoutTimer);
  }

  -[NSURLRequest _payloadTransmissionTimeout]( -[NSURLSessionTask currentRequest](self, "currentRequest"),  "_payloadTransmissionTimeout");
  if (v9 > 0.0 && !self->_payloadTransmissionTimer)
  {
    double v10 = v9;
    dispatch_time_t v11 = -[NSURLSessionTask workQueue](self, "workQueue");
    char v12 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1895F8B78], 0LL, 0LL, (dispatch_queue_t)v11);
    self->_payloadTransmissionTimer = v12;
    -[__NSCFLocalSessionTask _onqueue_startTimer:withTimeoutInNanos:streamErrorCode:]( self,  (dispatch_source_s *)v12,  (uint64_t)(v10 * 1000000000.0),  -2107);
  }

  internalDelegateWrapper = self->super._internalDelegateWrapper;
  if (-[__NSCFURLSessionDelegateWrapper _willSendRequestForEstablishedConnection]( (uint64_t)internalDelegateWrapper,  v8))
  {
    v24[0] = 0LL;
    v24[1] = v24;
    v24[2] = 0x3052000000LL;
    v24[3] = __Block_byref_object_copy__456;
    v24[4] = __Block_byref_object_dispose__457;
    v24[5] = _Block_copy(a4);
    id v14 = -[NSURLSessionTask session](self, "session");
    if (v14) {
      workQueue = (dispatch_queue_s *)v14->_workQueue;
    }
    else {
      workQueue = 0LL;
    }
    uint64_t v16 = MEMORY[0x1895F87A8];
    v23[0] = MEMORY[0x1895F87A8];
    v23[1] = 3221225472LL;
    v23[2] = __90____NSCFLocalSessionTask__onqueue_willSendRequestForEstablishedConnection_withCompletion___block_invoke;
    v23[3] = &unk_189C02510;
    v23[4] = workQueue;
    v23[5] = self;
    v23[6] = v24;
    if (!self->_willSendRequestTimer)
    {
      v17 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1895F8B78], 0LL, 0LL, workQueue);
      self->_willSendRequestTimer = v17;
      handler[0] = v16;
      handler[1] = 3221225472LL;
      handler[2] = __90____NSCFLocalSessionTask__onqueue_willSendRequestForEstablishedConnection_withCompletion___block_invoke_2;
      handler[3] = &unk_189C1A2E8;
      handler[4] = self;
      void handler[5] = v23;
      dispatch_source_set_event_handler((dispatch_source_t)v17, handler);
      willSendRequestTimer = self->_willSendRequestTimer;
      dispatch_time_t v19 = dispatch_time(0LL, 180000000000LL);
      dispatch_source_set_timer((dispatch_source_t)willSendRequestTimer, v19, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
      dispatch_resume((dispatch_object_t)self->_willSendRequestTimer);
    }

    publicDelegateWrapper = self->super._internalDelegateWrapper;
    if (!publicDelegateWrapper) {
      publicDelegateWrapper = self->super._publicDelegateWrapper;
    }
    v21[0] = v16;
    v21[1] = 3221225472LL;
    v21[2] = __90____NSCFLocalSessionTask__onqueue_willSendRequestForEstablishedConnection_withCompletion___block_invoke_102;
    v21[3] = &unk_189C0B6C0;
    v21[4] = v23;
    -[__NSCFURLSessionDelegateWrapper task:_willSendRequestForEstablishedConnection:completionHandler:]( (uint64_t)publicDelegateWrapper,  self,  a3,  v21);
    _Block_object_dispose(v24, 8);
  }

  else
  {
    (*((void (**)(id, id))a4 + 2))(a4, a3);
  }

- (void)_onqueue_connectionWaitingWithReason:(int64_t)a3
{
  if (self)
  {
    internalDelegateWrapper = self->super._internalDelegateWrapper;
  }

  else
  {
    internalDelegateWrapper = 0LL;
  }

  -[__NSCFURLSessionDelegateWrapper task:_isWaitingForConnectionWithError:]( (uint64_t)internalDelegateWrapper,  self,  (void *)[MEMORY[0x189607870] errorWithDomain:@"NSTCPConnectionConditionsUnmetReasonErrorDomain" code:a3 userInfo:0]);
  if (objc_msgSend( (id)-[__NSURLSessionTaskGroupForConfiguration _groupConfiguration]( -[NSURLSessionTask _taskGroup](self, "_taskGroup"),  "_groupConfiguration"),  "waitsForConnectivity"))
  {
    if (self)
    {
      if (!self->_didIssueWaitingForConnectivity)
      {
        self->_didIssueWaitingForConnectivity = 1;
        publicDelegateWrapper = self->super._internalDelegateWrapper;
        if (!publicDelegateWrapper) {
          publicDelegateWrapper = self->super._publicDelegateWrapper;
        }
        -[__NSCFURLSessionDelegateWrapper taskIsWaitingForConnectivity:]((uint64_t)publicDelegateWrapper, self);
      }
    }

    else
    {
    }
  }

- (void)_onqueue_conditionalRequirementsChanged:(BOOL)a3
{
  double v3 = (__NSCFLocalSessionTask **)self;
  if (self)
  {
    self = (__NSCFLocalSessionTask *)self->super._internalDelegateWrapper;
    if (!self) {
      self = v3[87];
    }
  }

  -[__NSCFURLSessionDelegateWrapper task:_conditionalRequirementsChanged:]((uint64_t)self, v3, a3);
}

- (void)_onqueue_alternatePathAvailable:(int)a3
{
  double v3 = (__NSCFLocalSessionTask **)self;
  if (self)
  {
    self = (__NSCFLocalSessionTask *)self->super._internalDelegateWrapper;
    if (!self) {
      self = v3[87];
    }
  }

  -[__NSCFURLSessionDelegateWrapper task:_alternatePathAvailable:]((uint64_t)self, v3, *(uint64_t *)&a3);
}

- (void)_onqueue_cancel_with_error:(id)a3
{
  if (-[NSURLSessionTask state](self, "state") <= NSURLSessionTaskStateCanceling
    && !-[NSURLSessionTask error](self, "error"))
  {
    -[NSURLSessionTask setState:](self, "setState:", 2LL);
    if (self && objc_getProperty(self, v5, 808LL, 1))
    {
      id Property = objc_getProperty(self, v6, 808LL, 1);
      uint64_t v8 = (void (**)(void *, __NSCFLocalSessionTask *, void))_Block_copy(Property);
      objc_setProperty_atomic_copy(self, v9, 0LL, 808LL);
      v8[2](v8, self, 0LL);
      _Block_release(v8);
    }

    else if (-[__NSCFLocalSessionTask cfConn](self, "cfConn"))
    {
      -[__NSCFURLSessionConnection cancel](-[__NSCFLocalSessionTask cfConn](self, "cfConn"), "cancel");
    }

    -[__NSCFLocalSessionTask _onqueue_didFinishWithError:](self, "_onqueue_didFinishWithError:", a3);
  }

- (void)_onqueue_cancel
{
  if (self) {
    id v3 = -[__NSCFLocalSessionTask error:code:](self, "error:code:", *MEMORY[0x189607740], -999LL);
  }
  else {
    id v3 = 0LL;
  }
  -[__NSCFLocalSessionTask _onqueue_cancel_with_error:](self, "_onqueue_cancel_with_error:", v3);
}

- (void)_onqueue_adjustPoolPriority
{
  if (-[__NSCFLocalSessionTask cfConn](self, "cfConn")) {
    -[__NSCFURLSessionConnection setPoolPriority:]( -[__NSCFLocalSessionTask cfConn](self, "cfConn"),  "setPoolPriority:",  -[NSURLSessionTask computeAdjustedPoolPriority](self, "computeAdjustedPoolPriority"));
  }
}

- (void)_onqueue_adjustPriorityHint:(float)a3 incremental:(BOOL)a4
{
  BOOL v4 = a4;
  if (-[__NSCFLocalSessionTask cfConn](self, "cfConn"))
  {
    id v7 = -[__NSCFLocalSessionTask cfConn](self, "cfConn");
    *(float *)&double v8 = a3;
    -[__NSCFURLSessionConnection setPriorityHint:incremental:](v7, "setPriorityHint:incremental:", v4, v8);
  }

- (void)_onqueue_adjustBytesPerSecondLimit:(int64_t)a3
{
  if (-[__NSCFLocalSessionTask cfConn](self, "cfConn")) {
    -[__NSCFURLSessionConnection setBytesPerSecondLimit:]( -[__NSCFLocalSessionTask cfConn](self, "cfConn"),  "setBytesPerSecondLimit:",  a3);
  }
}

- (void)_onqueue_expectedProgressTargetChanged
{
  if (-[__NSCFLocalSessionTask cfConn](self, "cfConn")) {
    -[__NSCFURLSessionConnection expectedProgressTargetChanged]( -[__NSCFLocalSessionTask cfConn](self, "cfConn"),  "expectedProgressTargetChanged");
  }
}

- (void)cancel_with_error:(id)a3
{
  int64_t v5 = -[NSURLSessionTask session](self, "session");
  if (v5) {
    int64_t v5 = (NSURLSession *)v5->_workQueue;
  }
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __44____NSCFLocalSessionTask_cancel_with_error___block_invoke;
  v6[3] = &unk_189C1A270;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async((dispatch_queue_t)v5, v6);
}

- (id)error:(id)a3 code:(int64_t)a4
{
  return (id)objc_msgSend( MEMORY[0x189607A70],  "_web_errorWithDomain:code:URL:",  a3,  a4,  -[NSURLSessionTask currentRequest_URL](self, "currentRequest_URL"));
}

- (id)resourceTimeoutError
{
  return (id)-[__NSCFLocalSessionTask timeoutErrorWithStreamErrorCode:](self, 4294965193LL);
}

- (void)set_TLSMinimumSupportedProtocolVersion:(unsigned __int16)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS_____NSCFLocalSessionTask;
  -[NSURLSessionTask set_TLSMinimumSupportedProtocolVersion:](&v8, sel_set_TLSMinimumSupportedProtocolVersion_);
  if (-[NSURLSessionTask session](self, "session"))
  {
    int64_t v5 = -[NSURLSessionTask workQueue](self, "workQueue");
    v6[0] = MEMORY[0x1895F87A8];
    v6[1] = 3221225472LL;
    v6[2] = __65____NSCFLocalSessionTask_set_TLSMinimumSupportedProtocolVersion___block_invoke;
    v6[3] = &unk_189C1A598;
    v6[4] = self;
    unsigned __int16 v7 = a3;
    dispatch_async((dispatch_queue_t)v5, v6);
  }

- (void)set_TLSMaximumSupportedProtocolVersion:(unsigned __int16)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS_____NSCFLocalSessionTask;
  -[NSURLSessionTask set_TLSMaximumSupportedProtocolVersion:](&v8, sel_set_TLSMaximumSupportedProtocolVersion_);
  if (-[NSURLSessionTask session](self, "session"))
  {
    int64_t v5 = -[NSURLSessionTask workQueue](self, "workQueue");
    v6[0] = MEMORY[0x1895F87A8];
    v6[1] = 3221225472LL;
    v6[2] = __65____NSCFLocalSessionTask_set_TLSMaximumSupportedProtocolVersion___block_invoke;
    v6[3] = &unk_189C1A598;
    v6[4] = self;
    unsigned __int16 v7 = a3;
    dispatch_async((dispatch_queue_t)v5, v6);
  }

- (void)startResourceTimer
{
  id v3 = -[NSURLSessionTask session](self, "session");
  if (v3) {
    id v3 = (NSURLSession *)v3->_workQueue;
  }
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __44____NSCFLocalSessionTask_startResourceTimer__block_invoke;
  block[3] = &unk_189C1A548;
  block[4] = self;
  dispatch_async((dispatch_queue_t)v3, block);
}

- (void)set_timeoutIntervalForResource:(double)a3
{
  if (v5 != a3)
  {
    v9.receiver = self;
    v9.super_class = (Class)&OBJC_CLASS_____NSCFLocalSessionTask;
    -[NSURLSessionTask set_timeoutIntervalForResource:](&v9, sel_set_timeoutIntervalForResource_, a3);
    if (-[NSURLSessionTask session](self, "session"))
    {
      uint64_t v6 = -[NSURLSessionTask session](self, "session");
      if (v6)
      {
        if (v6->_workQueue)
        {
          unsigned __int16 v7 = -[NSURLSessionTask session](self, "session");
          if (v7) {
            unsigned __int16 v7 = (NSURLSession *)v7->_workQueue;
          }
          v8[0] = MEMORY[0x1895F87A8];
          v8[1] = 3221225472LL;
          v8[2] = __57____NSCFLocalSessionTask_set_timeoutIntervalForResource___block_invoke;
          v8[3] = &unk_189C1A570;
          v8[4] = self;
          *(double *)&v8[5] = a3;
          dispatch_async((dispatch_queue_t)v7, v8);
        }
      }
    }
  }

- (void)connection:(id)a3 wasRedirected:(id)a4 newRequest:(id)a5 responseCallback:(id)a6
{
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __79____NSCFLocalSessionTask_connection_wasRedirected_newRequest_responseCallback___block_invoke;
  v6[3] = &unk_189C15848;
  v6[4] = self;
  void v6[5] = a4;
  void v6[6] = a5;
  v6[7] = a6;
  if (self)
  {
    if (self->_connectionWorkQueue) {
      -[NSOperationQueue addOperationWithBlock:](self->_connectionWorkQueue, "addOperationWithBlock:", v6);
    }
    else {
      -[__NSCFLocalSessionTask _onqueue_didReceiveResponse:redirectRequest:withCompletion:]( self,  "_onqueue_didReceiveResponse:redirectRequest:withCompletion:",  a4,  a5,  a6);
    }
  }

- (void)connection:(id)a3 didReceiveInformationalResponse:(id)a4
{
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __69____NSCFLocalSessionTask_connection_didReceiveInformationalResponse___block_invoke;
  v7[3] = &unk_189C1A270;
  v7[4] = self;
  v7[5] = a4;
  if (self)
  {
    connectionWorkQueue = self->_connectionWorkQueue;
    if (connectionWorkQueue)
    {
      -[NSOperationQueue addOperationWithBlock:](connectionWorkQueue, "addOperationWithBlock:", v7);
    }

    else
    {
      internalDelegateWrapper = self->super._internalDelegateWrapper;
      -[__NSCFURLSessionDelegateWrapper task:didReceiveInformationalResponse:]( (uint64_t)internalDelegateWrapper,  self,  a4);
    }
  }

- (void)connection:(id)a3 request:(id)a4 needsNewBodyStreamCallback:(id)a5
{
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __72____NSCFLocalSessionTask_connection_request_needsNewBodyStreamCallback___block_invoke;
  v5[3] = &unk_189C1A480;
  v5[4] = self;
  v5[5] = a4;
  v5[6] = a5;
  if (self)
  {
    if (self->_connectionWorkQueue) {
      -[NSOperationQueue addOperationWithBlock:](self->_connectionWorkQueue, "addOperationWithBlock:", v5);
    }
    else {
      -[__NSCFLocalSessionTask _onqueue_needNewBodyStream:withCompletion:]( self,  "_onqueue_needNewBodyStream:withCompletion:",  a4,  a5);
    }
  }

- (void)connection:(id)a3 request:(id)a4 needsNewBodyStreamFromOffset:(int64_t)a5 callback:(id)a6
{
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __83____NSCFLocalSessionTask_connection_request_needsNewBodyStreamFromOffset_callback___block_invoke;
  v6[3] = &unk_189C16148;
  v6[4] = self;
  void v6[5] = a4;
  void v6[6] = a6;
  v6[7] = a5;
  if (self)
  {
    if (self->_connectionWorkQueue) {
      -[NSOperationQueue addOperationWithBlock:](self->_connectionWorkQueue, "addOperationWithBlock:", v6);
    }
    else {
      -[__NSCFLocalSessionTask _onqueue_needNewBodyStream:fromOffset:withCompletion:]( self,  "_onqueue_needNewBodyStream:fromOffset:withCompletion:",  a4,  a5,  a6);
    }
  }

- (void)connection:(id)a3 challenged:(id)a4 authCallback:(id)a5
{
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __61____NSCFLocalSessionTask_connection_challenged_authCallback___block_invoke;
  v7[3] = &unk_189C1A480;
  v7[4] = self;
  v7[5] = a4;
  void v7[6] = a5;
  if (self)
  {
    connectionWorkQueue = self->_connectionWorkQueue;
    if (connectionWorkQueue) {
      -[NSOperationQueue addOperationWithBlock:](connectionWorkQueue, "addOperationWithBlock:", v7);
    }
    else {
      -[__NSCFLocalSessionTask _onqueue_didReceiveChallenge:request:withCompletion:]( self,  "_onqueue_didReceiveChallenge:request:withCompletion:",  a4,  -[NSURLSessionTask currentRequest](self, "currentRequest", a3),  a5);
    }
  }

- (void)connection:(id)a3 _willSendRequestForEstablishedConnection:(id)a4 completion:(id)a5
{
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __89____NSCFLocalSessionTask_connection__willSendRequestForEstablishedConnection_completion___block_invoke;
  v5[3] = &unk_189C1A480;
  v5[4] = self;
  v5[5] = a4;
  v5[6] = a5;
  if (self)
  {
    if (self->_connectionWorkQueue) {
      -[NSOperationQueue addOperationWithBlock:](self->_connectionWorkQueue, "addOperationWithBlock:", v5);
    }
    else {
      -[__NSCFLocalSessionTask _onqueue_willSendRequestForEstablishedConnection:withCompletion:]( self,  "_onqueue_willSendRequestForEstablishedConnection:withCompletion:",  a4,  a5);
    }
  }

- (void)connection:(id)a3 waitingWithReason:(int64_t)a4
{
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __55____NSCFLocalSessionTask_connection_waitingWithReason___block_invoke;
  v4[3] = &unk_189C1A570;
  v4[4] = self;
  v4[5] = a4;
  if (self)
  {
    if (self->_connectionWorkQueue) {
      -[NSOperationQueue addOperationWithBlock:](self->_connectionWorkQueue, "addOperationWithBlock:", v4);
    }
    else {
      -[__NSCFLocalSessionTask _onqueue_connectionWaitingWithReason:](self, "_onqueue_connectionWaitingWithReason:", a4);
    }
  }

- (void)connection:(id)a3 _conditionalRequirementsChanged:(BOOL)a4
{
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __69____NSCFLocalSessionTask_connection__conditionalRequirementsChanged___block_invoke;
  v4[3] = &unk_189C1A340;
  v4[4] = self;
  BOOL v5 = a4;
  if (self)
  {
    if (self->_connectionWorkQueue) {
      -[NSOperationQueue addOperationWithBlock:](self->_connectionWorkQueue, "addOperationWithBlock:", v4);
    }
    else {
      -[__NSCFLocalSessionTask _onqueue_conditionalRequirementsChanged:]( self,  "_onqueue_conditionalRequirementsChanged:",  a4);
    }
  }

- (void)connection:(id)a3 alternatePathAvailable:(int)a4
{
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __60____NSCFLocalSessionTask_connection_alternatePathAvailable___block_invoke;
  v4[3] = &unk_189C1A318;
  v4[4] = self;
  int v5 = a4;
  if (self)
  {
    if (self->_connectionWorkQueue) {
      -[NSOperationQueue addOperationWithBlock:](self->_connectionWorkQueue, "addOperationWithBlock:", v4);
    }
    else {
      -[__NSCFLocalSessionTask _onqueue_alternatePathAvailable:]( self,  "_onqueue_alternatePathAvailable:",  *(void *)&a4);
    }
  }

- (void)connection:(id)a3 didReceiveSocketInputStream:(id)a4 outputStream:(id)a5
{
  if (*(_OWORD *)&self->_socketReadStreamForUpgrade != 0LL
    && os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl( &dword_18298D000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_FAULT,  "already have socket is and os",  buf,  2u);
  }

  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __78____NSCFLocalSessionTask_connection_didReceiveSocketInputStream_outputStream___block_invoke;
  v9[3] = &unk_189C1A610;
  v9[4] = self;
  void v9[5] = a4;
  v9[6] = a5;
  connectionWorkQueue = self->_connectionWorkQueue;
  if (connectionWorkQueue)
  {
    -[NSOperationQueue addOperationWithBlock:](connectionWorkQueue, "addOperationWithBlock:", v9);
  }

  else
  {
    self->_socketReadStreamForUpgrade = (NSInputStream *)a4;
    self->_socketWriteStreamForUpgrade = (NSOutputStream *)a5;
  }

- (void)connection:(id)a3 didReceiveTCPConnection:(shared_ptr<TransportConnection>)a4 extraBytes:(id)a5
{
  cntrl = a4.__cntrl_;
  uint64_t v13 = MEMORY[0x1895F87A8];
  uint64_t v14 = 3321888768LL;
  id v15 = __72____NSCFLocalSessionTask_connection_didReceiveTCPConnection_extraBytes___block_invoke;
  uint64_t v16 = &unk_189C02538;
  uint64_t v6 = *(void *)a4.__ptr_;
  uint64_t v7 = *((void *)a4.__ptr_ + 1);
  v17 = self;
  uint64_t v19 = v6;
  v20 = (std::__shared_weak_count *)v7;
  if (v7)
  {
    objc_super v8 = (unint64_t *)(v7 + 8);
    do
      unint64_t v9 = __ldxr(v8);
    while (__stxr(v9 + 1, v8));
  }

  v18 = a4.__cntrl_;
  if (self)
  {
    if (self->_connectionWorkQueue)
    {
      -[NSOperationQueue addOperationWithBlock:](self->_connectionWorkQueue, "addOperationWithBlock:", &v13);
    }

    else
    {
      std::shared_ptr<__CFString const>::operator=[abi:nn180100](&self->_connectionForUpgrade.__ptr_, v6, v7);
      v17->_extraBytes = (OS_dispatch_data *)-[__shared_weak_count copy](cntrl, "copy", v13, v14, v15, v16);
    }
  }

  double v10 = v20;
  if (v20)
  {
    p_shared_owners = (unint64_t *)&v20->__shared_owners_;
    do
      unint64_t v12 = __ldaxr(p_shared_owners);
    while (__stlxr(v12 - 1, p_shared_owners));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }

- (uint64_t)_onqueue_suspendWorkQueue
{
  if (result && *(void *)(result + 912))
  {
    int v1 = *(_DWORD *)(result + 920);
    if (v1 < 0) {
      __assert_rtn( "-[__NSCFLocalSessionTask _onqueue_suspendWorkQueue]",  "LocalSessionTask.mm",  1314,  "_connectionWorkQueueSuspensionCount >= 0");
    }
    *(_DWORD *)(result + 920) = v1 + 1;
    if (!v1) {
      return [*(id *)(result + 912) setSuspended:1];
    }
  }

  return result;
}

- (uint64_t)timeoutErrorWithStreamErrorCode:(void *)a1
{
  double v2 = a1;
  if (!a1) {
    return (uint64_t)v2;
  }
  if ([a1 _proxySettings]
    && [v2 _proxyHandshakePending]
    && !objc_msgSend( (id)objc_msgSend((id)objc_msgSend(v2, "currentRequest_URL"), "scheme"),  "caseInsensitiveCompare:",  @"https"))
  {
    int v5 = &kCFErrorDomainCFNetwork;
    uint64_t v4 = 310LL;
  }

  else
  {
    uint64_t v4 = -1001LL;
    int v5 = (const CFStringRef *)MEMORY[0x189607740];
  }

  double v2 = (void *)[v2 error:*v5 code:v4];
  uint64_t v6 = [v2 userInfo];
  if (v6)
  {
    uint64_t v7 = (void *)[MEMORY[0x189603FC8] dictionaryWithDictionary:v6];
    objc_msgSend( v7,  "setObject:forKey:",  objc_msgSend(MEMORY[0x189607968], "numberWithInt:", 4),  @"_kCFStreamErrorDomainKey");
    objc_msgSend( v7,  "setObject:forKey:",  objc_msgSend(MEMORY[0x189607968], "numberWithInt:", a2),  @"_kCFStreamErrorCodeKey");
    uint64_t v8 = [MEMORY[0x189603F68] dictionaryWithDictionary:v7];
  }

  else
  {
    unint64_t v9 = (void *)MEMORY[0x189603F68];
    uint64_t v10 = [MEMORY[0x189607968] numberWithInt:4];
    uint64_t v8 = objc_msgSend( v9,  "dictionaryWithObjectsAndKeys:",  v10,  @"_kCFStreamErrorDomainKey",  objc_msgSend(MEMORY[0x189607968], "numberWithInt:", a2),  @"_kCFStreamErrorCodeKey",  0);
  }

  if (v8) {
    return objc_msgSend( MEMORY[0x189607A70],  "errorWithDomain:code:userInfo:",  objc_msgSend(v2, "domain"),  objc_msgSend(v2, "code"),  v8);
  }
  else {
    return (uint64_t)v2;
  }
}

- (_BYTE)_finishAllow
{
  if (result)
  {
    int v1 = result;
    if (result[928]) {
      result = (_BYTE *)objc_msgSend(result, "_onqueue_resume");
    }
    if ((v1[925] & 1) != 0)
    {
      v1[925] = 0;
      return (_BYTE *)objc_msgSend(v1, "_task_onqueue_didFinish");
    }
  }

  return result;
}

- (uint64_t)_finishBecomeDownload:(uint64_t)result
{
  if (result)
  {
    id v3 = (_BYTE *)result;
    result = objc_msgSend(a2, "_onqueue_resume");
    if ((v3[925] & 1) != 0)
    {
      v3[925] = 0;
      objc_msgSend(a2, "setError:", objc_msgSend(v3, "error"));
      return objc_msgSend(a2, "_task_onqueue_didFinish");
    }
  }

  return result;
}

- (uint64_t)_finishBecomeStream:(void *)a3 forConnection:(uint64_t)a4 completionHandler:
{
  if (result)
  {
    uint64_t v6 = (_BYTE *)result;
    uint64_t v8 = 0LL;
    __int128 v7 = xmmword_182BD7A48;
    (*(void (**)(uint64_t, __int128 *))(a4 + 16))(a4, &v7);
    [a2 resume];
    result = [a3 resume];
    if ((v6[925] & 1) != 0)
    {
      v6[925] = 0;
      objc_msgSend(a2, "setError:", objc_msgSend(v6, "error"));
      return objc_msgSend(a2, "_task_onqueue_didFinish");
    }
  }

  return result;
}

@end