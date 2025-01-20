@interface NWURLSessionTask
- ($1C4110BDDF6CE1A35BD1F09FD54CA4C3)logDescription;
- (BOOL)_callCompletionHandlerInline;
- (BOOL)_isTopLevelNavigation;
- (BOOL)_keepDownloadTaskFile;
- (BOOL)_preconnect;
- (BOOL)createTimerWithTimeout:(uint64_t)a1;
- (BOOL)isKindOfClass:(Class)a3;
- (BOOL)prefersIncrementalDelivery;
- (NSArray)_resolvedCNAMEChain;
- (NSDate)earliestBeginDate;
- (NSDictionary)_trailers;
- (NSProgress)progress;
- (NSString)_pathToDownloadTaskFile;
- (NSString)_storagePartitionIdentifier;
- (NSString)description;
- (NSString)taskDescription;
- (NSURL)_siteForCookies;
- (NSURLRequest)currentRequest;
- (NSURLRequest)originalRequest;
- (NSURLResponse)response;
- (NSURLSessionDataTask)loaderDataTask;
- (NSURLSessionTaskDelegate)_internalDelegate;
- (NSURLSessionTaskDelegate)delegate;
- (NSURLSessionTaskMetrics)_incompleteTaskMetrics;
- (NSURLSessionTaskTransactionMetrics)_incompleteCurrentTaskTransactionMetrics;
- (NWURLError)error;
- (OS_nw_activity)_nw_activity;
- (OS_nw_context)networkContext;
- (OS_nw_endpoint)_hostOverride;
- (OS_nw_protocol_metadata)clientMetadata;
- (__SecTrust)secTrust;
- (double)_timeoutIntervalForResource;
- (float)priority;
- (id)_cookieTransformCallback;
- (id)_timingData;
- (id)errorForErrorCode:(id *)a1;
- (id)errorWithResumeData:(id)a3;
- (id)initWithRequest:(int)a3 identifier:(void *)a4 session:;
- (int64_t)_bytesPerSecondLimit;
- (int64_t)_countOfBytesReceivedEncoded;
- (int64_t)countOfBytesClientExpectsToReceive;
- (int64_t)countOfBytesClientExpectsToSend;
- (int64_t)countOfBytesExpectedToReceive;
- (int64_t)countOfBytesExpectedToSend;
- (int64_t)countOfBytesReceived;
- (int64_t)countOfBytesSent;
- (int64_t)state;
- (unint64_t)taskIdentifier;
- (void)_adoptEffectiveConfiguration:(id)a3;
- (void)_setExplicitCookieStorage:(OpaqueCFHTTPCookieStorage *)a3;
- (void)cancel;
- (void)complete;
- (void)completeTaskWithError:(id)a3;
- (void)dealloc;
- (void)delegateWrapper;
- (void)finishProgressReporting;
- (void)getUnderlyingHTTPConnectionInfoWithCompletionHandler:(id)a3;
- (void)joiningContext;
- (void)loaderConnectedWithHTTPConnectionMetadata:(id)a3 CNAMEChain:(id)a4 unlistedTracker:(id)a5;
- (void)loaderDidReceiveChallenge:(id)a3 completionHandler:(id)a4;
- (void)loaderDidReceiveClientCertificateChallenge:(id)a3 completionHandler:(id)a4;
- (void)loaderDidReceiveInformationalResponse:(id)a3;
- (void)loaderDidReceiveServerTrustChallenge:(id)a3 secProtocolMetadata:(id)a4 completionHandler:(id)a5;
- (void)loaderDidSendBodyData:(int64_t)a3 totalBytesSent:(int64_t)a4 totalBytesExpectedToSend:(int64_t)a5 completionHandler:(id)a6;
- (void)loaderFailedToConnect:(id)a3;
- (void)loaderNeedsBodyProviderFromOffset:(unint64_t)a3 completionHandler:(id)a4;
- (void)loaderPreparingConnection;
- (void)loaderRunDelegateBlock:(id)a3;
- (void)loaderWaitingForConnectivity;
- (void)loaderWillPerformHSTSUpgrade:(BOOL)a3;
- (void)loaderWillPerformHTTPRedirection:(id)a3 newRequest:(id)a4;
- (void)loaderWillPerformHTTPRedirection:(id)a3 newRequest:(id)a4 completionHandler:(id)a5;
- (void)performNextServerTrustChallenge;
- (void)readResponseBody;
- (void)resume;
- (void)setClientMetadataForMetrics:(uint64_t)a1;
- (void)setConfiguration:(uint64_t)a1;
- (void)setCountOfBytesClientExpectsToReceive:(int64_t)a3;
- (void)setCountOfBytesClientExpectsToSend:(int64_t)a3;
- (void)setCountOfBytesExpectedToReceive:(void *)result;
- (void)setCountOfBytesExpectedToSend:(void *)result;
- (void)setCountOfBytesReceived:(uint64_t)a1;
- (void)setDelegate:(id)a3;
- (void)setEarliestBeginDate:(id)a3;
- (void)setLoader:(uint64_t)a1;
- (void)setPrefersIncrementalDelivery:(BOOL)a3;
- (void)setPriority:(float)a3;
- (void)setSecTrust:(__SecTrust *)a3;
- (void)setTaskDescription:(id)a3;
- (void)set_bytesPerSecondLimit:(int64_t)a3;
- (void)set_callCompletionHandlerInline:(BOOL)a3;
- (void)set_cookieTransformCallback:(id)a3;
- (void)set_hostOverride:(id)a3;
- (void)set_internalDelegate:(id)a3;
- (void)set_isTopLevelNavigation:(BOOL)a3;
- (void)set_keepDownloadTaskFile:(BOOL)a3;
- (void)set_nw_activity:(id)a3;
- (void)set_pathToDownloadTaskFile:(id)a3;
- (void)set_preconnect:(BOOL)a3;
- (void)set_siteForCookies:(id)a3;
- (void)set_storagePartitionIdentifier:(id)a3;
- (void)set_timeoutIntervalForResource:(double)a3;
- (void)startNextLoad:(BOOL)a3;
- (void)startResourceTimer;
- (void)startStartTimer;
- (void)suspend;
- (void)updateResponse:(uint64_t)a1;
@end

@implementation NWURLSessionTask

- (BOOL)isKindOfClass:(Class)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NWURLSessionTask;
  if (-[NWURLSessionTask isKindOfClass:](&v5, sel_isKindOfClass_)) {
    return 1;
  }
  else {
    return -[objc_class isEqual:](a3, "isEqual:", objc_opt_class());
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NWURLSessionTask;
  -[NWURLSessionTask dealloc](&v3, sel_dealloc);
}

- (void)resume
{
  uint64_t v36 = *MEMORY[0x1895F89C0];
  __int128 v35 = 0uLL;
  -[NWURLSessionTask _nw_activity](self, "_nw_activity");
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    nw_activity_activate(v3);
    nw_activity_get_token(v4, &v35);
  }

  if (__nwlog_url_log::onceToken != -1) {
    dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44366);
  }
  objc_super v5 = (os_log_s *)(id)gurlLogObj;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[NWURLSessionTask logDescription](self, "logDescription");
    -[NWURLSessionTask logDescription](self, "logDescription");
    if (self)
    {
      v6 = self->_configuration;
      p_isa = (id *)&v6->super.isa;
      uint64_t v8 = 0LL;
      uint64_t v9 = 0LL;
      if (v6)
      {
        else {
          [p_isa[2] timeoutIntervalForRequest];
        }
        uint64_t v9 = v10;
      }

      configuration = self->_configuration;
      if (configuration)
      {
        -[NWURLSessionTask _timeoutIntervalForResource](configuration->_task, "_timeoutIntervalForResource");
        if (v12 == 0.0) {
          -[NSURLSessionConfiguration timeoutIntervalForResource]( configuration->_configuration,  "timeoutIntervalForResource");
        }
        else {
          -[NWURLSessionTask _timeoutIntervalForResource](configuration->_task, "_timeoutIntervalForResource");
        }
        uint64_t v8 = v13;
      }
    }

    else
    {
      p_isa = 0LL;
      uint64_t v9 = 0LL;
      uint64_t v8 = 0LL;
    }

    qos_class_t v14 = qos_class_self();
    *(_DWORD *)buf = 68290562;
    int v20 = 16;
    __int16 v21 = 2098;
    v22 = &v18;
    __int16 v23 = 1024;
    int v24 = v17;
    __int16 v25 = 2048;
    uint64_t v26 = v9;
    __int16 v27 = 2048;
    uint64_t v28 = v8;
    __int16 v29 = 1024;
    qos_class_t v30 = v14;
    __int16 v31 = 1042;
    int v32 = 16;
    __int16 v33 = 2098;
    v34 = &v35;
    _os_log_impl( &dword_181A5C000,  v5,  OS_LOG_TYPE_DEFAULT,  "Task <%{public,uuid_t}.16P>.<%u> resuming, timeouts(%.1f, %.1f), qos(0x%x), activity(%{public,uuid_t}.16P)",  buf,  0x42u);
  }

  if (self) {
    queue = (dispatch_queue_s *)self->_queue;
  }
  else {
    queue = 0LL;
  }
  v16[0] = MEMORY[0x1895F87A8];
  v16[1] = 3221225472LL;
  v16[2] = __26__NWURLSessionTask_resume__block_invoke;
  v16[3] = &unk_189BC93A0;
  v16[4] = self;
  dispatch_async(queue, v16);
}

- (void)suspend
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  if (__nwlog_url_log::onceToken != -1) {
    dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44366);
  }
  objc_super v3 = (os_log_s *)(id)gurlLogObj;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[NWURLSessionTask logDescription](self, "logDescription");
    -[NWURLSessionTask logDescription](self, "logDescription");
    *(_DWORD *)buf = 68289282;
    int v9 = 16;
    __int16 v10 = 2098;
    v11 = &v7;
    __int16 v12 = 1024;
    int v13 = v6;
    _os_log_impl(&dword_181A5C000, v3, OS_LOG_TYPE_DEFAULT, "Task <%{public,uuid_t}.16P>.<%u> suspending", buf, 0x18u);
  }

  if (self) {
    queue = (dispatch_queue_s *)self->_queue;
  }
  else {
    queue = 0LL;
  }
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __27__NWURLSessionTask_suspend__block_invoke;
  v5[3] = &unk_189BC93A0;
  v5[4] = self;
  dispatch_async(queue, v5);
}

- (void)cancel
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  if (__nwlog_url_log::onceToken != -1) {
    dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44366);
  }
  objc_super v3 = (os_log_s *)(id)gurlLogObj;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[NWURLSessionTask logDescription](self, "logDescription");
    -[NWURLSessionTask logDescription](self, "logDescription");
    *(_DWORD *)buf = 68289282;
    int v9 = 16;
    __int16 v10 = 2098;
    v11 = &v7;
    __int16 v12 = 1024;
    int v13 = v6;
    _os_log_impl(&dword_181A5C000, v3, OS_LOG_TYPE_DEFAULT, "Task <%{public,uuid_t}.16P>.<%u> cancelling", buf, 0x18u);
  }

  if (self) {
    queue = (dispatch_queue_s *)self->_queue;
  }
  else {
    queue = 0LL;
  }
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __26__NWURLSessionTask_cancel__block_invoke;
  v5[3] = &unk_189BC93A0;
  v5[4] = self;
  dispatch_async(queue, v5);
}

- (unint64_t)taskIdentifier
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  -[NWURLSessionTask logDescription](self, "logDescription");
  return v3;
}

- (NSURLResponse)response
{
  if (self) {
    self = (NWURLSessionTask *)self->_responseConsumer;
  }
  return -[NWURLSessionTask response](self, "response");
}

- (NSURLSessionTaskDelegate)delegate
{
  if (self && (publicDelegateWrapper = self->_publicDelegateWrapper) != 0LL) {
    return (NSURLSessionTaskDelegate *)objc_getProperty(publicDelegateWrapper, a2, 16LL, 1);
  }
  else {
    return 0LL;
  }
}

- (void)setDelegate:(id)a3
{
  if (self)
  {
    publicDelegateWrapper = self->_publicDelegateWrapper;
    if (publicDelegateWrapper) {
      objc_setProperty_atomic(publicDelegateWrapper, a2, a3, 16LL);
    }
  }

- (NSURLSessionTaskDelegate)_internalDelegate
{
  else {
    return 0LL;
  }
}

- (void)set_internalDelegate:(id)a3
{
  id newValue = a3;
  if (newValue)
  {
    if (self)
    {
      internalDelegateWrapper = self->_internalDelegateWrapper;
      if (internalDelegateWrapper)
      {
LABEL_7:
        objc_setProperty_atomic(internalDelegateWrapper, v4, newValue, 16LL);
LABEL_10:
        uint64_t v4 = (char *)newValue;
        goto LABEL_11;
      }

      int v6 = objc_alloc(&OBJC_CLASS___NWURLSessionDelegateWrapper);
      publicDelegateWrapper = self->_publicDelegateWrapper;
    }

    else
    {
      int v6 = objc_alloc(&OBJC_CLASS___NWURLSessionDelegateWrapper);
      publicDelegateWrapper = 0LL;
    }

    uint64_t v8 = publicDelegateWrapper;
    int v9 = -[NWURLSessionDelegateWrapper initWithFallbackDelegateWrapper:]((id *)&v6->super.isa, v8);
    __int16 v10 = v9;
    if (!self)
    {

      goto LABEL_10;
    }

    objc_storeStrong((id *)&self->_internalDelegateWrapper, v9);

    internalDelegateWrapper = self->_internalDelegateWrapper;
    uint64_t v4 = (char *)newValue;
  }

  else
  {
    uint64_t v4 = 0LL;
    if (self)
    {
      v11 = self->_internalDelegateWrapper;
      self->_internalDelegateWrapper = 0LL;

      goto LABEL_10;
    }
  }

- (void)setSecTrust:(__SecTrust *)a3
{
  if (a3) {
    CFRetain(a3);
  }
  secTrust = self->_secTrust;
  if (secTrust) {
    CFRelease(secTrust);
  }
  self->_secTrust = a3;
}

- (int64_t)state
{
  if (self)
  {
    int64_t internalState = self->_internalState;
  }

  return 1LL;
}

- (void)startNextLoad:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v89 = *MEMORY[0x1895F89C0];
  if (self)
  {
    nw_context_assert_queue(self->_sessionContext);
    configuration = self->_configuration;
  }

  else
  {
    nw_context_assert_queue(0LL);
    configuration = 0LL;
  }

  int v6 = configuration;
  -[NWURLSessionTask currentRequest](self, "currentRequest");
  char v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v8 = v7;
  if (v6) {
    objc_storeStrong(v6 + 4, v7);
  }

  if (self)
  {
    int v9 = self->_configuration;
    p_isa = (id *)&v9->super.isa;
    if (v9)
    {
      else {
        [p_isa[2] timeoutIntervalForRequest];
      }
    }

    else
    {
      double v11 = 0.0;
    }

    self->_timeoutIntervalForRequest = v11;

    if (!v3) {
      goto LABEL_12;
    }
  }

  else
  {

    if (!v3) {
      goto LABEL_12;
    }
  }

  -[NWURLSessionTask startStartTimer]((uint64_t)self);
  -[NWURLSessionTask startResourceTimer](self);
LABEL_12:
  if (self && (__int16 v12 = self->_configuration) != 0LL)
  {
    -[NSURLSessionConfiguration protocolClasses](v12->_configuration, "protocolClasses");
    int v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    int v13 = 0LL;
  }

  id v14 = objc_alloc_init(MEMORY[0x189603FA8]);
  __int128 v72 = 0u;
  __int128 v73 = 0u;
  __int128 v74 = 0u;
  __int128 v75 = 0u;
  id v15 = v13;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v72 objects:v80 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v73;
    do
    {
      for (uint64_t i = 0LL; i != v17; ++i)
      {
        if (*(void *)v73 != v18) {
          objc_enumerationMutation(v15);
        }
        int v20 = *(void **)(*((void *)&v72 + 1) + 8 * i);
        if (([v20 isSubclassOfClass:NSClassFromString((NSString *)@"_NSCFURLProtocol")] & 1) == 0) {
          [v14 addObject:v20];
        }
      }

      uint64_t v17 = [v15 countByEnumeratingWithState:&v72 objects:v80 count:16];
    }

    while (v17);
  }

  if (self)
  {
    __int16 v21 = self->_requestBody;
    v22 = v21;
    if (v21) {
      uint64_t knownSize = v21->_knownSize;
    }
    else {
      uint64_t knownSize = 0LL;
    }
    -[NWURLSessionTask setCountOfBytesExpectedToSend:](self, knownSize);
  }

  else
  {
    v22 = 0LL;
  }

  -[NWURLSessionTask currentRequest](self, "currentRequest");
  int v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
  {
    __int16 v25 = self->_requestBody;
    if (v25) {
      unint64_t v26 = v25->_knownSize;
    }
    else {
      unint64_t v26 = 0LL;
    }
    v65 = v25;
    __int16 v27 = self->_configuration;
    queue = self->_queue;
  }

  else
  {
    unint64_t v26 = 0LL;
    v65 = 0LL;
    __int16 v27 = 0LL;
    queue = 0LL;
  }

  uint64_t v29 = MEMORY[0x1895F87A8];
  v68[0] = MEMORY[0x1895F87A8];
  v68[1] = 3221225472LL;
  v69 = __34__NWURLSessionTask_startNextLoad___block_invoke;
  v70 = &unk_189BBEE48;
  v71 = self;
  id v30 = v24;
  __int16 v31 = v27;
  v67 = queue;
  int v32 = self;
  id v33 = v14;
  v34 = v68;
  objc_opt_self();
  [v30 URL];
  __int128 v35 = (void *)objc_claimAutoreleasedReturnValue();
  [v35 scheme];
  uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();

  v66 = v36;
  if (!v36)
  {
    v69((uint64_t)v34, 0LL);
    v47 = v65;
    v37 = v67;
    goto LABEL_54;
  }

  if (![v36 caseInsensitiveCompare:@"http"]
    || ![v36 caseInsensitiveCompare:@"https"])
  {
    v37 = v67;
    v38 = -[NWURLLoaderHTTP initWithRequest:bodyKnownSize:configuration:queue:client:]( (id *)objc_alloc(&OBJC_CLASS___NWURLLoaderHTTP),  v30,  v26,  v31,  v67,  v32);
    goto LABEL_36;
  }

  v63 = v34;
  v49 = v31;
  [v30 URL];
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  int v51 = [v50 isFileURL];

  v37 = v67;
  if (!v51)
  {
    if ([v66 caseInsensitiveCompare:@"data"])
    {
      if ([v66 caseInsensitiveCompare:@"about"])
      {
        v38 = 0LL;
        goto LABEL_65;
      }

      v59 = objc_alloc(&OBJC_CLASS___NWURLLoaderAbout);
      [v30 URL];
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = -[NWURLLoaderAbout initWithURL:]((id *)&v59->super.isa, v57);
    }

    else
    {
      v56 = objc_alloc(&OBJC_CLASS___NWURLLoaderData);
      [v30 URL];
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = -[NWURLLoaderData initWithURL:]((id *)&v56->super.isa, v57);
    }

    v38 = v58;

    goto LABEL_65;
  }

  v38 = -[NWURLLoaderFile initWithRequest:queue:]((id *)objc_alloc(&OBJC_CLASS___NWURLLoaderFile), v30, v67);
LABEL_65:
  __int16 v31 = v49;
  v34 = v63;
LABEL_36:
  if (isWebKitNetworking_onceToken[0] != -1) {
    dispatch_once(isWebKitNetworking_onceToken, &__block_literal_global_180);
  }
  if (isWebKitNetworking_result == 1)
  {
    __int128 v78 = 0u;
    __int128 v79 = 0u;
    __int128 v76 = 0u;
    __int128 v77 = 0u;
    id v64 = v33;
    id v39 = v33;
    uint64_t v40 = [v39 countByEnumeratingWithState:&v76 objects:v81 count:16];
    if (v40)
    {
      uint64_t v41 = v40;
      v61 = v30;
      v62 = v34;
      v60 = v31;
      uint64_t v42 = *(void *)v77;
      while (2)
      {
        for (uint64_t j = 0LL; j != v41; ++j)
        {
          if (*(void *)v77 != v42) {
            objc_enumerationMutation(v39);
          }
          v44 = *(void **)(*((void *)&v76 + 1) + 8 * j);
          v45 = -[NWURLSessionTask loaderTask](v32, "loaderTask", v60, v61);
          int v46 = [v44 canInitWithTask:v45];

          if (v46)
          {
            __int16 v31 = v60;
            id v30 = v61;
            v37 = v67;
            v48 = -[NWURLLoader initWithRequest:configuration:queue:client:protocolClass:]( (id *)objc_alloc(&OBJC_CLASS___NWURLLoader),  v61,  v60,  v67,  v32,  v44);

            v38 = v48;
            goto LABEL_52;
          }
        }

        uint64_t v41 = [v39 countByEnumeratingWithState:&v76 objects:v81 count:16];
        if (v41) {
          continue;
        }
        break;
      }

      __int16 v31 = v60;
      id v30 = v61;
      v37 = v67;
LABEL_52:
      v34 = v62;
    }

    v69((uint64_t)v34, v38);
    id v33 = v64;
    v47 = v65;
  }

  else
  {
    if ([v33 count])
    {
      v81[0] = v29;
      v81[1] = 3221225472LL;
      v81[2] = __111__NWURLLoader_makeLoaderForRequest_bodyKnownSize_configuration_queue_client_protocolClasses_completionHandler___block_invoke;
      v81[3] = &unk_189BC6ED8;
      v82 = v38;
      id v83 = v33;
      v52 = v32;
      v84 = v52;
      id v85 = v30;
      v86 = v31;
      v87 = v37;
      v88 = v34;
      v53 = v34;
      v54 = v31;
      v55 = v38;
      -[NWURLSessionTask loaderRunDelegateBlock:](v52, "loaderRunDelegateBlock:", v81);

      __int16 v31 = v54;
      v34 = v53;
    }

    else
    {
      v69((uint64_t)v34, v38);
    }

    v47 = v65;
  }

- (void)completeTaskWithError:(id)a3
{
  id v4 = a3;
  if (!self)
  {
    nw_context_assert_queue(0LL);
LABEL_5:
    -[NWURLSessionTask errorWithResumeData:](self, "errorWithResumeData:", v4);
    id newValue = (id)objc_claimAutoreleasedReturnValue();

    -[NWURLSessionTask error](self, "error");
    int v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      if (!self) {
        goto LABEL_13;
      }
    }

    else
    {
      if (!self)
      {
LABEL_13:
        responseConsumer = 0LL;
        goto LABEL_11;
      }

      objc_setProperty_atomic_copy(self, v7, newValue, 136LL);
    }

    responseConsumer = self->_responseConsumer;
LABEL_11:
    -[NWURLSessionResponseConsumer task:deliverData:complete:error:completionHandler:]( responseConsumer,  "task:deliverData:complete:error:completionHandler:",  self,  0LL,  1LL,  newValue,  &__block_literal_global_45534);
    -[NWURLSessionTask complete]((uint64_t)self);
    objc_super v5 = newValue;
    goto LABEL_12;
  }

  nw_context_assert_queue(self->_sessionContext);
  objc_super v5 = v4;
LABEL_12:
}

- (NSString)description
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  v14[23] = 0;
  __int128 v15 = unk_182667510;
  __int128 v16 = xmmword_182667520;
  strcpy((char *)v14, "Task <00000000-0000-0000-0000-000000000000>.<");
  if (self) {
    session = self->_session;
  }
  else {
    session = 0LL;
  }
  id v4 = session;
  -[NWURLSessionTask logDescription](self, "logDescription");
  uuid_unparse(uu, (char *)&v14[3]);
  LOBYTE(v14[21]) = 62;
  -[NWURLSessionTask logDescription](self, "logDescription");
  uint64_t v5 = 0LL;
  unsigned int v6 = v12;
  unsigned int v7 = v12;
  do
  {
    int v8 = v5++;
    BOOL v9 = v7 > 9;
    v7 /= 0xAu;
  }

  while (v9);
  do
  {
    *((_BYTE *)&v14[22] + v5--) = (v6 % 0xA) | 0x30;
    v6 /= 0xAu;
  }

  while (v5 > 0);
  *((_BYTE *)v14 + (v8 + 46)) = 62;
  [NSString stringWithCString:v14 encoding:1];
  __int16 v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (id)errorWithResumeData:(id)a3
{
  return a3;
}

- (NSURLSessionDataTask)loaderDataTask
{
  return 0LL;
}

- (OS_nw_protocol_metadata)clientMetadata
{
  if (self) {
    self = (NWURLSessionTask *)self->_clientMetadataForMetrics;
  }
  return (OS_nw_protocol_metadata *)self;
}

- (void)joiningContext
{
  if (self) {
    return (void *)*((void *)self + 50);
  }
  return self;
}

- (OS_nw_context)networkContext
{
  if (self) {
    self = (NWURLSessionTask *)self->_sessionContext;
  }
  return (OS_nw_context *)self;
}

- (void)loaderRunDelegateBlock:(id)a3
{
  if (!self) {
    goto LABEL_7;
  }
  uint64_t v4 = 31LL;
  Class v5 = (&self->super.isa)[v4];
  if (v5)
  {
    Class v6 = v5;
    -[NWURLSessionDelegateQueue runDelegateBlock:](&v5[6].isa->isa, a3);
  }

  else
  {
LABEL_7:
    Class v6 = 0LL;
  }
}

- (void)loaderNeedsBodyProviderFromOffset:(unint64_t)a3 completionHandler:(id)a4
{
  Class v6 = (void (**)(id, void *))a4;
  if (!self || (requestBody = self->_requestBody) == 0LL)
  {
    __int16 v10 = 0LL;
    goto LABEL_7;
  }

  int v8 = requestBody->_data;
  if (v8 || requestBody->_fileURL)
  {

LABEL_6:
    __int16 v10 = self->_requestBody;
LABEL_7:
    double v11 = v10;
    -[NWURLSessionRequestBodyInfo bodyProviderFromOffset:](v11, (id)a3);
    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v12);

    goto LABEL_8;
  }

  if (requestBody->_stream && requestBody->_streamOffset == a3) {
    goto LABEL_6;
  }
  if (self->_timeoutIntervalForRequest > 0.0)
  {
    requestTimeoutTimer = (dispatch_source_t *)self->_requestTimeoutTimer;
    if (requestTimeoutTimer)
    {
      if (*requestTimeoutTimer)
      {
        dispatch_source_set_timer(*requestTimeoutTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
      }

      else
      {
        requestTimeoutTimer[4] = (dispatch_source_t)-1LL;
        requestTimeoutTimer[5] = (dispatch_source_t)-1LL;
        if (*((_BYTE *)requestTimeoutTimer + 48) && *((_BYTE *)requestTimeoutTimer + 49)) {
          nw_queue_source_run_timer((uint64_t)requestTimeoutTimer, v9);
        }
      }
    }
  }

  uint64_t v14 = 31LL;
  Class v15 = (&self->super.isa)[v14];
  v42[0] = MEMORY[0x1895F87A8];
  v42[1] = 3221225472LL;
  v43 = __72__NWURLSessionTask_loaderNeedsBodyProviderFromOffset_completionHandler___block_invoke;
  v44 = &unk_189BBEFA0;
  v45 = self;
  int v46 = v6;
  unint64_t v47 = a3;
  __int128 v16 = self;
  uint64_t v17 = v42;
  v19 = v17;
  if (v15)
  {
    uint64_t v41 = v17;
    -[NWURLSessionDelegateWrapper delegateFor_needNewBodyStreamFromOffset](v15, v18);
    __int16 v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      v22 = v15[4].isa;
      __int16 v23 = v15[5].isa;
      int v24 = objc_alloc(&OBJC_CLASS___NWURLSessionDelegateDeallocBomb);
      id v25 = v21;
      if (v24)
      {
        v48.receiver = v24;
        v48.super_class = (Class)&OBJC_CLASS___NWURLSessionDelegateDeallocBomb;
        id v26 = -[NWURLSessionTask init](&v48, sel_init);
        int v24 = (NWURLSessionDelegateDeallocBomb *)v26;
        if (v26)
        {
          objc_storeStrong((id *)v26 + 2, v21);
          v24->__method = sel_task_needNewBodyStreamFromOffset_completionHandler_;
        }
      }

      v48.receiver = (id)MEMORY[0x1895F87A8];
      v48.super_class = (Class)3221225472LL;
      v49 = __82__NWURLSessionDelegateWrapper_task_needNewBodyStreamFromOffset_completionHandler___block_invoke;
      v50 = &unk_189BC6FC8;
      id v51 = v25;
      v52 = v22;
      v53 = v16;
      v54 = v24;
      unint64_t v57 = a3;
      v55 = v23;
      v19 = v41;
      v56 = v41;
      p_isa = &v15[6].isa->isa;
      uint64_t v28 = v23;
      uint64_t v29 = v24;
      id v30 = v22;
      -[NWURLSessionDelegateQueue runDelegateBlock:](p_isa, &v48);
    }

    else if (a3)
    {
      v43(v41, 0LL);
      v19 = v41;
    }

    else
    {
      -[NWURLSessionDelegateWrapper delegateFor_needNewBodyStream](v15, v20);
      __int16 v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (v31)
      {
        int v32 = v15[4].isa;
        id v33 = v15[5].isa;
        v34 = objc_alloc(&OBJC_CLASS___NWURLSessionDelegateDeallocBomb);
        id v35 = v31;
        if (v34)
        {
          v48.receiver = v34;
          v48.super_class = (Class)&OBJC_CLASS___NWURLSessionDelegateDeallocBomb;
          id v36 = -[NWURLSessionTask init](&v48, sel_init);
          v34 = (NWURLSessionDelegateDeallocBomb *)v36;
          if (v36)
          {
            objc_storeStrong((id *)v36 + 2, v31);
            v34->__method = sel_task_needNewBodyStreamFromOffset_completionHandler_;
          }
        }

        v48.receiver = (id)MEMORY[0x1895F87A8];
        v48.super_class = (Class)3221225472LL;
        v49 = __82__NWURLSessionDelegateWrapper_task_needNewBodyStreamFromOffset_completionHandler___block_invoke_4;
        v50 = &unk_189BC6F78;
        id v51 = v35;
        v52 = v32;
        v53 = v16;
        v54 = v34;
        v55 = v33;
        v19 = v41;
        v56 = v41;
        v37 = &v15[6].isa->isa;
        v38 = v33;
        id v39 = v34;
        uint64_t v40 = v32;
        -[NWURLSessionDelegateQueue runDelegateBlock:](v37, &v48);
      }

      else
      {
        v43(v41, 0LL);
        v19 = v41;
      }
    }
  }

LABEL_8:
}

- (void)loaderPreparingConnection
{
  if (self)
  {
    double timeoutIntervalForRequest = self->_timeoutIntervalForRequest;
    if (timeoutIntervalForRequest > 0.0)
    {
      requestTimeoutTimer = (dispatch_source_t *)self->_requestTimeoutTimer;
      if (requestTimeoutTimer)
      {
        dispatch_time_t v4 = dispatch_time(0x8000000000000000LL, (uint64_t)(timeoutIntervalForRequest * 1000000000.0));
        if (*requestTimeoutTimer)
        {
          dispatch_source_set_timer(*requestTimeoutTimer, v4, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
        }

        else
        {
          requestTimeoutTimer[4] = (dispatch_source_t)v4;
          requestTimeoutTimer[5] = (dispatch_source_t)-1LL;
          if (*((_BYTE *)requestTimeoutTimer + 48))
          {
            if (*((_BYTE *)requestTimeoutTimer + 49)) {
              nw_queue_source_run_timer((uint64_t)requestTimeoutTimer, v4);
            }
          }
        }
      }

      else
      {
        self->_requestTimeoutTimer = (void *)-[NWURLSessionTask createTimerWithTimeout:]( (uint64_t)self,  timeoutIntervalForRequest);
      }
    }
  }

- (void)loaderWaitingForConnectivity
{
  if (self)
  {
    configuration = self->_configuration;
    if (configuration)
    {
      if (-[NSURLSessionConfiguration waitsForConnectivity](configuration->_configuration, "waitsForConnectivity"))
      {
        if (self->_timeoutIntervalForRequest > 0.0)
        {
          requestTimeoutTimer = (dispatch_source_t *)self->_requestTimeoutTimer;
          if (requestTimeoutTimer)
          {
            if (*requestTimeoutTimer)
            {
              dispatch_source_set_timer(*requestTimeoutTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
            }

            else
            {
              requestTimeoutTimer[4] = (dispatch_source_t)-1LL;
              requestTimeoutTimer[5] = (dispatch_source_t)-1LL;
              if (*((_BYTE *)requestTimeoutTimer + 48) && *((_BYTE *)requestTimeoutTimer + 49)) {
                nw_queue_source_run_timer((uint64_t)requestTimeoutTimer, v4);
              }
            }
          }
        }

        uint64_t v6 = 31LL;
        Class v13 = (&self->super.isa)[v6];
        int v8 = self;
        if (v13)
        {
          -[NWURLSessionDelegateWrapper delegateFor_isWaitingForConnectivity](v13, v7);
          uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (v9)
          {
            __int16 v10 = v13[4].isa;
            v14[0] = MEMORY[0x1895F87A8];
            v14[1] = 3221225472LL;
            v14[2] = __60__NWURLSessionDelegateWrapper_taskIsWaitingForConnectivity___block_invoke;
            v14[3] = &unk_189BC6E60;
            id v15 = v9;
            __int128 v16 = v10;
            uint64_t v17 = v8;
            p_isa = &v13[6].isa->isa;
            unsigned int v12 = v10;
            -[NWURLSessionDelegateQueue runDelegateBlock:](p_isa, v14);
          }
        }
      }
    }
  }

- (void)loaderConnectedWithHTTPConnectionMetadata:(id)a3 CNAMEChain:(id)a4 unlistedTracker:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v12 = a5;
  if (self)
  {
    startTimeoutTimer = self->_startTimeoutTimer;
    if (startTimeoutTimer)
    {
      self->_startTimeoutTimer = 0LL;
      nw_queue_cancel_source((uint64_t)startTimeoutTimer, v11);
    }

    -[NWURLSessionTask currentRequest](self, "currentRequest");
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 _payloadTransmissionTimeout];
    double v16 = v15;

    if (v16 > 0.0 && !self->_payloadTimeoutTimer) {
      self->_payloadTimeoutTimer = (void *)-[NWURLSessionTask createTimerWithTimeout:]((uint64_t)self, v16);
    }
    if (objc_getProperty(self, v17, 304LL, 1))
    {
      v19 = objc_alloc(&OBJC_CLASS____NWHTTPConnectionInfo);
      uint64_t v20 = 31LL;
      Class v21 = (&self->super.isa)[v20];
      v22 = v21;
      id v23 = v9;
      int v24 = v22;
      if (v19)
      {
        v34.receiver = v19;
        v34.super_class = (Class)&OBJC_CLASS____NWHTTPConnectionInfo;
        id v25 = -[NWURLSessionTask init](&v34, sel_init);
        v19 = (_NWHTTPConnectionInfo *)v25;
        if (v25)
        {
          objc_storeStrong((id *)v25 + 1, a3);
          objc_storeStrong((id *)&v19->_delegateWrapper, v21);
        }
      }

      Property = (void (**)(id, _NWHTTPConnectionInfo *))objc_getProperty(self, v26, 304LL, 1);
      Property[2](Property, v19);
    }

    objc_setProperty_atomic(self, v18, v10, 192LL);
    if (v12)
    {
      backtrace = self->_backtrace;
      if (backtrace)
      {
        uint64_t v29 = backtrace;
        id v30 = v12;
        [v30 UTF8String];
        -[NSData bytes](v29, "bytes");
        -[NSData length](v29, "length");
        ne_tracker_create_xcode_issue();
      }
    }

    configuration = self->_configuration;
    if (configuration && -[NWURLSessionTask _preconnect](configuration->_task, "_preconnect"))
    {
      responseConsumer = self->_responseConsumer;
      v33[0] = MEMORY[0x1895F87A8];
      v33[1] = 3221225472LL;
      v33[2] = __89__NWURLSessionTask_loaderConnectedWithHTTPConnectionMetadata_CNAMEChain_unlistedTracker___block_invoke;
      v33[3] = &unk_189BBF480;
      v33[4] = self;
      -[NWURLSessionResponseConsumer task:deliverData:complete:error:completionHandler:]( responseConsumer,  "task:deliverData:complete:error:completionHandler:",  self,  0LL,  1LL,  0LL,  v33);
    }
  }
}

- (void)loaderFailedToConnect:(id)a3
{
  id v5 = a3;
  if (self)
  {
    configuration = self->_configuration;
    if (configuration)
    {
      if (-[NWURLSessionTask _preconnect](configuration->_task, "_preconnect")) {
        -[NWURLSessionTask completeTaskWithError:](self, "completeTaskWithError:", v5);
      }
    }
  }
}

- (void)loaderWillPerformHSTSUpgrade:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v51 = *MEMORY[0x1895F89C0];
  if (__nwlog_url_log::onceToken != -1) {
    dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44366);
  }
  id v5 = (os_log_s *)(id)gurlLogObj;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[NWURLSessionTask logDescription](self, "logDescription");
    -[NWURLSessionTask logDescription](self, "logDescription");
    *(_DWORD *)buf = 68289538;
    *(_DWORD *)&uint8_t buf[4] = 16;
    LOWORD(v42) = 2098;
    *(void *)((char *)&v42 + 2) = &v40;
    WORD5(v42) = 1024;
    HIDWORD(v42) = v39;
    LOWORD(v43) = 1024;
    *(_DWORD *)((char *)&v43 + 2) = v3;
    _os_log_impl( &dword_181A5C000,  v5,  OS_LOG_TYPE_DEFAULT,  "Task <%{public,uuid_t}.16P>.<%u> scheme upgraded to https by HSTS {preload=%{BOOL}d}",  buf,  0x1Eu);
  }

  -[NWURLSessionTask currentRequest](self, "currentRequest");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  unsigned int v7 = (void *)[v6 mutableCopy];

  int v8 = (void *)MEMORY[0x189607A50];
  [v7 URL];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 componentsWithURL:v9 resolvingAgainstBaseURL:0];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();

  [v10 setScheme:@"https"];
  [v10 URL];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 setURL:v11];

  [v7 _setSchemeWasUpgradedDueToDynamicHSTS:!v3];
  if (self)
  {
    id v12 = self->_loader;
    loader = self->_loader;
    self->_loader = 0LL;

    objc_super v34 = v12;
    -[NWURLLoader stop](v12, "stop");
    if (self->_timeoutIntervalForRequest > 0.0)
    {
      requestTimeoutTimer = (dispatch_source_t *)self->_requestTimeoutTimer;
      if (requestTimeoutTimer)
      {
        if (*requestTimeoutTimer)
        {
          dispatch_source_set_timer(*requestTimeoutTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
        }

        else
        {
          requestTimeoutTimer[4] = (dispatch_source_t)-1LL;
          requestTimeoutTimer[5] = (dispatch_source_t)-1LL;
          if (*((_BYTE *)requestTimeoutTimer + 48) && *((_BYTE *)requestTimeoutTimer + 49)) {
            nw_queue_source_run_timer((uint64_t)requestTimeoutTimer, v14);
          }
        }
      }
    }

    uint64_t v16 = 31LL;
    Class v17 = (&self->super.isa)[v16];
  }

  else
  {
    [0 stop];
    objc_super v34 = 0LL;
    Class v17 = 0LL;
  }

  uint64_t v18 = MEMORY[0x1895F87A8];
  v35[0] = MEMORY[0x1895F87A8];
  v35[1] = 3221225472LL;
  id v36 = __49__NWURLSessionTask_loaderWillPerformHSTSUpgrade___block_invoke;
  v37 = &unk_189BBEFC8;
  v38 = self;
  v19 = self;
  id v20 = v7;
  v22 = v35;
  if (v17)
  {
    -[NWURLSessionDelegateWrapper delegateFor__schemeUpgraded](v17, v21);
    id v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      id v33 = v19;
      int v24 = v17[4].isa;
      id v25 = v17[5].isa;
      SEL v26 = objc_alloc(&OBJC_CLASS___NWURLSessionDelegateDeallocBomb);
      id v27 = v23;
      if (v26)
      {
        *(void *)buf = v26;
        *(void *)&__int128 v42 = &OBJC_CLASS___NWURLSessionDelegateDeallocBomb;
        id v28 = -[uint8_t init]((objc_super *)buf, sel_init);
        SEL v26 = (NWURLSessionDelegateDeallocBomb *)v28;
        if (v28)
        {
          objc_storeStrong((id *)v28 + 2, v23);
          v26->__method = sel_task__schemeUpgraded_completionHandler_;
        }
      }

      *(void *)buf = v18;
      *(void *)&__int128 v42 = 3221225472LL;
      *((void *)&v42 + 1) = __70__NWURLSessionDelegateWrapper_task__schemeUpgraded_completionHandler___block_invoke;
      v43 = &unk_189BC6ED8;
      id v44 = v27;
      v45 = v24;
      v19 = v33;
      int v46 = v33;
      id v47 = v20;
      objc_super v48 = v26;
      v49 = v25;
      v50 = v22;
      p_isa = &v17[6].isa->isa;
      id v30 = v25;
      __int16 v31 = v26;
      int v32 = v24;
      -[NWURLSessionDelegateQueue runDelegateBlock:](p_isa, buf);
    }

    else
    {
      v36((uint64_t)v22, v20);
    }
  }
}

- (void)loaderWillPerformHTTPRedirection:(id)a3 newRequest:(id)a4
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  if (__nwlog_url_log::onceToken != -1) {
    dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44366);
  }
  int v8 = (os_log_s *)(id)gurlLogObj;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    -[NWURLSessionTask logDescription](self, "logDescription");
    -[NWURLSessionTask logDescription](self, "logDescription");
    int v9 = (unsigned __int16)[v6 statusCode];
    if (self) {
      unint64_t redirectCount = self->_redirectCount;
    }
    else {
      unint64_t redirectCount = 0LL;
    }
    *(_DWORD *)buf = 68289794;
    *(_DWORD *)&uint8_t buf[4] = 16;
    *(_WORD *)id v25 = 2098;
    *(void *)&v25[2] = &v23;
    __int16 v26 = 1024;
    int v27 = v22;
    __int16 v28 = 1024;
    int v29 = v9;
    __int16 v30 = 2048;
    unint64_t v31 = redirectCount;
    _os_log_impl( &dword_181A5C000,  v8,  OS_LOG_TYPE_INFO,  "Task <%{public,uuid_t}.16P>.<%u> will perform redirect {status=%hu, previous_redirects=%zu}",  buf,  0x28u);
  }

  if (!self)
  {
    Class v20 = 0LL;
LABEL_20:
    v21[0] = MEMORY[0x1895F87A8];
    v21[1] = 3221225472LL;
    v21[2] = __64__NWURLSessionTask_loaderWillPerformHTTPRedirection_newRequest___block_invoke;
    v21[3] = &unk_189BBEFC8;
    v21[4] = self;
    -[NWURLSessionDelegateWrapper task:willPerformHTTPRedirection:newRequest:completionHandler:]( (uint64_t)v20,  self,  v6,  v7,  v21);

    goto LABEL_21;
  }

  unint64_t v12 = self->_redirectCount + 1;
  self->_unint64_t redirectCount = v12;
  if (v12 < 0x15)
  {
    if (self->_timeoutIntervalForRequest > 0.0)
    {
      requestTimeoutTimer = (dispatch_source_t *)self->_requestTimeoutTimer;
      if (requestTimeoutTimer)
      {
        if (*requestTimeoutTimer)
        {
          dispatch_source_set_timer(*requestTimeoutTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
        }

        else
        {
          requestTimeoutTimer[4] = (dispatch_source_t)-1LL;
          requestTimeoutTimer[5] = (dispatch_source_t)-1LL;
          if (*((_BYTE *)requestTimeoutTimer + 48) && *((_BYTE *)requestTimeoutTimer + 49)) {
            nw_queue_source_run_timer((uint64_t)requestTimeoutTimer, v11);
          }
        }
      }
    }

    uint64_t v19 = 31LL;
    Class v20 = (&self->super.isa)[v19];
    goto LABEL_20;
  }

  Class v13 = objc_alloc(&OBJC_CLASS___NWURLError);
  uint64_t v14 = self->_loader;
  double v15 = self;
  if (v13)
  {
    uint64_t v16 = *MEMORY[0x189607740];
    *(void *)buf = v13;
    *(void *)id v25 = &OBJC_CLASS___NWURLError;
    Class v17 = -[uint8_t initWithDomain:code:userInfo:]( (objc_super *)buf,  sel_initWithDomain_code_userInfo_,  v16,  -1007LL,  0LL);
    Class v13 = (NWURLError *)v17;
    if (v17) {
      -[uint8_t fillErrorForLoader:andTask:](v17, "fillErrorForLoader:andTask:", v14, v15);
    }
  }

  -[NWURLSessionTask completeTaskWithError:](v15, "completeTaskWithError:", v13);
LABEL_21:
}

- (void)loaderWillPerformHTTPRedirection:(id)a3 newRequest:(id)a4 completionHandler:(id)a5
{
  uint64_t v36 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (__nwlog_url_log::onceToken != -1) {
    dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44366);
  }
  uint64_t v11 = (os_log_s *)(id)gurlLogObj;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    -[NWURLSessionTask logDescription](self, "logDescription");
    -[NWURLSessionTask logDescription](self, "logDescription");
    int v12 = (unsigned __int16)[v8 statusCode];
    if (self) {
      unint64_t redirectCount = self->_redirectCount;
    }
    else {
      unint64_t redirectCount = 0LL;
    }
    *(_DWORD *)buf = 68289794;
    *(_DWORD *)&uint8_t buf[4] = 16;
    *(_WORD *)int v29 = 2098;
    *(void *)&v29[2] = &v27;
    __int16 v30 = 1024;
    int v31 = v26;
    __int16 v32 = 1024;
    int v33 = v12;
    __int16 v34 = 2048;
    unint64_t v35 = redirectCount;
    _os_log_impl( &dword_181A5C000,  v11,  OS_LOG_TYPE_INFO,  "Task <%{public,uuid_t}.16P>.<%u> will perform redirect {status=%hu, previous_redirects=%zu}",  buf,  0x28u);
  }

  if (!self)
  {
    Class v23 = 0LL;
LABEL_20:
    v24[0] = MEMORY[0x1895F87A8];
    v24[1] = 3221225472LL;
    v24[2] = __82__NWURLSessionTask_loaderWillPerformHTTPRedirection_newRequest_completionHandler___block_invoke;
    v24[3] = &unk_189BC5D48;
    v24[4] = self;
    id v25 = v10;
    -[NWURLSessionDelegateWrapper task:willPerformHTTPRedirection:newRequest:completionHandler:]( (uint64_t)v23,  self,  v8,  v9,  v24);

    goto LABEL_21;
  }

  unint64_t v15 = self->_redirectCount + 1;
  self->_unint64_t redirectCount = v15;
  if (v15 < 0x15)
  {
    if (self->_timeoutIntervalForRequest > 0.0)
    {
      requestTimeoutTimer = (dispatch_source_t *)self->_requestTimeoutTimer;
      if (requestTimeoutTimer)
      {
        if (*requestTimeoutTimer)
        {
          dispatch_source_set_timer(*requestTimeoutTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
        }

        else
        {
          requestTimeoutTimer[4] = (dispatch_source_t)-1LL;
          requestTimeoutTimer[5] = (dispatch_source_t)-1LL;
          if (*((_BYTE *)requestTimeoutTimer + 48) && *((_BYTE *)requestTimeoutTimer + 49)) {
            nw_queue_source_run_timer((uint64_t)requestTimeoutTimer, v14);
          }
        }
      }
    }

    uint64_t v22 = 31LL;
    Class v23 = (&self->super.isa)[v22];
    goto LABEL_20;
  }

  uint64_t v16 = objc_alloc(&OBJC_CLASS___NWURLError);
  Class v17 = self->_loader;
  uint64_t v18 = self;
  if (v16)
  {
    uint64_t v19 = *MEMORY[0x189607740];
    *(void *)buf = v16;
    *(void *)int v29 = &OBJC_CLASS___NWURLError;
    Class v20 = -[uint8_t initWithDomain:code:userInfo:]( (objc_super *)buf,  sel_initWithDomain_code_userInfo_,  v19,  -1007LL,  0LL);
    uint64_t v16 = (NWURLError *)v20;
    if (v20) {
      -[uint8_t fillErrorForLoader:andTask:](v20, "fillErrorForLoader:andTask:", v17, v18);
    }
  }

  -[NWURLSessionTask completeTaskWithError:](v18, "completeTaskWithError:", v16);
  (*((void (**)(id, void))v10 + 2))(v10, 0LL);
LABEL_21:
}

- (void)loaderDidReceiveInformationalResponse:(id)a3
{
  if (self)
  {
    uint64_t v5 = 31LL;
    id v6 = (&self->super.isa)[v5];
    -[NWURLSessionDelegateWrapper task:didReceiveInformationalResponse:]((uint64_t)v6, self, a3);
  }

  else
  {
    -[NWURLSessionDelegateWrapper task:didReceiveInformationalResponse:](0LL, 0LL, a3);
    id v6 = 0LL;
  }
}

- (void)loaderDidReceiveServerTrustChallenge:(id)a3 secProtocolMetadata:(id)a4 completionHandler:(id)a5
{
  uint64_t v97 = *MEMORY[0x1895F89C0];
  id v8 = (sec_trust *)a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = sec_trust_copy_ref(v8);
  -[NWURLSessionTask currentRequest](self, "currentRequest");
  int v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 URL];
  Class v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 host];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (self && (configuration = self->_configuration) != 0LL && (uint64_t v16 = configuration->_atsState) != 0LL)
  {
    v80 = v16;
    [MEMORY[0x1896079E8] propertyListWithData:v16 options:0 format:0 error:0];
    v82 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v80 = 0LL;
    v82 = 0LL;
  }

  CFArrayRef policies = 0LL;
  v81 = v11;
  OSStatus v17 = SecTrustCopyPolicies(v11, &policies);
  if (v17)
  {
    OSStatus v18 = v17;
    if (__nwlog_url_log::onceToken != -1) {
      dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44366);
    }
    id v19 = (id)gurlLogObj;
    *(_DWORD *)buf = 136446466;
    v94 = "-[NWURLSessionTask loaderDidReceiveServerTrustChallenge:secProtocolMetadata:completionHandler:]";
    __int16 v95 = 1024;
    *(_DWORD *)v96 = v18;
    LODWORD(v77) = 18;
    __int128 v76 = buf;
    Class v20 = (void *)_os_log_send_and_compose_impl();

    os_log_type_t v91 = OS_LOG_TYPE_ERROR;
    char v90 = 0;
    if (__nwlog_fault((const char *)v20, &v91, &v90))
    {
      if (v91 == OS_LOG_TYPE_FAULT)
      {
        if (__nwlog_url_log::onceToken != -1) {
          dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44366);
        }
        Class v21 = (os_log_s *)(id)gurlLogObj;
        os_log_type_t v22 = v91;
        if (os_log_type_enabled(v21, v91))
        {
          *(_DWORD *)buf = 136446466;
          v94 = "-[NWURLSessionTask loaderDidReceiveServerTrustChallenge:secProtocolMetadata:completionHandler:]";
          __int16 v95 = 1024;
          *(_DWORD *)v96 = v18;
          Class v23 = "%{public}s SecTrustCopyPolicies failed %d";
LABEL_64:
          _os_log_impl(&dword_181A5C000, v21, v22, v23, buf, 0x12u);
          goto LABEL_65;
        }

        goto LABEL_65;
      }

      if (!v90)
      {
        if (__nwlog_url_log::onceToken != -1) {
          dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44366);
        }
        Class v21 = (os_log_s *)(id)gurlLogObj;
        os_log_type_t v22 = v91;
        if (os_log_type_enabled(v21, v91))
        {
          *(_DWORD *)buf = 136446466;
          v94 = "-[NWURLSessionTask loaderDidReceiveServerTrustChallenge:secProtocolMetadata:completionHandler:]";
          __int16 v95 = 1024;
          *(_DWORD *)v96 = v18;
          Class v23 = "%{public}s SecTrustCopyPolicies failed %d, backtrace limit exceeded";
          goto LABEL_64;
        }

- (void)loaderDidReceiveClientCertificateChallenge:(id)a3 completionHandler:(id)a4
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  id v6 = a4;
  id v7 = a3;
  if (__nwlog_url_log::onceToken != -1) {
    dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44366);
  }
  id v8 = (os_log_s *)(id)gurlLogObj;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[NWURLSessionTask logDescription](self, "logDescription");
    -[NWURLSessionTask logDescription](self, "logDescription");
    *(_DWORD *)buf = 68289282;
    int v29 = 16;
    __int16 v30 = 2098;
    int v31 = &v27;
    __int16 v32 = 1024;
    int v33 = v26;
    _os_log_impl( &dword_181A5C000,  v8,  OS_LOG_TYPE_DEFAULT,  "Task <%{public,uuid_t}.16P>.<%u> received client cert challenge",  buf,  0x18u);
  }

  -[NWURLSessionTask currentRequest](self, "currentRequest");
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 URL];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 host];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[NWURLSessionTask currentRequest](self, "currentRequest");
  int v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 URL];
  Class v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 port];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();

  id v15 = objc_alloc(MEMORY[0x189601ED8]);
  if (v14) {
    uint64_t v16 = [v14 integerValue];
  }
  else {
    uint64_t v16 = 443LL;
  }
  OSStatus v17 = (void *)[v15 initWithHost:v11 port:v16 protocol:*MEMORY[0x189601E60] realm:0 authenticationMethod:*MEMORY[0x189601E40]];
  [v17 _setDistinguishedNames:v7];

  id v19 = (void *)[objc_alloc(MEMORY[0x189601EB8]) initWithProtectionSpace:v17 proposedCredential:0 previousFailureCount:0 failureResponse:0 error:0 sender:0];
  if (self)
  {
    if (self->_timeoutIntervalForRequest > 0.0)
    {
      requestTimeoutTimer = (dispatch_source_t *)self->_requestTimeoutTimer;
      if (requestTimeoutTimer)
      {
        if (*requestTimeoutTimer)
        {
          dispatch_source_set_timer(*requestTimeoutTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
        }

        else
        {
          requestTimeoutTimer[4] = (dispatch_source_t)-1LL;
          requestTimeoutTimer[5] = (dispatch_source_t)-1LL;
          if (*((_BYTE *)requestTimeoutTimer + 48) && *((_BYTE *)requestTimeoutTimer + 49)) {
            nw_queue_source_run_timer((uint64_t)requestTimeoutTimer, v18);
          }
        }
      }
    }

    uint64_t v21 = 31LL;
    os_log_type_t v22 = (&self->super.isa)[v21];
  }

  else
  {
    os_log_type_t v22 = 0LL;
  }

  v24[0] = MEMORY[0x1895F87A8];
  v24[1] = 3221225472LL;
  v24[2] = __81__NWURLSessionTask_loaderDidReceiveClientCertificateChallenge_completionHandler___block_invoke;
  v24[3] = &unk_189BBF068;
  v24[4] = self;
  id v25 = v6;
  id v23 = v6;
  -[NWURLSessionDelegateWrapper task:didReceiveChallenge:completionHandler:]((uint64_t)v22, self, v19, v24);
}

- (void)loaderDidReceiveChallenge:(id)a3 completionHandler:(id)a4
{
  uint64_t v41 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  if (__nwlog_url_log::onceToken != -1) {
    dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44366);
  }
  id v8 = (os_log_s *)(id)gurlLogObj;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[NWURLSessionTask logDescription](self, "logDescription");
    -[NWURLSessionTask logDescription](self, "logDescription");
    int v9 = v29;
    [v6 protectionSpace];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 authenticationMethod];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 proposedCredential];
    int v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 68289794;
    int v32 = 16;
    __int16 v33 = 2098;
    uint64_t v34 = &v30;
    __int16 v35 = 1024;
    int v36 = v9;
    __int16 v37 = 2114;
    v38 = v11;
    __int16 v39 = 1024;
    BOOL v40 = v12 != 0LL;
    _os_log_impl( &dword_181A5C000,  v8,  OS_LOG_TYPE_DEFAULT,  "Task <%{public,uuid_t}.16P>.<%u> received auth challenge {method=%{public}@, proposed=%{BOOL}d}",  buf,  0x28u);
  }

  [v6 protectionSpace];
  Class v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v13 isProxy]) {
    goto LABEL_6;
  }
  uint64_t v15 = [v6 previousFailureCount];

  if (v15) {
    goto LABEL_8;
  }
  -[NWURLSessionTask currentRequest](self, "currentRequest");
  id v19 = (void *)objc_claimAutoreleasedReturnValue();
  [v19 URL];
  Class v13 = (void *)objc_claimAutoreleasedReturnValue();

  [v13 user];
  Class v20 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 password];
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
  os_log_type_t v22 = v21;
  if (!v20 || !v21)
  {

LABEL_6:
LABEL_8:
    if (self)
    {
      if (self->_timeoutIntervalForRequest > 0.0)
      {
        requestTimeoutTimer = (dispatch_source_t *)self->_requestTimeoutTimer;
        if (requestTimeoutTimer)
        {
          if (*requestTimeoutTimer)
          {
            dispatch_source_set_timer(*requestTimeoutTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
          }

          else
          {
            requestTimeoutTimer[4] = (dispatch_source_t)-1LL;
            requestTimeoutTimer[5] = (dispatch_source_t)-1LL;
            if (*((_BYTE *)requestTimeoutTimer + 48) && *((_BYTE *)requestTimeoutTimer + 49)) {
              nw_queue_source_run_timer((uint64_t)requestTimeoutTimer, v14);
            }
          }
        }
      }

      uint64_t v17 = 31LL;
      uint64_t v18 = (&self->super.isa)[v17];
    }

    else
    {
      uint64_t v18 = 0LL;
    }

    v25[0] = MEMORY[0x1895F87A8];
    v25[1] = 3221225472LL;
    v25[2] = __64__NWURLSessionTask_loaderDidReceiveChallenge_completionHandler___block_invoke;
    v25[3] = &unk_189BBF068;
    v25[4] = self;
    id v26 = v7;
    -[NWURLSessionDelegateWrapper task:didReceiveChallenge:completionHandler:]((uint64_t)v18, self, v6, v25);

    goto LABEL_17;
  }

  if (__nwlog_url_log::onceToken != -1) {
    dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44366);
  }
  id v23 = (os_log_s *)(id)gurlLogObj;
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    -[NWURLSessionTask logDescription](self, "logDescription");
    -[NWURLSessionTask logDescription](self, "logDescription");
    *(_DWORD *)buf = 68289282;
    int v32 = 16;
    __int16 v33 = 2098;
    uint64_t v34 = &v28;
    __int16 v35 = 1024;
    int v36 = v27;
    _os_log_impl( &dword_181A5C000,  v23,  OS_LOG_TYPE_DEFAULT,  "Task <%{public,uuid_t}.16P>.<%u> responding to auth challenge using URL credential",  buf,  0x18u);
  }

  [MEMORY[0x189601EC8] credentialWithUser:v20 password:v22 persistence:1];
  CFArrayRef v24 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void, void *))v7 + 2))(v7, 0LL, v24);

LABEL_17:
}

- (void)loaderDidSendBodyData:(int64_t)a3 totalBytesSent:(int64_t)a4 totalBytesExpectedToSend:(int64_t)a5 completionHandler:(id)a6
{
  id v10 = a6;
  if (self)
  {
    -[NWURLSessionTask willChangeValueForKey:](self, "willChangeValueForKey:", @"countOfBytesSent");
    self->_countOfBytesSent = a4;
    -[NWURLSessionTask didChangeValueForKey:](self, "didChangeValueForKey:", @"countOfBytesSent");
    if (self->_progress && !self->_progressReportingFinished)
    {
      [MEMORY[0x189607968] numberWithLongLong:a4];
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NWURLSessionTask progress](self, "progress");
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
      [v15 setByteCompletedCount:v14];

      uploadProgress = self->_uploadProgress;
      if (self->_defaultUploadProgressState)
      {
        uint64_t v17 = uploadProgress;
        uint64_t v18 = -[NSProgress completedUnitCount](v17, "completedUnitCount");
        int64_t v19 = -[NSProgress totalUnitCount](self->_uploadProgress, "totalUnitCount") - 1;

        if (v18 < v19)
        {
          Class v20 = self->_uploadProgress;
          -[NSProgress setCompletedUnitCount:]( v20,  "setCompletedUnitCount:",  -[NSProgress completedUnitCount](v20, "completedUnitCount") + 1);
        }
      }

      else
      {
        -[NSProgress setCompletedUnitCount:](uploadProgress, "setCompletedUnitCount:", a4);
      }
    }

    -[NWURLSessionTask setCountOfBytesExpectedToSend:](self, a5);
    double timeoutIntervalForRequest = self->_timeoutIntervalForRequest;
    if (timeoutIntervalForRequest > 0.0)
    {
      requestTimeoutTimer = (dispatch_source_t *)self->_requestTimeoutTimer;
      if (requestTimeoutTimer)
      {
        dispatch_time_t v13 = dispatch_time(0x8000000000000000LL, (uint64_t)(timeoutIntervalForRequest * 1000000000.0));
        if (*requestTimeoutTimer)
        {
          dispatch_source_set_timer(*requestTimeoutTimer, v13, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
        }

        else
        {
          requestTimeoutTimer[4] = (dispatch_source_t)v13;
          requestTimeoutTimer[5] = (dispatch_source_t)-1LL;
          if (*((_BYTE *)requestTimeoutTimer + 48) && *((_BYTE *)requestTimeoutTimer + 49)) {
            nw_queue_source_run_timer((uint64_t)requestTimeoutTimer, v13);
          }
        }
      }

      else
      {
        self->_requestTimeoutTimer = (void *)-[NWURLSessionTask createTimerWithTimeout:]( (uint64_t)self,  timeoutIntervalForRequest);
      }
    }

    uint64_t v21 = 31LL;
    Class v22 = (&self->super.isa)[v21];
  }

  else
  {
    -[NWURLSessionTask setCountOfBytesExpectedToSend:](0LL, a5);
    Class v22 = 0LL;
  }

  v36[0] = MEMORY[0x1895F87A8];
  v36[1] = 3221225472LL;
  __int16 v37 = __100__NWURLSessionTask_loaderDidSendBodyData_totalBytesSent_totalBytesExpectedToSend_completionHandler___block_invoke;
  v38 = &unk_189BC91E8;
  __int16 v39 = self;
  id v40 = v10;
  id v23 = v10;
  CFArrayRef v24 = self;
  id v26 = v36;
  if (v22)
  {
    -[NWURLSessionDelegateWrapper delegateFor_didSendBodyData](v22, v25);
    int v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v27)
    {
      int64_t v28 = a5;
      int64_t v29 = a3;
      char v30 = v22[4].isa;
      int v31 = v22[5].isa;
      v41[0] = MEMORY[0x1895F87A8];
      v41[1] = 3221225472LL;
      v41[2] = __110__NWURLSessionDelegateWrapper_task_didSendBodyData_totalBytesSent_totalBytesExpectedToSend_completionHandler___block_invoke;
      v41[3] = &unk_189BC6FF0;
      id v42 = v27;
      v43 = v30;
      int v32 = v24;
      int64_t v47 = v29;
      int64_t v48 = a4;
      int64_t v49 = v28;
      os_log_type_t v44 = v32;
      uint64_t v45 = v31;
      int v46 = v26;
      p_isa = &v22[6].isa->isa;
      uint64_t v34 = v31;
      __int16 v35 = v30;
      -[NWURLSessionDelegateQueue runDelegateBlock:](p_isa, v41);
    }

    else
    {
      ((void (*)(void *))v37)(v26);
    }
  }
}

- (float)priority
{
  return self->_priority;
}

- (void)setPriority:(float)a3
{
  if (a3 >= 0.0 && a3 <= 1.0 && self->_priority != a3) {
    self->_priority = a3;
  }
}

- (BOOL)prefersIncrementalDelivery
{
  return self->_prefersIncrementalDelivery;
}

- (void)setPrefersIncrementalDelivery:(BOOL)a3
{
  if (self->_prefersIncrementalDelivery != a3) {
    self->_prefersIncrementalDelivery = a3;
  }
}

- (NSProgress)progress
{
  v2 = self;
  objc_sync_enter(v2);
  if (v2->_progress) {
    goto LABEL_17;
  }
  uint64_t v3 = [MEMORY[0x1896079E0] progressWithTotalUnitCount:100];
  progress = v2->_progress;
  v2->_progress = (NSProgress *)v3;

  if (-[NWURLSessionTask countOfBytesExpectedToSend](v2, "countOfBytesExpectedToSend") <= 0)
  {
    uint64_t v6 = 0LL;
    v2->_defaultUploadProgressState = 1;
    uint64_t v5 = 100LL;
  }

  else
  {
    uint64_t v5 = -[NWURLSessionTask countOfBytesExpectedToSend](v2, "countOfBytesExpectedToSend");
    uint64_t v6 = -[NWURLSessionTask countOfBytesSent](v2, "countOfBytesSent");
  }

  uint64_t v7 = [MEMORY[0x1896079E0] progressWithTotalUnitCount:v5];
  uploadProgress = v2->_uploadProgress;
  v2->_uploadProgress = (NSProgress *)v7;

  int v9 = v2->_uploadProgress;
  -[NSProgress setCompletedUnitCount:](v9, "setCompletedUnitCount:", v6);

  if (-[NWURLSessionTask countOfBytesExpectedToReceive](v2, "countOfBytesExpectedToReceive") <= 0)
  {
    uint64_t v11 = 0LL;
    v2->_defaultDownloadProgressState = 1;
    uint64_t v10 = 100LL;
  }

  else
  {
    uint64_t v10 = -[NWURLSessionTask countOfBytesExpectedToReceive](v2, "countOfBytesExpectedToReceive");
    uint64_t v11 = -[NWURLSessionTask countOfBytesReceived](v2, "countOfBytesReceived");
  }

  uint64_t v12 = [MEMORY[0x1896079E0] progressWithTotalUnitCount:v10];
  downloadProgress = v2->_downloadProgress;
  v2->_downloadProgress = (NSProgress *)v12;

  uint64_t v14 = v2->_downloadProgress;
  -[NSProgress setCompletedUnitCount:](v14, "setCompletedUnitCount:", v11);

  -[NWURLSessionTask originalRequest](v2, "originalRequest");
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    [v15 HTTPBody];
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16 || ([v15 HTTPBodyStream], (uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
    }

    else
    {
      [v15 HTTPMethod];
      int v27 = (void *)objc_claimAutoreleasedReturnValue();
      if ([v27 caseInsensitiveCompare:@"POST"])
      {
        [v15 HTTPMethod];
        int64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
        if ([v28 caseInsensitiveCompare:@"PUT"])
        {
          [v15 HTTPMethod];
          int64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v30 = [v29 caseInsensitiveCompare:@"PATCH"];

          if (v30)
          {
            uint64_t v17 = 95LL;
            uint64_t v18 = 5LL;
            goto LABEL_13;
          }
        }

        else
        {
        }
      }

      else
      {
      }
    }
  }

  uint64_t v17 = 5LL;
  uint64_t v18 = 95LL;
LABEL_13:
  int64_t v19 = v2->_progress;
  Class v20 = v2->_uploadProgress;
  -[NSProgress addChild:withPendingUnitCount:](v19, "addChild:withPendingUnitCount:", v20, v18);

  uint64_t v21 = v2->_progress;
  Class v22 = v2->_downloadProgress;
  -[NSProgress addChild:withPendingUnitCount:](v21, "addChild:withPendingUnitCount:", v22, v17);

  -[NSProgress setKind:](v2->_progress, "setKind:", *MEMORY[0x1896076B0]);
  -[NSProgress setFileTotalCount:](v2->_progress, "setFileTotalCount:", &unk_189BFD250);
  if (-[NWURLSessionTask countOfBytesReceived](v2, "countOfBytesReceived") < 1)
  {
    CFArrayRef v24 = (void *)MEMORY[0x1896076A8];
  }

  else
  {
    id v23 = v2->_uploadProgress;
    -[NSProgress setCompletedUnitCount:]( v2->_uploadProgress,  "setCompletedUnitCount:",  -[NSProgress totalUnitCount](v23, "totalUnitCount"));

    CFArrayRef v24 = (void *)MEMORY[0x1896076A0];
  }

  -[NSProgress setFileOperationKind:](v2->_progress, "setFileOperationKind:", *v24);
  objc_initWeak(&location, v2);
  uint64_t v25 = MEMORY[0x1895F87A8];
  v35[0] = MEMORY[0x1895F87A8];
  v35[1] = 3221225472LL;
  void v35[2] = __28__NWURLSessionTask_progress__block_invoke;
  v35[3] = &unk_189BC0AE8;
  objc_copyWeak(&v36, &location);
  -[NSProgress setCancellationHandler:](v2->_progress, "setCancellationHandler:", v35);
  v33[0] = v25;
  v33[1] = 3221225472LL;
  v33[2] = __28__NWURLSessionTask_progress__block_invoke_2;
  v33[3] = &unk_189BC0AE8;
  objc_copyWeak(&v34, &location);
  -[NSProgress setPausingHandler:](v2->_progress, "setPausingHandler:", v33);
  v31[0] = v25;
  v31[1] = 3221225472LL;
  v31[2] = __28__NWURLSessionTask_progress__block_invoke_3;
  v31[3] = &unk_189BC0AE8;
  objc_copyWeak(&v32, &location);
  -[NSProgress setResumingHandler:](v2->_progress, "setResumingHandler:", v31);
  objc_destroyWeak(&v32);
  objc_destroyWeak(&v34);
  objc_destroyWeak(&v36);
  objc_destroyWeak(&location);

LABEL_17:
  objc_sync_exit(v2);

  return v2->_progress;
}

- (void)getUnderlyingHTTPConnectionInfoWithCompletionHandler:(id)a3
{
  if (self) {
    objc_setProperty_atomic_copy(self, a2, a3, 304LL);
  }
}

- (NSURLSessionTaskMetrics)_incompleteTaskMetrics
{
  if (self) {
    self = (NWURLSessionTask *)objc_getProperty(self, a2, 440LL, 1);
  }
  return (NSURLSessionTaskMetrics *)self;
}

- (NSURLSessionTaskTransactionMetrics)_incompleteCurrentTaskTransactionMetrics
{
  if (self)
  {
    Property = (id *)objc_getProperty(self, a2, 440LL, 1);
    uint64_t v3 = Property;
    if (Property)
    {
      id v4 = nw_http_client_metadata_copy_current_transaction_metadata(Property[2]);
      uint64_t v3 = -[NWURLSessionTaskTransactionMetrics initWithTransactionMetadata:clientMetadata:]( (id *)objc_alloc(&OBJC_CLASS___NWURLSessionTaskTransactionMetrics),  v4,  v3[2]);
    }
  }

  else
  {
    uint64_t v3 = 0LL;
  }

  return (NSURLSessionTaskTransactionMetrics *)v3;
}

- (id)_timingData
{
  return 0LL;
}

- (void)_setExplicitCookieStorage:(OpaqueCFHTTPCookieStorage *)a3
{
  if (self)
  {
    self->_explicitlySetCookieStorage = 1;
    if (!a3)
    {
      cookieStorage = self->_cookieStorage;
      self->_cookieStorage = 0LL;
LABEL_7:

      return;
    }

- (void)_adoptEffectiveConfiguration:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (self)
  {
    if (!v4) {
      self->_disabledCredentialStorage = 1;
    }
  }

- (int64_t)_countOfBytesReceivedEncoded
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  int64_t v3 = [v2 countOfResponseBodyBytesReceived];

  return v3;
}

- ($1C4110BDDF6CE1A35BD1F09FD54CA4C3)logDescription
{
  *($045A7E745A1AC4122900FE6B13FDCB23 *)retstr = *($045A7E745A1AC4122900FE6B13FDCB23 *)((char *)self + 448);
  return self;
}

- (NSURLRequest)originalRequest
{
  return self->_originalRequest;
}

- (NSURLRequest)currentRequest
{
  return self->_currentRequest;
}

- (NSDate)earliestBeginDate
{
  return self->_earliestBeginDate;
}

- (void)setEarliestBeginDate:(id)a3
{
}

- (int64_t)countOfBytesClientExpectsToSend
{
  return self->_countOfBytesClientExpectsToSend;
}

- (void)setCountOfBytesClientExpectsToSend:(int64_t)a3
{
  self->_countOfBytesClientExpectsToSend = a3;
}

- (int64_t)countOfBytesClientExpectsToReceive
{
  return self->_countOfBytesClientExpectsToReceive;
}

- (void)setCountOfBytesClientExpectsToReceive:(int64_t)a3
{
  self->_countOfBytesClientExpectsToReceive = a3;
}

- (int64_t)countOfBytesSent
{
  return self->_countOfBytesSent;
}

- (int64_t)countOfBytesReceived
{
  return self->_countOfBytesReceived;
}

- (int64_t)countOfBytesExpectedToSend
{
  return self->_countOfBytesExpectedToSend;
}

- (int64_t)countOfBytesExpectedToReceive
{
  return self->_countOfBytesExpectedToReceive;
}

- (NSString)taskDescription
{
  return (NSString *)objc_getProperty(self, a2, 128LL, 1);
}

- (void)setTaskDescription:(id)a3
{
}

- (NWURLError)error
{
  return (NWURLError *)objc_getProperty(self, a2, 136LL, 1);
}

- (__SecTrust)secTrust
{
  return self->_secTrust;
}

- (BOOL)_callCompletionHandlerInline
{
  return self->__callCompletionHandlerInline;
}

- (void)set_callCompletionHandlerInline:(BOOL)a3
{
  self->__callCompletionHandlerInline = a3;
}

- (BOOL)_keepDownloadTaskFile
{
  return self->__keepDownloadTaskFile;
}

- (void)set_keepDownloadTaskFile:(BOOL)a3
{
  self->__keepDownloadTaskFile = a3;
}

- (OS_nw_activity)_nw_activity
{
  return self->__nw_activity;
}

- (void)set_nw_activity:(id)a3
{
}

- (NSString)_pathToDownloadTaskFile
{
  return self->__pathToDownloadTaskFile;
}

- (void)set_pathToDownloadTaskFile:(id)a3
{
}

- (NSString)_storagePartitionIdentifier
{
  return self->__storagePartitionIdentifier;
}

- (void)set_storagePartitionIdentifier:(id)a3
{
}

- (NSURL)_siteForCookies
{
  return self->__siteForCookies;
}

- (void)set_siteForCookies:(id)a3
{
}

- (BOOL)_isTopLevelNavigation
{
  return self->__isTopLevelNavigation;
}

- (void)set_isTopLevelNavigation:(BOOL)a3
{
  self->__isTopLevelNavigation = a3;
}

- (BOOL)_preconnect
{
  return self->__preconnect;
}

- (void)set_preconnect:(BOOL)a3
{
  self->__preconnect = a3;
}

- (id)_cookieTransformCallback
{
  return self->__cookieTransformCallback;
}

- (void)set_cookieTransformCallback:(id)a3
{
}

- (NSArray)_resolvedCNAMEChain
{
  return (NSArray *)objc_getProperty(self, a2, 192LL, 1);
}

- (int64_t)_bytesPerSecondLimit
{
  return self->__bytesPerSecondLimit;
}

- (void)set_bytesPerSecondLimit:(int64_t)a3
{
  self->__bytesPerSecondLimit = a3;
}

- (double)_timeoutIntervalForResource
{
  return self->__timeoutIntervalForResource;
}

- (void)set_timeoutIntervalForResource:(double)a3
{
  self->__timeoutIntervalForResource = a3;
}

- (OS_nw_endpoint)_hostOverride
{
  return self->__hostOverride;
}

- (void)set_hostOverride:(id)a3
{
}

- (NSDictionary)_trailers
{
  return (NSDictionary *)objc_getProperty(self, a2, 224LL, 1);
}

- (void).cxx_destruct
{
}

void __28__NWURLSessionTask_progress__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained cancel];
}

void __28__NWURLSessionTask_progress__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained suspend];
}

void __28__NWURLSessionTask_progress__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained resume];
}

- (void)setCountOfBytesExpectedToSend:(void *)result
{
  if (result)
  {
    int64_t v3 = result;
    [result willChangeValueForKey:@"countOfBytesExpectedToSend"];
    *((void *)v3 + 14) = a2;
    result = (void *)[v3 didChangeValueForKey:@"countOfBytesExpectedToSend"];
    if (*((void *)v3 + 8))
    {
      if (!*((_BYTE *)v3 + 15))
      {
        [MEMORY[0x189607968] numberWithLongLong:a2];
        id v4 = (void *)objc_claimAutoreleasedReturnValue();
        [v3 progress];
        uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
        [v5 setByteTotalCount:v4];

        if (a2 >= 1) {
          uint64_t v6 = a2;
        }
        else {
          uint64_t v6 = 100LL;
        }
        *((_BYTE *)v3 + 16) = a2 < 1;
        return (void *)[*((id *)v3 + 45) setTotalUnitCount:v6];
      }
    }
  }

  return result;
}

- (BOOL)createTimerWithTimeout:(uint64_t)a1
{
  if (a2 > 31536000.0) {
    return 0LL;
  }
  id v4 = *(void **)(a1 + 312);
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __43__NWURLSessionTask_createTimerWithTimeout___block_invoke;
  v8[3] = &unk_189BC93A0;
  v8[4] = a1;
  BOOL source = nw_queue_context_create_source(v4, 2, 3, 0, v8, 0LL);
  dispatch_time_t v5 = dispatch_time(0x8000000000000000LL, (uint64_t)(a2 * 1000000000.0));
  nw_queue_set_timer_values(source, v5, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  nw_queue_activate_source(source, v6);
  return source;
}

void __100__NWURLSessionTask_loaderDidSendBodyData_totalBytesSent_totalBytesExpectedToSend_completionHandler___block_invoke( uint64_t a1,  const char *a2)
{
  int64_t v3 = *(_BYTE **)(a1 + 32);
  if (v3 && (v3[13] & 1) != 0) {
    objc_setProperty_nonatomic_copy(v3, a2, *(id *)(a1 + 40), 296LL);
  }
  else {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }
}

void __43__NWURLSessionTask_createTimerWithTimeout___block_invoke(uint64_t a1)
{
  v1 = *(id **)(a1 + 32);
  if (v1)
  {
    v2 = objc_alloc(&OBJC_CLASS___NWURLError);
    id v3 = v1[33];
    id v4 = v1;
    if (v2
      && (uint64_t v5 = *MEMORY[0x189607740],
          v8.receiver = v2,
          v8.super_class = (Class)&OBJC_CLASS___NWURLError,
          (id v6 = objc_msgSendSuper2(&v8, sel_initWithDomain_code_userInfo_, v5, -1001, 0)) != 0))
    {
      id v7 = v6;
      [v6 fillErrorForLoader:v3 andTask:v4];
    }

    else
    {
      id v7 = 0LL;
    }

    [v1 completeTaskWithError:v7];
  }

  else
  {
    id v7 = 0LL;
    [0 completeTaskWithError:0];
  }
}

void __64__NWURLSessionTask_loaderDidReceiveChallenge_completionHandler___block_invoke( uint64_t a1,  uint64_t a2,  void *a3)
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  if (__nwlog_url_log::onceToken != -1) {
    dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44366);
  }
  id v6 = (os_log_s *)(id)gurlLogObj;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = *(void **)(a1 + 32);
    if (v7)
    {
      [v7 logDescription];
      objc_super v8 = *(void **)(a1 + 32);
      if (v8)
      {
        [v8 logDescription];
        int v9 = v17;
LABEL_9:
        *(_DWORD *)buf = 68289794;
        int v21 = 16;
        __int16 v22 = 2098;
        id v23 = v18;
        __int16 v24 = 1024;
        int v25 = v9;
        __int16 v26 = 2048;
        uint64_t v27 = a2;
        __int16 v28 = 1024;
        BOOL v29 = v5 != 0LL;
        _os_log_impl( &dword_181A5C000,  v6,  OS_LOG_TYPE_DEFAULT,  "Task <%{public,uuid_t}.16P>.<%u> responding to auth challenge {disposition=%ld, credential=%{BOOL}d}",  buf,  0x28u);
        goto LABEL_10;
      }
    }

    else
    {
      v18[0] = 0LL;
      v18[1] = 0LL;
      int v19 = 0;
    }

    int v9 = 0;
    goto LABEL_9;
  }

void __81__NWURLSessionTask_loaderDidReceiveClientCertificateChallenge_completionHandler___block_invoke( uint64_t a1,  uint64_t a2,  void *a3)
{
  uint64_t v38 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  if (__nwlog_url_log::onceToken != -1) {
    dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44366);
  }
  id v6 = (os_log_s *)(id)gurlLogObj;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = *(void **)(a1 + 32);
    if (v7)
    {
      [v7 logDescription];
      objc_super v8 = *(void **)(a1 + 32);
      if (v8)
      {
        [v8 logDescription];
        int v9 = v28;
        if (!a2)
        {
LABEL_7:
          BOOL v10 = objc_msgSend(v5, "identity", v26, v27, v28, v29, v30, v31) != 0;
LABEL_11:
          *(_DWORD *)buf = 68289538;
          *(_DWORD *)&uint8_t buf[4] = 16;
          *(_WORD *)__int16 v33 = 2098;
          *(void *)&v33[2] = &v29;
          __int16 v34 = 1024;
          int v35 = v9;
          __int16 v36 = 1024;
          BOOL v37 = v10;
          _os_log_impl( &dword_181A5C000,  v6,  OS_LOG_TYPE_DEFAULT,  "Task <%{public,uuid_t}.16P>.<%u> responding to client cert challenge {credential=%{BOOL}d}",  buf,  0x1Eu);
          goto LABEL_12;
        }

uint64_t __95__NWURLSessionTask_loaderDidReceiveServerTrustChallenge_secProtocolMetadata_completionHandler___block_invoke( uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void __95__NWURLSessionTask_loaderDidReceiveServerTrustChallenge_secProtocolMetadata_completionHandler___block_invoke_2( uint64_t a1)
{
  uint64_t v73 = *MEMORY[0x1895F89C0];
  uint64_t v2 = *(void *)(a1 + 32);
  if (!v2) {
    goto LABEL_73;
  }
  if (*(void *)(v2 + 288) == 2LL)
  {
    objc_super v8 = *(void (**)(void))(*(void *)(a1 + 64) + 16LL);
    goto LABEL_8;
  }

  id v3 = *(id *)(v2 + 392);
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = v5 ? *(sec_protocol_metadata **)(v5 + 392) : 0LL;
    BOOL v7 = sec_protocol_metadata_peers_are_equal(v6, *(sec_protocol_metadata_t *)(a1 + 40));

    if (v7)
    {
      objc_super v8 = *(void (**)(void))(*(void *)(a1 + 64) + 16LL);
LABEL_8:
      v8();
      -[NWURLSessionTask performNextServerTrustChallenge](*(void *)(a1 + 32));
      return;
    }
  }

  uint64_t v9 = *(void *)(a1 + 32);
  if (v9)
  {
    *(_BYTE *)(v9 + 18) = 1;
    BOOL v10 = *(void **)(a1 + 32);
  }

  else
  {
LABEL_73:
    BOOL v10 = 0LL;
  }

  [v10 currentRequest];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 URL];
  double v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 port];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

  [*(id *)(a1 + 32) clientMetadata];
  dispatch_time_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v15 = *(void **)(a1 + 40);
  id v16 = v14;
  id v17 = v15;
  uint64_t v18 = MEMORY[0x1895F87A8];
  if (!v16)
  {
    __nwlog_obj();
    os_log_type_t v44 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    *(void *)&uint8_t buf[4] = "nw_http_client_metadata_set_sec_metadata";
    LODWORD(v59) = 12;
    uint64_t v58 = buf;
    uint64_t v45 = (char *)_os_log_send_and_compose_impl();

    v72[0] = OS_LOG_TYPE_ERROR;
    v70[0] = 0;
    if (v72[0] == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      int v46 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v47 = v72[0];
      if (os_log_type_enabled(v46, v72[0]))
      {
        *(_DWORD *)buf = 136446210;
        *(void *)&uint8_t buf[4] = "nw_http_client_metadata_set_sec_metadata";
        _os_log_impl(&dword_181A5C000, v46, v47, "%{public}s called with null metadata", buf, 0xCu);
      }
    }

    else if (v70[0])
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      int v46 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v51 = v72[0];
      BOOL v52 = os_log_type_enabled(v46, v72[0]);
      if (backtrace_string)
      {
        if (v52)
        {
          *(_DWORD *)buf = 136446466;
          *(void *)&uint8_t buf[4] = "nw_http_client_metadata_set_sec_metadata";
          *(_WORD *)&buf[12] = 2082;
          *(void *)&buf[14] = backtrace_string;
          _os_log_impl( &dword_181A5C000,  v46,  v51,  "%{public}s called with null metadata, dumping backtrace:%{public}s",  buf,  0x16u);
        }

        free(backtrace_string);
        goto LABEL_71;
      }

      if (v52)
      {
        *(_DWORD *)buf = 136446210;
        *(void *)&uint8_t buf[4] = "nw_http_client_metadata_set_sec_metadata";
        _os_log_impl(&dword_181A5C000, v46, v51, "%{public}s called with null metadata, no backtrace", buf, 0xCu);
      }
    }

    else
    {
      __nwlog_obj();
      int v46 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v56 = v72[0];
      if (os_log_type_enabled(v46, v72[0]))
      {
        *(_DWORD *)buf = 136446210;
        *(void *)&uint8_t buf[4] = "nw_http_client_metadata_set_sec_metadata";
        _os_log_impl( &dword_181A5C000,  v46,  v56,  "%{public}s called with null metadata, backtrace limit exceeded",  buf,  0xCu);
      }
    }

- (void)performNextServerTrustChallenge
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    if (*(_BYTE *)(a1 + 18))
    {
      if (__nwlog_url_log::onceToken != -1) {
        dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44366);
      }
      id v2 = (id)gurlLogObj;
      *(_DWORD *)buf = 136446466;
      id v17 = "-[NWURLSessionTask performNextServerTrustChallenge]";
      __int16 v18 = 2112;
      uint64_t v19 = a1;
      id v3 = (void *)_os_log_send_and_compose_impl();

      os_log_type_t type = OS_LOG_TYPE_ERROR;
      char v14 = 0;
      if (__nwlog_fault((const char *)v3, &type, &v14))
      {
        if (type == OS_LOG_TYPE_FAULT)
        {
          if (__nwlog_url_log::onceToken != -1) {
            dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44366);
          }
          id v4 = (os_log_s *)(id)gurlLogObj;
          os_log_type_t v5 = type;
          if (os_log_type_enabled(v4, type))
          {
            *(_DWORD *)buf = 136446466;
            id v17 = "-[NWURLSessionTask performNextServerTrustChallenge]";
            __int16 v18 = 2112;
            uint64_t v19 = a1;
            id v6 = "%{public}s Already performing server trust challenge %@";
LABEL_28:
            uint64_t v11 = v4;
            os_log_type_t v12 = v5;
LABEL_29:
            _os_log_impl(&dword_181A5C000, v11, v12, v6, buf, 0x16u);
            goto LABEL_30;
          }

          goto LABEL_30;
        }

        if (!v14)
        {
          if (__nwlog_url_log::onceToken != -1) {
            dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44366);
          }
          id v4 = (os_log_s *)(id)gurlLogObj;
          os_log_type_t v5 = type;
          if (os_log_type_enabled(v4, type))
          {
            *(_DWORD *)buf = 136446466;
            id v17 = "-[NWURLSessionTask performNextServerTrustChallenge]";
            __int16 v18 = 2112;
            uint64_t v19 = a1;
            id v6 = "%{public}s Already performing server trust challenge %@, backtrace limit exceeded";
            goto LABEL_28;
          }

void __95__NWURLSessionTask_loaderDidReceiveServerTrustChallenge_secProtocolMetadata_completionHandler___block_invoke_3( uint64_t a1,  char a2)
{
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4
    && (objc_storeStrong((id *)(v4 + 392), *(id *)(a1 + 40)), (uint64_t v5 = *(void *)(a1 + 32)) != 0)
    && (*(_BYTE *)(v5 + 19) = a2, (uint64_t v6 = *(void *)(a1 + 32)) != 0))
  {
    *(_BYTE *)(v6 + 18) = 0;
    uint64_t v7 = *(void *)(a1 + 32);
  }

  else
  {
    uint64_t v7 = 0LL;
  }

  -[NWURLSessionTask performNextServerTrustChallenge](v7);
}

void __80__NWURLSessionTask_challengeDelegateForServerTrust_host_port_completionHandler___block_invoke( uint64_t a1,  uint64_t a2,  void *a3)
{
  uint64_t v51 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  if (__nwlog_url_log::onceToken != -1) {
    dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44366);
  }
  uint64_t v6 = (os_log_s *)(id)gurlLogObj;
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
    goto LABEL_10;
  }
  uint64_t v7 = *(void **)(a1 + 32);
  if (!v7)
  {
    v41[0] = 0LL;
    v41[1] = 0LL;
    int v42 = 0;
    goto LABEL_8;
  }

  [v7 logDescription];
  objc_super v8 = *(void **)(a1 + 32);
  if (!v8)
  {
LABEL_8:
    int v9 = 0;
    uint64_t v38 = 0LL;
    uint64_t v39 = 0LL;
    int v40 = 0;
    goto LABEL_9;
  }

  [v8 logDescription];
  int v9 = v40;
LABEL_9:
  *(_DWORD *)buf = 68289794;
  *(_DWORD *)&uint8_t buf[4] = 16;
  *(_WORD *)os_log_type_t v44 = 2098;
  *(void *)&v44[2] = v41;
  __int16 v45 = 1024;
  int v46 = v9;
  __int16 v47 = 2048;
  uint64_t v48 = a2;
  __int16 v49 = 1024;
  BOOL v50 = v5 != 0LL;
  _os_log_impl( &dword_181A5C000,  v6,  OS_LOG_TYPE_INFO,  "Task <%{public,uuid_t}.16P>.<%u> responding to server trust challenge {disposition=%ld, credential=%{BOOL}d}",  buf,  0x28u);
LABEL_10:

  uint64_t v10 = *(void *)(a1 + 32);
  if (v10)
  {
    double v11 = *(double *)(v10 + 328);
    if (v11 > 0.0)
    {
      uint64_t v12 = *(void *)(v10 + 336);
      if (v12)
      {
        dispatch_time_t v13 = dispatch_time(0x8000000000000000LL, (uint64_t)(v11 * 1000000000.0));
        if (*(void *)v12)
        {
          dispatch_source_set_timer(*(dispatch_source_t *)v12, v13, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
        }

        else
        {
          *(void *)(v12 + 32) = v13;
          *(void *)(v12 + 40) = -1LL;
          if (*(_BYTE *)(v12 + 48) && *(_BYTE *)(v12 + 49)) {
            nw_queue_source_run_timer(v12, v13);
          }
        }
      }
    }
  }

  switch(a2)
  {
    case 0LL:
      if (!v5) {
        goto LABEL_16;
      }
      char v14 = sec_trust_copy_ref(*(sec_trust_t *)(a1 + 40));
      CFDataRef v20 = SecTrustCopyExceptions(v14);
      id v16 = (id *)v20;
      if (v20)
      {
        uint64_t v21 = *(void *)(a1 + 32);
        if (v21)
        {
          uint64_t v22 = *(void *)(v21 + 400);
          if (v22)
          {
            uint64_t v24 = *(void *)(a1 + 48);
            uint64_t v23 = *(void *)(a1 + 56);
            int v25 = (void *)NSString;
            uint64_t v26 = v20;
            [v25 stringWithFormat:@"%@ %@", v24, v23];
            id v27 = (void *)objc_claimAutoreleasedReturnValue();
            [*(id *)(v22 + 120) setObject:v26 forKeyedSubscript:v27];
          }
        }
      }

      (*(void (**)(void))(*(void *)(a1 + 64) + 16LL))();
      goto LABEL_31;
    case 1LL:
    case 3LL:
LABEL_16:
      char v14 = sec_trust_copy_ref(*(sec_trust_t *)(a1 + 40));
      uint64_t v15 = *(void *)(a1 + 32);
      if (v15)
      {
        id v16 = *(id **)(v15 + 400);
        if (v16)
        {
          [NSString stringWithFormat:@"%@ %@", *(void *)(a1 + 48), *(void *)(a1 + 56)];
          id v17 = (void *)objc_claimAutoreleasedReturnValue();
          [v16[15] objectForKeyedSubscript:v17];
          id v16 = (id *)objc_claimAutoreleasedReturnValue();

          if (v16) {
            SecTrustSetExceptions(v14, (CFDataRef)v16);
          }
        }

        uint64_t v18 = *(void *)(a1 + 32);
        if (v18) {
          goto LABEL_21;
        }
      }

      else
      {
        id v16 = 0LL;
        uint64_t v18 = *(void *)(a1 + 32);
        if (v18)
        {
LABEL_21:
          uint64_t v19 = *(dispatch_queue_s **)(v18 + 232);
          goto LABEL_22;
        }
      }

      uint64_t v19 = 0LL;
LABEL_22:
      result[0] = MEMORY[0x1895F87A8];
      result[1] = 3221225472LL;
      result[2] = __80__NWURLSessionTask_challengeDelegateForServerTrust_host_port_completionHandler___block_invoke_36;
      result[3] = &unk_189BBEFF0;
      id v37 = *(id *)(a1 + 64);
      if (SecTrustEvaluateAsyncWithError(v14, v19, result)) {
        (*(void (**)(void))(*(void *)(a1 + 64) + 16LL))();
      }

LABEL_31:
      CFRelease(v14);

LABEL_39:
      return;
    case 2LL:
      uint64_t v28 = *(id **)(a1 + 32);
      if (v28)
      {
        uint64_t v29 = objc_alloc(&OBJC_CLASS___NWURLError);
        id v30 = v28[33];
        id v31 = v28;
        if (v29)
        {
          uint64_t v32 = *MEMORY[0x189607740];
          *(void *)buf = v29;
          *(void *)os_log_type_t v44 = &OBJC_CLASS___NWURLError;
          __int16 v33 = -[uint8_t initWithDomain:code:userInfo:]( (objc_super *)buf,  sel_initWithDomain_code_userInfo_,  v32,  -999LL,  0LL);
          uint64_t v29 = (NWURLError *)v33;
          if (v33) {
            -[uint8_t fillErrorForLoader:andTask:](v33, "fillErrorForLoader:andTask:", v30, v31);
          }
        }

        id v35 = *(void **)(a1 + 32);
        if (v35) {
          objc_setProperty_atomic_copy(v35, v34, v29, 136LL);
        }
      }

      else
      {
        uint64_t v29 = 0LL;
      }

      (*(void (**)(void))(*(void *)(a1 + 64) + 16LL))();
      goto LABEL_39;
    default:
      goto LABEL_39;
  }

uint64_t __80__NWURLSessionTask_challengeDelegateForServerTrust_host_port_completionHandler___block_invoke_36( uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void __82__NWURLSessionTask_loaderWillPerformHTTPRedirection_newRequest_completionHandler___block_invoke( uint64_t a1,  void *a2)
{
  uint64_t v48 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  if (__nwlog_url_log::onceToken != -1) {
    dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44366);
  }
  uint64_t v4 = (os_log_s *)(id)gurlLogObj;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = *(void **)(a1 + 32);
    if (v5)
    {
      [v5 logDescription];
      uint64_t v6 = *(void **)(a1 + 32);
      if (v6)
      {
        [v6 logDescription];
        int v7 = v36;
LABEL_9:
        *(_DWORD *)buf = 68289538;
        int v41 = 16;
        __int16 v42 = 2098;
        uint64_t v43 = &v37;
        __int16 v44 = 1024;
        int v45 = v7;
        __int16 v46 = 1024;
        BOOL v47 = v3 != 0LL;
        _os_log_impl( &dword_181A5C000,  v4,  OS_LOG_TYPE_INFO,  "Task <%{public,uuid_t}.16P>.<%u> performing redirect {take=%{BOOL}d}",  buf,  0x1Eu);
        goto LABEL_10;
      }
    }

    else
    {
      uint64_t v37 = 0LL;
      uint64_t v38 = 0LL;
      LODWORD(v39) = 0;
    }

    int v7 = 0;
    uint64_t v34 = 0LL;
    uint64_t v35 = 0LL;
    LODWORD(v36) = 0;
    goto LABEL_9;
  }

void __64__NWURLSessionTask_loaderWillPerformHTTPRedirection_newRequest___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v38 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  if (__nwlog_url_log::onceToken != -1) {
    dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44366);
  }
  uint64_t v4 = (os_log_s *)(id)gurlLogObj;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = *(void **)(a1 + 32);
    if (v5)
    {
      [v5 logDescription];
      uint64_t v6 = *(void **)(a1 + 32);
      if (v6)
      {
        [v6 logDescription];
        int v7 = v26;
LABEL_9:
        *(_DWORD *)buf = 68289538;
        int v31 = 16;
        __int16 v32 = 2098;
        uint64_t v33 = &v27;
        __int16 v34 = 1024;
        int v35 = v7;
        __int16 v36 = 1024;
        BOOL v37 = v3 != 0LL;
        _os_log_impl( &dword_181A5C000,  v4,  OS_LOG_TYPE_INFO,  "Task <%{public,uuid_t}.16P>.<%u> performing redirect {take=%{BOOL}d}",  buf,  0x1Eu);
        goto LABEL_10;
      }
    }

    else
    {
      uint64_t v27 = 0LL;
      uint64_t v28 = 0LL;
      LODWORD(v29) = 0;
    }

    int v7 = 0;
    uint64_t v24 = 0LL;
    uint64_t v25 = 0LL;
    LODWORD(v26) = 0;
    goto LABEL_9;
  }

void __49__NWURLSessionTask_loaderWillPerformHSTSUpgrade___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v5 = *(void *)(a1 + 32);
  id newValue = v3;
  if (!v5)
  {
    uint64_t v8 = 0LL;
    if (v3)
    {
LABEL_9:
      if (v8)
      {
        objc_setProperty_nonatomic_copy(v8, v4, newValue, 56LL);
        id v3 = newValue;
      }

      [v3 HTTPMethod];
      double v9 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v10 = [v9 caseInsensitiveCompare:@"GET"];

      if (v10)
      {
        [newValue HTTPMethod];
        double v13 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v14 = [v13 caseInsensitiveCompare:@"HEAD"];

        dispatch_time_t v11 = *(void **)(a1 + 32);
        if (v14)
        {
LABEL_15:
          [v11 startNextLoad:0];
LABEL_28:
          id v3 = newValue;
          goto LABEL_29;
        }
      }

      else
      {
        dispatch_time_t v11 = *(void **)(a1 + 32);
      }

      if (v11)
      {
        uint64_t v12 = (void *)v11[52];
        v11[52] = 0LL;

        dispatch_time_t v11 = *(void **)(a1 + 32);
      }

      goto LABEL_15;
    }

void __89__NWURLSessionTask_loaderConnectedWithHTTPConnectionMetadata_CNAMEChain_unlistedTracker___block_invoke( uint64_t a1)
{
}

- (void)complete
{
  uint64_t v135 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    nw_context_assert_queue(*(void **)(a1 + 312));
    uint64_t v3 = *(void *)(a1 + 336);
    if (v3)
    {
      *(void *)(a1 + 336) = 0LL;
      nw_queue_cancel_source(v3, v2);
    }

    uint64_t v4 = *(void *)(a1 + 320);
    if (v4)
    {
      *(void *)(a1 + 320) = 0LL;
      nw_queue_cancel_source(v4, v2);
    }

    uint64_t v5 = *(void *)(a1 + 352);
    if (v5)
    {
      *(void *)(a1 + 352) = 0LL;
      nw_queue_cancel_source(v5, v2);
    }

    uint64_t v6 = *(void *)(a1 + 344);
    if (v6)
    {
      *(void *)(a1 + 344) = 0LL;
      nw_queue_cancel_source(v6, v2);
    }

    -[NWURLSessionTask finishProgressReporting](a1);
    *(void *)(a1 + 288) = 2LL;
    [*(id *)(a1 + 264) stop];
    uint64_t v7 = *(void **)(a1 + 264);
    *(void *)(a1 + 264) = 0LL;

    [(id)a1 error];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    v109 = v8;
    if (v8)
    {
      os_log_type_t v9 = 16 * ([v8 code] != -999);
      uint64_t v10 = *(void *)(a1 + 408);
      if (v10) {
        unsigned int v11 = [*(id *)(v10 + 16) _loggingPrivacyLevel];
      }
      else {
        unsigned int v11 = 0;
      }
      if (__nwlog_url_log::onceToken != -1) {
        dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44366);
      }
      uint64_t v12 = (os_log_s *)(id)gurlLogObj;
      BOOL v13 = os_log_type_enabled(v12, v9);
      if (v11 > 2)
      {
        if (v13)
        {
          [(id)a1 logDescription];
          [(id)a1 logDescription];
          uint64_t v19 = [v109 code];
          *(_DWORD *)buf = 68289795;
          *(_DWORD *)&uint8_t buf[4] = 16;
          *(_WORD *)&uint8_t buf[8] = 2098;
          *(void *)&buf[10] = &v122;
          *(_WORD *)&buf[18] = 1024;
          *(_DWORD *)&buf[20] = v121;
          *(_WORD *)v128 = 2048;
          *(void *)&v128[2] = v19;
          *(_WORD *)&v128[10] = 2117;
          *(void *)&v128[12] = v109;
          dispatch_time_t v15 = "Task <%{public,uuid_t}.16P>.<%u> finished with error [%ld] %{sensitive}@";
          goto LABEL_24;
        }
      }

      else if (v13)
      {
        [(id)a1 logDescription];
        [(id)a1 logDescription];
        uint64_t v14 = [v109 code];
        *(_DWORD *)buf = 68289794;
        *(_DWORD *)&uint8_t buf[4] = 16;
        *(_WORD *)&uint8_t buf[8] = 2098;
        *(void *)&buf[10] = &v124;
        *(_WORD *)&buf[18] = 1024;
        *(_DWORD *)&buf[20] = v123;
        *(_WORD *)v128 = 2048;
        *(void *)&v128[2] = v14;
        *(_WORD *)&v128[10] = 2112;
        *(void *)&v128[12] = v109;
        dispatch_time_t v15 = "Task <%{public,uuid_t}.16P>.<%u> finished with error [%ld] %@";
LABEL_24:
        id v16 = v12;
        os_log_type_t v17 = v9;
        uint32_t v18 = 44;
        goto LABEL_25;
      }
    }

    else
    {
      if (__nwlog_url_log::onceToken != -1) {
        dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44366);
      }
      uint64_t v12 = (os_log_s *)(id)gurlLogObj;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        [(id)a1 logDescription];
        [(id)a1 logDescription];
        *(_DWORD *)buf = 68289282;
        *(_DWORD *)&uint8_t buf[4] = 16;
        *(_WORD *)&uint8_t buf[8] = 2098;
        *(void *)&buf[10] = &v126;
        *(_WORD *)&buf[18] = 1024;
        *(_DWORD *)&buf[20] = v125;
        dispatch_time_t v15 = "Task <%{public,uuid_t}.16P>.<%u> finished successfully";
        id v16 = v12;
        os_log_type_t v17 = OS_LOG_TYPE_DEFAULT;
        uint32_t v18 = 24;
LABEL_25:
        _os_log_impl(&dword_181A5C000, v16, v17, v15, buf, v18);
      }
    }

    -[NWURLSessionTaskConfiguration activity](*(void *)(a1 + 408));
    objc_super v21 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v22 = *(void *)(a1 + 408);
    if (v22)
    {
      -[NWURLSessionTaskConfiguration activity](*(void *)(a1 + 408));
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v22 + 24), "_nw_activity");
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
      BOOL v25 = v23 == v24;

      if (!v25)
      {
        if (v109)
        {
          if ([v109 code] == -999) {
            uint32_t v26 = 4;
          }
          else {
            uint32_t v26 = 3;
          }
        }

        else
        {
          uint32_t v26 = 2;
        }

        nw_activity_complete_with_reason_and_underlying_error(v21, v26, 1, [v109 code]);
      }
    }

    Property = (id *)objc_getProperty((id)a1, v20, 440LL, 1);
    self = (os_unfair_lock_s **)(id)a1;
    id v28 = v21;
    uint64_t v29 = v28;
    uint64_t v30 = (nw_protocol_metadata *)Property[2];
    int v31 = v30;
    xdict = Property;
    v108 = v29;
    if (v30)
    {
      __int16 v32 = nw_protocol_metadata_copy_definition(v30);
      if (nw_protocol_copy_http_client_definition_onceToken != -1) {
        dispatch_once(&nw_protocol_copy_http_client_definition_onceToken, &__block_literal_global_52);
      }
      BOOL is_equal = nw_protocol_definition_is_equal( v32,  (nw_protocol_definition_t)nw_protocol_copy_http_client_definition_definition);

      if (is_equal)
      {
        *(void *)uuid_string_t out = 0LL;
        *(void *)&out[8] = out;
        *(void *)&out[16] = 0x2020000000LL;
        *(void *)&out[24] = 0LL;
        *(void *)buf = MEMORY[0x1895F87A8];
        *(void *)&uint8_t buf[8] = 3221225472LL;
        *(void *)&buf[16] = __nw_http_client_metadata_get_transaction_count_block_invoke;
        *(void *)v128 = &unk_189BC60A8;
        *(void *)&v128[8] = out;
        uint64_t v34 = *((void *)v31 + 4);
        if (v34)
        {
          __nw_http_client_metadata_get_transaction_count_block_invoke((uint64_t)buf, v34);
          uint64_t v105 = *(void *)(*(void *)&out[8] + 24LL);
        }

        else
        {
          uint64_t v105 = 0LL;
        }

        _Block_object_dispose(out, 8);

        size_t v35 = 120 * v105 + 104;
        if (120 * v105 == -104)
        {
          __nwlog_obj();
          id v87 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          os_log_type_enabled(v87, OS_LOG_TYPE_ERROR);
          *(_DWORD *)buf = 136446210;
          *(void *)&uint8_t buf[4] = "strict_calloc";
          LODWORD(v102) = 12;
          v101 = buf;
          v88 = (void *)_os_log_send_and_compose_impl();

          free(v88);
          size_t v35 = 0LL;
        }

- (void)finishProgressReporting
{
  if (a1 && !*(_BYTE *)(a1 + 15))
  {
    *(_BYTE *)(a1 + 15) = 1;
    [(id)a1 error];
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v2)
    {
      id v3 = *(id *)(a1 + 360);
      objc_msgSend(*(id *)(a1 + 360), "setCompletedUnitCount:", objc_msgSend(v3, "totalUnitCount"));

      id v4 = *(id *)(a1 + 368);
      objc_msgSend(*(id *)(a1 + 368), "setCompletedUnitCount:", objc_msgSend(v4, "totalUnitCount"));
    }

    obuint64_t j = (id *)(id)a1;
    objc_sync_enter(obj);
    [obj[8] setCancellationHandler:0];
    [obj[8] setPausingHandler:0];
    [obj[8] setResumingHandler:0];
    objc_sync_exit(obj);
  }

void __72__NWURLSessionTask_loaderNeedsBodyProviderFromOffset_completionHandler___block_invoke( void *a1,  void *a2)
{
  id v4 = a2;
  uint64_t v5 = a1[4];
  id v18 = v4;
  if (v5)
  {
    double v6 = *(double *)(v5 + 328);
    if (v6 > 0.0)
    {
      uint64_t v7 = *(void *)(v5 + 336);
      if (v7)
      {
        dispatch_time_t v8 = dispatch_time(0x8000000000000000LL, (uint64_t)(v6 * 1000000000.0));
        if (*(void *)v7)
        {
          dispatch_source_set_timer(*(dispatch_source_t *)v7, v8, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
LABEL_6:
          id v4 = v18;
          goto LABEL_7;
        }

        *(void *)(v7 + 32) = v8;
        *(void *)(v7 + 40) = -1LL;
        id v4 = v18;
        if (*(_BYTE *)(v7 + 48) && *(_BYTE *)(v7 + 49))
        {
          nw_queue_source_run_timer(v7, v8);
          goto LABEL_6;
        }
      }
    }
  }

- (void)startStartTimer
{
  if (a1)
  {
    [(id)a1 currentRequest];
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
    [v2 _startTimeoutDate];
    id v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      [(id)a1 currentRequest];
      id v4 = (void *)objc_claimAutoreleasedReturnValue();
      [v4 _startTimeoutDate];
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
      [v5 timeIntervalSinceNow];
      double v7 = v6;

      if (v7 <= 0.0)
      {
        dispatch_time_t v8 = objc_alloc(&OBJC_CLASS___NWURLError);
        id v9 = *(id *)(a1 + 264);
        id v10 = (id)a1;
        if (v8
          && (uint64_t v11 = *MEMORY[0x189607740],
              v14.receiver = v8,
              v14.super_class = (Class)&OBJC_CLASS___NWURLError,
              (id v12 = objc_msgSendSuper2(&v14, sel_initWithDomain_code_userInfo_, v11, -1001, 0)) != 0))
        {
          id v13 = v12;
          [v12 fillErrorForLoader:v9 andTask:v10];
        }

        else
        {
          id v13 = 0LL;
        }

        [v10 completeTaskWithError:v13];
      }

      else if (!*(void *)(a1 + 344))
      {
        *(void *)(a1 + 344) = -[NWURLSessionTask createTimerWithTimeout:](a1, v7);
      }
    }
  }

- (void)startResourceTimer
{
  if (a1)
  {
    [a1 currentRequest];
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v3 = [v2 _startTimeoutDate];
    if (v3)
    {
      id v4 = (void *)v3;
      [a1 currentRequest];
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
      [v5 _payloadTransmissionTimeout];
      double v7 = v6;

      if (v7 != 0.0) {
        return;
      }
    }

    else
    {
    }

    uint64_t v8 = a1[51];
    if (v8)
    {
      [*(id *)(v8 + 24) _timeoutIntervalForResource];
      if (v9 == 0.0)
      {
        [*(id *)(v8 + 16) timeoutIntervalForResource];
        if (v10 <= 0.0) {
          return;
        }
      }

      else
      {
        [*(id *)(v8 + 24) _timeoutIntervalForResource];
        if (v10 <= 0.0) {
          return;
        }
      }

      if (!a1[40]) {
        a1[40] = -[NWURLSessionTask createTimerWithTimeout:]((uint64_t)a1, v10);
      }
    }
  }

void __34__NWURLSessionTask_startNextLoad___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v5 = v4;
  uint64_t v6 = *(void *)(a1 + 32);
  if (!v6)
  {
    uint64_t v8 = 0LL;
    uint64_t v7 = 0LL;
    if (v4) {
      goto LABEL_5;
    }
    goto LABEL_8;
  }

  if (*(void *)(v6 + 288) != 2LL)
  {
    if (v4)
    {
      objc_storeStrong((id *)(v6 + 264), a2);
      uint64_t v7 = *(void *)(a1 + 32);
LABEL_5:
      v9[0] = MEMORY[0x1895F87A8];
      v9[1] = 3221225472LL;
      v9[2] = __34__NWURLSessionTask_startNextLoad___block_invoke_2;
      v9[3] = &unk_189BC93A0;
      v9[4] = v7;
      [v5 start:v9];
      goto LABEL_6;
    }

    -[NWURLSessionTask errorForErrorCode:](*(id **)(a1 + 32), -1002LL);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
    [(id)v6 completeTaskWithError:v8];
  }

- (id)errorForErrorCode:(id *)a1
{
  if (!a1) {
    return 0LL;
  }
  id v4 = objc_alloc(&OBJC_CLASS___NWURLError);
  id v5 = a1[33];
  uint64_t v6 = a1;
  if (v4)
  {
    uint64_t v7 = *MEMORY[0x189607740];
    v11.receiver = v4;
    v11.super_class = (Class)&OBJC_CLASS___NWURLError;
    id v8 = objc_msgSendSuper2(&v11, sel_initWithDomain_code_userInfo_, v7, a2, 0);
    double v9 = v8;
    if (v8) {
      [v8 fillErrorForLoader:v5 andTask:v6];
    }
  }

  else
  {
    double v9 = 0LL;
  }

  return v9;
}

void __34__NWURLSessionTask_startNextLoad___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    uint64_t v2 = *(void *)(v1 + 408);
    if (!v2 || ([*(id *)(v2 + 24) _preconnect] & 1) == 0 && (uint64_t v1 = *(void *)(a1 + 32)) != 0)
    {
      nw_context_assert_queue(*(void **)(v1 + 312));
      id v4 = *(id *)(v1 + 264);
      v6[0] = MEMORY[0x1895F87A8];
      v6[1] = 3221225472LL;
      v6[2] = __32__NWURLSessionTask_readResponse__block_invoke;
      v6[3] = &unk_189BBEE98;
      v6[4] = v1;
      id v7 = v4;
      id v5 = v4;
      [v5 readResponse:v6];
    }
  }

void __32__NWURLSessionTask_readResponse__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 32);
  if (v7)
  {
    if (v7[33] != *(void *)(a1 + 40) || v7[36] == 2LL) {
      goto LABEL_18;
    }
  }

  else if (*(void *)(a1 + 40))
  {
    goto LABEL_18;
  }

  if (v6)
  {
    [v7 error];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();

    id v7 = *(void **)(a1 + 32);
    if (!v8)
    {
      if (v7)
      {
        objc_setProperty_atomic_copy(v7, v9, v6, 136LL);
        id v7 = *(void **)(a1 + 32);
      }
    }
  }

  [v7 error];
  double v10 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v11 = *(void *)(a1 + 32);
  if (v10)
  {
    [*(id *)(a1 + 32) error];
    id v17 = (void *)objc_claimAutoreleasedReturnValue();
    [(id)v11 completeTaskWithError:v17];
  }

  else
  {
    if (v11)
    {
      double v12 = *(double *)(v11 + 328);
      if (v12 > 0.0)
      {
        uint64_t v13 = *(void *)(v11 + 336);
        if (v13)
        {
          dispatch_time_t v14 = dispatch_time(0x8000000000000000LL, (uint64_t)(v12 * 1000000000.0));
          if (*(void *)v13)
          {
            dispatch_source_set_timer(*(dispatch_source_t *)v13, v14, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
          }

          else
          {
            *(void *)(v13 + 32) = v14;
            *(void *)(v13 + 40) = -1LL;
            if (*(_BYTE *)(v13 + 48) && *(_BYTE *)(v13 + 49)) {
              nw_queue_source_run_timer(v13, v14);
            }
          }
        }

        else
        {
          *(void *)(v11 + 336) = -[NWURLSessionTask createTimerWithTimeout:](*(void *)(a1 + 32), v12);
        }
      }
    }

    -[NWURLSessionTask updateResponse:](*(void *)(a1 + 32), v5);
    uint64_t v15 = *(void *)(a1 + 32);
    if (v15) {
      id v16 = *(void **)(v15 + 424);
    }
    else {
      id v16 = 0LL;
    }
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    void v18[2] = __32__NWURLSessionTask_readResponse__block_invoke_2;
    v18[3] = &unk_189BBEE70;
    v18[4] = v15;
    id v19 = v5;
    [v16 task:v15 deliverResponse:v19 completionHandler:v18];
  }

- (void)updateResponse:(uint64_t)a1
{
  v9[1] = *MEMORY[0x1895F89C0];
  id v3 = a2;
  if (a1)
  {
    [*(id *)(a1 + 264) peerTrust];
    id v4 = (sec_trust *)objc_claimAutoreleasedReturnValue();
    id v5 = v4;
    if (v4)
    {
      uint64_t v8 = *MEMORY[0x189602138];
      SecTrustRef v6 = sec_trust_copy_ref(v4);
      v9[0] = v6;
      [MEMORY[0x189603F68] dictionaryWithObjects:v9 forKeys:&v8 count:1];
      id v7 = (void *)objc_claimAutoreleasedReturnValue();
      [v3 _setSSLCertificateContext:v7];
    }
  }
}

void __32__NWURLSessionTask_readResponse__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v97 = *MEMORY[0x1895F89C0];
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "completeTaskWithError:");
    return;
  }

  id v5 = *(id *)(a1 + 40);
  if (!v3) {
    goto LABEL_22;
  }
  nw_context_assert_queue(*(void **)(v3 + 312));
  if (*(void *)(v3 + 288) == 2LL) {
    goto LABEL_22;
  }
  if (a2 != 1)
  {
    switch(a2)
    {
      case 3LL:
        BOOL v37 = objc_alloc(&OBJC_CLASS___NWURLSessionStreamTask);
        id v38 = *(id *)(v3 + 264);
        [(id)v3 logDescription];
        uint64_t v39 = -[NWURLSessionStreamTask initWithLoader:identifier:session:]( (id *)&v37->super.super.isa,  v38,  v92,  *(void **)(v3 + 400));

        -[NWURLSessionTask setConfiguration:]((uint64_t)v39, *(void **)(v3 + 408));
        [(id)v3 originalRequest];
        unint64_t v41 = (void *)objc_claimAutoreleasedReturnValue();
        if (v39) {
          objc_setProperty_nonatomic_copy(v39, v40, v41, 48LL);
        }

        [(id)v3 currentRequest];
        uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue();
        unsigned int v44 = v42;
        if (v39)
        {
          objc_setProperty_nonatomic_copy(v39, v43, v42, 56LL);

          objc_storeStrong(v39 + 30, *(id *)(v3 + 240));
          objc_storeStrong(v39 + 31, *(id *)(v3 + 248));
        }

        else
        {
        }

        [(id)v3 priority];
        objc_msgSend(v39, "setPriority:");
        objc_msgSend(v39, "setPrefersIncrementalDelivery:", objc_msgSend((id)v3, "prefersIncrementalDelivery"));
        -[NWURLSessionTask setClientMetadataForMetrics:]((uint64_t)v39, *(void **)(v3 + 256));
        id Property = objc_getProperty((id)v3, v45, 440LL, 1);
        if (v39)
        {
          objc_setProperty_atomic(v39, v47, Property, 440LL);
          *((_BYTE *)v39 + 13) = 0;
          v39[36] = (id)1;
          [(id)v3 response];
          int v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_setProperty_nonatomic_copy(v39, v49, v48, 472LL);
        }

        else
        {
          [(id)v3 response];
          int v48 = (void *)objc_claimAutoreleasedReturnValue();
        }

        [*(id *)(v3 + 264) updateClient:v39];
        -[NWURLSessionTask setLoader:](v3);
        -[NWURLSessionTask delegateWrapper]((void *)v3);
        BOOL v50 = (void *)objc_claimAutoreleasedReturnValue();
        *(void *)os_log_type_t v86 = MEMORY[0x1895F87A8];
        *(void *)&v86[8] = 3221225472LL;
        *(void *)&v86[16] = __55__NWURLSessionTask_handleResponseDisposition_response___block_invoke_3;
        id v87 = &unk_189BC9238;
        uint64_t v88 = v3;
        id v89 = v39;
        uint64_t v51 = v39;
        -[NWURLSessionDelegateWrapper dataTask:didBecomeStreamTask:completionHandler:]( (uint64_t)v50,  (void *)v3,  v51,  v86);

        break;
      case 2LL:
        BOOL v52 = objc_alloc(&OBJC_CLASS___NWURLSessionDownloadTask);
        id v53 = *(id *)(v3 + 264);
        [(id)v3 logDescription];
        os_log_type_t v54 = -[NWURLSessionDownloadTask initWithLoader:identifier:session:]( (id *)&v52->super.super.isa,  v53,  v96,  *(void **)(v3 + 400));

        -[NWURLSessionTask setConfiguration:]((uint64_t)v54, *(void **)(v3 + 408));
        [(id)v3 originalRequest];
        os_log_type_t v56 = (void *)objc_claimAutoreleasedReturnValue();
        if (v54) {
          objc_setProperty_nonatomic_copy(v54, v55, v56, 48LL);
        }

        [(id)v3 currentRequest];
        unsigned int v57 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v59 = v57;
        if (v54)
        {
          objc_setProperty_nonatomic_copy(v54, v58, v57, 56LL);

          objc_storeStrong(v54 + 30, *(id *)(v3 + 240));
          objc_storeStrong(v54 + 31, *(id *)(v3 + 248));
        }

        else
        {
        }

        [(id)v3 priority];
        objc_msgSend(v54, "setPriority:");
        [v54 setPrefersIncrementalDelivery:0];
        -[NWURLSessionTask setClientMetadataForMetrics:]((uint64_t)v54, *(void **)(v3 + 256));
        id v61 = objc_getProperty((id)v3, v60, 440LL, 1);
        if (v54)
        {
          objc_setProperty_atomic(v54, v62, v61, 440LL);
          unint64_t v63 = objc_alloc_init(&OBJC_CLASS___NWURLSessionResponseConsumerDownload);
          objc_storeStrong(v54 + 53, v63);
        }

        else
        {
          unint64_t v63 = objc_alloc_init(&OBJC_CLASS___NWURLSessionResponseConsumerDownload);
        }

        v91.receiver = 0LL;
        v91.super_class = (Class)&v91;
        uint64_t v92 = 0x3032000000LL;
        v93 = __Block_byref_object_copy__45545;
        os_log_type_t v94 = __Block_byref_object_dispose__45546;
        id v95 = 0LL;
        if (v54) {
          id v64 = v54[53];
        }
        else {
          id v64 = 0LL;
        }
        id v65 = v64;
        [(id)v3 response];
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v67 = MEMORY[0x1895F87A8];
        v82.receiver = (id)MEMORY[0x1895F87A8];
        v82.super_class = (Class)3221225472LL;
        id v83 = __55__NWURLSessionTask_handleResponseDisposition_response___block_invoke;
        id v84 = &unk_189BBEEC0;
        id v85 = &v91;
        [v65 task:v54 deliverResponse:v66 completionHandler:&v82];

        if (v54)
        {
          *((_BYTE *)v54 + 13) = 0;
          v54[36] = (id)1;
        }

        id v68 = *(id *)(v3 + 264);
        [v68 updateClient:v54];

        -[NWURLSessionTask setLoader:](v3);
        -[NWURLSessionTask delegateWrapper]((void *)v3);
        unsigned int v69 = (void *)objc_claimAutoreleasedReturnValue();
        *(void *)os_log_type_t v86 = v67;
        *(void *)&v86[8] = 3221225472LL;
        *(void *)&v86[16] = __55__NWURLSessionTask_handleResponseDisposition_response___block_invoke_2;
        id v87 = &unk_189BBEEE8;
        uint64_t v88 = v3;
        v70 = v54;
        id v89 = v70;
        char v90 = &v91;
        -[NWURLSessionDelegateWrapper dataTask:didBecomeDownloadTask:completionHandler:]( (uint64_t)v69,  (void *)v3,  v70,  v86);

        _Block_object_dispose(&v91, 8);
        break;
      case 0LL:
        -[NWURLSessionTask errorForErrorCode:]((id *)v3, -999LL);
        __int16 v36 = (void *)objc_claimAutoreleasedReturnValue();
        [(id)v3 completeTaskWithError:v36];

        break;
    }

    goto LABEL_22;
  }

  [*(id *)(v3 + 264) multipartMixedReplaceBoundary];
  SecTrustRef v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
LABEL_21:
    -[NWURLSessionTask readResponseBody](v3);

LABEL_22:
    return;
  }

  id v7 = objc_alloc(&OBJC_CLASS___NWURLSessionMultipartParser);
  uint64_t v8 = *(void **)(v3 + 424);
  double v9 = *(void **)(v3 + 232);
  id v10 = v9;
  id v11 = v8;
  id v81 = v6;
  id v12 = v11;
  id v13 = v10;
  if (!v7
    || (v82.receiver = v7,
        v82.super_class = (Class)&OBJC_CLASS___NWURLSessionMultipartParser,
        dispatch_time_t v14 = (NWURLSessionMultipartParser *)objc_msgSendSuper2(&v82, sel_init),
        (id v7 = v14) == 0LL))
  {
LABEL_20:

    size_t v35 = *(void **)(v3 + 272);
    *(void *)(v3 + 272) = v7;

    goto LABEL_21;
  }

  v14->_parserState = 0;
  v14->_dispositionState = 0;
  objc_storeStrong((id *)&v14->_responseConsumer, v8);
  p_boundary = (id *)&v7->_boundary;
  objc_storeStrong((id *)&v7->_boundary, v6);
  objc_storeStrong((id *)&v7->_data, MEMORY[0x1895F8AA8]);
  id v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
  headers = v7->_headers;
  v7->_headers = v16;

  id v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
  parts = v7->_parts;
  v7->_parts = v18;

  objc_storeStrong((id *)&v7->_queue, v9);
  uint64_t v20 = (void *)-[NSString mutableCopy](v7->_boundary, "mutableCopy");
  if (-[NSString length](v7->_boundary, "length") < 3
    || [*p_boundary characterAtIndex:0] != 45
    || [*p_boundary characterAtIndex:1] != 45)
  {
    [v20 insertString:@"--" atIndex:0];
  }

  v7->_boundaryPatternSize = [v20 lengthOfBytesUsingEncoding:5];
  objc_super v21 = objc_alloc(&OBJC_CLASS___NWURLSessionMultipartBoundaryRecognizer);
  id v22 = v20;
  if (!v21)
  {
    uint64_t v23 = 0LL;
    goto LABEL_19;
  }

  v91.receiver = v21;
  v91.super_class = (Class)&OBJC_CLASS___NWURLSessionMultipartBoundaryRecognizer;
  uint64_t v23 = (NWURLSessionMultipartBoundaryRecognizer *)objc_msgSendSuper2(&v91, sel_init);
  if (!v23)
  {
LABEL_19:

    boundaryRecognizer = v7->_boundaryRecognizer;
    v7->_boundaryRecognizer = v23;

    int v31 = objc_alloc_init(&OBJC_CLASS___NWURLSessionMultipartPartBoundarySuffixRecognizer);
    boundarySuffixRecognizer = v7->_boundarySuffixRecognizer;
    v7->_boundarySuffixRecognizer = v31;

    uint64_t v33 = objc_alloc_init(&OBJC_CLASS___NWURLSessionMultipartHeaderRecognizer);
    headerRecognizer = v7->_headerRecognizer;
    v7->_headerRecognizer = v33;

    *(_WORD *)&v7->_isFirstBoundary = 1;
    goto LABEL_20;
  }

  uint64_t v24 = [v22 lengthOfBytesUsingEncoding:1];
  v23->_patternLength = v24;
  size_t v25 = v24 + 1;
  if (v24 == -1)
  {
    __nwlog_obj();
    uint64_t v77 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v77, OS_LOG_TYPE_ERROR);
    *(_DWORD *)os_log_type_t v86 = 136446210;
    *(void *)&v86[4] = "strict_malloc";
    LODWORD(v74) = 12;
    uint64_t v73 = v86;
    unint64_t v71 = (void *)_os_log_send_and_compose_impl();

    free(v71);
  }

  uint32_t v26 = (char *)malloc(v25);
  if (!v26)
  {
    __nwlog_obj();
    __int128 v78 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v78, OS_LOG_TYPE_ERROR);
    *(_DWORD *)os_log_type_t v86 = 136446466;
    *(void *)&v86[4] = "strict_malloc";
    *(_WORD *)&v86[12] = 2048;
    *(void *)&v86[14] = v25;
    LODWORD(v74) = 22;
    uint64_t v73 = v86;
    __int128 v75 = (void *)_os_log_send_and_compose_impl();

    free(v75);
  }

  v23->_pattern = v26;
  objc_msgSend(v22, "getCString:maxLength:encoding:", v26, v23->_patternLength + 1, 1, v73, v74);
  uint64_t v27 = [v22 lengthOfBytesUsingEncoding:1];
  size_t v28 = v27 + 1;
  v23->_rollbackBufferCapacity = v27 + 1;
  if (v27 != -1)
  {
LABEL_17:
    uint64_t v29 = (char *)malloc(v28);
    if (v29)
    {
LABEL_18:
      v23->_rollbackBuffer = v29;
      goto LABEL_19;
    }

    __nwlog_obj();
    uint32_t v80 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v80, OS_LOG_TYPE_ERROR);
    *(_DWORD *)os_log_type_t v86 = 136446466;
    *(void *)&v86[4] = "strict_malloc";
    *(_WORD *)&v86[12] = 2048;
    *(void *)&v86[14] = v28;
    BOOL v76 = (void *)_os_log_send_and_compose_impl();

    if (!__nwlog_abort((uint64_t)v76))
    {
      free(v76);
      goto LABEL_18;
    }

    goto LABEL_60;
  }

  __nwlog_obj();
  id v79 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  os_log_type_enabled(v79, OS_LOG_TYPE_ERROR);
  *(_DWORD *)os_log_type_t v86 = 136446210;
  *(void *)&v86[4] = "strict_malloc";
  __int128 v72 = (void *)_os_log_send_and_compose_impl();

  if (!__nwlog_abort((uint64_t)v72))
  {
    free(v72);
    goto LABEL_17;
  }

- (void)readResponseBody
{
  if (a1)
  {
    nw_context_assert_queue(*(void **)(a1 + 312));
    if (*(void *)(a1 + 288) != 2LL)
    {
      if ((*(_BYTE *)(a1 + 13) & 1) != 0)
      {
        *(_BYTE *)(a1 + 14) = 1;
      }

      else
      {
        id v2 = *(id *)(a1 + 264);
        v4[0] = MEMORY[0x1895F87A8];
        v4[1] = 3221225472LL;
        v4[2] = __36__NWURLSessionTask_readResponseBody__block_invoke;
        v4[3] = &unk_189BC5F08;
        v4[4] = a1;
        id v5 = v2;
        id v3 = v2;
        [v3 readDataOfMinimumIncompleteLength:1 maximumLength:0x100000 completionHandler:v4];
      }
    }
  }

- (void)setConfiguration:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 408), a2);
  }
}

- (void)setClientMetadataForMetrics:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 256), a2);
  }
}

void __55__NWURLSessionTask_handleResponseDisposition_response___block_invoke(uint64_t a1, int a2, id obj)
{
}

- (void)setLoader:(uint64_t)a1
{
}

- (void)delegateWrapper
{
  if (a1)
  {
    uint64_t v1 = 31LL;
    if (!a1[31]) {
      uint64_t v1 = 30LL;
    }
    a1 = (id)a1[v1];
  }

  return a1;
}

void __55__NWURLSessionTask_handleResponseDisposition_response___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2 && (*(void *)(v2 + 288) = 2LL, (uint64_t v3 = *(void *)(a1 + 32)) != 0)) {
    id v4 = *(os_unfair_lock_s **)(v3 + 400);
  }
  else {
    id v4 = 0LL;
  }
  -[NWURLSession taskStarted:](v4, *(void **)(a1 + 40));
  id v5 = *(void **)(a1 + 32);
  if (v5) {
    SecTrustRef v6 = (os_unfair_lock_s *)v5[50];
  }
  else {
    SecTrustRef v6 = 0LL;
  }
  -[NWURLSession taskCompleted:](v6, v5);
  id v7 = *(void **)(a1 + 40);
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL)) {
    objc_msgSend(v7, "completeTaskWithError:");
  }
  else {
    -[NWURLSessionTask readResponseBody]((uint64_t)v7);
  }
}

void __55__NWURLSessionTask_handleResponseDisposition_response___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2 && (*(void *)(v2 + 288) = 2LL, (uint64_t v3 = *(void *)(a1 + 32)) != 0)) {
    id v4 = *(os_unfair_lock_s **)(v3 + 400);
  }
  else {
    id v4 = 0LL;
  }
  -[NWURLSession taskStarted:](v4, *(void **)(a1 + 40));
  id v5 = *(void **)(a1 + 32);
  if (v5) {
    SecTrustRef v6 = (os_unfair_lock_s *)v5[50];
  }
  else {
    SecTrustRef v6 = 0LL;
  }
  -[NWURLSession taskCompleted:](v6, v5);
}

- (id)initWithRequest:(int)a3 identifier:(void *)a4 session:
{
  id v8 = a2;
  double v9 = a4;
  if (!a1) {
    goto LABEL_31;
  }
  v48.receiver = a1;
  v48.super_class = (Class)&OBJC_CLASS___NWURLSessionTask;
  id v10 = (id *)objc_msgSendSuper2(&v48, sel_init);
  a1 = v10;
  if (!v10) {
    goto LABEL_31;
  }
  id v11 = v9 + 8;
  if (!v9) {
    id v11 = 0LL;
  }
  *((_OWORD *)v10 + 28) = *v11;
  *((_DWORD *)v10 + 116) = a3;
  objc_storeStrong(v10 + 6, a2);
  objc_storeStrong(a1 + 7, a2);
  id v12 = (void *)*MEMORY[0x189601E78];
  a1[10] = (id)*MEMORY[0x189601E78];
  a1[11] = v12;
  a1[14] = v12;
  a1[15] = v12;
  objc_storeStrong(a1 + 50, a4);
  id v13 = objc_alloc(&OBJC_CLASS___NWURLSessionTaskConfiguration);
  p_isa = (id *)&v13->super.isa;
  if (v9)
  {
    id v15 = *((id *)v9 + 12);
    id v16 = -[NWURLSessionTaskConfiguration initWithConfiguration:task:request:](p_isa, v15, a1, v8);
    id v17 = a1[51];
    a1[51] = v16;

    id v18 = (void *)*((void *)v9 + 18);
  }

  else
  {
    unsigned int v44 = -[NWURLSessionTaskConfiguration initWithConfiguration:task:request:]((id *)&v13->super.isa, 0LL, a1, v8);
    id v45 = a1[51];
    a1[51] = v44;

    id v18 = 0LL;
  }

  objc_storeStrong(a1 + 29, v18);
  if (v9) {
    id v19 = (void *)*((void *)v9 + 20);
  }
  else {
    id v19 = 0LL;
  }
  objc_storeStrong(a1 + 39, v19);
  *((_DWORD *)a1 + 6) = *MEMORY[0x189601E70];
  *((_BYTE *)a1 + 8) = 1;
  if (v8)
  {
    uint64_t v20 = objc_alloc(&OBJC_CLASS___NWURLSessionDelegateWrapper);
    if (v9) {
      objc_super v21 = (void *)*((void *)v9 + 19);
    }
    else {
      objc_super v21 = 0LL;
    }
    id v22 = v21;
    uint64_t v23 = -[NWURLSessionDelegateWrapper initWithFallbackDelegateWrapper:]((id *)&v20->super.isa, v22);
    id v24 = a1[30];
    a1[30] = v23;

    if (nw_protocol_copy_http_client_definition_onceToken != -1) {
      dispatch_once(&nw_protocol_copy_http_client_definition_onceToken, &__block_literal_global_52);
    }
    singleton = nw_protocol_metadata_create_singleton((void *)nw_protocol_copy_http_client_definition_definition);
    id v26 = a1[32];
    a1[32] = singleton;

    nw_http_client_metadata_create_next_transaction(a1[32], 0);
    [v8 URL];
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
    size_t v28 = v27;
    if (v27)
    {
      [v27 scheme];
      uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
      unint64_t v30 = [v29 length] - 2;
      if (v30 >= 4)
      {
      }

      else
      {
        uint64_t v31 = [v29 caseInsensitiveCompare:off_189BB7FE8[v30]];

        if (v31) {
          goto LABEL_20;
        }
        size_t v28 = (void *)_nw_http_request_create_from_url_request(v8);
        nw_http_client_metadata_set_initial_request(a1[32], v28);
        objc_initWeak(&location.receiver, a1);
        id v32 = a1[32];
        v46[0] = MEMORY[0x1895F87A8];
        v46[1] = 3221225472LL;
        v46[2] = __55__NWURLSessionTask_initWithRequest_identifier_session___block_invoke;
        v46[3] = &unk_189BC0AE8;
        objc_copyWeak(&v47, &location.receiver);
        nw_http_client_metadata_set_prevent_timeout_callback(v32, v46);
        objc_destroyWeak(&v47);
        objc_destroyWeak(&location.receiver);
      }
    }

LABEL_20:
    uint64_t v33 = objc_alloc(&OBJC_CLASS___NWURLSessionTaskMetrics);
    id v34 = a1[32];
    id v35 = v34;
    if (v33)
    {
      location.receiver = v33;
      location.super_class = (Class)&OBJC_CLASS___NWURLSessionTaskMetrics;
      __int16 v36 = (NWURLSessionTaskMetrics *)objc_msgSendSuper2(&location, sel_init);
      uint64_t v33 = v36;
      if (v36) {
        objc_storeStrong((id *)&v36->_clientMetadata, v34);
      }
    }

    id v37 = a1[55];
    a1[55] = v33;
  }

  if (ne_tracker_should_save_stacktrace())
  {
    if (v9) {
      id v38 = *((id *)v9 + 12);
    }
    else {
      id v38 = 0LL;
    }
    char v39 = [v38 _skipsStackTraceCapture];

    if ((v39 & 1) == 0)
    {
      location.receiver = 0LL;
      uint64_t v40 = ne_tracker_copy_current_stacktrace();
      if (v40)
      {
        uint64_t v41 = [MEMORY[0x189603F48] dataWithBytesNoCopy:v40 length:location.receiver];
        id v42 = a1[47];
        a1[47] = (id)v41;
      }
    }
  }

  *((_BYTE *)a1 + 13) = 1;
  a1[36] = 0LL;
LABEL_31:

  return a1;
}

void __55__NWURLSessionTask_initWithRequest_identifier_session___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    double v2 = *((double *)WeakRetained + 41);
    if (v2 > 0.0)
    {
      uint64_t v3 = *((void *)WeakRetained + 42);
      id v5 = WeakRetained;
      if (!v3)
      {
        *((void *)WeakRetained + 42) = -[NWURLSessionTask createTimerWithTimeout:]((uint64_t)WeakRetained, v2);
        goto LABEL_10;
      }

      dispatch_time_t v4 = dispatch_time(0x8000000000000000LL, (uint64_t)(v2 * 1000000000.0));
      if (*(void *)v3)
      {
        dispatch_source_set_timer(*(dispatch_source_t *)v3, v4, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
LABEL_10:
        id WeakRetained = v5;
        goto LABEL_11;
      }

      *(void *)(v3 + 32) = v4;
      *(void *)(v3 + 40) = -1LL;
      id WeakRetained = v5;
      if (*(_BYTE *)(v3 + 48) && *(_BYTE *)(v3 + 49))
      {
        nw_queue_source_run_timer(v3, v4);
        goto LABEL_10;
      }
    }
  }

void __36__NWURLSessionTask_readResponseBody__block_invoke(uint64_t a1, void *a2, int a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9)
  {
    id v10 = *(void **)(v9 + 264);
    id v11 = (id *)(a1 + 40);
    if (v10 == *(void **)(a1 + 40) && *(void *)(v9 + 288) != 2LL)
    {
      if (!a3) {
        goto LABEL_15;
      }
LABEL_5:
      [v10 trailerFields];
      id v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        id v13 = objc_alloc(MEMORY[0x189603FC8]);
        id v14 = v12;
        uint64_t count = _nw_http_fields_get_count();

        id v16 = (void *)[v13 initWithCapacity:count];
        v48[0] = MEMORY[0x1895F87A8];
        v48[1] = 3221225472LL;
        v48[2] = __36__NWURLSessionTask_readResponseBody__block_invoke_2;
        v48[3] = &unk_189BBEF10;
        id v17 = v16;
        id v49 = v17;
        id v18 = v14;
        id v19 = v48;
        _nw_http_fields_enumerate((uint64_t)v18, v19);

        objc_super v21 = (void *)[v17 copy];
        id v22 = *(void **)(a1 + 32);
        if (v22) {
          objc_setProperty_atomic(v22, v20, v21, 224LL);
        }
      }

      if ([*v11 requestComplete])
      {
        BOOL v23 = 1LL;
        uint64_t v24 = *(void *)(a1 + 32);
        if (!v8) {
          goto LABEL_11;
        }
        goto LABEL_16;
      }

uint64_t __36__NWURLSessionTask_readResponseBody__block_invoke_2( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4)
{
  SecTrustRef v6 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) objectForKeyedSubscript:v6];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7) {
    [NSString stringWithFormat:@"%@, %s", v7, a4];
  }
  else {
    [NSString stringWithUTF8String:a4];
  }
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:v6];

  return 1LL;
}

void __36__NWURLSessionTask_readResponseBody__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_time_t v4 = *(void **)(a1 + 32);
  if (!v4 || v4[36] != 2LL)
  {
    if (v3)
    {
      [v4 error];
      SecTrustRef v6 = (void *)objc_claimAutoreleasedReturnValue();

      dispatch_time_t v4 = *(void **)(a1 + 32);
      if (!v6 && v4)
      {
        objc_setProperty_atomic_copy(v4, v7, v3, 136LL);
        dispatch_time_t v4 = *(void **)(a1 + 32);
      }

      if (!*(_BYTE *)(a1 + 48))
      {
        [v4 completeTaskWithError:v3];
        goto LABEL_9;
      }

      goto LABEL_5;
    }

    if (*(_BYTE *)(a1 + 48))
    {
LABEL_5:
      -[NWURLSessionTask complete]((uint64_t)v4);
      goto LABEL_9;
    }

    if (*(_BYTE *)(a1 + 49))
    {
      id v5 = *(void **)(a1 + 40);
      v8[0] = MEMORY[0x1895F87A8];
      v8[1] = 3221225472LL;
      v8[2] = __36__NWURLSessionTask_readResponseBody__block_invoke_4;
      v8[3] = &unk_189BC93A0;
      v8[4] = v4;
      [v5 notifyRequestCompletion:v8];
    }

    else
    {
      -[NWURLSessionTask readResponseBody]();
    }
  }

void __36__NWURLSessionTask_readResponseBody__block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_time_t v4 = *(void **)(a1 + 32);
  if (!v4 || v4[36] != 2LL)
  {
    if (v3)
    {
      [v4 error];
      SecTrustRef v6 = (void *)objc_claimAutoreleasedReturnValue();

      dispatch_time_t v4 = *(void **)(a1 + 32);
      if (!v6 && v4)
      {
        objc_setProperty_atomic_copy(v4, v7, v3, 136LL);
        dispatch_time_t v4 = *(void **)(a1 + 32);
      }

      if (!*(_BYTE *)(a1 + 48))
      {
        [v4 completeTaskWithError:v3];
        goto LABEL_9;
      }

      goto LABEL_5;
    }

    if (*(_BYTE *)(a1 + 48))
    {
LABEL_5:
      -[NWURLSessionTask complete]((uint64_t)v4);
      goto LABEL_9;
    }

    if (*(_BYTE *)(a1 + 49))
    {
      id v5 = *(void **)(a1 + 40);
      v8[0] = MEMORY[0x1895F87A8];
      v8[1] = 3221225472LL;
      v8[2] = __36__NWURLSessionTask_readResponseBody__block_invoke_7;
      v8[3] = &unk_189BC93A0;
      v8[4] = v4;
      [v5 notifyRequestCompletion:v8];
    }

    else
    {
      -[NWURLSessionTask readResponseBody]();
    }
  }

uint64_t __36__NWURLSessionTask_readResponseBody__block_invoke_7(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (v1)
  {
    if (*(void *)(v1 + 288) == 2LL) {
      return result;
    }
    double v2 = *(void **)(v1 + 424);
  }

  else
  {
    double v2 = 0LL;
  }

  uint64_t v3 = MEMORY[0x1895F87A8];
  uint64_t v4 = 3221225472LL;
  id v5 = __36__NWURLSessionTask_readResponseBody__block_invoke_8;
  SecTrustRef v6 = &unk_189BBF480;
  uint64_t v7 = v1;
  return objc_msgSend(v2, "task:deliverData:complete:error:completionHandler:");
}

void __36__NWURLSessionTask_readResponseBody__block_invoke_8(uint64_t a1, void *a2)
{
  id newValue = a2;
  if (newValue)
  {
    [*(id *)(a1 + 32) error];
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      id v5 = *(void **)(a1 + 32);
      if (v5) {
        objc_setProperty_atomic_copy(v5, v4, newValue, 136LL);
      }
    }
  }

  -[NWURLSessionTask complete](*(void *)(a1 + 32));
}

void __36__NWURLSessionTask_readResponseBody__block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  if (v1)
  {
    if (v1[36] == 2LL) {
      return;
    }
    uint64_t v2 = v1[34];
  }

  else
  {
    uint64_t v2 = 0LL;
  }

  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __36__NWURLSessionTask_readResponseBody__block_invoke_5;
  v3[3] = &unk_189BBF480;
  v3[4] = v1;
  -[NWURLSessionMultipartParser task:handleMultipartData:complete:error:completionHandler:](v2, v1, 0LL, 1, 0LL, v3);
}

void __36__NWURLSessionTask_readResponseBody__block_invoke_5(uint64_t a1, void *a2)
{
  id newValue = a2;
  if (newValue)
  {
    [*(id *)(a1 + 32) error];
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      id v5 = *(void **)(a1 + 32);
      if (v5) {
        objc_setProperty_atomic_copy(v5, v4, newValue, 136LL);
      }
    }
  }

  -[NWURLSessionTask complete](*(void *)(a1 + 32));
}

void __26__NWURLSessionTask_cancel__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(id **)(a1 + 32);
  if (v1)
  {
    uint64_t v2 = objc_alloc(&OBJC_CLASS___NWURLError);
    id v3 = v1[33];
    uint64_t v4 = v1;
    if (v2
      && (uint64_t v5 = *MEMORY[0x189607740],
          v8.receiver = v2,
          v8.super_class = (Class)&OBJC_CLASS___NWURLError,
          (id v6 = objc_msgSendSuper2(&v8, sel_initWithDomain_code_userInfo_, v5, -999, 0)) != 0))
    {
      id v7 = v6;
      [v6 fillErrorForLoader:v3 andTask:v4];
    }

    else
    {
      id v7 = 0LL;
    }

    [v1 completeTaskWithError:v7];
  }

  else
  {
    id v7 = 0LL;
    [0 completeTaskWithError:0];
  }
}

uint64_t __27__NWURLSessionTask_suspend__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (v1) {
    *(_BYTE *)(v1 + 13) = 1;
  }
  return result;
}

void __26__NWURLSessionTask_resume__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!v1 || (*(_BYTE *)(v1 + 13) & 1) == 0) {
    return;
  }
  *(_BYTE *)(v1 + 13) = 0;
  uint64_t v3 = *(void *)(a1 + 32);
  if (!v3)
  {
    id v7 = 0LL;
LABEL_13:
    objc_super v8 = (os_unfair_lock_s *)(id)v3;
    -[NWURLSession taskStarted:](v8, v7);
    [*(id *)(a1 + 32) startNextLoad:1];
LABEL_14:

    return;
  }

  if (!*(void *)(v3 + 288))
  {
    *(void *)(v3 + 288) = 1LL;
    id v7 = *(void **)(a1 + 32);
    if (v7) {
      uint64_t v3 = v7[50];
    }
    else {
      uint64_t v3 = 0LL;
    }
    goto LABEL_13;
  }

  if (!*(_BYTE *)(v3 + 14)
    || (*(_BYTE *)(v3 + 14) = 0,
        -[NWURLSessionTask readResponseBody](*(void *)(a1 + 32)),
        (uint64_t v3 = *(void *)(a1 + 32)) != 0))
  {
    uint64_t v4 = (os_unfair_lock_s *)*(id *)(v3 + 296);
    if (v4)
    {
      objc_super v8 = v4;
      id v6 = *(void **)(a1 + 32);
      if (v6) {
        objc_setProperty_nonatomic_copy(v6, v5, 0LL, 296LL);
      }
      (*(void (**)(void))&v8[4]._os_unfair_lock_opaque)();
      goto LABEL_14;
    }
  }

- (void)setCountOfBytesExpectedToReceive:(void *)result
{
  if (result)
  {
    uint64_t v3 = result;
    [result willChangeValueForKey:@"countOfBytesExpectedToReceive"];
    *((void *)v3 + 15) = a2;
    result = (void *)[v3 didChangeValueForKey:@"countOfBytesExpectedToReceive"];
    if (*((void *)v3 + 8))
    {
      if (!*((_BYTE *)v3 + 15))
      {
        id v4 = *((id *)v3 + 45);
        objc_msgSend(*((id *)v3 + 45), "setCompletedUnitCount:", objc_msgSend(v4, "totalUnitCount"));

        uint64_t v5 = *MEMORY[0x1896076A0];
        [v3 progress];
        id v6 = (void *)objc_claimAutoreleasedReturnValue();
        [v6 setFileOperationKind:v5];

        objc_msgSend(MEMORY[0x189607968], "numberWithLongLong:", objc_msgSend(v3, "countOfBytesReceived"));
        id v7 = (void *)objc_claimAutoreleasedReturnValue();
        [v3 progress];
        objc_super v8 = (void *)objc_claimAutoreleasedReturnValue();
        [v8 setByteCompletedCount:v7];

        [MEMORY[0x189607968] numberWithLongLong:a2];
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
        [v3 progress];
        id v10 = (void *)objc_claimAutoreleasedReturnValue();
        [v10 setByteTotalCount:v9];

        if (a2 >= 1) {
          uint64_t v11 = a2;
        }
        else {
          uint64_t v11 = 100LL;
        }
        *((_BYTE *)v3 + 17) = a2 < 1;
        return (void *)[*((id *)v3 + 46) setTotalUnitCount:v11];
      }
    }
  }

  return result;
}

- (void)setCountOfBytesReceived:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 willChangeValueForKey:@"countOfBytesReceived"];
    *(void *)(a1 + 104) = a2;
    [(id)a1 didChangeValueForKey:@"countOfBytesReceived"];
    if (*(void *)(a1 + 64))
    {
      if (!*(_BYTE *)(a1 + 15))
      {
        [MEMORY[0x189607968] numberWithLongLong:a2];
        id v4 = (void *)objc_claimAutoreleasedReturnValue();
        [(id)a1 progress];
        uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
        [v5 setByteCompletedCount:v4];

        id v6 = *(void **)(a1 + 368);
        if (*(_BYTE *)(a1 + 17))
        {
          id v7 = v6;
          uint64_t v8 = [v7 completedUnitCount];
          uint64_t v9 = [*(id *)(a1 + 368) totalUnitCount] - 1;

          if (v8 < v9)
          {
            id v10 = *(id *)(a1 + 368);
            objc_msgSend(v10, "setCompletedUnitCount:", objc_msgSend(v10, "completedUnitCount") + 1);
          }
        }

        else
        {
          [v6 setCompletedUnitCount:a2];
        }
      }
    }
  }

@end