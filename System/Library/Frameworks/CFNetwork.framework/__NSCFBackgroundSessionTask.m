@interface __NSCFBackgroundSessionTask
- (__NSCFBackgroundSessionTask)initWithBackgroundTask:(id)a3;
- (__NSCFBackgroundSessionTask)initWithOriginalRequest:(id)a3 ident:(unint64_t)a4 taskGroup:(id)a5;
- (__NSCFBackgroundSessionTask)initWithTaskInfo:(id)a3 taskGroup:(id)a4 ident:(unint64_t)a5;
- (id)_timingData;
- (id)cookiesForCurrentRequest;
- (id)requestWithCookiesApplied:(id)a3;
- (uint64_t)cookiesForRequest:(void *)a1;
- (void)_onSessionQueue_disavow;
- (void)_onqueue_adjustBytesPerSecondLimit:(int64_t)a3;
- (void)_onqueue_adjustLoadingPoolPriority;
- (void)_onqueue_adjustPoolPriority;
- (void)_onqueue_cancel;
- (void)_onqueue_connectionWaitingWithReason:(void *)a1;
- (void)_onqueue_didFinishWithError:(id)a3;
- (void)_onqueue_didReceiveInformationalResponse:(id)a3;
- (void)_onqueue_didReceiveResponse:(id)a3;
- (void)_onqueue_resume;
- (void)_onqueue_suspend;
- (void)_onqueue_willSendRequestForEstablishedConnection:(id)a3 withCompletion:(id)a4;
- (void)addSecKeyProxy:(id)a3;
- (void)dealloc;
- (void)removeSecKeyProxy:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setTaskDescription:(id)a3;
- (void)set_TLSMaximumSupportedProtocolVersion:(unsigned __int16)a3;
- (void)set_TLSMinimumSupportedProtocolVersion:(unsigned __int16)a3;
- (void)set_discretionaryOverride:(int64_t)a3;
@end

@implementation __NSCFBackgroundSessionTask

- (__NSCFBackgroundSessionTask)initWithOriginalRequest:(id)a3 ident:(unint64_t)a4 taskGroup:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS_____NSCFBackgroundSessionTask;
  v5 = -[NSURLSessionTask initWithOriginalRequest:ident:taskGroup:]( &v8,  sel_initWithOriginalRequest_ident_taskGroup_,  a3,  a4,  a5);
  v6 = v5;
  if (v5) {
    -[NSURLSessionTask setState:](v5, "setState:", 1LL);
  }
  return v6;
}

- (__NSCFBackgroundSessionTask)initWithTaskInfo:(id)a3 taskGroup:(id)a4 ident:(unint64_t)a5
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS_____NSCFBackgroundSessionTask;
  v6 = -[NSURLSessionTask initWithOriginalRequest:ident:taskGroup:]( &v11,  sel_initWithOriginalRequest_ident_taskGroup_,  [a3 originalRequest],  a5,  a4);
  if (v6)
  {
    -[NSURLSessionTask updateCurrentRequest:](v6, "updateCurrentRequest:", [a3 currentRequest]);
    -[NSURLSessionTask setResponse:](v6, "setResponse:", [a3 response]);
    -[NSURLSessionTask setEarliestBeginDate:](v6, "setEarliestBeginDate:", [a3 earliestBeginDate]);
    -[NSURLSessionTask setCountOfBytesClientExpectsToSend:]( v6,  "setCountOfBytesClientExpectsToSend:",  [a3 countOfBytesClientExpectsToSend]);
    -[NSURLSessionTask setCountOfBytesClientExpectsToReceive:]( v6,  "setCountOfBytesClientExpectsToReceive:",  [a3 countOfBytesClientExpectsToReceive]);
    -[NSURLSessionTask setCountOfBytesReceived:]( v6,  "setCountOfBytesReceived:",  [a3 countOfBytesReceived]);
    -[NSURLSessionTask setCountOfBytesSent:](v6, "setCountOfBytesSent:", [a3 countOfBytesSent]);
    -[NSURLSessionTask setCountOfBytesExpectedToSend:]( v6,  "setCountOfBytesExpectedToSend:",  [a3 countOfBytesExpectedToSend]);
    -[NSURLSessionTask setCountOfBytesExpectedToReceive:]( v6,  "setCountOfBytesExpectedToReceive:",  [a3 countOfBytesExpectedToReceive]);
    -[NSURLSessionTask setState:](v6, "setState:", [a3 state]);
    -[NSURLSessionTask setError:](v6, "setError:", [a3 error]);
    -[__NSCFBackgroundSessionTask setTaskDescription:](v6, "setTaskDescription:", [a3 taskDescription]);
    -[NSURLSessionTask set_uniqueIdentifier:](v6, "set_uniqueIdentifier:", [a3 uniqueIdentifier]);
    -[NSURLSessionTask set_metrics:](v6, "set_metrics:", [a3 taskMetrics]);
    v7 = (void *)[a3 taskMetrics];
    if (v7) {
      id Property = objc_getProperty(v7, v8, 96LL, 1);
    }
    else {
      id Property = 0LL;
    }
    -[NSURLSessionTask set_backgroundTransactionMetrics:](v6, "set_backgroundTransactionMetrics:", Property);
    -[NSURLSessionTask set_trailers:](v6, "set_trailers:", [a3 _backgroundTrailers]);
    -[NSURLSessionTask set_extractor:](v6, "set_extractor:", 0LL);
    -[NSURLSessionTask set_doesSZExtractorConsumeExtractedData:]( v6,  "set_doesSZExtractorConsumeExtractedData:",  [a3 _doesSZExtractorConsumeExtractedData]);
    -[NSURLSessionTask set_hasSZExtractor:](v6, "set_hasSZExtractor:", [a3 _hasSZExtractor]);
  }

  return v6;
}

- (__NSCFBackgroundSessionTask)initWithBackgroundTask:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS_____NSCFBackgroundSessionTask;
  v3 = -[NSURLSessionTask initWithTask:](&v6, sel_initWithTask_, a3);
  v4 = v3;
  if (v3) {
    -[NSURLSessionTask setState:](v3, "setState:", 0LL);
  }
  return v4;
}

- (void)dealloc
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  if (self) {
    objc_setProperty_atomic(self, a2, 0LL, 776LL);
  }
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  secKeyProxies = self->_secKeyProxies;
  uint64_t v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( secKeyProxies,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0LL; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(secKeyProxies);
        }
        objc_super v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        [v8 invalidate];
        [v8 setClientDisconnectionHandler:0];
      }

      uint64_t v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( secKeyProxies,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
    }

    while (v5);
  }

  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS_____NSCFBackgroundSessionTask;
  -[NSURLSessionTask dealloc](&v9, sel_dealloc);
}

- (id)cookiesForCurrentRequest
{
  return (id)-[__NSCFBackgroundSessionTask cookiesForRequest:]( self,  -[NSURLSessionTask currentRequest](self, "currentRequest"));
}

- (id)requestWithCookiesApplied:(id)a3
{
  uint64_t v4 = -[__NSCFBackgroundSessionTask cookiesForRequest:](self, a3);
  if (!v4) {
    return a3;
  }
  uint64_t v5 = v4;
  uint64_t v6 = (void *)[a3 mutableCopy];
  [v6 setValue:v5 forHTTPHeaderField:0x18C5AEF60];
  return v6;
}

- (void)addSecKeyProxy:(id)a3
{
  p_proxyLock = &self->_proxyLock;
  os_unfair_lock_lock(&self->_proxyLock);
  secKeyProxies = self->_secKeyProxies;
  if (!secKeyProxies)
  {
    secKeyProxies = (NSMutableSet *)objc_alloc_init(MEMORY[0x189603FE0]);
    self->_secKeyProxies = secKeyProxies;
  }

  -[NSMutableSet addObject:](secKeyProxies, "addObject:", a3);
  os_unfair_lock_unlock(p_proxyLock);
}

- (void)removeSecKeyProxy:(id)a3
{
  p_proxyLock = &self->_proxyLock;
  os_unfair_lock_lock(&self->_proxyLock);
  -[NSMutableSet removeObject:](self->_secKeyProxies, "removeObject:", a3);
  os_unfair_lock_unlock(p_proxyLock);
}

- (void)_onqueue_willSendRequestForEstablishedConnection:(id)a3 withCompletion:(id)a4
{
  uint64_t v4 = (__NSCFBackgroundSessionTask **)self;
  if (self)
  {
    self = (__NSCFBackgroundSessionTask *)self->super._internalDelegateWrapper;
    if (!self) {
      self = v4[87];
    }
  }

  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __95____NSCFBackgroundSessionTask__onqueue_willSendRequestForEstablishedConnection_withCompletion___block_invoke;
  v5[3] = &unk_189C0B6C0;
  v5[4] = a4;
  -[__NSCFURLSessionDelegateWrapper task:_willSendRequestForEstablishedConnection:completionHandler:]( (uint64_t)self,  v4,  a3,  v5);
}

- (void)_onqueue_didReceiveInformationalResponse:(id)a3
{
  v3 = (__NSCFBackgroundSessionTask **)self;
  if (self)
  {
    self = (__NSCFBackgroundSessionTask *)self->super._internalDelegateWrapper;
    if (!self) {
      self = v3[87];
    }
  }

  -[__NSCFURLSessionDelegateWrapper task:didReceiveInformationalResponse:]((uint64_t)self, v3, a3);
}

- (void)_onqueue_didReceiveResponse:(id)a3
{
  if (!-[NSURLSessionTask countOfBytesExpectedToReceive](self, "countOfBytesExpectedToReceive")) {
    -[NSURLSessionTask setCountOfBytesExpectedToReceive:]( self,  "setCountOfBytesExpectedToReceive:",  [a3 expectedContentLength]);
  }
}

- (void)_onqueue_didFinishWithError:(id)a3
{
  if (!self->_sentDidFinish)
  {
    self->_sentDidFinish = 1;
    -[NSURLSessionTask setError:](self, "setError:", a3);
    -[NSURLSessionTask setState:](self, "setState:", 3LL);
    -[NSURLSession _onqueue_didCompleteTask:withError:]( (uint64_t)-[NSURLSessionTask session](self, "session"),  self,  -[NSURLSessionTask error](self, "error"));
  }

- (void)_onqueue_suspend
{
}

- (void)_onqueue_cancel
{
  if (-[NSURLSessionTask state](self, "state") <= NSURLSessionTaskStateCanceling && !self->_sentCancel)
  {
    self->_sentCancel = 1;
    -[NSURLSessionTask setState:](self, "setState:", 2LL);
    objc_msgSend( (id)-[__NSURLBackgroundSession ensureRemoteSession]((uint64_t)-[NSURLSessionTask session](self, "session")),  "cancelTaskWithIdentifier:",  -[NSURLSessionTask taskIdentifier](self, "taskIdentifier"));
  }

- (void)_onqueue_resume
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  if (self->_immediateError)
  {
    -[__NSCFBackgroundSessionTask _onqueue_didFinishWithError:](self, "_onqueue_didFinishWithError:");
  }

  else
  {
    v3 = (void *)-[__NSURLBackgroundSession ensureRemoteSession]((uint64_t)-[NSURLSessionTask session](self, "session"));
    NSUInteger v4 = -[NSURLSessionTask taskIdentifier](self, "taskIdentifier");
    id v5 = objc_alloc_init(MEMORY[0x189603FC8]);
    if (-[NSURLSessionTask _authenticatorConfiguredViaTaskProperty](self, "_authenticatorConfiguredViaTaskProperty")
      && -[NSURLSessionTaskHTTPAuthenticator statusCodes]( -[NSURLSessionTask authenticator](self, "authenticator"),  "statusCodes"))
    {
      objc_msgSend( v5,  "setObject:forKey:",  -[NSURLSessionTaskHTTPAuthenticator statusCodes]( -[NSURLSessionTask authenticator](self, "authenticator"),  "statusCodes"),  @"StatusCodes");
    }

    if (-[NSURLSessionTask _publishingURL](self, "_publishingURL")) {
      objc_msgSend( v5,  "setObject:forKey:",  -[NSURLSessionTask _publishingURL](self, "_publishingURL"),  @"PublishingURL");
    }
    if (-[NSURLSessionTask earliestBeginDate](self, "earliestBeginDate")) {
      objc_msgSend( v5,  "setObject:forKey:",  -[NSURLSessionTask earliestBeginDate](self, "earliestBeginDate"),  @"EarliestBeginDate");
    }
    if (-[NSURLSessionTask countOfBytesClientExpectsToSend](self, "countOfBytesClientExpectsToSend") != -1) {
      objc_msgSend( v5,  "setObject:forKey:",  objc_msgSend( MEMORY[0x189607968],  "numberWithLongLong:",  -[NSURLSessionTask countOfBytesClientExpectsToSend](self, "countOfBytesClientExpectsToSend")),  @"CountOfBytesClientExpectsToSend");
    }
    if (-[NSURLSessionTask countOfBytesClientExpectsToReceive](self, "countOfBytesClientExpectsToReceive") != -1) {
      objc_msgSend( v5,  "setObject:forKey:",  objc_msgSend( MEMORY[0x189607968],  "numberWithLongLong:",  -[NSURLSessionTask countOfBytesClientExpectsToReceive](self, "countOfBytesClientExpectsToReceive")),  @"CountOfBytesClientExpectsToReceive");
    }
    if (-[NSURLSessionTask _extractor](self, "_extractor"))
    {
      uint64_t v6 = -[NSURLSessionTask _extractor](self, "_extractor");
      objc_msgSend( v5,  "setObject:forKey:",  objc_msgSend(MEMORY[0x1896078F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, 0),  @"SZExtractor");
      objc_msgSend( v5,  "setValue:forKey:",  objc_msgSend( MEMORY[0x189607968],  "numberWithBool:",  -[NSURLSessionTask _hasSZExtractor](self, "_hasSZExtractor")),  @"HasSZExtractor");
      objc_msgSend( v5,  "setValue:forKey:",  objc_msgSend( MEMORY[0x189607968],  "numberWithBool:",  -[NSURLSessionTask _doesSZExtractorConsumeExtractedData](self, "_doesSZExtractorConsumeExtractedData")),  @"DoesSZExtractorConsumeExtractedData");
    }

    if (-[NSURLSessionTask _pathToDownloadTaskFile](self, "_pathToDownloadTaskFile")) {
      objc_msgSend( v5,  "setObject:forKey:",  -[NSURLSessionTask _pathToDownloadTaskFile](self, "_pathToDownloadTaskFile"),  @"pathToDownloadTaskFile");
    }
    -[NSURLSessionTask _timeoutIntervalForResource](self, "_timeoutIntervalForResource");
    if (v7 != 0.0)
    {
      objc_super v8 = (void *)MEMORY[0x189607968];
      -[NSURLSessionTask _timeoutIntervalForResource](self, "_timeoutIntervalForResource");
      objc_msgSend(v5, "setObject:forKey:", objc_msgSend(v8, "numberWithDouble:"), @"TimeoutIntervalForResource");
    }

    if (-[NSURLSessionTask _private_nw_activity](self, "_private_nw_activity"))
    {
      -[NSURLSessionTask _private_nw_activity](self, "_private_nw_activity");
      nw_activity_get_token();
      objc_msgSend( v5,  "setObject:forKey:",  (id)objc_msgSend(objc_alloc(MEMORY[0x189607AB8]), "initWithUUIDBytes:", v10),  @"nw_activityUUID");
    }

    if (!-[NSURLSessionTask _isAVAssetTask](self, "_isAVAssetTask") && (objc_opt_respondsToSelector() & 1) != 0) {
      objc_msgSend( v5,  "setObject:forKeyedSubscript:",  -[NSURLSessionTask _effectiveConfiguration](self, "_effectiveConfiguration"),  @"effectiveConfig");
    }
    objc_msgSend( v5,  "setObject:forKeyedSubscript:",  -[NSURLSessionTask _sourceApplicationBundleIdentifierForMobileAsset]( self,  "_sourceApplicationBundleIdentifierForMobileAsset"),  @"sourceApplicationBundleIdentifierForMobileAsset");
    if (-[NSURLSessionTask _preconnect](self, "_preconnect")) {
      [v5 setObject:MEMORY[0x189604A88] forKeyedSubscript:@"preconnect"];
    }
    id v9 = -[__NSCFBackgroundSessionTask cookiesForCurrentRequest](self, "cookiesForCurrentRequest");
    if (v9) {
      [v5 setObject:v9 forKeyedSubscript:@"cookies"];
    }
    objc_msgSend( v3,  "resumeTaskWithIdentifier:withProperties:",  v4,  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithDictionary:", v5));
  }

- (void)_onqueue_adjustPoolPriority
{
}

- (void)_onqueue_adjustLoadingPoolPriority
{
  v3 = (void *)-[__NSURLBackgroundSession ensureRemoteSession]((uint64_t)-[NSURLSessionTask session](self, "session"));
  -[NSURLSessionTask _loadingPriorityValue](self, "_loadingPriorityValue");
  objc_msgSend( v3,  "setLoadingPoolPriority:forTaskWithIdentifier:",  -[NSURLSessionTask taskIdentifier](self, "taskIdentifier"),  v4);
}

- (void)_onqueue_adjustBytesPerSecondLimit:(int64_t)a3
{
}

- (void)_onSessionQueue_disavow
{
  v3 = -[NSURLSessionTask session](self, "session");
  if (v3) {
    -[__shared_weak_count removeObjectForKey:]( v3[1]._nwContext.__cntrl_,  "removeObjectForKey:",  objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInteger:",  -[NSURLSessionTask taskIdentifier](self, "taskIdentifier")));
  }
}

- (void)setTaskDescription:(id)a3
{
  if (-[NSURLSessionTask session](self, "session"))
  {
    id v5 = -[NSURLSessionTask workQueue](self, "workQueue");
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __50____NSCFBackgroundSessionTask_setTaskDescription___block_invoke;
    block[3] = &unk_189C1A270;
    block[4] = self;
    block[5] = a3;
    dispatch_async((dispatch_queue_t)v5, block);
  }

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS_____NSCFBackgroundSessionTask;
  -[NSURLSessionTask setTaskDescription:](&v6, sel_setTaskDescription_, a3);
}

- (void)setDelegate:(id)a3
{
}

- (id)_timingData
{
  return -[__CFN_TransactionMetrics legacyStaticMetrics]((uint64_t)-[NSURLSessionTask _backgroundTransactionMetrics]( self,  "_backgroundTransactionMetrics"));
}

- (void)set_discretionaryOverride:(int64_t)a3
{
  if (-[NSURLSessionTask session](self, "session"))
  {
    id v5 = -[NSURLSessionTask workQueue](self, "workQueue");
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __57____NSCFBackgroundSessionTask_set_discretionaryOverride___block_invoke;
    block[3] = &unk_189C1A570;
    block[4] = self;
    block[5] = a3;
    dispatch_async((dispatch_queue_t)v5, block);
  }

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS_____NSCFBackgroundSessionTask;
  -[NSURLSessionTask set_discretionaryOverride:](&v6, sel_set_discretionaryOverride_, a3);
}

- (void)set_TLSMinimumSupportedProtocolVersion:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  if (-[NSURLSessionTask session](self, "session"))
  {
    id v5 = -[NSURLSessionTask workQueue](self, "workQueue");
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __70____NSCFBackgroundSessionTask_set_TLSMinimumSupportedProtocolVersion___block_invoke;
    block[3] = &unk_189C1A598;
    block[4] = self;
    __int16 v8 = v3;
    dispatch_async((dispatch_queue_t)v5, block);
  }

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS_____NSCFBackgroundSessionTask;
  -[NSURLSessionTask set_TLSMinimumSupportedProtocolVersion:](&v6, sel_set_TLSMinimumSupportedProtocolVersion_, v3);
}

- (void)set_TLSMaximumSupportedProtocolVersion:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  if (-[NSURLSessionTask session](self, "session"))
  {
    id v5 = -[NSURLSessionTask workQueue](self, "workQueue");
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __70____NSCFBackgroundSessionTask_set_TLSMaximumSupportedProtocolVersion___block_invoke;
    block[3] = &unk_189C1A598;
    block[4] = self;
    __int16 v8 = v3;
    dispatch_async((dispatch_queue_t)v5, block);
  }

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS_____NSCFBackgroundSessionTask;
  -[NSURLSessionTask set_TLSMaximumSupportedProtocolVersion:](&v6, sel_set_TLSMaximumSupportedProtocolVersion_, v3);
}

- (uint64_t)cookiesForRequest:(void *)a1
{
  v19[3] = *MEMORY[0x1895F89C0];
  if (!a1
    || ![a2 URL]
    || [a2 valueForHTTPHeaderField:0x18C5AEF60]
    || !objc_msgSend((id)objc_msgSend(a1, "_effectiveConfiguration"), "HTTPCookieStorage")
    || !objc_msgSend((id)objc_msgSend(a1, "_effectiveConfiguration"), "HTTPShouldSetCookies")
    || ![a2 HTTPShouldHandleCookies])
  {
    return 0LL;
  }

  if ([a1 _siteForCookies])
  {
    v18[0] = @"_kCFHTTPCookiePolicyPropertySiteForCookies";
    v19[0] = [a1 _siteForCookies];
    v18[1] = @"_kCFHTTPCookiePolicyPropertyIsTopLevelNavigation";
    v19[1] = objc_msgSend(MEMORY[0x189607968], "numberWithBool:", objc_msgSend(a1, "_isTopLevelNavigation"));
    v18[2] = @"_kCFHTTPCookiePolicyPropertyIsSafeRequest";
    v19[2] = objc_msgSend(MEMORY[0x189607968], "numberWithBool:", objc_msgSend(a2, "_isIdempotent"));
    uint64_t v6 = [MEMORY[0x189603F68] dictionaryWithObjects:v19 forKeys:v18 count:3];
  }

  else
  {
    uint64_t v6 = 0LL;
  }

  uint64_t v12 = 0LL;
  __int128 v13 = &v12;
  uint64_t v14 = 0x3052000000LL;
  uint64_t v15 = __Block_byref_object_copy__6603;
  v16 = __Block_byref_object_dispose__6604;
  uint64_t v17 = 0LL;
  double v7 = (void *)objc_msgSend((id)objc_msgSend(a1, "_effectiveConfiguration"), "HTTPCookieStorage");
  uint64_t v8 = [a2 URL];
  uint64_t v9 = [a2 mainDocumentURL];
  uint64_t v10 = [a1 _storagePartitionIdentifier];
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = __49____NSCFBackgroundSessionTask_cookiesForRequest___block_invoke;
  v11[3] = &unk_189C1A6D8;
  v11[4] = &v12;
  [v7 _getCookiesForURL:v8 mainDocumentURL:v9 partition:v10 policyProperties:v6 completionHandler:v11];
  uint64_t v4 = [(id)v13[5] objectForKeyedSubscript:0x18C5AEF60];
  _Block_object_dispose(&v12, 8);
  return v4;
}

- (void)_onqueue_connectionWaitingWithReason:(void *)a1
{
  if (a1)
  {
    uint64_t v2 = a1[88];
    if (!v2) {
      uint64_t v2 = a1[87];
    }
    -[__NSCFURLSessionDelegateWrapper task:_isWaitingForConnectionWithError:]( v2,  a1,  (void *)[MEMORY[0x189607870] errorWithDomain:@"NSTCPConnectionConditionsUnmetReasonErrorDomain" code:a2 userInfo:0]);
  }

@end