@interface GTMTLCaptureService
- (BOOL)hasObservers;
- (GTMTLCaptureService)initWithGuestApp:(GTMTLGuestAppClient *)a3;
- (id)query:(id)a3;
- (id)startWithDescriptor:(id)a3 completionHandler:(id)a4;
- (id)update:(id)a3;
- (unint64_t)nextRequestID;
- (unint64_t)registerObserver:(id)a3;
- (void)deregisterObserver:(unint64_t)a3;
- (void)deregisterObserversForConnection:(id)a3 path:(id)a4;
- (void)notifyCaptureObjectsChanged:(id)a3;
- (void)notifyCaptureProgress:(id)a3;
- (void)notifyCaptureRequest:(id)a3;
- (void)notifyUnsupportedFenum:(id)a3;
- (void)signalInterposeSemaphore;
- (void)stop;
- (void)waitForInterposeSignal;
@end

@implementation GTMTLCaptureService

- (GTMTLCaptureService)initWithGuestApp:(GTMTLGuestAppClient *)a3
{
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___GTMTLCaptureService;
  id v3 = -[GTMTLCaptureService init](&v19, "init", a3);
  if (v3)
  {
    os_log_t v4 = os_log_create("com.apple.gputools.transport", "CaptureService");
    v5 = (void *)*((void *)v3 + 1);
    *((void *)v3 + 1) = v4;

    v6 = (os_log_s *)*((void *)v3 + 1);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v18 = 0;
      _os_log_debug_impl(&dword_0, v6, OS_LOG_TYPE_DEBUG, "Create Capture Service", v18, 2u);
    }

    if ((qword_23A448 & 0x40) != 0)
    {
      dispatch_semaphore_t v7 = dispatch_semaphore_create(0LL);
      v8 = (void *)*((void *)v3 + 4);
      *((void *)v3 + 4) = v7;
    }

    dispatch_queue_t v9 = dispatch_queue_create("com.app.gputools.capture", 0LL);
    v10 = (void *)*((void *)v3 + 6);
    *((void *)v3 + 6) = v9;

    dispatch_source_t v11 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  *((dispatch_queue_t *)v3 + 6));
    v12 = (void *)*((void *)v3 + 7);
    *((void *)v3 + 7) = v11;

    dispatch_source_set_event_handler(*((dispatch_source_t *)v3 + 7), &__block_literal_global_2559);
    dispatch_source_set_timer(*((dispatch_source_t *)v3 + 7), 0LL, 0x2FAF080uLL, 0LL);
    v13 = objc_opt_new(&OBJC_CLASS___GTObservableService);
    v14 = (void *)*((void *)v3 + 5);
    *((void *)v3 + 5) = v13;

    dispatch_queue_t v15 = dispatch_queue_create("com.apple.gputools.capture-observers", 0LL);
    v16 = (void *)*((void *)v3 + 9);
    *((void *)v3 + 9) = v15;
  }

  return (GTMTLCaptureService *)v3;
}

- (void)signalInterposeSemaphore
{
  interposeSemaphore = self->_interposeSemaphore;
}

- (void)waitForInterposeSignal
{
  interposeSemaphore = self->_interposeSemaphore;
  if (interposeSemaphore)
  {
    dispatch_semaphore_wait((dispatch_semaphore_t)interposeSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    interposeSemaphore = self->_interposeSemaphore;
  }

  self->_interposeSemaphore = 0LL;
}

- (void)stop
{
  id v2 = (id)objc_claimAutoreleasedReturnValue( +[CaptureMTLCaptureManager toolsCaptureManager]( &OBJC_CLASS___CaptureMTLCaptureManager,  "toolsCaptureManager"));
  [v2 stopCapture];
}

- (unint64_t)registerObserver:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  v13 = &v12;
  uint64_t v14 = 0x2020000000LL;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __40__GTMTLCaptureService_registerObserver___block_invoke;
  block[3] = &unk_20D958;
  id v10 = v4;
  dispatch_source_t v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(serialQueue, block);
  unint64_t v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void)deregisterObserversForConnection:(id)a3 path:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __61__GTMTLCaptureService_deregisterObserversForConnection_path___block_invoke;
  block[3] = &unk_20D980;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(serialQueue, block);
}

- (BOOL)hasObservers
{
  return -[GTObservableService count](self->_observers, "count") != 0LL;
}

- (void)deregisterObserver:(unint64_t)a3
{
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = __42__GTMTLCaptureService_deregisterObserver___block_invoke;
  v4[3] = &unk_20D9A8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(serialQueue, v4);
}

- (id)startWithDescriptor:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = objc_opt_new(&OBJC_CLASS___MTLCaptureDescriptorInternal);
  id v9 = [v6 streamRef];
  uint64_t Stream = GTTraceContext_getStream(g_ctx, (uint64_t)v9);
  if (Stream) {
    id v11 = *(id *)(Stream + 16);
  }
  else {
    id v11 = 0LL;
  }
  -[MTLCaptureDescriptorInternal setCaptureObject:](v8, "setCaptureObject:", v11);

  -[MTLCaptureDescriptorInternal setDestination:](v8, "setDestination:", 2LL);
  -[MTLCaptureDescriptorInternal setSessionID:](v8, "setSessionID:", [v6 sessionID]);
  id v12 = (id)objc_claimAutoreleasedReturnValue(-[MTLCaptureDescriptorInternal captureObject](v8, "captureObject"));
  uint64_t v14 = objc_opt_class(&OBJC_CLASS___CaptureMTLDevice, v13);
  if ((objc_opt_isKindOfClass(v12, v14) & 1) != 0)
  {
    uint64_t v16 = 1LL;
  }

  else
  {
    uint64_t v17 = objc_opt_class(&OBJC_CLASS___CAMetalLayer, v15);
    if ((objc_opt_isKindOfClass(v12, v17) & 1) != 0)
    {
      uint64_t v16 = 6LL;
    }

    else
    {
      uint64_t v19 = objc_opt_class(&OBJC_CLASS___CaptureMTLCaptureScope, v18);
      if ((objc_opt_isKindOfClass(v12, v19) & 1) != 0)
      {
        uint64_t v16 = 4LL;
      }

      else
      {
        uint64_t v21 = objc_opt_class(&OBJC_CLASS___CaptureMTLCommandQueue, v20);
        if ((objc_opt_isKindOfClass(v12, v21) & 1) != 0) {
          uint64_t v16 = 3LL;
        }
        else {
          uint64_t v16 = 5LL;
        }
      }
    }
  }

  -[MTLCaptureDescriptorInternal setCaptureMode:](v8, "setCaptureMode:", v16);
  else {
    id v22 = [v6 triggerHitsToStart];
  }
  -[MTLCaptureDescriptorInternal setTriggerHitsToStart:](v8, "setTriggerHitsToStart:", v22);
  -[MTLCaptureDescriptorInternal setTriggerHitsToEnd:](v8, "setTriggerHitsToEnd:", [v6 triggerHitsToEnd]);
  -[MTLCaptureDescriptorInternal setSuspendAfterCapture:]( v8,  "setSuspendAfterCapture:",  [v6 suspendAfterCapture]);
  -[MTLCaptureDescriptorInternal setIgnoreUnusedResources:]( v8,  "setIgnoreUnusedResources:",  [v6 ignoreUnusedResources]);
  -[MTLCaptureDescriptorInternal setIncludeBacktrace:](v8, "setIncludeBacktrace:", [v6 includeBacktrace]);
  -[MTLCaptureDescriptorInternal setApiTriggeredCapture:](v8, "setApiTriggeredCapture:", 1LL);
  -[MTLCaptureDescriptorInternal setToolTriggeredCapture:](v8, "setToolTriggeredCapture:", 1LL);
  uint64_t v23 = objc_claimAutoreleasedReturnValue([v6 outputURL]);
  if (v23)
  {
    v24 = (NSURL *)v23;
    -[MTLCaptureDescriptorInternal setOutputURL:](v8, "setOutputURL:", v23);
  }

  else
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    v26 = (void *)objc_claimAutoreleasedReturnValue([v25 temporaryDirectory]);

    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
    v28 = (void *)objc_claimAutoreleasedReturnValue([v27 globallyUniqueString]);
    v29 = (void *)objc_claimAutoreleasedReturnValue([v28 stringByAppendingString:@".gputrace"]);

    v24 = -[NSURL initFileURLWithPath:isDirectory:relativeToURL:]( objc_alloc(&OBJC_CLASS___NSURL),  "initFileURLWithPath:isDirectory:relativeToURL:",  v29,  1LL,  v26);
    -[MTLCaptureDescriptorInternal setOutputURL:](v8, "setOutputURL:", v24);
  }

  v30 = self->_timer;
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472LL;
  v42[2] = __61__GTMTLCaptureService_startWithDescriptor_completionHandler___block_invoke;
  v42[3] = &unk_20D9D0;
  v31 = v30;
  v43 = v31;
  v32 = v24;
  v44 = v32;
  id v33 = v7;
  id v45 = v33;
  -[MTLCaptureDescriptorInternal setCompletionHandler:](v8, "setCompletionHandler:", v42);
  if (([v6 isToolsCapture] & 1) != 0 || !objc_msgSend(v6, "sessionID")) {
    uint64_t v34 = objc_claimAutoreleasedReturnValue( +[CaptureMTLCaptureManager toolsCaptureManager]( &OBJC_CLASS___CaptureMTLCaptureManager,  "toolsCaptureManager"));
  }
  else {
    uint64_t v34 = objc_claimAutoreleasedReturnValue( +[CaptureMTLCaptureManager sharedCaptureManager]( &OBJC_CLASS___CaptureMTLCaptureManager,  "sharedCaptureManager"));
  }
  v35 = (void *)v34;
  captureRequest = self->_captureRequest;
  self->_captureRequest = 0LL;

  id v41 = 0LL;
  unsigned __int8 v37 = [v35 startCaptureWithDescriptor:v8 error:&v41];
  id v38 = v41;
  if ((v37 & 1) != 0)
  {
    dispatch_resume((dispatch_object_t)self->_timer);
  }

  else
  {
    v39 = (void *)objc_opt_new(&OBJC_CLASS___GTCaptureCompletionState);
    [v39 setError:v38];
    (*((void (**)(id, void *))v33 + 2))(v33, v39);
  }

  return 0LL;
}

- (id)update:(id)a3
{
  id v3 = a3;
  id v4 = dispatch_group_create();
  v5 = objc_alloc(&OBJC_CLASS___NSMutableArray);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 requests]);
  v73 = -[NSMutableArray initWithCapacity:](v5, "initWithCapacity:", [v6 count]);

  id v66 = [v3 requestID];
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 requests]);
  id v8 = [v7 count];

  id v9 = &CACurrentMediaTime_ptr;
  if (v8)
  {
    unint64_t v10 = 0LL;
    v67 = v4;
    id v68 = v3;
    do
    {
      dispatch_group_enter(v4);
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v3 requests]);
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectAtIndexedSubscript:v10]);

      uint64_t v14 = objc_opt_class(&OBJC_CLASS___GTCaptureUpdateHighlight, v13);
      if ((objc_opt_isKindOfClass(v12, v14) & 1) != 0)
      {
        id v16 = v12;
        id v17 = [v16 requestID];
        id v18 = [v16 streamRef];
        unsigned __int8 v19 = [v16 enable];
        uint64_t Stream = GTTraceContext_getStream(g_ctx, (uint64_t)v18);
        if (Stream)
        {
          id v72 = v17;
          id v21 = *(id *)(Stream + 16);
          uint64_t v23 = objc_opt_class(&OBJC_CLASS___CAMetalLayer, v22);
          if ((objc_opt_isKindOfClass(v21, v23) & 1) != 0)
          {
            char v69 = v19;
            id v70 = v21;
            id v24 = v21;
            __int128 v91 = 0u;
            __int128 v92 = 0u;
            __int128 v93 = 0u;
            __int128 v94 = 0u;
            id v71 = v24;
            v25 = (void *)objc_claimAutoreleasedReturnValue([v24 superlayer]);
            v26 = (void *)objc_claimAutoreleasedReturnValue([v25 sublayers]);

            id v27 = [v26 countByEnumeratingWithState:&v91 objects:v99 count:16];
            if (v27)
            {
              uint64_t v28 = *(void *)v92;
              while (2)
              {
                for (i = 0LL; i != v27; i = (char *)i + 1)
                {
                  if (*(void *)v92 != v28) {
                    objc_enumerationMutation(v26);
                  }
                  v30 = *(void **)(*((void *)&v91 + 1) + 8LL * (void)i);
                  v31 = (void *)objc_claimAutoreleasedReturnValue([v30 name]);
                  unsigned int v32 = [v31 isEqualToString:@"gputools.overlay"];

                  if (v32)
                  {
                    id v27 = v30;
                    goto LABEL_25;
                  }
                }

                id v27 = [v26 countByEnumeratingWithState:&v91 objects:v99 count:16];
                if (v27) {
                  continue;
                }
                break;
              }

- (id)query:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc(&OBJC_CLASS___NSMutableArray);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 requests]);
  id v6 = -[NSMutableArray initWithCapacity:](v4, "initWithCapacity:", [v5 count]);

  id v40 = [v3 requestID];
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 requests]);
  id v8 = [v7 count];

  if (v8)
  {
    unint64_t v9 = 0LL;
    do
    {
      unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v3 requests]);
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectAtIndexedSubscript:v9]);

      uint64_t v13 = objc_opt_class(&OBJC_CLASS___GTCaptureQueryCapturables, v12);
      if ((objc_opt_isKindOfClass(v11, v13) & 1) != 0)
      {
        uint64_t v15 = (os_unfair_lock_s *)g_guestAppClientMTL;
        id v16 = v11;
        id v17 = GTMTLGuestAppClient_allCaptureObjects(v15);
        id v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
        unsigned __int8 v19 = (void *)objc_opt_new(&OBJC_CLASS___GTCaptureResponse);
        id v43 = 0LL;
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v18,  1LL,  &v43));
        id v21 = v43;
        [v19 setData:v20];

        [v19 setError:v21];
        id v22 = [v16 requestID];

        [v19 setRequestID:v22];
        -[NSMutableArray setObject:atIndexedSubscript:](v6, "setObject:atIndexedSubscript:", v19, v9);
      }

      else
      {
        uint64_t v23 = objc_opt_class(&OBJC_CLASS___GTCaptureQueryConfiguration, v14);
        if ((objc_opt_isKindOfClass(v11, v23) & 1) != 0)
        {
          id v24 = v11;
          id v18 = (void *)objc_opt_new(&OBJC_CLASS___GTCaptureConfiguration);
          [v18 setEnablePresentDownload:qword_23A448 & 1];
          [v18 setEnableLogErrors:((unint64_t)qword_23A448 >> 1) & 1];
          [v18 setDisableHashResources:(qword_23A448 & 0x20) == 0];
          [v18 setWaitEventTimeout:GT_ENV];
          [v18 setMaxDownloadCommandBuffers:qword_23A438];
          v25 = (void *)objc_opt_new(&OBJC_CLASS___GTCaptureResponse);
          id v42 = 0LL;
          v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v18,  1LL,  &v42));
          id v27 = v42;
          [v25 setData:v26];

          [v25 setError:v27];
          id v28 = [v24 requestID];

          [v25 setRequestID:v28];
          -[NSMutableArray setObject:atIndexedSubscript:](v6, "setObject:atIndexedSubscript:", v25, v9);
        }

        else
        {
          id v18 = (void *)objc_opt_new(&OBJC_CLASS___GTCaptureResponse);
          objc_msgSend(v18, "setRequestID:", objc_msgSend(v11, "requestID"));
          v29 = objc_alloc(&OBJC_CLASS___NSError);
          NSErrorUserInfoKey v44 = NSLocalizedDescriptionKey;
          id v45 = @"unknown request";
          v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v45,  &v44,  1LL));
          v31 = -[NSError initWithDomain:code:userInfo:]( v29,  "initWithDomain:code:userInfo:",  NSCocoaErrorDomain,  1LL,  v30);
          [v18 setError:v31];

          -[NSMutableArray setObject:atIndexedSubscript:](v6, "setObject:atIndexedSubscript:", v18, v9);
        }
      }

      ++v9;
      unsigned int v32 = (void *)objc_claimAutoreleasedReturnValue([v3 requests]);
      id v33 = [v32 count];
    }

    while ((unint64_t)v33 > v9);
  }

  id v34 = (void *)objc_opt_new(&OBJC_CLASS___GTCaptureResponse);
  id v35 = -[NSMutableArray copy](v6, "copy");
  id v41 = 0LL;
  unsigned int v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v35,  1LL,  &v41));
  id v37 = v41;
  [v34 setData:v36];

  [v34 setError:v37];
  [v34 setRequestID:v40];
  unsigned int v38 = (void (**)(void, void))objc_claimAutoreleasedReturnValue([v3 completionHandler]);
  ((void (**)(void, void *))v38)[2](v38, v34);

  return 0LL;
}

- (unint64_t)nextRequestID
{
  do
    unsigned int v2 = __ldaxr((unsigned int *)&g_requestID);
  while (__stlxr(v2 + 1, (unsigned int *)&g_requestID));
  return v2;
}

- (void)notifyCaptureObjectsChanged:(id)a3
{
  id v4 = a3;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = __51__GTMTLCaptureService_notifyCaptureObjectsChanged___block_invoke;
  v7[3] = &unk_20E0F0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(serialQueue, v7);
}

- (void)notifyCaptureProgress:(id)a3
{
  id v4 = a3;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = __45__GTMTLCaptureService_notifyCaptureProgress___block_invoke;
  v7[3] = &unk_20E0F0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(serialQueue, v7);
}

- (void)notifyUnsupportedFenum:(id)a3
{
  id v4 = a3;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = __46__GTMTLCaptureService_notifyUnsupportedFenum___block_invoke;
  v7[3] = &unk_20E0F0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(serialQueue, v7);
}

- (void)notifyCaptureRequest:(id)a3
{
  id v4 = a3;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = __44__GTMTLCaptureService_notifyCaptureRequest___block_invoke;
  v7[3] = &unk_20E0F0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(serialQueue, v7);
}

- (void).cxx_destruct
{
}

void __44__GTMTLCaptureService_notifyCaptureRequest___block_invoke(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 40) count])
  {
    unsigned int v2 = *(void **)(a1 + 40);
    id v3 = *(void **)(*(void *)(a1 + 32) + 40LL);
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472LL;
    v4[2] = __44__GTMTLCaptureService_notifyCaptureRequest___block_invoke_2;
    v4[3] = &unk_20DA48;
    id v5 = v2;
    [v3 notifyAll:v4];
  }

id __44__GTMTLCaptureService_notifyCaptureRequest___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 notifyCaptureRequest:*(void *)(a1 + 32)];
}

void __46__GTMTLCaptureService_notifyUnsupportedFenum___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 40);
  unsigned int v2 = *(void **)(*(void *)(a1 + 32) + 40LL);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = __46__GTMTLCaptureService_notifyUnsupportedFenum___block_invoke_2;
  v3[3] = &unk_20DA48;
  id v4 = v1;
  [v2 notifyAll:v3];
}

id __46__GTMTLCaptureService_notifyUnsupportedFenum___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 notifyUnsupportedFenum:*(void *)(a1 + 32)];
}

void __45__GTMTLCaptureService_notifyCaptureProgress___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 40);
  unsigned int v2 = *(void **)(*(void *)(a1 + 32) + 40LL);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = __45__GTMTLCaptureService_notifyCaptureProgress___block_invoke_2;
  v3[3] = &unk_20DA48;
  id v4 = v1;
  [v2 notifyAll:v3];
}

id __45__GTMTLCaptureService_notifyCaptureProgress___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 notifyCaptureProgress:*(void *)(a1 + 32)];
}

void __51__GTMTLCaptureService_notifyCaptureObjectsChanged___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 40);
  unsigned int v2 = *(void **)(*(void *)(a1 + 32) + 40LL);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = __51__GTMTLCaptureService_notifyCaptureObjectsChanged___block_invoke_2;
  v3[3] = &unk_20DA48;
  id v4 = v1;
  [v2 notifyAll:v3];
}

id __51__GTMTLCaptureService_notifyCaptureObjectsChanged___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 notifyCaptureObjectsChanged:*(void *)(a1 + 32)];
}

void __30__GTMTLCaptureService_update___block_invoke(uint64_t a1)
{
  *(_OWORD *)components = xmmword_1C2C10;
  __int128 v17 = unk_1C2C20;
  unsigned int v2 = (const __CFString *)CFPreferencesCopyValue( @"AppleHighlightColor",  kCFPreferencesAnyApplication,  kCFPreferencesCurrentUser,  kCFPreferencesAnyHost);
  if (v2)
  {
    id v3 = v2;
    ArrayBySeparatingStrings = CFStringCreateArrayBySeparatingStrings(0LL, v2, @" ");
    if (ArrayBySeparatingStrings)
    {
      id v5 = ArrayBySeparatingStrings;
      ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(ArrayBySeparatingStrings, 0LL);
      components[0] = CFStringGetDoubleValue(ValueAtIndex);
      id v7 = (const __CFString *)CFArrayGetValueAtIndex(v5, 1LL);
      components[1] = CFStringGetDoubleValue(v7);
      id v8 = (const __CFString *)CFArrayGetValueAtIndex(v5, 2LL);
      *(void *)&__int128 v17 = CFStringGetDoubleValue(v8);
      CFRelease(v5);
    }

    CFRelease(v3);
  }

  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  objc_msgSend(*(id *)(a1 + 32), "setBackgroundColor:", CGColorCreate(DeviceRGB, components));
  LODWORD(v10) = 0.5;
  [*(id *)(a1 + 32) setOpacity:v10];
  id v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) superlayer]);
  [v11 insertSublayer:*(void *)(a1 + 32) above:*(void *)(a1 + 40)];

  uint64_t v12 = (void *)objc_opt_new(&OBJC_CLASS___GTCaptureResponse);
  id v15 = 0LL;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  &__kCFBooleanTrue,  1LL,  &v15));
  id v14 = v15;
  [v12 setData:v13];

  [v12 setError:v14];
  [v12 setRequestID:*(void *)(a1 + 64)];
  [*(id *)(a1 + 48) setObject:v12 atIndexedSubscript:*(int *)(a1 + 72)];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __30__GTMTLCaptureService_update___block_invoke_2(uint64_t a1)
{
  unsigned int v2 = (void *)objc_opt_new(&OBJC_CLASS___GTCaptureResponse);
  id v5 = 0LL;
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  &__kCFBooleanTrue,  1LL,  &v5));
  id v4 = v5;
  [v2 setData:v3];

  [v2 setRequestID:*(void *)(a1 + 56)];
  [*(id *)(a1 + 40) setObject:v2 atIndexedSubscript:*(int *)(a1 + 64)];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __61__GTMTLCaptureService_startWithDescriptor_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = (id)objc_opt_new(&OBJC_CLASS___GTCaptureCompletionState);
  [v2 setArchiveURL:*(void *)(a1 + 40)];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

id __42__GTMTLCaptureService_deregisterObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) deregisterObserver:*(void *)(a1 + 40)];
}

id __61__GTMTLCaptureService_deregisterObserversForConnection_path___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 40) deregisterObserversForConnection:a1[5] path:a1[6]];
}

void *__40__GTMTLCaptureService_registerObserver___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 24) = [*(id *)(a1[4] + 40) registerObserver:a1[5]];
  result = (void *)a1[4];
  if (result[8]) {
    return objc_msgSend(result, "notifyCaptureRequest:");
  }
  return result;
}

void __40__GTMTLCaptureService_initWithGuestApp___block_invoke(id a1)
{
  if ((*(_DWORD *)(boundaryTrackerInstance + 20) & 0xFFFFFFFE) == 2)
  {
    unint64_t v1 = atomic_load(&g_frameCount);
    unint64_t v2 = atomic_load(&g_frameOther);
    unint64_t v3 = atomic_load(&g_commitCount);
    unint64_t v4 = atomic_load(&g_commitOther);
    unint64_t v5 = atomic_load(&g_resourceCount);
    unint64_t v6 = atomic_load(&g_resourceDownloaded);
    unint64_t v7 = atomic_load(&g_GPUDataSize);
    unint64_t v8 = atomic_load(&g_GPUDataDownloaded);
    id v18 = (id)objc_opt_new(&OBJC_CLASS___GTCaptureProgress);
    [v18 setCaptureState:1];
    unint64_t v9 = (void *)objc_opt_new(&OBJC_CLASS___GTCaptureProgressStatistics);
    [v18 setStats:v9];

    double v10 = (void *)objc_claimAutoreleasedReturnValue([v18 stats]);
    [v10 setFrameCount:v1];

    id v11 = (void *)objc_claimAutoreleasedReturnValue([v18 stats]);
    [v11 setFrameOther:v2];

    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v18 stats]);
    [v12 setCommitCount:v3];

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v18 stats]);
    [v13 setCommitOther:v4];

    id v14 = (void *)objc_claimAutoreleasedReturnValue([v18 stats]);
    [v14 setResourceCount:v5];

    id v15 = (void *)objc_claimAutoreleasedReturnValue([v18 stats]);
    [v15 setResourceDownloaded:v6];

    id v16 = (void *)objc_claimAutoreleasedReturnValue([v18 stats]);
    [v16 setGPUDataSize:v7];

    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v18 stats]);
    [v17 setGPUDataDownloaded:v8];

    if (*(_BYTE *)(g_guestAppClientMTL + 129)) {
      [*(id *)(g_guestAppClientMTL + 8) notifyCaptureProgress:v18];
    }
  }

@end