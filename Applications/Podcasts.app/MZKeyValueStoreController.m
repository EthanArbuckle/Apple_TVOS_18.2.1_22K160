@interface MZKeyValueStoreController
- (BOOL)AMSURLSession:(id)a3 shouldHandleAuthenticationForAccount:(id)a4 dialogDictionary:(id)a5;
- (BOOL)AMSURLSession:(id)a3 task:(id)a4 shouldFailWithServerError:(id)a5;
- (BOOL)_authenticationCanProcessTransaction:(id)a3 error:(id *)a4;
- (BOOL)_canScheduleTransaction:(id)a3 error:(id *)a4;
- (BOOL)_clampsCanScheduleTransaction:(id)a3 error:(id *)a4;
- (BOOL)_delegateShouldScheduleTransaction:(id)a3 error:(id *)a4;
- (BOOL)_delegateTransactionDidFail:(id)a3 withError:(id)a4;
- (BOOL)_isEnabledForTransaction:(id)a3 error:(id *)a4;
- (BOOL)_isTransactionValid:(id)a3 error:(id *)a4;
- (BOOL)canRequestStoreSignIn;
- (BOOL)enabled;
- (BOOL)isEnabled;
- (BOOL)isIdle;
- (BOOL)isResolvingError;
- (IMURLRequestService)urlRequestService;
- (MZKeyValueStoreAuthenticationController)authenticationController;
- (MZKeyValueStoreController)initWithDomain:(id)a3 baseURLForGETAll:(id)a4 baseURLForPUTAll:(id)a5;
- (MZKeyValueStoreControllerDelegate)delegate;
- (MZKeyValueStoreDeserializer)currentDeserializer;
- (MZKeyValueStoreTransaction)currentTransaction;
- (MZTaskAssertion)backgroundTaskAssertion;
- (NSMutableArray)pendingTransactions;
- (NSString)defaultDomain;
- (NSURL)defaultGetURL;
- (NSURL)defaultSetURL;
- (OS_dispatch_queue)dispatchQueue;
- (_TtP8Podcasts21CloudSyncBugReporting_)cloudSyncBugReporter;
- (id)_requestForTransaction:(id)a3;
- (id)_scheduleTransactionWithType:(int)a3 sinceDomainVersion:(id)a4 URL:(id)a5 keys:(id)a6 processor:(id)a7;
- (id)clampsController;
- (id)scheduleApnSubscriptionTransactionWithPushSubscriptionRequest:(id)a3;
- (id)scheduleGetAllTransactionWithSinceDomainVersion:(id)a3 processor:(id)a4;
- (id)scheduleGetTransactionWithKeys:(id)a3 processor:(id)a4;
- (id)scheduleSetTransactionWithKeys:(id)a3 processor:(id)a4;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6;
- (void)_addPendingTransaction:(id)a3;
- (void)_beginBackgroundTask;
- (void)_cancelAllPendingTransactions:(id)a3;
- (void)_cancelTransaction:(id)a3 error:(id)a4;
- (void)_currentTransactionDidFinish;
- (void)_delegateTransactionDidCancel:(id)a3 withError:(id)a4;
- (void)_delegateTransactionDidFinish:(id)a3;
- (void)_endBackgroundTask;
- (void)_enqueueStoreRequest:(id)a3 withUrlRequest:(id)a4;
- (void)_errorResolutionCancel:(id)a3 transaction:(id)a4;
- (void)_errorResolutionDefault:(id)a3 transaction:(id)a4;
- (void)_errorResolutionRetry:(id)a3 transaction:(id)a4;
- (void)_networkTypeChangedNotification:(id)a3;
- (void)_processCurrentTransaction;
- (void)_processOperationOutput:(id)a3 forRequest:(id)a4;
- (void)_processPendingTransactions;
- (void)_resolveError:(id)a3 transaction:(id)a4 resolution:(int)a5;
- (void)_scheduleTransaction:(id)a3;
- (void)_transactionDidCancel:(id)a3 withError:(id)a4;
- (void)_transactionDidFail:(id)a3 withError:(id)a4;
- (void)cancelAllTransactions;
- (void)cancelAllTransactionsCancelCode:(int64_t)a3;
- (void)cancelScheduledTransaction:(id)a3;
- (void)dealloc;
- (void)deserializeOperationDidFinish:(id)a3 shouldReschedule:(BOOL)a4;
- (void)keyValueStoreOperation:(id)a3 scheduleURLRequest:(id)a4;
- (void)performBlock:(id)a3;
- (void)performBlockAndWait:(id)a3;
- (void)reset;
- (void)resolveError:(id)a3 transaction:(id)a4 resolution:(int)a5;
- (void)scheduleTransaction:(id)a3;
- (void)setAuthenticationController:(id)a3;
- (void)setBackgroundTaskAssertion:(id)a3;
- (void)setCanRequestStoreSignIn:(BOOL)a3;
- (void)setCloudSyncBugReporter:(id)a3;
- (void)setCurrentDeserializer:(id)a3;
- (void)setCurrentTransaction:(id)a3;
- (void)setDefaultDomain:(id)a3;
- (void)setDefaultGetURL:(id)a3;
- (void)setDefaultSetURL:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setPendingTransactions:(id)a3;
- (void)setResolvingError:(BOOL)a3;
- (void)setUrlRequestService:(id)a3;
@end

@implementation MZKeyValueStoreController

- (MZKeyValueStoreController)initWithDomain:(id)a3 baseURLForGETAll:(id)a4 baseURLForPUTAll:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___MZKeyValueStoreController;
  v12 = -[MZKeyValueStoreController init](&v28, "init");
  v13 = v12;
  if (v12)
  {
    v12->_enabled = 1;
    v12->_canRequestStoreSignIn = 1;
    dispatch_queue_t v14 = dispatch_queue_create("com.apple.MZKeyValueStoreController", 0LL);
    dispatchQueue = v13->_dispatchQueue;
    v13->_dispatchQueue = (OS_dispatch_queue *)v14;

    v16 = -[IMURLRequestService initWithConcurrentOperationCount:requestEncodingType:]( objc_alloc(&OBJC_CLASS___IMURLRequestService),  "initWithConcurrentOperationCount:requestEncodingType:",  1LL,  0LL);
    urlRequestService = v13->_urlRequestService;
    v13->_urlRequestService = v16;

    -[IMURLRequestService setUrlSessionDelegate:](v13->_urlRequestService, "setUrlSessionDelegate:", v13);
    -[IMURLRequestService setPersonalizeRequests:](v13->_urlRequestService, "setPersonalizeRequests:", 1LL);
    v18 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    pendingTransactions = v13->_pendingTransactions;
    v13->_pendingTransactions = v18;

    v20 = objc_alloc_init(&OBJC_CLASS___MZKeyValueStoreAuthenticationController);
    authenticationController = v13->_authenticationController;
    v13->_authenticationController = v20;

    v22 = objc_alloc_init(&OBJC_CLASS____TtC8Podcasts20CloudSyncBugReporter);
    cloudSyncBugReporter = v13->_cloudSyncBugReporter;
    v13->_cloudSyncBugReporter = (_TtP8Podcasts21CloudSyncBugReporting_ *)v22;

    objc_storeStrong((id *)&v13->_defaultDomain, a3);
    objc_storeStrong((id *)&v13->_defaultGetURL, a4);
    objc_storeStrong((id *)&v13->_defaultSetURL, a5);
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    uint64_t v25 = IMNetworkTypeChangedNotification;
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[IMNetworkObserver sharedInstance](&OBJC_CLASS___IMNetworkObserver, "sharedInstance"));
    [v24 addObserver:v13 selector:"_networkTypeChangedNotification:" name:v25 object:v26];
  }

  return v13;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  uint64_t v4 = IMNetworkTypeChangedNotification;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[IMNetworkObserver sharedInstance](&OBJC_CLASS___IMNetworkObserver, "sharedInstance"));
  [v3 removeObserver:self name:v4 object:v5];

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MZKeyValueStoreController;
  -[MZKeyValueStoreController dealloc](&v6, "dealloc");
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setDefaultDomain:(id)a3
{
  id v6 = a3;
  if (!-[NSString isEqualToString:](self->_defaultDomain, "isEqualToString:"))
  {
    uint64_t v4 = (NSString *)[v6 copy];
    defaultDomain = self->_defaultDomain;
    self->_defaultDomain = v4;

    -[MZKeyValueStoreController reset](self, "reset");
  }
}

- (void)setDefaultGetURL:(id)a3
{
  id v6 = a3;
  if ((-[NSURL isEqual:](self->_defaultGetURL, "isEqual:") & 1) == 0)
  {
    uint64_t v4 = (NSURL *)[v6 copy];
    defaultGetURL = self->_defaultGetURL;
    self->_defaultGetURL = v4;

    -[MZKeyValueStoreController reset](self, "reset");
  }
}

- (void)setDefaultSetURL:(id)a3
{
  id v6 = a3;
  if ((-[NSURL isEqual:](self->_defaultSetURL, "isEqual:") & 1) == 0)
  {
    uint64_t v4 = (NSURL *)[v6 copy];
    defaultSetURL = self->_defaultSetURL;
    self->_defaultSetURL = v4;

    -[MZKeyValueStoreController reset](self, "reset");
  }
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472LL;
    v3[2] = sub_1000432F4;
    v3[3] = &unk_10023FF98;
    v3[4] = self;
    -[MZKeyValueStoreController performBlock:](self, "performBlock:", v3);
  }

- (id)clampsController
{
  return +[MZKeyValueStoreClampsController sharedClampsController]( &OBJC_CLASS___MZKeyValueStoreClampsController,  "sharedClampsController");
}

- (void)_networkTypeChangedNotification:(id)a3
{
  uint64_t v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController dispatchQueue](self, "dispatchQueue", a3));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100043494;
  block[3] = &unk_10023FF98;
  block[4] = self;
  dispatch_async(v4, block);
}

- (id)scheduleGetAllTransactionWithSinceDomainVersion:(id)a3 processor:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController defaultGetURL](self, "defaultGetURL"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[MZKeyValueStoreController _scheduleTransactionWithType:sinceDomainVersion:URL:keys:processor:]( self,  "_scheduleTransactionWithType:sinceDomainVersion:URL:keys:processor:",  1LL,  v7,  v8,  0LL,  v6));

  return v9;
}

- (id)scheduleGetTransactionWithKeys:(id)a3 processor:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController defaultGetURL](self, "defaultGetURL"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[MZKeyValueStoreController _scheduleTransactionWithType:sinceDomainVersion:URL:keys:processor:]( self,  "_scheduleTransactionWithType:sinceDomainVersion:URL:keys:processor:",  1LL,  0LL,  v8,  v7,  v6));

  return v9;
}

- (id)scheduleSetTransactionWithKeys:(id)a3 processor:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController defaultSetURL](self, "defaultSetURL"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[MZKeyValueStoreController _scheduleTransactionWithType:sinceDomainVersion:URL:keys:processor:]( self,  "_scheduleTransactionWithType:sinceDomainVersion:URL:keys:processor:",  2LL,  0LL,  v8,  v7,  v6));

  return v9;
}

- (void)scheduleTransaction:(id)a3
{
  id v4 = a3;
  id v13 = 0LL;
  unsigned int v5 = -[MZKeyValueStoreController _delegateShouldScheduleTransaction:error:]( self,  "_delegateShouldScheduleTransaction:error:",  v4,  &v13);
  id v6 = v13;
  id v7 = v6;
  if (v5)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1000437A0;
    v11[3] = &unk_100240240;
    v11[4] = self;
    id v12 = v4;
    -[MZKeyValueStoreController performBlock:](self, "performBlock:", v11);
  }

  else
  {
    uint64_t v8 = _MTLogCategoryCloudSync(v6);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController currentTransaction](self, "currentTransaction"));
      *(_DWORD *)buf = 138412546;
      v15 = v10;
      __int16 v16 = 2112;
      v17 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "%@ Did not schedule transaction - %@",  buf,  0x16u);
    }

    -[MZKeyValueStoreController _transactionDidFail:withError:](self, "_transactionDidFail:withError:", v4, v7);
  }
}

- (void)cancelScheduledTransaction:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100043824;
  v4[3] = &unk_100240240;
  unsigned int v5 = self;
  id v6 = a3;
  id v3 = v6;
  -[MZKeyValueStoreController performBlock:](v5, "performBlock:", v4);
}

- (void)cancelAllTransactions
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_1000438C8;
  v2[3] = &unk_10023FF98;
  v2[4] = self;
  -[MZKeyValueStoreController performBlock:](self, "performBlock:", v2);
}

- (void)cancelAllTransactionsCancelCode:(int64_t)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_1000439D0;
  v3[3] = &unk_100241568;
  v3[4] = self;
  void v3[5] = a3;
  -[MZKeyValueStoreController performBlock:](self, "performBlock:", v3);
}

- (void)resolveError:(id)a3 transaction:(id)a4 resolution:(int)a5
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100043B38;
  v9[3] = &unk_100241950;
  id v10 = self;
  id v11 = a3;
  id v12 = a4;
  int v13 = a5;
  id v7 = v12;
  id v8 = v11;
  -[MZKeyValueStoreController performBlock:](v10, "performBlock:", v9);
}

- (void)reset
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_100043B9C;
  v2[3] = &unk_10023FF98;
  v2[4] = self;
  -[MZKeyValueStoreController performBlock:](self, "performBlock:", v2);
}

- (BOOL)isIdle
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController pendingTransactions](self, "pendingTransactions"));
  objc_sync_enter(v3);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController currentTransaction](self, "currentTransaction"));
  if (v4)
  {
    BOOL v5 = 0;
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController pendingTransactions](self, "pendingTransactions"));
    BOOL v5 = [v6 count] == 0;
  }

  objc_sync_exit(v3);
  return v5;
}

- (void)performBlock:(id)a3
{
  id v4 = a3;
  BOOL v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController dispatchQueue](self, "dispatchQueue"));
  dispatch_async(v5, v4);
}

- (void)performBlockAndWait:(id)a3
{
  id v4 = a3;
  BOOL v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController dispatchQueue](self, "dispatchQueue"));
  dispatch_sync(v5, v4);
}

- (void)_cancelAllPendingTransactions:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController pendingTransactions](self, "pendingTransactions"));
  objc_sync_enter(v5);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController pendingTransactions](self, "pendingTransactions"));
  id v7 = [v6 copy];

  objc_sync_exit(v5);
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v8 = v7;
  id v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v18;
    do
    {
      id v11 = 0LL;
      do
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v8);
        }
        id v12 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)v11);
        id v13 = objc_msgSend(v4, "copy", (void)v17);
        dispatch_queue_t v14 = (void *)objc_claimAutoreleasedReturnValue([v12 description]);
        [v13 setTransactionDescription:v14];

        -[MZKeyValueStoreController _cancelTransaction:error:](self, "_cancelTransaction:error:", v12, v13);
        id v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v9);
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController pendingTransactions](self, "pendingTransactions"));
  objc_sync_enter(v15);
  __int16 v16 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController pendingTransactions](self, "pendingTransactions"));
  [v16 removeAllObjects];

  objc_sync_exit(v15);
}

- (void)_cancelTransaction:(id)a3 error:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if (v11)
  {
    id v7 = (id)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController currentTransaction](self, "currentTransaction"));

    if (!v6) {
      id v6 = (id)objc_claimAutoreleasedReturnValue( +[MZKeyValueStoreError transactionCancelledErrorWithTransaction:underlyingError:]( &OBJC_CLASS___MZKeyValueStoreError,  "transactionCancelledErrorWithTransaction:underlyingError:",  0LL,  0LL));
    }
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v11 description]);
    [v6 setTransactionDescription:v8];

    if (v7 == v11)
    {
      -[IMURLRequestService cancelAllRequests](self->_urlRequestService, "cancelAllRequests");
      -[MZKeyValueStoreController setCurrentTransaction:](self, "setCurrentTransaction:", 0LL);
    }

    if (-[MZKeyValueStoreController isResolvingError](self, "isResolvingError")) {
      -[MZKeyValueStoreController _transactionDidCancel:withError:](self, "_transactionDidCancel:withError:", v11, v6);
    }
    else {
      -[MZKeyValueStoreController _transactionDidFail:withError:](self, "_transactionDidFail:withError:", v11, v6);
    }
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController pendingTransactions](self, "pendingTransactions"));
    objc_sync_enter(v9);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController pendingTransactions](self, "pendingTransactions"));
    [v10 removeObject:v11];

    objc_sync_exit(v9);
    -[MZKeyValueStoreController _processPendingTransactions](self, "_processPendingTransactions");
  }
}

- (void)_processPendingTransactions
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController currentTransaction](self, "currentTransaction"));

  if (!v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController pendingTransactions](self, "pendingTransactions"));
    objc_sync_enter(v4);
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController pendingTransactions](self, "pendingTransactions"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 firstObject]);

    if (v6)
    {
      -[MZKeyValueStoreController setCurrentTransaction:](self, "setCurrentTransaction:", v6);

      objc_sync_exit(v4);
      -[MZKeyValueStoreController _processCurrentTransaction](self, "_processCurrentTransaction");
    }

    else
    {
      objc_sync_exit(v4);

      -[MZKeyValueStoreController _endBackgroundTask](self, "_endBackgroundTask");
    }
  }

- (void)_processCurrentTransaction
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController currentTransaction](self, "currentTransaction"));
  id v15 = 0LL;
  unsigned int v4 = -[MZKeyValueStoreController _authenticationCanProcessTransaction:error:]( self,  "_authenticationCanProcessTransaction:error:",  v3,  &v15);
  id v5 = v15;

  uint64_t v7 = _MTLogCategoryCloudSync(v6);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = v8;
  if (v4)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController currentTransaction](self, "currentTransaction"));
      *(_DWORD *)buf = 138412290;
      __int128 v17 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@ Processing transaction", buf, 0xCu);
    }

    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController currentTransaction](self, "currentTransaction"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController _requestForTransaction:](self, "_requestForTransaction:", v11));

    -[MZKeyValueStoreController _beginBackgroundTask](self, "_beginBackgroundTask");
    [v12 start];
  }

  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController currentTransaction](self, "currentTransaction"));
      *(_DWORD *)buf = 138412546;
      __int128 v17 = v13;
      __int16 v18 = 2112;
      id v19 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "%@ Authentication cannot process transaction - %@",  buf,  0x16u);
    }

    dispatch_queue_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController clampsController](self, "clampsController"));
    [v14 setDSIDCheckTimestamp];

    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController currentTransaction](self, "currentTransaction"));
    -[MZKeyValueStoreController _transactionDidFail:withError:](self, "_transactionDidFail:withError:", v12, v5);
  }
}

- (id)_requestForTransaction:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___MZKeyValueStoreRequest);
  -[MZKeyValueStoreRequest setTransaction:](v5, "setTransaction:", v4);

  -[MZKeyValueStoreRequest setDelegate:](v5, "setDelegate:", self);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController authenticationController](self, "authenticationController"));
  -[MZKeyValueStoreRequest setShouldAuthenticate:](v5, "setShouldAuthenticate:", [v6 shouldAuthenticate]);

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController authenticationController](self, "authenticationController"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 DSID]);
  -[MZKeyValueStoreRequest setDSID:](v5, "setDSID:", v8);

  return v5;
}

- (void)_scheduleTransaction:(id)a3
{
  id v4 = a3;
  id v10 = 0LL;
  unsigned int v5 = -[MZKeyValueStoreController _canScheduleTransaction:error:](self, "_canScheduleTransaction:error:", v4, &v10);
  id v6 = v10;
  uint64_t v7 = _MTLogCategoryCloudSync(v6);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v4;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@ Scheduling transaction", buf, 0xCu);
    }

    -[MZKeyValueStoreController _addPendingTransaction:](self, "_addPendingTransaction:", v4);
  }

  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v12 = v4;
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "%@ Did not schedule transaction - %@",  buf,  0x16u);
    }

    -[MZKeyValueStoreController _transactionDidFail:withError:](self, "_transactionDidFail:withError:", v4, v6);
  }
}

- (void)_addPendingTransaction:(id)a3
{
  id v7 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController pendingTransactions](self, "pendingTransactions"));
  objc_sync_enter(v4);
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController clampsController](self, "clampsController"));
  [v5 setTimestampForTransaction:v7];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController pendingTransactions](self, "pendingTransactions"));
  [v6 addObject:v7];

  objc_sync_exit(v4);
  -[MZKeyValueStoreController _processPendingTransactions](self, "_processPendingTransactions");
}

- (BOOL)_canScheduleTransaction:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (-[MZKeyValueStoreController _isEnabledForTransaction:error:](self, "_isEnabledForTransaction:error:", v6, a4)
    && -[MZKeyValueStoreController _isTransactionValid:error:](self, "_isTransactionValid:error:", v6, a4))
  {
    BOOL v7 = -[MZKeyValueStoreController _clampsCanScheduleTransaction:error:]( self,  "_clampsCanScheduleTransaction:error:",  v6,  a4);
  }

  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)_isEnabledForTransaction:(id)a3 error:(id *)a4
{
  id v6 = a3;
  unsigned __int8 v7 = -[MZKeyValueStoreController isEnabled](self, "isEnabled");
  BOOL v8 = v7;
  if (a4 && (v7 & 1) == 0) {
    *a4 = (id)objc_claimAutoreleasedReturnValue( +[MZKeyValueStoreError keyValueStoreDisabledErrorWithTransaction:underlyingError:]( &OBJC_CLASS___MZKeyValueStoreError,  "keyValueStoreDisabledErrorWithTransaction:underlyingError:",  v6,  0LL));
  }

  return v8;
}

- (BOOL)_isTransactionValid:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 URL]);

  if (!v6)
  {
    if (a4)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue( +[MZKeyValueStoreError transactionMissingURLErrorWithTransaction:underlyingError:]( &OBJC_CLASS___MZKeyValueStoreError,  "transactionMissingURLErrorWithTransaction:underlyingError:",  v5,  0LL));
LABEL_8:
      BOOL v8 = 0;
      *a4 = v9;
      goto LABEL_10;
    }

- (BOOL)_clampsCanScheduleTransaction:(id)a3 error:(id *)a4
{
  id v6 = a3;
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController clampsController](self, "clampsController"));
  LOBYTE(a4) = [v7 canScheduleTransaction:v6 error:a4];

  return (char)a4;
}

- (BOOL)_authenticationCanProcessTransaction:(id)a3 error:(id *)a4
{
  id v6 = a3;
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController clampsController](self, "clampsController"));
  unsigned __int8 v8 = [v7 hasUserRecentlyAcceptedSync];

  if ((v8 & 1) != 0
    || (id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController authenticationController](self, "authenticationController")),
        unsigned int v10 = [v9 isAuthenticationValidForTransaction:v6 error:a4],
        v9,
        v10))
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController authenticationController](self, "authenticationController"));
    if ([v11 shouldAuthenticate])
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController clampsController](self, "clampsController"));
      unsigned __int8 v13 = [v12 hasAuthenticatedTooRecentlyForTransaction:v6 error:a4];

      char v14 = v13 ^ 1;
    }

    else
    {

      char v14 = 1;
    }
  }

  else
  {
    char v14 = 0;
  }

  return v14;
}

- (id)_scheduleTransactionWithType:(int)a3 sinceDomainVersion:(id)a4 URL:(id)a5 keys:(id)a6 processor:(id)a7
{
  uint64_t v10 = *(void *)&a3;
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  __int16 v16 = objc_alloc(&OBJC_CLASS___MZKeyValueStoreTransaction);
  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController defaultDomain](self, "defaultDomain"));
  __int16 v18 = -[MZKeyValueStoreTransaction initWithType:domain:URL:keys:]( v16,  "initWithType:domain:URL:keys:",  v10,  v17,  v14,  v13);

  -[MZKeyValueStoreTransaction setSinceDomainVersion:](v18, "setSinceDomainVersion:", v15);
  -[MZKeyValueStoreTransaction setProcessor:](v18, "setProcessor:", v12);

  -[MZKeyValueStoreController scheduleTransaction:](self, "scheduleTransaction:", v18);
  return v18;
}

- (void)_currentTransactionDidFinish
{
  uint64_t v3 = _MTLogCategoryCloudSync(self);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController currentTransaction](self, "currentTransaction"));
    int v10 = 138412290;
    id v11 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Transaction did finish %@",  (uint8_t *)&v10,  0xCu);
  }

  -[MZKeyValueStoreController _endBackgroundTask](self, "_endBackgroundTask");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController currentTransaction](self, "currentTransaction"));
  -[MZKeyValueStoreController _delegateTransactionDidFinish:](self, "_delegateTransactionDidFinish:", v6);

  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController pendingTransactions](self, "pendingTransactions"));
  objc_sync_enter(v7);
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController pendingTransactions](self, "pendingTransactions"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController currentTransaction](self, "currentTransaction"));
  [v8 removeObject:v9];

  -[MZKeyValueStoreController setCurrentTransaction:](self, "setCurrentTransaction:", 0LL);
  objc_sync_exit(v7);

  -[MZKeyValueStoreController _processPendingTransactions](self, "_processPendingTransactions");
}

- (void)_transactionDidFail:(id)a3 withError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController currentTransaction](self, "currentTransaction"));
  if (v8)
  {
    id v9 = (void *)v8;
    id v10 = (id)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController currentTransaction](self, "currentTransaction"));

    if (v10 == v6) {
      -[MZKeyValueStoreController _endBackgroundTask](self, "_endBackgroundTask");
    }
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100044C18;
  block[3] = &unk_100240980;
  block[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v11 = v7;
  id v12 = v6;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)_transactionDidCancel:(id)a3 withError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController currentTransaction](self, "currentTransaction"));
  if (v8)
  {
    id v9 = (void *)v8;
    id v10 = (id)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController currentTransaction](self, "currentTransaction"));

    if (v10 == v6) {
      -[MZKeyValueStoreController _endBackgroundTask](self, "_endBackgroundTask");
    }
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100044D4C;
  block[3] = &unk_100240980;
  block[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v11 = v7;
  id v12 = v6;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)_processOperationOutput:(id)a3 forRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 DSID]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController authenticationController](self, "authenticationController"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 DSID]);

  id v11 = [v10 isEqualToString:v8];
  if ((v11 & 1) != 0)
  {
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController currentTransaction](self, "currentTransaction"));
    if (v12 && -[MZKeyValueStoreController isEnabled](self, "isEnabled"))
    {
      uint64_t v13 = objc_claimAutoreleasedReturnValue([v7 transaction]);
      id v14 = (void *)v13;
      if ((os_log_s *)v13 != v12)
      {
        uint64_t v15 = _MTLogCategoryCloudSync(v13);
        __int16 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v66 = v14;
          __int16 v67 = 2112;
          v68 = v12;
          _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "Ignoring BK response for transaction %@ while current transaction is %@",  buf,  0x16u);
        }

        goto LABEL_41;
      }

      __int16 v16 = -[MZKeyValueStoreDeserializer initWithTransaction:response:]( objc_alloc(&OBJC_CLASS___MZKeyValueStoreDeserializer),  "initWithTransaction:response:",  v12,  v6);
      -[os_log_s setDelegate:](v16, "setDelegate:", self);
      if ((-[os_log_s success](v16, "success") & 1) != 0
        || -[os_log_s versionMismatch](v16, "versionMismatch"))
      {
        __int16 v18 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController authenticationController](self, "authenticationController"));
        [v18 resetAcceptedCredentials];

        id v19 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController authenticationController](self, "authenticationController"));
        [v19 setShouldAuthenticate:0];

        -[MZKeyValueStoreController setCurrentDeserializer:](self, "setCurrentDeserializer:", v16);
        -[os_log_s deserialize](v16, "deserialize");
LABEL_41:

        goto LABEL_42;
      }

      id v20 = -[os_log_s hasBackoff](v16, "hasBackoff");
      if ((_DWORD)v20)
      {
        uint64_t v21 = _MTLogCategoryCloudSync(v20);
        v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController currentTransaction](self, "currentTransaction"));
          v58 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[os_log_s requestError](v16, "requestError"));
          *(_DWORD *)buf = 138412546;
          v66 = v23;
          __int16 v67 = 2112;
          v68 = v58;
          _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "%@ Deserializer has backoff - %@",  buf,  0x16u);
        }

        v24 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController clampsController](self, "clampsController"));
        objc_msgSend( v24,  "backOffForTimeInterval:",  (double)(unint64_t)-[os_log_s retrySeconds](v16, "retrySeconds"));

        double v25 = (double)(unint64_t)-[os_log_s retrySeconds](v16, "retrySeconds");
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s requestError](v16, "requestError"));
        uint64_t v27 = objc_claimAutoreleasedReturnValue( +[MZKeyValueStoreError serverClampErrorWithTransaction:retrySeconds:underlyingError:]( &OBJC_CLASS___MZKeyValueStoreError,  "serverClampErrorWithTransaction:retrySeconds:underlyingError:",  v12,  v26,  v25));
      }

      else
      {
        id v28 = -[os_log_s unsupportedClient](v16, "unsupportedClient");
        if (!(_DWORD)v28)
        {
          id v34 = -[os_log_s genericError](v16, "genericError");
          if ((_DWORD)v34)
          {
            uint64_t v35 = _MTLogCategoryCloudSync(v34);
            v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
            if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
            {
              v37 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController currentTransaction](self, "currentTransaction"));
              v60 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[os_log_s requestError](v16, "requestError"));
              *(_DWORD *)buf = 138412546;
              v66 = v37;
              __int16 v67 = 2112;
              v68 = v60;
              _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_ERROR,  "%@ Got generic deserializer error - %@",  buf,  0x16u);
            }

            v26 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s requestError](v16, "requestError"));
            uint64_t v38 = objc_claimAutoreleasedReturnValue( +[MZKeyValueStoreError storeGenericErrorWithTransaction:underlyingError:]( &OBJC_CLASS___MZKeyValueStoreError,  "storeGenericErrorWithTransaction:underlyingError:",  v12,  v26));
          }

          else
          {
            id v39 = -[os_log_s validationError](v16, "validationError");
            if ((_DWORD)v39)
            {
              uint64_t v40 = _MTLogCategoryCloudSync(v39);
              v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
              if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
              {
                v42 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController currentTransaction](self, "currentTransaction"));
                v61 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[os_log_s requestError](v16, "requestError"));
                *(_DWORD *)buf = 138412546;
                v66 = v42;
                __int16 v67 = 2112;
                v68 = v61;
                _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_ERROR,  "%@ Got validation error - %@",  buf,  0x16u);
              }

              v26 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s requestError](v16, "requestError"));
              uint64_t v38 = objc_claimAutoreleasedReturnValue( +[MZKeyValueStoreError storeValidationErrorWithTransaction:underlyingError:]( &OBJC_CLASS___MZKeyValueStoreError,  "storeValidationErrorWithTransaction:underlyingError:",  v12,  v26));
            }

            else
            {
              id v43 = -[os_log_s authenticationError](v16, "authenticationError");
              if ((_DWORD)v43)
              {
                BOOL v44 = -[MZKeyValueStoreController canRequestStoreSignIn](self, "canRequestStoreSignIn");
                if (v44)
                {
                  v45 = (void *)objc_claimAutoreleasedReturnValue( -[MZKeyValueStoreController authenticationController]( self,  "authenticationController"));
                  unsigned __int8 v46 = [v45 shouldAuthenticate];

                  if ((v46 & 1) == 0)
                  {
                    v55 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController clampsController](self, "clampsController"));
                    [v55 clearAuthenticationRequest];

                    v56 = (void *)objc_claimAutoreleasedReturnValue( -[MZKeyValueStoreController authenticationController]( self,  "authenticationController"));
                    [v56 setShouldAuthenticate:1];

                    -[MZKeyValueStoreController _processCurrentTransaction](self, "_processCurrentTransaction");
                    goto LABEL_41;
                  }
                }

                uint64_t v47 = _MTLogCategoryCloudSync(v44);
                v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
                if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
                {
                  v49 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController currentTransaction](self, "currentTransaction"));
                  v62 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[os_log_s requestError](v16, "requestError"));
                  *(_DWORD *)buf = 138412546;
                  v66 = v49;
                  __int16 v67 = 2112;
                  v68 = v62;
                  _os_log_impl( (void *)&_mh_execute_header,  v48,  OS_LOG_TYPE_ERROR,  "%@ Got authentication error - %@",  buf,  0x16u);
                }

                v50 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s requestError](v16, "requestError"));
                uint64_t v63 = objc_claimAutoreleasedReturnValue( +[MZKeyValueStoreError storeAccountSessionExpiredWithTransaction:underlyingError:]( &OBJC_CLASS___MZKeyValueStoreError,  "storeAccountSessionExpiredWithTransaction:underlyingError:",  v12,  v50));

                v57 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController cloudSyncBugReporter](self, "cloudSyncBugReporter"));
                v51 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController currentTransaction](self, "currentTransaction"));
                v26 = (void *)v63;
                [v57 reportSyncAuthenticationErrorFor:v51 error:v63];

                -[MZKeyValueStoreController _transactionDidFail:withError:]( self,  "_transactionDidFail:withError:",  v12,  v63);
                goto LABEL_40;
              }

              uint64_t v52 = _MTLogCategoryCloudSync(v43);
              v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
              if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
              {
                v54 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController currentTransaction](self, "currentTransaction"));
                v64 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[os_log_s requestError](v16, "requestError"));
                *(_DWORD *)buf = 138412546;
                v66 = v54;
                __int16 v67 = 2112;
                v68 = v64;
                _os_log_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_ERROR,  "%@ Got unknown error - %@",  buf,  0x16u);
              }

              v26 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s requestError](v16, "requestError"));
              uint64_t v38 = objc_claimAutoreleasedReturnValue( +[MZKeyValueStoreError unknownErrorWithTransaction:underlyingError:]( &OBJC_CLASS___MZKeyValueStoreError,  "unknownErrorWithTransaction:underlyingError:",  v12,  v26));
            }
          }

          v33 = (void *)v38;
          -[MZKeyValueStoreController _transactionDidFail:withError:](self, "_transactionDidFail:withError:", v12, v38);
LABEL_39:

LABEL_40:
          goto LABEL_41;
        }

        uint64_t v29 = _MTLogCategoryCloudSync(v28);
        v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          v31 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController currentTransaction](self, "currentTransaction"));
          v59 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[os_log_s requestError](v16, "requestError"));
          *(_DWORD *)buf = 138412546;
          v66 = v31;
          __int16 v67 = 2112;
          v68 = v59;
          _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_ERROR,  "%@ Got unsupported client error - %@",  buf,  0x16u);
        }

        v32 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController clampsController](self, "clampsController"));
        [v32 setNetworkingBlocked];

        v26 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s requestError](v16, "requestError"));
        uint64_t v27 = objc_claimAutoreleasedReturnValue( +[MZKeyValueStoreError killSwitchErrorWithTransaction:underlyingError:]( &OBJC_CLASS___MZKeyValueStoreError,  "killSwitchErrorWithTransaction:underlyingError:",  v12,  v26));
      }

      v33 = (void *)v27;
      -[MZKeyValueStoreController _cancelAllPendingTransactions:](self, "_cancelAllPendingTransactions:", v27);
      goto LABEL_39;
    }
  }

  else
  {
    uint64_t v17 = _MTLogCategoryCloudSync(v11);
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v66 = v8;
      __int16 v67 = 2112;
      v68 = (os_log_s *)v10;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "Ignoring BK response for dsid = %@ while currentDsid = %@",  buf,  0x16u);
    }
  }

- (void)_enqueueStoreRequest:(id)a3 withUrlRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  urlRequestService = self->_urlRequestService;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10004566C;
  v10[3] = &unk_100241978;
  objc_copyWeak(&v12, &location);
  id v9 = v6;
  id v11 = v9;
  -[IMURLRequestService performUrlRequest:callback:](urlRequestService, "performUrlRequest:callback:", v7, v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)_resolveError:(id)a3 transaction:(id)a4 resolution:(int)a5
{
  id v13 = a3;
  id v8 = a4;
  -[MZKeyValueStoreController setResolvingError:](self, "setResolvingError:", 1LL);
  if (([v13 isTransactionCancelledError] & 1) == 0)
  {
    uint64_t v9 = objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController currentTransaction](self, "currentTransaction"));
    if ((id)v9 == v8)
    {
    }

    else
    {
      id v10 = (void *)v9;
      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController currentTransaction](self, "currentTransaction"));

      if (v11) {
        goto LABEL_7;
      }
    }

    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController clampsController](self, "clampsController"));
    [v12 clearDSIDCheckTimestamp];

LABEL_7:
    if (a5 == 2)
    {
      -[MZKeyValueStoreController _errorResolutionCancel:transaction:]( self,  "_errorResolutionCancel:transaction:",  v13,  v8);
    }

    else if (a5 == 1)
    {
      -[MZKeyValueStoreController _errorResolutionRetry:transaction:]( self,  "_errorResolutionRetry:transaction:",  v13,  v8);
    }

    else
    {
      -[MZKeyValueStoreController _errorResolutionDefault:transaction:]( self,  "_errorResolutionDefault:transaction:",  v13,  v8);
    }
  }

  -[MZKeyValueStoreController setResolvingError:](self, "setResolvingError:", 0LL);
}

- (void)_errorResolutionRetry:(id)a3 transaction:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if ([v11 isAccountsChangedError])
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController clampsController](self, "clampsController"));
    [v7 setUserAcceptedSyncTimestamp];
  }

  else
  {
    unsigned int v8 = [v11 isAuthenticationError];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController clampsController](self, "clampsController"));
    id v10 = v9;
    if (!v8)
    {
      [v9 clearTimestampForTransaction:v6];

      -[MZKeyValueStoreController scheduleTransaction:](self, "scheduleTransaction:", v6);
      goto LABEL_7;
    }

    [v9 setUserAcceptedSyncTimestamp];

    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController authenticationController](self, "authenticationController"));
    [v7 resetAcceptedCredentials];
  }

  -[MZKeyValueStoreController _processCurrentTransaction](self, "_processCurrentTransaction");
LABEL_7:
}

- (void)_errorResolutionCancel:(id)a3 transaction:(id)a4
{
  id v7 = a4;
  id v6 = a3;
  else {
    -[MZKeyValueStoreController _cancelTransaction:error:](self, "_cancelTransaction:error:", v7, v6);
  }
}

- (void)_errorResolutionDefault:(id)a3 transaction:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if ([v11 isAuthenticationError])
  {
    id v7 = (id)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController currentTransaction](self, "currentTransaction"));
    if (v7 == v6)
    {
      unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController authenticationController](self, "authenticationController"));
      unsigned int v9 = [v8 shouldAuthenticate];

      if (!v9)
      {
        uint64_t v10 = 1LL;
        goto LABEL_6;
      }
    }

    else
    {
    }
  }

  uint64_t v10 = 2LL;
LABEL_6:
  -[MZKeyValueStoreController _resolveError:transaction:resolution:]( self,  "_resolveError:transaction:resolution:",  v11,  v6,  v10);
}

- (BOOL)_delegateShouldScheduleTransaction:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController delegate](self, "delegate"));
  char v8 = objc_opt_respondsToSelector(v7, "keyValueStoreController:shouldScheduleTransaction:");

  if ((v8 & 1) != 0)
  {
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController delegate](self, "delegate"));
    unsigned __int8 v10 = [v9 keyValueStoreController:self shouldScheduleTransaction:v6];

    if (a4 && (v10 & 1) == 0)
    {
      unsigned __int8 v10 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue( +[MZKeyValueStoreError delegateCancelledErrorWithTransaction:underlyingError:]( &OBJC_CLASS___MZKeyValueStoreError,  "delegateCancelledErrorWithTransaction:underlyingError:",  v6,  0LL));
    }
  }

  else
  {
    unsigned __int8 v10 = 1;
  }

  return v10;
}

- (BOOL)_delegateTransactionDidFail:(id)a3 withError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController delegate](self, "delegate"));
  char v9 = objc_opt_respondsToSelector(v8, "keyValueStoreController:transaction:didFailWithError:");

  if ((v9 & 1) != 0)
  {
    unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController delegate](self, "delegate"));
    unsigned __int8 v11 = [v10 keyValueStoreController:self transaction:v6 didFailWithError:v7];
  }

  else
  {
    unsigned __int8 v11 = 0;
  }

  return v11;
}

- (void)_delegateTransactionDidCancel:(id)a3 withError:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController delegate](self, "delegate"));
  char v8 = objc_opt_respondsToSelector(v7, "keyValueStoreController:transaction:didCancelWithError:");

  if ((v8 & 1) != 0)
  {
    char v9 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController delegate](self, "delegate"));
    [v9 keyValueStoreController:self transaction:v10 didCancelWithError:v6];
  }
}

- (void)_delegateTransactionDidFinish:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController delegate](self, "delegate"));
  char v6 = objc_opt_respondsToSelector(v5, "keyValueStoreController:transactionDidFinish:");

  if ((v6 & 1) != 0)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_100045D24;
    v7[3] = &unk_100240240;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(&_dispatch_main_q, v7);
  }
}

- (void)_beginBackgroundTask
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController backgroundTaskAssertion](self, "backgroundTaskAssertion"));

  if (!v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController currentTransaction](self, "currentTransaction"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 assertionName]);
    char v6 = v5;
    if (v5) {
      id v7 = v5;
    }
    else {
      id v7 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[%@ _beginBackgroundTask] - No transaction",  self));
    }
    id v8 = v7;

    objc_initWeak(&location, self);
    uint64_t v13 = 0LL;
    id v14 = &v13;
    uint64_t v15 = 0x3032000000LL;
    __int16 v16 = sub_100045F08;
    uint64_t v17 = sub_100045F18;
    id v18 = 0LL;
    v11[0] = _NSConcreteStackBlock;
    v11[2] = sub_100045F20;
    v11[3] = &unk_1002419A0;
    v11[1] = 3221225472LL;
    objc_copyWeak(&v12, &location);
    v11[4] = &v13;
    id v9 = +[MZTaskAssertion newBackgroundTaskWithExpirationHandler:debugInfo:]( &OBJC_CLASS___MZTaskAssertion,  "newBackgroundTaskWithExpirationHandler:debugInfo:",  v11,  v8);
    id v10 = (void *)v14[5];
    v14[5] = (uint64_t)v9;

    -[MZKeyValueStoreController setBackgroundTaskAssertion:](self, "setBackgroundTaskAssertion:", v14[5]);
    _Block_object_dispose(&v13, 8);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

- (void)_endBackgroundTask
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController backgroundTaskAssertion](self, "backgroundTaskAssertion"));
  -[MZKeyValueStoreController setBackgroundTaskAssertion:](self, "setBackgroundTaskAssertion:", 0LL);
  if (v3)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10004601C;
    block[3] = &unk_10023FF98;
    id v5 = v3;
    dispatch_async(&_dispatch_main_q, block);
  }
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  id v8 = a5;
  id v9 = (void (**)(id, uint64_t))a6;
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSHTTPURLResponse);
  if ((objc_opt_isKindOfClass(v8, v10) & 1) != 0 && [v8 statusCode] == (id)511)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1000460E4;
    v11[3] = &unk_10023FF98;
    v11[4] = self;
    -[MZKeyValueStoreController performBlock:](self, "performBlock:", v11);
  }

  v9[2](v9, 1LL);
}

- (BOOL)AMSURLSession:(id)a3 shouldHandleAuthenticationForAccount:(id)a4 dialogDictionary:(id)a5
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000462B0;
  v8[3] = &unk_100240980;
  id v9 = self;
  id v10 = (id)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController currentTransaction](self, "currentTransaction", a3, a4, a5));
  id v11 = (id)objc_claimAutoreleasedReturnValue( +[MZKeyValueStoreError storeAccountSessionExpiredWithTransaction:underlyingError:]( &OBJC_CLASS___MZKeyValueStoreError,  "storeAccountSessionExpiredWithTransaction:underlyingError:",  v10,  0LL));
  id v5 = v11;
  id v6 = v10;
  -[MZKeyValueStoreController performBlock:](v9, "performBlock:", v8);

  return 0;
}

- (BOOL)AMSURLSession:(id)a3 task:(id)a4 shouldFailWithServerError:(id)a5
{
  id v6 = a5;
  uint64_t v7 = _MTLogCategoryCloudSync(v6);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController currentTransaction](self, "currentTransaction"));
    int v14 = 138412546;
    uint64_t v15 = v9;
    __int16 v16 = 2112;
    id v17 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "%@ AMSURLSession server failure - %@",  (uint8_t *)&v14,  0x16u);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController currentTransaction](self, "currentTransaction"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[MZKeyValueStoreError unknownErrorWithTransaction:underlyingError:]( &OBJC_CLASS___MZKeyValueStoreError,  "unknownErrorWithTransaction:underlyingError:",  v10,  v6));

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController currentTransaction](self, "currentTransaction"));
  -[MZKeyValueStoreController _transactionDidFail:withError:](self, "_transactionDidFail:withError:", v12, v11);

  return 1;
}

- (void)keyValueStoreOperation:(id)a3 scheduleURLRequest:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController clampsController](self, "clampsController"));
  unsigned __int8 v8 = [v7 isNetworkingBlocked];

  if ((v8 & 1) == 0) {
    -[MZKeyValueStoreController _enqueueStoreRequest:withUrlRequest:]( self,  "_enqueueStoreRequest:withUrlRequest:",  v9,  v6);
  }
}

- (void)deserializeOperationDidFinish:(id)a3 shouldReschedule:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController currentDeserializer](self, "currentDeserializer"));

  if (v7 == v6)
  {
    if (v4) {
      -[MZKeyValueStoreController _processCurrentTransaction](self, "_processCurrentTransaction");
    }
    else {
      -[MZKeyValueStoreController _currentTransactionDidFinish](self, "_currentTransactionDidFinish");
    }
    unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController currentDeserializer](self, "currentDeserializer"));
    [v8 setDelegate:0];

    -[MZKeyValueStoreController setCurrentDeserializer:](self, "setCurrentDeserializer:", 0LL);
  }

- (MZKeyValueStoreControllerDelegate)delegate
{
  return (MZKeyValueStoreControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (NSURL)defaultGetURL
{
  return self->_defaultGetURL;
}

- (NSURL)defaultSetURL
{
  return self->_defaultSetURL;
}

- (NSString)defaultDomain
{
  return self->_defaultDomain;
}

- (MZKeyValueStoreAuthenticationController)authenticationController
{
  return (MZKeyValueStoreAuthenticationController *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setAuthenticationController:(id)a3
{
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (BOOL)canRequestStoreSignIn
{
  return self->_canRequestStoreSignIn;
}

- (void)setCanRequestStoreSignIn:(BOOL)a3
{
  self->_canRequestStoreSignIn = a3;
}

- (NSMutableArray)pendingTransactions
{
  return self->_pendingTransactions;
}

- (void)setPendingTransactions:(id)a3
{
}

- (MZKeyValueStoreTransaction)currentTransaction
{
  return self->_currentTransaction;
}

- (void)setCurrentTransaction:(id)a3
{
}

- (BOOL)isResolvingError
{
  return self->_resolvingError;
}

- (void)setResolvingError:(BOOL)a3
{
  self->_resolvingError = a3;
}

- (MZKeyValueStoreDeserializer)currentDeserializer
{
  return self->_currentDeserializer;
}

- (void)setCurrentDeserializer:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (MZTaskAssertion)backgroundTaskAssertion
{
  return self->_backgroundTaskAssertion;
}

- (void)setBackgroundTaskAssertion:(id)a3
{
}

- (IMURLRequestService)urlRequestService
{
  return self->_urlRequestService;
}

- (void)setUrlRequestService:(id)a3
{
}

- (_TtP8Podcasts21CloudSyncBugReporting_)cloudSyncBugReporter
{
  return self->_cloudSyncBugReporter;
}

- (void)setCloudSyncBugReporter:(id)a3
{
}

- (void).cxx_destruct
{
}

- (id)scheduleApnSubscriptionTransactionWithPushSubscriptionRequest:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(&OBJC_CLASS___MTApnsDictionaryProcessor);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 parameters]);
  id v7 = -[MTApnsDictionaryProcessor initWithDictionary:](v5, "initWithDictionary:", v6);

  unsigned __int8 v8 = objc_alloc(&OBJC_CLASS___MTApnsTransaction);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController defaultDomain](self, "defaultDomain"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController defaultSetURL](self, "defaultSetURL"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 parameters]);

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 allKeys]);
  uint64_t v13 = -[MZKeyValueStoreTransaction initWithType:domain:URL:keys:]( v8,  "initWithType:domain:URL:keys:",  2LL,  v9,  v10,  v12);

  -[MZKeyValueStoreTransaction setSinceDomainVersion:](v13, "setSinceDomainVersion:", @"0");
  -[MZKeyValueStoreTransaction setProcessor:](v13, "setProcessor:", v7);
  -[MZKeyValueStoreController scheduleTransaction:](self, "scheduleTransaction:", v13);

  return v13;
}

@end