@interface MediaConversionQueue
- (BOOL)cancelForCameraIfPossibleAndRequiredForNextQueueEntry:(id)a3;
- (BOOL)copyConversionOutput:(id)a3 toRequestDestination:(id)a4 requestIdentifier:(id)a5 error:(id *)a6;
- (BOOL)delegateCanCancelCurrentlyProcessingRequestQueueEntry;
- (BOOL)enqueueEntry:(id)a3 clientRequest:(id)a4 isDuplicateOfOriginalQueueEntry:(id *)a5;
- (BOOL)findAndRemoveCancelledRequest:(id *)a3 queueEntryWithoutRemainingClients:(id *)a4 forRequestIdentifier:(id)a5 shouldCancelCurrentQueueEntry:(BOOL *)a6;
- (MediaConversionQueue)initWithDelegate:(id)a3;
- (MediaConversionQueueDelegate)delegate;
- (MediaConversionQueueEntry)currentlyProcessingRequestQueueEntry;
- (NSMutableArray)queuedRequests;
- (OS_dispatch_queue)cameraWatcherQueue;
- (OS_dispatch_queue)requestProcessingQueue;
- (PFCameraViewfinderSessionWatcher)cameraWatcher;
- (id)anyDestinationURLCollectionForQueueEntry:(id)a3;
- (id)entriesSortedByExecutionOrderForPendingEntries:(id)a3;
- (id)markCompletionAndRetrieveClientRequestsForQueueEntry:(id)a3 resultURLCollection:(id)a4 didConvertSuccessfully:(BOOL)a5 conversionOutputInformation:(id)a6 conversionOutputData:(id)a7 conversionOutputFileType:(id)a8 conversionError:(id)a9;
- (id)optimizeQueueAndDequeueNextRequestQueueEntry;
- (id)orderingSummaryForRequestList:(id)a3;
- (id)queueEntryWithConversionOptions:(id)a3;
- (os_unfair_lock_s)queueStateLock;
- (unint64_t)nextRequestNumber;
- (unint64_t)queueEntryCounter;
- (unint64_t)requestCounter;
- (void)assertDelegate:(id)a3 respondsToSelector:(SEL)a4;
- (void)cameraWatcherDidChangeState:(id)a3;
- (void)cancelRequestWithIdentifier:(id)a3;
- (void)cancelRequestsForConnectionIdentifier:(id)a3;
- (void)enumerateCurrentlyProcessingAndQueuedEntries:(id)a3;
- (void)modifyRequestWithIdentifier:(id)a3 changeHandler:(id)a4;
- (void)processCompletedQueueEntry:(id)a3 resultURLCollection:(id)a4 didConvertSuccessfully:(BOOL)a5 conversionOutputInformation:(id)a6 conversionOutputData:(id)a7 conversionOutputFileType:(id)a8 conversionError:(id)a9;
- (void)processQueue;
- (void)scheduleQueueProcessing;
- (void)sendCancellationReplyForClientRequest:(id)a3;
- (void)setCameraWatcher:(id)a3;
- (void)setCameraWatcherQueue:(id)a3;
- (void)setCurrentlyProcessingRequestQueueEntry:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setQueueEntryCounter:(unint64_t)a3;
- (void)setQueueStateLock:(os_unfair_lock_s)a3;
- (void)setQueuedRequests:(id)a3;
- (void)setRequestCounter:(unint64_t)a3;
- (void)setRequestProcessingQueue:(id)a3;
@end

@implementation MediaConversionQueue

- (MediaConversionQueue)initWithDelegate:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___MediaConversionQueue;
  v5 = -[MediaConversionQueue init](&v20, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    queuedRequests = v6->_queuedRequests;
    v6->_queuedRequests = (NSMutableArray *)v7;

    dispatch_queue_attr_t v9 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v9);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.photos.media-conversion.requestProcessing", v10);
    requestProcessingQueue = v6->_requestProcessingQueue;
    v6->_requestProcessingQueue = (OS_dispatch_queue *)v11;

    dispatch_queue_attr_t v13 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v13);
    dispatch_queue_t v15 = dispatch_queue_create("com.apple.photos.media-conversion.cameraWatcher", v14);
    cameraWatcherQueue = v6->_cameraWatcherQueue;
    v6->_cameraWatcherQueue = (OS_dispatch_queue *)v15;

    v6->_queueStateLock._os_unfair_lock_opaque = 0;
    v17 = -[PFCameraViewfinderSessionWatcher initWithDispatchQueue:delegate:]( objc_alloc(&OBJC_CLASS___PFCameraViewfinderSessionWatcher),  "initWithDispatchQueue:delegate:",  v6->_cameraWatcherQueue,  v6);
    cameraWatcher = v6->_cameraWatcher;
    v6->_cameraWatcher = v17;

    -[PFCameraViewfinderSessionWatcher startWatching](v6->_cameraWatcher, "startWatching");
  }

  return v6;
}

- (unint64_t)nextRequestNumber
{
  p_queueStateLock = &self->_queueStateLock;
  os_unfair_lock_lock(&self->_queueStateLock);
  unint64_t v4 = self->_requestCounter + 1;
  self->_requestCounter = v4;
  os_unfair_lock_unlock(p_queueStateLock);
  return v4;
}

- (id)queueEntryWithConversionOptions:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    dispatch_queue_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v11 handleFailureInMethod:a2, self, @"PAMediaConversionServiceSharedUtilitiesServiceSide.m", 400, @"Invalid parameter not satisfying: %@", @"conversionOptions" object file lineNumber description];
  }

  os_unfair_lock_lock(&self->_queueStateLock);
  unint64_t v6 = self->_queueEntryCounter + 1;
  self->_queueEntryCounter = v6;
  os_unfair_lock_unlock(&self->_queueStateLock);
  uint64_t v7 = objc_alloc(&OBJC_CLASS___MediaConversionQueueEntry);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"QE-%lu", v6));
  dispatch_queue_attr_t v9 = -[MediaConversionQueueEntry initWithIdentifier:initialConversionOptions:]( v7,  "initWithIdentifier:initialConversionOptions:",  v8,  v5);

  return v9;
}

- (BOOL)enqueueEntry:(id)a3 clientRequest:(id)a4 isDuplicateOfOriginalQueueEntry:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v38 = 0LL;
  v39 = &v38;
  uint64_t v40 = 0x2020000000LL;
  char v41 = 0;
  uint64_t v34 = 0LL;
  v35 = &v34;
  uint64_t v36 = 0x2020000000LL;
  char v37 = 0;
  uint64_t v28 = 0LL;
  v29 = &v28;
  uint64_t v30 = 0x3032000000LL;
  v31 = sub_100009550;
  v32 = sub_100009560;
  id v33 = 0LL;
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 requestTracker]);
  os_unfair_lock_lock(&self->_queueStateLock);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_10000C350;
  v22[3] = &unk_100030D30;
  id v11 = v8;
  id v23 = v11;
  v25 = &v38;
  id v12 = v9;
  id v24 = v12;
  v26 = &v34;
  v27 = &v28;
  -[MediaConversionQueue enumerateCurrentlyProcessingAndQueuedEntries:]( self,  "enumerateCurrentlyProcessingAndQueuedEntries:",  v22);
  BOOL v13 = *((_BYTE *)v35 + 24) == 0;
  if (*((_BYTE *)v35 + 24))
  {
    id v14 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      dispatch_queue_t v15 = (void *)objc_claimAutoreleasedReturnValue([v12 identifier]);
      v16 = (MediaConversionQueueEntry *)objc_claimAutoreleasedReturnValue([v11 identifier]);
      uint64_t v17 = v29[5];
      *(_DWORD *)buf = 138543874;
      id v43 = v15;
      __int16 v44 = 2114;
      v45 = v16;
      __int16 v46 = 2114;
      uint64_t v47 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "New queue entry %{public}@ for request %{public}@ is duplicate of existing entry %{public}@ but identical output is required but not present",  buf,  0x20u);
    }

LABEL_5:
    v18 = 0LL;
    goto LABEL_6;
  }

  if (*((_BYTE *)v39 + 24))
  {
    if ((MediaConversionQueueEntry *)v29[5] == self->_currentlyProcessingRequestQueueEntry) {
      [v10 didDequeueAndStartProcessingRequest];
    }
    if (!a5) {
      goto LABEL_5;
    }
    v18 = 0LL;
    *a5 = (id) v29[5];
  }

  else
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue([v12 identifier]);
    [v11 setInitialRequestIdentifier:v21];

    [v11 addClientRequest:v12];
    -[NSMutableArray addObject:](self->_queuedRequests, "addObject:", v11);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      id v43 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Enqueued new queue entry %{public}@",  buf,  0xCu);
    }

    if (-[MediaConversionQueue delegateCanCancelCurrentlyProcessingRequestQueueEntry]( self,  "delegateCanCancelCurrentlyProcessingRequestQueueEntry")
      && ([v11 allRequestsAreBackground] & 1) == 0)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Currently processing queue entry is optional, cancelling because non-optional non-background work was enqueued",  buf,  2u);
      }

      v18 = self->_currentlyProcessingRequestQueueEntry;
    }

    else
    {
      v18 = 0LL;
    }

    -[MediaConversionQueue scheduleQueueProcessing](self, "scheduleQueueProcessing");
  }

- (BOOL)delegateCanCancelCurrentlyProcessingRequestQueueEntry
{
  if (!self->_currentlyProcessingRequestQueueEntry) {
    return 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector(WeakRetained, "conversionQueue:didCancelQueuedEntry:clientRequests:") & 1) != 0) {
    BOOL v4 = -[MediaConversionQueueEntry allRequestsAreOptional]( self->_currentlyProcessingRequestQueueEntry,  "allRequestsAreOptional");
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (void)enumerateCurrentlyProcessingAndQueuedEntries:(id)a3
{
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_queueStateLock);
  char v9 = 0;
  currentlyProcessingRequestQueueEntry = self->_currentlyProcessingRequestQueueEntry;
  if (!currentlyProcessingRequestQueueEntry
    || ((*((void (**)(id, MediaConversionQueueEntry *, char *))v4 + 2))( v4,  currentlyProcessingRequestQueueEntry,  &v9),  !v9))
  {
    queuedRequests = self->_queuedRequests;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_10000C340;
    v7[3] = &unk_100030D58;
    id v8 = v4;
    -[NSMutableArray enumerateObjectsUsingBlock:](queuedRequests, "enumerateObjectsUsingBlock:", v7);
  }
}

- (id)anyDestinationURLCollectionForQueueEntry:(id)a3
{
  p_queueStateLock = &self->_queueStateLock;
  id v4 = a3;
  os_unfair_lock_lock(p_queueStateLock);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 anyDestinationURLCollection]);

  os_unfair_lock_unlock(p_queueStateLock);
  return v5;
}

- (void)scheduleQueueProcessing
{
  requestProcessingQueue = self->_requestProcessingQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000C338;
  block[3] = &unk_100030F78;
  block[4] = self;
  dispatch_async((dispatch_queue_t)requestProcessingQueue, block);
}

- (void)processQueue
{
  id v13 = (id)os_transaction_create("com.apple.photos.mediaconversion.conversion-task-processing");
  dispatch_assert_queue_V2((dispatch_queue_t)self->_requestProcessingQueue);
  os_unfair_lock_lock(&self->_queueStateLock);
  if (self->_currentlyProcessingRequestQueueEntry)
  {
    char v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v9 handleFailureInMethod:a2 object:self file:@"PAMediaConversionServiceSharedUtilitiesServiceSide.m" lineNumber:531 description:@"Unexpected current request"];
  }

  id v4 = (MediaConversionQueueEntry *)objc_claimAutoreleasedReturnValue( -[MediaConversionQueue optimizeQueueAndDequeueNextRequestQueueEntry]( self,  "optimizeQueueAndDequeueNextRequestQueueEntry"));
  currentlyProcessingRequestQueueEntry = self->_currentlyProcessingRequestQueueEntry;
  self->_currentlyProcessingRequestQueueEntry = v4;

  unint64_t v6 = self->_currentlyProcessingRequestQueueEntry;
  os_unfair_lock_unlock(&self->_queueStateLock);
  if (v6)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (WeakRetained)
    {
      id v8 = objc_autoreleasePoolPush();
      [WeakRetained conversionQueue:self processNextEntry:self->_currentlyProcessingRequestQueueEntry];
      objc_autoreleasePoolPop(v8);
      if (self->_currentlyProcessingRequestQueueEntry)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
        id v11 = NSStringFromSelector( "markCompletionAndRetrieveClientRequestsForQueueEntry:resultURLCollection:didConvertSuccessfully:conversi onOutputInformation:conversionOutputData:conversionOutputFileType:conversionError:");
        id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
        [v10 handleFailureInMethod:a2, self, @"PAMediaConversionServiceSharedUtilitiesServiceSide.m", 548, @"Delegate failed to call %@ during processing", v12, v13 object file lineNumber description];
      }

      if ((objc_opt_respondsToSelector(WeakRetained, "conversionQueueDidFinishProcessingEntry:") & 1) != 0) {
        [WeakRetained conversionQueueDidFinishProcessingEntry:self];
      }
    }
  }
}

- (id)optimizeQueueAndDequeueNextRequestQueueEntry
{
  if (-[NSMutableArray count](self->_queuedRequests, "count"))
  {
    id v4 = -[NSMutableArray copy](self->_queuedRequests, "copy");
    id v5 = (void *)objc_claimAutoreleasedReturnValue( -[MediaConversionQueue entriesSortedByExecutionOrderForPendingEntries:]( self,  "entriesSortedByExecutionOrderForPendingEntries:",  v4));
    unint64_t v6 = (NSMutableArray *)[v5 mutableCopy];
    queuedRequests = self->_queuedRequests;
    self->_queuedRequests = v6;

    if (([v4 isEqualToArray:v5] & 1) == 0
      && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MediaConversionQueue orderingSummaryForRequestList:](self, "orderingSummaryForRequestList:", v4));
      char v9 = (void *)objc_claimAutoreleasedReturnValue(-[MediaConversionQueue orderingSummaryForRequestList:](self, "orderingSummaryForRequestList:", v5));
      int v13 = 138543618;
      id v14 = v8;
      __int16 v15 = 2114;
      v16 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Queue reordered from %{public}@ to %{public}@",  (uint8_t *)&v13,  0x16u);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->_queuedRequests, "firstObject"));
    if (!v10)
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
      [v12 handleFailureInMethod:a2 object:self file:@"PAMediaConversionServiceSharedUtilitiesServiceSide.m" lineNumber:576 description:@"Unexpected empty queue"];
    }

    -[NSMutableArray removeObjectAtIndex:](self->_queuedRequests, "removeObjectAtIndex:", 0LL);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      int v13 = 138543362;
      id v14 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Processing queue, dequeued %{public}@",  (uint8_t *)&v13,  0xCu);
    }

    if (-[MediaConversionQueue cancelForCameraIfPossibleAndRequiredForNextQueueEntry:]( self,  "cancelForCameraIfPossibleAndRequiredForNextQueueEntry:",  v10))
    {

      -[MediaConversionQueue scheduleQueueProcessing](self, "scheduleQueueProcessing");
      v10 = 0LL;
    }

    else
    {
      [v10 didDequeueAndStartProcessingQueueEntry];
    }

    return v10;
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      LOWORD(v13) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Processing queue is empty",  (uint8_t *)&v13,  2u);
    }

    return 0LL;
  }

- (BOOL)cancelForCameraIfPossibleAndRequiredForNextQueueEntry:(id)a3
{
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_queueStateLock);
  v26 = v4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 initialRequestConversionOptions]);
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( [v5 objectForKeyedSubscript:@"PAMediaConversionServiceOptionUnitTestSupportServiceShouldSimulateCameraActiveKey"]);
  unsigned __int8 v7 = [v6 BOOLValue];

  if ((v7 & 1) != 0) {
    unsigned int v8 = 0;
  }
  else {
    unsigned int v8 = -[PFCameraViewfinderSessionWatcher isCameraRunning](self->_cameraWatcher, "isCameraRunning") ^ 1;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector(WeakRetained, "conversionQueue:didCancelQueuedEntry:clientRequests:") & 1) != 0
    && (([v26 allRequestsAreOptional] ^ 1 | v8) & 1) == 0)
  {
    id v23 = WeakRetained;
    id v24 = self;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v35 = v26;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Cancelling next queue entry %{public}@ because it is optional and camera viewfinder is running",  buf,  0xCu);
    }

    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue([v26 clientRequestsSnapshot]);
    id v11 = [obj countByEnumeratingWithState:&v27 objects:v33 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v28;
      do
      {
        for (i = 0LL; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v28 != v13) {
            objc_enumerationMutation(obj);
          }
          __int16 v15 = *(void **)(*((void *)&v27 + 1) + 8LL * (void)i);
          v16 = (void *)objc_claimAutoreleasedReturnValue([v15 requestTracker]);
          NSErrorUserInfoKey v31 = NSDebugDescriptionErrorKey;
          uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v15 identifier]);
          v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Queued request %@ cancelled for camera",  v17));
          v32 = v18;
          v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v32,  &v31,  1LL));
          objc_super v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"PAMediaConversionServiceErrorDomain",  5LL,  v19));

          [v16 setError:v20];
          v21 = (void *)objc_claimAutoreleasedReturnValue([v26 initialRequestIdentifier]);
          [v16 markAsCompletedWithInitialRequestIdentifier:v21];
        }

        id v12 = [obj countByEnumeratingWithState:&v27 objects:v33 count:16];
      }

      while (v12);
    }

    id WeakRetained = v23;
    [v23 conversionQueue:v24 didCancelQueuedEntry:v26 clientRequests:obj];

    BOOL v10 = 1;
  }

  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (id)entriesSortedByExecutionOrderForPendingEntries:(id)a3
{
  p_queueStateLock = &self->_queueStateLock;
  id v4 = a3;
  os_unfair_lock_assert_owner(p_queueStateLock);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 sortedArrayUsingComparator:&stru_100030D98]);

  return v5;
}

- (id)markCompletionAndRetrieveClientRequestsForQueueEntry:(id)a3 resultURLCollection:(id)a4 didConvertSuccessfully:(BOOL)a5 conversionOutputInformation:(id)a6 conversionOutputData:(id)a7 conversionOutputFileType:(id)a8 conversionError:(id)a9
{
  BOOL v12 = a5;
  v16 = (MediaConversionQueueEntry *)a3;
  id v17 = a4;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  if (!v16)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v25 handleFailureInMethod:a2, self, @"PAMediaConversionServiceSharedUtilitiesServiceSide.m", 639, @"Invalid parameter not satisfying: %@", @"completedQueueEntry" object file lineNumber description];
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_requestProcessingQueue);
  os_unfair_lock_lock(&self->_queueStateLock);
  currentlyProcessingRequestQueueEntry = v16;
  if (self->_currentlyProcessingRequestQueueEntry != v16)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v26 handleFailureInMethod:a2, self, @"PAMediaConversionServiceSharedUtilitiesServiceSide.m", 643, @"Completed / current request mismatch: %@ / %@", v16, self->_currentlyProcessingRequestQueueEntry object file lineNumber description];

    currentlyProcessingRequestQueueEntry = self->_currentlyProcessingRequestQueueEntry;
  }

  self->_currentlyProcessingRequestQueueEntry = 0LL;

  os_unfair_lock_unlock(&self->_queueStateLock);
  -[MediaConversionQueue processCompletedQueueEntry:resultURLCollection:didConvertSuccessfully:conversionOutputInformation:conversionOutputData:conversionOutputFileType:conversionError:]( self,  "processCompletedQueueEntry:resultURLCollection:didConvertSuccessfully:conversionOutputInformation:conversionOutputDa ta:conversionOutputFileType:conversionError:",  v16,  v17,  v12,  v18,  v19,  v20,  v21);
  id v23 = (void *)objc_claimAutoreleasedReturnValue(-[MediaConversionQueueEntry clientRequestsSnapshot](v16, "clientRequestsSnapshot"));

  return v23;
}

- (void)processCompletedQueueEntry:(id)a3 resultURLCollection:(id)a4 didConvertSuccessfully:(BOOL)a5 conversionOutputInformation:(id)a6 conversionOutputData:(id)a7 conversionOutputFileType:(id)a8 conversionError:(id)a9
{
  BOOL v12 = a5;
  id v16 = a3;
  id v42 = a4;
  id v47 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_requestProcessingQueue);
  char v41 = self;
  os_unfair_lock_assert_not_owner(&self->_queueStateLock);
  __int16 v46 = v19;
  BOOL v49 = v12;
  if ((v19 == 0LL) != v12)
  {
    uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v38 handleFailureInMethod:a2, self, @"PAMediaConversionServiceSharedUtilitiesServiceSide.m", 668, @"Invalid parameter not satisfying: %@", @"(didConvertSuccessfully || error) && !(didConvertSuccessfully && error)" object file lineNumber description];

    if (v16) {
      goto LABEL_3;
    }
LABEL_35:
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v39 handleFailureInMethod:a2, self, @"PAMediaConversionServiceSharedUtilitiesServiceSide.m", 669, @"Invalid parameter not satisfying: %@", @"completedQueueEntry" object file lineNumber description];

    goto LABEL_3;
  }

  if (!v16) {
    goto LABEL_35;
  }
LABEL_3:
  id v20 = (void *)objc_claimAutoreleasedReturnValue([v16 initialRequestConversionOptions]);
  id v21 = (void *)objc_claimAutoreleasedReturnValue( [v20 objectForKeyedSubscript:@"PAMediaConversionServiceOptionWantsResultAsDataKey"]);
  unsigned int v45 = [v21 BOOLValue];

  v22 = (void *)objc_claimAutoreleasedReturnValue([v16 initialRequestConversionOptions]);
  id v23 = (void *)objc_claimAutoreleasedReturnValue( [v22 objectForKeyedSubscript:@"PAMediaConversionServiceOptionIsPhotosAdjustmentsCalculationKey"]);
  unsigned int v24 = [v23 BOOLValue];

  if (!v17 && v49 && v45 && !v24)
  {
    uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v40 handleFailureInMethod:a2 object:self file:@"PAMediaConversionServiceSharedUtilitiesServiceSide.m" lineNumber:678 description:@"Unexpected nil output data for completed conversion with result requested as data"];
  }

  v25 = (void *)objc_claimAutoreleasedReturnValue([v16 clientRequestsSnapshot]);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v57 = v16;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Conversion completed: %{public}@",  buf,  0xCu);
  }

  v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  __int128 v53 = 0u;
  __int128 v54 = 0u;
  id v26 = v25;
  id v27 = [v26 countByEnumeratingWithState:&v51 objects:v55 count:16];
  if (v27)
  {
    id v28 = v27;
    uint64_t v29 = *(void *)v52;
    do
    {
      for (i = 0LL; i != v28; i = (char *)i + 1)
      {
        if (*(void *)v52 != v29) {
          objc_enumerationMutation(v26);
        }
        NSErrorUserInfoKey v31 = *(void **)(*((void *)&v51 + 1) + 8LL * (void)i);
        v32 = (void *)objc_claimAutoreleasedReturnValue([v31 requestTracker]);
        [v32 setOutputData:v17];
        [v32 setOutputTypeIdentifier:v18];
        if (!v49)
        {
          [v32 setError:v46];
          goto LABEL_31;
        }

        id v33 = (void *)objc_claimAutoreleasedReturnValue([v32 destinationURLCollection]);
        if ([v48 containsObject:v33])
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543362;
            id v57 = v26;
            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Request %{public}@ has same destination as another request handled by the same conversion, not copying output",  buf,  0xCu);
          }
        }

        else if ([v16 taskTypeSupportsDeduplication])
        {
          unsigned __int8 v34 = [v31 requiresDeduplicationAgainstOriginalWithIdenticalOutput];
          if ((v45 & 1) != 0) {
            goto LABEL_26;
          }
          if ((v34 & 1) == 0)
          {
            v35 = (void *)objc_claimAutoreleasedReturnValue([v32 requestIdentifier]);
            id v50 = 0LL;
            unsigned int v43 = -[MediaConversionQueue copyConversionOutput:toRequestDestination:requestIdentifier:error:]( v41,  "copyConversionOutput:toRequestDestination:requestIdentifier:error:",  v42,  v33,  v35,  &v50);
            id v44 = v50;

            if (v43)
            {
              [v48 addObject:v33];
              uint64_t v36 = v44;
            }

            else
            {
              uint64_t v36 = v44;
              [v32 setError:v44];
            }
          }
        }

        else if (v45)
        {
LABEL_26:
          [v32 setOutputData:v17];
          if (v18) {
            [v32 setOutputTypeIdentifier:v18];
          }
        }

        [v32 setOutputInformation:v47];

LABEL_31:
        char v37 = (void *)objc_claimAutoreleasedReturnValue([v16 initialRequestIdentifier]);
        [v32 markAsCompletedWithInitialRequestIdentifier:v37];
      }

      id v28 = [v26 countByEnumeratingWithState:&v51 objects:v55 count:16];
    }

    while (v28);
  }
}

- (BOOL)copyConversionOutput:(id)a3 toRequestDestination:(id)a4 requestIdentifier:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v31 = 0LL;
  v32 = &v31;
  uint64_t v33 = 0x2020000000LL;
  char v34 = 1;
  uint64_t v25 = 0LL;
  id v26 = &v25;
  uint64_t v27 = 0x3032000000LL;
  id v28 = sub_100009550;
  uint64_t v29 = sub_100009560;
  id v30 = 0LL;
  BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_10000C03C;
  v19[3] = &unk_100030DC0;
  id v13 = v10;
  id v20 = v13;
  id v14 = v11;
  id v21 = v14;
  id v23 = &v31;
  unsigned int v24 = &v25;
  id v15 = v12;
  id v22 = v15;
  [v9 enumerateResourceURLs:v19];
  int v16 = *((unsigned __int8 *)v32 + 24);
  if (a6 && !*((_BYTE *)v32 + 24))
  {
    *a6 = (id) v26[5];
    int v16 = *((unsigned __int8 *)v32 + 24);
  }

  BOOL v17 = v16 != 0;

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);

  return v17;
}

- (id)orderingSummaryForRequestList:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a3 valueForKey:@"identifier"]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 componentsJoinedByString:@" "]);

  return v4;
}

- (void)modifyRequestWithIdentifier:(id)a3 changeHandler:(id)a4
{
  id v7 = a3;
  unsigned int v8 = (void (**)(id, void))a4;
  if (!v7)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v10 handleFailureInMethod:a2, self, @"PAMediaConversionServiceSharedUtilitiesServiceSide.m", 767, @"Invalid parameter not satisfying: %@", @"requestIdentifier" object file lineNumber description];
  }

  os_unfair_lock_lock(&self->_queueStateLock);
  uint64_t v14 = 0LL;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000LL;
  BOOL v17 = sub_100009550;
  id v18 = sub_100009560;
  id v19 = 0LL;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10000BFE0;
  v11[3] = &unk_100030DE8;
  id v13 = &v14;
  id v9 = v7;
  id v12 = v9;
  -[MediaConversionQueue enumerateCurrentlyProcessingAndQueuedEntries:]( self,  "enumerateCurrentlyProcessingAndQueuedEntries:",  v11);
  v8[2](v8, v15[5]);

  _Block_object_dispose(&v14, 8);
  os_unfair_lock_unlock(&self->_queueStateLock);
}

- (void)cancelRequestWithIdentifier:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v10 handleFailureInMethod:a2, self, @"PAMediaConversionServiceSharedUtilitiesServiceSide.m", 792, @"Invalid parameter not satisfying: %@", @"requestIdentifier" object file lineNumber description];
  }

  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[MediaConversionQueue delegate](self, "delegate"));
  if (v6)
  {
    v13[0] = 0;
    os_unfair_lock_lock(&self->_queueStateLock);
    id v11 = 0LL;
    id v12 = 0LL;
    unsigned __int8 v7 = -[MediaConversionQueue findAndRemoveCancelledRequest:queueEntryWithoutRemainingClients:forRequestIdentifier:shouldCancelCurrentQueueEntry:]( self,  "findAndRemoveCancelledRequest:queueEntryWithoutRemainingClients:forRequestIdentifier:shouldCancelCurrentQueueEntry:",  &v12,  &v11,  v5,  v13);
    id v8 = v12;
    id v9 = v11;
    os_unfair_lock_unlock(&self->_queueStateLock);
    if ((v7 & 1) != 0)
    {
      if (v8) {
        -[MediaConversionQueue sendCancellationReplyForClientRequest:]( self,  "sendCancellationReplyForClientRequest:",  v8);
      }
      if (v13[0])
      {
        -[MediaConversionQueue assertDelegate:respondsToSelector:]( self,  "assertDelegate:respondsToSelector:",  v6,  "conversionQueue:cancelCurrentlyProcessingEntry:");
        [v6 conversionQueue:self cancelCurrentlyProcessingEntry:v9];
      }
    }
  }
}

- (BOOL)findAndRemoveCancelledRequest:(id *)a3 queueEntryWithoutRemainingClients:(id *)a4 forRequestIdentifier:(id)a5 shouldCancelCurrentQueueEntry:(BOOL *)a6
{
  id v10 = a5;
  os_unfair_lock_assert_owner(&self->_queueStateLock);
  uint64_t v27 = 0LL;
  id v28 = &v27;
  uint64_t v29 = 0x3032000000LL;
  id v30 = sub_100009550;
  uint64_t v31 = sub_100009560;
  id v32 = 0LL;
  uint64_t v21 = 0LL;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000LL;
  unsigned int v24 = sub_100009550;
  uint64_t v25 = sub_100009560;
  id v26 = 0LL;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10000BEA0;
  v17[3] = &unk_100030E10;
  id v19 = &v27;
  id v11 = (MediaConversionQueueEntry *)v10;
  id v18 = v11;
  id v20 = &v21;
  -[MediaConversionQueue enumerateCurrentlyProcessingAndQueuedEntries:]( self,  "enumerateCurrentlyProcessingAndQueuedEntries:",  v17);
  uint64_t v12 = v28[5];
  if (v12)
  {
    id v13 = (MediaConversionQueueEntry *)v22[5];
    if (v13)
    {
      currentlyProcessingRequestQueueEntry = self->_currentlyProcessingRequestQueueEntry;
      BOOL v15 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO);
      if (v13 == currentlyProcessingRequestQueueEntry)
      {
        if (v15)
        {
          *(_DWORD *)buf = 138543362;
          char v34 = v13;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Cancelling currently processing request queue entry without remaining clients %{public}@",  buf,  0xCu);
        }

        *a6 = 1;
        if (!a3) {
          goto LABEL_9;
        }
LABEL_8:
        *a3 = (id) v28[5];
LABEL_9:
        if (a4) {
          *a4 = (id) v22[5];
        }
        goto LABEL_13;
      }

      if (v15)
      {
        *(_DWORD *)buf = 138543362;
        char v34 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Dequeueing pending request queue entry without remaining clients %{public}@",  buf,  0xCu);
        id v13 = (MediaConversionQueueEntry *)v22[5];
      }

      -[NSMutableArray removeObject:](self->_queuedRequests, "removeObject:", v13);
    }

    if (!a3) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    char v34 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Ignoring cancellation request for unknown request identifier %{public}@",  buf,  0xCu);
  }

- (void)assertDelegate:(id)a3 respondsToSelector:(SEL)a4
{
  id v7 = a3;
  id v12 = v7;
  if (!v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v8 handleFailureInMethod:a2, self, @"PAMediaConversionServiceSharedUtilitiesServiceSide.m", 884, @"Invalid parameter not satisfying: %@", @"strongDelegate" object file lineNumber description];

    id v7 = 0LL;
  }

  if ((objc_opt_respondsToSelector(v7, a4) & 1) == 0)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    id v10 = NSStringFromSelector(a4);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    [v9 handleFailureInMethod:a2, self, @"PAMediaConversionServiceSharedUtilitiesServiceSide.m", 885, @"Delegate %@ doesn't implement %@", v12, v11 object file lineNumber description];
  }
}

- (void)cancelRequestsForConnectionIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  os_unfair_lock_lock(&self->_queueStateLock);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10000BE5C;
  v17[3] = &unk_100030E38;
  id v6 = v5;
  id v18 = v6;
  id v7 = v4;
  id v19 = v7;
  -[MediaConversionQueue enumerateCurrentlyProcessingAndQueuedEntries:]( self,  "enumerateCurrentlyProcessingAndQueuedEntries:",  v17);
  os_unfair_lock_unlock(&self->_queueStateLock);
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v13 objects:v20 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      id v12 = 0LL;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        -[MediaConversionQueue cancelRequestWithIdentifier:]( self,  "cancelRequestWithIdentifier:",  *(void *)(*((void *)&v13 + 1) + 8LL * (void)v12),  (void)v13);
        id v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v13 objects:v20 count:16];
    }

    while (v10);
  }
}

- (void)sendCancellationReplyForClientRequest:(id)a3
{
  p_queueStateLock = &self->_queueStateLock;
  id v6 = a3;
  os_unfair_lock_assert_not_owner(p_queueStateLock);
  if (!v6)
  {
    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v13 handleFailureInMethod:a2, self, @"PAMediaConversionServiceSharedUtilitiesServiceSide.m", 906, @"Invalid parameter not satisfying: %@", @"cancelledRequest" object file lineNumber description];
  }

  NSErrorUserInfoKey v14 = NSDebugDescriptionErrorKey;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 cancellationReasonDebugDescription]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Request %@ cancelled with reason: %@",  v7,  v8));
  __int128 v15 = v9;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v15,  &v14,  1LL));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"PAMediaConversionServiceErrorDomain",  5LL,  v10));

  id v12 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue([v6 videoClientReplyHandler]);
  ((void (**)(void, uint64_t, void, void *))v12)[2](v12, 4LL, 0LL, v11);
}

- (void)cameraWatcherDidChangeState:(id)a3
{
  cameraWatcherQueue = self->_cameraWatcherQueue;
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)cameraWatcherQueue);
  unsigned int v6 = [v5 isCameraRunning];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MediaConversionQueue delegate](self, "delegate"));
  int v8 = objc_opt_respondsToSelector(v7, "conversionQueue:cancelCurrentlyProcessingEntry:");
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    v10[0] = 67109632;
    v10[1] = v6;
    __int16 v11 = 2048;
    id v12 = v7;
    __int16 v13 = 1024;
    int v14 = v8 & 1;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Media conversion queue camera watcher state change, new state = %d, delegate (%p) present and supports cancellation: %d",  (uint8_t *)v10,  0x18u);
  }

  if ((v6 & v8) == 1)
  {
    os_unfair_lock_lock(&self->_queueStateLock);
    if (-[MediaConversionQueue delegateCanCancelCurrentlyProcessingRequestQueueEntry]( self,  "delegateCanCancelCurrentlyProcessingRequestQueueEntry"))
    {
      id v9 = self->_currentlyProcessingRequestQueueEntry;
      os_unfair_lock_unlock(&self->_queueStateLock);
      if (v9)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
        {
          LOWORD(v10[0]) = 0;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Currently processing queue entry is optional, cancelling because camera started up",  (uint8_t *)v10,  2u);
        }

        [v7 conversionQueue:self cancelCurrentlyProcessingEntry:v9];
      }
    }

    else
    {
      os_unfair_lock_unlock(&self->_queueStateLock);
    }
  }
}

- (os_unfair_lock_s)queueStateLock
{
  return self->_queueStateLock;
}

- (void)setQueueStateLock:(os_unfair_lock_s)a3
{
  self->_queueStateLock = a3;
}

- (unint64_t)queueEntryCounter
{
  return self->_queueEntryCounter;
}

- (void)setQueueEntryCounter:(unint64_t)a3
{
  self->_queueEntryCounter = a3;
}

- (unint64_t)requestCounter
{
  return self->_requestCounter;
}

- (void)setRequestCounter:(unint64_t)a3
{
  self->_requestCounter = a3;
}

- (NSMutableArray)queuedRequests
{
  return (NSMutableArray *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setQueuedRequests:(id)a3
{
}

- (OS_dispatch_queue)requestProcessingQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setRequestProcessingQueue:(id)a3
{
}

- (OS_dispatch_queue)cameraWatcherQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setCameraWatcherQueue:(id)a3
{
}

- (MediaConversionQueueEntry)currentlyProcessingRequestQueueEntry
{
  return (MediaConversionQueueEntry *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setCurrentlyProcessingRequestQueueEntry:(id)a3
{
}

- (MediaConversionQueueDelegate)delegate
{
  return (MediaConversionQueueDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (PFCameraViewfinderSessionWatcher)cameraWatcher
{
  return (PFCameraViewfinderSessionWatcher *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setCameraWatcher:(id)a3
{
}

- (void).cxx_destruct
{
}

@end