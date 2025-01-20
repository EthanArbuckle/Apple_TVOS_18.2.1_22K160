@interface ASCWorkspace
+ (ASCWorkspace)sharedWorkspace;
+ (OS_os_log)log;
+ (void)withSharedWorkspace:(id)a3 perform:(id)a4;
- (BOOL)isExtension;
- (NSMutableDictionary)pendingResults;
- (NSOperationQueue)openApplicationOperationQueue;
- (NSRecursiveLock)stateLock;
- (id)_init;
- (id)openApplicationWithBundleIdentifier:(id)a3 payloadURL:(id)a4;
- (id)openApplicationWithBundleIdentifier:(id)a3 payloadURL:(id)a4 universalLinkRequired:(BOOL)a5;
- (id)openProductURL:(id)a3;
- (id)openSensitiveURL:(id)a3;
- (id)openSensitiveURL:(id)a3 frontBoardOptions:(id)a4;
- (id)openURL:(id)a3;
- (id)openURL:(id)a3 frontBoardOptions:(id)a4;
- (id)popPendingResultForOperationName:(id)a3;
- (void)enqueueOpenApplicationOperation:(id)a3 pendingResult:(id)a4;
- (void)openApplicationWithBundleIdentifier:(id)a3 configuration:(id)a4 pendingResult:(id)a5;
- (void)openApplicationWithBundleIdentifier:(id)a3 usingOpenResourceOperationWithPayloadURL:(id)a4 options:(id)a5 pendingResult:(id)a6;
- (void)openResourceOperation:(id)a3 didFailWithError:(id)a4;
- (void)openResourceOperationDidComplete:(id)a3;
- (void)setOpenApplicationOperationQueue:(id)a3;
@end

@implementation ASCWorkspace

- (id)openApplicationWithBundleIdentifier:(id)a3 payloadURL:(id)a4
{
  return -[ASCWorkspace openApplicationWithBundleIdentifier:payloadURL:universalLinkRequired:]( self,  "openApplicationWithBundleIdentifier:payloadURL:universalLinkRequired:",  a3,  a4,  0LL);
}

- (id)openApplicationWithBundleIdentifier:(id)a3 payloadURL:(id)a4 universalLinkRequired:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_alloc_init(&OBJC_CLASS___AMSMutableBinaryPromise);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionary](&OBJC_CLASS___NSDictionary, "dictionary"));
  if (v9)
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_100023FF0;
    v16[3] = &unk_10011F388;
    id v17 = v8;
    id v18 = v11;
    id v19 = v10;
    v20 = self;
    id v21 = v9;
    BOOL v22 = a5;
    +[LSAppLink getAppLinksWithURL:completionHandler:]( &OBJC_CLASS___LSAppLink,  "getAppLinksWithURL:completionHandler:",  v21,  v16);

    id v12 = v17;
  }

  else
  {
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[ASCWorkspace log](&OBJC_CLASS___ASCWorkspace, "log"));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "No payload URL; opening application.", v15, 2u);
    }

    id v12 = objc_alloc_init(&OBJC_CLASS____LSOpenConfiguration);
    [v12 setFrontBoardOptions:v11];
    -[ASCWorkspace openApplicationWithBundleIdentifier:configuration:pendingResult:]( self,  "openApplicationWithBundleIdentifier:configuration:pendingResult:",  v8,  v12,  v10);
  }

  return v10;
}

- (void)openApplicationWithBundleIdentifier:(id)a3 usingOpenResourceOperationWithPayloadURL:(id)a4 options:(id)a5 pendingResult:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace"));
  v15 = (void *)objc_claimAutoreleasedReturnValue( [v14 operationToOpenResource:v12 usingApplication:v13 uniqueDocumentIdentifier:0 isContentManaged:0 sourceAuditToken:0  userInfo:0 options:v11 delegate:self]);

  v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[ASCWorkspace log](&OBJC_CLASS___ASCWorkspace, "log"));
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Enqueuing open resource URL operation", buf, 2u);
  }

  -[ASCWorkspace enqueueOpenApplicationOperation:pendingResult:]( self,  "enqueueOpenApplicationOperation:pendingResult:",  v15,  v10);
}

- (void)openApplicationWithBundleIdentifier:(id)a3 configuration:(id)a4 pendingResult:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100024648;
  v12[3] = &unk_10011EED8;
  id v13 = v7;
  id v11 = v7;
  [v10 openApplicationWithBundleIdentifier:v9 configuration:v8 completionHandler:v12];
}

- (id)openProductURL:(id)a3
{
  return -[ASCWorkspace openURL:frontBoardOptions:](self, "openURL:frontBoardOptions:", a3, 0LL);
}

- (void)openResourceOperationDidComplete:(id)a3
{
  id v4 = a3;
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[ASCWorkspace log](&OBJC_CLASS___ASCWorkspace, "log"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Open resource URL operation completed", v8, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ASCWorkspace popPendingResultForOperationName:](self, "popPendingResultForOperationName:", v6));

  [v7 finishWithSuccess];
}

- (void)openResourceOperation:(id)a3 didFailWithError:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[ASCWorkspace log](&OBJC_CLASS___ASCWorkspace, "log"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    sub_1000E2104();
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 name]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[ASCWorkspace popPendingResultForOperationName:](self, "popPendingResultForOperationName:", v9));

  [v10 finishWithError:v6];
}

+ (OS_os_log)log
{
  if (qword_100140840 != -1) {
    dispatch_once(&qword_100140840, &stru_10011F3A8);
  }
  return (OS_os_log *)(id)qword_100140848;
}

+ (ASCWorkspace)sharedWorkspace
{
  v2 = (void *)qword_100140838;
  if (!qword_100140838)
  {
    if (qword_100140850 != -1) {
      dispatch_once(&qword_100140850, &stru_10011F3C8);
    }
    v2 = (void *)qword_100140858;
  }

  return (ASCWorkspace *)v2;
}

- (id)_init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___ASCWorkspace;
  v2 = -[ASCWorkspace init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSRecursiveLock);
    stateLock = v2->_stateLock;
    v2->_stateLock = v3;
  }

  return v2;
}

+ (void)withSharedWorkspace:(id)a3 perform:(id)a4
{
  id v9 = a3;
  objc_super v6 = (void (**)(void))a4;
  id v7 = (id)qword_100140838;
  objc_storeStrong((id *)&qword_100140838, a3);
  v6[2](v6);
  id v8 = (void *)qword_100140838;
  qword_100140838 = (uint64_t)v7;
}

- (id)openURL:(id)a3
{
  return -[ASCWorkspace openURL:frontBoardOptions:](self, "openURL:frontBoardOptions:", a3, 0LL);
}

- (id)openURL:(id)a3 frontBoardOptions:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init(&OBJC_CLASS___AMSMutableBinaryPromise);
  id v8 = objc_alloc_init(&OBJC_CLASS____LSOpenConfiguration);
  [v8 setFrontBoardOptions:v5];

  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100024B98;
  v12[3] = &unk_10011F3F0;
  id v10 = v7;
  id v13 = v10;
  [v9 openURL:v6 configuration:v8 completionHandler:v12];

  return v10;
}

- (id)openSensitiveURL:(id)a3
{
  return -[ASCWorkspace openSensitiveURL:frontBoardOptions:](self, "openSensitiveURL:frontBoardOptions:", a3, 0LL);
}

- (id)openSensitiveURL:(id)a3 frontBoardOptions:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init(&OBJC_CLASS___AMSMutableBinaryPromise);
  id v8 = objc_alloc_init(&OBJC_CLASS____LSOpenConfiguration);
  [v8 setSensitive:1];
  [v8 setFrontBoardOptions:v5];

  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100024CA0;
  v12[3] = &unk_10011F3F0;
  id v10 = v7;
  id v13 = v10;
  [v9 openURL:v6 configuration:v8 completionHandler:v12];

  return v10;
}

- (void)enqueueOpenApplicationOperation:(id)a3 pendingResult:(id)a4
{
  id v18 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ASCWorkspace stateLock](self, "stateLock"));
  [v7 lock];

  if (!self->_openApplicationOperationQueue)
  {
    id v8 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
    openApplicationOperationQueue = self->_openApplicationOperationQueue;
    self->_openApplicationOperationQueue = v8;
  }

  if (!self->_pendingResults)
  {
    id v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    pendingResults = self->_pendingResults;
    self->_pendingResults = v10;
  }

  -[NSOperationQueue setSuspended:](self->_openApplicationOperationQueue, "setSuspended:", 1LL);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v18 name]);

  if (!v12)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 UUIDString]);
    [v18 setName:v14];
  }

  -[NSOperationQueue addOperation:](self->_openApplicationOperationQueue, "addOperation:", v18);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ASCWorkspace pendingResults](self, "pendingResults"));
  v16 = (void *)objc_claimAutoreleasedReturnValue([v18 name]);
  [v15 setObject:v6 forKey:v16];

  -[NSOperationQueue setSuspended:](self->_openApplicationOperationQueue, "setSuspended:", 0LL);
  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[ASCWorkspace stateLock](self, "stateLock"));
  [v17 unlock];
}

- (id)popPendingResultForOperationName:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASCWorkspace stateLock](self, "stateLock"));
    [v5 lock];

    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASCWorkspace pendingResults](self, "pendingResults"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:v4]);

    if (v7)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[ASCWorkspace pendingResults](self, "pendingResults"));
      [v8 removeObjectForKey:v4];
    }

    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ASCWorkspace stateLock](self, "stateLock"));
    [v9 unlock];
  }

  else
  {
    id v7 = 0LL;
  }

  return v7;
}

- (BOOL)isExtension
{
  return self->_extension;
}

- (NSMutableDictionary)pendingResults
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16LL, 1);
}

- (NSOperationQueue)openApplicationOperationQueue
{
  return self->_openApplicationOperationQueue;
}

- (void)setOpenApplicationOperationQueue:(id)a3
{
}

- (NSRecursiveLock)stateLock
{
  return self->_stateLock;
}

- (void).cxx_destruct
{
}

@end